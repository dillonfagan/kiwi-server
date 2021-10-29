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
            property stores : Hash(String, Store)

            def initialize(@stores : Hash(String, Store))
            end
        end
    end
end