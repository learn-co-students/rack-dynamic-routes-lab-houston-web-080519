class Application
  
  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
     itemName = req.path.split("/items/").last
     if item = @@items.find{|i| i.name == itemName}
        resp.write item.price
      else 
        resp.write "Item not found"
        resp.status = 400
      end
    
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end

# I don't know why this code won't work, seems to me that
# it's doing the same thing as the solution ".find"
# itemName = req.path.split("/items/").last
#     if @@items.include?(itemName)
#         @resp.write "#{itemName.price}"