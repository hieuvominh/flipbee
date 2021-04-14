class TrendingCalculateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TrendingCalculateJob.perform_later guest
  end
end
