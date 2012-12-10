require File.expand_path(File.join(File.dirname(__FILE__), '../lib/ruby_bbc'))
require	"ruby_bbc"

module RubyBBC
	module Test
		TAGS = {
		  b:      ['[b]Bold Text[/b]','<strong>Bold Text</strong>'],
		  i:      ['[i]Italic Text[/i]','<em>Italic Text</em>'],
		  u:      ['[u]Underscored Text[/u]','<u>Underscored Text</u>'],
		  s:      ['[s]Striked Text[/s]','<s>Striked Text</s>'],

		  code:   ['[code]puts "Ruby"[/code]','<pre>puts "Ruby"</pre>'],
		  ul:     ['[ul][li]Numeric List[/li][/ul]','<ul><li>Numeric List</li></ul>'],
		  ol:     ['[ol][li]Ordened List[/li][/ol]','<ol><li>Ordened List</li></ol>'],
		  li:     ['[li]List Item[/li]','<li>List Item</li>'],

		  center: ['[center]Center[/center]','<div style="text-align:center;">Center</div>'],

		  left:   ['[left]Left[/left]','<div style="text-align:left;">Left</div>'],

		  right:  ['[right]Right[/right]','<div style="text-align:right;">Right</div>'],

		  just:   ['[just]Justify[/just]','<div style="text-align:justify;">Justify</div>'],
		  
		  table:  ['[table][tr][td]Data[/td][/tr][/table]',
		  				 "<table style='width:%{default_table_width};'><tr><td>Data</td></tr></table>"],

		  th:     ['[table][th]Title[/th][th]Year[/th][/table]',
		  				 "<table style='width:%{default_table_width};'><th>Title</th><th>Year</th></table>"],

		  tr:     ['[table][tr][td]Data[/td][/tr][/table]',
		  				 "<table style='width:%{default_table_width};'><tr><td>Data</td></tr></table>"],

		  td:     ['[table][tr][td]Data[/td][/tr][/table]',
		  				 "<table style='width:%{default_table_width};'><tr><td>Data</td></tr></table>"],
		  
		  h1:     ['[h1]Heading 1[/h1]','<h1>Heading 1</h1>'],
		  h2:     ['[h2]Heading 2[/h2]','<h2>Heading 2</h2>'],
		  h3:     ['[h3]Heading 3[/h3]','<h3>Heading 3</h3>'],
		  h4:     ['[h4]Heading 4[/h4]','<h4>Heading 4</h4>'],
		  h5:     ['[h5]Heading 5[/h5]','<h5>Heading 5</h5>'],
	
			color:  ['[color=red]Red[/color]',"<span style='color:red;'>Red</span>",
							 '[color=#fff]White[/color]',"<span style='color:#fff;'>Red</span>"],	
			
			size:   ['[size=20]20 pixels[/size]',"<span style='font-size:20px;'>20 pixels</span>"],
			
			acronym:['[acronym=Cascading Style Sheets]CSS[/acronym]',"<acronym title='Cascading Style Sheets'>CSS</acronym>"],
			
			quote:  ['[quote]Quote Block[/quote]',"<blockquote>Quote Block</blockquote>", 
							 '[quote=Rafael Fidelis]Quote Block[/quote]',"<blockquote><i>%{default_quote_posted_by} <b>Rafael Fidelis</b>Quote Block</i><br></blockquote>"],
			
		  img:    ["[img]http://example.com/image.jpg[/img]" , "<img alt='%{default_image_alt}' src='http://example.com/image.jpg' />", 
		           "[img alt=Example Image]http://example.com/image.jpg[/img]" , "<img alt='Example Image' src='http://example.com/image.jpg' />"],
		 	
		  url:    ["[url]http://google.com.br[/url]" , "<a href='http://google.com.br' target='%{default_url_target}'>http://google.com.br</a>", 
		           "[url=http://google.com.br]Google Brasil[/url]" ,"<a href='http://google.com.br' target='%{default_url_target}'>Google Brasil</a>"]
		}
	end
end
