class Url < ActiveRecord::Base
  validates :original_url, presence: true
  before_create :shorten_url

  def shorten_url
    self.shortened_url = SecureRandom.urlsafe_base64(4)
  end
end
