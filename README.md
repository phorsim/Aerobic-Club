# Aerobic Club

A responsive website for Aerobic Club Generation 2027. It introduces the club, its activities and members, and includes an event schedule, photo gallery, FAQ, public registration form, and an admin-only registrations dashboard.

## Run locally

From the project directory, start a local static web server:

```powershell
python -m http.server 8000
```

Then open `http://localhost:8000`. No package installation or build step is required. An internet connection is needed for the Supabase JavaScript client, fonts, and activity/gallery photos. Member, hero, and benefit photos are stored locally in `assets/`.

## Set up registration and admin access

The registration form and dashboard use Supabase. They remain unavailable until a Supabase project is configured.

1. Create a Supabase project.
2. In the Supabase SQL Editor, run `supabase-setup.sql`. It creates the registrations table and row-level security policies. Anyone can submit a registration; only authenticated users with the admin role can read registrations.
3. In `supabase-config.js`, replace the placeholders with your project's URL and publishable (or legacy anon) key. These browser credentials are public by design; **never** put a service-role or secret key in this file.
4. In Supabase Authentication, create an account for each administrator. In that user's **app metadata**, set the role to `admin` (for example, `{"role":"admin"}`). Do not set this in user-editable metadata. Have the administrator sign out and back in after changing the role.
5. Serve or deploy the project over HTTP(S), then open `admin.html` and sign in with an authorized admin account.

The dashboard displays registration names, emails, phone numbers, selected activities, and submission times. Keep admin credentials private and only grant the admin role to trusted people. The registration form asks people to consent before sharing their contact details. Do not disable row-level security or expose a Supabase secret/service-role key.

## Project structure

```text
Aerobic-Club/
├── index.html
├── admin.html
├── README.md
├── supabase-config.js
├── supabase-setup.sql
└── assets/
    ├── club-team.png
    ├── benefits/
    │   ├── feel-stronger.png
    │   ├── fun-for-everyone.png
    │   └── make-connections.png
    └── members/
        ├── chan-koemsour.png
        ├── hung-phongpisey.png
        ├── im-phors.png
        ├── lay-lue.png
        └── touch-pisey.png
```

## Update members and photos

Edit the member cards in the `Meet Our Members` section of `index.html`. Replace each name, role, image `src`, and image `alt` text as needed. Put replacement image files in `assets/members/` and keep their paths relative to `index.html`.
