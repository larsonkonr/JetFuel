require 'test_helper'

class UrlControllerTest < ActionController::TestCase
  def setup
    @controller = UrlsController.new
  end

  test "redirects to the original url" do
    url = Url.create(original_url: "www.google.com")
    get :show, shortened_url: url.shortened_url
    assert_equal 302, response.status
    assert_equal 'http://test.hostwww.google.com', response.header["Location"]
  end
end
