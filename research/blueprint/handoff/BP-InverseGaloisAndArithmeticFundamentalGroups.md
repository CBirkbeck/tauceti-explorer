# BP-InverseGaloisAndArithmeticFundamentalGroups — rational specialization checkpoint

Agent: Codex — codex-hjdg0j, 2026-09-27. Refs #1013.
Claim [5856656334](https://github.com/CBirkbeck/tauceti-explorer/issues/1013#issuecomment-5856656334), winning bot [5856657390](https://github.com/CBirkbeck/tauceti-explorer/issues/1013#issuecomment-5856657390). Full issue read before claiming and again after explicit confirmation. Initial snapshot: dc2d2969889c496502c4ca9c02ce1010cf24bf8e.

## Delivered component

This first packet has 15 nodes: four constructions, eight lemmas and three theorems; 14 API items, 13 definition tests, 14 typed examples, two planets, 43 baseline citations, five source records, seven gaps, one source misprint and no supplier requests. The complete component closes to the pinned baseline. Every implementation status is unchecked; all seven stages remain open and part is null.

The component constructs the native subring of rational functions regular at a parameter, restricts native evaluation to it, defines total coefficientwise polynomial specialization and compares it with native coefficient maps. Conditional ring laws use the existing Polynomial.toSubring, not a second coefficient-lift construction. A product of reduced denominators detects the coefficient domain. Multiplication by the leading numerator gives a nonzero polynomial guard, hence a finite bad set and simultaneous avoidance over an infinite field.

One parameter T and one polynomial variable Y are kept distinct. The elementary algebra works in arbitrary characteristic. The final existence statement explicitly assumes an infinite field. The result preserves degree and excludes poles, not irreducibility or Galois groups. No local-ring classification or generic localization construction is claimed.

## Reading and ownership

WORKERS and the binding blueprint, expansion, upstream and browser instructions were read. No applicable AGENTS.md was found. The full campaign roadmap and all seven stage descriptions, dependency edges, library coverage, relevant AUDIT-09 review, RS-29 report and complete result including owners/links, all matching link-file entries and reserved ids were inspected. The unreviewed EXT-07 draft supplied source leads only. The packet and document retain the accepted BelyiMaps Part II title and BelyiMaps as first prerequisite.

Multiquadratic and Completed/EffectiveBounds were read in full as upstream documents. The opening BelyiMaps ownership table and introduction were read; its entire 4698-line document was not. Broader Belyi, ProfiniteProPGroups and scheme contracts are preserved as exact remaining work, not asserted satisfied. None of the current nodes needs a cross-roadmap request. The ownership screen distinguishes ArithmeticDynamics:DY.6 projective rational-map specialization, DT.5 Mahler regular points and CA.2 rational power series from this affine coefficient interface.

Each of the 43 cited baseline statements and its hypotheses was read in the pinned source; source blobs were checked against the pins. Native RatFunc already provides the total evaluation and its conditional ring laws. Polynomial.toSubring, map_toSubring, coefficient maps, degrees and finite roots are reused. Searches of both pinned trees found no matching regular-subring specialization interface. The recorded audit's abstract Galois-category classification remains imported for IG.0, with the actual finite-étale scheme instance still required.

## Source inspection

Dèbes's author-hosted 303-page working text was read at its title and physical pp.147–150 (printed pp.135–138), covering the Hilbert-set definitions and Proposition 5.2.5's root-avoidance proof route. Every extraction used pymupdf with at most three physical pages. The Hilbert–Dörge argument and Chapter 9 have not been read. The source's algebraic-root specialization map is not supplied by the rational-coefficient component.

Source issue E1 records the polynomial-index bound r instead of n immediately before Definition 5.2.2. Physical p.148 was visually inspected. The exact author-copy hash and the author-page/current-copy/errata searches are recorded. The correction changes no intended theorem and makes no claim against a publisher edition.

The Harpaz–Wittenberg author-copy hash matches the accepted paper extraction. The current host failed DNS resolution; the matching stored PDF was read on author-copy pp.28–31, in batches of three pages or fewer. All six routed IG.4 obligations /122, /123, /124, /126, /130 and /136 remain in coverage, including the degree-eight cyclic lifts, degree-64 field, Grunwald–Wang and the distinct rational fourth/eighth-power vanishing statements. This is not a reading of the full paper or Artin–Tate's proof.

Mathlib PR #31603 was checked at head c3c4dd2bc13e0711723f507b24e7bf97e21f527f; its full description proposes a RatFunc representation change. This interface uses the public RatFunc API. No matching Hilbertian/specialization open PR or relevant public Zulip design discussion was found in the recorded searches. No external implementation is copied or integrated, and no private-channel search or author coordination is claimed.

## Validation

Lean 4.34.0-rc2 elaborates the exact suggested file with zero errors and 39 expected proof-placeholder warnings only. SHA-256: 9fa19b5199e0e9b6eb5be427e8e8e633a964af696149e3ba7a51c1e8618596cf. All 2343 imported Mathlib source files match the pinned tree and installed cache; no Tau Ceti source module is imported. A missing ZMod field import was corrected before this final run. The check verifies signatures and examples, not proofs.

The packet checker passes against the unmodified pinned declaration index with zero errors and warnings. Source-issue/version validation, all 15 dependency chains and reader/packet/API/test agreement pass. The reader has about 5800 words. The four-file audit and intake check permit only this issue's deliverables; they are run before publication.

Exact arithmetic checks cover 2820 conditional ring-law identities, 120 coefficient-domain cases, 90 degree-guard cases and 20 simultaneous-family choices. Eight mutation witnesses distinguish denom(0)=1, removable poles, failure of unrestricted multiplication and addition, repeated denominator factors, leading-coefficient degree loss, finite-field nonexistence and the difference between degree and irreducibility. These checks supplement the universal proof outlines.

## Resume

Start with the remaining IG.2 Hilbert-set and model-specialization gap. Read Dèbes's complete Hilbert–Dörge argument and Chapter 9 reductions, and verify the exact general definition before introducing a Hilbertian-field predicate. Define genuine rational-coefficient domains in arbitrary parameter spaces and the comparisons with denominator-cleared integral models. Decompose Proposition 5.2.5 through integral scaling, finite lists of proper root subsets and algebraic-root specialization. Do not confuse the present rational evaluation ring map with that algebraic specialization.

Then prove the full irreducibility, number-field Hilbertianity, full Galois-group, avoidance and disjointness statements with their exact source assumptions. IG.0/1 still need the scheme-specific category, fibre functor, arithmetic sequence and ramification/specialization arguments. IG.3 imports the existing three-point machinery before general branch sets and rigidity. IG.4 adds proper arithmetic solutions to ProfiniteProPGroups's weak carrier and retains all six routed obligations. IG.5 needs complete Hurwitz and patching sources. IG.6 imports solved families and carries the exact specialization hypotheses into checked outputs; the general inverse Galois problem remains open.
