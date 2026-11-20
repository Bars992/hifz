// Miftah : service worker (installation de l'appli + notifications). Aucun cache : les mises à jour restent immédiates.
self.addEventListener('install',e=>self.skipWaiting());
self.addEventListener('activate',e=>e.waitUntil(self.clients.claim()));
self.addEventListener('fetch',e=>{});
self.addEventListener('push',e=>{
  let d={};try{d=e.data?e.data.json():{}}catch(x){d={body:e.data?e.data.text():''}}
  e.waitUntil((async()=>{
    await self.registration.showNotification(d.title||'Miftah',{body:d.body||'',icon:'icon-192.png',tag:d.tag||undefined,data:{url:'./'}});
    try{const n=(await self.registration.getNotifications()).length;if(self.navigator&&self.navigator.setAppBadge)await self.navigator.setAppBadge(n)}catch(x){}
  })());
});
self.addEventListener('notificationclick',e=>{
  e.notification.close();
  e.waitUntil(self.clients.matchAll({type:'window',includeUncontrolled:true}).then(cs=>{for(const c of cs){if('focus' in c)return c.focus()}return self.clients.openWindow('./')}));
});
