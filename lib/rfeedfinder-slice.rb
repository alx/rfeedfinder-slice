if defined?(Merb::Plugins)

  $:.unshift File.dirname(__FILE__)

  load_dependency 'merb-slices'
  Merb::Plugins.add_rakefiles "rfeedfinder-slice/merbtasks", "rfeedfinder-slice/slicetasks", "rfeedfinder-slice/spectasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to 
  # the main application layout or no layout at all if needed.
  # 
  # Configuration options:
  # :layout - the layout to use; defaults to :rfeedfinder-slice
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:rfeedfinder_slice][:layout] ||= :rfeedfinder_slice
  
  # All Slice code is expected to be namespaced inside a module
  module RfeedfinderSlice
    
    # Slice metadata
    self.description = "RfeedfinderSlice is a Merb slice version of the original Rfeedfinder gem"
    self.version = "1.0.0"
    self.author = "Alexandre Girard"
    
    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices.deactivate(RfeedfinderSlice)
    def self.deactivate
    end
    
    # Setup routes inside the host application
    def self.setup_router(scope)
      # example of a named route
      scope.match('/index(.:format)').to(:controller => 'main', :action => 'index').name(:index)
      # the slice is mounted at /rfeedfinder-slice - note that it comes before default_routes
      scope.match('/').to(:controller => 'main', :action => 'index').name(:home)
      # enable slice-level default routes by default
      scope.default_routes
    end
    
  end
  
  # Setup the slice layout for RfeedfinderSlice
  RfeedfinderSlice.setup_default_structure!
  
  # Third party dependencies
  dependency 'hpricot',   ">=0.6"
  
  # Stdlib dependencies
  require 'net/http'
  require 'timeout'
  require 'open-uri'
  
  # Various mixins and classes
  require "rfeedfinder-slice/rfeedfinder"
end