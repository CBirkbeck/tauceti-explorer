# PAPER-BURUNGALE-KOBAYASHI-OTA-21 — source-access checkpoint

Author: ChatGPT (GPT-6 Astra Pro). Session: `astra-7c41e9`. Refs #1117.
Date: 2026-09-21. Status: incomplete; no mathematical extraction submitted.

## What was established

The claim was confirmed by the bot for claim comment 5763731069. Current WORKERS,
BROWSER_AGENTS, PROTOCOL section 16, expansion PROTOCOL and UPSTREAM_GUIDE were read.
The inspected repository baseline is `6eb690f8bea11dfc057110a2b84009844bf1d005`.

The publisher identifies the requested paper as Ashay A. Burungale, Shinichi
Kobayashi and Kazuto Ota, *Rubin's conjecture on local units in the anticyclotomic
tower at inert primes*, Annals of Mathematics 194 (2021), no. 3, 943–966,
DOI `10.4007/annals.2021.194.3.8`:
https://annals.math.princeton.edu/2021/194-3/p08
Its abstract concerns the unramified quadratic extension of Q_p and p >= 5.
The 2021 theorem must not silently acquire the later p = 3 or ramified-prime scope.

CaltechAUTHORS advertises a **published-version** file, not merely an unrelated
preprint, at https://authors.library.caltech.edu/records/8svwt-jn031 .
The catalogue lists `annals.2021.194.3.8.pdf`, about 1 MB, with catalogue MD5
`585fd850759cd9ea4498a2e2ff591a76`. This is a catalogue value, not a locally
verified checksum. Its previous EPrint identifier is 112316. The publication
metadata agree with the publisher.

## Access boundary — do not count this as reading the paper

The metadata were accessible, but attempts to read the advertised PDF through
this session's web tools failed (cache miss or inaccessible endpoint):

- https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf
  and its `?download=1` variant;
- the old EPrint file location
  https://authors.library.caltech.edu/112316/1/annals.2021.194.3.8.pdf ;
- the publisher's candidate PDF endpoint and the Project Euclid DOI article/PDF
  endpoints. Project Euclid returned only an iframe, not article content.

The public author publication lists were also checked:
https://sites.google.com/view/ashayk-/home and
https://sites.google.com/view/shinichikobayashi/ . They confirm the publication;
the inspected links did not supply an accessible copy of this particular PDF.
A direct download attempt also failed. No source bytes, page images, or
SHA-256 were obtained. This is an access limitation of this run, not a claim
that the paper is unavailable to other workers or behind an unavoidable paywall.

No theorem was reconstructed from an abstract, a search-engine synopsis, or a
later paper. No library/planned/missing classification or final route has been
certified. No result JSON was fabricated: `check_paper.py` requires actual items,
and a metadata-only entry would not meet the mathematical extraction standard.

## Resume here

1. Acquire the published Caltech file above with working source access; verify
   its title, pagination and publication metadata, and record its own SHA-256
   and acquisition date. Read all 24 pages, including proofs and bibliography.
2. Extract definitions, constructions and key results, splitting multipart
   statements; check referenced inputs where needed. Do not substitute the
   different 2024/2025 p = 3 paper or a later sign-decomposition paper.
3. Read at least two relevant upstream roadmaps, the pinned library sources,
   reviewed audit, complete atlas extracts, new roadmap definitions and existing
   packets. Those mathematical searches have **not** been done in this checkpoint.
4. Determine source versus Part II versus new routes from the actual statements,
   with particular attention to inert-anticyclotomic versus cyclotomic and
   split-ordinary hypotheses. Treat that distinction as a question to check,
   not a pre-decided route.
5. Write both issue deliverables and run `scripts/check_paper.py`; use complete
   status only after whole-paper extraction and exactly-once missing-item routing.

Only this job's handoff is submitted. No Lean file is required or compiled.
The checkpoint is not completion and should release the paper job for a worker
with working full-text access after intake, rather than send it to final review.
