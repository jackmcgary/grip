# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{grip}
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["twoism", "jnunemaker"]
  s.date = %q{2010-01-04}
  s.description = %q{GridFS attachments for MongoMapper}
  s.email = %q{signalstatic@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".DS_Store",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "grip.gemspec",
     "lib/grip.rb",
     "lib/grip/attachment.rb",
     "lib/grip/has_attachment.rb",
     "test/factories.rb",
     "test/fixtures/cthulhu.png",
     "test/fixtures/sample.pdf",
     "test/growler.rb",
     "test/models.rb",
     "test/test_grip_attachment.rb",
     "test/test_has_attachment.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/twoism/grip}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{GridFS attachments for MongoMapper}
  s.test_files = [
    "test/factories.rb",
     "test/growler.rb",
     "test/models.rb",
     "test/test_grip_attachment.rb",
     "test/test_has_attachment.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

