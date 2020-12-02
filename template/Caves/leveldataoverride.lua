return {
  background_node_range={ 0, 1 },
  desc="探查洞穴…… 一起！",
  hideminimap=false,
  id="DST_CAVE",
  location="cave",
  max_playlist_position=999,
  min_playlist_position=0,
  name="洞穴",
  numrandom_set_pieces=0,
  override_level_string=false,
  overrides = {
		-- MISC
		task_set = "default", 			-- "classic", "default", "cave_default"
		start_location = "default", 	-- "caves", "default", "plus", "darkness"
		world_size = "default", 		-- "small", "medium", "default", "huge"
		branching = "default", 			-- "never", "least", "default", "most"
		loop = "default", 				-- "never", "default", "always"
		season_start = "default", 		-- "default", "winter", "spring", "summer", "autumnorspring", "winterorsummer", "random"
		weather = "default", 			-- "never", "rare", "default", "often", "always"
		earthquakes = "default", 		-- "never", "rare", "default", "often", "always"
		regrowth = "default", 			-- "veryslow", "slow", "default", "fast", "veryfast"
		touchstone = "default", 		-- "never", "rare", "default", "often", "always"
		boons = "default", 				-- "never", "rare", "default", "often", "always"
		cavelight = "default", 			-- "veryslow", "slow", "default", "fast", "veryfast"
		disease_delay = "none", 		-- "none", "random", "long", "default", "short"
    prefabswaps_start = "default", 	-- "classic", "default", "highly random"
    layout_mode="RestrictNodesByKey",
    roads="never",
    wormhole_prefab="tentacle_pillar",

		-- RESOURCES
		grass = "default", 				-- "never", "rare", "default", "often", "always"
		sapling = "default", 			-- "never", "rare", "default", "often", "always"
		marshbush = "default", 			-- "never", "rare", "default", "often", "always"
		reeds = "default", 				-- "never", "rare", "default", "often", "always"
		trees = "default", 				-- "never", "rare", "default", "often", "always"
		flint = "default", 				-- "never", "rare", "default", "often", "always"
		rock = "default", 				-- "never", "rare", "default", "often", "always"
		mushtree = "default", 			-- "never", "rare", "default", "often", "always"
		fern = "default", 				-- "never", "rare", "default", "often", "always"
		flower_cave = "default", 		-- "never", "rare", "default", "often", "always"
		wormlights = "default", 		-- "never", "rare", "default", "often", "always"

		-- UNPREPARED
		berrybush = "default", 			-- "never", "rare", "default", "often", "always"
		mushroom = "default", 			-- "never", "rare", "default", "often", "always"
		banana = "default", 			-- "never", "rare", "default", "often", "always"
		lichen = "default", 			-- "never", "rare", "default", "often", "always"

		-- ANIMALS
		cave_ponds = "default", 		-- "never", "rare", "default", "often", "always"
		slurper = "default", 			-- "never", "rare", "default", "often", "always"
		bunnymen = "default", 			-- "never", "rare", "default", "often", "always"
		slurtles = "default", 			-- "never", "rare", "default", "often", "always"
		rocky = "default", 				-- "never", "rare", "default", "often", "always"
		monkey = "default", 			-- "never", "rare", "default", "often", "always"

		-- MONSTERS
		cave_spiders = "default", 		-- "never", "rare", "default", "often", "always"
		tentacles = "default", 			-- "never", "rare", "default", "often", "always"
		chess = "default", 				-- "never", "rare", "default", "often", "always"
		liefs = "default", 				-- "never", "rare", "default", "often", "always"
		bats = "default", 				-- "never", "rare", "default", "often", "always"
		fissure = "default", 			-- "never", "rare", "default", "often", "always"
		wormattacks = "default", 		-- "never", "rare", "default", "often", "always"
		worms = "default" 				-- "never", "rare", "default", "often", "always"
	},
  required_prefabs={ "multiplayer_portal" },
  substitutes={  },
  version=4 
}