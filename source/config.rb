set :blog_description, <<EOF
These are Doug's bloggish thoughts on game development, specifically on the
games he's writing for Lensflare, or on Lensflare-related topics more generally.
Or whatever he wants to write here, really, but those are the sorts of things to
expect.
EOF

blog_config do
  directory "blog"
  main_title "Doug's Lensflare Game Development Blog"
  description blog_description
  site_link "http://www.lensflare.com"

  main_template "templates/blog-main.template"
  main_date_format "%d %B %Y"
  tag_pages true
  generate_rss true
  entries_per_page 20

  entry_template "templates/blog.template"
  css ["css/main.css", "css/color-lfg.css"]
  favicon [
    [16, 'icon', 'favicon/lensflare-16.png'],
    [32, 'icon', 'favicon/lensflare-32.png'],
    [152, 'apple-touch-icon', 'favicon/lensflare-152.png']
  ]
  head "  <link href=\"https://fonts.googleapis.com/css?family=Play\" rel=\"stylesheet\">" +
    "  <link href=\"https://fonts.googleapis.com/css?family=Rubik\" rel=\"stylesheet\">"
end
