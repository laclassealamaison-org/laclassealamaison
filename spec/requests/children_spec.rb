require 'rails_helper'

RSpec.describe "ChildrenController", type: :request do
  include_context "With default models"

  describe "#index" do
    include_context "when logged as a parent"
    subject {
      get children_path
      response.body
    }
    describe "show children" do
      before do
        child
        other_child
      end
      it { is_expected.to match child.name }
      it { is_expected.to_not match other_child.name }
    end
  end

  describe "#show" do
    include_context "when logged as a parent"
    include_context "with animations"
    subject {
      get child_path(child)
      response.body
    }
    it { is_expected.to match child.name }
    it("has a register form for future animation") {
      is_expected.to have_tag('form') do
        with_tag('input', with: {value: future_classroom_animation.id})
        with_tag('input', with: {value: child.id})
      end
    }
  end
end
