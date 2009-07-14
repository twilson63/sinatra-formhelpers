# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-formhelpers}
  s.version = "0.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["twilson63"]
  s.date = %q{2009-07-14}
  s.email = %q{tom@jackrussellsoftware.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "Rakefile.backup",
     "VERSION.yml",
     "lib/sinatra/formhelpers.rb",
     "sinatra-formhelpers.gemspec",
     "test/contest.rb",
     "test/formhelpers_test.rb",
     "test/helper.rb"
  ]
  s.homepage = %q{http://github.com/twilson63/sinatra-formhelpers}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{use basic form helpers for generic form management}
  s.test_files = [
    "test/contest.rb",
     "test/formhelpers_test.rb",
     "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.2.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2.0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.2.0"])
      s.add_dependency(%q<activesupport>, [">= 2.3.2.0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.2.0"])
    s.add_dependency(%q<activesupport>, [">= 2.3.2.0"])
  end
end
