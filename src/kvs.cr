module KVS
  VERSION = "0.1.0"

  class Base
    stores : Hash(String, Store)

    def initialize
      @stores = Hash(String, Store).new
    end

    def stores : Hash(String, Store)
      @stores
    end

    def store(name : String) : Store
      @stores[name]
    end

    def create(name : String)
      @stores[name] = Store.new(name)
    end
  end

  class Store
    include JSON::Serializable

    name : String
    data : Hash(String, String)

    def initialize(@name : String)
      @data = Hash(String, String).new
    end

    def value(key : String) : String
      @data[key]
    end

    def set(key : String, value : String)
      @data[key] = value
    end
  end
end