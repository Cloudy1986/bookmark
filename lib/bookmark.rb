require 'pg'

class Bookmark

  attr_reader :id, :title, :url, :user_id

  def initialize(id:, title:, url:, user_id:)
    @id = id
    @title = title
    @url = url
    @user_id = user_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'], user_id: bookmark['user_id'])
    end
  end

  def self.create(url:, title:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec_params("INSERT INTO bookmarks (url, title, user_id) VALUES($1, $2, $3) RETURNING id, url, title, user_id;", [url, title, user_id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'], user_id: result[0]['user_id'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.update(id:, url:, title:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec_params("UPDATE bookmarks SET url = $1, title = $2, user_id = $3 WHERE id = $4 RETURNING id, url, title, user_id;", [url, title, user_id, id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'], user_id: result[0]['user_id'])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec_params("SELECT * FROM bookmarks WHERE id = $1;", [id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'], user_id: result[0]['user_id'])
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

end
