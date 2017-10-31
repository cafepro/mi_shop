module Spree
  class Page < Spree::Base
    acts_as_list

    default_scope { order(:position) }

  end
end
