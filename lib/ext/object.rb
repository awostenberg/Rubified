class Object
  def to_html(embedded)
    str = to_s
    if str[-1] == "\n"
      str
    else
      str << "\n"
    end
  end
end