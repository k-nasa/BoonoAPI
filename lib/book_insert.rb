require 'open-uri'

module BookInsert
  # https://calendar.gameiroiro.com/manga.php このサイトにのみ対応
  def fetch_books(url)
    opt = {}
    opt['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
    doc = Nokogiri::HTML.parse(open(url, opt))

    #  "2018年6月 漫画発売日一覧" のようなフォーマットになっている
    date = doc.xpath('//th[@id = "top-th"]').inner_text

    # ['2018年6月...',year, month, str]というフォーマットに分割
    date = date.match(/(\d*)年(\d+)月(\D*)/).to_a

    year = date[1].to_i
    month = date[2].to_i

    books_html = doc.xpath('//td[@class="products-td"]')

    book_list = []
    books_html.each_with_index do |book_html, i|
      image_urls = book_html.search('div.product-image-left a img').map do |img_url|
        img_url.attributes['src'].value
      end

      titles = book_html.search('div.product-description-right a').map do |title_html|
        title_html.inner_text.strip
      end

      urls = book_html.search('div.product-description-right a').map do |url_html|
        url_html.values.first
      end

      authors = book_html.search('div.product-description-right  p:nth-last-child(1)').map do |author_html|
        author_html.inner_text.delete(' ')
      end

      publish_date = Date.new(year, month, i + 1)

      titles.zip(authors, image_urls, urls).each do |title, author, image_url, detail_url|
        book_list << { title: title, author: author, publish_date: publish_date, image_url: image_url, detail_url: detail_url }
      end
    end

    book_list
  end

  # 先３ヶ月分の発売予定を保存する
  def save_three_month_books
    date = Time.zone.today
    urls = [
      "https://calendar.gameiroiro.com/litenovel.php",
      "https://calendar.gameiroiro.com/litenovel.php?year=#{(date >> 1).year}&month=#{(date >> 1).month}",
      "https://calendar.gameiroiro.com/litenovel.php?year=#{(date >> 2).year}&month=#{(date >> 2).month}",
      "https://calendar.gameiroiro.com/manga.php",
      "https://calendar.gameiroiro.com/manga.php?year=#{(date >> 1).year}&month=#{(date >> 1).month}",
      "https://calendar.gameiroiro.com/manga.php?year=#{(date >> 2).year}&month=#{(date >> 2).month}"
    ]

    urls.each do |url|
      fetch_books(url).map do |book|
        Book.create(book)
      end
    end
  end

  module_function :save_three_month_books
  module_function :fetch_books
end
