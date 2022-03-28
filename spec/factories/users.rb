# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  fullname        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    fullname { 'Updated User Name' }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
