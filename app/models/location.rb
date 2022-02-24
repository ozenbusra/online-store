class Location < ApplicationRecord
  def location_details
    "#{address}, #{street}, #{city}, #{country}"
  end
end
