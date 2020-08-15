defmodule Bashjack.CLI do
  def main(_argv) do
    name = ExPrompt.string_required("What is your name?")

    ExPrompt.string("Hello, #{name}!")
  end
end
