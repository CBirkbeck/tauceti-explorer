# PKG-HodgeStructuresPartII — blocked checkpoint and Rees repair source

Codex (GPT-6), session `codex-VEetE7`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-VEetE7-hodge-package`.
[Winning claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097654010).
Starting explorer commit: `5cdfc20ff`.
None of the manager's priority issues appeared among the 739 available swarm issues.
WORKERS selected a focus package before ordinary reviews and planning. This session held only #7491.

## Outcome

**Blocked checkpoint; the package remains incomplete.** This run independently
compared H.0's ordinary-connection and Rees consumer statements with the exact
CR.1/DD.1 supplier nodes, their hypotheses and proof routes, and DD.1's existing
package. The decisive inputs are unchanged from the previous checkpoint.

There is a concrete new repair input: **Bhatt, Prismatic F-gauges, Remark 2.2.8,
printed p. 17**, states the ordinary finite-projective specialization of the
Rees equivalence. It can ground the missing ordinary DD.1 contract; a new source
search is unnecessary. The precise reading and construction route are below.
This supplies mathematical evidence for an owner repair, not a new sheaf carrier
or an assertion that the current supplier already exports one.

Issue #7491 permits only the three package files and this handoff, and expressly
forbids packet changes. PROTOCOL §§3, 13, 15 and 20 require exact suppliers, honest
signatures and one owner per construction. CR.1 needs its generality extended;
DD.1 needs the ordinary specialization and descent comparisons made explicit;
H.0 needs its requests reconciled with those exports. All three changes require
files outside this package job. Completing these ownership repairs within the
package would contradict its accepted import boundary.

The submission changes this handoff only. The package README and Suggested.lean
are preserved, and metadata is still absent. The intended eventual category is
`math.AG`. An elaborating file with omitted targets does not complete the
package. No H.1–H.8 mathematical closure or whole-source audit is claimed.

## Gate 1: ordinary connections on the supplied differential site

Consumer: `HodgeStructuresPartII:H.0/ordinary-fiber` in
[the parent packet](../packets/HodgeStructuresPartII.json). Its parameter-one
category is required to be the CR.1 ordinary integrable connection category on
an arbitrary commutative ringed differential site with specified exterior
calculus. It must preserve the actual section operator, restriction, horizontal
maps and exterior curvature convention.

Supplier: `CrystallineCohomology:CR.1/integrable-connection` in
[the CR.0–CR.6 packet](../packets/CrystallineCohomology--CR.0.json). Its affine
hypotheses require a surjection from Kähler differentials onto the supplied
one-form module, with descending exterior differential. Its sheaf statement
is on the small crystalline site with a PD base. Neither clause provides the
arbitrary supplied-calculus category requested by H.0.

Freshly read [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5),
including its proof: the connection of a crystal retains the crystalline-site
and PD-differential context. Its functorial construction is evidence for that
scope; it does not state a general supplied-calculus interface.

The existing `NonUniversalDifferentialChecks` in the package was reread, not
rewritten. On a one-point site with O=Q, Ω¹=Qω, Ω²=0 and all differential maps
zero, D(q)=qω is nonzero, flat and satisfies the ordinary Leibniz equation.
But Ω¹_(Q/Q)=0 cannot surject onto Qω. The pinned Mathlib statement
`KaehlerDifferential.subsingleton_of_surjective` in
`Mathlib/RingTheory/Kaehler/Basic.lean` was read directly: a surjective algebra
map makes its Kähler differential module subsingleton. Thus the mismatch is
in the hypotheses, rather than notation or a missing affine identification.
The package already contains a proof of the no-surjection check without sorry.

**Required owner repair.** CR.1 must export the ordinary sheaf carrier for the
specified calculus: additive D:E→E⊗Ω¹, D(fs)=fD(s)+s⊗df; its extensions
D(s⊗ω)=D(s)∧ω+s⊗dω; curvature D₁D₀; and O-linear maps f satisfying
D_F f=(f⊗1)D_E. Include restriction/gluing and the identity-on-operators
comparison at λ=1. Rank remains locally constant. Quasi-nilpotence, PD and lift
conditions apply to crystal comparisons, not to the ordinary carrier.
Reconcile H.0's existing CR.1 request after that export is available.

## Gate 2: ordinary finite Rees objects — exact available repair source

Consumers: `HodgeStructuresPartII:H.0/rees-parameter` and
`HodgeStructuresPartII:H.0/rees-specialization` in the parent packet. They
explicitly import the generic ordinary Rees sheaf and its fibre maps from DD.1;
H.0 owns the induced relative operator t∇ and its operator comparisons.

Suppliers: `DerivedDeRhamCohomology:DD.1/filtered-modules` and
`DerivedDeRhamCohomology:DD.1/rees-description` in
[the DD packet](../packets/DerivedDeRhamCohomology.json). These specify enhanced
filtered diagrams, graded cofibres and derived specialization. The current
[DD package README](../packages/DerivedDeRhamCohomology/README.md), §§1.12–1.14,
retains that scope; its Suggested.lean lists `filteredModules` and
`reesDescription` as constructions without representative signatures. Reading
this package supplied no ordinary finite module-sheaf export or replacement
import for H.0.

### Fresh source reading

Bhargav Bhatt, [Prismatic F-gauges](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
MAT 549, Fall 2022 lecture notes; accessed 2026-10-10.
SHA-256: `a9f526ced2fc5e08e849a77ad2818689b4254129698695c9cbfbab95927cca6a`.
The downloaded bytes match the supplier's recorded source. Personally read
§2.2.1, Constructions 2.2.1–2.2.5, Proposition 2.2.6 and its printed inverse
construction, and Remarks 2.2.7–2.2.8, printed pp. 13–17. This is a selected
source reading, not a reading of the entire lecture notes or their references.

**Source match.** Remark 2.2.8 identifies vector bundles on A¹/G_m with finite
projective modules equipped with finite decreasing submodule filtrations whose
graded pieces are finite projective. Proposition 2.2.6 supplies the Rees
comparison, standard t-exactness, underlying-object restriction and graded
specialization with reversed weight. This is an explicit ordinary finite
specialization in DD.1's own source. The requested arbitrary-site descent and
operator transport still need their named contracts.

### Construction route for the owning roadmap

Use the existing DD.1 Rees construction and its standard t-exactness; restrict
to the finite-projective objects of Remark 2.2.8. Do not require H.0's ordinary
finite filtration to satisfy a new derived-completion hypothesis. On a chart
with E=⊕_p G_p and F^pE=⊕_(q≥p)G_q, identify the actual filtration-defined
lattice

Rees_F(E)=Σ_p F^pE·t^(−p) ⊂ E[t,t⁻¹]

with ⊕_p G_p[t]·t^(−p). This gives its finite local freeness and the ordinary
fibre calculations. The construction is determined by F, not by a chosen
splitting; compare it with DD.1's enhanced object rather than define an
unrelated second Rees object. Use E1's actual restriction/tensor/quotient
comparisons to descend the carrier and the maps. The local calculation alone
is not an arbitrary-site descent theorem.

**Required exported maps.** Rees/(t)≃⊕_p gr^p_F E sends e t^(−p) to the graded
class of e; Rees/(t−1)≃E sends it to e; and Rees[t⁻¹]≃E[t,t⁻¹] is induced by
the canonical lattice embedding. Require restriction compatibility,
filtered-map naturality and convolution-tensor/quotient comparisons. Under
these maps H.0 then proves that t∇ has relative dt=0, zero fibre gr_F∇,
one fibre ∇, and localized rescaling t⁻¹D=∇.

**Repair acceptance controls.** A rank-one filtration F¹E=E, F²E=0 produces
E[t]t⁻¹ and a nonzero zero fibre in grade one. Taking the zero fibre of
E[t,t⁻¹] instead gives zero, since t is a unit there. For a split two-step
filtration, the fibre map keeps each generator in its own graded piece;
a filtration-preserving change of splitting must give the same intrinsic map.
These tests distinguish the actual lattice and canonical specializations
from an arbitrary free polynomial module with an assigned grading.

## Current upstream and library boundary

Read-only roadmap environment: `e255659f8eb50cd472809d9d565c8f755acffd84`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read AlgebraicVectorBundles and Completed/HodgeStructures READMEs in full and
inspected their relevant Suggested.lean interfaces. The former owns scheme
bundle tensor, dual and polynomial operations in L0A–L0C. The latter's completed
L0–L3 supplies fibrewise Hodge linear algebra and reserves geometric variations
for its successor. Neither supplies the two missing contracts above.

Read DifferentialGeometry's `CurvatureForm` in its Suggested.lean: it is a
smooth real bundle-valued two-form carrier, under manifold and topological
bundle assumptions. It does not replace CR.1's arbitrary ringed-site carrier.
Read current Tau Ceti's `reesAlgebra.grade` and `mem_grade_iff` in
`TauCeti/RingTheory/ReesAlgebra/Grading.lean`: their graded object is an ideal-power
Rees algebra, not the filtered module sheaf with all three comparisons above.
Targeted Lean-name searches for `IntegrableConnection`, `OrdinaryConnection`,
`ReesModule`, `filteredModules` and `reesDescription` in the current library and
roadmap trees found no matching export. This is a targeted screen, not an
exhaustive absence proof. No Lake command ran in either read-only tree.

The reviewed `data/library-coverage.json` has four HodgeStructures entries:
L0/L1/L3 built and L2 partly built. It has no direct HodgeStructuresPartII,
CR.1 or DD.1 entry supplying these interfaces. These audit entries were read
before checking the current source boundary.

## Restart and preserved work

The [preceding handoff at this run's starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/5cdfc20ff/research/blueprint/handoff/PKG-HodgeStructuresPartII.md)
retains the G1–G7 contracts, earlier reading receipts, package measurements and
fingerprints, and links to the older full continuation note. Historical
receipts are not new source checks by this session.
[The assembly handoff](ASM-HodgeStructuresPartII.md) preserves all 885 unique
declarations and the cross-layer/supplier reconciliation. No deleted scratch
file is needed to resume.

1. Route the CR.1 ordinary-calculus extension and DD.1 finite Rees
   specialization/descent to their owners; use the exact Bhatt source above.
2. Reconcile H.0's requests with those exported owner nodes. This is a packet
   change outside #7491's allowed files.
3. Resume the package's 36 omitted global parent interfaces and the seven H.0
   continuation targets against those real carriers.
4. Preserve G2's native sheaf tensor/descent requirements; G4's locally varying
   determinant rank and specified determinant connection; G5's unbounded
   localized period filtration and Tate/Galois adapters; G6's uniform
   nilpotence-bound and kernel/image caveats; and G7's coherent analytic
   spectral-image hypotheses. Repairing gates 1–2 does not settle these.
5. Reconcile all H.1–H.8 targets, APIs and tests. Do not restore unrestricted
   H.7 assertions removed by the earlier work. Add metadata only as part of a
   complete package submission.

**Maintainer routing is required before another package-only continuation can
finish this job.** The appropriate files are the CR.0–CR.6 and DD packets,
DD.1's package, and H.0's request register. No second issue was claimed and
no issue labels were changed by this worker.

## Validation

All ten Hodge packets and both decisive supplier packets passed
`python3 scripts/check_blueprint.py`: twelve exit-zero results, each with
zero errors and zero warnings. This verifies file structure, not closure.
The parent retains 13 gaps/5 requests; H.0–H.8 retain respectively
7/11/19/5/6/13/6/7/5 gaps and 4/18/14/23/3/16/7/12/11 requests.

`lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
finished with exit 0: zero errors, 1,619 `declaration uses sorry` warnings and
no other warnings. Available memory before launch was 100 GB. The managed
build pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and records
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only
source screen is separate from this elaboration baseline. Both the check
runner and the single Lean invocation have finished; this run leaves no
background process.

Scoped `research/blueprint/intake.py check-files` passed for the one changed
handoff file, and `git diff --check` passed. No source file or extracted text
is submitted. The scratch directory is removed after opening the pull request;
all continuation information is in this note and its permanent links.

The following unchanged fingerprints identify the exact blocker and package
inputs independently checked this run. All paths are relative to
`research/blueprint/`.

| File | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `ad226b4c2b8e7a9e1d1dcf487e207b89226df9fd68a5ff7991f859df97f2c585` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `443e09fc05317a7749fa850b1bfe5535b659b7335d5c92db43928f918cc58493` |
