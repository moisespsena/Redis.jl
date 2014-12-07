#Redis.jl

Pure Julia implementation of a [Redis](http://redis.io) client, largely based on [redis-py](https://github.com/andymccurdy/redis-py).

## Usage

    using Redis
    client = redis(host="localhost", port=6379, db=0)

    # server info commands
    info(client)
    info(client, "clients")
    ping(client)
    dbsize(client)
    time(client)
    save(client)
    bgrewriteaof(client)
    bgsave(client)
    echo(client, "Hello!")
    flushall(client)
    flushdb(client)

    # basic key commands
    set(client, "pi", 3.14)
    exists(client, "pi")
    get(client, "pi")
    restore(client, "picopy", dump(client, "pi"))
    append(client, "pi", 159)
    incr(client, "one")
    decr(client, "one")
    del(client, "one")

    # many more to come...

Please refer to `test/test_{lists, sets, hashes}.jl` for documentation
on list, set, and hash operations.
