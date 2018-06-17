defmodule Feature do
  import FeatureFlags

  deffeature :sandbox, s(a,b) do
    {:sandbox, a + b}
  end

  deffeature :prod, s(a,b) do
    {:prod, a + b}
  end

  def x, do: :hi
end
