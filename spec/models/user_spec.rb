require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new( email: "test1@example.com", password: "testone") }
  it 'is a valid password' do
    expect(subject).to be_valid
  end

  it 'is not a valid password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

end
