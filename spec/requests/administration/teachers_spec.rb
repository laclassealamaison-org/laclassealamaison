require 'rails_helper'

RSpec.describe 'Administration::TeachersController', type: :request do
  include_context 'With default models'

  describe '#index' do
    include_context 'when logged as an admin'
    subject do
      get administration_teachers_path
      response
    end
    it { is_expected.to have_http_status :ok }
  end

  describe '#edit' do
    include_context 'when logged as an admin'
    subject do
      get edit_administration_teacher_path(teacher)
      response
    end
    it { is_expected.to have_http_status :ok }
  end
end
