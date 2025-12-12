# RingBufferLuau
Simple ring buffer for luau

# Example Usage

```lua
--!strict

local RingBuffers = require(game.ReplicatedStorage.RingBuffer)

type RingBuffer<T> = RingBuffers.RingBuffer<T>

local R = RingBuffers.new(3) :: RingBuffer<string>

R:push("firstvalue")
R:push("secondvalue")
R:push("thirdvalue")
R:push("fourthvalue")

print(R:readOldest())
print(R:readNewest())

--[[Output:
	secondvalue
	fourthvalue
]]--
```
