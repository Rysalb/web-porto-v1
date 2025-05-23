'use strict';

const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  // Add your resources here
};

self.addEventListener('install', function (event) {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => cache.addAll(Object.keys(RESOURCES)))
  );
});

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return Promise.all(
        cacheName.filter((cacheName) => {
          return cacheName.startsWith('flutter-') &&
                 cacheName != CACHE_NAME;
        }).map((cacheName) => caches.delete(cacheName))
      );
    })
  );
});