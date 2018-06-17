defmodule FeatureFlags do
  @moduledoc """
  This implements the macro `deffeature` that compiles the module differently depending on which flags are set in config:

  config :feature_flags,
    environment: [`flags`]
  """

  defmacro deffeature(namespace, {name, _, args} = definition, do: body) do
    environment = Application.get_env(:feature_flags, :environment)

    quote do
      if unquote(compile?(namespace, environment)) do
        Kernel.def unquote(definition) do
          unquote(body)
        end
      end
    end
  end

  defp compile?(namespace, environment) do
    !is_nil(namespace) and namespace in environment
  end
end
