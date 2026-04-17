# Unlimited Club — Full-Stack Engineer

**Company:** Virescence  
**Period:** February 2026 – April 2026  
**Stack:** PHP 8 · Laravel 11 · Vue 3 · Inertia.js · Tailwind CSS · TypeScript · MySQL · Python · GitHub Actions

> 195 commits · 1,900+ files touched · ~64,000 lines added

---

## Member Account Portal — Full Modernization
`Vue 3` `Inertia.js` `Tailwind CSS` `Laravel` `CardConnect`

- Replaced a legacy Blade-rendered account page with a full Inertia.js/Vue 3 SPA, delivering a branded dark-theme UI with zero full-page reloads
- Decomposed a monolithic page component into composables, services, and utilities; enforced plan-scoped routing and link-based action fallbacks throughout
- Built payment, plan, and wash history modals with shimmer skeleton loading and JSON chip rendering
- Integrated CardConnect tokenizer to enable secure in-page payment method addition without leaving the account view
- Surfaced active promotion discounts inline on vehicle cards; added lift-pause flow, inactive vehicle state, and admin billing/gift card controls

---

## Plan Cancellation Flow — Greenfield Build
`Vue 3` `Inertia.js` `Laravel` `Tailwind CSS`

- Designed and shipped a multi-screen modular cancellation flow (reason → retention offer → savings summary → confirmation) as a net-new feature
- Made retention offer and value callouts fully data-driven; integrated ZIP-code nearest-locations lookup to surface alternatives and reduce cancel intent
- Implemented a reusable pause endpoint using a generic success-state pattern shared across cancel flow screens
- Added full audit logging for cancellation feedback actions and triggered a transactional confirmation email on submit
- Hardened edge cases: blocked auto-cancel on offer decline, corrected offer-log timing, secured location lookups, resolved dark-mode style overrides

---

## Retention Offer System
`Laravel` `PHP` `HelloWash API` `Vue 3`

- Built a `RetentionOfferService` (split into separate API and UI layers) that resolves personalized discount offers from the HelloWash external API
- Implemented source-aware promo code mapping so offers correctly resolve by member signup channel
- Exposed the active retention offer in plan data on the account index; persisted cancellation context alongside offer events
- Logged all retention interactions (view / accept / decline) to a plan-scoped audit trail

---

## Join / Signup Flow — Inertia Migration & UX Overhaul
`Vue 3` `Inertia.js` `TypeScript` `Google Maps API` `Laravel`

- Migrated a multi-step signup flow from server-rendered Blade to Inertia.js with deferred property loading, eliminating blocking renders during plan fetch
- Broke a large monolithic `Join.vue` into focused child components; added tilt-animated plan selection cards with state persisted across navigation steps
- Implemented county-level tax calculation and a gift card payment UI (card-styled input, remaining balance display, optional credit card skip for auto-renew)
- Added TypeScript typings for Google Maps objects; improved mobile layout and centralized responsive breakpoints

---

## Club Login Page
`Vue 3` `Inertia.js` `Laravel`

- Built a parallel Inertia/Vue implementation of the club login page with a shared service layer, then promoted it to the canonical `/club` route
- Added multi-method login support (account lookup / sign-in) with the selected method persisted in session across page loads

---

## Chemical Usage & Product Management
`Laravel` `PHP` `Vue 3` `Python` `OpenXML/xlsx`

- Built an internal product management module covering SKU tracking, soft-deactivation, barrel transfers, inventory exceptions, and bulk Excel upload
- Implemented a full audit trail and one-click revert for bulk uploads to protect against bad data imports reaching production
- Built an xlsx-downloadable usage report with cost and unit columns; integrated with the `pyjax` Python microservice (`/chemical_usage_stats`) to pull live cars-washed figures

---

## Platform & Infrastructure
`Laravel` `GitHub Actions` `Scramble (OpenAPI)` `MySQL` `SQLite` `Python`

- Set up GitHub Actions CI from scratch: PHP test suite on push, SQLite test environment provisioned from `.env.example`, `APP_KEY` generation step, and GitHub-compatible JUnit reporting
- Built Artisan commands to automate migration regeneration; centralized UUID swap logic to handle MySQL vs. SQLite compatibility in generated migrations
- Added a nearest-locations REST endpoint (ZIP → proximate wash locations) and a CSV-driven Artisan import command for seeding location addresses
- Authored Scramble/OpenAPI documentation for all external-facing endpoints; added password protection to the API docs route
- Scaffolded and shipped a monthly team bonus report pulling from SiteWatch operational data
