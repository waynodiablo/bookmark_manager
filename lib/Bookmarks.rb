require 'pg'

class Bookmark
  def self.all
    connection = which_connection_to_use

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(link)
    connection = which_connection_to_use

    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{link}')")
  end

  private

  def self.which_connection_to_use
    if ENV['ENVIRONMENT']== 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
