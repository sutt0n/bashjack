defmodule Bashjack do
  @spec main(list) :: no_return()
  def main(_argv) do
    # chip_count = 50
    # IO.puts("\nWelcome to Bashjack. You have #{chip_count} chips.")
    # deck = Deck.create_deck() |> Deck.shuffle_deck()
    # Bashjack.game(deck, chip_count)
    IO.puts("\nWelcome to Bashjack.")
    Bashjack.init_prompt()
  end

  def init_prompt() do
    init_action =
      IO.gets(
        "Press [1] for singleplayer, [2] to connect to multiplayer, and [3] to host multiplayer: "
      )
      |> String.trim_trailing()
      |> String.to_integer()

    case init_action do
      is_integer when init_action === 1 ->
        IO.puts("\nWelcome to Bashjack. You have 50 chips.")
        deck = Deck.create_deck() |> Deck.shuffle_deck()
        Bashjack.game(deck, 50)

      is_integer when init_action === 2 ->
        IO.puts("\nConnecting... (TODO)")

        address =
          IO.gets("\nEnter the lobby address and port (e.g. 127.0.0.1:7331): ")
          |> String.trim_trailing()

        host = Client.get_addr(address)
        port = Client.get_port(address)
        Client.send_data("A new player has joined.", host, port)

      is_integer when init_action === 3 ->
        Server.launch_server()

      _ ->
        IO.puts("\nPlease enter a valid option.")
        Bashjack.init_prompt()
    end
  end

  @spec game(list(), number()) :: no_return()
  def game(deck, chip_count) do
    bet = IO.gets("Place your bet: ") |> String.trim_trailing() |> String.to_integer()

    case bet do
      is_integer when bet > chip_count ->
        IO.puts("\nYour bet is higher than your chip count.")
        Bashjack.game(deck, chip_count)

      is_integer when bet > 0 ->
        # deal player and house
        [player_hand, deck] = Deck.deal_two(deck)
        [house_hand, deck] = Deck.deal_two(deck)

        Bashjack.action_prompt(deck, player_hand, house_hand, bet, chip_count)

      _ ->
        IO.puts("\nPlease enter a number greater than zero.")
        Bashjack.game(deck, chip_count)
    end
  end

  @spec action_prompt(any, any, any, any, any) :: no_return()
  def action_prompt(deck, player_hand, house_hand, bet, chip_count) do
    Hand.print_hand(player_hand)
  end
end
