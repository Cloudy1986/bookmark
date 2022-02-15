# Bookmark Manager - post course

## User stories

Show a list of bookmarks ✅
```
**As a** user
**I want** to see a list of bookmarks
**So that** I can find a link to the site or page I need quickly
```

Add new bookmarks ✅
```
**As a** user
**I want** to add a bookmark to the list
**So that** I can store a link to a site I want to find again quickly in the future
```

Delete bookmarks ✅
```
**As a** user
**I want** to delete a bookmark from the list
**So that** I don't store links to sites that I don't need anymore
```

Update bookmarks ✅
```
**As a** user
**I want** to update a bookmark in the list
**So that** I can give it a more descriptive title and find it in the list quickly
```

Comment on bookmarks ✅
```
**As a** user
**I want** to comment on a bookmark in the list
**So that** I can add useful notes that remind me why the site is useful
```

## Database set up instructions

Set up the development database and `bookmarks` table:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_post_course;`
3. Connect to the database using the `psql` command `/c bookmark_manager_post_course;`
4. Run the query saved in the file `01_create_bookmarks_table.sql`
5. Run the query saved in the file `02_add_title_column_bookmarks_table.sql`
6. Run the query saved in the file `03_create_comments_table.sql`
7. Run the query saved in the file `04_create_users_table.sql`
8. Run the query saved in the file `05_add_user_id_column_to_bookmarks_table.sql`

Set up the test database and `bookmarks` table:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_post_course_test;`
3. Connect to the database using the `psql` command `/c bookmark_manager_post_course_test;`
4. Run the query saved in the file `01_create_bookmarks_table.sql`
5. Run the query saved in the file `02_add_title_column_bookmarks_table.sql`
6. Run the query saved in the file `03_create_comments_table.sql`
7. Run the query saved in the file `04_create_users_table.sql`
8. Run the query saved in the file `05_add_user_id_column_to_bookmarks_table.sql`
