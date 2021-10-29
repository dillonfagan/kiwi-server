module KVS
    module API
        class PutEntry
            def self.work(base : KVS::Base, store : String, value : String) : PutEntryResponse
                id = base.store(store).push(value)
                return PutEntryResponse.new(id.to_s)
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