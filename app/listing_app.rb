module ListingApp
  class API < Grape::API
    version 'v1'
    format :json

    resource :records do
      desc 'Return list of records ordered by gender'
      get :gender do
        QueryPerformer.new.order_by_gender
      end

      desc 'Return list of records ordered by birthday'
      get :birthdate do
        QueryPerformer.new.order_by_dob
      end

      desc 'Return list of records ordered by name'
      get :name do
        QueryPerformer.new.order_by_last_name
      end

      desc 'Enter a record in the list'
      post do
        RecordSaver.new(params[:input]).save
      end
    end
  end
end
