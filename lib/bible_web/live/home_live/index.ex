defmodule BibleWeb.HomeLive.Index do
  use BibleWeb, :live_view
  alias Bible.Bibles
  # alias Bible.Bibles.Book

  @impl true
  def mount(_params, _session, socket) do
    random_id = Enum.random(1..31_102)
    books = Bibles.list_books()
    verse = Bibles.get_verse!(random_id) |> IO.inspect(label: "Random Verse")
    old_testaments = books |> Enum.filter(&(&1.testament_reference_id == 1))
    new_testaments = books |> Enum.filter(&(&1.testament_reference_id == 2))


    {:ok, assign(socket, old_testaments: old_testaments, new_testaments: new_testaments, verse: verse)}
    # {:ok, stream(socket, :books, Bibles.list_books())}
  end

  @impl true
  def handle_event("select_book", %{"book_id" => book_id}, socket) do


    # Redireciona para a página com o nome do livro
    {:noreply, push_navigate(socket, to: ~p"/read_book/#{book_id}")}
  end
end
