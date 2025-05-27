require("austin.telescope")
local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
autopairs.add_rules({
    Rule('$', '$', 'tex'),
})
