# Internationalization demo
class InternationalizationController < ApplicationController
  caches_action :index
  caches_action :change_locale, cache_path: Proc.new{ change_locale_internationalization_path(locale: params[:locale])}

  def index
  end

  def change_locale
  end
end
