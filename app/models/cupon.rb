class Cupon < ApplicationRecord
  belongs_to :user

  validates :location, presence: true,
    format: {
      with: /\A[a-z0-9A-ZÁáÉéÍíÓóÚú,. ]+\z/
    }

  before_save :downcase_atributes
  private
  def downcase_atributes
    self.location = location.downcase
  end
end
