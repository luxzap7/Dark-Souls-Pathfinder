const Router = (() => {
  const views = {};
  let current = null;
  let currentParams = {};
  const app = document.getElementById('app');

  function register(name, renderFn) { views[name] = renderFn; }

  async function navigate(name, params = {}) {
    if (!views[name]) { console.warn(`Router: unknown view "${name}"`); return; }
    app.innerHTML = '';
    current = name; currentParams = params;
    await views[name](app, params);
  }

  function refresh() { if (current) navigate(current, currentParams); }

  return { register, navigate, refresh };
})();
window.Router = Router;