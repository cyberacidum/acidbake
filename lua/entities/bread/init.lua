AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_junk/watermelon01.mdl")
    self:SetColor(Color(156, 96, 0))
    self:SetMaterial("models/debug/debugwhite")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self.isRunning = false 
    local phys = self:GetPhysicsObject()

    if(phys:IsValid()) then
        phys:Wake()
    end
end
