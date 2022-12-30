const fs = require('fs')
const path = require('path')
const Mocha = require('mocha')

const mocha = new Mocha({
  reporter: 'list'
});

const specsDir = path.join('test', 'specs')

fs.readdirSync(specsDir)
  .filter(function(file) {
    return path.extname(file) === '.js';
  })
  .forEach(function(file) {
    mocha.addFile(path.join(specsDir, file));
  });

mocha.run(function(failures) {
  process.exitCode = failures ? 1 : 0;
});


