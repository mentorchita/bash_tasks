#!/bin/bash
TASK="tasks/task2_check_param.sh"

if [ ! -f "$TASK" ]; then exit 1; fi

OUT_NO_ARG=$(bash "$TASK" 2>&1)
echo "$OUT_NO_ARG" | grep -i -q "Помилка"
if [ $? -ne 0 ]; then
    echo "Скрипт повинен виводити повідомлення про помилку при запуску без аргументів!"
    exit 1
fi

OUT_ARG=$(bash "$TASK" "Олексій" 2>&1)
echo "$OUT_ARG" | grep -q "Олексій"
if [ $? -ne 0 ]; then
    echo "Скрипт повинен використовувати аргумент $1!"
    exit 1
fi

exit 0
