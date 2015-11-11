class Player < ActiveRecord::Base

  def dead
    if self.name == 'Jackie Chan'
      return 'Wax on...wax off...'
    elsif self.name == 'Harry Potter'
      return 'Congratulations, you just ruined millions of childhoods.'
    elsif self.name == 'Diana Nyad'
      return 'The world has one less amazingly powerful woman. Great job.'
    elsif self.name == 'Kanye West'
      return 'All the lights....went out.'
    elsif self.name == 'Beyonce'
      return 'If you liked it, you shoulda put a gravestone on it?'
    else
      return 'No need for the hemlock.'
    end
  end
end
