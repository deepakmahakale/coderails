class PagesController < ApplicationController
  caches_action :home, :demo

  def home
  end

  def demo
  end
end
