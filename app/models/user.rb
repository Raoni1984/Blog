class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_user_type

  private

  def set_user_type
    b2c_domains = ['gmail.com', 'yahoo.com', 'uol.com.br']
    if b2c_domains.include? email.split('@').last
      user_type = 'B2C'
    else
      user_type = 'B2B'
    end
  end
end
