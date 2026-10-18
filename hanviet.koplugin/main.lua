--[[--
Hán Việt lookup plugin for KOReader.

Adds a "Hán Việt" button to the text-selection popup. Select a Vietnamese
word or short phrase, tap it, and a popup shows the underlying Hán tự
(Chinese character) and meaning for each syllable, from the small offline
dictionary in data/hanviet_dict.lua.

NOTE on reliability: this hooks ReaderHighlight's addToHighlightDialog(),
which is the documented extension point community plugins (translators,
dictionary add-ons) use to add a custom button to the highlight menu.
That said, this has only been checked by reading KOReader's plugin
conventions, not by running it on a device yet — if the button doesn't
show up, or `self.ui.highlight` is nil at init time on your KOReader
version, that's the first place to look (see README "Debugging").
--]]--

local WidgetContainer = require("ui/widget/container/widgetcontainer")
local TextViewer = require("ui/widget/textviewer")
local UIManager = require("ui/uimanager")
local logger = require("logger")
local _ = require("gettext")

local hanviet_dict = require("data/hanviet_dict")

local Hanviet = WidgetContainer:extend{
    name = "hanviet",
    is_doc_only = true,
}

function Hanviet:init()
    if self.ui and self.ui.highlight then
        self:addToHighlightDialog()
    else
        logger.warn("hanviet: self.ui.highlight not available at init, " ..
            "the Hán Việt button will not be added to the selection menu")
    end
end

-- Registers our button with ReaderHighlight's selection popup.
-- The "09_" prefix is just a sort key so it lands in a sensible position
-- among other plugins' buttons; change it if it clashes/looks wrong.
function Hanviet:addToHighlightDialog()
    self.ui.highlight:addToHighlightDialog("09_hanviet_lookup", function(reader_highlight_instance)
        return {
            text = _("Hán Việt"),
            enabled = true,
            callback = function()
                local selected = reader_highlight_instance.selected_text
                local text = selected and selected.text
                reader_highlight_instance:onClose()
                self:showLookup(text)
            end,
        }
    end)
end

-- ---------------------------------------------------------------------
-- Lookup logic
-- ---------------------------------------------------------------------

local function normalize(s)
    if not s then
        return ""
    end
    s = s:gsub("^%s+", ""):gsub("%s+$", "")
    s = s:lower()
    return s
end

local function splitSyllables(s)
    local out = {}
    for w in s:gmatch("%S+") do
        table.insert(out, w)
    end
    return out
end

local function formatEntries(label, entries)
    local lines = {label .. ":"}
    for _idx, e in ipairs(entries) do
        table.insert(lines, string.format("  %s — %s", e.han, e.meaning))
    end
    return lines
end

-- Returns a multi-line string of results for the given selected text,
-- or nil if there was nothing to look up.
function Hanviet:lookupPhrase(text)
    local norm = normalize(text)
    if norm == "" then
        return nil
    end

    local lines = {}
    local whole_phrase_entries = hanviet_dict[norm]
    local syllables = splitSyllables(norm)

    -- If the whole selection matches a dictionary entry as-is (e.g. a
    -- known two-syllable compound), show that first.
    if whole_phrase_entries then
        for _idx, l in ipairs(formatEntries(norm, whole_phrase_entries)) do
            table.insert(lines, l)
        end
    end

    -- Then show each individual syllable, unless the selection was a
    -- single syllable we already reported above.
    if #syllables > 1 or not whole_phrase_entries then
        for _idx, syl in ipairs(syllables) do
            local entries = hanviet_dict[syl]
            if entries then
                for _idx, l in ipairs(formatEntries(syl, entries)) do
                    table.insert(lines, l)
                end
            else
                table.insert(lines, syl .. ": " .. _("(không có trong từ điển)"))
            end
        end
    end

    return table.concat(lines, "\n")
end

function Hanviet:showLookup(text)
    if not text or normalize(text) == "" then
        UIManager:show(TextViewer:new{
            title = _("Hán Việt"),
            text = _("Không có chữ nào được chọn."),
        })
        return
    end

    local ok, body = pcall(function() return self:lookupPhrase(text) end)
    if not ok then
        logger.warn("hanviet: lookup failed", body)
        body = _("Có lỗi khi tra từ.")
    elseif not body or body == "" then
        body = _("Không tìm thấy.")
    end

    UIManager:show(TextViewer:new{
        title = text,
        text = body,
    })
end

return Hanviet
