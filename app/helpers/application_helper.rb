module ApplicationHelper

  def md data
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true)
    markdown.render data
  end
end
