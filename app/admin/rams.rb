ActiveAdmin.register Ram do
  permit_params :amount, :number_slot, :type_ram

  form do |f|
    f.inputs "ram" do
      f.inputs :amount
      f.inputs :number_slot
      f.inputs :type_ram
    end
    f.actions
  end
end
