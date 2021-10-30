require "json"
require "./models/store"

module Kiwi
    module API
        class GetStore
            def self.work(base : Kiwi::Base, name : String) : GetStoreResponse
                store = base.store(name)
                return GetStoreResponse.new(store)
            end
        end

        struct GetStoreResponse
            include JSON::Serializable
            property store : Models::Store

            def initialize(store : Kiwi::Store)
                @store = Models::Store.new(store)
            end
        end
    end
end