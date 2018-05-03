class User < ActiveRecord::Base
  # userから見てmicropostsは複数存在するので、has_manyを使用する。
  has_many :microposts, dependent: :destroy     # dependent: :destroyは、ユーザーを削除したら、それに関連するマイクロポストも削除するオプション。
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name,  presence: true, length: { maximum: 50 }
end
