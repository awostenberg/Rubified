class Rubified::Tag
  # Create and returns a new tag class with the name +name+.
  def self.new_tag(name)
    # Store the new tag's name in a constant; the block to create the new class
    # won't keep local variables. A bit of a cheat
    const_set(:Name, name)
    newbie = Class.new(self) { |tclass|
      def initialize(params)
        super(params)
        @tname = self.class.to_s.split("::").last
      end
    }
    remove_const(:Name)
    const_set(name.capitalize, newbie)
    newbie
  end

  def initialize(params)
    # The name of the tag, e.g. font
    @tname = "tag"
    # Any parameters of this tag, e.g. if you have the HTML tag:
    #   <div id="foo" class="bar">
    # then the parameters would be +id+ and +class+.
    @params = params
  end

  def to_html
    pstring = ""
    @params.each {|key, val| pstring << " #{key}=\"#{val}\""}
    "<#{@tname}#{pstring}></#{@tname}>"
  end
end