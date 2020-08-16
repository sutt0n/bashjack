defmodule DeckTest do
  use ExUnit.Case
  doctest Deck

  test "creates a deck of 52 cards" do
    assert length(Deck.create_deck()) === 52
  end

  test "shuffles a deck of cards" do
    deck = Deck.create_deck()
    first_card = hd(deck)
    second_card = Enum.at(deck, 1)
    third_card = Enum.at(deck, 2)
    fourth_card = Enum.at(deck, 3)

    # check consecutive card values
    # e.g. elem({"2", "S"}, 0) -> {"2"}
    assert elem(first_card, 0) === elem(second_card, 0)
    assert elem(second_card, 0) === elem(third_card, 0)
    assert elem(third_card, 0) === elem(fourth_card, 0)

    # shuffle
    shuffled_deck = Deck.shuffle_deck(deck)
    first_card = hd(shuffled_deck)
    second_card = Enum.at(shuffled_deck, 1)
    third_card = Enum.at(shuffled_deck, 2)
    fourth_card = Enum.at(shuffled_deck, 3)

    # shuffled deck shouldn't technically have 3 consecutive cards with same values
    assert elem(first_card, 0) !== elem(second_card, 0)
    assert elem(second_card, 0) !== elem(third_card, 0)
    assert elem(third_card, 0) !== elem(fourth_card, 0)
  end

  test "deals a card from an unshuffled deck" do
    deck = Deck.create_deck()
    [card1, deck] = Deck.deal(deck)

    # will always be {"2", "♠"} if unshuffled
    assert card1 === {"2", "♠"}
  end

  test "deals two cards from an unshuffled deck" do
    deck = Deck.create_deck()
    [hand, deck] = Deck.deal_two(deck)

    # will always be [{"2", "♠"}, {"2", "♥"}] if unshuffled
    assert hand === [{"2", "♠"}, {"2", "♥"}]
  end
end
