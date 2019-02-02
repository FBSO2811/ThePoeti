class Poetry < ApplicationRecord
  def self.search(search)
    where("lower(title) LIKE ? OR lower(author) LIKE ? OR lower(country) LIKE ? OR lower(born) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  # def self.amateur(search)
  #   where("poster != ?","Admin")
  # end

  # def self.famous(search)
  #   where("poster = ?","Admin")
  # end

end
