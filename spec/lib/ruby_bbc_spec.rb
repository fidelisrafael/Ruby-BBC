require File.expand_path(File.join(File.dirname(__FILE__), '../spec_helper'))
require "rspec"

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

describe RubyBBC do
	RubyBBC::Test::TAGS.each do |tag, tests|
		it "Should parse the #{tag} correctly" do
			RubyBBC.parse(tests[0]).should == RubyBBC.replace(tests[1])
		end
	end
end

describe String, "RubyBBC" do
	it "Should return <strong>Bold</strong> for [b]Bold[/b]" do
		"[b]Bold[/b]".parse_bbc.should == "<strong>Bold</strong>"
	end
	str = "[b][i][u][s]Bold-Italic-Underline-Strike[/s][/u][/i][/b]"
	it "Should return #{str} unparsed, since the group basic are disabled" do
	 str.parse_bbc(:disabled_groups => [:basic]).should == str
	end
	str = "[b][i][u][s]Bold-Italic-Underline-Strike[/s][/u][/i][/b]"
	str2 = "<strong><em>[u][s]Bold-Italic-Underline-Strike[/s][/u]</em></strong>"
	it "Should return #{str2} for #{str}, since the tags [:u,:s] are disabled" do
	 str.parse_bbc(:disabled_tags => [:u,:s]).should == str2
	end
end
describe RubyBBC, "Add new tag" do 
	RubyBBC.add_tags(video: { name: 'Video' , regexp: /\[video=(.*?),(.*?)\](.*?)\[\/video\]/ , 
 								 	 html: "<video width='\\1' height='\\2' controls='controls'><source src='\\3' type='video/mp4' />Your browser does not support the video tag.</video>" })
	str = RubyBBC.parse("[video=320,280]http://example.com/video.mp4[/video]")
  str2 = "<video width='320' height='280' controls='controls'><source src='http://example.com/video.mp4' type='video/mp4' />Your browser does not support the video tag.</video>"
	it "Should parse the video tag correctly" do
		str.should == str2
	end
end

=begin
	it "Should allow custom tags to run and return <strong><i>BOLD italics</i></strong> for [bi]BOLD italics[/bi]" do
		"[bi]BOLD italics[/bi]".tbbc(:custom_tags => [[/\[bi\](.*?)\[\/bi\]/,'<strong><i>\1</i></strong>',true]]).should == "<strong><i>BOLD italics</i></strong>"
	end

	it "Should allow custom tags to pass to callbacks" do
		"[up]HeLlo WorLd[/up]".tbbc(:custom_tags => [[/\[up\](.*?)\[\/up\]/,"Callback: upcaser",true]]).should == "HELLO WORLD"
	end

	it "Should not fail when a callback is defined but not used" do
		"[dw]HeLlo WorLd[/dw]".tbbc(:custom_tags => [[/\[up\](.*?)\[\/up\]/,"Callback: upcaser",true]]).should == "[dw]HeLlo WorLd[/dw]"
	end

	it "Should allow for 2 identical callbacks per string" do
		"[up]HeLlo WorLd[/up] and [up]Bye bYe WorLd[/up]".tbbc(:custom_tags => [[/\[up\](.*?)\[\/up\]/,"Callback: upcaser",true]]).should == "HELLO WORLD and BYE BYE WORLD"
	end
=end
	