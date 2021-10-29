module Kiwi
    module API
        class GetEntry
            def self.work(base : Kiwi::Base, store : String, id : Kiwi::ID) : GetEntryResponse
                value = base.store(store).get(id)
                return GetEntryResponse.new(id.to_s, value)
            end
        end

        struct GetEntryResponse
            include JSON::Serializable
            property id : String
            property value : String
    
            def initialize(@id : String, @value : String)
            end
        end
    end
end