class Cupon < ApplicationRecord
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :title, presence: true, 
  format: {
    with: /\A[a-z0-9A-ZÁáÉéÍíÓóÚú,.\s]+\z/
  }

  validates :location, presence: true,
    format: {
      with: /\A[a-z0-9A-ZÁáÉéÍíÓóÚú,. ]+\z/
    }

  validates :expiration_date, presence: true

  before_save :downcase_atributes
  
  def punctuation_with_default
    self.punctuation || 0
  end
  private
  def downcase_atributes
    self.title = title.downcase
    self.location = location.downcase
  end
end
