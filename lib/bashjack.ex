import Enum

defmodule Bashjack.CLI do
  def main(_argv) do
    # name = ExPrompt.string_required("What is your name?")

    # ExPrompt.string(
    #   "Hello, #{name}! Welcome to Bashjack, an interactive blackjack game in your bash terminal."
    # )

    deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
    hand = deck |> shuffle |> take(2)

    # refactor: determine if hand has an Ace to check high or not
    [low, high] = [count_hand(hand), count_hand(hand, true)]

    ExPrompt.string("Hand: #{hand}")
    ExPrompt.string("Hand is: #{to_string(low)} #{to_string(high)}")
  end

  def card_value(value, high_ace \\ false) do
    case value do
      {"Q", "J", "T", "K"} ->
        10

      {"A"} ->
        if high_ace == true, do: 11, else: 1

      _ ->
        ExPrompt.string("Converting #{value}")
        String.to_integer(value)
    end
  end

  def count_hand(hand, high_ace \\ false) do
    reduce(hand, 0, fn x, acc -> card_value(List.to_string(tl(x)), high_ace) + acc end)
  end
end
