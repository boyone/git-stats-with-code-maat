#!/usr/bin/env bash
# check data dir if not create it
[[ ! `ls -a data` ]] && `mkdir data`

if [ ${#@} -lt 1 ]; then
    echo "require at lease 1 parameter, eg. xlog 20181001"
    exit 1
fi

if [ ${#@} -gt 2 ]; then
    BEFORE=$1
    AFTER=$2
    PERIOD=$3
elif [ ${#@} -gt 1 ]; then
    PERIOD="--before=$1 --after=$2" 
    FILE="data/evo_$2_to_$1.log"
elif [ ${#@} -gt 0 ]; then
    PERIOD="--before=$1"
    FILE="data/evo_$1.log"
fi

eval "git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --no-merges --no-renames $PERIOD > $FILE"

#git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --no-merges --no-renames --before=2013-06-01 --after=2013-01-01 > data/evo.log

java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git > data/authors-revisions.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a abs-churn > data/abs-churn.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a age > data/age.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a author-churn > data/author-churn.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a authors > data/authors.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a communication > data/communication.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a coupling > data/coupling.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a entity-churn > data/entity-churn.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a entity-effort > data/entity-effort.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a entity-ownership > data/entity-ownership.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a fragmentation > data/fragmentation.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a identity > data/identity.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a main-dev > data/main-dev.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a main-dev-by-revs > data/main-dev-by-revs.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a messages > data/messages.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a refactoring-main-dev > data/refactoring-main-dev.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a revisions > data/revisions.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a soc > data/soc.csv
java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l data/evo*.log -c git -a summary > data/summary.csv