#!/usr/bin/env node

/* 
  The shebang above is going to be replaced by Nix with a path to a 
  specific 'nodejs' package binary in the Nix store.
*/

import('../app.js')
  .then(({main}) => main())
  .catch(error => {
    console.error(error);
    process.exit(1);
  })

