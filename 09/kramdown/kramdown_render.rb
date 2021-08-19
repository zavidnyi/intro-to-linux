#!/usr/bin/env ruby

require 'slop'
require 'kramdown'


begin
    opts = Slop.parse do |o|
        o.string '-t', '--title', 'Page title', default: ''
        o.bool '-s', '--standalone', 'Produce full HTML.', default: false
        o.string '--stylesheet', 'Insert stylesheet', default: ''
        o.on '-h','--help', 'print the help' do
            puts o
            exit
        end
    end
    # Fix-up ARGV and ARGF once slop finishes parsing
    ARGV.replace opts.arguments
rescue Slop::Error => e
    puts e.message
    exit
end

# Read everything - either from stdin or from all arguments
input = ARGF.read

output = Kramdown::Document.new(input).to_html

# With --standalone, we create standalone document
if opts[:standalone]
    title = opts[:title]
    css = opts[:stylesheet]
    if css == ''
        header = <<-HEADER
<html>
<head>
<title>#{title}</title>
</head>
<body>
    HEADER
    else
        header = <<-HEADER
<html>
<head>
<title>#{title}</title>
<link rel="stylesheet" type="text/css" href="#{css}" />
</head>
<body>
HEADER
    end
    footer = <<-FOOTER
</body>
</html>
FOOTER
    output = header + output + footer
end

puts output
