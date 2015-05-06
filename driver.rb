require './functions'

root = TkRoot.new do
	title "Warframe Tracker"
	minsize(500,500)
end

category = 0

TkLabel.new(root) do

	choice = nil

	frame = TkFrame.new(root) {padx 125 ; pady 5 ; pack("side" => "top")}

	output = TkListbox.new(root) {height 30 ; width 25 ; font TkFont.new('courier 8') ; pack("side" => "left")}
	scrollBar = TkScrollbar.new(root) {command(proc{|*args| output.yview *args})}
	scrollBar.pack('side' => 'left', 'fill' => 'y')
	output.yscrollcommand(proc { |first,last| scrollBar.set(first,last) })
	changeOpt = TkCombobox.new(root)

	changeButton = TkButton.new(root) {text 'Change'; command(proc{changeOwnStatus(changeOpt.get.to_s, category); output.value = getDisplay(root,changeOpt,category)}) ; pack("side" => "right")}

	wButton = TkButton.new(frame) {text 'Warframes'; command(proc{output.value = displayWarframes(root,changeOpt); category = 1}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Primaries' ; command(proc{output.value = displayPrimaries(root,changeOpt); category = 2}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Secondaries' ; command(proc{output.value = displaySecondaries(root,changeOpt); category = 3}) ; pack("side" => "left")}
	wButton = TkButton.new(frame) {text 'Melees' ; command(proc{output.value = displayMelees(root,changeOpt); category = 4}) ; pack("side" => "left")}
	
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