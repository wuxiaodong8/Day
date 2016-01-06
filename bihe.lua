--闭合函数
-- function count()
-- 	local i = 0
-- 	return function (  )
-- 		i=i+1
-- 		return i;
-- 	end
-- end
-- local func = count();
-- print(func())
-- print(func())
-- print(count()())
-- print(count()())

--尾调用(不会保留栈信息（主要作用实现状态机）)
-- local eat
-- local drink
-- eat=function (  )
-- 	print("eat...")
-- 	drink();
-- end
-- drink=function (  )
-- 	local  i = 0
-- 	i= i+1
-- 	print(i)
-- end
-- eat()
-- eat()
--[[
local _table = {"a","b","c","d"}
function DieDaiQi( t )
	local i = 0
	return function (  )
		i=i+1
		return t[i]
	end
end
--迭代器
local iter = DieDaiQi(_table)
while true do
	local value =iter()
	if(value==nil) then
		break;
	end 
	print(value)
end 
]]
-- local _table = {"a","b","c","d"}
-- function DieDaiQi( t )
-- 	local i = 0
-- 	return function (  )
-- 		i=i+1
-- 		if i>#t then
-- 			return t[i]
-- 		end 
-- 		return i, t[i]
-- 	end
-- end
-- for k,v in DieDaiQi(_table) do
-- 	print(k,v)
-- end

--错误处理
-- local a = 0
-- if a==0 then
-- 	error("除数不能为0")
-- else
-- 	local m = 0
-- 	local k = m/a
-- end 

-- a=1
-- --如果表达式为true，不抛出异常，否则抛出异常
-- assert(a == 0, "除数不能为0")

--pcall函数来捕获异常
-- function test()
--     print(a[1]);
-- end
-- if pcall(test) then
-- 	print("正常"); 
-- else
-- 	print("函数出错了,我正在帮你处理"); 
-- end

--pcall函数返回值有两个
-- function test()
--     print(a[1]);
-- end
-- local status, err = pcall(test);
-- if status then
-- 	print("正常,呵呵"); 
-- else
-- 	print("哎,函数出错了,我正在帮你处理");
-- 	print(err);
-- end

--loadfile("a.lua")
-- dofile("a.lua")
-- require("a")
-- require("a")

--创建一个协同程序
-- local co = coroutine.create(function (  )
-- 	print("hello coroutine")
-- 	print("world coroutine")
-- end)

-- --默认协同程序状态
-- print(type(co))
-- print(coroutine.status(co))
-- --开启协同程序
-- coroutine.resume(co)

-- print(coroutine.status(co))
--协同程序挂起  yield
-- local co = coroutine.create(function()
--     for i = 1, 3, 1 do
-- 		print("你好,协同程序" .. i);
--         coroutine.yield();
--     end
-- end);
--     coroutine.resume(co);
--     print(coroutine.status(co));
--     coroutine.resume(co);
--     print(coroutine.status(co));
--     coroutine.resume(co);
--     print(coroutine.status(co));
--     coroutine.resume(co);
--     print(coroutine.status(co));

-- local co = coroutine.create(function (  )
-- 	a=10
-- 	if a==0 then
-- 		error("除数不能为0")
-- 	else
-- 		print(a)
-- 	end 
-- end)
-- --resume有两个返回值 1.程序是否正常执行 2.错误信息
-- 	local result,message = coroutine.resume(co)
-- 	print(result)
-- 	print(message)

-- local co = coroutine.create(function ( name, a )
-- 	print(name)
-- 	print(a)
-- end)
-- coroutine.resume(co,"realy",100)
--yield(挂起)函数的参数可以传递到resume的第二个返回 值里
-- local co = coroutine.create(function(name)
--     print(name)
--     coroutine.yield("yield param")
-- end)
-- local result, msg = coroutine.resume(co, "resume param");
--     print("msg:" .. msg);

--resume：第二个返回值是yield参数

local co = coroutine.create(function ( name )
	for i=1,2,1 do
		print(name)
		print("co=" .. coroutine.yield("Im yield"))
	end
end)
for i=1,2,1 do
	print("第" .. i .. "次")
	local result,message = coroutine.resume(co,"realy")
	print("message=" .. message)
end
