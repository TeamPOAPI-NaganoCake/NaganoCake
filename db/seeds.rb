# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test@test.com',
    password: '******',
)

Genre.create!(
    id: 1,
    genre_name: "ケーキ",
  )
  Genre.create!(
    id: 2,
    genre_name: "プリン",
  )
  Genre.create!(
    id: 3,
    genre_name: "焼き菓子",
  )
  Genre.create!(
    id: 4,
    genre_name: "キャンディ",
  )

Item.create!(
    id: 1,
    name: "いちごのショートケーキ",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "400",
    genre_id: 1,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
  Item.create!(
    id: 2,
    name: "ベイクドチーズケーキ",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "600",
    genre_id: 1,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 3,
    name: "カスタードプリン",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "360",
    genre_id: 2,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 4,
    name: "プリンアラモード",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "580",
    genre_id: 2,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 5,
    name: "チョコレートクッキーサンド",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "450",
    genre_id: 3,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 6,
    name: "オリジナルプレーンクッキー",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "320",
    genre_id: 3,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 7,
    name: "ハート型のぺろぺろキャンディ",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "280",
    genre_id: 4,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )
   Item.create!(
    id: 8,
    name: "アイスキャンディ",
    caption: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    non_tax_price: "320",
    genre_id: 4,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/no-image.jpg")
  )

  9.times do |n|
    Customer.create!(
      email: "tanakataro#{n + 1}@gmail.com",
      last_name: "田中#{n + 1}",
      first_name: "太郎#{n + 1}",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ",
      password: "123456#{n + 1}",
      zip_code: "123456#{n + 1}",
      address: "東京都港区台場1-11-#{n + 1}",
      phone_number: "0901234567#{n + 1}"
    )

end



