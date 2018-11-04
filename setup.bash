
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
}


alias lndbtc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10002'
alias lndltc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10001'
alias btcctl='btcctl --simnet --rpcuser=xu --rpcpass=xu -c ~/xud-simnet/btcd/rpc.cert'
alias ltcctl='ltcctl --simnet --rpcuser=xu --rpcpass=xu --rpcserver=localhost:19556 -c ~/xud-simnet/ltcd/rpc.cert'
alias xucli='xucli -c ~/xud-simnet/xud-wd/tls.cert'

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

