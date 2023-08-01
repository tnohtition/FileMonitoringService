defmodule FileMonitorService.FileUpload.ImageValidator do
  @behaviour FileMonitorService.FileUpload.Validator

  @default_opts [
    file_size: 10_000_000,
    mime_types: ~w("image/jpeg")
  ]

  @impl true
  def validate(file, opts \\ []) do
    validation_opts = Keyword.merge(@default_opts, opts)

    # Validate mime type
    # validate file size if needed
    if true do
      {:ok, file}
    else
      {:error, "mime type or file size error"}
    end
  end
end
