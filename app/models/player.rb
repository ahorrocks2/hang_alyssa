class Player < ActiveRecord::Base

  def warning
    if self.name == 'Einstein'
      return 'Will there be a theory of relativity?'
    elsif self.name == 'Harry Potter'
      return 'Avadaaaaa...'
    elsif self.name == 'Diana Nyad'
      return 'This woman tried to swim from Florida to Cuba 5 times...'
    elsif self.name == 'Will Smith'
      return 'Men In Black...'
    elsif self.name == 'Santa'
      return 'Down through the Chimney came...'
    else
      return 'Whats for dinner?'
    end
  end

  def dead
    if self.name == 'Einstein'
      return 'No.'
    elsif self.name == 'Harry Potter'
      return 'Kedavra!'
    elsif self.name == 'Diana Nyad'
      return 'And she never made it. The world has one less amazing woman.'
    elsif self.name == 'Will Smith'
      return 'Never came back.'
    elsif self.name == 'Santa'
      return 'Nothing.'
    else
      return 'Hemlock.'
    end
  end
end
