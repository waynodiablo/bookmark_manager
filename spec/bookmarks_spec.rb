require 'Bookmarks'
# require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.first['id']
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the database' do
      bookmark = Bookmark.create(url: "http://www.bbc.co.uk", title: 'BBC').first

      expect(bookmark['url']).to eq "http://www.bbc.co.uk"
      expect(bookmark['title']).to eq "BBC"
      # expect(Bookmark.all).to include("http://www.bbc.co.uk")
    end
  end
end
