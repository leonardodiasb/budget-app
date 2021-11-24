class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities, optional: true

  validates :name, presence: true
  validates :icon, presence: true

  def total_expenses_group
    entities.sum(:amount)
  end
end
