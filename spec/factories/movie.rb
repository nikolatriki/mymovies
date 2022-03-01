FactoryBot.define do
  factory :movie do
    genre

    title { Faker::Movie.title }
    year { Faker::Date.between(from: '1900-09-23', to: Date.today ) }
    rating { Faker::Number.within(range: 0.0..1.0) }
    expert_rating { Faker::Number.within(range: 0.0..1.0) }
    watched { Faker::Boolean.boolean }
  end
end