feature "deleting a bookmark" do
  scenario "A user can delete a bookmark" do
    Bookmark.create(url: 'www.mytestpage.com', title: 'Test bookmark page')
    visit ('/')
    expect(page).to have_link('Test bookmark page', href: 'www.mytestpage.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_link('Test bookmark page', href: 'www.mytestpage.com')
  end
end
