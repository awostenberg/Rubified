module Rubified
  require 'ext/object'
  require 'rubified/tag'
  require 'rubified/canvas'
  def self.new_tag(name, paired)
    # First, create a new class.
    newbie = Tag.new_tag(name, paired)
    # Create a corresponding method.
    Canvas.add_tag_method(newbie)
  end
  require 'rubified/tags'
end