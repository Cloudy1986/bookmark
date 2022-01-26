require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_post_course')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

end
