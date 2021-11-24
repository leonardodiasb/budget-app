class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities, optional: true

  validates :name, presence: true
  validates :icon, presence: true

  def total_expenses_group
    entities.sum(:amount)
  end

  def icon_img
    icon_array = ['Housing', 'Transportation', 'Food', 'Utilities', 'Insurance', 'Healthcare', 'Savings & Investments',
                  'Personal Spendings', 'Recreation & Entertainment', 'Miscellaneous']
    something = ''
    icon_class = %w[house bicycle basket3 hammer shield-check heart piggy-bank cash-coin
                    joystic gem]
    icon_array.each_with_index do |i, index|
      something = icon_class[index] if icon == i
    end
    something
  end
end
