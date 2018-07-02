FactoryBot.define do
  factory :book do
    sequence :title do |n|
      "りゅうおうのお仕事#{n}"
    end

    author '白鳥士郎'
    image_url 'https://cdn-ak.f.st-hatena.com/images/fotolife/o/ornith/20180209/20180209165259.jpg'
    publish_date '2018-1-18'
  end
end
