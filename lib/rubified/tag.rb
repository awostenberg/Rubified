class Rubified::Tag
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