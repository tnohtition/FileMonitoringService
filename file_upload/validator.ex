defmodule FileMonitorService.FileUpload.Validator do
  @callback validate(file) :: {:ok, map} | {:error, String.t()}
end
