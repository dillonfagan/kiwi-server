require "json"

module KVS
    module API
        struct GetStoresResponse
            include JSON::Serializable
            property stores : Hash(String, Store)

            def initialize(@stores : Hash(String, Store))
            end
        end

        struct GetStoreResponse
            include JSON::Serializable
            property store : Store

            def initialize(@store : Store)
            end
        end

        struct PutStoreResponse
            include JSON::Serializable
            property name : String

            def initialize(@name : String)
            end
        end

        struct GetEntryResponse
            include JSON::Serializable
            property id : String
            property value : String

            def initialize(@id : String, @value : String)
            end
        end

        struct PutEntryResponse
            include JSON::Serializable
            property id : String

            def initialize(@id : String)
            end
        end
    end
end