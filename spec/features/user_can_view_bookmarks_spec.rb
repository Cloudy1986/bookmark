feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
    visit "/bookmarks"
    expect(page).to have_content("http://www.makersacademy.com/")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com/")
  end
end
