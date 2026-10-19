# ASM-AutomorphicCongruences — complete

Issue #216; assembly by Codex, session `codex-hYL4uB`, 19 October 2026. The claim was confirmed by the swarm bot before work began. This run claims and submits only this job.

## Delivered

The [full reader](../readmes/AutomorphicCongruences.md) assembles the two reviewed parts with a common purpose, scope, neighbour boundaries, conventions, versioned bibliography and layer overview. It restores the corrections from the L0 independent review that had not yet reached that part's reader. All 92 targets, 130 API entries, 72 discriminating mathematical tests, 35 landmark choices, hypotheses, proof outlines, checks and source locators are retained. Source statements are in the plan authors' own words; no source passages or source files were added.

The [merged suggested file](../suggested/AutomorphicCongruences.lean) has one import block, one standard note, one `AutomorphicCongruences` namespace and one refreshed target register. It is 2,636 lines, below the 5,000-line limit. `wanEisensteinIdeal` now has the real body `EisensteinIdeal.base ι operator eigenvalue`, sharing L0's coefficient-kernel definition. The arithmetic targets whose carriers are absent at the pins remain reader targets; the concrete ideal, polynomial, matrix and algebraic-reduction signatures do not stand in for those arithmetic theorems.

The only changed packet fields concern cross-part prerequisites, consuming gaps/coverage, residual internal requests, the narrowed CM comparison title and form/ideal notation. The independent review objects are unchanged. All nodes retain `implementationStatus: unchecked`; all ten stages remain planned, with zero closed stages.

## Cross-part reconciliation

The following ten broad stage references now point to exact nodes. The L0/L1 links identify the supplied Q-case constructions. Where Wan requires a totally real extension, the consuming gap explicitly keeps that extension unproved.

| Consumer in AutomorphicCongruences | Former stage | Exact prerequisite(s) in AutomorphicCongruences |
| --- | --- | --- |
| `L5w/canonical-period-duality` | `L0` | `L0/canonical-period-congruence-number` |
| `L5w/klingen-interpolation` | `L1` | `L1/gu22-ordinary-hermitian-forms`, `L1/gu22-hida-control` |
| `L5w/eisenstein-coefficient-ideal` | `L0` | `L0/eisenstein-ideal` |
| `L5w/height-one-congruence` | `L1` | `L1/gu22-hida-control` |
| `L5w/galois-selmer-instance` | `L0` | `L0/su-lattice-datum`, `L0/lattice-construction`, `L0/extension-class-local-conditions`, `L0/sigma-primitive-selmer` |
| `L5w/exceptional-height-one-primes` | `L0` | `L0/primitive-imprimitive-comparison` |
| `L5w/quartic-cm-divisibility` | `L0` | `L0/sigma-primitive-selmer`, `L0/primitive-imprimitive-comparison` |
| `L5b/cyclotomic-control` | `L0` | `L0/selmer-specialization-control`, `L0/primitive-imprimitive-comparison` |
| `L5b/four-factor-product-bound` | `L5a` | `L5a/two-variable-product-containment`, `L5a/auxiliary-field-existence` |
| `L5b/rational-cyclotomic-endpoint` | `L5a` | `L5a/auxiliary-field-existence` |

`L5w/arithmetic-specialization` also directly cites `L0/selmer-specialization-control`, the SU 3.2.8/3.2.9 interface its proof invokes. Its use over the Hilbert field still needs the stated adapter.

The original L0→L5w/L5b node references are retained. The 92-node combined prerequisite graph is acyclic, and no same-roadmap stage-only prerequisite remains. In particular, the selected-base-change theorem in L5w is conditional on the listed field data; it does not import L5a's existence theorem. The mathematical route is L5w → early L5a Proposition 5.2.1 → L5b, alongside Kato L4. The HE.8b endpoint is never imported into L5b. L5 is an aggregate after the endpoints, not an input to the final scalar main-conjecture assembly.

## Scope-sensitive changes for independent review

No source theorem was strengthened and no missing supplier result was declared proved. Assembly makes the following closure limitations explicit. The next independent review should check these additions and their consuming links; they are substantive limitations of the assembled proof plan, not changes to a source theorem's conclusion.

1. **Hilbert extensions of L0.** The Q/imaginary-quadratic period, polarized lattice, primitive/imprimitive and specialization prototypes do not establish Wan's totally real variants. A consuming gap is linked to `L5w/canonical-period-duality`, `galois-selmer-instance`, `exceptional-height-one-primes`, `arithmetic-specialization`, `quartic-cm-divisibility` and `L5b/cyclotomic-control`. The residual L0 request is narrowed accordingly; the generic coefficient-kernel definition is supplied and removed from that request's consumers. The separate upstream rank-four Part II request is retained.
2. **Hilbert extension of L1.** SU's Q-case `gu22-hida-control` does not itself supply Wan's totally real ordinary boundary sequence. The new consuming gap retains integral coefficient change, all-cusp q-expansions and cuspidal lifting at `L5w/klingen-interpolation` and `height-one-congruence`, with the geometry/doubling owner unchanged.
3. **Auxiliary fields and narrow Δ+.** L5b's reviewed source finding E2 already requires a new finite ramification prime of K outside D_F. L0's `L5a/auxiliary-field-existence` still states the original BCS conditions and does not prove that strengthened simultaneous choice. A gap `auxiliary-field-narrow-delta` is added in its consuming L0 packet, also linked to `L5a/two-variable-product-containment` and the stage's remaining obligations. The L5a request in the L5b packet now names the exact early-product/existence nodes and retains this refinement, torsion/nonzero-function, period/local and coefficient-map requirements. This prevents a cross-part link from silently asserting the stronger existence theorem.

Editorial synchronization: the CM node keeps its stable id `L0/hida-tilouine-anticyclotomic`, but its title now describes the reviewed CM theta-family congruence/Katz contract, not a general CM main-conjecture equality. ℰ_D consistently denotes the Eisenstein form and 𝔈_D the coefficient ideal; residual references to the form and ideal were disambiguated throughout. This preserves the reviewed statement's nonvanishing condition on the form.

## Existing-work and source boundaries checked

The current read-only TauCetiRoadmap and Tau Ceti checkout were inspected separately from the atlas snapshot. The IHG reader and suggested rank-two theorem confirm that its existing Ribet/Fitting API does not provide the polarized 1+2+1 theorem. ProfiniteCohomology's scope, Layer 7 and suggested Shapiro signatures use discrete coefficients; the compact Tate-lattice/tower adapter stays with the Selmer requests. Existing elliptic twist equivariance and multiquadratic splitting/Galois declarations are imported rather than planned again. PadicMeasuresIwasawaAlgebras is absent from that upstream checkout, so its planned determinant/characteristic-divisor interfaces are not described as an implemented upstream roadmap.

All 21 distinct baseline receipt entries were checked by reading declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The library-coverage audit marks the ten arithmetic layers unbuilt. The evidence-backed link-map entries contain no source/target or overlap record touching this roadmap; boundaries are therefore stated from the actual supplier contracts and current upstream scope, not invented link evidence. No atlas, upstream, neighbour packet or part reader/suggested file was edited.

BCS-v2 §5 (pp.9–10), SU §§3.1–3.2 (pp.18–27) and the CLW addendum were used to check the assembly's order and conventions. The reader preserves both BCS version locators, the separate Wan 2015/2020 papers, Nakamura's intrinsic BM versus smooth-dual dictionary and the repaired CLW joint height-one coprimality. This assembly is not a new independent source review. All original unread-source and supplier gaps remain. No restricted book was needed.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L0.json`: 69 nodes, 125 API items, 68 tests, 25 planets; **0 errors, 0 warnings**. Now 17 gaps and 20 requests.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L5b.json`: 23 nodes, 5 API items, 4 tests, 10 planets; **0 errors, 0 warnings**. Now 9 gaps and 23 requests.
- Combined-graph/inventory check: 92 unique nodes, acyclic; no broad internal stage prerequisite; all API/test names and full target fields represented in the reader; every definition/construction has at least three tests. Independent review objects unchanged and no implementation-status promotion.
- `lean-check research/blueprint/suggested/AutomorphicCongruences.lean`: **exit 0**, 34 warnings, all `declaration uses sorry`; no other diagnostic. Memory was checked first and exceeded the 20 GB requirement. The shared build was used; no language server or build/update/cache command was run.
- Local Markdown links and node anchors, allowed-path inventory and `git diff --check` checked before submission.

## Collected restructuring proposals

These are the parts' proposals, collected for the maintainer; no atlas edge or ownership change is applied by assembly. RS-11's amendments still need their separate review. The first proposal's older general CM-field wording must be narrowed to the reviewed CM-theta comparison contract before any new layer is created.

### Proposal 1: split

Roadmaps: `AutomorphicCongruences`.

HeegnerPointEulerSystems:HE.8b's request names the Hida–Tilouine anticyclotomic main conjecture as 'proposed AC L0c', and RT-AREA-iwasawa-1/26 asks for a layer of AutomorphicCongruences for it.

Add a sub-layer L0c 'Anticyclotomic main conjectures for CM fields (Hida–Tilouine)' under L0, containing L0/hida-tilouine-anticyclotomic; it requires AutomorphicPadicLFunctions:L3 and L3h and supplies L2s and HeegnerPointEulerSystems:HE.8b. The node keeps its id.

### Proposal 2: rescope

Roadmaps: `AutomorphicCongruences`, `AutomorphicGaloisRepresentationsPartII`, `AutomorphicPadicLFunctions`, `MetaplecticAutomorphicForms`, `GeneralizedHeegnerCycles`, `CompletedCohomologyAndLocalGlobalCompatibility`, `PadicLocalLanglandsForGL2Qp`, `KatoEulerSystems`.

Stage edges realised by node prerequisites of this packet but missing from the atlas (confirmed findings RT-AREA-iwasawa-1/6, /22, /24, /25, /27, /28 and RT-AREA-automorphic-1/20, and RS-11).

Add the stage edges AutomorphicGaloisRepresentationsPartII:AG2.2, AG2.5, AG2.6 → AutomorphicCongruences:L1, L2, L2s; AutomorphicCongruences:L2s → L2; AutomorphicPadicLFunctions:L3h → L1, L2s; MetaplecticAutomorphicForms:MP.6 → L2; GeneralizedHeegnerCycles:GH.7 → L2 (already an ancestor through GH.8); KatoEulerSystems:L4 → L2 and L5a; CompletedCohomologyAndLocalGlobalCompatibility:R31.4, PadicLocalLanglandsForGL2Qp:R30.5, R30.6, SmoothRepresentationsOfLocalGroups:SR.5 → L3; ModularIwasawaMainConjectures:L0 → L1, L3, L4; ModularIwasawaMainConjectures:L1 → L4 (the ordinary seed). Each is acyclic: none of the sources has an AutomorphicCongruences ancestor except ModularIwasawaMainConjectures:L1, whose AutomorphicCongruences ancestors are L1 and L2, both upstream of L4.

### Proposal 3: rescope

Roadmaps: `AutomorphicCongruences`, `ModularIwasawaMainConjectures`, `HeegnerPointEulerSystems`.

RS-11's two requested cuts.

Remove the stage edges AutomorphicCongruences:L5 → ModularIwasawaMainConjectures:L3 and HeegnerPointEulerSystems:HE.8b → AutomorphicCongruences:L5b; this packet's L5 node is an aggregate, and no node here depends on HE.8b.

### Proposal 4: rescope

Roadmaps: `AutomorphicCongruences`, `RankZeroOneBSD`, `HeegnerPointEulerSystems`.

Ownership notes for two consumers: RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity builds the CGS class from Kings–Loeffler–Zerbes classes specialized to the CM family in weight two, and HeegnerPointEulerSystems:HE.8b consumes L5a.

BSD.7a's node should import L2/klz-beilinson-flach-classes and L2/bf-explicit-reciprocity instead of restating the Hida-family construction; the stage order is L5a → HE.8b, never HE.8b → L5a (no node of L5a uses HE.8b).

### Proposal 5: merge

Roadmaps: `AutomorphicCongruences`, `IntegralHeckeAndGaloisDeterminants`.

L0/lattice-construction is SU §4's abstract construction for polarized 1+n+1 data; it is generic algebra, used by SU, CLW, FW and Wan 2015, and no IHG layer states it.

Keep it in L0 now; if IntegralHeckeAndGaloisDeterminants gains a Part II layer for polarized lattice constructions (the extension requested by AutomorphicCongruences--L5b of IHG.6), move the node there and import it from L0, keeping the source-specific instances (L1/su-selmer-lower-bound, L2s/clw-main-divisibility, L2/fw-greenberg-divisibility) here.

L5b supplies no separate `restructure` array. Its ownership contract is retained: generic Hilbert Hida, minimal R=T, determinant/Ribet algebra, characteristic divisors and derived control stay with their existing owners; the rank-four enlargement needs explicit extension/Part II routing. No proposal authorizes replanning existing IHG or Shapiro theory.

## Collected supplier requests

All 43 request records are retained below, including the narrowed internal residual contracts. Exact supplied internal interfaces are in the cross-part table above; none of these residual needs is discharged merely by naming its owner. Repeated suppliers across the two parts are intentionally collected separately because their consumers and mathematical needs differ.

### Requests from part L0

**L0-1: `PadicMeasuresIwasawaAlgebras:L5`.** Supply the Knudsen–Mumford graded determinant line of perfect complexes, derived base change, acyclic trivialization, and the complex [A→(1−α)A] in specified degrees. Ownership is PMIA L5 (RS-16); no L5 nodes or package were found in the current checked-out upstream main, so this remains a supplier request.

Needed by: `AutomorphicCongruences:L3/fundamental-line`.

**L0-2: `AutomorphicLFunctionsAndLocalFactors:AL.3`.** Ichino's triple product formula for the definite unitary group U(2) (equivalently D^× for a definite quaternion algebra) with explicit local triple product integrals at split, nonsplit and supercuspidal places, in the form used by CLW Props 7.9.1–7.12.1, FW Prop. 7.29 and Wan20 step (5); also the Rallis inner product normalization it is combined with. No atlas stage plans it.

Needed by: `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.

**L0-3: `DirichletPadicLFunctions:L4`.** The Kubota–Leopoldt p-adic L-function of a Dirichlet character as an element of A[[Γ_ℚ]] with Σ-imprimitive Euler factors, and its image under γ ↦ (1+W)^{-1}γ²_+ in 𝕀[[Γ_K]] (SU's L^Σ_{χ̄_fξ̄′}, CLW's L_{ξ,ℚ} of (6.1.1)).

Needed by: `AutomorphicCongruences:L1/eisenstein-datum`.

**L0-4: `SerreWeightAndLevelOptimisation:R20.6`.** Existence of a classical eigenform of the Serre weight and minimal level whose residual representation is a given odd absolutely irreducible ρ̄ (Khare–Wintenberger with weight optimisation), in the form FW Lemma 2.2, Lemma 2.8 and the proof of Prop. 2.4 use, including the crystalline-short and ordinary cases up to twist.

Needed by: `AutomorphicCongruences:L3/smooth-classical-points`.

**L0-5: `KatoEulerSystems:L4`.** For the stage KatoEulerSystems L5 planned by RS-11 (implementationHandoffs.ordinaryBSTW; not yet in the atlas): the ordinary BSTW two-variable zeta element for E (or an elliptic newform g) over imaginary quadratic K with p split, both normalized explicit reciprocity laws, and the ordinary Perrin-Riou/Greenberg characteristic-ideal identity in both directions, before inverting p under van_K, with the two-form product (BCS Thm 4.1.3, Cor. 4.1.4). Until it exists, L5a states the contract in L5a/ordinary-two-variable-equivalence. In the BCS application irr_K implies van_K. The missing ordinary L5 owner remains a request; Kato L4 alone is not the two-variable comparison.

Needed by: `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`.

**L0-6: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.** Import (existing Tau Ceti layer): Shapiro's lemma for coinduced discrete modules, used to restrict the quartic-CM Selmer group to K and split it by the characters of Gal(M/K); the compact-coefficient comparison is SelmerIwasawaCohomology:L3's.

Needed by: `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`.

**L0-7: `AutomorphicPadicLFunctions:L4`.** Instantiate the unitary PEL data at signature (2,2) and (3,1) in Skinner–Urban's and Castella–Liu–Wan's normalizations: ordinary and semi-ordinary Igusa towers, q-expansion and Fourier–Jacobi expansions, Siegel-operator boundary sequences and the ordinary Hecke algebras; and supply Wan 2015's GU(2,2) p-adic L-function over a totally real field with the base-change interpolation comparison used in BCS Lemma 5.1.2 (Wan's Prop. 84).

Needed by: `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`.

**L0-8: `AutomorphicPadicLFunctions:L3`.** Hida's GL₂ × GL₂ Rankin–Selberg p-adic L-function of a CM Hida family against a fixed form or Hida family, with its comparison to Katz's p-adic L-function on the line interpolating values at 1 (Wan20 §7E, CLW proof of Thm 8.2.1(2), FW Cor. 7.21); RT-AREA-iwasawa-1/26 proposes a layer for it. PadicFamilies:L1/branch-l-functions is the cyclotomic family L-function of one form and does not cover it.

Needed by: `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`, `AutomorphicCongruences:L2/greenberg-function-factorization`.

**L0-9: `AutomorphicPadicLFunctions:L3h`.** Export Hsieh's Theorems A, B and C to AutomorphicCongruences:L2s and L2 as well as L5a (RT-AREA-iwasawa-1/25): µ = 0 of the anticyclotomic Rankin–Selberg function under the Steinberg-twist hypotheses of FW Thm 7.32 and CLW Thm 8.2.1(2), Hsieh 2012's nonvanishing for the auxiliary characters of CLW §5.6, and Vatsal 2003's µ = 0 (a recorded gap there) for SU Prop. 12.3.6. For auxiliary ℓ-power twists use only the infinitely-many nonvanishing statements of CLW addendum Thms 1.0.1–1.0.2 and §3, together with its finite-exception avoidance. Do not use the superseded cofinite assertion to choose three simultaneous units. This correction does not weaken the p-tower µ=0 Theorem B.

Needed by: `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`.

**L0-10: `GeneralizedHeegnerCycles:GH.7`.** Coordinate the Yager module/unramified-by-cyclotomic exponential request recorded at GH.7 with the local PadicHodgeRegulators Part II owner. GH.7 is a checkpoint, not a proof of that generic construction. Supply the exact FW §4.2.2 module and integral-lattice comparison; AC retains the short-crystalline denominator bound and scaled saturated line.

Needed by: `AutomorphicCongruences:L2/unramified-exponential-boundedness`.

**L0-11: `MetaplecticAutomorphicForms:MP.6`.** Ikeda's description of the Fourier–Jacobi coefficients of (nearly holomorphic) Siegel Eisenstein series on U(3,3) as finite sums of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (FW Lemma 7.26; Wan20 Prop. 6.44; CLW Prop. 7.4.2), using MP.6's unitary Jacobi group and Fourier–Jacobi periods (RT-AREA-automorphic-1/20).

Needed by: `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.

**L0-12: `AutomorphicGaloisRepresentationsPartII:AG2.2`.** Galois representations of cohomological cuspidal representations of GU(2,2) and U(3,1) over an imaginary quadratic K in SU Thm 7.1.1's form: polarized, unramified outside S with the Hecke-polynomial characteristic polynomial of Frobenius, crystalline at the primes above p when π_p is unramified, and with the ordinary (resp. semi-ordinary) filtration at p for p-ordinary π (RT-AREA-iwasawa-1/6; AG2.5 and AG2.6 for the local–global compatibility). The present AG2 existence statement has [F⁺:Q]≥2; an explicit base-change/descent adapter to imaginary quadratic K is required. Discrete assembly may be used only after its cuspidal constituent representations are attached, and must not itself be treated as CAP exclusion.

Needed by: `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicCongruences:L2s/cap-exclusion`.

**L0-13: `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`.** Emerton's local–global compatibility for completed cohomology localized at a non-Eisenstein ρ̄, in the form of Nakamura Thm 2.2 and FW Thm 6.10 (with co-Whittaker π_ℓ at ℓ ∈ Σ_0), and its dual for completed Borel–Moore homology (Nakamura Cor. 2.5), with p ≥ 5 removed by Paškūnas–Tung's generalization (RT-AREA-iwasawa-1/28).

Needed by: `AutomorphicCongruences:L3/completed-homology-factorization`.

**L0-14: `PadicLocalLanglandsForGL2Qp:R30.5`.** Paškūnas's identification of the projective envelope P̃ with the dual of the universal deformation of π̄ and the removal of P̃ from Hom, under Nakamura's conditions (N1), (N3), (N4), as used in Nakamura §4.1; and Paškūnas's freeness result (Nakamura Thm 4.7) for M^⋄(k, τ) at potentially semistable points (R30.6). R30.5's nodes assume p ≥ 5; FW extend Nakamura's theorem to p = 3 through Paškūnas–Tung's generalization (their Props 2.13, 2.33, cited in FW's remark after Thm 3.6), which R30.5/R30.6 should state if the p = 3 case is to be covered.

Needed by: `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`.

**L0-15: `SmoothRepresentationsOfLocalGroups:SR.5`.** Co-Whittaker families attached to families of GL₂(ℚ_ℓ)-representations of Weil–Deligne type over reduced complete local rings, with uniqueness, the explicit principal-series/Steinberg/supercuspidal shapes and freeness of rank one of the K_1(ϖ^m)-invariants with base change (FW Props 6.7–6.9); SR.5's local Langlands family construction is conditional on Helm's conjecture in general, and the GL₂ case used here must be unconditional.

Needed by: `AutomorphicCongruences:L3/completed-homology-factorization`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`.

**L0-16: `GL2ModularityLifting:R32.4`.** Pan's modularity theorem in the form cited by FW [95, Thm 1.0.4]: an odd ρ: G_ℚ → GL₂(O), unramified outside finitely many primes, with ρ̄|_{G_{ℚ_p}} absolutely irreducible and de Rham with distinct Hodge–Tate weights, is modular; and Kisin's crystalline lifting theorem in CLW's non-ordinary CAP-exclusion step.

Needed by: `AutomorphicCongruences:L2s/cap-exclusion`.

**L0-17: `IntegralHeckeAndGaloisDeterminants:IHG.6`.** Import the existing upstream generic GMA/reducibility tools. Its rank-two Ribet statements do not supply the polarized 1+n+1 SU theorem. Keep the source-specific construction at AC L0; update the L5b request to point here rather than create a duplicate at IHG. The n=0 case does not satisfy our middle-constituent datum.

Needed by: `AutomorphicCongruences:L0/lattice-construction`.

**L0-18: `PadicMeasuresIwasawaAlgebras:L4`.** For finite presented torsion modules over general noetherian normal domains, supply the divisorial fractional ideal associated to charDivisor, its equality with the divisorial hull of Fitt_0, exact-sequence multiplicativity and principal-majorant specialization. The current native charIdeal statement assumes a UFD; SU’s normal Hida branches need the divisor interface.

Needed by: `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L0/selmer-specialization-control`.

**L0-19: `AutomorphicPadicLFunctions:L3`.** Supply the Hida Rankin–Selberg function for f against the ordinary CM theta family g, including its fractional congruence-ideal target, both orderings, critical twist and Katz/class-number normalization. PadicFamilies:L4/two-variable-l-function varies one form and a cyclotomic character and does not furnish this CM Rankin function.

Needed by: `AutomorphicCongruences:L2/greenberg-function-factorization`, `AutomorphicCongruences:L2/bf-explicit-reciprocity`.

**L0-20: `AutomorphicPadicLFunctions:L3h`.** Supply the corrected auxiliary ℓ-tower nonvanishing and finite-set avoidance needed by CLW addendum §3 (including its cited Hung input). The old almost-all assertion cannot be used for simultaneous three-unit selection. Prove the exact two-data-set choice, while keeping Hsieh’s p-tower µ=0 theorem separate.

Needed by: `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`, `AutomorphicCongruences:L2/wan-rankin-selberg-divisibility`.

### Requests from part L5b

**L5b-1: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`.** Supply Fujiwara v2 Definition 6.11, Theorems 11.1/11.2 and Corollary 11.5 for the actual nearly ordinary minimal totally real problem: determinant/twist type, local flat restrictions, Hypotheses 6.7 and applicable 5.9, p=5 exception, free quaternionic/Hilbert module, finite flat Hida lift and Gorenstein duality. Existing nice-prime Skinner–Wiles nodes are insufficient for this exact contract. Also supply the ordinary lifting/CAP alternative of Wan 9.2 condition (10).

Needed by: `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L5w/quaternionic-period-primitivity`, `AutomorphicCongruences:L5w/galois-selmer-instance`, `AutomorphicCongruences:L5w/selected-base-change-hypotheses`.

**L5b-2: `GlobalGaloisDeformations:R04.6`.** Export the exact minimal modular lift for the selected residual elliptic representation and its quadratic base change; prove all six Fujiwara 6.11 clauses under the specified local splitting pattern, with determinant/Teichmuller types fixed. Distinguish existence, modularity, and preservation of local minimality.

Needed by: `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L5w/selected-base-change-hypotheses`.

**L5b-3: `PadicFamilies:L5`.** Use L5/totally-real-weight-algebra, L5/hida-freeness, L5/hida-hecke-finite, L5/hida-control-nearly-ordinary and L5/algebraic-primes-dense. Extend their exact contract to Wan’s parallel ordinary Hilbert branch through g_F, with its integral eigenlattice and fixed arithmetic specialization. Supply ordinary GU(2,2) form/boundary control with compatible coefficient change, rather than merely GL2 eigenforms.

Needed by: `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L5w/klingen-interpolation`, `AutomorphicCongruences:L5w/arithmetic-specialization`.

**L5b-4: `AutomorphicPadicLFunctions:L4`.** Provide Wan 2015 §§4–7 local sections, pullback/doubling, GU(2,2)/F ordinary module and q-expansion/Siegel-operator interface, Theorems 82/88 with all cusp and degenerate coefficients, correct ψ, ξ, α_p and period normalization. L3’s Katz object alone is not the Hilbert Rankin function. Analytic carrier/existence is owned here; L5w proves the source-specific congruence and arithmetic compatibility.

Needed by: `AutomorphicCongruences:L5w/klingen-interpolation`.

**L5b-5: `AutomorphicPadicLFunctions:L3h`.** Supply Hung’s theorem used in Wan 86 and the exact quaternionic/canonical-period comparison domain, primitive NV1/NV2 for p≥5 including the empty n− degree-two case. Supply the CM auxiliary-character unit value and Fourier–Jacobi pairing inputs of Wan 96; retain nonsplit imprimitive Euler μ terms.

Needed by: `AutomorphicCongruences:L5w/quaternionic-period-primitivity`, `AutomorphicCongruences:L5w/fourier-coefficient-coprimality`.

**L5b-6: `AutomorphicPadicLFunctions:L3`.** Provide the abelian CM-character p-adic L-function and canonical congruence-period unit comparison used in Wan 88 and 96; the argument needs the specified character infinity type, conductors and Euler units, not just existence of a Katz measure.

Needed by: `AutomorphicCongruences:L5w/fourier-coefficient-coprimality`.

**L5b-7: `AutomorphicPadicLFunctions:L5`.** Supply the actual Perrin–Riou/Hida Rankin normalization on the elliptic cyclotomic line, matching CGS 1.2.2–1.2.4, and the MSD comparison for both E and E^F. Track Manin constants, modular degrees, Néron periods, p unit roots, discriminant character units and primitive local Euler factors.

Needed by: `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`.

**L5b-8: `AutomorphicCongruences:L0`.** The exact supplied prototypes are L0/canonical-period-congruence-number, L0/su-lattice-datum, L0/lattice-construction, L0/extension-class-local-conditions, L0/sigma-primitive-selmer, L0/primitive-imprimitive-comparison and L0/selmer-specialization-control. Extend the period and Selmer/control contracts to Wan’s totally real setting as specified in the consuming Hilbert-extension gap: Hilbert Gorenstein congruence-line comparison (Definition 79), primitive/inertia/local-trivial comparison, ordinary extension-to-Selmer bridge and finite Fitting-to-characteristic control. Import the separately requested polarized rank-four theorem for Wan 98 and verify the source-localized intersection/quotient, P-primary saturation and equality of lengths. The generic Eisenstein coefficient kernel is already supplied by L0/eisenstein-ideal and is no longer an outstanding internal request.

Needed by: `AutomorphicCongruences:L5w/canonical-period-duality`, `AutomorphicCongruences:L5w/galois-selmer-instance`, `AutomorphicCongruences:L5w/exceptional-height-one-primes`, `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5b/cyclotomic-control`, `AutomorphicCongruences:L5w/arithmetic-specialization`.

**L5b-9: `AutomorphicCongruences:L1`.** Extend L1/gu22-ordinary-hermitian-forms and L1/gu22-hida-control from Q/imaginary quadratic K to the totally real F ordinary GU(2,2) boundary exact sequence and cuspidal lifting used by Wan 27/97, with integral coefficient change, flatness and all-cusp q-expansion checks. The geometric carrier and local doubling machinery stay with AutomorphicPadicLFunctions:L4.

Needed by: `AutomorphicCongruences:L5w/klingen-interpolation`, `AutomorphicCongruences:L5w/height-one-congruence`.

**L5b-10: `IntegralHeckeAndGaloisDeterminants:IHG.2`.** Import the current upstream roadmap’s actual integral Hecke images and localized reduced cuspidal Hecke algebra, with the eigenvalue polynomial/central/U_p dictionary used for the Wan quotient. The atlas snapshot is not evidence that this roadmap needs replanning.

Needed by: `AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`.

**L5b-11: `IntegralHeckeAndGaloisDeterminants:IHG.4`.** Import current upstream determinant interpolation with the actual rank-four GU(2,2) Hecke polynomial normalization, coefficient ring and ramification set; obtain the integral trace/determinant data needed for Wan 9.2.

Needed by: `AutomorphicCongruences:L5w/galois-selmer-instance`.

**L5b-12: `IntegralHeckeAndGaloisDeterminants:IHG.6`.** The current upstream layer supplies the rank-two two-character integral Ribet/Fitting theorem (including the residual-coincidence refinement). Wan Proposition 98, §§9.2.1–9.2.2, pp.84–88, additionally needs a polarized rank-four χ′⊕ρ⊕χ lattice/extension and length theorem with all ten hypotheses, local plus/minus disjointness and the scalar-character Selmer term. This broader general input is an explicit gap requiring extension/Part II routing; do not treat the written rank-two theorem or a determinant as its proof, and do not replan the existing theorem here.

Needed by: `AutomorphicCongruences:L5w/galois-selmer-instance`.

**L5b-13: `IntegralIwasawaTheory:I.5`.** Supply the odd-prime totally real abelian-character main-conjecture bound used in Wan Theorem 100, pp.87–88, and identify its class/Galois module with the scalar Selmer module for χ′/χ and the stated local conditions and cyclotomic twist. Prove its valuation is zero at the non-pulled-back prime after the specified coefficient transport. DirichletPadicLFunctions L4 plans GL1 Eisenstein coefficient families, not this totally real main conjecture.

Needed by: `AutomorphicCongruences:L5w/galois-selmer-instance`.

**L5b-14: `SelmerIwasawaCohomology:L4`.** Provide the exact Poitou–Tate primitive/Σ-imprimitive sequence of Wan 101, local H¹_f characteristic Euler factors, and vanishing of the compact global term under stated torsion/torsion-free hypotheses.

Needed by: `AutomorphicCongruences:L5w/exceptional-height-one-primes`.

**L5b-15: `SelmerIwasawaCohomology:L3`.** In addition to the existing kernel-control and derived-control nodes, prove the precise ordinary coefficient specialization, cyclotomic quotient and torsion lifting used by Wan/BCS/SU, including localization-image, local Euler and Tor terms. A nonzero characteristic ideal requires torsion; Wan 101’s zero-extended convention does not prove it. Supply the quartic-CM torsion verification from early Kato bounds and compatible quadratic descent without using the final endpoint. Supply the discrete Iwasawa coefficient and tower-control adapter used with upstream Shapiro; arithmetic specialization uses a principal analytic majorant over the normal big ring and nonzero specialization, not an unjustified image of its characteristic ideal.

Needed by: `AutomorphicCongruences:L5w/galois-selmer-instance`, `AutomorphicCongruences:L5w/arithmetic-specialization`, `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5b/quadratic-selmer-decomposition`, `AutomorphicCongruences:L5b/cyclotomic-control`.

**L5b-16: `SelmerIwasawaCohomology:L2`.** Supply the integral p-divisible Tate-module and ordinary-filtration comparison under unramified quadratic twisting, and the actual classical elliptic p-primary Selmer versus BCS ordinary Selmer identification, including finite/inertia/local-trivial away-p conventions. Distinguish the compact integral Tate lattice from its discrete p-divisible module and the discrete Iwasawa dual coefficient; compare finite-level Shapiro, filtered direct limits and ordinary/away-p local conditions for quadratic restriction.

Needed by: `AutomorphicCongruences:L5b/four-twist-lattice-dictionary`, `AutomorphicCongruences:L5b/quadratic-selmer-decomposition`, `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`.

**L5b-17: `ModularSymbolsPadicLFunctions:L1`.** Supply MSD p-adic functions with the precise Néron periods for E and its three twists, modular parametrization/Manin-constant comparison of CGS 1.2.3, and good-period alignment with Kato’s dual-form lattice.

Needed by: `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`.

**L5b-18: `ModularSymbolsPadicLFunctions:L2`.** Supply ordinary refinement/interpolation with the chosen unit root and finite-character normalization, plus the uniqueness principle in the bounded measure space used for CGS cyclotomic factorization.

Needed by: `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`.

**L5b-19: `KatoEulerSystems:L4`.** Refine the existing ordinary-selmer-divisibility and elliptic-ordinary-and-multiplicative-divisibility exports to the exact BCS elliptic (im) condition on T_p(E), the MSD/Néron periods and primitive ordinary Selmer group: torsion and (L)⊂char X rationally, and integrally under (im), for all four quadratic twists. The existing general SL2-image criterion and error p^t are not silently identified with (im). Export the separately proved CM rational elliptic-unit case for the elliptic endpoint; do not apply the non-CM theorem there. Nonvanishing is provided by the existing analytic-twist-nonvanishing node.

Needed by: `AutomorphicCongruences:L5b/cyclotomic-control`, `AutomorphicCongruences:L5b/rank-one-image-twist`, `AutomorphicCongruences:L5b/four-twist-kato-bound`.

**L5b-20: `AutomorphicCongruences:L5a`.** The early integral bound of BCS Proposition 5.2.1 and original Lemma 5.2.3 field existence are supplied at target level by L5a/two-variable-product-containment and L5a/auxiliary-field-existence, with quartic-to-K Lemmas 5.1.1–5.1.2 owned there. Complete their recorded BSTW, period/Euler/lattice, torsion/nonzero-function and coefficient-map contracts, and the added auxiliary-field-narrow-delta refinement: a new finite ramification prime of K outside D_F while preserving all original field conditions. The exact node links replace the broad stage dependencies; they do not discharge these residual obligations. Neither HE.8b nor the L5b endpoint is an input.

Needed by: `AutomorphicCongruences:L5b/four-factor-product-bound`, `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`.

**L5b-21: `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.** Import the existing torsion/Tate-module construction, retaining the integral inverse limit, twist-equivariant transition maps and Weil-pairing determinant; no new elliptic geometry roadmap is planned.

Needed by: `AutomorphicCongruences:L5b/four-twist-lattice-dictionary`.

**L5b-22: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.** Use the existing continuous Shapiro theorem for discrete coefficients: the finite-level p-primary modules followed by their filtered direct limit, or the discrete Iwasawa coefficient T⊗Λ∨ with reciprocal action. It does not apply directly to the compact nondiscrete Tate lattice. The Selmer L2/L3 requests supply the integral-lattice/discrete-coefficient comparison, continuity, Pontryagin duality and compatible global/local maps; no upstream Shapiro theory is replanned.

Needed by: `AutomorphicCongruences:L5b/quadratic-selmer-decomposition`.

**L5b-23: `PadicMeasuresIwasawaAlgebras:L4`.** Extend the written principal/UFD characteristic-ideal and multiplicativity nodes to finite torsion modules over the normal noetherian/Krull Hida coefficient ring: divisorial characteristic ideals by height-one lengths, multiplicativity, detection of inclusion in a principal ideal, and transport of lengths under the specified localized completed coefficient extension. Supply SU Corollary 3.2.9’s specialization of a principal analytic majorant with nonzero specialization and its precise Fitting/Tor conditions. For finite coefficient integer-ring extensions O→O′, prove faithful flat characteristic base change for O[[Γ]]→O′[[Γ]] (and p-inversions) and contraction of extended ideals, together with the analytic unit comparison. Existing api-9 is the norm for restriction of scalars, not extension/contraction or arbitrary kernel specialization.

Needed by: `AutomorphicCongruences:L5w/height-one-congruence`, `AutomorphicCongruences:L5w/galois-selmer-instance`, `AutomorphicCongruences:L5w/exceptional-height-one-primes`, `AutomorphicCongruences:L5w/wan-family-divisibility`, `AutomorphicCongruences:L5w/arithmetic-specialization`, `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5b/quadratic-selmer-decomposition`, `AutomorphicCongruences:L5b/cyclotomic-control`, `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`, `AutomorphicCongruences:L5b/four-factor-product-bound`, `AutomorphicCongruences:L5b/factor-separation`, `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`, `AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`.

## Remaining work and resumption

The assembly job is complete; there is no unfinished assembly task or second claim. The roadmap remains a plan with 26 explicit gaps and 43 supplier requests, detailed in the reader and the records above. Later package or supplier work must resolve the relevant contracts, preserve the reviewed source corrections, and use the merged reader as the complete contract rather than the stale L0 part reader. In particular, do not restore the original single-family CLW unit claim, treat normal rings as UFDs, promote zero-extended characteristic containment to torsion, or import the later Heegner endpoint into the early BCS bound.

For the next mathematical review, begin with the three scope-sensitive additions above and the IHG rank-four, discrete Shapiro and ordinary BSTW ownership boundaries. No scratch source or unpublished construction is required to resume; all mathematical needs and validation results are recorded here or in the deliverables.
