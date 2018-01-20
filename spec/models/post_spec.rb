require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post creation' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post)

    context 'with valid params' do
      it 'can be be created' do
        expect(post).to be_valid
      end

      it 'cannot be created with date & rationale' do
        post.date = nil
        post.rationale = nil
        expect(post).to_not be_valid
      end
    end
  end
end
