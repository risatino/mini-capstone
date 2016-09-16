class Image < ApplicationRecord
  belongs_to :vinyl

  def vinyl
    Vinyl.find_by(id: self.vinyl_id)
  end
end