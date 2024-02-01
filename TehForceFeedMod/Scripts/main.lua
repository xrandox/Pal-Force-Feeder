local config = require "config"
local not_hooked = true

local function changeRecoverSatiety()
    if (not_hooked) then
        RegisterHook("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/RecoverHungry/BP_AIAction_BaseCampRecoverHungry.BP_AIAction_BaseCampRecoverHungry_C:ChangeActionEat", function (self)
            local controller = self:get()
            local pal = controller:GetCharacter()
            local pal_params = pal.CharacterParameterComponent
            local max_full_stomach = pal_params:GetMaxFullStomach()
            controller.HungeryParameter.RecoverSatietyTo = max_full_stomach * config.satiety_percentage
        end)

        not_hooked = false
    end
end

local function editEatSpeed(self)
    self.EatTime = config.eat_speed
end

local function hookBaseCampRecoverHungry()
    NotifyOnNewObject("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/RecoverHungry/BP_AIAction_BaseCampRecoverHungry.BP_AIAction_BaseCampRecoverHungry_C", changeRecoverSatiety)
    if config.change_eat_speed then
        NotifyOnNewObject("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/RecoverHungry/BP_AIAction_BaseCampRecoverHungry_Eat.BP_AIAction_BaseCampRecoverHungry_Eat_C", editEatSpeed)
    end
end

RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", hookBaseCampRecoverHungry)