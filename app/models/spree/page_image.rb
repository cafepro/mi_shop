module Spree
  class PageImage < Spree::Base
    has_attached_file :attachment,
                      styles: { thumbnail: '60x60', mini: '100x100>', medium: '300x300>', large: '600x600>', xlarge: '1200x1200>' },
                      default_style: :large,
                      url: '/spree/page_images/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/page_images/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    validates_attachment :attachment, content_type: { content_type: /\Aimage\/.*\Z/ }

  end
end
