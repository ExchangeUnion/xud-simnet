alias lndbtc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10002'
alias lndltc-lncli='lncli --network simnet --no-macaroons --rpcserver=localhost:10001'
alias btcctl='btcctl --simnet --rpcuser=xu --rpcpass=xu '
alias ltcctl='ltcctl --simnet --rpcuser=xu --rpcpass=xu --rpcserver=localhost:19556 '
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

