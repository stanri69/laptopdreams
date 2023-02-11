ActiveAdmin.register Videocard do
  permit_params :type_videocard, :name, :description, :amount_memory

  form do |f|
    f.inputs "videocard" do
      f.inputs :type_videocard
      f.inputs :name
      f.inputs :description
      f.inputs :amount_memory
    end
    f.actions
  end
end
