feature "adding bookmarks" do
  scenario 'accessing the "add bookmark" form' do
    visit '/add-bookmark'
=begin
    form = find('form')
    node = form.native
    expect(node.attributes['action']).to eq('/add-bookmark')
    expect(node.attributes['method']).to eq('post')
    # the commented out code should work with Nokogiri - further work needed to integrate this
=end
    expect(page).to have_button "Add bookmark"
    expect(page).to have_field("url", type: "text")
  end

  scenario 'submitting the form' do
    visit '/add-bookmark'
    fill_in('url', with: "http://www.google.com")
    click_button "Add bookmark"
    expect(page).to have_content "http://www.google.com"
  end
end
