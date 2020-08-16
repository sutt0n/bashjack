defmodule Deck do
  @suits ["♠", "♥", "♦", "♣"]
  @values ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  def create_deck do
    for value <- @values, suit <- @suits, do: {value, suit}
  end

  def shuffle_deck(deck) do
    # todo: custom 7-time riffle sort?
    Enum.shuffle(deck)
  end

  def deal([card | deck]) do
    [card, deck]
  end

  def deal_two(deck) do
    [card1, deck] = deal(deck)
    [card2, deck] = deal(deck)
    [[card1, card2], deck]
  end
end
