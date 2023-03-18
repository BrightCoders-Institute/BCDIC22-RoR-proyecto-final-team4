class Cupon < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, 
  format: {
    with: /\A[a-z0-9A-Z\s]+\z/
  }

  before_save :downcase_atributes
  private

    def downcase_atributes
      self.title = title.downcase
    end
end
