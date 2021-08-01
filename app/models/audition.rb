class Audition < ActiveRecord::Base
  belongs_to :role

  def callback
    self.hired = true
  end
end