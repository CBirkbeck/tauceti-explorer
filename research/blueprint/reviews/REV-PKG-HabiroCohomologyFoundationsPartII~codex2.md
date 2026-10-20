# Independent package review: Habiro cohomology foundations, Part II

Issue #11441; Codex, session `codex-KFuAQC`; 2026-10-20.
**Verdict: accepted with the corrections below.** This is a completed independent
review of the package after fix #11429 / PR #11438, not that fix's self-assessment.
The starting atlas commit is `8ff2064a6`. I did not author the package, plan,
previous independent review or supplier repairs.

The operative previous review is
`REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md` (R1–R4), rather than the
absent unsuffixed report named in the generated issue. The issue's Mordell title
is also boilerplate: the actual input is the Habiro package. The supplied plan
is complete, with four nodes, fourteen API items, eleven construction tests and
three requests; it has no independent review object. I checked its mathematical
content without inventing an earlier plan acceptance. Packets were not edited.

## Findings and corrections

**F1 — an étale pair was confused with its completed filtration.** In §1.2,
`tracePair_etale` formerly asserted both an h-adic description of the uncompleted
pair and `qdR^∧_h ≃ R[[h]]`. Global animated qdR is already h-complete, and
animation need not agree with the underived smooth functor. The corrected API is

```text
F̂^j_tr = h^max(j,0) R[[h]],
F^j_tr = qdR_{R/A} ×_{R[[h]]} h^max(j,0) R[[h]].
```

This follows the completion/pullback convention of QH Remark 3.6, pp.22–23,
and its étale specialization in Corollary 3.13, p.27. QH Paragraph A.14, p.76,
explicitly distinguishes the animated and underived functors.

The new `tracePair_etaleUncompleted` check takes A = ℚ and R = ℚ(i).
Polynomial Poincaré and animation give dR = ℚ and qdR = ℚ[[h]], whereas the
empty framed model is R[[h]]. For j > 0 the pullback is represented by the
fiber of ℚ[[h]] ⊕ h^j R[[h]] → R[[h]]. Its H⁰ is h^jℚ[[h]] and its H¹ is
(R/ℚ)[[h]]/h^j. Thus even a nonzero finite étale algebra disproves the former
uncompleted h-adic assertion. The filtered β-quotient retains the uncompleted
Hodge filtration, whose positive steps have H¹ = R/ℚ. The completion has the
static h-adic steps on R[[h]]. The same distinction now qualifies
`canonicalFramedTrace_etale` in §3.3. No target or hypothesis was weakened.

**F2 — make the number-field base convention explicit.** The plan writes the
cyclotomic target as qW_m(R/ℤ[1/Δ]); the package uses qW_m(R/ℤ), matching its
imported realization H_{R/ℤ}. Added the identification in §4.2. The rational
constant family 1/Δ satisfies the Taylor equalizer, so Δ is already invertible
in H_{R/ℤ}. HR §5.6 applied to ℤ → ℤ[1/Δ] identifies the two complete Habiro
rings, hence their finite q-Witt quotients. This uses completed base change,
not a general assertion that flat tensor commutes with completion. It also does
not insert arbitrary R-constants, which fail the Frobenius relations.

Suggested.lean and metadata.toml are unchanged. The README retains all target
families, API laws, hypotheses, old checks and source cautions, and gains the
étale negative control and the base-convention explanation.

## R1–R4 and the actual dependency order

Arrows in this report mean **supplier → consumer**. Write HC for
HabiroCyclotomicCompletions, HR for HabiroRings, I for
HabiroCohomologyFoundations, RT for RefinedTraceMethods, and II for this package.
The actual supplier-first order is

```text
HC → HR → I → RT → II.
```

The issue addendum instead requests I → HR → HC → RT → II. That literal order
cannot be certified: HR requires HC's ordinary completion toolkit, and I
requires HR's scalar/derived interfaces. The corrected order above is the one
already proposed by the previous independent review and implemented by the
merged repairs. This discrepancy in the issue does not justify reversing real
supplier edges or introducing duplicate constructions.

| Finding | Independently checked disposition |
| --- | --- |
| R1, I importing trace constructions | Closed. I's former Layer 6 §§6.1–6.5, §8.1 trace clause and §9.15 trace comparison no longer supply a construction in I. Current Layer 6 is analytic material. I's scope, contracts and aggregate dependencies have no RT construction input; RT mentions there are downstream consumer notes. II §§1.1–1.3, 2.2–2.3, 3.3 and Layer 4 retain the relocated content, importing the actual local/global trace theorems from RT. I §§5.19, 5.20 and 5.26 retain the algebraic higher-power theorem, exponent-one failure and finite-coefficient rational corner. |
| R2, HC importing HR's derived completion | Closed. HC retains ordinary completion and its arbitrary-module boundary, and has no reverse HR construction input. HR §2.4 owns `ordinaryDerivedComparison` for every commutative B and B-module M, with Laurent regularity, staticity, B[q,q⁻¹]-linearity, finite projections and naturality; it does not assume torsion-free or flat coefficients. HR §2.14 obtains factorial divisibility from HC's integral Gaussian and Pochhammer identities, without QSeries. The ℤ/2 coefficient and q=1 module checks preserve the generality/boundary. |
| R3, obsolete HR.6 étale Habiro–Hodge input | Closed. RT §6.14 imports that identification from I §§4.21/4.28. HR §§5.8–5.9 supplies only étale number-field coefficients and the scalar ring equivalence. II uses the same split. HR.6's legitimate scalar-extension and line applications are not mistaken for the removed cohomological supplier. |
| R4, duplicate or incomplete full framed theorem | Closed. RT §6.10 owns full KU Theorem 6.10 for arbitrary étale framings, the prime-two polynomial/perfect-root resolution comparison, completed and pair exports, E∞ and derived commutative refinements, q-PD diagonal and framed Čech proof. The diagonal completion includes its full kernel, including an idempotent part. II has no §§3.1–3.2 duplicate; §3.3 consumes `framedTrace.twoAdic`, `_completed`, `_pair`, `_einfty` and compares with the canonical algebraic pair on its smaller dimension/prime-inversion domain. |

The supplier repairs are present in the baseline history: I PR #11417
(`3459b154ac96`); HR #11410 (`4b18c1d29c8e`) and independent correction #11420
(`f0d36af2e5b6`); RT #11412 (`5707f54710cf`) and #11425 (`068165cc929e`);
HC #11427 (`c390dbd26f88`); II #11438 (`13c827478ee4`). I inspected their
current files, not just the fix handoff or its accepted marker.

Every direct edge within the five-package family is listed here:

| Supplier | Consumer | Contract |
| --- | --- | --- |
| HC | HR | Layer 1 factorial/cofinal topology; §2.3 polynomial/Laurent comparison; Layer 3 Taylor substitution; Layer 4 rigidity; Layer 5 ordinary coefficient completions and root-adjoining results. |
| HC | I | Layer 3 convergent Taylor re-expansion and Hasse coefficients. |
| HR | I | Layers 1–5: perfectly covered bases, enhanced completion and tensor, coherent finite cyclotomic reconstruction, q-Witt coefficients and relative Habiro rings. |
| HR | RT | Layers 1, 2 and 5: bases, completed scalar tensor/base change, relative rings and number-field scalars. |
| I | RT | Early spherical/coordinate inputs, Layers 2–4, especially §§4.21/4.28; §5.26 finite-coefficient pairs. I's independent comparison squares are not needed to construct a trace filtration. |
| HR | II | Layers 1, 2, 5 and 7: bases, completion, Taylor equalizer, number-field coefficients and examples. |
| I | II | Layers 1–5: global qdR, filtered quotient, pairs and descent, canonical smooth/quasi-regular constructions and finite-coefficient boundary cases. |
| RT | II | §§6.1, 6.9–6.14, 7.6 and 8.8: structured lifts, local/global/framed comparisons, cyclonic KU, realization and high-powered range. |

Each edge increases position in the displayed order. There is no I → HR,
HR → HC, RT → I or II → earlier-package construction edge. HC §5.3's
localized Taylor-factor example reaches II through HR.5. Downstream lists,
historical source ownership and comparisons to applications are not added as
construction edges.

For completeness, the other roadmap suppliers named by these five packages
are inventoried below. This records the contracts, including conditional ones;
it does not certify the entire dependency graph of every external package.

| Consumer | External suppliers |
| --- | --- |
| HC | No additional roadmap construction input. Its application table names consumers of the ordinary toolkit. |
| HR | QWittVectors QW.0–QW.4; PrismaticCohomology PR.0/torsionfree-frobenius-equivalence; EnhancedDerivedSheaves E0/E1/E3/E5:abstract; StableHomotopyKTheory H.5:spectra/H.5:S-delooping/H.6; DerivedDeRhamCohomology DD.1; SolidAnalyticRings SA.1's explicitly conditional full light-solid spectral contract; VStackSheavesAndLisseCategories VS2; HabiroNumberFields HB.6/HB.7 for actual scalar rings and, separately, certified K₃-indexed lines. |
| I | DerivedDeRhamCohomology DD.0–DD.4; EnhancedDerivedSheaves E0/E1/E2/E5 and the enhanced monoidal framework named in aggregate prerequisites; PrismaticCohomology PR.0–PR.3/PR.6; PerfectoidQuotients Q3; AInfCohomology AI.1/AI.3–AI.5; CrystallineCohomology CR.0/CR.2/CR.4; CohomologyComparisons CP.1/CP.6; AnalyticHabiroStack HS.3 for the explicitly open analytic comparison; current upstream AlgebraicVectorBundles L0B/L2B for the finite-projective/sheaf dictionary. |
| RT | EnhancedDerivedSheaves E0/E1/E3/E5; GeneralizedCohomology G2–G3/G5.4; StableHomotopyKTheory Layer 5 and §§7.6–7.34; TopologicalKTheory T1.6/T2.1/T2.3/T2.5/T3/T4/T5.1; CharacteristicClasses C3/C5/C6.2–C6.3; DGAInfinity Layers 6/8/9; GeneralAlgebraicKTheory §§3.2/3.12–3.14, Layers 5–8, §§10.10–10.11/11.15–11.16/12.10/13.1/13.6–13.7; KTheoryLowDegrees §§3.2–3.7/13.2–13.4; K2SymbolsBrauer §§13.1/13.7/13.12/13.13; DerivedDeRhamCohomology Layers 0–5 and PD; BordismFormalGroups F6.1/F6.5; AInfCohomology AI.0/AI.0:integral/AI.1/AI.3/AI.4/AI.7.2; CrystallineCohomology CR.4; PrismaticCohomology Layers 0 (§0.59) and 2; PrismaticCohomologyPartII Layers 3–5; PrismaticCohomologyPartIII §§6.8–6.9/6.28/6.31/7.0; VStackSheavesAndLisseCategories VS2; CohomologyComparisons §3.7's graded Beilinson normalization through Part III §7.0. |
| II | StableHomotopyKTheory §7.32; PrismaticCohomology Layer 0; PrismaticCohomologyPartII §§3.1/3.13–3.16/3.20–3.23; PrismaticCohomologyPartIII §7.0; AInfCohomology §AI.7.2. The q-PD inputs in Part II §§5.7–5.8 come through RT's framed proof. |

Native polynomial, module, finite-projective, power-series, ordinary derived,
étale, smooth, Witt and divided-power APIs are additional foundations, not
roadmap edges. I uses Tau Ceti's diagonal-torus character API, HR its cyclotomic
all-conjugates maps, and RT finite-cyclic algebraic Tate comparisons. II imports
no Tau Ceti module. None of these native inputs replaces enhanced spectral
carriers. The Caraiani–Newton order does not assign the Habiro family an owned
numerical tier; I have not invented one. The external conditional contracts
remain conditional, and no upward QSeries construction input survives here.

## Mathematical coverage and adversarial pass

All four plan targets survive: trace descent in §§1.1–1.3, the perfected-lift
criterion in §2.2, canonical/framed agreement in §3.3, and number-field exports
in §§4.1–4.2. Their API and test obligations are present, with the corrected
étale interpretation above. §2.1 supplies explicit quotient ranges and §2.3
states an assembled global comparison, with its proof route, rather than
misattributing that exact theorem to one source. The three supplier requests
are supported by the merged interfaces; their packet status fields were not
changed by this package review.

This table covers the definitions, conventions, theorem families and their
API laws. All owned definition families have at least three discriminating
prose checks. Signatures whose carriers are absent remain README targets.

| Statements / conventions checked | Instances and wrong alternatives tested | Result / change |
| --- | --- | --- |
| `TraceInput`, forgetful/lift maps, constructors and morphisms | ℤ[1/2][x] versus ℤ[x]; zero 2-completion; identity cover versus perfect-root cover; free-δ exponent-one ku-lift; mixed branches; rational non-lci ℚ[u,v]/(u²,uv,v²). | Retain global cotangent amplitude and bounded torsion, E₁ branch at 2, maps of coherent lifted diagrams and branch-preserving identity/composition. A ring map or ku-lift is insufficient. |
| `tracePair`, completion, mod-β, rational and p-rational clauses, functoriality | Unit ℤ; zero ring's constant nonzero rational corner; ℚ(i)/ℚ; polynomial differential and multiplicative E₂ versus E∞. | F1 fixed. Keep all four pair clauses and their squares. Only the completed filtration has the trace graded description. Eₙ gives Eₙ₋₁; E₁-cover descent has its stated upgrade. |
| `traceHabiro`, maps, completions, partial completions and pair equivalences | Étale ring and zero ring; polynomial differential q^r−1 versus [r]_q at r=2; m=1 conjugate filtration; unit filtered quotient. | Derived reduction and Bockstein retained. No exchange of the conjugate and Hodge objects; no lift-independence asserted from a bare descent map. Identity/composition and transition laws are inherited from supplied functors. |
| Multiplicative, periodic and cyclonic descent | E₂ input, β inversion, 2 not a unit, missing (A₂). | Retain exact Eₙ₋₁ conclusion; cyclonic comparison requires 2 invertible and full base coherence, and asserts only its stated module equivalence. No global evenness or new intrinsic genuine filtration is assumed. |
| `E1QuotientExponent`, `E2QuotientExponent` and quotient towers | At 2: E₁ fails at 2/3/5 and holds at 4/6; E₂ fails at 4/7 and holds at 6. At 3: thresholds 2 and 3. Empty sequence; characteristic-p cofiber; S/8. | Keep evenness at 2 and sufficient, not necessary, ranges. S/8 has E₁ structure outside this criterion. Tensor products of spectral cofibers are not ordinary quotients without the regularity used for their reduction. |
| Framed, identity-cover, perfected and Moore quotient applications | Odd-prime square; 2-primary square versus fourth power; perfect-root cover; high-powered 1/9/16/64 versus 8/32/12. | Regular-sequence, relative-perfectness, torsion-free identity-cover and prime hypotheses remain explicit. The Moore consequence is checked by the specialization x↦p, not an invented necessity theorem. |
| `perfectedLiftNaive`, completed base change and global qReg corollary | Toric x−1; free-δ x; p=2 square; purely rational R. | Lift is after perfection. (p,h)-completion and faithful descent are retained. The algebraic square theorem at 2 remains stronger than this particular lift route; rational gluing is not discarded. |
| `tracePair_quasiRegular` and lift/gluing independence | Toric ℤ[x]→ℤ; relatively perfect B/(x⁴); B/(x²) away from 2; finite coefficients; polynomial non-semiperfect branch. | Correct identity-cover and global amplitude domain. Corner comparisons include the ψ⁰ maps and all pair data. Finite coefficients and arbitrary branch choices are excluded from this independence assertion. |
| Imported framed theorem / canonical agreement / E∞ transport | d=0; line; plane over ℤ versus ℤ[1/2]; ℚ[x±¹]; H⁰(M/^Lh) versus H⁰(M)/h; disconnected étale diagonal. | F1 qualifies the étale check. Full framed theorem stays with RT; canonical agreement keeps its dimension and prime-inversion domain and the specific counit-induced map reducing to identity mod β. No uniqueness among arbitrary maps is claimed. |
| Diagonal normalization and Čech proof contract | δ⁰=1, δ¹=x−y, δ²=(x−y)(x−qy)/(1+q); q=1; x/y derivative directions; degree-one Pochhammer sign; idempotent diagonal component. | Reviewed as imported proof inputs, not recreated in II. Rational formulas use the indicated localization; integral generators belong to q-PD envelopes, not arbitrary divisions by units. Full diagonal completion and prime-two resolution agreement remain explicit proof obligations in RT. |
| Nygaard / motivic boundaries | Frobenius twist, non-Nygaard-complete prism, Breuil–Kisin twist, p=2 and relative domain. | Independent Frobenius-divisibility and Postnikov-descent constructions precede comparison. Retain Δ̂ versus Δ and the restricted relative theorem; no θ/Witt equality is inferred. |
| `TraceInversion`, unit theorem, étale consequence and `genuineRealisation` | ℚ with Δ=6/1/0/−6; ℚ(i) with 12 versus 6; cubic discriminant −108; genuine versus homotopy fixed points. | Separate positivity, 6-divisibility and discriminant-divisibility. Units 2 and 3 follow at arbitrary F. Preserve periodic KU, residual-circle homotopy fixed points, divisibility limit in spectra, then π₀; no exchange with lim π₀. |
| `numberFieldTraceExports`, reductions, Taylor maps, equalizer and completions | m=1; rational localization; order-four full tensor algebra; inert 7 in ℚ(i); cubic factorization at 5; independent family (1,0,…); two admissible fields with one Δ. | F2 explains base equivalence. Retain twisted completed Frobenius and all coefficient factors, noninjectivity of τ₁ after localization, common-Δ naturality, transition and root-change laws. No K₃, regulator or higher homotopy conclusion. |

For the cubic test, x³−2=(x−3)(x²+3x+4) modulo 5; the quadratic
discriminant is 2, a nonsquare. Completed Frobenius acts on that component and
cannot be replaced by a field automorphism of the non-Galois cubic. For ℚ(i),
Frobenius at 7 sends i to −i; the constant family fails whereas the specified
twisted family glues. At primes dividing Δ the completed terms vanish. These
also justify distinguishing the full root-adjoining tensor algebra from a
single chosen field factor.

## Primary-source verification

Sources below were read directly on 2026-10-20. No uncleared book was used;
no PDF, source passage or source-by-source digest is committed. Locators refer
to printed pages in the fixed versions. Source cautionary claims were checked
in addition to the mandatory random sample.

| Source | Public version | SHA-256 |
| --- | --- | --- |
| QH | [2510.04782v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| KU | [2510.06057v1](https://arxiv.org/pdf/2510.06057v1) | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| TC | [2410.23115v4](https://arxiv.org/pdf/2410.23115v4) | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |
| GSWZ | [2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| Bu | [2203.14787v2](https://arxiv.org/pdf/2203.14787v2) | `22970ed6b856ce523e6682cc00c14f4875145b19c2923a2dbffff937f4eaf181` |
| BS | [1905.08229v4](https://arxiv.org/pdf/1905.08229v4) | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| BMS2 | [1802.03261v2](https://arxiv.org/pdf/1802.03261v2) | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| HA | [Higher Algebra, 18 September 2017](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| Pri | [1608.07142v4](https://arxiv.org/pdf/1608.07142v4) | `f00412c88e3713dab6089c4e470e2af42ee04cdfbf151a9ea8b800ce3cc4f62f` |

Sample method: Python `random.Random(11441).sample(pool, 15)` on a fixed ordered
pool of 58 distinct citation groups covering QH, KU and the other primary
references. All fifteen returned locators were opened and checked:

| Draw | Locator | Verification |
| --- | --- | --- |
| 1 | GSWZ Definition 1.1, equations (12)–(13), footnote 1, pp.6–7 | Full coefficient factors, completed Frobenius and special abelian-field global twists. |
| 2 | KU Lemmas 6.11–6.13, pp.84–86 | q-PD diagonal, cosimplicial argument and the already recorded normalization correction. |
| 3 | KU 4.18a, p.49 | Extra E₁ choice at 2, rather than an unsupported E₂ theorem there. |
| 4 | KU Theorem 1.4, p.3 | Line filtration has h^j in degree zero and h^(j−1) in degree one. |
| 5 | QH Construction 4.21, p.62 | Naive filtration is the ordinary preimage under the stated staticity hypotheses. |
| 6 | QH Remark 3.6, pp.22–23 | Underived filtered smooth object is pulled back to animated qdR; supports F1. |
| 7 | QH Remark 4.4, p.55 | Fixed counit-induced comparison and its mod-h normalization. |
| 8 | KU Examples 6.7–6.9, pp.82–83 | Framed lifts, quotient bounds and identity-cover conditions. |
| 9 | BS Lemma 16.10, pp.110–111 | Flat/static q-PD proof inputs on their stated domain. |
| 10 | QH Corollary 3.13, p.27 | Static relative Habiro ring for étale R, independent of a trace construction. |
| 11 | QH Lemma 3.3, p.22 | Exponent-one perfected quotient admits no q-Hodge pair, not merely no chosen lift. |
| 12 | QH Theorem 3.11, p.25 | Habiro descent, completion and q-Witt filtration. |
| 13 | KU Lemma 4.29, p.51 | Glued ψ⁰ map and 2-adic comparison compatibility. |
| 14 | QH Construction 4.28 / Theorem 4.29, p.66 | Global quasi-regular section with its rational gluing corner. |
| 15 | KU Theorem 5.63, pp.79–80 | β-periodic comparison over KU with 2 invertible and cyclonic base coherence. |

Supplemental readings covered KU 1.9–1.11 (pp.5–6), 3.1–3.2 (p.24),
3.10–3.11 (p.27), 4.8–4.9 (p.39), 4.14–4.17 (pp.43–46),
4.18–4.29 (pp.46–51), 5.43–5.45 (pp.70–71), 5.62 (p.79),
6.10–6.15 (pp.83–86) and A.1 (p.87); QH 3.1–3.6 (pp.20–23),
3.11–3.13 (pp.25–27), 4.4–4.7 (pp.55–56), 4.21–4.29 (pp.62–66),
4.31 (p.67), A.12–A.14 (pp.75–76), and 2.9 (pp.16–17) for F2.
Also checked TC 3.3–3.8 (pp.30–32); Bu Theorems 1.1/1.4/1.5 and
Remarks 5.5/5.7 (pp.1–2,12); BS Theorem 15.3, Proposition 15.7 and
Theorem 16.22 (pp.103–105,115); BMS2 Theorem 1.12 (pp.6–7);
GSWZ Remark 1.2 (p.7); HA Theorem 7.5.0.6 (p.1374); Pri Remark 1.2
and Lemma 1.3 (p.3); and [Stacks Example 60.19.1, Tag 07L7](https://stacks.math.columbia.edu/tag/07L7).

The README's source cautions remain justified: KU 6.15 points to QH 3.12
instead of 3.13; TC 3.5/3.7 omit the uncompleted finite-coefficient rational
corner; KU 6.11's Pochhammer convention needs the stated sign/derivative
normalization. KU Remark 3.10 indicates a replacement resolution without
proving the comparison needed at 2. That comparison is an explicit RT target,
with a supplied proof plan, not a source theorem silently assumed proved.

## Libraries, form and Lean

Used ClassFieldTheory and AdicSpaces as upstream form models, including scope,
conventions, prerequisite and layer/example sections and their suggested-file
style. Read the existing library audit, then searched current upstream at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmaps
and the Completed directory. Searches used mathematical objects and hypotheses:
q-Hodge/filtered spectral objects, spherical lifts, THH, cyclonic spectra,
Tate-valued Frobenius, Postnikov descent, Nygaard and q-divided powers.
No retained target was found already supplied there; no duplicate was removed.
Broader cyclotomic/spectrum matches were height-one prime spectra in
Chebotarev files. Existing associative divided powers and finite-field
Frobenius APIs were inspected and do not supply the missing enhanced carriers.
No build was run in either read-only checkout.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`NumberField.discr`, `Rat.numberField_discr`,
`IsLocalization.Away.algebraMap_isUnit`, `map_dvd`,
`isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff`, `Algebra.Etale` and
`Algebra.Smooth`. The Tau Ceti baseline is
`f790474821cf4256814db967cb154e7af3d0c369`; the file uses no Tau Ceti module.

After the memory check, **lean-check exited 0 with no errors or warnings**.
The unchanged 111-line file has one `import Mathlib`, three light real-bodied
predicates, one proved theorem and four proved examples, with no `sorry`,
admitted data, placeholder conclusion or auxiliary theory. Every declaration
and example was compared with the README; there are only eight signatures,
so ten distinct signatures do not exist to sample.

| Signature | Agreement |
| --- | --- |
| `E1QuotientExponent` | §2.1 even ≥4 at 2, ≥2 at odd primes; predicate total on naturals, spectral use prime. |
| `E2QuotientExponent` | §2.1 even ≥6 at 2, ≥3 at odd primes. |
| E₁ boundary example | Rejects 2/5 at 2; accepts 4 at 2 and 2 at 3. |
| E₂ implies E₁ example | Inclusion of the predicates for every natural p and exponent. |
| E₂ boundary example | Rejects 4/7 at 2 and 2 at 3; accepts 6 at 2 and 3 at 3. |
| `TraceInversion` | §4.1 arbitrary number field and integer Δ, three separate conjuncts. |
| Rational inversion example | Accepts ℚ/6, rejects ℚ/1, ℚ/0 and ℚ/(−6). |
| `TraceInversion.isUnit_two_three` | Units in precisely `Localization.Away (Δ : 𝓞 F)` for arbitrary F; only the 6-divisibility conjunct is used for this consequence. |

The opening module comment identifies every absent heavy target family.
No spectral result is weakened into an arithmetic substitute. Prose supplies
the missing signatures, APIs and checks. The README has its summary, scope,
conventions, exact supplier contracts, four layers with examples/dependencies,
downstream consumers and references, and remains below 200 KB. It contains no
job/packet/review narrative or copied source passages. Metadata is exactly
`topic = "math.AT"`.

## Validation and maintainer note

The unchanged packet checker reports **0 errors, 0 warnings** (four nodes,
fourteen API items, eleven tests, two planned stages, zero closed stages,
three requests). Intake `check-files` on this job's four changed files and
`git diff --check` pass. Only II's README/review.json, this report and this
job's handoff are changed; no supplier package, packet or Lean file is edited.

**Upstream note, outside this job:** I §4.21 and the explanatory proof in RT
§6.14 still use unqualified “h-adic” language for an étale pair. Read literally
as a claim about the uncompleted pair, it has the same defect as F1. Their
completed/underived descriptions and static Habiro descent supply the actual
interfaces consumed here. II now states the correct pullback explicitly and
does not consume the false uncompleted identity. The maintainer should qualify
those two supplier explanations when editing them; this review does not alter
their files or certify their remaining targets. No R1–R4 ownership blocker or
unfixed in-scope mathematical defect remains.
