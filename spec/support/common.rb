shared_context "With default models" do
  let(:teacher) { create :user, role: :teacher }
  let(:parent) { create :user, role: :responsible_parent }
  let(:admin) { create :user, role: :admin }
  let(:user) { create :user, role: :user }

  let(:other_teacher) { create :user, role: :teacher }
  let(:other_parent) { create :user, role: :responsible_parent }

  let(:classroom) { create :classroom, name: "CP" }
  let(:course) { create :course, user: teacher, classroom: classroom, published: true }

  let(:child) { create :child, parent: parent }
end
