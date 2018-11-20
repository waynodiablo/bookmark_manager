## Bookmark Manager
### User stories

```
As a User
So that I can easily locate pages I want to find again
I want to be shown a list of bookmarks
```

This is the domain model for that first user story.

![domain model](/Users/waynestevens/Projects/M_Week4/bookmark_manager/images/bookmark_mgr domain model.001.png)

![git domain model](https://github.com/waynodiablo/bookmark_manager/blob/master/images/bookmark_mgr%20domain%20model.001.png)

## Database setup instructions
We used PostgreSQL to create a database called Bookmark_Manager, which contained a table called "bookmarks".

1) `brew install PostgreSQL`

2) `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

3) `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

4) Run: `psql PostgreSQL`

5) Then, create the database in psql using:
`CREATE DATABASE bookmark_manager;`

6) Connect to the database using:
`\c bookmark_manager`

7) Run the query in the file, *01_create_bookmarks_table.sql*
