local util = require 'util'
local fun = require 'functional'

local function test()
    local testcases = {
        {input = '', expected = {}},
    }
    for _,t in ipairs(testcases) do
        local actual = {}
        local desc = string.format("Input: %s, Expected: %s, Actual: %s", t.input, util.dump(t.expected), util.dump(actual))
        assert(util.are_lists_equal(actual, t.expected), desc)
    end
end

local function part1()
    for l in io.lines(arg[1]) do
    end
    return 0
end

local p1 = part1()
print('Part 1: ' .. p1)
assert(p1 == 0)

local function part2()
    for l in io.lines(arg[1]) do
    end
    return 0
end

local p2 = part2()
print('Part 2: ' .. p2)
assert(p2 == 0)
