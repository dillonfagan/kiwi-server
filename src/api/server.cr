require "kemal"
require "json"
require "../kiwi"
require "./messages/all"

module Kiwi
    module API
        class Server
            @@base = Kiwi::Base.new

            def self.start
                before_all "/api" do |env|
                    env.response.content_type = "application/json"
                end
                
                get "/api/v0/stores" do
                    GetStores.work(@@base).to_json
                end
                
                put "/api/v0/stores" do |env|
                    name = env.params.json["name"].as(String)
                    PutStore.work(@@base, name).to_json
                end
                
                get "/api/v0/stores/:store" do |env|
                    store_name = env.params.url["store"]
                    GetStore.work(@@base, store_name).to_json
                end
                
                get "/api/v0/stores/:store/:id" do |env|
                    store_name = env.params.url["store"]
                    id = env.params.url["id"]
                    GetEntry.work(@@base, store_name, Kiwi::ID.new(id)).to_json
                end
                
                put "/api/v0/stores/:store" do |env|
                    store_name = env.params.url["store"]
                    value = env.params.json["value"].as(String)
                    PutEntry.work(@@base, store_name, value).to_json
                end
                
                puts "Starting Kiwi Server..."
                Kemal.run
            end
        end
    end
end