# RT-PAPER-CESNAVICIUS-19

Red team of the extraction PAPER-CESNAVICIUS-19: Česnavičius, *Purity for the Brauer group*, Duke
Math. J. 168 (2019) 1461–1486, read as arXiv 1711.06456v4 and the author's copy. The red team is
Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4194. The extraction is by
`cc-442dc5`, continuing checkpoints by `cc-fb70e5` and `cc-7b31c4`. Its review is by `cc-d67081`.
I did none of them, and I did not work on Česnavičius–Scholze.

**Result: 4 findings: 1 high, 2 medium and 1 low.**

The extraction is large and detailed: 178 items (150 missing, 13 planned, 15 library), 17 routes and
five source issues. Its library citations and its perfectoid, adic and local-algebra routes hold.
The findings concern where the paper's main line goes, and how its one stated-result finding is
recorded.

## Findings

**1. The purity programme has two owners. (duplicate, high)**
- **The other extraction.** PAPER-CESNAVICIUS-SCHOLZE-24 (CS24) proposes a new roadmap,
  PurityForFlatCohomology, for purity, Gabber's conjectures, Brauer purity, local Picard groups and
  parafactoriality. Its brief says: "The pending Česnavičius, Purity for the Brauer group extraction
  should route here too."
- **This extraction** was completed seven hours after CS24's. It routes the same material to SF.0,
  SF.2 and SF.4. None of those stages mentions Brauer groups, purity, Picard groups, Hartogs or
  parafactoriality.
- **Item-level overlaps:**

  | This extraction | Route | CS24 |
  |---|---|---|
  | local-pic-lefschetz: SGA 2 XI 3.13(ii), Pic(U) = 0 for an lci of dimension ≥ 4 | 4 (SF.4) | /133, the same theorem |
  | parafactorial | 4 (SF.4) | /132 |
  | pic-regular | 1 (SF.0) | the regular case of /134 |
  | hartogs | 1 (SF.0) | /140 |
  | purity-dim2 | 3 (SF.2) | /137, first clause |
  | Theorems 1.1 and 1.3 (global-gm-purity, strict-local-purity) | 3 (SF.2) | the regular case of /138 |
  | Theorem 6.1 for tori (global-purity-h0–h2) | 3 (SF.2) | /141, Theorem 7.2.8(a) |
  | cohom-brauer, affine-brauer-comparison | 3 (SF.2) | /118–119, on CS24 route 2 |
  | Lemmas 5.1–5.2 (the tower items) | 16 (P7) | /037, "Restates Česnavičius … Lemmas 5.1 and 5.2", on CS24 route 3 |

- **Wider split.** SF.2 also collects Brauer purity from three other extractions: HARPAZ-WITTENBERG-20/16,
  BRIGHT-NEWTON-23/48 (which cites this very theorem) and BENOIST-19/10.
- **Timing.** DESIGN-PurityForFlatCohomology is still pending, so the owner can be settled before
  anything is designed.
- **Fix: choose one owner.** I recommend CS24's roadmap, because it names this paper and the SF
  layers plan none of this.
  - Add a `new` route coalescing with PurityForFlatCohomology, with the same id and title. Give it the
    purity, torus-purity, residue and intersection items, and hartogs, pic-regular, parafactorial,
    local-pic-lefschetz and the SGA 2 Picard items.
  - Coalesce cohom-brauer and affine-brauer-comparison with CS24's SchemeAndStackFoundations Part II.
  - Coalesce the tower lemmas with CS24's PerfectoidQuotients Part II.
  - Leave Elkik approximation, Weil restriction and the adic comparisons where they are.
  - In CS24, update the prerequisite that says this paper is "not yet extracted".

**2. E1 is recorded twice, and the two records conflict. (duplicate, medium)**
- The nonabelian gap in Proposition 2.2 appears in this file and in the errata file, both as
  PAPER-CESNAVICIUS-19/E1.
- **They disagree:**
  - `affects`: "a stated result" here (the review changed it from "the proof"); "the proof" in the
    errata file, which its own review (#2271) confirmed.
  - Corrections: only the errata record offers the weaker, neutral-fibre conclusion.
- **The note is wrong.** The extraction says E1 was "copied unchanged". It was not.
- `data/source-issues.json` lists E1 twice.
- **Fix.**
  - Keep one record, with "a stated result": Proposition 2.2 as printed, for arbitrary affine smooth
    G, is not established, though both of its uses are commutative.
  - Merge the neutral-fibre alternative into that record.
  - If the errata file keeps E1, give it `sourceVersions`, which the checker will then require.
  - Set E2–E4's `known` to "new". They still say "Awaiting independent review", though the review
    confirmed them.

**3. The collation worklist thinks the Duke version was read. (other, medium)**
- **What was read.** E1 affects a stated result and was read only against arXiv v4 and the author's
  copy: "the Duke text could not be collated".
- **What the tool decides.** With no `sourceVersions`, `collation.provenance()` falls back to the
  free-text notes, and it returns "published":
  - it finds a publisher link: a Springer link to the metadata of the Gabber–Ramero book, in
    E2/E3's `searched`;
  - it finds a "read" word: "collat" in "could not be collated".
- So E1 never reaches the version of record.
- **The same function has a second fault.** It counts any declared `published` entry as read, even
  one that says "not read". That hides BHARGAVA-25, FARGUES-SCHOLZE-21, KEDLAYA-LIU-15 and
  STEVENS-08, which have 36 stated findings between them.
- **This affects my own earlier fixes.** Three of my red-team fixes recommend exactly such an unread
  entry: RT-PAPER-HE-LI-SHI-ETAL-23/1, RT-PAPER-KOYMANS-MILOVIC-21/2 and
  RT-PAPER-LIU-WOOD-ZUREICKBROWN-24/4. As written, they would hide those papers in the same way.
- **Fix.**
  - Here, declare only what was read: arXiv v4 and the author copy, both with their hashes. Note the
    unread Duke text in readSections.
  - Ask the maintainer to make `provenance()` skip unread `published` entries and ignore publisher
    links to supporting sources.

**4. SF.0 no longer owns what route 1 sends it. (error, low)**
- RS-25 narrowed SF.0 to relative Spec and Proj. It was promoted three hours before the review.
- Route 1 still sends SF.0 four items: the punctured spectrum, Hartogs, Pic of punctured regular
  spectra, and determinants of free resolutions.
- `henselian-smooth-lift-import` is marked planned at SF.0 only because another extraction's missing
  item (CLAUSEN-MATHEW-MORROW-21/044) is routed there. That is not a layer that plans it.
- **Fix.**
  - Move the route 1 items as in finding 1. `det-free-resolution` goes to R03.3.
  - Mark the lifting item missing and put it on route 4, with the Elkik items that use it.

## What held

- **Stages.** All 19 cited stage ids exist.
- **Restructurings promoted after the review.** Routes 5–17 still fit the layers that RS-05, RS-08
  and RS-02 narrowed:
  - P5 keeps ECD 6.4(o)–(iii);
  - P7 keeps Frobenius-controlled towers;
  - R03.3 keeps depth and Auslander–Buchsbaum;
  - R07.1 imports Cartier duality.
- **Library citations.** 30 of the 34 resolve in the pinned index. The other four exist at the pins
  but are missing from the index: an instance, and three names in an anonymous namespace.
- **Statuses.**
  - Neither library has Picard or Brauer groups of schemes, lci morphisms or Weil restriction.
  - `strict-henselian` is rightly planned at ModularCurves 4D.
- **The paper.** Theorems 1.1, 1.3 and 6.1 and Lemmas 5.1–5.2 match their items. I re-fetched arXiv
  v4, and its hash matches.
- **Elkik approximation** is spread over at least five owners by at least seven extractions. That is
  an area-level question, so I only record it.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-CESNAVICIUS-19.result.json`: ok.
- No Lean was compiled.
