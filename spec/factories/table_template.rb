FactoryGirl.define do
  factory :table_template do
    name 'Some Template Name'
    cell_body 'Some Format for Cell Body'
  end

  factory :invalid_table_template, parent: :table_template do
    name ''
    cell_body ''
  end
end