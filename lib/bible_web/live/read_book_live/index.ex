defmodule BibleWeb.ReadBookLive.Index do
  use BibleWeb, :live_view
  alias Bible.Bibles
  # alias Bible.Bibles.Book

  @impl true
  def mount(params, _session, socket) do
    IO.inspect(params, label: "Params")
    book_id = params["book_id"]

    chapter_id = 1

    verses = Bibles.list_verses_by_book(book_id)

    books = Bibles.list_books()

    selected_book = books |> Enum.find(&(&1.id == String.to_integer(book_id || "0"))) |> IO.inspect(label: "Selected Book")

    old_testaments = books |> Enum.filter(&(&1.testament_reference_id == 1))
    new_testaments = books |> Enum.filter(&(&1.testament_reference_id == 2))

    chapters = verses |> Enum.map(& &1.chapter) |> Enum.uniq() |> Enum.sort() |> IO.inspect(label: "Chapters")
    count_chapters = length(chapters)
    verses_by_chapter = verses |> Enum.filter(&(&1.chapter == chapter_id))

    {:ok,
     assign(socket,
       verses: verses,
       chapters: chapters,
       count_chapters: count_chapters,
       old_testaments: old_testaments,
       new_testaments: new_testaments,
       selected_book_id: book_id,
       selected_chapter_id: chapter_id,
       selected_book: selected_book,
       verses_by_chapter: verses_by_chapter,
       page_title: selected_book.name
     )}

    # {:ok, stream(socket, :books, Bibles.list_books())}
  end

  @impl true
  def handle_event("select_book", %{"book_id" => book_id}, socket) do
    IO.inspect(book_id, label: "Selected Book ID")

    # Redireciona para a página com o nome do livro
    {:noreply, push_navigate(socket, to: ~p"/read_book/#{book_id}")}
  end

  def handle_event("select_chapter", %{"id" => chapter_id}, socket) do
    IO.inspect(chapter_id, label: "Selected Chapter ID")
    verses = socket.assigns.verses |> Enum.filter(&(&1.chapter == String.to_integer(chapter_id)))


    {:noreply, assign(socket, verses_by_chapter: verses, selected_chapter_id: String.to_integer(chapter_id))}
  end

  def handle_event("next_chapter", _value, socket) do
    next_chapter_id = socket.assigns.selected_chapter_id + 1
    IO.inspect(next_chapter_id, label: "Next Chapter ID")

    if next_chapter_id <= socket.assigns.count_chapters do
      verses = socket.assigns.verses |> Enum.filter(&(&1.chapter == next_chapter_id))

      {:noreply,
       assign(socket,
         verses_by_chapter: verses,
         selected_chapter_id: next_chapter_id
       )}
    else
      {:noreply, socket}
    end
  end

  def handle_event("previous_chapter", _value, socket) do
    previous_chapter_id = socket.assigns.selected_chapter_id - 1

    if previous_chapter_id >= 1 do
      verses = socket.assigns.verses |> Enum.filter(&(&1.chapter == previous_chapter_id))

      {:noreply,
       assign(socket,
         verses_by_chapter: verses,
         selected_chapter_id: previous_chapter_id
       )}
    else
      {:noreply, socket}
    end
  end
end
