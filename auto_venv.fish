# Defined in /var/folders/7z/7p0_kxn92hx5j19278gxgw9r0000gn/T//fish.6l3bme/auto_venv.fish @ line 1
function auto_venv --description 'automatically activate venv (non-virtualfish)' --on-variable PWD
	status --is-command-substitution; and return
    functions -q deactivate; and deactivate
    test -f venv/bin/activate.fish; and source venv/bin/activate.fish
end
