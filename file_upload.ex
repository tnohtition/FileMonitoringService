defmodule FileMonitorService.FileUpload do
  def upload(file, opts \\ []) do
    case validate(file) do
      {:ok, _} ->
        # Doing next steps here

      {:error, msg} -> {:error, msg}
    end
  end

  defp validate(file) do
    # Check if the file is image so we'll use the ImageValidator
    if is_image = true do
      FileMonitorService.FileUpload.ImageValidator.validate(file)
    end
  end
end
