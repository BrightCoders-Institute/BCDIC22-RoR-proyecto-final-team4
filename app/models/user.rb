class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  
  has_many :cupons, dependent: :destroy

  validates :email, presence: true, uniqueness: { message: "This email is already taken" },
  format: {
    length: { in: 3..20 },
    with: /\A[a-z0-9A-ZÁáÉéÍíÓóÚú,. @]+\z/
  }

  validates :name, presence: true, uniqueness: { message: "This username is already taken" },
  length: { in: 3..20 },
  format: { with: /\A[a-z0-9A-Z]+\z/, message: "Only letters and numbers are allowed" }
  
  before_save :downcase_atributes
  private

    def downcase_atributes
      self.name = name.downcase
    end

end
