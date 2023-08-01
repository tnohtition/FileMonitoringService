defmodule FileMonitorService.Quotas.QuotaUsage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quota_usage_tracking" do
    belongs_to(:user, FileMonitorService.User)
    field(:usage, :integer)
    field(:inserted_at, :naive_datetime)
  end
end
