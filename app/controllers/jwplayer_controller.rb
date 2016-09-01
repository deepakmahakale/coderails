# Demo for wicked pdf
class JwplayerController < ApplicationController
  caches_action :index, :skin

  def skin
    respond_to do |format|
      format.html
      format.pdf { render pdf_params 'table_with_no_break' }
    end
  end
end
