local ls = require('luasnip')
local extra = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local lambda = extra.lambda
local choice = ls.choice_node
local dynamic = ls.dynamic_node

ls.snippets = {
  ansible = {
    snip("lookup-local", fmt("\"{{{{ lookup(\'env\', \'{}\' }}}}\"", { insert(1,"HOME") })),
    snip("lookup-remote", fmt("\"{{{{ ansible_env.{} }}}}\"", { insert(1,"HOME") }))
  }
}
