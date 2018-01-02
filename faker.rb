require 'Faker'
# 10.times do
# 	c = Category.new
# 	c.name = Faker::Commerce.department(1)
# 	c.save
# end
10.times do 
	category_hash = { name: Faker::Commerce.department(1)}
	Category.create(category_hash)
end



# 100.times do
# 	p = Product.new
# 	p.name = Faker::Commerce.product_name
# 	p.price = Faker::Commerce.price(100..1000)
# 	p.description = Faker::Lorem.paragraph
# 	p.stock = Faker::Number.between(0,100)
# 	p.category_id = Category.all.sample.id
# 	p.cod_eligible = p.price < 750 ? true : false
# 	p.release_datetime = Faker::Time.between(Date.today - 1.year, Date.today + 2.week)
# 	p.save
# end

100.times do 
product_hash={name:Faker::Commerce.product_name, price:Faker::Commerce.price(100..1000), description:Faker::Lorem.paragraph, stock:Faker::Number.between(0,100), category_id:Category.all.sample.id, cod_eligible:[true,false].sample, release_datetime:Faker::Time.between(Date.today - 1.year, Date.today + 2.week)}
Product.create(product_hash)
p.save
end
 