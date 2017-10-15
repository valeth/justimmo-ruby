# frozen_string_literal: true

# Exceptions for internal use
module JustimmoClient::Errors
  JustimmoError = Class.new(StandardError)

  # Raised when configuration validation fails.
  ConfigurationError = Class.new(JustimmoError)

  # Raised when option parsing fails
  OptionParserError = Class.new(JustimmoError)

  # Raised when authentication with the API fails.
  class AuthenticationFailed < JustimmoError
    def initialize
      super("Authentication failed.")
    end
  end

  # Raised when retrieval from the API fails.
  class RetrievalFailed < JustimmoError
    def initialize(exception)
      super "Failed to get data from the API:\n#{exception.class}: #{exception}"
    end
  end

  # Raised when the option parser rejects an option
  class InvalidOption < OptionParserError
    def initialize(key)
      super "Option '#{key}' not supported"
    end
  end

  # Raised when the option parser rejects a value
  class InvalidValue < OptionParserError
    def initialize(value)
      super "'#{value}' is not in the list of accepted values"
    end
  end

  # Raised when an unsupported API version is set.
  class UnsupportedAPIVersion < ConfigurationError
    def initialize(version)
      super "API Version #{version} not supported"
    end
  end

  # Raised on missing required configuration options.
  class MissingConfiguration < ConfigurationError
    def initialize(missing)
      super "Required configuration missing: #{missing}"
    end
  end
end
