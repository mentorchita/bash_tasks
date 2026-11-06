#!/bin/bash
TASK="tasks/task4_grade_check.sh"

if [ ! -f "$TASK" ]; then exit 1; fi

OUT95=$(echo "95" | bash "$TASK" 2>&1)
OUT75=$(echo "75" | bash "$TASK" 2>&1)
OUT40=$(echo "40" | bash "$TASK" 2>&1)

echo "$OUT95" | grep -q "Відмінно" && echo "$OUT75" | grep -q "Зараховано" && echo "$OUT40" | grep -q "Незараховано"
if [ $? -eq 0 ]; then
    exit 0
else
    echo "Невідповідність класифікації оцінок!"
    exit 1
fi
