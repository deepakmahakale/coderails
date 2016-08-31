require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  # to use Rouge with Redcarpet
  include Rouge::Plugins::Redcarpet
  # overriding Redcarpet method
  # github.com/vmg/redcarpet/blob/master/lib/redcarpet/render_man.rb#L9
  def block_code(code, language)
    # highlight some code with a given language lexer
    # and formatter: html or terminal256
    # and block if you want to stream chunks
    # github.com/jayferd/rouge/blob/master/lib/rouge.rb#L17
    Rouge.highlight(code, language || 'text', 'html')
    # watch out you need to provide 'text' as a default,
    # because when you not provide language in Markdown
    # you will get error: <RuntimeError: unknown lexer >
  end
end

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
      renderer = HTML.new(render_options)
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
