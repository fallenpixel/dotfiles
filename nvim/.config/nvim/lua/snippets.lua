local luasnip_status, luasnip = pcall(require, 'luasnip')
local cmp_status, cmp = pcall(require, "cmp")
local lsextras_status, extras = pcall(require, 'luasnip.extras')
local lstypes_status, types = pcall(require, 'luasnip.util.types')
local lsfmt_status, format = pcall(require, 'luasnip.extras.fmt')
if not (luasnip_status and lsextras_status and lstypes_status and lsfmt_status and cmp_status) then
  print("failed")
  return
else
  luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
      enable_autosnippets = true,
      ext_opts = {
        [types.choiceNode] = {
          active = {
          virt_text = { { "⏺", "Comment" } },
			},
		},
	},

    })
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

  luasnip.add_snippets(nil, {
    ansible = {
      snip("lookup-local", fmt("\"{{{{ lookup(\'env\', \'{}\' }}}}\"", { insert(1,"HOME") })),
      snip("lookup-remote", fmt("\"{{{{ ansible_env.{} }}}}\"", { insert(1,"HOME") }))
    },
    sh = {
      snip(
        "for", fmt([[
        for {} in {}
        do {}
        done
        ]],
        {insert(1,"i"),
        choice(2,
          {fmt("$({})", {insert(1,"find -type f .")}),
          insert(1,"*")}),
        insert(3,"#do something"),
        })
      )
  },
    lua = {
      snip("pcall", fmt([[
            local {}_status, {} = pcall('require', '{}')
            if {}{}_status then
              print ("Failed loading {}")
              return
            end
          ]],
          {rep(1),
          rep(1),
          insert(1,"module"),
          choice(2, {text("not "), text("")}),
          rep(1),
          rep(1)}))
    }
  }
  )
end
