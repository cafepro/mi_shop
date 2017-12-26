class ContactMailer < ApplicationMailer

  def contact(contact_user)
    @contact_user = contact_user
    mail(to: to, subject: 'FotoFusionDigital, contacto de ' + @contact_user[:name])
  end

  private

    def to
      # cuando introduzca el configurations tendrá que tirar de una clave de ese modelo
      # return 'contacto@fotofusiondigital.es'
      return 'jorgecf@gmail.com'
    end
end
