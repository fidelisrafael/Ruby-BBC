module RubyBBC
	module Tags
		# Tags of RubyBBC - Can be expanded later by using RubyBBC.add_tag(tag_definition)
		# @@tags[tag] = {name: 'tag_name', regexp: /regexp/ , html: 'html'}
		# Ex:
		# @@tags[:b] = {name: 'Bold' , regexp: /\[b\](.*?)\[\/b\]/ , html: '<b>\\1</b>'}
		# You just have to write :
		# @@tags[:b] = {name: 'Bold'}
		# The 'regexp' and 'html' attributes are automatically created based in tag name when you try to parse
		# any string.
		# You can too, add infinites regexps for one tag, like :
		@@tags = {
		  b:      { name: "Bold"         , group: :basic , tag: :strong },
		  i:      { name: "Italic"       , group: :basic },
		  u:      { name: "Underline"    , group: :basic },

		  ul:     { name: 'Numeric List' , group: :list  },
		  ol:     { name: 'Ordened List' , group: :list  },
		  li:     { name: 'List Item'    , group: :list  },
		  :* =>   {name: 'List Item'  , group: :list  }, 

		  center: {name: 'Center'  , html: '<div style="text-align:center;">\\1</div>' , group: :align },
		  left:   {name: 'Left'    , html: '<div style="text-align:left;">\\1</div>'   , group: :align },
		  right:  {name: 'Right'   , html: '<div style="text-align:right;">\\1</div>'  , group: :align },
		  just:   {name: 'Justify' , html: '<div style="text-align:justify;">\\1</div>', group: :align },
		  
		  table:  {name: 'Table' ,  html: "<table style='width:%{default_table_width};'>\\1</table>" , group: :table},
		  th:     { name: 'Table Header' , group: :table },
		  tr:     { name: 'Table Row'    , group: :table },
		  td:     { name: 'Table Data'   , group: :table },
		  
		  h1:     { name: 'Heading 1'    , group: :heading },
		  h2:     { name: 'Heading 2'    , group: :heading },
		  h3:     { name: 'Heading 3'    , group: :heading },
		  h4:     { name: 'Heading 4'    , group: :heading },
		  h5:     { name: 'Heading 5'    , group: :heading },
	
			color:    {name: 'Color'   , regexp: /\[color=(.*?)\](.*?)\[\/color\]/     , html: "<span style='color:\\1;'>\\2</span>" },	 
			acronym:  {name: 'Acronym' , regexp: /\[acronym=(.*?)\](.*?)\[\/acronym\]/ , html: "<acronym title='\\1'>\\2</acronym>"  },
			
			quote:     {name: 'Quote' , regexp: [ /\[quote\](.*?)\[\/quote\]/ , /\[quote=(.*?)\](.*?)\[\/quote\]/ ] , 
		              html:   ["<blockquote>\\1</blockquote>", "<blockquote><i>%{default_quote_posted_by} <b>\\1</b></i><br></blockquote>"]},
			
		  img:       {name: 'Image' , regexp: [ /\[img\](.*?)\[\/img\]/ , /\[img alt=(.*?)\](.*?)\[\/img\]/ ] ,
		              html:   ["<img alt='%{default_image_alt}' src='\\1' />", "<img alt='\\1' src='\\2' />"]}, 
		 	
		  url:        {name: 'Link' ,  regexp: [ /\[url\](.*?)\[\/url\]/ , /\[url=(.*?)\](.*?)\[\/url\]/ ] ,
		              html:   ["<a href='\\1' target='%{default_url_target}'>\\1</a>", "<a href='\\1' target='%{default_url_target}'>\\2</a>"]}
		}
	end
end
