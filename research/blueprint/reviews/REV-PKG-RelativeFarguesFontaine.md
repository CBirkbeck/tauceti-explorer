# Independent package review: RelativeFarguesFontaine

**Verdict: accepted, with corrections applied in place.** Review job REV-PKG-RelativeFarguesFontaine, issue #9237, done by Claude (session claude-Ejovdd) on 2026-10-13. The reviewer did not write any of the package. The package under review is the one merged from PR #9485 (Codex, session codex-i965fD). The accepted plan is the packets `RelativeFarguesFontaine--RF0.json` (73 nodes) and `RelativeFarguesFontaine--RF4.json` (23 nodes); neither packet was edited.

## Checks against the six requirements

| Requirement | Finding |
| --- | --- |
| 1. Upstream form | Pass. Compared with TauCetiRoadmap AdicSpaces (README, Layer 6 in full) and LocalGaloisGroups (Suggested.lean header). The README has the upstream shape: title and **Summary.**, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 with `### k.n` targets, an API list and **Checks.** for every definition, `### Examples` and `### Dependencies` per layer, Downstream consumers and References. 95 target sections; 279,748 bytes. |
| 2. Fidelity to the plan | Pass after corrections. All 96 plan nodes map to README sections (§6.16 carries RF0's punctured-algebraicity node and RF4's Kedlaya-algebraicity node). All 204 API names and all 122 named Checks of the packets occur in the README (scripted check). A node-by-node comparison of statements, hypotheses and locators found the omissions listed under "Corrections", now repaired. One statement was rescoped (§6.8, below), as the plan's own gap entry invited. |
| 3. Own words, locators | Pass. A 10-word-shingle comparison of the README against the downloaded FS, SW, KL I, KL II, BMS, Kedlaya A_inf, Fargues, Guo–Reinecke and Stacks texts found only shared reference titles, one formula and one ordinary phrase, which was reworded. Every target cites theorem, section and page. |
| 4. No process | Pass after corrections. Node identifiers and planning language (`C4`, `S5`, `VS1’s`, `BG2:uniformization`, "the final plan", "request", "missing upstream inputs", "proof obligations not covered by a read source", "until … established", "once … supplied", "export") were rewritten as mathematics or as named roadmap layers. |
| 5. Suggested.lean | Pass. `lean-check` exits 0 before and after the corrections, with 31 warnings, all `declaration uses 'sorry'`, and no other diagnostics (Mathlib 082e2d3, Tau Ceti f790474). 342 lines; no sorry'd data, no `True` placeholders, no theory development; every README `Define` name is a declaration or is listed in the closing comment. |
| 6. metadata.toml | Pass: `topic = "math.NT"`, the same as the sibling VectorBundlesAndIsocrystals package. |

## Sources

A random sample of 15 target sections (seed 9237): §§0.1, 0.12, 0.13, 0.17, 0.21, 0.22, 1.14, 3.3, 4.5, 4.6, 5.2, 5.5, 6.2, 6.3, 6.5. Each locator was opened in the cited edition and the statement compared with the README. All 15 are correct. The package handoff flagged no locator as unverified; in addition, these were checked: §§0.2, 0.5–0.7, 0.11, 0.14–0.16, 0.18–0.20, 1.1, 1.2, 1.5, 1.6, 1.15, 2.1, 2.2, 2.5, 3.1, 3.2, 3.4–3.8, 4.1–4.4, 4.7, 5.1, 5.3, 5.4, 5.6, 6.1, 6.4, 6.11, 6.12, 6.16 and the FS part of 7.6.

Editions read (SHA-256 of the public files): FS November 2024, `9ab9efbd…ae905`; FF April 2017, `cc159f38…2ca3`; Kedlaya A_inf v5, `ee95ce2f…3530`; Fargues, *Simple connexité*, `35c7268f…ef73`; SW March 2020, `22550517…bffc`; KL I arXiv v5, `a6a11742…d942`; KL II arXiv v3, `97383900…42c`; BMS arXiv v3, `285f7d20…072a`; Guo–Reinecke arXiv v3, `3c49a5f2…8d26`. Stacks tags 0BNR, 0BNS, 0BNW, 0BP2, 0BNN, 09XI, 09ZL and the section 0BNI were read online on 2026-10-13.

Source findings:
- **§2.5 statement corrected.** In FF's preface (P. Colmez), Remark 3.19, p. 38, the base field is an arbitrary algebraically closed C♭; the punctured perfected disc over it presents Spd(C♭)×Spd(E_LT∞). The README (and the plan) said "the perfect field F obtained by tilting the completed Lubin–Tate tower", which makes the statement a single special case and confuses the base with the tower. The target now reads: F any perfectoid field of characteristic p over F_q; the tilt of E_LT∞ is F_q((t^(1/p^∞))) and supplies the disc coordinate. FS Corollary II.2.4 and proof, p. 61 (Spd E_∞ → Spd E is the O_Eˣ quotient, then φ^ℤ gives Div¹), was added as a locator.
- **§4.7 locator completed.** The presentation Div¹ = Spd(Ĕ)/φ^ℤ over Perf_k is in the paragraph after FS Corollary II.2.4, p. 61, not only at Definition II.1.19, p. 56.
- **§6.11 normalization made explicit.** KL I Definition 8.8.18 and Lemma 8.8.19 print "pure of slope 1" for L_X. With KL's own conventions — Definition 4.1.6, Convention 4.1.13 (divide by a) and Definition 6.2.1, p. 135 (the twist multiplies φ^a by p^(−n)) — the module M(1) built in the proof of 8.8.19 has slope 1/a. The README's 1/a is therefore right; a parenthesis now records the printed discrepancy and that only positivity is used.
- FS p. 48 (2024 copy) prints t₁♯ = π/[ϖ], matching the README's Conventions. The package handoff's remark that the 2024 copy reverses this was not confirmed, but the README states the correct form, so nothing changes.
- Stacks Lemma 15.92.10: glueability is bijectivity of M[f^∞]→(M⊗R′)[f^∞] in general, and injectivity once (R→R′, f) is a glueing pair. The README states both correctly; the Lean docstring of `Glueable` now says so.
- KL I Lemma 5.5.2 prints z₀ = 0 as the initial residual and Corollary 5.2.12's proof reuses n as an iteration index; the README's corrected readings (KL II Appendix A) stand.

## Corrections made

README.md:
1. **§6.8 rescoped (gap closed).** The target was a theorem "conditional on" a punctured-formal comparison that AdicSpacesPartII R3 was asked to supply. The accepted AdicSpacesPartII package has no such comparison (R3.27/R3.29 give bundles on sheafy affinoids and Kiehl gluing only). For arbitrary data on the complement it cannot exist: a bundle map on the complement need not be meromorphic along D (on a punctured disc, Σ c^(n²) z^(−n) with 0<|c|<1 converges and has infinitely many polar terms), so such data have no realization over B_D. The plan's gap entry asks to "exhibit the necessary scope correction". §6.8 now defines a *meromorphic vector bundle on X-cal∖D* (chart models: finite projective A_i[1/ξ_i]-modules, compatible under rational restriction) and proves the triple equivalence for such data from §6.4, §6.5, §3.8 and R3 gluing, with a full proof sketch. That sketch covers the overlap comparison via uniqueness in Beauville–Laszlo for (A_V, ξ_V). It recovers §6.7 and KL 8.9.6(b)–(c). The Lean name changed to `complement_formal_patching`. Matching edits: the R3 supplier contract (the extra demand removed), Conventions, the pointer in §6.7, §6.9 (new clause (e) and its proof), and §7.2(iii) and its proof.
2. §2.5 statement and hypotheses, §4.7 locator, §6.11 normalization note (see Sources).
3. Duplication citations (see below): Scope now cites current Tau Ceti `TauCeti.RingTheory.WittVector.Complete` and `mem_spaAnalytic_iff_of_isAdic`; §0.13 states the p-typical case is Tau Ceti's and says in one clause how the target differs; §6.10(b) and the "From Tau Ceti" contract cite `IsAdicComplete.pow` and `IsAdicComplete.of_le_of_pow_le`.
4. Process language removed in §§0.22, 1.8, 2.5, 3.6, 3.8, 4.5, 4.7, 5.1, 6.13, 6.16, 7.6, 7.7. In §3.6 the local factorization and ideal descent are now stated as part of the target, not as a condition "until established". In §6.16 the ramified and equal-characteristic analogues are stated to be outside the roadmap, not "proof obligations not covered by a read source". In §7.6 the stalk comparison is the named theorem `completedDivisorGeometricStalk` of §3.8.
5. Plan content restored: §0.21 W carries its (p,[ϖ])-adic topology; §6.16 states that with x=ϖ the locus Y-ad is Z_S of §0.21, and gives Kedlaya Example 3.14's page (p. 10); §4.7 names VB3 as the owner of Div¹'s properness and smoothness; §5.1 states that the arbitrary-rank functor is not used.
6. References: five entries cited nowhere were removed (Hansen–Kedlaya, Zhu, Bhatt–Scholze *Witt*, the NSF edition of Guo–Reinecke, the 2021 FS copy); KL II is now linked where cited. The Guo–Reinecke locator (proof of Theorem 4.15, p. 43) was checked against the cited arXiv v3, where it is correct; the plan's pp. 74–75 refer to the journal edition.

Suggested.lean: the module docstring now carries the standard note (not the roadmap, not exhaustive, README definitive) and the design choices; Layer 2–4 and 7 section titles now match the README; the `Glueable` docstring states the Stacks 15.92.10 equivalence precisely; the closing comment lost a name that is not a README definition (`ExactSquare.FiniteProjectiveSurjective`) and a process sentence.

## Duplication against current Tau Ceti and TauCetiRoadmap

Checked against TauCetiRoadmap 0d144d0 and Tau Ceti a91d3aaf by object, not only by name. No target is removed:
- `TauCeti.RingTheory.WittVector.Complete` (current, not at the pin) proves (p,[ϖ])-adic completeness and separatedness of W(R) and A_inf. This is the E=ℚ_p case of part of §0.13. The target keeps all E and the comparison with Teichmüller coefficients and Gauss norms, so it is kept, with the citation.
- `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.{Y,Window,Quotient}` and `TauCeti.RingTheory.Huber.WittVector` were already excluded by the package, apart from `mem_spaAnalytic_iff_of_isAdic`, now named as the underlying locus of §0.21.
- `TauCeti.RingTheory.AdicCompletion.Pow` is a tool for §3.8/§6.10, not a target duplicate; now cited.
- `TauCeti.AlgebraicGeometry.ProjectiveSpectrum.Basic` (chart independence of Spec-points of Proj) is related to §5.6 but concerns Spec R-points, not maps from a locally ringed analytic space; no change.
- TauCetiRoadmap AdicSpaces Layer 6 (absolute ℚ_p curve over a perfect field, windows, B^I) is already the anchor of §1.16; ClassFieldTheory explicitly excludes Lubin–Tate theory; AlgebraicVectorBundles is already excluded; none of the nine newer roadmaps overlaps.

All Mathlib and Tau Ceti declarations cited at the pins (`TauCeti.Huber.Pair`, `TauCeti.ValuationSpectrum.spa`, `TauCeti.AffineGroupSchemeCat`, `TauCeti.Comodule.IsFaithful`, `…isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom`, `TauCeti.ReductiveAffineGroupSchemeCat`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `BDeRham`, `PreTilt.untilt`, `IsAdicComplete.henselianRing`, `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `Algebra.FormallyEtale.of_isSeparable`, `.comp_bijective`, `IsAdicComplete.liftRingHom`, `AlgebraicGeometry.projIsoSpec`, `CommAlgCat.FiniteEtale`, `FormalGroup`, `MvPowerSeries.eval₂`, `Module.Invertible`, `Module.length` and the others in the contracts) were elaborated with `#check` at the pins.

## Lean signature spot checks

| Declaration | Comparison with the README |
| --- | --- |
| `ramifiedGhost`, `ramifiedWittPolynomials` | §0.1 formula over any commutative coefficient ring; p-typical example equals `WittVector.ghostComponent` |
| `ramifiedGhost_natural` | O-algebra maps, no ghost injectivity |
| `WittTwistAdmissible` | every coefficient of Q−X^q divisible by π; X²+1 over ℤ with π=2 is a negative control |
| `twistedGhost` | iterates Q; Q=X^q recovers `ramifiedGhost` |
| `periodRadiusValue_frobenius` | rad(φx)=q·rad(x), with 0<πval<1 and teichval>0 |
| `twistMultiplier`, `IsTwistSection`, `twist_invariance_iff` | π^(−n)φ ↔ φ(x)=πⁿx; n=1 gives π⁻¹; φ=id, x=1, π≠1 fails |
| `ExactSquare` | exactness at all three places; k[x]→k[x,1/x]³ non-example |
| `GlueingDatum.IsSection` | ψ₁(1⊗x₁)=ψ₂(1⊗x₂); identity datum gives the diagonal |
| `GlueingPair`, `Glueable` | quotient isomorphisms for all n plus torsion bijectivity (Stacks 15.92.6, 15.92.10) |
| `beauvilleLaszlo_finiteProjective_iff` | arbitrary, not necessarily glueable M (Stacks 15.92.19) |
| `beauvilleLaszlo_effective` | explicit common localization, scalar towers, pure-tensor compatibility |
| `localModificationsBoundedBy` | finite projective, two-sided bound; ξA at k=1 but not k=0 for regular nonunit ξ |

## Adversarial mathematics pass

| Statements | Instances computed | Outcome |
| --- | --- | --- |
| §0.4–0.5 V, F, Teichmüller | ghost comparison of V_π′=(π′/π)V_π; [1]+[1]=2≠0 in W(F₂); FV=π, VF=π only for F_q-algebras | correct |
| §0.8 coefficient change | ghost identity w′_n(uV_πx)=πw_{fn−1}(x) for both sides of uV_π=(π/π′)V_π′uF^(f−1) | correct (printed FF 2017 formula corrected in README) |
| §0.9 diagonal | W(w₀)∘Δ has ghosts (Fⁿx)₀=w_n(x), so it is the identity | correct |
| §0.12, §0.14 twisted Teichmüller | Q=(1+X)^p−1: ghosts (1+a)^(pⁿ)−1; p=2, a=b=1: [1]_Q=−1, product 1 | correct |
| §0.13 weak topology | single ρ∈(0,1) gives the product topology on bounded coefficients; ρ=1 excluded by FF Remark 1.4.12 | correct; Tau Ceti citation added |
| §0.16 root chart | \|π\|=\|[ϖ]\|=c<1: \|s_m\|=1 versus c^(1/p^m−1)>1; at π=0, s₀=0 is not a unit | correct |
| §1.2 radius | πval=1/2, teichval=1/4 → 2; cube → 6; Y_[a,b]={\|π\|^b≤\|[ϖ]\|≤\|π\|^a} | correct (FS II.1.16) |
| §1.3 λ, μ | β(p)=p⁻¹, β(p−[ϖ])=0: λμβ(p−[ϖ])=p⁻¹ for p odd and p=2 | correct |
| §1.5–1.6 Robba estimates | KL 5.2.1–5.2.10, bound p^((1−n)(1−t/r))λ_r(x)^(t/r), intersections | correct |
| §2.5 LT presentation | base field arbitrary versus tilt of E_LT∞ | **corrected** |
| §3.2, §3.5 Cartier legs | \|[ϖ]\|=q⁻¹, \|ξa\|≥q⁻ⁿ\|a\|; repeated legs give A/ξ² | correct |
| §5.1, §5.3, §5.4 twists | sections of O(n): φ(f)=πⁿf; series Σ_{j≥1}π^(n(j−1))φ^(−j) and −Σ_{j≥0}π^(−n(j+1))φ^j invert φ−πⁿ (checked by telescoping); f=Σπ^i[X̃^(q^(−i))] has φ(f)=πf | correct |
| §5.6 Proj chart | P¹ with O(−1): U=∅ | correct negative control |
| §6.1 exact squares | ℤ[1/2],ℤ[1/3] with transition 3: sections (k,k/3); k[x]→k[x,1/x]: (1/x,1/x) not from k[x] | correct |
| §6.4 glueing pairs | f=0, f=1, ℤ/4 with f=2; Stacks 15.92.9 and 15.92.12 | correct |
| §6.6, §6.10 bounds | ξA bounded by 1 not 0; mD versus D: ⌈k/m⌉ suffices, least bound needs existence; O(−2D₁)→O bounded by 1 at 2D₁ | correct |
| §6.8 arbitrary complement | essential singularity Σc^(n²)z^(−n) | **rescoped** to meromorphic data |
| §6.11 slope of L_X | a=2: M(1) has φ²-slope 1/2 under KL 4.1.13 and 6.2.1 | README correct; printed "slope 1" noted |
| §6.12–6.14 B-pairs | φ(1/t)=p⁻¹t⁻¹ ∉ B_e; B_e^{φ=p}=0; O(1) via t⁻¹B_dR⁺, H¹=0; rank one gives ℤ | correct |
| §6.15, §7.1, §7.7 sign | ξ^kB⁺ gives O(−k), consistent with O(∞)=O(1); SL₂ lattice ξB⁺⊕B⁺ has det ξB⁺ | correct |
| §7.3 tensor bounds | trivial representation bound 0; V^{⊗a}⊗(V^∨)^{⊗b} bound (a+b)k | correct |

## Open supplier contracts and questions for the orchestrator

These cannot be fixed inside the package; the README states each as an exact contract.
1. **Mutual citations.** VectorBundlesAndIsocrystals cites RF0–RF3 targets, and Layer 6 here cites VB1, VB2 and VB4. BunGAndNewtonStrata BG0 requires RF0–RF3, and Layer 7 here cites BG0. The dependencies are acyclic at layer level but cyclic at roadmap level, so RelativeFarguesFontaine, VectorBundlesAndIsocrystals and BunGAndNewtonStrata (with GeometricSatakeAndFusion) can only go to Tau Ceti together, as one bundle, unless §§6.11–6.15 and Layer 7 move. The maintainer should decide the bundle.
2. **Lubin–Tate theory has no owner yet.** §§0.14, 2.5 and 5.4 rest on the "LocalFieldsRamification Part II" contract (formal O_E-module, logarithm, torsion tower and tilt, reciprocity). Mathlib, Tau Ceti and Tau Ceti's ClassFieldTheory (which excludes Lubin–Tate explicitly) do not provide it. The job DESIGN-LocalFieldsRamificationPartII is still pending, and its brief does not mention Lubin–Tate theory. The contract in Exact supplier contracts should be added to that brief, or the theory planned as a layer here.
3. **VB4 extension.** The accepted VectorBundlesAndIsocrystals package covers SW Theorem 12.3.4 only. §6.15(b) also needs SW Proposition 12.3.5 and Corollary 12.4.1 from it.
4. **BG0.** The BunGAndNewtonStrata plan is marked needs_changes; the flat-linear scheme dictionary and the smooth integral adic dictionary that Layer 7 consumes are still requests there.
5. **Upstream routing.** `upstream/drops.json` moves the linear patching of Layer 6 (for Breuil–Kisin–Fargues modules) down into AInfCohomology AI.2. If AInfCohomology plans §§6.1–6.5 and the Kedlaya algebraicity of §6.16 itself, these targets here become citations of AInfCohomology.
6. PadicHodgeTheory R06.1, used in §§4.8, 4.12 and 6.12, is not yet packaged.
