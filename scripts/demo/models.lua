data.model = {}

data.model.skybox = modelCreate(data.geometry.skybox)
modelSetRotation(data.model.skybox,0.0,math.pi*1.25,0.0)

data.model.miku = modelCreate(data.geometry.miku)
modelSetAnimation(data.model.miku,data.animation.miku.dance)
modelPlayAnimation(data.model.miku)

data.model.plane = modelCreate(data.geometry.plane)

data.model.rigid_body = {}
for i=1,25 do
    data.model.rigid_body[i] = modelCreate(data.geometry.cone)
    modelSetPosition(data.model.rigid_body[i],4.0,1.0+2.0*(i-1),4.0)
    modelSetCollision(data.model.rigid_body[i],"cone",1.0, 1.0,1.0)
    modelSetCollisionProperty(data.model.rigid_body[i],"friction",1.0)
end
for i=26,50 do
    local l_disp = ((-1)^(i%2))
    data.model.rigid_body[i] = modelCreate(data.geometry.cylinder)
    modelSetPosition(data.model.rigid_body[i],4.0+0.25*l_disp,1.0+2.0*(i-26),-4.0+0.25*l_disp)
    modelSetCollision(data.model.rigid_body[i],"cylinder",1.0, 1.0,0.5,1.0)
    modelSetCollisionProperty(data.model.rigid_body[i],"friction",1.0)
end
for i=51,100 do
    local l_disp = ((-1)^(i%2))
    data.model.rigid_body[i] = modelCreate(data.geometry.cube)
    modelSetPosition(data.model.rigid_body[i],-4.0+0.5*l_disp,1.0+2.0*(i-51),4.0)
    modelSetCollision(data.model.rigid_body[i],"box",1.0, 1.0,1.0,1.0)
    modelSetCollisionProperty(data.model.rigid_body[i],"friction",1.0)
end
for i=101,150 do
    local l_disp = ((-1)^(i%2))
    data.model.rigid_body[i] = modelCreate(data.geometry.sphere)
    modelSetPosition(data.model.rigid_body[i],-4.0+0.25*l_disp,1.0+2.0*(i-101),-4.0+0.25*l_disp)
    modelSetCollision(data.model.rigid_body[i],"sphere",1.0, 1.0)
    modelSetCollisionProperty(data.model.rigid_body[i],"friction",1.0)
end

for i=#data.model.rigid_body+1,#data.model.rigid_body+1 do
    data.model.rigid_body[i] = modelCreate(data.geometry.cube)
    modelSetPosition(data.model.rigid_body[i],-8.0,2.0,-8.0)
    modelSetCollision(data.model.rigid_body[i],"box",1.0, 1.0,1.0,1.0)
end
