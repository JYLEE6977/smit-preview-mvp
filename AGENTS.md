# Project instructions

- Before changing UI, read `docs/design-system.md`, `docs/design-reference.md`, `MVP.md`, and `README.md`.
- Use `docs/design-system.md` as the adopted SMIT UI rules. Separate source observations, adopted decisions, browser-verified results, and unverified items in reports.
- Keep the static single-file `index.html` architecture and the English product UI. Keep Korean documentation readable; use word-based Korean wrapping if Korean content is added.
- Preserve SMIT red branding and the provenance of official school photographs. Never present sample classes or schedules as confirmed offerings.
- Preserve class feedback, editable weekly plans, and the Supabase interest form. Only a publishable key may appear in browser code. Do not introduce read, update, or delete access to applications.
- Verify desktop and mobile layouts, overflow, keyboard focus, selected and disabled states, reduced motion, and existing functions when changing UI. Report limits honestly; do not bypass a blocked reference URL.
- Exclude `.tools`, `node_modules`, credentials, `.env` files and applicant details from commits. Do not modify unrelated user files.
- Production deployment follows GitHub `main` pushes to Vercel; do not deploy directly with Vercel CLI.
