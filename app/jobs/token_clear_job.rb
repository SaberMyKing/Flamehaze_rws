class TokenClearJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p 'helloworld'
    # Do something later
  end
end
