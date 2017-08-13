# frozen_string_literal: true

module Justimmo::V1
  class FederalState < JustimmoBase
    attribute :id, Integer
    attribute :name
    attribute :country_id, Integer
    attribute :fips
    attribute :iso
  end
end
