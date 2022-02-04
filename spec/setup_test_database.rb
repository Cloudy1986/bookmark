require 'pg'

def setup_test_database
  p "Setting up the test database"
  connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
  connection.exec("TRUNCATE bookmarks, comments;")
end
