# Handoff: DESIGN-AlgebraicModuliForArithmeticGeometryPartII

Worker: Claude (Opus 5.5), session claude-5ZxFnx, 2026-10-19. Issue #3377.

## What was done

New roadmap **AlgebraicModuliForArithmeticGeometryPartII** — "Algebraic moduli and representability for
arithmetic geometry, Part II: numerical Picard groups and contraction descent" (area `algebraicgeometry`,
parent `AlgebraicModuliForArithmeticGeometry`), six layers NP.0–NP.5, one complete planning pass:

- `research/blueprint/roadmaps/AlgebraicModuliForArithmeticGeometryPartII.json` (definition, stage targets, requires);
- `research/blueprint/packets/AlgebraicModuliForArithmeticGeometryPartII.json`: 50 nodes (11 definitions,
  6 constructions, 33 theorems), 102 API items, 69 unit tests, 27 planets (at most 5 per layer), 12 baseline
  declarations read at the pins, 17 requests, 1 gap, 9 source issues, 3 restructure proposals, a routed-item
  table covering all 55 routed items; `python3 scripts/check_blueprint.py` with the pinned index: 0 errors,
  0 warnings; status `complete`, every stage `planned`;
- `research/blueprint/readmes/AlgebraicModuliForArithmeticGeometryPartII.md`: reader document rendered from
  the packet (about 22,000 words) with scope, conventions, suppliers, per-target API and checks,
  corrections, open input, consumers and references;
- `research/blueprint/suggested/AlgebraicModuliForArithmeticGeometryPartII.lean`: **compiled** with
  `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474; only `declaration uses sorry` warnings, no sorry'd data.
  Real-bodied: `Contraction.IsContraction`, `DualGraph.componentGraph`, `Picard.doubleLift` (with proved
  `doubleLift_mk`, `mk_doubleLift`, `doubleLift_unique`); proved theorem `Picard.trivial_of_fixes_multiples`
  (the Galois-lattice core of Schröer's Lemma 1.1). Every other packet API/test name is listed in the closing
  comment "Statements not typed at the pins", grouped by the missing carrier (no degree of line bundles on
  curves, Picard scheme, direct images or numerical groups at the pins).

## Scope decisions

- The issue carried four continuations in two independent directions. Three (Schröer route 1, Hacon–Witaszek
  route 9, Bhatt et al. route 12) plus the extra source route Witaszek 2022 route 6 are planned here. The
  fourth, **stable surfaces in mixed characteristic** (Bhatt et al. route 15, 14 items), is proposed as its
  own roadmap `AlgebraicModuliForArithmeticGeometryStableSurfaces` (restructure proposal 1), to be designed
  after the MMP continuation of SchemeAndStackFoundations.
- Nine routed Hacon–Witaszek / Bhatt et al. items are steps inside MMP theorems (HW Claims 5.3, 5.5(3), the
  persistence and boundary steps of the published Theorem 6.1; BMPSTWW Prop. 2.51 second part, Thm 9.15,
  Prop. 9.16). Restructure proposal 2 assigns them to `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry`
  (a route of the unclaimed design #3361), which imports from here the general statements they apply:
  NP.5 `special-fibre-restriction`, `numerical-representatives` (the E7 repair), `cone-identification`,
  `nef-big-specialization`, `semiample-trivial-descent` (the descent clauses of 2.51/9.16 are this lemma applied
  to L + D after base point freeness), `vertical-descent`, `extremal-curve`, `ahk-rank`.
- **Notions owned here that other unplanned designs list (restructure proposal 3):** relative nef (NP.1),
  bigness (NP.1), semiampleness and section rings (NP.3), semiample contraction (NP.3), the Cascini–Tanaka
  vertical ℚ-pullback (`PAPER-WITASZEK-22/vertical-q-pullback` = `PAPER-BHATT-ETAL-23/vertical-descent`, NP.5),
  torsion of numerically trivial bundles over locally finite fields (`PAPER-WITASZEK-22/locally-finite-torsion`,
  NP.2/finite-field-finiteness) — all listed in Witaszek 2022 route 5 to `SchemeAndStackFoundationsMixedCharacteristicPositivity`;
  and Zariski's lemma (`PAPER-SCHROER-23/222`, routed to GenusOneFibrationsAndRationalEllipticSurfaces), NP.4.
  Those designs should import these nodes.
- **Not re-planned (cited):** relative Picard sheaves, Picard stack, infinitesimal lifting, components through
  the identity (AlgebraicModuli A0-extension nodes, upstream TauCetiRoadmap PR #853 §§7.3, 7.6, 7.9);
  representability with universal functions, Brauer obstruction and Pic^τ over a base for projective flat
  geometrically integral families (upstream ComplexComparisonPartII PR #848 §§C3.2d–C3.2e, atlas stage
  ComplexComparisonPartII:C3); JacobianChallenge Layers A–D; StableReduction Layers 1, 2, 4;
  SchemeAndStackFoundations §§0.9, 0.11, 0.23, Layer 1, §§2.2, 2.6, 2.11, 2.15, 2.22, 3.3, 3.5, 4.9–4.12,
  5.2–5.3, 5.9–5.10. The characteristic-zero absolute numerical theory is upstream **AbundanceStatement**
  (TauCetiRoadmap PR #545, not an atlas stage): the nodes here state compatibility with its Layers 4–5
  (`upstreamNotes`).
- Enriques consumer: the accepted Enriques package's contract for "NumericalPicardAndContractionDescent"
  (numerical local system, Theorem 1.3, Theorem 2.1 with labels, doubled lift, openness of ampleness for
  algebraic spaces) is met by NP.2 (2.6, 2.7, 2.11), NP.3 (3.7, 3.8) and NP.4 (4.7–4.9). The maintainer can
  point that package's supplier at this roadmap.

## What remains

- **Gap (recorded):** NP.1/neron-severi-rank proves finite rank of Num via the Kummer injection
  Pic/ℓ ↪ H²_ét(X, μ_ℓ); the finiteness of that group for proper X over an algebraically closed field has no
  identified atlas owner. The alternative is the theorem of the base (SGA 6 XIII 5.1), not freely available.
- Coverage `remaining` (lemma-level refinements): Noetherian-induction proof of 0.5; relative
  finite-dimensionality beyond geometrically integral fibres (Kleiman Remark 6.19); the Murre–Oort dévissage
  with a free proof source (Murre 1964 / Oort 1962 on Numdam were not read); the algebraic-space part of 3.8;
  Zariski's lemma for regular models without smooth generic fibre (the Stacks situation assumes smoothness);
  the negativity lemma inside 5.7.

## Sources

Read (public, SHA-256 in the packet): Schröer arXiv 2004.07025v3 §§1–2 and §5 opening; Kleiman arXiv
math/0504020v1 pp. 33–35, 52–60; Bhatt et al. arXiv 2012.15801v3 §2.5, 2.47–2.54, 9.15–9.16, 9.24–9.26,
9.30; Hacon–Witaszek arXiv 2009.02631v2 Thms 1.3–1.4, §3 p. 12, §6; Witaszek arXiv 2002.11915v2 §2;
Das–Waldron arXiv 1911.04394v3 Lemmas 3.6, 4.1; Cascini–Tanaka arXiv 1706.04845v3 Lemma 2.17;
Alexeev–Hacon–Kawamata arXiv math/0605137v2 Lemma 1.6; Lipman 1969 (Numdam) §§13–14; EGA IV₃ (8.8.2)
from the cleared library; Stacks tags 0BEL, 0BET, 0D3A, 0D3D, 0D2P, 0C61, 0C66, 00PH.
Not freely available, cited only through the free sources: SGA 6 Exposé XIII (Thms 4.7, 5.1), Lazarsfeld
*Positivity I* (Thm 2.2.16, Fujita vanishing), Debarre *Higher-dimensional algebraic geometry* (Lemma 1.15;
the rigidity proof is written out in 3.2). New source issue: Cascini–Tanaka Lemma 2.17 writes "M on Y" for
"M on S" (E1). E2–E9 restate confirmed extraction issues (Schröer E1, E18, E20, E23–E25, E28; Hacon–Witaszek E7).

## Restart

The packet, reader and Lean list are generated by scripts kept only in this run's scratch directory; edit the
packet directly in a follow-up (it is plain JSON) and keep the reader's section numbers (k.n = layer k,
n-th node of that layer in packet order).
