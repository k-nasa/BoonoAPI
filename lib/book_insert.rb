require 'open-uri'

module BookInsert

  # TODO いい感じに分割したい
  # https://calendar.gameiroiro.com/manga.php このサイトにのみ対応
  # 余裕があればアマゾンから取得する
  def fetch_books(url)
    html = open(url).read
    doc = Nokogiri::HTML.parse(html)

    #  "2018年6月 漫画発売日一覧" のようなフォーマットになっている
    date = doc.xpath('//th[@id = "top-th"]').inner_text

    date = date.match(/(\d*)年(\d+)月(\D*)/).to_a # ['2018年6月...',year, month, str]

    year = date[1].to_i
    month = date[2].to_i

    books_html = doc.xpath('//td[@class="products-td"]')

    book_list = []
    books_html.each_with_index do |book_html, i|
      titles = book_html.search('div.product-description-right a').map do |title_html|
        title_html.inner_text.strip
      end

      authors = book_html.search('div.product-description-right  p:nth-last-child(1)').map do |author_html|
        author_html.inner_text.strip
      end

      publish_date = Date.new(year, month, i + 1)

      titles.zip(authors).each do |title, author|
        book_list << { title: title, author: author, puslish_date: publish_date, image_url: 'soon...' } # TODO imageの取得
      end
    end

    book_list
  end
end
