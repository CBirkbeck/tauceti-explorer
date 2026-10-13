# Independent package review: RankZeroOneBSD

**Verdict: accepted with corrections.** Reviewer: `independent-review-REV-PKG-RankZeroOneBSD` (Codex, session `codex-l0Zk2H`), 2026-10-13. Issue: #9235. The package author was a different session, `codex-aO0QdW`.

## Review summary

The package is ready for a draft roadmap PR. Both accepted packets' 165 targets are accounted for: 153 retained targets and 12 existing-owner deferrals. Statements, hypotheses, API entries, Checks and proof obligations remain in the README. Definitions have at least three discriminating Checks; unavailable arithmetic carriers remain README targets. The independent Lean run passed with 23 warnings, all for `sorry`; its 241-line file contains no sorry-defined data or auxiliary theory.

Corrected Wüthrich's Lemma 17 locator, clarified BFH's unnumbered lemma, removed duplicate citations, repaired layer references and additive-order API names, and moved the 37a1 nontorsion calculation out of the 32a2 proof. Added explicit convention witnesses, distinguished relative/absolute heights and current/pinned height scaling, scoped coefficient rings to characteristic zero, corrected the five-torsion wording, and stated how the rational 32a2 fixture extends the existing finite-field example. Verified Hida's Theorem I and recorded its 2022 proof addendum.

The source audit includes a reproducible random sample of 15 retained targets and renewed checks of previously unread BFH, Gross and Gross–Zagier locators. Original FH, Birch–Stephens and parts of the elliptic-unit chain remain explicit source/proof obligations. Acceptance concerns a faithful mathematical roadmap, not a completed formalization or certified fixture calculation. The source, definition, signature and adversarial records below state the limits of the checks.

## Completeness, ownership and closure

The current packets `RankZeroOneBSD--BSD.0.json` and `RankZeroOneBSD--BSD.7.json` have 68 and 97 targets. The package-author handoff's retained-target table maps all 153 remaining nodes to README subsections. I compared that inventory, the complete retained mathematical content, API entries and Checks against the package; there is no lost target. The earlier assembly's partial inventory did not determine scope. Neither packet changed.

Compared roadmap form with the atlas EllipticCurves and ClassFieldTheory models and the current upstream EllipticCurves, ProfiniteArithmetic and LocalGaloisGroups interfaces. The package has ownership, conventions, exact supplier contracts, ordered layers, worked examples and locators in mathematical prose. The metadata is exactly `topic = "math.NT"`. No source passage, source-section digest, private path or package-process narrative occurs in the roadmap.

Current upstream was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object/hypothesis searches covered the whole current library, all roadmap directories and `Completed`, including the nine roadmaps newer than the atlas snapshot. Relevant elliptic, lattice, local-Galois, cohomological and Iwasawa interfaces were read. The BSD-specific comparisons, actual classes and exact certificates are absent there; generic height, regulator, lattice, torsion, local reduction and Selmer theory remain supplier deferrals. No additional duplicate required removal in this review. A normalization change does require an explicit version boundary: pinned `CanonicalHeight` divides the relative x-height limit by two, while current `CanonicalHeight.Basic` does not. The README now identifies the revision and forbids applying the pinned regulator conversion twice. Mathlib’s native number-field `logHeight` is relative, with total weight equal to the field degree; the quadratic comparison uses that relative normalization.

| Already deferred input targets | Owner confirmed |
|---|---|
| `actual-l-function`, `rational-newform-bridge` (BSD.0) | EllipticCurveModularity R29.3–R29.6, using Tau Ceti's entire-extension interface |
| `fixture-11`, `fixture-11-discriminant`, `fixture-11-elliptic`, `point-11`, `point-11-order` (BSD.9) | EllipticCurves named torsion example, Layers 1–2 and 6 |
| `fixture-37`, `fixture-37-discriminant`, `fixture-37-elliptic`, `point-37`, `point-37-order` (BSD.9) | EllipticCurves named rank example, Layers 1–2 and 6 |

The finite-field equation y²=x³−x in EllipticCurves is not a rational dyadic BSD fixture; that distinction is now explicit. Its rational CM example y²=x³+x is also distinct. The imported 37a1 infinite-order result was not replanned: the corrected numerical witness merely checks its compatibility with the later saturation target.

All internal `Needs` subsection references exist and point backward. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisite remains. RankZeroOneBSD is outside the Caraiani–Newton 94-roadmap tier list; no tier was invented. The early signed Layer 8 precedes its completed main-conjecture Layer 9. MIMC L6 and later Heegner reexports are consumers. Stronger arithmetic supplier contracts are explicitly extensions, rather than claims that a narrower existing roadmap already proves them. Those contracts must be supplied before the corresponding formal endpoint can be implemented.

## Source audit

The sample was drawn with Python `random.Random(9235).sample(pool, 15)`, where `pool` is the retained targets in BSD.0 then BSD.7 packet order having at least one external/library source other than the roadmap itself. The following table identifies the complete sample, so it remains reviewable after scratch deletion. A comparison locator supports the indicated input; derived adapters still require the proof outlined in the roadmap.

| README target | Primary locator checked | Result and limitation |
|---|---|---|
| 1.1 | JSW v1 Theorem 7.2.1(i), p.42; §7.3.2 (7.3.b), p.44 | Central quotient and period comparison; modular-symbol rationality is the explicit earlier supplier proof. |
| 2.10 | JSW v1 §7.1, p.41 | Number-field BSD normalization; the quadratic arithmetic comparison is a new derived target, with nonzero rational quotients assumed. |
| 9.3 | Castella erratum Theorem 2.3, pp.3–4; CGS v2 Theorems 6.1.1, p.22, and 6.5.1, p.28 | Source elliptic bound is rational after inverting p; integral higher-weight/error-zero refinement remains explicit. |
| 11.19 | KY v2 Lemma 1.1.1, p.9; Remark 1.2.3(ii), pp.14–15; Remark 1.4.2, p.25; Theorem 1.5.1, p.31 | Finite Euler factors, cotorsion and surjectivity matched to chosen lattice; inertia coinvariants and ℓ⁻¹γ retained. |
| 6.3 | JSW v1 Theorem 7.2.1(i), p.42 | One-sided finite p-primary bound, not equality. |
| 7.1 | Gross–Zagier V §1 Corollary 1.1, pp.308–309 | Derivative/height positivity input; central-value branch requires its separately named supplier. |
| 7.5 | JSW v1 Theorem 1.2.1, pp.1–2 | Rank-one rational leading-term quotient with source hypotheses and regulator. |
| 13.11 | Gross Theorem 1.3, p.236, and exceptions/proof, pp.236–239 | Index-square bound has exceptional factors; finiteness alone gives no effective exponent. |
| 2.3 | JSW v1 Theorem 7.4.1, p.46 | Quadratic rank context; integral maps and finite-generation rank proof are explicitly additional. |
| 7.8 | JSW v1 Conjecture 1.1.1(b), p.1; §7, p.41 | Motivates the defect definition; conjecture not used to assert defect one. |
| 13.7 | Wüthrich Lemma 17, statement p.397, proof p.398; Theorem 4, p.384 | Locator corrected; exact Cassels/local arithmetic certificate is a derived adapter. |
| 10.4 | BSTW v2 Theorem 1.5, p.4; §11, pp.90,93–95 | Semistable good supersingular rank-one range and auxiliary-twist restrictions retained. |
| 2.5 | Published JSW §7.1 (7.1.b), p.421; Gross–Zagier V §2, pp.310–312 | Complex-place and differential-ideal factors; Ω_K=4·norm(ideal)·covolume. |
| 12.3 | Published CGLS Theorem 5.1.4, p.573 | Kernel-character ramification/parity and torsion denominator; trivial character fails prototype. |
| 13.13 | Pinned Mathlib `Nat.mem_primeFactors`, PrimeFin, line 41; zero case line 73 | Support members prime without positivity; zero support empty. |

| Previously unverified or delicate input | Fresh check or remaining source obligation |
|---|---|
| BFH | Introduction pp.543–544 and §9 pp.614–617 read from page images. The p.615 lemma is unnumbered there and called Lemma 9.1 on p.616. Two independent test vectors and both nonzero pole coefficients checked. Other analytic supplier proofs were not independently reproduced. |
| Gross–Zagier | V §1 Corollary 1.1, pp.308–309; V §2 Theorem 2.1 and Conjectures 2.2–2.3, pp.310–312 read. Conjectures remain conjectures; full versus free index kept distinct. |
| Gross | Theorem 1.3 and its exceptional cases, pp.236–239 read. Conjecture 1.2 is not promoted to a theorem. |
| Dyadic congruent-number signs | Burungale–Tian v2 Theorem 1.2 footnote 2, p.2, confirms the positive-squarefree residue classes. Original Birch–Stephens local calculation remains a proof/source obligation. |
| Pollack–Weston | §6.2 Theorem 6.2 and Propositions 6.3–6.4, p.19; §6.4–6.5, pp.20–21, verify CR freeness, component terms and modular-degree comparison. No unconditional integral freeness inferred. |
| Fouquet–Wan/Fouquet–Ochiai | FW v3 Theorem 4.41, p.59; Corollary 7.21, p.89; FO Lemma 2.14, pp.12–13 checked. Stronger ramified-special hypotheses and excluded height-one primes remain; the nonexistent FO Corollary 7.2.1 is not cited as a result. |
| Hida | Theorem I, Annals 172, p.45, with exceptional conditions pp.45–46, and 2022 addendum p.1 checked. Imaginary-quadratic finite ramification excludes M1. Added explicit locator and replacement Lemma 3.17 proof obligation. |
| Original FH Theorem B | Publisher's Annals article identified, pp.385–423; original theorem text not acquired. Arbitrary compatible local prescriptions remain an explicitly unsourced proof obligation, separate from verified BFH splitting conditions. |
| Rubin 1991/1994 and Hida–Tilouine Theorem 0.3 | Original proof chain not acquired in this run; integral elliptic-unit comparison has no complete owner yet and remains an explicit supplier gap. Hida's μ theorem alone does not close it. |

## Definitions and discriminating tests

Counts include repeated inherited acceptance checks; the examples listed below are distinct discriminating cases. All intended definition/construction names occur either as real-bodied Lean objects or in its closing list of arithmetic constructions unavailable together at the pins.

| Definition/construction | Checks | Discriminating cases reviewed |
|---|---:|---|
| 0.1 completed L/root number | 7 | 37a1 Fricke +1/root −1; 11a1 root +1; central √N/π factor; cancellation at zero. |
| 0.2 rank/leading term | 6 | Rank zero nonvanishing; rank-one derivative; unitary center translation; factorial one. |
| 2.1 quadratic point maps | 6 | Trace 2P; negative twist eigenspace; trace need not surject; dyadic kernel. |
| 2.5 quadratic period | 4 | Positivity; unit ideal gives 4c rather than 2c; odd-prime period ratio. |
| 3.1 local prescription | 5 | Split −7 versus inert −3 at 11; empty prescription accepts negative discriminants. |
| 7.2 index | 6 | Free index one with torsion t gives full index t; doubled point; actual five-torsion divisibility. |
| 7.8 defect | 5 | Rank-zero formula; 11a1 exact quotient; halved rank-one regulator gives two; isogeny invariance. |
| 8.1 signed zeta element | 5 | Nonzero analytic image; two-Kato rational projection; distinct split primes; both normalized specializations. |
| 11.15 BF class/maps | 5 | PR product; squared BDP Gr image; zero class fails; differential change; same class/lattice. |
| 13.1 prime support | 5 | 6/35, zero, cancellation 2·1/2, negative sign, reduced representation. |
| 13.10 valuation certificate | 6 | 1, zero, −1 certificates; 2 and 1/4 rejected; empty list fails coverage for 2. |
| 13.13 all-primes constructor | 4 | Canonical empty set at 1, zero and −1; rejects a falsely imposed sign/nonzero restriction. |
| 13.17 exception constructor | 4 | Empty S versus nonminimal {2,3} for one; −1 allowed; every outside prime covered. |
| 14.4 rational model | 4 | Three roots; v₂Δ=6; c₄=48; two real components; distinguishes +x model. |
| 14.14 actual affine point | 4 | Nonidentity order-two origin; all three distinct affine points; (1,0)+(−1,0)=(0,0). |

The new normalization Checks instantiate rank zero/one, an index-two lattice, unramified versus ramified coefficient extensions, unit versus nonunit ideals, a finite pseudo-null module, squared BDP, ℓ⁻¹ Frobenius evaluation, dyadic characters and totalized valuations. Equal-characteristic O does not support the arithmetic p-inversion used here; the scope now says so. Heavy period, Iwasawa and arithmetic carriers stay out of Lean, so their normalization checks are README obligations rather than artificial replacement carriers. The representative Lean tests pin the actual twist maps, support/certificates, dyadic obstruction and affine point.

## Lean signature and generality comparison

The independent `lean-check` exited zero on the unchanged final Suggested.lean: 23 warnings, all declaration uses `sorry`; no other warning or error. It uses pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The five data definitions/structures have real bodies; proofs are placeholders, as a roadmap requires. No language server, Lake project, library build or cache fetch was used.

| Signature or example | README agreement checked |
|---|---|
| `QuadraticPoints.quadraticConj` | Actual point-map additive homomorphism over quadratic separable extension; explicit automorphism. |
| `two_smul_decomposition` | Rational plus actual twist-point image contains 2P; no integral direct sum asserted. |
| Rational-point conjugation example | Includes nonzero points; no assertion restricted to identity. |
| Twisted conjugation example | Nontrivial σ hypothesis present; negative eigenspace sign correct. |
| `primeSupport` | Reduced absolute numerator union denominator finite prime factors. |
| `PrimeValuationCertificate` | Prime list, coverage and local zero proofs only; no stored q=1 or positivity. |
| `eq_one_iff_all_prime_valuations_zero` | Strict positivity explicit; genuine all-prime quantifier. |
| `PrimeValuationCertificate.eq_one` | Certificate plus independent positivity. |
| `real_eq_of_certificate` | Actual rational-real quotient identity and B≠0 present. |
| `eq_one_iff_two_valuation_zero` | Prime/odd outside condition, positive q; dyadic valuation separate. |
| `prime_defect_obstruction` | Prime input; tests all distinct primes and rejects complete certificate. |
| Zero, −1, 2 and 1/4 examples | Totalized valuation and sign/support obstructions exactly match README. |
| `fixture32`/ellipticity | Actual rational five-coefficient model, nonzero discriminant. |
| `point32`/`point32_order` | Actual nonsingular affine constructor, nonidentity, additive order two. |
| Δ/j, roots, addition and negation examples | Rational field, actual group law and same specified model. |

Pinned twist, Galois-descent, canonical-height and regulator declarations were read; the current-library counterparts were checked for ownership. Pinned `Nat.mem_primeFactors`, rational normal form, `padicValRat`, additive-order and affine constructors agree with the uses. Current arithmetic interfaces were not substituted into a pinned Lean statement.

## Adversarial target ledger

Every numbered target was checked for degenerate inputs, source generality, denominator nonvanishing, map domain and normalization. The following is the complete 153-target record. “Retained” below concerns the corrected target specification and its explicit proof obligations; it does not assert that an open proof was completed. Witness arithmetic was computed independently, including the exact short-model multiples of the 37a1 point.

| Target | Instance or attempted shortcut | Assessment/change |
|---|---|---|
| §0.1 The completed L-function and the root number | Fricke +1 |  root −1; Gamma product at zero; Entire completion retained; pointwise pole cancellation required. |
| §0.2 Analytic rank and the leading coefficient at s = 1 | r=0, r=1 |  unitary shift 1/2; Coefficient is L^(r)/r!, with no extra factor at r=1. |
| §0.3 The quadratic character of a quadratic field | D=−7 and −3 at 2 | Values +1 and −1; dyadic rule explicit. |
| §0.4 Trace of Frobenius of a twist over a finite field | unramified χ=−1, a=−2 | Twisted trace +2; ramified characteristic excluded. |
| §0.5 Root-number parity of the analytic rank | r=0 versus r=1 | Signs +1 versus −1 follow from the actual functional equation. |
| §0.6 Local Euler factors of a quadratic twist | multiplicative versus additive |  singular special fibre; Tangent character belongs at the singular point; wording fixed. |
| §0.7 The L-series and conductor of a quadratic twist coprime to the conductor | gcd(D,N)=1 |  11·49=539; Conductor formula scoped away from ramified conductor primes. |
| §0.8 Factorisation of the L-function over a quadratic field | split 2 and inert 3 for D=−7 | Coefficients −4 and zero; finite-field trace differs from a_(ℓ²). |
| §0.9 Root numbers of the congruent-number twists | n=1,2,3 versus 5,6,7 | Signs agree with cited footnote; local dyadic proof remains a target. |
| §0.10 Root number of a quadratic twist | χ(N)=1, χ(−1)=−1 | Heegner twist reverses sign; duplicate citation removed. |
| §0.11 Order, leading term and sign of L(E/K, s) at the centre | orders (0,1) and (1,1) | Product orders 1 and 2; leading coefficients multiply. |
| §1.1 Rationality of L(E,1)/Ω_E | 11a1 quotient 1/5 |  37a1 quotient zero; Rationality precedes BSD and permits zero. |
| §2.1 Restriction, conjugation, trace and twist maps on points over a quadratic field | rational P |  twisted Q; Trace of restriction is 2P; twisted conjugation is −Q. |
| §2.2 Finiteness of Sha descends along a finite extension | quadratic restriction kernel | Finite kernel is needed; no injectivity assertion. |
| §2.3 Rank splitting over a quadratic field | rank pair (0,1) | Finite generation and 2-torsion kernel/cokernel give rank one. |
| §2.4 Torsion over a quadratic field | odd p versus p=2 | Integral torsion splitting is only away from two. |
| §2.5 The period of E over an imaginary quadratic field and its comparison | unit ideal, covolume c |  rectangular index two; Complex period 4c, rectangular area 2c; dyadic exponent retained. |
| §2.6 Lattice index and regulators over a quadratic field | Rank zero; index two; relative versus absolute height | Empty determinant one; lattice index contributes its square; native relative height and current/pinned scaling clarified. |
| §2.7 Odd-primary Selmer and Sha over a quadratic field | p odd versus two | Primary decomposition uses invertibility of two. |
| §2.8 The 2-primary restriction and corestriction comparison | restriction followed by corestriction | Composite is multiplication by two; dyadic error remains. |
| §2.9 Tamagawa factors under quadratic base change and twist | nonsplit multiplicative component | Geometric multiplicity and rational Tamagawa count kept distinct. |
| §2.10 The BSD quotient over K versus over ℚ at odd primes | known twist quotient versus two unknown summands | One equality cannot split arbitrary valuations; layer range fixed. |
| §3.1 Admissible discriminants with prescribed local conditions | D=−7 and −3 at N=11 |  empty prescription; Admissibility accepts split −7, rejects inert −3. |
| §3.2 The polar term of the BFH twist series and its nonvanishing | two independent vectors |  derivative central zero; Nonzero double pole −2q; value pole M₃τ₂; lemma locator clarified. |
| §3.3 Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein) | root signs +1 and −1 | Value and derivative branches separate; splitting range retained. |
| §3.4 Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein) | ramified local prescription |  compatibility failure; Original FH range remains an explicit source obligation. |
| §3.5 Choice of a Heegner field for analytic rank zero or one | r=0 versus r=1 | Twist sign flips; field choice supplies opposite analytic rank. |
| §3.6 Simultaneous choice of the auxiliary fields of the prime-part arguments | ramified q |  supersingular auxiliary twist; Additive twist cannot use unramified Skinner; BSTW support separately checked. |
| §4.1 The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston) | odd definite parity |  CR failure; Integral freeness required; no Heegner/BSD input cycle. |
| §5.1 A nonzero derivative over K gives a non-torsion Heegner point | nonzero derivative |  positive height; Actual Heegner point is nontorsion; normalized differential retained. |
| §5.2 Complex conjugation on the Heegner point selects the rational or the twisted part | conjugation eigensign | Conjugation selects rational or twisted rank-one component. |
| §5.3 Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin) | r=1 |  additive/CM branch; Source rank theorem not narrowed to one prime-part theorem. |
| §6.1 Analytic rank zero implies rank zero and finite Sha (Kolyvagin) | r=0 |  nonzero opposite twist derivative; Whole Sha finiteness descends, including two-primary part. |
| §6.2 The Beilinson–Kato route to finiteness in analytic rank zero | CM versus non-CM |  all primes; Integral Euler-system supplier includes separate CM argument. |
| §6.3 Kato's upper bound for the p-part of Sha in analytic rank zero | valuation bound versus equality | Finite upper bound is one-sided and source-qualified. |
| §6.4 Analytic rank at most one: rank equals analytic rank and Sha is finite | r=0,1 versus r=2 | Rank-two input rejected; finite whole Sha not exact cardinality. |
| §6.5 The Kato and Heegner routes in analytic rank zero compared | two proofs of finiteness | Route comparison does not create new exact prime parts. |
| §7.1 Positivity of the leading term in analytic rank at most one | r=0 and r=1 | Leading coefficient positivity uses appropriate value/height route. |
| §7.2 The Heegner index | free index one with torsion t | Finite index is t, free index one; rescaling point changes index. |
| §7.3 Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi) | definite versus indefinite parity |  modular degree; Geometric component multiplicity retained; integral comparison not assumed. |
| §7.4 Height of the Heegner point and the squared index | point doubled | Height and free-index square both multiply by four. |
| §7.5 Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one | r=1 |  regulator positivity; Quotient uses full real period and BSD regulator. |
| §7.6 Gross–Zagier's index conjecture as a form of BSD over K | Gross Conjecture 1.2 | Recorded equivalence is not an unconditional theorem. |
| §7.7 Kolyvagin's index bound as a one-sided p-part statement | exceptional two-primary factor | One-sided Kolyvagin bound retains source exceptions. |
| §7.8 The rational BSD defect | r=0 |  halved rank-one regulator; Defect positivity separate; halved regulator gives two; torsion wording fixed. |
| §7.9 Isogeny invariance of the rational BSD defect | 11a1 versus 11a3 | Period ratio and Tamagawa ratio compensate; torsion order is five for both. |
| §7.10 The p-part of BSD from an upper and a lower bound | upper/lower integer lengths | Matching inequalities yield equality; one inequality does not. |
| §8.1 The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW) | v=v̄ |  zero reciprocal image; Repeated primes rejected; actual class precedes reciprocity. |
| §8.2 The two explicit reciprocity laws for the BSTW zeta element | one class, two local maps | Both laws use common normalization, not classes defined by desired images. |
| §8.3 Signed Perrin–Riou and Greenberg main-conjecture comparison | ordinary proof versus signed branch | Signed proof and integral image/control obligations explicit. |
| §9.1 Anticyclotomic control at the trivial character (JSW Theorem 3.3.1) | nonzero augmentation |  local H⁰; Finite-level control includes finite local and Tamagawa factors. |
| §9.2 Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3) | p=3 with a_p=0 |  additive curve; Semistability and signed range retained. |
| §9.3 Higher-weight integral Kolyvagin bound | O ramified |  irreducible residual representation; Uniformizer-integral higher-weight/error-zero result is an additional proof target. |
| §9.4 The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6) | excluded height-one primes |  nonsplit q; Rational/pullback-prime exclusions kept until integral argument. |
| §9.5 Specialisation of the signed main conjecture in rank zero | L(E,1)=0 |  augmentation zero; Rank-zero specialization requires nonzero central value and images. |
| §9.6 The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction | C₁ versus C₂ |  exact imprimitive projection; Printed erratum defects not silently used; stronger FW contract retained. |
| §9.7 Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1) | p=3 |  E(ℚ_p)[p] nonzero; Corrected p>3 and local no-p-torsion hypotheses enforced. |
| §10.1 Specialising a cyclotomic main conjecture at the trivial character | augmentation zero |  exceptional zero; Torsion/control and nonvanishing needed before taking valuations. |
| §10.2 The p-part of BSD in rank zero at supersingular primes | p=3 with a_p≠0 | The supersingular boundary requires a_p=0 at three. |
| §10.3 A semistable curve with irreducible E[p] is residually ramified somewhere | semistable, residual irreducible | Reducible Eisenstein case is outside this ramification lemma. |
| §10.4 BSTW supersingular rank-one p-part | twist with additive prime outside ordinary support | Direct semistable BSTW rank-one route retained; unsupported twist rejected. |
| §10.5 The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner) | good ordinary versus multiplicative | Bad-prime local hypotheses and exceptional-zero factor retained. |
| §10.6 The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1) | ramified auxiliary q | Lower bound does not import unavailable unramified twist theorem. |
| §10.7 The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2) | Heegner free index versus full index | Upper bound includes geometric degree, height and torsion normalizations. |
| §10.8 The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′) | p=3 |  nonsplit q not residually ramified; Both cases fail corrected source hypotheses. |
| §10.9 The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan) | semistable good odd irreducible p | Original JSW range kept; not all exceptional primes. |
| §11.1 Ordinarity and local invariants at a good Eisenstein prime | φ=1 or ω locally | CGS local exclusion cannot be erased by semisimplification. |
| §11.2 Ordinary, Greenberg and unramified Eisenstein Selmer comparisons | finite Λ/(ϖ,T) | Same characteristic ideal need not give same finite-level control. |
| §11.3 Kriz congruence and analytic Iwasawa invariants | T versus T² | Kriz comparison uses squared analytic normalization and finite Euler terms. |
| §11.4 Heegner index and BDP ideal comparison | Heegner index ideal (T) | BDP/index-square ideal is (T²), not (T). |
| §11.5 Keller–Yin local character cohomology | θ=1 versus ω | O-cofree restriction kernel is Λ-torsion; rank-one local module need not be free. |
| §11.6 Keller–Yin trivial-character augmentation correction | trivial global character | Factor T adds one to λ and nothing to μ. |
| §11.7 Distinguished Wüthrich lattice and integral Kato input adapter | additive away from p |  split multiplicative at p; Wüthrich local semistability and augmentation factor retained. |
| §11.8 Primitive and imprimitive Euler factors | S empty |  Frobenius eigenvalue one at ℓ=2; Empty product one; Euler evaluation 1−γ/2 at odd p. |
| §11.9 Uniform near-trivial Kolyvagin bound | nontrivial near-trivial character | Uniform error retained; trivial character not inserted into punctured bound. |
| §11.10 Keller–Yin nonsplit residual lattice | original curve with rational p-torsion | Chosen invariant-free lattice differs; p-power transfer required. |
| §11.11 Integral Rankin functions and specialization normalization | nonunit Katz/congruence factor | Normalization preserves it; no arbitrary unit rescaling. |
| §11.12 CGLS residual extension and algebraic Iwasawa invariants | nonsplit residual extension | Connecting maps needed; semisimplification alone insufficient. |
| §11.13 Heegner divisibility including augmentation | augmentation prime T | Uniform bounds supply T-prime step, not localization away from T. |
| §11.14 Keller–Yin imprimitive residual Selmer comparison | globally trivial quotient | λ(X_f^S)+1 retained, including finite kernel correction. |
| §11.15 Beilinson–Flach class and two integral reciprocity laws | zero class |  nonzero two reciprocal images; Same actual KLZ class/lattice required; zero class fails. |
| §11.16 Congruent twists and integral characteristic series | congruence modulo p^m | Nonzero coefficients and congruence precision needed for invariant comparison. |
| §11.17 Keller–Yin uniform near-trivial bound | local 1/ω case | Representation-dependent errors retained; CGS exclusion not reintroduced. |
| §11.18 CGLS equality of anticyclotomic Iwasawa invariants | S Euler factors | Equal μ,λ uses matching primitive/imprimitive corrections. |
| §11.19 Keller–Yin finite Euler comparison | S empty |  quotient direction; Surjective local sequence gives char X^S = char X times Euler product. |
| §11.20 Keller–Yin integral Kolyvagin divisibility and lattice transfer | p-power lattice quotient | Integral Kolyvagin bound retains fixed transfer/error exponent. |
| §11.21 Nontrivial-twist rational Beilinson–Flach bound | α=1 | Nontrivial-twist BF bound cannot be used directly at trivial character. |
| §11.22 EisensteinBF.coleman_PR | wrong strict/relaxed prime | PR localization source and inverse action fixed. |
| §11.23 EisensteinBF.coleman_Gr | missing Katz normalization | Greenberg map includes rescaling and opposite localization. |
| §11.24 CGS anticyclotomic Greenberg main conjecture | μ=λ agreement alone | Actual divisibility plus invariant equality establishes ideal equality. |
| §11.25 Keller–Yin residual extension and corrected lambda formula | φ globally ω | λ(X_f)+1 on left; finite S factors subtracted consistently. |
| §11.26 Beilinson–Flach divisibility comparison | rational BF bound | Comparison retains both directions and coefficient-prime error. |
| §11.27 CGLS anticyclotomic prototype | Selmer corank two | CGLS prototype requires corank one and rationalized index consequence. |
| §11.28 CGS Heegner index-square equality | p-height-one prime | Integral CGS equality retains it and uses actual class line. |
| §11.29 Keller–Yin equality of analytic and algebraic invariants | global ω/trivial pair | Algebraic +1 cancels character correction +1; not dropped beforehand. |
| §11.30 Twisted control and augmentation comparison | global invariants zero, local invariants nonzero | Local H⁰ square persists; augmentation values nonzero. |
| §11.31 Keller–Yin anticyclotomic Greenberg main conjecture | original rational p-torsion | Integral Greenberg result uses chosen-lattice transfer, not invariant-free original curve. |
| §11.32 Integral twisted cyclotomic equality | positive cyclotomic μ |  zero augmentation; No cyclotomic μ=0 claimed; quotient needs unit augmentation. |
| §11.33 Keller–Yin Heegner index-square equality | Λ versus Λ[1/p] | Source ring discrepancy remains explicit integral-comparison gap. |
| §11.34 CGS integral cyclotomic main conjecture | positive cyclotomic μ | Integral equality does not require μ=0. |
| §11.35 Keller–Yin cyclotomic input transfer | local 1/ω lattice | Short KY substitution needs independent control and reciprocal-image adapter. |
| §11.36 Keller–Yin integral cyclotomic main conjecture | wider KY local range | Integral cyclotomic endpoint conditional on actual input transfer, not erased CGS hypotheses. |
| §12.1 CGLS rank-one anticyclotomic control | rank one with torsion corrections | Finite anticyclotomic control keeps local/torsion factors. |
| §12.2 Keller–Yin control with rational torsion | rational p-torsion nonzero | Source denominator retained; no torsion-free shortcut. |
| §12.3 Greenberg–Vatsal rank-zero prototype | trivial kernel character | Unramified even character fails Greenberg–Vatsal prototype. |
| §12.4 Rank-zero defect from integral cyclotomic equality | r=0 |  positive nonzero defect; Integral cyclotomic equality gives one prime part, not full BSD. |
| §12.5 Rank-one twist comparison with torsion | full index with torsion t | Twist comparison keeps t², periods and free regulator. |
| §12.6 CGLS rank-one Eisenstein BSD prototype | local characters 1/ω | CGLS narrower rank-one prototype rejects these. |
| §12.7 CGS good Eisenstein prime-part BSD | CGS local exclusion | Source-qualified good Eisenstein formula includes torsion square. |
| §12.8 Keller–Yin good Eisenstein prime-part BSD | KY allows rational p-torsion | Good odd p and actual integral-transfer route retained. |
| §13.1 Prime support of a rational number | q=6/35, zero, cancelling factors | Support includes denominator primes and uses reduced fraction. |
| §13.2 Zero valuation in the reduced numerator and denominator | q=0 |  divisibility by p; Nonzero numerator required for valuation/divisibility equivalence. |
| §13.3 Rational valuation with torsion square | q nonzero |  torsion t; Torsion contributes 2v_p(t); totalized zero excluded. |
| §13.4 Finite Selmer cardinality and Sha torsion | r=0/1 |  m=p^n; Selmer quotient divides by m^r and torsion quotient; exponent needed for whole p-part. |
| §13.5 Certified free lattice and saturation index | free index two |  torsion present; Regulator scales by four; unsaturated subgroup not accepted as basis. |
| §13.6 Local Tamagawa certificate adapter | nonsplit multiplicative reduction | Rational component order not geometric discriminant multiplicity. |
| §13.7 Exact local isogeny comparison | p-isogeny |  local indices; Exact comparison retains all differential/kernel/cokernel factors; locator corrected. |
| §13.8 Membership in rational prime support | q=0 versus nonzero | Zero has empty prime support; divisibility direction requires nonzero. |
| §13.9 Empty prime support and rational units of absolute value one | q=0 and −1 | Empty support gives 0 or ±1; positivity selects one. |
| §13.10 Finite certificate of rational prime-valuation vanishing | q=1,0,−1,2,1/4 | First three admit valuation certificates; last two cannot. |
| §13.11 Certified Sha annihilator and finite descent | finite Sha without exponent | Finiteness not effective annihilator; Gross exceptional factor retained. |
| §13.12 Prime valuation and exact support | q=1/4 |  dyadic valuation −2; Denominator support detected; sign alone irrelevant. |
| §13.13 Canonical certificate from all prime valuations | q=1,0,−1 | Canonical empty support construction has no positivity restriction. |
| §13.14 Exceptional-prime leading-term certificate adapter | p excluded from named source theorem | Exact arithmetic adapter required; rank-zero supplier layer fixed. |
| §13.15 Reconstruction of a positive rational from all prime valuations | q=0 and −1 | Strict positivity indispensable to all-prime reconstruction. |
| §13.16 A finite certificate controls every prime | p outside listed finite set | Coverage plus coprime reduced support gives zero valuation. |
| §13.17 Certificate from an exceptional-prime set and an outside theorem | q=1, S=empty versus {2,3} | Prescribed S retained even when nonminimal; outside theorem covers every other prime. |
| §13.18 Source-qualified fixed-prime dispatch | p=2, bad p, reducible residual case | Dispatch checks each theorem's full source range, otherwise explicit exception. |
| §13.19 Positive reconstruction from a finite certificate | q=1/4 |  incomplete certificate; No positive reconstruction without support cover. |
| §13.20 Transfer of a certified rational quotient to a real identity | B=0 | Nonzero denominator explicit; actual rational-real quotient identity required. |
| §13.21 Full leading term under the actual defect certificate | r=0 and r=1 |  actual defect; Conditional full identity needs rank, finite Sha, positivity and certificate. |
| §13.22 Individual full BSD from a finite exceptional set | exceptional set omits denominator prime | All outside primes required, not just sufficiently large primes. |
| §13.23 Full BSD for an explicitly certified family | curve without a family member certificate | No uniform full BSD inferred without pointwise certificate data. |
| §14.1 A prime defect is invisible at every other prime | q=p |  valuation at ℓ≠p; Zero at every other prime while v_p(p)=1. |
| §14.2 No complete certificate for a prime defect | q=p |  list excludes p; Support cover prevents complete certificate. |
| §14.3 The remaining dyadic equality under all odd-prime equalities | q=2 and 1/4 | Odd-prime equalities leave dyadic values 1 and −2. |
| §14.4 Concrete 32a2 Weierstrass model | coefficient −1 versus +1 | Δ=64, c₄=48, j=1728; rational dyadic variant explained. |
| §14.5 Central Mellin formulas with explicit tails | M=0 |  N>0; root signs; β>0, 0<ρ<1 keep both tails finite; derivative E₁ bound consistent. |
| §14.6 Five-isogeny and torsion-square comparison | 11a1 versus 11a3 | Ratios 1/5 versus 1/25 and Tamagawa 5 versus 1; torsion five. |
| §14.7 32a2 discriminant calculation | actual rational model | Exact invariant polynomial gives positive nonzero 64. |
| §14.8 Certified central values for the three fixtures | rounded central value | Intervals must replay exact coefficients and analytic tails; no floating certificate. |
| §14.9 32a2 ellipticity and affine point domain | characteristic two reduction versus ℚ | Δ nonzero over ℚ; dyadic bad fibre not confused with rational ellipticity. |
| §14.10 Rational five-torsion theorem-range test | p=5 with rational five-torsion | Irreducible-residual theorem unavailable; source-qualified alternative needed. |
| §14.11 Fixture periods, heights and regulator conventions | rank-zero determinant |  halved rank-one height; Reg_BSD one versus twice Tau height; periods use specified models. |
| §14.12 Rank equality comparison example | r=0 versus r=1 fixtures | Rank equality separate from prime-part and exact Sha claims. |
| §14.13 Whole Sha finiteness comparison example | whole Sha versus one primary component | All-prime finiteness separate from an exact-order certificate. |
| §14.14 Actual 32 fixture point | affine origin versus infinity | Nonsingular fixed-by-negation point doubles to zero; irrelevant 37 proof removed. |
| §14.15 Fixed prime BSD comparison example | 37a1 at p=3 with a₃=−3 | Does not satisfy supersingular a_p=0 source boundary. |
| §14.16 Order of the 32 fixture point | point32 nonzero with 2P=0 | Additive order exactly two; cyclic-four interpretation rejected; API fixed. |
| §14.17 CM and additive dyadic fixture | CM, conductor 32, c₂=2 | Additive dyadic model not semistable; exact CM classification remains supplier work. |
| §14.18 Finite descent and saturation for the three fixtures | 37 point versus saturated generator | 8P=(84/25,−52/125) proves nontorsion only; no saturation/Sha inference. |
| §14.19 Full BSD certificate comparison examples | certified exceptional prime data | Full fixture formula only after exact support and arithmetic replay. |
| §14.20 Missing exceptional prime regression | delete dyadic entry | Certificate fails for 32a2; odd equalities alone cannot finish. |

## Remaining obligations and acceptance boundary

All 15 input gaps survive in the roadmap. They concern original FH local prescriptions; exact dyadic periods/Tamagawa comparisons; Birch–Stephens; ramified Castella/BSTW twist support; integral modular degree/freeness; higher-weight Kolyvagin/error/Σ comparisons; the implicit signed BSTW proof; signed integral images/lattices/control; the elliptic-unit proof chain; source-specific Wüthrich/Heegner/KLZ/duality exports; exact annihilator/Selmer/saturation/local/isogeny arithmetic; replayable analytic enclosures; KY's index-square coefficient-ring discrepancy; KY's chosen-lattice cyclotomic transfer; and absent combined Lean arithmetic carriers. Each has a stated target or exact supplier extension. None is concealed by acceptance.

An effective Sha exponent cannot be extracted from finiteness alone. A finite Selmer calculation identifies only the tested torsion until an exponent is known. Infinite order of the 37a1 point does not certify saturation. Named prime-part theorems are not a full formula until positivity and complete numerator/denominator support coverage, including two, are certified. The full fixture examples are proof targets, not verified exact Sha outputs.

## Validation

The independent Lean check above passed. Both unchanged input packets pass `scripts/check_blueprint.py` with zero errors and warnings. `intake.py check-files` on all six package/review/handoff files passes with zero problems; `git diff --check` passes. The retained inventory is 153 targets in 15 layers, all named API entries survive, and the dependency reference audit found no missing/forward subsection. Only README.md, review.json, this report and this job's handoff changed; Suggested.lean and metadata.toml were checked and left unchanged.

## Public source receipts

All files below were fetched into temporary job scratch and accessed on 2026-10-13. No PDFs, extracted passages or page images enter the repository. Digests identify the bytes consulted; the audit tables above identify which passages were actually read, rather than claiming full-paper review.

| Public source | SHA-256 |
|---|---|
| [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) | `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c` |
| [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2) | `18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf` |
| [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2) | `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664` |
| [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |
| [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf) | `d1c1afe0e91cd43851918d6999481bbfa7a34ec8473a3817468f769a13783f38` |
| [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2) | `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90` |
| [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf) | `022659f0962bf5bca2d3b53f509f5b5ae518fdb98d165a738ebaa65367b222ee` |
| [Control theorems for Selmer groups of nearly ordinary deformations](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf) | `ed908e9b9c5facbf47acc326e51239d97f8dc03d3d52f7387a9851e5f5b178c1` |
| [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3) | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5` |
| [Kolyvagin’s work on modular elliptic curves](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf) | `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32` |
| [Hida, 2022 addendum](https://www.math.ucla.edu/~hida/Addendam.pdf) | `1eff02ca56c901d63612076b1a6e0116f83ee4d9c8b52f2c17b7798f7a440e25` |
| [Hida, Annals 172 (2010)](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf) | `1a97277068aefe67926966d2ad1bb254f115fb610e82391c0d3123b45c80b9f1` |
| [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf) | `5a6978afcb2fad9ce4b13a88f9a93ffb77c700082f383f0b6e20980b5e3f7e76` |
| [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1) | `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d` |
| [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2) | `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a` |
| [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/abs/math/0610694v1) | `42962ab1de00924170e7cc02f95a0ebb967ec979a76823298014eb8511243d04` |
| [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1) | `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988` |
| [Indivisibility of Heegner points in the multiplicative case](https://arxiv.org/abs/1407.1099v1) | `50123dc1fb271f610f02c8b38527873a8b382f346994074e7db8aae6a00f5412` |
| [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://ems.press/content/serial-article-files/26230?nt=1) | `8fc88f778138f495b24de8a16b5520af76446df610b0d46ad93776eb43a27db5` |
