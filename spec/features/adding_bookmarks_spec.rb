feature "adding bookmarks" do
  scenario 'submitting the form' do
    visit '/add-bookmark'
    fill_in('url', with: "http://www.google.com")
    click_button "Add bookmark"
    expect(page).to have_content "http://www.google.com"
  end
end
