AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/furnitureStove001a.mdl")
    self:SetMaterial("models/debug/debugwhite")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if(phys:IsValid()) then
        phys:Wake()
    end

    self.isBaking = false
    self.finishBakeTime = 0
    self:SetColor(Color(255, 0, 0))

end

function ENT:StartTouch(ent)
    if ent:GetClass() == "dough" and self.isBaking == false then
        ent:Remove()
        self.isBaking = true
        self.finishBakeTime = CurTime() + 10
    end
end

function ENT:Think()
    if self.isBaking == true then
        self:SetColor(Color(255, 0, 0))
    else
        self:SetColor(Color(0, 255, 0))    
    end

    if self.isBaking == true then
        if self.finishBakeTime <= CurTime() then
            self.isBaking = false

            local bread = ents.Create("bread")
            bread:SetPos(self:GetPos() + Vector(0, 0, 50))
            bread:Spawn()
        end
    end
end
