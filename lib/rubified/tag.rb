class Rubified::Tag
  # Create and returns a new tag class with the name +name+. To create a tag that
  # does NOT use a matched pair, set paired to false. Tags like <img> need this.
  def self.new_tag(name, paired=true)
    newbie = Class.new(self)
    const_set(name.capitalize, newbie)
    newbie.const_set(:Paired, paired)
    newbie
  end

  # The arguments to this method is a hash key of the parameters to the HTML tag.
  def initialize(params={})
    # The name of the tag, e.g. font
    @tname = self.class.to_s.split("::").last.downcase
    # Any parameters of this tag, e.g. if you have the HTML tag:
    #   <div id="foo" class="bar">
    # then the parameters would be +id+ and +class+.
    @params = params
  end

  # Dumps this tag to an HTML string.
  def to_html
    pstring = ""
    @params.each {|key, val| pstring << " #{key}=\"#{val}\""}
    result = "<#{@tname}#{pstring}>"
    if block_given?
      result << yield.to_html
    end
    if self.class::Paired
      result << "</#{@tname}>"
    end
    result
  end
end