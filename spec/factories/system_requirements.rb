FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operational_system { Faker::Computer.os }
    storage { "500Gb" }
    processor { "AMD Ryzen 7" }
    memory { "2Gb" }
    video_board { "GeForce X" }
  end
end
