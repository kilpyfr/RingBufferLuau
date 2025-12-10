--!strict

local RingBufferManager = {}

local Buffers = {}


function RingBufferManager.new(capacity: number) : number
	local rbuffer = {}
	rbuffer.head = 0
	rbuffer.capacity = capacity
	rbuffer.size = 0
	
	Buffers[#Buffers + 1] = rbuffer
	
	return #Buffers
end

function RingBufferManager.push(bufferId: number, value)
	local buf = Buffers[bufferId]
	
	if not buf then return end
	
	buf.head = (buf.head % buf.capacity) +1 
	buf[buf.head] = value
	
	if buf.size < buf.capacity then
		buf.size += 1
	end
	
	
end


function RingBufferManager.readNewest<T>(bufferId: number): T
	local buf = Buffers[bufferId]
	
	return buf[buf.head]
end

function RingBufferManager.readOldest<T>(bufferId: number): T
	local buf = Buffers[bufferId]
	
	return buf[(buf.head % buf.size) +1 ]
end

function RingBufferManager.readAt<T>(bufferId : number, index: number): T
	local buf= Buffers[bufferId]

	return buf[index]
end


return RingBufferManager
