class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname 
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'has to include number and alphabet' }     

    with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'has to use full-width character' } do
    validates :first_name
    validates :last_name
    end
   
    with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'has to use full-width Katakana character' } do
    validates :kana_first_name 
    validates :kana_last_name
    end
    
    validates :birthday
  end 

end
