# Pre-load a small list of HTML tags.
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
  Rubified::Tag.new_tag(tag, paired)
}