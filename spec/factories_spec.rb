require 'spec_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    subject { build(factory_name) }
    it { should be_valid }
  end
end
