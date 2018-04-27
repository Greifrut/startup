require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) {build(:user)}

    it 'user save succesfully' do
      expect(user.save).to eq(true)
    end

    it 'ensures first name presence' do 
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures last name presence' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures last name presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

  end
end