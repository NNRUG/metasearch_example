class Item < ActiveRecord::Base

  after_save :update_search_properties

  private

  def update_search_properties
    ItemSearch.reload_property_names!
  end
end
