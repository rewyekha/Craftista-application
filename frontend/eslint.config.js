// eslint.config.js
import eslint from "@eslint/js";
import globals from "globals";

export default [
  // Base ESLint configuration
  eslint.configs.recommended,

  {
    // Define global settings
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: {
        ...globals.browser,
        ...globals.node,
        ...globals.es2021,
      },
    },

    // Define rules
    rules: {
      semi: ["error", "always"],
      quotes: ["error", "single"],
      indent: ["error", 2],
      "comma-dangle": ["error", "always-multiline"],
      "no-unused-vars": "warn",
      "no-console": "warn",
    },

    // Define which files to lint
    files: ["**/*.js", "**/*.jsx", "**/*.ts", "**/*.tsx"],

    // Define which files/folders to ignore
    ignores: ["node_modules/**", "build/**", "dist/**", "coverage/**"],
  },
];
