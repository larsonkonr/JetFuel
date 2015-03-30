class HappyPathTest < ActionDispatch::IntegrationTest

  test 'shows home page' do
    visit root_path
    assert page.has_content?('JetFuel')
    fill_in "url[original_url]", :with => 'https://github.com/larsonkonr/dinner_dash/blob/master/Gemfile'
    click_button 'Shorten'
  end

  test "puts in data and shortens it" do
     visit root_path

     fill_in "url[original_url]", :with => 'https://github.com/larsonkonr/dinner_dash/blob/master/Gemfile'
     click_button 'Shorten'

     url = Url.last

     assert_equal root_path, current_path
     assert page.has_content? url.shortened_url
   end
end
