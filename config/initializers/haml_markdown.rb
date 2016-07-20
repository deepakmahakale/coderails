module Haml::Filters
  # Remove the existing Markdown filter
  remove_filter('Markdown')
  module Markdown
    include Haml::Filters::Base

    def render(text)
      markdown.render(text)
    end

    private

    def markdown
      renderer = Redcarpet::Render::HTML.new(render_options)
      @markdown ||= Redcarpet::Markdown.new(renderer, extensions)
    end

    def render_options
      {
        filter_html:         false,
        hard_wrap:           true,
        no_styles:           true,
        prettify:            true,
        safe_links_only:     true,
        with_toc_data:       true
      }
    end

    def extensions
      {
        autolink:            true,
        fenced_code_blocks:  true,
        footnotes:           false,
        highlight:           true,
        no_images:           true,
        no_intra_emphasis:   true,
        quote:               true,
        space_after_headers: false,
        strikethrough:       true,
        superscript:         true,
        tables:              true,
        underline:           true
      }
    end
  end
end
