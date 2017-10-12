defmodule Exmdb.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # supervisor(Exmdb.Endpoint, []),
      # worker(Exmdb.KeyValueStore, []),
    ]

    opts = [strategy: :one_for_one, name: Exmdb.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
