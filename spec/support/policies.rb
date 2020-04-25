shared_examples_for "only teachers and admin" do
  context "As a parent" do
    include_context "when logged as a parent"
    it { is_expected.to redirect_to root_path  }
  end
  context "As a user" do
    include_context "when logged as a user"
    it { is_expected.to redirect_to root_path  }
  end
end
