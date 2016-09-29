class Image < ApplicationRecord
  validates :img_url, presence: true

  belongs_to :vinyl

  def vinyl
    Vinyl.find_by(id: self.vinyl_id)
  end
end