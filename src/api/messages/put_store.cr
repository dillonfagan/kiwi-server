module KVS
    module API
        class PutStore
            def self.work(base : KVS::Base, name : String) : PutStoreResponse
                base.create(name)
                return PutStoreResponse.new(name)
            end
        end

        struct PutStoreResponse
            include JSON::Serializable
            property name : String

            def initialize(@name : String)
            end
        end
    end
end