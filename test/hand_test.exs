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
end
