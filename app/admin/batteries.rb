ActiveAdmin.register Battery do
  permit_params :battery_capacity, :battery_life

  form do |f|
    f.inputs "battery" do
      f.inputs :battery_capacity
      f.inputs :battery_life
    end
    f.actions
  end
end
