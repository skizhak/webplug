defmodule Webplug do
  def init(default_opts) do
    IO.puts "starting up Webplug..."
    default_opts
  end

  def call(conn, _opts) do
    route(conn.method, conn.path_info, conn)
  end

  def route("GET", ["hello"], conn) do
    conn |> Plug.Conn.send_resp(200, "Hello World!")  
  end
  
  def route("GET", ["users", user_id], conn) do
    conn |> Plug.Conn.send_resp(200, "User: #{user_id}")  
  end
  
  def route(method, path_info, conn) do
    conn |> Plug.Conn.put_resp_header("Server", "Skizhak") |> Plug.Conn.send_resp(404, "Not found!")
  end
end
