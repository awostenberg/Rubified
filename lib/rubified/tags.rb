# The list of HTML tags. It's not complete.
tags = {
    :html=>true,
    :head=>true,
    :body=>true,
    :p=>true,
    :div=>true,
    :span=>true,
    :font=>true,
    :b=>true,
    :i=>true,
    :tt=>true,

    :img=>false
}

tags.each {|tag, paired|
  # First, create a new class for this tag.
  newbie = Rubified::Tag.new_tag(tag, paired)
  # Then create a corresponding method for it.
  #puts newbie
  Rubified::Canvas.add_tag_method(newbie)
}