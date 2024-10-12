FactoryBot.define do
  factory :item do
    name { Faker::Name.name } # Changed from Faker::StarWars.character
    
    done {false}
  end
end