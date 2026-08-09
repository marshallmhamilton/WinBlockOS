local Shape = {
    ShapeTypes = {
        "Block"
    }

}

function Shape.DrawSquare(x,y,scale)
    term.drawPixels(x,y,255,scale,scale)
end

return Shape





