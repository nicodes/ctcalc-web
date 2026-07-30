# ctcalc-web

The splash page at [ctcalc.com](https://ctcalc.com). One static page, whose job
is to be found in a search for contact time or CT tables and to send the reader
to the app at [app.ctcalc.com](https://app.ctcalc.com).

```sh
mise install
bun install
bun run dev      # http://localhost:4321
bun run build    # -> dist/
```

## What is here

```
src/layouts/Full.astro   <head>, meta, structured data
src/pages/index.astro    the page, and its styles
src/styles/global.css    palette, fonts, resets
public/                  favicon, robots.txt, sitemap.xml
```

Plain Astro with scoped CSS. No component framework and no CSS framework: this
is one page with no interactivity, and the scaffold's Qwik and Tailwind were a
runtime and a build step to produce markup that is written out directly.
Removing them is why the built page ships **no JavaScript at all** — CI fails if
a `<script src>` ever appears in the output.

## The app on the page is markup

The calculator in the hero is HTML, not a screenshot. It stays selectable,
scales with the reader's font size, never renders blurry on a display it was not
captured for, and does not go stale in the silent way an image does.

**Its numbers are real.** Free chlorine against giardia at 5 °C, 1.0 mg/L and
pH 7.0 for 2-log inactivation is 99 mg·min/L in the EPA table, and the
regression published alongside gives 107 for the same conditions — and `99.0`
and `107` are what the app itself prints, down to the decimal places its
formatter chooses. They were checked by running the shipped engine, not copied
from memory. A landing page showing a plausible-looking wrong answer would be
the worst possible advertisement for a calculator.

If the app's formatting changes, these change with it.

## The palette is the app's

`#208AEF` is CT Calc's splash colour and `#E6F4FE` its adaptive icon background,
both straight out of `app/app.json` in the [ctcalc](https://github.com/nicodes/ctcalc)
repo. The site wears what the product wears rather than inventing a brand
alongside it. `--blue-deep` is the darkened form used for text, because the
splash blue is a background colour and does not clear contrast at small sizes.

## SEO

The page is the whole strategy: real prose about what CT is and how it is
calculated, marked up as an `FAQPage` alongside the `SoftwareApplication`, so
the questions it answers are the ones people actually type. The coverage table
is there for the same reason — someone searching for whether chlorine dioxide
against giardia is handled should find that answer, not a feature grid.

Everything on the page is checkable against EPA 815-R-99-013. Nothing claims a
capability the app does not have; cryptosporidium is named as *not* covered
rather than left for someone to discover.

## Related

- [ctcalc](https://github.com/nicodes/ctcalc) — the app itself
