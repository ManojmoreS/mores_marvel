require_relative 'client'

module MoresMarvel
  MODELS = %w(characters creators comics events series stories).freeze
  ORDERBY = %w(name modified -name -modified).freeze
  module Resource
    # fetch all records
    def fetch_all(model, filters = {})
      get_resource("/v1/public/#{model}", filters) if model_exists?(model) && validate_filters(filters)
    end
    # fetch a record by id
    def fetch_by_id(model, id, filters = {})
      get_resource("/v1/public/#{model}/#{id}", filters) if model_exists?(model) && validate_filters(filters)
    end

    def fetch_filtered_by(params, filters = {})
      if validate_filters(filters)
        if params[:primary_model].eql?params[:secondary_model]
          puts "Primary_model & Secondary_model can't be same.\n"
        elsif model_exists?(params[:primary_model]) &&  model_exists?(params[:secondary_model])
          get_resource("/v1/public/#{params[:primary_model]}/#{params[:id]}/#{params[:secondary_model]}", filters)
        end
      end
    end

    private
    def validate_filters(filters)
      return filters if filters.empty?

      unless filters.empty?
        filters_error= []
        filters.keys.each do |key|
          case key
          when :limit
            filters_error.push({error_message: "Invalid limit (Min: 1 & Max: 100)"}) if (filters[:limit] < 0 || filters[:limit] > 100)
          when :orderBy
            filters_error.push({error_message: "Invalid or unrecognized ordering parameter."}) if !(ORDERBY.include?(filters[:orderBy]))
          end
        end

        return filters_error if filters_error.empty?

        unless filters_error.empty?
          puts "\n Request failed with following errors"
          filters_error.each_with_index { |errors, index| puts "#{index+1} : #{errors[:error_message]}" }
          false
        end
      end
    end

    def model_exists? model
      if MODELS.include?(model)
        true
      else
        puts "Invalid resource \"#{model}\" : #{MODELS.join(', ')} are only resources supported by Marvel.\n"
        false
      end
    end
  end
end
