require "json"
require "./models/entry"

module Kiwi
    module API
        class PutEntry
            def self.work(base : Kiwi::Base, store : String, value : String) : PutEntryResponse
                summary = base.store(store).put(value)
                return PutEntryResponse.new(summary)
            end
        end

        struct PutEntryResponse
            include JSON::Serializable
            property entry : Models::Entry

            def initialize(summary : EntrySummary)
                @entry = Models::Entry.new(summary)
            end
        end
    end
end