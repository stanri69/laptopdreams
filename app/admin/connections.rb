ActiveAdmin.register Connection do
  permit_params :network_adapters, :ports, :wireless_communication

  form do |f|
    f.inputs "connection" do
      f.inputs :network_adapters
      f.inputs :ports
      f.inputs :wireless_communication
    end
    f.actions
  end
end
