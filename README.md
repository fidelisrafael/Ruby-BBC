# Ruby BBCode

I need to write better a **README**, this project is old. (2011)

**Summary** : _This gem converts [BBCode](http://pt.wikipedia.org/wiki/BBCode) to plain HTML._

**WARNING: This gem is under development (one day i will update this hahahah)**

## Usage :

(There a lot of really cool features in this gem, i need to update this )

``` ruby 
require "ruby_bbc"
"[b]Bold[/b]".parse_bbc #  "<strong>Bold</strong>"
"[b][i][u][s]Bold-Italic-Underline-Strike[/s][/u][/i][/b]".parse_bbc(:disabled_groups => [:basic]) # returns "[b][i][u][s]Bold-Italic-Underline-Strike[/s][/u][/i][/b]"
"[b][i][u][s]Bold-Italic-Underline-Strike[/s][/u][/i][/b]".parse_bbc(:disabled_tags => [:b]) # returns "[b]<em><u><s>Bold-Italic-Underline-Strike</s></u></em>[/b]"
```

## Testing

First, run `bundle install` from gem root folder.
 in spec/lib folder run:

 	rspec ruby_bbc_spec.rb 

## TODO
* Update tests

## Maintainer

* Rafael Fidelis (<http://defidelis.com> | rafa_fidelis@yahoo.com.br)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License:

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.