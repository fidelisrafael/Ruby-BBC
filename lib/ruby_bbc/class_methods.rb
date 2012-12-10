module RubyBBC
  # Get the configurations for RBBC.
  # You can pass an block, like:
  # RubyBBC.config do |config|
  #   config.default_image_alt = 'Posted Image'
  # end
  # Or, just : RubyBBC.config.default_image_alt = 'Posted Image'
  @@config ||= RubyBBConfig.new
  def self.config
    yield(@@config) if block_given?
    @@config
  end
  # Get all tags list declared in ruby_bbc/tags.rb
  def self.tags
   @@tags.each_key {|tag| populate_tag_hash(tag) }
   @@tags
  end  
  # This method update the tag list with the passed tags definitions.
  def self.add_tags(tags)
   @@tags.update(tags)
   RubyBBC.config.enabled_tags.concat(tags.keys) # Update the default enabled Tags
   tags.each_key {|tag| populate_tag_hash(tag) }
   tags
  end
end
