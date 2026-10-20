# Independent package review: RefinedTraceMethods

Job `REV-PKG-RefinedTraceMethods~codex3`, issue #11415. Codex, session
`codex-jZgsnT`, 20 October 2026. Reviewed another worker's package after
`FIX-PKG-RefinedTraceMethods~adv3`; this replaces the fix worker's self-verdict.

**Verdict: accepted with the corrections below.** The full framed comparison
belongs here, and the Habiro inputs used here come from HabiroCohomologyFoundations
Layers 1–5 and HabiroRings HR.1, HR.2 and HR.5. No target takes a result from
HabiroCohomologyFoundationsPartII or the downstream trace material of
HabiroCyclotomicCompletions. This verdict concerns this package; the separately
assigned removal of the reverse references in HabiroCohomologyFoundations is not
certified by it.

## Scope, fidelity and form

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md, the accepted
continuation and its imported parts, the two earlier package reviews, and the
adv3 handoff. The first review's missing stable-category K, Witt/TR, henselian
rigidity and K(1)-local sphere inputs remain explicit targets, with the later
review's supplier corrections and duplicate removals intact. The continuation's
twelve additional Cartier/cyclotomic and graded-trace targets remain present or
are explicitly consumed from their recorded owner. The framed enlargement
required by the present issue is retained in full.

The README has 208 named target paragraphs plus its opening Summary, nine layers,
100 Checks blocks and 349 Check bullets; every block has at least three entries.
Its full hypotheses, intended APIs, examples and proof routes are retained. The
2026-10-12 shape rule overrides the issue's older 200 KB limit: the final README
is 573,296 bytes, and no mathematical detail was cut to meet that obsolete limit.
LocalGaloisGroups and ProfiniteArithmetic were used as upstream form models,
including their README boundaries/contracts and Suggested.lean conventions.
The metadata remains exactly `topic = "math.KT"` on one line.

Removed the residual `RT-AREA-ktheory-2/44` reference from the Dennis comparison.
The package does not contain job history, coverage tables, source passages or a
section-by-section source digest. Source names, mathematical formulas and
theorem locators are retained; the descriptions and construction routes use
the roadmap's own prose.

## Findings corrected in this review

| Place | Finding and correction |
| --- | --- |
| §2.14, representation-graded TR | The groups exist for n≥1, but restriction, Frobenius, transfer to the preceding level and the displayed long exact sequence require n≥2. Added the bound to the statement, conventions, API and proof, and an n=1 negative control. |
| §2.13, isotropy separation | Stated p prime and n≥1 explicitly; C₁ has no subgroup C_p. |
| §2.11, matrix Morita Check | Added n≥1. M₀(R) is the zero ring and cannot recover nonzero THH(R). |
| §4.9, S-construction | The row equivalence uses n≥1; S₀ is the contractible zero category, rather than a functor category on Δ⁻¹. |
| §4.9, K₀ Check | Perf(F) contains shifts, not just degree-zero vector spaces. Replaced the positive-rank account by Euler characteristic: [F[1]]=−[F] and [F⊕F[1]]=0. Direct-sum relations alone give ⊕ over all integral degrees of ℤ, not the stable K₀=ℤ. |
| §§2.3, 3.4, 4.10 and build order | Moved the quotient's K-module consequence to §4.10, after the concrete K constructions. Kept discrete Witt/TR in §2.14 and placed its connective-ring extension with the Cartier heart in §3.4, removing a false apparent dependency of the TR definition on its later comparison. Specified that Layer 4 first constructs the two K functors of §4.9, then uses them in §§4.1–4.8. |
| §4.4 | Replaced the stale statement that stable-category K was a supplier gap with the actual §4.9 construction and its model comparisons. |
| §6.9 | The p-complete polynomial example now uses ℤ_p⟨x⟩ rather than the non-p-complete ring ℤ_p[x]. |
| §6.10, diagonal completion | Clarified that S⊗_P S=S makes the coordinate and diagonal ideals agree, but the compared objects still require filtration completion. Even the identity framing has a non-complete raw PD filtration. |
| §6.10, commutative refinement | A compatible E∞ structure is insufficient by itself for a derived commutative lift. The proof now constructs that refinement by totalizing the static commutative q-PD Čech rings and transporting along the comparison. |
| §7.2 | Corrected Meyer–Wagner Proposition 2.14 to **Lemma 2.14**, pp. 15–16. |
| Checks in §§2.6, 2.14, 4.3, 4.16, 6.1, 6.11–6.12 | Replaced prose cautions with computed witnesses: two different circle actions, a nonzero fully genuine spectrum killed in the finite-family category, a product-category unit that is not compact, ℤ/4 as a nonsplit square-zero input, the failed ku-lift filtration, and negative KU homotopy groups. |
| §3.2 and Suggested.lean | Added a proved Cartier-map negative control: (F,V)=(2,id) and (id,2) on ℤ have the same FV but their identity additive map is not a Cartier map. This checks the two operators separately. |
| Suggested.lean | Replaced the two developed diagonal theorem proofs by `sorry` target bodies, as the current shape rule requires. Removed the third proved example for `diagonalNumerator`; retained the degree-two calculation in the README. |

## The requested framed and supplier audit

The §6.14 statement, proof route and Needs, the supplier contracts, scope and
Layer 6 Dependencies all take the étale Habiro–Hodge comparison from
HabiroCohomologyFoundations §4.21 / `HabiroHodgeDescent.etale` of §4.28, with
Wagner's Habiro paper Corollary 3.13, p. 27. HR.6 supplies nothing here.
HabiroRings §§5.8–5.9 supply the étale localized ring and its number-field Habiro
ring comparison, separately from the spectral hypothesis 6|Δ. The downstream
paragraph now refers precisely to the imported supplier layers, rather than
asserting that the entire current HCF file has no reverse trace references.

Read the actual HCF contracts §§1.14, 1.17–1.18, 4.21–4.23, 4.28 and 5.26,
and HR §§5.8–5.9. The algebraic constructions do not consume the trace
comparison they will later identify. HR.5's own classical completion and
number-field ring dependencies are not replaced by imports of downstream
cohomological trace material into this package.

§6.10 retains all of the following, rather than just the affine-line instance:

- Every perfectly covered Λ-base of §6.1, every smooth S with an étale framing
  A[x₁,…,x_d]→S, and every d≥0. The odd-prime E₂ inputs and prime-two
  perfectoid-cover E₁ input are distinguished.
- `ofFramed`, `ofFramedE2`, `qPDDiagonal`, `framedCech`, `framedTrace` with its
  resolution, mod-β and two-adic comparisons, and `framedTrace_completed`,
  `framedTrace_pair`, `framedTrace_einfty`.
- The full diagonal ideal J_n and its completion, including étale framings for
  which coordinate differences miss an idempotent component. For d=0,
  S=ℤ[1/2][i] over A=ℤ[1/2], S⊗_A S≅S×S. Completing on the diagonal removes
  the extra factor; leaving it gives the wrong Čech totalization.
- The numerator ∏(x−qⁱy), division by [d]_q!, the q-shift on x and the ordinary
  PD value at q=1. No q-Pochhammer normalization is silently substituted.
- The completed filtration on qΩ versus its pullback to uncompleted qdR.
  The ℚ[x±¹] example keeps their different de Rham behavior visible.

The prime-two resolution comparison indicated without proof by W Remark 3.10
is an explicit construction target with its required compatibility, not a datum
postulated to satisfy the final comparison. The E∞ and derived commutative
refinements retain their distinct constructions.

## Sources independently opened

The random sample used seed 11415 on the paragraph inventory outside §6.10,
which was checked separately in full. All fifteen selected paragraphs were
source-bearing targets, listed below. Page numbers refer to the exact editions in the README;
Acta, published BMS and arXiv BMS pagination are distinguished.

| Target | Source passage actually read | Outcome |
| --- | --- | --- |
| §2.12 geometric fixed points | NS II.2.9, p. 251; II.2.10–11, p. 252; II.2.12, p. 253 | Complete-universe and residual-action convention matches. |
| §6.1 spherical bases | W 3.1–3.2, pp. 24–25; 4.18, p. 46; Theorem 1.2, p. 3 | Local lift, duality and global conditions are kept. |
| §4.20 almost modules | Scholze, Berkovich Motives, paragraph before Proposition 8.7, pp. 46–47 | Roots-of-unity and continuous-invariant hypotheses match. |
| §2.14 TR/TC | NS II.4.4, pp. 262–263; square (1) and footnote 22, p. 266; HM97 Theorem 2.3, printed p. 18; AN Theorem 6.1, p. 57 | Integral correction and Witt operators match; connective extension placed after the heart. |
| §1.11 HH(𝔽_p/ℤ) | NS IV.4.3, pp. 356–357; IV.4.7, p. 359 | Divided powers are in even homological degrees; HH₁=0. |
| §6.8 image of J | Devalapurkar–Raksit Theorem 0.1.4, p. 2; W Theorem 4.12, p. 40 | Odd-prime scope retained; no extrapolation to p=2. |
| §7.2 killing a pro-algebra | MW Constructions 2.6, 2.9, 2.11, pp. 12–15; Lemma 2.14, pp. 15–16 | Corrected the result type, keeping the completed tensor and kernel construction. |
| §2.6 subdivision | NS B.19–B.20, pp. 394–396 | The realization/Tate comparison is a map; no unrestricted commutation is claimed. |
| §4.10 K-theory units | BGT-mult Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23; Theorems 5.14–5.15, pp. 24–25; BGT 7.13, p. 49 and 9.8, p. 58 | Finitary additive K and localizing IK are kept distinct; TC is excluded. |
| §6.4 duality R | W Assumption 2.13 and Lemmas 2.14–2.15, pp. 18–20 | Both sides of the duality hypothesis are needed. |
| §8.4 Nygaard/décalage | Published BMS Proposition 9.10 and Remark 9.11, pp. 289–290 | The Frobenius pushforward and décalage direction are retained. |
| §8.7 even K sheaves | BMS-arXiv 7.15–7.19, pp. 50–51; 8.20–8.21, p. 66; 8.23, p. 67; BS 14.1–14.2, p. 97; CMM 6.9, p. 53 | All weights and finite coefficients on the p-complete quasisyntomic site; no claimed proof on arbitrary p-quasisyntomic schemes. |
| §8.3 THH deformation | Published BMS Theorem 6.7, pp. 251–252 | The u-cofiber and ξσ specialization agree. |
| §2.18 de Rham–Witt/TR | Hesselholt Theorems B–C, PDF p. 2; 1.5.8, p. 14; 2.4.7, p. 24; CMM 2.25–2.26, pp. 15–16 and 5.31, p. 48 | Finite levels, pro-zero positive Bott terms and the limit argument remain separate. |
| §1.1 cyclic category | NS B.1–B.4, pp. 380–383; Loday–Quillen §1 and Lemma 1.1, p. 567 | Factorization and unsigned cyclic rotation match. The scanned LQ page was visually inspected. |

Also read the newly moved and flagged inputs directly: W Examples 6.7–6.9 and
Theorem 6.10, p. 83; Lemma 6.11, p. 84; 6.12–6.13, pp. 84–85; the proof and
Remark 6.14, p. 86; Corollary 6.15, p. 86; W-Hab Theorem 3.11/Remark 3.12,
pp. 25–26 and Corollary 3.13, p. 27; Pridham Lemma 1.3, p. 3; BS Lemma 16.10,
pp. 110–111; and Stacks Tag 07L7, Example 60.19.1, including its explicit
cosimplicial homotopy. The full-J completion and normalization corrections are
mathematical repairs to the source displays, not an assertion that those
displays already contain the repaired statement.

For the acknowledged construction obligations, checked W Remark 3.10, p. 27;
Theorem 4.16 and proof, pp. 43–44; 4.18, p. 46; §5 introduction, p. 53; and
Remark 6.14, p. 86. The attribution of 4.16 to unpublished Nikolaus work does
not hide an unsupported theorem: W gives its public argument through the
Devalapurkar comparison. Read that comparison in Devalapurkar's thesis,
Theorem 6.4.1, printed p. 232 (PDF p. 249), its proof, and Notation 6.2.8,
printed p. 225 (PDF p. 242). The base change q↦q^(1/p), the primitive root
and ku(−1) normalization agree. W Paragraph 1.11, p. 5 supplies the failed
arbitrary ku-lift example. Read Hesselholt's handbook §§3.2, 3.10 and 3.12,
pp. 78–79, 94, 99–100 for the representation grading. Finally re-read AMMN
pp. 3, 8, 12, 15, 18, 44–45 for the coefficient order, corrected Cartier
argument, reduction comparison, Beilinson shifts and integral weight range.

All sources were public; no restricted book was needed. The mutable thesis PDF
is the 4 September 2026 version, SHA-256
`934a902f83a404452ecaf6f7853327128f1b9989acc6c5d7f6564a551bce1b6f`.
W v1 has SHA-256
`fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.
Source text stayed in disposable scratch; this report preserves locators and
findings, not quotations.

## Dependencies and current-library duplication

Audited the layer prerequisites against the supplier contracts and
CaraianiNewton tier order. No `FoundationsAndLibraryIntegration` or `UPSTREAM:`
dependency remains. The concrete K constructions depend on the external stable
category/model suppliers; continuous motives use them afterwards. Classical
TR is constructed before the Cartier comparison; neither needs that comparison
to exist in order to define the other. Layers 5–7 use the algebraic q-Hodge
suppliers, and Layer 8 consumes the existing absolute trace/prismatic results
while owning its stated relative variants. Layer 9 adds the associative-ring
and integral forms to the imported commutative rational square.

Checked current TauCetiRoadmap and Completed at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer roadmaps
and the four newer Completed roadmaps named by WORKERS. Searches used objects
and hypotheses: mixed/Connes operators, circle and Tate actions, stable-category
K, localizing and trace-class categories, nuclearity, ku/KU and Adams operations,
q-Hodge/even filtrations, and de Rham–Witt. Read the relevant actual declarations
and neighboring README sections, rather than treating a word hit as an import.

DGAInfinity Layers 6, 8 and 9 already own ordinary DG Morita, Hochschild and
degree-zero character theory, and the existing boundary correctly imports them.
StablePeriodicCurved's parity/periodic categories are not mixed complexes or
cyclic homology. AlgebraicVectorBundles' finite locally free duality is not
relative duality of presentable stable categories. OperatorTheory's analytic
trace-class objects and the Witt/Tate references in arithmetic roadmaps likewise
have different carriers. No additional duplicate target was found or removed
in this review; the earlier review's duplicate removals remain in force.

At the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read the
actual simplicial functor, alternating-face and kernel-Moore definitions,
`HomologicalComplex.Hom.comm`, the coproduct total complex,
`KaehlerDifferential`, `ExteriorAlgebra.exteriorPower`, `DividedPowerAlgebra`,
`Algebra.Smooth`, `Algebra.Etale`, Witt Frobenius/Verschiebung,
`Nat.factorization_pow`, quotient lift, and Laurent C/T declarations. Ordinary
divided-power algebras are not PD envelopes; sum totalization is not an
unbounded product totalization. These distinctions are respected in the README.
Read the finite-cyclic Tate parity and periodicity signatures in the pinned
Tau Ceti sources and the current library, as well as current `SplitK0` and
triangulated K₀. The shared elaboration wrapper identifies its Tau Ceti build
as f790474; that build directory is not a Git checkout, so no independent Git
verification of that particular Tau Ceti build is claimed.

## Adversarial mathematics pass

The pass covered the target statements, definitions, conventions, intended APIs
and Checks in every subsection. This table groups the instances by mathematical
family; it does not infer truth from the admitted Lean theorem bodies.

| Statements checked | Instances and computed witnesses | Result |
| --- | --- | --- |
| §§1.1–1.3 cyclic/mixed definitions | n=0,1; k and k[x]; signed versus unsigned rotation; b=B=id on two nonzero adjacent terms | Unit and derivative conventions agree; the two-operator anticommutation is substantive. |
| §§1.4–1.11 cyclic homology/HKR | Degree-zero k, negative-degree mixed object, char p, nonflat 𝔽_p/ℤ, dual numbers, Laurent line | Sum/product and factorial restrictions retained; HH₂(𝔽_p/ℤ)=𝔽_p, HH₁=0. |
| §§2.1–2.6 actions/Tate | Trivial group, induced object, rational coefficient, HF₂ Tate parity; translation versus trivial circle action | Residual actions and circle norm suspension retained; the new Borel-orbit witness distinguishes the actions. |
| §§2.7–2.11 THH/TC | Zero ring, sphere, 𝔽_p, M₀(R), M₁(R); integral versus p-completed π₀ and π₋₁ | Matrix size corrected; no integral K≃TC or arbitrary Tate/realization commutation. |
| §§2.12–2.18 genuine/TR | Trivial representation, C₁, n=1, λ=ℂ(1), λ=ℂ(p), regular residual ℤ[C_p], p=2 and odd p | Corrected preceding-level bound; λ′ and residual norm are indispensable. Full-family negative control added. |
| §§3.1–3.6 Cartier/t-structure | ℤ; (ℤ/p)² with FV=0 but VF≠0; identity between (2,id) and (id,2); Prüfer group; THH(𝔽_p) | No VF axiom; morphisms test both operators; derived completion and cyclotomic truncation cannot be replaced by underlying spectral ones. |
| §§4.1–4.8 relative motives/nuclearity | Zero category, Mod_R, merely E₁ coefficients, one-object repetition category, ∏D(k) | Ordered duals retained; ∑k→∏k misses (1,1,…), proving the product-category unit is not compact. |
| §§4.9–4.12 K and trace | S₀,S₁; Perf(F), F[1], F⊕F[1]; finite-free complexes over k×k; κ=ω; zero ideal; finite TC stages | Corrected Euler and row Checks. Idempotent completion, nonconnectivity and finitary restrictions remain explicit. |
| §§4.13–4.16 derivatives/convergence | Zero bimodule, split extension, nonsplit ℤ/4→𝔽₂, constant functor | The derivation and extension data remain part of the domain; first derivatives alone do not prove DGM. |
| §§4.17–4.20 rigidity/excision | I=0, unit ideal, nonnilpotent (ℤ_p,p), henselian versus strictly henselian 𝔽₂, n=p, dual numbers over ℚ | Nilpotence, finite coefficients and henselian hypotheses are kept separate; rational cyclic shift is correct. |
| Layer 5 stable operations | β on S², the tautological line and c₁, ψᵏβ=kβ, nonunit k, Laurent generator | Bott sign and Adams eigenvalues agree; periodic Adams maps retain prime inversion. |
| §§6.1–6.7 even constructions | Zero object, A=ℚ, A=ℤ[1/2], nonspherical ku-lift, odd versus even spectral data, both sides of R | No arbitrary ku-lift or one-sided duality substitution. |
| §§6.8–6.10 local/global/framed | p=2, odd primes; d=0,1,2; q=1; N₀,N₁,N₂; ℤ[1/2][i]; ℚ[x±¹] | Full prime-two and diagonal-completion construction targets retained; raw/complete and E∞/derived-commutative distinctions clarified. |
| §§6.11–6.14 cyclonic/Habiro | m=1, trivial coefficient, negative Bott powers, Δ=1,2,6, F=ℚ | KU is unbounded already at m=1; ring étaleness needs no 6, spectral number-field comparison retains 6|Δ. |
| §§7.1–7.5 refinements | Zero motive, smooth proper unit, nonconstant localization cofiber, rational ku, t-inverted module | Nuclear ind-object and realized colimit are distinct; derived t-completeness is required for conservativity. |
| §§7.6–7.8 finite coefficients | m=0,1,3,8,9,16,32,64 and d⁴; p=2; compatible versus unrelated quotient transitions | Positivity, even 2-exponent and compatible multiplicative tower are retained. |
| §§8.1–8.4 arithmetic coefficients | ξ=0 and a unit in the ordinary uv quotient; can/Frobenius images; perfect field; QRSP quotient; Frobenius pushforward | The quotient relation and semilinearity agree. Algebraic presentation does not claim to construct its spectral realization. |
| §§8.5–8.8 descent/syntomic | Perfect characteristic-p base, negative TC degree, weights 0 and 1, all pⁿ coefficients, non-p-complete Spec ℤ | Site and completeness hypotheses distinguish proved sheaf comparisons from the broader announcement. |
| Layer 9 Beilinson | Hℤ, Hℚ, R=ℤ versus ℤ_p, p=2, i=0, i=1 and p≥3 | Complete before inversion; fiber ΣHC versus cofiber Σ²HC; integral range i≤p−2 and uncompleted de Rham retained. |

## Lean correspondence and checks

Ten signature checks against the README:

| Lean declaration | Mathematical correspondence |
| --- | --- |
| `CartierStructure` | Arbitrary additive carrier and FV=p only; natural p generalizes the prime specialization without changing it. |
| `CartierStructure.IsMorphism` | Two independent commutation equations, not one equation with FV. |
| `CartierModule.isogeny_iff_underlying` | Assumes the map is Cartier and requires positive denominators on both sides; all additive carriers are quantified. |
| `diagonalNumerator` | ℤ[x,y,q], variables 0,1,2, range d; N₀=1 and no division introduced in Lean. |
| `diagonalNumerator_shift` | q-shift acts on x; coefficient q^(d+1)−1 and extra x are present for all d≥0. |
| `diagonalNumerator_one` | Substitution q=1 gives (x−y)^d for every d, not only a low-degree example. |
| `HighPowered` | Positivity separate from factorization, odd exponents ≥2, 2-exponent even and ≥4. |
| `HighPowered.fourthPower` | Requires d>0 and gives both admissibility and divisibility. |
| `TracePresentation.lift` | Actual polynomial quotient; arbitrary commutative coefficient ring, relation a·b=f(ξ), and unique ring map. |
| `TracePresentation.can_and_frobenius` | Arbitrary coefficient endomorphism φ; can(u)=ξσ, can(v)=σ⁻¹, φ(u)=σ, φ(v)=φ(ξ)σ⁻¹. Both maps respect uv=ξ. |

The 270-line Suggested.lean uses `import Mathlib`, real-bodied light carriers,
six admitted theorem targets, and proved examples only, at most two per kept
definition. There is no admitted data, placeholder proposition, hidden theorem
hypothesis or substitute spectral carrier. The closing comment records the
README-only construction families. The retained quotient is explicitly the
ordinary coefficient presentation, not an encoding of the absent spectral
objects.

- `lean-check research/blueprint/packages/RefinedTraceMethods/Suggested.lean`:
  exit 0; only the six expected `sorry` warnings at lines 60, 105, 112, 143,
  200 and 209. Available memory was checked before compilation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods.json`:
  0 errors, 0 warnings. The packet was not edited.
- `python3 research/blueprint/intake.py check-files` on all five changed files
  and the unchanged metadata: 6 files, 0 problems.
- `git diff --check`: clean.

No unresolved defect in this package remains. The named proof/construction
obligations in the roadmap are future formalization targets, not claims that
the corresponding formal theory already exists. Neighbor follow-ups are
recorded in the handoff, outside this job's edit scope. No suspicious directives
were encountered in the untrusted material, and no fetched content was executed.
