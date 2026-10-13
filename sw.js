// ...Thunder is retired: this address forwards to ...Thunder Plus. This service worker replaces the old one,
// deletes the old app's offline copies (caches named thunder-*) and unregisters itself, so the forwarding page
// always comes from the network. Saved work in localStorage and IndexedDB is not touched.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', e => {
  e.waitUntil((async () => {
    for (const k of await caches.keys()) if (k.startsWith('thunder-')) await caches.delete(k);
    await self.registration.unregister();
    for (const c of await self.clients.matchAll({type:'window'})) c.navigate(c.url);
  })());
});
