target = {}

function target.init()
    target.shadow = rtCreate(1024,1024,0,"depth","linear")
end
addEventHandler("onAppStart",target.init)

function target.getShadowTarget()
    return target.shadow
end