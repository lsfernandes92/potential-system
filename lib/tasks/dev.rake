namespace :dev do
  desc 'Configura ambiente de desenvolvimento'
  task setup: :environment do
    puts '%%%% Incializado a criação dos tipos de contatos...'
    kinds = %w[Amigo Conhecido Comercial]

    kinds.each do |kind|
      Kind.create!(description: kind)
    end
    puts '%%%% Tipos de contatos criados com sucesso!'

    puts '%%%% Incializado a criação dos contatos...'
    50.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 29.years.ago, to: Date.today),
        kind: Kind.all.sample
      )
    end
    puts '%%%% Contatos criados com sucesso!'

    puts '%%%% Incializado a criação dos telefones...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts '%%%% Telefones criados com sucesso!'
  end
end
