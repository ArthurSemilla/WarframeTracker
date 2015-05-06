require "tk"

parent = scroll = nil

parent = TkListbox.new {
  yscroll proc{|idx|
  scroll.set *idx
  }
  width 20
  height 16
  setgrid 1
  pack('side' => 'left', 'fill' => 'y', 'expand' => 1)
}

s = Tk::Tile::Scrollbar.new(parent) {orient "vertical"; 
        command proc{|*args| l.yview(*args);} }
l['yscrollcommand'] = proc{|*args| s.set(*args);}

for f in Dir.glob("*")
  parent.insert 'end', f
end

Tk.mainloop