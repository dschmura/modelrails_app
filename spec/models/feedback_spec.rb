require "rails_helper"

RSpec.describe Feedback, type: :model do
  context "invalid submissions" do
    it "is not valid without a full name" do
      feedback = Feedback.new(full_name: nil)
      expect(feedback).to_not be_valid
    end

    it "is not valid without a valid email" do
      feedback = Feedback.new(email: nil)
      expect(feedback).to_not be_valid
    end

    it "is not valid without a topic" do
      feedback = Feedback.new(topic: nil)
      expect(feedback).to_not be_valid
    end
  end
end
