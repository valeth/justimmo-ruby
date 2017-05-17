require 'json'
require 'justimmo/api'
require 'justimmo/parser'
require 'justimmo/mapper/realty_mapper'

module Justimmo
  module API
    # Get realty information from the API.
    module RealtyQuery
      extend Justimmo::API::Query

      module_function

      # Search for a list of realties.
      # @param params [Hash]
      #   Search parameters.
      # @option params [Integer] :limit (10)
      #   Amount of retrieved list items. *Max*: 100.
      # @option params [Integer] :offset (0)
      #   Offset of the first list item.
      # @option params [String] :language ('de')
      #   Language for i18n fields.
      # @option params [Symbol] :orderby (:asc)
      #   Order direction. Either :asc or :desc.
      # @option params [Symbol] :order
      #   Order by specific field.
      #   One of :price, :zip_code, :created_at, :realty_number,
      #   :updated_at and :published_at.
      # @option params [Symbol] :picturesize (:small)
      #   The picture size for image urls. One of :small, :medium, :large.
      # @option params [Boolean] :all (false)
      #   Show all realties with projects, disregarding realty state.
      # @option params [Hash] :filter
      #   See {build_filter} for options.
      # @return [Array<Hash>]
      def list(params = {})
        response = request('objekt/list', params)
        parsed = Justimmo::Parser.parse(response, mapper)
        parsed.fetch(:justimmo).fetch(:realty)
      rescue KeyError => e
        Logger.error(e)
        []
      end

      # Get detailed information about a single realty.
      # @param params [Hash] Search parameters.
      # @option params [Integer] :realty_id
      # @option params [String] :language
      # @return [Hash]
      def detail(params = {})
        response = request('objekt/detail', params)
        parsed = Justimmo::Parser.parse(response)
        parsed.fetch(:justimmo).fetch(:realty)
      rescue KeyError => e
        Logger.error(e)
        {}
      end

      # Return the content of the expose PDF file as stream.
      # @param params [Hash]
      # @option params [Integer] :realty_id
      # @option params [String] :expose
      # @option params [String] :language
      # @return [Tempfile] The PDF file.
      def expose(params = {})
        tmpfile = Tempfile.open(['justimmo-expose', '.pdf'])
        response = request('objekt/expose', params)
        tmpfile.write(response)
        yield(tmpfile) if block_given?
        tmpfile
      end

      # Create an inquiry.
      # @param params [Hash]
      # @option params [Integer] :realty_id
      # @option params [Integer] :salutation_id
      # @option params [String] :title
      # @option params [String] :first_name
      # @option params [String] :last_name
      # @option params [String] :email
      # @option params [String] :phone
      # @option params [String] :message
      # @option params [String] :street
      # @option params [Integer] :zip_code
      # @option params [String] :location
      # @option params [String] :country
      # @return [nil]
      # @todo Implement this!
      def inquiry(params = {})
        request('objekt/anfrage', params)
      end

      # List of ids for realties matching the filters.
      # @param (see list)
      # @return [Array<Integer>] List of ids.
      # @see list
      def ids(params = {})
        response = request('objekt/ids', params)
        JSON.parse(response).map(&:to_i)
      rescue JSON::ParserError => e
        Logger.error(e)
        []
      end

      # Parses parameters and handles requests to the API.
      # @return [String, nil] The request body or nil on error.
      # @see Query#request
      def request(endpoint, params = {})
        response = nil
        params   = build_params(params)
        response = super(endpoint, params)
      rescue Query::AuthenticationFailed, Query::RetrievalFailed => e
        Logger.error(e)
      ensure
        response
      end

      # Translate internal search parameters to API ones.
      # @param params [Hash]
      # @return [Hash]
      def build_params(params = {})
        params.reduce({}) do |acc, (key, value)|
          map = { map: :params }
          case key
          when :orderby then acc.update(key => mapper[value, reverse: true])
          when :filter  then acc.update(key => build_filter(value))
          else          acc.update(mapper[key, map] => parse_value(value))
          end
        end
      end

      # Translate a filter from internal to API format.
      # @param filter [Hash] The internal filter.
      # @option filter [Integer] :price_min
      # @option filter [Integer] :price_max
      # @option filter [Integer] :price_per_sqm_min
      # @option filter [Integer] :price_per_sqm_max
      # @option filter [Integer, Array<Integer>] :realty_type_id
      # @option filter [Integer, Array<Integer>] :sub_realty_type_id
      # @option filter [String] :tag
      # @option filter [Integer] :zip_code
      # @option filter [Integer] :zip_code_min
      # @option filter [Integer] :zip_code_max
      # @option filter [Integer] :room_count_min
      # @option filter [Integer] :room_count_max
      # @option filter [Integer] :realty_number
      # @option filter [Integer] :realty_number_min
      # @option filter [Integer] :realty_number_max
      # @option filter [Integer] :area_min
      # @option filter [Integer] :area_max
      # @option filter [Integer] :living_area_min
      # @option filter [Integer] :living_area_max
      # @option filter [Integer] :floor_area_min
      # @option filter [Integer] :floor_area_max
      # @option filter [Integer] :surface_area_min
      # @option filter [Integer] :surface_area_max
      # @option filter [String] :keyword
      # @option filter [Integer] :country_id
      # @option filter [Integer] :federal_state_id
      # @option filter [Integer] :realty_status_id
      # @option filter [Boolean] :rent
      # @option filter [Boolean] :purcase
      # @option filter [Integer] :owner_id
      # @option filter [Integer] :project_id
      # @option filter [String] :realty_type
      # @option filter [Integer] :parent_id
      # @option filter [DateTime] :updated_at_min
      # @option filter [DateTime] :updated_at_max
      # @return [Hash] The API filter.
      def build_filter(filter = {})
        filter.reduce({}) do |acc, (key, value)|
          acc.update(mapper[key, map: :filter] => value)
        end
      end
    end
  end
end
