#!/bin/bash
TASK="tasks/task5_process_file.sh"

if [ ! -f "$TASK" ]; then exit 1; fi

echo -e "nginx\npostgresql\ndocker" > services.txt

OUT=$(bash "$TASK" 2>&1)
rm -f services.txt

echo "$OUT" | grep -q "1:" && echo "$OUT" | grep -q "nginx"
if [ $? -eq 0 ]; then
    exit 0
else
    echo "Скрипт не зміг прочитати та пронумерувати рядки з services.txt!"
    exit 1
fi
