const Router = (() => {
  const views = {};
  const history = [];
  let current = null;
  let currentParams = {};
  const app = document.getElementById('app');

  function register(name, renderFn) { views[name] = renderFn; }

  async function navigate(name, params = {}, options = {}) {
    if (!views[name]) { console.warn(`Router: unknown view "${name}"`); return; }
    app.innerHTML = '';
    if (!options.replace && current) {
      history.push({ name: current, params: currentParams });
    }
    current = name;
    currentParams = params;
    const navMenu = document.getElementById('nav-menu');
    if (navMenu) {
      if (name === 'intro') navMenu.classList.add('hidden');
      else navMenu.classList.remove('hidden');
    }
    await views[name](app, params);
  }

  async function back() {
    if (history.length === 0) { navigate('landing'); return; }
    const prev = history.pop();
    await navigate(prev.name, prev.params, { replace: true });
  }

  function refresh() { if (current) navigate(current, currentParams, { replace: true }); }

  return { register, navigate, back, refresh };
})();
window.Router = Router;
