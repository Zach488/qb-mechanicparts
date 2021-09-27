# WIP

# A Mechanic Job for QBCore Framework


Preview : 

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 19/08/2021.

- No support will be given to people using scripts created outside of the QBCore Framework meaning external scripts such as aj-inventory.


## Dependencies :

QB Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

nh-context - https://github.com/nerohiro/nh-context (owner removed script)

nh-keyboard - https://github.com/nerohiro/nh-keyboard (owner removed script)


## Credits : 

Kyle

## To Do 
- Nothing Yet




## Insert into #qb-core - Shared.lua

```
QBShared.Items = {

	["engine0"] 		 	 	  = {["name"] = "engine0", 							["label"] = "Stock Engine A", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_a.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stock Engine"},
	["engine1"] 		 	 	  = {["name"] = "engine1", 							["label"] = "Engine Upgrade B", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_b.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 1"},
	["engine2"] 		 	 	  = {["name"] = "engine2", 							["label"] = "Engine Upgrade C", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_c.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 2"},
	["engine3"] 		 	 	  = {["name"] = "engine3", 							["label"] = "Engine Upgrade D", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_d.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 3"},
	["engine4"] 		 	 	  = {["name"] = "engine4", 							["label"] = "Engine Upgrade S", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_s.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 4"},

	["brake0"] 		 	 		  = {["name"] = "brake0", 							["label"] = "Stock Brakes A", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_a.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stock Engine"},
	["brake1"] 		 	 	      = {["name"] = "brake1", 							["label"] = "Brakes Upgrade B", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_b.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 1"},
	["brake2"] 		 	 		  = {["name"] = "brake2", 							["label"] = "Brakes Upgrade C", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_c.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 2"},
	["brake3"] 		 	 		  = {["name"] = "brake3", 							["label"] = "Brakes Upgrade S", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_s.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 3"},

	["transmission0"] 		 	  = {["name"] = "transmission0", 					["label"] = "Stock Transmission A", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_a.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stock Engine"},
	["transmission1"] 		 	  = {["name"] = "transmission1", 					["label"] = "Transmission Upgrade B", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_b.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 1"},
	["transmission2"] 		 	  = {["name"] = "transmission2", 					["label"] = "Transmission Upgrade C", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_c.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 2"},
	["transmission3"] 		 	  = {["name"] = "transmission3", 					["label"] = "Transmission Upgrade S", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_s.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 3"},

	
	["suspension0"] 		 	  = {["name"] = "suspension0", 						["label"] = "Stock Suspension A", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stock Engine"},
	["suspension1"] 		 	  = {["name"] = "suspension1", 						["label"] = "Suspension Upgrade B", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 1"},
	["suspension2"] 		 	  = {["name"] = "suspension2", 						["label"] = "Suspension Upgrade C", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 2"},
	["suspension3"] 		 	  = {["name"] = "suspension3", 						["label"] = "Suspension Upgrade S", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "race_suspension.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 3"},

	["turbo0"] 		 	 		  = {["name"] = "turbo0", 							["label"] = "Remove Turbo", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "turbo.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stock Engine"},
	["turbo1"] 		 	 		  = {["name"] = "turbo1", 							["label"] = "Turbo Upgrade", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "turbo.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine Upgrade 1"},

}
```

```
QBShared.Jobs = {
    ["gasmonkey"] = {
		label = "GassMonkeyy",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Fuck Up",
                payment = 50
            },
			['1'] = {
                name = "Oil Turner",
                payment = 75
            },
			['2'] = {
                name = "Spark Ignition",
                payment = 100
            },
			['3'] = {
                name = "Engine Cease",
                payment = 125
            },
			['4'] = {
                name = "Big Mike",
				isboss = true,
                payment = 150
            },
        },
	},
}		
```



## Insert into #qb-bossmenu - config.lua
```
['gasmonkey'] = vector3(, , )),
```

## Insert into #qb-target - config.lua - config.targetmodels
```
Config.TargetBones = {
["mechanic"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r"
        },
        options = {
            {
                type = "client",
                event = "qb-mechanicparts:VehicleMenu",
                icon = "fad fa-key",
                label = "Vehicle Menu",
                job = "gasmonkey",
            },
        },
        distance = 3.0
    },
}

```


