print("[ForceFeed] Mod Loaded")

local notHooked = true

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function (Context)
    NotifyOnNewObject("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/RecoverHungry/BP_AIAction_BaseCampRecoverHungry.BP_AIAction_BaseCampRecoverHungry_C", function (Component)
        if (notHooked) then
            print("Registering BaseCampRecoverHungry Hook")
            RegisterHook("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/RecoverHungry/BP_AIAction_BaseCampRecoverHungry.BP_AIAction_BaseCampRecoverHungry_C:ActionStart", function (self, APawn)
                print("Editing New Hunger Parameter")
                local controller =  self:get()
                local pal = controller:GetCharacter()
                print("Pal object: " .. pal:GetFullName())

                local pal_params = pal.CharacterParameterComponent
                local max_full_stomach = pal_params:GetMaxFullStomach()
                print("Pal MaxFullStomach is: " .. max_full_stomach)

                local new_satiety = max_full_stomach * 0.95
                local hungery_params = controller.HungeryParameter
                print("Current HungeryParameters: EatMaxNum=" .. hungery_params.EatMaxNum .. " RecoverSatietyTo=" .. hungery_params.RecoverSatietyTo .. " RecoverSanityTo=" .. hungery_params.RecoverSanityTo)

                controller.HungeryParameter.RecoverSatietyTo = new_satiety
                print("Changed RecoverSatietyTo new maximum: " .. new_satiety)
            end)
            notHooked = false
        end
    end)
end)