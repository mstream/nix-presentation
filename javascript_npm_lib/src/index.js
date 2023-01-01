import { format } from './hello'

const personName = process.argv[2]

if (!personName) {
  console.error('The "person name" path parameter should be provided.')
  process.exit(1)
}

console.info(format(personName))
