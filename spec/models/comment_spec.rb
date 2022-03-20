RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).
    is_at_least(10).is_at_most(256) }
end