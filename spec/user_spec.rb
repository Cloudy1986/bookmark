require 'user'

describe User do

  describe '.create' do
    it 'adds a user to the database' do
      user = User.create(email: 'frank@example.com', password: '123456')

      test_connection = PG.connect(dbname: 'bookmark_manager_post_course_test')
      test_result = test_connection.exec_params("SELECT * FROM users;")
      
      expect(user).to be_a User
      expect(user.id).to eq test_result[0]['id']
      expect(user.email).to eq test_result[0]['email']
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'avril@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(email: 'test@example.com', password: '123456')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email address and password if one exists' do
      user = User.create(email: 'authenticate@example.com', password: 'rehuiht8345')
      authenticated_user = User.authenticate(email: 'authenticate@example.com', password: 'rehuiht8345')
      expect(authenticated_user.id).to eq user.id
    end
  end
  
end
