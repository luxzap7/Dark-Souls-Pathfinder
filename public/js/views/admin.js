/* ================================================
   admin.js — Admin Panel View
   - Platform stats (users, zones rated, bosses rated)
   - User list table
   - Lore management (quick edit for all zones + bosses)
   ================================================ */

Router.register('admin', async (app) => {
  const user = Auth.getUser();
  if (!user || user.role !== 'admin') {
    app.innerHTML = `<p style="color:var(--crimson-bright);text-align:center;padding:4rem">Access denied. Admin only.</p>`;
    return;
  }

  const div = document.createElement('div');
  div.id = 'view-admin';

  div.innerHTML = `
    <button class="back-btn" id="admin-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>

    <div class="admin-header">
      <div>
        <h1>Admin Panel</h1>
        <p>Dark Souls Pathfinder — Content Management</p>
      </div>
      <span style="font-family:var(--font-heading);font-size:11px;color:var(--gold);letter-spacing:.1em">
        ⚔ ${user.username}
      </span>
    </div>

    <div class="admin-body">

      <!-- Stats card -->
      <div class="admin-card">
        <div class="admin-card__header">
          <span class="admin-card__title">Platform Stats</span>
        </div>
        <div class="admin-card__body">
          <div class="admin-stats-grid" id="admin-stats">
            <div class="admin-stat"><div class="admin-stat__value">…</div><div class="admin-stat__label">Users</div></div>
            <div class="admin-stat"><div class="admin-stat__value">…</div><div class="admin-stat__label">Zone Ratings</div></div>
            <div class="admin-stat"><div class="admin-stat__value">…</div><div class="admin-stat__label">Boss Ratings</div></div>
            <div class="admin-stat"><div class="admin-stat__value">17</div><div class="admin-stat__label">DS1 Zones</div></div>
          </div>
        </div>
      </div>

      <!-- Users card -->
      <div class="admin-card">
        <div class="admin-card__header">
          <span class="admin-card__title">Registered Users</span>
          <span class="admin-card__count" id="user-count">Loading…</span>
        </div>
        <div class="admin-card__body" style="overflow-x:auto;max-height:280px;overflow-y:auto">
          <table class="admin-user-table" id="user-table">
            <thead>
              <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Joined</th>
              </tr>
            </thead>
            <tbody id="user-table-body">
              <tr><td colspan="4" style="text-align:center;color:var(--text-muted);padding:20px">Loading…</td></tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Zone lore management -->
      <div class="admin-card">
        <div class="admin-card__header">
          <span class="admin-card__title">Zone Lore</span>
          <span class="admin-card__count" id="zone-lore-count"></span>
        </div>
        <div class="admin-card__body lore-manage-list" id="zone-lore-list">
          <div style="padding:20px;text-align:center;color:var(--text-muted);font-family:var(--font-heading);font-size:12px">Loading…</div>
        </div>
      </div>

      <!-- Boss lore management -->
      <div class="admin-card">
        <div class="admin-card__header">
          <span class="admin-card__title">Boss Lore</span>
          <span class="admin-card__count" id="boss-lore-count"></span>
        </div>
        <div class="admin-card__body lore-manage-list" id="boss-lore-list">
          <div style="padding:20px;text-align:center;color:var(--text-muted);font-family:var(--font-heading);font-size:12px">Loading…</div>
        </div>
      </div>

    </div>`;

  app.appendChild(div);

  document.getElementById('admin-back').addEventListener('click', () => Router.back());

  // Load all data in parallel
  try {
    const [users, gameData, stats] = await Promise.all([
      API.admin.getUsers(),
      API.games.get(1),
      loadPlatformStats(),
    ]);

    renderUsers(users);
    renderZoneLore(gameData.zones);
    await renderBossLore(gameData.zones);
    renderStats(stats);
  } catch (err) {
    showToast('Failed to load admin data: ' + err.message, 'error');
  }
});

function renderStats(stats) {
  const grid = document.getElementById('admin-stats');
  grid.innerHTML =
    '<div class="admin-stat"><div class="admin-stat__value">' + (stats.total_users||'—') + '</div><div class="admin-stat__label">Users</div></div>' +
    '<div class="admin-stat"><div class="admin-stat__value">' + (stats.zone_ratings||0) + '</div><div class="admin-stat__label">Zone Ratings</div></div>' +
    '<div class="admin-stat"><div class="admin-stat__value">' + (stats.boss_ratings||0) + '</div><div class="admin-stat__label">Boss Ratings</div></div>' +
    '<div class="admin-stat"><div class="admin-stat__value">' + (stats.total_zones||'—') + '</div><div class="admin-stat__label">Total Zones</div></div>';
}

async function loadPlatformStats() {
  try {
    return await API.admin.getStats();
  } catch (_) {
    return { zone_ratings: '—', boss_ratings: '—', total_users: '—', total_zones: '—', total_bosses: '—' };
  }
}

function renderUsers(users) {
  document.getElementById('user-count').textContent = `${users.length} total`;
  const tbody = document.getElementById('user-table-body');
  if (!users.length) {
    tbody.innerHTML = `<tr><td colspan="4" style="text-align:center;color:var(--text-muted);padding:20px">No users yet.</td></tr>`;
    return;
  }
  tbody.innerHTML = users.map(u => `
    <tr>
      <td style="color:var(--text-primary)">${escHtml(u.username)}</td>
      <td>${escHtml(u.email)}</td>
      <td><span class="role-pill role-pill--${u.role}">${u.role}</span></td>
      <td>${new Date(u.created_at).toLocaleDateString('en-GB', { day:'2-digit', month:'short', year:'numeric' })}</td>
    </tr>`).join('');
}

function renderZoneLore(zones) {
  const list = document.getElementById('zone-lore-list');
  const withLore = zones.filter(z => z.lore).length;
  document.getElementById('zone-lore-count').textContent = `${withLore}/${zones.length} set`;

  list.innerHTML = zones.map(zone => `
    <div class="lore-manage-item" data-zone-id="${zone.id}" data-lore="${encodeURIComponent(zone.lore || '')}">
      <img class="lore-manage-item__img" src="${zone.image_url || '/assets/images/placeholder.jpg'}"
           alt="${zone.name}" onerror="this.src='/assets/images/placeholder.jpg'" />
      <div class="lore-manage-item__info">
        <div class="lore-manage-item__name">${escHtml(zone.name)}</div>
        <div class="lore-manage-item__status ${zone.lore ? 'lore-manage-item__status--set' : 'lore-manage-item__status--empty'}">
          ${zone.lore ? '✓ Lore set' : '○ No lore'}
        </div>
      </div>
      <span class="lore-manage-item__edit">✎</span>
    </div>`).join('');

  // Click → edit modal
  list.querySelectorAll('.lore-manage-item').forEach(item => {
    item.addEventListener('click', () => {
      const zoneId = parseInt(item.dataset.zoneId);
      const zone   = zones.find(z => z.id === zoneId);
      Lore.openEditModal({
        type: 'zone', id: zoneId, name: zone.name,
        currentLore: decodeURIComponent(item.dataset.lore),
        onSaved: (newLore) => {
          item.dataset.lore = encodeURIComponent(newLore);
          zone.lore         = newLore;
          const statusEl    = item.querySelector('.lore-manage-item__status');
          statusEl.textContent = '✓ Lore set';
          statusEl.className   = 'lore-manage-item__status lore-manage-item__status--set';
          const withLore = zones.filter(z => z.lore).length;
          document.getElementById('zone-lore-count').textContent = `${withLore}/${zones.length} set`;
        },
      });
    });
  });
}

async function renderBossLore(zones) {
  // Collect all bosses from zone data (zone detail has boss list)
  // We'll build the list from zones data — bosses are nested in zone detail
  const list     = document.getElementById('boss-lore-list');
  const bossCount = document.getElementById('boss-lore-count');
  list.innerHTML = '<div style="padding:20px;text-align:center;color:var(--text-muted);font-family:var(--font-heading);font-size:12px">Loading bosses…</div>';

  // Fetch zone details for zone 1 to get bosses (we'll use the API per zone)
  // More efficient: fetch all zone details in parallel for DS1 zones
  // Actually, we already have zones list — but bosses need separate calls
  // We'll do a smart batch: only fetch the first few zones as a sample, 
  // then link to individual zone for full boss editing
  // For the admin panel, show a curated flat list by fetching a dedicated endpoint
  // Since we don't have /api/games/1/bosses, we'll fetch each zone lazily

  // Simpler approach: show message linking to zones for boss lore editing
  // (full boss lore list would require N zone fetches — could be expensive)
  // Instead, give the admin a quick link to each zone where they can edit boss lore inline

  bossCount.textContent = `Edit via zones`;
  list.innerHTML = `
    <div style="padding:20px">
      <p style="font-family:var(--font-body);font-size:13px;color:var(--text-secondary);font-style:italic;margin-bottom:16px">
        Boss lore can be edited directly from each zone's page. Navigate to a zone below and use the ✎ button on each boss.
      </p>
      <div style="display:flex;flex-direction:column;gap:8px">
        ${zones.slice(0,8).map(z => `
          <button class="admin-zone-link" data-zone-id="${z.id}"
            style="background:var(--bg-raised);border:1px solid var(--border);border-radius:var(--radius);
                   padding:10px 14px;text-align:left;cursor:pointer;font-family:var(--font-heading);
                   font-size:12px;letter-spacing:.06em;color:var(--text-secondary);
                   transition:border-color .2s,color .2s">
            ${escHtml(z.name)} →
          </button>`).join('')}
        ${zones.length > 8 ? `<p style="font-size:11px;color:var(--text-muted);font-family:var(--font-heading);text-align:center;padding-top:4px">+${zones.length-8} more zones in the slideshow</p>` : ''}
      </div>
    </div>`;

  list.querySelectorAll('.admin-zone-link').forEach(btn => {
    btn.addEventListener('mouseover', () => { btn.style.borderColor='var(--gold)'; btn.style.color='var(--gold)'; });
    btn.addEventListener('mouseout',  () => { btn.style.borderColor=''; btn.style.color=''; });
    btn.addEventListener('click', () => {
      const zoneId = parseInt(btn.dataset.zoneId);
      const zone   = zones.find(z => z.id === zoneId);
      Router.navigate('zone', { zoneId, gameId: 1, game: { id:1, title:'Dark Souls', subtitle:'Remastered' } });
    });
  });
}

function escHtml(str) {
  return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}
