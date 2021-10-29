require "kemal"
require "json"
require "./kvs"

module KVS
    module API
        class Server
            @@base = KVS::Base.new

            def self.start
                before_all "/api" do |env|
                    env.response.content_type = "application/json"
                end
                
                get "/api/v0/stores" do
                    @@base.stores.to_json
                end
                
                put "/api/v0/stores" do |env|
                    name = env.params.json["name"].as(String)
                    @@base.create(name)
                    @@base.stores.to_json
                end
                
                get "/api/v0/stores/:store" do |env|
                    store_name = env.params.url["store"]
                    @@base.store(store_name).to_json
                end
                
                get "/api/v0/stores/:store/:id" do |env|
                    store_name = env.params.url["store"]
                    id = env.params.url["id"]
                    @@base.store(store_name).get(KVS::ID.new(id))
                end
                
                put "/api/v0/stores/:store" do |env|
                    store_name = env.params.url["store"]
                    value = env.params.json["value"].as(String)
                    id = @@base.store(store_name).push(value)
                    { "id": id.to_s }.to_json
                end
                
                Kemal.run
            end
        end
    end
end