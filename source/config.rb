blog_config do
  directory "blog"
  main_title "Doug's Dev Blog"
  description "Doug's bloggish thoughts on game development or whatever"
  site_link "http://www.lensflare.com"

  main_template "templates/blog-main.template"
  main_date_format "%Y-%m-%d"
  tag_pages true
  generate_rss true

  entry_template "templates/blog.template"
  css ["css/main.css", "css/color-lfg.css"]
  favicon [
    [16, 'icon', 'favicon/lensflare-16.png'],
    [32, 'icon', 'favicon/lensflare-32.png'],
    [152, 'apple-touch-icon', 'favicon/lensflare-152.png']
  ]
end
