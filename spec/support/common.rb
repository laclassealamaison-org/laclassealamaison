shared_context 'With default models' do
  let(:teacher) { create :user, role: :teacher }
  let(:parent) { create :user, role: :responsible_parent }
  let(:admin) { create :user, role: :admin }
  let(:user) { create :user, role: :user }

  let(:other_teacher) { create :user, role: :teacher }
  let(:other_parent) { create :user, role: :responsible_parent }

  let(:classroom) { create :classroom, name: 'CP' }
  let(:course) { create :course, user: teacher, classroom: classroom, published: true }
  let(:resource) {create :resource, classroom: classroom}

  let(:child) { create :child, parent: parent, classroom: classroom }
  let(:other_child) { create :child, parent: other_parent, classroom: classroom }
end

shared_context 'with animations' do
  let!(:past_classroom_animation) { create :classroom_animation, :past, course: course, classroom: classroom, user: teacher }
  let!(:current_classroom_animation) { create :classroom_animation, :current, course: course, classroom: classroom, user: teacher }
  let!(:future_classroom_animation) { create :classroom_animation, :future, course: course, classroom: classroom, user: teacher }
  let!(:other_future_classroom_animation) { create :classroom_animation, :future, course: course, user: other_teacher }
end
