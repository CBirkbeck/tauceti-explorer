# PKG-HodgeStructuresPartII — blocked supplier checkpoint

Codex (GPT-6), session `codex-EKc511`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-EKc511-hodge-package`.
[Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097515388).
Starting explorer commit: `9ee2eae115ed01bbcafc097221007c2be6760144`.
None of the manager's priority issues appeared among the 741 available swarm
issues. The WORKERS fallback selected the focus package before ordinary
reviews and planning. This session held only #7491.

## Outcome and required owner action

**Blocked checkpoint; the package remains incomplete.** This run independently
read the three H.0 consumer contracts and the corresponding CR.1/DD.1 supplier
statements, hypotheses and proof routes. Both decisive supplier files are
unchanged from the preceding checkpoint. It also checked the existing DD.1
package: its README specifies the derived filtration/Rees interface, and its
Suggested.lean explicitly omits `filteredModules` and `reesDescription`.
That package therefore does not provide a previously overlooked ordinary
finite Rees sheaf or a typed replacement import.

Issue #7491 says: “Change no packet; if the plan has a mistake, describe it in
the handoff note.” The allowed edits are the three package files and this
handoff. PROTOCOL §§3, 13, 15 and 20 require exact suppliers, honest signatures
and one owner per construction. Supplying the missing ordinary connection and
Rees contracts at their named owners, or assigning them to a different owner
and changing the H.0 imports, requires work outside this issue's boundary.
The checkpoint changes only this note. It does not add metadata or represent
an elaborating partial prototype as a complete package.

**Maintainer action:** route the following repairs to CR.1 and DD.1, reconcile
H.0's requests with the repaired owner nodes, then resume this package. The
owner planning files are `packets/CrystallineCohomology--CR.0.json` and
`packets/DerivedDeRhamCohomology.json`; DD.1's package also needs the resulting
interface. Do not schedule another unchanged package-only continuation as a
way of discharging these owner obligations. Closing these two imports is
necessary but does not discharge all the later layers' recorded gaps.

## Exact mismatches and repair acceptance

All paths below are relative to `research/blueprint/`.

1. **Ordinary connections (G1).** The consumer
   `HodgeStructuresPartII:H.0/ordinary-fiber` identifies its unit-parameter
   category with CR.1 connections on the same arbitrary supplied differential
   site. Its proof expressly imports that equivalence.
   `CrystallineCohomology:CR.1/integrable-connection` instead requires, affinely,
   a surjection from Kähler differentials, and its sheaf version is on the
   small crystalline site with a PD base. The source
   [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5)
   was freshly read: its connection and crystal construction retain that
   crystalline setting. It does not state the arbitrary-site interface.

   CR.1 must export an additive sheaf operator D:E→E⊗Ω¹ with
   D(fs)=fD(s)+s⊗df, its extensions
   D(s⊗ω)=D(s)∧ω+s⊗dω, curvature D₁D₀, and horizontal O-linear maps
   D_F f=(f⊗1)D_E. Include restriction, gluing and the identity-on-operators
   comparison with H.0 at λ=1. Keep locally varying rank; crystal comparison
   hypotheses are attached only to crystal comparisons.

   The existing `NonUniversalDifferentialChecks` was reread, including its
   five examples and `no_kaehler_quotient`. On a one-point site O=Q,
   Ω¹=Qω, Ω²=0 and d=0, D(q)=qω is flat and nonzero. But Ω¹_(Q/Q)=0
   cannot surject onto Qω. The pinned statement
   `KaehlerDifferential.subsingleton_of_surjective` was read directly in
   Mathlib. This separates the consumer's hypotheses from the supplier's;
   an affine change of notation cannot extend the supplier's scope.

2. **Ordinary finite Rees sheaves (G3).** The consumers
   `HodgeStructuresPartII:H.0/rees-parameter` and `H.0/rees-specialization`
   import the canonical ordinary Rees lattice and its actual sheaf fibre
   maps. `DerivedDeRhamCohomology:DD.1/filtered-modules` and
   `DD.1/rees-description` specify enhanced derived filtrations, graded
   cofibres and derived specialization. They do not specify the ordinary
   bounded locally split filtration carrier or its comparison and descent
   maps. DD.1's current package, under “Coherent filtered modules” and “The
   Rees description of filtered modules,” retains precisely this scope;
   its two corresponding declarations remain comments marked OMITTED.

   DD.1 must supply Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside E[t,t⁻¹] for a bounded
   locally split finite module-sheaf filtration. On a finite split chart
   this is ⊕_p G_p[t]·t⁻ᵖ. Export splitting-independent, restriction-compatible
   maps Rees/(t)≃⊕_p grᵖ_F E, Rees/(t−1)≃E and
   Rees[t⁻¹]≃E[t,t⁻¹], finite local freeness, filtered-map naturality and
   convolution-tensor/quotient comparisons. The first map sends e t⁻ᵖ
   to the graded class of e; the second sends it to e. H.0 owns t∇,
   relative dt=0, and the operator comparisons; the generic Rees carrier
   has no connection field.

   Preserve the existing split-chart/frame-change controls. A rank-one
   filtration with F¹E=E and F²E=0 gives E[t]t⁻¹, with nonzero zero fibre
   in grade one. Taking that fibre on E[t,t⁻¹] instead gives zero because
   t is invertible. This acceptance calculation does not supply the
   missing canonical sheaf carrier or the three comparison maps.

## Restart order and preserved work

The preceding complete G1–G7 contracts, source-reading history, tested affine
operators and later-layer controls remain in
[this immutable handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/9ee2eae115ed01bbcafc097221007c2be6760144/research/blueprint/handoff/PKG-HodgeStructuresPartII.md).
Its historical readings are not new verification by this session. No deleted
scratch file is needed to use it.

After the owner repairs and H.0 import reconciliation:

1. Add the 36 omitted global parent interfaces and their API/tests against
   actual carriers. Reconcile the H.0 continuation's seven targets.
2. G2: finish native sheaf tensors, duals, powers, operator comparisons,
   gluing and coherent pullback. Global sections do not commute with tensor
   without additional hypotheses.
3. G4: retain locally varying rank and specified determinant connections,
   determinant gauge transport and the nonflat exterior-power comparisons.
4. G5: preserve the unbounded localized Liu–Zhu filtration,
   tⁱFilʲ=Filⁱ⁺ʲ, and the actual residue/Tate/Galois/curvature adapters.
   A bounded Rees replacement does not provide this period interface.
5. G6: local bounds glue to a global exponent only with a uniform bound;
   a finite subcover supplies a maximum. Kernels need not be subbundles,
   and nonflat change of base need not preserve images.
6. G7: build the coherent spectral image and coefficient section under
   Heuer's analytic finiteness hypotheses. Leave the p-adic spectral/Picard
   correspondence with its owner.
7. Reconcile every H.1–H.8 definition, theorem, API and test with the assembled
   file. Preserve honest omissions until the actual signatures can be stated;
   do not restore unrestricted H.7 assertions removed in earlier work.

The following is a fresh metadata inventory, not a source audit of H.1–H.8.
Accepted target-level passes still contain explicit gaps and supplier requests.

| Packet suffix | Nodes | Gaps | Requests | Coverage |
| --- | ---: | ---: | ---: | --- |
| Parent | 569 | 13 | 5 | H.0 partial; H.1–H.8 not_read |
| --H.0 | 7 | 7 | 4 | H.0 planned |
| --H.1 | 36 | 11 | 18 | H.1 planned |
| --H.2 | 33 | 19 | 14 | H.2 planned |
| --H.3 | 43 | 5 | 23 | H.3 planned |
| --H.4 | 30 | 6 | 3 | H.4 planned |
| --H.5 | 73 | 13 | 16 | H.5 planned |
| --H.6 | 32 | 6 | 7 | H.6 planned |
| --H.7 | 31 | 7 | 12 | H.7 planned |
| --H.8 | 31 | 5 | 11 | H.8 planned |

## Current upstream and library screen

Read-only roadmap environment commit:
`e255659f8eb50cd472809d9d565c8f755acffd84`.
Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read AlgebraicVectorBundles and Completed/HodgeStructures READMEs in full.
The former owns scheme-bundle tensor, dual and polynomial operations in
L0A–L0C; the latter owns fibrewise Hodge linear algebra and places geometric
variations in a successor. Read DifferentialGeometry's curvature carrier:
it is a smooth real bundle-valued two-form, rather than an ordinary connection
on an arbitrary ringed differential site.

Read current Tau Ceti's ReesAlgebra/Grading source: `reesAlgebra.mem_grade_iff`
identifies ideal-power monomials in a Rees algebra. This is not an ordinary
filtered module sheaf with all three fibre comparisons. Targeted name searches
for ordinary/integrable connections and Rees modules in current library and
roadmap trees found no matching export; this is not an exhaustive absence audit.
The reviewed library audit has four HodgeStructures entries: three built,
L2 partly built, with no direct HodgeStructuresPartII/CR.1/DD.1 entry.
No read-only tree was modified or used to run Lake.

## Validation and fingerprints

All ten Hodge packets and both decisive supplier packets passed
`python3 scripts/check_blueprint.py`: twelve exit-zero results, each with
zero errors and warnings. This validates structure, not mathematical closure.

`lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
finished with exit 0, zero errors, 1,619 `declaration uses sorry` warnings and
no other warnings. Available memory before launch was 104 GB. The managed
build pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and records
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only
library screen above is separate from this elaboration baseline.
No process from this run remains.

The README remains 199933 bytes. Suggested.lean remains 819395 bytes,
with one block of 108 imports and the standard non-exhaustive header.
There are 699 lines beginning `example`; the previous handoff's 698 count
was inaccurate. This is a textual inventory, not a new test-coverage claim.
Metadata remains absent; the intended final category is `math.AG`.

| File relative to `research/blueprint/` | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/DerivedDeRhamCohomology/README.md` | `f6964c2bbec2b91f18076cb0e2e7760095bddf3b981397abc2c8e9a761a55ec5` |
| `packages/DerivedDeRhamCohomology/Suggested.lean` | `79cb5aa524974aa61302617457494ae9280531fe7ad9160e1d2f8b4fb29b4228` |
| `packages/HodgeStructuresPartII/README.md` | `ad226b4c2b8e7a9e1d1dcf487e207b89226df9fd68a5ff7991f859df97f2c585` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `443e09fc05317a7749fa850b1bfe5535b659b7335d5c92db43928f918cc58493` |

Only the handoff changes in this checkpoint. All package/supplier fingerprints
above match the checkout before this run's edits. No source passage, ownership
move, implementation or complete H.1–H.8 certification is claimed.

Scoped `research/blueprint/intake.py check-files` passed (one file, zero
problems), and `git diff --check` passed.
