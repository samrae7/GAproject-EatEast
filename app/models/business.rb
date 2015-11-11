class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :display_phone, presence: true
  validates :address1, presence: true
  validates :post_code, presence: true
  validates :city, presence: true

  def parseImageUrl
    url =  self.image_url

    smallUrl = (url.include? 'yelpcdn.com') ? url.insert(4,'s') : url

    largeUrl = (smallUrl.include? 'yelpcdn.com') ? (smallUrl.chomp('ms.jpg') +'l.jpg') : smallUrl
  end

  def getCuisine
    if categories
      cuisine = self.categories.split(',')[0]
    elsif categories == nil
      cuisine = 'chinese'
    end
  end

  def deliveryMessage
    if delivers
      self.delivers ? 'and delivery available' : 'but no delivery service'
    else
      return ' '
    end
  end

  def takeawayMessage
    if takeaway
      self.takeaway ? 'Takeaway ' + self.deliveryMessage : 'No takeaway'
    elsif categories == nil
      return 'No takeaway'
    end
  end

  def vegOptions
    if veg_friendly
      self.veg_friendly ? 'Vegetarian options available' : 'No vegetarian options'
    else
      return ' '
    end
  end

end

