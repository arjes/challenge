require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { Player.new(attributes) }
  let(:attributes) { {name: name, email: email, hand: hand, grade: grade } }

  # Valid Attributes
  let(:name) { 'foo' }
  let(:email) { 'asdf@asdf.com' }
  let(:hand) { 'Left' }
  let(:grade) { nil }

  describe "#valid?" do
    it "is valid" do
      expect(player).to be_valid
    end

    context "when the name is not set" do
      let(:name) { '' }
      it "is not valid" do
        expect(player).to_not be_valid
      end
    end

    context "when the email is invalid" do
      let(:email) { 'asdfasf' }
      it "is not valid" do
        expect(player).to_not be_valid
      end
    end

    context "when the hand is invalid" do
      let(:hand) { 'all' }
      it "is not valid" do
        expect(player).to_not be_valid
      end
    end

    context "when the grade is above 100" do
      let(:grade) { 101 }
      it "is not valid" do
        expect(player).to_not be_valid
      end
    end

    context "when the grade is below 0" do
      let(:grade) { -1 }
      it "is not valid" do
        expect(player).to_not be_valid
      end
    end
  end

  describe "#update_grade" do
    it "sets the grade to 100 if the player has never allowed a point" do
      allow(player).to receive(:points_scored).and_return(10)
      allow(player).to receive(:total_game_points).and_return(10)

      expect{
        player.update_grade
      }.to change{ player.grade }.to(100)
    end

    it "sets the grade to 0 has never scored a point" do
      allow(player).to receive(:points_scored).and_return(0)
      allow(player).to receive(:total_game_points).and_return(10)

      expect{
        player.update_grade
      }.to change{ player.grade }.to(0)
    end
  end

end
