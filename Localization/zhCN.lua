---@type string, TargetedSpells
local addonName, Private = ...

local addonNameWithIcon = ""

do
	local icon = C_AddOns.GetAddOnMetadata(addonName, "IconTexture")
	-- width, height, offsetX, offsetY
	addonNameWithIcon = string.format("|T%s:%d:%d:%d:%d|t %s", icon, 20, 20, 0, -4, addonName)
end

local L = Private.L

L.EditMode = {}
L.Functionality = {}
L.Settings = {}

L.Settings.EditModeReminder =
	"建议使用编辑模式，它包含所有设置的实时预览。\n这些设置仅在此处提供，以便在战斗中也能编辑。"
L.EditMode.TargetedSpellsSelfLabel = "目标法术 - 自身"
L.EditMode.TargetedSpellsPartyLabel = "目标法术 - 小队"

L.Functionality.CVarWarning = Private.IsMidnight
		and string.format(
			"%s\n\n姓名板设置 '%s' 已被禁用。\n\n没有它，%s 将无法对屏幕外的敌人生效。\n\n点击 '%s' 以重新启用。",
			addonNameWithIcon,
			UNIT_NAMEPLATES_SHOW_OFFSCREEN,
			addonName,
			ENABLE
		)
	or nil

L.Functionality.CAAEnabledWarning = Private.IsMidnight
		and string.format(
			"%s\n\n本插件已自动启用 '%s' 并根据你启用的声音/语音播报配置了它。\n\n你可以在 %s -> %s -> 左侧 %s > %s 下找到相关设置。\n\n或者输入：/run Settings.OpenToCategory(18)",
			addonNameWithIcon,
			CAA_COMBAT_AUDIO_ALERTS_LABEL,
			KEY_ESCAPE,
			OPTIONS_MENU,
			ACCESSIBILITY_LABEL,
			ACCESSIBILITY_AUDIO_LABEL
		)
	or nil

-- L.Functionality.CAADisabledWarning = Private.IsMidnight
-- 		and string.format(
-- 			"%s 本插件已自动禁用 '%s'，因为你不再使用声音或语音播报。",
-- 			addonNameWithIcon,
-- 			CAA_COMBAT_AUDIO_ALERTS_LABEL
-- 		)
-- 	or nil
L.Functionality.CAAManuallyDisabledWarning = Private.IsMidnight
		and string.format(
			"%s\n\n你禁用了 '%s'，但本插件依赖它来实现声音相关功能。\n\n请点击 %s 重新启用，或调整你的 %s 声音设置。",
			addonNameWithIcon,
			CAA_COMBAT_AUDIO_ALERTS_LABEL,
			ENABLE,
			L.EditMode.TargetedSpellsSelfLabel
		)
	or nil
L.Functionality.CAASayIfTargetedDisabledWarning = Private.IsMidnight
		and string.format(
			"%s\n\n你禁用了 '%s'，但本插件依赖它来实现声音相关功能。\n\n请点击 %s 重新启用，或调整你的 %s 声音设置。",
			addonNameWithIcon,
			CAA_SAY_IF_TARGETED_LABEL,
			ENABLE,
			L.EditMode.TargetedSpellsSelfLabel
		)
	or nil

L.Settings.EnabledLabel = "启用"
L.Settings.EnabledTooltip = nil
L.Settings.DisabledLabel = "禁用"

L.Settings.AddonCompartmentTooltipLine1 =
	string.format("%s 已%s", WrapTextInColorCode(L.EditMode.TargetedSpellsSelfLabel, "ffeda55f"), "%s")
L.Settings.AddonCompartmentTooltipLine2 =
	string.format("%s 已%s", WrapTextInColorCode(L.EditMode.TargetedSpellsPartyLabel, "ffeda55f"), "%s")

L.Settings.LoadConditionContentTypeLabel = "加载条件：内容更新"
L.Settings.LoadConditionContentTypeLabelAbbreviated = "在以下内容更新中加载"
L.Settings.LoadConditionContentTypeTooltip = not Private.IsMidnight
		and "此设置仅可通过编辑模式配置，直到《至暗之夜》前夕补丁，因为在此之前缺少缺少系统设置功能。"
	or nil
L.Settings.LoadConditionContentTypeLabels = {
	[Private.Enum.ContentType.OpenWorld] = "世界",
	[Private.Enum.ContentType.Delve] = "地下堡",
	[Private.Enum.ContentType.Dungeon] = "地下城",
	[Private.Enum.ContentType.Raid] = "团队副本",
	[Private.Enum.ContentType.Arena] = "竞技场",
	[Private.Enum.ContentType.Battleground] = "战场",
}

L.Settings.LoadConditionRoleLabel = "加载条件：职责"
L.Settings.LoadConditionRoleLabelAbbreviated = "在以下职责加载"
L.Settings.LoadConditionRoleTooltip = not Private.IsMidnight
		and "此设置仅可通过编辑模式配置，直到《至暗之夜》前夕补丁，因为在此之前缺少系统设置功能。"
	or nil
L.Settings.LoadConditionRoleLabels = {
	[Private.Enum.Role.Healer] = "治疗",
	[Private.Enum.Role.Tank] = "坦克",
	[Private.Enum.Role.Damager] = "输出",
}

L.Settings.FrameWidthLabel = "宽度"
L.Settings.FrameWidthTooltip = nil

L.Settings.FrameHeightLabel = "高度"
L.Settings.FrameHeightTooltip = nil

L.Settings.FontSizeLabel = "字体大小"
L.Settings.FontSizeTooltip = nil

L.Settings.FrameGapLabel = "间距"
L.Settings.FrameGapTooltip = nil

L.Settings.FrameDirectionLabel = "方向"
L.Settings.FrameDirectionTooltip = nil
L.Settings.FrameDirectionHorizontal = "水平"
L.Settings.FrameDirectionVertical = "垂直"

L.Settings.FrameSortOrderLabel = "排序顺序"
L.Settings.FrameSortOrderTooltip = nil
L.Settings.FrameSortOrderAscending = "升序"
L.Settings.FrameSortOrderDescending = "降序"

L.Settings.FrameGrowLabel = "增长方向"
L.Settings.FrameGrowTooltip = nil
L.Settings.FrameGrowLabels = {
	[Private.Enum.Grow.Center] = "居中",
	[Private.Enum.Grow.Start] = "起始",
	[Private.Enum.Grow.End] = "末端",
}

L.Settings.GlowImportantLabel = "高亮重要法术"
L.Settings.GlowImportantTooltip = "重要与否完全由游戏本身决定。"

L.Settings.GlowTypeLabel = "高亮类型"
L.Settings.GlowTypeTooltip = nil
L.Settings.GlowTypeLabels = {
	[Private.Enum.GlowType.PixelGlow] = "像素发光",
	[Private.Enum.GlowType.AutoCastGlow] = "自动施法发光",
	[Private.Enum.GlowType.ButtonGlow] = "按钮发光",
	[Private.Enum.GlowType.ProcGlow] = "触发发光",
	[Private.Enum.GlowType.Star4] = "四星发光",
}

L.Settings.PlaySoundLabel = "播放音效"
L.Settings.PlaySoundTooltip = "当以你为目标的法术开始时播放音效。会禁用语音播报！"

L.Settings.PlayTTSLabel = "语音播报"
L.Settings.PlayTTSTooltip = "当以你为目标的法术开始时，使用语音播报法术名称。会禁用音效！"

L.Settings.TTSVoiceLabel = "语音播报音色"
L.Settings.TTSVoiceTooltip = "选择用于语音播报的音色。"

L.Settings.SoundLabel = "音效"
L.Settings.SoundCategoryCustom = "自定义"
L.Settings.SoundTooltip = "点击更改，也可点击预览音效。注意：使用主声道音量！"

L.Settings.SoundChannelLabel = "音效声道"
L.Settings.SoundChannelTooltip = nil
L.Settings.SoundChannelLabels = {
	[Private.Enum.SoundChannel.Master] = MASTER_VOLUME,
	[Private.Enum.SoundChannel.Music] = MUSIC_VOLUME,
	[Private.Enum.SoundChannel.SFX] = FX_VOLUME,
	[Private.Enum.SoundChannel.Ambience] = AMBIENCE_VOLUME,
	[Private.Enum.SoundChannel.Dialog] = DIALOG_VOLUME,
}

L.Settings.LoadConditionSoundContentTypeLabel = "加载条件：音效"
L.Settings.LoadConditionSoundContentTypeLabelAbbreviated = "在以下内容中播放音效"
L.Settings.LoadConditionSoundContentTypeTooltip = not Private.IsMidnight
		and "此设置仅可通过编辑模式配置，直到《至暗之夜》前夕补丁，因为在此之前缺少系统设置功能。"
	or "上述音效设置（包括自定义音效和语音播报）在何种情况下生效。"
L.Settings.LoadConditionSoundContentTypeLabels = L.Settings.LoadConditionContentTypeLabels

L.Settings.ShowDurationLabel = "显示持续时间"
L.Settings.ShowDurationTooltip = nil

L.Settings.ShowDurationFractionsLabel = "显示小数"
L.Settings.ShowDurationFractionsTooltip = nil

L.Settings.IndicateInterruptsLabel = "标记可打断法术"
L.Settings.IndicateInterruptsTooltip =
	"使图标去色，在图标上显示标记，并延迟1秒隐藏图标。对引导类法术无效。"

L.Settings.ShowBorderLabel = "显示边框"
L.Settings.ShowBorderTooltip = nil

L.Settings.OpacityLabel = "不透明度"
L.Settings.OpacityTooltip = nil

L.Settings.FrameOffsetXLabel = "X轴偏移"
L.Settings.FrameOffsetXTooltip = nil

L.Settings.FrameOffsetYLabel = "Y轴偏移"
L.Settings.FrameOffsetYTooltip = nil

L.Settings.FrameSourceAnchorLabel = "源锚点"
L.Settings.FrameSourceAnchorTooltip = nil

L.Settings.FrameTargetAnchorLabel = "目标锚点"
L.Settings.FrameTargetAnchorTooltip = nil

L.Settings.IncludeSelfInPartyLabel = "在小队中包含自己"
L.Settings.IncludeSelfInPartyTooltip = "仅在使用团队样式小队框架时生效。"

L.Settings.ClickToOpenSettingsLabel = "点击打开设置"

L.Settings.TargetingFilterApiLabel = "目标检测接口"
L.Settings.TargetingFilterApiTooltip =
	"不同接口间存在细微差别。\n\n法术目标：显示将被法术击中的单位，无视当前目标。对使用箭头指示器同时指向多个玩家的技能无效。\n\n目标单位：显示当前施法正在瞄准的单位。也可以显示并非仅击中目标的法术，例如全队AoE。"
L.Settings.TargetingFilterApiLabels = {
	[Private.Enum.TargetingFilterApi.UnitIsSpellTarget] = "法术目标",
	[Private.Enum.TargetingFilterApi.UnitIsUnit] = "单位目标",
}
