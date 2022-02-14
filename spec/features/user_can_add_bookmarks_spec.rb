feature "Add bookmarks" do
  scenario "a user can add bookmarks" do
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'
    click_button 'Add a new bookmark'
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example bookmark title')
    click_button('Submit')


    expect(page).to have_link('Example bookmark title', href: 'http://example.org')
  end
end