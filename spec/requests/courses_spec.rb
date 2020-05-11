require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  include_context 'With default models'

  describe '#index' do
    include_context 'when logged as a parent'
    subject do
      get courses_path
      response.body
    end
    describe 'course publication' do
      let!(:unpublished_course) { create(:course, :unpublished) }
      let!(:published_course) { create :course }

      it { is_expected.to include published_course.title }
      it { is_expected.to_not include unpublished_course.title }
    end
  end
end
