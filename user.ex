defmodule FileMonitorService.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:password, :string, virtual: true, redact: true)
    field(:hashed_password, :string, redact: true)

    has_many(:quotas, FileMonitorService.Quota)
    has_many(:quota_usages, FileMonitorService.QuotaUsage)
  end
end
