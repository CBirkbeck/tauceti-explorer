# Independent package review: PadicHodgeRegulators

Issue #11453 · `REV-PKG-PadicHodgeRegulators~codex2` · 2026-10-20.
Reviewer: Codex, session `codex-sET97m`.
Verdict: **accepted with the corrections in this review**.

This is an independent review of the package after
`FIX-PKG-PadicHodgeRegulators~adv1`. I did not write the package, the preceding
review, or that fix. The fix worker's self-acceptance was not evidence of an
independent verdict. The subject is p-adic regulators and the local K₃ theorem;
the unrelated Mordell title in the issue template was disregarded.

Acceptance concerns a roadmap with explicit required inputs. The commissioned
CohomologyComparisonsPartII and ColemanIntegrationPartII producers are not
implemented or packaged by this review. The dependent regulator targets remain
conditional on their named contracts. This follows the issue's express
instruction for this revision, rather than treating a proposed input as an
existing theorem.

## Findings and corrections

1. **A missing nebentypus hypothesis, corrected without discarding the general
   case.** LLZ2011 §1C6, p.1106 makes trivial nebentypus a standing convention
   for the displayed modular formulas. Previously §9.28 gave its special
   matrix and scalar relation without saying this. The scalar formula now
   explicitly has that hypothesis. Beside it, `modularSpecialization_general`
   retains arbitrary nebentypus through the actual Φ, ordered M and the
   specialization subspaces of §§9.25–9.26. The untwisted determinant is
   ε_f̄(p)p^(k−1), so substituting the trivial-nebentypus matrix is a concrete
   failing test. No all-weight or arbitrary-nebentypus target was removed.
2. **Integral Γ action, completed.** The filtration argument in §9.29 now
   explains the coefficient action as well as the Wach basis matrix. For
   γ∈Γ₁, χ(γ)≡1 mod p, and γ fixes R/(φ(π)); consequently its action on the
   i-th quotient is the scalar χ(γ)^i. This supplies the step from the
   geometric-series lower inclusion to the integral coordinate ideal.
3. **Lean examples, brought into the required shape.** Removed three isolated
   calculations about a scalar inverse, a determinant swap and a mod-5
   companion matrix. Their mathematical witnesses remain in the README;
   none tested a retained roadmap definition in Lean. Removed the redundant
   constant-polynomial jet example so that every retained definition has two
   proved examples. Kept the nonzero f₆ jet example and the Tate-root jet.
   The README no longer claims its determinant witness is computed in Lean.
4. **Endpoint locator, corrected.** §9.36 now cites the final assertion of
   Rubin Proposition III.5.14, printed p.52; the consulted public text has no
   subpart (b). The augmentation-containment statement is unchanged.

The metadata remains exactly `topic = "math.NT"`.

## Resolution of the five preceding objections

| Finding | Independent verification and verdict |
|---|---|
| R1: classical syntomic producers | The exact-supplier table names the rigid cohomology targets and CS.0–CS.3, including divided/undivided complexes, directed period arrows, modified Tate lattice, bounded errors and normalized boundary. Every dependent comparison in Layers 4–7 remains conditional. CohomologyComparisons §§4.1–4.3 are explicitly rejected as producers of these objects. The maintainer's commission #11431 owns these inputs and orders them before this consumer. Resolved as a conditional roadmap dependency. |
| R2: relative open-family producers | The five named Fil-F-MIC/Ext, comparison, evaluation and residue contracts belong to the same commissioned Part II. §§7.8–7.9 retain compactification, relative normal crossings, coherence, Fil²H² and truncated-complex vanishings. Proper refinement has domain ker ∂; the evaluation square requires Frobenius-compatible points, and the normalized absolute conclusion requires finite residue field. CohomologyComparisons §6.3 is not credited with these inputs. Resolved on the expressly conditional terms of this issue. |
| R3: integration producers and generality | The exact table names harmonic gluing, Vologodsky integration, global triple and annular double indices, orientation/cup laws, branch, trace and finite-extension descent. Maintainer commission #11433 owns these, after ColemanIntegration and the comparison Part II. §7.7 keeps the arbitrary-reduction theorem over finite K/ℚₚ; §§7.10–7.11 give a separate split-model realization. The general theorem is not replaced by that realization or by a holomorphic-only version of the second-kind formula. Resolved conditionally. |
| R4: normalized comparisons | Independently checked the positive Kummer/Herr cocycle, the conversion from CC99's (1−τ) lift, the integral Tate-root class, the Fontaine boundary, ordered LZ pairings, and the nonzero f₆ test. The choices determine the signs; they are no longer unspecified constants. Details follow. Resolved. |
| R5: integral Wach lower inclusion | Independently checked contraction in the actual integral lattice, continuity and ψ-fixedness of the series, the Γ quotient filtration, integral Weierstrass intersection, and finite length after rational equality. The proof uses neither restriction (C),(D) nor a small-weight substitute. It does not infer integral surjectivity. Details follow. Resolved, with the coefficient-action clarification above. |

### R4: sign and normalization audit

The positive multiplicative Kummer cocycle is τ(α)/α; after additive
linearization it is the positive (τ−1) boundary. The package's normalized
Herr representative and the positive period lift give `L⁺`, the negative of
the CC99 §IV.3 lift written with (1−τ). Comparing all twisted coefficients in
CC99 Theorem IV.2.1 identifies the positive Coleman logarithmic derivative
with the positive Iwasawa class. The derivative identity alone would not fix
this sign. Read CC99 §§IV.2–IV.3, pp.20–23 and Proposition V.3.2 with its
proof, pp.26–27, and Berger's compatible cocycle formulas, §II.3, pp.114–115.

The integral check matters: f=1+π gives Δf=1 and the nonzero inverse-limit
Tate-root class, although each finite rational specialization of that class
vanishes. Comparing the normalized Herr cocycle with Kummer gives a
coboundary over ℤₚ: log(a)/(a−1)−1 has the required p-adic divisibility for
the layer with a=χ(γ). Thus the argument does not lose the integral root
direction by rationalizing each finite level.

Fontaine's §2.1, p.153 uses p^−rφ−1. With a positive cocycle boundary, the
correct lift adds the invariant coordinate
(1−p^−rσ)^−1a. At p=5,r=2,a=1 this is +25/24; the opposite arrow gives
−25/24. Read the boundary against Benois–Nguyen Quang Do §2.2–§2.3,
pp.647–652, including the integral exponential lattice, rather than using a
lattice index to infer the sign. The claimed integral range is 2≤r≤p−2;
r=1 has the separately stated finite-unit logarithm.

For LZ2014, read §2.4, p.5; §2.6, pp.6–7; Appendix B, pp.37–40; and
§6.4.2, pp.28–29. Its positive exponential adjunction and ordered
degree-one cup give
Q(exp* x, log y)=−P(x,y) after transposing the two cohomology inputs.
The degree-zero evaluation pairing itself introduces no sign. With the
package's order and involution, reciprocity is therefore
+σ_−1ℓ₀ times the Iwasawa pairing. Transporting the printed Appendix-B
reciprocity formula without this transposition would fail this convention.
Berger §II.16, pp.122–123 gives a separate check of the ordered reciprocity
sign; its adjacent remark also warns about source conventions.

At p=5 the genuine Coleman series f₆ has constant 6, logarithmic derivative
5/2 and second logarithmic jet 35/12. Its depleted χ² moment is −35/3,
and its regulator moment is −70/3. Its mass is (4/5)log₅6≠0. These values
distinguish the two normalizations, unlike the zero output on the root
tower. The retained Lean example proves the rational jet and moment
arithmetic; the cohomological comparison remains a named README target.

### R5: actual integral lattice audit

Put M=N(T₀), R=𝒪_E[[π]], 𝔪=(ϖ_E,π) and h=k−1≥1. The actual reduction
of its integral Frobenius matrix has characteristic polynomial
Z²−a_p(f̄)Z+ε_f̄(p)p^h. Nonordinarity makes its square zero modulo
ϖ_E. Since φ fixes 𝒪_E and preserves 𝔪, this gives
φ²M⊂𝔪M and φ^(2n)M⊂𝔪^nM. This is contraction in the complete
integral module, with no eigenbasis or coefficient denominator.

For y in the claimed lower submodule, twisting identifies y with an element
of φ*M⊗v_h⊂M⊗v_h. The sum of φ^n y converges there, telescopes to a
solution of (1−φ)x=y, and ψφ=id together with ψy=0 gives ψx=x.
The 𝔪-adic convergence embeds into the weak topology used for D(T).
The solution is in the actual integral D(T), not merely its rationalization.
The argument works over the original ramified coefficient integers.

The Γ-filtration argument, now including the coefficient action, yields
X_kΛ_𝒪⊂Im Col_j^η. Monic distinguished Weierstrass division gives the
upper intersection with X_j^ηΛ_𝒪. Since X_j^η divides X_k, the quotient
between these bounds is finite over 𝒪_E; rational image equality makes the
remaining quotient torsion and therefore finite length. A unit-determinant
shear gives finite coordinate cokernels. It does not give zero cokernels.

Read LLZWach2010 §2.2, p.8; Proposition 4.6, pp.24–25; and
Proposition 4.11 with its (C),(D) assumptions and proof, pp.26–27;
LLZ2011 §1C4–§1C6, pp.1103–1106 and Theorems 5.10,5.13 with
Proposition 5.11 and Remark 5.12, pp.1128–1129. The wider contraction
argument is an explicit proof route in the package, not a claim that
Proposition 4.11 states the wider result. The p=5,h=9,trace=5 model falls
outside both old bounds and still contracts. A unit-Frobenius block fails
contraction, and (ϖ_E,X) is rationally full but integrally proper.

## Source sample

Selected 15 numbered subsections using Python's random sample with seed
`codex-sET97m-2026-10-20`, before examining their cited passages. The table
records the actual locator checks. All linked versions were accessed
2026-10-20. Additional high-risk passages for R1–R5 were read as described
above and below; this is not a claim to have read every cited paper in full.

| README target | Public source and checked locator | Result |
|---|---|---|
| §9.33 de Rham regulator | [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), equation (3), Theorem I.15, pp.914–915 | Admitted domain and exact-conductor normalization retained. |
| §8.10 big exponential | [BergerDM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Definition II.12, Theorem II.13, Remark II.14, pp.120–121 | Derivative obstruction and permitted h retained. |
| §8.7 logarithmic factors | [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), §1B and Proposition 1.6, pp.1101–1102 | ℓ factors and weight multiplicities agree. |
| §5.6 root classes | [GSWZ v2](https://arxiv.org/pdf/2412.04241v2), Theorem 9 proof, p.39 | m[ζ], completed Bloch class and p-unit coefficient distinguished. |
| §9.10 polynomial witness | LLZ2011 Lemma 4.3 proof, p.1119 | Distinct evaluation points and Lagrange construction agree. |
| §4.3 special-unit formula | [BdJ2003 v2](https://arxiv.org/pdf/math/0110334v2), Theorem 1.6(2), p.4; Theorem 1.12, Remark 1.13 and Conjecture 1.14, p.6 | Proved special-unit formula remains distinct from general conjecture. |
| §0.1 Tate conventions | [Berger2003 v1](https://arxiv.org/pdf/math/0209283v1), §I.2, pp.4–6 | Filtration jump gives weight +1 for ℚₚ(1); source sign translation is explicit. |
| §8.15 singular Euler maps | [LZ2014 v3](https://arxiv.org/pdf/1108.5954v3), Appendix B, (B.1)–(B.2), pp.37–38 | Cleared relations and boundary lifts retained; no singular inverse asserted. |
| §9.32 analytic differential powers | RJ2018 Proposition I.13 and proof, pp.911–913 | Genuine differential module, ψ-zero domain and integer powers agree. |
| §9.16 vector coordinates | LLZ2011 Lemma 3.3 and Definition 3.4, p.1117 | Row orientation and logarithmic matrix decomposition agree. |
| §9.4 new-point inverse | LLZ2011 Proposition 4.2 proof, p.1118 | Unused point condition is essential and present. |
| §3.2 dilogarithm functoriality | GSWZ v2, equation (176), p.38; BdJ2003 Remark 1.13, p.6 | Frobenius/scalar extension conventions agree. |
| §5.3 residue reduction | GSWZ v2, Proposition 3.2 and equation (178), p.38 | Prime/domain restrictions and excluded root retained. |
| §9.29 integral image | LLZ2011 Theorems 5.10,5.13, pp.1128–1129; [LLZWach2010](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf), Propositions 4.6,4.11, pp.24–27 | Source restrictions checked; wider proof audited separately. |
| §8.3 Euler inverse | LLZ2011 Lemma 5.6 and proof, p.1126 | Quadratic identity and nonzero denominator agree. |

For R1 the further checks used [EN2016 v2](https://arxiv.org/pdf/1603.01705v2),
Theorems 2.2–2.3, pp.7–9;
[CN2017 v4](https://arxiv.org/pdf/1505.06471v4), Theorem 1.1, p.2 and
the fundamental sequences, p.23; and
[NN2016 v5](https://arxiv.org/pdf/1309.7620v5), Proposition 4.13 and
Remark 4.14, pp.53–54. The two modified-lattice conventions and the
divided exact/undivided bounded distinction are stated separately.
For R2, [AM2022 v2](https://arxiv.org/pdf/2007.14255v2), Assumption 2.20,
p.15, Theorem 3.7, pp.27–31 and Theorem 4.5, p.36 support the retained
hypotheses and negative relative-coordinate sign.
For R3, [Besser2025 v1](https://arxiv.org/pdf/2502.16738v1), §3, pp.6–9
and §7, p.28, and [BR2019 v1](https://arxiv.org/pdf/1910.06877v1),
§3, pp.10–11 and Theorem 4.7 proof, pp.19–20 distinguish the full index
formula, monodromy quotient and toric comparison.
The ordinary/split-multiplicative endpoint was checked against
[Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf),
Proposition III.5.14, printed p.52.

The R4 sources additionally include
[CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf),
[Fontaine's boundary](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf)
and [Benois–Nguyen Quang Do](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf),
at the locators recorded in the sign audit. No remaining package citation was
marked unverified; the previously unresolved mathematical comparisons were
checked directly rather than accepted from the fix worker's notes.

## Fidelity, prerequisites and duplication

Compared the root's one native target and both imported parts' 72 and 59
targets with all 114 numbered and 18 supplier subsections. All **132 target
families** are represented. Supplier signatures are imports, not newly owned
theory. The corrections preserve the full target set and the established
conjecture boundaries: arbitrary Bloch presentations, positive-rank global
injectivity and scalar-extended injectivity are not promoted to theorems.

Read ClassFieldTheory and ProfiniteArithmetic in current TauCetiRoadmap as
form/API models, along with UPSTREAM_GUIDE. Checked the current upstream
roadmaps, including Completed and the nine post-snapshot roadmaps, at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used Kummer and
unit completion, period/φ/ψ structures, crystalline and syntomic conditions,
dilogarithms, Wach/Coleman objects and regulator comparisons, followed by
reading relevant declarations. Existing Teichmüller, root-of-unity and
unit-decomposition results are already deferred in the supplier section.
No further duplicate target required removal.

At the pins, read the positive Kummer cocycle and its power-class map in
`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`; the package consumes that
choice rather than defining a second Kummer theory. Checked the native
polynomial, finite-field, matrix and submodule APIs used by Suggested.lean
against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the
provided Tau Ceti `f790474` build. No Lake command ran in the current
read-only checkouts.

The commissioned supplier order is documented by maintainer issues
[#11431](https://github.com/CBirkbeck/tauceti-explorer/issues/11431) and
[#11433](https://github.com/CBirkbeck/tauceti-explorer/issues/11433).
The Caraiani–Newton tier list does not assign this regulator package a tier;
it does not override that explicit order. No dependency was added on
EllipticRegulators, PeriodsAndSpecialValues or another downstream consumer.

## Adversarial pass over the complete target set

Each row groups the indicated target families, including definitions, their
API assertions and conventions. These are concrete instances checked, not
claims that a successful `sorry` elaboration establishes truth. All
definitions retain at least three discriminating README Checks.

| Targets checked | Instances and failure controls | Outcome |
|---|---|---|
| Fundamental-sequence and integral suppliers | V=0, r=0, r=1; p=3 has no 2≤r≤p−2 range; opposite p=5 boundary | Exact coordinates, positive boundary and integral range retained. |
| h_Iw, twists, twist compatibility, Wach containment, coefficient-change suppliers | Trivial character; γ↦γ⁻¹; ε↦ε^a; integral root tower with zero finite rational images | Integral comparison and simultaneous twist conventions retained. |
| Teichmüller and Frobenius suppliers | Tame versus p-power roots; ramified field lacks the unramified Frobenius; p=2 signs | Existing results deferred; Frobenius product has its stated domain. |
| Soulé supplier | Degree-zero Chern class; higher factorial not a unit; torsion killed by rationalization | Completed edge and ordinary Chern operations remain distinct. |
| Rigid, log-syntomic, period-map, small-comparison suppliers | Point; r=0; r=p−2 versus p−1; mod-p composite p^r=0; EN versus CN modified lattices | R1 conditional inputs; no reverse integral period map or false integral exactness. |
| Unramified algebra, completed K₃ and Bloch suppliers | Empty product; ramified ℚₚ(ζₚ); small-prime torsion and possible Bloch obstruction | Actual completion and unramified hypotheses retained. |
| Good Wach basis supplier | Matrix determinant 5 invertible over ℚ₅ but not over ℤ₅ | Integral basis requires unit determinant. |
| §0.1 | r=0,1,2; twist followed by inverse twist | Period, filtration and weight signs agree. |
| §§1.1–1.4 | V=0, ℚₚ and ℚₚ(1); quotient by Fil⁰ plus fixed-image; ordered logχ/Kummer pairing | Correct quotient and positive adjunction; no unrestricted logarithm inverse. |
| §§1.5–1.8 | Invariant terms at r=0; κ(p) outside finite condition at r=1; trace in degree two | Dimensions, duality and restriction/corestriction retain their domains. |
| §§1.9–1.11 | Torsion on abelian varieties; multiplication by m; p=5,r=2 lattice 25𝒪; two independent product coordinates | Lie logarithm, integral range and semilocal product retained. |
| §§2.1–2.4 | γ inversion, root rescaling, repeated finite level, f=1+π and f₆ | Choice factors cancel; positive Kummer normalization independently verified. |
| §§3.1–3.3 | Nonzero nonunit (0,2) in K×K; z=0,1 excluded; factor permutation and split prime | Admissibility is componentwise; combined target is a product. |
| §§3.4–3.6 | Weight-two depletion 24/25 over ℚ₅; rank-zero ℚ; nonzero unit rank; norm of base scalar in degree two | Normalization dictionary, full log kernel and norm/trace preserved. |
| §§4.1–4.3 | c₂ of two line bundles; zero weight; special versus arbitrary Bloch symbols | Whitney sum, higher additive maps and proved/conjectural boundaries retained. |
| §§4.4–4.6 | n=3 factorial; p=5 depletion; unscaled boundary p²exp; mod-p noninvertibility | Factorial, depletion and rational normalization not suppressed. |
| §§5.1–5.3 | p=3 double-zero failure; p=5 residue values 1,4,0; excluded 0 and 1 | Prime bound and q−2 domain retained. |
| §§5.4–5.6 | A nonzero p^−2 residue; values and differences; m[ζ] versus bare [ζ] | p²-integrality, spanning and completed root classes retain exact strength. |
| §§5.7–5.9 | Products and empty product; small-prime torsion; p=5 image 25ℤ₅ | General regulator remains; integral isomorphism has p>3 and unramified hypotheses. |
| §§6.1–6.4 | ℚ rational K₃ rank zero; split local factors; transfer after restriction; ramified factor | Global construction and functoriality do not import global injectivity. |
| §§6.5–6.8 | Torsion; ℚ-injective map ℚ²→ℚₚ not scalar-extended injective; cubic split 1+2 at 5 | Denominators, two injectivity predicates and worked example retained. |
| §§7.1–7.3 | f=1 versus f=2 norm sum; genus zero; all 2g coordinates | Raw q-Frobenius and normalized coordinates distinguished. |
| §§7.4–7.6 | Primitive plus constant; degree-zero divisor; p=5 scalar factor 9/10; quadratic base change | Full normalization and named pull/push retained. |
| §7.7 | Tate curve branch; arbitrary reduction over finite K | General Vologodsky theorem remains beside split-model formula; R3 conditional. |
| §§7.8–7.9 | Steinberg symbol; nonzero tame residue; non-Frobenius evaluation; infinite perfect residue field | Proper refinement, negative coordinate and finite-k absolute conclusion have exact hypotheses. |
| §7.10 | Add a coboundary; nonzero discrete coordinate; N²=0 but Nρ≠0 in the two-dimensional linear model | Both coordinates and quadratic finite branch correction retained. |
| §7.11 | Reverse edge orientation; second-kind versus holomorphic form; nonzero discrete regulator | Full index expression, H/im N output and separate discrete datum retained. |
| §§8.1–8.5 | Φ=2,a=−5,b=6; Φ=0; singular Φ=1; p=0 | Every inverse theorem retains its specific nonzero denominators and quadratic relation. |
| §§8.6–8.7 | j=−2,−3; repeated Hodge weights | Leading Laurent values −1,1/2 and correct logarithmic multiplicities. |
| §§8.8–8.12 | Tate-root kernel; h=0 empty product; nonzero obstruction; twist to negative weights and possible poles | Genuine obstruction, intrinsic domain and separate meromorphic extension retained. |
| §§8.13–8.15 | Exact primitive conductor; negative j; singular Euler operator | Gauss normalization and cleared relation retained; no chosen output from a singular inverse. |
| §§8.16–8.20 | Negative slope quotient; root changes a then b; reversed degree-one cup; weights (0,2) versus (1,1); two distinct functionals | Growth, ordered reciprocity, determinant ideal and chosen scalar projection retained. |
| §§8.21–8.22 | Nonzero f₆ mass/moment; split α=1 versus nonsplit α=−1 | Normalization witness and augmentation containment agree with source. |
| §§9.1–9.4 | Empty constraints, rank zero, constant versus X, repeated point, evaluation at the old point | Native submodule, distinctness and unused-point conditions retained. |
| §§9.5–9.8 | Coordinate swap; zero transport; two line conditions at 0 and 5; full allowed space | Transport direction, dimension and determinant exponents agree. |
| §§9.9–9.11 | Coordinate axis constraint; no constraint; polynomial witness at distinct points | Product generator and exact coordinate image agree. |
| §§9.12–9.17 | Zero row; rank-one reconstruction; swap M; independent basis changes U and B | Col transforms by U⁻¹, M by UMB⁻¹; coefficient embedding explicit. |
| §§9.18–9.21 | Nonunit determinant 5; shear (2,3); ℤ₂ forbidden slope; proper ideal (5,X) | Integral unit condition and rational-only surjectivity retained. |
| §§9.22–9.24 | Scalar φ with critical flag; rank one; weights (0,2); removable values | Noncritical hypothesis and n_r versus logarithmic factors distinguished. |
| §§9.25–9.27 | Swapped specialization line; forbidden eigenvalue p^−1; nonconstant distinguished factor | Actual transported W, bounded descent and analytic elementary divisors retained. |
| §9.28 | p=5,k=2,a_p=0,(g,h)=(1,2); nontrivial determinant character | Correct ordered ρ; missing nebentypus hypothesis fixed with general target preserved. |
| §9.29 | High weight h=9 at p=5; unit-Frobenius nonexample; ramified ϖ_E; proper (ϖ_E,X) | Integral proof and coefficient-action step verified; finite length only. |
| §9.30 | Row (1,0) under upper triangular basis change; multiply coordinate by unit | Kernel depends on signed basis; closedness is separate from basis invariance. |
| §§9.31–9.32 | p=2,q=4; boundary of strict ball; wrong torsion component; integer powers 0,1,−1 | Admitted domain and ψ-zero inverse retained. |
| §§9.33–9.36 | Primitive Gauss sum at p^m versus imprimitive at p^(m+1); both exponential branches; Jordan block; split versus nonsplit | Full de Rham extension and conductor domain retained; augmentation is containment. |

## Lean correspondence and validation

Checked all twelve named theorem signatures against their README claims,
exceeding the required ten: finite-polylog double zero; residue cancellation,
field map, five-values and spanning; both quadratic inverse specifications
and their product; Gamma nonvanishing; simultaneous basis/determinant;
row covariance; and unit shear. Their fields/rings, prime/degree bounds,
nonzero hypotheses, evaluation kernels and coefficient embeddings agree.
The closing comment names the heavy README definitions, including the
general curve and de Rham targets, rather than introducing admitted carriers.

Suggested.lean has eight light real-bodied definitions, sixteen proved
examples and twelve named theorems, eleven admitted. It uses one
`import Mathlib`, one namespace, ordered layer comments and no admitted data
or examples. The retained examples all test definitions introduced here.
No new theory or weakened substitute for a heavy milestone was inserted.

`lean-check` on the final Suggested.lean **exited 0**, with exactly eleven
`declaration uses sorry` warnings and no other diagnostics. Available memory
was 80 GB before the run. No language server, library build, update or cache
download was started. The remaining file checks and exact final counts are
recorded in the handoff.

The input packets were not edited. Their historical gaps, requests and
correction records are not declared closed by this package verdict. The
remaining work is implementation of this roadmap and its explicit
commissioned prerequisites, not an unfinished task in this review.
