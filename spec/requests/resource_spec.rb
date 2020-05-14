require 'rails_helper'

RSpec.describe 'Administration::ResourcesController', type: :request do

  include_context 'With default models'
  include_context 'when logged as an admin'

  describe '#index' do

    subject do
      get administration_resources_path
      response
    end

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#show' do

    subject do
      get administration_resource_path(resource)
      response
    end

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#edit' do

    subject do
      get edit_administration_resource_path(resource)
      response
    end

    it { is_expected.to have_http_status(:ok) }

  end

  describe '#create' do

    subject do
<<<<<<< HEAD
      post new_administration_resource_path(resource)
=======
      post new_administration_resource(resource)
>>>>>>> 7bb90d030ddf28878b1f540c8542bf48628cd0a8
      response
    end

    it {is_expected.to have_http_status(302)}
  end

end
