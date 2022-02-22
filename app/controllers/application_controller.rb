class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cookie

  protected

    def set_cookie
      if session[:kakikomi_id_mana].nil?
        session[:kakikomi_id_mana] = SecureRandom.alphanumeric(255)
      end

      date = Date.today.to_s
      if date != session[:kakikomi_id_disp_date]
        session[:kakikomi_id_disp] = nil
        session[:kakikomi_id_disp_date] = Date.today.to_s
      end

      if session[:kakikomi_id_disp].nil?
        session[:kakikomi_id_disp] = SecureRandom.alphanumeric(4)
      end
    end

end
