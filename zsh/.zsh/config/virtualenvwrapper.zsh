# Python virtualenvwrapper
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export PROJECT_HOME=$HOME/Devel
	source /usr/local/bin/virtualenvwrapper.sh
	export PIP_REQUIRE_VIRTUALENV="true"
fi
