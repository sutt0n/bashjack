defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  test "determines if a card is a face card (Jack, Queen, or King)" do
    assert Hand.is_face_card({"J", ""}) === true
    assert Hand.is_face_card({"Q", ""}) === true
    assert Hand.is_face_card({"K", ""}) === true
    assert Hand.is_face_card({"A", ""}) === false
    assert Hand.is_face_card({"10", ""}) === false
  end

  test "sums the card values in the hand" do
    assert Hand.sum_value([{"2", "♠"}, {"2", "♥"}, {"2", "♦"}, {"2", "♣"}]) === 8
    assert Hand.sum_value([{"A", "♠"}, {"K", "♥"}]) === 21
    assert Hand.sum_value([{"A", "♠"}, {"9", "♥"}]) === 20
    assert Hand.sum_value([{"10", "♠"}, {"2", "♥"}, {"10", "♥"}]) === 22
    assert Hand.sum_value(Deck.create_deck()) === 340

    # this is why we check for folded from right and left
    assert Hand.sum_value([{"2", "♥"}, {"10", "♥"}, {"A", "♠"}]) === 13

    # on List.foldl, this comes out as 23 (List.foldr for the above statement)
    assert Hand.sum_value([{"A", "♠"}, {"2", "♥"}, {"10", "♥"}]) === 13
  end
end
