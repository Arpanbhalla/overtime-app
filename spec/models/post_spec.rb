require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post creation' do
    post = Post.create(date: Date.today, rationale: 'Lorem Ipsum is simply dummy')
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
