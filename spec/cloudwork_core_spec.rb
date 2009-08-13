#
# Copyright Neville Burnell
# All Rights Reserved
#

require "spec"

describe "Cloudwork::Core" do

  it "should have a Version and Build" do

    require "lib/cloudwork-core"

    Cloudwork::Core::VERSION.length.should > 0
    Cloudwork::Core::BUILD.length.should > 0
  end
end