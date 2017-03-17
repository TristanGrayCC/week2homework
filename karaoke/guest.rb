class Guest

  attr_reader :name, :monie, :fav_song

  def initialize(name, monie, fav_song)
    @name = name
    @monie = monie
  end

  def pay_money(amount)
    @monie -= amount
  end

end
