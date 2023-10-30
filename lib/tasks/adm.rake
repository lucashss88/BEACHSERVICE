namespace :adm do
  desc "TODO"
  task admins: :environment do
    1.times do
      Admin.create!(
        nome:"Admin",
        email:"admin@123",
        password:"1234"
      )
    end
  end

end
