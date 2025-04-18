# نبدأ من صورة فيها بايثون بالنسخة اللي نبغاها
FROM python:3.8-slim

# نحدد مكان العمل داخل الحاوية
WORKDIR /app

# ننسخ ملفات المشروع إلى داخل الحاوية
COPY . .

# نثبت جميع المتطلبات (موجودة بملف requirements.txt)
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# نحدد المتغير PORT اللي يحتاجه fly.io
ENV PORT 5000

# نفتح البورت
EXPOSE 5000

# نشغل السيرفر
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
