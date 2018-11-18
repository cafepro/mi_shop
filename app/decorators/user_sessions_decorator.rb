Spree::UserSessionsController.class_eval do
  def redirect_back_or_default(default)
      # redirect_to(session["spree_user_return_to"] || default)
      # session["spree_user_return_to"] = nil
      redirect_to admin_asociates_path
    end
end
