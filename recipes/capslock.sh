if  grep --quiet "caps:ctrl_modifier" /etc/default/keyboard ;then
	echo "capslock already mapped. Skipping..."
else
	sudo sed -i 's|XKBOPTIONS=""|XKBOPTIONS="terminate:ctrl_alt_bksp,shift:both_capslock,caps:ctrl_modifier"|g' /etc/default/keyboard
fi
