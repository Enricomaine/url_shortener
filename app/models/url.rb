class Url < ApplicationRecord
  validates :original, presence: true, format: URI::regexp(%w[http https])
  validates :short, uniqueness: true 

  before_create :generate_short_code

  def expired?
    created_at < 24.hours.ago
  end
  
  private 

  def generate_short_code
    self.short = loop do 
      code = SecureRandom.alphanumeric(6)
      break code unless Url.exists?(short: code)
    end
  end

end
