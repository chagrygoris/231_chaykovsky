<<<<<<< HEAD
# Interposition

## 📝 Условие

Improve [Task 1 from Part 1](https://andrewt0301.github.io/hse-acos-course/part2os/04_Linking/libs.html):
- Provide _link-time_ interpositioning for the fred and john functions.
- Provide _load-time_ interpositioning for the bill and sam functions.
- Create a Make script to build the program.

## ℹ️ Примечание

- Вам нужно только написать `Makefile`.
- В GitHub Actions автотесты запускаются внутри контейнера с операционной системой Ubuntu.

## ⚙️ Быстрая сборка и тесты

```bash
cd 02_interposition
make                                  # собрать программу
make run                              # пропишите в cmake запуск
                                      # (в том числе вывод используемых динамических библиотек)
```

## 🧹 Очистка

```bash
make clean
```

## 🚀 Автотесты в GitHub Actions

```bash
git add .
git commit -m "Ваше сообщение"
git push                              # результат проверки появится в Actions ✅
```
=======
# Assigment 1. C Programming Language
## Мягкий дедлайн: 23:59 4 мая 2025 года

[Задача 1. Swap](01_swap/README.md)

[Задача 2. Array Reverse](02_array_reverse/README.md)

[Задача 3. Matrix Transpose](03_matrix_transpose/README.md)

[Задача 4. List Reverse](04_list_reverse/README.md)
>>>>>>> upstream/main
