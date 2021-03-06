require File.dirname(__FILE__) + '/../spec_helper'

describe "RfeedfinderSlice::Main (controller)" do
  
  # Feel free to remove the specs below
  
  before :all do
    Merb::Router.prepare { add_slice(:RfeedfinderSlice) } if standalone?
  end
  
  after :all do
    Merb::Router.reset! if standalone?
  end
  
  it "should have access to the slice module" do
    controller = dispatch_to(RfeedfinderSlice::Main, :index)
    controller.slice.should == RfeedfinderSlice
    controller.slice.should == RfeedfinderSlice::Main.slice
  end
  
  it "should have an index action" do
    controller = dispatch_to(RfeedfinderSlice::Main, :index)
    controller.status.should == 200
    controller.body.should contain('RfeedfinderSlice')
  end
  
  it "should work with the default route" do
    controller = get("/rfeedfinder-slice/main/index")
    controller.should be_kind_of(RfeedfinderSlice::Main)
    controller.action_name.should == 'index'
  end
  
  it "should work with the example named route" do
    controller = get("/rfeedfinder-slice/index.html")
    controller.should be_kind_of(RfeedfinderSlice::Main)
    controller.action_name.should == 'index'
  end
    
  it "should have a slice_url helper method for slice-specific routes" do
    controller = dispatch_to(RfeedfinderSlice::Main, 'index')
    
    url = controller.url(:rfeedfinder_slice_default, :controller => 'main', :action => 'show', :format => 'html')
    url.should == "/rfeedfinder-slice/main/show.html"
    controller.slice_url(:controller => 'main', :action => 'show', :format => 'html').should == url
    
    url = controller.url(:rfeedfinder_slice_index, :format => 'html')
    url.should == "/rfeedfinder-slice/index.html"
    controller.slice_url(:index, :format => 'html').should == url
    
    url = controller.url(:rfeedfinder_slice_home)
    url.should == "/rfeedfinder-slice/"
    controller.slice_url(:home).should == url
  end
  
  it "should have helper methods for dealing with public paths" do
    controller = dispatch_to(RfeedfinderSlice::Main, :index)
    controller.public_path_for(:image).should == "/slices/rfeedfinder-slice/images"
    controller.public_path_for(:javascript).should == "/slices/rfeedfinder-slice/javascripts"
    controller.public_path_for(:stylesheet).should == "/slices/rfeedfinder-slice/stylesheets"
    
    controller.image_path.should == "/slices/rfeedfinder-slice/images"
    controller.javascript_path.should == "/slices/rfeedfinder-slice/javascripts"
    controller.stylesheet_path.should == "/slices/rfeedfinder-slice/stylesheets"
  end
  
  it "should have a slice-specific _template_root" do
    RfeedfinderSlice::Main._template_root.should == RfeedfinderSlice.dir_for(:view)
    RfeedfinderSlice::Main._template_root.should == RfeedfinderSlice::Application._template_root
  end

end