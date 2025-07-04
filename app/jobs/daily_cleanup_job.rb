class DailyCleanupJob < ApplicationJob
  queue_as :default

  def perform
    Url.expired.destroy_all
  end
end
