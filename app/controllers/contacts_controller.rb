class ContactsController < ApplicationController
  def contact
    if ContactMailer.contact(params[:contact]).deliver
      flash[:notice] = t('contact.notice.success')
    else
      flash[:error] = t('contact.notice.error')
    end
    render :contact, format: :js
  end
end
