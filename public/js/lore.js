/* ================================================
   lore.js — Centralised lore system
   - openLoreModal(title, lore)      → read modal for all users
   - openLoreEditModal(opts)          → edit modal for admins
   - makeLoreEditBtn(type, id, name)  → factory for admin + buttons
   ================================================ */

const Lore = (() => {

  // ── Read modal ─────────────────────────────────────────
  function openReadModal(title, loreText) {
    document.getElementById('lore-modal-title').textContent = title;
    document.getElementById('lore-modal-body').textContent  = loreText || 'No lore recorded for this location.';
    document.getElementById('lore-modal').classList.remove('hidden');
  }

  // ── Edit modal ─────────────────────────────────────────
  // opts = { type: 'zone'|'boss', id, name, currentLore, onSaved }
  function openEditModal({ type, id, name, currentLore, onSaved }) {
    const textarea  = document.getElementById('lore-edit-textarea');
    const titleEl   = document.getElementById('lore-edit-title');
    const subtitleEl = document.getElementById('lore-edit-subtitle');
    const charCount = document.getElementById('lore-char-count');
    const errEl     = document.getElementById('lore-edit-err');

    titleEl.textContent    = `Edit Lore — ${name}`;
    subtitleEl.textContent = type === 'zone' ? 'Zone lore' : 'Boss lore';
    textarea.value         = currentLore || '';
    charCount.textContent  = textarea.value.length;
    errEl.textContent      = '';

    document.getElementById('lore-edit-modal').classList.remove('hidden');
    textarea.focus();

    // Live char count
    const onInput = () => { charCount.textContent = textarea.value.length; };
    textarea.addEventListener('input', onInput);

    // Save handler — swap each open to avoid stacking listeners
    const saveBtn   = document.getElementById('lore-edit-save');
    const cancelBtn = document.getElementById('lore-edit-cancel');
    const closeBtn  = document.getElementById('lore-edit-close');

    const newSave = saveBtn.cloneNode(true);
    saveBtn.parentNode.replaceChild(newSave, saveBtn);

    newSave.addEventListener('click', async () => {
      const lore = textarea.value.trim();
      if (lore.length < 10) { errEl.textContent = 'Lore must be at least 10 characters.'; return; }
      newSave.disabled   = true;
      newSave.textContent = 'Saving…';
      try {
        if (type === 'zone') await API.admin.updateZoneLore(id, lore);
        else                 await API.admin.updateBossLore(id, lore);
        showToast(`Lore saved for ${name}.`, 'success');
        closeEditModal();
        textarea.removeEventListener('input', onInput);
        if (onSaved) onSaved(lore);
      } catch (err) {
        errEl.textContent  = err.message;
        newSave.disabled   = false;
        newSave.textContent = 'Save Lore';
      }
    });

    const close = () => { closeEditModal(); textarea.removeEventListener('input', onInput); };
    cancelBtn.onclick = close;
    closeBtn.onclick  = close;
  }

  function closeEditModal() {
    document.getElementById('lore-edit-modal').classList.add('hidden');
    document.getElementById('lore-edit-err').textContent = '';
  }

  // ── Factory: create admin + button ─────────────────────
  // Returns a <button> element ready to append to a positioned parent
  function makeLoreEditBtn(type, id, name, currentLore, onSaved) {
    const btn = document.createElement('button');
    btn.className    = 'lore-edit-btn';
    btn.title        = `Edit lore — ${name}`;
    btn.innerHTML    = '+';
    btn.setAttribute('aria-label', `Edit lore for ${name}`);
    btn.addEventListener('click', e => {
      e.stopPropagation();
      openEditModal({ type, id, name, currentLore, onSaved });
    });
    return btn;
  }

  // ── Init global listeners ──────────────────────────────
  function init() {
    // Read modal close
    document.getElementById('lore-modal-close').addEventListener('click', () =>
      document.getElementById('lore-modal').classList.add('hidden')
    );
    document.getElementById('lore-modal').addEventListener('click', e => {
      if (e.target.id === 'lore-modal') document.getElementById('lore-modal').classList.add('hidden');
    });
    // Edit modal bg click close
    document.getElementById('lore-edit-modal').addEventListener('click', e => {
      if (e.target.id === 'lore-edit-modal') closeEditModal();
    });
  }

  return { init, openReadModal, openEditModal, makeLoreEditBtn };
})();

window.Lore = Lore;
// Keep backward compat with auth.js openLoreModal calls
window.openLoreModal = (title, lore) => Lore.openReadModal(title, lore);
