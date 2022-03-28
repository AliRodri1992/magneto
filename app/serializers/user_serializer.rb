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
class UserSerializer
  include JSONAPI::Serializer
  attributes :fullname, :email

  attribute :auth_token do |user, params|
    params[:auth_token]
  end
end
