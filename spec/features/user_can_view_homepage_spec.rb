feature "Homepage" do
  scenario "a user can visit the homepage and see hello world" do
    visit "/"
    expect(page).to have_text("Bookmark Manager")
  end
end
