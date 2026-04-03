-- Only start ts_ls in Node.js / Bun projects.
-- Prevents conflict with denols which owns Deno projects.
return {
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
}
