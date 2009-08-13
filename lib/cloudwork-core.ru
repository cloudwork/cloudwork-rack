#
# Copyright Neville Burnell
# All Rights Reserved
#
require "cloudwork-core"

use Rack::ContentLength
use Cloudwork::Core::BodyToJson

map '/cloudwork' do
  map '/' do
    run Cloudwork::Core::Http404
  end

  map '/core' do
    map '/' do
      run Cloudwork::Core::Http404
    end

    map '/version' do
      use Cloudwork::Core::Version
      run Cloudwork::Core::Http200
    end
  end
end

map '/' do
  run Cloudwork::Core::Http404
end
