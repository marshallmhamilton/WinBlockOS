local Shape = {
    ShapeTypes = {
        "Block"
    }

}

function Shape.DrawBox(start,size,color)
   -- if size.x == 1 then error() end
    term.drawPixels(start.x,start.y,color,size.x,size.y)
end

return Shape





