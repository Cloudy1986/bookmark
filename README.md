# Bookmark Manager - post course

## User stories

```
**As a** user
**I want** to see a list of bookmarks
**So that** I can find a link to the site or page I need
```

## Database set up instructions

Set up the development database and `bookmarks` table:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_post_course;`
3. Connect to the database using the `psql` command `/c bookmark_manager_post_course;`
4. Run the query saved in the file `01_create_bookmarks_table.sql`
5. Run the query saved in the file `02_add_title_column_bookmarks_table.sql`
6. Run the query saved in the file `03_create_comments_table.sql`

Set up the test database and `bookmarks` table:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_post_course_test;`
3. Connect to the database using the `psql` command `/c bookmark_manager_post_course_test;`
4. Run the query saved in the file `01_create_bookmarks_table.sql`
5. Run the query saved in the file `02_add_title_column_bookmarks_table.sql`
6. Run the query saved in the file `03_create_comments_table.sql`
