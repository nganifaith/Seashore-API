class BeachSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :country, :city, :address, :rating, :featured_image, :details, :email, :phone_number, :website

  def featured_image
    if object.featured_image.attached?
      rails_blob_url(object.featured_image, only_path: true)
    else
      object.image
    end
  end
end
