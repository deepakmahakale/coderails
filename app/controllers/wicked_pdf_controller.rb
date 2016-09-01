# Demo for wicked pdf
class WickedPdfController < ApplicationController
  caches_action :index, :table_with_no_break

  def table_with_no_break
    respond_to do |format|
      format.html
      format.pdf { render pdf_params 'table_with_no_break' }
    end
  end

  private

  def pdf_params(template)
    {
      pdf:          template,
      show_as_html: params.key?('debug'),
      footer: {
        left:       'CodeRails',
        right:      '[page] of [topage]',
        line:       true
      }
    }
  end
end
