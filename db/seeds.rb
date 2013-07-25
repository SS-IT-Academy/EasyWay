FieldType.delete_all
FieldType.create!(:name => "Integer")
FieldType.create!(:name => "String")
FieldType.create!(:name => "Date")
FieldType.create!(:name => "Timestamp")
FieldType.create!(:name => "Boolean")
FieldType.create!(:name => "Text")
FieldType.create!(:name => "Complex")

Permission.delete_all
Permission.create!(:name => "Read")
Permission.create!(:name => "Create")
Permission.create!(:name => "Edit")
Permission.create!(:name => "Delete")

Role.delete_all
Role.create!(:name => "Admin")
Role.create!(:name => "Manager")
Role.create!(:name => "Teacher")
Role.create!(:name => "Trainee")



