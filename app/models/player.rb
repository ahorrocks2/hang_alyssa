class Player < ActiveRecord::Base

  def dead
    if self.name == 'Jackie Chan'
      return 'Biggest regret: The Tuxedo'
    elsif self.name == 'Harry Potter'
      return 'Millions of childhoods are ruined.'
    elsif self.name == 'Diana Nyad'
      return 'Congratulations! You actually won because powerful women are invincible.'
    elsif self.name == 'Kanye West'
      return 'Last words: I regret jilting Taylor Swift.'
    elsif self.name == 'Beyonce'
      return 'Should have put a ring on it.'
    else
      return 'At least its quicker than hemlock.'
    end
  end
end
