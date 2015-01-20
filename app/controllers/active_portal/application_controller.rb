module ActivePortal
  class ApplicationController < ActionController::Base
    before_action :set_locale

    def default_url_options(options = {})
      params[:locale] ? options.merge(locale: I18n.locale) : options
    end

    protected

    def set_locale
      I18n.locale = I18n.default_locale
      locale = params[:locale].to_sym if params[:locale]
      if locale && I18n.available_locales.include?(locale)
        logger.debug "#set_locale: Language detected from query string: ?locale=#{locale}"
        I18n.locale = locale
      elsif request.env['HTTP_ACCEPT_LANGUAGE']
        logger.debug "#set_locale Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
        I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
      end
      logger.debug "#set_locale Locale set to '#{I18n.locale}'"
    end
  end
end
