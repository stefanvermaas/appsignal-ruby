module Appsignal
  class EventFormatter
    # @api private
    module ActiveRecord
      class SqlFormatter < Appsignal::EventFormatter
        def format(payload)
          [payload[:name], payload[:sql], SQL_BODY_FORMAT]
        end
      end
    end
  end
end

Appsignal::EventFormatter.register(
  "sql.active_record",
  Appsignal::EventFormatter::ActiveRecord::SqlFormatter
)
