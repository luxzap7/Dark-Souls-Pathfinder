/* ================================================
   boss.js — Boss Detail View (Step 3 update)
   + Admin lore edit button on hero
   ================================================ */

Router.register('boss', async (app, { bossId, zoneId, zone, gameId, game }) => {
  let data;
  try { data = await API.bosses.get(bossId); }
  catch (err) { app.innerHTML = `<p style="color:var(--crimson-bright);text-align:center;padding:4rem">${err.message}</p>`; return; }

  const { boss } = data;
  const user    = Auth.getUser();
  const isAdmin = user?.role === 'admin';
  const img     = boss.image_url || '/assets/images/placeholder.jpg';

  const div = document.createElement('div');
  div.id = 'view-boss-detail';

  div.innerHTML = `
    <button class="back-btn" id="boss-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>

    <div class="boss-hero" id="boss-hero">
      <img class="boss-hero__img" src="${img}" alt="${boss.name}" onerror="this.src='/assets/images/placeholder.jpg'" />
      <div class="boss-hero__gradient"></div>
      ${boss.lore ? `<button class="boss-hero__lore-trigger" id="boss-lore-btn">📜 Lore</button>` : ''}
      <div class="boss-hero__title">
        <h1 class="boss-hero__name">${boss.name}</h1>
        <p class="boss-hero__zone">${zone?.name || ''}</p>
      </div>
    </div>

    <div class="boss-detail-body">

      <div class="community-stats">
        <div class="stat-block">
          <div class="stat-block__label">Community Rating</div>
          <div class="stat-block__value">${boss.community_avg || '—'}</div>
          <div class="stat-block__sub">out of 10</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Design</div>
          <div class="stat-block__value">${boss.avg_design || '—'}</div>
          <div class="stat-block__sub">avg design</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Arena</div>
          <div class="stat-block__value">${boss.avg_arena || '—'}</div>
          <div class="stat-block__sub">avg arena</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Fair Factor</div>
          <div class="stat-block__value">${boss.avg_fair || '—'}</div>
          <div class="stat-block__sub">avg fairness</div>
        </div>
        <div class="stat-block">
          <div class="stat-block__label">Total Ratings</div>
          <div class="stat-block__value">${boss.total_ratings || 0}</div>
          <div class="stat-block__sub">undead rated</div>
        </div>
      </div>

      <!-- Boss stats infographic -->
      <div class="boss-stats">
        <div class="boss-stats__title">Boss Statistics</div>
        <table class="boss-stats__table">
          <tbody>
            <tr><td>Hit Points</td>    <td class="stat-hp">${boss.hp ? boss.hp.toLocaleString() : '—'}</td></tr>
            <tr><td>Souls Reward</td>  <td class="stat-souls">${boss.souls_reward ? boss.souls_reward.toLocaleString() + ' ⊕' : '—'}</td></tr>
            <tr><td>Weakness</td>      <td class="stat-weakness">${boss.weakness || '—'}</td></tr>
            <tr><td>Resistance</td>    <td class="stat-resist">${boss.resistance || '—'}</td></tr>
            <tr><td>Location</td>      <td>${boss.location || '—'}</td></tr>
          </tbody>
        </table>
      </div>

      <!-- Rating section -->
      <div class="rating-section">
        <h3>Your Verdict</h3>
        ${!user ? `
          <div style="font-family:var(--font-heading);font-size:13px;color:var(--text-muted);padding:20px;border:1px solid var(--border);border-radius:var(--radius-md);text-align:center">
            <a href="#" id="boss-signin-link" style="color:var(--gold)">Sign in</a> to leave your verdict.
          </div>` :
          !boss.unlocked ? `
          <div style="font-family:var(--font-heading);font-size:13px;color:var(--text-muted);padding:20px;border:1px solid var(--border);border-radius:var(--radius-md);text-align:center">
            Rate the zone first to unlock boss verdicts.
          </div>` :
          boss.user_rating ? renderExistingBossRating(boss.user_rating) :
          renderBossRatingForm()
        }
      </div>

      ${boss.description ? `
        <div class="divider"></div>
        <p style="font-style:italic;color:var(--text-secondary);line-height:1.85">${boss.description}</p>
      ` : ''}

    </div>`;

  app.innerHTML = '';  
  app.appendChild(div);

  // Admin lore edit button on hero
  if (isAdmin) {
    let currentLore = boss.lore || '';
    const heroEl  = document.getElementById('boss-hero');
    const editBtn = Lore.makeLoreEditBtn('boss', boss.id, boss.name, currentLore, (newLore) => {
      currentLore = newLore;
      if (!document.getElementById('boss-lore-btn')) {
        const loreBtn = document.createElement('button');
        loreBtn.id        = 'boss-lore-btn';
        loreBtn.className = 'boss-hero__lore-trigger';
        loreBtn.textContent = '📜 Lore';
        loreBtn.addEventListener('click', () => Lore.openReadModal(boss.name, currentLore));
        heroEl.appendChild(loreBtn);
      }
    });
    heroEl.appendChild(editBtn);
  }

  document.getElementById('boss-back').addEventListener('click', () => Router.back());
  document.getElementById('boss-lore-btn')?.addEventListener('click', () => Lore.openReadModal(boss.name, boss.lore));
  document.getElementById('boss-signin-link')?.addEventListener('click', e => { e.preventDefault(); Auth.openModal('login'); });

  if (user && boss.unlocked && !boss.user_rating) {
    setupBossRatingForm(bossId, zoneId, zone, gameId, game);
  }
});

function renderExistingBossRating(rating) {
  return `
    <div class="rating-already-done">
      ✓ You rated this boss — <strong>${rating.score_avg}/10</strong>
      ${rating.comment ? `<p style="margin-top:8px;color:var(--text-secondary);font-style:italic">"${rating.comment}"</p>` : ''}
    </div>`;
}

function renderBossRatingForm() {
  return `
    <form id="boss-rating-form" novalidate>
      <div class="rating-sliders">
        ${renderBossSlider('design', 'Design',        5)}
        ${renderBossSlider('arena',  'Arena Quality', 5)}
        ${renderBossSlider('fair',   'Fair Factor',   5)}
      </div>
      <div class="rating-avg-preview">
        <div class="rating-avg-preview__label">Your Overall Score</div>
        <div class="rating-avg-preview__value" id="boss-avg-preview">5.0</div>
      </div>
      <div class="rating-comment field-group" style="margin-bottom:16px">
        <label for="boss-comment">Your Experience (optional)</label>
        <textarea id="boss-comment" placeholder="Describe your encounter with this boss..."></textarea>
      </div>
      <span class="form-error" id="boss-rating-err"></span>
      <button type="submit" class="btn-primary">Seal Your Verdict</button>
    </form>`;
}

function renderBossSlider(key, label, defaultVal) {
  return `
    <div class="slider-group">
      <div class="slider-label">
        <span>${label}</span>
        <span class="slider-value" id="bval-${key}">${defaultVal}</span>
      </div>
      <input type="range" id="bslider-${key}" min="1" max="10" value="${defaultVal}" />
    </div>`;
}

function setupBossRatingForm(bossId, zoneId, zone, gameId, game) {
  const sliders = ['design','arena','fair'];
  function updateAvg() {
    const vals = sliders.map(k => parseInt(document.getElementById(`bslider-${k}`).value));
    document.getElementById('boss-avg-preview').textContent = (vals.reduce((a,b)=>a+b,0)/vals.length).toFixed(1);
  }
  sliders.forEach(k => {
    const s = document.getElementById(`bslider-${k}`);
    s.addEventListener('input', () => { document.getElementById(`bval-${k}`).textContent = s.value; updateAvg(); });
  });
  document.getElementById('boss-rating-form').addEventListener('submit', async e => {
    e.preventDefault();
    const score_design = parseInt(document.getElementById('bslider-design').value);
    const score_arena  = parseInt(document.getElementById('bslider-arena').value);
    const score_fair   = parseInt(document.getElementById('bslider-fair').value);
    const comment      = document.getElementById('boss-comment').value.trim();
    const errEl        = document.getElementById('boss-rating-err');
    errEl.textContent  = '';
    try {
      await API.bosses.rate(bossId, { score_design, score_arena, score_fair, comment });
      showToast('Your verdict has been sealed.', 'success');
      Router.navigate('boss', { bossId, zoneId, zone, gameId, game });
    } catch (err) { errEl.textContent = err.message; }
  });
}
