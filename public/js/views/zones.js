/* ================================================
   zones.js — Zone Detail View (Step 3 update)
   + Admin lore edit button on hero and boss list
   ================================================ */

Router.register('zone', async (app, { zoneId, gameId, game }) => {
  let data;
  try { data = await API.zones.get(zoneId); }
  catch (err) { app.innerHTML = `<p style="color:var(--crimson-bright);text-align:center;padding:4rem">${err.message}</p>`; return; }

  const { zone, bosses } = data;
  const user    = Auth.getUser();
  const isAdmin = user?.role === 'admin';
  const img     = zone.image_url || '/assets/images/placeholder.jpg';

  const div = document.createElement('div');
  div.id = 'view-zone-detail';

  div.innerHTML = `
    <button class="back-btn" id="zone-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>

    <div class="zone-hero" id="zone-hero">
      <img class="zone-hero__img" src="${img}" alt="${zone.name}" onerror="this.src='/assets/images/placeholder.jpg'" />
      <div class="zone-hero__gradient"></div>
      ${zone.lore ? `<button class="zone-hero__lore-trigger" id="zone-lore-btn">📜 Lore</button>` : ''}
      <div class="zone-hero__title">
        <h1 class="zone-hero__name">${zone.name}</h1>
      </div>
    </div>

    <div class="zone-detail-body">

      <div class="community-stats">
        <div class="stat-block">
          <div class="stat-block__label">Community Rating</div>
          <div class="stat-block__value">${zone.community_avg || '—'}</div>
          <div class="stat-block__sub">out of 10</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Appearance</div>
          <div class="stat-block__value">${zone.avg_look || '—'}</div>
          <div class="stat-block__sub">avg look</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Atmosphere</div>
          <div class="stat-block__value">${zone.avg_atm || '—'}</div>
          <div class="stat-block__sub">avg atm</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Fair Factor</div>
          <div class="stat-block__value">${zone.avg_fair || '—'}</div>
          <div class="stat-block__sub">avg fairness</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Total Ratings</div>
          <div class="stat-block__value">${zone.total_ratings || 0}</div>
          <div class="stat-block__sub">undead rated</div>
        </div>
      </div>

      <div class="rating-section">
        <h3>Your Verdict</h3>
        ${!user ? `
          <div style="font-family:var(--font-heading);font-size:13px;color:var(--text-muted);letter-spacing:.08em;padding:20px;border:1px solid var(--border);border-radius:var(--radius-md);text-align:center">
            <a href="#" id="signin-to-rate" style="color:var(--gold)">Sign in</a> to leave your verdict on this zone.
          </div>` :
          zone.user_rating ? renderExistingZoneRating(zone.user_rating) :
          renderZoneRatingForm(zoneId)
        }
      </div>

      <div class="divider"></div>

      <div class="boss-list-section">
        <h3>Bosses of this Zone</h3>
        ${bosses.length === 0
          ? `<p style="color:var(--text-muted);font-style:italic">No bosses recorded for this zone.</p>`
          : `<div class="boss-list" id="boss-list">${bosses.map(b => renderBossListItem(b, isAdmin)).join('')}</div>`
        }
      </div>

    </div>`;

  app.innerHTML = '';  
  app.appendChild(div);

  // Admin lore edit button on hero image
  if (isAdmin) {
    let currentLore = zone.lore || '';
    const heroEl = document.getElementById('zone-hero');
    const editBtn = Lore.makeLoreEditBtn('zone', zone.id, zone.name, currentLore, (newLore) => {
      currentLore = newLore;
      editBtn._lore = newLore;
      // If there was no lore button before, add it now
      if (!document.getElementById('zone-lore-btn')) {
        const loreBtn = document.createElement('button');
        loreBtn.id        = 'zone-lore-btn';
        loreBtn.className = 'zone-hero__lore-trigger';
        loreBtn.textContent = '📜 Lore';
        loreBtn.addEventListener('click', () => Lore.openReadModal(zone.name, currentLore));
        heroEl.appendChild(loreBtn);
      }
    });
    heroEl.appendChild(editBtn);
  }

  // Back
  document.getElementById('zone-back').addEventListener('click', () => Router.navigate('slideshow', { gameId, game }));

  // Lore read button
  document.getElementById('zone-lore-btn')?.addEventListener('click', () => Lore.openReadModal(zone.name, zone.lore));

  // Sign in link
  document.getElementById('signin-to-rate')?.addEventListener('click', e => { e.preventDefault(); Auth.openModal('login'); });

  // Rating form
  if (user && !zone.user_rating) setupZoneRatingForm(zoneId, gameId, game, zone);

  // Boss list clicks + admin edit btns
  document.querySelectorAll('.boss-list-item:not(.boss-list-item--locked)').forEach(item => {
    item.addEventListener('click', e => {
      if (e.target.closest('.lore-edit-btn')) return;
      const bossData = bosses.find(b => b.id === parseInt(item.dataset.id));
      Router.navigate('boss', { bossId: parseInt(item.dataset.id), zoneId, zone, gameId, game });
    });
  });

  // Admin edit btns inside boss list items
  if (isAdmin) {
    document.querySelectorAll('.boss-list-item').forEach(item => {
      const bossId = parseInt(item.dataset.id);
      const boss   = bosses.find(b => b.id === bossId);
      if (!boss) return;
      let currentLore = boss.lore || '';
      const editBtn = Lore.makeLoreEditBtn('boss', bossId, boss.name, currentLore, (newLore) => {
        currentLore = newLore;
      });
      item.style.position = 'relative';
      item.appendChild(editBtn);
    });
  }
});

function renderExistingZoneRating(rating) {
  return `
    <div class="rating-already-done">
      ✓ You rated this zone — <strong>${rating.score_avg}/10</strong>
      ${rating.comment ? `<p style="margin-top:8px;color:var(--text-secondary);font-style:italic">"${rating.comment}"</p>` : ''}
    </div>`;
}

function renderZoneRatingForm() {
  return `
    <form id="zone-rating-form" novalidate>
      <div class="rating-sliders">
        ${renderSlider('look', 'Appearance', 5)}
        ${renderSlider('atm',  'Atmosphere', 5)}
        ${renderSlider('fair', 'Fair Factor', 5)}
      </div>
      <div class="rating-avg-preview">
        <div class="rating-avg-preview__label">Your Overall Score</div>
        <div class="rating-avg-preview__value" id="avg-preview">5.0</div>
      </div>
      <div class="rating-comment field-group" style="margin-bottom:16px">
        <label for="zone-comment">Your Experience (optional)</label>
        <textarea id="zone-comment" placeholder="Share your thoughts on this zone..."></textarea>
      </div>
      <span class="form-error" id="zone-rating-err"></span>
      <button type="submit" class="btn-primary">Seal Your Verdict</button>
    </form>`;
}

function renderSlider(key, label, defaultVal) {
  return `
    <div class="slider-group">
      <div class="slider-label">
        <span>${label}</span>
        <span class="slider-value" id="val-${key}">${defaultVal}</span>
      </div>
      <input type="range" id="slider-${key}" min="1" max="10" value="${defaultVal}" />
    </div>`;
}

function setupZoneRatingForm(zoneId, gameId, game, zone) {
  const sliders = ['look', 'atm', 'fair'];
  function updateAvg() {
    const vals = sliders.map(k => parseInt(document.getElementById(`slider-${k}`).value));
    document.getElementById('avg-preview').textContent = (vals.reduce((a,b)=>a+b,0)/vals.length).toFixed(1);
  }
  sliders.forEach(k => {
    const s = document.getElementById(`slider-${k}`);
    s.addEventListener('input', () => { document.getElementById(`val-${k}`).textContent = s.value; updateAvg(); });
  });
  document.getElementById('zone-rating-form').addEventListener('submit', async e => {
    e.preventDefault();
    const score_look = parseInt(document.getElementById('slider-look').value);
    const score_atm  = parseInt(document.getElementById('slider-atm').value);
    const score_fair = parseInt(document.getElementById('slider-fair').value);
    const comment    = document.getElementById('zone-comment').value.trim();
    const errEl      = document.getElementById('zone-rating-err');
    errEl.textContent = '';
    try {
      await API.zones.rate(zoneId, { score_look, score_atm, score_fair, comment });
      showToast('Your verdict has been sealed.', 'success');
      Router.navigate('zone', { zoneId, gameId, game });
    } catch (err) { errEl.textContent = err.message; }
  });
}

function renderBossListItem(boss, isAdmin) {
  const locked = !boss.unlocked;
  const rated  = boss.user_rating !== null;
  const img    = boss.image_url || '/assets/images/placeholder.jpg';
  const avg    = boss.community_avg ? `${boss.community_avg}/10` : 'Unrated';
  return `
    <div class="boss-list-item ${locked ? 'boss-list-item--locked' : ''}" data-id="${boss.id}" style="position:relative">
      <img class="boss-list-item__img" src="${img}" alt="${boss.name}" onerror="this.src='/assets/images/placeholder.jpg'" />
      <div class="boss-list-item__info">
        <div class="boss-list-item__name">${boss.name}</div>
        <div class="boss-list-item__rating">Community: ${avg}${rated ? ' · <span class="boss-list-item__rated">✓ Rated</span>' : ''}</div>
      </div>
      ${locked ? `<div class="boss-list-item__lock">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
          <rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V7a4 4 0 018 0v4"/>
        </svg></div>` : ''}
    </div>`;
}
