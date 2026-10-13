begin;

create table if not exists public.applications (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(btrim(name)) between 1 and 80),
  contact text not null check (char_length(btrim(contact)) between 3 and 254),
  message text not null default '' check (char_length(message) <= 2000),
  created_at timestamptz not null default now()
);

alter table public.applications enable row level security;
alter table public.applications force row level security;

revoke all on table public.applications from public, anon, authenticated;
grant usage on schema public to anon, authenticated;
grant insert (name, contact, message) on public.applications to anon, authenticated;

drop policy if exists applications_insert_only on public.applications;
create policy applications_insert_only
  on public.applications
  for insert
  to anon, authenticated
  with check (
    char_length(btrim(name)) between 1 and 80
    and char_length(btrim(contact)) between 3 and 254
    and char_length(message) <= 2000
  );

comment on table public.applications is
  'SMIT MVP interest requests. Browser roles can insert only; no select, update, or delete privileges or policies.';

commit;
