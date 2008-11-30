# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rfeedfinder-slice}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Your Name"]
  s.date = %q{2008-11-30}
  s.description = %q{Merb Slice that provides ...}
  s.email = %q{Your Email}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/rfeedfinder-slice", "lib/rfeedfinder-slice/merbtasks.rb", "lib/rfeedfinder-slice/rfeedfinder.rb", "lib/rfeedfinder-slice/slicetasks.rb", "lib/rfeedfinder-slice/spectasks.rb", "lib/rfeedfinder-slice.rb", "spec/controllers", "spec/controllers/main_spec.rb", "spec/rfeedfinder-slice_spec.rb", "spec/spec_helper.rb", "app/controllers", "app/controllers/application.rb", "app/controllers/main.rb", "app/helpers", "app/helpers/application_helper.rb", "app/views", "app/views/layout", "app/views/layout/rfeedfinder_slice.html.erb", "app/views/main", "app/views/main/index.html.erb", "public/javascripts", "public/javascripts/master.js", "public/stylesheets", "public/stylesheets/master.css", "stubs/app", "stubs/app/controllers", "stubs/app/controllers/application.rb", "stubs/app/controllers/main.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb Slice that provides ...}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0.1"])
    else
      s.add_dependency(%q<merb-slices>, [">= 1.0.1"])
    end
  else
    s.add_dependency(%q<merb-slices>, [">= 1.0.1"])
  end
end
