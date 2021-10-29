require "./spec_helper"

include Kiwi::API

describe GetStores do
    it "is empty, given empty base" do
        base = Kiwi::Base.new
        response = GetStores.work(base)
        response.stores.empty?.should be_true
    end

    it "is not empty, given non-empty base" do
        base = Kiwi::Base.new
        base.create("new_store")
        response = GetStores.work(base)
        response.stores.empty?.should be_false
    end
end