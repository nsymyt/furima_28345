class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX    = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX     = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, confirmation: true, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true  do
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :last_name,  format: { with: VALID_NAME_REGEX }
    validates :first_name_furigana, format: { with: VALID_FURIGANA_REGEX }
    validates :last_name_furigana, format: { with: VALID_FURIGANA_REGEX }
    validates :birthday_id
  end

  has_many :items
end
