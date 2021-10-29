require "../api"

module KVS
    module API
        class GetStores
            def self.work(base : KVS::Base) : KVS::API::GetStoresResponse
                stores = base.stores
                return GetStoresResponse.new(stores)
            end
        end
    end
end