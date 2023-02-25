require 'rails_helper'

RSpec.describe Contract, type: :model do
  subject { Contract.new(author_id: 1, name: 'oswald', amount: 200) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be oswald' do
    expect(subject.name).to eql 'oswald'
  end

  it 'name should be john' do
    expect(subject.name).to_not eql 'john'
  end

  it 'amount should be 200' do
    expect(subject.amount).to eql 200
  end

  it 'amount should not be 100' do
    expect(subject.amount).to_not eql 100
  end

  it 'author_id should be 1' do
    expect(subject.author_id).to eql 1
  end
end
