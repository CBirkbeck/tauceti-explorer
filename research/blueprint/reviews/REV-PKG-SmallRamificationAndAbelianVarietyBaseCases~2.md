# Independent fixing review: small ramification and the Serre base cases

Reviewer: Codex, session `codex-6uQXUX`. Issue #7941, job
`REV-PKG-SmallRamificationAndAbelianVarietyBaseCases~2`. Date: 2026-10-09.
The reviewer did not write the package or its revision.

**Verdict: accepted after corrections.** The package is ready for an upstream
draft PR. This is a completed review, not a checkpoint. The suggested file
elaborates at the prescribed pins; it supplies representative signatures and
example obligations, not completed proofs. Statements needing supplier APIs
absent at those pins remain fully stated in the README and explicitly named,
with their missing interfaces, in the Lean file's closing comment.

## Scope and required checks

The complete package and the accepted [packet](../packets/SmallRamificationAndAbelianVarietyBaseCases.json)
were compared, including all 59 targets, 45 API entries, 34 definition tests,
80 baseline references, 31 supplier requests and six closed stages. The packet
was not edited. The previous independent report and revision handoff were read.
The revised actual SL₂ conjugacy statement and three stronger field companions
were checked individually. The three concrete residual-representation examples
remain tied to their actual characters or geometric torsion; the other three
construction-dependent examples have precise omissions rather than anonymous
existence assertions.

| Required check | Result |
| --- | --- |
| Upstream form and density | Pass after rewriting the catalogue scaffolding into prose subsections, named API lists, Checks, Examples and Dependencies; all mathematical statements and hypotheses retained apart from cited duplicates. ClassFieldTheory and EllipticCurves were read, as were current LocalGaloisGroups and ProfiniteArithmetic. |
| Source verification | Pass: reproducible random sample of 15 packet targets, seed 7941, listed below; no package locator was marked unverified. Additional classification and published correction sources inspected. |
| Prerequisite closure | Pass: exact library and supplier contracts distinguished from their applications; no upward prerequisite, FoundationsAndLibraryIntegration or UPSTREAM citation remains. |
| Definition checks | Pass: seven packet definitions retain 5, 6, 5, 5, 4, 4 and 5 checks respectively; the auxiliary scaled kernel has three additional checks. Checks requiring unavailable constructions are named in the closing comment. |
| Lean signatures and elaboration | Pass: package `lean-check` exit 0, 106 warnings, all declaration-uses-sorry warnings. A separate scratch-only ten-signature audit also exited 0. No Lean server, dependency build or cache operation was used. |
| Own words and metadata | Pass: mathematical organization, no source passages or source-by-source summary; metadata remains exactly `topic = "math.NT"`. |
| Submission validation | Pass: packet checker zero errors and warnings; intake file checker zero problems; `git diff --check` clean. |

## Corrections made in place

1. Recast the README into the current upstream shape and the Lean file into
   `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases`, with `import Mathlib`,
   one module introduction, ordered layer comments and mathematical docstrings.
   Packet IDs, API catalogue rows and process comments were removed from the reader.
2. Deleted arbitrary functions on field types masquerading as different exponents,
   ramification indices, ramification groups and Serre weights. These cannot specify
   compatible valued fields or a weight recipe. Their dependent local and weighted
   signatures were removed from Lean and precisely listed in the closing comment;
   the README still gives their full mathematics. An incomplete `baseCases_holds`
   conjunction was likewise removed rather than presented as the nine-row theorem.
3. Explicitly retained `[Fintype F]` and `[DiscreteTopology F]` on the kernel-field
   number-field instance in a separate section, with explicit binders. With a `sorry` body Lean had discarded these section
   variables, yielding a claim for arbitrary coefficient fields. Scalar extension
   and twisting also use explicit binders outside the surrounding section to
   retain discrete source coefficients; the level-one
   scalar-extension API still requires both fields finite and discrete.
4. Explicitly included both prime facts in the Schoof section. The elaborated
   Cartier-duality and cyclotomic-splitting signatures now retain them. Merely
   writing a section-level `Fact p.Prime` did not retain it in these `sorry` bodies.
5. Corrected the simple-object predicate to exclude the order-one group scheme,
   matching the README's nonzero convention, and added trivial/order-two controls.
6. Added exact finite-field examples for oddness, the nonzero characteristic-three
   inertia square, the Borel diagonal-ratio action, and the failure of square-zero
   inertia for a length-three Jordan block. Added three scale-sensitive examples
   for `poitouTestFunction`.
7. Corrected the Fontaine row's residual-level-one flag to false: it is
   a geometric good-reduction theorem, with an empty coefficient characteristic
   set. Added Faber's direct projective classification and separated it from Jones's
   Sylow/ramification facts. The characteristic-three GL₂ conclusion is derived
   explicitly through the scalar kernel and the commutator of lifts of a Klein four.
8. Removed the already supplied dyadic square threshold, its sharpness and critical
   Artin–Schreier obstruction from the new power-map target. Removed the quadratic
   p=3 class-number calculation from the new six-prime certificate. These are cited
   only as boundaries; their consequences may still be consumed in later proofs.

## Libraries, ownership and duplication

Pinned baseline source statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, in the existing shared build.
The reviewed library-coverage audit was read first. In particular, different
ideals are not ramification filtrations, the finite locally free category and
its base change do not supply exactness, and the abelian-variety object and
endomorphism ring do not supply integral torsion or λ-adic comparison.
The real rather than complex Taylor-bound declarations and the exact
Minkowski/PID hypotheses were inspected. The cusp-form dimension results are
consumed as existing statements, not new goals.

All target families were additionally searched by mathematical objects,
operators and hypotheses in current TauCetiRoadmap main
`cf91098b166b26ff011db851a2e091fd3f54029b` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This included all nine roadmaps
newer than the atlas snapshot and the four named Completed roadmaps. The
current checkouts were read only. No duplicate of the representation-specific
bounds, selected Poitou kernel, finite-flat arithmetic classifications,
Schoof criteria or terminal weight applications was found.

| Removed/replaced item | Existing owner and exact boundary |
| --- | --- |
| Local different/index/group functions without mathematical implementations | Native `TauCeti.differentExponent`, `TauCeti.ramificationIndex`, `TauCeti.LocalFieldsRamification.lowerRamificationGroup`; general bound `differentExponent_le_ramificationIndex_sub_one_add_natCastValuation` in `NumberTheory/LocalField/Different/Wild.lean`. The new normalized ratio and representation-specific estimates remain here. |
| Dyadic deep squares and sharpness | `NumberTheory/LocalField/Squares.lean`: `unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two`, `unitFiltration_le_range_powMonoidHom_two_iff`; LocalFieldsRamification's square-class interface supplies the critical count. The kept power-map variant is cubic, in residue characteristic three. |
| Class number of ℚ(√−3) | Mathlib `IsCyclotomicExtension.Rat.three_pid` and `NumberField.classNumber_eq_one_iff`; the kept quadratic certificate covers 7,11,19,43,67,163. |

The own roadmap is tier 23. All atlas suppliers are lower: classical arithmetic
5; abelian schemes 6; arithmetic representations 7; Néron models 8; finite flat
and integral p-adic Hodge theory 10; modular forms/weights 12; analytic number
theory and Hilbert/ Shimura geometry 14; GL₂ transfer 15; Faltings 17;
automorphic Galois representations 18; ordinary forms/lifting 20; potential
modularity and compatible systems 22. ClassFieldTheory, NumberFieldArithmetic,
LocalFieldsRamification, ModularCurves and JacobianChallenge are existing
Tau Ceti roadmap suppliers. ClassicalSerreModularity, tier 24, is a consumer
only. No notion needed to be moved from an upper-tier atlas roadmap.

## Source sample and receipts

The sample is `random.Random(7941).sample(packet["nodes"], 15)`; locators refer
to the named source versions in the README. This table records support and
where an additional argument, rather than a verbatim source theorem, is used.

| Sampled target | Locator opened and result |
| --- | --- |
| Wild Borel normal form | Moon–Taguchi v1, §2, p. 2 and proof of Lemma 1, p. 3: characteristic-two form and diagonal conjugation. The general-p form follows the normal-p-subgroup fixed-line argument and the preceding tame-character result. |
| Characteristic-two subgroup classification | Jones §2.3, pp. 8–9 supports the Sylow facts; Moon–Taguchi §3, p. 5 and Dieulefait–Pacetti v2 §3, p. 15 give its application. Added direct classification: Faber v1 Theorems B–C, §2, p. 3, Theorem 6.1, §6, p. 16. |
| Reduction of a realization | Dieulefait–Pacetti §2, Paso 6, p. 14; Khare–Wintenberger v1 proof of Theorem 3.1, §3, p. 18. Generality requires the named independence and comparison suppliers, not only a single Tate-module component. |
| Descent of GL₂-type realization | Snowden v1 Lemma 9.4.4 and proof, §9.4, pp. 29–30; hypotheses on irreducibility before and after restriction retained. |
| Poitou–Odlyzko inequality | Odlyzko survey §2 (2.3)–(2.5), p. 122, inspected as an image; §1, p. 121 gives attribution. Moon–Taguchi §3, p. 6 uses the global bound. Negative pole and full-strip positivity match. |
| Positive-definite cosh ratio | Odlyzko §2 after (2.3), p. 122 supplies the positivity criterion. The README's ratio lemma is an elementary Euler-product derivation of that criterion, not a theorem numbered there. |
| Weight-two exclusion | Khare–Wintenberger v1 Theorem 4.1(i), §4, p. 18 and proof pp. 18–19; the independent Snowden realization route is explicitly distinguished from the preprint's compatible-system route. |
| Poitou kernel positivity | Odlyzko §2 before (2.4), p. 122; strip positivity is required. The chosen convolution and cosh proof supplies it on the whole strip. |
| Integral upper bounds | Odlyzko §2, p. 123 is context for finite-degree evaluation. The particular rational enclosure and kernel are a derived calculation, not printed numerical theorems of the survey. |
| Four class-number certificates | Schoof §6, pp. 855–858; Odlyzko 1976 Table 2, totally complex column n=6 and 9, checked. The smaller D-category fields use the explicit discriminants and separate certificates in the README. |
| Tate nonexistence | Dieulefait–Pacetti Theorem 1.1, §1.1, p. 3; Khare v1 §1.1, p. 2; Moon–Taguchi §3, pp. 5–7. Coefficients are any finite field of characteristic two. |
| Characteristic-three subgroup order | Dieulefait–Pacetti proof of Theorem 1.3, §1.1, p. 3 and Ghitza–Yamauchi v2 proof of Proposition 3.3, §3, p. 7 are applications. Added Faber v1 Theorem B, p. 3 and Theorem 6.1, p. 16; the central factor two is separately derived. |
| Weight fourteen at eleven | Khare–Wintenberger v1 proof of Theorem 4.3, §4, p. 21 has the overstrong twist assertion. Published Theorem 5.4, p. 247, and proof p. 248 retain p≠11 for weight fourteen. The roadmap retains the exceptional extension and does not exclude it. |
| Snowden realization | Snowden Proposition 9.4.1, §9.4, p. 29 and proof p. 30; Dieulefait–Pacetti Paso 6, p. 14. Odd p, odd base degree, (A1), and irreducibility are explicit. |
| Ordinary reducible terminal cases | Dieulefait–Pacetti Paso 6, p. 14 and Khare–Wintenberger proof of Theorem 4.3, §4, p. 20. Ordinary and p-distinguished lifting hypotheses are retained; weight fourteen is treated only with its published restriction. |

Public copies were read on 2026-10-09; no cleared private book was needed.
The sampled PDFs match their packet digests where one is recorded. Additional
public evidence: Faber arXiv:1112.1999v1, SHA-256
`1ce7d2b5f1bc4df425010726db198bacb82b223f6c8bce69465ec99cc1553292`;
published Khare–Wintenberger paper, SHA-256
`154c0c2a2245e50cb2be3c82705f9176fe0e9b597424236ddca11299d38cdb22`.
The survey publisher PDF has SHA-256
`2c862713fc7f981ded3b4ac22f338b9905097850bbd9bc235eed77c298b5b852`.
No source text or excerpt was deposited in the repository.

## Adversarial mathematical pass

The following covers every packet target; associated APIs and conventions were
checked with the same instances. Entries describe mathematical reasoning and
exploratory computation, not formal proofs. The explicit numerical cross-check
used Simpson quadrature with 32,768 cells per interval and the exact analytic
tails. It is a review control, not the rational certificate promised by the
roadmap. All ten excluded-degree bounds had positive margins, approximately
0.167, 0.071, 0.819, 0.107, 0.179, 0.412, 0.069, 0.159, 0.159 and 0.428.
The two I₁ values were approximately 0.998972 and 0.917132.

| Statement checked | Instances / failure mode tried | Result or correction |
| --- | --- | --- |
| `localRootDiscrExp` | Unramified E; ℚ₂(i); ℚ₂(√2); ℚ₂(ζ₁₂); splitting field of x³−3 over ℚ₃ | Values 0, 1, 3/2, 1, 11/6; use d/e, not d/[E:ℚp]; unavailable compatible valuation signatures removed. |
| `rootDiscr_eq_prod_rpow_localRootDiscrExp` | ℚ; an unramified prime; residue degree two | Finite support, degree positive, discriminant exponent f·d; product has normalized d/e. |
| `orderOf_map_inertia_dvd_card_residueField_sub_one` | Unramified character; K=ℚ₂ and ℚ₃; general residue size q | Wild inertia killed; tame order divides q−1, specialized to p−1 only over ℚp. |
| `exists_upperTriangular_of_wildInertia_ne_bot` | Trivial wild group; S₃ at three; diag(−1,1) acting on u(1) | Nontrivial P required for unique line; ratio ψ₁/ψ₂; computed matrix example added. |
| `principalUnits_pow_subset` | Unramified and ramified quadratic three-adic base; dyadic depth two/three | Kept cubic variant; dyadic squares and critical obstruction deferred to current native suppliers. |
| `localRootDiscrExp_le_two_of_char_two` | Trivial P; quadratic ℚ₂(√2); ℚ₂(ζ₈) with P of order four | Wild hypothesis retained; 3/2≤2 and sharp value 2. |
| `localRootDiscrExp_le_of_char_three` | P of order three; both tame involution signs; unramified case | 11/6 at order three; p=3, nontrivial wild image and ℚ₃ base essential. |
| `two_lt_rootDiscr` | Degrees one, two, six, twelve; real and complex signatures | No degree-zero field; degree-one rd=1; thresholds require their precise lower degree bounds. |
| `odlyzkoKernel` | x=0, ±1/2, ±1, 3/4, 2 | Values 1, 1/π, 0, positive, 0; convolution factor two and evenness checked. |
| `isPositiveDefiniteSub_cosh_div_cosh` | a=0, ±1/2; a outside the interval; x=0 | Cosh denominator positive; endpoints constant one; |a|≤1/2 necessary. |
| `re_poitouTransform_nonneg` | Re(s)=0,1/2,1; b=0 and b>0 | b>0 retained; full-strip result, not a GRH central-line argument. |
| `poitouLowerBound` | n=0/1; r₁=0/1/2; b=1/2,1,2; ℚ and two quadratics | P(1,1,1)≈−0.083353; negative pole term; positive degree for divisions. |
| `poitouIntegral_sinh_lt` | b=6.5,8; x→0; exterior tail | O(x²) numerator removes singularity; computed I₁ below 1.04 and 0.94. |
| `poitouLowerBound_le_log_abs_discr` | ℚ; imaginary and real quadratic fields; opposite pole sign | Correct signatures and nonnegative discarded sums; rd conversion uses n>0. |
| `ten_lt_rootDiscr_of_isTotallyComplex` | Totally complex degrees 24 and 36; degree two | Positive margins over 10 and 12; no claim for all low-degree complex fields. |
| `IsLevelOneResidual` | 1⊕ω₃; E[2] at conductor eleven; real cubic mod-two action; char two | Reducibility, bad prime, and absolute versus rational irreducibility distinguished; finite/discrete instance repaired. |
| `det_eq_one_of_char_two` | Characteristic two at complex conjugation; odd-order determinant image | Determinant one, since prime-to-two character cannot ramify at two. |
| `not_isAbsolutelyIrreducible_of_tame` | p=2/3; trivial image; wild counterexample | Tameness and p∈{2,3} retained; excludes absolute irreducibility, not every representation. |
| `dihedral_or_SL2_of_irreducible_char_two` | Trivial/cyclic group; SL₂(𝔽₂) and SL₂(𝔽₄) | r=1 excluded; orders 6 and 60; normalizer is inside G; actual conjugacy retained. |
| `twentyFour_dvd_card_of_irreducible_char_three` | Reducible C₃; SL₂(𝔽₃); SL₂(𝔽₉) | Irreducibility essential; orders 24 and 720; scalar kernel prime to three and includes −1. |
| `tate_no_levelOne_char_two` | Oddness in char two; tame and dihedral cases; SL₂(𝔽₄) | No oddness assumption needed; image classification and degree bounds both used. |
| `serre_no_levelOne_char_three` | Odd/even complex conjugation; 3-part three or higher | Oddness makes kernel field totally complex; finite-image order forces contradictory degree bound. |
| `not_isLevelOneResidual_of_le_three` | p=2,3 and p=5 | Conclusion only at 2/3; does not assert universal level-one nonexistence. |
| `rootDiscr_torsionField_lt` | Trivial group scheme; p=2,3; nonzero torsion; local/general base | Strict global bound valid over ℤ; local version requires named completion supplier. |
| `isConstant_of_etale_over_int` | Trivial scheme; constant order two; base ℤ versus ℤ[1/ℓ] | Every finite étale object over ℤ constant; ramified-away-base case not generalized. |
| `isPGroup_two_of_rootDiscr_lt_four` | L=ℚ; quadratic dyadic fields; rd=4 boundary | L Galois, unramified outside two, strict rd<4 retained. |
| `simple_two_groupScheme_over_int` | Order-one scheme; ℤ/2 and μ₂; order four | Simple means nonzero; corrected predicate and added negative/positive examples. |
| `ext_muTwo_zModTwo_eq_zero` | 0→ℤ/2→E→μ₂→0 versus reverse extension | Subobject/quotient orientation correct; reverse Ext not claimed to vanish. |
| `exists_diagonalizable_constant_filtration` | Trivial G; constant G; μ-power G; mixed extension | Diagonalizable subobject, constant quotient; filtration is not a claimed product decomposition. |
| `card_points_eq_of_isogeny` | Zero abelian variety; elliptic isogeny over finite field; infinite field | Finite residue field essential; equality of counts, not equality of varieties. |
| `dim_eq_zero_of_goodReduction_everywhere` | Zero variety; positive dimension; torsion exponent n→∞ | Zero allowed; fixed finite count versus growing p^(2ng); simple-factor bound not applied to A[2ⁿ] directly. |
| `finrank_le_of_rootDiscr_lt_of_isTotallyComplex` | All ten degree/scale pairs; first excluded n and positive larger n | Margins independently checked; monotonicity has positive degree; weak ceilings suffice. |
| `SemistableCategory` | Trivial scheme; constant/μp; p=ℓ=3; twisted order-three scheme; J₃ | Distinct prime duality; J₃ square nonzero; prime facts included and matrix control added. |
| `torsion_mem_semistableCategory` | n=0/1; p≠ℓ; semistable versus additive reduction | n≥1 and p≠ℓ for torsion statement; integral torsion construction explicitly deferred. |
| `isConstant_baseChange_cyclotomic` | Constant object; nontrivial iterated p-extension; composite ℓ | Prime ℓ and p≠ℓ retained; cyclic abelianization of finite p-group gives cyclic group. |
| `no_semistable_of_simple_and_ext` | Dimension zero/positive; vanishing and nonvanishing reverse Ext | Criterion uses only indicated simples and Ext direction; geometric signature deferred precisely. |
| `ext_muP_zModP_eq_zero` | Pairs (2,3),(3,2),(5,2),(7,3),(13,2); ℓ≡±1 mod 8/9 | Exceptional congruences excluded; no claim of vanishing at ℓ=11,p=2. |
| `simple_eq_of_fieldCriterion` | Relative inertia versus absolute inertia; trivial simple object | M already ramified at ℓ; relative condition correct; nonzero predicate supplied. |
| `classNumber_eq_one_small_fields` | Four displayed fields; discriminants 2⁴3⁷,144,400,2704 | Separate degree/PID/small-prime certificates; ℚ(i,√13) primes 3,5,7 have residue degree two. |
| `fieldCriterion_two_three` | Degrees six/twelve; residue unit −1 at three | Relative quadratic extension excluded by class number and residue-unit quotient; exact-field companion retained. |
| `fieldCriterion_three_two` | Degrees four/eight/twelve; strict normalized 2-adic bound | Degree ≤10 and divisibility by four leave four/eight; companion has full relative-inertia hypothesis. |
| `fieldCriterion_five_two` | Degrees four/eight/twelve/sixteen; golden-ratio unit in 𝔽₄ | Cyclic cubic possibility eliminated by unit-generated residue quotient; degree-three extension is Galois. |
| `fieldCriterion_seven_three` | Degree18 base; class number ≤2 auxiliary field; cubic next field | Units rule out the needed quadratic step; corrected next absolute degree54, not36. |
| `fieldCriterion_thirteen_two` | Biquadratic base; ray field; Frattini quotient; h≤2 | Strict local bound restricts conductor; h≤2 used only for unramified quadratic remainder. |
| `no_semistable_abelianVariety_one_prime` | ℓ=2,3,5,7,13 versus ℓ=11; zero-dimensional variety | Exact prime list and semistability; J₀(11) is boundary counterexample. |
| `IsGL2Type` | Elliptic curve/K=ℚ; surface/K=ℚ; zero A; surface with quadratic K | Degrees equal dimensions; unital number-field action; definition does not imply simplicity. |
| `comesFromGL2Type_of_restrict` | Identity extension; reducible restriction; missing endomorphism action | Irreducibility before/after restriction essential; rational Tate action supplier named. |
| `comesFromGL2Type_of_weightTwo` | p=2; odd p; cyclotomic weight−1; (A1) failure | Odd p and local weight-two conditions retained; no claim over even-degree base. |
| `reduction_of_comesFromGL2Type` | One λ component; all components; ramified Steinberg twist | Independence imported; Steinberg semisimple part unramified; dim A≥1. |
| `classNumber_sqrt_neg_prime_eq_one` | p=3 baseline; six new primes; p=23 negative control | p=3 duplicate removed; Minkowski small-prime inertness checked; p=23 not included. |
| `levelOne_dihedral_classification` | p=3/7 mod4; p=23; restriction to ℚ(ζp) | Class-number-one list and exceptional induced case retained; no circular modularity input. |
| `no_levelOne_crystalline_of_reducible_terminal` | p=3,k=2/4; p=5/7/13,k=p+1; k=14,p=13 | Ordinary p-distinguished lifting and small cusp dimensions; Hodge–Tate sign translation explicit. |
| `not_levelOne_weight_two` | p=2/3; odd p; crystalline versus Steinberg | Weight two, level one and (A1) supplied; good reduction at p needed for Fontaine. |
| `not_levelOne_weight_succ_of_schoofPrime` | p=5,7,13; p=11 | Uses semistable realization at p; eleven excluded from the prime list. |
| `weight_fourteen_eleven_twist` | Four inertia types at eleven; both extension directions | Three types twist to weight2; fourth has weights22 and10 after indicated twists; no exclusion of (11,14). |
| `not_levelOne_small_weight` | Weights2–8,14; weight12; p=11 | Published exception retained; no weight12 assertion. |
| `paso_six` | Compatible-system reduction mod3 irreducible/reducible; mod5 weights2/4/6 | Tate–Serre, ordinary lifting or Schoof selected with their own hypotheses; auxiliary system assumed supplied. |
| `baseCases` | Nine rows; Tate oddness flag; Fontaine/Schoof distinction; weight12/(11,14) | Metadata points to mathematical names; five row tests retain exact prime/weight sets. |
| `baseCases_holds` | Names as metadata versus proofs; all nine rows | Partial conjunction removed; full theorem named in closing comment with actual weight/system suppliers. |

Additional supplier predicates were checked against their concrete meanings:
short exactness is scheme-theoretic kernel plus a faithfully flat quotient;
`IsKilledBy` uses convolution powers; geometric points and the torsion field
are formed from the coordinate algebra, not arbitrary Galois sets.
For the GL₂ endomorphism convention, an elliptic curve has a unital rational
action and dimension one, whereas the same rational action on a surface
fails the dimension equality. Cyclotomic Hodge–Tate signs are stated in both
conventions; their Lean comparison waits for the explicitly named Tate-module
and p-adic Hodge suppliers. No denominator is used without positive degree,
positive scale, prime p>1, nonzero ramification index, or positive cosh.

## Ten elaborated signatures and remaining implementation work

The separate signature audit printed and compared `numberField_kernelField`,
`ResidualRep.map`, `twist`, `IsLevelOneResidual.map`,
`dihedral_or_SL2_of_irreducible_char_two`,
`twentyFour_dvd_card_of_irreducible_char_three`,
`SemistableCategory.cartierDual`, `isConstant_baseChange_cyclotomic`,
`fieldCriterion_five_two_degree`, and `IsGL2Type.isogeny`.
The first four retained the finite/discrete hypotheses required by their
particular conclusions, the classification retained actual conjugacy, and
the prime and relative-inertia hypotheses were present.

No uncorrected acceptance defect remains. Future implementation must supply
compatible valued-field/completion APIs at the signature baseline, semistable
integral torsion, rational Tate modules with coefficient actions, local
p-adic Hodge and Serre-weight APIs, and the three explicitly named geometric
example constructions. These are existing supplier contracts, not new gaps
or anonymous substitutes. The README retains their exact statements. The
full row theorem should be added only once its nine actual propositions can
be typed. Nothing here claims completed formalization.
