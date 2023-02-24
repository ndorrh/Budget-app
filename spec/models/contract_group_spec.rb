require 'rails_helper'

RSpec.describe ContractGroup, type: :model do
  subject { ContractGroup.new(contract_id: 1, group_id: 1) }
  before { subject.save }

  it 'contract_id should be present' do
    subject.contract_id = nil
    expect(subject).to_not be_valid
  end

  it 'group_id should be present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'contract_id should be 1' do
    expect(subject.contract_id).to eql 1
  end

  it 'group_id should be 1' do
    expect(subject.group_id).to eql 1
  end
end
