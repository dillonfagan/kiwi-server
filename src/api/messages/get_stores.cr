require "json"
require "./models/store"

module Kiwi
    module API
        class GetStores
            def self.work(base : Kiwi::Base) : GetStoresResponse
                stores = base.stores
                return GetStoresResponse.new(stores)
            end
        end

        struct GetStoresResponse
            include JSON::Serializable
            property stores : Array(Models::Store)

            def initialize(stores : Array(Store))
                @stores = stores.map { |store| Models::Store.new(store) }
            end
        end
    end
end