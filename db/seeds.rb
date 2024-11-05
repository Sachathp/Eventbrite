require 'faker'


5.times do
  Event.create!(
    start_date: Faker::Time.forward(days: 30, period: :evening), # Génère une date future
    duration: [ 30, 60, 90, 120, 150 ].sample,                      # Durée multiple de 5
    title: Faker::Book.title,                                     # Titre fictif
    description: Faker::Lorem.paragraph_by_chars(number: 150),    # Description d'environ 150 caractères
    price: rand(1..1000),                                         # Prix entre 1 et 1000
    location: Faker::Address.city                                 # Ville aléatoire
  )
end
