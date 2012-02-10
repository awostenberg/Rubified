module Rubified
  # Used to shorten the creation of tags; just include or extend this module to use it.
  # A small HTML page without Canvas:
  #  Rubified::Tag::Html.new.to_html {
  #    Rubified::Tag::Head.new.to_html {
  #      Rubified::Tag::Title.new.to_html {"Generated with Rubified"}
  #    }
  #    Rubified::Tag::Body.new.to_html {
  #      Rubified::Tag::Div.new({:id=>"foo", :class=>"bar"}) {"Hello world!"}
  #    }
  #  }
  #
  # Instead you can use:
  #  include Rubifed::Canvas
  #  html {
  #    head {
  #      title {"Generated with Rubified"}
  #    }
  #    body {
  #      div({id=>"foo", :class=>"bar"})
  #    }
  #  }
  # True, one more line (the include), but a LOT less repetitious and more readable.
  # Both of these will produce:
  #  <html>
  #    <head>
  #      <title>Generated with Rubified</title>
  #    </head>
  #    <body>
  #      <div id=>"foo" class=>"bar">Hello world!</div>
  #    </body>
  #  </html
  module Canvas
    # Add a method for a specific XML/HTML tag class.
    def self.add_tag_method(tclass)
      n = tclass.to_s.split("::").last.downcase
      #puts n
=begin
      define_method(n) do |params={}, &block|
        # Figure out what class to use by the method name.
        #puts __method__
        tagclass = Rubified::Tag.const_get((__method__).capitalize)
        # Create a new tag then run it
        tagclass.new(params).to_html(&block)
      end
=end
      eval "
        def #{n}(params={}, &block)
          # Determine what class to use by the method name.
          tagclass = #{tclass}
          # Create a new tag then convert it.
          tagclass.new(params).to_html(&block)
        end
       "
    end
  end
end