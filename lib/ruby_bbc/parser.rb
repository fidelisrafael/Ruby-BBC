module RubyBBC	
  class << self
    # Parse a string using the tag passed,
    def parse_tag(tag,input)
      if multiples_bbcodes?(tag)
        regexps = @@tags[tag][:regexp].clone
        htmls   = @@tags[tag][:html].clone
        raise Errors::RubyBBCTagNotDefined.new("The tag #{tag} isn't declared in @@tags") if @@tags[tag].nil?
        raise Errors::RubyBBCTagConfigError.new("#{tag} Configuration ERROR : The regexp attribute must be the same size of the html attribute.") if regexps.size != htmls.size
        regexps.size.times { input.gsub!(regexps.pop,replace(htmls.pop)) }
      else
        input.gsub!(to_regexp(tag),to_html(tag))
      end
      input
    end
    # Add the key and value for :html and replace HTML configurations in tag definition.
    def to_html(tag)
      @@tags[tag][:html] ||= (@@tags[tag][:tag] || tag).to_s.to_bbcode_html
      replace(@@tags[tag][:html])
    end
    # Add key and value for :regexp in the tag definition if ommited
    def to_regexp(tag)
      raise RubyBBCTagNotDefined , "The tag #{tag} isn't declared in @@tags" if @@tags[tag].nil?
      @@tags[tag][:regexp] ||= tag.to_s.to_bbcode_regexp 
      @@tags[tag][:regexp]
    end
    # Escape all HTML before parsing a string.
    def escape_html(string)
      string.gsub!("<","&lt;") ;  string.gsub!(">","&gt;")
      string
    end
    # Convert from HTML to BBcode
    def to_bbcode(tag)
     warn 'Not Implement Yet'
    end
    # Parse a string with BBCode tags to HTML Code.
     def parse(unparsed_string,options={})
       # Default options
       options = {to: :html}.merge(RubyBBC.config.parse_options).merge(options)
       unparsed_string = escape_html(unparsed_string.clone) if options[:escape_html]
       tag_list = make_tags_list_to_parse(options)
       if options[:to] == :html
         tag_list.each do |tag|
          if @@tags.key?(tag)
            parse_tag(tag,unparsed_string)
          end
        end
      end
      unparsed_string
    end
    private
    # Populate the tag hash, with regexp and html values
    def populate_tag_hash(tag)
      to_html(tag)
      to_regexp(tag)
    end
    # Check if a tag has multiples regexps for parse(like img BBCode tag)
    def multiples_bbcodes?(tag)
      populate_tag_hash(tag)
      return (@@tags[tag][:regexp].kind_of?(Array) || @@tags[tag][:html].kind_of?(Array))
    end
    # Replace the config values in the HTML
    def replace(html)
      if html.kind_of?(Array)
        return html.collect {|t| replace(t) }
      end
      html % RubyBBC::CONFIG.tags_config
    end
     # Return the valid tags according to the options hash passed as argument.
     def make_tags_list_to_parse(options)
       tags = @@tags.clone
       all_groups = @@tags.collect {|k,v| v[:group]}.uniq
       groups = options[:enabled_groups].empty? ? (all_groups - options[:disabled_groups]) : (all_groups & options[:enabled_groups])
       if ((options[:enabled_groups] + options[:disabled_groups]) != [])
          tags = tags.select {|k,v| groups.include?(v[:group]) }
       end
       return (options[:enabled_tags].empty? ? (tags.keys - options[:disabled_tags]) : (tags.keys & options[:enabled_tags]))
     end
  end
end
