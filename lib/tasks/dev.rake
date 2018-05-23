namespace :dev do
  task fake_user: :environment do
    20.times do |i|

      user = User.new(
        name: FFaker::Name::unique.first_name,
        email: FFaker::Internet.unique.email,
        password: "12345678"
      )

      user.save!
      puts user.name
    end
    puts "Fake users created!"
  end

  task fake_product: :environment do
    Product.destroy_all
    100.times do |i|

      product = Product.new(
        name: FFaker::Book::title,
        description: FFaker::Book::description,
        image: FFaker::Book.unique.cover
      )

      product.save!
      puts product.name
    end
    puts "============\nFake products created!"
  end
end
