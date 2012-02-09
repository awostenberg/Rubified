require 'rubygems'

SPEC = Gem::Specification.new do |spec|
  spec.name = "rubified"
  spec.version = "0.1.0"
  spec.author = "J. Wostenberg"
  spec.summary = "Create XML or HTML pages using only Ruby."
  spec.description = "Generate XML or HTML documents using only Ruby without having to worry about syntax."
  spec.homepage = "http://github.com/awostenberg/Rubified"
  spec.platform = Gem::Platform::RUBY
  spec.require_paths << "lib"
  lib_files = %w[
    tag
    tags
    canvas
  ]
  lib_files.collect! {|f| "lib/rubified/" + f + ".rb"}
  spec.files = lib_files << "lib/rubified.rb" << "lib/ext/object.rb"
end