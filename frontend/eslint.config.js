import eslintConfigRecommended from "eslint/configurations/recommended.js";
import eslintPluginReact from "eslint-plugin-react/configurations/recommended.js";
import eslintPluginReactHooks from "eslint-plugin-react-hooks/configurations/recommended.js";
import eslintPluginPrettier from "eslint-plugin-prettier/configurations/recommended.js";
import eslintPluginTypescript from "@typescript-eslint/eslint-plugin/configurations/recommended.js";

export default [
  {
    files: ["*.js", "*.jsx", "*.ts", "*.tsx"],
    parserOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
    },
    rules: {
      "no-console": "warn",
      "no-unused-vars": "error",
      "react/prop-types": "error",
      "react/jsx-uses-react": "error",
      "react/jsx-uses-vars": "error",
    },
    plugins: ["@typescript-eslint", "react", "react-hooks", "prettier"],
    ...eslintConfigRecommended,
    ...eslintPluginReact,
    ...eslintPluginReactHooks,
    ...eslintPluginPrettier,
    ...eslintPluginTypescript,
  },
];
