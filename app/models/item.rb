class Item < ActiveRecord::Base
  belongs_to :licence

  validates :name, :user_first_name, :licence_id, presence: true
  validates :user_email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  LICENCE_TYPE_NAMES = {:false => 'Part of Item', :true => 'Whole Item'}

  before_save :reset_part_object

  def licensor_name
    "#{user_first_name} #{user_last_name}"
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def licence_type_details
    self.whole_object? ? 'Whole Item' : "Part of Item: #{self.part_object}"
  end

  private
  def reset_part_object
    self.part_object = nil if self.whole_object?
  end
end
