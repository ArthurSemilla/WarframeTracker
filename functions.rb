require './corelist'
require 'tk'

def getDisplay(root,changeOpt,category)
	items = Array.new
	for i in ITEMS[category]
		items.push("%-20s\t%5s" % [i.name, i.isOwned])
	end
	changeOpt.values = items.map{|i| i=~/^(.+)\s/; $1}
	changeOpt.pack("side" => "right")
	return items
end

def changeOwnStatus(choice, category)
	choice = choice.strip
	item = findElement(ITEMS[category], choice)
	if item != nil
		item.isOwned = !(item.isOwned)
	end
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