util = table
function T(t)
    return setmetatable(t, {__index = util})
end
local _ = setreadonly and setreadonly(util,false)
function util.map(self,func)
    local newT = T{}
    for i,v in pairs(self) do
        newT[i] = func(v)
    end
    return newT
end

function util.concat(self,...)
    local newT = T{};
    local tables = {...}
    for i,v in pairs(self) do
        newT[i] = v
    end
    for i,t in pairs(tables) do
        for i2,v in pairs(t) do
            util.insert(newT,v)
        end
    end
    return newT
end

function util.foreach(self,func)
    for i,v in pairs(self) do
        func(i,v) 
    end
end

function util.find(self,func)
    for i,v in pairs(self) do
        if func(self[i],i) then
            return v
        end
    end
end

function util.reverse(self)
    local newT = T{}
    for i=#self,1,-1 do
        table.insert(newT,self[i])
    end
    return newT
end

function util.filter(self,func)
    local newT = T{} 
    for i,v in pairs(self) do
        if func(v,i) then
            table.insert(newT,v)    
        end 
    end
    return newT
end

function util.values(self,func)
    local newT = T{}
    function loop(t)
        for i,v in pairs(t) do
            if type(v) == "table" then
                loop(v)
            else 
                  newT[i] = v
            end
        end
    end
    loop(self)
    return newT
end

function util.clone(t)
  local newT = T{}
  for i,v in pairs(t) do
    if type(v) == "table" then
      newT[i] = util.clone(v)
    else
      newT[i] = v
    end
  end
  return newT
end

function printf(v)
    local space = ""

    local function printAll(v)
        if type(v) ~= "table" then
            print(space .. tostring(v)..",")
        else
            print(space .. "{")
            space = space .. " "
            for i2, v2 in pairs(v) do
                print(space .. tostring(i2) .. " = ")
                printAll(v2)
            end
            space = space:sub(1, -3)
            print(space .. "}")
        end
    end
    printAll(v)
end

function util.length(self)
      local count = 0    
      for i,v in pairs(self) do
        count = count+1
      end
      return count
end


