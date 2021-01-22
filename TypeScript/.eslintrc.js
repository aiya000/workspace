module.exports = {
  env: {
    browser: true,
    es6: true,
    node: true,
  },
  extends: ['plugin:import/errors', 'plugin:import/warnings', 'plugin:import/typescript'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: 'tsconfig.json',
    sourceType: 'module',
  },
  plugins: ['@typescript-eslint', 'import'],

  rules: {
    '@typescript-eslint/no-unused-vars': 'off',

    '@typescript-eslint/adjacent-overload-signatures': 'error',
    '@typescript-eslint/array-type': ['error', { default: 'generic' }],
    '@typescript-eslint/no-empty-function': 'error',
    '@typescript-eslint/no-empty-interface': 'warn',
    '@typescript-eslint/no-floating-promises': 'error',
    '@typescript-eslint/no-namespace': 'error',
    '@typescript-eslint/no-unnecessary-type-assertion': 'error',
    '@typescript-eslint/no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
    '@typescript-eslint/prefer-for-of': 'warn',
    '@typescript-eslint/triple-slash-reference': 'error',
    '@typescript-eslint/unified-signatures': 'warn',
    'comma-dangle': ['error', 'always-multiline'],
    'constructor-super': 'error',
    'import/no-deprecated': 'warn',
    'import/no-duplicates': 'off',
    'import/no-extraneous-dependencies': 'error',
    'import/no-named-default': 'off',
    'import/no-unassigned-import': 'warn',
    'no-cond-assign': 'error',
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-duplicate-case': 'error',
    'no-duplicate-imports': 'error',
    'no-invalid-this': 'error',
    'no-multi-spaces': 'off',
    'no-new-wrappers': 'error',
    'no-param-reassign': 'error',
    'no-redeclare': 'error',
    'no-sequences': 'error',
    'no-throw-literal': 'error',
    'no-unsafe-finally': 'error',
    'no-unused-labels': 'error',
    'no-use-before-define': 'off',
    'no-useless-constructor': 'off',
    'no-var': 'warn',
    'no-void': 'error',
    'prefer-const': 'warn',
    eqeqeq: ['warn', 'always'],

    'space-before-function-paren': [
      'error',
      {
        named: 'never',
        anonymous: 'always',
        asyncArrow: 'always',
      },
    ],

    'no-empty': [
      'error',
      {
        allowEmptyCatch: true,
      },
    ],

    'no-shadow': [
      'error',
      {
        hoist: 'all',
      },
    ],
  },

  settings: {
    jsdoc: {
      tagNamePreference: {
        returns: 'return',
      },
    },
  },
}
