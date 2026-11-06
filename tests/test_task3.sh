#!/bin/bash
TASK="tasks/task3_calc.sh"

if [ ! -f "$TASK" ]; then exit 1; fi

OUT=$(echo -e "100\n3" | bash "$TASK" 2>&1)

echo "$OUT" | grep -q "103"
HAS_SUM=$?

echo "$OUT" | grep -q "33"
HAS_DIV=$?

if [ $HAS_SUM -eq 0 ] && [ $HAS_DIV -eq 0 ]; then
    exit 0
else
    echo "Калькулятор вивів неправильний результат на введення 100 та 3 (очікувалося 103 та 33)!"
    exit 1
fi
