require 'rails_helper'

RSpec.describe 'ChildrenController', type: :request do
  include_context 'With default models'

  describe '#index' do
    include_context 'when logged as a parent'
    subject do
      get children_path
      response.body
    end
    describe 'show children' do
      before do
        child
        other_child
      end
      it { is_expected.to include child.name }
      it { is_expected.to_not include other_child.name }
    end
  end

  describe '#show' do
    include_context 'when logged as a parent'
    include_context 'with animations'
    subject do
      get child_path(child)
      response.body
    end
    it { is_expected.to include child.name }
    it('has a register form for future animation') {
      is_expected.to have_tag('form')
    }
  end
end
