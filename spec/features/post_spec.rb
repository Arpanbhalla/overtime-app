require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
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

    it 'has list of posts' do
      visit posts_path
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      expect(page).to have_content(/Rationale|content/)
    end
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

    describe 'edit' do
      before do
        @post = FactoryGirl.create(:post)
      end

      it 'can be reached by clicking edit' do

        visit posts_path
        click_link "edit_post_#{@post.id}"
        expect(page.status_code).to eq(200)
      end

      it 'can be edited' do
        visit edit_post_path(@post)
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'update rationale'

        click_on 'Save'
        expect(User.last.posts.last.rationale).to eq('update rationale')
      end
    end
  end
end
