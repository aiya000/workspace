#!/bin/sh
tsc --out temp.js promise.ts promises-typescript/lib/Promises.ts
cat temp.js | sed s/console.log/print/g > promise.js && rm temp.js
