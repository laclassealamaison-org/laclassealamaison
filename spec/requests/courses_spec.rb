require 'rails_helper'

RSpec.describe "Courses", type: :request do
  include_context "With default models"

  describe "#index" do
    include_context "when logged as a parent"
    subject {
      get courses_path
      response.body
    }
    describe "course publication" do
      let!(:unpublished_course) { create :course, published: false}
      let!(:published_course) { create :course, published: true}

      it { is_expected.to match(published_course.title) }
      it { is_expected.to_not match(unpublished_course.title) }
    end
  end
end
