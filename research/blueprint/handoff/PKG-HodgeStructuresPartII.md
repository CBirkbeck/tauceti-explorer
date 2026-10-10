# PKG-HodgeStructuresPartII — supplier-blocked checkpoint

Codex (GPT-6), session `codex-rJPRa4`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-rJPRa4-hodge-package`. Starting atlas commit: `2853efd3ace297ad7ac1bb5c4f3e31307c4b5390`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6098162214) won and the bot confirmed this session. No manager-priority issue was in the 734 available swarm issues at selection. This was the available focus package under the permitted fallback order. This session claimed one job.

## Result

**Checkpoint: the package remains incomplete.** The two earliest supplier contracts remain narrower than their H.0 consumers. The parent, H.0 continuation and both supplier packets have exactly the hashes recorded by the preceding worker. Their explicit supplier requests still stand. This is a scope blocker, not a time-limit checkpoint.

Delivered two in-scope packaging fixes:

- Added `metadata.toml` with `topic = "math.AG"`, the category appropriate to the geometric Hodge roadmap.
- Moved the existing standard non-exhaustiveness note to the beginning of `Suggested.lean`, using an ordinary block comment before the import block. All 109 imports and all declaration text are retained. No theorem, hypothesis, API or test changed.

The README is unchanged. Metadata completes one administrative file; it does not resolve any mathematical gap. The suggested file still explicitly omits 36 primary global signatures, plus their API/tests and the later-layer inventories. These omissions are not counted as typed declarations.

The issue permits editing only README, Suggested.lean, metadata and this handoff, and explicitly prohibits packet changes. PROTOCOL §§3, 13, 15 and 20 require exact prerequisites and single ownership. Completing the package would require extending and reconciling supplier plans beyond those four paths. Rebuilding supplier objects inside this package or narrowing H.0 would change the accepted scope. No packet or review verdict was altered.

## First resume boundary: ordinary connections

Consumers: `HodgeStructuresPartII:H.0/intrinsic-preconnection` and `HodgeStructuresPartII:H.0/ordinary-fiber`. H.0's continuation requests an ordinary connection category on any supplied commutative ringed differential site. Its calculus has exterior powers, a restriction-compatible differential and wedge, square-zero differential and graded Leibniz. Module sheaves are finite locally free with locally constant rank. At parameter one the comparison must retain the section operator, horizontal maps, restriction and curvature.

The current `CrystallineCohomology:CR.1/integrable-connection` instead assumes a surjection from Kähler differentials in its ring clause. Its sheaf clause concerns a crystalline site over a PD base. Neither clause supplies the requested general-site contract. Read the [supplier node](../packets/CrystallineCohomology--CR.0.json), [H.0 request](../packets/HodgeStructuresPartII--H.0.json) and the [parent definitions](../packets/HodgeStructuresPartII.json) before editing the package.

Fresh primary-source reading: Stacks, [Remark 60.6.8, tag 07I0](https://stacks.math.columbia.edu/tag/07I0), including its balancing calculation; and [§60.15, Lemma 60.15.1, tag 07J5](https://stacks.math.columbia.edu/tag/07J5), including the crystal-to-connection proof, accessed 2026-10-10. The former uses a differential quotient; the latter uses crystalline thickenings. Their hypotheses confirm the narrower supplier boundary.

The existing `NonUniversalDifferentialChecks` separate the contracts: on a one-point site take O=Q, Ω¹=Qω, higher exterior degrees zero, and zero scalar/exterior differential. D(q)=qω is nonzero, obeys the ordinary Leibniz equation and is flat; Ω¹_(Q/Q)=0 cannot surject onto Qω. Read pinned Mathlib `KaehlerDifferential.subsingleton_of_surjective`, `Mathlib/RingTheory/Kaehler/Basic.lean`, line 247. This test is retained, not expanded to a fictitious global carrier.

**Required owner export:** CR.1 supplies the additive sheaf connection, exact section Leibniz equation, exterior extension, curvature, horizontal O-linear maps, restriction/gluing, and the identity-on-operators comparison at parameter one for this calculus. Keep PD and quasi-nilpotence assumptions on crystal comparisons. Reconcile H.0's request to the actual exported node before replacing `LambdaBundle.oneEquivConnection`'s omission.

For routing, the existing CR.0 planning/revision issues are [#704](https://github.com/CBirkbeck/tauceti-explorer/issues/704) and [#6951](https://github.com/CBirkbeck/tauceti-explorer/issues/6951); their independent reviews [#379](https://github.com/CBirkbeck/tauceti-explorer/issues/379) and [#7038](https://github.com/CBirkbeck/tauceti-explorer/issues/7038) are done. These identify the owner lane; this session did not claim or modify any of them.

## Second resume boundary: ordinary finite Rees sheaves

Consumers: `HodgeStructuresPartII:H.0/rees-parameter` and `HodgeStructuresPartII:H.0/rees-specialization`, also the bounded filtration used in `griffiths-filtration`. H.0 consumes the carrier and fibre maps from DD.1 and constructs the induced parameter operator.

Current DD.1 defines coherent diagrams in an enhanced derived category and a graded derived Rees equivalence with cofibres and localization. It does not state the requested finite ordinary module-sheaf carrier, the three actual fibre maps, or their restriction/descent and operator comparisons. The [DD packet](../packets/DerivedDeRhamCohomology.json) and [DD package](../packages/DerivedDeRhamCohomology/README.md), §§1.12–1.14, retain that boundary; its suggested file inventories `filteredModules` and `reesDescription` without typed interfaces for them.

Fresh primary-source reading: Bhargav Bhatt, [Prismatic F-gauges, Fall 2022 notes](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf), §2.2.1, Proposition 2.2.6 and inverse construction, printed p.16; Remark 2.2.8, printed p.17, accessed 2026-10-10. The proposition supplies the Rees weight sign and derived monoidal comparison. The remark identifies its vector-bundle specialization with genuine finite filtrations of finite projective modules whose graded pieces are finite projective. The ordinary finite sheaf export and operator compatibility still require explicit statements. No reading of the whole notes is claimed.

**Required owner export:** DD.1 supplies the intrinsic ordinary lattice Σ_p F^pE·t⁻ᵖ inside E[t,t⁻¹] for a bounded locally split subbundle filtration, independently of a chosen splitting. It supplies locally free split charts, restriction/descent, filtered-map and tensor naturality, and the actual maps

- Rees/(t) ≃ ⊕_p gr^pE, carrying e t⁻ᵖ to its graded class;
- Rees/(t−1) ≃ E, carrying e t⁻ᵖ to e;
- Rees[t⁻¹] ≃ E[t,t⁻¹], via the lattice embedding.

H.0 then specifies compatibility with t∇, with relative dt=0: the zero fibre gives gr_F∇, the fibre at one gives ∇, and dividing by t after localization gives ∇. Keep the separate unbounded period-lattice request and its Tate/Galois comparisons. Preserve `ReesFiberChecks` and `SplitReesChecks`; polynomial quotient and filtered-shear tests do not themselves construct sheaf descent.

The owner planning issues are [#708](https://github.com/CBirkbeck/tauceti-explorer/issues/708) and [#6954](https://github.com/CBirkbeck/tauceti-explorer/issues/6954); package [#7465](https://github.com/CBirkbeck/tauceti-explorer/issues/7465) and review [#7511](https://github.com/CBirkbeck/tauceti-explorer/issues/7511) are done. H.0 still needs its requested ordinary export, irrespective of those completed jobs. This session made no external owner changes.

## Library boundary and validation

Read the current AlgebraicVectorBundles README and the atlas snapshot of upstream HodgeStructures README in full. Read the four parent Hodge audit entries: L0/L1/L3 built, L2 partly built. There is no direct Part II entry resolving these two contracts. Read current native `HodgeStructureOn` and `PeriodDomain.Point`; the package imports their fibrewise objects. The snapshot is not presented as current upstream inventory.

The read-only current roadmap checkout is `670582c502e1d4497d9ccd492b36c67028ef6666`, and current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked current AlgebraicVectorBundles and DifferentialGeometry signatures near the coefficient/connection boundary. `CurvatureForm` uses smooth real manifolds and topological vector-bundle fibres. Current `reesAlgebra.grade` and `mem_grade_iff`, `TauCeti/RingTheory/ReesAlgebra/Grading.lean`, lines 57 and 63, concern powers of an ideal in a polynomial algebra. These are different from the requested arbitrary differential-site category and ordinary filtered module-sheaf Rees lattice. This is a targeted screen, not an exhaustive absence claim. No Lake command ran in either current tree.

`python3 scripts/check_blueprint.py` passed on all ten Hodge packets and the CR.0/DD supplier packets with **zero errors and zero warnings**. Structural validation does not close the explicit gaps or requests.

`lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean` finished with exit 0: **zero errors, 1619 declaration-uses-sorry warnings and no other warnings**. Available memory before launch was 99 GB. The managed driver advertises Tau Ceti `f790474` with Mathlib `082e2d3`; the actual Mathlib source commit was read as `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti build directory is not a Git checkout, so this session did not independently read its source identity from Git. Current read-only source inspection above is distinguished from pinned elaboration. Elaboration validates the present signatures; it does not fill the explicit omissions.

An exact text comparison verifies that the only suggested-file edit relocates and changes the comment kind of the existing opening note. The declaration/import text is unchanged. Metadata parses as TOML. `python3 research/blueprint/intake.py check-files` passed for the three changed deliverables: **3 files, 0 problems**. `git diff --check` passed. No Lean check remains running.

## Concrete omission index

These are the 36 primary names literally marked `signature omitted` in the package. They remain explicit specifications rather than Lean declarations. Later-layer inventories and H.0 continuation contracts also remain to be reconciled; this table is not a whole-package completeness audit.

| Planning node | Required global signature |
| --- | --- |
| `HodgeStructuresPartII:H.0/intrinsic-preconnection` | `Preconnection` |
| `HodgeStructuresPartII:H.0/extension-balancing` | `Preconnection.extension_balanced` |
| `HodgeStructuresPartII:H.0/exterior-extension` | `Preconnection.extend` |
| `HodgeStructuresPartII:H.0/intrinsic-curvature` | `Preconnection.curvature` |
| `HodgeStructuresPartII:H.0/curvature-linearity` | `Preconnection.curvature_linear` |
| `HodgeStructuresPartII:H.0/flat-extension-square` | `Preconnection.extend_sq` |
| `HodgeStructuresPartII:key/higgs-parameter-connections` | `LambdaBundle` |
| `HodgeStructuresPartII:H.0/connection-morphism` | `LambdaBundle.Hom` |
| `HodgeStructuresPartII:H.0/unit-connection` | `LambdaBundle.unit` |
| `HodgeStructuresPartII:H.0/zero-fiber` | `LambdaBundle.zeroEquivHiggs` |
| `HodgeStructuresPartII:H.0/ordinary-fiber` | `LambdaBundle.oneEquivConnection` |
| `HodgeStructuresPartII:H.0/tensor-balancing` | `LambdaBundle.tensor_balanced` |
| `HodgeStructuresPartII:H.0/intrinsic-tensor` | `LambdaBundle.tensor` |
| `HodgeStructuresPartII:H.0/tensor-curvature` | `Preconnection.tensor_curvature` |
| `HodgeStructuresPartII:H.0/intrinsic-dual` | `LambdaBundle.dual` |
| `HodgeStructuresPartII:H.0/dual-curvature` | `Preconnection.dual_curvature` |
| `HodgeStructuresPartII:H.0/intrinsic-pullback` | `LambdaBundle.pullback` |
| `HodgeStructuresPartII:H.0/local-descent` | `LambdaBundle.descent` |
| `HodgeStructuresPartII:H.0/coordinate-comparison` | `LambdaBundle.affineCoordinateEquiv` |
| `HodgeStructuresPartII:H.0/intrinsic-rescale` | `LambdaBundle.rescale` |
| `HodgeStructuresPartII:H.0/twisted-higgs` | `TwistedHiggsBundle` |
| `HodgeStructuresPartII:H.0/higgs-commuting` | `TwistedHiggsBundle.coordinate_integrability` |
| `HodgeStructuresPartII:H.0/symmetric-action` | `TwistedHiggsBundle.symmetricAction` |
| `HodgeStructuresPartII:H.0/ordered-iterate` | `TwistedHiggsBundle.iterate` |
| `HodgeStructuresPartII:H.0/nilpotence-filtration` | `TwistedHiggsBundle.NilpotenceFiltration` |
| `HodgeStructuresPartII:H.0/nilpotence-equivalence` | `TwistedHiggsBundle.nilpotence_iff_filtration` |
| `HodgeStructuresPartII:H.0/tensor-nilpotence` | `TwistedHiggsBundle.tensor_nilpotence_bound` |
| `HodgeStructuresPartII:H.0/dual-nilpotence` | `TwistedHiggsBundle.dual_nilpotence_bound` |
| `HodgeStructuresPartII:H.0/pullback-nilpotence` | `TwistedHiggsBundle.pullback_nilpotence_bound` |
| `HodgeStructuresPartII:H.0/reduced-line-nilpotence` | `TwistedHiggsBundle.nilpotent_line_eq_zero` |
| `HodgeStructuresPartII:H.0/griffiths-filtration` | `GriffithsFiltration` |
| `HodgeStructuresPartII:H.0/graded-higgs` | `GriffithsFiltration.gradedHiggs` |
| `HodgeStructuresPartII:H.0/graded-higgs-integrable` | `GriffithsFiltration.gradedHiggs_integrable` |
| `HodgeStructuresPartII:H.0/rees-parameter` | `GriffithsFiltration.reesConnection` |
| `HodgeStructuresPartII:H.0/rees-specialization` | `GriffithsFiltration.reesSpecialization` |
| `HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence` | `TwistedHiggsBundle.nilpotence_iff_augmentation_power` |

## Exact inputs and continuation

Paths below are relative to `research/blueprint/`. The README is 199999 bytes. The four planning/supplier input hashes and README hash match the preceding checkpoint.

| File | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `ecf6bef6cda54dbba50c7f0ffda3dce1a50acf08b634629f4147533a516fd0c4` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `778f52349358e94c6e8de9d4b1f1611865d32fcdf03fbdb00f10cf9d22eec8e4` |

After the owner exports change, start with the two boundaries above, then reconcile the other H.0 interfaces and H.1–H.8 dependencies. Do not remove the omission lists merely to make the file appear complete. Preserve locally varying rank, determinant connection, uniform ordered nilpotence, kernel/image caveats, finite versus unbounded filtrations, fixed-K compact comparisons, analytic-image hypotheses and the corrected H.7 assertions.

The [assembly handoff](ASM-HodgeStructuresPartII.md) preserves the 885-declaration inventory and remaining cross-part contracts. The [preceding checkpoint at the starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/2853efd3ace297ad7ac1bb5c4f3e31307c4b5390/research/blueprint/handoff/PKG-HodgeStructuresPartII.md) preserves earlier source checks, owner formulas and links to the earlier chart work. No scratch artifact is needed to resume. No private book or source passage was copied. The managed Lean process has exited; scratch holds only transient logs and is removed after opening the PR. Stop after this issue, without a second claim.
