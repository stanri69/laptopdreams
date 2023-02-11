ActiveAdmin.register Processor do
  permit_params :name, :operating_system, :clock_frequency, :number_cores

  form do |f|
    f.inputs "processor" do
      f.inputs :name
      f.inputs :operating_system
      f.inputs :clock_frequency
      f.inputs :number_cores
    end
    f.actions
  end
end
