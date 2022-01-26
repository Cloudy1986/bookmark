feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy all software')
    Bookmark.create(url: 'http://www.google.com/', title: 'Google')

    visit "/bookmarks"
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    expect(page).to have_link('Destroy all software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com/")
  end
end
