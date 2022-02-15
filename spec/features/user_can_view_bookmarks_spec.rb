feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    user = User.create(email: 'feature@example.com', password: '758485y4389')
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy', user_id: user.id)
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy all software', user_id: user.id)
    Bookmark.create(url: 'http://www.google.com/', title: 'Google', user_id: user.id)

    user_2 = User.create(email: 'phil@example.com', password: 'bkfjbjv')
    Bookmark.create(url: 'https://github.com/', title: 'Github', user_id: user_2.id)

    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    expect(page).to have_link('Destroy all software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com/")
    expect(page).to_not have_link('Github', href: "https://github.com/")
  end
end
