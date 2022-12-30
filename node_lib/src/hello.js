const chalk = require('chalk')

function format(personName) {
  return chalk.blackBright('(Node) ') +
    chalk.blue('Hello ') +
    chalk.red(personName) +
    chalk.blue('!')
}

module.exports = { format }
