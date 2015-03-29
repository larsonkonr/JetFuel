class HappyPathTest < ActionDispatch::IntegrationTest

  test 'shows home page' do
    visit root_path 
    assert page.has_content?('Hello World')
  end
end
