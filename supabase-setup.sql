create table if not exists public.registrations (
  id bigint generated always as identity primary key,
  name text not null check (char_length(btrim(name)) between 1 and 120),
  email text not null check (char_length(btrim(email)) between 3 and 254),
  phone text not null check (char_length(btrim(phone)) between 3 and 40),
  activity text not null check (
    activity in (
      'Aerobic Dance',
      'Zumba Fitness',
      'Team Challenges',
      'Khmer Dance Fitness',
      'Dance Battle',
      'Cool Down'
    )
  ),
  created_at timestamptz not null default now()
);

create index if not exists registrations_created_at_idx
  on public.registrations (created_at desc, id desc);

alter table public.registrations enable row level security;

revoke all on public.registrations from public, anon, authenticated;
grant insert on public.registrations to anon, authenticated;
grant select on public.registrations to authenticated;

drop policy if exists "Anyone can submit a registration" on public.registrations;
create policy "Anyone can submit a registration"
  on public.registrations
  for insert
  to anon, authenticated
  with check (true);

drop policy if exists "Only admins can view registrations" on public.registrations;
create policy "Only admins can view registrations"
  on public.registrations
  for select
  to authenticated
  using ((auth.jwt() -> 'app_metadata' ->> 'role') = 'admin');
