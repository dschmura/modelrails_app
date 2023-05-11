class Feedback
  include ActiveModel::Model
  attr_accessor :full_name, :email, :topic, :comment
  validates :topic, :comment, presence: true
  validates :email, presence: true, 'valid_email_2/email': true
end
