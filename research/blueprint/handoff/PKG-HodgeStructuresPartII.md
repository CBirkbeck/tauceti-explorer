# PKG-HodgeStructuresPartII — blocked supplier checkpoint

Codex (GPT-6), session `codex-0i0vPL`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-0i0vPL-hodge-package`. Starting atlas commit: `cd3293a62`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6098018141) won; the bot explicitly confirmed this session. None of the manager's priority issues appeared in the 735 available swarm issues at selection. This was the eligible focus package after excluding the top fix review and assembly under this run's fallback restrictions. This session claimed only #7491.

## Result and scope

**Blocked checkpoint. The roadmap package is incomplete.** This session independently checked the two earliest supplier boundaries against the parent plan, H.0 continuation requests, CR.1 and DD.1 statements, DD's package, primary sources and current read-only upstream trees. Both boundaries still require changes outside this job's four permitted deliverable paths. No packet, source-reading claim or review verdict was changed.

This submission updates only this handoff. The existing package README and Suggested.lean remain byte-for-byte unchanged; metadata remains absent. The issue explicitly forbids packet changes. PROTOCOL §§3, 13, 15 and 20 require faithful statements and exact prerequisites with one owner. Defining the missing supplier objects inside this package, weakening H.0 to fit the suppliers, or marking omitted targets complete would violate those rules. A successful Lean run checks the signatures that are present; it does not supply the missing signatures.

The immediate maintainer action is to route the two owner repairs below and reconcile H.0's requests after those exports exist. Keep this package out of a completion queue until that prerequisite change occurs. This session neither changes labels nor claims the owner jobs. Repeating the present package job against the same input statements cannot resolve this scope restriction.

## Gate A: ordinary connections on supplied differential sites

Consumers in [the parent packet](../packets/HodgeStructuresPartII.json): `HodgeStructuresPartII:H.0/ordinary-fiber` and the intrinsic preconnection interface. Their calculus is prescribed on any commutative ringed Grothendieck site, with Ωⁿ=∧ⁿΩ¹, restriction-compatible differentials and wedge, d²=0 and graded Leibniz. E is finite locally free with locally constant rank, and dλ=0. The λ=1 comparison must retain the same section operator, horizontal sheaf maps, restriction and curvature.

The current supplier `CrystallineCohomology:CR.1/integrable-connection`, in [CR.0–CR.6](../packets/CrystallineCohomology--CR.0.json), requires a surjection Ω¹_(B/A)→Ω in its ring clause. Its sheaf clause is on the crystalline site over a PD base. Those are narrower hypotheses. The [H.0 continuation packet](../packets/HodgeStructuresPartII--H.0.json) already requests precisely this owner extension; the request has not been reconciled.

Fresh source reading: [Stacks Remark 60.6.8, tag 07I0](https://stacks.math.columbia.edu/tag/07I0), including its balancing calculation, and [§60.15, Lemma 60.15.1, tag 07J5](https://stacks.math.columbia.edu/tag/07J5), including its proof, accessed 2026-10-10. The first assumes a quotient of Kähler differentials. The second constructs the connection from a crystal using PD thickenings. Neither states the requested arbitrary-calculus category. The mismatch is between the consumer's hypotheses and the supplier's contract, rather than an error in those source results.

A concrete separation is the one-point site with O=Q, Ω¹=Qω, Ω²=0 and zero scalar/exterior differentials. The additive map D(q)=qω is nonzero, obeys ordinary Leibniz and is flat. But Ω¹_(Q/Q)=0 cannot surject onto Qω. Read `KaehlerDifferential.subsingleton_of_surjective` at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/RingTheory/Kaehler/Basic.lean`, line 247. The existing `NonUniversalDifferentialChecks` in Suggested.lean prove the zero scalar differential, nonzero unit image, flatness, scalar Leibniz and absence of this surjection. They passed the fresh full-file check.

**Owner repair:** CR.1 exports ordinary connections for the supplied calculus on a ringed site, with an additive sheaf operator D, D(fs)=fD(s)+s⊗df, exterior extension D(s⊗ω)=D(s)∧ω+s⊗dω, curvature D₁D₀ and horizontal O-linear morphisms. Give restriction/gluing and the identity-on-operators λ=1 comparison. Keep PD, quasi-nilpotence and lift assumptions in the crystal-comparison statements. Reconcile H.0's matching request to the resulting named node/interface.

## Gate B: finite ordinary Rees sheaves and actual fibres

Consumers: `HodgeStructuresPartII:H.0/rees-parameter` and `HodgeStructuresPartII:H.0/rees-specialization`. H.0 consumes DD.1's finite ordinary Rees carrier and fibre identifications; it constructs the induced parameter operator t∇. The H.0 request separately names the unbounded Liu–Zhu period-lattice interface and does not identify it with this finite situation.

Current suppliers in [the DD packet](../packets/DerivedDeRhamCohomology.json): `DerivedDeRhamCohomology:DD.1/filtered-modules` defines coherent diagrams in an enhanced derived category over a ring, and `DD.1/rees-description` states the graded derived equivalence with t-cofibres and localization. [DD's package](../packages/DerivedDeRhamCohomology/README.md), §§1.12–1.14, retains those statements. Its Suggested.lean inventories `filteredModules` and `reesDescription` but supplies no typed interface for either. There is no stated ordinary finite module-sheaf export with the three fibre maps, their restriction/descent and coefficient comparisons that H.0 explicitly consumes.

Freshly read Bhargav Bhatt, [Prismatic F-gauges, Fall 2022 course notes](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf), §2.2.1, Proposition 2.2.6 and inverse construction, Remark 2.2.8, printed pp.16–17, accessed 2026-10-10. The proposition fixes the Rees weight sign and monoidal comparison. The remark identifies finite projective modules with genuine finite filtrations and finite projective graded pieces as the vector-bundle specialization. This supplies the finite affine source for the requested owner extension; the site descent and operator comparisons still need explicit statements. This run does not claim a reading of the whole notes or their references.

**Owner repair:** DD.1 exports the ordinary finite Rees sheaf for a bounded locally split subbundle filtration, consuming native sheaf coefficients and E1 descent. Define the intrinsic lattice Σ_p F^pE·t⁻ᵖ⊂E[t,t⁻¹] independently of a splitting. On a split chart identify it with ⊕_p G_p[t]t⁻ᵖ, and expose actual maps

- Rees/(t)≃⊕_p gr^pE, taking e t⁻ᵖ to its graded class;
- Rees/(t−1)≃E, taking e t⁻ᵖ to e;
- Rees[t⁻¹]≃E[t,t⁻¹] through the lattice embedding.

Give restriction/descent, filtered-map naturality, convolution tensor and quotient comparisons, and local freeness. H.0 then proves compatibility with t∇, relative dt=0, obtaining gr_F∇ at zero, ∇ at one and t⁻¹D=∇ after localization. Reconcile H.0's request to this export; retain the independent unbounded period-lattice request.

Preserve the existing `ReesFiberChecks`: nonzero constants survive the actual polynomial quotients by X and X−1, whereas T(1) is a Laurent unit and the Laurent quotient by it is zero. Preserve `SplitReesChecks`, whose filtered shear tests the derivative term when a splitting changes. These are useful acceptance controls; they are not sheaf constructions or proofs of descent.

## Library and upstream boundary

The current read-only roadmap tree is commit `670582c502e1d4497d9ccd492b36c67028ef6666`; the current Tau Ceti source is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran in either tree.

Read AlgebraicVectorBundles README and the atlas snapshot of upstream HodgeStructures README in full. The current roadmap tree has no HodgeStructures directory; the snapshot is not presented as the current inventory. Read current native `HodgeStructureOn` (`Structure.lean`, line 62) and `PeriodDomain.Point` (`PeriodDomain.lean`, line 73). These supply the imported fibrewise Hodge theory. Read the four HodgeStructures audit entries: L0/L1/L3 built, L2 partly built. No direct HodgeStructuresPartII entry resolves either gate.

Checked the current AlgebraicVectorBundles Suggested.lean and DifferentialGeometry connection/curvature signatures. AlgebraicVectorBundles L0A–L0C owns the scheme coefficient operations. DifferentialGeometry's `CurvatureForm` has smooth real manifold, topological fibre and vector-bundle hypotheses; it is not the arbitrary differential-site category here. Current Tau Ceti `reesAlgebra.grade` and `mem_grade_iff` in `RingTheory/ReesAlgebra/Grading.lean` concern ideal powers in a polynomial algebra, rather than the requested filtered module-sheaf carrier. A targeted filename/declaration screen found no matching export. This is a bounded screen, not an exhaustive absence proof. Existing native sheaf tensor, closed monoidal, restriction and finite-local-freeness interfaces remain the inputs recorded in the README and preceding handoff.

## Validation and exact resume inputs

The unchanged package Suggested.lean was checked with `lean-check` in the managed pinned build: exit 0, zero errors, **1619 declaration-uses-sorry warnings and no other warnings**. Available memory was 96 GB before launch. Mathlib's actual source commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the managed driver identifies its Tau Ceti baseline as `f790474821cf4256814db967cb154e7af3d0c369`. The build directory itself is not a Git checkout, so its Tau Ceti source identity was not independently read from Git. The current native source inspection above is distinguished from this managed pinned elaboration.

`python3 scripts/check_blueprint.py` passed on all ten Hodge packets and both supplier packets with zero errors and warnings. The parent still has 13 gaps/5 requests. H.0–H.8 respectively have 7/11/19/5/6/13/6/7/5 gaps and 4/18/14/23/3/16/7/12/11 requests. All have accepted reviews, but the assembly handoff calls their plans conditional. Structural success does not assert closure. Independently counted **36 primary signature-omission markers** in the package suggested file.

Input SHA-256 values:

| File | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `ecf6bef6cda54dbba50c7f0ffda3dce1a50acf08b634629f4147533a516fd0c4` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `615ab5edd06887662b159bafda8abce270a069af88ab0a80018c3fe2eb361a2e` |

Paths in this table are relative to `research/blueprint/`. README is 199999 bytes and Suggested.lean is 822135 bytes.

Resume after the owner contracts change, starting with Gates A and B, then the remaining global H.0 interfaces and all H.1–H.8 dependencies. Preserve the 36 omitted parent interfaces, seven H.0 continuation targets, general-site descent, locally varying rank, determinant connection, uniform nilpotence bounds, kernel/image caveats, unbounded filtration/Tate/Galois comparisons and analytic image hypotheses. Do not restore the unrestricted H.7 assertions removed earlier. These two gates are necessary first repairs, not a claim that they are the only gaps.

The [preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/cd3293a62/research/blueprint/handoff/PKG-HodgeStructuresPartII.md) retains the earlier chart work, source hashes and continuation links. The [assembly handoff](ASM-HodgeStructuresPartII.md) records all 885 declarations and cross-part reconciliation. Reconcile every target/API/test before completing the package and adding `topic = "math.AG"` metadata. No scratch artifact is needed to resume. No source passage or private book was copied. No Lean process remains running.
