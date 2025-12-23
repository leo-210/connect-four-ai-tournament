#!/bin/bash

BENCH_TIMEOUT=5
BENCH_SETS_NB=4
MATCH_TIMEOUT=10
MAX_DEPTH=20


if [ "$#" -ne 2 ]; then
	echo "Usage: $0 concurrent1.ml concurrent2.ml"
	exit 1
fi

if [ ! -d "run" ]; then
	echo "Le dossier 'run' n'existe pas"
	exit 1
fi

cd "$(dirname "$0")" || exit 1


rm "run/ia1.ml"
rm "run/ia2.ml"
cp "$1" "run/ia1.ml"
cp "$2" "run/ia2.ml"

cd run || exit 1
make > /dev/null || exit 1

d1=("$MAX_DEPTH")
for set in $(seq 0 "$((BENCH_SETS_NB - 1))"); do
	d1+=(0)
	for i in $(seq 1 "$((d1[-2] + 1))"); do
		d1[-1]="$((i - 1))"
		r=$(./match bench 1 "$i" "${BENCH_TIMEOUT}" "${set}")
		if [ "$r" == "timeout" ]; then
			break
		fi
	done
	echo "${d1[-1]}"
done
echo "${d1[-1]}"

d2=("$MAX_DEPTH")
for set in $(seq 0 "$((BENCH_SETS_NB - 1))"); do
	d2+=(0)
	for i in $(seq 1 "$((d2[-2] + 1))"); do
		d2[-1]="$((i - 1))"
		r=$(./match bench 2 "$i" "${BENCH_TIMEOUT}" "${set}")
		if [ "$r" == "timeout" ]; then
			break
		fi
	done
done
echo "${d2[-1]}"

./match run "${d1[-1]}" "${d2[-1]}" ${MATCH_TIMEOUT}

