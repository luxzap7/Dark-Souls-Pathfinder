/* ================================================
   world.js — Opcija B: World Information
   4 tabs: Overview | Zones | Bosses | Map
   All data from the backend API (AJAX)
   ================================================ */

Router.register('world', async (app, { gameId, game }) => {
  // Loading
  app.innerHTML = `<div class="spinner-wrap" style="position:relative;z-index:1">
    <div class="spinner"></div><span class="spinner-text">Loading the world…</span></div>`;

  let gameData;
  try { gameData = await API.games.get(gameId); }
  catch (err) {
    app.innerHTML = `<div class="error-state" style="position:relative;z-index:1">
      <div class="error-state__icon">📜</div>
      <div class="error-state__title">Failed to load</div>
      <div class="error-state__msg">${err.message}</div>
      <button class="btn-primary" style="width:auto;margin-top:8px"
        onclick="Router.back()">← Back</button>
    </div>`;
    return;
  }

  const { zones } = gameData;

  // Fetch all zone details in parallel to get bosses
  let allBosses = [];
  try {
    const zoneDetails = await Promise.all(zones.map(z => API.zones.get(z.id)));
    allBosses = zoneDetails.flatMap(d => d.bosses.map(b => ({ ...b, zoneName: d.zone.name, zoneId: d.zone.id })));
  } catch (_) {}

  const div = document.createElement('div');
  div.id = 'view-world';

  div.innerHTML = `
    <button class="back-btn" id="world-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
        <path d="M19 12H5M5 12l7-7M5 12l7 7"/>
      </svg>
      Back
    </button>

    <div class="world-header">
      <h1 class="world-header__title">${game?.title || 'Dark Souls'} — World</h1>
      <p class="world-header__sub">Lore, Locations &amp; Legends of ${gameId === 2 ? 'Drangleic' : gameId === 3 ? 'Lothric' : 'Lordran'}</p>
      <nav class="world-nav" role="tablist" aria-label="World sections">
        <button class="world-nav__btn active" data-tab="overview" role="tab" aria-selected="true">Overview</button>
        <button class="world-nav__btn" data-tab="zones"    role="tab" aria-selected="false">Zones</button>
        <button class="world-nav__btn" data-tab="bosses"   role="tab" aria-selected="false">Bosses</button>
        <button class="world-nav__btn" data-tab="map"      role="tab" aria-selected="false">Map</button>
      </nav>
    </div>

    <div class="world-body">
      <div id="tab-overview" class="world-tab">${renderOverview(zones, allBosses)}</div>
      <div id="tab-zones"    class="world-tab hidden">${renderZonesWiki(zones)}</div>
      <div id="tab-bosses"   class="world-tab hidden">${renderBossesWiki(allBosses)}</div>
      <div id="tab-map"      class="world-tab hidden">${renderMap(zones, gameId)}</div>
    </div>`;

  app.innerHTML = '';  
  app.appendChild(div);

  // Tab switching
  document.getElementById('world-back').addEventListener('click', () => Router.back());

  div.querySelectorAll('.world-nav__btn').forEach(btn => {
    btn.addEventListener('click', () => {
      div.querySelectorAll('.world-nav__btn').forEach(b => { b.classList.remove('active'); b.setAttribute('aria-selected','false'); });
      div.querySelectorAll('.world-tab').forEach(t => t.classList.add('hidden'));
      btn.classList.add('active');
      btn.setAttribute('aria-selected','true');
      document.getElementById(`tab-${btn.dataset.tab}`).classList.remove('hidden');
    });
  });

  // Zone row clicks → zone detail
  div.querySelectorAll('.wiki-zone-row[data-zone-id]').forEach(row => {
    row.addEventListener('click', () => {
      Router.navigate('zone', { zoneId: parseInt(row.dataset.zoneId), gameId, game });
    });
  });

  // Boss card clicks → boss detail
  div.querySelectorAll('.wiki-boss-card[data-boss-id]').forEach(card => {
    card.addEventListener('click', () => {
      const boss = allBosses.find(b => b.id === parseInt(card.dataset.bossId));
      Router.navigate('boss', {
        bossId:  parseInt(card.dataset.bossId),
        zoneId:  boss?.zoneId,
        zone:    { name: boss?.zoneName },
        gameId, game,
      });
    });
  });

  // Overview card clicks
  div.querySelectorAll('.world-overview-card[data-zone-id]').forEach(card => {
    card.addEventListener('click', () => {
      Router.navigate('zone', { zoneId: parseInt(card.dataset.zoneId), gameId, game });
    });
  });

  // Map node clicks
  div.querySelectorAll('.map-zone-node[data-zone-id]').forEach(node => {
    node.addEventListener('click', () => {
      Router.navigate('zone', { zoneId: parseInt(node.dataset.zoneId), gameId, game });
    });
  });
});

/* ──────────────────────────────────────────────────
   OVERVIEW TAB — highlights from each region
   ──────────────────────────────────────────────── */
function renderOverview(zones, bosses) {
  // Pick 6 zones as featured highlights
  const featured = zones.slice(0, 6);
  const totalRatings = zones.reduce((a, z) => a + (z.total_ratings || 0), 0);
  const topZone  = [...zones].sort((a,b) => (b.community_avg||0) - (a.community_avg||0))[0];
  const topBoss  = [...bosses].sort((a,b) => (b.community_avg||0) - (a.community_avg||0))[0];

  return `
    <!-- Quick stats -->
    <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin-bottom:36px">
      ${quickStat('Locations', zones.length, 'in Lordran')}
      ${quickStat('Bosses',    bosses.length, 'to face')}
      ${quickStat('Ratings',   totalRatings, 'by the community')}
      ${quickStat('Top Zone',  topZone?.community_avg ? topZone.name.split(' ')[0] : '—', topZone?.community_avg ? `${topZone.community_avg}/10` : 'unrated')}
    </div>

    <p class="world-section-title">Featured Locations</p>
    <div class="world-overview">
      ${featured.map(z => `
        <div class="world-overview-card" data-zone-id="${z.id}" style="cursor:pointer">
          <img class="world-overview-card__img"
               src="${z.image_url || '/assets/images/placeholder.svg'}"
               alt="${z.name}"
               onerror="this.src='/assets/images/placeholder.svg'" />
          <div class="world-overview-card__body">
            <h3 class="world-overview-card__title">${z.name}</h3>
            <p class="world-overview-card__text">${(z.description || '').slice(0, 160)}${z.description?.length > 160 ? '…' : ''}</p>
            <div class="world-overview-card__meta">
              <span class="world-overview-card__stat">Rating<span>${z.community_avg || 'Unrated'}</span></span>
              <span class="world-overview-card__stat">Votes<span>${z.total_ratings || 0}</span></span>
            </div>
          </div>
        </div>`).join('')}
    </div>`;
}

function quickStat(label, value, sub) {
  return `<div style="background:var(--bg-raised);border:1px solid var(--border);border-radius:var(--radius-md);padding:16px;text-align:center">
    <div style="font-family:var(--font-heading);font-size:10px;letter-spacing:.14em;color:var(--text-muted);text-transform:uppercase;margin-bottom:6px">${label}</div>
    <div style="font-family:var(--font-heading);font-size:1.4rem;color:var(--gold);line-height:1">${value}</div>
    <div style="font-size:11px;color:var(--text-secondary);margin-top:3px">${sub}</div>
  </div>`;
}

/* ──────────────────────────────────────────────────
   ZONES TAB — wiki-style sortable list
   ──────────────────────────────────────────────── */
function renderZonesWiki(zones) {
  return `
    <p class="world-section-title">All Locations — ${zones.length} zones</p>
    <div class="wiki-zone-list">
      ${zones.map(z => `
        <div class="wiki-zone-row" data-zone-id="${z.id}" tabindex="0" role="button" aria-label="${z.name}">
          <img class="wiki-zone-row__img"
               src="${z.image_url || '/assets/images/placeholder.svg'}"
               alt="${z.name}"
               onerror="this.src='/assets/images/placeholder.svg'" />
          <div class="wiki-zone-row__body">
            <div class="wiki-zone-row__name">${z.name}</div>
            <div class="wiki-zone-row__desc">${z.description || 'No description available.'}</div>
          </div>
          <div class="wiki-zone-row__meta">
            <div class="wiki-zone-row__rating">${z.community_avg ? `${z.community_avg}/10` : '—'}</div>
            <div class="wiki-zone-row__count">${z.total_ratings || 0} ratings</div>
          </div>
        </div>`).join('')}
    </div>`;
}

/* ──────────────────────────────────────────────────
   BOSSES TAB — grid of all bosses
   ──────────────────────────────────────────────── */
function renderBossesWiki(bosses) {
  if (!bosses.length) return `<p style="color:var(--text-muted);text-align:center;padding:40px">No boss data available.</p>`;
  return `
    <p class="world-section-title">All Bosses — ${bosses.length} encounters</p>
    <div class="wiki-boss-grid">
      ${bosses.map(b => `
        <div class="wiki-boss-card" data-boss-id="${b.id}" tabindex="0" role="button" aria-label="${b.name}">
          <img class="wiki-boss-card__img"
               src="${b.image_url || '/assets/images/placeholder.svg'}"
               alt="${b.name}"
               onerror="this.src='/assets/images/placeholder.svg'" />
          <div class="wiki-boss-card__body">
            <div class="wiki-boss-card__name">${b.name}</div>
            <div class="wiki-boss-card__zone">${b.zoneName}</div>
            <div class="wiki-boss-card__rating">${b.community_avg ? `★ ${b.community_avg}/10` : 'Unrated'}</div>
          </div>
        </div>`).join('')}
    </div>`;
}

/* ──────────────────────────────────────────────────
   MAP TAB — SVG map switching by gameId
   ──────────────────────────────────────────────── */
function renderMap(zones, gameId) {

  // ── DS1: Lordran ─────────────────────────────
  const ds1Layout = [
    { id: 1,  x: 340, y: 30,  label: 'Asylum',        w: 110 },
    { id: 2,  x: 310, y: 100, label: 'Firelink',       w: 110 },
    { id: 3,  x: 160, y: 170, label: 'Burg',           w: 95  },
    { id: 4,  x: 160, y: 240, label: 'Parish',         w: 95  },
    { id: 5,  x: 50,  y: 310, label: 'Darkroot',       w: 110 },
    { id: 6,  x: 260, y: 310, label: 'Depths',         w: 90  },
    { id: 7,  x: 210, y: 390, label: 'Blighttown',     w: 120 },
    { id: 8,  x: 420, y: 170, label: "Sen's",          w: 85  },
    { id: 9,  x: 500, y: 240, label: 'Anor Londo',     w: 120 },
    { id: 10, x: 500, y: 450, label: 'Tomb/Giants',    w: 130 },
    { id: 11, x: 90,  y: 460, label: 'Demon Ruins',    w: 125 },
    { id: 12, x: 70,  y: 540, label: 'Lost Izalith',   w: 125 },
    { id: 13, x: 500, y: 320, label: "Duke's Archive", w: 135 },
    { id: 14, x: 500, y: 390, label: 'Crystal Cave',   w: 125 },
    { id: 15, x: 340, y: 390, label: 'Catacombs',      w: 115 },
    { id: 16, x: 340, y: 460, label: 'New Londo',      w: 115 },
    { id: 17, x: 340, y: 550, label: 'Kiln',           w: 90  },
  ];
  const ds1Connections = [
    [1,2],[2,3],[3,4],[4,5],[4,6],[6,7],[4,8],[7,8],[8,9],
    [2,15],[15,10],[7,11],[11,12],[9,13],[13,14],[2,16],[17,9],[17,10],[17,12],[17,16]
  ];

  // ── DS2: Drangleic ───────────────────────────
  const ds2Layout = [
    { id: 18, x: 265, y: 25,  label: 'Things Betwixt', w: 135 },
    { id: 19, x: 280, y: 95,  label: 'Majula',          w: 100 },
    { id: 25, x: 40,  y: 165, label: "Huntsman's",      w: 110 },
    { id: 20, x: 220, y: 165, label: 'Fallen Giants',   w: 130 },
    { id: 21, x: 455, y: 165, label: "Heide's Tower",   w: 125 },
    { id: 26, x: 45,  y: 235, label: 'Harvest Valley',  w: 125 },
    { id: 29, x: 210, y: 235, label: 'Shaded Woods',    w: 120 },
    { id: 33, x: 348, y: 235, label: 'Black Gulch',     w: 110 },
    { id: 22, x: 460, y: 235, label: "No-Man's Wharf",  w: 130 },
    { id: 27, x: 50,  y: 305, label: 'Earthen Peak',    w: 115 },
    { id: 34, x: 195, y: 305, label: 'Brightstone Cove',w: 148 },
    { id: 23, x: 455, y: 305, label: 'Lost Bastille',   w: 125 },
    { id: 28, x: 60,  y: 375, label: 'Iron Keep',       w: 100 },
    { id: 24, x: 455, y: 375, label: "Sinner's Rise",   w: 120 },
    { id: 30, x: 248, y: 448, label: 'Drangleic Castle',w: 150 },
    { id: 31, x: 258, y: 518, label: 'Shrine of Amana', w: 140 },
    { id: 32, x: 265, y: 578, label: 'Undead Crypt',    w: 120 },
    { id: 35, x: 268, y: 638, label: 'Throne of Want',  w: 125 },
  ];
  const ds2Connections = [
    [18,19],
    [19,20],[19,25],
    [20,21],[20,29],[20,33],
    [21,22],
    [22,23],
    [23,24],
    [25,26],
    [26,27],
    [27,28],
    [29,34],
    [24,30],[28,30],[33,30],[34,30],
    [30,31],[31,32],[32,35]
  ];

  // ── DS3: Lothric ─────────────────────────────
  const ds3Layout = [
    { id: 36, x: 262, y: 25,  label: 'Cemetery of Ash',   w: 138 },
    { id: 37, x: 272, y: 95,  label: 'Firelink Shrine',   w: 125 },
    { id: 52, x: 28,  y: 165, label: 'Archdragon Peak',   w: 135 },
    { id: 39, x: 182, y: 165, label: 'Undead Settlement', w: 148 },
    { id: 38, x: 438, y: 165, label: 'High Wall',         w: 110 },
    { id: 40, x: 162, y: 235, label: 'Road of Sacrifices',w: 148 },
    { id: 49, x: 438, y: 235, label: 'Lothric Castle',    w: 128 },
    { id: 41, x: 42,  y: 305, label: 'Cathedral',         w: 110 },
    { id: 42, x: 220, y: 305, label: 'Farron Keep',       w: 108 },
    { id: 50, x: 438, y: 305, label: 'Grand Archives',    w: 125 },
    { id: 43, x: 202, y: 375, label: 'Catacombs Carthus', w: 145 },
    { id: 51, x: 440, y: 375, label: 'Untended Graves',   w: 132 },
    { id: 44, x: 72,  y: 445, label: 'Smouldering Lake',  w: 138 },
    { id: 45, x: 262, y: 445, label: 'Irithyll',          w: 98  },
    { id: 48, x: 418, y: 445, label: 'Anor Londo',        w: 110 },
    { id: 46, x: 255, y: 515, label: 'Irithyll Dungeon',  w: 132 },
    { id: 47, x: 418, y: 515, label: 'Profaned Capital',  w: 138 },
    { id: 53, x: 265, y: 635, label: 'Kiln of 1st Flame', w: 142 },
  ];
  const ds3Connections = [
    [36,37],
    [37,38],[37,39],
    [38,39],[38,49],
    [39,40],[39,52],
    [40,41],[40,42],
    [42,43],
    [43,44],[43,45],
    [45,46],[45,48],
    [46,47],
    [49,50],[49,51],
    [42,53],[48,53],[47,53],[50,53]
  ];

  const layout      = gameId === 3 ? ds3Layout      : gameId === 2 ? ds2Layout      : ds1Layout;
  const connections = gameId === 3 ? ds3Connections  : gameId === 2 ? ds2Connections  : ds1Connections;

  const svgH  = gameId === 2 ? 690 : gameId === 3 ? 690 : 630;
  const nodeH = 28;

  const mapName  = gameId === 3 ? 'Lothric' : gameId === 2 ? 'Drangleic' : 'Lordran';
  const mapIntro = gameId === 3
    ? 'A schematic map of Lothric — the kingdom at the end of the Age of Fire.'
    : gameId === 2
    ? 'A schematic map of Drangleic — the kingdom built on the bones of countless cycles.'
    : 'A schematic map of Lordran — the cursed kingdom of the undead.';

  // Region label bands
  const regionBands = gameId === 3 ? `
    <text x="330" y="75" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">CEMETERY OF ASH</text>
    <line x1="40" y1="148" x2="620" y2="148" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="415" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">THE KINGDOM OF LOTHRIC</text>
    <line x1="40" y1="428" x2="620" y2="428" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="610" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">KILN OF THE FIRST FLAME</text>
  ` : gameId === 2 ? `
    <text x="330" y="75" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">THINGS BETWIXT / MAJULA</text>
    <line x1="40" y1="148" x2="620" y2="148" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="420" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">THE REALM OF DRANGLEIC</text>
    <line x1="40" y1="432" x2="620" y2="432" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="608" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">THE KING'S DOMAIN</text>
  ` : `
    <text x="330" y="80" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">SURFACE</text>
    <line x1="40" y1="150" x2="620" y2="150" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="345" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">UNDERGROUND</text>
    <line x1="40" y1="430" x2="620" y2="430" stroke="#2a2018" stroke-width="0.5" stroke-dasharray="4 6"/>
    <text x="330" y="510" text-anchor="middle" font-family="Georgia,serif"
          font-size="9" fill="#3a3020" letter-spacing="4">THE ABYSS</text>
  `;

  const connPaths = connections.map(([a,b]) => {
    const na = layout.find(n => n.id === a);
    const nb = layout.find(n => n.id === b);
    if (!na || !nb) return '';
    const x1 = na.x + na.w/2, y1 = na.y + nodeH/2;
    const x2 = nb.x + nb.w/2, y2 = nb.y + nodeH/2;
    const mx = (x1+x2)/2, my = (y1+y2)/2;
    return `<path class="map-connection" d="M${x1},${y1} Q${mx},${my} ${x2},${y2}"/>`;
  }).join('');

  const nodes = layout.map(n => {
    const zone = zones.find(z => z.id === n.id);
    const rated = zone?.user_rating !== null && zone?.user_rating !== undefined;
    const fillOpacity = zone?.community_avg ? 0.22 : 0.1;
    return `
      <g class="map-zone-node" data-zone-id="${n.id}" tabindex="0" role="button" aria-label="${n.label}">
        <rect class="map-node-bg" x="${n.x}" y="${n.y}" width="${n.w}" height="${nodeH}" rx="4"
              fill="rgba(201,168,76,${fillOpacity})" stroke="rgba(201,168,76,0.45)" stroke-width="0.8"/>
        <text class="map-node-label" x="${n.x + n.w/2}" y="${n.y + nodeH/2 + 1}"
              text-anchor="middle" dominant-baseline="middle"
              font-family="Georgia,serif" font-size="10" fill="#c9a84c">
          ${n.label}
        </text>
        ${zone?.community_avg ? `<text x="${n.x + n.w - 4}" y="${n.y + 9}" text-anchor="end"
          font-family="Georgia,serif" font-size="8" fill="#8a6f2e">${zone.community_avg}</text>` : ''}
        ${rated ? `<circle cx="${n.x + 6}" cy="${n.y + nodeH/2}" r="3" fill="#4a7c59"/>` : ''}
      </g>`;
  }).join('');

  return `
    <div class="map-container">
      <p class="map-intro">
        ${mapIntro}
        Click any location to explore it. Green dots indicate zones you have rated.
      </p>

      <div class="map-svg-wrap">
        <svg viewBox="0 0 660 ${svgH}" xmlns="http://www.w3.org/2000/svg"
             role="img" aria-label="Map of ${mapName} showing all zones">
          <title>Map of ${mapName}</title>
          <desc>Schematic overview of all zones and their connections in ${mapName}</desc>

          <!-- Background -->
          <rect width="660" height="${svgH}" fill="#080807"/>
          <rect width="660" height="${svgH}" fill="url(#mapgrad)"/>
          <defs>
            <radialGradient id="mapgrad" cx="50%" cy="50%" r="70%">
              <stop offset="0%" stop-color="#1a1510" stop-opacity="1"/>
              <stop offset="100%" stop-color="#050403" stop-opacity="1"/>
            </radialGradient>
          </defs>

          <!-- Region labels -->
          ${regionBands}

          <!-- Connections -->
          ${connPaths}

          <!-- Zone nodes -->
          ${nodes}
        </svg>
      </div>

      <div class="map-legend">
        <div class="map-legend__item">
          <div class="map-legend__dot" style="background:rgba(201,168,76,0.22);border:1px solid rgba(201,168,76,0.5)"></div>
          Zone with community rating
        </div>
        <div class="map-legend__item">
          <div class="map-legend__dot" style="background:rgba(201,168,76,0.1);border:1px solid rgba(201,168,76,0.45)"></div>
          Unrated zone
        </div>
        <div class="map-legend__item">
          <div class="map-legend__dot" style="background:#4a7c59"></div>
          You have rated this zone
        </div>
      </div>
    </div>`;
}
