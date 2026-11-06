#!/bin/bash
TASK="tasks/task1_greeting.sh"

if [ ! -f "$TASK" ]; then
    echo "Файл $TASK відсутній!"
    exit 1
fi

head -n 1 "$TASK" | grep -q "^#!/bin/bash"
if [ $? -ne 0 ]; then
    echo "Помилка: Перший рядок $TASK повинен містити Shebang #!/bin/bash!"
    exit 1
fi

OUTPUT=$(bash "$TASK" 2>&1)

echo "$OUTPUT" | grep -q "Привіт, Студент"
HAS_DOUBLE=$?

echo "$OUTPUT" | grep -q 'Привіт, $MY_NAME'
HAS_SINGLE=$?

if [ $HAS_DOUBLE -eq 0 ] && [ $HAS_SINGLE -eq 0 ]; then
    exit 0
else
    echo "Помилка виведення в $TASK. Перевірте використання подвійних та однарних лапок."
    exit 1
fi
