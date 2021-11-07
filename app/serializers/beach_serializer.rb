class BeachSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :country, :city, :address, :rating, :featured_image, :fav, :details, :email, :phone_number,
             :website

  def featured_image
    if object.featured_image.attached?
      rails_blob_url(object.featured_image, only_path: true)
    else
      "#{object.image}?id=#{+object.id}"
    end
  end

  def fav
    if current_user
      !object.favorite.where(user_id: current_user.id).empty?
    else
      false
    end
  end
end
