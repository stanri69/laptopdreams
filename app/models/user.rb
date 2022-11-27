class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, optional: true
  has_many :laptops, dependent: :destroy
  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Guest' if role.nil?
  end

  def seller?
    role.name == 'Seller'
  end

  def guest?
    role.name == 'Guest'
  end

  def admin?
    role.name == 'Admin'
  end
end
