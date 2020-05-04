class Recipe
  attr_reader :name, :description, :prep_time, :done

  def initialize(name, desc, prep_time, done = false)
    # if nothing is passed to done, it is false by default
    @name = name
    @description = desc
    @prep_time = prep_time
    @done = done
  end

  def mark_as_done!
    @done = true
  end

end
