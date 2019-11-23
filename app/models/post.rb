class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :account
    has_many :likes
    has_many :comments
    scope :active, -> {where active: true}

    def total_like
      0
    end



end
