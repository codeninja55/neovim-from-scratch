-- Only start denols in Deno projects.
-- Prevents conflict with ts_ls which owns Node.js / Bun projects.
return {
  root_markers = { "deno.json", "deno.jsonc", "deno.lock" },
}
