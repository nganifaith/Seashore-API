class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beach

  scope :delete_favorite, lambda { |beach_id, user_id|
                            where(beach_id: beach_id, user_id: user_id)
                          }
end
