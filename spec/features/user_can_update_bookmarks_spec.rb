feature "Update bookmarks" do
  scenario "user can update bookmarks" do
    user = User.create(email: 'feature@example.com', password: '758485y4389')
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy', user_id: user.id)
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'
    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('url', with: 'http://www.snakersacademy.com/' )
    fill_in('title', with: 'Snakers Academy')
    click_button('Submit')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: "http://www.makersacademy.com/")
    expect(page).to have_link('Snakers Academy', href: "http://www.snakersacademy.com/")
  end
end
