class Note < ApplicationRecord
  belongs_to :user

  broadcasts_to :user

  def content_as_html
    Kramdown::Document.new( 
      content, 
      input: 'GFM', 
      syntax_highlighter_opts:{ css_class: 'highlight solarized-light my-3' })
      .tap(&:to_remove_html_tags).to_html
  end
end
