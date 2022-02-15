require 'comment'
require 'bookmark'

describe Comment do

  describe '.create' do
    it 'adds a comment to the database with a bookmark_id' do
      user = User.create(email: 'joseph@example.com', password: 'jfbdfkln')

      bookmark = Bookmark.create(url: 'http://example.com/' , title: 'Example title', user_id: user.id)

      comment = Comment.create(text: 'This is a test comment' , bookmark_id: bookmark.id)

      connection2 = PG.connect(dbname: 'bookmark_manager_post_course_test')
      result2 = connection2.exec("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(comment).to be_a Comment
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.bookmark_id).to eq bookmark.id
      expect(comment.id).to eq result2[0]['id']
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      user = User.create(email: 'paul@example.com', password: 'fbjkdsbfjkb')
      bookmark = Bookmark.create(url: 'Test url 1', title: 'Test title 1', user_id: user.id)
      Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'This is another test comment', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first

      connection2 = PG.connect(dbname: 'bookmark_manager_post_course_test')
      result2 = connection2.exec("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(comments.length).to eq 2
      expect(comment.id).to eq result2[0]['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

end
