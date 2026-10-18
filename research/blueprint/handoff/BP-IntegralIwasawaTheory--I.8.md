# BP-IntegralIwasawaTheory--I.8 — completed planning pass

Issue #760. Agent: Codex — codex-xCYl4m. Branch: `codex-xCYl4m-integral-iwasawa-I8`.
The bot confirmed this session’s claim. This submission finishes the target-level planning job;
it is not an implementation or a closed-proof claim.

## Coverage and deliverables

The packet, full reader and compact suggested file agree on all seven stages:

| Stage | Status | Content |
| --- | --- | --- |
| I.8 | planned | Bounded Burns–Flach Iwasawa complex, perfectness and H²/H³, CM minus-to-plus twist, Stickelberger/Deligne–Ribet comparison |
| I.9 | planned | Compatible modified Selmer limit, finite dyadic correction, Fitting identity, all height-one comparisons, integral descent and two-term arithmetic presentation |
| L0 | planned | Coherent cyclotomic arithmetic, real/full unit groups, corrected generators, regulator/index theorem, norms, dyadic and general-conductor targets |
| L1 | planned | I.2 specialization, lift-independent completed conjugation, principal real closures, finite ray-class and compact infinite exact sequences |
| L2 | planned | One-prime exact control, general inertia kernels, norm-sum growth, arbitrary Z_p-extension growth and bounded-p-rank criterion |
| L3 | planned | Shared Vandiver predicate, real unramified vanishing, equality of principal closures and the actual topological module isomorphism |
| L4 | planned | Baker–Brumer auxiliary/extrapolation argument, abelian unit resolvents and Leopoldt, independent all-prime FW digit route, analytic/arithmetic μ separation and Greenberg formulation |

There are 55 nodes: 7 constructions, 5 definitions, 35 theorems, 5 comparisons and 3 lemmas.
They carry 46 API items, 42 discriminating unit tests, 23 planets and 24 pinned baseline
references. Every definition/construction has at least three API items, at least three tests and
recorded uses. No stage has more than six planets. All implementation statuses remain unchecked.
The eleven inherited target IDs are preserved; their statements and carriers are corrected.

The latest WORKERS.md compact-prototype rule supersedes the older issue’s request for a Lean
signature for every heavy object. The 99-line suggested file has actual bodies for the light
root/field/smoothing definitions and the Vandiver predicate on existing Mathlib carriers. It states
some endpoints and examples. It introduces no assumed Iwasawa structure, replacement proposition
carrier or data definition with an unproved body. All heavy targets retain their full specification,
API and checks in the reader.

## Exact remaining closure tasks

The pass is complete under PROTOCOL section 0: each target has a node, an existing supplier or
an explicit gap. None of the seven stages is claimed closed. The three gaps are:

1. **G1: bounded all-prime Burns–Flach model.** Kurihara §4.1–§4.2 was read, but the original
   Burns–Flach Proposition 1.20 and p. 86 construction were not accessed. Read that original
   model and verify the canonical finite-level/derived-limit/perfectness comparison with D7 and
   Selmer L3, including real dyadic places. A complete-Tate cone is not an adequate substitution.
2. **G2: circular-unit distribution lattice.** Sharifi §4.7 was read, including its explicit
   omission of an essential lattice-index calculation. Complete that calculation, its dyadic
   specialization and the exact general abelian-subfield correction for the fixed norm-generated
   circular-unit convention. Sinnott’s Inventiones paper was identified but not accessed. The
   full-cyclotomic factor is stated precisely; the unknown general-field factor is not guessed.
3. **G3: full all-prime Ferrero–Washington adapters.** Oesterlé’s exposition and its digit proof
   were read completely. Verify the dependent torsion-root integral-basis arrangement, the
   dyadic reflection/finite-extension descent, and the coefficient/content trace normalization in
   a permitted full proof, such as the original Ferrero–Washington paper. That original paper
   has not been read. Keep arithmetic μ-vanishing independent of the main conjecture.

There are 19 supplier contracts, not 19 claims of absent mathematics. The reader states each
contract and its consuming nodes. Most import existing work. The genuine additions proposed in
`restructure` are:

- **PMIA, Part II:** height-one detection of invertible fractional lattices over the completed
  abelian orders, and determinant/Fitting comparison for the stated torsion modules of projective
  dimension at most one, without assuming a regular domain.
- **D7/Selmer L3:** the common bounded all-prime BF comparison described in G1, split between
  the finite cochain model and its Iwasawa derived limit.
- **Transcendence, Part II:** the Schwarz–Mahler jet adapter with q=p^a and algebraic row
  normalization, reusing its existing generic p-adic analytic suppliers. The quantitative Yu
  auxiliary prime q≠p is a different parameter.

The remaining contracts cover I.1/I.2/I.3/I.6/I.7, PMIA L0/L1/L4/L5, the metric PM.2/PM.3
interfaces, Dirichlet L2/L3, and the existing GNF, class-field and character layers. Acceptance
requires their exact hypotheses and canonical maps, not just matching module ranks or characterwise
fraction-field equalities. Independent review should prioritize these contracts and G1–G3.

## Ownership and freshness checks

The accepted RS-16 boundaries are retained. L0 does not depend on Coleman: it exports global
roots, norms and units. L1/L3 consume Coleman L4’s principal-real local maps and quotient. I.2
owns maximal pro-p extension carriers; PMIA L4 owns generic structure, finite-error and growth
algebra. ArithmeticKTheory N.7 already imports Vandiver from L3, so there is no second definition
or ownership move.

Read GlobalNumberFields (703 lines) and ProfiniteArithmetic (814 lines) in full, with relevant
suggested statements, in the supplied read-only upstream checkout at
`0d144d044dacebca17b654695b6f1ad58f159b27`. Read current Tau Ceti’s actual maximal-real-field and
compact inverse-system declarations at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular,
`TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` already supplies compatible compact
lifts without transition surjectivity. This generic exactness result is imported, not replanned.
These additions postdate the atlas pins and are distinguished from the baseline.

The supplied checkout predates the newly merged PMIA and transcendence roadmaps. Their individual
README and Suggested files were therefore checked at GitHub main commit
`350e970ce49f707a327909beac0b7b7c782cc7ee`: PMIA L4–L6 and transcendence §3.7 with its generic
LinearFormsInLogarithms imports. No repository was cloned or copied, and neither read-only
environment was built. Existing determinants, Nakayama, Fitting and transcendence material is reused.

## Sources and corrections

Read on 18 October 2026; the packet and reader contain URLs, editions, locators and PDF hashes:

- Rodrigues Jacinto–Williams, arXiv:2309.15692v2: §§10.2, 11, 12.3–12.4, 13.1–13.4 and Appendix A.
  Collated the corresponding Essential Number Theory 4 (2025), 101–216 pages, especially printed
  pp. 176, 186, 193–194 and 200–207. Do not interchange preprint and journal page numbers.
- Kurihara, author manuscript, §§2.6, 3.1 and 4.1–4.2, with its own pp. 12–18 and 22–28.
- Sharifi, public author notes: §§1.5, 3.2, 4.1–4.4, 4.7 and 6.2 at the precise locators in the
  source record. The omitted general lattice computation remains G2.
- Bernard Rousseau, Bordeaux 1968–1969, exposé 11, pp. 11-01–11-08: complete exposition and
  auxiliary-polynomial proof, with image checks of its parameters.
- Oesterlé, Bourbaki 535, pp. 170–182: complete exposition, including image checks of pp. 174–180.

No uncleared Washington copy was used. Burns–Flach, Sinnott and original Ferrero–Washington
proof details remain explicitly unread where G1–G3 say so. No source files or passages are in the
repository; all mathematical statements and the legacy `printed` diagnosis fields use our own words.

Eleven source findings E81–E91 are recorded. Most credit existing confirmed atlas findings:
unit carrier/rank, reversed quotient, compact inverse-limit justification, ν’s sign, the missing
unit in the growth calculation, its index shifts, mod-p rank and real/principal closure comparison.
E81 preserves the inherited root-factor/telescoping correction. E89 records the cyclotomic-character
domain issue: define the twist on the CM group before passing minus to plus; its novelty is not
claimed. No source correction is represented as a new published erratum.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.8.json --json`:
  **0 errors, 0 warnings**, all seven stages planned.
- `lean-check research/blueprint/suggested/IntegralIwasawaTheory--I.8.lean`:
  **exit 0**, only proof-placeholder warnings, at Mathlib `082e2d3` and Tau Ceti `f790474`.
  Available memory was 84 GiB before the run; no language server or library build was started.
- Pinned statements were read directly; current additions were not passed off as pinned declarations.
- Final file-scope, reader/packet consistency and intake checks are recorded in the pull request.

The next step is independent review of this completed pass. A closure follow-up must address G1–G3
and the precise supplier extensions above; it must not resume from the obsolete L0-only checkpoint
or expand generic library material already owned upstream. The scratch material is disposable;
all source identifiers and continuation requirements are preserved here and in the packet.
