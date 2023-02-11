ActiveAdmin.register Datalogger do
  permit_params :volume, :type_datalogger

  form do |f|
    f.inputs "datalogger" do
      f.inputs :volume
      f.inputs :type_datalogger
    end
    f.actions
  end
end
