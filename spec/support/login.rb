shared_context 'when logged in' do
  before do
    post user_session_path(user: {
                             email: param_login_email,
                             password: param_login_password
                           })
  end
end

shared_context 'when logged in with user' do
  include_context 'when logged in' do
    let(:param_login_email) { authenticate_with.email }
    let(:param_login_password) { authenticate_with.password }
  end
end

shared_context 'when logged as a teacher' do
  include_context 'when logged in with user' do
    let(:authenticate_with) { teacher }
  end
end

shared_context 'when logged as an admin' do
  include_context 'when logged in with user' do
    let(:authenticate_with) { admin }
  end
end

shared_context 'when logged as a user' do
  include_context 'when logged in with user' do
    let(:authenticate_with) { user }
  end
end

shared_context 'when logged as a parent' do
  include_context 'when logged in with user' do
    let(:authenticate_with) { parent }
  end
end
