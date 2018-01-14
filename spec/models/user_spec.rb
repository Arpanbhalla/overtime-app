require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user creation' do
    user = User.create(email: 'abc@example.com', first_name: 'John',
                       last_name: 'Doe', password: 'chicken',
                       password_confirmation: 'chicken')
    context 'with valid attributes' do
      it 'can be created with valid params' do
        expect(user).to be_valid
      end

      it 'cannot be created with email, firstname & lastname' do
        user.first_name = nil
        user.last_name = nil
        user.email = nil
        expect(user).to_not be_valid
      end
    end
  end
end
