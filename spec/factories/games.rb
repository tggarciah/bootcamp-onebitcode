FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample } # [:pvp, :pve, :both].sample outro modo de escrever o que está dentro das chaves
    release_date { "2021-07-07 18:28:01" }
    developer { Faker::Company.name }
    system_requirement
  end
end
