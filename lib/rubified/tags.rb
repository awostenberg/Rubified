# The list of HTML tags. It's not complete.
tags = {
    :html=>true,
    :head=>true,
    :body=>true,
    :title=>true,
    :p=>true,
    :div=>true,
    :span=>true,
    :span=>true,
    :font=>true,
    :b=>true,
    :i=>true,
    :tt=>true,
    :h1=>true,
    :h2=>true,
    :h3=>true,
    :h4=>true,

    :img=>false,
    :br=>false,
    :link=>false
}

tags.each {|tag, paired|
  # First, create a new class for this tag.
  newbie = Rubified::Tag.new_tag(tag, paired)
  # Then create a corresponding method for it.
  #puts newbie
  Rubified::Canvas.add_tag_method(newbie)
}