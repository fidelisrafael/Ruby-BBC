#encoding: UTF-8
module RubyBBC
  include RubyBBC::Tags
	class Config
	 attr_reader :tags_config
	 def initialize
		default   
	 end
	 # This methods return global configuration for the parser.
	 # Like, which group is disabled, whice tags are disabled, etc.
	 def parse_options
		@config
	 end
	 # default HTML replacement valuess
	 def default
		@config ||= {
		  enabled_groups:  RubyBBC.tags.collect {|k,v| v[:group]}.uniq, # By default all groups are enableds
		  disabled_groups: [] ,                                   			# By default, no groups area disabled
		  enabled_tags:    RubyBBC.tags.keys,                           # By default, all tags are enabled
		  disabled_tags:   [],                                   				# By default, no tag are disabled
		  escape_html: true					    																# By default, escape all HTML tags
		}
		@tags_config ||= { 
		  default_image_alt: 'Image..' , 
		  default_url_target: '_blank' , 
		  default_quote_posted_by: 'Posted by',
		  default_table_width: '100%'
		}

	 end
	 # Prevent 'No Method Error' Exception, it search de missing method in the configs Hashes Keys.
	 # E.g RubyBBC.config.default_table_width , this method search for :default_table_width key in @config and @tags_config
	 def method_missing(*args)
		key,value = args[0..1]
		real_key = key.id2name.delete("=").to_sym
		if @config[real_key]
		  return (key =~ /(.*?)=/ ? @config[real_key] = value : @config[real_key])
		elsif @tags_config[real_key]
		  return (key =~ /(.*?)=/ ? @tags_config[real_key] = value : @tags_config[real_key])
		end
		super
	 end
	end
end
