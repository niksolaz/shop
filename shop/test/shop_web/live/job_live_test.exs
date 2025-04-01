defmodule ShopWeb.JobLiveTest do
  use ShopWeb.ConnCase, async: true

  import Shop.JobsFixtures

  test "displays job details", %{conn: conn} do
    job = job_fixture()
    {:ok, job_live, html} = live(conn, ~p"/jobs-live")

    assert html =~ job.name
    assert html =~ "- Likes: 0"

    html = render_click(job_live, :like, %{"id" => to_string(job.id)})
    assert html =~ "- Likes: 1"

    html = render_click(job_live, :dislike, %{"id" => to_string(job.id)})
    assert html =~ "- Likes: 0"
  end
end
