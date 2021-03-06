# frozen_string_literal: true

require "justimmo_client/core/config"
require "justimmo_client/core/logging"

module JustimmoClient
  # Caching support
  # @api private
  module Caching
    extend JustimmoClient::Logging

    class NullCache
      def write(_key, _data, **options); end
      def read(_key); end
    end

    class << self
      # Returns the current cache
      # @!attribute [rw] cache
      def cache
        @cache ||= default_cache
      end

      def cache=(c)
        @cache = c
      end

      def default_cache
        cache = JustimmoClient::Config.cache || NullCache.new
        log.debug("Using default cache #{cache.class}")
        cache
      end
    end

    def cache
      JustimmoClient::Caching.cache
    end
  end
end
