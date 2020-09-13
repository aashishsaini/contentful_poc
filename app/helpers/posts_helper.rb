require 'rich_text_renderer'

module PostsHelper
  def parse_content(content)
    renderer = RichTextRenderer::Renderer.new
    renderer.render(content)
  end
end
