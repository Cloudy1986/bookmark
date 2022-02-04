require 'comment'
require 'bookmark'

describe Comment do

  describe '.create' do
    it 'adds a comment to the database with a bookmark_id' do
    bookmark = Bookmark.create(url: 'http://example.com/' , title: 'Example title')

    comment = Comment.create(text: 'This is a test comment' , bookmark_id: bookmark.id)

    connection2 = PG.connect(dbname: 'bookmark_manager_post_course_test')
    result2 = connection2.exec("SELECT * FROM comments WHERE id = #{comment.id};")

    expect(comment).to be_a Comment
    expect(comment.text).to eq 'This is a test comment'
    expect(comment.bookmark_id).to eq bookmark.id
    expect(comment.id).to eq result2[0]['id']
    end
  end

end
