# Dark Souls Pathfinder

A companion web application for Dark Souls players — track your journey, rate zones and bosses, explore lore and world maps.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Vanilla JS (SPA), HTML5, CSS3 |
| Backend | Node.js + Express.js |
| Database | MySQL 8 (Aiven cloud) |
| Auth | bcryptjs + express-session |
| Hosting | Render |
| Fonts | Cinzel Decorative, IM Fell English (Google Fonts) |

## Features

- **Journey Tracking** — progress through DS1 zones and bosses in chronological order
- **Unlock System** — zones and bosses unlock only when prerequisites are met (enforced server-side)
- **Rating System** — rate zones (Appearance / Atmosphere / Fair Factor) and bosses (Design / Arena / Fair Factor), 1-10 scale with automatic average
- **Lore System** — hover to preview, click to read full lore; admins can add/edit lore inline
- **World Information** — wiki-style zone list, boss grid, and interactive SVG map of Lordran
- **Admin Panel** — user management, platform stats, lore editing for all zones and bosses
- **Auth** — register/login with bcrypt hashed passwords, role-based access (user / admin)

## Project Structure

```
darksouls-pathfinder/
├── server/
│   ├── index.js              # Express entry point
│   ├── db/connection.js      # Aiven MySQL pool
│   ├── middleware/auth.js    # requireAuth, requireAdmin
│   └── routes/               # auth, games, zones, bosses, progress, admin
├── public/
│   ├── index.html            # SPA shell
│   ├── css/                  # main, intro, hub, zones, admin, world
│   └── js/
│       ├── api.js            # Centralised fetch wrapper
│       ├── auth.js           # Modal, validation, session
│       ├── lore.js           # Lore read/edit modal system
│       ├── router.js         # SPA view router
│       └── views/            # intro, landing, hub, zones, boss, admin, world, literature
├── db/
│   ├── schema.sql            # All 7 tables
│   └── seed.sql              # DS1 zones, bosses, prerequisites
├── render.yaml               # Render deploy config
└── DEPLOY.md                 # Step-by-step deploy guide
```

## Setup

See [DEPLOY.md](./DEPLOY.md) for full instructions.

```bash
cp .env.example .env   # fill in your Aiven credentials
npm install
npm run dev            # http://localhost:3000
```

## Sources

See the **Sources** link in the application footer, or [literature view](public/js/views/literature.js).

---

*Dark Souls is a trademark of FromSoftware, Inc. This is a non-commercial educational project.*
