require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has title of posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
      user = User.create(email: 'abc@example.com', first_name: 'John',
                         last_name: 'Doe', password: 'chicken',
                         password_confirmation: 'chicken')
      login_as(user, :scope => :user)
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
