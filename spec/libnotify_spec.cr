require "./spec_helper"

describe Libnotify do

  describe "#notify_init()" do

    context "When uninitialized" do
      it "should return false" do
        Libnotify::C.notify_is_initted.should eq(false)
      end
    end

    context "When initailized" do
      it "should return true" do
        Libnotify::C.notify_init("test")
        Libnotify::C.notify_is_initted.should eq(true)
      end
    end

    it "Should set the app_name" do
      Libnotify::C.notify_init("test")
      String.new(Libnotify::C.notify_get_app_name).should eq("test")
    end
  end
end
