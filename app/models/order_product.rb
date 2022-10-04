class OrderProduct < ApplicationRecord
  # belongs_to:order
  # belongs_to:item
  # enum making_status_method: {cannot_manufactured:0, waiting_production:1, production:2, completion_production:3 }
end
