require "json"
require "uuid"

module KVS
  class Store
    include JSON::Serializable

    @data = Hash(String, String).new
    getter name : String

    def initialize(@name : String)
    end

    def push(value : String) : ID
      id = ID.new
      @data[id.to_s] = value
      return id
    end

    def get(id : ID) : String
      return @data[id.to_s]
    end
  end

  struct ID
    include JSON::Serializable
    @value : String

    def initialize
      @value = UUID.random.to_s
    end

    def initialize(@value : String)
    end

    def to_s
      return @value
    end
  end
end
