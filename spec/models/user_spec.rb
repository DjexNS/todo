require 'spec_helper'
require 'rails_helper'

describe User do

  it { should have_db_column(:email).of_type(:string) }
end