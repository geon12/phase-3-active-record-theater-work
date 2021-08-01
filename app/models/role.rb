class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map {|audition| audition.actor}
  end

  def locations
    self.auditions.map {|audition| audition.location}
  end

  def lead
    audition = self.auditions.find_by(hired: true)
    if audition
        audition
    else
        'no actor has been hired for this role'
    end
  end

  def understudy
    hired = Audition.where(role_id: self.id, hired: true)

    if hired.size > 1
        hired[1]
    else
        'no actor has been hired for understudy for this role'
    end
  end
end