class Item < ActiveRecord::Base
  belongs_to :licence

  validates :name, :user_first_name, :licence_id, presence: true
  validates :user_email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

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
end
