require 'spec_helper'

describe "Sites", :type => :request do
  it_should_behave_like("accessible by login", :sites_path)
end
