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
      it { expect(subject.body).to include current_classroom_animation.live_url }
      it { expect(subject.body).to include classroom_animation_path(current_classroom_animation)}
      it { expect(subject.body).to include classroom_animation_path(future_classroom_animation)}
      it { expect(subject.body).to_not include classroom_animation_path(other_future_classroom_animation)}
      it { expect(subject.body).to_not include classroom_animation_path(past_classroom_animation)}
    end
  end

  describe "#show" do
    include_context "with animations"

    subject {
      get classroom_animation_path(current_classroom_animation)
      response
    }

    it_behaves_like "only teachers and admin"

    context "as an teacher" do
      include_context "when logged as a teacher"

      context "when a child reserved the animation" do
        let!(:classroom_animation_reservation) { create :classroom_animation_reservation, classroom_animation: current_classroom_animation, child: child }
        it { expect(subject.body).to include child.name_with_parent }
      end
    end
  end
end
