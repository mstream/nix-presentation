const { expect } = require("chai");
const { format } = require('../../src/hello')

describe('hello', () => {
  describe('#format', () => {
    const actual = format('John')
    expect(actual).to.contain('(JavaScript/NPM)')
    expect(actual).to.contain('Hello')
    expect(actual).to.contain('John')
  })
})
