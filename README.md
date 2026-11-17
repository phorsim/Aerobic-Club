# Aerobic Club

A responsive, single-page website for Aerobic Club Generation 2027. It introduces the club, its activities and members, and includes an event schedule, photo gallery, FAQ, and demo registration form.

## View the website

Open `index.html` in a web browser. No build tools or package installation are required.

Some fonts and activity/gallery photos are loaded from external websites, so an internet connection is needed for those assets. Member, hero, and benefit photos are stored locally in `assets/`.

## Project structure

```text
Aerobic-Club/
├── index.html
├── README.md
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

## Registration form

The form currently runs only in the browser: it displays a confirmation message and does not send or save registration details. Connect it to a backend or form service before using it to collect real registrations.
