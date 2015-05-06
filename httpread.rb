require 'open-uri'
require './primaries'

for i in PRIMARIES
	sleep(0.5)
	i.name = i.name.sub(" ", "_")
	url = "http://warframe.wikia.com/wiki/"+i.name
	source = open(url, &:read)

	if source =~ /class=\"name\"> .*\n/
		name = source[/class=\"name\"> .*\n/].split()[1..-1].join(" ")
		i.name = name
	end

	if source =~ /Mastery Level<\/a><\/b>\n<\/td><td class=\"right\"> [0-9]/
		rank = source[/Mastery Level<\/a><\/b>\n<\/td><td class=\"right\"> [0-9]/].split()[4]
		i.rank = rank
	end

	if source =~ /Weapon Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z]*/
		weaponType = source[/Weapon Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z]*/].split()[4]
		i.weaponType = weaponType
	end

	if source =~ /Trigger Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/
		triggerType = source[/Trigger Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/].split()[4]
		i.triggerType=  triggerType
	end

	if source =~ /Ammo Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/
		ammoType = source[/Ammo Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/].split()[4]
		i.ammoType=  ammoType
	end

	if source.include? "Alarming"
		noiseLevel = "Alarming"
	elsif source.include? "Silent"
		noiseLevel = "Silent"
	end
	if noiseLevel != nil
		i.noiseLevel = noiseLevel
	end

	if source =~ /Fire Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		fireRate = source[/Fire Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds/sec"
		i.fireRate=  fireRate
	end

	if source =~ /Accuracy<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		accuracy = source[/Accuracy<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		i.accuracy=  accuracy
	end

	if source =~ /Magazine Size<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		magSize = source[/Magazine Size<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds/mag"
		i.magSize=  magSize
	end

	if source =~ /Max Ammo<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		maxAmmo = source[/Max Ammo<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds"
		i.maxAmmo=  maxAmmo
	end

	if source =~ /Reload<\/a> Time<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		reloadTime = source[/Reload<\/a> Time<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " sec"
		i.reloadTime=  reloadTime
	end

	if source =~ /Physical Damage<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		physicalDmg = source[/Physical Damage<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		i.physicalDmg=  physicalDmg
	end

	if source =~ /Impact<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		impactDmg = source[/Impact<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		i.impactDmg=  impactDmg
	end

	if source =~ /Puncture<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		punctureDmg = source[/Puncture<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		i.punctureDmg = punctureDmg
	end

	if source =~ /Slash<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		slashDmg = source[/Slash<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		i.slashDmg = slashDmg
	end

	if source =~ /Crit Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/
		critChance = source[/Crit Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/].split()[4]
		i.critChance = critChance
	end

	if source =~ /Crit Multiplier<\/b>\n<\/td><td class=\"right\"> [0-9\.]*x/
		critMult = source[/Crit Multiplier<\/b>\n<\/td><td class=\"right\"> [0-9\.]*x/].split()[4]
		i.critMult = critMult
	end

	if source =~ /Attack Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		attackSpeed = source[/Attack Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		i.attackSpeed = attackSpeed
	end

	if source =~ /Status Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/
		statusChance = source[/Status Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/].split()[4]
		i.statusChance = statusChance
	end

	if source =~ /Elemental Dmg<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		elementDmg = source[/Elemental Dmg<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		i.elementDmg = elementDmg
	end
end