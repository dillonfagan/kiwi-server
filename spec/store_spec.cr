require "./spec_helper"

describe KVS::Store do
  it "has a name" do
    store = KVS::Store.new("flavors")
    store.name.should eq("flavors")
  end

  it "sets and retrieves values" do
    store = KVS::Store.new("car_brands")
    store.set("0", "Aston Martin")
    store.value("0").should eq("Aston Martin")
  end
end
