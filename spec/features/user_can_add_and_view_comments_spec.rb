feature 'Add and View comments' do
  feature 'user can add and view comments' do
    scenario 'a comment is added to a bookmark' do

      visit "/bookmarks/new"
      fill_in('url', with: 'http://example.org')
      fill_in('title', with: 'Example bookmark title')
      click_button('Submit')
      expect(page).to have_content 'Bookmarks'

      click_button 'Add comment'
      expect(page).to have_content "Add a comment"

      fill_in 'comment', with: 'This is a test comment on a bookmark'
      click_button 'Submit'

      expect(page).to have_content 'Bookmarks'
      expect(page).to have_content 'This is a test comment on a bookmark'

    end
  end
end
