class Product < ActiveRecord::Base
  has_many :orders, :through => :line_items
  has_many :line_items

  def self.find_products_for_sale
    find(:all, :order => "title", :conditions =>
         {:locale => I18n.locale.to_s})
  end
  
  validates_presence_of :title, :description, :image_url, :locale
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 10,
    :message => 'must be longer than 10 characters.'
  validates_format_of :image_url,
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'

  def price
    exchange_rate = EXCHANGE_RATES[I18n.locale.to_s]
    read_attribute(:price) * exchange_rate
  end
  
  protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
      price < 0.01
  end
  
end
