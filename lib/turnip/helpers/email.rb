module Turnip
  module Helpers
    module Email
      def send_emails
        # if we are async then queue them up and send then
        if ::ActiveJob::Base.queue_adapter.is_a? ActiveJob::QueueAdapters::TestAdapter
          email_jobs.each do |email_job|
            args = ActiveJob::Arguments.deserialize(email_job[:args])
            _class      = args[0].constantize
            _method     = args[1]
            _perform    = args[2]
            _args       = args[3..-1]

            perform_enqueued_jobs { _class.send(_method, *_args).send(_perform) }
          end
        end
      end


      private
      def email_jobs
        ::ActiveJob::Base.queue_adapter.enqueued_jobs.select do |job|
          job[:job] == ActionMailer::DeliveryJob
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include(Turnip::Helpers::Email, type: :feature)
end
