document.addEventListener('DOMContentLoaded', async () => {
  Lore.init();
  await Auth.init();
  initNavMenu();
  Router.navigate('intro');
});

async function initNavMenu() {
  const btn      = document.getElementById('nav-menu-btn');
  const dropdown = document.getElementById('nav-menu-dropdown');
  if (!btn || !dropdown) return;

  btn.addEventListener('click', e => {
    e.stopPropagation();
    dropdown.classList.toggle('open');
  });
  document.addEventListener('click', () => dropdown.classList.remove('open'));

  function close() { dropdown.classList.remove('open'); }

  try {
    const games  = await API.games.list();
    const active = games.filter(g => g.is_active);
    dropdown.innerHTML =
      `<button class="nav-menu__item" id="nav-home">Home</button>` +
      (active.length ? `<div class="nav-menu__sep"></div>` : '') +
      active.map(g =>
        `<button class="nav-menu__item" data-game-id="${g.id}">${escNavHtml(g.title)}</button>`
      ).join('');

    document.getElementById('nav-home').addEventListener('click', () => {
      close(); Router.navigate('landing');
    });
    active.forEach(g => {
      dropdown.querySelector(`[data-game-id="${g.id}"]`).addEventListener('click', () => {
        close(); Router.navigate('hub', { gameId: g.id });
      });
    });
  } catch (_) {
    dropdown.innerHTML = `<button class="nav-menu__item" id="nav-home-fallback">Home</button>`;
    document.getElementById('nav-home-fallback').addEventListener('click', () => {
      close(); Router.navigate('landing');
    });
  }
}

function escNavHtml(str) {
  return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}
