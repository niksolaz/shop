defmodule Shop.JobsTest do
  use Shop.DataCase

  alias Shop.Jobs

  describe "jobs" do
    alias Shop.Jobs.Job

    import Shop.JobsFixtures

    @invalid_attrs %{name: nil, description: nil, role: nil, logo: nil, is_actual_present: nil, start_date: nil, end_date: nil}

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Jobs.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Jobs.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      valid_attrs = %{name: "some name", description: "some description", role: "some role", logo: "some logo", is_actual_present: true, start_date: ~U[2025-03-10 09:44:00Z], end_date: ~U[2025-03-10 09:44:00Z]}

      assert {:ok, %Job{} = job} = Jobs.create_job(valid_attrs)
      assert job.name == "some name"
      assert job.description == "some description"
      assert job.role == "some role"
      assert job.logo == "some logo"
      assert job.is_actual_present == true
      assert job.start_date == ~U[2025-03-10 09:44:00Z]
      assert job.end_date == ~U[2025-03-10 09:44:00Z]
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", role: "some updated role", logo: "some updated logo", is_actual_present: false, start_date: ~U[2025-03-11 09:44:00Z], end_date: ~U[2025-03-11 09:44:00Z]}

      assert {:ok, %Job{} = job} = Jobs.update_job(job, update_attrs)
      assert job.name == "some updated name"
      assert job.description == "some updated description"
      assert job.role == "some updated role"
      assert job.logo == "some updated logo"
      assert job.is_actual_present == false
      assert job.start_date == ~U[2025-03-11 09:44:00Z]
      assert job.end_date == ~U[2025-03-11 09:44:00Z]
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_job(job, @invalid_attrs)
      assert job == Jobs.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Jobs.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Jobs.change_job(job)
    end
  end
end
