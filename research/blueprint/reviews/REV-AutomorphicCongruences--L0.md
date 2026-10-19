# Independent review: AutomorphicCongruences L0–L5a

Accepted as a completed pass at target level, with explicit gaps. All eight stages are **planned** in the sense of PROTOCOL §0; none is closed. This verdict verifies the corrected mathematical contracts and their recorded limitations. It does not discharge the supplier requests or certify formalization.

Job `REV-AutomorphicCongruences--L0`, issue #357. Reviewer: Codex, session `codex-K1c0KG`, 2026-10-19. The original planning author was Claude, session `claude-zBc10c`; this reviewer did not write that plan. The review covers the issue-listed packet and suggested Lean file. The separately generated reader was checked for consistency; its required synchronization is recorded below because it is outside this issue’s editable deliverables.

| Item | Result |
| --- | --- |
| Nodes | 69: 44 theorems, 11 constructions, 6 definitions, 6 comparisons, 2 applications |
| Verdicts | 59 corrected, 10 verified, 0 added, 0 unverifiable |
| Nodes by stage | L0: 9; L1: 11; L2: 14; L2s: 8; L3: 10; L4: 10; L5: 1; L5a: 6 |
| API entries / mathematical tests | 125 / 68; every definition and construction has at least three tests |
| Planets | 25; the largest stage has six |
| Pinned baseline declarations | 13 confirmed; four descriptions narrowed |
| Sources | Seven original public versions and one additional author-hosted addendum |
| Source findings | Three original findings confirmed; four added and confirmed |
| Supplier requests / gaps | 20 / 16 |
| Coverage | Eight planned, zero closed; packet status complete |
| Suggested Lean | 2,448 lines; elaborates with 16 warnings, all for theorem/example proof holes |

No new target node was necessary. Several non-routine missing steps are now explicit gaps rather than hidden implications. A complete pass under the node budget can retain these gaps when every target’s chain ends in a declaration, supplier contract or named gap (PROTOCOL §0). The unread general CM theorem was narrowed to the exact application contract consumed by CLW; it is no longer asserted with unspecified hypotheses.

## Public sources and reading limits

The packet retains versioned URLs and SHA-256 hashes. Its original `readSections` is the planning author’s reading history; `reviewRead` records this independent review’s additional direct reading. Every node’s cited target statement was checked in the indicated public version. Selected non-routine proof steps and the cited supplier statements were also read. Neither a complete reading of every long paper nor a reading of the later published Nakamura text is claimed. Those limits are reflected in the gaps.

| Source | Version and passages used |
| --- | --- |
| Skinner–Urban | [Author final copy](https://www.math.columbia.edu/~urban/eurp/MC.pdf), dated 21 December 2012, 226 PDF pages. Selmer/control statements §§3.1–3.2, pp. 18–27; main ordinary statements §§3.5–3.6, pp. 37–44; lattice setup and argument §4, pp. 47–61; Eisenstein/Galois statements §§6.5–7.3, pp. 96–108; period/interpolation formulas §§12.2–12.4, pp. 194–204; nonsingular coefficients Prop. 13.4.1, pp. 217–219. These are author-copy pages, not journal pages. |
| Fouquet–Wan | [arXiv v3](https://arxiv.org/pdf/2107.13726v3), 103 pages. Hypotheses and deformation statements pp. 6–36; unramified exponential pp. 43–45; crystalline endpoint and selected proof steps pp. 58–65; ordinary sketch p. 68; family/point descent pp. 68–73; local-family statements pp. 77–79; general-weight control and interpolation pp. 80–89; Fourier–Jacobi and final bound pp. 90–97. |
| Castella–Liu–Wan | [arXiv v1](https://arxiv.org/pdf/2109.08375v1), 83 pages. Selmer convention p. 3; control and boundary Thm 2.9.1 pp. 13–14, related statements pp. 19,24,29; local/family setup pp. 31–46; Fourier–Jacobi identities pp. 57–73; main statements and proof pp. 77–81. The original auxiliary-unit conclusion is superseded by the addendum. |
| CLW addendum | [Author-hosted PDF](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), six pages, linked from the [author’s publications](https://web.math.ucsb.edu/~castella/). All six pages read. Thms 1.0.1–1.0.2 weaken auxiliary nonvanishing; §3 gives two auxiliary choices; Thm 4.0.1 gives joint height-one coprimality; Thms 5.0.1–5.0.2 repair the applications. |
| Nakamura | [arXiv v2](https://arxiv.org/pdf/2006.13647v2), 109 pages. Hypotheses/factorizations pp. 4–7,20,25; finite-level zeta and weight maps pp. 48–61; universal map and local-type/motivic comparison pp. 63–74; integral versus rational image conditions p. 75; congruences and residual/λ arguments pp. 77–84. Published numbering/errata were compared with `PAPER-NAKAMURA-23.result.json`; its full-paper reading is not attributed to this reviewer. |
| Burungale–Castella–Skinner | [arXiv v2](https://arxiv.org/pdf/2405.00270v2), twelve pages, read throughout; the main contracts here are Thm 4.1.3, Cor. 4.1.4, Prop. 4.2.2 and §§5.1–5.2, pp. 8–10. |
| Castella–Wan | [arXiv v1](https://arxiv.org/pdf/2001.03878v1), Thm 3.6 and its proof p. 15, Thm 3.8 p. 16. The two p-places were checked in the rendered page as well as extracted text. The later publication has different pagination. |
| Wan | [arXiv v5](https://arxiv.org/pdf/1408.4044v5), 100 pages. Thms 1.1–1.2 and outline pp. 2–6; §9 setup (1)–(9), Prop. 9.2 and Lemma 9.3, pp. 93–96. This is the ordinary published-theorem preprint, not the withdrawn nonordinary manuscript. |

The addendum changes the plan materially. It weakens an auxiliary **ℓ-power tower** nonvanishing assertion from a cofinite statement to an infinitely-many statement. It does not withdraw Hsieh’s separate **p-power tower** µ=0 theorem. For weight-two π the addendum constructs two Klingen families with the same eigensystem. Their Fourier–Jacobi functional values jointly avoid every height-one prime after inverting p. Neither a unit value from one fixed family nor a unit ideal is required. At each prime the congruence proof chooses one of the families. The general-weight FW argument still needs this repair transported to its vector-valued setting; the scalar theorem alone does not provide that extension.

The repository contains our mathematical statements and bibliographic locators, with no source passages or source files. The user’s standing rule supersedes the issue’s older excerpt request. No restricted book was used.

## Baseline and existing upstream work

All thirteen declarations were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed or replaced by a similarly named theorem. Four `provides` descriptions were narrowed to the actual declaration. The existence of an algebraic carrier is not credited as an implementation of the arithmetic construction.

| Declaration | File and line at the pin | Scope confirmed |
| --- | --- | --- |
| `Module.length` | Mathlib `RingTheory/Length.lean:31` | Length in ℕ∞ from the submodule lattice; the definition alone is not exact-sequence additivity. |
| `LocalizedModule` | Mathlib `Algebra/Module/LocalizedModule/Basic.lean:89` | Module localization at a submonoid. |
| `Ideal.span` | Mathlib `RingTheory/Ideal/Span.lean:46` | Generated ideal. |
| `Ideal.map` | Mathlib `RingTheory/Ideal/Maps.lean:43` | Extension of an ideal along a ring map. |
| `RingHom.ker` | Mathlib `RingTheory/Ideal/Maps.lean:746` | Kernel ideal. |
| `IsDiscreteValuationRing` | Mathlib `RingTheory/DiscreteValuationRing/Basic.lean:58` | PID/local/nonfield class with the surrounding domain hypotheses. |
| `IsReduced` | Mathlib `Algebra/GroupWithZero/Basic.lean:192` | No nonzero nilpotents. |
| `Matrix.charpoly` | Mathlib `LinearAlgebra/Matrix/Charpoly/Basic.lean:134` | det(XI−M); SU’s det(1−TM) requires the reciprocal-polynomial conversion. |
| `MvPowerSeries` | Mathlib `RingTheory/MvPowerSeries/Basic.lean:86` | Multivariate formal power-series carrier; no automatic Iwasawa-coordinate identification. |
| `UniqueFactorizationMonoid` | Mathlib `RingTheory/UniqueFactorizationDomain/Defs.lean:133` | The factorization class; use with the domain/regular-ring facts in the application. |
| `IsLocalRing` | Mathlib `RingTheory/LocalRing/Defs.lean:30` | Nontriviality and the unit alternative; residue-field criteria belong to its API. |
| `IsRegularLocalRing` | Mathlib `RingTheory/RegularLocalRing/Defs.lean:51` | The regular local-ring class, with its Noetherian/local requirements. |
| `TauCeti.ContCohomology.H1` | Tau Ceti `RepresentationTheory/Homological/ContCohomology/LowDegree.lean:674` | Additive quotient of continuous cocycles by coboundaries; not automatically a compact Iwasawa coefficient object or a topology on it. |

The reviewed `data/library-coverage.json` entries for the eight stages were checked. Their generic ring, cohomology and representation carriers do not formalize these main-conjecture arguments. No target was retained as new work where that audit supplies the actual theorem.

Current upstream roadmaps were checked separately from the older atlas snapshot. The read-only checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`. In particular, the ProfiniteCohomology, IntegralHeckeAndGaloisDeterminants and SmoothRepresentationsOfLocalGroups READMEs and relevant suggested declarations were read. Generic Shapiro, GMA/reducibility and co-Whittaker APIs remain imports. IHG’s rank-two local Ribet theorem does not supply SU’s polarized 1+n+1 lattice construction. The earlier assertion that PadicMeasuresIwasawaAlgebras L5 already exists on upstream main was removed: that roadmap was absent from this checkout, so its determinant contract remains requested.

## Principal corrections and proof boundaries

The per-node ledger below records every changed node. The following corrections have the largest effect on consumers.

1. **Selmer and Euler conventions.** The p-condition persists even if p belongs to Σ. Setting T_p=0 gives an unramified condition at p, not strict zero. SU Lemma 3.2.17 uses inverse Frobenius on rational inertia invariants. Residual Steinberg ramification does not make the resulting Euler element a unit: for ℓ=11, p=5 and eigenvalue 1, its augmentation is 10/11. Prop. 3.2.18’s coefficient, torsion, trivial-submodule and ramification hypotheses, and Prop. 3.2.8’s local action/trivial-subquotient hypotheses, are explicit. SU’s Pontryagin-dual notation is retained without silently turning it into a Tate dual.
2. **Normal rings and lattices.** A general normal Hida branch needs the characteristic divisor and its divisorial ideal, not the supplier’s UFD-only native characteristic ideal. The lattice datum retains the residue-field size, polarization, field-factor and descent conditions. The n=0 two-character test did not meet its irreducible middle-constituent requirement. Wan’s condition (9) uses χ+χ′, with χ′=νχ^{-c}; the simplification χ′=χ^{-c} requires ν=1.
3. **SU’s periods and Hecke algebras.** The full period formula includes S(f), 2^{-3}(2i)^{κ+1}, the Atkin–Lehner pairing and the canonical periods. The integral EPW/SU period-lattice dictionary remains a request. The Eisenstein form has an eigencharacter on the full Hecke algebra; the cuspidal quotient receives it only modulo the Eisenstein ideal. A test requiring a cuspidal eigencharacter into the coefficient ring was corrected. The form is written ℰ_D where confusion with the ideal E_D mattered.
4. **Semi-ordinary theory.** The full weight tuple has four coordinates after fixing the similitude character. Λ_so uses the identity component T_so(1+pZ_p); the boundary exact sequence retains the finite-character action of the full torus algebra. Classical cusp-surjectivity has its additional sufficiently large t^- hypothesis. In the unitary normalization supersingular weight-two Satake valuations are 0,0; the extreme values ±1/2 describe the ordinary case. The two addendum families live in the specified ♮ measure space tensored with Q.
5. **FW and BF.** The Steinberg multiplier is −ℓ^{k/2−1}, not a power of −1. The first Coleman map is at p̄ with F^-; the second is at p with F^+. Their fractional congruence-ideal targets are retained. A universal non-torsion class need not have a nonzero value at a specified arithmetic point. The chosen inert auxiliary prime does not meet the separate ramified-Steinberg hypothesis of the full µ=0 bound. CW’s equivalence remains only up to powers of p; the ordinary descent details and the general-weight auxiliary repair remain gaps.
6. **Exponential lattices.** FW Cor. 4.14 excludes φ=1 invariants at every unramified specialization. Its rational direct-summand line must be rescaled before obtaining the saturated integral line. The constants in Def. 4.15 cannot be discarded. GH.7 is a checkpoint requesting a local regulator Part II, not an existing general exponential construction. The integral Kato bound additionally needs an actual free rank-one τ-quotient witness.
7. **Universal zeta and determinants.** The intrinsic BM co-Whittaker factor and its smooth dual are distinguished across Nakamura’s arXiv/published notation. Weight and local-type comparisons tensor over the relevant completed group algebra, not just O. Local determinant corrections range over Σ minus p; the rank-one complex has degrees 0,1, fixing the determinant sign. Restriction to Λ uses a determinant norm. If the dual line has image αΛ, the original line has image α^{-1}Λ. Every invertible module over a local ring is abstractly free; FW’s issue is the prescribed rational trivialization, not abstract freeness. Conj. 3.25 is over S_Iw, with its partial/full distinction.
8. **Residual hypotheses and propagation.** FW Thm 1.7 always requires nontrivial µ; Thm 5.1 allows µ=1 in the reducible-at-p case. They are separate predicates. The alleged missing scalar exclusion is resolved by FW’s p. 69 determinant parity remark: 2a cannot equal the odd k−1 modulo even p−1. A residual Euler element such as 1−γ can be nonzero and nonunit. Nakamura’s condition (a) is an integral free-quotient condition; condition (b) is rational. Rank/torsion/µ=0 propagate under the stated residual nonvanishing and modular witness hypotheses; full characteristic-ideal equality additionally requires the one-sided bound. The arXiv change-of-Σ zeta formula is (77), p. 78; (79), p. 80, is the H² exact sequence.
9. **BCS.** In the Shapiro decomposition the two resulting groups are over K. The quartic L-function comparison gives equality of ideals after inverting p; density does not eliminate a period scalar. The auxiliary-field conditions preserve the Wan/Fujiwara hypotheses through L5w. The BDP normalization is already squared. In the ordinary comparison irr_K implies van_K, so the integral source conclusion is available under its actual hypotheses. Its missing ordinary BSTW proof owner is still the proposed KatoEulerSystems L5, not existing L4 or BSD’s supersingular construction.

Useful counterexamples now include the unramified-versus-strict local class, the ℓ=11/p=5 Euler augmentation, the two distinct FW µ predicates, and A=k[[x,y]], M=A/(x,y), whose Fitt₀ is (x,y) while its characteristic divisor is zero. These replace tests that were tautological, had invalid hypotheses, or asserted nonvanishing without a source. The suggested file also tests a nonzero residual polynomial 1−X with zero augmentation. Its quadratic splitting predicates now distinguish the prime 2: for odd fundamental D, D≡1 mod 8 splits and D≡5 mod 8 is inert. The former Jacobi-only predicate missed this place when 2 divides N; the D=−7 and D=13 example checks the correction.

## Source findings

Every entry has an independent confirmed verdict in `sourceIssues`. Labels and formulas below identify corrections in our words.

| Entry | Location | Disposition |
| --- | --- | --- |
| E8 | CLW v1, proof of Thm 8.2.1(2), p. 81 | Repeated dist should be irred and dist; the preceding paragraph establishes both. |
| E9 | BCS v2, proof of Prop. 5.2.1, p. 10 | The cited equivalence is Theorem 4.1.3, with Cor. 4.1.4 for products. |
| E10 | FW v3, §4.8, p. 68 | Confirmed omitted-detail issue: the source indicates the ordinary integral argument. This does not establish falsity of its theorem. |
| E11 | CLW v1, end of proof of Thm 8.1.1, p. 78 | E⊂P^m gives ord_P(E)≥m. The final displayed direction in the proof is reversed; the theorem statement has the right direction. |
| E12 | BCS v2, proof of Lemma 5.1.1, p. 9 | The two groups after Shapiro are over K, not M. |
| E13 | Nakamura v2, end of proof of Thm 5.13, p. 84 | The residual term in the defect is H². This is also the published finding PAPER-NAKAMURA-23/E12. |
| E14 | CLW addendum §§1,3–5, pp. 1–6 | The original auxiliary cofinite nonvanishing argument is repaired by the two-family construction. The main statements are retained by Thm 5.0.2. |

The Nakamura route ledger now distinguishes version-specific issues. In particular arXiv v2 already has c² in the smoothing factor; the published extraction’s bare-c finding is not imposed on it. The cohomology/homology tilde notation is likewise tracked intrinsically rather than copied between versions.

## Findings, suppliers and ownership

All thirteen assigned red-team findings were checked against the packet, the reader and their supplier statements. The packet’s `findingsCoverage` records the updated dispositions.

| Finding | Verified boundary or correction |
| --- | --- |
| RT-AREA-automorphic-1/20 | MP.6 owns the Jacobi group, Fourier–Jacobi extraction and Rallis framework; the analytic identities are not re-created here. |
| RT-AREA-iwasawa-1/6 | AG2 supplies the Galois direction, but its present degree hypothesis requires an explicit imaginary-quadratic adapter. CAP exclusion still needs its distinct modularity/Harris inputs. |
| RT-AREA-iwasawa-1/7 | Finis/Vatsal/Hsieh inputs remain with APL L3h; Vatsal’s missing comparison is inherited honestly. |
| RT-AREA-iwasawa-1/22 | The ordinary FW argument belongs to L2, with Kato inside its proof. L1 remains SU’s argument. |
| RT-AREA-iwasawa-1/24 | L2s owns scalar weight-two semi-ordinary theory; L2 adds the general-weight control and vector-valued computations, including its now explicit repair gap. |
| RT-AREA-iwasawa-1/25 | L3h feeds L2s. The auxiliary ℓ-tower correction and p-tower µ theorem have different contracts. |
| RT-AREA-iwasawa-1/26 | The CM Rankin function and integral congruence/Katz comparison are distinct inputs; neither is supplied by a one-form cyclotomic function. |
| RT-AREA-iwasawa-1/27 | GH.7 records the Yager/local Part II checkpoint; AC owns the application-specific boundedness only. |
| RT-AREA-iwasawa-1/28 | R31/R30 and existing upstream SR own generic local–global, p-adic Langlands and co-Whittaker theory. The p=3 and unconditional GL₂ essential-vector requests remain precise. |
| RT-AREA-iwasawa-1/29 | L5a uses BCS Thm 4.1.3, not the later anticyclotomic Thm 4.2.1. |
| RT-AREA-iwasawa-1/30 | The ordinary two-variable BSTW comparison has the single proposed owner Kato L5. It is not silently credited to an existing packet. |
| RT-AREA-langlands-1/8 | The Hilbert Igusa input belongs to L5w and HilbertModularVarieties T5; L5/L5a do not re-plan it or add an IG1 dependency. |
| RT-AREA-langlands-1/27 | Generic congruence modules are imported from PadicFamilies L1; the SU integral period dictionary is a separate application request. |

The individual supplier-node statements were read, rather than relying on stage titles. Important near misses were the UFD-only native characteristic ideal, AG2’s [F⁺:Q]≥2 condition, the ordinary-only p-zeta calculation, the one-form cyclotomic family L-function, the two-dimensional local Ribet theorem, the unobstructed-only Böckle supplier, and the conditional general LLC family. They are now either removed from the inapplicable direct role, qualified, or paired with an exact missing contract. Existing generic APIs remain imports, including the current upstream IHG and SR work.

The RS-11 ownership split is preserved. L1 owns the SU reverse bound; L2 owns the FW ordinary reverse proof, including its Kato input; L2s owns CLW; L3 owns the universal-zeta/fundamental-line instance; L4 owns the point/family descent. Generic determinants stay with PMIA L5. L5a is the early BCS product input, importing L5w’s selected quartic theorem and the proposed Kato L5 comparison. L5b is the later cyclotomic descent; HE.8b is a later anticyclotomic consumer. L5 is an aggregate and must not replace L5b as the MIMC consumer’s direct input. No consumer file or global atlas data was edited.

## Per-node check ledger

All identifiers below are relative to `AutomorphicCongruences:`. Their full statements, hypotheses, locators, direct prerequisites and proof outlines remain in the packet. The `review.checked` list contains exactly one verdict per node.

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `L0/sigma-primitive-selmer` | corrected | Corrected the p-condition, full-relaxation and unramified tests, and the normal-ring characteristic-divisor interface. |
| `L0/primitive-imprimitive-comparison` | corrected | Restored inverse Frobenius on rational inertia invariants and all Prop. 3.2.18 assumptions; removed a false Steinberg-unit assertion. Kept SU’s Pontryagin-dual notation, without silently replacing it by a Tate dual. |
| `L0/selmer-specialization-control` | corrected | Made Prop. 3.2.8’s local action and trivial-subquotient hypotheses explicit, retaining only principal-majorant specialization. Kept SU’s Pontryagin-dual notation, without silently replacing it by a Tate dual. |
| `L0/eisenstein-ideal` | corrected | Separated I in the cuspidal Hecke algebra from its contraction E in the coefficient ring, including the Mazur test. |
| `L0/su-lattice-datum` | corrected | Kept compatibility with ρ as a hypothesis, added the residue-field size bound, and replaced the invalid n=0 test. |
| `L0/lattice-construction` | corrected | Exposed the descent, parity, field-factor and Wan condition-(9) hypotheses; removed inapplicable rank-two Ribet prerequisites. |
| `L0/extension-class-local-conditions` | corrected | Removed the implication residual ramification ⇒ Euler unit and distinguished FW Assumption 3.7 from Thm 1.6(2). |
| `L0/canonical-period-congruence-number` | corrected | Restored SU Lemma 12.2.2’s explicit S(f), archimedean, Atkin–Lehner and period factors; retained the integral period-interface gap. |
| `L0/hida-tilouine-anticyclotomic` | corrected | Narrowed an unsupported general CM main-conjecture assertion to the exact CM-theta integrality input consumed by CLW. |
| `L1/gu22-ordinary-hermitian-forms` | corrected | Distinguished the compact dual V from the q-expansion module M=Hom_Λ(V,Λ). |
| `L1/gu22-hida-control` | verified | Independently checked the statement, hypotheses and locator against the recorded public version, read the cited supplier contracts, and retained this source-specific target with the explicitly recorded proof gaps. |
| `L1/eisenstein-datum` | corrected | Replaced the impossible constant-family finite-over-weight-ring test with arithmetic specialization, and made the full/cuspidal distinction explicit. |
| `L1/klingen-eisenstein-series` | corrected | Removed an unsupported claim of nonconvergence at every κ≤6; retained the source’s sufficient κ>6 range. |
| `L1/su-padic-l-function` | corrected | Made the interpolation multiplier, coefficient-field/Gauss-sum assumptions and M⁺ splitting explicit. |
| `L1/padic-eisenstein-family` | corrected | Corrected the eigensystem map to act on the full Hecke algebra; its cuspidal counterpart is modulo the Eisenstein ideal. |
| `L1/nonsingular-coefficient-coprimality` | verified | Independently checked the statement, hypotheses and locator against the recorded public version, read the cited supplier contracts, and retained this source-specific target with the explicitly recorded proof gaps. |
| `L1/gu22-galois-pseudocharacter` | corrected | Corrected the Eisenstein specialization test to a congruence quotient and recorded the mismatch with AG2’s [F⁺:Q]≥2 supplier. |
| `L1/su-selmer-lower-bound` | corrected | Independently checked the statement, hypotheses and locator against the recorded public version, read the cited supplier contracts, and retained this source-specific target with the explicitly recorded proof gaps. |
| `L1/su-two-variable-theorem` | corrected | Confirmed SU Thm 3.6.1/Cor. 3.6.2 at pp. 41–42, including the coefficient field, inertia and character hypotheses. |
| `L1/su-cyclotomic-divisibility` | verified | Confirmed the auxiliary choice N⁻=q used in the source’s next-page proof, and retained the product rather than a single-factor equality. |
| `L2s/semi-ordinary-weight-space` | corrected | Corrected four full weight coordinates, the identity-component Iwasawa ring, and the unitary Satake valuation test. |
| `L2s/semi-ordinary-hida-theory` | corrected | Restored the full finite-character boundary algebra and the sufficiently large t− classical cusp-surjectivity condition. |
| `L2s/semi-ordinary-klingen-family` | corrected | Replaced the obsolete single integral-family contract by the addendum’s two rational ♮ families with the same eigensystem. |
| `L2s/fourier-jacobi-primitivity` | corrected | Replaced the invalid simultaneous-unit conclusion by joint height-one coprimality of two families, as proved in the later addendum. |
| `L2s/clw-eisenstein-congruence` | corrected | Used the repaired family choice prime by prime and corrected the source proof’s reversed final inequality. |
| `L2s/cap-exclusion` | corrected | Confirmed the source CAP argument with its explicit Harris and unitary-Galois gaps; retained χ+χ′ rather than suppressing polarization. |
| `L2s/clw-main-divisibility` | corrected | Corrected scalar extension of X and the away-from-p Selmer conditions; distinguished cyclotomic localization from inverting p alone. |
| `L2s/clw-integrality-and-p-inverted` | corrected | Kept the one-sided p-inverted conclusion and narrowed the unread CM input to its exact integrality comparison. |
| `L2/general-weight-semi-ordinary-control` | corrected | Kept the four-variable weight space and the precise classicality ranges; Prop. 7.13 is a separate residual-local input. |
| `L2/vector-valued-klingen-family` | corrected | Expanded the interpolation and archimedean factors and separated the integral normalization from unspecified denominators. |
| `L2/greenberg-function-factorization` | verified | Confirmed the CM-family Rankin/Katz/class-number factorization; this is not PadicFamilies’ one-form cyclotomic function. |
| `L2/fw-fourier-jacobi-unit` | corrected | Qualified the original unit assertion by its auxiliary nonvanishing hypothesis and exposed the general-weight repair required by the CLW addendum. |
| `L2/fw-greenberg-divisibility` | corrected | Corrected the Steinberg twist to −ℓ^{k/2−1} and made dependence on the general-weight auxiliary repair explicit. |
| `L2/exceptional-height-one-primes` | corrected | Kept Hsieh’s p-tower µ=0 theorem separate from the weakened auxiliary ℓ-tower nonvanishing. |
| `L2/auxiliary-field-selection` | verified | Confirmed only the first, exceptional-prime-qualified FW containment: inert ℓ does not meet the ramified Steinberg hypothesis of the full bound. |
| `L2/klz-beilinson-flach-classes` | corrected | Removed a false universal nonzero specialized L-value test and fixed the two p-places. |
| `L2/bf-explicit-reciprocity` | corrected | Corrected Col¹ to p̄ and Col² to p, retained their fractional congruence ideals, and removed a mismatched cyclotomic supplier. |
| `L2/castella-wan-equivalence` | verified | Confirmed CW Thm 3.8 only up to powers of p; the weight-k extension is FW’s indicated argument and remains part of its explicit sketch gap. |
| `L2/unramified-exponential-boundedness` | corrected | Added the crystalline φ=1 exclusion, distinguished rational direct summands from scaled saturated integral lines, and corrected Yager ownership. |
| `L2/fw-crystalline-main-conjecture` | corrected | Retained the source endpoint while exposing the general-weight nonvanishing and integral Euler-system hypotheses needed by its proof. |
| `L2/fw-ordinary-reverse-bound` | corrected | Retained the source endpoint while exposing the general-weight nonvanishing and integral Euler-system hypotheses needed by its proof. |
| `L2/wan-rankin-selberg-divisibility` | verified | Confirmed Wan’s squarefree ordinary theorems and the p-inverted single-form bound; auxiliary nonvanishing now points to the weakened ℓ-tower contract. |
| `L3/fw-residual-hypotheses` | corrected | Separated Thm 1.7 from the broader Thm 5.1, corrected scalar endomorphisms, and restricted twist invariance to its valid scope. |
| `L3/universal-deformation-ring-structure` | corrected | Kept FW’s source-specific complete-intersection argument distinct from the supplier’s unobstructed Böckle theorem. |
| `L3/smooth-classical-points` | corrected | Replaced an unspecified large-codimension assertion by the precise codimension-at-least-one exceptional locus. |
| `L3/fundamental-line` | corrected | Fixed the non-p index set, degree/sign convention, and a false Fitting/base-change counterexample. |
| `L3/completed-homology-factorization` | corrected | Corrected the reversed arXiv cohomology/homology labels and separated the two away-from-p factors intrinsically. |
| `L3/equivariant-zeta-morphism-completed-homology` | corrected | Restored the completed-group-algebra tensor in weight comparison and corrected version-specific smoothing attribution. |
| `L3/nakamura-universal-zeta-morphism` | corrected | Tracked the intrinsic BM co-Whittaker factor and retained the p=3 local-Langlands supplier gap. |
| `L3/nakamura-specialization-theorem` | corrected | Made the local-type tensor and motivic comparison explicit; classical density alone does not prove specialization. |
| `L3/zeta-trivialization` | corrected | Distinguished restriction of scalars and determinant norm, and fixed the dual lattice αΛ versus the primal α⁻¹Λ. |
| `L3/kato-generalized-main-conjecture` | corrected | Restored S_Iw and partial/full lines in Conj. 3.25, and made the BSD test conditional on all source hypotheses. |
| `L4/integrality-of-universal-trivialization` | corrected | Defined the dual map on Δ⁻¹ and identified its integral αΛ image, avoiding a map applied to the wrong domain. |
| `L4/etale-point-descent` | corrected | Removed the false assertion that an invertible module over a nonfactorial local ring need not be free. |
| `L4/fw-universal-family-theorem` | corrected | Replaced the conflated T1.7 predicate by T5.1 and separated automatic hypotheses from unresolved supplier proof inputs. |
| `L4/family-to-point-limit` | corrected | Corrected primal versus dual images and separated the Σ-partial Euler-corrected limit from the full pointwise conclusion. |
| `L4/fw-pointwise-theorem` | corrected | Resolved the alleged missing scalar hypothesis using the source’s determinant parity remark and separated Thms 1.7 and 5.1. |
| `L4/derived-specialization-corrections` | corrected | Kept derived local correction complexes and determinant norms; removed an oversimplified lattice-index assertion. Distinguished v2 zeta formula (77) from cohomological formulas (78)–(79). |
| `L4/zeta-morphism-congruences` | verified | Confirmed NAK-v2 Cor. 5.6 and the Euler-corrected congruence; the published ϖ-exponent typo does not alter the statement. |
| `L4/residual-zeta-morphism` | corrected | Replaced a false formally-zero residual Euler-factor claim by a nonunit example and added an extensionality contract. Corrected change-of-Σ to arXiv v2 (77), p. 78; (79) is the H² exact sequence. |
| `L4/nakamura-residual-structure` | corrected | Expanded Nakamura’s integral condition (a), made µ=0 conditional, and separated rank/torsion from the bound-eligible points. |
| `L4/nakamura-lambda-defect` | corrected | Distinguished weak equality of λ-invariants from full main-conjecture equality requiring the one-sided bound. |
| `L5/ordinary-elliptic-refinement-aggregate` | verified | Confirmed this is an aggregate of L4 and L5b endpoints, with no independent proof and no use as a substitute for L5b in the consumer. |
| `L5a/ordinary-two-variable-equivalence` | corrected | Used irr_K to discharge van_K and removed an unsupported claim about dropping van_K; kept the absent Kato L5 owner explicit. |
| `L5a/quartic-cm-selmer-restriction` | corrected | Corrected the source’s Shapiro right-hand groups from M to K; η_F restricts trivially to G_M. |
| `L5a/quartic-cm-l-function-factorization` | corrected | Kept equality of principal ideals after inverting p, retaining the period scalar rather than asserting equality of functions. |
| `L5a/auxiliary-field-existence` | corrected | Confirmed the simultaneous field conditions and selected Wan/Fujiwara hypotheses. Corrected the suggested splitting predicates at 2, which may divide N; Jacobi symbols alone do not encode that place. |
| `L5a/greenberg-mu-vanishing` | corrected | Specified the squared normalization already built into the BDP function; no additional square is inserted. |
| `L5a/two-variable-product-containment` | verified | Confirmed the integral product bound via quartic base change, the ordinary comparison and µ=0, without importing a later anticyclotomic endpoint. |

## Reader synchronization and remaining work

The reader document still reflects the original packet. It was not silently treated as correct: its single-family unit claim, semi-ordinary torus algebra, Coleman-map places, inverse/primal determinant wording and scalar-hypothesis discussion require synchronization. Editing that path is not authorized by issue #357. Packaging must regenerate or reconcile it from this corrected packet and suggested register before presenting it as the accepted roadmap. The suggested file’s introduction now points to the corrected packet and review as the current contracts.

The 16 named gaps are the actionable remaining work: exact CM-theta integral comparison; EPW/SU period dictionary; SU geometric/local coefficient proofs; Vatsal input; imaginary-quadratic unitary Galois adapter; Ichino/local triple products; Harris CAP exclusion; original KLZ construction/reciprocity; FW ordinary integral descent; generic analytic/Bianchi comparison; general-weight two-family repair; the local unramified regulator supplier; an integral Kato quotient witness; the exact GL₂ completed-homology/type supplier and p=3 extension; Hida representation normalization dictionary; and the proposed ordinary BSTW owner. Each has named consumers in `gaps`; the coverage records carry those contracts rather than requiring arbitrary lemma-level expansion.

Questions/actions for the orchestrator are therefore concrete: synchronize the reader; route the corrected ℓ-tower nonvanishing to APL L3h and the general-weight repair to AC L2; correct MIMC’s alleged scalar-gap entry using FW p. 69; point the other AC part’s polarized lattice request here; and retain the Kato L5, local Part II and determinant-owner requests until supplied. No extra approval or new issue claim is needed from this worker.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L0.json` reports zero errors and zero warnings. The schema-level checks were supplemented by node-by-node source/supplier checks, definition/construction test counts, exact review coverage, source-issue verdicts and the six-planets-per-stage limit.

`lean-check research/blueprint/suggested/AutomorphicCongruences--L0.lean` succeeded at the shared pinned Mathlib build. The 16 warnings are exclusively theorem/example proof holes; every data definition has a real body. The file contains only light carriers already at the pins and a comment register for the unavailable arithmetic objects. No language server or library build was started. `git diff --check` is clean. No source files, private paths, new Lean project, or unrelated deliverables are included.
