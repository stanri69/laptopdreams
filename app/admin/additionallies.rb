ActiveAdmin.register Additionally do
  permit_params :additionally_features, :producing_country, :supply_set, :registration, :guarantee

  form do |f|
    f.inputs "additionally" do
      f.inputs :additionally_features
      f.inputs :producing_country
      f.inputs :supply_set
      f.inputs :registration
      f.inputs :guarantee
    end
    f.actions
  end
end
