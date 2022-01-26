feature "Add bookmarks" do
  scenario "a user can add bookmarks" do
    visit "/bookmarks/new"
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example bookmark title')
    click_button('Submit')


    expect(page).to have_link('Example bookmark title', href: 'http://example.org')
  end
end