Rails.application.routes.draw do
  # Route for homepage will be furniture index page 
  get("/", { :controller => "furnitures", :action => "index" })

  #------------------------------

  # Routes for the Communication resource:

  # CREATE
  post("/insert_communication", { :controller => "communications", :action => "create" })
          
  # READ
  get("/communications", { :controller => "communications", :action => "index" })
  
  get("/communications/:path_id", { :controller => "communications", :action => "show" })
  
  # UPDATE
  
  post("/modify_communication/:path_id", { :controller => "communications", :action => "update" })
  
  # DELETE
  get("/delete_communication/:path_id", { :controller => "communications", :action => "destroy" })

  #------------------------------

  # Routes for the Furniture resource:

  # CREATE
  post("/insert_furniture", { :controller => "furnitures", :action => "create" })
          
  # READ
  get("/furnitures", { :controller => "furnitures", :action => "index" })
  
  get("/furnitures/:path_id", { :controller => "furnitures", :action => "show" })
  
  # UPDATE
  
  post("/modify_furniture/:path_id", { :controller => "furnitures", :action => "update" })
  
  # DELETE
  get("/delete_furniture/:path_id", { :controller => "furnitures", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
