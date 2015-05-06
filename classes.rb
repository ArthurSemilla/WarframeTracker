# general Items base class

class Item
	def initialize(name)
		@name = name
		@level = 0
		@isOwned = false
		@isMaxed = false
	end

	attr_accessor :name
	attr_accessor :level
	attr_accessor :isOwned
	attr_accessor :isMaxed
end

# Warframes class

class Warframe < Item
	def initialize(name)
		super
		@isReactored = false
	end

	attr_accessor :isReactored
end

# Weapons classes

class Weapon < Item
	def initialize(name)
		super
		@isCatalysted = false
		@masteryRank = 0
		@weaponType = ""
		@physicalDmg = 0
		@impactDmg = 0
		@punctureDmg = 0
		@slashDmg = 0
		@critChance = 0
		@critMult = 0
		@attackSpeed = 0
		@statusChance = 0
		@elementDmg = 0
		@rank = 0
	end

		attr_accessor :isCatalysted
		attr_accessor :masteryRank
		attr_accessor :weaponType
		attr_accessor :physicalDmg
		attr_accessor :impactDmg
		attr_accessor :punctureDmg
		attr_accessor :slashDmg
		attr_accessor :critChance
		attr_accessor :critMult
		attr_accessor :attackSpeed
		attr_accessor :statusChance
		attr_accessor :elementDmg
		attr_accessor :rank
end

class Primary < Weapon
	def initialize(name)
		super
		@triggerType = ""
		@ammoType = ""
		@noiselevel = ""
		@accuracy = 0
		@magSize = 0
		@maxAmmo = 0
		@reloadTime = 0
		@fireRate = 0
	end

	attr_accessor :triggerType
	attr_accessor :ammoType
	attr_accessor :noiseLevel
	attr_accessor :accuracy
	attr_accessor :magSize
	attr_accessor :maxAmmo
	attr_accessor :reloadTime
	attr_accessor :fireRate
end

class Secondary < Weapon
	def initialize(name)
		super
		@triggerType = ""
		@ammoType = ""
		@noiselevel = ""
		@accuracy = 0
		@magSize = 0
		@maxAmmo = 0
		@reloadTime = 0
	end

	attr_accessor :triggerType
	attr_accessor :ammoType
	attr_accessor :noiseLevel
	attr_accessor :accuracy
	attr_accessor :magSize
	attr_accessor :maxAmmo
	attr_accessor :reloadTime
end

class Melee < Weapon
	def initialize(name)
		super
	end
end