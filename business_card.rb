font = "Play"
font2 = "PT Sans"

# This code is faintly ugly, but whatever.  Generates a logo in SVG
# at arbitrary sizes in color and reverse/greyscale

puts "<!DOCTYPE html>"
puts "<html>"
puts "<head>"
puts "  <link href=\"https://fonts.googleapis.com/css?family=#{font}\" " +
     "rel=\"stylesheet\">"
puts "  <link href=\"https://fonts.googleapis.com/css?family=#{font2}\" " +
     "rel=\"stylesheet\">"
puts "</head>"
puts "<body>"

explode = 0.1
def sin(x)
  Math.sin(x * Math::PI / 180)
end

def cos(x)
  Math.cos(x * Math::PI / 180)
end

def padding
  35.0 / 2
end

def x_offset
  20 + padding
end

def y_offset
  150 + padding
end

def size_factor
  770
end

def size(x)
  x * size_factor / 880.0
end

def line_size(x)
  factor = 880.0 / size_factor
  x / factor <= 1 ? 1 : x / factor
end

color_source = [
#  {
#    top: 'hsl(15, 60%, 40%)',
#    middle: 'hsl(200, 60%, 22%)',
#    bottom: 'hsl(200, 60%, 32%)',
#    line: 'hsl(60, 80%, 80%)',
#    text: 'hsl(60, 80%, 80%)',
#    background: 'hsl(0, 0%, 0%)'
#  },
  {
    top: 'hsl(15, 60%, 60%)',
    middle: 'hsl(200, 0%, 82%)',
    bottom: 'hsl(200, 0%, 74%)',
    line: 'hsl(60, 0%, 20%)',
    text: 'hsl(60, 0%, 20%)',
    nametext: 'hsl(60, 0%, 0%)',
    background: 'hsl(0, 0%, 100%)'
  }
]

names = ["Douglas Triggs", "Ai Ling Chow"]
emails = ["doubt@lensflare.com", "ai@lensflare.com"]
twitters = ["@doubt72", ""]

1.upto(1) do |version|
  ref_colors = color_source[0]

  hex_size = [size(60)]
  x = [size(120) + x_offset]
  y = [size(120) + y_offset]
  color = [ref_colors[:top]]
  1.upto(6) do |n|
    hex_size.push(size(30))
    angle = 60 * n
    offset = size(60 * sin(60) * (1 + explode * 1.3333))
    xloc = size(120 * cos(60) * (1 + explode) + 120)
    yloc = size(120 * sin(60) * (1 + explode) + 120)
    x.push(sin(angle) * offset + xloc + x_offset)
    y.push(cos(angle) * offset + yloc + y_offset)
    color.push(ref_colors[:middle])
  end
  hex_size.push(size(60))
  x.push(size(240 * cos(60) * (1 + explode) + 120) + x_offset)
  y.push(size(240 * sin(60) * (1 + explode) + 120) + y_offset)
  color.push(ref_colors[:bottom])

  puts "<svg width=\"#{1050 + padding * 2}\" height=\"#{600 + padding * 2}\">"
  puts "  <rect width=\"#{1050 + padding * 2}\" height=\"#{600 + padding * 2}\" " +
       "style=\"fill:#{ref_colors[:background]};stroke-width:1;stroke:#000;\" />"

  0.upto(hex_size.length - 1) do |n|
    points = []
    0.upto(5) do |p|
      angle = 60 * p + 30
      points.push("#{sin(angle) * hex_size[n] + x[n]}," +
                  "#{cos(angle) * hex_size[n] + y[n]}")
    end
    puts "  <polygon points=\"#{points.join(" ")}\" " +
         "style=\"fill:#{color[n]};\" />"
  end

  puts "  <line " +
       "x1=\"#{size(120 - cos(60) * 100) + x_offset}\" " +
       "y1=\"#{size(120 - sin(60) * 100) + y_offset}\" " +
       "x2=\"#{size(120 + cos(60) * 380) + x_offset}\" " +
       "y2=\"#{size(120 + sin(60) * 380) + y_offset}\" " +
       "style=\"stroke:#{ref_colors[:line]};stroke-width:#{line_size(4)}px\" />"

  puts "  <line " +
       "x1=\"#{size(120 + cos(60) * 100) + x_offset}\" " +
       "y1=\"#{size(120 - sin(60) * 100) + y_offset}\" " +
       "x2=\"#{size(120 - cos(60) * 100) + x_offset}\" " +
       "y2=\"#{size(120 + sin(60) * 100) + y_offset}\" " +
       "style=\"stroke:#{ref_colors[:line]};stroke-width:#{line_size(4)}px\" />"

  puts "  <line " +
       "x1=\"#{size(20) + x_offset}\" y1=\"#{size(120) + y_offset}\" " +
       "x2=\"#{size(220) + x_offset}\" y2=\"#{size(120) + y_offset}\" " +
       "style=\"stroke:#{ref_colors[:line]};stroke-width:#{line_size(4)}px\" />"

  puts "  <text " +
       "x=\"#{size(120 + cos(60) * 118) + x_offset}\" " +
       "y=\"#{size(120 + sin(60) * 118) + y_offset}\" " +
       "style=\"fill:#{ref_colors[:text]};" +
       "font-family:'#{font}';font-size:#{size(128)}px;\">LENSFLARE</text>" 

  puts "  <text " +
       "x=\"#{size(115 + cos(60) * 246) + x_offset}\" " +
       "y=\"#{size(120 + sin(60) * 246) + y_offset}\" " +
       "style=\"fill:#{ref_colors[:text]};" +
       "font-family:'#{font}';font-size:#{size(128)}px;\">GAMES</text>" 

  puts "  <text " +
       "x=\"#{size(550 + cos(60) * 246) + x_offset}\" " +
       "y=\"#{size(120 + sin(60) * 246) + y_offset}\" " +
       "style=\"fill:#{ref_colors[:text]};" +
       "font-family:'#{font}';font-size:#{size(32)}px;\">LLC</text>"

  puts "  <text " +
       "x=\"#{950 + padding}\" " +
       "y=\"#{100 + padding}\" " +
       "style=\"fill:#{ref_colors[:nametext]};text-anchor:end;" +
       "font-family:'#{font2}';font-size:56px;\">#{names[version]}</text>"
  puts "  <text " +
       "x=\"#{950 + padding}\" " +
       "y=\"#{145 + padding}\" " +
       "style=\"fill:#{ref_colors[:nametext]};text-anchor:end;" +
       "font-family:'#{font2}';font-size:32px;\">#{emails[version]}</text>"
  puts "  <text " +
       "x=\"#{950 + padding}\" " +
       "y=\"#{185 + padding}\" " +
       "style=\"fill:#{ref_colors[:nametext]};text-anchor:end;" +
       "font-family:'#{font2}';font-size:32px;\">#{twitters[version]}</text>"

  puts "  <text " +
       "x=\"#{950 + padding}\" " +
       "y=\"#{540 + padding}\" " +
       "style=\"fill:#{ref_colors[:nametext]};text-anchor:end;" +
       "font-family:'#{font2}';font-size:42px;\">www.lensflare.com</text>"

  puts "</svg>"
end
puts "</body>"
puts "</html>"
