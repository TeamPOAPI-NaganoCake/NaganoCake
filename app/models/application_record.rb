class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def tax_include_price
    tax = 0.1
    (non_tax_price * (1 + tax)).floor.to_s(:delimited)
  end
end
