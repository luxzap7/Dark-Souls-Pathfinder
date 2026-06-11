Router.register('landing', async (app) => {
  // Loading state
  app.innerHTML = `
    <div class="spinner-wrap" style="position:relative;z-index:1">
      <div class="spinner"></div>
      <span class="spinner-text">Loading worlds…</span>
    </div>`;

  let games = [];
  try {
    games = await API.games.list();
  } catch (err) {
    app.innerHTML = `
      <div class="error-state" style="position:relative;z-index:1">
        <div class="error-state__icon">🔥</div>
        <div class="error-state__title">Connection Failed</div>
        <div class="error-state__msg">${err.message}</div>
        <button class="btn-primary" style="width:auto;margin-top:8px" onclick="Router.navigate('landing')">Retry</button>
      </div>`;
    return;
  }

  const section = document.createElement('section');
  section.id = 'view-landing';
  section.setAttribute('role', 'main');
  section.innerHTML = `
    <div class="landing-header">
      <h1 class="landing-title">Choose Your Game</h1>
      <p class="landing-sub">Select a title to begin tracking your journey</p>
    </div>
    <div class="landing-grid" role="list">
      ${games.map(g => `
        <article class="game-card ${g.is_active ? '' : 'game-card--locked'}"
                 data-id="${g.id}"
                 role="listitem"
                 tabindex="${g.is_active ? '0' : '-1'}"
                 aria-label="${g.title}${g.is_active ? '' : ' — coming soon'}">
          <div class="game-card__img-wrap">
            <img src="${g.image_url || `/assets/images/game_${g.id}_placeholder.svg`}"
                 alt="${g.title}"
                 onerror="this.src='/assets/images/placeholder.svg'" />
            <div class="game-card__overlay"></div>
          </div>
          <div class="game-card__body">
            <h2 class="game-card__title">${g.title}</h2>
            <p  class="game-card__sub">${g.subtitle || ''}</p>
            <p  class="game-card__desc">${g.description || ''}</p>
            ${g.is_active
              ? `<span class="game-card__cta">Enter &rsaquo;</span>`
              : `<span class="game-card__soon">Coming Soon</span>`}
          </div>
          ${!g.is_active ? `<div class="game-card__lock" aria-hidden="true">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
              <rect x="5" y="11" width="14" height="10" rx="2"/>
              <path d="M8 11V7a4 4 0 018 0v4"/>
            </svg></div>` : ''}
        </article>`).join('')}
    </div>`;

  addLandingStyles();
  app.innerHTML = '';
  app.appendChild(section);

  section.querySelectorAll('.game-card:not(.game-card--locked)').forEach(card => {
    const go = () => Router.navigate('hub', { gameId: parseInt(card.dataset.id) });
    card.addEventListener('click', go);
    card.addEventListener('keydown', e => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); go(); } });
  });
});

function addLandingStyles() {
  if (document.getElementById('landing-styles')) return;
  const s = document.createElement('style');
  s.id = 'landing-styles';
  s.textContent = `
    #view-landing {
      min-height: 100vh; display: flex; flex-direction: column;
      align-items: center; justify-content: center;
      padding: 80px 16px 40px; position: relative; z-index: 1;
      background: linear-gradient(rgba(8,8,7,0.72), rgba(8,8,7,0.72)),
                  url('/assets/images/games/main_background.jpg') center/cover no-repeat fixed;
    }
    .landing-header { text-align: center; margin-bottom: 44px; }
    .landing-title  { font-family: var(--font-title); font-size: clamp(1.6rem, 4vw, 2.8rem); color: var(--gold); margin-bottom: 8px; }
    .landing-sub    { font-family: var(--font-heading); font-size: 11px; letter-spacing: .16em; color: var(--text-muted); text-transform: uppercase; }

    .landing-grid {
      display: grid; grid-template-columns: repeat(3, 1fr);
      gap: 2px; width: 100%; max-width: 1100px; min-height: 520px;
    }
    .game-card {
      position: relative; overflow: hidden; cursor: pointer;
      min-height: 480px; display: flex; flex-direction: column;
      border: 1px solid var(--border);
      transition: border-color .3s, box-shadow .3s;
    }
    .game-card:not(.game-card--locked):hover { border-color: var(--gold); box-shadow: inset 0 0 40px rgba(201,168,76,.07); }
    .game-card:focus-visible { border-color: var(--gold); outline: none; }
    .game-card--locked { cursor: default; opacity: .48; filter: grayscale(.55); }

    .game-card__img-wrap { position: absolute; inset: 0; z-index: 0; }
    .game-card__img-wrap img { width:100%; height:100%; object-fit:cover; opacity:.35; transition: opacity .4s, transform .5s; }
    .game-card:not(.game-card--locked):hover .game-card__img-wrap img { opacity: .5; transform: scale(1.04); }
    .game-card__overlay { position: absolute; inset:0; background: linear-gradient(to top, var(--bg-deepest) 0%, transparent 55%); }

    .game-card__body { position:relative; z-index:1; margin-top:auto; padding:24px 20px; }
    .game-card__title { font-family:var(--font-title); font-size:clamp(1.2rem,2.2vw,1.8rem); color:var(--gold); margin-bottom:3px; }
    .game-card__sub   { font-family:var(--font-heading); font-size:10px; color:var(--text-muted); letter-spacing:.12em; text-transform:uppercase; margin-bottom:10px; }
    .game-card__desc  { font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:18px; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical; overflow:hidden; }
    .game-card__cta   { font-family:var(--font-heading); font-size:11px; letter-spacing:.2em; text-transform:uppercase; color:var(--gold); border-bottom:1px solid var(--gold-dim); padding-bottom:2px; }
    .game-card__soon  { font-family:var(--font-heading); font-size:10px; letter-spacing:.2em; text-transform:uppercase; color:var(--text-muted); }
    .game-card__lock  { position:absolute; top:14px; right:14px; z-index:2; color:var(--text-muted); }
    .game-card__lock svg { width:20px; height:20px; }

    @media (max-width: 768px) {
      .landing-grid { grid-template-columns: 1fr; max-width: 440px; min-height: unset; }
      .game-card { min-height: 260px; }
    }
    @media (max-width: 480px) {
      #view-landing { padding: 72px 12px 32px; }
      .landing-header { margin-bottom: 28px; }
    }
  `;
  document.head.appendChild(s);
}
