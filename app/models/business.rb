class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :display_phone, presence: true
  validates :address1, presence: true
  validates :post_code, presence: true
  validates :city, presence: true

  def parseImageUrl
    smallUrl = self.image_url

    largeUrl = (smallUrl.include? 'yelpcdn.com') ? (smallUrl.chomp('ms.jpg') +'l.jpg') : smallUrl

  end

end

