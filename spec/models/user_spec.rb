require 'spec_helper'

describe User do
  let!(:myuser){FactoryGirl.create :user}
  it {should validate_presence_of :uid}
  it {should validate_uniqueness_of :uid}
  it {should validate_presence_of :oauth_token}
end