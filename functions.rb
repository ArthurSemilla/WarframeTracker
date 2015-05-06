require './warframes'
require './primaries'
require './secondaries'
require './melees'
require 'tk'

def getDisplay(root,changeOpt,category)
	if category == 1
		return displayWarframes(root,changeOpt)
	elsif category == 2
		return displayPrimaries(root,changeOpt)
	elsif category == 3
		return displaySecondaries(root,changeOpt)
	elsif category == 4
		return displayMelees(root,changeOpt)
	end
end

def displayWarframes(root,changeOpt)
	items = Array.new
	for i in WARFRAMES
		items.push("%-20s\t%5s" % [i.name, i.isOwned])
	end
	changeOpt.values = items.map{|i| i=~/^(.+)\s/; $1}
	changeOpt.pack("side" => "right")
	return items
end

def displayPrimaries(root,changeOpt)
	items = Array.new
	for i in PRIMARIES
		items.push("%-20s\t%5s" % [i.name, i.isOwned])
	end
	changeOpt.values = items.map{|i| i=~/^(.+)\s/; $1}
	changeOpt.pack("side" => "right")
	return items
end

def displaySecondaries(root,changeOpt)
	items = Array.new
	for i in SECONDARIES
		items.push("%-20s\t%5s" % [i.name, i.isOwned])
	end
	changeOpt.values = items.map{|i| i=~/^(.+)\s/; $1}
	changeOpt.pack("side" => "right")
	return items
end

def displayMelees(root,changeOpt)
	items = Array.new
	for i in MELEES
		items.push("%-20s\t%5s" % [i.name, i.isOwned])
	end
	changeOpt.values = items.map{|i| i=~/^(.+)\s/; $1}
	changeOpt.pack("side" => "right")
	return items
end

def changeOwnStatus(choice, category)
	choice = choice.strip
	if category == 1
		item = findElement(WARFRAMES, choice)
		if item != nil
			item.isOwned = !(item.isOwned)
		end
	elsif category == 2
		item = findElement(PRIMARIES, choice)
		if item != nil
			item.isOwned = !(item.isOwned)
		end
	elsif category == 3
		item = findElement(SECONDARIES, choice)
		if item != nil
			item.isOwned = !(item.isOwned)
		end
	elsif category == 4
		item = findElement(MELEES, choice)
		if item != nil
			item.isOwned = !(item.isOwned)
		end
	end
	item.name
end

def findElement(list, elm)
	for i in 0..(Math.log(list.size) / Math.log(2)).ceil
		if elm == list[list.size/2].name
			return list[list.size/2]
		elsif (elm.casecmp list[list.size/2].name) == 1
			list = list[list.size/2..list.size-1]
		else
			list = list[0..list.size/2]
		end
	end
	return nil
end