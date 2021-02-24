class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def tax
    1.1
  end
    
  def tax_include_price
    (non_tax_price * tax).floor
  end
end
