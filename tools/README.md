# Add proxy to firebase
1. Find the global node_modules:
```
npm config get prefix
```
2 change the proxy config to "firebase-tools/lib/bin/firebase.js"
```js
process.env.http_proxy = 'xxxx';
```
