ActiveAdmin.register Screen do
  permit_params :diagonal, :screen_type, :resolution, :refresh_rate, :built_camera

  form do |f|
    f.inputs "screen" do
      f.inputs :diagonal
      f.inputs :screen_type
      f.inputs :resolution
      f.inputs :refresh_rate
      f.inputs :built_camera
    end
    f.actions
  end
end
