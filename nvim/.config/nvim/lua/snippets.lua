local luasnip_status, luasnip = pcall(require, 'luasnip')
local lsextras_status, extras = pcall(require, 'luasnip.extras')
local lsfmt_status, format = pcall(require, 'luasnip.extras.fmt')
if not (luasnip_status and lsextras_status and lsfmt_status) then
  print("failed")
  return
else
  local snip = luasnip.snippet
  local node = luasnip.snippet_node
  local text = luasnip.text_node
  local insert = luasnip.insert_node
  local func = luasnip.function_node
  local lambda = extras.lambda
  local choice = luasnip.choice_node
  local dynamic = luasnip.dynamic_node
  local fmt = format.fmt
  local rep = extras.rep
  luasnip.snippets = {
    ansible = {
      snip("lookup-local", fmt("\"{{{{ lookup(\'env\', \'{}\' }}}}\"", { insert(1,"HOME") })),
      snip("lookup-remote", fmt("\"{{{{ ansible_env.{} }}}}\"", { insert(1,"HOME") }))
    },
    lua = {
      snip("pcall", fmt("local {}_status, {} = pcall(require, '{}')\nif {}{}_status then\n\treturn\nend",
     { rep(1), insert(1), rep(1), choice(2, {text(" "), text("not ")}), rep(1)})),
    }
  }
end
