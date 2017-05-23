--# (project_name = 'funTasia BloX World')
--# (project_alias = 'funtasia')
--# (file_name = 'recipes')
--# (file_extension = 'lua')
--# (file_format = 'lua script')
--# (file_version = {major_version = 0, minor_version = 1, patch_version = 0, suffix_version = 'alpha'})
--# [!] File version numbers have to match with that release version number where the file was last amended
--# (author = {surname = 'Christian', lastname = 'Trant'})
--# (date_of_creation = {day = 21, month = 05, year = 2017})
--# (date_of_last_change = {day = 21, month = 05, year = 2017})
--# (license = 'CC0')

-- TODO: Refactor reciepes out to own module
-- Reciepes
--- Cooking - recipes for furnance

-- TODO: [?] Charcoal pile - Like creating a portal, the player must build a 'charcole pile' by a construction plan.
--- If 'charcoal pile' is constructed correctly, the player can light up a fuse and the wood inside the pile
--- transforms to charcoal blocks (low posibility) or charcoal lumps (height posibility).

-- TODO: Refactor to wood charcoal
-- add: charcoal_lump
-- color: 'dark_brown'
-- burntime: 26

-- add: charcoal_block
-- color: 'dark_brown'
-- burntime: 250

-- Bake tree to coal lump
minetest.register_craft({
  type = 'cooking',
  recipe = 'group:tree',
  output = 'default:coal_lump 2',
  cooktime = 10
})

-- Bake wood to coal lump
minetest.register_craft({
  type = 'cooking',
  recipe = 'group:wood',
  output = 'default:coal_lump',
  cooktime = 8
})
