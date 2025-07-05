# Utiliser une image Python légère
FROM python:3.11-slim

# Définir le dossier de travail
WORKDIR /app

# Copier tous les fichiers dans l'image
COPY . .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port Flask
EXPOSE 5000

# Lancer l'app Flask
CMD ["python", "app.py", "--host=0.0.0.0"]
