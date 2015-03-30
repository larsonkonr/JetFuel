require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "url is valid" do
    url = Url.create(shortened_url: "-8zQxg", original_url: 'https://houndci.com/')
    assert url.valid?
  end

  test "has attributes" do
    url = Url.create(original_url: 'www.google.com/code')
    assert url.valid?

    assert_equal String, url.shortened_url.class
    assert_equal 'www.google.com/code', url.original_url
    assert_equal 0, url.usage
  end

  test "shortens url" do
      url = Url.new(original_url: 'www.google.com/hello')
      assert_equal nil, url.shortened_url

      url.save
      refute_equal url.shortened_url, url.original_url
    end

end
