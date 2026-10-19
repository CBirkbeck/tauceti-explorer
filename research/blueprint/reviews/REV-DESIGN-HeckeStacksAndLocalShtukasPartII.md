# Independent review: Hecke correspondences and local shtuka cohomology, Part II

Job: `REV-DESIGN-HeckeStacksAndLocalShtukasPartII` · Issue #3543 · Reviewer: Codex, session `codex-Wm58JK` · 2026-10-19.

**Verdict: accepted after correction.** This is a complete target-level planning pass, with eight explicit proof/supplier gates. All nine stages are planned and none is closed. Acceptance does not establish the outstanding mathematics or assert a Lean implementation. Each surviving node has a justified statement and proof route ending in existing owners, precise requests or recorded gaps. No unresolved contradiction remains in those qualified claims.

## Counts and scope

| Item | Before | After |
|---|---:|---:|
| Targets | 49 | 48 |
| Definitions / constructions / theorems | 9 / 8 / 32 | 9 / 8 / 31 |
| API entries | 86 | 86 |
| Definition/construction tests | 70 | 71 |
| Planets | 25 | 25 |
| Confirmed baseline declarations | 5 | 5 |
| Public source versions / source-issue verdicts | 14 / 0 | 14 / 14 |
| Planned / closed stages | 9 / 0 | 9 / 0 |
| Recorded gates / supplier requests | 8 / 13 | 8 / 13 |
| Routed continuations / routed items | 12 / 262 | 12 / 262 |

No node was added. One duplicate was removed: `HSD6/endpoint-fibres`. Its ordinary/Demazure estimates already belong to `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`. Every dependency and route mapping to the removed node now imports that owner. `HSD6/endpoint-correspondence` now owns only the Frobenius-graph application of existing flag incidence geometry; its API and planet were renamed accordingly. The HSD6 stage description and reader inventory now contain four targets.

The per-node verdicts below count **31 corrected and 17 verified**. A corrected verdict includes source-locator or test-taxonomy corrections even when the mathematical statement was retained. All 17 definitions/constructions have at least four discriminating tests; their API outlines cover the relevant constructors, characterizations, extensionality, structure and compatibility without promising nonexistent carriers. The 25 planets remain central definitions, constructions or named results, within the per-layer limits.

## Corrections applied

1. **Semi-modules and finite partitions.** Added nonemptiness of A, restored positive coprime m,h, made the central-shift convention explicit, and added an empty-set counterexample. The leading-index stratification is finite on a fixed determinant component; it is not a finite partition of an entire ADLV with infinitely many components. Set φ=−∞ off A.
2. **Spherical geometry.** Fixed the iterated-locus data: b is fixed, β is a generic framing, the terminal torsor is the Frobenius pullback, and modifications are generic-fibre isomorphisms. General G uses torsors; GL_h uses lattices. Added basicness in M and κ_M indexing to Levi reduction, kept the piecewise-morphism qualification and all fibre-dimension corrections. The exact spherical Mazur criterion now precedes its bounded-union corollary. Specified the twisted Lang map and root-slope correction rather than leaving an unnamed dimension assertion.
3. **Scope and ownership.** Imported existing generic flag incidence/fibre bounds, spherical semismallness and finite-type fibre dimension inequalities. Requests now concern the ADLV applications and compatible bounded models. SF.2 routes generic trace foundations to CohomologicalPointCounting; only the perfect-space/model application remains requested. Removed the undefined UR hypothesis and stated the mixed-characteristic reductive O_F-model branch explicitly. The main criterion no longer declares even its good-characteristic adjoint branch proved while G2/G7/G8 remain open.
4. **Source locators and matches.** Corrected Zhu’s nonexistent §3.1.4/(3.1.7)–(3.1.9) citation to §3.1.3, Proposition 3.3, diagrams (3.1.4)–(3.1.5), pp. 457–458. Zhu p. 460 invokes an adaptation of Viehmann; pp. 457–458 do not contain the claimed perfect chart equations. Corrected Hamacher’s main dimension theorem to Theorem 1.1 p. 12805 and the adjoint reduction to the text after Proposition 2.10 p. 12812; Lemma 2.4 is a Lang result. Corrected GHN’s basic shrunken criterion to Theorem B PDF p. 3, erratum Proposition 0.0.2 to p. 2, proper-Levi continuation to He21 §6.5 p. 14, and the GH10/GHKR/Zhu page ranges. He14 Theorem 10.3 has general δ; only Corollary 10.4 assumes δ=id. Repaired the two public TUM download URLs and synchronized reading records with the passages inspected; hashes identify the unchanged source versions.
5. **Tests, reader and Lean boundary.** Replaced vague tests by evaluated A₂ shrunkenness, A₁ factorization and nonperfect dual-number examples. Corrected the simple-square fibres to A¹ and G_m, both dimension one; the unit Frobenius pullback is X_v(b), not the generic endpoint orbit. Retagged all old `example` tests using the protocol taxonomy. Synchronized every target’s statement, hypotheses, source, API, tests, Check and direct prerequisites into the reader, including previously missing acceptance examples. The suggested Lean file keeps only its light real-bodied definitions and statements on pinned carriers; its opening now states the required nonexhaustive, reader-definitive boundary. No theory was developed in Lean.
6. **Gerbs.** The proposed component continuation explicitly imports `SchemeAndStackFoundations:key/galois-gerbs` for the characteristic-zero topological extension with algebraic kernel and `SchemeAndStackFoundations:SF.1/pro-gerb` for compatible projective systems. Stagewise conjugacy is not asserted to produce compatible conjugators or an inverse-limit conjugator. No generic gerb or pro-gerb is planned here.

## Baseline audit

All five declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.

| Declaration and module | Verified use and limit |
|---|---|
| `DoubleCoset.doubleCoset`, Mathlib/GroupTheory/DoubleCoset.lean | Set product s*{a}*t; supplies the actual point-condition carrier. |
| `DoubleCoset.mem_doubleCoset`, same module | Membership by the two side factors and middle representative, with the needed multiplication order. |
| `QuotientGroup.leftRel_apply`, Mathlib/GroupTheory/Coset/Defs.lean | Left-coset relation iff x⁻¹y belongs to the subgroup; no normality is needed. |
| `DoubleCoset.mul_mem_doubleCoset_iff`, TauCeti/GroupTheory/DoubleCoset/Basic.lean | Under membership in the left subgroup, left multiplication preserves the double-coset condition. |
| `Finset`, Mathlib/Data/Finset/Defs.lean | Duplicate-free finite carrier, usable for residue bases; supplies no semi-module theorem. |

The reviewed `data/library-coverage.json` entries for BG0–BG4, GS0–GS4 and HS0–HS4 were checked. Existing group and isocrystal foundations are reused; no ADLV dimension or cordiality implementation was found. The current read-only TauCeti tree was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27`. Searches covered all nine newer roadmap directions named in WORKERS. RootSystems and ReductiveGroups READMEs were read in full, with relevant ReductiveGroupsPartII and LieHighestWeight boundary sections also checked.

## Supplier and closure audit

| Supplier read | Import or precise boundary |
|---|---|
| Current RootSystems, layers 3, 4 and 6 | Existing finite Coxeter/Bruhat, chamber and integral root-data carriers. G1 requests the additional extended-affine twisted Red-Min, Demazure/support and least dominant subtraction package; it does not re-plan ordinary Bruhat order or a root system. |
| ReductiveGroupsPartII RG2.1–RG2.4 exact affine/parahoric nodes | Reuse apartment, root groups, connected parahorics, Iwahori–Weyl extension, Bruhat/length, normal form, κ and dominance. Current README `translation-length-formula`, lines 5367–5384, already includes cordiality of x t^λ; that theorem is imported. The new target identifies its generic Newton class. |
| BunGAndNewtonStrata BG0/BG1 exact nodes | Reuse B(G), κ/ν, defect, Levi comparison, averages, straight classes and ordered unramified norm/centralizer identities. The z-extension bounded-lifting node has p-adic scope and cannot alone prove an equal-characteristic component comparison. G6 and G8 request superbasic classification and geometric purity/poset-length additions. |
| GS0:Witt-geometry/flag-incidence-correspondences and /flag-convolution-fibres | These already supply generic triple flags, bounded models, ordinary/Demazure surjectivity and the two fibre bounds. Removed the duplicate local theorem; retained G5 for the scope of flag transfers. |
| GS1/semi-infinite-affineness; GS2:correspondences/convolution-diagram and /rational-special-fibre-convolution | Existing semi-infinite geometry, convolution carriers and geometric semismallness are imported. The arbitrary-Levi bound, compatible ADLV pullbacks and top-endpoint attainment are precisely distinguished from those promises. |
| SF.0/fibre-dimension-formula, dimension/semicontinuity and SF.1 space/descent nodes | The finite-type inequalities and carriers exist as roadmap targets. G2 concerns compatible bounded ADLV models and passage at generic points, not another generic fibre-dimension theorem. |
| SF.2/upstreamIntegration | Generic constructible étale theory, compact supports and trace are routed to CohomologicalPointCounting, including TraceFormula layer 11. That family’s perfect-space application was not independently established here and remains G4; a routing entry is not used as a proof. |
| Current SmoothRepresentationsOfLocalGroups SR.1 Hecke sections | `permutation-hecke-algebra` and `hecke-ring-comparison` do not state the integral twisted cocenter basis/positivity/recursion required here. G3 requests that extension once in its owning direction. |
| SchemeAndStackFoundations:key/galois-gerbs and SF.1/pro-gerb | Imported in the component-continuation proposal with characteristic, continuity, algebraicity and compatibility conventions preserved. No stagewise-to-compatible conjugator theorem is presumed. |
| Base HeckeStacksAndLocalShtukas HS0–HS4 | Generic Hecke cohomology and local-shtuka diamonds/towers are distinct from a classical reduced ADLV, its integral model and specialization. Proposed continuations preserve those boundaries. |

All node chains were checked at target granularity. HSD0–HSD8 remain correctly ordered, with no circular use of the main criterion to obtain its basic seed. Generic suppliers terminate at their own promised statements or the recorded scope extension; no gap is hidden behind a stage name. The five chain spaces and both ordinary/Demazure endpoint bounds remain explicit in the reader’s chain ledger.

The 12 `routeCoverage` lists were compared item-for-item with their source paper-result routes: all 262 item identifiers are retained, without omissions or additions. The 53 HE21 and 16 ZHU17 dimension items remain in this lane or its explicit imports. The other 193 items retain proposed integral, component or Kottwitz continuation owners; their preservation is a routing audit, not a new independent proof audit of those future roadmaps. Proposed identifiers are never used as already-adopted dependency suppliers.

## Per-target verdicts

The bibliography, public URLs, exact source versions and hashes are in the packet and reader. Published page numbers are used unless a locator says PDF. The notes below record mathematical checks and changes, not source excerpts.

| Target | Verdict | Evidence and decision |
|---|---|---|
| `HSD0/point-locus` | corrected | He21 §2.2 p. 5 and He14 Definition 1.1 p. 372 support the representative formula. Checked descent under g↦gi without subgroup normality and the noncommutative S₃ test; retagged the tests by their actual roles. |
| `HSD0/virtual-dimension` | corrected | He21 §2.2 p. 5 fixes η=σ⁻¹(y)x, F-split defect and the negative Newton term. Checked the GL₂ and twisted A₂ computations; rational arithmetic and all hypotheses retained; test tags corrected. |
| `HSD0/shrunken` | corrected | He15 §2.9.4 PDF p. 36 and He21 §2.2 p. 5 give the open critical strips. Replaced the generic bound warning by λ=6ω₁∨ in adjoint A₂, which satisfies λ≥2ρ∨ but preserves the α₂ strip. Boundary tests retain the open-strip convention. |
| `HSD1/minimal-reduction` | verified | He21 Theorem 3.1 p. 6 and HN14 Theorem 2.9/Corollary 2.10 PDF pp. 10–12 support the minimal-element reduction. The generic twisted Red-Min/straight–finite-parabolic input remains G1, not a theorem of finite Bruhat order. |
| `HSD2/semimodule` | corrected | Viehmann06 Definition 3.1 and Lemmas 3.2–3.3 PDF pp. 3–4 require positive coprime m,h. Added nonemptiness, restored m≥1 and a positive central shift, and added the empty-set counterexample; residue-basis and normalization APIs remain explicit. |
| `HSD5/double-flat` | corrected | He21 §§5.1–5.2 pp. 8–9 supplies dominance subtraction and the double-flat bound. Checked left descents, σ⁻¹ and the full coweight lattice P∨. All five tests discriminate these choices; retagged them. G1/G7 retain existence and original-lattice descent. |
| `HSD7/p-alcove` | corrected | GHN15 Definition 3.3 PDF p. 10 and He21 §§6.1–6.2 pp. 12–13 fix the twisted conjugation and root-group orientation. Checked the x-conjugator identity and wrong-conjugator test; test tags corrected, no condition dropped. |
| `HSD3/unipotent-loop-comparison` | corrected | GHKR06 Proposition 5.3.1 PDF pp. 19–21 gives surjectivity and the root-slope dimension correction. Added the precise map and formula; corrected Zhu to §3.1.2 pp. 456–457. Perfect models, linearization and the trace application remain G4, with generic trace ownership routed through SF.2. |
| `HSD0/spherical-loci` | corrected | Zhu17 §3.1.1 pp. 455–456 supports the exact/bounded distinction after O_L coefficient extension. Replaced the vague domain test by k[ε]/ε², whose Frobenius is not injective; the torus and GL₂ tests preserve nonemptiness and exact-position checks. |
| `HSD2/extended-semimodule` | corrected | Viehmann06 Definition 3.4 PDF pp. 4–5 gives support, growth, upper bound and chain conditions. Checked the cyclic (h,m)=(2,1) example and empty V. Retagged tests; construction, evaluation and finite-pair APIs retain these conditions. |
| `HSD5/factor-data` | corrected | He21 §5.4 pp. 10–12 fixes β,γ and the two factorizations. Added an evaluated adjoint A₁ test with x=y=s, λ=2ω∨, product t^(−2ω∨) and lengths 2+0. Ordinary and Demazure products stay separate; test tags corrected. |
| `HSD0/geometric-realization` | corrected | He14 pp. 371–372 and Zhu17 Appendix A.13–A.16 pp. 471–472 support the distinct classical and perfect carriers. Removed the undefined UR hypothesis, stated the reductive O_F-model branch, imported SF.0/fibre-dimension-formula directly, and retained bounded-diagram G2/G5 gates. |
| `HSD2/lattice-strata` | corrected | Viehmann06 §4 PDF pp. 5–8 gives the leading-index strata on a fixed determinant component. Added φ=−∞ off A and restricted the finite partition to that component. Zhu17 p. 460 only invokes an adaptation; it does not provide the chart equations previously attributed to pp. 457–458. G4 remains open. |
| `HSD3/iterated-locus` | corrected | Zhu17 §3.1.3 Proposition 3.3, diagrams (3.1.4)–(3.1.5), pp. 457–458 is the actual locator. Fixed b as input, made β a generic framing, imposed E_d=σ_E*E₀, and used torsors for general G and lattices for GL_h. Imported the exact convolution-diagram node; corrected tests and locator. |
| `HSD4/mazur` | corrected | He21 Theorem 4.4 p. 7 and He14 Theorem 7.1 pp. 389–390 first give the exact spherical nonemptiness criterion. Stated that criterion before deriving the bounded-union version; the top exact stratum supplies sufficiency. Integral κ and rational Newton dominance remain distinct. |
| `HSD0/transport` | verified | He14 Definition 1.1 p. 372 and He21 §2.2 p. 5 give the σ-conjugacy transport. Checked representative independence, centralizer equivariance and the unchanged integral κ; no new geometric comparison is inferred from the point formula. |
| `HSD1/minimal-geometry` | verified | He21 Theorem 3.2 p. 6 and He14 Theorem 4.8 pp. 382–383 give emptiness off the minimal σ-class and dimension ℓw−〈ν,2ρ〉 on it. The straight/parabolic and general flag scope inputs remain G1/G5. |
| `HSD1/reduction-geometry` | verified | He14 Corollary 6.2 pp. 387–388 and GH10 Proposition 2.5.2 PDF pp. 6–8 give the two pieces with A¹/G_m fibres and the max-plus-one recursion. Checked the σ-labelled branch and nonempty-stratum qualifications; no unsupported global product is asserted. |
| `HSD2/chart-dimension` | corrected | Viehmann06 Theorem 4.3 PDF pp. 5–8 supplies the coefficient chart and |V|-count. Replaced the incorrect Zhu17 pp. 457–458 attribution by the adaptation invoked at p. 460, explicitly leaving actual perfect chart morphisms and dimension comparison in G4. |
| `HSD3/levi-reduction` | corrected | GHKR06 Proposition 5.6.1 PDF pp. 29–31 and Hamacher15 Proposition 2.9 pp. 12810–12811 require b basic in M. Added that hypothesis, the κ_M-index restriction and piecewise morphism qualification. Retained d and both Newton corrections; imported the existing GS1 bound and kept the general-Levi extension precise. |
| `HSD3/norm-geometry` | verified | Zhu17 Lemma 3.5 p. 459 supports the ordered norm and σ-centralizer identity after inverse-cycle indexing. Checked the degree-three component action against BG1/product-and-unramified-norm; defect and pairing comparisons use that owner instead of a new norm definition. |
| `HSD3/convolution-estimate` | corrected | Zhu17 Proposition 2.3 p. 432 and proof of Proposition 3.3 pp. 459–460 use exact endpoint strata. Imported GS2/rational-special-fibre-convolution, which already owns geometric semismallness, and narrowed G4 to compatible ADLV pullbacks and nonempty zero-dimensional top attainment. |
| `HSD4/generic-newton` | corrected | He21 §§4.1–4.3 p. 7 and Viehmann14 Corollary 5.6 p. 1028 support greatestness for the relevant cell closure. Checked fixed κ and the distinction from saturation; retagged tests. G8 explicitly retains the purity/poset and closure comparison proof inputs. |
| `HSD6/endpoint-correspondence` | corrected | He21 Proposition 5.6 p. 10 and §5.4 pp. 11–12 use imported triple-flag incidence geometry. Restricted the local target/API to its bσ-graph pullback, imported both GS0 nodes and renamed its planet. Corrected the unit case to X_v(b) and the simple-square fibres to A¹ and G_m, both dimension one. |
| `HSD1/class-polynomial-dimension` | verified | He14 Theorem 6.1 pp. 387–388 gives dimension=degree with all extended-affine σ-classes sharing κ and Newton data, not just a chosen class. Zero degree is −∞. G3 retains the integral twisted cocenter, positivity and recursion; no polynomial oracle is assumed. |
| `HSD1/dimension-advantage` | corrected | He21 §3.3 p. 6 gives the universal nonempty-right inequality. Checked reflexivity, transitivity and η-length direction with the Newton/defect cancellation. Retagged four tests; the empty-right case imposes no nonemptiness condition. |
| `HSD2/superbasic-dimension` | corrected | Viehmann06 Proposition 5.2/Theorem 5.3 PDF pp. 8–12 supplies the maximal |V| bound and attaining cyclic module. Replaced the unsupported perfect-chart locator by Zhu17 p. 460 and retained G4; positive central-shift and fixed-component conventions are inherited. |
| `HSD3/adjoint-components` | corrected | Hamacher15 p. 12812 after Proposition 2.10, rather than Lemma 2.4, supplies the component reduction. Corrected that locator and GHN erratum Proposition 0.0.1 to p. 1. Explicitly restricted the BG z-extension import to its p-adic scope; G7 retains characteristic and original-κ comparisons. |
| `HSD6/two-correspondences` | corrected | He21 §5.4 pp. 11–12 supports the five chain spaces and two endpoint comparisons. Checked the retained X₁–X₅ ledger, σ-labelled rotations, ordinary first endpoint and Demazure second endpoint; retagged tests. No chain is replaced by an unspecified witness. |
| `HSD7/levi-obstruction` | corrected | He21 Theorem 6.3 p. 13 and official GHN erratum Proposition 0.0.2 support quantification over all Levi classes mapping to [b]. Corrected the erratum page to p. 2; basic-only uniqueness is never used for a nonbasic class. |
| `HSD3/superbasic-factors` | verified | CKV15 Lemma 3.1.1 PDF pp. 20–21 supplies the unramified adjoint Res PGL_h reduction, subject to its Tits classification input. G6 explicitly retains that unread residual classification, superbasic criterion and GL_h lift with κ bookkeeping. |
| `HSD4/generic-dimension` | verified | MV20 Lemma 3.2 PDF pp. 6–8 and He15 Theorem 2.23 PDF p. 34 fix normalized cell dimension and the 〈ν,2ρ〉 conversion to ADLV dimension. G8 retains purity, Newton-poset length and cell/ADLV geometry; BG classification alone is not treated as sufficient. |
| `HSD6/correspondence-dimensions` | corrected | He21 §5.4 pp. 11–12 gives the two lower-bound comparisons. Redirected the removed endpoint-fibres prerequisite to GS0/flag-convolution-fibres and imported SF.0/fibre-dimension-formula. G2 retains compatible bounded models and the generic-point argument, without a finite global component assumption. |
| `HSD7/support-obstruction` | verified | He21 §6.2 p. 13 and GHN15 Lemma 3.6.3 PDF pp. 14–15 give the proper-support Levi obstruction. Checked the x-conjugator, σ-saturated support and strictly positive simple-coroot coefficients; the corrected all-Levi-class criterion is a direct prerequisite. |
| `HSD7/basic-seed` | verified | He21 §6.3 p. 14 and He14 Propositions 11.6–11.7 pp. 399–401 motivate the nonshrunken basic seed. He15 Theorem 2.27 does not cover it. G1/G3/G7 explicitly retain the twisted-Coxeter coefficient, corrected induction and γ=0 finite-quotient case. |
| `HSD7/proper-levi-continuation` | corrected | Corrected the source to He21 §6.5 p. 14. This is a restricted proper-Levi continuation with its comparison hypotheses, not a new unconditional general nonemptiness criterion or a silent removal of strict positivity. |
| `HSD3/spherical-dimension` | corrected | Corrected Hamacher to Theorem 1.1 p. 12805 (setup p. 12804) and Zhu Proposition 3.3 to pp. 457–460. The formula is asserted only for a nonempty locus. Verified the reduction order from Levi to superbasic factors, charts, norms and convolution, with their gates retained. |
| `HSD4/cordiality` | corrected | MV20 Definition 3.14 PDF p. 9 and He21 §4.1 p. 7 identify cordiality with equality at the generic Newton class. Checked the defect/Newton conversion and that it does not mean equality on arbitrary classes; four tests retagged. |
| `HSD6/cordial-reduction` | verified | He21 Theorem 5.5 p. 9 and §5.4 pp. 10–12 give advantage over the constructed cordial family. The current upstream translation-length target already owns family cordiality; it is imported. G2/G7 retain chain geometry and full-lattice descent. |
| `HSD3/virtual-upper-bound` | corrected | He14 Theorem 10.3 pp. 396–397 is stated for general δ; only Corollary 10.4 specializes δ=id. Corrected that attribution. He15 Theorem 2.30 PDF p. 38 supplies the normalized-cell conversion; G5 retains the needed general geometric transfers. |
| `HSD4/cordial-equivalence` | verified | He21 §4.1 p. 7 gives equivalence for equal generic class and the correct η-length ordering. Checked the greatest-class step and cancellation of virtual dimensions; generic saturation is not presumed in this implication. |
| `HSD4/saturation` | verified | MV20 Theorem 3.16 and Corollary 3.17 PDF pp. 9–10, used by He21 Theorem 4.1 p. 7, give interval saturation and equidimensionality in their equal-characteristic setting. G8 retains purity and poset lengths; G5 records any wider local-field transfer. |
| `HSD4/translation-generic` | verified | He21 Theorem 4.2 and proof p. 7 identify the generic class for x t^λ. Current ReductiveGroupsPartII already supplies cordiality; this node adds only the generic-class/closure dictionary, not a duplicate cordiality theorem. |
| `HSD7/cordial-interval` | verified | He21 §6.3 p. 14 uses the established basic seed below [b] before invoking cordial saturation. Checked that the dependency order prevents circularly using the main nonemptiness theorem to manufacture the seed; G7 remains explicit. |
| `HSD8/main-criterion` | corrected | He21 Theorem 6.1 p. 13 requires shrunkenness, strict Newton gap and the double-flat bound. Removed the false claim of an established adjoint branch: G2/G7/G8 remain open even there. The target is conditional on its complete prerequisite chains and G1–G8 for the chosen datum. |
| `HSD8/main-dimension` | verified | He21 Theorem 6.1 p. 13 gives the displayed virtual dimension after nonemptiness. Checked the split adjoint A₁ example w=s t^(nα∨), b=1, η=s, yielding n+1, and retained it in the reader with the correct chamber convention. |
| `HSD8/basic-case` | corrected | Corrected the shrunken basic criterion to GHN15 Theorem B, PDF p. 3, with the official erratum. He21 §6.3 p. 14 preserves shrunkenness and the stated strict gap; the basic specialization does not become an unrestricted criterion. |
| `HSD8/large-translation` | verified | He21 Corollary 6.4 p. 14 uses λ^♦≥ν+2ρ∨ together with shrunkenness. Checked the double-flat deduction, coweight rather than weight notation and the independent A₂ strip counterexample; G1/G7 retain lattice issues. |

## Source-issue review

All fourteen inherited source issues were independently checked at their locators and now carry a `confirmed` review with this job’s identity. No entry is rejected and no new source issue is added. Several confirmations concern a convention or an unfilled proof obligation, not a claim that a published theorem is false. No source passage is quoted. The official GHN erratum was read in full; other search records do not claim an exhaustive absence of corrections.

| Issue | Confirmed finding and effect |
|---|---|
| `E1` | Theorem 0.5 p. 410 and §3.1 pp. 455–456 omit an explicit qualifier; GL₂ with b=1 and μ=(1,0) gives an empty locus by determinant valuation and numerical value 1/2. The nonempty formulation is necessary. |
| `E2` | The proof on pp. 459–460 applies the endpoint estimate on a closed bound. Exact endpoint strata have distinct bounds; the finite stratification and top attainment give the corrected argument. |
| `E3` | The §6.2 normal-form identity on p. 13 uses x⁻¹wσ(x)=t^λyσ(x); σ⁻¹(y) is not the required conjugator. GHN Lemma 3.6.3 uses the normal-form chamber factor. |
| `E4` | The p. 8 arguments are in the cocharacter lattice and allow zero differences. Simple coroots and nonnegative coefficients give the type-correct version; strict cones cannot contain zero. |
| `E5` | The p. 12 proof has not established finiteness of the component-indexed exceptional union. This is confirmed as a local proof obligation, not a claim that the theorem is false; G2 retains the bounded generic-point argument. |
| `E6` | He21 §6.3 p. 14 cites He15 Theorem 2.27, whose statement on PDF p. 37 requires shrunkenness. The reduced a t^γ is not proved shrunken. G7 keeps the replacement seed proof open. |
| `E7` | The fundamental coweights in §5.4 pp. 10–11 need only lie in P∨. Simply connected A₁ has ω∨=α∨/2 outside its cocharacter lattice. G7 retains original integral-κ descent. |
| `E8` | Official Proposition 0.0.1 p. 1 restricts the good-characteristic componentwise comparison and separates the component-injectivity criterion for a global immersion. |
| `E9` | Official Proposition 0.0.2 is on p. 2. It imposes basicness; the GL₂ diagonal torus example gives two distinct Levi classes in one nonbasic G-class. |
| `E10` | Proposition 11.6 pp. 399–400 has the undefined factor and inconsistent twisted-support/index expressions. The identified slips are confirmed; the repaired twisted induction itself remains G7. |
| `E11` | The framing on p. 455 must be evaluated after O_L coefficient extension so a general b∈G(L) acts. This is a base convention clarification, without changing the intended perfect functor. |
| `E12` | The component action in Proposition 3.3 p. 458 and Lemma 3.5 p. 459 uses the inverse Frobenius cycle. The degree-three tensor decomposition detects the incompatible positive indexing. |
| `E13` | The final maximum on p. 12811 omits the d and Newton corrections retained in Proposition 2.9(4). The plan uses the proposition’s statement, with b basic in M. |
| `E14` | In (A.3.4) p. 481 restriction along J→J/J₁ runs from quotient-equivariant to J-equivariant objects. The reverse equivalence uses connectedness and trivial action as in the surrounding proof. |

## Remaining work and questions for the orchestrator

This review is finished; no checkpoint or unfinished review work is being handed off. Package and follow-up work must preserve these gates:

| Gate | Remaining obligation |
|---|---|
| G1 | Extend the generic root-data direction with twisted affine minimal reduction, Demazure/support and integral dominant subtraction. The He–Yang Theorem 1.1 proof cited by He14 Proposition 11.7 was not read; retain its supplier audit. |
| G2 | Construct compatible bounded ADLV/Frobenius-chain models and justify the generic-point passage; do not assume finitely many components globally. |
| G3 | Supply the integral twisted affine-Hecke cocenter basis, positivity, recursion and twisted-Coxeter coefficient. HN14 Theorem 6.7 and the relevant generic algebra proofs remain to be audited for that extension. |
| G4 | Construct actual perfect chart morphisms, verify linearization/Lang admissibility and dimension, apply the existing generic trace direction to perfect models, and prove top-endpoint attainment. |
| G5 | Justify general σ, ramified and mixed-characteristic flag transfers and the Newton-cell closure/dimension comparisons beyond the read equal-characteristic setting. |
| G6 | Audit the Tits classification input behind CKV Lemma 3.1.1 and supply the superbasic criterion, Res PGL_h classification, GL_h lift and κ bookkeeping. |
| G7 | Complete the nonshrunken basic-seed proof (including twisted induction and γ=0), and the characteristic-sensitive original-lattice/component descent. |
| G8 | Supply Newton-cell purity, Newton-poset lengths, greatestness/closure and the cell/ADLV dimension comparison; an abstract B(G) order is insufficient. |

The orchestrator should decide whether to adopt the six existing restructuring proposals and coordinate G1/G3 with their proposed owner extensions. The component, integral and Kottwitz proposals retain complete route inventories. In particular, direct future gerb work to the two existing SF gerb nodes, and coordinate G4’s perfect-space trace application with SF.2’s CohomologicalPointCounting route. None of these proposals authorizes duplicate generic definitions or edits to upstream roadmaps in this job.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukasPartII.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HeckeStacksAndLocalShtukasPartII.lean`: exit 0 at the shared pinned build; ten warnings, all `declaration uses sorry` (five theorems and five examples). Two light definitions have actual bodies. No Lean server or Lake build/update/cache command was used.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: five files, zero problems.
- Checked exact reader/packet target, hypothesis, API, test, acceptance and source synchronization; all route inventories and all five allowed deliverable paths; valid JSON and `git diff --check`.

The suggested file is a statement sample on existing carriers. The reader is definitive for geometric targets whose carriers are absent at the pins. The resulting accepted planning pass retains every outstanding mathematical gate explicitly.
