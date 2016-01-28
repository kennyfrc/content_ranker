class Content < ActiveRecord::Base
  default_scope { order('total_shares DESC') }
end
