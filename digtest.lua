local function refuel()
    local fuel_before = turtle.getFuelLevel()
  
    for i = 1, 16 do
      if turtle.getItemCount(i) > 0 then
        turtle.select(i)
        turtle.refuel(64)
      end
    end
  
    return turtle.getFuelLevel() - fuel_before
end

local function digline()
    for i=1, 50 do
        turtle.dig()
        turtle.digUp()
        turtle.digDown()
        turtle.forward()
        refuel()
    end
end

local function movetonextline(side)
    if side == "right" then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
    elseif side == "left" then
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    end
end

for i=1, 50 do
    if i % 2 == 0 then
        digline()
        movetonextline("left")
    else
        digline()
        movetonextline("right")
    end
end