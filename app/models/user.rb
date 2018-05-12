class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	"#{first_name} #{last_name}"
  end

  def has_trainer?
    Trainer.where(user_id: id).first.present?
  end

  def trainer
    Trainer.where(user_id: id).first
  end
end
