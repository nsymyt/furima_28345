class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, uniqueness: true, format:{ with:/[＠]/ }
  validates :password, length: {minimum: 6 }, confirmation: true, format: { with:/\A[a-zA-Z0-9]+\z/}

  with_options presence: true  do
    validates :first_name, format:{ with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name,  format:{ with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_furigana, format:{ with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_furigana, format:{ with: /\A[ァ-ヶー－]+\z/}
    validates :birthday_id
  end
end
