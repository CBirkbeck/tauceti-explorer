# DESIGN-AutomorphyLiftingBeyondTaylorWiles (#7060)

Agent: Claude (Opus 5.5), session claude-xCYI6r. Date: 12 October 2026. Input: origin/main d7b35a2b3.
Disposition: **complete design pass**; the packet has status `complete`, every stage `planned`.

## What was done

- Roadmap definition `research/blueprint/roadmaps/AutomorphyLiftingBeyondTaylorWiles.json`: Part II of
  PotentialAutomorphyInfrastructure (area langlands), six layers BT.0–BT.5, merging the briefs of
  PAPER-CALEGARI-GERAGHTY-18 (route 2) and PAPER-CALEGARI-GERAGHTY-20 (the AutomorphyLiftingBeyondTaylorWiles route).
- Packet `research/blueprint/packets/AutomorphyLiftingBeyondTaylorWiles.json`: 42 target-level nodes
  (13 definitions, 4 constructions, 21 theorems, 1 lemma, 3 applications), 93 API items, 68 unit tests,
  18 planets (at most 4 per layer), 9 requests, 1 gap, 3 new source issues, 1 restructure proposal.
  `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings.
- Reader `research/blueprint/readmes/AutomorphyLiftingBeyondTaylorWiles.md`, rendered from the packet with
  a hand-written introduction (scope, boundaries, conventions); about 24,000 words.
- Suggested file `research/blueprint/suggested/AutomorphyLiftingBeyondTaylorWiles.lean`: **compiled** with
  `lean-check` in the shared pinned build (Mathlib 082e2d37e8, Tau Ceti f790474), `sorry` the only warning
  (five declarations). It types l_0, q_0, dim Y (as prototypes of AF.4's targets), the archimedean count,
  the numerical coincidence `patched_ring_dimension` (proved by `ring`), the Gram determinant of the
  degeneracy maps `(α²−1)(β²−1)` (proved), the GL_1 defect = unit rank (proved) and the congruence used in
  cuspidal recognition (proved). Every other packet name is listed in the closing comment "Statements not
  typed at the pins", grouped by layer and by the carriers it needs. The sorry'd numerical statements were
  checked numerically for n < 30, r_1, r_2 < 6.

## Design decisions (all recorded in the packet)

1. **Ihara-avoidance repair (E169, E203 of the extraction).** Lemma 8.2 is false for an arbitrary R. The
   standing datum (BT.1/ihara-avoidance-data) splits R = R_triv ⊔ R_reg: r̄|G_v trivial (Taylor's R^1/R^χ)
   or r̄(σ_v) a single unipotent Jordan block (minimal, formally smooth ring, as in CGH20 §4(2)(a)).
   Theorem 5.16 is planned with the corrected hypothesis (6′) accordingly; (8b) then gives R_triv = ∅ and
   minimal R = T. Solvable base change was not used: descent of automorphy over an arbitrary F would need
   Galois representations of the descended π.
2. **Conjecture B clause (6)** (diamond operators ↔ inertia at Taylor–Wiles primes, E181) is part of B^lgc.
3. **Intermediate levels (new issue E1).** §9.5 uses an action of R_{S_Q} on the cohomology of Y_{Δ_N}(Q_M),
   which Conjecture B as printed does not give. T^an_{Q,ψ} is defined on all levels between L_Q and K_Q and
   Conjecture B is stated for it; the alternative (derived patching with nilpotent errors, P8) is recorded.
4. **(8a) without r_p(π_0) (new issue E2)** and **the deduction of Theorem 5.16 (new issue E3)**: m is
   produced from the Hecke eigenvalue congruence and Iwahori-sphericity; cuspidal recognition uses boundary
   vanishing, Franke–Schwermer and bigness of r̄(G_{F(ζ_p)}) to exclude residual Speh eigensystems.
5. Lemma 8.2(1) is used only as "characteristic-0 minimal primes" (E165); the χ side uses depth = dim and
   Taylor's Lemma 2.3 instead of Theorem 6.4.

## Requests to other roadmaps (the next planning of those roadmaps should supply them)

- GlobalGaloisDeformations:R04.5 — rank-n big-image Taylor–Wiles primes (CHT Prop. 2.5.9 / CG18 Prop. 8.5(1)–(3)).
- ArithmeticGaloisRepresentations:G7 — CHT bigness (Definition 2.5.1).
- DeformationAndDerivedPatchingAlgebra:R03.3 — BLGHT Lemma 3.3 (components of completed tensor products).
- DeformationAndDerivedPatchingAlgebra:P8 — two-datum CG patching (Proposition 6.6 with E142's compatibility).
- AutomorphicSpectralTheory:AS.5 — Eisenstein-support transfer to boundary cohomology for Res PGL_n.
- AutomorphicSpectralTheory:AS.4 — Moeglin–Waldspurger over number fields (AS.4/yu-020 is function-field only).
- Three Tau Ceti layers used as stages (Chebotarev layer 10; ClassFieldTheory layers 7, 11) carry request
  entries stating the use.

## Gap

- The congruence subgroup property (Bass–Milnor–Serre for SL_3(ℤ); Serre 1970 for SL_2(O_F), F CM quartic)
  is planned nowhere; BT.2/conj-b-small-rank(2) takes it as a hypothesis. The imaginary quadratic case (1)
  does not need it.

## Notes for consumers and reviewers

- IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII and
  AdelicAlgebraicGroups are now TauCetiRoadmap roadmaps, but data/atlas.json has no tauceti: stage ids for
  them; the packet cites their atlas packet nodes (e.g. IHG.3/gln-hecke-polynomial, IHG.2/factorial-
  localizing-idempotent, SR.5/cg-derived-projector), and the reader names the upstream roadmap.
- Exports: BT.5/theorem-5-16 to ModularityAndLanglandsExtensions ML.2 (CG18 Theorem 1.1 as a conditional
  endpoint) and to AdjointSelmerGroupsFromModularityLifting (CGH20 Theorem 1.2, with BT.5/minimal-r-equals-t
  and the BT.2 predicates). The restructure proposal asks GL2ModularityLiftingDefectOne and
  GL2ModularityLiftingPositiveDefect to import the n = 2 Conjecture B predicates from BT.2.
- No notion moved across upstream tiers (this roadmap is outside the Caraiani–Newton list).

## Sources read

- CG18 published layout (author copy, SHA-256 c0ba8de0…): Theorem 5.16, §§6, 7.1, 8, 9, 10, pp. 383–429,
  read in full for this job; arXiv v2 (SHA-256 67896c85…) for section numbering.
- CGH20 = arXiv:1907.08694v1 (SHA-256 8389edfe…), §§1, 3.1, 4.
- The extraction PAPER-CALEGARI-GERAGHTY-18.result.json source issues for these pages.
- Not read in this job (cited only through atlas nodes that read them): CHT08, Taylor 2008, BLGHT II,
  Khare–Thorne 2017, ACC+. No restricted book was used.

## Remaining (refinements, not gaps)

Coverage records list the requested supplier statements and the lemma-level splits of Lemma 9.6 and of the
patching verification for when the roadmap moves to lemma level.
