require 'pg'

class Comment

  attr_reader :id, :text, :bookmark_id

  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.create(text:, bookmark_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec_params("INSERT INTO comments (text, bookmark_id) VALUES ($1, $2) RETURNING id, text, bookmark_id;", [text, bookmark_id])
    Comment.new(id: result[0]['id'], text: result[0]['text'], bookmark_id: result[0]['bookmark_id'])
  end

end
