require 'rails_helper'

RSpec.describe Coin, type: :model do
  describe "#coins" do
    subject { described_class.new }

    it "should pass fixed tests" do
      expect(subject.coins(1)).to       eq( { 1 => 1 })
      expect(subject.coins(3)).to       eq( { 2 => 1, 1 => 1 })
      expect(subject.coins(8)).to       eq( { 5 => 1, 2 => 1, 1 => 1 })
      expect(subject.coins(18)).to      eq( { 5 => 3, 2 => 1, 1 => 1 })
      expect(subject.coins(100)).to     eq( { 5 => 20 })
      expect(subject.coins(10.6)).to    eq( { 5 => 2, 0.5 => 1, 0.1 => 1 })
      expect(subject.coins(10.99)).to   eq( { 5 => 2, 0.5 => 1, 0.2 => 2, 0.05 => 1, 0.02 => 2 })
      expect(subject.coins(28.48)).to   eq( { 5 => 5, 2 => 1, 1 => 1, 0.2 => 2, 0.05 => 1, 0.02 => 1, 0.01 => 1 })
      expect(subject.coins(269.89)).to  eq( { 5 => 53, 2 => 2, 0.5 => 1, 0.2 => 1, 0.1 => 1, 0.05 => 1, 0.02 => 2 })
      expect(subject.coins(508.14)).to  eq( { 5 => 101, 2 => 1, 1 => 1, 0.1 => 1, 0.02 => 2 })
      expect(subject.coins(0)).to       eq( {} )
    end
  end
end
