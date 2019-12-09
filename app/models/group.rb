class Group < ApplicationRecord
  has_many :products

  def self.search (search)
    where("name LIKE ?", "%#{search.downcase}%")
  end
end
