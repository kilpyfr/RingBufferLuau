--!strict

local RingBuffers = require(path.to.RingBuffer)

local R= RingBuffers.new(3)

RingBuffers.push(R, "firstvalue")
RingBuffers.push(R, "secondvalue")
RingBuffers.push(R, "thirdvalue")

print(RingBuffers.readNewest(R)) --prints "thirdvalue"
print(RingBuffers.readOldest(R)) --prints "firstvalue"
