namespace :db do
  desc "TODO"
  task items: :environment do
    10.times do
      Item.create!(
        nome: Faker::Food.dish,
        preco_unitario: Faker::Number.between(from: 1, to: 200),
        descricao: Faker::Food.description,
        quantidade: Faker::Number.between(from: 1, to: 200),
        category_id: Faker::Number.between(from: 1, to: 4)
      )
    end
  end

end
