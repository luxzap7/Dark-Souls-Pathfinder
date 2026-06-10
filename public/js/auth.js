const Auth = (() => {
  let currentUser = null;

  function showToast(msg, type = 'info', duration = 3200) {
    const t = document.getElementById('toast');
    t.textContent = msg;
    t.className   = `toast ${type}`;
    clearTimeout(t._timer);
    t._timer = setTimeout(() => { t.className = 'toast hidden'; }, duration);
  }
  window.showToast = showToast;

  function openModal(tab = 'login') {
    document.getElementById('auth-modal').classList.remove('hidden');
    switchTab(tab);
  }

  function closeModal() {
    document.getElementById('auth-modal').classList.add('hidden');
    clearErrors();
  }

  function switchTab(tab) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.toggle('active', b.dataset.tab === tab));
    document.getElementById('login-form').classList.toggle('hidden',    tab !== 'login');
    document.getElementById('register-form').classList.toggle('hidden', tab !== 'register');
    clearErrors();
  }

  function clearErrors() {
    document.querySelectorAll('.field-error, .form-error').forEach(el => el.textContent = '');
    document.querySelectorAll('input.error').forEach(el => el.classList.remove('error'));
  }

  function setErr(inputId, errId, msg) {
    document.getElementById(inputId)?.classList.add('error');
    const el = document.getElementById(errId);
    if (el) el.textContent = msg;
    return false;
  }
  function clearErr(inputId, errId) {
    document.getElementById(inputId)?.classList.remove('error');
    const el = document.getElementById(errId);
    if (el) el.textContent = '';
  }

  function validateLogin(email, password) {
    let ok = true;
    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setErr('login-email','login-email-err','Enter a valid email.'); ok=false; } else clearErr('login-email','login-email-err');
    if (!password) { setErr('login-password','login-password-err','Password is required.'); ok=false; } else clearErr('login-password','login-password-err');
    return ok;
  }

  function validateRegister(username, email, password, confirm) {
    let ok = true;
    if (!username||username.length<3||username.length>50) { setErr('reg-username','reg-username-err','Username must be 3–50 characters.'); ok=false; } else clearErr('reg-username','reg-username-err');
    if (!email||!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setErr('reg-email','reg-email-err','Enter a valid email.'); ok=false; } else clearErr('reg-email','reg-email-err');
    if (!password||password.length<8) { setErr('reg-password','reg-password-err','Password must be at least 8 characters.'); ok=false; } else clearErr('reg-password','reg-password-err');
    if (password!==confirm) { setErr('reg-confirm','reg-confirm-err','Passwords do not match.'); ok=false; } else clearErr('reg-confirm','reg-confirm-err');
    return ok;
  }

  async function handleLogin(e) {
    e.preventDefault();
    const email    = document.getElementById('login-email').value.trim();
    const password = document.getElementById('login-password').value;
    if (!validateLogin(email, password)) return;
    try {
      const data = await API.auth.login({ email, password });
      currentUser = data.user;
      updateAuthUI();
      closeModal();
      showToast(`Welcome back, ${currentUser.username}.`, 'success');
      window.Router?.refresh();
    } catch (err) { document.getElementById('login-form-err').textContent = err.message; }
  }

  async function handleRegister(e) {
    e.preventDefault();
    const username = document.getElementById('reg-username').value.trim();
    const email    = document.getElementById('reg-email').value.trim();
    const password = document.getElementById('reg-password').value;
    const confirm  = document.getElementById('reg-confirm').value;
    const isAdmin  = document.getElementById('reg-is-admin').checked;
    const adminKey = document.getElementById('reg-adminkey').value;
    if (!validateRegister(username, email, password, confirm)) return;
    try {
      const data = await API.auth.register({ username, email, password, role: isAdmin ? 'admin' : 'user', adminKey });
      currentUser = data.user;
      updateAuthUI();
      closeModal();
      showToast(`Welcome, ${currentUser.username}. Your journey begins.`, 'success');
      window.Router?.refresh();
    } catch (err) { document.getElementById('reg-form-err').textContent = err.message; }
  }

  async function logout() {
    await API.auth.logout();
    currentUser = null;
    updateAuthUI();
    showToast('Farewell, Undead.', 'info');
    window.Router?.navigate('landing');
  }

  function updateAuthUI() {
    const btn     = document.getElementById('auth-btn');
    const infoEl  = document.getElementById('auth-user-info');
    const adminBtn = document.getElementById('admin-panel-btn');

    if (currentUser) {
      btn.classList.add('logged-in');
      btn.title = 'Sign out';
      infoEl.innerHTML = `${currentUser.username}<span class="role-badge">${currentUser.role === 'admin' ? '⚔ Admin' : 'Undead'}</span>`;
      infoEl.classList.remove('hidden');
      // Show admin button only for admins
      if (currentUser.role === 'admin') {
        adminBtn.classList.remove('hidden');
      } else {
        adminBtn.classList.add('hidden');
      }
    } else {
      btn.classList.remove('logged-in');
      btn.title = 'Sign in';
      infoEl.classList.add('hidden');
      adminBtn.classList.add('hidden');
    }
  }

  async function init() {
    try {
      const { user } = await API.auth.me();
      currentUser = user;
      if (user) updateAuthUI();
    } catch (_) {}

    document.getElementById('auth-btn').addEventListener('click', () => {
      if (currentUser) logout(); else openModal('login');
    });
    document.getElementById('modal-close').addEventListener('click', closeModal);
    document.getElementById('auth-modal').addEventListener('click', e => { if (e.target.id === 'auth-modal') closeModal(); });
    document.querySelectorAll('.tab-btn').forEach(btn => btn.addEventListener('click', () => switchTab(btn.dataset.tab)));
    document.getElementById('login-form').addEventListener('submit',    handleLogin);
    document.getElementById('register-form').addEventListener('submit', handleRegister);
    document.getElementById('reg-is-admin').addEventListener('change', e => {
      document.getElementById('admin-key-group').classList.toggle('hidden', !e.target.checked);
    });

    // Admin panel button
    document.getElementById('admin-panel-btn').addEventListener('click', () => {
      Router.navigate('admin');
    });
  }

  return { init, getUser: () => currentUser, openModal };
})();
window.Auth = Auth;
