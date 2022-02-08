ESX = nil 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local mask = {} for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1, 1 do mask[i] = i end

local Mask = {
    MaskIndex = 1,
    MaskVariantIndex = 0,
}

local active = false

local MaxVariant = {}

function destroyPlayerPedCam() 	
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    FreezeEntityPosition(PlayerPedId(), false)
end

local open = false
local tMask = RageUI.CreateMenu("Masque", "tMask")
tMask.Closed = function()
    RageUI.Visible(tMask, false)
    open = false
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    destroyPlayerPedCam()
end

function GetCurrentMask()
    MaxVariant = {}
    for c = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, Mask.MaskIndex)-1 do
        MaxVariant[c] = c
        if MaxVariant[c] > 0 then
            active = true
        end
    end
end

function OpenMask()
    if open then 
        open = false
        RageUI.Visible(tMask, false)
        return
    else
        open = true 
        RageUI.Visible(tMask, true)
        Citizen.CreateThread(function()
        while open do 
            RageUI.IsVisible(tMask,function()
                RageUI.Separator("")
                RageUI.Separator("→ ~y~ Choisis ton masque ~s~ ←")
                RageUI.Separator("")
                RageUI.List('Masque', mask, Mask.MaskIndex, nil, {}, true, {
                    onListChange = function(Index, Item)
                        Mask.MaskIndex = Index;
                        GetCurrentMask()
                        Mask.MaskVariantIndex = 0
                        SetPedComponentVariation(GetPlayerPed(-1), 1, Mask.MaskIndex, Mask.MaskVariantIndex, 2)
                        
                    end
                })
                
                if active then
                    RageUI.List2('Variante du masque', MaxVariant, Mask.MaskVariantIndex, nil, {}, true, {
                        onListChange = function(Index, Item)
                            Mask.MaskVariantIndex = Index;
                            SetPedComponentVariation(GetPlayerPed(-1), 1, Mask.MaskIndex, Mask.MaskVariantIndex, 2)
                        end
                    })
                end

                RageUI.Button("Payer : ~g~" .. Config.Price .. "$" , nil, { RightLabel = "~u~ $" , Color = { BackgroundColor = { 0, 200, 0, 160 } } }, true, {
                   onSelected = function()
                       TriggerServerEvent("tMask:buy")
                       Wait(200)
                       destroyPlayerPedCam()
                       tMask.Closed()
                    end
                })

            end)
            Wait(0)
        end
    end)
end
end

function CreatePedCamHead()
	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
	local coordsCam = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.95)
	local coordsPly = GetEntityCoords(PlayerPedId())
	SetCamCoord(cam, coordsCam)
	PointCamAtCoord(cam, coordsPly['x'], coordsPly['y'], coordsPly['z']+1)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)
end

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Pos)
    SetBlipSprite(blip,362)
    SetBlipDisplay(blip,4)
    SetBlipScale(blip,0.7)
    SetBlipColour(blip,3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("~b~Magasin~s~ | Masques")
    EndTextCommandSetBlipName(blip)
end)

CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(PlayerPedId())
        local spam = false
        if #(pCoords - Config.Pos) < 1.2 then
            spam = true
            --ESX.ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour Menu Mask")
            ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour ~b~accéder au magasin de masques")
            DrawMarker(21, Config.Pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 0, 180, 0, 255, true, true, p19, true)                    
            if IsControlJustReleased(0, 38) then
                SetEntityInvincible(GetPlayerPed(-1), true) 
                FreezeEntityPosition(GetPlayerPed(-1), true)								
                SetEntityCoords(GetPlayerPed(-1), -1336.9627, -1277.15600, 4.5238-0.98, 0.0, 0.0, 0.0, 10)
                CreatePedCamHead()
    
                OpenMask()
            end                
        elseif #(pCoords - Config.Pos) < 1.3 then
            spam = false 
            RageUI.CloseAll()
            destroyPlayerPedCam() 
        end
        if spam then
            Wait(1)
        else
            Wait(500)
        end
    end
end)

RegisterNetEvent('tMask:save')
AddEventHandler('tMask:save', function()
    TriggerEvent("skinchanger:change", "mask_2", Mask.MaskVariantIndex)
    TriggerEvent("skinchanger:change", "mask_1",Mask.MaskIndex,- 1)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)