class Bill < ActiveRecord::Base
  belongs_to :category

   cattr_reader :per_page
    @@per_page = 3

  
end
