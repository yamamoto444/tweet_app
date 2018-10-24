class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true,uniqueness: true}
    validates :password, {presence: true}
    mount_uploader :image_name, ImageUploader
    
    def posts
        return Post.where(user_id: self.id)
    end
end
