# Independent review of NC.4

**Verdict: accepted.** This is a complete target-level planning pass. NC.4 is
`planned`, with six supplier requests and four explicit gaps; it is not `closed`
and nothing is claimed to be implemented. Every node has a verified or corrected
entry in the packet's independent `review.checked` list.

Reviewer: Codex (GPT-6), session `codex-tpkOWU`, job
`REV-AnabelianGeometryAndNonabelianChabauty--NC.4`, issue #6302, 2026-10-11.
The input was written by session `codex-L2CG9q`, job
`BP-AnabelianGeometryAndNonabelianChabauty--NC.4`, issue #6345, PR #8770.
This reviewer did not write that input.

## Counts and coverage

| Item | Reviewed result |
| --- | --- |
| Nodes | 19: seven constructions, one definition, five comparisons, six theorems |
| Node verdicts | Nine corrected, ten verified; none added, removed or unverifiable |
| Planning API | 41 items, unchanged |
| Definition/construction tests | 25, including one added test |
| Planets | Six, unchanged |
| Baseline declarations | Eight confirmed; none removed, replaced or added |
| Supplier requests | Six; two strengthened |
| Recorded gaps | Four: one added and one expanded |
| Source findings | Six confirmed: two inherited and four added |

The campaign's NC.4 targets all have nodes: the local iterated-integral map,
represented global-to-local period map, intersection loci, global containment,
conditional finiteness and precise depth-one classical comparison. Fundamental
groups, their realization comparisons and continuous nonabelian cohomology stay
with NC.2/NC.3. Coleman functions and classical Chabauty stay with L1/ED.4.
There is no new plan for those suppliers' mathematics.

## Corrections made in place

1. **All coefficient algebras.** `admissible-period` and
   `admissible-classification` now directly import NC.2's `frobenius-lang`.
   Its affine-scheme isomorphism supplies the fixed-section argument over every
   commutative coefficient algebra. The field-valued endpoint path theorem alone
   does not justify the nilpotent-algebra classification. The nonnormal quotient
   and affine split-unipotent torsor-vanishing requests remain explicit.
2. **Ramified models and endpoints.** NC.2's reviewed `berthelot-ogus` and
   `crystalline-path-coordinates` statements concern unramified models.
   `finite-path-comparison` extends to a ramified field only when the model and
   endpoints descend to that setup. NC.4 previously consumed those nodes for any
   good-reduction pair over a finite extension of ℚ_p. `local-albanese`,
   `crystalline-period`, `local-etale-albanese` and `fundamental-diagram` now
   require the comparison in the actual model/endpoint generality. The NC.2
   request and comparison gap state the missing refinement exactly, including
   both augmentations, coactions, Frobenius and normalized Hodge filtration.
3. **Global restricted ramification.** NC.2's `etale-galois` provides continuous
   G_F-actions. It does not establish trivial inertia outside T.
   `global-etale-albanese` now explicitly assumes the group and every permitted
   path torsor have continuous G_{F,T}-actions. A separate gap and the NC.2
   request ask for the good-integral-model theorem that gives those actions.
   All chosen bad-place conditions still have to contain the geometric paths.
4. **Coordinates and density.** The packet already used the correct ordered
   ratio I⁻¹γ. `iterated-coordinates` now identifies the missing inverse in Kim's
   p.112 calculation as a source error. `residue-disc-density` explains why
   inversion preserves independence: the shuffle antipode sends each length-r
   coefficient to (−1)^r times the reversed-word coefficient. Multiplication by
   γ is triangular with unit empty coefficient. On a disc around c, the constant
   path factor in I(b,x)=I(c,x)I(b,c) preserves this argument. Thus the proof
   establishes density on each disc for the original base point.
5. **Proper charts.** The density proof now directly cites the L1 chart request.
   Removing a finite étale divisor of higher degree avoids assuming a second
   integral rational residue disc. L1's `neededBy` list now includes density.
6. **A fourth torsor test.** `admissiblePeriod_inverse_fixed_path` uses the
   multiplicative version of the additive group ℚ, g corresponding to 1,
   p_φ=g and p_H=1. It requires period g⁻¹ and explicitly excludes g. This
   tests the contribution of a nonidentity fixed path; the existing tests cover
   a neutral fixed path, right H-change and failure of left H-change for a
   nonnormal subgroup.

The suggested file includes the additional test and records the corrected
geometric boundaries in its omission comments. Coverage's `remaining` list now
names the needed refinements. No native definition was replaced by an opaque
proposition or a manufactured geometric carrier.

## Source verification and findings

The mathematical citations were checked against the [published Kim article](https://content.ems.press/assets/public/full-texts/serials/prims/45/1/2127/online/10.2977-prims-1234361156.pdf),
PRIMS 45 (2009), pp.89–133, DOI 10.2977/PRIMS/1234361156. Its SHA-256 is
`b06562bc28c5648152b54d5539af8b8a4cf902192eeb37f36b0db5dfc45a4566`.
All locators use printed pages. Proposition 1, pp.105–106, supplies admissible
classification; Theorem 1 and Lemma 4, pp.93 and 111–114, supply the density
route; §2, pp.118–120, supplies period and path diagrams; §3, pp.120–121,
supplies the conditional finiteness route. Conjecture 1, p.96, remains a
hypothesis rather than a claimed dimension theorem.

Every finding is in the packet in our own words, with an independent confirmed
verdict and the version read:

| Finding | Locator | Verification and effect |
| --- | --- | --- |
| E1, inherited | Introduction, p.92 | The finite p-adic completion and pp.101–102 require a nonarchimedean place. Contextual misprint. |
| E2, inherited | §3, p.121 | The annihilator lives on the de Rham Hodge quotient used in the diagrams, not an étale F⁰ quotient. Contextual misprint. |
| E-NC4-3, added | §1, p.112 | The equation p_φu=g, with coordinates I and 1, gives Iu=1. The claimed forward horizontal coordinate is missing an inverse. Degree one distinguishes +a from −a. The density proof is repaired by antipode reversal. |
| E-NC4-4, added | §1, p.111 | The chosen second rational residue disc may not exist. A higher-degree finite étale divisor repairs the proper-to-affine reduction. This concerns a proof step, not the density theorem's conclusion. |
| E-NC4-5, added | §1, p.107 | The free associative algebra is not the free-group algebra: in one generator K[T] and K[z,z⁻¹] have different units. The subsequent primitive-generator word construction uses the correct tensor algebra. |
| E-NC4-6, added | Lemma 2 proof, p.108 | For G=I−aE_ij and i≠j, E_ij²=0 gives G⁻¹dG=−da E_ij. Correct the derivative sign consistently; the triangular induction still works. |

For the proper-chart gap, a concrete good-reduction genus-two example is
y²+y=x⁵+x³+1 over ℤ₂. The special fibre has only infinity over 𝔽₂:
both x=0 and x=1 give right side 1, whereas y²+y=0. At infinity, the chart
v²+u³v=u+u³+u⁶ has nonzero u-derivative at (0,0), so the special fibre is smooth
there too. Every integral rational point reduces to infinity. The proof cannot
choose a rational point in another disc without an extra hypothesis.

I checked the [EMS article record](https://ems.press/journals/prims/articles/2127),
the [arXiv history](https://arxiv.org/abs/math/0510441), the six affected steps
in [arXiv v5](https://arxiv.org/pdf/math/0510441v5), and the
[author's publication list](https://www.minhyongkim.net/research/academic-publications).
The affected steps persist in v5, pp.3, 12–13, 15–16 and 21. The version of
record corrects v5's inverse-matrix symbol on p.108, but its derivative sign is
still wrong. Searches found no separate correction to these six findings; the
listed 2011 Massey-product erratum concerns a different paper. The additional
preprint hash is recorded only for this comparison. Node citations remain
against the published version.

## Baseline, suppliers and ownership

All eight declarations were opened with their surrounding hypotheses at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet retains Tau Ceti
pin `f790474821cf4256814db967cb154e7af3d0c369`; it cites no Tau Ceti declaration
as a native NC.4 implementation.

| Declaration | Module and use confirmed |
| --- | --- |
| `Torsor` | `Algebra/Torsor/Defs.lean`: simply transitive action and scalar division; the opposite group models the right action. |
| `QuotientGroup.leftRel` | `GroupTheory/Coset/Defs.lean`: g⁻¹g′∈H gives gH cosets without normality. |
| `AlgHom.comp` | `Algebra/Algebra/Hom.lean`: composition retains the actual base-algebra structures. |
| `CategoryTheory.Over.mk` | `CategoryTheory/Comma/Over/Basic.lean`: actual objects and morphisms over the same scheme base. |
| `AlgebraicGeometry.Scheme.zeroLocus` | `AlgebraicGeometry/Scheme.lean`: a closed zero set for global sections. It does not construct the reduced image-closure subscheme requested from SF.0. |
| `Subspace.forall_mem_dualAnnihilator_apply_eq_zero_iff` | `LinearAlgebra/Dual/Lemmas.lean`: double-annihilator membership over a field, with no finite-dimensional assumption needed for this statement. |
| `Subspace.finrank_add_finrank_dualAnnihilator_eq` | Same module: the dimension formula requires a finite-dimensional ambient vector space, as used for Lie(J). |
| `AlgebraicGeometry.IsProper.eq_valuativeCriterion` | `AlgebraicGeometry/ValuativeCriterion.lean`: properness gives the valuative criterion together with its quasi-compact, quasi-separated and finite-type conditions. |

I read every cited external node's statement, hypotheses and proof route in the
NC.2, NC.3, SF.0, SF.1, RG2.0a, L1 and ED.4 packets. The scope mismatches above
are recorded instead of treating their titles as sufficient evidence. The
dimension argument uses Krull dimension of finite-type schemes. The analytic
argument uses the complete-field restricted-series Strassmann theorem after
t=πs, with finitely many integral residue discs. It does not apply that theorem
to the entire geometric open disc. The K≠ℚ_p variant retains its stronger
same-field dimension or explicit nonvanishing hypothesis.

The reviewed library audit marks NC.4 as missing and imports classical Chabauty
from ED.4. Current read-only upstream commits were independently confirmed:
TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the complete
JacobianChallenge and ReductiveGroups readers, both suggested files, and current
`TauCeti.AlgebraicGeometry.AbelianVariety.Albanese`. Its `IsAlbanese` universal
property and uniqueness do not construct a curve Jacobian or nonlinear path
period. Current-main searches found no duplicate NC.4 target. Homogeneous
quotients, Weil restriction, Jacobians and general Hodge theory keep their
existing owners; the split-unipotent refinement remains the recorded Part II
ownership proposal for the maintainer.

## API, prototype and validation

Each of the eight definition/construction nodes has at least three tests.
The native reductions expose evaluation, quotient invariance, transport,
coefficient naturality, neutral points, depth projection and algebra structure
where appropriate. The full local/global étale API, their six geometric tests,
classification and analytic/geometric theorem signatures remain individually
identified omissions. In particular, supplying d*, a closed-image point subset
or a point-diagram equality is not a proof of its geometric construction.
The depth-one comparison retains W_MW⊆W_S and the separate equality hypothesis;
a Mordell–Weil rank bound alone does not imply a Selmer dimension bound.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.4.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.4.lean`:
  exit 0 at the pinned shared build, 64 warnings, all exactly for admitted
  declarations; no errors or other warnings. Available memory exceeded 20 GB
  before the single compilation.
- `git diff --check`: passed.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  zero problems; the diff is restricted to the authorized paths.

## Handoff to the orchestrator

No unresolved contradiction blocks acceptance. The four gaps and six requests
are the precise remaining supplier work; they do not assert geometric results
were checked by prototype elaboration. Assign the NC.2 ramified comparison and
restricted-ramification refinements to their existing owner. Keep the proposed
split-unipotent quotient extension with Reductive groups, Part II.

This review issue permits the packet, suggested file and review report, plus
its handoff. The NC.4 reader was read in full but is outside those deliverables.
Assembly must synchronize the nine corrected node entries, new test, request
consumer lists, ramified/factorization boundaries, density proof, four-gap
coverage, six source verdicts and counts of 25 tests. Its present references to
three gaps, 24 tests and two unconfirmed source slips are superseded by this
reviewed packet. No other mathematical target needs to be added.
