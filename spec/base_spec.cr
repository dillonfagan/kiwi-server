require "./spec_helper"

describe KVS::Base do
    it "is empty when initialized" do
        base = KVS::Base.new
        base.stores.empty?.should be_true
    end

    it "is not empty after creating a store" do
        base = KVS::Base.new
        base.create("cities")
        base.stores.empty?.should be_false
    end

    it "retrieves an existing store" do
        base = KVS::Base.new
        base.create("houses")
        base.store("houses").should_not be_nil
    end
end