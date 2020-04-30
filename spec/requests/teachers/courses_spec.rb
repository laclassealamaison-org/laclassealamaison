require 'rails_helper'

RSpec.describe 'Teacher::CoursesController', type: :request do
  include_context 'With default models'

  describe '#index' do
    include_context 'when logged as a teacher'
    subject do
      get teachers_courses_path
      response.body
    end
    describe 'course publication' do
      let!(:unpublished_course) { create :course, published: false, user: teacher }
      let!(:published_course) { create :course, published: true, user: teacher }

      it { is_expected.to include published_course.title }
      it { is_expected.to include unpublished_course.title }
    end
  end

  describe '#show' do
    include_context 'when logged as a teacher'

    let(:course) { create :course, published: true, user: teacher }
    let!(:classroom_animation) { create :classroom_animation, course: course }

    subject do
      get teachers_course_path(course)
      response
    end

    it { is_expected.to have_http_status :ok }
    it { expect(subject.body).to include new_classroom_animation_path(course_id: course.id) }
    it { expect(subject.body).to include classroom_animation_path(classroom_animation) }
  end
end
