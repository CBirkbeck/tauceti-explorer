# PKG-HodgeStructuresPartII — blocked checkpoint, codex-zUVzWI

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-zUVzWI`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6096719066).
Branch: `codex-zUVzWI-hodge-package`. No manager-priority issue was available;
the available focus package followed WORKERS.md's fallback ordering. Only
this job was claimed.

## Outcome and required owner repairs

**Blocked checkpoint; the package is incomplete.** Independently compared
H.0's `ordinary-fiber`, `rees-parameter` and `rees-specialization` with the
full CR.1 connection and DD.1 filtered/Rees statements, hypotheses, proof
steps, APIs and tests. The supplier mismatches remain. H.0's accepted review
explicitly retains seven gaps and four requests; acceptance of that planning
pass does not supply the missing contracts.

The issue instructs: “Change no packet; if the plan has a mistake, describe
it in the handoff note.” PROTOCOL §§3, 15 and 20 require exact prerequisites,
one owner for shared mathematics, and fidelity to the plan. These repairs
therefore require owner-authorized planning changes before packaging can
finish. Neither a broader citation nor a duplicate carrier in this package
repairs the inconsistent exports. No ownership move was made.

| Owner and exact node | Current export | Required consumer input |
| --- | --- | --- |
| `CrystallineCohomology:CR.1/integrable-connection`, in `packets/CrystallineCohomology--CR.0.json` | Affine connections on surjective Kähler quotients; sheaf connections on the small crystalline site under PD and local-nilpotence hypotheses. | Ordinary additive connections on arbitrary supplied commutative differential ringed sites, with exterior extensions, curvature, horizontal maps and restriction/descent. H.0's `ordinary-fiber` must identify the same underlying sheaf and operators at λ=1, including locally varying rank. |
| `DerivedDeRhamCohomology:DD.1/filtered-modules` and `DD.1/rees-description` | Enhanced derived filtrations, graded cofibres and a derived graded Rees equivalence over a ring. | Bounded locally split ordinary finite module-sheaf filtrations, the actual O[t]-Rees sheaf, finite local freeness, zero/unit/localized fibre maps, tensor/quotient coherence and descent. H.0 constructs t∇ and proves operator compatibility through those maps. |

Paths in the table are relative to `research/blueprint/`. Route these two
owner repairs, then reconcile H.0's references before scheduling another
package continuation. Preserve DD.1 ownership of the generic Rees carrier
and H.0 ownership of its Griffiths connection. The separate unbounded
Liu–Zhu period-lattice input is not replaced by a bounded Rees theorem.

Re-read the existing proved acceptance witness
`NonUniversalDifferentialChecks.no_kaehler_quotient` and pinned Mathlib's
`KaehlerDifferential.subsingleton_of_surjective`. On the one-point site
with O=Q, Ω¹=Q, Ω²=0 and d=0, D(q)=q is flat and nonzero, while
Ω¹_(Q/Q)=0 cannot surject onto Ω¹. This consumer input lies outside the
supplier's affine hypotheses. It does not construct the missing global
comparison. The rank-two Rees/frame-change witnesses and remaining
G2/G4–G7 requirements are retained in the continuation below.

## Change and current-library boundary

Corrected the README's claim that finite locally free duality was only
available on charts. The current library already exports global duality in
[`Sheaf/Dualizable.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/Category/ModuleCat/Sheaf/Dualizable.lean#L74):

- `SheafOfModules.isIso_dualTensorIhom_of_isLocallyFree` makes
  Hom(M,O)⊗N→Hom(M,N) invertible for locally free, finite-type M and every N.
  It uses global weak sheafification and its locally bijective criterion,
  pullbacks, and sheaf composition, sheafification and that criterion on
  every slice. Its descent proof requires no global frame or constant rank.
- `TauCeti.exactPairingOfIsIsoDualTensorIhom` in
  [`Rigid/OfClosed.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/CategoryTheory/Monoidal/Rigid/OfClosed.lean#L182)
  supplies the canonical exact pairing: internal-Hom evaluation and the
  inverse image of id_M under the comparison at M, with both zigzag laws.
- `SheafOfModules.isFiniteLocallyFree_ihom_unit` adds sheafification and
  the locally bijective criterion on iterated slices and proves dual closure.
  `SheafOfModules.isFiniteLocallyFree_ihom` additionally assumes binary
  products and proves internal-Hom closure for two finite locally free inputs.
  Native tensor closure is
  `TauCeti.SheafOfModules.isMonoidal_isFiniteLocallyFree` in `LocallyFree.lean`.

Read these statements and proofs, their finite-free-chart descent, the native
local invertibility criterion, and the closed/rigid comparison APIs. Reuse
these coefficient objects; do not plan another global dual carrier. The
inherited G2 notes below are superseded on this point. They remain applicable
to the exterior/determinant operations and operator comparisons: H.0 still
constructs the dual connection, horizontal evaluation, curvature transport
and the required differential-site pullback laws. This narrows G2 without
closing G1/G3 or establishing the remaining global comparisons.

These modules are newer than the managed pinned build; `Dualizable.lean` is
absent there. Suggested.lean is unchanged. Current APIs are cited at the
public revision, and the older-pin elaboration does not test their imports.
The existing native tensor equality and restriction citations are retained.
No replacement coefficient declaration or duplicate supplier was added.

Read the current AlgebraicVectorBundles and DifferentialGeometry READMEs
in full and their relevant suggested declarations. The former supplies
scheme-module tensor/dual/exterior/determinant targets; the latter's
`CurvatureForm` is a smooth real bundle-valued two-form carrier. Neither
inspected interface supplies the two contracts above. The current library's
`reesAlgebra.grade` and `mem_grade_iff` concern ideal-power monomials, not
ordinary filtered module sheaves. This is an interface comparison, not an
exhaustive absence audit. Existing reviewed HodgeStructures L0–L3 linear
algebra remains an import.

## Sources, verification and resumption

Re-read [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5)
and [Situation 60.7.5](https://stacks.math.columbia.edu/tag/07MF). Their
crystal-to-connection construction uses the small crystalline site under
PD and p-local-nilpotence hypotheses. Also read Bhatt's
[MAT549 F22 notes](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
§2.2.1, Construction 2.2.1 through Remark 2.2.8, printed pp.13–17.
Proposition 2.2.6 gives the graded Rees equivalence; Remark 2.2.8 supplies
the finite-projective affine case relevant to the owner repair. The
ordinary sheaf descent and operator comparisons must still be exported.
The preceding checkpoint recorded PDF SHA-256
`a9f526ced2fc5e08e849a77ad2818689b4254129698695c9cbfbab95927cca6a`;
this run read the online PDF and did not obtain a new file hash.
No source passage was copied into the repository.

Atlas base: `0cde07aa7`.
Read-only TauCetiRoadmap: `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`.
Read-only Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No Lake command ran in either read-only tree.

All ten Hodge packets and the two supplier packets passed
`python3 scripts/check_blueprint.py`: twelve exit-zero results, zero errors
and warnings. This is structural validation, not an independent full
mathematical audit of H.1–H.8. The decisive input SHA-256 receipts are:

| File relative to `research/blueprint/` | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |

`lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
exited 0: zero errors, 1619 `declaration uses sorry` warnings, zero other
warnings. Available memory before launch was 100 GB. Managed build pins:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The latter is the managed build's
recorded pin, not a freshly obtained Git HEAD. No Lean process remains from
this run.

README is 199570 bytes, below the 200 KB limit. Suggested.lean is unchanged.
Metadata remains absent because this is an unfinished checkpoint; intended
topic on completion is `math.AG`. After the owner repairs, reconcile the
omitted signatures with the native G2 exports, finish the remaining
G2/G4–G7 contracts and the full target/signature/API/test audit before adding
metadata. Scoped intake on the two edited deliverables and `git diff --check`
passed. The retained continuation provides the detailed witnesses, rejected shortcuts
and remaining signature inventory; no disposable scratch file is required.

---

# Inherited continuation record — codex-FxDbWE

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-FxDbWE`, 10 October 2026.
[Bot claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6095594766).
Branch: `codex-FxDbWE-hodge-package`. None of the manager's priority issues
was in the available-swarm listing. This available focus package followed
WORKERS' fallback ordering. Only this job was claimed.

## Result and next action

**Blocked by owner specifications; the package is incomplete.** Independently
re-reading the H.0 consumers and continuation gaps, CR.1's complete connection
definition/API and DD.1's filtered/Rees targets confirms the inherited G1/G3
mismatch. The current upstream roadmaps include material beyond the atlas
snapshot, but neither the inspected upstream interfaces nor the current native library
supplies these exact missing contracts. The consumer and supplier packet hashes
are unchanged. H.0's accepted review expressly retains seven gaps and four
requests and calls the layer planned, not closed.

Route owner-authorized repairs to CR.1 and DD.1, then reconcile H.0's supplier
references. Issue #7491 authorizes only the three package artifacts and this
handoff, forbids packet edits, and directs plan mistakes here. PROTOCOL §§3,
15 and 20 require exact prerequisites, one owner for shared constructions and
fidelity to the plan. Duplicating the missing shared mathematics within this
package would leave those contracts inconsistent. This is a missing supplier
specification, rather than an implementation wait for a sufficient target.
No ownership move is made in this checkpoint.

| Repair owner | Present export | Required H.0 comparison |
| --- | --- | --- |
| CR.1 | `integrable-connection` covers affine quotients of Kähler differentials and the small crystalline site under PD hypotheses. | `ordinary-fiber` needs the same additive operator, exterior extensions, curvature, horizontal maps and descent on arbitrary supplied differential ringed sites. |
| DD.1 | `filtered-modules` and `rees-description` describe enhanced derived diagrams, graded derived fibres and localization. | `rees-parameter` and `rees-specialization` need an ordinary finite locally split module sheaf, actual zero/unit/localized fibres, finite local freeness, naturality and descent, with operator-compatible H.0 comparisons. |

This run strengthens the existing G1 acceptance witness in README and
Suggested.lean. `NonUniversalDifferentialChecks.no_kaehler_quotient` proves
that no Q-linear map from the native `KaehlerDifferential Q Q` to Q is
surjective; its named example applies the obstruction to every proposed
quotient map. The proof uses the pinned Mathlib subsingleton theorem at the
identity algebra map, linearity at zero and 0≠1. It has no admitted proof.
The four existing coordinate checks continue to describe a flat nonzero
operator on the supplied one-form module. Together these distinguish the
requested calculus from the present CR.1 hypothesis without creating a
second ordinary-connection carrier.

Metadata remains absent, so intake must regard this as a checkpoint. The
intended topic on completion is `math.AG`. G1/G3 repairs alone do not finish
the remaining G2/G4–G7 or all-layer audit. No packet, owner contract, review
verdict or metadata is changed.

## Exact blocking contracts and acceptance witnesses

The witnesses and proved checks below are inherited work, chiefly recorded
by `codex-tOBD6n`; the native Kähler obstruction above is the new proof in
this checkpoint. The global sheaf comparisons remain unproved.

**G1: ordinary connections on the supplied calculus.** The consumer
`H.0/ordinary-fiber` asks for the λ=1 category on an arbitrary commutative
ringed Grothendieck site with supplied relative exterior calculus:
Ω⁰=O, Ωⁿ=∧ⁿΩ¹, d²=0 and graded Leibniz. Its finite locally free carrier
allows locally constant rank, not only a fixed global rank. The supplier
`CrystallineCohomology:CR.1/integrable-connection`, in the CR.0 packet,
currently covers affine A→B with a quotient of Ω¹_(B/A) whose exterior
differential descends, and a sheaf version on the small crystalline site
under PD-base hypotheses. Neither is the requested arbitrary supplied site.
The latest accepted CR.0 review does not widen this statement.

The required CR.1 export has an additive sheaf operator
D:E→E⊗_OΩ¹ with D(fs)=fD(s)+s⊗df, its exterior extensions
D(s⊗ω)=D(s)∧ω+s⊗dω, curvature D₁D₀, integrability, and horizontal
O-linear maps satisfying D_F f=(f⊗1)D_E. Include restriction/gluing and
natural specializations to the existing affine and crystalline cases.
The finite locally free full subcategory must identify the same operators,
extensions and curvature as H.0 at λ=1. An abstract category equivalence or
matching affine matrices alone is insufficient. Quasi-nilpotence is a
hypothesis of the crystal equivalence, not of an ordinary connection.

**Inherited acceptance witness:** on the one-point site let O=Q, Ω¹=Q·ω,
Ω²=0 and d=0 in every degree. On E=Q, D(q)=qω obeys Leibniz, is flat
and sends 1 to a nonzero form. Ω¹_(Q/Q)=0, so no quotient of that Kähler
module can be the supplied Ω¹. This directly distinguishes the requested
generality from the present affine supplier. README H.0 explains the example;
`NonUniversalDifferentialChecks` in the affine namespace defines the zero
scalar derivation and identity coefficient matrix and proves zero scalar
differential, nonzero unit image, flatness/nonvanishing and scalar Leibniz.
These checks verify coordinates, not a global sheaf carrier or comparison.

Also retain the ordinary example O=Q[x], E=O, D=d: D(x)=dx and D²=0,
while multiplication by x is not horizontal. It detects loss of the additive,
non-O-linear operator. Owner acceptance must additionally test restrictions,
exterior extensions and gluing.

**G3: ordinary finite Rees module sheaves and fibres.** The consumers
`H.0/rees-parameter` and `H.0/rees-specialization` request a finite bounded,
locally split decreasing subbundle filtration F of finite locally free E,
with finite locally free graded quotients. Present suppliers
`DerivedDeRhamCohomology:DD.1/filtered-modules` and `DD.1/rees-description`
specify enhanced DF(A)=Fun(Zᵒᵖ,D(A)), cofibres, the graded derived A[t]
equivalence and derived zero/localized fibres. They do not specify the
ordinary finite module sheaf, local freeness, t=1 fibre or descent maps.

The DD.1 repair must export Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside
E⊗_O O[t,t⁻¹], as an O[t]-module sheaf, with explicit polynomial/Laurent
carriers. Local splittings identify it with ⊕_p G_p[t]·t⁻ᵖ; construction
and comparison maps must be independent of that choice. Require finite
local freeness and natural isomorphisms Rees/(t)≃⊕_p grᵖ_F E,
Rees/(t−1)≃E and Rees[t⁻¹]≃E⊗_O O[t,t⁻¹]. Normalize the zero-fibre
map by [e t⁻ᵖ]↦[e] in grᵖ and the unit-fibre map by [e t⁻ᵖ]↦e.
Include filtered-map naturality, restriction/descent, convolution tensor
filtrations, quotient tensor comparisons and the link to the derived theory.
There is no connection field in this generic DD.1 export. H.0 uses Griffiths
transversality to construct t∇, keeps dt=0, and proves that the imported
fibre maps intertwine operators.

Retain these Rees acceptance witnesses and the twelve existing proved chart
checks:

- E=Oe₁⊕Oe₂, Fᵖ=E for p≤0, F¹=Oe₁, Fᵖ=0 for p≥2;
  ∇e₁=e₂dx, ∇e₂=0. In u₁=t⁻¹e₁, u₂=e₂, D=t∇ satisfies
  D(u₁)=u₂dx, D(u₂)=0 and D(xu₁)=(xu₂+tu₁)dx. The zero fibre has
  a nonzero Higgs field, the unit fibre recovers ∇, and localization gives
  E[t,t⁻¹] with t∇. Include rank-zero and one-step tests; a nonzero
  constant filtration on all integers is not bounded.
- Under e₁′=e₁, e₂′=e₂+xe₁, the Rees basis matrix is
  B=((1,xt),(0,1)). For A=E₂₁ the transported matrix is
  B⁻¹AB+tB⁻¹δB=((−xt,t²(1−x²)),(1,xt)). At t=0 it is E₂₁;
  at t=1 it is ((−x,1−x²),(1,x)). At x=0,t=1 the upper-right
  coefficient is 1, whereas pure conjugation gives 0. Actual transition
  comparisons must retain the derivative term.

## Other continuation requirements and preserved work

- **G2 — sheaf operations:** import the actual underived sheaf tensor powers,
  dual, exterior, determinant, symmetric quotients and endomorphism carriers;
  require local generation, restriction-compatible equality detection, descent
  and pullback coherence. Tensoring global section modules does not calculate
  sheaf tensor sections. The 36 omitted global parent signatures and their
  API/tests remain conditional on these carriers and G1/G3.
- **G4 — determinant:** allow locally varying rank or a specified determinant
  line with its prescribed connection. Glue the alternating-sum connection
  through determinant gauge transport using the exact
  `ColemanPowerSeries:L1/derivation-determinant-unit` integral Jacobi API.
  Exterior-power base change must work over arbitrary, including nonflat,
  ring changes and preserve horizontal operators and exterior extensions.
  Trace zero applies only to the fixed trivial determinant convention.
- **G5 — period lattice:** keep the unbounded filtration in the localized
  Liu–Zhu carrier: E+ is over O_X completed tensor B_dR+, localization inverts
  t, and t^i Fil^j=Fil^(i+j), with negative powers interpreted there. For the
  relative flat Griffiths connection, t∇ preserves E+ and its linear residue
  must identify with the graded symbol valued in Ω¹_X(-1). Preserve semilinear
  Galois/Tate and exterior-curvature compatibility. Import period foundations
  from the named p-adic consumer without depending on its correspondence;
  neither a bounded replacement nor a trivial Tate character suffices.
- **G6 — nilpotence:** local exponents on a cover give a global exponent only
  with a uniform bound; a finite subcover gives their maximum. Infinitely many
  disjoint Jordan blocks with increasing size give no finite global bound.
  Rank bounds require globally bounded rank. Kernel subsheaves need not be
  subbundles, and nonflat base change need not preserve symmetric-action images.
- **G7 — spectral adapter:** the coherent image algebra B_theta, coefficient-
  valued section from finite local duality and twists by invertible B_theta
  modules need Heuer's analytic finiteness hypotheses. Do not infer coherence
  on an arbitrary site. Generic images/tensors stay at E1; the spectral cover,
  Picard and twisting correspondence belong to the p-adic Simpson consumer.
  Keep coefficient/Tate compatibility and nonflat image-change conditions.

Preserve native Hodge imports, H.5's scheme-theoretic fibres and finite-projective
lattice signatures, Betti scalar-automorphism checks and H.7's proved negative
controls. Do not restore the twenty removed unrestricted H.7 signatures.
`ShimuraData:D3/variation` already specifies compatible real/rational data;
its incomplete prototype alone is not an owner gap. The local
`IntegralVariationFibers` prototype lacks scalar-extension agreement and
lattice naturality and cannot replace H.7's global integral datum.

Suggested.lean retains 699 example declarations, including seven split-chart,
five change-of-frame and five supplied-calculus checks. Its affine operator
uses `LinearMap.pi`, `LinearMap.proj`, `Derivation.toLinearMap` and
`Matrix.mulVecLin.restrictScalars`; the evaluation, Leibniz and zero-matrix
laws are proved. Prior diagnostics found no `sorryAx` for those laws and the
chart checks; the supplied-calculus witness diagnostic recorded only
`propext`, `Classical.choice` and `Quot.sound`. Those axiom diagnostics were
not repeated in this run. They do not prove global sheaf comparisons.
The earlier `codex-DS6Pib` probes of `Module.Free.of_filtration` and
`Module.iInter_freeLocus_subquotient_subset_freeLocus` concerned freeness and
free loci, rather than the missing Rees carrier or fibre/descent maps; those
probes were not repeated either.

After owner repair, complete the target-fidelity audit, including the 569
parent nodes and seven H.0 continuation nodes. Finish README definition/API/
Checks grouping and worked examples, declaration docstrings, precise omission
lists and current-library/bottom-up prerequisite checks for every target.
This checkpoint does not certify H.1–H.8 or the remaining H.0 targets.

## Fresh source and current-library checks

Atlas input: `1e146cc34` (own job branch fast-forwarded before editing).
Read-only upstream roadmaps: `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Read the current AlgebraicVectorBundles and DifferentialGeometry READMEs,
including their exact sheaf, exterior and connection boundaries. The suggested
interface and reviewed HodgeStructures L0–L3 audit reads below are inherited
from the preceding checkpoint.
The first roadmap supplies scheme-level tensor, finite locally free dual,
exterior, determinant and pullback comparisons. The second's `CurvatureForm`
is a carrier for smooth real manifold bundle-valued forms. Existing pure/mixed
Hodge linear algebra and period points are inputs to reuse. None of these
checks produces the missing G1/G3 export. No Lake command ran in these trees.

The preceding checkpoint read the native sheaf tensor implementation and its
ambient sheafification hypotheses; that detailed source read was not repeated
in this run: `TauCeti.SheafOfModules.tensorProduct`,
`tensorProduct_val` and `tensorProductIso` use sheafification of the presheaf
tensor. This is useful G2 infrastructure, not all the requested exterior,
descent or connection contracts. Mathlib's `reesAlgebra`/`mem_reesAlgebra_iff`
and Tau Ceti's `reesAlgebra.grade`/`mem_grade_iff` concern the ideal-power
polynomial Rees algebra. They do not supply the finite filtered module sheaf.
This run re-screened native connection/Rees names and read the pinned Kähler
subsingleton theorem used by the added check. These boundary checks are not an
exhaustive all-target library audit.

Re-opened [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5)
and [Situation 60.7.5](https://stacks.math.columbia.edu/tag/07MF) on 2026-10-10.
The crystal-to-connection construction uses the small crystalline site over a
PD scheme over Z_(p), with p locally nilpotent on X. It does not specify an
arbitrary supplied differential-site connection. Read Bhatt's
[*Prismatic F-gauges*](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
Proposition 2.2.6 and its inverse (printed p.16) and Remarks 2.2.7–2.2.8
(printed pp.16–17). The finite-projective affine specialization supports an
ordinary Rees extension by its owner; the required site and comparison
contracts remain to be specified. No source passage is reproduced.

## Input inventory and validation

All ten Hodge inputs are marked complete with accepted reviews; parent and
continuation counts overlap. No coverage entry is closed.

| Input | Nodes | Gaps | Requests | Coverage |
| --- | ---: | ---: | ---: | --- |
| Parent | 569 | 13 | 5 | H.0 partial; H.1–H.8 not_read |
| H.0 continuation | 7 | 7 | 4 | planned |
| H.1 | 36 | 11 | 18 | planned |
| H.2 | 33 | 19 | 14 | planned |
| H.3 | 43 | 5 | 23 | planned |
| H.4 | 30 | 6 | 3 | planned |
| H.5 | 73 | 13 | 16 | planned |
| H.6 | 32 | 6 | 7 | planned |
| H.7 | 31 | 7 | 12 | planned |
| H.8 | 31 | 5 | 11 | planned |

- `python3 scripts/check_blueprint.py` on the parent Hodge input and H.0
  continuation: both invocations exited 0, with zero errors and zero warnings.
  The other eight Hodge inputs and the two supplier packets were unchanged;
  their successful twelve-file validation in the preceding checkpoint is
  inherited evidence, not a new check. Structural validation does not close
  their recorded gaps.
- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  exited 0: zero errors, 1619 warnings, all `declaration uses sorry`, zero
  other warnings. The managed build uses Tau Ceti f790474 / Mathlib 082e2d3.
  The new theorem and its example add no admission. This elaboration does not
  construct the missing global carriers or compare their operators.
- The isolated native Kähler obstruction proof was checked against Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; its axiom diagnostic contained
  `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`. The initial
  local-instance style warning was corrected by using a local `let` instance.
- Scoped intake `check-files` on README, Suggested.lean and this handoff:
  three files, zero problems. `git diff --check` passed. Only these three
  files are edited. README is 194436 bytes and Suggested.lean is
  814843 bytes. No packet or metadata is changed; no Lean check is left
  running at submission.

SHA-256 receipts, relative to `research/blueprint`; inputs retain the preceding
checkpoint hashes and package artifacts reflect the additional check:

| File | SHA-256 |
| --- | --- |
| packets/HodgeStructuresPartII--H.0.json | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| packets/CrystallineCohomology--CR.0.json | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| packets/DerivedDeRhamCohomology.json | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| packages/DerivedDeRhamCohomology/README.md | `f6964c2bbec2b91f18076cb0e2e7760095bddf3b981397abc2c8e9a761a55ec5` |
| packages/HodgeStructuresPartII/README.md | `44612b0fa6bcfbfc2768dba51fbd07e397717eb3e7d3533eeb7ad6e639b4f432` |
| packages/HodgeStructuresPartII/Suggested.lean | `37dfb44091fe1b1a087f8c5b438c62d641651672feba0b390f2af3047d38efe9` |

## Resume sequence

1. Obtain owner-authorized CR.1 and DD.1 repairs satisfying the G1/G3 equations
   and witnesses above, then reconcile the consuming H.0 references.
2. Resolve the remaining continuation contracts and audit all planned targets
   against the current upstream and library, preserving the existing proofs
   and the distinctions between local coordinates and intrinsic sheaf objects.
3. Finish the package reader/signatures, repeat the managed Lean and structural
   checks, and add metadata only when the complete package meets PROTOCOL §20.

All resumption information is here and in the repository. No scratch file is
needed by the next worker.
