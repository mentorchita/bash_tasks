#!/bin/bash
TASK="tasks/task6_array_demo.sh"

if [ ! -f "$TASK" ]; then exit 1; fi

OUT=$(bash "$TASK" 2>&1)

echo "$OUT" | grep -q "nginx" && echo "$OUT" | grep -q "postgresql"
if [ $? -eq 0 ]; then
    exit 0
else
    echo "Не виявлено перебору масиву!"
    exit 1
fi
