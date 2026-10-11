# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-RNJ5c7`. Date: 2026-10-11.
Branch: `codex-RNJ5c7-crystalline-package`.
Input commit: `b3576ca2efde68ac43a54554771352510420790b`.
Claim [6108152223](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6108152223)
was confirmed by the claim bot at 10:38:29 UTC.
None of the 40 manager-priority issues was available. WORKERS.md's fallback
order selected this available focus package. This session claimed only this job.

## Outcome and permitted scope

**Blocked on absent supplier interfaces outside this issue's allowed edits.**
This checkpoint adds the faithful degree-zero compatibility
`CrystallineCM.UnipotentTransferAction_intertwiner`, its hypothesis discriminator
and the corresponding explanation in README §1.2. It freshly checks the integral
coefficient, smooth-monoid and completed-tower boundaries, recounts actual named
coverage, and elaborates the updated Suggested.lean. The package remains
incomplete for the reasons below; this is a supplier blocker, not a time-limit
checkpoint. The preceding handoff is in
[#8857](https://github.com/CBirkbeck/tauceti-explorer/pull/8857).

The input has 97 targets, 103 API entries, 104 unit tests, 27 requests and
40 gaps. All ten layers are planned and none is closed. Its accepted
2026-10-07 review retains the supplier and prototype gaps. A completed planning
pass does not supply the missing arithmetic types.

Only the package README, Suggested.lean and this handoff change. The issue
forbids packet edits, and WORKERS.md limits edits to its named deliverables.
PROTOCOL §15 assigns general missing objects to their owners; §13 prohibits
arbitrary proposition fields or admitted proposition definitions that conceal
missing conditions. Faithful supplier signatures with admitted proofs can
suffice to resume: implemented proofs are not the blocker. No metadata is
added while these required signatures are absent.

## Added transfer compatibility

Freshly read Caraiani–Newton
[arXiv:2301.10509v3](https://arxiv.org/abs/2301.10509v3), §2.2.2,
equation (2.2.1), printed p.26. The contracting operator on unipotent invariants
is the integral finite-coset sum, retaining the raw operator on coefficients.
The supplementary statement is a consequence of that formula, not another
theorem attributed to the source.

For R-linear U-representations ρ and σ, a homomorphism c with finite-index
image, and raw operators A and B satisfying their contraction identities,
a Mathlib `Representation.IntertwiningMap ρ σ` F also intertwines the transfers
provided F A = B F. Restrict F to Mathlib's invariant submodules, distribute
it through the finite sum, and use equivariance and raw-operator compatibility
on each summand. The statement fixes both maps and the compatibility equation;
it supplies no arithmetic actions, smoothness or derived enhancement.

The supplementary example distinguishes the extra hypothesis: for U=1 over Q,
F=id is equivariant, while A=2 id and B=3 id yield different transfers.
The theorem and example are admitted signatures. They lie outside the input's
named inventory, so no target, API or named-test completion count increases.
The existing transfer definition remains the supplied integral coset formula;
no generic trace or localization construction is duplicated.

## Integral coefficient requirement freshly checked

Read CN v3's coefficient setup and Lemma 2.1.12 with its proof, printed
pp.17–18. The source uses integral dual-Weyl coefficient lattices and their
finite-free reductions. Algebraic induction identifies the Levi evaluation
target. Reduction to the residue field compares evaluation with restriction
to a Schubert variety; its surjectivity and Nakayama give integral
surjectivity. Those carriers and base-change comparisons are required inputs.

Read `TauCeti.YoungTableau.weylModule` at the exact Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, in
`RepresentationTheory/ClassicalGroups/WeylModule.lean`, lines 106–136;
also read its current `WeylModule/Basic.lean` declaration, lines 122–145.
Both require `[Algebra Q k]` and construct a Young-symmetrizer image.
They do not supply the required O-lattice or reduction modulo powers of the
uniformizer. A rational algebra makes the residue characteristic invertible,
which is incompatible with those coefficient rings.

Read current upstream ReductiveGroups in full. Layer 9 supplies integral group
schemes and root maps, rather than integral dual-Weyl modules, reduction,
Levi evaluation or splitting. The parent packet's explicit owner is
`ReductiveGroupsIntegralRepresentationsPartII`, with no exporting stage ids.
The owner direction is in the open available design issue
[#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357), whose
deliverables are named `ReductiveGroupsPartIII`. A fresh inventory of atlas
packets, readers, suggested files and packages, and current upstream roadmaps,
finds neither owner interface. Do not invent stage ids to bridge the names.

Consumers include CL.0/lem-2-1-12, CL.0/lem-2-1-17, CL.2/lem-2-2-14,
CL.2/lem-2-2-16, CL.5/cor-4-1-9 and CL.6/lem-4-2-3.
`REQ-INTEGRAL-WEYL` also requires the integral Levi-equivariant splitting,
its generic complement and P(O)-stability. Preserve the inherited
algebraic-induction reuse contract below. The README corrects the inherited
NT16 splitting locator to **Proposition 2.10**, while the packet still says
“Lemma 2.10”; that packet correction needs an authorized job. NT16 was not
freshly read in this session.

## Smooth monoid boundary freshly checked

Read CN v3 §2.2.2, Definition 2.2.3 and Lemmas 2.2.4–2.2.6,
printed pp.26–28. Read pinned `IsSmoothDiscrete` and its restriction interface
and the current `SmoothDiscrete/Basic.lean` category declaration. The existing
`TauCeti.SmoothDiscreteTopRep` already allows a monoid. The missing input is
therefore not the carrier itself.

Read current `SmoothRepresentationsOfLocalGroups/Suggested.lean`,
lines 330–397: the `SmoothRep` abelian and Grothendieck interfaces require a
topological group. Read its SR.0d derived contracts and SR.6.5 stable-operator
signatures. `StableOperator.localization` is already the actual module direct
limit of powers of T. Its invertible-part comparison has no positive-monoid
action, smoothness data or derived injective-preservation conclusion. Reuse
it when the extra action and functorial structures are supplied.

`REQ-SMOOTH` still names the old `SR.0:abelian-category` supplier. Resumption
requires the positive-monoid abelian/enough-injectives interfaces,
monoid-valued derived U_0 invariants with their transfer action, and smooth
localization with the exactness and injective-preservation comparisons used by
derived compact Levi invariants. Coefficient-injective coinduction and the
higher ordinary open-cell acyclicity are separate inputs. The inherited
contracts below retain the remaining details. No positive-monoid theorem is
inferred from the group category or an equivalence of underlying modules.

## Completed-tower requirement freshly checked

Read CN v3 §2.2.7, Proposition 2.2.8, Corollary 2.2.9 and the boundary
and variant constructions in §§2.2.10–2.2.11, printed pp.28–29.
The completed coefficient object is derived arithmetic cohomology carrying
smooth monoid and Hecke actions. Derived parahoric invariants recover the
finite-level coefficient complex. Ordinary localization, compact Levi
invariants and the finite-module projector then give the level-independence
comparison. A diagram of modules without these actions and recovery maps is
not CL.1/p-ordinary-completed's specified object.

`REQ-TOWER` still names ALS.6. Read the reviewed ALS.6 library-audit entry and
[RS-09](../restructure/RS-09.result.json) owner assignments: generic categorical
limits do not supply the arithmetic tower, and ALS.6 finite-level descent is
not its completed owner.

| Required input | Owner after RS-09 |
|---|---|
| Actual level indexing, conjugation, restriction/transfer and assembly | CC.0 |
| Smooth action on the level colimit | CC.1 |
| Completion, order of limits, Milnor and coefficient recovery | CC.2 |
| Completed equivariant chain models and finite recovery | CC.4 |
| Continuous completed descent and derived invariants | CC.6 |
| Completed support and boundary triangle | CC.7 |

A fresh inventory finds no CC.0–CC.7 supplier exports in the atlas or current
upstream roadmaps. Owner issue
[#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) remains open
and available; this worker did not claim it. Read the scope and dependencies
of the accepted [CC.8 packet](../packets/CompletedCohomologyPartII--CC.8.json):
it covers only CC.8 and explicitly requests those earlier layers. Acceptance
of an application layer does not supply its arithmetic prerequisites.

Consumers include CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Preserve the separate integral
nilmanifold/congruence-limit acyclicity input: a characteristic-zero
Lie-algebra formula cannot replace it. This session did not re-audit every
one of the 27 requests.

## Actual suggested-file coverage

Freshly counted named declarations after removing nested block and line
comments. A named test counts only when its label is followed by an actual
Lean `example`, allowing comments and whitespace. The supplementary transfer
signature and anonymous example do not alter the named inventory:

| Layer | Target names | API names | Named examples |
|---|---:|---:|---:|
| CL.0 | 6/10 | 18/18 | 19/19 |
| CL.1 | 1/13 | 3/18 | 3/18 |
| CL.2 | 0/6 | 0/3 | 0/3 |
| CL.3 | 2/16 | 3/12 | 3/12 |
| CL.4 | 0/5 | 0/9 | 0/9 |
| CL.5 | 0/8 | 0/3 | 0/3 |
| CL.6 | 7/13 | 18/21 | 17/21 |
| CL.7 | 0/7 | 0/0 | 0/0 |
| CL.8 | 0/7 | 0/6 | 0/6 |
| CL.9 | 1/12 | 2/13 | 3/13 |
| Total | 17/97 | 44/103 | 45/104 |

Name presence does not certify arithmetic specialization, and successful
elaboration does not discharge the absent targets. Adding metadata now would
allow the output-existence check in `issues.deliverables_complete` to mistake
this for a complete package, so metadata remains absent.

## Resume conditions and validation

Resume when the integral owner exports actual stage ids and typed lattice,
base-change, Levi evaluation and splitting interfaces; the smooth supplier
exports the monoid enhancements above; and CC.0–CC.7 export the arithmetic
tower interfaces. Reconcile the stale supplier labels and NT16 locator in a
packet-authorized job. These are necessary conditions, not a certification
that every other request is resolved. Preserve the inherited continuity,
coefficient and arithmetic contracts below.

Then specialize every absent target, API item and named example to the genuine
arithmetic objects, finish the reader and Suggested.lean, and add
`topic = "math.NT"`. Retain the qualified Barsotti–Tate endpoint and
cubic-tetrahedral exception. For queue management, keep this job blocked until
its prerequisites change; merging a checkpoint does not change the inputs.
This worker changes no issue labels and claims no owner job.

- Read WORKERS.md, both protocols and UPSTREAM_GUIDE.md; read current upstream
  ReductiveGroups and PeripheralActions READMEs in full. Read the source and
  supplier passages specified above. All source explanations are in our own
  words; no source passage or PDF is submitted.
- Read-only roadmap commit: `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`;
  current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  Neither tree was edited or built.
- Accepted-input `check_blueprint.py`: **0 errors, 0 warnings**. Packet hash:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- Updated package `lean-check`: **exit 0, no errors, 111 warnings, all
  declaration-uses-sorry**. Available memory before checking: 93 GB.
  The shared wrapper uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`;
  its Mathlib HEAD was verified as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  No language server or library build was started; no check remains running.
- Suggested.lean SHA-256:
  `75a5404ab2a9767b1c4b1f8d11f899a1bc30ea53daee3d10449c92fa55e96c5d`.
  README SHA-256:
  `ee14120ed952a9ad2852032a7ca013a5ba74d6fe462d2f542d144df8cb628dda`;
  **197,806 bytes**, below the 200 KB ceiling.
- Public CN v3 PDF, accessed 2026-10-11, SHA-256:
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Fresh source reading is limited to printed pp.17–18 and pp.26–29.
- Final whitespace and intake checks are recorded in the pull request.
  Only the three permitted files change. No scratch artifact is needed to
  resume; the following records are explicitly inherited.

## Previous checkpoint additions to retain

[#8833](https://github.com/CBirkbeck/tauceti-explorer/pull/8833) added
`CrystallineCM.subquotient_mod_p_pow_unique` and
`CrystallineCM.subquotient_mod_p_pow_equivariant` to README §3.6 and
Suggested.lean. They retain the actual image of N′ in N/p^eN and the square
with a chosen presentation f : N′ → M. Precomposition with the surjective
canonical map onto that image proves uniqueness; the same cancellation proves
intertwining when the generating maps intertwine a common monoid action.
Arithmetic actions still require their supplier. These statements do not need
finite generation, surjectivity of f or positive depths; those assumptions
belong to the existing existence/Artin–Rees depth-control statements. Both
suggested proofs are `sorry`.

That preceding worker checked CN v3 Lemma 2.3.18, p.43. The supplementary
statements are consequences of the comparison square, rather than extra
claims attributed to that source lemma. Preserve the full ambient quotient,
the depth-one failure for pZ_p in Z_p, and its depth-two repair examples.
The preceding complete check record remains in #8833.

## Inherited mathematical resume contracts

These are the preceding workers' authored source and interface checks, preserved
for continuity. They are not fresh source-reading claims for `codex-RNJ5c7`.
For the preceding full audit records, see
[#8807](https://github.com/CBirkbeck/tauceti-explorer/pull/8807) and
[#8800](https://github.com/CBirkbeck/tauceti-explorer/pull/8800).

### Algebraic induction and compatible reconstruction

The preceding continuation established that IHG §0.7 already owns
`AlgebraicInduction.module`, its cotensor equalizer, `moduleComodule`,
`reciprocity` and the counit `reciprocity_apply`. The integral highest-weight
owner should specialize that carrier; IHG §6.4's GL₂ good-filtration theory
does not establish arbitrary GL_{2n} integral Siegel evaluation and splitting.
Its F(hg) = hF(g) convention compares by inversion with Jantzen I.3.3–3.7,
pp.38–41, in the cleared second edition. That source audit is inherited.

IHG README §1.6 and `Theorems.compatible_local_reconstruction` already allow a
surjection B→A with B local and A henselian local, without requiring A flat.
In CN Proposition 4.2.13, B = Ã is finite flat over O, whereas A is the torsion
Hecke quotient. The arithmetic application must supply equality of full
determinant laws, actual global/local corner identities, generic-fiber basis
comparisons and continuity of the local corner action. Algebraic assembly
returns a B-valued conjugate reducing exactly to the fixed global representation
and retaining the selected generic constituents; it does not construct the
finite flat algebra, projectors, continuity or crystalline data. Preserve the
rank-one O→O/ϖ test against an unnecessary flatness hypothesis on A.

The preceding worker read CN arXiv:2301.10509v3 §3.2, Lemma 3.2.2 and
Proposition 3.2.4, pp.47–50, and Proposition 4.2.13, pp.69–71. Retarget
`REQ-COMPATIBLE-LOCAL-RECONSTRUCTION` in a packet-authorized job to the existing
IHG §1.6 export and these arithmetic inputs, rather than requesting a second
generic theorem. The README already retains this distinction.

### Smooth monoids and derived ordinary parts

The inherited phrase “missing smooth category” needs a narrower interpretation.
At the pinned Tau Ceti commit, the preceding continuation read the following
interfaces in `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`.
That historical continuation also read the monoid predicate, restriction and category:

| Declaration | Locator and actual scope |
|---|---|
| `TauCeti.IsSmoothDiscrete` | Lines 245–259; `[Monoid G]`, a discrete underlying module and open point stabilizers. |
| `TauCeti.IsSmoothDiscrete.res` | Lines 268–270; continuous monoid restriction preserves that predicate. |
| `TauCeti.SmoothDiscreteTopRep` | Lines 530–538; the corresponding full subcategory of `TopRep`. |
| `TauCeti.discreteRepEquivSmoothTopRep` | Lines 642–645 and 678–688; the section requires `[Group G]` and `[IsTopologicalGroup G]`. |

The current library keeps these interfaces in `SmoothDiscrete/Basic.lean`:
predicate lines 270–275, restriction line 303, category lines 612–618,
equivalence line 834. The monoid carrier is therefore already present and must
not be recreated here. Its group coefficient equivalence must not be invoked
for a positive monoid without a separate comparison theorem.

The current upstream `SmoothRepresentationsOfLocalGroups` has the actual stages
`SR.0` and `SR.0d`. The preceding continuation read its Suggested.lean
lines 332–394: `SmoothRep`,
`SmoothRep.instAbelian` and `SmoothRep.instIsGrothendieckAbelian` require a
topological **group**. `SmoothRep.res_preserves_injective` (lines 3011–3014)
likewise takes an open subgroup. README `SR.0d.1` and `SR.0d.2` plan the group
derived category and compact-normal-subgroup composition. They do not establish
the positive-monoid interfaces merely by providing the group category.

The preceding checkpoint read the current **SR.6.5 Stable module operators**
README and its actual Suggested.lean declarations, lines 1712–1730 and
7270–7309. `StableOperator.localization` and `localizationMap` define the
module direct limit with transition T^(j−i) and its index-zero map.
`invertiblePart` supplies an equivalence from range(T^c) under
`StableOperator T`. `localization_nilpotent`, `localization_identity` and
`localization_mixed` state the underlying module checks. These are roadmap
signatures with `sorry`, not implemented Tau Ceti theorems. They have no
representation action or smoothness data. Upstream's
`RationalParabolic.jacquet_localization` is a separate complex-coefficient
Jacquet comparison, not the required torsion positive-monoid functor.
Do not repeat either construction or infer the missing derived comparison
from an equivalence of underlying modules.

The preceding checkpoint read CN v3 §2.2.2 and Definition 2.2.3, pp.26–27.
Required exports to resume:

1. Compare arithmetic smoothness on Δ̃_P and Δ⁺ with the existing monoid
   carrier; provide its abelian/enough-injectives interface.
2. Construct monoid-valued RΓ(U₀,−), retaining the finite-transfer Δ⁺ action;
   establish U₀-acyclicity after the specific monoid restrictions.
3. Localize smooth Δ⁺-objects at the selected central ũ_n to smooth
   Δ-objects; prove exactness and the injective-preservation comparison used
   for derived compact Levi invariants. A finite ordinary projector on a finite
   module does not define localization of arbitrary smooth modules.
4. Supply the coefficient-injective coinduction and higher ordinary open-cell
   acyclicity of CN Lemma 2.3.6, pp.36–37, separately from degree-zero transfer.

These belong to the smooth-representation supplier's monoid extension. The
package now uses the current stage names and states the extra contracts rather
than asserting that existing group prototypes export them. The accepted packet
still uses the old labels: a job authorized to edit that packet should reconcile
`REQ-SMOOTH`, `REQ-DEEP-PERFECT` and `REQ-DERIVED-INVARIANTS` with the actual
stages and assign ids to the additional monoid exports. Deep-perfect restriction
remains a separate requested theorem; this run does not certify it from the
existence of the group-derived category.

### Material to preserve when resuming

The previous signature work and its detailed explanations are retained in the
package. [#8715](https://github.com/CBirkbeck/tauceti-explorer/pull/8715)
contains an earlier handoff if its full history is needed.

| Typed core | Boundary and essential convention |
|---|---|
| Block exchange, positive exponent cone and integral block parahorics | Block exchange differs from full reversal; exponents allow negative central shifts; upper-right parahoric block is free. |
| Positive parahoric monoid | Actual DVR double-coset union; invert only the chosen central Siegel element. Split-place, topology and arithmetic Levi action are separate inputs. |
| Lowest-weight scaling and rescaled actions | Actual supplied exponent map, separate full/blockwise Weyl permutations and inverse scalar rescaling. PA.0's ACC character has a different normalization. |
| Unipotent transfer | Explicit integral finite coset sum with raw intertwining action. On trivial F_p coefficients, index-p transfer is zero. Smoothness and derived enhancement are separate inputs; reuse existing generic trace/corestriction. |
| Determinant-norm unit character | Actual determinant norm and p-adic unit normalization; this does not construct top continuous unipotent cohomology. |
| Integral/torsion Hecke images | Ranges of the actual supplied localized actions; arithmetic coefficient reduction and base change require comparisons. |
| Middle/dual Hecke images | Rational injection needs M→E⊗M injective. Adjoint image descent needs the actual perfect pairing, degree/support data and involution. Dual coefficients precede cohomology; torsion linear duals can vanish. |
| Deep Levi and unitary levels | Integral component maps are defined on K, with the actual local uniformizer. Pull back Levi selection from F⁺ to both conjugate places; unitary levels permit upper unipotents. |
| Numerical degree bound and adic subquotients | Retain floor/ceiling conventions in odd dimension, and the canonical Artin–Rees image, natural square and uniform coefficient-depth shift. |
| Determinant-kernel criterion | Projective image is conjugation image in ambient GL₂. Retain the cubic A₄ exception; the F₇ quaternion computation discriminates it. |

Preserve geometric Frobenius, the reversed first unitary weight block, the
coefficient-valued dual exterior-power computation, independent ambient
2n-dimensional decomposed genericity, arbitrary-prime deep splitting,
input-independent nilpotence exponents and the incoming-differential correction
in CN Proposition 4.2.6. Full-range unipotent nonvanishing is specified at zero
selected weights only. The Barsotti–Tate endpoint retains
`[F(ζ_p):F] ≠ 3` or projective residual image different from A₄; the unrestricted
case remains `GAP-CUBIC-TETRAHEDRAL`. Solvable preparation preserves the full
residual-plus-cyclotomic field. AKT numbering remains arXiv:1910.12986v2;
journal collation is still an explicit gap.

Remaining layer interfaces: CL.0 integral weights and arithmetic Hecke actions;
CL.1 smooth/derived open-monoid categories and actual towers; CL.2 dual/inverse
monoid coefficient comparisons; CL.3 compact-mod-parabolic induction and
continuous cochains; CL.4 cuspidal local Hecke systems and filtered (φ,N)/Galois
carriers; CL.5 supported arithmetic derived objects and retracts; CL.6 arithmetic
cohomology actions, localized comparison and cuspidal realization; CL.7 absolute
Galois and crystalline/ordinary deformation data; CL.8 enhanced non-neat PGL₂
complexes and derived support; CL.9 fixed determinants, local types,
Taylor–Wiles, Selmer and base-change data.

### Additional coefficient conventions

Quasi-ordinary parts require simultaneous generalized eigenspaces with
valuation-zero eigenvalues, splitting-field descent and scalar-extension
comparisons from `PadicFamilies:L0a`. The two scalar operators 1 and p on an
E-line are both invertible over E, yet their simultaneous unit-eigenvalue part
is zero. Finite/profinite Fitting invertibility does not supply this interface.
Preserve HT(ε⁻¹)=+1 alongside the other normalization conventions above.
