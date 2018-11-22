feature "adding bookmarks" do
  scenario 'submitting the form' do
    visit '/add-bookmark'
    fill_in('url', with: "http://www.google.com")
    fill_in('title', with: 'Google')
    click_button "Add bookmark"

    # expect(page).to have_content "http://www.google.com"
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
