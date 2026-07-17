-- ============================================================
--  Kursabrechnung – Supabase Schema & Sicherheit
--  Einmalig im Supabase SQL-Editor ausführen (Projekt → SQL Editor → New query → Run)
-- ============================================================

-- 1) Tabellen -------------------------------------------------

create table if not exists public.app_settings (
  id    text primary key default 'main',
  data  jsonb not null default '{}'::jsonb
);

create table if not exists public.studios (
  id             uuid primary key default gen_random_uuid(),
  name           text not null,
  ansprechpartner text,
  strasse        text,
  plz            text,
  ort            text,
  email          text,
  verguetung     numeric default 0,
  einheit        text default 'Kurs',
  entfernung     numeric default 0,
  created_at     timestamptz default now()
);

create table if not exists public.eintraege (
  id         uuid primary key default gen_random_uuid(),
  datum      date not null,
  studio_id  uuid references public.studios(id) on delete set null,
  anzahl     integer default 1,
  notiz      text,
  created_at timestamptz default now()
);

-- 2) Row Level Security ---------------------------------------
--    Alle eingeloggten Nutzer (= nur ihr beide) teilen sich die Daten.
--    Ohne Login ist kein Zugriff möglich.

alter table public.app_settings enable row level security;
alter table public.studios      enable row level security;
alter table public.eintraege    enable row level security;

create policy "authed full access – settings"
  on public.app_settings for all to authenticated
  using (true) with check (true);

create policy "authed full access – studios"
  on public.studios for all to authenticated
  using (true) with check (true);

create policy "authed full access – eintraege"
  on public.eintraege for all to authenticated
  using (true) with check (true);

-- 3) Startzeile für Einstellungen -----------------------------
insert into public.app_settings (id, data)
values ('main', '{}'::jsonb)
on conflict (id) do nothing;

-- ============================================================
--  Danach: Authentication → Users → beide Konten (du + Katharina) anlegen.
--  Anschließend unter Authentication → Providers/Settings die
--  Selbstregistrierung deaktivieren ("Allow new users to sign up" aus),
--  damit sich niemand Fremdes ein Konto anlegen kann.
-- ============================================================
