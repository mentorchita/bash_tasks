#!/bin/bash
# Головний скрипт запусків автоперевірки

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

TOTAL_TESTS=6
PASSED_TESTS=0

echo "=========================================="
echo "🧪 Запуск автоматичної перевірки Bash-завдань"
echo "=========================================="
echo ""

run_test() {
    local test_script=$1
    local task_name=$2
    
    if [ -f "$test_script" ]; then
        bash "$test_script"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}PASSED${NC}: $task_name"
            PASSED_TESTS=$((PASSED_TESTS+1))
        else
            echo -e "${RED}FAILED${NC}: $task_name"
        fi
    else
        echo -e "${RED}ERROR${NC}: Скрипт перевірки $test_script не знайдено!"
    fi
    echo "------------------------------------------"
}

run_test "tests/test_task1.sh" "Завдання 1 (Shebang та Лапки)"
run_test "tests/test_task2.sh" "Завдання 2 (Аргументи та $0)"
run_test "tests/test_task3.sh" "Завдання 3 (Арифметика та цілі числа)"
run_test "tests/test_task4.sh" "Завдання 4 (Числові умовні оператори)"
run_test "tests/test_task5.sh" "Завдання 5 (Перевірка файлу та while read)"
run_test "tests/test_task6.sh" "Завдання 6 (Масиви та довжина \${#var})"

echo ""
echo "=========================================="
echo "Підсумок: $PASSED_TESTS з $TOTAL_TESTS завдань виконано успішно."
echo "=========================================="

if [ $PASSED_TESTS -eq $TOTAL_TESTS ]; then
    echo -e "${GREEN}🎉 Вітаємо! Усі завдання виконано успішно!${NC}"
    exit 0
else
    echo -e "${RED}❌ Деякі завдання потребують допрацювання.${NC}"
    exit 1
fi
