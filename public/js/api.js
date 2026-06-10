const API = {
  async _request(method, url, body = null) {
    const opts = { method, headers: { 'Content-Type': 'application/json' }, credentials: 'include' };
    if (body) opts.body = JSON.stringify(body);
    const res  = await fetch(url, opts);
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || 'Request failed');
    return data;
  },
  get:  (url)       => API._request('GET',  url),
  post: (url, body) => API._request('POST', url, body),
  put:  (url, body) => API._request('PUT',  url, body),
  auth: {
    me:       ()  => API.get('/api/auth/me'),
    login:    (d) => API.post('/api/auth/login',    d),
    register: (d) => API.post('/api/auth/register', d),
    logout:   ()  => API.post('/api/auth/logout',   {}),
  },
  games:    { list: ()    => API.get('/api/games'),          get: (id)   => API.get(`/api/games/${id}`) },
  zones:    { get:  (id)  => API.get(`/api/zones/${id}`),    rate: (id,d) => API.post(`/api/zones/${id}/rating`, d) },
  bosses:   { get:  (id)  => API.get(`/api/bosses/${id}`),   rate: (id,d) => API.post(`/api/bosses/${id}/rating`, d) },
  progress: { get:  (gid) => API.get(`/api/progress/${gid}`) },
  admin: {
    updateZoneLore: (id, lore) => API.put(`/api/admin/zones/${id}/lore`,  { lore }),
    updateBossLore: (id, lore) => API.put(`/api/admin/bosses/${id}/lore`, { lore }),
    getUsers:       ()         => API.get('/api/admin/users'),
    getStats:       ()         => API.get('/api/admin/stats'),
  },
};
window.API = API;
