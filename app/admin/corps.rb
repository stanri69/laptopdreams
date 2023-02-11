ActiveAdmin.register Corp do
  permit_params :color, :weight, :sound_system, :manipulators, :dimensions, :body_material

  form do |f|
    f.inputs "corp" do
      f.inputs :color
      f.inputs :weight
      f.inputs :sound_system
      f.inputs :manipulators
      f.inputs :dimensions
      f.inputs :body_material
    end
    f.actions
  end
end
