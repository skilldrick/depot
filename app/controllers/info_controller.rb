class InfoController < ApplicationController
  def who_bought
    @product = Product.find(params[:id])
    @orders = @product.orders
    respond_to do |format|
      format.html {render :layout => false }
      format.xml { render :layout => false }
      format.atom { render :layout => false }
      format.json { render :layout => false,
        :json => @product.to_json(:include => :orders) }
    end
  end

  def authorize
  end
end
