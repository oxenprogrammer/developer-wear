FactoryBot.define do
  factory :user do
    username { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    admin { false }
  end
end
