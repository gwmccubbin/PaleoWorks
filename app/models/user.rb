class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def name
    "#{first_name} #{last_name}"
  end

  def has_role?(role_name)
    roles.select { |role| role.name == role_name }.any?
  end
end
