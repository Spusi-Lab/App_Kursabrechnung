# Kursabrechnung

Interne App für die monatliche Kursabrechnung, Rechnungsstellung und
Fahrtkosten-Ermittlung. Statische Seite (eine `index.html`), Daten liegen in
Supabase, Login schützt den Zugriff.

## Einmaliges Setup

### 1) Supabase (falls noch nicht geschehen)
Siehe `supabase-setup.sql` – im Supabase SQL-Editor ausführen, danach unter
**Authentication → Users** zwei Konten anlegen (dich + Katharina) und
**Allow new users to sign up** deaktivieren.

### 2) GitHub-Repo anlegen
1. Auf github.com ein neues, leeres Repository anlegen, z. B. `kursabrechnung`
   (privat oder öffentlich – egal, es liegen keine Geheimnisse in der Datei).
2. `index.html` (und optional dieses README) über **Add file → Upload files**
   hochladen. Kein Git-Kommandozeilenwissen nötig.

### 3) Mit Vercel verbinden
1. Auf vercel.com mit dem GitHub-Account anmelden.
2. **Add New… → Project** → das Repo `kursabrechnung` auswählen → **Import**.
3. Framework Preset: **Other** (keine Build-Konfiguration nötig, da reines
   HTML). Einfach **Deploy** klicken.
4. Vercel vergibt eine URL wie `kursabrechnung.vercel.app`. Fertig.

### 4) Zugangsdaten eintragen
In `index.html` ganz oben `SUPABASE_URL` und `SUPABASE_ANON_KEY` eintragen
(aus Supabase → Project Settings → API) – oder leer lassen, dann fragt die
App beim ersten Öffnen danach und merkt sich die Werte lokal im Browser.

## Künftige Änderungen

Wenn ich (Claude) die Datei weiterentwickle, reicht:
1. Neue `index.html` im GitHub-Repo ersetzen (**Upload files**, überschreiben).
2. Vercel deployed automatisch neu – meist innerhalb weniger Sekunden.

Kein erneutes manuelles Hochladen bei einem Hosting-Dienst mehr nötig.

## Eigene Domain (optional)
Unter Vercel → Project → **Settings → Domains** lässt sich später eine
eigene Domain oder Subdomain verbinden, falls gewünscht.
