﻿------------------------------
--      Are you local?      --
------------------------------

local dew = AceLibrary("Dewdrop-2.0")
local BigWigs = BigWigs

local hint = nil
local _G = getfenv(0)

----------------------------
--      Localization      --
----------------------------
local AL = LibStub("AceLocale-3.0")

local L = AL:NewLocale("BigWigs:Options", "enUS", true)
L["|cff00ff00Module running|r"] = true
L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = true
L["Active boss modules:"] = true
L["All running modules have been reset."] = true
L["Menu"] = true
L["Menu options."] = true

L = AL:NewLocale("BigWigs:Options", "frFR")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00Module actif|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55fClic gauche|r pour redémarrer les modules actifs. |cffeda55fAlt-Clic gauche|r pour les désactiver. |cffeda55fCtrl-Alt-Clic gauche|r pour désactiver complètement Big Wigs."
	L["Active boss modules:"] = "Modules de boss actifs :"
	L["All running modules have been reset."] = "Tous les modules actifs ont été réinitialisés."
	L["Menu"] = "Menu"
	L["Menu options."] = "Options du menu."
end

L = AL:NewLocale("BigWigs:Options", "koKR")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00모듈 실행중|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55f클릭|r : 모두 초기화 |cffeda55f알트-클릭|r 비활성화 |cffeda55f컨트롤-알트-클릭|r : BigWigs 비활성화."
	L["Active boss modules:"] = "사용중인 보스 모듈:"
	L["All running modules have been reset."] = "모든 실행중인 모듈을 초기화합니다."
	L["Menu"] = "메뉴"
	L["Menu options."] = "메뉴 설정."
end

L = AL:NewLocale("BigWigs:Options", "zhCN")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00首领模块运行中|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "你可以|cffeda55f点击|r图标重置所有运行中的模块；\n或者|cffeda55fAlt-点击|r可以禁用所有首领模块；\n或者 |cffeda55fCtrl-Alt-点击|r 可以禁用 Big Wigs 所有功能。"
	L["Active boss modules:"] = "激活首领模块："
	L["All running modules have been reset."] = "所有运行中的模块都已重置。"
	L["Menu"] = "目录"
	L["Menu options."] = "目录选项。"
end

L = AL:NewLocale("BigWigs:Options", "zhTW")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00模組運作中|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55f點擊|r圖示重置所有運作中的模組。|cffeda55fAlt+點擊|r圖示關閉所有運作中的模組。|cffeda55fCtrl-Alt+點擊|r圖示關閉 BigWigs。"
	L["Active boss modules:"] = "啟動首領模組："
	L["All running modules have been reset."] = "所有運行中的模組都已重置。"
	L["Menu"] = "選單"
	L["Menu options."] = "選單設置。"
end

L = AL:NewLocale("BigWigs:Options", "deDE")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00Modul aktiv|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55fKlicken|r, um alle laufenden Module zurückzusetzen. |cffeda55fAlt+Klick|r, um alle laufenden Module zu beenden. |cffeda55fStrg-Alt+Klick|r, um BigWigs komplett zu beenden."
	L["Active boss modules:"] = "Aktive Boss Module:"
	L["All running modules have been reset."] = "Alle laufenden Module wurden zurückgesetzt."
	L["Menu"] = "Menü"
	L["Menu options."] = "Menü-Optionen"
end

L = AL:NewLocale("BigWigs:Options", "esES")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00Módulo activo|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55fClic|r para reiniciar los módulos activos.|n|cffeda55fAlt+Clic|r para desactivarlos.|n|cffeda55fCtrl-Alt+Clic|r para desactivar por completo BigWigs.|n"
	L["Active boss modules:"] = "Módulos de jefe activos :"
	L["All running modules have been reset."] = "Todos los módulos activos han sido reiniciados."
	L["Menu"] = "Menú"
	L["Menu options."] = "Opciones del menú."
end

L = AL:NewLocale("BigWigs:Options", "ruRU")
if L then
	L["|cff00ff00Module running|r"] = "|cff00ff00Модуль запущен|r"
	L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55fЩёлкните|r, чтобы сбросить все запущенные модули. |cffeda55fAlt+Левый Клик|r - чтобы отключить их. |cffeda55fCtrl-Alt+Левый клик|r - чтобы отключить Big Wigs полностью."
	L["Active boss modules:"] = "Активные модули боссов:"
	L["All running modules have been reset."] = "Все запущенные модули сброшены."
	L["Menu"] = "Меню"
	L["Menu options."] = "Меню опций."
end

L = AL:GetLocale("BigWigs:Options")

----------------------------
--      FuBar Plugin      --
----------------------------

local ldb = LibStub("LibDataBroker-1.1"):NewDataObject("BigWigs", {
	type = "launcher",
	text = "Big Wigs",
	icon = "Interface\\AddOns\\BigWigs\\Icons\\core-enabled",
})

BigWigsOptions = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0")
local BigWigsOptions = BigWigsOptions
local icon = LibStub("LibDBIcon-1.0", true)

-----------------------------
--      Menu Handling      --
-----------------------------

function BigWigsOptions:OnInitialize()
	hint = L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."]
	if icon then
		_G.BigWigsDB.minimap = _G.BigWigsDB.minimap or {}
		icon:Register("BigWigs", ldb, _G.BigWigsDB.minimap)
	end
end

--------------------------------------------------------------------------------
-- Tooltip additions from modules
--

local tooltipFunctions = {}
function BigWigsOptions:RegisterTooltipInfo(func)
	for i, v in ipairs(tooltipFunctions) do
		if v == func then
			error(("The function %q has already been registered."):format(func))
		end
	end
	table.insert(tooltipFunctions, func)
end

-----------------------------
--      Icon Handling      --
-----------------------------

function BigWigsOptions:OnEnable()
	self:RegisterEvent("BigWigs_CoreEnabled", "CoreState")
	self:RegisterEvent("BigWigs_CoreDisabled", "CoreState")

	self:CoreState()
end

function BigWigsOptions:CoreState()
	if BigWigs:IsActive() then
		ldb.icon = "Interface\\AddOns\\BigWigs\\Icons\\core-enabled"
	else
		ldb.icon = "Interface\\AddOns\\BigWigs\\Icons\\core-disabled"
	end
end

-----------------------------
--      FuBar Methods      --
-----------------------------

local function menu()
	--Don't create a new function every time we open the menu.
	dew:FeedAceOptionsTable(BigWigs.cmdtable)
end

function ldb.OnClick(self, button)
	if button == "RightButton" then
		dew:Open(self, "children", menu)
	else
		if BigWigs:IsActive() then
			if IsAltKeyDown() then
				if IsControlKeyDown() then
					BigWigs:ToggleActive(false)
				else
					for name, module in BigWigs:IterateModules() do
						if module:IsBossModule() and BigWigs:IsModuleActive(module) then
							BigWigs:ToggleModuleActive(module, false)
						end
					end
				end
			else
				for name, module in BigWigs:IterateModules() do
					if module:IsBossModule() and BigWigs:IsModuleActive(module) then
						BigWigs:BigWigs_RebootModule(module)
					end
				end
				BigWigs:Print(L["All running modules have been reset."])
			end
		else
			BigWigs:ToggleActive(true)
		end
	end
end

function ldb.OnTooltipShow(tt)
	tt:AddLine("Big Wigs")
	if BigWigs:IsActive() then
		local added = nil
		for name, module in BigWigs:IterateModules() do
			if module:IsBossModule() and BigWigs:IsModuleActive(module) then
				if not added then
					tt:AddLine(L["Active boss modules:"], 1, 1, 1)
					added = true
				end
				tt:AddLine(name)
			end
		end
	end
	for i, v in ipairs(tooltipFunctions) do
		v(tt)
	end
	tt:AddLine(hint, 0.2, 1, 0.2, 1)
end

