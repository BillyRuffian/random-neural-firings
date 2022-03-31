class Note < ApplicationRecord
  belongs_to :user

  # broadcasts_to self

  after_create_commit :broadcast_create_later
  after_destroy_commit :broadcast_destroy_later
  after_update_commit :broadcast_update_later

  def content_as_html
    Kramdown::Document.new( 
      content, 
      input: 'GFM', 
      syntax_highlighter_opts:{ css_class: 'highlight solarized-light my-3' })
      .tap(&:to_remove_html_tags).to_html
  end

  private

  def broadcast_create_later
    # broadcast_prepend_later_to user, target: 'notes-list', partial: 'notes/note-list-item', locals: { note: self }
  end

  def broadcast_destroy_later
    # broadcast_remove_to user
  end

  def broadcast_update_later
    # broadcast_remove_to user
    # broadcast_prepend_later_to user, target: 'notes-list', partial: 'notes/note-list-item', locals: { note: self }

    broadcast_replace_later_to self, target: self, partial: 'notes/note', locals: { note: self }
    # broadcast_replace_later_to user, target: self, partial: 'notes/note-list-item', locals: {note: self}
  end
end
