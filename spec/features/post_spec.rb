require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: 'abc@example.com', first_name: 'John',
                       last_name: 'Doe', password: 'chicken',
                       password_confirmation: 'chicken')
    login_as(user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has title of posts' do
      expect(page).to have_content(/Posts/)
    end
    #
    # it 'has list of posts' do
    #   visit posts_path
    #   post1 = Post.create(date: Date.today, rationale: 'Post1')
    #   post2 = Post.create(date: Date.today, rationale: 'Post2')
    #   expect(page).to have_content(/Post1 | Post2/)
    # end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'allows users to create a new post from the /new page' do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'
      expect(page).to have_content('Some rationale')
    end

    it 'will have users associated with post' do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('Some rationale')
    end
  end
end
