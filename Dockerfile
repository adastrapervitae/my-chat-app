# Используем версию Node.js 14.x в качестве базового образа
FROM node:14-alpine

# Создаем рабочую директорию
WORKDIR /app

# Копируем файл package.json и yarn.lock (если есть)
COPY package.json ./
COPY yarn.lock ./

# Устанавливаем зависимости
RUN yarn install

# Копируем остальные файлы приложения
COPY . .

# Собираем приложение
RUN yarn build

# Экспонируем порт 3000
EXPOSE 3000

# Запускаем приложение
CMD ["yarn", "start"]
