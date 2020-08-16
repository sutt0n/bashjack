defmodule Hand do
  def is_face_card({value, _}), do: String.contains?("JQK", value)

  def sum_value([], acc), do: acc

  def sum_value([head | tail], acc) do
    face_card = Hand.is_face_card(head)

    case head do
      {"A", _} when acc > 10 ->
        Hand.sum_value(tail, 1 + acc)

      {"A", _} when acc <= 10 ->
        Hand.sum_value(tail, 11 + acc)

      _ when face_card ->
        Hand.sum_value(tail, 10 + acc)

      _ ->
        Hand.sum_value(tail, String.to_integer(elem(head, 0)) + acc)
    end
  end
end
