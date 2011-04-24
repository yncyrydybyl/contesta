class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :beginner
  has_many :submissions
  
  scope :with_at_least_one_submission, :joins => :submissions, :group => 'users.id'
  scope :beginner, :conditions => {:beginner => true}
  scope :profis, :conditions => {:beginner => false}
  
  def display_name
    if first_name and last_name
      return first_name + " "+ last_name
    else
      return email.split('@')[0]+"@***."+email.split('.').last
    end
  end
  def admin?
    ["t@c-base.org","zehjotkah@googlemail.com", "jukey@ju-key.de"].include? email
  end
end
