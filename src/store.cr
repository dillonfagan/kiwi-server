require "json"

module KVS
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
