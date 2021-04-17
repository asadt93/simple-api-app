# frozen_string_literal: true

module Shared::Callable
  class ExtractParams
    extend Uber::Callable

    def self.call(options, params:, **)
      data = params.require(:data)
      attributes = data.require(:attributes)
      relationship_object = data[:relationships]
      relationships = relationship_object.try(:keys)

      main_type = data[:type].try(:singularize)
      main_id = data[:id].try(:to_i)
      options["#{main_type}_attributes".to_sym] = attributes.permit!
      options["#{main_type}_id".to_sym] = main_id unless main_id.nil?
      return true if relationships.nil?

      relationships.each do |relationship|
        new_params = relationship_object[relationship]
        relationship_data = new_params.require(:data)
        type = relationship_data[:type].try(:singularize)
        id = relationship_data[:id].try(:to_i)
        attributes = relationship_data[:attributes]
        next if type == main_type

        options["#{type}_attributes".to_sym] = attributes.permit! unless attributes.nil?
        options["#{type}_id".to_sym] = id unless id.nil?
      end
    end
  end
end
