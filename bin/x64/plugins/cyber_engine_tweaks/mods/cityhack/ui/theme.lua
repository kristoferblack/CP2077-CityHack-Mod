local Theme = {
    Text                                =           { 1, 0.44, 0.4, 1        },
    TextWhite                           =           { 1, 1, 1, 1             },
	TextDisabled                        =           { 0.48, 0.39, 0.40, 1    },
	WindowBg                            =           { 0.06, 0.04, 0.06, 0.8  },
	ChildBg                             =           { 0.06, 0.04, 0.06, 0.9  },
	PopupBg                             =           { 0.06, 0.04, 0.06, 0.8  },
	Border                              =           { 0.3 , 0.07, 0.08, 1    },
	BorderShadow                        =           { 0   , 0   , 0   , 0    },
	FrameBg                             =           { 0.57, 0.17, 0.16, 0.5  },
	FrameBgHovered                      =           { 0.32, 0.09, 0.11, 1    },
	FrameBgActive                       =           { 0.1 , 0.05, 0.05, 1    },
	FrameBgDisabled                     =           { 0.48, 0.39, 0.40, 1    },
	FrameBgHoveredDisabled              =           { 0.48, 0.39, 0.40, 1    },
	FrameBgActiveDisabled               =           { 0.48, 0.39, 0.40, 1    },
	Header								=			{ 0.57, 0.17, 0.16, 0.2  },
	HeaderHovered						=			{ 0.32, 0.09, 0.11, 0.75 },
	HeaderActive						=			{ 0.32, 0.09, 0.11, 1    },
	TitleBg                             =           { 0.06, 0.04, 0.06, 0.8  },
	TitleBgActive                       =           { 0.06, 0.04, 0.06, 0.8  },
	TitleBgCollapsed                    =           { 0.06, 0.04, 0.06, 0.3  },
	MenuBarBg                           =           { 0   , 0   , 0   , 0    },
	ScrollbarBg                         =           { 0.06, 0.04, 0.06, 0    },
	ScrollbarGrab                       =           { 0.57, 0.17, 0.16, 1    },
	ScrollbarGrabHovered                =           { 0.57, 0.17, 0.16, 1    },
	ScrollbarGrabActive                 =           { 0.57, 0.17, 0.16, 1    },
	CheckMark                           =           { 1   , 0.44, 0.4 , 1    },
	CheckMarkTrueDisabled               =           { 0.34, 0.22, 0.24, 1    },
	CheckMarkFalseDisabled              =           { 0.48, 0.39, 0.40, 1    },
	SliderGrab                          =           { 0   , 0   , 0   , 0    },
	SliderGrabActive                    =           { 0   , 0   , 0   , 0    },
	Button                              =           { 0.57, 0.17, 0.16, 0.70 },
	ButtonHovered                       =           { 0.55, 0.13, 0.14, 0.9  },
	ButtonActive                        =           { 0.57, 0.17, 0.16, 1    },
	Tab                                 =           { 0.22, 0.64, 0.69, 0.25 },
	TabHovered                          =           { 0.22, 0.64, 0.69, 0.5  },
	TabActive                           =           { 0.22, 0.64, 0.69, 1    },
	Separator                           =           { 1, 1, 1, 0.1           },
	SeparatorHovered                    =           { 0.29, 0.77, 0.79, 1    },
	SeparatorActive                     =           { 0.29, 0.77, 0.79, 1    },
	ResizeGrip                          =           { 0.06, 0.04, 0.06, 0    },
	ResizeGripHovered                   =           { 1   , 0.44, 0.4 , 1    },
	ResizeGripActive                    =           { 1   , 0.44, 0.4 , 1    },
	TabUnfocused                        =           { 0   , 0   , 0   , 0    },
	TabUnfocusedActive                  =           { 0   , 0   , 0   , 0    },
	DockingPreview                      =           { 0   , 0   , 0   , 0    },
	DockingEmptyBg                      =           { 0   , 0   , 0   , 0    },
	PlotLines                           =           { 0   , 0   , 0   , 0    },
	PlotLinesHovered                    =           { 0   , 0   , 0   , 0    },
	PlotHistogram                       =           { 0   , 0   , 0   , 0    },
	PlotHistogramHovered                =           { 0   , 0   , 0   , 0    },
	TextSelectedBg                      =           { 0   , 0   , 0   , 0    },
	DragDropTarget                      =           { 0   , 0   , 0   , 0    },
	NavHighlight                        =           { 0   , 0   , 0   , 0    },
	NavWindowingHighlight               =           { 0   , 0   , 0   , 0    },
	NavWindowingDimBg                   =           { 0   , 0   , 0   , 0    },
	ModalWindowDimBg                    =           { 0   , 0   , 0   , 0    },
	ModalWindowDarkening                =           { 0   , 0   , 0   , 0    },
	COUNT                               =           { 0   , 0   , 0   , 0    },
	CustomToggleOn                      =           { 0.29, 0.77, 0.79, 1    },
	CustomToggleOnHovered               =           { 0.20, 0.56, 0.59, 1    },
	CustomToggleOnText                  =           { 0   , 0   , 0   , 1    },
	CustomToggleOnDisable               =           { 0.04, 0.11, 0.12, 1    },
	CustomToggleOnDisableHovered        =           { 0.05, 0.16, 0.16, 1    },
	CustomToggleOnDisableText           =           { 0.06, 0.18, 0.2 , 1    },
	CustomToggleOff                     =           { 0.57, 0.18, 0.16, 1    },
	CustomToggleOffHovered              =           { 0.45, 0.13, 0.14, 1    },
	CustomToggleOffText                 =           { 1   , 0.44, 0.4 , 1    },
	CustomToggleOffDisable              =           { 0.1 , 0.04, 0.07, 1    },
	CustomToggleOffDisableHovered       =           { 0.16, 0.06, 0.07, 1    },
	CustomToggleOffDisableText          =           { 0.22, 0.07, 0.07, 1    },
}

function Theme.PushStyleColor(style, color)
	ImGui.PushStyleColor(style, color[1], color[2], color[3], color[4])
end

function Theme.Start()
	Theme.PushStyleColor(ImGuiCol.TitleBg,				    Theme.TitleBg)
	Theme.PushStyleColor(ImGuiCol.TitleBgCollapsed,		    Theme.TitleBgCollapsed)
	Theme.PushStyleColor(ImGuiCol.TitleBgActive,		    Theme.TitleBgActive)
	Theme.PushStyleColor(ImGuiCol.Border,				    Theme.Border)
    Theme.PushStyleColor(ImGuiCol.WindowBg,				    Theme.WindowBg)
    Theme.PushStyleColor(ImGuiCol.PopupBg,				    Theme.PopupBg)
	Theme.PushStyleColor(ImGuiCol.ResizeGrip, 			    Theme.ResizeGrip)
	Theme.PushStyleColor(ImGuiCol.ResizeGripHovered, 	    Theme.ResizeGripHovered)
	Theme.PushStyleColor(ImGuiCol.ResizeGripActive,		    Theme.ResizeGripActive)
	Theme.PushStyleColor(ImGuiCol.Header,		    		Theme.Header)
	Theme.PushStyleColor(ImGuiCol.HeaderHovered,		    Theme.HeaderHovered)
	Theme.PushStyleColor(ImGuiCol.HeaderActive,		    	Theme.HeaderActive)
	Theme.PushStyleColor(ImGuiCol.Text,					    Theme.Text)
	Theme.PushStyleColor(ImGuiCol.Tab,					    Theme.Tab)
	Theme.PushStyleColor(ImGuiCol.TabHovered,			    Theme.TabHovered)
	Theme.PushStyleColor(ImGuiCol.TabActive,			    Theme.TabActive)
	Theme.PushStyleColor(ImGuiCol.FrameBg,				    Theme.FrameBg)
	Theme.PushStyleColor(ImGuiCol.FrameBgHovered,	        Theme.FrameBgHovered)
	Theme.PushStyleColor(ImGuiCol.FrameBgActive,		    Theme.FrameBgActive)
	Theme.PushStyleColor(ImGuiCol.Button,				    Theme.Button)
	Theme.PushStyleColor(ImGuiCol.ButtonHovered,		    Theme.ButtonHovered)
	Theme.PushStyleColor(ImGuiCol.ButtonActive,			    Theme.ButtonActive)
	Theme.PushStyleColor(ImGuiCol.Separator,			    Theme.Separator)
end

function Theme.End()
	ImGui.PopStyleColor(23)
end

function Theme.DisplayLabel(text)
	if not text then text = "Missing Text!" end

	Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
	ImGui.LabelText("##", text:upper())
	ImGui.PopStyleColor()
	ImGui.Spacing()
end

function Theme.DisplayLabelState(text, state)
	if not text then text = "Missing Text!" end
	if not state then state = "" end

	ImGui.Text(text .. state:upper())
	ImGui.Spacing()
end

function Theme.Spacing(amount)
	if not amount then amount = 1 end

	for i = 1, amount do
		ImGui.Spacing()
	end
end

function Theme.InsertSeparator()
	Theme.Spacing(2)
	ImGui.Separator()
	Theme.Spacing(1)
end

function Theme.TabStart()
	Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)
end

function Theme.TabInner()
	ImGui.PopStyleColor()
	Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
	ImGui.Spacing()
end

function Theme.TabEnd()
	ImGui.EndTabItem()
end

function Theme.HeaderStart()
	Theme.PushStyleColor(ImGuiCol.Text, Theme.CustomToggleOn)
end

function Theme.HeaderEnd()
	ImGui.PopStyleColor()
end

return Theme