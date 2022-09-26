module.exports = {
  env: {
    es2021: true
  },
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  rules: {"@typescript-eslint/ban-ts-comment": ['error', 'allow-with-description']},
  root: true,
}
