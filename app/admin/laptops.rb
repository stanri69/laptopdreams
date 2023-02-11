ActiveAdmin.register Laptop do
  permit_params :full_name, :price, :description, :brand, :op, :type_laptop, :additionally_id, :battery_id, :connection_id, :corp_id, :datalogger_id, :processor_id, :ram_id, :screen_id, :videocard_id, :seller_id

  index do
    column "image" do |lap|
      if lap.image.present?
        image_tag url_for(lap.image)
      else
        image_tag "default_image_laptop.jpeg"
      end
    end
    column :full_name
    column :price
    column :description
    column :brand
    column :op
    column :type_laptop
  end
end
