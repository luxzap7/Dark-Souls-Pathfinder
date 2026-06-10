/* ================================================
   hub.js — Game Hub (opcija A / B) + Zone Slideshow
   ================================================ */

Router.register('hub', async (app, { gameId }) => {
  app.innerHTML = '<div class="spinner-wrap" style="position:relative;z-index:1"><div class="spinner"></div><span class="spinner-text">Entering Lordran…</span></div>';

  let gameData;
  try { gameData = await API.games.get(gameId); }
  catch (err) {
    app.innerHTML = '<div class="error-state" style="position:relative;z-index:1"><div class="error-state__title">Failed to load</div><div class="error-state__msg">' + err.message + '</div></div>';
    return;
  }

  const { game } = gameData;
  const user = Auth.getUser();

  const div = document.createElement('div');
  div.id = 'view-hub';

  div.innerHTML = `
    <div class="hub-bg" style="background-image:url('${game.image_url || '/assets/images/placeholder.svg'}')"></div>
    <button class="back-btn" id="hub-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>
    <div class="hub-content">
      <div>
        <h1 class="hub-game-title">${game.title}</h1>
        <p class="hub-game-sub">${game.subtitle || ''}</p>
      </div>
      ${user ? `
      <div class="hub-progress">
        <div class="hub-progress__label">
          <span class="hub-progress__text">Journey Progress</span>
          <span class="hub-progress__pct" id="hub-pct">—</span>
        </div>
        <div class="hub-progress__bar-wrap">
          <div class="hub-progress__bar" id="hub-bar" style="width:0%"></div>
        </div>
        <div class="hub-progress__detail" id="hub-detail"></div>
      </div>` : `
      <div style="font-family:var(--font-heading);font-size:12px;letter-spacing:.12em;color:var(--text-muted);text-align:center;padding:16px;border:1px solid var(--border);border-radius:var(--radius-md)">
        Sign in to track your journey
      </div>`}
      <div class="hub-options">
        <div class="hub-option" id="hub-opt-a" tabindex="0" role="button">
          <div class="hub-option__icon">⚔</div>
          <h2 class="hub-option__title">Continue your Journey</h2>
          <p class="hub-option__desc">Track your progress through zones and bosses. Rate your experience and leave your mark on Lordran.</p>
        </div>
        <div class="hub-option" id="hub-opt-b" tabindex="0" role="button">
          <div class="hub-option__icon">📜</div>
          <h2 class="hub-option__title">Learn about the World</h2>
          <p class="hub-option__desc">Explore the lore, maps, and secrets of the Dark Souls universe. Knowledge is your greatest weapon.</p>
        </div>
      </div>
    </div>`;

  app.innerHTML = '';    
  app.appendChild(div);

  document.getElementById('hub-back').addEventListener('click', () => Router.navigate('landing'));

  const goSlideshow = () => {
    if (!user) { Auth.openModal('login'); showToast('Sign in to track your journey.', 'info'); return; }
    Router.navigate('slideshow', { gameId, game });
  };
  document.getElementById('hub-opt-a').addEventListener('click', goSlideshow);
  document.getElementById('hub-opt-a').addEventListener('keydown', e => { if (e.key === 'Enter') goSlideshow(); });
  document.getElementById('hub-opt-b').addEventListener('click', () => Router.navigate('world', { gameId, game }));

  if (user) {
    try {
      const p = await API.progress.get(gameId);
      document.getElementById('hub-bar').style.width    = `${p.percentage}%`;
      document.getElementById('hub-pct').textContent    = `${p.percentage}%`;
      document.getElementById('hub-detail').textContent = `${p.rated_zones} / ${p.total_zones} zones  ·  ${p.rated_bosses} / ${p.total_bosses} bosses`;
    } catch (_) {}
  }
});

Router.register('slideshow', async (app, { gameId, game }) => {
  app.innerHTML = '<div class="spinner-wrap" style="position:relative;z-index:1"><div class="spinner"></div><span class="spinner-text">Loading zones…</span></div>';

  let gameData;
  try { gameData = await API.games.get(gameId); }
  catch (err) {
    app.innerHTML = '<div class="error-state" style="position:relative;z-index:1"><div class="error-state__title">Failed</div><div class="error-state__msg">' + err.message + '</div></div>';
    return;
  }

  const { zones } = gameData;
  const user    = Auth.getUser();
  const isAdmin = user?.role === 'admin';

  const div = document.createElement('div');
  div.id = 'view-slideshow';

  div.innerHTML = `
    <button class="back-btn" id="slide-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>
    <div class="slideshow-header">
      <h1 class="slideshow-title">${game.title}</h1>
      <p class="slideshow-sub">Select a zone — locked areas open as you progress</p>
    </div>
    <div class="zone-grid" id="zone-grid">
      ${zones.map(z => renderZoneCard(z)).join('')}
    </div>
    <div class="slideshow-progress">
      <div class="slideshow-progress__inner">
        <span class="slideshow-progress__label">Journey</span>
        <div class="slideshow-progress__bar-wrap">
          <div class="slideshow-progress__bar" id="slide-prog-bar" style="width:0%"></div>
        </div>
        <span class="slideshow-progress__pct" id="slide-prog-pct">—</span>
      </div>
    </div>`;

  app.innerHTML = '';  
  app.appendChild(div);

  document.getElementById('slide-back').addEventListener('click', () => Router.navigate('hub', { gameId, game }));

  document.querySelectorAll('.zone-card:not(.zone-card--locked)').forEach(card => {
    card.addEventListener('click', e => {
      if (e.target.closest('.lore-hint-btn')) return;
      if (e.target.closest('.lore-edit-btn')) return;
      Router.navigate('zone', { zoneId: parseInt(card.dataset.id), gameId, game });
    });
  });

  document.querySelectorAll('.lore-hint-btn').forEach(btn => {
    btn.addEventListener('click', e => {
      e.stopPropagation();
      Lore.openReadModal(btn.dataset.name, decodeURIComponent(btn.dataset.lore));
    });
  });

  if (isAdmin) {
    document.querySelectorAll('.zone-card:not(.zone-card--locked)').forEach(card => {
      const zoneId = parseInt(card.dataset.id);
      const zone   = zones.find(z => z.id === zoneId);
      if (!zone) return;
      let currentLore = zone.lore || '';
      const editBtn = Lore.makeLoreEditBtn('zone', zoneId, zone.name, currentLore, (newLore) => {
        currentLore = newLore; zone.lore = newLore;
        const hintBtn = card.querySelector('.lore-hint-btn');
        if (hintBtn) hintBtn.dataset.lore = encodeURIComponent(newLore);
      });
      card.appendChild(editBtn);
    });
  }

  if (user) {
    try {
      const p = await API.progress.get(gameId);
      document.getElementById('slide-prog-bar').style.width = `${p.percentage}%`;
      document.getElementById('slide-prog-pct').textContent = `${p.percentage}%`;
    } catch (_) {}
  }
});

function renderZoneCard(zone) {
  const locked = !zone.unlocked;
  const rated  = zone.user_rating !== null;
  const img    = zone.image_url || '/assets/images/placeholder.svg';
  const avg    = zone.community_avg ? `Community: ${zone.community_avg}/10` : 'No ratings yet';

  if (locked) {
    return `
      <div class="zone-card zone-card--locked" data-id="${zone.id}">
        <img class="zone-card__img" src="${img}" alt="${zone.name}" onerror="this.src='/assets/images/placeholder.svg'" />
        <div class="zone-card__gradient"></div>
        <div class="zone-card__lock-overlay">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
            <rect x="5" y="11" width="14" height="10" rx="2"/>
            <path d="M8 11V7a4 4 0 018 0v4"/>
          </svg>
          <span class="zone-card__lock-text">Locked</span>
        </div>
        <div class="zone-card__body">
          <div class="zone-card__name">${zone.name}</div>
        </div>
      </div>`;
  }

  return `
    <div class="zone-card" data-id="${zone.id}" tabindex="0" role="button" aria-label="${zone.name}">
      <img class="zone-card__img" src="${img}" alt="${zone.name}" onerror="this.src='/assets/images/placeholder.svg'" />
      <div class="zone-card__gradient"></div>
      <div class="zone-card__lore-hint">
        <button class="lore-hint-btn"
                data-name="${zone.name}"
                data-lore="${encodeURIComponent(zone.lore || 'No lore recorded yet.')}">
          Lore
        </button>
      </div>
      <div class="zone-card__body">
        <div class="zone-card__name">${zone.name}</div>
        <div class="zone-card__rating">${avg}</div>
        ${rated ? '<span class="zone-card__user-rated">✓ Rated</span>' : ''}
      </div>
    </div>`;
}