require './functions'
require './httpread'

root = TkRoot.new do
	title "Warframe Tracker"
	minsize(500,500)
end

category = -1

TkLabel.new(root) do

	choice = nil

	frame = TkFrame.new(root) {padx 125 ; pady 5 ; pack("side" => "top")}

	output = TkListbox.new(root) {height 30 ; width 25 ; font TkFont.new('courier 8') ; pack("side" => "left")}
	scrollBar = TkScrollbar.new(root) {command(proc{|*args| output.yview *args})}
	scrollBar.pack('side' => 'left', 'fill' => 'y')
	output.yscrollcommand(proc { |first,last| scrollBar.set(first,last) })
	changeOpt = TkCombobox.new(root)

	changeButton = TkButton.new(root) {text 'Change'; command(proc{changeOwnStatus(changeOpt.get.to_s, category); output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "right")}
	infoButton = TkButton.new(root) {text 'Info'; command(proc{output.value = getInfo(changeOpt.get.to_s, category);}) ; pack("side" => "right")}


	wButton = TkButton.new(frame) {text 'Warframes'; command(proc{category = 0; output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Primaries' ; command(proc{category = 1; output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Secondaries' ; command(proc{category = 2; output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Melees' ; command(proc{category = 3; output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "left")}
	
	# 	STDOUT.flush
	# 	choice = gets.chomp.to_i
	# 	system "cls"

	# 	if choice == 1
	# 		for w in  WARFRAMES
	# 			puts "%-20s\t%5s" % [w.name, w.isOwned]
	# 		end
	# 	elsif choice == 2
	# 		for p in  PRIMARIES
	# 			puts "%-20s\t%5s" % [p.name, p.isOwned]
	# 		end
	# 	elsif choice == 2
	# 		for s in  SECONDARIES
	# 			puts "%-20s\t%5s" % [s.name, s.isOwned]
	# 		end
	# 	elsif choice == 4
	# 		for m in  MELEES
	# 			puts "%-20s\t%5s" % [m.name, m.isOwned]
	# 		end
	# 	elsif choice == 5
	# 		changeOwnStatus()
	# 	end
			
	# 	puts "\nContinue (y/n)? "

	# 	loop do
	# 		STDOUT.flush
	# 		choice = gets.chomp
	# 		if choice == "n"
	# 			abort
	# 		end
	# 		break if choice == "y"
	# 	end
	# end

end
Tk.mainloop