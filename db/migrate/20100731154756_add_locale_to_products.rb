class AddLocaleToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :locale, :string
    products = Product.all
    products.each do |product|
      product.update_attribute :locale, 'en'
    end
  end

  def self.down
    remove_column :products, :locale
  end
end
