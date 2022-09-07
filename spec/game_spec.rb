require_relative './spec_helper'

describe Game do
  context 'When testing the Game class' do
    before :each do
      @long_ago_played = Game.new('05/09/2010', 'multiplayer', '01/08/2002')
      @recently_played = Game.new('05/09/2020', 'multiplayer', '01/08/2022')
      @actualy_played = Game.new('05/09/2000', 'multiplayer', '02/09/2022')
    end

    describe '#newGame' do
      it "it's create a new Game object instance of Book" do
        expect(@actualy_played).to be_an_instance_of Game
      end
    end

    describe '#can_be_archived?' do
      it "return true if last_time_played is > than 2 years AND if parent's method is true" do
        expect(@long_ago_played.send(:can_be_archived?)).to eql true
      end
      it "return false if last_time_played is < than 2 years AND if parent's method is true" do
        expect(@recently_played.send(:can_be_archived?)).to eql false
      end
      it "return false if last_time_played is < than 2 years AND if parent's method is true" do
        expect(@actualy_played.send(:can_be_archived?)).to eql false
      end
    end
  end
end
