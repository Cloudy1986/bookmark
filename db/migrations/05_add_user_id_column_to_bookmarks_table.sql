ALTER TABLE bookmarks ADD COLUMN user_id INTEGER REFERENCES users (id);
