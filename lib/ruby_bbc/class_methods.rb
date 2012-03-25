module RubyBBC
  # Get the configurations for RBBC.
  # You can pass an block, like:
  # RubyBBC.config do |config|
  #   config.default_image_alt = 'Posted Image'
  # end
  # Or, just : RubyBBC.config.default_image_alt = 'Posted Image'
  CONFIG ||= RubyBBC::Config.new
  def self.config
    yield(CONFIG) if block_given?
    CONFIG
  end
  # Get all tags list declared in ruby_bbc/tags.rb
  def self.tags
   @@tags.each_key {|tag| to_html(tag) }
   @@tags
  end  
  # This method update the tag list with the passed tags definitions.
  def self.add_tags(tags)
   @@tags.update(tags)
   tags.each_key {|tag| populate_tag_hash(tag) }
   tags
  end
end
