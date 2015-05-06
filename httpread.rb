require 'open-uri'
require './primaries'

for i in PRIMARIES
	sleep(0.5)
	i.name = i.name.sub(" ", "_")
	url = "http://warframe.wikia.com/wiki/"+i.name
	source = open(url, &:read)

	if source =~ /class=\"name\"> .*\n/
		name = source[/class=\"name\"> .*\n/].split()[1..-1].join(" ")
		puts "Name: #{name}"
	end

	if source =~ /Mastery Level<\/a><\/b>\n<\/td><td class=\"right\"> [0-9]/
		rank = source[/Mastery Level<\/a><\/b>\n<\/td><td class=\"right\"> [0-9]/].split()[4]
		puts "Mastery Rank: #{rank}"
	end

	if source =~ /Weapon Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z]*/
		weaponType = source[/Weapon Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z]*/].split()[4]
		puts "Weapon Type: #{weaponType}"
	end

	if source =~ /Trigger Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/
		triggerType = source[/Trigger Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/].split()[4]
		puts "Trigger Type: #{triggerType}"
	end

	if source =~ /Ammo Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/
		ammoType = source[/Ammo Type<\/b>\n<\/td><td class=\"right\"> [A-Za-z\-]*/].split()[4]
		puts "Ammo Type: #{ammoType}"
	end

	if source.include? "Alarming"
		noiseLevel = "Alarming"
	elsif source.include? "Silent"
		noiseLevel = "Silent"
	end
	if noiseLevel != nil
		puts "Noise Level: #{noiseLevel}"
	end

	if source =~ /Fire Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		fireRate = source[/Fire Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds/sec"
		puts "Fire Rate: #{fireRate}"
	end

	if source =~ /Accuracy<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		accuracy = source[/Accuracy<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		puts "Accuracy: #{accuracy}"
	end

	if source =~ /Magazine Size<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		magSize = source[/Magazine Size<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds/mag"
		puts "Mag Size: #{magSize}"
	end

	if source =~ /Max Ammo<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		maxAmmo = source[/Max Ammo<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " rounds"
		puts "Max Ammo: #{maxAmmo}"
	end

	if source =~ /Reload<\/a> Time<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		reloadTime = source[/Reload<\/a> Time<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4] + " sec"
		puts "Reload Time: #{reloadTime}"
	end

	if source =~ /Physical Damage<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		physicalDmg = source[/Physical Damage<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		puts "Physical Damage: #{physicalDmg}"
	end

	if source =~ /Impact<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		impactDmg = source[/Impact<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		puts "Impact Damage: #{impactDmg}"
	end

	if source =~ /Puncture<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		punctureDmg = source[/Puncture<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		puts "Puncture Damage: #{punctureDmg}"
	end

	if source =~ /Slash<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		slashDmg = source[/Slash<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[3]
		puts "Slash Damage: #{slashDmg}"
	end

	if source =~ /Crit Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/
		critChance = source[/Crit Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/].split()[4]
		puts "Crit Chance: #{critChance}"
	end

	if source =~ /Crit Multiplier<\/b>\n<\/td><td class=\"right\"> [0-9\.]*x/
		critMult = source[/Crit Multiplier<\/b>\n<\/td><td class=\"right\"> [0-9\.]*x/].split()[4]
		puts "Crit Multiplier: #{critMult}"
	end

	if source =~ /Attack Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		attackSpeed = source[/Attack Rate<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		puts "Attack Speed: #{attackSpeed}"
	end

	if source =~ /Status Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/
		statusCh = source[/Status Chance<\/a><\/b>\n<\/td><td class=\"right\"> [0-9\.]*%/].split()[4]
		puts "Status Chance: #{statusCh}"
	end

	if source =~ /Elemental Dmg<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/
		elementDmg = source[/Elemental Dmg<\/b>\n<\/td><td class=\"right\"> [0-9\.]*/].split()[4]
		puts "Elemental Damage: #{elementDmg}"
	end
end