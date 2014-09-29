class ItemSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :results

  def self.property_names
    @properties ||= reload_property_names!
  end

  def self.reload_property_names!
    @properties = Item.pluck(:properties).map(&:keys).flatten.uniq
  end

  def initialize(params = {})
    query = []
    params.each do |key, value|
      if value.present?
        instance_variable_set "@#{key}".to_sym, value
        query << "properties -> '#{key}' = '#{value}'"
      end
    end
    @results = Item.where(query.join(' AND '))
  end

  def method_missing(method, *args, &block)
    if ItemSearch.property_names.include?(method.to_s)
      instance_variable_get "@#{method}".to_sym
    else
      super
    end
  end
end
