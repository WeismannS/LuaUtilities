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
- :concat(<t>...) **returns a new table that contains elements of all the Table arguments provided**
- :forEach(<F>) **Similiar to how Luau table.foreach() behaves, iterates over the table and runs the provided functions**
- :map(<F>) **creates a new table populated with the results of calling a provided function on every element in the calling table.**
