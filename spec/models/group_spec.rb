require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'oswald', icon:'www.image.com' )}
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

  it 'icon should be www.image.com' do
    expect(subject.icon).to eql 'www.image.com'
  end

  it 'icon should not be www.image23.com' do
    expect(subject.icon).to_not eql 'www.image23.com'
  end
end
