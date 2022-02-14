feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy all software')
    Bookmark.create(url: 'http://www.google.com/', title: 'Google')

    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    expect(page).to have_link('Destroy all software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com/")
  end
end
