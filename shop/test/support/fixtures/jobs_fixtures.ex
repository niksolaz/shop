defmodule Shop.JobsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Jobs` context.
  """

  @doc """
  Generate a job.
  """
  def job_fixture(attrs \\ %{}) do
    {:ok, job} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~U[2025-03-10 09:44:00Z],
        is_actual_present: true,
        logo: "some logo",
        name: "some name",
        role: "some role",
        start_date: ~U[2025-03-10 09:44:00Z]
      })
      |> Shop.Jobs.create_job()

    job
  end
end
