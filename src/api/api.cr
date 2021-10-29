require "json"

module KVS
    module API
        struct GetStoreResponse
            include JSON::Serializable
            property store : Store

            def initialize(@store : Store)
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