-- Créneaux de récitation : à exécuter une seule fois dans Supabase (SQL Editor)
create table if not exists public.reservations (
  id uuid primary key default gen_random_uuid(),
  jour date not null,
  heure text not null,
  eleve uuid not null default auth.uid() references auth.users(id) on delete cascade,
  nom text,
  seance text,
  created_at timestamptz default now(),
  unique (jour, heure));

alter table public.reservations enable row level security;

create policy "resa lire" on public.reservations for select to authenticated
  using (eleve = auth.uid() or public.is_prof());
create policy "resa creer" on public.reservations for insert to authenticated
  with check (eleve = auth.uid());
create policy "resa annuler" on public.reservations for delete to authenticated
  using (eleve = auth.uid() or public.is_prof());

grant select, insert, delete on public.reservations to authenticated;

-- Les élèves voient quels créneaux sont pris, sans voir qui les a pris
create or replace function public.creneaux_pris(d1 date, d2 date)
returns table(jour date, heure text)
language sql security definer set search_path = public stable as $$
  select jour, heure from public.reservations where jour between d1 and d2
$$;
grant execute on function public.creneaux_pris(date, date) to authenticated;
