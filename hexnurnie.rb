# This code is faintly ugly, but whatever.  Generates a logo in SVG
# at arbitrary sizes in color and reverse/greyscale

puts "<!DOCTYPE html>"
puts "<html>"
puts "<body>"

def sin(x)
  Math.sin(x * Math::PI / 180)
end

def cos(x)
  Math.cos(x * Math::PI / 180)
end

def size_factor
  16
end

def size(x)
  x * size_factor / 120.0
end

def line_size(x)
  factor = 120.0 / size_factor
  x / factor <= 1 ? 1 : x / factor
end

color_source = [
  {
    top: 'hsl(15, 60%, 40%)',
    middle: 'hsl(200, 60%, 22%)',
    bottom: 'hsl(200, 60%, 32%)',
    line: 'hsl(60, 80%, 80%)',
    background: 'hsl(0, 0%, 0%)'
  },
  {
    top: 'hsl(15, 0%, 60%)',
    middle: 'hsl(200, 0%, 78%)',
    bottom: 'hsl(200, 0%, 68%)',
    line: 'hsl(60, 0%, 20%)',
    background: 'hsl(0, 0%, 100%)'
  }
]

0.upto(1) do |version|
  ref_colors = color_source[version]

  hex_size = [size(60), size(60), size(60)]
  x = [size(70), size(200), size(330)]
  y = [size(52), size(52), size(52)]
  color = [ref_colors[:top]]
  color.push(ref_colors[:bottom])
  color.push(ref_colors[:bottom])

  puts "<svg width=\"#{size(400)}\" height=\"#{size(104)}\">"
#  puts "  <rect width=\"#{size(400)}\" height=\"#{size(104)}\" " +
#       "style=\"fill:#{ref_colors[:background]};stroke-width:1;stroke:#000;\" />"

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

  puts "</svg>"
end
puts "</body>"
puts "</html>"
