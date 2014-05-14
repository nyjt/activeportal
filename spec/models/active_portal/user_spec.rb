require 'spec_helper'

module ActivePortal
  describe User do
    it 'should require email and password' do
      expect { User.create! }.to raise_error
    end

    context 'using valid attributes' do
      let(:valid_attributes) { { email: 'ab@example.com', password: 'p' * 8, password_confirmation: 'p' * 8 } }

      it 'should be able to create new' do
        expect { User.create!(valid_attributes) }.not_to raise_error
      end

      it 'should store new user in DB' do
        expect { User.create!(valid_attributes) }.to change { User.count }.by(1)
      end
    end
  end
end
