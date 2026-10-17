# FIX-PKG-AInfCohomology~adv

Completed by Codex, session `codex-0wvrqV`, 2026-10-17. Refs #10201.

The bot confirmed this session's claim. This is a complete package fix, not a checkpoint.
Only the four issue deliverables changed. The package is accepted as a roadmap plan;
its heavy constructions remain README targets, not formalized mathematics.

The named `REV-PKG-AInfCohomology~adv.md` report was not present. I read the existing
initial and round-2 reports and applied the issue's explicit final bundle-order instructions.
The previously accepted G1/G2 map calculations are assigned downstream below, rather than
used as prerequisites of their own inputs.

## Finding → change

| Finding | Disposition |
| --- | --- |
| R06.1 supplied rational periods from a later package. | Replaced its contracts by PadicPeriodRings §§1.1–1.5, 2–4: the Mathlib completion carriers, primitive kernel, DVR, finite-quotient Tate topologies, actions, A_cris injection, constants and invariant functors. §1.5 has finite-ℚ_p hypotheses; §§2 and 4 retain arbitrary perfect residue fields. AI.0:period-comparison explicitly extends the primitive-kernel completion argument to the general C used by the geometric statements. |
| P8 supplied necessary analytic inputs from a later package. | Added early AI.3.1 targets for primitive mod-p comparison/finiteness, uncompleted vector bundles on the three sites, rational de Rham period sheaves, structural period sheaves/Poincaré lemma, and constant-coefficient rational comparison. Moved the existing geometric completed-structure-sheaf direct-image calculation there. Imported the already-owned étale–pro-étale comparison from ClassicalAdicEtaleCohomology H0 §1.3. Deleted transitive period-sheaf prerequisites from purely integral targets. |
| Prismatic inputs defined BK cohomology and supplied its specializations. | Defined the retained BK complex from the existing Bott-inverted relative trace construction, after its construction targets. Its Frobenius, A_inf, de Rham and Witt specializations now use BMS2 Proposition 11.15, Theorem 11.2, Corollary 11.12 and Remark 11.17. Kept the precise maps f=gφ, θ_𝔖=θ̃_𝔖φ and c=φ_W constantCoeff. |
| Minuscule linear algebra was mixed with crystals. | Retained the finite-free integral-image condition as `AInf.MinusculeBKF`, with forgetful functor, flat base change, twisted dual and direct sums. Assigned its prismatic dictionary and crystalline application downstream. |
| Comparisons with prisms preceded their owner. | Removed the eight comparison/application targets listed below from AInf's build; the closing Lean inventory names the retained and new carriers. PrismaticCohomology consumes AI.1/AI.3 and the explicit AI.4–AI.7 maps. PadicHodgeTheory consumes these integral exports and the early rational inputs. Both names now occur only under Downstream consumers. |
| PerfectoidQuotients must remain earlier. | Preserved its Q0:integral-algebra/Q3 supplier contract. Quasisyntomic unfolding imports only DerivedDeRhamCohomology DD.5 §§5.1–5.5, not its later period comparisons. |
| Suggested signatures and negative controls. | Preserved every existing Lean signature and real-bodied definition. Added integer ideal-square and non-locally-constant p-adic inclusion examples, mirrored by README Checks. Updated only the heavy-target inventory and relevant module documentation. |

## Ownership and continuation interfaces

No downstream package, packet, reader or atlas data file was edited. The maintainer should
point the downstream plans at these exports when their own bundle-order fixes are processed.
There is no remaining implementation work in this issue.

### Earlier inputs actually used

- PadicPeriodRings: §1.5's de Rham ring structures are for finite K/ℚ_p;
  §2 supplies general-base Tate–Sen, §3 the principal PD envelope, §§4.1–4.3 the
  general-base period structures, invariant functors and K-embedding. On C not presented
  as K̄-completion, the argument in AI.0:period-comparison proves the geometric DVR/PD-map
  contract directly. It makes no arithmetic fixed-field assertion on that larger domain.
- ClassicalAdicEtaleCohomology H0 §1.3 already owns Scholze Lemma 3.16/Corollary 3.17.
  These are imported rather than duplicated by a new comparison theorem.
- SchemeAndStackFoundations SF.1 T159 supplies fpqc quasi-coherent descent;
  Mathlib `comonadicExtendScalars` supplies effective faithfully flat module descent.
  Descending the dual and its evaluation/coevaluation preserves finite local freeness.
  AlgebraicVectorBundles Layer 0 was checked: its affine bundle correspondence alone
  is not cited as a faithfully flat descent theorem.
- DerivedDeRhamCohomology DD.5 §§5.1–5.5 supplies QSyn/QRSP sites, elementary covers,
  refinements and unfolding. Its later A_cris/B_dR comparisons are not inputs here.

### Prismatic ownership moves

The following are specifications for the downstream owner, not suppliers of AInf.
The old title **Admissible prismatic Dieudonné modules over A_inf** is replaced here
by the linear-algebra-only **Minuscule Breuil–Kisin–Fargues modules**. Its site/admissibility
content belongs with the first dictionary below. Thus nine old titles leave the local target
list, one replacement and five early analytic targets enter it: 267 original targets become 264.

| Former target | Downstream contract and retained normalization |
| --- | --- |
| Minuscule BKF and prismatic Dieudonné dictionary | Evaluate admissible Dieudonné objects on the perfectoid initial prism and compare with finite-projective minuscule BKF objects; specialize to finite-free O_C objects only with that hypothesis. Keep the Frobenius-shifted (A_inf,(ξ̃)), θ̃ convention. Source: ALB v4 Definition 4.1.24, p.34, §4.3, pp.47–49. Imports the integral category from AI.2.4; the prismatic carrier/admissibility is downstream. |
| Crystalline determination of a minuscule BKF module | Recover a minuscule finite-free M from its specified étale realization, A_cris realization and their compatible B_crys comparison. This is faithfulness on the actual essential image, not existence for arbitrary triples. Use Frobenius invariants in W(C^♭), not A_inf[1/ξ̃]. Source: ALB v4 Proposition 4.3.5, p.48 (published Proposition 4.47). |
| π_0 TP over the sphere polynomial base and the Nygaard-completed prism | On QRSP quasisyntomic O_K-algebras S, identify relative π₀TP(S/𝕊[z];ℤ_p), including its δ-structure, with the Nygaard completion of φ_𝔖^*Δ_{S/𝔖}. This is the relative theory, before unfolding to smooth algebras; gr⁰, not raw π₀, is used after unfolding. Source: BS22 v4 Proposition 15.7, p.105. |
| Coordinate compatibility of the crystalline realization | For p-completely smooth R/O_C, identify the actual arrows from Δ⁺_R⊗̂^L A_cris and AΩ_R⊗̂^L A_cris to crystalline cohomology. Use the common all-coordinate PD presentations and logarithmic Koszul operators, not uniqueness over a nonperfect crystalline prism. Sources: BMS1 v3 §12.2, pp.98–103; BS22 v4 Theorem 5.2, pp.45–47, Theorem 17.2, pp.117–120. |
| Compatibility of period evaluation and infinitesimal realization | Compare the natural maps from Δ⁺ and AΩ to pro-étale A_inf sections, then their μ-inverted/étale realizations. Identify the B_dR⁺ realization with AI.6's canonical generic-fibre deformation and its specified period map. Keep completed products on affines; properness is needed for the global finite-free/étale tensor descriptions. B_dR⁺ has no asserted prism structure. Sources: BS22 v4 §§17–18, pp.117–124; BMS1 v3 §13, pp.104–116. |
| HKR reduction of relative divided Frobenius | Compare the reduction of the particular λ_R:φ_𝔖^*Δ→D̂_tw with both the relative cyclic HKR/de Rham arrow and the prismatic de Rham arrow, for p-completely smooth R/O_K. Keep the connective-cover map and its differential, not just associated graded groups. Sources: BS22 v4 Proposition 15.7, p.105, Corollary 15.4, p.104; BMS2 Corollary 11.12(2), p.304. |
| Trace and prismatic Breuil–Kisin agreement | Construct D_𝔖^tr≃Δ_{R/𝔖} and its three natural specialization squares with the actual BMS2 maps. The untwisted scalars are f, θ_𝔖 and c; after φ-pullback they are g, e_π and e₀. Globalize for qcqs smooth formal schemes with completed tensors, and use proper perfectness before dropping completion. Sources: BS22 v4 §15.2/Proposition 15.7, p.105; BMS2 Corollary 11.12, pp.304–305, Proposition 11.15/proof of Theorem 11.2, pp.305–306. |
| Agreement of smooth comparison maps | On the full p-completely smooth O_C-domain, compare Δ⁺_{R/(A_inf,(ξ̃))} with AΩ, preserving the Hodge–Tate structure map and its Bockstein. Deduce agreement of the actual θ de Rham, A_cris, generic period, étale and B_dR⁺ maps using the preceding three compatibility calculations. Use perfect-prism uniqueness only on this full domain. Sources: BS22 v4 Theorems 17.2 and 18.2, pp.117–124; BMS1 v3 Theorems 13.1 and 14.1, pp.104,115,118. |

The map-identification obligations previously called G1/G2 remain part of these downstream
contracts. In particular:

1. For crystalline coordinates retain
   φ(y)/ξ̃ ↦ (p/ξ̃)((p−1)!γ_p(y)+δ(y)), with the operator normalization converting the
   q-differential to the ordinary differential after θ. Work in the bounded PD coefficient
   subrings before completion. Fixing H⁰ does not identify this map.
2. The relative trace/prism specialization diagrams must commute for the particular λ_R
   of Proposition 15.7. Tensor associativity gives gφ=f, e_πφ=θ_𝔖 and e₀φ=c.
   Compare regular-envelope generators before unfolding. If E(0)=a·p, the divided-generator
   multipliers are a⁻¹ and φ_W(a)⁻¹ in the respective presentations; do not assume a=1.
3. The perfect-prism uniqueness argument cannot be applied to
   A_inf⊗̂_𝔖A_inf: modulo p, π^♭⊗1−1⊗π^♭ is nonzero with p-th power zero.
   Nor can full-domain smooth O_C uniqueness be applied directly on the smaller O_K-domain.
4. For the de Rham square first identify the Frobenius factorizations through Lη_{ξ̃},
   reduce along θ̃ and use θ̃φ_A=θ. Then compare with BMS1's crystalline-defined map by
   its actual coordinate calculation. For the B_dR⁺ map retain the normalized exponential
   operators of AI.6's infinitesimal envelopes.

PadicHodgeTheory should import the five new AI.3.1 targets and the moved geometric direct-image
calculation. Its general de Rham local systems remain downstream; the constant-coefficient
comparison needed here is now early. Its old P8 ownership must be reconciled there.

## Adversarial pass on touched statements

Each row records instances actually checked and the resulting disposition. The common domain
screen includes p=2 and residue F₂, zero/rank-zero objects, rank-one points, lengths n=0,1,2,
field versus DVR, q=1, trivial groups, and noncompact spaces where appropriate. An instance
outside a target's hypotheses is a negative control, not an extension of its claim. No period
ring, site, complex or Frobenius is an arbitrary object untied to its construction.

| Statement | Instances/computation | Result and change |
| --- | --- | --- |
| Comparison with rational period rings | Residue C at ξ=0; first two ξ-quotients; p=2; general C versus K̄-completion | ξ remains regular; inverse-series lifting gives the DVR; quotient topology is Tate, not discrete. Arithmetic supplier replaced, general-C proof retained explicitly. |
| Finite de Rham coefficient quotients and flatness | n=1 gives C; n=2 is a nilpotent thickening; n=0 excluded; finite separable constants | Formal étale lifts through finite quotients are unique over the fixed coefficient embedding; no assertion of ξ-adic discrete quotient topology. |
| Valuation submodule dimension bound | Zero module, rank-one valuation submodule, field versus valuation ring | Dimensions and saturation bounds unchanged; only rational-period supplier changed. |
| Étale lattice and de Rham lattice pair | Zero pair, (ℤ_p,B_dR⁺), ξ-shifted line | Ranks and lattice inclusions unchanged; no finite-free conclusion for torsion objects. Updated supplier. |
| Continuous Galois descent of BKF pairs | Trivial action, cyclotomic line, action forgotten | Transport retains continuity; forgetting it loses descent. Updated topology/action supplier. |
| Minuscule Breuil–Kisin–Fargues modules | Rank 0; F=1,ξ̃,ξ̃²; diag(1,ξ̃); p=2 | First two lines satisfy image bounds; ξ̃² fails; twisted dual gives diag(ξ̃,1). Retained pure linear algebra, removed crystal dependency. Lean scalar witness: 2∉(4) in ℤ. |
| Integral period sections and profinite products | Point, finite S, S=ℤ_p | Integral topology stays p-adic; no rational comparison needed for construction. Removed P8 supplier. |
| The projection from the pro-étale site of the generic fibre | Empty scheme, Spf O_C, étale open restriction | Same morphism of topoi and same values. Its adjacent target order changed, not its assertion. |
| Primitive mod-p comparison and finiteness | Point, P¹, p=2, nonproper affinoid | H⁰=F_p and H²(P¹)=F_p(−1); higher integral errors remain almost zero. Properness is retained; no nonproper finiteness claim. New early target. |
| Vector bundles and change of site | Rank 0/1, trivial finite cover, finite Galois cover | Descent with duality preserves finite local freeness. O_X is uncompleted; substitution of Ô_X is rejected. New early target using existing module descent. |
| Rational pro-étale de Rham period sheaves | Point; first two t-quotients; gr¹; S=ℤ_p | gr¹=Ô(1); continuous inclusion ℤ_p→ℚ_p is not locally constant. New early target, with Lean topology witness. |
| Structural de Rham period sheaf and Poincaré lemma | Dimension 0; one variable u; gr¹; geometric versus arithmetic point | ∇u=dT; Faltings kernel is Ô(1); no geometric log χ. Strictness and degree shifts retained. New early target. |
| Constant-coefficient rational de Rham comparison | Point, P¹, i outside cohomological range, nonproper space | Q_p(−1) maps by positive t into Fil¹; filtration belongs to the rational comparison. Properness retained; no integral lattice equality inferred. New early target. |
| The first higher direct image of the completed structure sheaf | Point, one-dimensional torus, higher exterior powers | R¹ν_*Ô=Ω¹(−1), wedge degree two on the one-torus is zero. Moved early; removed arithmetic supplier, kept geometric domain. |
| Mu-inverted étale specialization | Point, one-torus, nonproper formal scheme | Local A_inf-sheaf statement unchanged; corrected the cross-reference to the separate proper theorem, without strengthening its domain. |
| The primitive comparison over A_inf | Point, proper P¹, μ-inverted coefficients | Almost integral comparison and μ-inverted comparison remain distinct. Now imports the early primitive target. |
| Proper mu-inverted étale comparison | Point, rank-zero cohomology, nonproper negative control | Properness and specified map unchanged; new early primitive prerequisite. Corrected internal title spelling. |
| Integral structure-sheaf edge comparison | Smooth one-torus, d=0, p=2 | Integral edge calculation unchanged; removed unused rational prerequisite. |
| Nonintegral cohomology annihilation | Integral exponent zero; nonintegral p-power exponent; p=2 | Same annihilator estimate, no rational-period input. Removed unused supplier. |
| Integral semistable local edge comparison | One branch, nodal two-branch chart, trivial operator | Same logarithmic edge map and annihilator. Removed unused rational supplier. |
| Log Hodge–Tate reduction | Smooth r=0 chart, node, degree 0 | Same log differential and twist; no rational comparison used. Removed transitive P8 reference. |
| All-coordinates semistable presentations | Empty extra-coordinate family, one enlargement, two composable enlargements | Same coefficient/coordinate maps and common refinements. Replaced relevant rational contract only. |
| All-coordinates AΩ comparison model | One chart, repeated chart, refinement | Coordinate independence and common sheaf object unchanged; unused rational input removed. |
| Rational finiteness of log crystalline cohomology over A_cris | Proper point, p-inversion, nonproper negative control | Properness still supplies finite cohomology. Period coefficients now supplied earlier. |
| Arithmetic Hyodo–Kato interface | Smooth monodromy-zero case, semistable node, arbitrary perfect k₀ | W(k₀)→W(k̄) remains explicit, N lives on descended HK/B_st, not AΩ. General-base period supplier replaced. |
| Coherent modules with integrable connection in characteristic zero | Trivial bundle; one coordinate connection; B_dR⁺/ξ² module B_dR⁺/ξ | Last module is not flat; local freeness is proved on the smooth characteristic-zero base before extension. New early vector-bundle prerequisite. |
| Canonical deformation-to-étale map | Point, one-torus, two chart refinements | Same envelope evaluation and logarithmic operator. Rational sheaf acyclicity now early; integral construction remains independent. |
| Canonical rational comparison and descended map agreement | Point, P¹ over K, general C without K-descent | Unfiltered generic comparison retains general C; filtered descended agreement uses the explicit early constant-coefficient comparison. |
| B_dR⁺-cohomology in the étale topology and with non-unit coordinates | n=1/2; coordinate without invertibility; finite constant extension | Uses same finite quotient topology and lifted constants. Supplier replaced, chart generality preserved. |
| Canonical semistable B_dR⁺ comparison map | Smooth chart, two-branch chart, common refinement | Same map and square, completed tensor on nonproper affines. Supplier replaced. |
| Semistable B_dR⁺ comparison | Proper smooth point, proper semistable case | Finite-free conclusion still requires properness. Same map; earlier period input. |
| Semistable étale specialization | Degree 0, out-of-range degree, torsion coefficients | Properness and p-completion unchanged; no new integral equality inferred from rationalization. Supplier replaced. |
| Étale and B_dR comparison agreement | Descended proper P¹, general geometric fibre, nonproper negative control | Filtered/equivariant assertion retains K̄-completion hypothesis. Early constant comparison replaces P8. |
| Étale cohomology over K̄ and over C | Point, finite coefficients and their inverse limits | Same base-change map; all degrees retained. Earlier primitive/finiteness interface substituted. |
| Ax–Sen–Tate and Tate–Sen over a complete discretely valued field | η=1 versus χⁿ with n≠0; p=2; nonfinite perfect residue field | Trivial twist has fixed K, infinite-inertia twist has none; integral fixed ring follows by intersection. General-base §2 used directly. |
| The de Rham lattice attached to an étale lattice | T=0, ℤ_p, ℤ_p(±1), ramified quadratic lattice, non-de-Rham character | Covariant D_dR and θ conventions retained; L_dR⊗O_C need not equal M_dR. Replaced only invariant/de Rham suppliers. |
| Model-independent logarithmic de Rham lattice | Point, adjacent degrees free, adjacent torsion negative control | Both freeness hypotheses retained, equality inside common rational de Rham space unchanged. Earlier supplier substituted. |
| Cohomological Breuil–Kisin coefficient maps | k₀=F₂ and F₄; u=0; π=p^(1/p); E(0)=a·p | f=gφ sends u to [π^♭]^p; c applies coefficient Frobenius; primitive Witt coefficient of g(E) is a unit. Replaced prism-morphism proof by explicit distinguished-element proof. |
| Perfectoid trace coefficient calculation | Perfectoid point; positive/negative Bott degree | Same absolute relative-degree conventions; no prism needed for coefficient calculation. Removed unused PR.3 prerequisite. |
| Quasisyntomic unfolding of the trace coefficient sheaf | QRSP object, one cover, common refinement | Same equivalence and evenness on the basis; only early DD.5 site/unfolding imports. |
| Absolute trace comparison with AΩ | Perfectoid point, smooth torus, full smooth O_C-domain | Same evaluated trace/AΩ map and completed scalars; removed prism prerequisite. |
| Relative quasiregular evenness and descent | O_K coefficient point, QRSP cover, smooth algebra after unfolding | Evenness is on the basis; raw π₀ is not substituted on a smooth algebra. Removed prism input. |
| Cohomological Breuil–Kisin complex | Point, zero/empty sections, two uniformizers | D_𝔖(O_K)=𝔖; F=loc can⁻¹Φ; b-inversion does not invert coefficient u. Defined from earlier relative trace descent, not a prism. Global isogeny follows in the next target to keep dependency order. |
| Breuil–Kisin Frobenius décalage identity | Point; degrees 0,1,2; E unit after localization | Factorization retains inclusion Lη_E D→D; inverse bound E^i on τ≤i. For qcqs schemes bounded descent gives global isogeny. No RΓ/Lη interchange or filtration on the untwisted D. Trace proof replaces prism supplier. |
| Breuil–Kisin A_inf base change | Point, finite affine cover, nonproper qcqs scheme | gφ=f; finite-level reductions have uniform lower bound −2; completed inverse limits retained. Ordinary tensor only after proper perfectness. Trace comparison replaces prism comparison. |
| Frobenius-twisted Breuil–Kisin de Rham map | Point, O_K⟨t⟩, π=p^(1/p), arbitrary smooth formal scheme | u maps to π^p, differential is d(tⁿ)=ntⁿ⁻¹dt. Perfect O_K coefficient module permits all RΓ, so no qcqs restriction added. Trace Corollary 11.12(2) used. |
| Frobenius-normalized Witt specialization | Point, u=0, non-Frobenius-fixed a∈F₄ | c([a])=[a^p]; W(k₀) is a perfect coefficient module. Frobenius preserved; agreement with a separate construction is downstream. Trace proof replaces prism proof. |
| Perfect complex and cohomological Breuil–Kisin modules | Point; [𝔖→ᵖ𝔖]; residue reduction | Perfect complex can have H¹=𝔖/p; no free-cohomology claim. Derived completeness plus perfect residue reduction proves perfectness; exact φ-pullback gives the cohomological Frobenius. Replaced prism proof. |
| Breuil–Kisin twist base change | Twists 0,1,−1; conormal levels 1/2; formal P¹ | Positive line has Frobenius a/E, becomes f(a)/f(E); H² gives negative twist. Rank-one normalized conormal bases justify passage to limits, no arbitrary tensor/limit exchange. Removed prism definition. |
| Uniformizer-choice transport after A_inf extension | Same choice, three choices, degree-zero modules versus derived objects | Transport α_j⁻¹α_i gives identity/cocycle. Derived descent needs coherent Čech data; equalizer only for discrete module maps. Replaced coefficient-prism terminology by coefficient data. |
| Regularity of affinoid perfectoid coefficients | Perfectoid point; nonzero-divisor hypotheses; field versus valuation ring | Its assertion is unchanged. The following layer introduction now names PadicPeriodRings as the rational supplier. |
| Torsion and lattice statements for proper cohomology | Point; adjacent crystalline degrees free; torsion negative control | The export and its hypotheses are unchanged. The following layer dependency summary no longer imports P8. |
| Nodal conic and good reduction model test | Smooth chart; nodal two-branch chart; proper generic fibre | The worked model tests are unchanged. The following dependency summary uses earlier periods, and AI.7's introduction now describes trace descent. |
| De Rham torsion divisibility constraint | π=p^(1/p); torsion summand ℤ_p/p^a; a=0/1/2 | O_K-length remains pa. The following dependencies and downstream ownership list changed, not the torsion statement. |

For the eight removed targets the downstream table above records the domain and normalization.
Additional negative controls checked in their relocation: rank-zero and the unit minuscule object;
μ⁻¹ as the positive-line Frobenius invariant; QRSP versus smooth gr⁰; the nonperfect overlap;
E(0)=a·p versus φ_W(a)·p; dt/dlog t versus degree-zero data; θ versus θ̃;
nonproper completion versus proper ordinary tensor. These statements were moved, not newly
proved or weakened. The replacement minuscule definition is not an assertion that every
arbitrary crystalline triple comes from a module.

### Lean scope and signature comparison

The Lean `variable` blocks remain unchanged. In particular the polynomial Witt formulas have
arbitrary perfect characteristic-p coefficients, the principal-kernel milestone keeps its explicit
root/kernel hypotheses, the generic shifted kernel keeps the given automorphism and kernel
hypothesis, and the décalage term is only the nonnegative-degree intersection formula it states.
No heavyweight geometric theorem was made a theorem over a bare arbitrary ring.

Checked the README against `mu_factorization`, `frobenius_mu`, both finite-level successor
formulas, `map_mu_xi_of_eq_one`, `shiftedTheta_ker`, both `thetaTilde` evaluations,
`ker_fontaineTheta_eq_span_xi`, `isRegular_p_mu`, `mem_etaTerm`,
`coefficientFrobenius_formula` and `crystallineCoefficient_comp`. Existing q=1,
length-0/1/2, p=2, unit décalage and two-operator Koszul witnesses remain. The two new
examples use genuine existing ℤ, PadicInt and Padic carriers, without extra ring hypotheses
that manufacture a period object. Heavy definitions, including the new two period sheaves,
are named in the closing comment rather than given sorry-bodied data.

## Source, library and duplication checks

Read the reviewed library audit, the exemplar, the package protocols and the current upstream
AdicSpaces and AlgebraicVectorBundles roadmaps, including their suggested carriers. Current
upstream checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered period completions,
pro-étale/structural period sheaves, minuscule Frobenius images, relative trace/BK cohomology
and the vector-bundle descent interface. Existing completion/Witt carriers and the site comparison
are cited, not redefined. No new claim of library implementation is made.

Read `comonadicExtendScalars` at the Mathlib pin, not just in the newer checkout.
The executable signatures remain at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Source reads for the changed proof routes: Sch13 Theorem 5.1 (pp.28–34),
Definition 6.1, Theorem 6.5,
Corollary 6.6, Proposition 6.7 (pp.34–37); Definition 6.8, Proposition 6.10,
Corollaries 6.13–6.14, Proposition 6.16 (pp.37–40); Lemma 7.3 (pp.42–43),
Theorem 7.11 (pp.46–47), Theorem 8.4 (pp.48–49); BMS1 v3 Definition 3.22,
§§5–6, and the published Example 4.2/Example 4.24/Corollary 4.33;
BMS2 Theorem 11.2, Proposition 11.15 and Corollary 11.12, Remark 11.17;
SW20 Definition 12.4.3; ALB's minuscule dictionary and Proposition 4.3.5.
The README gives each target's own locator and proof route. All repository prose is in our
own words; no source passage or source-file copy is committed.

The public BMS2 published PDF was accessed on 2026-10-17 via the Numdam link in the
README; SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.
Other cleared source files were read in place. The scratch source/text/log files are disposable;
no downstream worker needs them.

## Validation

- `lean-check` on the package Suggested.lean: exit 0, 35 warnings, all declaration-uses-sorry;
  no other warnings or errors. Shared pinned build; memory checked before compiling.
- Suggested file: 342 lines, unchanged 12 light real-bodied definitions/abbreviations;
  15 theorem signatures and 20 examples. No sorry-bodied data or auxiliary development.
- `scripts/check_sorry_data.py`: pass.
- `scripts/check_blueprint.py` on all three AInfCohomology packets: zero errors and zero warnings.
  Packets were not edited; their existing recorded planning gaps are outside this package fix.
- Internal own-title/reference and downstream-only supplier audit: pass. No references to the
  relocated prismatic targets survive in local Needs clauses.
- `research/blueprint/intake.py check-files` on the four deliverables: pass.
- `git diff --check`: pass.

No unresolved finding in this issue. External owner updates are specified above and require
those owners' jobs; editing their files here would exceed this issue's deliverables.
