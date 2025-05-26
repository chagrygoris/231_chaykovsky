# Архитектура компьютера и операционные системы

## Создание приватной копии репозитория

1. Нажмите кнопку `Use this template` (справа вверху).
2. Выберите `Create a new repository`.
3. В появившейся форме:
    - В поле `Owner` выберите свой личный аккаунт.
    - Задайте `Repository name`.
    - В списке `Visibility` отметьте `Private`.

## Настройка и синхронизация обновлений

Поскольку это не &laquo;fork&raquo;, кнопки &laquo;Sync fork&raquo; не будет. Чтобы получать изменения из данного шаблона, нужно добавить оригинал как удалённый репозиторий и подтягивать его вручную по инструкции ниже.

1. Склонируйте свой приватный репозиторий:
```bash
git clone git@github.com:username/repo_name.git destination
```

2. Откройте в терминале папку с репозиторием. 

3. Добавьте &laquo;upstream&raquo; &ndash; ссылку на этот шаблон‑репозиторий:
```bash
git remote add upstream \
  https://github.com/hseboris/hse_caos.git
```

4. Когда будут внесены изменения в оригинальный шаблон, внутри локального клона делаем:
```bash
git fetch upstream
```

5. Сливаем изменения в свою рабочую ветку (обычно `main`):
```bash
git checkout main
git merge upstream/main --allow-unrelated-histories -m "Merge upstream into my repo"
```
6. Отправляем обновления в свой приватный репозиторий на GitHub:
```bash
git push origin main
```

## Домашние задания

### [Assignment 1. C Programming Language (23:59 4 мая 2025 года)](os/lab02/README.md)

### [Assignment 2. Static and Shared Libraries (23:59 7 мая 2025 года)](os/lab04/README.md)

### [Assignment 3. Regular Expressions (23:59 12 мая 2025 года)](os/lab05/README.md)

### [Assignment 4. Processes (23:59 24 мая 2025 года)](os/lab06/README.md)

### [Assignment 5. Shell Scripts (23:59 29 мая 2025 года)](os/lab07/README.md)

### [Assignment 6. Threads and synchronization (23:59 4 июня 2025 года)](os/lab08/README.md)

### [Assignment 7. Inter-Process Communication (23:59 4 июня 2025 года)](os/lab09/README.md)