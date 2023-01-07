const colors = require('colors/safe')

function format(personName) {
  return colors.white('(JavaScript/NPM) ') +
    colors.blue('Hello ') +
    colors.red(personName) +
    colors.blue('!')
}

module.exports = { format }
