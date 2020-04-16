FactoryGirl.define do
  factory :interview do
    association :user, factory: :user
    expires_at "2020-04-15 09:45:37"
    title "MyStringss" #minimo 10 caracteres
    description "Hola esta es mi descripción para el curso de api en RoR" #minimo 20 caracteres
  end
end
