defmodule DeckTest do
  use ExUnit.Case
  doctest Deck

  test "creates a deck of 52 cards" do
    assert length(Deck.create_deck()) === 52
  end

  test "shuffles a deck of cards" do
    deck = Deck.create_deck()
    sorted_cards = deck |> Enum.slice(0, 4)

    # check consecutive card values
    # e.g. elem({"2", "S"}, 0) -> {"2"}
    assert sorted_cards === [{"2", "♠"}, {"2", "♥"}, {"2", "♦"}, {"2", "♣"}]

    # shuffle
    shuffled_cards = Deck.create_deck() |> Deck.shuffle_deck() |> Enum.slice(0, 4)

    # shuffled deck shouldn't technically have 3 consecutive cards with same values
    assert shuffled_cards !== sorted_cards
  end

  test "deals a card from an unshuffled deck" do
    deck = Deck.create_deck()
    [card1, _] = Deck.deal(deck)

    # will always be {"2", "♠"} if unshuffled
    assert card1 === {"2", "♠"}
  end

  test "deals two cards from an unshuffled deck" do
    deck = Deck.create_deck()
    [hand, _] = Deck.deal_two(deck)

    # will always be [{"2", "♠"}, {"2", "♥"}] if unshuffled
    assert hand === [{"2", "♠"}, {"2", "♥"}]
  end
end
