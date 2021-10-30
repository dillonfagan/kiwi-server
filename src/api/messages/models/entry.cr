require "json"

module Kiwi
  module API
    module Models
      struct Entry
        include JSON::Serializable
        property id : String
        property body : String

        def initialize(entry : EntrySummary)
            @id = entry.id.to_s
            @body = entry.body
        end
      end
    end
  end
end