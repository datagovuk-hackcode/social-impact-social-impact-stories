class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories

  def full_name
    "#{first_name} #{last_name}"
  end

end
