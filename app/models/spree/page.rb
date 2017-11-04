module Spree
  class Page < Spree::Base
    acts_as_list

    belongs_to :layout

    default_scope { order([:parent_id, :position]) }
    scope :in_menu, -> { where(in_menu: true, parent_id: 0) }
    scope :plublished, -> { where("plublished_at <= current_timestamp AND expire_at > current_timestamp")}

    before_save :set_parent_id
    before_save :update_url

    validates :name, :layout_id, presence: true

    def update_url
      self.url = "/#{self.title.parameterize}"
      father = self.parent rescue nil
      pid = self.parent_id
      while pid != 0 && father
        father = father.parent
        pid = father.parent_id
        self.url = "/#{father.title.parameterize}" + self.url
      end
    end

    def parent
      Spree::Page.find(self.parent_id)
    end

    def set_parent_id
      self.parent_id = 0 if self.parent_id.blank?
    end

  end
end
