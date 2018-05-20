require_relative 'client'

module MoresMarvel
  MODELS = %w(characters creators comics events series stories).freeze
  module Resource
    # will be removed soon.
    def get_characters
      get_resource('/v1/public/characters')
    end
    # will be removed soon.
    def get_character id
      get_resource("/v1/public/characters/#{id}")
    end

    def fetch_all(model, filters = {})
      get_resource("/v1/public/#{model}", filters) if MODELS.include?(model)
    end

    def fetch_by_id(model, id, filters = {})
      get_resource("/v1/public/#{model}/#{id}", filters) if MODELS.include?(model)
    end

    def fetch_filtered_by(model_1, id, model_2, filters = {})
      if MODELS.include?(model_1) &&  MODELS.include?(model_2) && !(model_1.eql?model_2)
        get_resource("/v1/public/#{model_1}/#{id}/#{model_2}", filters)
      end
    end
  end
end
