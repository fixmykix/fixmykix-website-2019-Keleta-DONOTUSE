class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :published, :user_id, :created_at, :updated_at
end
