require 'spec_helper'

describe Placement do
  let(:placement) { FactoryGirl.build :placement }
  subject { placement }

  it { should respond_to :demand_id }
  it { should respond_to :trip_id }

  it { should belong_to :demand }
  it { should belong_to :trip }
end
