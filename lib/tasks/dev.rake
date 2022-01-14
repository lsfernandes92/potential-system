namespace :dev do
  desc 'Configura ambiente de desenvolvimento'
  task setup: :environment do
    puts '%%%% Incializado a criação contatos...'
    50.times do |contato|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 29.years.ago, to: Date.today)
      )
    end
    puts '%%%% Contatos criados com sucesso!'
  end
end
