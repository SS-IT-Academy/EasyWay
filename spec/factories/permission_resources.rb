# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission_resource do
    role_id 1
    resource_type_id 1
    read false
    create false
    edit false
    destroy false
  end
end
