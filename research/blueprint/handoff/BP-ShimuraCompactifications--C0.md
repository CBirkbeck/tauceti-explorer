# Handoff: BP-ShimuraCompactifications--C0

## Identity and submission

Issue #990. Agent: ChatGPT Pro (GPT-6 Astra Pro). Session: `cgpt-20260926-qseries-a91f`.
Branch: `cgpt-20260926-qseries-a91f-c0-integral-charts`.
Claim comment 5849266978; bot confirmation 5849267984. The claimed issue was re-read before work.

Continuation of merged checkpoint #2959. Preserve the five C5 node IDs and their target assertions and hypotheses. This submission adds twelve C0 nodes and changes only the four authorized packet, reader, suggested-file and handoff paths. It is a **partial checkpoint**, using `Refs #990`, not a request to close the issue.

## Mathematical advance

The previous C5 argument needed ordinary integral relative toric coordinates. This continuation supplies a declaration-level construction route rather than importing a complex chart as an arithmetic theorem.

Seven coefficient-algebra nodes use existing Mathlib carriers: the face projection; its coefficient formula; its actual inclusion section; its kernel as the off-face monomial ideal; the specified quotient equivalence; coefficient-map naturality; and extension of the kernel ideal under arbitrary coefficient change. The projection's underlying additive map is the existing coefficient restriction. The first isomorphism theorem, degree inclusion, coefficient maps and degree-equivalence algebra map are reused, not replanned.

Five relative nodes give the actual torsor subalgebra/relative embedding, ordinary face open immersions, integral regular coordinates, scheme-theoretic relative strata and coordinate boundary intersections/exact opens. Their multiplication and transition units are explicit. For a right torsor section change t_beta=t_alpha g, the weight-m coordinates change by m(g)^(-1). Spec Sym(L) is the total space of L dual when L denotes the weight-one function line.

The ideal and quotient retain nilpotent coefficients and commute with arbitrary coefficient-ring change; extension of an ideal is not confused with contraction. The complementary boundary monomial acts injectively on its exponent basis over every base ring. This strengthens the local density input to universal schematic density, without claiming that an arbitrary total-space dense open is fiberwise dense.

The first three C5 proof routes now name the relevant C0 nodes. The actual ordinary chart/label and neat branch-separation inputs remain required. The generic C0 construction depends on SF.0/SF.1, **not C4**, avoiding a C0–C4 cycle. The existing foundations → early C5 → B5 and early/late C5 export disciplines remain unchanged.

## Counts and prototype boundary

- **17 nodes:** 3 constructions, 8 lemmas, 4 theorems, 2 comparisons.
- **15 API items; 12 definition/construction tests; 4 planets.**
- **10 baseline declarations; 8 supplier requests; 7 explicit gaps.**
- Exact eight-stage scope; zero stages closed; every node remains `unchecked`.
- Reader: approximately 5,000 words.

The suggested file has native signatures for all seven new coefficient-algebra nodes and the ten API entries of its two algebra constructions. It contains their **eight algebra examples**, plus the **three preserved baseline specialization examples**. The two trivial face-condition helpers retain explicit mathematical statements.

The five relative geometric signatures and their five API entries/four tests, and the five original C5 signatures, remain explicitly unstated. They need real pinned-compatible geometric carriers. No proposition-valued geometric stand-in or arbitrary scheme storing a desired conclusion has been introduced.

**The Lean file was not compiled.** No Lean or Lake executable was found in the local environment. New bodies are planning placeholders, not implementations. The quotient-equality criterion explicitly binds its face hypothesis; otherwise Lean's section-variable omission could accidentally remove that necessary premise.

## Evidence and source versions

Pins are unchanged:

- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Seven fresh baseline records were verified by reading the actual pinned source:

1. `MonoidAlgebra.comapDomain`, its coefficient definition and additive laws, in `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean`, blob `faf6cfb353a298df796c5c685cf9d8e9b3aa34a6`.
2. `AddMonoidAlgebra.lift` and `AddMonoidAlgebra.lift_single`, explicit additive namespace, in `Mathlib/Algebra/MonoidAlgebra/Basic.lean`, blob `f2b04d2dc72870f52e1bb6d43192cdae72a1aafa`.
3. `MonoidAlgebra.mapDomainAlgHom` and `MonoidAlgebra.domCongr`, including their source-generated additive forms and monomial formulas, in the same Basic file.
4. `MonoidAlgebra.mapRingHom`, its monomial/coefficient formulas and composition, in the same MapDomain file.
5. `Ideal.quotientKerAlgEquivOfRightInverse`, including its enclosing Ring/Algebra hypotheses and kernel lift, in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`, blob `225f9102da25667f06fe021abc4fb895669d0880`.

The original three Tau Ceti baseline records are preserved as preceding-checkpoint provenance, not reported as new compilations. The MonoidAlgebra records explicitly describe the `to_additive` source-generated operations used by the native additive prototype. The exact source reads support those translations; index validation is separate from elaboration.

The accepted RS-32 and AUDIT-10 boundaries are retained. Default-branch code searches were leads only. In particular a modern `TauCeti/Geometry/Toric/Algebraic/FaceLocalization.lean` hit returned 404 at the pinned commit. That is not an exhaustive absence certificate. The finite-complex construction remains the unchanged anchor's work regardless of that path result.

New source reading: Lan's author-hosted thesis revision of **14 March 2021**, `https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf`, §§6.1.1–6.1.2 in parsed text, plus selected recognition/approximation context in §§6.3.1–6.3.2. The current continuation successfully inspected the image of printed p. 503. Image requests for printed pp. 443–445 and 504 failed. The prior checkpoint's inspected pp. 503, 519–523 and 539 remain its provenance. No PDF bytes/hash, visual check of the failed pages, or publisher-edition comparison is claimed.

The author errata were revisited in parsed form for the approximation, finite-type/etaleness, stack and label conditions. Stacks normal-crossings/Stein readings remain the prior checkpoint's evidence. The source-generalities gap distinguishes Lan's relative-open cone notation from the closed-cone carrier, split tori from possibly nonsmooth multiplicative-type groups, and relative quotient strata from reduction after arbitrary base change. No new version-of-record error allegation is made.

## Checks actually performed

Local JSON round-trip, required fields, exact scope, retained C5 IDs, implementation/status safeguards, source and prerequisite resolution against the named available interfaces, internal dependency acyclicity, API/test name reconciliation, and forbidden-path/text checks passed. These are independent local checks, **not** the complete repository validator or full-atlas cycle check.

An exact finite-support polynomial regression checked two four-element input supports, one in N² and one in N × Z. Each support has all 256 coefficient assignments over Z/4. All 65,536 ordered pairs per support passed multiplication and addition compatibility: **131,072 multiplication pairs in total**, with no truncation of the product degrees. All 512 input polynomials passed naturality for the nonflat map Z/4 → Z/2. Each restriction had 16 images with 16 preimages per image. The selected-support kernel was checked against its off-face coefficient span over Z/4 and Z/2.

The tests also reject projection to the even submonoid, check retention of the nonzero nilpotent 2, and retain a negative Laurent exponent. These are finite regression cases, not a proof for all supports, a PEL test, geometric descent or Lean verification. The reader contains the general mathematical arguments.

No local checkout-based repository suite or pinned Lean compilation ran. The raw-network route was unavailable. The current-head browser submission and blueprint CI must be observed and recorded on the PR; the successes of #2949/#2959 are not borrowed.

## Exact continuation boundary

First implement or identify the generic SF.0/SF.1 relative-Spec and split-torus grading/descent interfaces and the anchor's intrinsic dual-monoid/supporting-character lemmas. The C0 code should use their actual carriers, not a new cone, fan, torsor or arbitrary graded algebra.

For the PEL model itself continue Lan 6.3.2.1–6.3.2.6: approximate and descend the actual degenerating family with its discrete data, preserve the distinction between the natural completed-base embedding and the family-induced one, and retain the precise logarithmic Kodaira–Spencer/finite-differential hypotheses. Then decompose the actual relation, effective quotient, universal family, formal comparison and properness in 6.3.3. The partial source reading here is not that proof decomposition.

Non-neat transport remains separate. Keep the proper-coherent-cohomology/Stein detector in SF.2 and the early/late C5 split. Complete the ten geometric node signatures and four geometric definition tests against genuine interfaces, then the remaining arithmetic fan/refinement, C2/C3, degeneration, positivity/minimal, higher-level and height targets listed in coverage. C6 is untouched.
