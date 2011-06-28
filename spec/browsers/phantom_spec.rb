require File.join(File.dirname(__FILE__), "/../spec_helper")

describe "Phantom" do
  before(:each) do
    @browser = Phantom.new
    @url     = "http://localhost"
  end

  describe "Cross OS Chrome", :shared => true do
    it "return name" do
      @browser.name.should == "Phantom JS"
    end
  end

  describe "Mac OS X" do
    it_should_behave_like "Cross OS Chrome"

    it "should be supported" do
      @browser.should be_supported
    end

    it "should have a path" do
      expected = "phantomjs"
      @browser.path.should == expected
    end

    it "should visit a given url" do
      Kernel.expects(:system).with("#{@browser.name} run-qnit.js '#{@url}'")
      @browser.visit(@url)
    end
  end if macos?
end
