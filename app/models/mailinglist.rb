# -*- encoding : utf-8 -*-
class Mailinglist < ActiveRecord::Base
  acts_as_xlsx

  set_primary_key :id
  validates :email, :presence => true, :uniqueness => true
end
