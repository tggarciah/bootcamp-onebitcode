module LikeSearchable
  extend ActiveSupport::Concern

  included do
    scope :like, ->(field, value) do
      # self.where("#{field} ILIKE ?", "%#{value}%")
      self.where(self.arel_table[field].matches("%#{value}%"))
    end
  end
end
