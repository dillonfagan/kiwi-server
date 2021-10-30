require "json"
require "./models/store"

module Kiwi
    module API
        class PutStore
            def self.work(base : Kiwi::Base, name : String) : PutStoreResponse
                base.create(name)
                return PutStoreResponse.new(base.store(name))
            end
        end

        struct PutStoreResponse
            include JSON::Serializable
            property store : Models::Store

            def initialize(store : Kiwi::Store)
                @store = Models::Store.new(store)
            end
        end
    end
end