require 'spec_helper'

describe Demand do
  let(:demand) { FactoryGirl.build :demand }
  subject { demand }

  it { should respond_to(:total) }
  it { should respond_to(:user_id) }
  it { should respond_to(:description) }
  it { should respond_to(:weight) }

  it { should validate_presence_of :total}
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :description}
  it { should validate_presence_of :weight}

  it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }

  it { should belong_to :user }

  it { should have_one(:placement) }
  it { should have_one(:trip).through(:placement) }

end
