document.addEventListener('DOMContentLoaded', async () => {
  Lore.init();
  await Auth.init();
  Router.navigate('intro');
});
