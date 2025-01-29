module.exports = [
  {
    files: ["*.js", "*.jsx", "*.ts", "*.tsx"],
    extends: [
      "eslint:recommended",
      "plugin:@typescript-eslint/recommended",
      "plugin:react/recommended",
      "plugin:react-hooks/recommended",
      "plugin:prettier/recommended",
    ],
    rules: {
      "no-console": "warn",
      "no-unused-vars": "error",
      "react/prop-types": "error",
      "react/jsx-uses-react": "error",
      "react/jsx-uses-vars": "error",
    },
  },
];
