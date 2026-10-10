# PKG-HodgeStructuresPartII — blocked checkpoint, codex-be75t2

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-be75t2`, 10 October 2026.
[Bot claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6096206914).
Branch: `codex-be75t2-hodge-package`.
No issue in the manager's priority list was available in the open swarm
listing. This available focus package followed WORKERS.md's fallback order.
Only this job was claimed.

## Outcome: owner contracts must be repaired

**Blocked; this is a checkpoint, not a completed roadmap package.**
The exact H.0 consumer statements, hypotheses, proof steps, supplier requests,
and G1/G3 gap entries were independently read alongside the complete CR.1
connection and DD.1 filtered/Rees statements, APIs, tests, uses and proof routes.
Their contracts still do not match. H.0's accepted review explicitly retains
seven gaps and four requests and accepts a target-level planning pass, rather
than closure. The issue's assertion that the plan is complete does not supply
the missing mathematical comparisons.

Issue #7491 says: **“Change no packet; if the plan has a mistake, describe it
in the handoff note.”** Its deliverables authorize only the package artifacts
and this note. PROTOCOL §§3, 15 and 20 require exact prerequisite contracts,
a single owner for shared constructions and fidelity to the accepted plan.
Completing this package would require owner-plan changes outside that edit
set. Broadening a citation, weakening H.0 to the supplier's special case or
introducing another shared carrier in Suggested.lean would not resolve it.
This is a specification blocker, not a wait for implementation or the run's
time limit.

### Decisive comparison and repair gate

Paths below are relative to `research/blueprint/`; they identify the required
external repair and do not authorize this package worker to edit them.

| Contract | Existing statement | Required repair at its owner |
| --- | --- | --- |
| `packets/CrystallineCohomology--CR.0.json`, `CR.1/integrable-connection` | Affine differential modules are surjective quotients of Kähler differentials with a descending exterior differential. Its sheaf version is on the small crystalline site over a PD scheme, with p locally nilpotent on X. | Ordinary additive connections on a supplied commutative ringed differential site, with all exterior extensions, curvature, horizontal maps and restriction/descent. Retain the existing affine/crystalline specializations and their hypotheses. |
| `packets/DerivedDeRhamCohomology.json`, `DD.1/filtered-modules` and `rees-description` | Enhanced derived filtrations, derived graded cofibres, graded Rees equivalence and localization. | Bounded locally split ordinary finite module-sheaf filtrations and their canonical O[t]-Rees sheaf, finite local freeness, actual zero/unit/localized fibres, tensor/quotient coherence, naturality and restriction/descent. |
| `packets/HodgeStructuresPartII.json` and `packets/HodgeStructuresPartII--H.0.json` | The parent requests these stronger contracts; the continuation expressly records G1/G3 and repeats the requests. | Reconcile the supplier references after owner repair. The λ=1 comparison must preserve the actual operator, exterior extensions and curvature; the Rees comparisons must intertwine the H.0 t∇ operator. |

The parent consumer IDs are `H.0/ordinary-fiber`, `H.0/rees-parameter` and
`H.0/rees-specialization`. H.0 also requests DD.1's generic unbounded
filtered-module/graded change-of-base interfaces for the Liu–Zhu period
lattice; repairing the bounded specialization must not replace that input
with a bounded filtration.

**Connection acceptance witness.** On the one-point site take O=Q,
Ω¹=Q, Ω²=0 and d=0. The operator D(q)=q is nonzero and flat and obeys
Leibniz. Ω¹_(Q/Q)=0 cannot surject onto the supplied Ω¹. Read the existing
`NonUniversalDifferentialChecks` definitions and proofs and the pinned
`KaehlerDifferential.subsingleton_of_surjective` statement and proof. The
latter applies to the identity Q-algebra map; linearity at zero and 0≠1 give
the obstruction. These proved checks detect the supplier's generality
mismatch without defining a second ordinary-connection carrier.

**Rees acceptance gate.** The repaired owner must identify
Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside E[t,t⁻¹], with zero-fibre
[e t⁻ᵖ]↦[e] in grᵖ and unit-fibre [e t⁻ᵖ]↦e. It must prove
local freeness on finite split charts and glue the maps independently of
splittings. H.0 then constructs t∇ with dt=0 and proves operator compatibility;
that operation belongs to H.0, not to the generic Rees carrier. The inherited
change-of-frame witness below retains the required derivative term.

## Fresh upstream, library and source checks

Atlas start: `288c2793bceabf45ec2ee072a759d5db240aaca7`.
Read-only current TauCetiRoadmap:
`35abcbde930414647dad7cc22ee03e6464c7ae26`.
Read-only current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No Lake command ran in either read-only tree.

Read the full current AlgebraicVectorBundles and DifferentialGeometry
READMEs, the former's L0A–L0C boundaries and the latter's `CurvatureForm`
signature. Scheme-level polynomial operations and smooth real
bundle-valued forms do not supply the arbitrary differential-site
connection or ordinary filtered module-sheaf Rees contract. The upstream
revision has advanced since the preceding checkpoint; these inspected
interfaces still do not discharge G1/G3.

Read current Tau Ceti's `reesAlgebra.grade` and `mem_grade_iff` in
`RingTheory/ReesAlgebra/Grading.lean`. They concern the ideal-power
subalgebra of R[X], not the requested filtered module-sheaf carrier.
The name screen of current connection/Rees declarations is not an
exhaustive library-absence audit. Read the reviewed HodgeStructures L0–L3
library audit and the pinned native `HodgeStructureOn`, `HodgeStructure`
and `MixedHodgeStructure` statements. Pure/mixed Hodge linear algebra
remains an import.

Reopened [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5)
and [Situation 60.7.5](https://stacks.math.columbia.edu/tag/07MF) on 2026-10-10.
The construction gives the connection of a crystal on the small crystalline
site with its stated PD/local-nilpotence hypotheses. Read Bhatt's
[*Prismatic F-gauges*](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
Proposition 2.2.6 and its inverse on printed p.16, and Remarks 2.2.7–2.2.8
on pp.16–17. The finite-projective affine specialization is a source route
for the Rees owner repair; it does not install the general ringed-site
contract. The preceding session recorded PDF SHA-256
`a9f526ced2fc5e08e849a77ad2818689b4254129698695c9cbfbab95927cca6a`;
that download receipt is inherited, not newly computed. No source passage
was copied into the repository.

Compared the decisive node objects and input files with atlas revision
`7f169c54b`, cited by the preceding checkpoint: all six supplier/consumer
node objects are unchanged, as are the four input files in the receipt
table below. This comparison uses exact data rather than a title search.

## Validation and resumption

- All ten Hodge packets, CR.0 and the DD packet pass
  `python3 scripts/check_blueprint.py`: twelve exit-zero results, zero
  errors and warnings. This checks structure, not mathematical closure.
- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  exited 0: zero errors, 1619 warnings, all `declaration uses sorry`,
  zero other warnings. Available memory before launching was 104 GB.
  The managed build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
  and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
  No Lean check remains running. Elaboration does not establish the
  omitted global comparisons.
- Only this handoff changes. Package README and Suggested.lean are preserved;
  metadata remains absent. Intended topic on completion: `math.AG`.
- `python3 research/blueprint/intake.py check-files` on this handoff:
  one file, zero problems. `git diff --check` passed.

| File | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `f72301014a2ad3039024d53b53c22227e3e6eff0f1fc68c4bea76cae862d0c26` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `37dfb44091fe1b1a087f8c5b438c62d641651672feba0b390f2af3047d38efe9` |

Resume after CR.1/DD.1 owner repairs and H.0 reference reconciliation.
Then complete G2/G4–G7 and the all-layer target-fidelity audit preserved
below, including every omitted signature/API/test. Finally finish the
package, add metadata and repeat the managed Lean and structural checks.
No ownership move was made. No claim that H.1–H.8 have been audited is made.
All necessary continuation information is in this note and the named
repository inputs; nothing depends on disposable scratch.

The following additional G2 inventory was established by `codex-vrgljW`,
not newly checked here: current native slice restriction has
`SheafOfModules.overFunctorMonoidal`, `overFunctorBraided`,
`TauCeti.SheafOfModules.overTensorProductIso`,
`SheafOfModules.isIso_overIhomComparison`, `overIhomIso`,
`overIhomComparison_ev`, `overDualIso` and `overDualIso_hom`.
These distinguish slice restriction from arbitrary base change, stalk
comparison and global finite-locally-free dualizability. Consume their
exact statements when completing G2; they are not imports available in
the older atlas signature-checking source snapshot.

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
