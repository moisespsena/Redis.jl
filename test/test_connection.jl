using Redis
using Base.Test
include("test_guard.jl")

c = Connection()

send_command(c, "FLUSHDB")
@test read_response(c) == "OK"

send_command(c, "SET", "foo", 4.53)
@test read_response(c) == "OK"

send_command(c, "GET", "foo")
@test read_response(c) == "4.53"

list = {1, 'a', 2, 'b'}
for i = 1:length(list)
  send_command(c, "RPUSH", "bar", list[i])
  @test read_response(c) == i
end

send_command(c, "LRANGE", "bar", 0, -1)
@test read_response(c) == {"1", "a", "2", "b"}

send_command(c, "FLUSHDB")
@test read_response(c) == "OK"

disconnect(c)
@test Base.StatusClosed == c.sock.status
