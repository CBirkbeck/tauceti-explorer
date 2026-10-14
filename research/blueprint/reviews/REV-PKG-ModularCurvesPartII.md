# Independent package review: ModularCurvesPartII

Job `REV-PKG-ModularCurvesPartII` (issue #9740). Reviewer: Claude (Opus 5.5), session `claude-MQN5Js`, with Sonnet subagents for the mechanical cross-checks (packet-to-README coverage, the duplication search, the supplier-contract audit and a proofread of the edits). I did not write any part of the package or of its input packets. Date: 2026-10-14.

**Verdict: accepted, with the corrections below applied in place.** The package had three kinds of defect: duplication of carriers that lower-tier roadmaps own, supplier contracts that the named supplier does not state, and process residue. All three are fixed in the README and `Suggested.lean`. What remains is coordination for the maintainer (listed first), not defects of this package.

## What remains for the maintainer

1. **Same-tier overlap with ArithmeticLocallySymmetricSpaces** (tier 11, upstream pull request #871). §15.8 (degeneracy control at a Taylor–Wiles prime: the matrix [[p+1,T_p],[T_p,p+1]] and the old-space splitting of Calegari–Geraghty Lemma 9.6) is the F=ℚ case of ALS.3.14 (`LocallySymmetric.oldformSplitting`). §17.8's auxiliary Taylor–Wiles level Γ_Q⊲Γ̄_Q with quotient Δ_Q is the GL₂/ℚ case of ALS.0.10 (`taylorWilesLevel`). Both are in tier 11, so neither may cite the other under the tier rule, and I made no change. Once one of them is upstream, the other should cite it. Freeness over O[Δ_Q] (§17.9) is only here.
2. **Carriers imported from open upstream pull requests.** The generalized elliptic curve, the standard polygons, the n-gon Tate family and the fine moduli schemes now come from AdicSpacesPartIII Layer R2.11, in upstream pull request #813. In the explorer this content is the AdicSpacesPartII package's R2.88, which upstream split into Parts II–IV. The Artin comparison and étale finiteness come from TauCetiRoadmap CohomologicalPointCounting (pull request #196), which LefschetzPencilsAndVanishingCycles already cites. If either pull request changes these names, the citations here must follow.
3. **Downstream requests that this package does not meet.** GeneralizedHeegnerCycles asks R14.3 for Kuga–Sato fibre powers W_m with their projector and Hodge filtration. Neither the accepted plan nor this package contains them. ModularSymbolsPadicLFunctions asks for the Ash–Stevens comparison Symb_Γ(V)≅H¹_c(Y_Γ,Ṽ) and the higher-weight Betti–étale dictionary. §14.12 (symbols against the compact-support lattice with Sym^r coefficients) and §14.4 (finite and adic comparison) state them, and that package should cite those subsections. Other packages still cite this roadmap by packet stage ids (R12.x, R13.x, R14.x). The layer map is in the package handoff (PKG-ModularCurvesPartII.md).
4. AlgebraicModularFormsAndSerreWeights (tier 12) builds a mixed-level Fricke map `curveFricke` and also asks this roadmap for one. §§9.3–9.4 cover X₁(N) and the exact divisors of X₀(N), not the auxiliary Γ₁(N)∩Γ₀(x) map. That package owns its map.

## Form, coverage and ownership

- **Coverage.** All 158 retained plan targets are present one-to-one: every packet statement matches a `### k.n` subsection. The two removed targets are imported from their owners (ModularCurves Layer 10, item 1; current Tau Ceti `MonoidAlgebra` locality). Every definition and construction keeps at least three Checks and all its API names. No packet hypothesis of the form N≥3, p∤N, r! invertible or ℓ odd is lost. The audit flagged 15 packet hypotheses that are not copied word for word; spot checks show each is present in reworded form.
- **Upstream form.** The README has the summary, scope, conventions, supplier contracts, reading guide, layers with Examples and Dependencies, references and downstream consumers. It reads in prose.
- **Tier rule.** Every cited atlas supplier is at a lower tier: SchemeAndStackFoundations 2, AdelicAlgebraicGroups 2, ReductiveGroupsPartII 1, AdicSpacesPartII/III 3, AlgebraicModuli 4, ComplexComparisonPartII 5, AbelianSchemes 6, ArithmeticGaloisRepresentations 7, NeronModels 8, EtaleDuality and LefschetzPencils 10. No `UPSTREAM:` id or FoundationsAndLibraryIntegration citation remains. The plan's upward citation of WeightsInEtaleCohomology (tier 12) appears only as a downstream remark.
- **Moved-down notions.** I grepped every lower-tier package handoff. AdelicAlgebraicGroups took the analytic Γ(N)\ℍ↔GL₂ level quotients down to AA.5.2. This package uses no adelic quotient, so nothing duplicates it. AdicSpacesPartII took "R13.2 → R2.88" (the Deligne–Rapoport moduli of generalized elliptic curves) down, now AdicSpacesPartIII R2.11. Item 1 of the next section resolves that overlap.

## Corrections applied

### Duplication with lower-tier and Tau Ceti owners (removed, cited instead)

| Here | Owner | Change |
|---|---|---|
| §2.1 split polygons `neronPolygon`, `neronPolygon_smoothLocus`, `neronPolygon_baseChange` | AdicSpacesPartIII R2.11 `EllipticModuli.nGon`, `nGon_smoothLocus`, `GroupCurve.baseChange_polygon` | Imported. Kept: the semistable genus-one carrier, the polygon classification of its singular fibres (`SemistableGenusOneCurve.singularFibre_isPolygon`, `nGon_isSemistableGenusOne`) and the one-gon equation (renamed `nGon_one_equation`). |
| §2.2 carrier `GeneralizedEllipticCurve`, `.smoothGroup`, `.action`, `.baseChange`, `.ofEllipticCurve` | AdicSpacesPartIII `GeneralisedEllipticCurve`, `EllipticModuli.GroupCurve`, `GroupCurve.baseChange`, `ofElliptic` | Imported. The target is now Deligne–Rapoport's description (`toSemistableGenusOneCurve`, `ofDeligneRapoport`) and homomorphisms (`Hom`, `Hom.baseChange`). All six Checks kept. |
| §3.6 construction `generalizedTate`, `_special`, `_formalGroup` | AdicSpacesPartIII `GeneralisedEllipticCurve.tateCurve n` (Q=t; special fibre, generic smoothness, formal group 𝔾̂_m) and current Tau Ceti `TauCeti.tateCurve` | Imported. Kept as targets: degeneracy ideal (t), identity component and du/u, generic comparison, uniqueness (Conrad Thm 2.5.2). |
| §2.8 Drinfeld structures, §3.5 fine loci | AdicSpacesPartIII `LevelStructure`, `moduli` | One clause each states agreement on the supplier's range (full level over ℤ[1/N]; cyclic level with invertible d≥5), with a new Check: X₁(5) is fine over ℤ[1/5] but not over ℤ. |
| §1.2 lattice uniformization | AbelianSchemes A5.1 `AbelianLattice` | The uniformization, Λ=H₁ and the homomorphism dictionary are cited as the dimension-one case; the Weierstrass realization stays. |
| §3.13 marked torus family | AbelianSchemes A5.8 `SiegelFamily 1` | The family is the genus-one Siegel family. The marking (1/N,τ/N), its pairing and the row/column action dictionary stay. |
| §4.8 cusp q-parameters, §6.2 ramification w′/w | FuchsianOrbifolds Layers 3–4 (Layer 4, item 4) | Cited as the analytic side. The algebraic comparison and the Γ₀ width formula stay. |
| §6.3 cusp orbits Γ\ℙ¹(ℚ) | Mathlib `cosetToCuspOrbit` | Cited. |
| §9.3 `atkinLehnerAnalytic` (a totalized complex formula) | Tau Ceti `TauCeti.frickeGL` (at the pin) with Mathlib `UpperHalfPlane.glAction`; ModularForms Layer 6 | Replaced by `frickeGL_smul_coe` and `frickeGL_smul_smul` in README and Lean. §9.4 cites `TauCeti.Nat.IsExactDivisor`, `TauCeti.atkinLehnerMatrix` and ModularForms Layer 6. |
| §15.2 finite-place reduction surjectivity | Tau Ceti `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective` | AA.4 states density, not this; re-pointed. |

### Supplier contracts that the named supplier does not state

The Sonnet audit and my own reading of the supplier packages found these contracts absent or different. Each is now either a target here or points to the place that does state it.

| Claimed supplier | Content | Resolution |
|---|---|---|
| SF.1 (Abramovich–Vistoli 2.2.3) | Étale-local structure of a separated DM stack with finite, possibly wild, inertia over its coarse space; invariant description of strictly henselian and complete local rings | New target **§0.1** (AV Lemma 2.2.3, pp.4–5; Conrad, Keel–Mori notes, Thm 3.1, pp.5–6). SF.1 has only the tame case. Used by §§3.10, 5.9 and the R09.6 bullet. |
| AlgebraicModuli R09.5 | Regular invariants iff the cotangent image is generated by pseudo-reflections (tame) | New target **§0.2**, Serre's theorem as Edixhoven Thm 1.1.4.1 and Remark 1.1.4.2, p.35. Light Lean definition `IsPseudoReflection` with three examples. Used by §§11.3–11.4. |
| SF.1 | Stack cohomology by a flat cover and finite generation | Re-pointed to SF.2/cech-to-cohomology on the ringed site of SF.1/stack-quasi-coherent (§5.21). |
| SF.3 | Trace on regular differentials | Re-pointed to SF.2/trace; agreement with the field trace and base change are now part of §7.3's target. |
| SF.0 | Connected components under a separably closed field extension (Stacks 0363) | Stated and owned in §4.9 (`connectedComponents_fieldExtension`). SF.0 has the irreducible-component version (0364). |
| AlgebraicModuli A0-extension, AbelianSchemes A2 | Relative curve norm and canonical principal polarization of a relative Jacobian | Targets of §13.1 (`jacobianNorm`, `jacobianNorm_dual`, new `modularJacobian_polarization`, with its construction through A6.25). |
| AbelianSchemes A4 | Kummer comparison T_ℓPic⁰≅H¹(ℤ_ℓ(1)) | Proved in §13.5 (`jacobianTateModule_kummer`), with the Kummer-sequence argument written out. |
| AbelianSchemes A6 | Quotient by a positive-dimensional abelian subvariety; good-reduction extension | Constructed in §16.2 (`abelianSubvarietyQuotient`) from A6.5 Poincaré reducibility and A3.3 finite quotients. Good reduction from NeronModels §5.1 (Néron–Ogg–Shafarevich). Rational Tate exactness in §16.3. |
| SF.2 | Étale–Betti comparison with compact supports, traces, cup products, Mittag–Leffler | TauCetiRoadmap CohomologicalPointCounting: ComplexComparison Layers 8, 10–12, EtaleBaseChange Layer 6, CompactSupport Layer 5. Traces along finite maps and the pro-étale comparison are §14.4's. |
| EDC.0 / EDC.1 / EDC.6 | Finiteness; inertia-stalk calculation; finite curve maps and the Tate twist | Finiteness from CohomologicalPointCounting EtaleBaseChange Layer 6; the other two are parts of §§14.3, 9.12 and 13.5. |
| FiniteFlatGroups R07.1 | Subgroup-divisor and torsion infinitesimal lifting | Not in R07.1 (rigidity only). Removed; the lifting is part of §2.10 (Česnavičius Lemma 4.2.1). |
| SF.2 | Sections determined on a schematically dense open; formal-completion injectivity | Proved in §4.4 by Krull intersection. |
| SF.5 | Degree of a pullback along a finite curve map | Part of §9.13. |
| SF.1/stack-fppf | Id does not exist | Corrected to SF.1/stack-in-groupoids. |
| AbelianSchemes A5.6 | Polarization-type hypothesis | One-dimensional families carry the standard principal polarization; stated in the supplier bullet. |
| AdicSpacesPartII §F0/… in §2.9 | Ids exist in neither the explorer AdicSpacesPartII package nor upstream II | Re-pointed to SchemeAndStackFoundations SF.4/grothendieck-algebraization, SF.4/grothendieck-existence and SF.4/algebraization-of-subschemes-and-morphisms (T382–T384). §§3.6–3.7 already used these. |

The supplier section gained sections for AdicSpacesPartIII, ArithmeticGaloisRepresentations (§6.3 `tateModule_specialisation`), ComplexComparisonPartII (C2.1, C2.2, C4.4, C4.5, C5.7), LefschetzPencilsAndVanishingCycles (LPV.7) and TauCetiRoadmap CohomologicalPointCounting. All of these were cited in the body but had no contract. I also added bullets for FuchsianOrbifolds Layers 3–4, ModularForms Layer 6 and NeronModels §5.1, Tau Ceti and Mathlib entries for `frickeGL`, the Atkin–Lehner matrices, `map_intCast_zmod_surjective` and `cosetToCuspOrbit`, and a note on current Tau Ceti `tateCurve`. Body citations by packet id were mapped to the supplier packages' own numbering: AbelianSchemes A3.7, A4.1, A6.7, A6.25; ComplexComparisonPartII C2.1–C5.7; ArithmeticGaloisRepresentations §6.3.

### Process residue and form

- I removed every "requested", "request", "must supply" and "until" phrasing (17 + 4 occurrences) and replaced each with the actual owner or the statement that the item is proved here. Other fixes: the packet id "R13.4a/Layers 3–5" (§7.5); downstream stage ids R19, R19.1, R20, R20.2 and R29.5, now given by roadmap name; the stray `open-obligations` anchor; "lower-tier" and "higher-tier" in the prose; and the empty "Lower-tier suppliers" heading.
- I replaced 70 references by packet node slug (for example "standard-level-stack-identifications", "betti-free-rank-two") with section links, and the removed node's slug "finite-normal-recognition" with "the finite-normal recognition criterion of ModularCurves Layer 10".
- 213 TauCetiRoadmap anchor-slug link labels became "ModularCurves Layer 1A", "AlgebraicTopology Stage 6" and so on, and 78 supplier bullet labels were treated the same way. Exact duplicate supplier bullets were removed.
- In 33 theorem subsections the "public interface" bullet repeated the opening paragraph word for word. It now reads "The theorem is `name`." Blank lines that split bullet lists were removed.
- A "Supplier shorthand" convention now defines MC…, MF…, A0-extension, R09.x, A2–A6, C2–C5, SF.k, EDC.k, R11.k and LPV.7. Layer dependency lines name the new suppliers.

## Source checks

I fetched the public PDFs into scratch, extracted their text and read each cited passage. Printed pages were confirmed against the running heads.

| Source (SHA-256 prefix) | Locators checked | Result |
|---|---|---|
| Conrad, kmpaper (f53e4ff8…) | Def 4.3.3 and Thm 4.3.4, p.38 | Confirmed. The theorem indexes d-gon components by pairs (b,r) with r a positive divisor of d. Counting Γ₁(N)-structures on the d-gon modulo μ_d×ℤ/2 gives φ(d)/2 components; for N=d=5 that is two, against eight from the printed indexing. §4.2's correction is right. |
| Česnavičius 1511.07475v2 (94d0532f…) | Prop 4.3.6 p.39; Lemma 3.3.1 p.23; Prop 6.4 pp.63–64; Rem 6.6 p.64; Thm 6.7 p.64; Prop 6.9 p.65; Thm 5.13 pp.60–62 | Confirmed. Prop 4.3.6 omits n=1, where X(1) has −1, and its proof's "n=n₁n₂ with n₁,n₂≥3" fails at n=1, so §3.5's correction is right. |
| BDMTV, Annals 189 (e1aa5f96…) | Thm 6.5 and Thm 6.6 p.928; proof and Cor 6.7 p.929; Baran quartic p.930 | Confirmed. Thm 6.6 states ϖ^(ℓ²−1)=ℓ², the squared form that §11.7 notes. The quartic in §11.8 matches. |
| Ribet–Stein, 2010 revision (e1bf2b5c…) | Thms 5.1 p.65, 5.2 p.66, Lemma 5.4 p.67, Lemma 5.7 p.68, Thm 5.8 and Cor 5.9 p.69, Thm 5.14 p.73, Thm 5.16 p.74 | Confirmed: printed page = PDF page − 4. Thm 5.16 is (T_p)_*=F+⟨p⟩_*F^∨ and w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F, as in §17.2. |
| Zywina 1508.07660 (b3b747c8…) | Prop 3.3 p.15; Lemma 3.6 p.16 | Confirmed. |
| Masser–Zannier, Annals 191 (8b76bfac…) | §3.1 (ii),(v), pp.645–646 | Confirmed: ψ(m) and monic integral Φ_m. |
| Gross–Zagier (8afee839…) | III (1.4) Proposition, p.255 | Confirmed: it lists only the supersingular exceptions, which is what §11.3 corrects. |
| Calegari–Dimitrov–Tang (9bffb129…) | Thm 4.5.2 p.29; Lemma 4.5.11 p.31; §4.4 p.27; Lemmas 4.6.2–4.6.3 pp.33–34 | Confirmed: author-preprint page = PDF page − 20. Lemma 4.5.11 prints dim H¹(Γ(5),F₃)^{SL₂(F₅)}=0, which §15.9 corrects to F₅. |
| Calegari–Geraghty 1207.4224 (67896c85…) | Lemma 9.6, p.88 | Confirmed: matrix [[N(x)+1,T_x],[T_x,N(x)+1]] with determinant T_x²−(1+N(x))², the negative of §15.8's; the README records the sign. |
| Edixhoven, AIF 40 (cff6a257…) | Thm 1.1.4.1 and Rem 1.1.4.2 p.35; Prop 1.2.2.1 p.37 | Confirmed; the new §0.2 rests on Thm 1.1.4.1. |
| Abramovich–Vistoli math/9908167v2 (8b19db73…) | Lemma 2.2.3, p.4 | Confirmed; basis of §0.1. |
| Conrad, Keel–Mori notes (31535943…) | Thm 3.1, p.5 | Confirmed. |
| Stacks Project | Lemma 33.7.6, tag 0363 | Confirmed (read online 2026-10-14). |
| Upstream AdicSpacesPartIII (PR #813), AbelianSchemesAndArithmeticModuli (PR #849), CohomologicalPointCounting (PR #196) | R2.11; A5.1, A5.8; ComplexComparison Layers 8, 10–12, EtaleBaseChange Layer 6, CompactSupport Layer 5 | Names and statements read at the pull-request heads. |

No locator needed correction.

## Adversarial mathematics pass

| Statement | Instance tried | Outcome |
|---|---|---|
| §1.1 lattice cubic | Δ of y²=x³−g₂x/4−g₃/4 | −16(4a₄³+27a₆²)=g₂³−27g₃² ✓ |
| §1.5 Weil pairing sign | Legendre η₁ω₂−η₂ω₁=2πi, g_T=σ(Nz−t)σ(Nz)⁻¹e^{η(λ)z} | e_N(ω₁/N,ω₂/N)=e^{−2πi/N}, e(τ/N,1/N)=ζ_N ✓ |
| §2.1 one-gon | x=t(t+1), y=t²(t+1) on y²+xy=x³; tangent cone at (0,0); Δ of a₁=1 | ✓; y(y+x), distinct in char 2; Δ=0 ✓ |
| §2.3, §2.10 ranks | C_m^sm[N]=μ_N×(ℤ/m)[N]; forgetful rank Nφ(N) at N=3 | rank N·gcd(N,m); 6 ✓ |
| §2.8 Drinfeld cyclicity | μ_p×ℤ/p in char p (ordinary E[p]) | cyclic of order p² in the Drinfeld sense ✓ |
| §3.8 indices | Γ₁(5): 24/12; C_s⁺(13): 91; C_ns⁺(13): 78; X_s(13): 182 | ✓ |
| §3.5, §5.1 fine full level | N=1, 6, 12, 15 | N=1 nonfine (the corrected exception); 6=2·3 nonfine; 12, 15 fine ✓ |
| §4.2 Γ₁ boundary | N=d=5; N=15, d=5 | 2 components; 2 copies of ℤ[ζ₃], 4 geometric cusps ✓ |
| §4.7 projective level | p=5, 7 | 12 cusps, genus 0; 24 cusps, genus 3 ✓ |
| §5.5 Γ₀(p²) cusp rings | degree sum; p=2, n=3, (a,b)=(1,2) | 1+p²+(p−1)=ψ(p²) ✓; z²=−q regular ✓ |
| §5.11, §9.6 cusps | X₁(p) widths; X_s(ℓ) widths via u^w∈gH̄g⁻¹ | sum (p²−1)/2 ✓; all widths ℓ, sum ℓ(ℓ+1) ✓ |
| §9.9–9.10 Hecke | σ₁/ψ at m=4, 6, 9; C_p²=C_{p²}+(p+1)⟨p⟩ by chain count | 7/6, 12/12, 13/12 ✓; A_p²=A_{p²}+p⟨p⟩ ✓ |
| §9.11 constant term | T₂E₄ in characteristic 5 | 1+2³=9≡4 ✓ |
| §9.3 Fricke | N=1, τ=2i; N=2, τ=i twice; N=0 | i/2; i/2 then i; no Fricke matrix (NeZero) ✓ |
| §11.7 split Cartan | ℓ=13, 37, 61: exponent (ℓ²−1)/2 and genus 6k²−3k | 84/3, 684/45, 1860/135; b₁=2k−2 ✓. Genus 45 at 37 also checked by Riemann–Hurwitz on X₀(1369): g=98, 18 fixed points of w ✓ |
| §11.8 Baran quartic at 2 | Bézout identity over 𝔽₂; F+X∂_XF=Y(X+1)² mod 2; 𝔽_p-points of the singular locus, p≤19 | both identities ✓ (scripted); singular points only at p=13 ✓ |
| §15.5 noncongruence control | Hom(Γ(3),𝔽₅)=𝔽₅³ against the congruence completion (pro-3 factor, perfect SL₂(ℤ_p) for p≥5, abelianizations of order 4 and 3 at 2 and 3) | congruence subspace 0 ✓; the Lean example is true |
| §15.8 determinant | p≡1 mod ℓ, αβ=1 | (p+1)²−T_p²≡−(α−β)², a unit iff α≠β ✓ |
| §17.8 minus projector | ξ=id, −id, swap; characteristic 2 | 0, all, {(a,−a)}; no splitting ✓ |
| §0.2 pseudo-reflections | ±1 diagonal matrices; diag(ω,ω²) | regular k[[x²,y]] against singular k[[x²,xy,y²]]; A₂ ✓ |

## Lean

- I ran `lean-check` on the final `Suggested.lean` (430 lines, against Mathlib 082e2d3 and Tau Ceti f790474): exit 0 and 32 warnings, all `declaration uses 'sorry'`, no other diagnostics. The original file had passed with 28.
- Changes:
  - New Layer 0: the light definition `IsPseudoReflection` with three examples; the identity case is proved.
  - `atkinLehnerAnalytic` and its theorem and examples are replaced by statements about `TauCeti.frickeGL ℝ N • τ`; this adds the import `TauCeti.NumberTheory.ModularForms.Fricke.Matrix`, which is at the pin.
  - The truncated comment before the `PeriodPair` non-example and the `latticeWeierstrass_isElliptic` docstring are repaired.
  - The module docstring and the closing list are updated: imported carriers are named and dropped from the list.
- Shape: no sorry'd data, no development of theory, light real-bodied definitions only. Every `def` and `theorem` is named in the README; `splitCartanRamificationIndex_eq`, `taylorWilesMinus_projector_range` and `degeneracyNormMatrix_det` were added there. metadata.toml is `topic = "math.NT"`, which fits.

## Validation

- `python3 research/blueprint/intake.py check-files` on the three package files and review.json: 0 problems.
- Every in-document link resolves to an anchor; the new anchors are s0-1 and s0-2. The README contains none of the words optional, deferred, later or sorry.
- No packet, reader document or atlas data was changed.
