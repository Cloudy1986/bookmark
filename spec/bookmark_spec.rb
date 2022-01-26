require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com/")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com/")
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database' do
      Bookmark.create(url: 'http://www.example.org')
      expect(Bookmark.all).to include 'http://www.example.org'
    end
  end
end
