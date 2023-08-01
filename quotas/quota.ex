defmodule FileMonitorService.Quotas.Quota do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotas" do
    belongs_to(:user, FileMonitorService.User)
    field(:limit, :integer)
    field(:begin_at, :naive_datetime)
    field(:end_at, :naive_datetime)
  end
end
