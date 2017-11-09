module ApplicationHelper

  # extending i18n.t functionality
  # example t('tolk.tranlsations.menu')
  # example t('tolk.tranlsations.menu', 'translations') -> initial value set to 'translations'
  def t(*args)
    if current_spree_user.admin? || !I18n.exists?(args.first)
      # here we have new text
      # we search for Tolk::Phrase translate
      phrase = Tolk::Phrase.where(key: args.first).first_or_create
      # if we found more args we check for default phrase translation

      tlt = Tolk::Translation.where(phrase_id: phrase.id, locale_id: Tolk::Locale.find_by(name: I18n.locale).id).first_or_create
      if tlt.new_record?
        if args.second.blank?
          tlt.text = ''
        else
          tlt.text = args.second
        end
        # save tlt
        tlt.save
      end
    end

    args.pop if args.count > 1
    if current_spree_user.admin?
      url = "/admin/tolk/#{tlt.id}/translate"
      render inline: "<span data-url='#{url}' data-title='Enter username' class='editable'>#{translate(*args)}</span>"
    else
      # return normally
      return translate(*args)
    end
  end
end
