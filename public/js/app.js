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

  function closeMenu() { dropdown.classList.remove('open'); }

  btn.addEventListener('click', e => {
    e.stopPropagation();
    dropdown.classList.toggle('open');
  });
  document.addEventListener('click', closeMenu);
  document.addEventListener('keydown', e => { if (e.key === 'Escape') closeMenu(); });

  // Home link
  const homeBtn = document.createElement('button');
  homeBtn.className = 'nav-menu__item';
  homeBtn.textContent = 'Home';
  homeBtn.addEventListener('click', () => { closeMenu(); Router.navigate('landing'); });
  dropdown.appendChild(homeBtn);

  let games = [];
  try { games = await API.games.list(); } catch (_) { return; }

  const active = games.filter(g => g.is_active);
  if (!active.length) return;

  const sep = document.createElement('div');
  sep.className = 'nav-menu__sep';
  dropdown.appendChild(sep);

  active.forEach(g => {
    // Game accordion header
    const gameBtn = document.createElement('button');
    gameBtn.className = 'nav-menu__game';
    gameBtn.innerHTML = `${escNavHtml(g.title)} <span class="nav-menu__game-arrow">▶</span>`;
    dropdown.appendChild(gameBtn);

    // Submenu container
    const submenu = document.createElement('div');
    submenu.className = 'nav-menu__submenu';
    dropdown.appendChild(submenu);

    // Toggle accordion
    gameBtn.addEventListener('click', e => {
      e.stopPropagation();
      const isOpen = submenu.classList.contains('open');
      // Close all other submenus
      dropdown.querySelectorAll('.nav-menu__submenu.open').forEach(sm => {
        sm.classList.remove('open');
        sm.previousElementSibling.classList.remove('open');
      });
      if (!isOpen) {
        submenu.classList.add('open');
        gameBtn.classList.add('open');
      }
    });

    // "Continue your Journey" → slideshow
    const journeyBtn = document.createElement('button');
    journeyBtn.className = 'nav-menu__subitem';
    journeyBtn.textContent = 'Continue your Journey';
    journeyBtn.addEventListener('click', () => {
      closeMenu();
      Router.navigate('slideshow', { gameId: g.id, game: g });
    });
    submenu.appendChild(journeyBtn);

    // World sub-options
    const worldItems = [
      { label: 'Zones',  tab: 'zones'  },
      { label: 'Bosses', tab: 'bosses' },
      { label: 'Map',    tab: 'map'    },
    ];
    worldItems.forEach(({ label, tab }) => {
      const worldBtn = document.createElement('button');
      worldBtn.className = 'nav-menu__worlditem';
      worldBtn.textContent = label;
      worldBtn.addEventListener('click', () => {
        closeMenu();
        Router.navigate('world', { gameId: g.id, game: g });
        setTimeout(() => {
          const tabBtn = document.querySelector(`.world-nav__btn[data-tab="${tab}"]`);
          if (tabBtn) tabBtn.click();
        }, 150);
      });
      submenu.appendChild(worldBtn);
    });
  });
}

function escNavHtml(str) {
  return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}
