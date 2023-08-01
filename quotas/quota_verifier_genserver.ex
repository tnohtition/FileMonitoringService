defmodule FileMonitorService.Quotas.QuotaVerifierGenServer do
  use GenServer
  alias FileMonitorService.Quotas

  # Client
  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def exceed?(user_id) do
    if {found, quota_limit, quota_usage} = lookup(user_id) do
      quota_usage > quota_limit
    else
      true
    end
  end

  def request(user_id) do
    if {found, quota_limit, quota_usage} = lookup(user_id) do
      {quota_limit, quota_usage}
    else
      case Quotas.get_quota(user_id) do
        {:ok, quota} -> {quota.limit, 0}
        _ -> nil
      end
    end
    |> case do
      {quota_limit, quota_usage} ->
        :ets.insert(:quota_usages, {user_id, quota_limit, quota_usage + 1})

      _ ->
        Logger.log("There is a user without quota")
    end
  end

  def lookup(user_id) do
    case :ets.lookup(:quota_usages, user_id) do
      [found | _] -> found
      _ -> nil
    end
  end

  # Server
  def init(_args) do
    :ets.new(:quota_usages, [:named_table, :public, :set])
    {:ok, []}
  end
end
