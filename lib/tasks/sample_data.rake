namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(:First_Name => "Administrator",
                         email: "admin@admin.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)

  end
end