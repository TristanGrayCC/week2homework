class Club

attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

  def collect_cash(amount)
    @cash += amount
  end

end
