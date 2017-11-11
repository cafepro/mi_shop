module Spree
  class Page < Spree::Base
    acts_as_list

    belongs_to :layout

    default_scope { order([:parent_id, :position]) }
    scope :in_menu, -> { where(in_menu: true, parent_id: 0, is_home: false) }
    scope :is_home, -> { where(is_home: true)}
    scope :published, -> { where("publish_at <= current_timestamp AND expire_at is NULL OR publish_at <= current_timestamp AND expire_at > current_timestamp")}

    before_save :set_parent_id
    before_save :update_url

    validates :name, :layout_id, presence: true

    def update_url
      if self.link.blank?
        self.url = "/#{self.title.parameterize}"
        father = self.parent rescue nil
        pid = self.parent_id
        while pid != 0 && father
          father = father.parent
          pid = father.parent_id
          self.url = "/#{father.title.parameterize}" + self.url
        end
      else
        self.url = self.link
      end
    end

    def parent
      Spree::Page.find(self.parent_id)
    end

    def set_parent_id
      self.parent_id = 0 if self.parent_id.blank?
    end

    def publish?
      return false if self.publish_at.blank? || self.publish_at > DateTime.now
      return true if self.expire_at.blank?
      return self.expire_at > DateTime.now
    end

  end
end
