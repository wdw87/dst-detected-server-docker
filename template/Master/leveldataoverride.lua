return {
  desc="标准《饥荒》体验。",
  hideminimap=false,
  id="SURVIVAL_TOGETHER",
  location="forest",
  max_playlist_position=999,
  min_playlist_position=0,
  name="默认",
  numrandom_set_pieces=4,
  override_level_string=false,
  overrides={
		-- MISC
		task_set = "default", 			-- "classic", "default", "cave_default"
		start_location = "default", 	-- "caves", "default", "plus", "darkness"
		world_size = "medium", 		-- "small", "medium", "default", "huge"
		branching = "default", 			-- "never", "least", "default", "most"
		loop = "default", 				-- "never", "default", "always"
		specialevent = "default",       -- "none", "default", "hallowed_nights", "winters_feast", "year_of_the_gobbler"
		autumn = "default", 			-- "noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
		winter = "default", 			-- "noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
		spring = "default", 			-- "noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
		summer = "default", 			-- "noseason", "veryshortseason", "shortseason", "default", "longseason", "verylongseason", "random"
		season_start = "default", 		-- "default", "winter", "spring", "summer", "autumnorspring", "winterorsummer", "random"
		day = "default", 				-- "default", "longday", "longdusk", "longnight", "noday", "nodusk", "nonight", "onlyday", "onlydusk", "onlynight"
		weather = "default", 			-- "never", "rare", "default", "often", "always"
		lightning = "default", 			-- "never", "rare", "default", "often", "always"
		frograin = "rare", 			-- "never", "rare", "default", "often", "always"
		wildfires = "default", 			-- "never", "rare", "default", "often", "always"
		regrowth = "default", 			-- "veryslow", "slow", "default", "fast", "veryfast"
		touchstone = "default", 		-- "never", "rare", "default", "often", "always"
		boons = "default", 				-- "never", "rare", "default", "often", "always"
		disease_delay = "none", 		-- "none", "random", "long", "default", "short"
		prefabswaps_start = "default", 	-- "classic", "default", "highly random"
    petrification = "default", 		-- "none", "few", "default", "many", "max"
    has_ocean=true,
    keep_disconnected_tiles=true,
    layout_mode="LinkNodesByKeys",
    no_joining_islands=true,
    no_wormholes_to_disconnected_tiles=true,
    roads="default",
    wormhole_prefab="wormhole"，

		-- RESOURCES
		flowers = "default", 			-- "never", "rare", "default", "often", "always"
		grass = "default", 				-- "never", "rare", "default", "often", "always"
		sapling = "default", 			-- "never", "rare", "default", "often", "always"
		marshbush = "default", 			-- "never", "rare", "default", "often", "always"
		tumbleweed = "default", 		-- "never", "rare", "default", "often", "always"
		reeds = "default", 				-- "never", "rare", "default", "often", "always"
		trees = "default", 				-- "never", "rare", "default", "often", "always"
		flint = "default", 				-- "never", "rare", "default", "often", "always"
		rock = "default", 				-- "never", "rare", "default", "often", "always"
		rock_ice = "default", 			-- "never", "rare", "default", "often", "always"
		meteorspawner = "default", 		-- "never", "rare", "default", "often", "always"
		meteorshowers = "default", 		-- "never", "rare", "default", "often", "always"

		-- UNPREPARED
		berrybush = "default", 			-- "never", "rare", "default", "often", "always"
		carrot = "default", 			-- "never", "rare", "default", "often", "always"
		mushroom = "default", 			-- "never", "rare", "default", "often", "always"
		cactus = "default", 			-- "never", "rare", "default", "often", "always"

		-- ANIMALS
		rabbits = "default", 			-- "never", "rare", "default", "often", "always"
		moles = "default", 				-- "never", "rare", "default", "often", "always"
		butterfly = "default", 			-- "never", "rare", "default", "often", "always"
		birds = "default", 				-- "never", "rare", "default", "often", "always"
		buzzard = "default", 			-- "never", "rare", "default", "often", "always"
		catcoon = "default", 			-- "never", "rare", "default", "often", "always"
		perd = "default", 				-- "never", "rare", "default", "often", "always"
		pigs = "default", 				-- "never", "rare", "default", "often", "always"
		lightninggoat = "default", 		-- "never", "rare", "default", "often", "always"
		beefalo = "default", 			-- "never", "rare", "default", "often", "always"
		beefaloheat = "default", 		-- "never", "rare", "default", "often", "always"
		hunt = "default", 				-- "never", "rare", "default", "often", "always"
		alternatehunt = "default", 		-- "never", "rare", "default", "often", "always"
		penguins = "default", 			-- "never", "rare", "default", "often", "always"
		ponds = "default", 				-- "never", "rare", "default", "often", "always"
		bees = "default", 				-- "never", "rare", "default", "often", "always"
		angrybees = "default", 			-- "never", "rare", "default", "often", "always"
		tallbirds = "default", 			-- "never", "rare", "default", "often", "always"

		-- MONSTERS
		spiders = "default", 			-- "never", "rare", "default", "often", "always"
		hounds = "default", 			-- "never", "rare", "default", "often", "always"
		houndmound = "default", 		-- "never", "rare", "default", "often", "always"
		merm = "default", 				-- "never", "rare", "default", "often", "always"
		tentacles = "default", 			-- "never", "rare", "default", "often", "always"
		chess = "default", 				-- "never", "rare", "default", "often", "always"
		lureplants = "default", 		-- "never", "rare", "default", "often", "always"
		walrus = "default", 			-- "never", "rare", "default", "often", "always"
		liefs = "default", 				-- "never", "rare", "default", "often", "always"
		deciduousmonster = "default", 	-- "never", "rare", "default", "often", "always"
		krampus = "default", 			-- "never", "rare", "default", "often", "always"
		bearger = "default", 			-- "never", "rare", "default", "often", "always"
		deerclops = "default", 			-- "never", "rare", "default", "often", "always"
		goosemoose = "default", 		-- "never", "rare", "default", "often", "always"
		dragonfly = "default", 			-- "never", "rare", "default", "often", "always"
		antliontribute = "default"	 	-- "never", "rare", "default", "often", "always"
  },
  random_set_pieces={
    "Sculptures_2",
    "Sculptures_3",
    "Sculptures_4",
    "Sculptures_5",
    "Chessy_1",
    "Chessy_2",
    "Chessy_3",
    "Chessy_4",
    "Chessy_5",
    "Chessy_6",
    "Maxwell1",
    "Maxwell2",
    "Maxwell3",
    "Maxwell4",
    "Maxwell6",
    "Maxwell7",
    "Warzone_1",
    "Warzone_2",
    "Warzone_3" 
  },
  required_prefabs={ "multiplayer_portal" },
  required_setpieces={ "Sculptures_1", "Maxwell5" },
  substitutes={  },
  version=4 
}