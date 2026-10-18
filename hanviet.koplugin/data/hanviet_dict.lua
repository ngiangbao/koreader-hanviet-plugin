--[[--
Starter Hán Việt (Sino-Vietnamese) dictionary.

This is a SEED dataset of common monosyllabic Hán Việt words, written from
general, widely-taught linguistic knowledge (the kind found in any
Vietnamese secondary-school "từ Hán Việt" lesson), not copied or compiled
from any single copyrighted dictionary. It exists so the plugin has
something to look up out of the box.

It is intentionally small. For real use you will want far more coverage.
To extend it:

1. Keep the same shape: dict["syllable"] = { {han="漢字", meaning="..."}, ... }
   (a list, because many syllables are homophones of more than one
   character — e.g. "tử" = 子 "con" AND 死 "chết".)
2. Pull additional entries from an open dataset whose license permits
   reuse (check the license first) — for example the Nôm Na Việt project
   (https://github.com/nomnaviet), which publishes plain JSON/CSV
   Hán Việt data — and merge them into this table, or load a second data
   file and merge it at runtime in main.lua.
3. Vietnamese keys must be lowercase, no leading/trailing space, and
   written with ["word"] = ... (not word = ...) because Vietnamese
   diacritics are not valid in a bare Lua identifier.

--]]--

local dict = {
    ["quốc"] = {
        {han = "國", meaning = "nước, quốc gia"},
    },
    ["gia"] = {
        {han = "家", meaning = "nhà, gia đình"},
        {han = "加", meaning = "thêm vào (như: gia tăng)"},
    },
    ["nhân"] = {
        {han = "人", meaning = "người"},
        {han = "仁", meaning = "lòng thương người, nhân nghĩa"},
        {han = "因", meaning = "nguyên nhân, nhân quả"},
    },
    ["thiên"] = {
        {han = "天", meaning = "trời"},
        {han = "千", meaning = "một nghìn"},
        {han = "遷", meaning = "dời đi (như: thiên đô)"},
    },
    ["địa"] = {
        {han = "地", meaning = "đất"},
    },
    ["sơn"] = {
        {han = "山", meaning = "núi"},
    },
    ["thủy"] = {
        {han = "水", meaning = "nước (sông, biển)"},
        {han = "始", meaning = "bắt đầu (như: khởi thủy)"},
    },
    ["hỏa"] = {
        {han = "火", meaning = "lửa"},
    },
    ["mộc"] = {
        {han = "木", meaning = "cây, gỗ"},
    },
    ["kim"] = {
        {han = "金", meaning = "vàng, kim loại"},
    },
    ["thổ"] = {
        {han = "土", meaning = "đất"},
    },
    ["nhật"] = {
        {han = "日", meaning = "mặt trời, ngày"},
    },
    ["nguyệt"] = {
        {han = "月", meaning = "mặt trăng, tháng"},
    },
    ["niên"] = {
        {han = "年", meaning = "năm"},
    },
    ["đại"] = {
        {han = "大", meaning = "to, lớn"},
        {han = "代", meaning = "thế hệ, thay thế (như: thời đại, đại diện)"},
    },
    ["tiểu"] = {
        {han = "小", meaning = "nhỏ"},
    },
    ["trung"] = {
        {han = "中", meaning = "ở giữa"},
        {han = "忠", meaning = "trung thành"},
    },
    ["học"] = {
        {han = "學", meaning = "học, sự học"},
    },
    ["sinh"] = {
        {han = "生", meaning = "sống, sinh ra, học trò"},
    },
    ["tử"] = {
        {han = "子", meaning = "con, người (như: tử tôn, quân tử)"},
        {han = "死", meaning = "chết (như: tử vong)"},
    },
    ["phụ"] = {
        {han = "父", meaning = "cha"},
        {han = "附", meaning = "gắn vào, phụ thuộc"},
        {han = "婦", meaning = "đàn bà, vợ (như: phụ nữ)"},
    },
    ["mẫu"] = {
        {han = "母", meaning = "mẹ"},
        {han = "模", meaning = "khuôn mẫu"},
    },
    ["huynh"] = {
        {han = "兄", meaning = "anh trai"},
    },
    ["đệ"] = {
        {han = "弟", meaning = "em trai"},
    },
    ["quân"] = {
        {han = "君", meaning = "vua, bậc quân tử"},
        {han = "軍", meaning = "quân đội"},
    },
    ["dân"] = {
        {han = "民", meaning = "dân, người dân"},
    },
    ["quan"] = {
        {han = "官", meaning = "quan lại, chức quan"},
        {han = "觀", meaning = "xem, quan sát"},
        {han = "關", meaning = "đóng lại, liên quan"},
    },
    ["vương"] = {
        {han = "王", meaning = "vua"},
    },
    ["đế"] = {
        {han = "帝", meaning = "vua, hoàng đế"},
    },
    ["thế"] = {
        {han = "世", meaning = "đời, thế hệ"},
        {han = "勢", meaning = "thế lực, tình thế"},
    },
    ["giới"] = {
        {han = "界", meaning = "cõi, ranh giới (như: thế giới)"},
        {han = "戒", meaning = "răn, giới luật"},
    },
    ["nhất"] = {
        {han = "一", meaning = "một"},
    },
    ["nhị"] = {
        {han = "二", meaning = "hai"},
    },
    ["tam"] = {
        {han = "三", meaning = "ba"},
    },
    ["tứ"] = {
        {han = "四", meaning = "bốn"},
    },
    ["ngũ"] = {
        {han = "五", meaning = "năm (số 5)"},
    },
    ["lục"] = {
        {han = "六", meaning = "sáu"},
        {han = "陸", meaning = "đất liền (như: lục địa)"},
    },
    ["thất"] = {
        {han = "七", meaning = "bảy"},
        {han = "失", meaning = "mất (như: thất bại)"},
    },
    ["bát"] = {
        {han = "八", meaning = "tám"},
    },
    ["cửu"] = {
        {han = "九", meaning = "chín"},
        {han = "久", meaning = "lâu dài"},
    },
    ["thập"] = {
        {han = "十", meaning = "mười"},
    },
    ["bách"] = {
        {han = "百", meaning = "trăm"},
    },
    ["vạn"] = {
        {han = "萬", meaning = "mười nghìn, rất nhiều"},
    },
    ["tâm"] = {
        {han = "心", meaning = "tim, lòng"},
    },
    ["thân"] = {
        {han = "身", meaning = "thân thể"},
        {han = "親", meaning = "gần gũi, người thân"},
    },
    ["khẩu"] = {
        {han = "口", meaning = "miệng"},
    },
    ["thủ"] = {
        {han = "手", meaning = "tay"},
        {han = "首", meaning = "đầu, đứng đầu"},
        {han = "守", meaning = "giữ gìn, bảo vệ"},
    },
    ["nhãn"] = {
        {han = "眼", meaning = "mắt"},
    },
    ["nhĩ"] = {
        {han = "耳", meaning = "tai"},
    },
    ["diện"] = {
        {han = "面", meaning = "mặt"},
    },
    ["khí"] = {
        {han = "氣", meaning = "khí, hơi, sức lực"},
        {han = "器", meaning = "đồ dùng, dụng cụ"},
    },
    ["lực"] = {
        {han = "力", meaning = "sức mạnh"},
    },
    ["tri"] = {
        {han = "知", meaning = "biết"},
    },
    ["thức"] = {
        {han = "識", meaning = "biết, nhận biết (như: kiến thức)"},
    },
    ["văn"] = {
        {han = "文", meaning = "chữ, văn chương"},
        {han = "聞", meaning = "nghe, nghe tin"},
    },
    ["võ"] = {
        {han = "武", meaning = "sức mạnh, võ nghệ"},
    },
    ["công"] = {
        {han = "公", meaning = "chung, công cộng"},
        {han = "工", meaning = "việc làm, thợ"},
        {han = "功", meaning = "công lao, thành tựu"},
    },
    ["tư"] = {
        {han = "私", meaning = "riêng tư"},
        {han = "思", meaning = "suy nghĩ"},
    },
    ["chính"] = {
        {han = "正", meaning = "ngay thẳng, đúng"},
        {han = "政", meaning = "việc cai trị (như: chính phủ)"},
    },
    ["pháp"] = {
        {han = "法", meaning = "phép tắc, luật pháp"},
    },
    ["luật"] = {
        {han = "律", meaning = "luật lệ"},
    },
    ["quyền"] = {
        {han = "權", meaning = "quyền lực, quyền lợi"},
    },
    ["lợi"] = {
        {han = "利", meaning = "lợi ích"},
    },
    ["hại"] = {
        {han = "害", meaning = "điều xấu, tổn hại"},
    },
    ["an"] = {
        {han = "安", meaning = "yên ổn"},
    },
    ["nguy"] = {
        {han = "危", meaning = "nguy hiểm"},
    },
    ["phúc"] = {
        {han = "福", meaning = "điều may mắn, phúc"},
        {han = "復", meaning = "trở lại, khôi phục (như: phục hồi)"},
    },
    ["họa"] = {
        {han = "禍", meaning = "tai họa"},
        {han = "畫", meaning = "vẽ, tranh (như: hội họa)"},
    },
    ["hạnh"] = {
        {han = "幸", meaning = "may mắn (như: hạnh phúc)"},
    },
    ["thời"] = {
        {han = "時", meaning = "thời gian, lúc"},
    },
    ["gian"] = {
        {han = "間", meaning = "khoảng, ở giữa (như: thời gian, không gian)"},
        {han = "奸", meaning = "gian dối, gian ác"},
    },
    ["không"] = {
        {han = "空", meaning = "trống, bầu trời (như: không gian)"},
    },
    ["hữu"] = {
        {han = "友", meaning = "bạn bè"},
        {han = "有", meaning = "có"},
        {han = "右", meaning = "bên phải"},
    },
    ["vô"] = {
        {han = "無", meaning = "không có"},
    },
    ["chân"] = {
        {han = "真", meaning = "thật"},
    },
    ["giả"] = {
        {han = "假", meaning = "giả, không thật"},
        {han = "者", meaning = "người (như: tác giả, học giả)"},
    },
    ["thiện"] = {
        {han = "善", meaning = "tốt, lành"},
    },
    ["ác"] = {
        {han = "惡", meaning = "xấu, dữ"},
    },
    ["mỹ"] = {
        {han = "美", meaning = "đẹp"},
    },
    ["xú"] = {
        {han = "醜", meaning = "xấu xí"},
    },
    ["cao"] = {
        {han = "高", meaning = "cao"},
    },
    ["trường"] = {
        {han = "長", meaning = "dài, lớn lên, đứng đầu"},
        {han = "場", meaning = "nơi chốn, sân bãi (như: thị trường)"},
    },
    ["đoản"] = {
        {han = "短", meaning = "ngắn"},
    },
}

return dict
