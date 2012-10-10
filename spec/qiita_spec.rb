require 'spec_helper'

describe Qiita do
  it { should respond_to(:new) }

  describe 'new' do
    it 'returns Qiita::Client instance' do
      subject.new.should be_a_kind_of(Qiita::Client)
    end
  end

  describe 'method_missing' do
    it 'delegates method to Qiita::Client instance' do
      Qiita::Client.any_instance.should_receive(:rate_limit)
      subject.rate_limit
    end
  end
end
