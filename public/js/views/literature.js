/* ================================================
   literature.js — Sources & Literature Page
   Required by course spec: accessible from navigation
   ================================================ */

Router.register('literature', (app) => {
  const div = document.createElement('div');
  div.id = 'view-literature';
  div.style.cssText = 'min-height:100vh;padding:88px 24px 60px;position:relative;z-index:1;';

  div.innerHTML = `
    <button class="back-btn" id="lit-back">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M19 12H5M5 12l7-7M5 12l7 7"/></svg>
      Back
    </button>

    <div style="max-width:800px;margin:0 auto">
      <h1 style="font-family:var(--font-title);font-size:clamp(1.6rem,3vw,2.4rem);color:var(--gold);margin-bottom:6px">
        Sources &amp; Literature
      </h1>
      <p style="font-family:var(--font-heading);font-size:11px;letter-spacing:.16em;color:var(--text-muted);text-transform:uppercase;margin-bottom:40px">
        References used in the development of Dark Souls Pathfinder
      </p>

      ${renderSection('Game Content & Lore', [
        { title: 'Fextralife Dark Souls Wiki — World Information', url: 'https://darksouls.wiki.fextralife.com/World+Information', note: 'Primary source for zone descriptions, boss lore, and game world structure.' },
        { title: 'Fextralife Dark Souls Wiki — Maps', url: 'https://darksouls.wiki.fextralife.com/maps', note: 'Reference for zone map layouts and navigation.' },
        { title: 'Dark Souls Fandom Wiki', url: 'https://darksouls.fandom.com/wiki/Dark_Souls_Wiki', note: 'Boss statistics (HP, souls reward, weaknesses, resistances).' },
        { title: 'Bandai Namco — Dark Souls Official Site', url: 'https://www.bandainamcoent.com/games/dark-souls-remastered', note: 'Official game publisher. Dark Souls is a trademark of FromSoftware, Inc.' },
      ])}

      ${renderSection('Frontend Development', [
        { title: 'MDN Web Docs — HTML, CSS, JavaScript Reference', url: 'https://developer.mozilla.org', note: 'Primary reference for all web standard APIs used in this project.' },
        { title: 'Google Fonts — Cinzel & Cinzel Decorative', url: 'https://fonts.google.com/specimen/Cinzel', note: 'Typography: Cinzel Decorative used for titles and headings (closest freely available font to Dark Souls typeface).' },
        { title: 'Google Fonts — IM Fell English', url: 'https://fonts.google.com/specimen/IM+Fell+English', note: 'Typography: IM Fell English used for body text (aged parchment aesthetic).' },
        { title: 'CSS Tricks — A Complete Guide to CSS Grid', url: 'https://css-tricks.com/snippets/css/complete-guide-grid/', note: 'Reference for the zone slideshow grid layout.' },
        { title: 'CSS Tricks — A Complete Guide to Flexbox', url: 'https://css-tricks.com/snippets/css/a-guide-to-flexbox/', note: 'Reference for flexible responsive layouts throughout the application.' },
      ])}

      ${renderSection('Backend Development', [
        { title: 'Express.js Documentation', url: 'https://expressjs.com/en/4x/api.html', note: 'Node.js web framework used for the REST API.' },
        { title: 'mysql2 npm package', url: 'https://www.npmjs.com/package/mysql2', note: 'MySQL client for Node.js with Promise support, used for Aiven MySQL connection.' },
        { title: 'bcryptjs npm package', url: 'https://www.npmjs.com/package/bcryptjs', note: 'Password hashing library used for secure credential storage.' },
        { title: 'express-session npm package', url: 'https://www.npmjs.com/package/express-session', note: 'Session middleware for user authentication state.' },
        { title: 'dotenv npm package', url: 'https://www.npmjs.com/package/dotenv', note: 'Environment variable management for database credentials and secrets.' },
      ])}

      ${renderSection('Database & Hosting', [
        { title: 'Aiven — Managed MySQL Cloud Database', url: 'https://aiven.io/mysql', note: 'Cloud MySQL database hosting used for production data storage.' },
        { title: 'Render — Cloud Application Hosting', url: 'https://render.com/docs', note: 'Cloud platform used for deploying the Node.js/Express backend.' },
        { title: 'MySQL 8.0 Reference Manual', url: 'https://dev.mysql.com/doc/refman/8.0/en/', note: 'Reference for SQL schema design, generated columns, and ON DUPLICATE KEY UPDATE syntax.' },
      ])}

      ${renderSection('Course Materials', [
        { title: 'Web Programiranje — Laboratorijske vježbe (LV1–LV5)', url: '#', note: 'Course laboratory exercises provided by the faculty. Project requirements and technical specifications derived from LV assignments.' },
        { title: 'Fextralife — Boss Information Template', url: 'https://darksouls.wiki.fextralife.com/Bosses', note: 'Structural reference for the boss infographic statistics table layout.' },
      ])}

      <div class="divider"></div>
      <p style="font-size:13px;color:var(--text-muted);font-style:italic;line-height:1.8;margin-top:8px">
        Dark Souls, its characters, world, and lore are the intellectual property of FromSoftware, Inc. and Bandai Namco Entertainment.
        This project is a non-commercial educational exercise. All game content referenced is used for descriptive and educational purposes only.
      </p>
    </div>`;

  app.appendChild(div);
  document.getElementById('lit-back').addEventListener('click', () => Router.navigate('landing'));
});

function renderSection(title, sources) {
  return `
    <div style="margin-bottom:40px">
      <h2 style="font-family:var(--font-heading);font-size:0.9rem;letter-spacing:.14em;text-transform:uppercase;color:var(--gold);margin-bottom:20px;padding-bottom:10px;border-bottom:1px solid var(--border)">
        ${title}
      </h2>
      <div style="display:flex;flex-direction:column;gap:14px">
        ${sources.map((s, i) => `
          <div style="display:flex;gap:16px;align-items:flex-start">
            <span style="font-family:var(--font-heading);font-size:11px;color:var(--text-muted);min-width:22px;margin-top:2px">[${i+1}]</span>
            <div>
              ${s.url !== '#'
                ? `<a href="${s.url}" target="_blank" rel="noopener noreferrer"
                      style="font-family:var(--font-heading);font-size:13px;color:var(--gold);letter-spacing:.03em;
                             border-bottom:1px solid var(--gold-dim);padding-bottom:1px;
                             transition:color .2s,border-color .2s"
                      onmouseover="this.style.color='var(--gold-bright)';this.style.borderColor='var(--gold)'"
                      onmouseout="this.style.color='var(--gold)';this.style.borderColor='var(--gold-dim)'">
                     ${s.title} ↗
                   </a>`
                : `<span style="font-family:var(--font-heading);font-size:13px;color:var(--text-secondary);letter-spacing:.03em">${s.title}</span>`
              }
              <p style="font-size:13px;color:var(--text-muted);margin-top:3px;font-style:italic;line-height:1.6">${s.note}</p>
            </div>
          </div>`).join('')}
      </div>
    </div>`;
}
