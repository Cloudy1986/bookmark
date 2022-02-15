require 'bookmark'
require 'database_helpers'

describe Bookmark do

  let(:comment_class) { double(:comment_class) }

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
      user = User.create(email: 'test@example.com', password: '123456')
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy', user_id: user.id)
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy all software', user_id: user.id)
      Bookmark.create(url: 'http://www.google.com/', title: 'Google', user_id: user.id)
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
      expect(bookmarks.first.user_id).to eq user.id
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database' do
      user = User.create(email: 'example@example.com', password: 'bfdbfui')
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Example bookmark title', user_id: user.id)
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Example bookmark title'
      expect(bookmark.url).to eq 'http://www.example.org'
      expect(bookmark.user_id).to eq user.id
      expect(bookmark.user_id).to eq persisted_data['user_id']
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the database' do
      user = User.create(email: 'laurel@example.com', password: 'kbjdsfbb')
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Example bookmark title', user_id: user.id)
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      user = User.create(email: 'hardy@example.com', password: 'bdsbfknsdfjkl')
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com', user_id: user.id)
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy', user_id: bookmark.user_id)
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do # currently finding by bookmark.id , might need to find by bookmark.user_id also?
    it 'returns the requested bookmark object' do
      user = User.create(email: 'bob@example.com', password: 'fbfuibfnd')
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com', user_id: user.id)
      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
      expect(result.user_id).to eq bookmark.user_id
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      user = User.create(email: 'mary@example.com', password: 'fdbguib')
      bookmark = Bookmark.create(title: 'Test title', url: 'Example url', user_id: user.id)

      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
  end
  
end
