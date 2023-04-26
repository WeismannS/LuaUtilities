
# Lua Utilities

Collection of Functions that Lua lack, implemented from javascript, Python..etc...

Adds a Metatable that implements 
## Functions
  ### Table
  To not overwrite any methods of the `table` object, This Library creates a metatable so the only way to use these functions is to
  ```lua
   local t = T({})
   local children = T(game.Players:GetChildren())
  ```
- :find(<F>)  **Finds and returns the first element that fulfils condition provided**
- :reverse() **reverses the order of the table, table musn't contain properties** 
- :filter(<F>) **returns a new table that contains element that fulfils the condition provided**
- :concat(<table>...) **returns a new table that contains elements of all the Table arguments provided**
- :forEach(<F>) **Similiar to how Luau table.foreach() behaves, iterates over the table and runs the provided functions**
- :map(<F>) **creates a new table populated with the results of calling a provided function on every element in the calling table.**
- :clone(<self>) **Returns a deepcopy of the table**
- :values()  **Returns a table that contains the values** 
- :length()  **Returns the size of the table taking in account properties in contract to #table**
  
### Global
printf(<T>)  **--Checks if argument if table and and will print all descendants** 
(not the best implemenation yet, it's WIP)

### String
 :split(delimeter)  **Similiar to the javascript counterpart,Devides the string to multiple substrings and returns an array split by the delimeter**
## Contributing

Contributions are always very welcome!



## Usage/Examples

```lua
local users = T({
     {
        name = "john",
        age = 23
    },
     {
        name = "maria",
        age = 20
    },
     {
        name = "Nadiah",
        age = 25
    },
     {
        name = "Introvert",
        age = 16
    },
    {
        name = "Alex",
        age = 17
    }
})
local minor = users:find(function(user)
 return user.age < 18
end)
local notAllowedUsers = users:filter(function(e)
     return e.age< 18
end)
local onlyAdults = users:map(function(e)
    if e.age<18 then return nil end
    return e
end)

printf(onlyAdults)

```

