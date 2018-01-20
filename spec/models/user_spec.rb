require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe 'user creation' do

    context 'with valid attributes' do
      it 'can be created with valid params' do
        expect(@user).to be_valid
      end

      it 'cannot be created with email, firstname & lastname' do
        @user.first_name = nil
        @user.last_name = nil
        @user.email = nil
        expect(@user).to_not be_valid
      end
    end

    context 'method' do
        it 'full-name' do
          expect(@user.full_name).to eq('DOE, JOHN')
        end
    end
  end
end
