defmodule FileMonitorService.Quotas do
  import Ecto.Query
  alias FileMonitorService.Repo
  alias FileMonitorService.Quota.Quota

  def get_quota(user_id) do
    now = DateTime.utc_now()

    if quota =
         Quota
         |> where(user_id: user_id)
         |> where([q], q.begin_at >= now)
         |> where([q], q.end_at <= now)
         |> Repo.all()
         |> List.first() do
      {:ok, quota}
    else
      {:error, :not_found}
    end
  end
end
