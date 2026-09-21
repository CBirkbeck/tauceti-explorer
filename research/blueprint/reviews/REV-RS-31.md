# REV-RS-31 — independent restructuring review

## Verdict

**Accepted after corrections.** Reviewer: Codex, session `codex-a71f92`,
2026-09-21, issue #861. The proposal's author was the different worker
`codex-c83e7a` (#862, PR #899); this reviewer did not write RS-31.

The input proposal blob was
`5f47bffeae1d708cd836c4a673028fced2a9fd97`. This review edits only that
proposal, this report and the worker's handoff. It does not apply the
restructuring or edit an anchor.

## Reading and evidence limits

Read the entire member document, the entire ReductiveGroups anchor,
LocalFieldsRamification, and ShimuraData. The seven member and ten anchor
atlas descriptions were verified as literal substrings of the documents.
Read the family leads, original report and full proposal, then the complete
stage descriptions of all fifteen distinct external RG2 consumers.

Also read ShimuraData D1/D2, AutomorphicBundles B0 and
AlgebraicModuliForArithmeticGeometry R09.1 to check the Deligne-torus overlap
and the two pre-existing supplier questions. The relevant LieGroups link
packet's associated-bundle allocation was inspected; a packet's assertion is
not evidence that its proposed supplier actually constructs the object.

The reviewed library-coverage data has no record for this member or its
anchor and lists AUDIT-41 as pending review. Read that audit's seven member
layers' targets, notes and duplicate leads as **unreviewed evidence**. Its
whole-library absence claims were not promoted to verified claims.

Inputs use programme snapshot
`35e01e963a35d4ae713b71b9495df621cbb5fcf0`; intervening main changes through
`5b89ea5e508c44daade32d66e45cb2936853828c` were checked for relevant changes.
The proposal is reviewed against the mathematical specifications, not against
an inference that all roadmap targets are already formalized.

## Corrections made

1. **Assign the Deligne torus once.** RG2.0a explicitly constructs
   `Res_(C/R) G_m`, its norm/weight maps, splitting/conjugation and
   character/cocharacter data. ShimuraData D1 literally repeats the
   construction. D0's existing import does not by itself narrow D1's target.
   Added an explicit `narrow` decision for D1 and a seventh ownership row
   assigning the common algebraic construction to RG2.0a. This is a precise
   external-consumer correction, not a restructuring of the rest of
   ShimuraData.

   D1 retains its equivalence with sums of pure real Hodge structures,
   rational-weight criterion, tensor/dual/Tate-twist and opposed-filtration
   comparisons, all four examples, and the 1979 sign dictionary. The
   diagonal of the torus is not confused with the inverse weight cocharacter
   after applying `h`; the comparison `h(i) = C^(-1)` stays a D1 obligation.
   General representations are not restricted to a single weight.

2. **Preserve both immediate handoffs.** Added RG2.0a → D1 and RG2.0a → D2.
   D2 is D1's existing direct consumer. D1 → D2 and RG2.0a → D0 remain:
   the imported torus supplies algebraic data, while D1 still supplies the
   Hodge equivalence needed for the adjoint decomposition and complex
   structure. No Hodge theorem is falsely assigned to Weil restriction.

3. **Disambiguate the reductivity owner.** Replaced “geometric reductivity
   predicate” in the Layer 6 ownership label by its intended definition:
   smooth, connected, with trivial geometric unipotent radical.
   This follows the anchor's explicit definition and avoids conflating it
   with a different invariant-theoretic use of “geometric reductivity”.
   The owner and the parahoric construction are unchanged.

Added the required top-level review object and recorded all three changes.
The original seven RG2 decisions and 35 links are otherwise unchanged.

## Duplication and preservation of targets

| Stage | Checked boundary and retained obligations |
| --- | --- |
| RG2.0 | Uses the anchor's points dictionary and existing algebraic GL_n equivalence. Retains point topology, chart independence, products/immersions and functoriality, separated finite-type local compactness/Hausdorffness, group continuity, compact integral points and congruence neighbourhoods. The integral GL_n test still requires unit determinant and a topology comparison. |
| RG2.0a | Keeps the affine finite-locally-free representing-algebra construction, basis independence/descent, finite type and hypothesis-qualified finite presentation, adjunction/evaluation, products/composition/base change, group transport and finite-separable descent. Keeps the Deligne torus and every affine-space, quadratic GL_1, norm-torus and character-lattice test. D1 now imports this construction. |
| RG2.1 | Imports Layer 7's relative roots, Weyl and absolute/Galois data. Keeps valued root groups and actual filtration index sets, nonsplit/multipliable cases, commutator estimates, conjugation, unramified compatibility, affine roots/apartments and transport under choices. |
| RG2.2 | Keeps apartment gluing/transitions, building axioms/action, apartments through pairs, reduced/enlarged comparison, independence, facets/closure/fixers, compactness modulo center and qualified bounded-subgroup fixed points; retains the GL_n norm/lattice and SL_2 examples. |
| RG2.3 | Keeps the connected smooth affine integral model, root charts, generic fiber and integral points, special-fiber reductive quotient, reduction/pro-unipotent data, pro-p congruence groups, compact openness, nested facets and unramified base change. Imports predicates and quotient/radical interfaces, not an assumed parahoric model. Full fixers, component quotients and hyperspecials remain distinct. |
| RG2.4 | Imports abstract Tits-system/Bruhat theory but must construct the actual local data and prove its hypotheses. Keeps Iwasawa, Cartan and Iwahori–Bruhat in their precise ranges, ambient-component handling, relative cocharacter/affine or extended Weyl indices, stabilizers, compact-double-coset single-coset finiteness and index formulas, and rank-one/nonsplit tests. |
| RG2.5 | Applies Layer 9's explicit pinned integral construction to the dual datum, using Layer 7's group-specific root data. Keeps the datum identification, finite-image pinning action, L-group/projection, action law, pinning changes, Levi inclusions and product/isogeny/Weil-restriction compatibilities, plus torus/GL_n tests. Satake reconstruction and its normalized action comparison remain consumer theorems. |

The nonsplit torus, unramified unitary group, ramified group without a
hyperspecial subgroup and fixer/parahoric comparison tests all survive.
Cross-cutting base-change and transport obligations survive.

The original clarification of compact-open double-coset finiteness is
necessary: compactness gives a finite decomposition of a particular compact
double coset into open single cosets. It does not make the entire Cartan
index set finite. For GL_1, valuation already distinguishes infinitely many
classes modulo the unit group.

The extension title uses the exact base title, **Reductive algebraic groups**,
followed by “, Part II: local structure and arithmetic models”. The decision
explicitly places that anchor first among prerequisites. No Tau Ceti roadmap
or layer is changed. The generic pinned group precedes its Satake
identification; no reverse dependency was introduced.

## Pinned statements independently checked

Read the declarations with their surrounding hypotheses, and fetched each
file at the stated pin to verify its byte hash. Mathlib pin:
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin:
`f790474821cf4256814db967cb154e7af3d0c369`. Access date: 2026-09-21.

- [GeneralLinear/FunctorOfPoints.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean),
  lines 232 and 357: `pointsMulEquiv` and `pointsNatIso` identify convolution
  points with matrix GL_n naturally over commutative base/value algebras.
  They do not prove the new scheme-point topology comparison.
- [Matrix/NonsingularInverse.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean),
  line 127: `Matrix.isUnit_iff_isUnit_det` is over a commutative ring with
  finite square index type, not a claim that nonzero integral determinant
  suffices.
- [RootSystem/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean),
  lines 127 and 142: `RootPairing.flip` and `flipEquiv` exchange the paired
  modules and root/coroot data. They do not construct a dual group or pinning
  action.
- [TitsSystem/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/TitsSystem/Basic.lean),
  line 48: `TauCeti.TitsSystem` includes generation and simple-cell
  multiplication hypotheses.
- [TitsSystem/Bruhat/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean),
  lines 374 and 404: `bruhatCells_eq_univ` and
  `doubleCosetMk_surjective` prove covering and surjectivity for that
  supplied structure. They do not construct the local Tits system or give
  the required affine-index injectivity/stabilizer identifications.

All five hashes match the original report's fetched-source table. No
additional implementation or absence claim is made.

Read [Stacks 05Y8](https://stacks.math.columbia.edu/tag/05Y8) and
[05YF](https://stacks.math.columbia.edu/tag/05YF), including the latter's proof.
The proposition yields an algebraic space for finite locally free
restriction; the proposal correctly retains the affine representing-algebra
construction and its additional properties in RG2.0a. Neither arbitrary
nonaffine scheme representability nor inseparable preservation of reductivity
is inferred. Bruhat–Tits and Casselman proof interiors were not newly audited.

## Consumers and validation

Reconstructed all 21 original external edges to 15 stages: AA.0/AA.1;
BG0/BG1; ET.0; ES6:functoriality; FA.6; the three cited Satake substages;
LP0/LP3; D0; SR.0:abelian-category and SR.4. Their RG2 supplier edges remain.
Every narrowed RG2 layer's algebraic supplier has the required direct-consumer
handoff while the retained RG2 edge continues to carry the local theorem or
dual action. The corrected D1 has the same check for D2.

The result now has 7 ownership rows and 37 unique links: 4 were already
present and 33 are new. Independent endpoint and return-path checks found no
new edge on a cycle in a conservative union of 4,196 existing endpoint pairs
(raw atlas, all roadmap stage edges/requirements/consumers, and link packets).
That union includes legacy raw-atlas foundation edges; its count is not an
assertion that the author's differently assembled 4,178-edge graph is current,
or that pre-existing catalogue cycles are absent.

`python3 scripts/check_restructure.py research/blueprint/restructure/RS-31.result.json`
passes. Additional scratch checks pass for action/endpoint validity, all seven
member stages plus the explicit D1 correction, anchor immutability,
title/first-prerequisite instructions, unique owners/links, supplier and direct
consumer handoffs, literal descriptions and absence of new-edge cycles.
No Lean file is required or changed; compilation is not applicable. This is
not a blueprint-v1 packet or an implementation certificate.

## Questions and handoff for the orchestrator

Apply the title/first prerequisite and three original RG2 narrowings together
with the new D1 narrowing, its owner row and both new links. Do not apply the
D1 ownership label while leaving an independent Deligne-torus construction in
its prose or implementation handoff.

The associated-bundle request in AutomorphicBundles B0 is a **pre-existing
unassigned supplier**, correctly noticed in the original report: neither
RG2.0 topology nor RG2.0a Weil restriction states a general torsor-associated
bundle theorem. Which precise general stage should own the construction and
tensor/dual/determinant/pullback API? A separate ownership assignment is
needed before B0 can claim closure; this review does not fabricate one or
treat the LieGroups link packet's allocation as a theorem.

R09.1's projective-parameter-space contract is not an affine Weil-restriction
theorem; the actual affine construction remains RG2.0a. The unreviewed audit
and the exact local-decomposition/fixer/fixed-point source statements remain
blueprint preparation boundaries. These are not targets deleted by the
restructuring. Acceptance is structural and does not certify complete
source-proof closure.
