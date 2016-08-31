module ApplicationHelper
  def index_action?
    action_name == 'index'
  end

  def available_locales
    I18n.available_locales.map do |locale|
      [I18n.t('language', locale: locale), locale.to_s]
    end
  end

  def show_locale_dropdown?
    controller_name == InternationalizationController.controller_name
  end
end
