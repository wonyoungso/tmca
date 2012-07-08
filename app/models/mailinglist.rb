# -*- encoding : utf-8 -*-
class Mailinglist < ActiveRecord::Base
  set_primary_key :id
  validates :email, :presence => true, :uniqueness => true
end
