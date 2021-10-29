require "kemal"
require "json"
require "./kvs.cr"
require "./transfer/get_stores_response.cr"

base = KVS::Base.new

before_all "/api" do |env|
    env.response.content_type = "application/json"
end

get "/api/v0/stores" do
    base.stores.to_json
end

put "/api/v0/stores" do |env|
    name = env.params.json["name"].as(String)
    base.create(name)
    base.stores.to_json
end

get "/api/v0/stores/:store" do |env|
    store_name = env.params.url["store"]
    base.store(store_name).to_json
end

get "/api/v0/stores/:store/:key" do |env|
    store_name = env.params.url["store"]
    key = env.params.url["key"]
    base.store(store_name).value(key)
end

put "/api/v0/stores/:store/:key" do |env|
    store_name = env.params.url["store"]
    key = env.params.url["key"]
    value = env.params.json["value"].as(String)
    base.store(store_name).set(key, value)
end

Kemal.run