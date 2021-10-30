require "json"

module Kiwi
  module API
    module Models
      struct Store
        include JSON::Serializable
        property name : String

        def initialize(store : Kiwi::Store)
          @name = store.name
        end
      end
    end
  end
end
