class Poetry < ApplicationRecord
  def self.search(search)
    where("lower(title) LIKE ? OR lower(author) LIKE ?", "%#{search}%", "%#{search}%")
  end
end
