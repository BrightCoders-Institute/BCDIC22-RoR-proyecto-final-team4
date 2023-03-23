class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  
  has_many :cupons

  validates :name, presence: true, 
    length: { in: 3..20 },
    format: {
      with: /\A[a-z0-9A-Z]+\z/
    }

  before_save :downcase_atributes
  private

    def downcase_atributes
      self.name = name.downcase
    end
end
