--!strict

local RingBufferManager = {}

RingBufferManager.__index = RingBufferManager

export type RingBuffer<T> = typeof(setmetatable({} :: {
	head: number,
	capacity : number,
	size: number,
	[number]: T,
}, RingBufferManager
))

function RingBufferManager.new<V>(capacity: number): RingBuffer<V>
	local rbuffer = {}
	rbuffer.head = 0
	rbuffer.capacity = capacity
	rbuffer.size = 0
	
	
	return setmetatable(rbuffer, RingBufferManager)
end

function RingBufferManager:push<V>(value: V)
	local self = self :: RingBuffer<V>
	
	self.head = (self.head % self.capacity) +1 
	self[self.head] = value
	
	if self.size < self.capacity then
		self.size += 1
	end
	
	
end

function RingBufferManager:replaceAt(index: number, value)
	
	self[index]  = value
	
end

function RingBufferManager:readNewest(): any	
	
	return self[self.head]
end

function RingBufferManager:readOldest() : any
	
	
	return self[(self.head % self.size) +1 ]
end

function RingBufferManager:readAt(index: number) : any
	

	return self[index]
end


return RingBufferManager
