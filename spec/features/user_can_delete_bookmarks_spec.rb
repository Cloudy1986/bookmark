feature "Delete bookmarks" do
  scenario "a user can visit /bookmarks and delete bookmarks" do
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: "http://www.makersacademy.com/")
  end
end
