# Dark Souls Pathfinder — Deploy Guide
## Render (hosting) + Aiven (MySQL)

---

## 1. Pripremi Aiven bazu

1. Idi na [console.aiven.io](https://console.aiven.io)
2. Otvori tvoj MySQL servis → **Overview** tab
3. Kopiraj connection podatke:
   - **Host** (npr. `mysql-xxx.aivencloud.com`)
   - **Port** (obično `3306`)
   - **Database** → klikni **+ Create database** → nazovi je `darksouls_pathfinder`
   - **User**: `avnadmin`
   - **Password**: tvoja Aiven lozinka
4. Idi na **Databases** → Connect → odaberi **Query editor**
5. Izvrši redom:
   ```
   Sadržaj datoteke db/schema.sql
   Sadržaj datoteke db/seed.sql
   ```

---

## 2. Postavi GitHub repozitorij

```bash
# U mapi projekta:
git init
git add .
git commit -m "Dark Souls Pathfinder - initial commit"
git branch -M main

# Na GitHub.com kreiraj novi repozitorij, pa:
git remote add origin https://github.com/TVOJE_IME/darksouls-pathfinder.git
git push -u origin main
```

> **.env fajl NIKADA ne pushaj** — on je u `.gitignore`

---

## 3. Deploji na Render

1. Idi na [render.com](https://render.com) → **New** → **Web Service**
2. Spoji GitHub account i odaberi repozitorij `darksouls-pathfinder`
3. Postavke:
   - **Name**: `darksouls-pathfinder`
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `node server/index.js`
   - **Region**: Europe (Frankfurt) ili najbliže

4. **Environment Variables** (idi na Environment tab):

| Key | Value |
|-----|-------|
| `NODE_ENV` | `production` |
| `PORT` | `3000` |
| `SESSION_SECRET` | neki dugačak random string (min 32 znaka) |
| `DB_HOST` | iz Aivena |
| `DB_PORT` | `3306` |
| `DB_NAME` | `darksouls_pathfinder` |
| `DB_USER` | `avnadmin` |
| `DB_PASSWORD` | iz Aivena |
| `DB_SSL` | `true` |
| `ADMIN_KEY` | tajni ključ za kreiranje admin accounta |

5. Klikni **Create Web Service** — Render buildira i deploja automatski
6. Svaki `git push` na `main` → automatski redeploy

---

## 4. Provjeri da radi

```
https://darksouls-pathfinder.onrender.com/api/health
```

Treba vratiti:
```json
{ "status": "ok", "timestamp": "..." }
```

---

## 5. Kreiraj Admin račun

Na live stranici:
1. Klikni ikonu korisnika (gore desno)
2. Registriraj se, čekiraj "Register as Admin"
3. Upiši **Admin Key** koji si postavio u environment varijablama
4. Pojavi se `⚔ Admin` gumb — ureduješ lore, vidiš korisnike, statistike

---

## Lokalni razvoj (bez deploya)

```bash
# Kopiraj .env.example u .env i popuni podatke
cp .env.example .env

# Pokreni server
npm run dev

# Otvori http://localhost:3000
```

---

## Troubleshooting

| Problem | Rješenje |
|---------|---------|
| `DB connection failed` | Provjeri DB_HOST, DB_PASSWORD u .env / Render env vars |
| `Cannot find module` | Pokreni `npm install` |
| Admin gumb se ne vidi | Provjeri ADMIN_KEY pri registraciji |
| Stranica ne učitava zone | Provjeri je li seed.sql izvršen u Aivenu |
| SSL greška | Provjeri `DB_SSL=true` |
