defmodule FeatureFlagsTest do
  use ExUnit.Case
  doctest FeatureFlags

  test "greets the world" do
    assert FeatureFlags.hello() == :world
  end
end
