xml.html do
  xml.head do
    xml.title("Orders for #{@product.title}")
  end
  xml.body do
    for o in @orders
      xml.order do
        xml.h1(o.name)
        xml.p(o.email)
      end
    end
  end
end

  
