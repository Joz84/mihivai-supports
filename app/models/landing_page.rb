class LandingPage < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :delete
  has_many_attached :images

  validates :html, :title, presence: true
  validates :title, uniqueness: true

  # accepts_nested_attributes_for :landing_pages_users,
  #                               reject_if: proc { |attributes| attributes[:user_id].blank? },
  #                               allow_destroy: true

  def html_with_images
    with_images(html)
  end

  def css_with_images
    with_images(css)
  end

  private

  def with_images(text)
    regex = /images\/(\S*(jpeg|jpg|png|svg))/
    image_urls = images.map do |image|
      url = Rails.application
                 .routes.url_helpers
                 .rails_blob_path(image, only_path: true)
      [url.split("/").last, url]
    end
    text.gsub(regex) { |s| image_urls.to_h[s.split("/").last] }
  end
end
