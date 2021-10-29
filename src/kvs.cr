require "json"

module KVS
  VERSION = "0.1.0"

  class Base
    getter stores = Hash(String, Store).new

    def store(name : String) : Store
      @stores[name]
    end

    def create(name : String)
      @stores[name] = Store.new(name)
    end
  end

  class Store
    include JSON::Serializable

    @data = Hash(String, String).new
    getter name : String

    def initialize(@name : String)
    end

    def value(key : String) : String
      @data[key]
    end

    def set(key : String, value : String)
      @data[key] = value
    end
  end
end