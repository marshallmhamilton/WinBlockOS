local Shape = {
    ShapeTypes = {
        "Block"
    }

}

function Shape.DrawSquare(x,y,scale)
    term.drawPixels(x,y,colors.white,scale,scale)
end

return Shape





