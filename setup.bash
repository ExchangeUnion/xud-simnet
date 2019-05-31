function activate_venv {
 source ~/xud-simnet/raiden-wd/venv/bin/activate
}

function deactivate_venv {
	deactivate
	
}

make_dir () {
if ! mkdir "$1"; then
	echo "$1 already exists. Please run xud-simnet-clean to clean all leftovers before installing."
	exit 1
fi
}

delete_dir() {
	if ! rm -rf  $1 >/dev/null 2>&1; then
		echo "unable to delete directory $1"
		exit 1
	fi
	return 0
}

function is_running {
if pgrep -f  "$1" > /dev/null
then
    return 1
else
    return 0
fi
}

function confirm_not_running {
if ! is_running "$2"
then
    echo "$1 is running. Ensure all processes stopped before you continue. You may use xud-simnet-stop."
    exit 1
else
    return 0
fi
}

function confirm_all_not_running {
confirm_not_running "btcd" "btcd.*18555"
confirm_not_running "ltcd" "ltcd.*19555"
confirm_not_running "lndbtc" "lnd.*10012"
confirm_not_running "lndltc" "lnd.*10011"
confirm_not_running "xud" "node.*10002.*10001"
confirm_not_running "raiden" "raiden.*4321.*5001"
}


alias lndbtc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10002'
alias lndltc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10001'
alias btcctl='btcctl --simnet --rpcuser=xu --rpcpass=xu -c ~/xud-simnet/btcd/rpc.cert'
alias ltcctl='ltcctl --simnet --rpcuser=xu --rpcpass=xu --rpcserver=localhost:19556 -c ~/xud-simnet/ltcd/rpc.cert'
alias xucli='xucli -c ~/xud-simnet/xud-wd/tls.cert'
alias xud-log='less -i ~/xud-simnet/xud-wd/logs/xud.log'
alias xud-log-rm='rm -rf ~/xud-simnet/xud-wd/logs/xud.log'

export GOPATH=~/xud-simnet/go

export PATH=~/xud-simnet/xud/bin:$GOPATH/bin:~/xud-simnet/scripts:$PATH

case "$OSTYPE" in
  solaris*) echo "SOLARIS is not yet supported" ;;
  darwin*)  alias tac='tail -r';;
  linux*)   ;;
  bsd*)     echo "BSD is not yet supported" ;;
  msys*)    echo "WINDOWS is not yet supported" ;;
  *)        echo "$OSTYPE is not yet supported" ;;
esac

