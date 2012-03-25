class String < String.superclass
  # Return a regexp based in the actual value, based in default BBCode tag definition. E.g :
  # 'b'.to_bbcode_regexp # returns /\[b\](.*?)\[\/b\]/
  def to_bbcode_regexp
    /\[#{self}\](.*?)\[\/#{self}\]/
  end
  # Return a HTML like tag, based in actual value.E.g:
  # 'b'.to_bbcode_html # Returns <b>\\1</b>
  # 'b'.to_bbcode_html('Bold Text') # returns '<b>Bold Text</b>'
  def to_bbcode_html(placeholder="\\1")
    "<%{tag_name}>#{placeholder}</%{tag_name}>" % {tag_name: self}
  end
  # Returns the string parsed in BBcode to HTML code
  def parse_bbc(options={})
   parser = RubyBBC.parse(self,options)
  end
  # alias for parse_bbc
  alias :bbc_to_html :parse_bbc
end
