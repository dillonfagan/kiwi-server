require "json"
require "./models/entry"

module Kiwi
    module API
        class GetEntry
            def self.work(base : Kiwi::Base, store : String, id : Kiwi::ID) : GetEntryResponse
                summary = base.store(store).get(id)
                return GetEntryResponse.new(summary)
            end
        end

        struct GetEntryResponse
            include JSON::Serializable
            property entry : Models::Entry
    
            def initialize(summary : EntrySummary)
                @entry = Models::Entry.new(summary)
            end
        end
    end
end