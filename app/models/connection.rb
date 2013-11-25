class Connection

  @@attributes = [:id,
                  :first_name,
                  :last_name,
                  :headline,
                  :location,
                  :picture_url]

  def self.attributes
    @@attributes
  end

  attr_accessor *@@attributes

  attr_accessor :invitation

  def invited?
    !invitation.nil?
  end

  def accepted?
    invitation and invitation.accepted_at?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def <=>(other)
    [last_name, first_name] <=> [other.last_name, other.first_name]
  end
end
