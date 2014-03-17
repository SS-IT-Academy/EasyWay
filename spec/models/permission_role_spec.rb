require 'spec_helper'

describe PermissionRole do

  it { should belong_to(:permissionable) }
  it { should belong_to(:role) }
  it { should belong_to(:permission) }

end