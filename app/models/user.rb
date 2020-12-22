class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, inverse_of: :user
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  def admin?
      has_role?(:admin)
  end

  def client?
        has_role?(:client)
  end

  def latest_order
      orders.where(status:0) || new_order
    end

  private
    def new_order
      orders.create(status:0)
    end

  #   def add_order
  #    self.orders.create!(total_price: 0, total_quantity: 0)
  #  end
end


