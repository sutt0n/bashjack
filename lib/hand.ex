defmodule Hand do
  def is_face_card({value, _}), do: String.contains?("JQK", value)

  def card_value(card, acc) do
    face_card = Hand.is_face_card(card)

    case card do
      {"A", _} when acc > 10 -> 1
      {"A", _} when acc <= 10 -> 11
      _ when face_card -> 10
      _ -> card |> elem(0) |> String.to_integer()
    end
  end

  def sum_value(hand) do
    left = List.foldl(hand, 0, fn card, acc -> Hand.card_value(card, acc) + acc end)
    right = List.foldr(hand, 0, fn card, acc -> Hand.card_value(card, acc) + acc end)

    min(left, right)
  end
end
