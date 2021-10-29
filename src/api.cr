require "json"

module KVS
    module API
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