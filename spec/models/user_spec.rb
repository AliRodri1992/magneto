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
require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:fullname) }
  it { is_expected.to validate_presence_of(:password_digest) }
  it { is_expected.to validate_uniqueness_of(:email) }
end
