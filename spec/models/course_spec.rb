require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "#calculate_total_odds" do
    subject { described_class.new }

    it "calculate the total course" do
      expect(subject.calculate_total_odds([{ odds: 1.4 }, {odds: 1.7}, {odds: 2.1}])).to                                   eq(4.998)
      expect(subject.calculate_total_odds([{ odds: 1.4 }, {odds: 1.7}, {odds: 2.1}], 2)).to                                eq(2.963)

      expect(subject.calculate_total_odds([{ odds: 1.15 }, {odds: 1.69}, {odds: 2.23}, {odds: 2.51}])).to                  eq(10.878)
      expect(subject.calculate_total_odds([{ odds: 1.15 }, {odds: 1.69}, {odds: 2.23}, {odds: 2.51}], 2)).to               eq(3.500)

      expect(subject.calculate_total_odds([{ odds: 1.28 }, {odds: 1.94}, {odds: 2.12}, {odds: 2.32}, {odds: 3.22}])).to    eq(39.327)
      expect(subject.calculate_total_odds([{ odds: 1.28 }, {odds: 1.94}, {odds: 2.12}, {odds: 2.32}, {odds: 3.22}], 3)).to eq(4.636)
    end
  end
end
