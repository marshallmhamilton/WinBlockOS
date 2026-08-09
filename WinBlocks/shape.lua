local Shape = {
    ShapeTypes = {
        "Block"
    }

}

function Shape.DrawSquare(x,y,scale)
    term.drawPixels(x,y,"FFFFFF",scale,scale)
end

return Shape





