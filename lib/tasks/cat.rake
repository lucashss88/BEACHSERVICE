namespace :cat do
  desc "TODO"
  task categories: :environment do
    5.times do
      Category.create!(
        nome: Faker::Food.ethnic_category
      )
    end
  end

end
