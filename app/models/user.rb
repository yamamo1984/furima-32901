class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname 
    validates :encrypted_password,  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数字を含めてください' }     
   
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
     validates :first_name
     validates :last_name
    end
    
    with_options format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do  
      validates :kana_first_name
      validates :kana_last_name
    end
    
    validates :birthday
  end 

end
