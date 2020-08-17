defmodule Bashjack do
  def main(_argv) do
    chip_count = 50
    IO.puts("\nWelcome to Bashjack. You have #{chip_count} chips.")
    deck = Deck.create_deck() |> Deck.shuffle_deck()
    Bashjack.game(deck, chip_count)
  end

  def game(deck, chip_count) do
    bet = IO.gets("Place your bet: ") |> String.rstrip() |> String.to_integer()

    case bet do
      is_integer when bet > chip_count ->
        IO.puts("\nYour bet is higher than your chip count.")
        Bashjack.game(chip_count)

      is_integer when bet > 0 ->
        # deal players
        [player_hand, deck] = Deck.deal_two(deck)
        [house_hand, deck] = Deck.deal_two(deck)

        IO.puts("\nDealer's hand is:")
        Hand.print_hand(house_hand)

        IO.puts("\nYour hand is:")
        Hand.print_hand(player_hand)

      # game loop here

      _ ->
        IO.puts("\nPlease enter a number greater than zero.")
        Bashjack.game(deck, chip_count)
    end
  end
end
