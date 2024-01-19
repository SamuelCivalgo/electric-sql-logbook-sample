module.exports = {
  extends: [
    'prettier',
    'plugin:prettier/recommended',
    'plugin:react/recommended',
    'plugin:@typescript-eslint/recommended',
  ],
  root: true,
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 'esnext',
  },
  plugins: [
    '@typescript-eslint',
    'import',
    'prettier',
    'security',
    'simple-import-sort',
    'react-hooks',
  ],
  settings: {
    react: {
      version: 'detect',
    },
  },
  env: {
    node: true,
  },

  rules: {
    'prettier/prettier': [
      'error',
      {
        endOfLine: 'auto',
      },
    ],
    '@typescript-eslint/ban-ts-comment': 'warn',
    '@typescript-eslint/no-explicit-any': 'error',
    // '@typescript-eslint/explicit-module-boundary-types': 'error',
    'react/display-name': 'off',
    'react/prop-types': 'off',
    'react/react-in-jsx-scope': 'off', // React is always in scope now
    'react-hooks/rules-of-hooks': 'error',
    'react-hooks/exhaustive-deps': [
      'error',
      { enableDangerousAutofixThisMayCauseInfiniteLoops: true },
    ],
    '@typescript-eslint/no-unused-vars': 'error',
    'simple-import-sort/imports': [
      'error',
      {
        groups: [
          // Side effect imports without name (i.e. antd css)
          ['^\\u0000'],
          // Packages.
          // Things that start with a letter (or digit or underscore), or `@` followed by a letter.
          ['^@?[a-z]'],
          // Aliased paths (First letter is upperCase)
          ['^[A-Z]'],
          // Relative imports
          [
            // Anything that starts with a dot.
            '^[^.]',
            '^\\.',
          ],
        ],
      },
    ],
    'import/first': 'error',
    'import/newline-after-import': 'error',
    'import/no-duplicates': 'error',
    eqeqeq: ['error', 'smart'],
    'linebreak-style': ['error', 'unix'], // (default) enforces the usage of Unix line endings: \n for LF.
    'prefer-const': 'error',
    'no-var': 'error',
    'no-process-env': 'error',
    'no-console': ['error', { allow: ['warn', 'error', 'info'] }],
  },
}
