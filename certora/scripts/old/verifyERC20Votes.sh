make -C certora munged

if [ -z "$1" ]
  then
    echo "Incorrect number of arguments"
    echo ""
    echo "Usage: (from git root)"
    echo "  ./certora/scripts/`basename $0` [message describing the run]"
    echo ""
    exit 1
fi

msg=$1
shift 1

certoraRun \
    certora/harnesses/ERC20VotesHarness.sol \
    --verify ERC20VotesHarness:certora/specs/ERC20Votes.spec \
    --solc solc8.2 \
    --disableLocalTypeChecking \
    --optimistic_loop \
    --settings -copyLoopUnroll=4 \
    --send_only \
    --staging "alex/new-dt-hashing-alpha" \
    --msg "${msg}" \
