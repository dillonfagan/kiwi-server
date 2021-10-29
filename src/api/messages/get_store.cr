module KVS
    module API
        class GetStore
            def self.work(base : KVS::Base, name : String) : GetStoreResponse
                store = base.store(name)
                return GetStoreResponse.new(store)
            end
        end

        struct GetStoreResponse
            include JSON::Serializable
            property store : Store

            def initialize(@store : Store)
            end
        end
    end
end