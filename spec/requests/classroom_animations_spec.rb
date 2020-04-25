require 'rails_helper'

RSpec.describe "ClassroomAnimationsController", type: :request do
  include_context "With default models"

  describe "#index" do
    subject {
      get classroom_animations_path
      response
    }

    it_behaves_like "only teachers and admin"

    context "as an teacher" do
      include_context "when logged as a teacher"
      include_context "with animations"

      it { is_expected.to have_http_status :ok }
      it { expect(subject.body).to match current_classroom_animation.live_url }
      it { expect(subject.body).to match classroom_animation_path(current_classroom_animation)}
      it { expect(subject.body).to match classroom_animation_path(future_classroom_animation)}
      it { expect(subject.body).to_not match classroom_animation_path(other_future_classroom_animation)}
      it { expect(subject.body).to_not match classroom_animation_path(past_classroom_animation)}
    end
  end
end
