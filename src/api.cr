require "json"

module KVS
    module API
        struct PutEntryResponse
            include JSON::Serializable
            property id : String

            def initialize(@id : String)
            end
        end
    end
end