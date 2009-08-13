#
# Copyright Neville Burnell
# All Rights Reserved
#
require "json/pure"

module Cloudwork
  module Core

    # rack endpoint for HTTP Status 200:OK and 404:NotFound
    Http200 = Proc.new {|env| [200, {}, {}]}
    Http404 = Proc.new {|env| [404, {}, {}]}

    # rack middleware to convert body to JSON
    class BodyToJson
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        headers['Content-Type'] = 'application/json'
        [status, headers, body.to_json]
      end
    end

    # rack middleware to add version to body  
    class Version
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)

        [status, headers, 
         body.merge({
          "cloudwork.core.version"  => VERSION,
          "cloudwork.core.build"    => BUILD
          })
        ]

      end
    end

  end
end