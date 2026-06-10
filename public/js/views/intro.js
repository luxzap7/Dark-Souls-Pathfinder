Router.register('intro', (app) => {
  const el = document.createElement('div');
  el.id = 'view-intro';
  el.innerHTML = `
    <div class="intro-content">
      <span class="intro-eyebrow">A Companion for the Undead</span>
      <h1 class="intro-title">Dark Souls<br>Pathfinder</h1>
      <p class="intro-subtitle">Prepare to Rate</p>
      <div class="intro-cta">
        <span class="intro-cta-text">Touch to begin</span>
        <span class="intro-cta-icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2">
            <path d="M12 5v14M5 12l7 7 7-7"/>
          </svg>
        </span>
      </div>
    </div>`;
  app.appendChild(el);

  function lift() {
    el.removeEventListener('click', lift);
    window.removeEventListener('keydown', onKey);
    el.classList.add('lifting');
    setTimeout(() => Router.navigate('landing'), 1100);
  }
  function onKey(e) { if (['Enter',' ','ArrowDown'].includes(e.key)) lift(); }
  el.addEventListener('click', lift);
  window.addEventListener('keydown', onKey);
});
