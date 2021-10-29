require "./spec_helper"

include KVS::API

describe GetStores do
    it "is empty, given empty base" do
        base = KVS::Base.new
        response = GetStores.work(base)
        response.stores.empty?.should be_true
    end

    it "is not empty, given non-empty base" do
        base = KVS::Base.new
        base.create("new_store")
        response = GetStores.work(base)
        response.stores.empty?.should be_false
    end
end