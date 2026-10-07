# Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory

For an elliptic curve over ℚ, the Birch–Swinnerton-Dyer conjecture relates the order of vanishing of its L-function to its Mordell–Weil rank, and its first nonzero Taylor coefficient to periods, heights, torsion, Tamagawa numbers and the Tate–Shafarevich group. This roadmap proves the rank and whole-Sha finiteness statements in analytic rank zero and one. It then develops the separate, source-qualified prime-part formulas and a finite certificate method for assembling a full leading-term identity for an individual curve or an explicitly certified family.

The first prerequisite is Tau Ceti's [Elliptic curves](../../../content/tau-ceti/EllipticCurves/README.md). This is its Part II, as specified by [RS-30](../restructure/RS-30.result.json); the member ID `RankZeroOneBSD` and the twelve existing stage IDs are retained. General elliptic-curve foundations are imported from that roadmap, including its still-planned targets. The analytic-rank and leading-term notation below instantiates its Layer 7 BSD statement using the actual modular continuation. No all-prime leading-term formula for every curve of analytic rank at most one is asserted: omitted primes require certificates, and several source and arithmetic interfaces remain to be supplied.

## Scope and neighbouring roadmaps

The quadratic comparisons, nonvanishing argument, rational defect, source-qualified elliptic applications and certificate assembly belong here. The ownership boundaries follow the [Elliptic curves link map](../links/tauceti_TauCetiRoadmap_EllipticCurves.json) and RS-30. A supplier's mathematical contract is distinct from a claim that the supplier is implemented.

| Supplier or consumer | Interface and boundary |
| --- | --- |
| [Elliptic curves](../../../content/tau-ceti/EllipticCurves/README.md), Layers 1–7 | Import equation-level isogenies and differentials, torsion and Tate modules, Frobenius traces, local reduction and Tate's algorithm, the quadratic twist and point equivalence, Mordell–Weil and its height lattice, actual Selmer/Sha and Kummer sequences, the full real period and arithmetic BSD quotient, and Cassels' isogeny comparison. This roadmap owns their quadratic comparisons and elliptic BSD applications. |
| [Elliptic-curve modularity](../../../content/campaign/EllipticCurveModularity/README.md), R29.3–R29.6; [Modular forms](../../../content/tau-ceti/ModularForms/README.md), Layers 6–7 | Import the rational coefficient field, exact conductor, curve/newform L-function equality, entire continuation, functional equation and correctly normalized Fricke operator. BSD.0 specializes these, rather than proving modularity or rebuilding modular L-functions. |
| [Gross–Zagier and arithmetic heights](../../../content/campaign/GrossZagierAndArithmeticHeights/README.md), GZ.0, GZ.3, GZ.5, GZ.8–GZ.9 | Import the source height/period dictionary, modular parametrizations and Gross–Zagier height theorem. The rational/twisted eigenspace applications, Heegner index and defect belong here. |
| [Heegner-point Euler systems](../../../content/campaign/HeegnerPointEulerSystems/README.md), HE.1, HE.6–HE.8 | Import actual Heegner classes, Kolyvagin descent, local conditions and control. BSD.7a proves its Eisenstein comparisons independently of the downstream HE.8b equality, which is a consumer. The definite congruence-period export needs an early stage to avoid the HE.6 cycle. |
| [Kato Euler systems](../../../content/campaign/KatoEulerSystems/README.md) | Import Beilinson–Kato classes and their ordinary reciprocity/bounds. The requested all-prime/CM finiteness and integral distinguished-lattice interfaces exceed the current L4 contract. Ordinary BSTW zeta/reciprocity/comparison inputs are routed to the proposed early Kato L5 owner; the signed construction and elliptic BSD specialization remain here. |
| [Metaplectic automorphic forms](../../../content/campaign/MetaplecticAutomorphicForms/README.md), MP.7–MP.8 | Import the multiple Dirichlet-series analysis. BSD.2 owns the BFH residue, cancellation and nonvanishing application, and the source-qualified auxiliary-field selection. |
| [Selmer–Iwasawa cohomology](../../../content/campaign/SelmerIwasawaCohomology/README.md); [arithmetic Galois duality](../../../content/campaign/ArithmeticGaloisDuality/README.md); [Euler and Kolyvagin systems](../../../content/campaign/EulerSystemsAndKolyvaginSystems/README.md) | Import continuous compact/discrete cohomology, exact localization maps, Poitou–Tate, characteristic ideals and integral descent. Generic theory stays there; source-specific local conditions, error terms and comparisons are retained here. |
| [Automorphic p-adic L-functions](../../../content/campaign/AutomorphicPadicLFunctions/README.md); [p-adic Hodge regulators](../../../content/campaign/PadicHodgeRegulators/README.md); [p-adic families](../../../content/campaign/PadicFamilies/README.md); [automorphic congruences](../../../content/campaign/AutomorphicCongruences/README.md) | Import Katz/BDP/Rankin constructions, actual Coleman/logarithm maps, CM-family regulators and congruences. A Katz construction alone does not supply the imaginary-quadratic elliptic-unit main conjecture. Signed and higher-weight arithmetic refinements remain explicit gaps. |
| [Modular Iwasawa main conjectures](../../../content/campaign/ModularIwasawaMainConjectures/README.md) | Import the independently owned irreducible ordinary inputs. Its L6 is a consumer of BSD.7a's Eisenstein proof, not an input that proves that same equality. |
| [Néron models](../../../content/campaign/NeronModelsAndSemistableAbelianVarieties/README.md); [GL₂ representations and transfer](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md) | Import scheme/Weierstrass comparisons, character groups, modular-degree interfaces and local epsilon factors. BSD.1 owns the base-change corrections; BSD.5 owns the specialized definite period/degree comparison. |
| [Modular symbols and p-adic L-functions](../../../content/campaign/ModularSymbolsPadicLFunctions/README.md); [computational number theory](../../../content/campaign/ComputationalNumberTheory/README.md) | Import exact modular-symbol periods, finite computations and validated elementary real-function intervals. BSD.8 owns certificate adapters and BSD.9 the curve-specific Mellin and replay arguments. |
| [Periods, motivic L-values and special-value conjectures](../../../content/campaign/PeriodsAndSpecialValues/README.md), PS.6 | Consumes the source-qualified BSD formulas; it does not supply their arithmetic proof. |

## Conventions

Write E for an actual nonsingular Weierstrass curve over ℚ and Eᴷ for its existing quadratic twist by a quadratic field K. Points are the existing affine point group with its nonsingularity witness. Conductor N, reduction type, minimal differential, torsion, periods, height lattice and Sha refer to this curve, not to independent data chosen to make an identity hold. Local quantities for Eᴷ must be recomputed at ramified primes; coprime-conductor formulas apply only when their stated coprimality hypotheses hold.

The notation L(E,s) means the unique entire continuation agreeing with Mathlib's Euler-product L-function on a common connected convergence domain, imported through R29.6 and Tau Ceti's entire-extension interface. Mathlib's raw summation convention for an unsummable Dirichlet series does not provide this continuation. The completed function is the entire extension of N^(s/2) Γℂ(s)L(E,s), initially on Re(s)>0, where Γℂ(s)=2(2π)^(−s)Γ(s). Its definition is not a pointwise Gamma product at Gamma poles. The functional equation has centre 1; the unitary shift has centre 1/2. The analytic rank r is the finite order at 1 and L*(E,1)=L^(r)(E,1)/r!. Nonvanishing at 2 excludes the identically zero continuation.

Ω_E is the full real period of the minimal differential: Ω_E=c∞(E)Ω_E⁺, with the real-component factor included once. At the pinned Tau Ceti commit the pairing is half the BSD pairing, so Reg_BSD=2^r Reg_Tau. Rank zero has regulator 1. Absolute and relative heights over K differ by [K:ℚ]; GZ.0 supplies the dictionary before a determinant or Heegner height is identified. In rank one the free Heegner index I_free gives height I_free² Reg_BSD; the full point-group index is I_full=I_free·#E(K)_tors.

With rank at most one and whole-Sha finiteness established, set

\[
 d(E)=\frac{L^*(E,1)\,\#E(\mathbf Q)_{\rm tors}^{,2}}
 {\Omega_E\,\operatorname{Reg}_{\rm BSD}(E)\,\#\Sha(E/\mathbf Q)\,\prod_\ell c_\ell(E)}\in\mathbf Q_{>0}.
\]

The p-part formula means ord_p d(E)=0. The full formula means d(E)=1. These are distinct targets from rank equality and whole-Sha finiteness. Positivity is essential: Mathlib assigns valuation zero to zero, and every prime valuation also vanishes at −1. Odd-primary quadratic splitting follows from restriction, corestriction and the twist maps. Their combined integral compositions are multiplication by 2, not 1+conjugation; two-primary, minimal-differential and period-lattice factors remain visible. The defect over K gives a sum of the two rational defect valuations at odd p. One summand can be discarded only after its vanishing has been proved.

Each prime branch retains the hypotheses of its own source. The ordinary irreducible rank-zero branch includes residual ramification at a multiplicative prime away from p. JSW's rank-one branch is globally semistable, p≥3 of good reduction and irreducible; at a supersingular p=3 it requires a₃=0. Its current BSTW proof input has a narrower semistable, coprime ordinary-support twist range, which does not repair every auxiliary twist in the original JSW argument. Castella's multiplicative branch uses corrected Theorem A′: p>3, irreducible E[p], a nonsplit multiplicative q≠p with residual ramification, and E(ℚ_p)[p]=0. Global semistability is not imposed on that corrected branch. The good Eisenstein CGS branch fixes the actual isogeny-kernel character and excludes local characters 1 and ω; KY treats these omitted good odd-prime cases, including rational p-torsion, by a separate proof. Neither good Eisenstein branch certifies a bad-prime formula.

An Iwasawa local condition is specified by its actual localization map and coefficient module. JSW's BDP strict/relaxed package and CGS's Greenberg package are not identified by their labels. Finite imprimitive sets exclude the two p-adic primes and infinity. Euler polynomials use inertia coinvariants and arithmetic Frobenius evaluated at ℓ⁻¹γ; inverse module actions are tracked separately. KY's trivial local restriction kernel is O-cofree of rank one, with Λ-dual rank zero; it is not Λ-free of rank one. Its ω-local dual has rank one, projective dimension at most one and two generators, with no finite submodule; the global ω-module can have a finite term. Integral chosen/geometric/distinguished lattices retain the p^(t+N) corrections. Equality of μ and λ requires a divisibility/containment before characteristic-ideal equality follows. The KY IMC1 coefficient-ring ambiguity is retained at the weaker rationalized class-line level, separately from integral IMC2.

BSTW's signed reciprocity laws use Col_v and Log_v̄ at different fixed primes. Ordinary zeta elements and ordinary reciprocity are supplier inputs. The Beilinson–Flach class is an independently constructed class satisfying two independent reciprocity laws, not a preimage defined by its desired images. Integral cyclotomic descent uses the distinguished Wüthrich lattice, congruences and control to remove p-denominators; a potentially positive cyclotomic μ cannot be assumed zero.

A finite prime certificate for a rational q stores an explicit finite set, primality, coverage of the numerator/denominator prime support and local valuation-zero proofs. It stores neither q=1 nor positivity. For positive q, soundness proves q=1. In an elliptic application BSD.5 supplies positivity and the equality between the rational defect and the real leading-term quotient. A finite Selmer computation certifies only Sha torsion unless an annihilator or whole-Sha argument is also supplied. Saturation certificates refer to the free Mordell–Weil lattice and its exact index.

## Layer overview

The displayed order is the mathematical exposition order. Sub-layers BSD.6a and BSD.7a supply proofs for the preceding prime-part endpoints; individual prerequisites below identify the actual producer. Moving an independent export earlier requires the structural decisions recorded in the handoff, rather than treating a coarse stage cycle as a proof.

| Layer | Objects and targets |
| --- | --- |
| BSD.0 | Actual analytic continuation, completed function, rank and leading term; quadratic characters, local twist factors, root numbers and base-change factorization. |
| BSD.1 | Integral point maps and rank splitting; regulator, torsion, Selmer/Sha, Tamagawa and period comparisons over a quadratic field. |
| BSD.2 | BFH residue and nonvanishing; source-qualified prescribed local conditions and Heegner/auxiliary-field selection. |
| BSD.3 | Non-torsion Heegner points, conjugation eigenspaces, rank one and whole-Sha finiteness. |
| BSD.4 | Rank zero by the Heegner and Kato routes; all-curve rank equality and whole-Sha finiteness in analytic rank at most one. |
| BSD.5 | Positive rational defect, Heegner indices and squared-height formula, Gross–Zagier index, definite congruence periods and modular-degree comparison. |
| BSD.6 | Irreducible ordinary, multiplicative and supersingular rank-zero/one p-part formulas under their exact hypotheses. |
| BSD.6a | Anticyclotomic control/divisibility, signed BSTW class and comparison, corrected Castella and higher-weight proof inputs. |
| BSD.7 | Good Eisenstein prime-part formulas with separate CGLS, CGS and KY control and twist comparisons. |
| BSD.7a | Their independent integral anticyclotomic and cyclotomic proofs, character/lattice corrections, Kolyvagin bounds and Beilinson–Flach reciprocity. |
| BSD.8 | Rational support and finite certificates; actual Selmer, annihilator, saturation, local and isogeny adapters; individual/family full leading terms conditional on complete certificates. |
| BSD.9 | Concrete 11a3, 37a1 and 32a2 models/points, rigorous analytic and arithmetic fixtures, theorem-range tests and omitted-prime regressions. |

The declaration chapters state the full hypotheses, proof route, supplier inputs, API, unit tests and acceptance conditions. Their proof outlines are a plan, not formalized theorems. Stage coverage and unresolved contracts are summarized after the chapters; the [assembly handoff](../handoff/ASM-RankZeroOneBSD.md) collects the supplier requests and structural work.

## Sources and exact library baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The source catalogue below preserves each part’s version and reading scope. Source-specific locators accompany every declaration. The catalogue includes the earlier JSW and Castella statements, their published versions, Castella’s erratum and the current BSTW replacement; these are not interchangeable theorem ranges. CGS and KY are cited at the recorded preprint versions, without an inferred publication status. Proofs not acquired, and source passages insufficient for a claimed extension, remain in the limitations list.

<a id="source-jsw"></a>

### jsw: The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one

Dimitar Jetchev, Christopher Skinner and Xin Wan. arXiv:1512.06894v1 (2015); published in Cambridge Journal of Mathematics 5 (2017), no. 3, 369–434. [Source](https://arxiv.org/abs/1512.06894v1).

Recorded reading scope:

- §1 (Conjecture 1.1.1, Theorem 1.2.1, outline)
- §7 complete (Conjecture 7.1.1, Theorem 7.2.1, §7.3 Tamagawa and period comparisons, §7.4 final argument and remarks)

Version digest: `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d`.

<a id="source-skinner-mult"></a>

### skinner-mult: Multiplicative reduction and the cyclotomic main conjecture for GL2

Christopher Skinner. arXiv:1407.1093v1 (2014); published in Pacific Journal of Mathematics 283 (2016), no. 1, 171–200. [Source](https://arxiv.org/abs/1407.1093v1).

Recorded reading scope:

- §1 (Theorems A, B, C and the outline)
- §3.1 proof of Theorem A
- §3.2 proof of Theorem B (control at γ − 1, local terms at p)

Version digest: `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988`.

<a id="source-castella-cjm"></a>

### castella-cjm: On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes

Francesc Castella. arXiv:1704.06608v2; published in Cambridge Journal of Mathematics 6 (2018), no. 1, 1–23. [Source](https://arxiv.org/abs/1704.06608v2).

Recorded reading scope:

- §1 (Theorem A, statement and strategy)
- §5 (proof of Theorem A from the anticyclotomic main conjecture)

Version digest: `23e3ab4e9d99ceba88d3aaf0fa0612b60ac728086f82555f951f4e1853323081`.

<a id="source-castella-erratum"></a>

### castella-erratum: Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”

Francesc Castella. Author's homepage erratum (2024), 5 pages. [Source](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf).

Recorded reading scope:

- complete: §1 Theorem 1.1, Theorem A′ and remarks; §2 Lemmas 2.1–2.2, Theorem 2.3 and the proof of Theorem 1.1

Version digest: `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf`.

<a id="source-bstw"></a>

### bstw: Zeta elements for elliptic curves and applications

Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan. arXiv:2409.01350v2 (11 September 2024). [Source](https://arxiv.org/abs/2409.01350v2).

Recorded reading scope:

- §1 (Theorems 1.1–1.5, Theorem 1.14, Remark 1.4 and the outline of §§3–10)
- §9.3.2, Proposition9.18 and proof pp.83–84; Theorem1.14 p.7 and Proposition1.19 p.8

Version digest: `18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf`.

<a id="source-bfh90"></a>

### bfh90: Nonvanishing theorems for L-functions of modular forms and their derivatives

Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein. Inventiones Mathematicae 102 (1990), 543–618 (GDZ scan). [Source](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf).

Recorded reading scope:

- §0 Introduction and Theorem, pp. 543–544 (read from the page images); the analytic sections are planned by MetaplecticAutomorphicForms MP.8
- §9 complete, printed pp.614–617, read visually in the scan

Version digest: `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`.

<a id="source-burungale-tian"></a>

### burungale-tian: A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin

Ashay A. Burungale and Ye Tian. arXiv:2506.03465v2 (October 2025); Annals of Mathematics 203 (2026), no. 1. [Source](https://arxiv.org/abs/2506.03465v2).

Recorded reading scope:

- §1 (Theorems 1.1–1.2 and footnote 2)

Version digest: `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.

<a id="source-skinner-zhang"></a>

### skinner-zhang: Indivisibility of Heegner points in the multiplicative case

Christopher Skinner and Wei Zhang. arXiv:1407.1099v1 (2014). [Source](https://arxiv.org/abs/1407.1099v1).

Recorded reading scope:

- §9.1 (Lemma 9.1, Corollary 9.2, Lemma 9.3)
- §9.2 (canonical periods, Lemmas 9.5–9.6)

Version digest: `50123dc1fb271f610f02c8b38527873a8b382f346994074e7db8aae6a00f5412`.

<a id="source-kato"></a>

### kato: p-adic Hodge theory and values of zeta functions of modular forms

Kazuya Kato. Astérisque 295 (2004), 117–290 (Numdam). [Source](https://www.numdam.org/item/AST_2004__295__117_0.pdf).

Recorded reading scope:

- §14 (Theorem 14.2 and Corollary 14.3)
- Printed p.235, Theorem14.2(2), including its CM reference to §15

Version digest: `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.

<a id="source-pollack-weston"></a>

### pollack-weston: On anticyclotomic μ-invariants of modular forms

Robert Pollack and Tom Weston. arXiv:math/0610694v1; published in Compositio Mathematica 147 (2011). [Source](https://arxiv.org/abs/math/0610694v1).

Recorded reading scope:

- §1 (formula (1))
- §6 (character groups, Theorem 6.2, Propositions 6.3–6.5, formula (12))

Version digest: `42962ab1de00924170e7cc02f95a0ebb967ec979a76823298014eb8511243d04`.

<a id="source-gross-zagier-86"></a>

### gross-zagier-86: Heegner points and derivatives of L-series

Benedict H. Gross and Don B. Zagier. Inventiones Mathematicae 84 (1986), 225–320 (GDZ scan). [Source](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf).

Recorded reading scope:

- Chapter V §2, pp. 311–312 (Theorem (2.1), (2.2) Conjecture and (2.3), examples N = 11 and N = 65), through the verified extraction PAPER-GROSS-ZAGIER-86 and the excerpts verified by GrossZagierAndArithmeticHeights GZ.8

Version digest: `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`.

<a id="source-gross-kolyvagin"></a>

### gross-kolyvagin: Kolyvagin's work on modular elliptic curves

Benedict H. Gross. L-functions and Arithmetic (Durham, 1989), LMS Lecture Note Series 153 (1991), 235–256. [Source](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf).

Recorded reading scope:

- §1, p. 236 (Conjecture 1.2, Theorem 1.3, the example X₀(37)/w₃₇) and §2, p. 237, read from the page images
- Proposition 5.4 through the excerpts verified by HeegnerPointEulerSystems HE.0
- Proposition5.3, printed p.243, read directly from page image

Version digest: `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`.

<a id="source-tauceti-entire"></a>

### tauceti-entire: TauCeti/NumberTheory/LSeries/EntireExtension.lean

Chris Birkbeck (Tau Ceti). Tau Ceti at f790474. [Source](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/EntireExtension.lean).

Recorded reading scope:

- complete

<a id="source-tauceti-twist"></a>

### tauceti-twist: TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean

Tau Ceti contributors. Tau Ceti at f790474. [Source](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean).

Recorded reading scope:

- complete

<a id="source-mathlib-lfunction"></a>

### mathlib-lfunction: Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean

Thomas Browning (Mathlib). Mathlib at 082e2d3. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean).

Recorded reading scope:

- complete

<a id="source-mathlib-order"></a>

### mathlib-order: Mathlib/Analysis/Analytic/Order.lean

Mathlib contributors. Mathlib at 082e2d3. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean).

Recorded reading scope:

- definitions of analyticOrderAt and analyticOrderNatAt, analyticOrderAt_eq_zero, AnalyticAt.analyticOrderAt_ne_top

<a id="source-tauceti-modularforms-roadmap"></a>

### tauceti-modularforms-roadmap: Roadmap: modular forms (Tau Ceti), Layers 6–7

Tau Ceti contributors. content/tau-ceti/ModularForms/README.md in this repository. [Source](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md).

Recorded reading scope:

- Layer 6 (Atkin–Lehner and Fricke operators)
- Layer 7 (L-functions)

<a id="source-jsw-published"></a>

### jsw-published: The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one

Jetchev, Skinner and Wan. Cambridge J. Math.5 (2017),369–434. [Source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf).

Recorded reading scope:

- §§2.3–3.5,6.1.6,7.2–7.4; printed p.427 misprint

Version digest: `5a6978afcb2fad9ce4b13a88f9a93ffb77c700082f383f0b6e20980b5e3f7e76`.

<a id="source-castella-published"></a>

### castella-published: On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes

Francesc Castella. Cambridge J. Math.6 (2018),1–23. [Source](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf).

Recorded reading scope:

- Theorem A and §5, compared with the author erratum

Version digest: `737d615e79aa78ce30afdf8c7a6ed7fc76640c853769b8f36e364efdbc759ac5`.

<a id="source-cgs-v2"></a>

### cgs-v2: Mazur’s main conjecture at Eisenstein primes

Castella, Grossi and Skinner. arXiv:2303.04373v2. [Source](https://arxiv.org/abs/2303.04373v2).

Recorded reading scope:

- Proposition2.4.5; §6 opening,Theorems6.1.1,6.5.1

Version digest: `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`.

<a id="source-mathlib-padic"></a>

### mathlib-padic: p-adic Valuation

Mathlib contributors. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean).

Recorded reading scope:

- padicValInt and padicValRat definitions
- padicValRat zero/one/neg/of_nat/self
- dvd_iff_padicValNat_ne_zero
- Rat.num_or_den_zero_padicVal

<a id="source-mathlib-prime-fin"></a>

### mathlib-prime-fin: Prime numbers: finite sets of factors

Mathlib contributors. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean).

Recorded reading scope:

- primeFactors through primeFactors_eq_empty; lines 35-90

<a id="source-mathlib-prime-basic"></a>

### mathlib-prime-basic: Prime numbers

Mathlib contributors. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean).

Recorded reading scope:

- Nat.Prime.dvd_iff_eq
- Nat.forall_prime_iff_two_and_odd

<a id="source-roadmap"></a>

### roadmap: Rank-zero and rank-one Birch-Swinnerton-Dyer theory

Tau Ceti Atlas contributors. Repository source blob 039d9b3c1977e929ae2076f76f3ec8ced8a7503a. [Source](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md).

Recorded reading scope:

- Introduction and ownership boundary
- BSD.5
- BSD.7, BSD.7a, BSD.8, BSD.9
- Source and review contracts

<a id="source-cgs"></a>

### cgs: Mazur's main conjecture at Eisenstein primes

Francesc Castella, Giada Grossi, Christopher Skinner. arXiv:2303.04373v2, 15 October 2025; version actually read. [Source](https://arxiv.org/pdf/2303.04373v2).

Recorded reading scope:

- Introduction Theorems A–D and §1.2 proof of D
- §§2–4 definitions, congruences, control, Beilinson–Flach reciprocity and comparison
- §6.1 uniform bound, §§6.2–6.4 Selmer structures and proof
- §6.5 anticyclotomic equalities
- §7.2 three-step integral cyclotomic descent

Version digest: `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`.

<a id="source-ky"></a>

### ky: On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction

Timo Keller, Mulun Yin. arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version. [Source](https://arxiv.org/pdf/2402.12781v2).

Recorded reading scope:

- Introduction A–C
- §§1.1–1.5 local and global character Selmer groups, residual extensions, λ corrections
- §2.2 analytic congruence and trivial-character correction
- §3.0 integral Kolyvagin bound, lattice comparison, IMC1/IMC2 and cyclotomic corollary
- §4.2 elliptic BSD including torsion
- Appendix B B.0.1–B.0.2 and final elliptic specialization

Version digest: `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a`.

<a id="source-cgls"></a>

### cgls: On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes

Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner. Inventiones mathematicae 227 (2022), 517–580; published author PDF. [Source](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf).

Recorded reading scope:

- §§1.2–1.5 character modules and algebraic comparison
- §2.2 Kriz congruence and invariant equality
- §§3.2–3.4 error-controlled bounds as used by CGS
- §§4.1–4.2 anticyclotomic prototype and (Sel) dependence
- §5.1 control and Greenberg–Vatsal
- §5.3 rank-one formula, (5.7) and height/index normalization

Version digest: `d1c1afe0e91cd43851918d6999481bbfa7a34ec8473a3817468f769a13783f38`.

<a id="source-wuthrich"></a>

### wuthrich: On the integrality of modular symbols and Kato’s Euler system for elliptic curves

Christian Wüthrich. Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450. [Source](https://ems.press/content/serial-article-files/26230?nt=1).

Recorded reading scope:

- Theorems 3,4 and Proposition 8 distinguished lattice
- §3.2 including nonfree cohomology example 11a3
- Theorem 13 integral zeta element
- Theorem 16, Lemma 17, proof using Ferrero–Washington, Corollary 18

Version digest: `8fc88f778138f495b24de8a16b5520af76446df610b0d46ad93776eb43a27db5`.

<a id="source-gross"></a>

### gross: Kolyvagin’s work on modular elliptic curves

Benedict H. Gross. L-functions and Arithmetic (Durham 1989), Cambridge University Press 1991, pp.235–256; scanned printed text. [Source](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf).

Recorded reading scope:

- Printed pp.235–239 inspected as images (scan has no extractable text)
- p.236 equation of X₀(37)/w₃₇ and P=(0,0)
- Theorem 1.3 and its exceptional power of 2; Conjecture 1.2 kept conjectural

Version digest: `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`.

<a id="source-cremona2"></a>

### cremona2: Algorithms for Modular Elliptic Curves: chapter2

John E. Cremona. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/chapter2.pdf).

Recorded reading scope:

- §2.8 Mellin transform and sign conventions
- §2.12 convergent central-value sum
- §2.13 Proposition 2.13.1 and exponential integral

Version digest: `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`.

<a id="source-cremona3"></a>

### cremona3: Algorithms for Modular Elliptic Curves: chapter3

John E. Cremona. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/chapter3.pdf).

Recorded reading scope:

- §3.2 Tate algorithm and local invariants
- §3.3 torsion and reduction injectivity
- §3.5 saturation and canonical-height index
- §3.6 rank/descent and 2-Selmer exact sequence

Version digest: `c4843b80ae1b6b91795b9952d782912542dd8d6b17c1940cd1a881fa6fdd9c26`.

<a id="source-cremona-examples"></a>

### cremona-examples: Algorithms for Modular Elliptic Curves: examples

John E. Cremona. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/examples.pdf).

Recorded reading scope:

- N=11 modular-symbol ratio for the optimal curve and its period lattice
- N=37 newform and derivative; numerical output used only as target selection

Version digest: `20a4118e6cd82e9d9adc59070fa039594f09888f26a1259e1ebe18426484878c`.

<a id="source-cremona-table1"></a>

### cremona-table1: Algorithms for Modular Elliptic Curves: Table 1

John E. Cremona. Second edition (1997), corrected author online edition; rows are acceptance data, not proofs. [Source](https://johncremona.github.io/book/fulltext/table1.pdf).

Recorded reading scope:

- Printed pp.109–112: 11a3, 19a3, 26b1, 26b2, 32a2, 37a1 models and invariants

Version digest: `022659f0962bf5bca2d3b53f509f5b5ae518fdb98d165a738ebaa65367b222ee`.

<a id="source-cremona-table4"></a>

### cremona-table4: Algorithms for Modular Elliptic Curves: Table 4

John E. Cremona. Second edition (1997), corrected author online edition; numerical/analytic Sha entries are not proofs. [Source](https://johncremona.github.io/book/fulltext/table4.pdf).

Recorded reading scope:

- First table page: 11,19,26B,32,37A central values/derivative and exact modular-symbol ratios; E6 checks rank-zero 19A and 26B

Version digest: `7b575b5438e7eceab80b78ecbe70bc2322e361f9d5d1f09713b58f83d8081610`.

### Version receipts

The packets additionally record these version receipts; reading dates and scopes belong to the original source audits. This assembly does not extend their reading claims.

- [preprint](https://arxiv.org/abs/1512.06894v1); preprint; read 2026-10-06. Digest `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d`.
- [preprint](https://arxiv.org/abs/1407.1093v1); preprint; read 2026-10-06. Digest `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988`.
- [preprint](https://arxiv.org/abs/1704.06608v2); preprint; read 2026-10-06. Digest `23e3ab4e9d99ceba88d3aaf0fa0612b60ac728086f82555f951f4e1853323081`.
- [author copy](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf); author copy; read 2026-10-06. Digest `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf`.
- [preprint](https://arxiv.org/abs/2409.01350v2); preprint; read 2026-10-06. Digest `18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf`.
- [published](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf); published; read 2026-10-06. Digest `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`.
- [published](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf); published; read 2026-10-06. Digest `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`.
- [preprint](https://arxiv.org/abs/2506.03465v2); preprint; read 2026-10-06. Digest `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.
- [preprint](https://arxiv.org/abs/1407.1099v1); preprint; read 2026-10-06. Digest `50123dc1fb271f610f02c8b38527873a8b382f346994074e7db8aae6a00f5412`.
- [published](https://www.numdam.org/item/AST_2004__295__117_0.pdf); published; read 2026-10-06. Digest `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- [preprint](https://arxiv.org/abs/math/0610694v1); preprint; read 2026-10-06. Digest `42962ab1de00924170e7cc02f95a0ebb967ec979a76823298014eb8511243d04`.
- [published](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf); published; read 2026-10-06. Digest `5a6978afcb2fad9ce4b13a88f9a93ffb77c700082f383f0b6e20980b5e3f7e76`.
- [published](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf); published; read 2026-10-06. Digest `737d615e79aa78ce30afdf8c7a6ed7fc76640c853769b8f36e364efdbc759ac5`.
- [preprint](https://arxiv.org/abs/2303.04373v2); preprint; read 2026-10-06. Digest `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`.
- [published](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf); published; read 2026-10-06. Digest `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`.
- [Mazur's main conjecture at Eisenstein primes — arXiv:2303.04373v2, 15 October 2025; version actually read](https://arxiv.org/pdf/2303.04373v2); preprint; read 2026-10-06. Digest `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`. Scope: Introduction Theorems A–D and §1.2 proof of D; §§2–4 definitions, congruences, control, Beilinson–Flach reciprocity and comparison; §6.1 uniform bound, §§6.2–6.4 Selmer structures and proof; §6.5 anticyclotomic equalities; §7.2 three-step integral cyclotomic descent.
- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction — arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version](https://arxiv.org/pdf/2402.12781v2); preprint; read 2026-10-06. Digest `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a`. Scope: Introduction A–C; §§1.1–1.5 local and global character Selmer groups, residual extensions, λ corrections; §2.2 analytic congruence and trivial-character correction; §3.0 integral Kolyvagin bound, lattice comparison, IMC1/IMC2 and cyclotomic corollary; §4.2 elliptic BSD including torsion; Appendix B B.0.1–B.0.2 and final elliptic specialization.
- [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes — Inventiones mathematicae 227 (2022), 517–580; published author PDF](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf); published; read 2026-10-06. Digest `d1c1afe0e91cd43851918d6999481bbfa7a34ec8473a3817468f769a13783f38`. Scope: §§1.2–1.5 character modules and algebraic comparison; §2.2 Kriz congruence and invariant equality; §§3.2–3.4 error-controlled bounds as used by CGS; §§4.1–4.2 anticyclotomic prototype and (Sel) dependence; §5.1 control and Greenberg–Vatsal; §5.3 rank-one formula, (5.7) and height/index normalization.
- [On the integrality of modular symbols and Kato’s Euler system for elliptic curves — Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450](https://ems.press/content/serial-article-files/26230?nt=1); published; read 2026-10-06. Digest `8fc88f778138f495b24de8a16b5520af76446df610b0d46ad93776eb43a27db5`. Scope: Theorems 3,4 and Proposition 8 distinguished lattice; §3.2 including nonfree cohomology example 11a3; Theorem 13 integral zeta element; Theorem 16, Lemma 17, proof using Ferrero–Washington, Corollary 18.
- [Kolyvagin’s work on modular elliptic curves — L-functions and Arithmetic (Durham 1989), Cambridge University Press 1991, pp.235–256; scanned printed text](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf); published; read 2026-10-06. Digest `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`. Scope: Printed pp.235–239 inspected as images (scan has no extractable text); p.236 equation of X₀(37)/w₃₇ and P=(0,0); Theorem 1.3 and its exceptional power of 2; Conjecture 1.2 kept conjectural.
- [Algorithms for Modular Elliptic Curves: chapter2 — Second edition (1997), corrected author online edition](https://johncremona.github.io/book/fulltext/chapter2.pdf); author copy; read 2026-10-06. Digest `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`. Scope: §2.8 Mellin transform and sign conventions; §2.12 convergent central-value sum; §2.13 Proposition 2.13.1 and exponential integral.
- [Algorithms for Modular Elliptic Curves: chapter3 — Second edition (1997), corrected author online edition](https://johncremona.github.io/book/fulltext/chapter3.pdf); author copy; read 2026-10-06. Digest `c4843b80ae1b6b91795b9952d782912542dd8d6b17c1940cd1a881fa6fdd9c26`. Scope: §3.2 Tate algorithm and local invariants; §3.3 torsion and reduction injectivity; §3.5 saturation and canonical-height index; §3.6 rank/descent and 2-Selmer exact sequence.
- [Algorithms for Modular Elliptic Curves: examples — Second edition (1997), corrected author online edition](https://johncremona.github.io/book/fulltext/examples.pdf); author copy; read 2026-10-06. Digest `20a4118e6cd82e9d9adc59070fa039594f09888f26a1259e1ebe18426484878c`. Scope: N=11 modular-symbol ratio for the optimal curve and its period lattice; N=37 newform and derivative; numerical output used only as target selection.
- [Algorithms for Modular Elliptic Curves: Table 1 — Second edition (1997), corrected author online edition; rows are acceptance data, not proofs](https://johncremona.github.io/book/fulltext/table1.pdf); author copy; read 2026-10-06. Digest `022659f0962bf5bca2d3b53f509f5b5ae518fdb98d165a738ebaa65367b222ee`. Scope: Printed pp.109–112: 11a3, 19a3, 26b1, 26b2, 32a2, 37a1 models and invariants.
- [Algorithms for Modular Elliptic Curves: Table 4 — Second edition (1997), corrected author online edition; numerical/analytic Sha entries are not proofs](https://johncremona.github.io/book/fulltext/table4.pdf); author copy; read 2026-10-06. Digest `7b575b5438e7eceab80b78ecbe70bc2322e361f9d5d1f09713b58f83d8081610`. Scope: First table page: 11,19,26B,32,37A central values/derivative and exact modular-symbol ratios; E6 checks rank-zero 19A and 26B.
- [Keller–Yin author PDF; no separate version-of-record status verified](https://web.math.ucsb.edu/~mulun/files/Eisenstein.pdf); author copy; read 2026-10-06. Digest `83028d184418fafcd7c70e09b958203fd3ba83d86d2e8ecc807ba4d8e358719f`. Scope: Example paragraph and Appendix B.0.1/(B.1), compared with arXiv v2; §1.2 self-disjointness paragraph, §1.5 coefficient-field typo, and §3.0.8–3.0.10 ring labels/cross-reference compared with arXiv v2; No finding is asserted against an unverified journal version.
- [CGLS author preprint, compared only for the already known §5.3 sign/height issues](https://web.math.ucsb.edu/~castella/Eisenstein.pdf); author copy; read 2026-10-06. Digest `2bd32832411151a628136b245eada847f2f1b2e04872391bbe630e8e1a54819b`.

### Imported declarations

These are the exact-pin declarations used by the two parts. The point, twist, cohomology, height and L-function carriers are reused. Their existence does not supply the unimplemented analytic or Iwasawa theorems.

| Declaration | Module | Imported contract |
| --- | --- | --- |
| `mathlib:Algebra.IsQuadraticExtension` | `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | An algebra of rank two over a field. |
| `mathlib:AnalyticAt.analyticOrderAt_ne_top` | `Mathlib/Analysis/Analytic/Order.lean` | For f analytic at z₀: analyticOrderAt f z₀ ≠ ⊤ iff f = (z − z₀)^n g near z₀ with g analytic and g z₀ ≠ 0. |
| `mathlib:ArithmeticFunction.eulerProduct` | `Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean` | The Euler product of a family of local arithmetic functions indexed by primes. |
| `mathlib:Complex.Gammaℂ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Deligne's archimedean factor Γ_ℂ(s) = 2(2π)^{-s}Γ(s). |
| `mathlib:Int.IsFundamentalDiscr` | `Mathlib/NumberTheory/FundamentalDiscriminant.lean` | The predicate of being a fundamental discriminant. |
| `mathlib:IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean` | σ is an arithmetic Frobenius at a prime Q: σ(x) ≡ x^{#(R/Q∩R)} mod Q. |
| `mathlib:LSeries` | `Mathlib/NumberTheory/LSeries/Basic.lean` | The L-series of a coefficient sequence ℕ → ℂ, defined as a tsum. |
| `mathlib:LSeries.abscissaOfAbsConv` | `Mathlib/NumberTheory/LSeries/Convergence.lean` | The abscissa of absolute convergence of an L-series, in EReal. |
| `mathlib:LSeries_convolution` | `Mathlib/NumberTheory/LSeries/Convolution.lean` | LSeries (f ⍟ g) s = LSeries f s * LSeries g s when both series are summable at s. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | The cardinal Module.rank truncated to ℕ; in this packet finite generation/free-quotient or rational tensor hypotheses justify its interpretation as Mordell–Weil rank. It is not zero for every module that is not finite free. |
| `mathlib:Nat.factorial` | `Mathlib/Data/Nat/Factorial/Basic.lean` | The factorial n!. |
| `mathlib:NumberField.discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | The absolute discriminant of a number field. |
| `mathlib:Submodule.torsionBy` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The a-torsion submodule M[a]. |
| `mathlib:WeierstrassCurve.Affine.Point` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | Actual nonsingular affine points plus zero; the group law has an AddCommGroup instance. |
| `mathlib:WeierstrassCurve.Affine.Point.map` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | The map on points induced by an algebra homomorphism of the coefficient fields. |
| `mathlib:WeierstrassCurve.HasAdditiveReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Additive reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasGoodReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Good reduction of an (integral, minimal) Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Split multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Ellipticity is invertibility of the discriminant; over a field this is its nonvanishing. |
| `mathlib:WeierstrassCurve.LFunction` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The L-function of a Weierstrass curve over a number field as the formal Euler product (an ArithmeticFunction ℤ) of the local Euler factors at all height-one primes, computed on minimal models. |
| `mathlib:WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The complex L-series s ↦ LSeries (↑ ∘ W.LFunction) s; a tsum, equal to 0 wherever the series is not summable. |
| `mathlib:WeierstrassCurve.baseChange` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Base change of a Weierstrass curve along an algebra map. |
| `mathlib:WeierstrassCurve.localEulerFactor` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The local Euler factor as an arithmetic function, from the inverse power series of the local polynomial. |
| `mathlib:WeierstrassCurve.localPolynomial` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The local polynomial 1 − aT + qT² (good), 1 − T (split multiplicative), 1 + T (nonsplit multiplicative), 1 (additive) of the minimal model over a DVR. |
| `mathlib:analyticOrderAt` | `Mathlib/Analysis/Analytic/Order.lean` | The order of vanishing of a function at a point, in ℕ∞ (⊤ for the zero germ, 0 if not analytic). |
| `mathlib:analyticOrderAt_eq_zero` | `Mathlib/Analysis/Analytic/Order.lean` | analyticOrderAt f z₀ = 0 iff f is not analytic at z₀ or f z₀ ≠ 0. |
| `mathlib:analyticOrderNatAt` | `Mathlib/Analysis/Analytic/Order.lean` | The natural-number truncation of analyticOrderAt. |
| `mathlib:iteratedDeriv` | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean` | The n-th iterated derivative of a function of one variable. |
| `mathlib:padicValRat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Integer-valued rational valuation, defined as numerator valuation minus denominator valuation; its value at zero is zero. |
| `mathlib:quadraticChar` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` | The quadratic character of a finite field. |
| `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter` | `TauCeti/FieldTheory/Galois/Basic.lean` | The quadratic character (L ≃ₐ[K] L) →* ℤˣ of a quadratic extension. |
| `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff` | `TauCeti/NumberTheory/ModularForms/LFunction.lean` | The q-expansion coefficient sequence of a cusp form of positive weight on an arithmetic subgroup has an entire extension (through Mathlib's ModularForm.L). |
| `tauceti:LSeries.HasEntireExtension` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | a has an entire extension: the abscissa of absolute convergence is finite and some entire F agrees with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.existsUnique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | HasEntireExtension a gives ∃! entire F agreeing with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | Introduction: finite abscissa plus an entire F agreeing with LSeries a on some half-plane Re s > c gives HasEntireExtension a. |
| `tauceti:LSeries.HasEntireExtension.unique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | Two entire extensions of LSeries a on the convergence half-plane are equal. |
| `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff` | `TauCeti/NumberTheory/Multiquadratic/Frobenius.lean` | For odd rational primes not dividing the radicands, an arithmetic Frobenius of the specified multiquadratic field is trivial iff the radicands are quadratic residues. This does not cover dyadic or ramified splitting. |
| `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Tate's canonical height, normalised as the (O)-height (half the x-height limit). |
| `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq` | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisDescent.lean` | A point of W(L) fixed by the nontrivial σ ∈ Gal(L/K) of a quadratic extension is the base change of a point of W(K). |
| `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Height zero implies finite order under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for canonicalHeight; these instances must be supplied over the chosen number field. |
| `tauceti:WeierstrassCurve.Affine.PointModTorsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean` | The Mordell–Weil group modulo torsion. |
| `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | Mordell–Weil: the point group of an elliptic curve over a number field is finitely generated. |
| `tauceti:WeierstrassCurve.Affine.finite_torsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | Finite torsion under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for logHeight₁. For an unconditional number-field use, derive finite torsion from fg_point_of_numberField instead of assuming these missing height instances. |
| `tauceti:WeierstrassCurve.Affine.neronTatePairing` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | The Néron–Tate pairing, the halved polar form of the canonical height. |
| `tauceti:WeierstrassCurve.Affine.regulator` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | Absolute Gram determinant on the free quotient, with height instances and Module.Finite ℤ PointModTorsion. Its self-pairing uses the (O)-height; the BSD regulator is 2^r times this value. |
| `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | With Field, AdmissibleAbsValues, DecidableEq, IsElliptic and Module.Finite ℤ PointModTorsion, finrank zero implies regulator=1. |
| `tauceti:WeierstrassCurve.isElliptic_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The quadratic twist of an elliptic curve by a separable quadratic extension is elliptic. |
| `tauceti:WeierstrassCurve.j_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Twisting does not change the j-invariant. |
| `tauceti:WeierstrassCurve.quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The quadratic twist E.quadraticTwist L of a Weierstrass curve over K by a separable quadratic extension L/K, as quadraticTwistOf by the trace and norm of a generator. |
| `tauceti:WeierstrassCurve.quadraticTwistOf` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The twist of a Weierstrass curve over a commutative ring by the quadratic x² − t x + n (discriminant D = t² − 4n), with Δ ↦ D⁶Δ, c₄ ↦ D²c₄, c₆ ↦ D³c₆. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The isomorphism E^L(M) ≃+ E(M) on M-points, for K ⊆ L ⊆ M, induced by the change of variables over L carrying E to its twist. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Transporting σ ∈ Aut(M/K) through E^L(M) ≅ E(M) multiplies its action by the quadratic character χ(σ\|_L) = ±1. |
| `mathlib:analyticOrderAt_mul` | `Mathlib/Analysis/Analytic/Order.lean` | For analytic scalar functions f and g, analyticOrderAt (f*g) z = analyticOrderAt f z + analyticOrderAt g z. Nonzero germs allow passage to natural orders. |
| `tauceti:TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` | The existing isogeny type between affine Weierstrass curves over a field, with coordinate pullback and MapsInfinity. |
| `tauceti:TauCeti.Isogeny.degree` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean` | The finite function-field degree of an isogeny, defined by Module.finrank over fieldPullback.fieldRange. |
| `mathlib:padicValInt` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Natural-valued integer valuation, defined using the absolute value of the integer. |
| `mathlib:Rat.num_or_den_zero_padicVal` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For any rational q and prime p, the valuation of q.num or q.den is zero. |
| `mathlib:dvd_iff_padicValNat_ne_zero` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For a prime p and nonzero natural n, p divides n exactly when its natural valuation is nonzero. |
| `mathlib:padicValRat.zero` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For every natural p, the valuation of rational zero is zero. |
| `mathlib:padicValRat.one` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For every natural p, the valuation of rational one is zero. |
| `mathlib:padicValRat.neg` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Negation preserves the rational valuation. |
| `mathlib:padicValRat.of_nat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Rational valuation of a natural cast equals its natural valuation. |
| `mathlib:padicValRat.self` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For 1 < p, the valuation at p of the rational p is one. |
| `mathlib:padicValNat.eq_zero_of_not_dvd` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Nondivisibility of a natural n by p implies valuation zero. |
| `mathlib:Nat.primeFactors` | `Mathlib/Data/Nat/PrimeFin.lean` | The finite set of prime factors of a natural number; at zero it is empty. |
| `mathlib:Nat.mem_primeFactors` | `Mathlib/Data/Nat/PrimeFin.lean` | Membership means primality, divisibility, and nonzero natural argument. |
| `mathlib:Nat.primeFactors_eq_empty` | `Mathlib/Data/Nat/PrimeFin.lean` | The prime-factor set is empty exactly for zero and one. |
| `mathlib:Nat.Prime.dvd_iff_eq` | `Mathlib/Data/Nat/Prime/Basic.lean` | If p is prime and a is not one, a divides p exactly when p equals a. |
| `mathlib:Nat.forall_prime_iff_two_and_odd` | `Mathlib/Data/Nat/Prime/Basic.lean` | An assertion holds at every prime exactly when it holds at two and every odd prime. |
| `mathlib:padicValRat.mul` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Under Fact p.Prime and nonzero q,r, v_p(qr)=v_p(q)+v_p(r). |
| `mathlib:padicValRat.pow` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Under Fact p.Prime, v_p(q^k)=k*v_p(q), including the library zero convention. |
| `mathlib:padicValRat.div` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Under Fact p.Prime and nonzero q,r, v_p(q/r)=v_p(q)−v_p(r). |
| `mathlib:WeierstrassCurve` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Actual five-coefficient Weierstrass model over a type R. |
| `mathlib:WeierstrassCurve.Δ` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Integral polynomial discriminant of the actual coefficients. |
| `mathlib:WeierstrassCurve.Affine.Nonsingular` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean` | The affine equation with at least one nonzero partial derivative. |
| `mathlib:orderOf` | `Mathlib/GroupTheory/OrderOfElement.lean` | Multiplicative minimal-period definition and its generated additive addOrderOf: least positive n with n•a=0, or zero for infinite additive order. The declaration index lists the source orderOf name. |

### Source corrections and qualifications

Use the corrected or restricted statement at the affected declaration. The issue ledger preserves the distinction between a confirmed source correction and an unresolved extension.

**RankZeroOneBSD/E1 — error**. Source `castella-cjm`, Theorem A and the proof of Theorem 4.4 (via Theorem 4.2), arXiv:1704.06608v2 = Cambridge J. Math. 6 (2018) 1–23.

For p ∥ N the theorem holds under the corrected hypotheses of Theorem A′: E[p] irreducible, nonsplit multiplicative reduction at some q ≠ p where E[p] is ramified, and E(ℚ_p)[p] = 0 (semistability no longer needed).

The proof of Theorem 4.4 uses a point φ in the weight space of a Hida family through a p-new weight-two form whose existence is not guaranteed (Castella's erratum, §1).

Recorded reference: Castella, Erratum to 'On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes' (author's homepage, 2024).

**RankZeroOneBSD/E2 — gap**. Source `jsw`, Theorem 7.2.1(iii) and its attribution, p. 42 ([Wan14b, Cor. 4.8]).

Use BSTW1.3 and1.5 for semistable curves and only twists supported at ordinary primes as specified there. This repairs that endpoint, not all of the wider coprime-twist range in old JSW7.2.1(iii).

The cited preprint (Wan arXiv:1411.6352) was withdrawn and its pertinent parts superseded (BSTW Remark 1.4), so the supersingular rank-zero input of JSW rests on BSTW.

Recorded reference: BSTW arXiv:2409.01350v2, Remark 1.4.

**RankZeroOneBSD/E3 — misprint**. Source `jsw-published`, Published CJM5 (2017),p.427, sentence immediately after(7.4.c).

Use the square of the free index: ⟨z,z⟩=(m_free)² Reg. In this odd-primary application the full index has the same p-part because p-torsion vanishes.

Quadratic height scales by the square of the lattice index; equation(7.4.c) on the same page already has m². This is a missing square, not evidence that the endpoint is false.

Recorded reference: new.

**RankZeroOneBSD/E4 — misprint**. Source `castella-erratum`, Author erratum,Theorem1.1,p.1.

X_ac(E[p∞]) is Λ-torsion.

A characteristic ideal is an ideal in Λ, not the Selmer module; the proof states torsion of X_ac and then its characteristic-ideal equality.

Recorded reference: new.

**RankZeroOneBSD/E5 — misprint**. Source `castella-erratum`, Author erratum,proof of Theorem2.3,p.3,after the Cha05/MN19 citation.

The second occurrence must be C1=0; C2=0 was established in the preceding sentence.

The immediately preceding sentence identifies C1 as the restriction-kernel exponent; the argument needs both constants zero. This does not verify the cited higher-weight extension.

Recorded reference: new.

**RankZeroOneBSD/E6 — gap**. Source `castella-erratum`, Proof of Theorem2.3,pp.3–4,(2.2),using CGS23 Theorem5.5.1(v2 6.5.1).

Prove the higher-weight T_g extension, including the augmentation prime and C1=C2=0.

CGS§6 is elliptic and its displayed bound is rational; it does not directly supply the higher-weight integral conclusion. The missing extension is now its own BSD.6a node and gap.

Recorded reference: already confirmed by RT-AREA-iwasawa-1/15.

**RankZeroOneBSD/E7 — gap**. Source `bstw`, arXiv2409.01350v2,§9.3.2,proof of Proposition9.18,printed p.84.

Write out the signed Poitou–Tate/image/rank comparison and cyclotomic specialization with(nv).

The proof presented is ordinary. The supersingular analogue has different signed image corrections and is an owned proof obligation, not supplied by an ordinary proof citation.

Recorded reference: already confirmed by RT-AREA-iwasawa-1/30.

**RankZeroOneBSD/E3 — misprint**. Source `cgls`, Published author PDF, §5.3, p.577, equation (5.7).

The displayed right-hand defect valuation is negated: δ_p(E)=−δ_p(E^K).

The K-factorization and the index-square/control comparison give δ_p(E)+δ_p(E^K)=0. The proof still concludes because the twist valuation is zero.

Recorded reference: PAPER-CASTELLA-ETAL-22/E35; Keller–Yin arXiv v2 §4.2 explicitly corrects the sign..

**RankZeroOneBSD/E4 — error**. Source `cgls`, Published author PDF, §5.3, p.577, height equality before (5.6).

Use the free quotient index I_free, or divide the square of the full index by #E(K)_tors²; separately retain the height’s K/ℚ convention factor.

The full index is I_free·#tors. The regulator is computed on the free lattice; a torsion summand cannot multiply a point’s height. The p-part final result in the torsion-free CGS/CGLS range survives.

Recorded reference: PAPER-CASTELLA-ETAL-22/E36; Keller–Yin v2 §4.2, p.42 includes the torsion denominator..

**RankZeroOneBSD/E5 — misprint**. Source `ky`, arXiv:2402.12781v2, Appendix B, p.56, Proposition B.0.1; also author copy inspected.

The codomain is the integral local group H¹_f(K_v,T)/H¹_f(K_v,T)_tors, as in the next displayed exact sequence (B.1).

Localization of integral cohomology has local integral codomain. The printed global W group cannot be quotiented by the indicated local T subgroup; (B.1) gives the correctly typed intended object.

Recorded reference: new.

**RankZeroOneBSD/E6 — error**. Source `ky`, arXiv:2402.12781v2, §0.3, p.5, examples; also author copy inspected.

Cremona 19a3 has rank zero and torsion order 3. Cremona 26b2 has rank zero and trivial torsion. The rank-zero curve with torsion order 7 is Cremona 26b1, equivalently LMFDB 26.b2; do not mix Cremona and LMFDB suffix conventions. Use a separately certified rank-one fixture such as 37a1.

Cremona Table 1, printed pp.110–111, lists 19a3 with r=0,t=3, 26b1 with r=0,t=7 and 26b2 with r=0,t=1. The source’s general Theorem C is unaffected, but both the illustrative rank and the Cremona 26b2 torsion attribution need correction.

Recorded reference: new.

**RankZeroOneBSD/E7 — misprint**. Source `ky`, arXiv:2402.12781v2, §1.2, proof of Remark 1.2.3(ii), pp.14–15.

Use the disjointness of the anticyclotomic Z_p-extension K_∞ and K_cyc. Distinguish the fixed field of ker χ from K_cyc by the finite cyclotomic part; only openness of χ(G_K∞) is needed.

An infinite extension is not linearly disjoint from itself. The preceding and following argument only needs the cyclotomic character to have infinite/open image on the anticyclotomic tower so a finite-order twist cannot make it trivial.

Recorded reference: new.

**RankZeroOneBSD/E8 — gap**. Source `ky`, arXiv:2402.12781v2, Introduction Theorem B p.5 versus §3.0.8 (IMC1) p.40; same discrepancy in author copy.

Clarify the coefficient ring and verify the integral two-way index comparison if the stronger introductory Λ statement is intended. Retain the weaker rationalized statement until this verification; IMC2 remains integral in Λ^nr.

The two statements identified as the same theorem give different ring labels; Λ^ac is not defined in this v2 text, while CGLS uses it for Λ[1/p]. Inverting p removes a substantive height-one assertion. The integral Kolyvagin bound alone does not identify the actual class/lattice scalar in both directions.

Recorded reference: new.

**RankZeroOneBSD/E9 — misprint**. Source `ky`, arXiv:2402.12781v2, p.41, proof of Theorem 3.0.10; also author copy inspected.

The reference is Remark 3.0.9, following Theorem 3.0.8.

The preceding item is explicitly labelled Remark 3.0.9. It discusses removal of H⁰(K,ρ_f)=0 and is the intended reference. This corrects the cross-reference, not the unresolved arithmetic adaptation interfaces.

Recorded reference: new.

**RankZeroOneBSD/E10 — misprint**. Source `ky`, arXiv:2402.12781v2, §1.5, p.31, definition preceding Theorem 1.5.1; also author copy inspected.

Use V_f=T_f⊗_O F, with the p-adic coefficient field F fixed in the Introduction and §1.3.

Here ℓ is the rational prime below w∤p. The representation attached to f and its O-lattice are p-adic, as explicitly defined in §1.3. The printed Q_ℓ cannot be the fraction field of this lattice. The new KY finite-Euler comparison uses the original p-adic V_f and inertia coinvariants.

Recorded reference: new.

## BSD.0 — Analytic invariants and quadratic twists

Start from the actual modular continuation and establish its uniqueness, reality and finite order at the centre. This makes analytic rank and the leading coefficient properties of E itself. The quadratic character, Frobenius trace and local factor comparisons then give the base-change factorization, with the dyadic and ramified cases retained. The congruent-number sign table has its own unresolved source requirement.

**Planets:** L-function of an elliptic curve over ℚ ([declaration](#rankzeroonebsd-bsd-0-actual-l-function)); Root number ([declaration](#rankzeroonebsd-bsd-0-completed-l-function)); Analytic rank ([declaration](#rankzeroonebsd-bsd-0-analytic-rank)); Root-number parity ([declaration](#rankzeroonebsd-bsd-0-root-number-parity)); Twist Euler factors ([declaration](#rankzeroonebsd-bsd-0-twist-local-factors)); Base-change factorisation ([declaration](#rankzeroonebsd-bsd-0-base-change-factorization)).

<a id="rankzeroonebsd-bsd-0-actual-l-function"></a>

### The actual L-function of an elliptic curve over ℚ

`RankZeroOneBSD:BSD.0/actual-l-function` · construction.

Let E be a Weierstrass curve over ℚ with E.IsElliptic and conductor N. The coefficient sequence n ↦ (E.LFunction n : ℂ) of Mathlib's formal Euler product has finite abscissa of absolute convergence (at most 3/2) and an entire extension in Tau Ceti's sense LSeries.HasEntireExtension. ellipticL E : ℂ → ℂ is the unique entire function with ellipticL E s = E.LSeries s for every s with Re s > 3/2. It is the function the Birch–Swinnerton-Dyer statements are about: Mathlib's E.LSeries is a tsum, with value 0 wherever its defining series is not summable; ellipticL is used at s = 1 without asserting an unproved exact abscissa of convergence.

**Hypotheses.**

- E/ℚ elliptic; no semistability or other hypothesis.
- The extension is defined through modularity (EllipticCurveModularity R29.6); no continuation is assumed as a hypothesis.

**Proof route.**

1. Absolute convergence for Re s > 3/2: E.LFunction n = a_n(F_E) for all n ≥ 1 (rational-newform-bridge), and the cusp-form coefficient bound gives finite abscissa (Tau Ceti ModularForms Layer 7, abscissa ≤ k/2 + 1 = 2) and, by Deligne's bound in the weight-two case |a_p| ≤ 2√p, abscissa ≤ 3/2.
2. Existence: CuspForm.hasEntireExtension_qExpansion_coeff gives an entire extension of the coefficient series of F_E ∈ S₂(Γ₀(N)) (strict width one at ∞); transport it along the coefficient equality.
3. Uniqueness: LSeries.HasEntireExtension.unique (identity theorem on a connected half-plane); define ellipticL E as the witness of LSeries.HasEntireExtension.existsUnique.
4. Agreement on Re s > 3/2 rather than on the full convergence half-plane follows from LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re.

**Inputs.** `mathlib:WeierstrassCurve.LFunction`; `mathlib:WeierstrassCurve.LSeries`; `mathlib:LSeries`; `mathlib:LSeries.abscissaOfAbsConv`; `tauceti:LSeries.HasEntireExtension`; `tauceti:LSeries.HasEntireExtension.unique`; `tauceti:LSeries.HasEntireExtension.existsUnique`; `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re`; `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`; `EllipticCurveModularity:R29.6/l-function-continuation`; [RankZeroOneBSD:BSD.0/rational-newform-bridge](#rankzeroonebsd-bsd-0-rational-newform-bridge); `tauceti:TauCeti.Isogeny`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- RankZeroOneBSD:BSD.0/analytic-rank: its order of vanishing at s = 1 is the analytic rank
- RankZeroOneBSD:BSD.0/base-change-factorization: L(E/K,s) is continued as the product of ellipticL E and ellipticL E^K
- RankZeroOneBSD:BSD.5: the numerator of the rational BSD defect is its leading Taylor coefficient at 1
- EllipticCurves Layer 7 statement-only BSD milestone: the analytic hypothesis there is discharged by this function: an analytic continuation agreeing with the Dirichlet series on part of its half-plane of convergence
- JSW Conjecture 7.1.1: L(E/F,s) means the continued Hasse–Weil L-function

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.ellipticL` | constructor | For E/ℚ elliptic, the entire function ellipticL E : ℂ → ℂ. |
| `WeierstrassCurve.hasEntireExtension_LFunction` | other | LSeries.HasEntireExtension (fun n ↦ (E.LFunction n : ℂ)). |
| `WeierstrassCurve.ellipticL_eq_LSeries` | characterisation | For Re s > 3/2, ellipticL E s = E.LSeries s. |
| `WeierstrassCurve.differentiable_ellipticL` | structure | Differentiable ℂ (ellipticL E); in particular AnalyticOnNhd on ℂ. |
| `WeierstrassCurve.ellipticL_unique` | universal-property | If G is entire and G s = E.LSeries s on some half-plane Re s > c, then G = ellipticL E. |
| `WeierstrassCurve.ellipticL_eq_eulerProduct` | simp | For Re s > 3/2, ellipticL E s = ∏_ℓ P_ℓ(E, ℓ^{-s})^{-1} with P_ℓ = E.localPolynomial at ℓ, the product converging absolutely. |
| `WeierstrassCurve.ellipticL_ne_zero_of_re_gt` | other | ellipticL E s ≠ 0 for Re s > 3/2 (absolutely convergent Euler product). |
| `WeierstrassCurve.ellipticL_conj` | relation | ellipticL E (conj s) = conj (ellipticL E s); ellipticL E is real on the real axis. |
| `WeierstrassCurve.ellipticL_eq_of_isogenous` | compatibility | If E and E' are ℚ-isogenous then ellipticL E = ellipticL E' (equality of all local factors, EllipticCurves Layer 7). |
| `WeierstrassCurve.ellipticL_eq_of_variableChange` | compatibility | ellipticL is unchanged under a change of variables over ℚ (Mathlib's LFunction uses minimal models). |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.ellipticL_two` | characterisation | ellipticL E 2 = E.LSeries 2 for every E/ℚ elliptic. |
| `WeierstrassCurve.LSeries_one_eq_zero_ne_ellipticL` | non-example | For E = 11a3, assuming the defining L-series terms are not summable at s = 1, E.LSeries 1 = 0 while ellipticL E 1 ≠ 0. The hypothesis is explicit; abscissa ≤ 3/2 does not imply nonsummability at every point below it. |
| `WeierstrassCurve.ellipticL_eq_newformL` | compatibility | ellipticL E s = (h Γ₀(N))^{-s}-normalised Mathlib ModularForm.L of the newform F_E, i.e. its entire extension, for all s (strict width one, so the factor is 1). |
| `WeierstrassCurve.ellipticL_isogenous_11` | compatibility | ellipticL (11a1) = ellipticL (11a3): isogenous curves have the same L-function. |

**Acceptance.**

- ellipticL E 2 = E.LSeries 2, and both equal the absolutely convergent Euler product at s = 2.
- For E = 11a3, ellipticL E 1 ≠ 0. Whenever the defining series at 1 is not summable, E.LSeries 1 = 0, so that value cannot be substituted for the continuation.

**Sources.**

- [tauceti-entire](#source-tauceti-entire), TauCeti/NumberTheory/LSeries/EntireExtension.lean, docstring of HasEntireExtension. The predicate whose unique witness is ellipticL.
- [jsw](#source-jsw), Conjecture 7.1.1(a), p. 41. The analytic object of the BSD statements is the continuation, not the Dirichlet series.

<a id="rankzeroonebsd-bsd-0-completed-l-function"></a>

### The completed L-function and the root number

`RankZeroOneBSD:BSD.0/completed-l-function` · definition.

For E/ℚ elliptic of conductor N, completedEllipticL E is the unique entire continuation of s ↦ N^{s/2} Γ_ℂ(s) ellipticL E s from Re s > 0, where Γ_ℂ(s)=2(2π)^{-s}Γ(s). This product formula is asserted only there; at Gamma poles use the continuation. It satisfies Λ(E,s)=w_E Λ(E,2−s) for a unique sign rootNumber E∈ℤˣ. With the normalised Fricke involution supplied by ModularForms Layer 6, w_E=−ε_N(F_E). The pinned raw TauCeti.frickeOperator has no normalising scalar and does not directly supply that involution.

**Hypotheses.**

- E/ℚ elliptic; N is the conductor of E, equal to the level of F_E (EllipticCurveModularity R29.4/exact-conductor).
- Γ_ℂ convention: Λ(E,s) here is 2 × the function N^{s/2}(2π)^{-s}Γ(s)L(E,s) of R29.6 and of BFH; the factor 2 does not change the sign w_E.

**Proof route.**

1. Construct the entire Mellin transform through R29.6 and identify it with N^{s/2} Γ_ℂ(s) ellipticL E s on Re s > 0. Choose this witness and prove uniqueness by the identity theorem. Do not define the value at s=0 by a pointwise total Gamma product: Gammaℂ 0=0 in Lean whereas Λ(E,0)=w_E Λ(E,2)≠0.
2. Functional equation: R29.6/l-function-continuation gives Λ(E,s) = w_E Λ(E,2−s) with w_E the eigenvalue of −W_N on F_E.
3. Uniqueness of the sign: completedEllipticL E 2 ≠ 0 (Euler product), so ε with Λ(s) = εΛ(2 − s) is determined by evaluating at s = 2 and s = 0.
4. Comparison with Tau Ceti ModularForms Layer 6–7: the companion equation Λ_N(k−s,f) = i^k Λ_N(s, 𝒲_N f) with k = 2 gives the sign −ε_N.

**Inputs.** `mathlib:Complex.Gammaℂ`; [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function); `EllipticCurveModularity:R29.6/l-function-continuation`; `EllipticCurveModularity:R29.4/exact-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`; `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `tauceti:TauCeti.Isogeny`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- RankZeroOneBSD:BSD.0/root-number-parity: the sign forces the parity of the order at s = 1
- RankZeroOneBSD:BSD.0/twist-root-number: w(E^D) = χ_D(−N)w(E)
- BFH90, Introduction: ε selects which quadratic twists can have nonvanishing central value or derivative
- RankZeroOneBSD:BSD.3: analytic rank one forces w_E = −1, which selects the value branch of BSD.2

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.completedEllipticL` | constructor | completedEllipticL E : ℂ → ℂ, the unique entire continuation of the Gamma product from Re s > 0. |
| `WeierstrassCurve.differentiable_completedEllipticL` | structure | completedEllipticL E is entire. |
| `WeierstrassCurve.rootNumber` | data | rootNumber E : ℤˣ, the sign of the functional equation. |
| `WeierstrassCurve.completedEllipticL_two_sub` | relation | completedEllipticL E (2 − s) = rootNumber E * completedEllipticL E s. |
| `WeierstrassCurve.rootNumber_eq_neg_fricke` | compatibility | rootNumber E = −ε_N(F_E), the negative of the eigenvalue of Tau Ceti's normalised Fricke operator on the newform of E. |
| `WeierstrassCurve.rootNumber_eq_of_isogenous` | compatibility | Isogenous curves have equal root numbers. |
| `WeierstrassCurve.rootNumber_eq_prod_local` | relation | rootNumber E = ∏_v w_v(E) over all places, w_∞ = −1, w_ℓ = −a_ℓ at multiplicative ℓ and w_ℓ = 1 at good ℓ (local ε-factors, GL2AutomorphicRepresentationsAndTransfer R16.3). |
| `WeierstrassCurve.completedEllipticL_one` | simp | completedEllipticL E 1 = N^{1/2} π^{-1} ellipticL E 1 (Γ_ℂ(1) = π^{-1}). |
| `WeierstrassCurve.exists_completedEllipticL` | constructor | There is an entire F agreeing with N^{s/2} Gammaℂ(s) ellipticL E s for Re s > 0. |
| `WeierstrassCurve.completedEllipticL_eq_gammaProduct` | characterisation | If Re s > 0, completedEllipticL E s = N^{s/2} Gammaℂ(s) ellipticL E s. |
| `WeierstrassCurve.completedEllipticL_unique` | universal-property | Two entire functions agreeing with that product on Re s > 0 are equal. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.rootNumber_37a` | computation | rootNumber (37a1 : y² + y = x³ − x) = −1, while the Fricke eigenvalue of its newform is +1. |
| `WeierstrassCurve.rootNumber_11a` | computation | rootNumber (11a1) = +1 (a₁₁ = 1, split multiplicative, w₁₁ = −1, w_∞ = −1). |
| `WeierstrassCurve.completedEllipticL_one_eq` | degenerate | completedEllipticL E 1 = Real.sqrt N / π · ellipticL E 1. |
| `WeierstrassCurve.rootNumber_ne_fricke` | non-example | For 37a1, rootNumber E ≠ ε_N(F_E): the tempting definition rootNumber := Fricke eigenvalue has the wrong sign in weight two. |
| `WeierstrassCurve.completedEllipticL_zero` | non-example | completedEllipticL E 0 = rootNumber E * completedEllipticL E 2 ≠ 0, detecting the wrong pointwise Gamma product at zero. |

**Acceptance.**

- w(11a1) = +1 and w(37a1) = −1.
- rootNumber is invariant under ℚ-isogeny (equal L-functions and conductors).

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 543. The completed function and its sign, for k = 2 and M = N.
- [tauceti-modularforms-roadmap](#source-tauceti-modularforms-roadmap), ModularForms README, Layer 6. The relation w_E = −ε_N(F_E) for weight two.
- [gross-kolyvagin](#source-gross-kolyvagin), §5, after (5.2), p. 243 (read from the page image). The same relation, with ε the eigenvalue of the Fricke involution on f.

<a id="rankzeroonebsd-bsd-0-analytic-rank"></a>

### Analytic rank and the leading coefficient at s = 1

`RankZeroOneBSD:BSD.0/analytic-rank` · definition.

For E/ℚ elliptic, analyticRank E := analyticOrderNatAt (ellipticL E) 1 ∈ ℕ, and analyticOrderAt (ellipticL E) 1 ≠ ⊤. The leading coefficient is leadingTerm E := iteratedDeriv r (ellipticL E) 1 / r! with r = analyticRank E; it is a nonzero real number, and ellipticL E s = (s − 1)^r (leadingTerm E + O(s − 1)) near s = 1. In particular analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0.

**Hypotheses.**

- Defined on the entire continuation ellipticL E, never on Mathlib's tsum E.LSeries.
- Finiteness uses only that ellipticL E is entire and not identically zero (it is nonzero at s = 2).

**Proof route.**

1. ellipticL E is analytic on the connected set ℂ and nonzero at s = 2 (ellipticL_ne_zero_of_re_gt), so its order at 1 is finite (identity theorem; AnalyticAt.analyticOrderAt_ne_top).
2. The factorisation (s − 1)^r g(s) with g(1) ≠ 0 gives g(1) = iteratedDeriv r (ellipticL E) 1 / r! by Taylor's formula.
3. Reality: ellipticL E is real on ℝ (actual-l-function, ellipticL_conj), hence so are all derivatives at 1.
4. The order-zero and order-one criteria are analyticOrderAt_eq_zero and the r = 1 case of the factorisation.

**Inputs.** `mathlib:analyticOrderAt`; `mathlib:analyticOrderNatAt`; `mathlib:AnalyticAt.analyticOrderAt_ne_top`; `mathlib:analyticOrderAt_eq_zero`; `mathlib:iteratedDeriv`; `mathlib:Nat.factorial`; [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function); `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- RankZeroOneBSD:BSD.3: the hypothesis analyticRank E = 1 of the rank-one theorem
- RankZeroOneBSD:BSD.4: the hypothesis analyticRank E = 0
- RankZeroOneBSD:BSD.5: leadingTerm E is the numerator of the rational BSD defect
- JSW Theorem 1.2.1: ord_{s=1} L(E,s) = 1 and L′(E,1) in the p-part formula

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.analyticRank` | constructor | analyticRank E = analyticOrderNatAt (ellipticL E) 1. |
| `WeierstrassCurve.analyticOrderAt_ellipticL_ne_top` | other | analyticOrderAt (ellipticL E) 1 ≠ ⊤, and analyticOrderAt (ellipticL E) 1 = analyticRank E. |
| `WeierstrassCurve.analyticRank_eq_zero_iff` | characterisation | analyticRank E = 0 ↔ ellipticL E 1 ≠ 0. |
| `WeierstrassCurve.analyticRank_eq_one_iff` | characterisation | analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0. |
| `WeierstrassCurve.leadingTerm` | data | leadingTerm E = iteratedDeriv (analyticRank E) (ellipticL E) 1 / (analyticRank E)! as a real number. |
| `WeierstrassCurve.leadingTerm_ne_zero` | other | leadingTerm E ≠ 0. |
| `WeierstrassCurve.leadingTerm_of_analyticRank_eq_zero` | simp | analyticRank E = 0 → leadingTerm E = ellipticL E 1. |
| `WeierstrassCurve.leadingTerm_of_analyticRank_eq_one` | simp | analyticRank E = 1 → leadingTerm E = deriv (ellipticL E) 1. |
| `WeierstrassCurve.ellipticL_isBigO_leading` | characterisation | ellipticL E s − leadingTerm E (s − 1)^r = O((s − 1)^{r+1}) as s → 1. |
| `WeierstrassCurve.analyticRank_eq_of_isogenous` | compatibility | Isogenous curves have equal analytic rank and leading term. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.analyticRank_eq_zero_iff_test` | degenerate | analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and then leadingTerm E = ellipticL E 1. |
| `WeierstrassCurve.analyticRank_37a` | computation | analyticRank (37a1) = 1. |
| `WeierstrassCurve.analyticRank_eq_newform` | compatibility | analyticRank E equals Tau Ceti ModularForms Layer 7's analytic rank of F_E (order of its entire continuation at the centre k/2 = 1). |
| `WeierstrassCurve.analyticRank_unitary_centre` | compatibility | analyticRank E = analyticOrderNatAt (fun s ↦ ellipticL E (s + 1/2)) (1/2): the unitary centre s = 1/2 of L(s, π_E) is the motivic centre 1 (GZ.0/unitary-and-motivic-centres). |
| `WeierstrassCurve.leadingTerm_not_halved` | non-example | For analytic rank one, leadingTerm E = deriv (ellipticL E) 1, not deriv (ellipticL E) 1 / 2: the factor is 1/r! = 1. |

**Acceptance.**

- analyticRank (11a1) = 0 and analyticRank (37a1) = 1, with the nonvanishing certified by BSD.9's rigorous enclosures.

**Sources.**

- [mathlib-order](#source-mathlib-order), Mathlib/Analysis/Analytic/Order.lean, docstring of analyticOrderAt. The Mathlib notion applied to ellipticL E at s = 1.
- [jsw](#source-jsw), Conjecture 1.1.1(a), p. 1. Analytic rank is the order of the zero at s = 1.
- [tauceti-modularforms-roadmap](#source-tauceti-modularforms-roadmap), ModularForms README, Layer 7. The same discipline for newforms; the two notions agree through the rational newform bridge.

<a id="rankzeroonebsd-bsd-0-root-number-parity"></a>

### Root-number parity of the analytic rank

`RankZeroOneBSD:BSD.0/root-number-parity` · theorem.

For every E/ℚ elliptic, (−1)^{analyticRank E} = rootNumber E. Consequently rootNumber E = −1 implies ellipticL E 1 = 0, and analyticRank E = 1 implies rootNumber E = −1.

**Hypotheses.**

- E/ℚ elliptic.

**Proof route.**

1. Write Λ = completedEllipticL E and r = analyticRank E. The factor N^{s/2}Γ_ℂ(s) is analytic and nonzero at s = 1, so ord_{s=1} Λ = r.
2. The functional equation Λ(1 + t) = w_E Λ(1 − t) compares Taylor coefficients at t = 0: c_k = w_E (−1)^k c_k.
3. Taking k = r, where c_r ≠ 0, gives (−1)^r = w_E.

**Inputs.** [RankZeroOneBSD:BSD.0/completed-l-function](#rankzeroonebsd-bsd-0-completed-l-function); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); `mathlib:analyticOrderAt`; `mathlib:iteratedDeriv`.

**Acceptance.**

- 37a1: w = −1 and analyticRank = 1; 11a1: w = +1 and analyticRank = 0.
- For the congruent-number twists (congruent-number-root-numbers) the parity of the analytic rank is read off n mod 8.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 543. The parity relation, for k = 2.

<a id="rankzeroonebsd-bsd-0-quadratic-field-character"></a>

### The quadratic character of a quadratic field

`RankZeroOneBSD:BSD.0/quadratic-field-character` · comparison.

Let K be a quadratic number field with discriminant D_K = NumberField.discr K (a fundamental discriminant) and χ_K := kroneckerCharacter D_K (ClassicalArithmeticCompletion CA.1). Then for every rational prime ℓ: χ_K(ℓ) = 1 if ℓ splits in K, −1 if ℓ is inert, 0 if ℓ ramifies (equivalently ℓ | D_K); for ℓ ∤ D_K and any arithmetic Frobenius σ at a prime above ℓ, χ_K(ℓ) = quadraticCharacter ℚ K σ (Tau Ceti); and χ_K(−1) = sign D_K, so K is imaginary iff χ_K(−1) = −1.

**Hypotheses.**

- K/ℚ quadratic, as a number field with Algebra.IsQuadraticExtension ℚ K.
- χ_K is a primitive Dirichlet character of conductor |D_K| (CA.1/kronecker-character-is-primitive).

**Proof route.**

1. Write K = ℚ(√d) with d squarefree; D_K = d or 4d (Mathlib Int.IsFundamentalDiscr, Tau Ceti IsFundamentalDiscriminant).
2. For odd ℓ ∤ d, ℓ splits iff d is a square mod ℓ (Dedekind–Kummer); Tau Ceti's NumberField.isArithFrobAt_multiquadratic_eq_one_iff states the Frobenius form, and kroneckerCharacter D_K (ℓ) = legendreSym ℓ D_K by CA.1.
3. For ℓ = 2 ∤ D_K (d ≡ 1 mod 4), 2 splits iff d ≡ 1 mod 8, matching kroneckerCharacter's value at 2.
4. Ramified primes are exactly ℓ | D_K (discriminant criterion), where χ_K vanishes.
5. The pinned multiquadratic Frobenius theorem covers odd unramified primes only. Obtain the prime 2 splitting criterion and identification of the discriminant Kronecker character with the quadratic Galois character from the requested arithmetic/local exports; do not infer them from that theorem.

**Inputs.** `ClassicalArithmeticCompletion:CA.1/kronecker-character`; `ClassicalArithmeticCompletion:CA.1/kronecker-character-is-primitive`; `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter`; `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff`; `mathlib:IsArithFrobAt`; `mathlib:NumberField.discr`; `mathlib:Int.IsFundamentalDiscr`; `mathlib:Algebra.IsQuadraticExtension`; `ClassicalArithmeticCompletion:CA.1`.

**Acceptance.**

- K = ℚ(√−7): D_K = −7, χ_K(2) = 1 (2 splits), χ_K(3) = −1 (3 inert), χ_K(7) = 0.
- K = ℚ(i): D_K = −4, χ_K = χ₄.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 543. The dictionary between D, χ_D and ℚ(√D).

<a id="rankzeroonebsd-bsd-0-finite-field-twist-trace"></a>

### Trace of Frobenius of a twist over a finite field

`RankZeroOneBSD:BSD.0/finite-field-twist-trace` · lemma.

Let F be a finite field with q elements and E an elliptic Weierstrass curve over F, a_q(E) := q + 1 − #E(F). (i) If char F ≠ 2 and d ∈ Fˣ, the twist E_d := E.quadraticTwistOf 0 (−d/4) (discriminant D = d) satisfies a_q(E_d) = quadraticChar F d · a_q(E); this includes d a square, where E_d ≅ E and the factor is 1. (ii) If char F = 2 and E_c := E.quadraticTwistOf 1 c (discriminant 1, the Artin–Schreier twist by x² − x + c), then a_q(E_c) = (−1)^{Tr_{F/𝔽₂}(c)} · a_q(E).

**Hypotheses.**

- E elliptic over a finite field; for (i) char F odd.
- The twist is Tau Ceti's quadraticTwistOf; its Weierstrass model is elliptic when D ≠ 0.

**Proof route.**

1. Odd characteristic: complete the square, y² = f(x) with f a cubic; the twist is d y² = f(x) up to a change of variables (Tau Ceti exists_smul_quadraticTwistOf_eq).
2. Count points: for each x ∈ F there are 1 + χ(f(x)) points on E and 1 + χ(d f(x)) = 1 + χ(d)χ(f(x)) on E_d; add the point at infinity and sum.
3. Characteristic two: for a₁x+a₃≠0 divide the equation to obtain an Artin–Schreier equation, whose trace obstruction changes by Tr(c). For a₁x+a₃=0, y↦y² is bijective and both curves have exactly one point above x; this contribution has zero trace sign and must be handled separately.

**Inputs.** `tauceti:WeierstrassCurve.quadraticTwistOf`; `mathlib:quadraticChar`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Acceptance.**

- Over 𝔽₅, E : y² = x³ + x + 1 has 9 points (a = −3); with d = 2 (a nonsquare) the twist 2y² = x³ + x + 1 has 3 points (a = 3).
- d = 4 (a square in 𝔽₅) gives the same count 9.

**Sources.**

- [tauceti-twist](#source-tauceti-twist), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistOf. The characteristic-free twist used in both parts.

<a id="rankzeroonebsd-bsd-0-twist-local-factors"></a>

### Local Euler factors of a quadratic twist

`RankZeroOneBSD:BSD.0/twist-local-factors` · theorem.

Let E/ℚ be elliptic, K a quadratic field with character χ = χ_K and E^K := E.quadraticTwist K. (a) For every prime ℓ ∤ D_K, E^K has the same reduction type as E at ℓ and its local polynomial is P_ℓ(E^K, T) = P_ℓ(E, χ(ℓ)T): at good ℓ, a_ℓ(E^K) = χ(ℓ)a_ℓ(E); at multiplicative ℓ, split and nonsplit reduction are exchanged exactly when χ(ℓ) = −1; at additive ℓ both factors are 1. (b) For ℓ | D_K, P_ℓ(E^K, T) = det(1 − Frob_ℓ T | (V_r(E) ⊗ χ_ℓ)^{I_ℓ}) for any prime r ≠ ℓ, where χ_ℓ is the local character of K at ℓ; in particular if E has good or multiplicative reduction at ℓ then E^K has additive reduction at ℓ and P_ℓ(E^K, T) = 1.

**Hypotheses.**

- Mathlib's localPolynomial is computed on minimal models (WeierstrassCurve.minimal); the comparison includes the change to a minimal model of the twist.
- ℓ = 2 is included in both (a) and (b).

**Proof route.**

1. (a), ℓ odd: D_K is an ℓ-adic unit, so the twisted model has Δ ↦ D⁶Δ with the same valuation; minimality and the reduction type are preserved, and the reduction of E^K is the twist of the reduction of E by the class of D_K mod ℓ (finite-field-twist-trace).
2. Multiplicative reduction: the tangent directions at the node are defined over 𝔽_ℓ(√(−c₆)); twisting multiplies −c₆ by D³, so splitness flips exactly when D_K is a nonsquare mod ℓ, i.e. χ(ℓ) = −1.
3. (a), ℓ = 2 ∤ D_K: D_K ≡ 1 mod 4, and the twist is an Artin–Schreier twist over 𝔽₂ by x² − x + (1 − D_K)/4, whose trace is 1 exactly when D_K ≡ 5 mod 8, i.e. χ(2) = −1 (finite-field-twist-trace (ii)).
4. (b): the Tate module of E^K is V_r(E) ⊗ χ as a G_ℚ-representation (Tau Ceti quadraticTwistPointEquiv twists the Galois action by the quadratic character). The Néron–Ogg–Shafarevich criterion and the Galois description of local factors (EllipticCurves Layer 4; EllipticCurveModularity R29.4/bad-euler-factors) give the local polynomial as the characteristic polynomial on inertia invariants. If V_r(E) is unramified or has unipotent inertia action, tensoring with the ramified χ_ℓ kills the invariants.

**Inputs.** [RankZeroOneBSD:BSD.0/finite-field-twist-trace](#rankzeroonebsd-bsd-0-finite-field-twist-trace); [RankZeroOneBSD:BSD.0/quadratic-field-character](#rankzeroonebsd-bsd-0-quadratic-field-character); `tauceti:WeierstrassCurve.quadraticTwist`; `tauceti:WeierstrassCurve.isElliptic_quadraticTwist`; `mathlib:WeierstrassCurve.localPolynomial`; `mathlib:WeierstrassCurve.HasGoodReduction`; `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction`; `mathlib:WeierstrassCurve.HasMultiplicativeReduction`; `mathlib:WeierstrassCurve.HasAdditiveReduction`; `EllipticCurveModularity:R29.4/bad-euler-factors`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): a₂(E) = −2 and χ(2) = 1, so a₂(E^K) = −2; a₃(E) = −1 and χ(3) = −1, so a₃(E^K) = 1.
- E = 11a1, K = ℚ(√−1): at ℓ = 11, χ(11) = −1, so the split multiplicative reduction of E becomes nonsplit for E^K.

**Sources.**

- [jsw](#source-jsw), Footnote 7, p. 42. Twisting E twists every Euler factor by χ_K.
- [skinner-zhang](#source-skinner-zhang), §9.1, Corollary 9.2 and proof, p. 29. The local comparison at split primes; inert and ramified primes use the Galois description.

<a id="rankzeroonebsd-bsd-0-twist-l-series"></a>

### The L-series and conductor of a quadratic twist coprime to the conductor

`RankZeroOneBSD:BSD.0/twist-l-series` · theorem.

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then E.quadraticTwist K has conductor N·D_K², its coefficients are a_n(E^K) = χ_K(n)·a_n(E) for every n ≥ 1, ellipticL E^K is the entire continuation of Σ χ_K(n)a_n(E)n^{-s}, and the newform of E^K is the twist F_E ⊗ χ_K, a newform of level N D_K².

**Hypotheses.**

- (D_K, N) = 1. Without it the coefficients at ℓ | (D_K, N) and the conductor need twist-local-factors (b).

**Proof route.**

1. For ℓ ∤ D_K, twist-local-factors (a) gives P_ℓ(E^K,T) = P_ℓ(E, χ(ℓ)T), so a_{ℓ^k}(E^K) = χ(ℓ)^k a_{ℓ^k}(E).
2. For ℓ | D_K, ℓ ∤ N: E has good reduction at ℓ, so E^K is additive there (twist-local-factors (b)) and a_{ℓ^k}(E^K) = 0 = χ(ℓ^k)a_{ℓ^k}(E).
3. Multiplicativity of both coefficient sequences gives the identity for all n.
4. Conductor: at ℓ | D_K the representation V ⊗ χ_ℓ has V unramified, so its conductor exponent is 2·a(χ_ℓ) = 2 v_ℓ(D_K); elsewhere it is unchanged (R29.4/exact-conductor identifies the level with this conductor).
5. Newform: F_E ⊗ χ_K has the coefficients a_n(E^K) and level N D_K² (twist of a newform by a character of coprime conductor is new), and equals F_{E^K} by strong multiplicity one (R29.3/newform-of-E).

**Inputs.** [RankZeroOneBSD:BSD.0/twist-local-factors](#rankzeroonebsd-bsd-0-twist-local-factors); [RankZeroOneBSD:BSD.0/quadratic-field-character](#rankzeroonebsd-bsd-0-quadratic-field-character); `EllipticCurveModularity:R29.3/newform-of-E`; `EllipticCurveModularity:R29.4/exact-conductor`; `mathlib:WeierstrassCurve.LFunction`; [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function).

**Acceptance.**

- E = 11a1, K = ℚ(√−7): E^K has conductor 11·49 = 539.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 543. The twisted L-series and its conductor D²M.
- [jsw](#source-jsw), Footnote 8, p. 43. The newform of the twist.

<a id="rankzeroonebsd-bsd-0-twist-root-number"></a>

### Root number of a quadratic twist

`RankZeroOneBSD:BSD.0/twist-root-number` · theorem.

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then rootNumber (E.quadraticTwist K) = χ_K(−N)·rootNumber E. In particular, if K is imaginary and every prime dividing N splits in K, then rootNumber E^K = −rootNumber E, and rootNumber E · rootNumber E^K = −1.

**Hypotheses.**

- (D_K, N) = 1.
- For K imaginary χ_K(−1) = −1; the Heegner hypothesis gives χ_K(N) = 1.

**Proof route.**

1. Twist the completed function: Λ(s, F_E ⊗ χ_K) with conductor N D_K² (twist-l-series).
2. The twist of a newform of level N and sign ε by a primitive character χ of conductor D coprime to N has sign ε·χ(N)·τ(χ)²/D; for quadratic χ = χ_K, τ(χ_K)² = χ_K(−1)|D_K|, so the sign is ε·χ_K(−N). Equivalently, with local ε-factors (GL2AutomorphicRepresentationsAndTransfer R16.3) only the places ℓ | D_K change, together contributing χ_K(−N).
3. Under the Heegner hypothesis χ_K(N) = ∏ χ_K(ℓ)^{v_ℓ(N)} = 1 and χ_K(−1) = −1.

**Inputs.** [RankZeroOneBSD:BSD.0/completed-l-function](#rankzeroonebsd-bsd-0-completed-l-function); [RankZeroOneBSD:BSD.0/twist-l-series](#rankzeroonebsd-bsd-0-twist-l-series); [RankZeroOneBSD:BSD.0/quadratic-field-character](#rankzeroonebsd-bsd-0-quadratic-field-character); `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Acceptance.**

- E = 37a1 (w = −1), K = ℚ(√−7) (37 ≡ 2 mod 7 is a square, so 37 splits): w(E^K) = +1.
- E = 11a1 (w = +1), K = ℚ(√−7) (11 ≡ 4 mod 7 is a square): w(E^K) = −1.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 543. The twisted sign εχ_D(−M).
- [bfh90](#source-bfh90), Introduction, p. 543. The Heegner-hypothesis specialisation.

<a id="rankzeroonebsd-bsd-0-base-change-factorization"></a>

### Factorisation of the L-function over a quadratic field

`RankZeroOneBSD:BSD.0/base-change-factorization` · theorem.

Let E/ℚ be elliptic and K a quadratic field. As arithmetic functions, (E.baseChange K).LFunction = E.LFunction ⍟ (E.quadraticTwist K).LFunction (Dirichlet convolution), the left side being Mathlib's Euler product over the height-one primes of 𝓞_K grouped by norm. Hence (E.baseChange K).LSeries s = E.LSeries s · (E.quadraticTwist K).LSeries s for Re s > 3/2, and L(E/K, s) has the entire continuation ellipticL E · ellipticL E^K.

**Hypotheses.**

- K/ℚ quadratic (real or imaginary); no coprimality between D_K and N is assumed.

**Proof route.**

1. Both sides are Euler products; compare, for each rational prime ℓ, the product of the factors of E/K at the primes 𝔩 | ℓ with P_ℓ(E,T)P_ℓ(E^K,T).
2. ℓ split: K_𝔩 = ℚ_ℓ for both 𝔩, and E^K ≅ E over ℚ_ℓ since D_K is a square there, so both sides are P_ℓ(E,T)².
3. ℓ inert: one prime of norm ℓ², with factor P_𝔩(E/K, T²) computed over the quadratic unramified extension; at good ℓ the identity (1 − αT)(1 − βT)(1 + αT)(1 + βT) = (1 − α²T²)(1 − β²T²) with a_{ℓ²} = a_ℓ² − 2ℓ (point count over 𝔽_{ℓ²}, EllipticCurves Layer 3) and twist-local-factors (a) with χ(ℓ) = −1; at multiplicative ℓ (1 − aT)(1 + aT) = 1 − T² since the reduction over 𝔽_{ℓ²} is split; at additive ℓ both sides are 1.
4. ℓ ramified: one prime of norm ℓ; as I_ℓ/I_𝔩 ≅ {±1} acts on V^{I_𝔩} by an involution, V^{I_𝔩} = V^{I_ℓ} ⊕ (V ⊗ χ_ℓ)^{I_ℓ} as Frobenius modules, which is twist-local-factors (b).
5. Convergence for Re s > 3/2 of each factor gives the LSeries identity (LSeries_convolution); the product of the two entire functions agrees with it there, so it is the continuation.

**Inputs.** [RankZeroOneBSD:BSD.0/twist-local-factors](#rankzeroonebsd-bsd-0-twist-local-factors); [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function); `mathlib:WeierstrassCurve.LFunction`; `mathlib:WeierstrassCurve.LSeries`; `mathlib:WeierstrassCurve.baseChange`; `mathlib:ArithmeticFunction.eulerProduct`; `mathlib:LSeries_convolution`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): the coefficient of 2^{−s} in L(E/K,s) is a₂(E) + a₂(E^K) = −4 (two primes of norm 2, each with a = −2).
- Coefficient of 3^{−s} in L(E/K,s) is 0 (3 inert: no ideal of norm 3), matching a₃(E) + a₃(E^K) = −1 + 1.

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 46. The factorisation L(E/K,s) = L(E,s)L(E^D,s) used at the centre.
- [mathlib-lfunction](#source-mathlib-lfunction), Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean, docstring of LFunction. The left-hand side over K.

<a id="rankzeroonebsd-bsd-0-base-change-central-identities"></a>

### Order, leading term and sign of L(E/K, s) at the centre

`RankZeroOneBSD:BSD.0/base-change-central-identities` · lemma.

Let E/ℚ be elliptic, K quadratic, r = analyticRank E and r' = analyticRank E^K. The continuation ellipticL E · ellipticL E^K of L(E/K,s) has order r + r' at s = 1 and leading coefficient leadingTerm E · leadingTerm E^K. In particular (a) if r = 1 and ellipticL E^K 1 ≠ 0, then L(E/K,s) has a simple zero and L′(E/K,1) = L′(E,1)·L(E^K,1); (b) if r = 0 and r' = 1, then L′(E/K,1) = L(E,1)·L′(E^K,1). If (D_K, N) = 1, K is imaginary and every prime dividing N splits in K, then r + r' is odd.

**Hypotheses.**

- K quadratic; for the parity statement, the Heegner hypothesis and (D_K, N) = 1.

**Proof route.**

1. Orders add and leading coefficients multiply for a product of analytic functions (Mathlib analyticOrderAt of a product).
2. (a), (b) are the cases r + r' = 1 of the product rule.
3. Parity: root-number-parity for E and E^K and twist-root-number give (−1)^{r+r'} = w(E)w(E^K) = −1.

**Inputs.** [RankZeroOneBSD:BSD.0/base-change-factorization](#rankzeroonebsd-bsd-0-base-change-factorization); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity); [RankZeroOneBSD:BSD.0/twist-root-number](#rankzeroonebsd-bsd-0-twist-root-number); `mathlib:analyticOrderAt`; `mathlib:analyticOrderAt_mul`.

**Acceptance.**

- E = 37a1, K = ℚ(√−7): r = 1 and w(E^K) = +1 (twist-root-number), consistent with r' even.

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 45. Order one over K from rank one over ℚ and a nonvanishing twist.
- [jsw](#source-jsw), §7.4.1, p. 45. Signs multiply under the factorisation.

<a id="rankzeroonebsd-bsd-0-rational-newform-bridge"></a>

### The rational newform of E and its L-series

`RankZeroOneBSD:BSD.0/rational-newform-bridge` · comparison.

For E/ℚ elliptic of conductor N, the newform F_E ∈ S₂(Γ₀(N)) of EllipticCurveModularity R29.3 has rational integer Fourier coefficients and (E.LFunction n : ℂ) = a_n(F_E) for every n ≥ 1, including n divisible by primes of bad reduction. Hence E.LSeries = the Dirichlet series of F_E on Re s > 3/2, the entire extension of E's coefficient series is that of F_E (Mathlib ModularForm.L at strict width one), and ellipticL E takes real values on ℝ with real derivatives at s = 1.

**Hypotheses.**

- Uses the actual modularity theorem (R29.6), not a hypothesis on E.

**Proof route.**

1. Prime coefficients: R29.4/bad-euler-factors identifies every local polynomial of E with that of F_E.
2. Prime-power and composite coefficients: both sequences are multiplicative with the same Hecke recursion at each prime, so the Euler products agree coefficientwise.
3. Rationality: R29.3/rational-coefficient-field; real coefficients give ellipticL E (conj s) = conj (ellipticL E s).

**Inputs.** `EllipticCurveModularity:R29.3/newform-of-E`; `EllipticCurveModularity:R29.3/rational-coefficient-field`; `EllipticCurveModularity:R29.4/bad-euler-factors`; `EllipticCurveModularity:R29.6/modularity-theorem`; `mathlib:WeierstrassCurve.LFunction`; `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`.

**Acceptance.**

- E = 11a1: a₂ = −2, a₃ = −1, a₅ = 1, a₁₁ = 1 agree with η(q)²η(q¹¹)² = q − 2q² − q³ + 2q⁴ + q⁵ + ⋯.

**Sources.**

- [jsw](#source-jsw), §7.3.2, p. 44. L(E,s) = L(F_E,s) with F_E of weight two and level N.

<a id="rankzeroonebsd-bsd-0-congruent-number-root-numbers"></a>

### Root numbers of the congruent-number twists

`RankZeroOneBSD:BSD.0/congruent-number-root-numbers` · application.

Let E : y² = x³ − x (conductor 32) and, for a positive squarefree integer n, E^(n) : n y² = x³ − x, the twist by the quadratic character attached to n (for n=1 use E itself; ℚ(√1) is not a quadratic extension). Then rootNumber E^(n) = +1 exactly when n ≡ 1, 2, 3 (mod 8), and −1 when n ≡ 5, 6, 7 (mod 8). E^(−1) ≅ E, so the classification is for positive n only.

**Hypotheses.**

- n > 0 squarefree. The twist-root-number formula does not apply directly, since D = disc ℚ(√n) is even when n ≢ 1 mod 4 or n even, and 2 | N.

**Proof route.**

1. Write rootNumber E^(n) = w_∞ · w_2 · ∏_{ℓ | n odd} w_ℓ with w_∞ = −1 (rootNumber_eq_prod_local).
2. For odd ℓ | n, E^(n) has additive potentially good reduction of type I₀* at ℓ and w_ℓ = (−1/ℓ) (local ε-factor of a ramified quadratic twist of an unramified representation, GL2AutomorphicRepresentationsAndTransfer R16.3).
3. At 2, w_2(E^(n)) depends only on n mod 8 (E has CM by ℤ[i] and potentially good reduction at 2); evaluate it on the representatives n = 1, 2, 3, 5, 6, 7 (Birch–Stephens).
4. Combine: the product is +1 exactly for n ≡ 1, 2, 3 (mod 8).

**Inputs.** [RankZeroOneBSD:BSD.0/completed-l-function](#rankzeroonebsd-bsd-0-completed-l-function); [RankZeroOneBSD:BSD.0/twist-local-factors](#rankzeroonebsd-bsd-0-twist-local-factors); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity); `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Acceptance.**

- n = 1, 2, 3: w = +1 (not congruent numbers); n = 5, 6, 7: w = −1 (congruent numbers, analytic rank odd).
- The ArithmeticStatistics ST.5 consumer reads w(E^(n)) = +1 for n ≡ 1, 2, 3 mod 8 from this node.

**Sources.**

- [burungale-tian](#source-burungale-tian), Footnote 2 to Theorem 1.2, p. 2. The statement, cited from Birch–Stephens.

## BSD.1 — Quadratic arithmetic comparisons

Restriction, conjugation, trace and the existing twist equivalence identify the rational plus and minus point spaces. Rational rank splitting is followed by the integral index, height and torsion corrections. Odd-primary Selmer/Sha splitting and finiteness descent use actual continuous localization and restriction/corestriction maps. The two-primary comparison and imaginary-quadratic period formula do not discard the bounded kernels or minimal-differential factors; a genuine period-lattice interface is still needed.

**Planets:** Quadratic trace and twist maps ([declaration](#rankzeroonebsd-bsd-1-quadratic-point-maps)); Rank splitting over K ([declaration](#rankzeroonebsd-bsd-1-rank-splitting)); Odd-primary Selmer decomposition ([declaration](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition)); Descent of Sha finiteness ([declaration](#rankzeroonebsd-bsd-1-sha-finiteness-descent)); Tamagawa factors under base change ([declaration](#rankzeroonebsd-bsd-1-tamagawa-base-change)).

<a id="rankzeroonebsd-bsd-1-quadratic-point-maps"></a>

### Restriction, conjugation, trace and twist maps on points over a quadratic field

`RankZeroOneBSD:BSD.1/quadratic-point-maps` · construction.

Let E/ℚ be elliptic, K a quadratic field with nontrivial automorphism σ, E_K = E.baseChange K and E^K = E.quadraticTwist K. Define the additive maps res : E(ℚ) → E(K) (Point.map along ℚ → K), conj : E(K) → E(K) (Point.map along σ), tr : E(K) → E(ℚ) with res (tr P) = P + σP, and ι : E^K(ℚ) → E(K), the composite of res for E^K with quadraticTwistPointEquiv E^K(K) ≃+ E(K). Then res and ι are injective, range res = {P : σP = P}, range ι = {P : σP = −P}, tr ∘ res = 2·id, res ∘ tr = 1 + conj, and 2·E(K) ⊆ range res + range ι.

**Hypotheses.**

- K/ℚ quadratic; the twist is Tau Ceti's quadraticTwist and the point isomorphism is chosen once (well defined up to the automorphism −1).

**Proof route.**

1. res and conj are Mathlib's Point.map; σ² = 1 gives conj² = id.
2. tr: P + σP is σ-fixed, so it descends uniquely to E(ℚ) by Point.exists_baseChange_eq_of_map_eq (uniqueness from injectivity of res).
3. ι: by quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map with M = K and σ the nontrivial element (χ(σ) = −1), points of E^K(ℚ) go to σ-anti-fixed points; conversely an anti-fixed point of E(K) pulls back to a σ-fixed point of E^K(K), which descends.
4. 2P = (P + σP) + (P − σP) with P + σP ∈ range res and P − σP ∈ range ι.

**Inputs.** `mathlib:WeierstrassCurve.Affine.Point`; `mathlib:WeierstrassCurve.Affine.Point.map`; `mathlib:WeierstrassCurve.baseChange`; `tauceti:WeierstrassCurve.quadraticTwist`; `tauceti:WeierstrassCurve.quadraticTwistPointEquiv`; `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`; `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- RankZeroOneBSD:BSD.1/rank-splitting: the ± decomposition of E(K) ⊗ ℚ
- RankZeroOneBSD:BSD.3: the Heegner point y_K lies in the eigenspace selected by the root number, read through range res or range ι
- Gross, Kolyvagin's work, §5: complex conjugation acts on y_K by a sign, placing it in E(ℚ) or in the twist

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.Affine.Point.quadraticRes` | constructor | res : E(ℚ) →+ E(K), injective. |
| `WeierstrassCurve.Affine.Point.quadraticConj` | constructor | conj : E(K) →+ E(K), the action of σ; conj ∘ conj = id. |
| `WeierstrassCurve.Affine.Point.quadraticTrace` | constructor | tr : E(K) →+ E(ℚ) with res (tr P) = P + conj P. |
| `WeierstrassCurve.Affine.Point.twistEmbed` | constructor | ι : E^K(ℚ) →+ E(K), injective. |
| `WeierstrassCurve.Affine.Point.quadraticTrace_res` | simp | tr (res P) = 2 • P. |
| `WeierstrassCurve.Affine.Point.res_quadraticTrace` | simp | res (tr P) = P + conj P. |
| `WeierstrassCurve.Affine.Point.range_quadraticRes` | characterisation | range res = {P \| conj P = P}. |
| `WeierstrassCurve.Affine.Point.range_twistEmbed` | characterisation | range ι = {P \| conj P = −P}. |
| `WeierstrassCurve.Affine.Point.two_smul_mem_sup` | relation | 2 • P ∈ range res ⊔ range ι for every P ∈ E(K). |
| `WeierstrassCurve.Affine.Point.quadraticTrace_twistEmbed` | simp | tr (ι Q) = 0. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.Affine.Point.quadraticTrace_res_test` | characterisation | For E = 37a1, K = ℚ(√−7) and P = (0, 0) ∈ E(ℚ), tr (res P) = 2P = (1, 0). |
| `WeierstrassCurve.Affine.Point.twistEmbed_anti` | characterisation | conj (ι Q) = −ι Q for every Q ∈ E^K(ℚ). |
| `WeierstrassCurve.Affine.Point.quadraticTrace_not_surjective` | non-example | tr is not surjective in general: for E = 37a1 (E(ℚ) = ℤ·(0,0), no torsion) and any quadratic K with E(K) = res E(ℚ) + E(K)_tors, the image of tr is 2E(ℚ) ≠ E(ℚ). |
| `WeierstrassCurve.Affine.Point.ker_res_add_twistEmbed` | compatibility | The kernel of res + ι on E(ℚ) × E^K(ℚ) is contained in E(ℚ)[2] × E^K(ℚ)[2] (Submodule.torsionBy ℤ _ 2). |

**Acceptance.**

- For P ∈ E(ℚ), tr (res P) = 2P.
- ker(res + ι : E(ℚ) × E^K(ℚ) → E(K)) is a subgroup of E(ℚ)[2] × E^K(ℚ)[2].

**Sources.**

- [tauceti-twist](#source-tauceti-twist), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map. The twist points are the χ-eigenspace of E(K).
- [jsw](#source-jsw), §7.4.1, p. 47. The eigenspace decomposition the maps realise, at odd p.

<a id="rankzeroonebsd-bsd-1-rank-splitting"></a>

### Rank splitting over a quadratic field

`RankZeroOneBSD:BSD.1/rank-splitting` · theorem.

For E/ℚ elliptic and K a quadratic field, rank E(K) = rank E(ℚ) + rank E^K(ℚ), where rank is Module.finrank ℤ of the free quotient PointModTorsion. More precisely res + ι : E(ℚ) ⊕ E^K(ℚ) → E(K) has kernel and cokernel killed by 2, both finite.

**Hypotheses.**

- K/ℚ quadratic; all three groups finitely generated (Mordell–Weil over number fields).

**Proof route.**

1. Kernel: if res P + ι Q = 0 then applying conj gives res P − ι Q = 0, so 2 res P = 0 and 2 ι Q = 0, hence P ∈ E(ℚ)[2] and Q ∈ E^K(ℚ)[2].
2. Cokernel: 2E(K) ⊆ range res + range ι (quadratic-point-maps), so the cokernel is a quotient of E(K)/2E(K), finite by Mordell–Weil and killed by 2.
3. Tensoring with ℚ kills both, giving the rank identity.

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`; `tauceti:WeierstrassCurve.Affine.PointModTorsion`; `mathlib:Module.finrank`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Acceptance.**

- E = 37a1, K = ℚ(√−7): rank E(ℚ) = 1, and once rank E(K) = 1 is proved (BSD.3), rank E^K(ℚ) = 0.

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 46. The rank-zero twist case of the splitting, used with its regulator consequence.

<a id="rankzeroonebsd-bsd-1-quadratic-regulator-comparison"></a>

### Lattice index and regulators over a quadratic field

`RankZeroOneBSD:BSD.1/quadratic-regulator-comparison` · theorem.

Let E/ℚ be elliptic, K quadratic, Λ = E(K)/tors, Λ₊ = image of res and Λ₋ = image of ι, r₊ = rank E(ℚ), r₋ = rank E^K(ℚ), r = r₊ + r₋. Then Λ₊ ⊥ Λ₋ for the Néron–Tate pairing over K, [Λ : Λ₊ ⊕ Λ₋] = 2^a with 0 ≤ a ≤ r, and with K-relative heights (⟨P, P⟩_K = [K:ℚ]·⟨P, P⟩_ℚ for P defined over ℚ) Reg_BSD(E/K) = 2^r · Reg_BSD(E/ℚ) · Reg_BSD(E^K/ℚ) / 4^a. In particular, if r₋ = 0 then Reg_BSD(E/K) = 2^{r₊} Reg_BSD(E/ℚ)/4^a and E(K)/tors contains res(E(ℚ)/tors) with index 2^a.

**Hypotheses.**

- Reg_BSD is the regulator of GrossZagierAndArithmeticHeights GZ.0 (x-height normalisation, Reg_BSD = 2^r · Tau Ceti regulator).
- K-relative heights need a number-field instance of Tau Ceti's height machinery, which the pinned library lacks (GZ.0 gap); the statement is made for that instance.

**Proof route.**

1. Orthogonality: the height pairing over K is invariant under σ; for P ∈ Λ₊, Q ∈ Λ₋, ⟨P, Q⟩ = ⟨σP, σQ⟩ = −⟨P, Q⟩.
2. Index: 2Λ ⊆ Λ₊ ⊕ Λ₋ (quadratic-point-maps), so the index divides 2^r.
3. Heights of rational points relative to K are [K:ℚ] = 2 times their heights relative to ℚ; points of E^K(ℚ) carry the same K-height through the isomorphism over K.
4. Gram determinants: det Gram_K(Λ₊ ⊕ Λ₋) = 2^{r₊}Reg(E/ℚ)·2^{r₋}Reg(E^K/ℚ), and passing to the superlattice Λ divides by its index squared (GZ.0/gram-determinant-rescaling).

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); [RankZeroOneBSD:BSD.1/rank-splitting](#rankzeroonebsd-bsd-1-rank-splitting); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`; `GrossZagierAndArithmeticHeights:GZ.0/gram-determinant-rescaling`; `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`; `tauceti:WeierstrassCurve.Affine.neronTatePairing`; `tauceti:WeierstrassCurve.Affine.regulator`; `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Acceptance.**

- Rank one, r₋ = 0, a = 0: Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ).
- Rank zero over K: all regulators are 1 (regulator_eq_one_of_finrank_eq_zero).

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 46. JSW's comparison up to p-adic units; here the powers of 2 are kept.

<a id="rankzeroonebsd-bsd-1-torsion-comparison"></a>

### Torsion over a quadratic field

`RankZeroOneBSD:BSD.1/torsion-comparison` · lemma.

For E/ℚ elliptic, K quadratic and p an odd prime, res + ι induces E(ℚ)[p^∞] ⊕ E^K(ℚ)[p^∞] ≅ E(K)[p^∞]. At p = 2 the map E(ℚ)[2^∞] ⊕ E^K(ℚ)[2^∞] → E(K)[2^∞] has kernel and cokernel killed by 2. Consequently #E(K)_tors and #E(ℚ)_tors · #E^K(ℚ)_tors have the same odd part.

**Hypotheses.**

- K quadratic; torsion groups finite (Mordell–Weil).

**Proof route.**

1. On a p-primary group with p odd, multiplication by 2 is invertible, so P = ½(P + σP) + ½(P − σP) splits E(K)[p^∞] into its ±1 eigenspaces; quadratic-point-maps identifies them.
2. At p = 2 use the same kernel and cokernel estimates as rank-splitting.
3. For unconditional finiteness over number fields use fg_point_of_numberField and finite torsion of a finitely generated abelian group; pinned finite_torsion additionally requires height/Northcott instances.

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); `mathlib:Submodule.torsionBy`; `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): E(ℚ)_tors ≅ ℤ/5, and E(K)[5] = E(ℚ)[5] ⊕ E^K(ℚ)[5].

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 47. The same odd-p eigenspace splitting, applied to torsion.

<a id="rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition"></a>

### Odd-primary Selmer and Sha over a quadratic field

`RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition` · theorem.

Let E/ℚ be elliptic, K quadratic and p an odd prime. Restriction and the twist isomorphism give isomorphisms Sel_{p^∞}(E/K) ≅ Sel_{p^∞}(E/ℚ) ⊕ Sel_{p^∞}(E^K/ℚ) and Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞] ⊕ Ш(E^K/ℚ)[p^∞], compatible with the Kummer maps and the decomposition of points.

**Hypotheses.**

- p odd; the Selmer and Sha groups are those of EllipticCurves Layer 7 (Selmer structures on E[p^∞] with the Kummer local conditions).

**Proof route.**

1. Gal(K/ℚ) = {1, σ} has order prime to p, so restriction H¹(ℚ, M) → H¹(K, M)^{Gal(K/ℚ)} is an isomorphism for p-primary M (inflation–restriction, H^i(ℤ/2, ·) killed by 2).
2. H¹(K, E[p^∞]) splits into σ-eigenspaces; the +1 part is H¹(ℚ, E[p^∞]) and the −1 part is H¹(ℚ, E^K[p^∞]) since E^K[p^∞] ≅ E[p^∞] ⊗ χ_K.
3. Local conditions: at each place v of ℚ the same argument applies to ⊕_{w|v} H¹(K_w, ·) (semilocal Shapiro), and the Kummer images correspond.
4. Sha is the cokernel of the Kummer map on Selmer groups; combine with torsion-comparison and rank-splitting for the points.

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); [RankZeroOneBSD:BSD.1/torsion-comparison](#rankzeroonebsd-bsd-1-torsion-comparison); `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology`.

**Acceptance.**

- If rank E^K(ℚ) = 0 and Ш(E^K/ℚ)[p^∞] = 0 then Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞].

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 47. The odd-primary decomposition used in the rank-one p-part argument.

<a id="rankzeroonebsd-bsd-1-two-primary-comparison"></a>

### The 2-primary restriction and corestriction comparison

`RankZeroOneBSD:BSD.1/two-primary-comparison` · theorem.

For E/ℚ elliptic and K quadratic, let R:Sel_{2∞}(E/ℚ)⊕Sel_{2∞}(E^K/ℚ)→Sel_{2∞}(E/K) be the combined ordinary and twisted restriction maps, and C the corresponding pair of corestrictions. Then C∘R=2·id on the direct sum and R∘C=2·id on Sel(E/K). The same holds on Sha[2∞]. Hence their kernels and cokernels are killed by 2, and finite using finite Sel₂ and the isogeny local-condition comparison. No integral direct sum decomposition at 2 is asserted. The formula res∘cor=1+σ applies only to the untwisted summand; the twisted summand contributes 1−σ.

**Hypotheses.**

- The 2-primary groups of EllipticCurves Layer 7; no hypothesis on E[2].

**Proof route.**

1. The rational isogenies Res_{K/ℚ}E ⇄ E×E^K induced by trace and twisted trace compose to multiplication by 2 in both orders. Obtain their Selmer and Sha maps from EC Layer 7, with Weil restriction and local Kummer compatibility.
2. The untwisted and twisted norms are 1+σ and 1−σ; adding gives 2. Cross terms vanish.
3. The finite isogeny-Selmer kernel and cokernel, or finite Sel₂ plus the local comparison, proves finiteness; being killed by 2 by itself is insufficient.

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): Sel₂ comparisons hold up to groups of exponent 2, and no statement about Ш[2] is made beyond this.

**Sources.**

- [jsw](#source-jsw), §7.2, p. 42. The passage is made for odd p; at p = 2 only the bounded comparison here is available.

<a id="rankzeroonebsd-bsd-1-sha-finiteness-descent"></a>

### Finiteness of Sha descends along a finite extension

`RankZeroOneBSD:BSD.1/sha-finiteness-descent` · theorem.

Let E/ℚ be elliptic and K/ℚ a finite Galois extension. If Ш(E/K) is finite then Ш(E/ℚ) is finite. In particular, for K quadratic, finiteness of Ш(E/K) implies finiteness of Ш(E/ℚ) and of Ш(E^K/ℚ).

**Hypotheses.**

- K/ℚ finite Galois; Ш as in EllipticCurves Layer 7, for the whole group (all primes).

**Proof route.**

1. The kernel of restriction Ш(E/ℚ) → Ш(E/K) lies in H¹(Gal(K/ℚ), E(K)) by inflation–restriction.
2. E(K) is finitely generated (Mordell–Weil) and Gal(K/ℚ) is finite, so H¹(Gal(K/ℚ), E(K)) is a finitely generated abelian group killed by [K:ℚ], hence finite.
3. So Ш(E/ℚ) is an extension of a subgroup of the finite Ш(E/K) by a finite group.
4. For E^K apply the same argument, since E^K ≅ E over K.

**Inputs.** `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Acceptance.**

- If Ш(E/K) is finite for some imaginary quadratic K (from HE.7), then Ш(E/ℚ) is finite: this is the descent step of BSD.3 and BSD.4.

**Sources.**

- [jsw](#source-jsw), §1.2, p. 1. Finiteness over ℚ is obtained from finiteness over an auxiliary K by this descent.

<a id="rankzeroonebsd-bsd-1-tamagawa-base-change"></a>

### Tamagawa factors under quadratic base change and twist

`RankZeroOneBSD:BSD.1/tamagawa-base-change` · theorem.

Let E/ℚ be elliptic, K quadratic and p an odd prime split in K. For every rational prime ℓ, v_p(∏_{w|ℓ} c_w(E/K))=v_p(c_ℓ(E/ℚ)c_ℓ(E^K/ℚ)). Thus the same equality holds for the global Tamagawa products. The split hypothesis at the valuation prime p is retained from Skinner–Zhang Corollary 9.2; it handles ℓ=p without using a prime-to-residue-characteristic cohomology argument.

**Hypotheses.**

- p odd; Tamagawa numbers from Tate's algorithm (EllipticCurves Layer 4) and their identification with the Néron component groups (NeronModelsAndSemistableAbelianVarieties R11.6/equation-component-comparison).
- p splits in K, as in the selected source Corollary 9.2. A broader version requires a separate local proof.

**Proof route.**

1. The p-part of c_w is the length of H¹(F_w, E[p^∞]^{I_w}) for w ∤ p (component groups and unramified cohomology, as in Skinner–Zhang Lemma 9.1).
2. ℓ split: E^K ≅ E over ℚ_ℓ = K_w for both w, so the two sides agree.
3. ℓ inert or ramified: with w the unique place above ℓ and p odd, restriction H¹(F_ℓ, E[p^∞]^{I_ℓ}) ⊕ H¹(F_ℓ, E^K[p^∞]^{I_ℓ}) → H¹(F_w, E[p^∞]^{I_w}) is an isomorphism (the ±1 eigenspaces of σ).
4. At ℓ=p, K_w=ℚ_p and the local twist is trivial, so the two factors agree directly. The inertia-cohomology argument above is used only at ℓ≠p.

**Inputs.** [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Acceptance.**

- E = 11a1 (c₁₁ = 5), K = ℚ(√−7) with 11 split: ∏_{w|11} c_w(E/K) = 25 = c₁₁(E)·c₁₁(E^K).

**Sources.**

- [skinner-zhang](#source-skinner-zhang), §9.1, Corollary 9.2, p. 29. The p-adic lengths t of the Tamagawa factors add over a quadratic base change.
- [jsw](#source-jsw), §7.3.1, (7.3.a), p. 43. The product form used by JSW.

<a id="rankzeroonebsd-bsd-1-quadratic-period"></a>

### The period of E over an imaginary quadratic field and its comparison

`RankZeroOneBSD:BSD.1/quadratic-period` · construction.

For E/ℚ elliptic with Néron differential ω and K imaginary quadratic of discriminant D, the period of E/K is Ω_{E/K} := N_{K/ℚ}(𝔞_ω) · 2∫_{E(ℂ)} |ω ∧ ω̄|, where 𝔞_ω is the fractional ideal with 𝔞_ω·ω = Ω¹(Néron model of E over 𝓞_K). Comparison: Ω_{E/K} · |D|^{−1/2} and Ω_E · Ω_{E^K} (real periods with all real components) agree up to a power of 2 and the norm of the Néron-lattice change at primes dividing (D, N); when (D, 2N) = 1 the ideal 𝔞_ω is 𝓞_K and Ω_E·Ω_{E^K} = 2^e·|D|^{−1/2}·Ω_{E/K} with e ∈ ℤ determined by c∞(E), c∞(E^K) and the shape of the period lattice.

**Hypotheses.**

- K imaginary quadratic. The exact power of 2 is fixed in the proof from the real-component counts; the comparison at odd primes needs no such bookkeeping.

**Proof route.**

1. Néron differentials: if ℓ ∤ 2D, the minimal model of E over ℤ_ℓ stays minimal over 𝓞_{K,w}, so 𝔞_ω is supported on primes dividing 2D (NeronModelsAndSemistableAbelianVarieties R11.6/semistable-differential-basechange and equation-minimal-differential).
2. The twist E^K has the Néron differential ω_{E^K} = u·√D^{−1}·ω over K for an explicit u ∈ ℤ[1/2D]^× from its minimal model.
3. Write the period lattice of ω as Λ_ω; ∫_{E(ℂ)}|ω∧ω̄| = 2·covol(Λ_ω), Ω_E = c∞(E)·(least positive real period) and Ω_{E^K} is the corresponding real period of √D^{−1}ω, i.e. |D|^{−1/2} times the least imaginary period of Λ_ω up to the index of Λ_ω^+ ⊕ Λ_ω^− in Λ_ω (1 or 2).
4. Combine: Ω_E Ω_{E^K} |D|^{1/2} = 2^e covol(Λ_ω), and Ω_{E/K} = 4 covol(Λ_ω) when 𝔞_ω = 𝓞_K.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`; `NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-differential-basechange`; `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-minimal-differential`; [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `tauceti:TauCeti.Isogeny`; `tauceti:TauCeti.Isogeny.degree`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- JSW Conjecture 7.1.1(b): the period in the BSD formula over F = K
- RankZeroOneBSD:BSD.5: the Gross–Zagier formula over K is converted into a statement about Ω_E Reg(E/ℚ) and L(E^K,1)/Ω_{E^K}
- RankZeroOneBSD:BSD.6: the period relation (7.3.e) in the p-part arguments

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.quadraticPeriod` | constructor | Ω_{E/K} for K imaginary quadratic, as N(𝔞_ω)·2∫_{E(ℂ)}\|ω∧ω̄\|. |
| `WeierstrassCurve.quadraticPeriod_pos` | other | 0 < Ω_{E/K}. |
| `WeierstrassCurve.quadraticPeriod_eq_covolume` | characterisation | If 𝔞_ω = 𝓞_K then Ω_{E/K} = 4·covol(Λ_ω), Λ_ω the period lattice of the Néron differential. |
| `WeierstrassCurve.realPeriod_mul_twist_eq` | relation | Ω_E · Ω_{E^K} · \|D\|^{1/2} = 2^e · Ω_{E/K} for (D, 2N) = 1, with e explicit. |
| `WeierstrassCurve.padicValRat_period_ratio` | compatibility | For p ∤ 2DN, the p-adic valuation of the rational number Ω_E Ω_{E^K}\|D\|^{1/2}/Ω_{E/K} is 0. |
| `WeierstrassCurve.quadraticPeriod_of_isogenous` | compatibility | Under a ℚ-isogeny of degree prime to p the ratio of periods over K is a p-adic unit. |
| `WeierstrassCurve.quadraticPeriod_eq_norm_mul_covolume` | relation | quadraticPeriod E K = N(𝔞_ω) * (4*covol(Λ_ω)), with the actual Néron differential lattice and period lattice supplied by their owners. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.quadraticPeriod_pos_test` | degenerate | Ω_{E/K} > 0 for every E/ℚ and K imaginary quadratic. |
| `WeierstrassCurve.period_ratio_rational` | characterisation | Ω_E Ω_{E^K}\|D\|^{1/2}/Ω_{E/K} ∈ ℚ^× and its odd part is 1 when (D, 2N) = 1. |
| `WeierstrassCurve.quadraticPeriod_not_half_covolume` | non-example | If the Néron differential ideal has norm 1 and its period-lattice covolume c is positive, Ω_{E/K}=4c and Ω_{E/K}≠2c. This detects the missing factor 2 in the complex integral, without asserting an unproved transcendence comparison with Ω_E². |

**Acceptance.**

- Odd-part identity: for p ∤ 2DN, ord_p(Ω_E Ω_{E^K} |D|^{1/2}) = ord_p(Ω_{E/K}) in the sense of the rational ratio (JSW (7.3.e) up to ℤ_(p)^× multiples).

**Sources.**

- [jsw](#source-jsw), Conjecture 7.1.1, (7.1.b), p. 42. The definition of Ω_{E/F}.
- [jsw](#source-jsw), §7.3.2, (7.3.e), p. 44. The odd-part period comparison.

<a id="rankzeroonebsd-bsd-1-odd-part-bsd-over-k"></a>

### The BSD quotient over K versus over ℚ at odd primes

`RankZeroOneBSD:BSD.1/odd-part-bsd-over-K` · comparison.

Under the hypotheses listed here, the valuation of the rational nonzero BSD defect for E/K equals the sum of those for E and E^K. Thus if one of the two rational-curve p-parts is already known, the p-part over K is equivalent to the other. No conclusion about the separate vanishing of two arbitrary summands follows from their sum alone.

**Hypotheses.**

- p odd and split in K; (D_K,2N)=1. Assume matching analytic/algebraic ranks and rational nonzero normalized BSD quotients for E, E^K and E/K, with finite p-primary Sha; rank≤1 applications obtain these from BSD.3–5. The comparison itself does not assert general-rank rationality or finiteness.

**Proof route.**

1. L-values: L*(E/K,1) = L*(E,1)·L*(E^K,1) (BSD.0/base-change-central-identities).
2. Regulators: quadratic-regulator-comparison; the powers of 2 are p-adic units.
3. Periods: quadratic-period; |D_K|^{−1/2} in (7.1.a) cancels the |D|^{1/2} of the comparison.
4. Tamagawa factors: tamagawa-base-change. Torsion: torsion-comparison. Sha: odd-selmer-sha-decomposition.

**Inputs.** [RankZeroOneBSD:BSD.1/quadratic-regulator-comparison](#rankzeroonebsd-bsd-1-quadratic-regulator-comparison); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); [RankZeroOneBSD:BSD.1/torsion-comparison](#rankzeroonebsd-bsd-1-torsion-comparison); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities).

**Acceptance.**

- Used with p ∤ 2N D_K in BSD.6: the p-part of BSD for E/K′ plus the rank-zero p-part for E^{K′} gives the p-part for E.

**Sources.**

- [jsw](#source-jsw), §7.1, p. 41. The comparison principle.

## BSD.2 — Nonvanishing and auxiliary fields

The imported multiple Dirichlet series is not itself the elliptic nonvanishing theorem. The BFH residue is combined with a two-vector cancellation and a third polar-term separation to force nonzero twists. Infinitude supports exclusion of each finite list of ramified primes. Arbitrary prescribed local behaviour uses Friedberg–Hoffstein Theorem B, whose unread proof remains a source gap. Selection for each prime-part argument records the exact local reduction range of the later source.

**Planets:** Heegner hypothesis ([declaration](#rankzeroonebsd-bsd-2-heegner-local-conditions)); Bump–Friedberg–Hoffstein nonvanishing ([declaration](#rankzeroonebsd-bsd-2-bfh-nonvanishing)); Heegner field selection ([declaration](#rankzeroonebsd-bsd-2-heegner-field-selection)).

<a id="rankzeroonebsd-bsd-2-heegner-local-conditions"></a>

### Admissible discriminants with prescribed local conditions

`RankZeroOneBSD:BSD.2/heegner-local-conditions` · definition.

Fix N ≥ 1 and a finite set S of primes with every ℓ | N in S, together with a local prescription π : S → {split, inert, ramified} and a sign η ∈ {±1}. A fundamental discriminant D is (S, π, η)-admissible if sign D = η and each ℓ ∈ S has the prescribed behaviour in ℚ(√D) (χ_D(ℓ) = 1, −1 or 0). The Heegner hypothesis for N is the prescription 'every ℓ | N splits'; the generalized Heegner hypothesis for a factorisation N = N⁺N⁻ with N⁻ squarefree is 'ℓ | N⁺ splits, ℓ | N⁻ inert'. The prescription is compatible with an elliptic curve E of conductor N and a target sign w ∈ {±1} if every admissible D coprime to N gives rootNumber E^{ℚ(√D)} = w (by twist-root-number this is a condition on η and on π at the primes dividing N). S contains actual primes, D≠1 is required to define a quadratic field, and compatibility includes existence of an admissible discriminant. For prescriptions ramified at a conductor prime, the coprime twist-root-number formula does not apply; use the local epsilon-factor computation separately.

**Hypotheses.**

- Only finitely many primes are prescribed.
- Fundamental discriminants as in Mathlib's Int.IsFundamentalDiscr.
- S contains primes, and a prescription used in a nonvanishing theorem is nonempty and has the required local epsilon sign, including at ramified conductor primes.

**Proof route.**

1. Admissibility is decidable: it is a finite list of Kronecker-symbol conditions (quadratic-field-character).
2. Compatibility: for (D, N) = 1, rootNumber E^D = χ_D(−N)·rootNumber E with χ_D(−N) = η·∏_{ℓ|N} χ_D(ℓ)^{v_ℓ(N)}, which is determined by η and π.
3. For prescriptions with no ramified entries, choose a nonzero residue class satisfying the odd Legendre and dyadic Kronecker conditions, then a prime in the corresponding progression to obtain fundamental discriminants of the chosen sign. Discard D=1. General ramified prescriptions require their own compatible local construction, not a vacuous coprime implication.

**Inputs.** [RankZeroOneBSD:BSD.0/quadratic-field-character](#rankzeroonebsd-bsd-0-quadratic-field-character); [RankZeroOneBSD:BSD.0/twist-root-number](#rankzeroonebsd-bsd-0-twist-root-number); `mathlib:Int.IsFundamentalDiscr`; `ClassicalArithmeticCompletion:CA.1/kronecker-character`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD/Twists`; namespace `TauCeti.BSD`.

**Uses.**

- RankZeroOneBSD:BSD.2/heegner-field-selection: selects K with the Heegner hypothesis and nonvanishing twist
- JSW §7.4.1–7.4.2: the auxiliary fields K′ and K″ are given by generalized Heegner prescriptions with p split
- Castella erratum Theorem 1.1: the field K with a Heegner ideal 𝔑, p split and conditions at 2 and at nonsplit q

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.LocalPrescription` | structure | A finite set S of primes, a map S → {split, inert, ramified} and a sign. |
| `TauCeti.BSD.LocalPrescription.Admissible` | constructor | The predicate on fundamental discriminants D: sign and Kronecker symbols at S as prescribed. Require D≠1; the set S consists of actual primes. |
| `TauCeti.BSD.LocalPrescription.heegner` | constructor | The Heegner prescription for N (all ℓ \| N split, sign −1). |
| `TauCeti.BSD.LocalPrescription.generalizedHeegner` | constructor | The generalized Heegner prescription for N = N⁺N⁻. |
| `TauCeti.BSD.LocalPrescription.admissible_decidable` | instance | Admissibility is decidable. |
| `TauCeti.BSD.LocalPrescription.rootNumber_twist_of_admissible` | relation | For admissible D with (D, N) = 1, rootNumber E^D = η·∏_{ℓ\|N} χ_D(ℓ)^{v_ℓ(N)}·rootNumber E. Assume every prime of N lies in the prescribed set S. |
| `TauCeti.BSD.LocalPrescription.infinite_admissible` | other | If the prescription has no ramified entries, the set of admissible D is infinite (of either prescribed sign). |
| `TauCeti.BSD.LocalPrescription.mono` | functoriality | Enlarging S (with any prescription on the new primes) shrinks the admissible set. |
| `TauCeti.BSD.LocalPrescription.admissible_congr` | extensionality | Equal prescribed prime sets, equal behaviours on that set and equal signs give equivalent admissibility predicates for every D; values of the behaviour map outside S are irrelevant. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `TauCeti.BSD.LocalPrescription.heegner_11_neg7` | computation | D = −7 is admissible for the Heegner prescription of N = 11. |
| `TauCeti.BSD.LocalPrescription.heegner_11_neg3` | non-example | D = −3 is not admissible for the Heegner prescription of N = 11 (11 is inert in ℚ(√−3)). |
| `TauCeti.BSD.LocalPrescription.empty` | degenerate | With S = ∅ and η = −1 every negative fundamental discriminant is admissible. |
| `TauCeti.BSD.LocalPrescription.heegner_sign` | compatibility | For the Heegner prescription and (D, N) = 1, rootNumber E^D = −rootNumber E (BSD.0/twist-root-number). |

**Acceptance.**

- For N = 11 and S = {11}, D = −7 is admissible for 'split' (11 ≡ 4 = 2² mod 7), D = −3 is not (11 ≡ 2 mod 3 is a nonsquare).

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 45. Local prescriptions are finitely many congruence conditions.
- [bfh90](#source-bfh90), Introduction, p. 543. The Heegner hypothesis as a Kronecker-symbol condition.

<a id="rankzeroonebsd-bsd-2-twist-series-residue"></a>

### The polar term of the BFH twist series and its nonvanishing

`RankZeroOneBSD:BSD.2/twist-series-residue` · theorem.

For a cuspidal even-weight newform f with trivial character and a finite set S of primes containing its conductor primes, choose the BFH arithmetic datum with all S dividing N, 8|N, m=N rad(N), r=1 and the test-vector data of §9. There exist compatible test vectors giving a nonzero polar coefficient for the central derivative branch and a nonzero polar coefficient for the central value branch. These are the weighted double-Dirichlet series of MP.8; they are not asserted to be the unweighted series over fundamental discriminants. The poles force infinitely many squareclasses supporting nonzero central values/derivatives with every S-prime split.

**Hypotheses.**

- f a newform of even weight with trivial character (k = 2 for elliptic curves).
- Test vectors and K-types as in MP.8/local-test-nonzero-f, -tau, -m.
- The identification L(s, D₀) = L_N(s + k/2 − 2, f ⊗ χ_{D₀})/L_N(2s + k − 4, Sym²f) of MP.8/bsd2-export.

**Proof route.**

1. Import MP.8 two-variable polar combination, interchanges and the special-value coefficient identification. After twisting initially, BFH §9 reduces to ε=+1.
2. BFH pp.614–615: choose σ₁,T₁,y₂ with F₁⁺(1/2,2)≠0 and τ₁(2)=0 using Proposition 3.12; independently choose σ₂,T₂,y₂ with τ₂(2)≠0 using Proposition 3.13. Subtract (9.4),(9.5) to obtain (9.6), with q=F₁⁺ τ₂ nonzero at (1/2,2). No assertion that all test values of one vector are simultaneously nonzero is used.
3. Derivative branch, p.616: Z⁻(u,2)=0 by sign and Lemma 9.1; therefore p(1/2,2)=q(1/2,2). Differentiating (9.6), the double-pole coefficient is −(p+q) at the intersection, equal to −2q≠0.
4. Value branch, p.617: a third vector from Proposition 3.15 has M₃(2)≠0 and τ₃(2)=0. Multiply (9.5) by M₃(2) and (9.10) by M₂(2), then subtract. After Z⁻(u,2)=0 the simple-pole coefficient is M₃(2)τ₂(2)≠0.
5. Lemma 9.1 factors each coefficient as a holomorphic multiplier times L(s+k/2−2,f⊗χ_{D₀}); its derivative implication uses the central zero. Proposition 7.1 excludes a pole of this order from finitely many fundamental squareclasses. This proves the required infinitude, not just a nonzero series.

**Inputs.** `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`; `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`; `MetaplecticAutomorphicForms:MP.8/two-variable-twist-series`; `MetaplecticAutomorphicForms:MP.8/bsd2-export`; `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`; `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`; `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`; `MetaplecticAutomorphicForms:MP.7`; [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions).

**Acceptance.**

- For f the newform of 37a1 (ε = −1) and S = {37}, the series over admissible D < 0 of L(1, f ⊗ χ_D)|D|^{−w} is not identically zero; every admissible D coprime to 37 has twisted sign +1 (BSD.0/twist-root-number), so no central value is forced to vanish.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 544. The twist series whose polar behaviour is analysed.
- [bfh90](#source-bfh90), Introduction, p. 544. Nonvanishing from the polar term.
- [bfh90](#source-bfh90), §9, printed pp.614–617, equations (9.4)–(9.10), Lemma 9.1. The derivative double-pole coefficient is −2q; the value branch uses a third representation and M₃(2)τ₂(2). Read directly from the scan.

<a id="rankzeroonebsd-bsd-2-bfh-nonvanishing"></a>

### Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein)

`RankZeroOneBSD:BSD.2/bfh-nonvanishing` · theorem.

Let f be a cuspidal newform of even weight k with trivial character for Γ₀(M), S a finite set of primes containing all primes dividing M, and ε the sign of the functional equation of f. (i) There is a fundamental discriminant D with εD < 0 such that every prime in S splits in ℚ(√D) and L(s, f, χ_D) has a simple zero at s = k/2. (ii) There is a fundamental discriminant D with εD > 0 such that every prime in S splits in ℚ(√D) and L(k/2, f, χ_D) ≠ 0. Moreover in each case there are infinitely many such D.

**Hypotheses.**

- Every prime of S split; the sign of D is forced by ε through the twisted sign εχ_D(−M) (BSD.0/twist-root-number).
- Infinitely many: not stated in BFH's Theorem; proved here by enlarging S.

**Proof route.**

1. twist-series-residue, including BFH Proposition 7.1, gives infinitely many fundamental squareclasses with nonzero central value or derivative; Lemma 9.1 transfers from weighted coefficients.
2. In case (i), εD < 0 and every ℓ | M splits give sign −ε·ε = −1 for f ⊗ χ_D, so its order at k/2 is odd; a nonzero derivative means a simple zero.
3. Alternatively, to exclude any finite list D₁,…,D_n, choose for each D_i a prime q_i dividing that D_i and enlarge S by all q_i. Each new discriminant has every q_i split and therefore differs from every old D_i. One prime dividing the product need not divide every D_i.

**Inputs.** [RankZeroOneBSD:BSD.2/twist-series-residue](#rankzeroonebsd-bsd-2-twist-series-residue); [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions); [RankZeroOneBSD:BSD.0/twist-root-number](#rankzeroonebsd-bsd-0-twist-root-number); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity).

**Acceptance.**

- For f attached to 11a1 (ε = +1), case (i) produces D < 0 with 11 split and L′(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (11 splits) whose twist has sign −1.
- For f attached to 37a1 (ε = −1), case (ii) produces D < 0 with 37 split and L(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (37 splits) whose twist has sign +1.

**Sources.**

- [bfh90](#source-bfh90), Theorem, pp. 543–544. Derivative branch.
- [bfh90](#source-bfh90), Theorem, p. 544. Value branch.

<a id="rankzeroonebsd-bsd-2-prescribed-local-conditions-value-branch"></a>

### Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein)

`RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch` · theorem.

Let f ∈ S₂(Γ₀(N)) be a newform with trivial character and (S, π, η) a local prescription (heegner-local-conditions) in which π may require primes to be split, inert or ramified, compatible with root number +1 for the twists: every admissible D coprime to N has w(f ⊗ χ_D) = +1. Then there are infinitely many admissible fundamental discriminants D with L(1, f ⊗ χ_D) ≠ 0.

**Hypotheses.**

- Compatibility with sign +1 is necessary: a twist of sign −1 has vanishing central value.
- The theorem is Friedberg–Hoffstein, Annals 142 (1995), Theorem B; the paper is not publicly available and was not read for this plan (recorded gap); the statement is taken in the form JSW applies it.
- The local prescription has admissible discriminants and actual local twist sign +1; ramified conductor prescriptions cannot be justified by a statement quantified only over coprime D.

**Proof route.**

1. Friedberg–Hoffstein construct the twist series with arbitrary local test data on the double cover of GL₂ (MetaplecticAutomorphicForms MP.7) instead of the genus-two Jacobi construction, and extract a nonzero residue as in twist-series-residue.
2. Infinitude by enlarging S as in bfh-nonvanishing.

**Inputs.** `MetaplecticAutomorphicForms:MP.7`; [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions); [RankZeroOneBSD:BSD.2/twist-series-residue](#rankzeroonebsd-bsd-2-twist-series-residue); [RankZeroOneBSD:BSD.0/twist-root-number](#rankzeroonebsd-bsd-0-twist-root-number).

**Acceptance.**

- JSW §7.4.1: with N = q₁⋯q_r squarefree, the conditions (gen-H), q inert or ramified and p split are compatible with sign +1 for E^{D′} when ord L(E,s) = 1.

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 45. The theorem as JSW use it.

<a id="rankzeroonebsd-bsd-2-heegner-field-selection"></a>

### Choice of a Heegner field for analytic rank zero or one

`RankZeroOneBSD:BSD.2/heegner-field-selection` · theorem.

Let E/ℚ be elliptic of conductor N with analyticRank E ≤ 1, and let T be a finite set of primes. There are infinitely many imaginary quadratic fields K with discriminant D_K such that (a) every prime dividing N splits in K, (b) every prime in T splits in K, (c) D_K ∉ {−3, −4} and (D_K, 2N) = 1, and (d) analyticRank E^K = 1 − analyticRank E: if analyticRank E = 1 then ellipticL E^K 1 ≠ 0, and if analyticRank E = 0 then E^K has analytic rank one. For every such K, L(E/K, s) has a simple zero at s = 1.

**Hypotheses.**

- Applies to every E/ℚ, including CM and nonsemistable curves; the restrictions on K are discharged by the construction and are not hypotheses on E.

**Proof route.**

1. Put S = {primes dividing 2N} ∪ T ∪ {3} and apply bfh-nonvanishing to f = F_E (k = 2, ε = rootNumber E = (−1)^{analyticRank E} by root-number-parity).
2. Rank one: ε = −1, case (ii) gives D with εD > 0, i.e. D < 0, every ℓ ∈ S split and L(1, f ⊗ χ_D) ≠ 0; E^K has newform f ⊗ χ_D (BSD.0/twist-l-series) so ellipticL E^K 1 ≠ 0.
3. Rank zero: ε = +1, case (i) gives D < 0 with a simple zero of L(s, f ⊗ χ_D), i.e. analyticRank E^K = 1.
4. 2 split forces D ≡ 1 mod 8, so D is odd and D ≠ −4; 3 split forces D ≢ 0, 2 mod 3, so D ≠ −3; ℓ | N split forces (D, N) = 1.
5. BSD.0/base-change-central-identities gives the simple zero of L(E/K, s).

**Inputs.** [RankZeroOneBSD:BSD.2/bfh-nonvanishing](#rankzeroonebsd-bsd-2-bfh-nonvanishing); [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity); [RankZeroOneBSD:BSD.0/twist-l-series](#rankzeroonebsd-bsd-0-twist-l-series); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank).

**Acceptance.**

- E = 37a1 (rank one): ℚ(√−7) satisfies the Heegner hypothesis (37 and 2 split) but 3 is inert in it, so it is excluded once 3 ∈ S; the fields produced have D ≡ 1 mod 24 with 37 split.
- Every K produced has D_K odd, so the Heegner points of BSD.3 are defined with u_K = 1.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 544. The rank-zero use of the derivative branch.

<a id="rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts"></a>

### Simultaneous choice of the auxiliary fields of the prime-part arguments

`RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts` · theorem.

Let E/ℚ be semistable of conductor N with analyticRank E = 1, p an odd prime of good reduction with E[p] irreducible, and q ∥ N a prime at which E[p] is ramified. (a) There are infinitely many imaginary quadratic K′ with (gen-H) for N = N⁺N⁻, q inert or ramified, p split, and ellipticL E^{K′} 1 ≠ 0. (b) There are infinitely many imaginary quadratic K″ with the primes of N⁺ split, those of N⁻ inert (N⁺ = q, N⁻ = N/q if the number of prime factors of N is odd; N⁺ = 1 otherwise), p split and ellipticL E^{K″} 1 ≠ 0. (c) For E with multiplicative reduction at p > 3 and a nonsplit multiplicative q ≠ p at which E[p] ramifies, there are infinitely many K satisfying the hypotheses of Castella's corrected Theorem 1.1: a Heegner ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N, p split, 2 ∥ N if 2 is nonsplit, every q ∥ N nonsplit in K of nonsplit multiplicative reduction with at least one residually ramified, and ellipticL E^K 1 ≠ 0 whenever analyticRank E = 1.

**Hypotheses.**

- Hypotheses as in JSW §7.4 and the Castella erratum; each list is a finite set of local conditions compatible with root number +1 for the twist.

**Proof route.**

1. Each set of conditions is a local prescription (heegner-local-conditions) with finitely many primes.
2. Root numbers: w(E/K) = −1 for these K (sign −1 under (gen-H) with N⁻ having an even number of prime factors, resp. under (H)), and w(E) = −1, so w(E^K) = +1 by BSD.0/base-change-central-identities.
3. Apply prescribed-local-conditions-value-branch to the newform of E.
4. In Castella branch (c), q is ramified in K (per the erratum proof), so D_K is not coprime to N and E^K is additive at q. Compute the local epsilon signs and the Heegner-ideal ramified behaviour; BSD.0/twist-root-number is not sufficient. For the JSW supersingular upper-bound branch, also prove the chosen twist lies in BSTW’s ordinary-support range or use the direct rank-one BSTW endpoint instead.

**Inputs.** [RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch](#rankzeroonebsd-bsd-2-prescribed-local-conditions-value-branch); [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.0/twist-root-number](#rankzeroonebsd-bsd-0-twist-root-number).

**Acceptance.**

- JSW §7.4.1 and §7.4.2: both K′ and K″ exist for every E in Theorem 1.2.1.

**Sources.**

- [jsw](#source-jsw), §7.4.2, p. 47. The second auxiliary field.
- [castella-erratum](#source-castella-erratum), Theorem 1.1, p. 1. The field of Castella's Theorem 1.1.

## BSD.3 — Analytic rank one

A nonzero derivative over a Heegner field gives a non-torsion point by the imported Gross–Zagier height formula. The conjugation sign places that point in the rational rather than twisted eigenspace. Kolyvagin descent and the quadratic comparisons then give rank one and finite whole Sha over ℚ. This all-curve result includes CM and additive-reduction curves; it does not impose a prime-part theorem’s semistability assumptions.

**Planets:** Non-torsion Heegner point ([declaration](#rankzeroonebsd-bsd-3-heegner-point-nontorsion)); Gross–Zagier–Kolyvagin rank-one theorem ([declaration](#rankzeroonebsd-bsd-3-analytic-rank-one-theorem)).

<a id="rankzeroonebsd-bsd-3-heegner-point-nontorsion"></a>

### A nonzero derivative over K gives a non-torsion Heegner point

`RankZeroOneBSD:BSD.3/heegner-point-nontorsion` · theorem.

Let E/ℚ be elliptic of conductor N with a modular parametrisation φ : X₀(N) → E sending ∞ to O (EllipticCurveModularity R29.5), K imaginary quadratic of odd discriminant D_K with every prime dividing N split, and y_K = Tr_{H_K/K} φ(x₁) ∈ E(K) the Heegner point (HeegnerPointEulerSystems HE.1). If the continuation of L(E/K, s) = ellipticL E · ellipticL E^K has nonzero derivative at s = 1, then y_K has infinite order; conversely if y_K has infinite order then L′(E/K, 1) > 0.

**Hypotheses.**

- Heegner hypothesis and D_K odd (Gross–Zagier's standing hypotheses; CST's version allows the general case).
- L(E/K, s) is the continuation of BSD.0/base-change-factorization, so the derivative is that of the product.

**Proof route.**

1. Gross–Zagier: L′(E/K, 1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with ‖ω₀‖² > 0, C the Manin constant of φ (GZ.8/elliptic-curve-heegner-height-formula); the L-function there is the Rankin L-series of F_E with the trivial class character, which is L(E/K, s) by BSD.0/base-change-factorization and BSD.0/rational-newform-bridge.
2. If L′(E/K, 1) ≠ 0 then ĥ_K(y_K) ≠ 0; a torsion point has canonical height 0, so y_K has infinite order.
3. Conversely a point of infinite order has positive canonical height (isOfFinAddOrder_of_canonicalHeight_eq_zero and nonnegativity), so L′(E/K, 1) > 0.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`; `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `EllipticCurveModularity:R29.5/modular-parametrisation`; [RankZeroOneBSD:BSD.0/base-change-factorization](#rankzeroonebsd-bsd-0-base-change-factorization); [RankZeroOneBSD:BSD.0/rational-newform-bridge](#rankzeroonebsd-bsd-0-rational-newform-bridge); `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`.

**Acceptance.**

- E = 37a1, K with D_K ≡ 1 mod 24 from BSD.2/heegner-field-selection: y_K has infinite order, and lies in res E(ℚ) up to torsion (heegner-point-eigenspace).

**Sources.**

- [gross-zagier-86](#source-gross-zagier-86), Chapter V §2, Theorem (2.1), p. 311. The height formula; excerpt as verified by GZ.8.
- [jsw](#source-jsw), §7.4.1, p. 46. Non-torsion of the Heegner point from the Gross–Zagier formula.

<a id="rankzeroonebsd-bsd-3-heegner-point-eigenspace"></a>

### Complex conjugation on the Heegner point selects the rational or the twisted part

`RankZeroOneBSD:BSD.3/heegner-point-eigenspace` · theorem.

In the setting of heegner-point-nontorsion, let σ be complex conjugation (the nontrivial automorphism of K). Then σ(y_K) = −rootNumber(E)·y_K + t for a torsion point t ∈ E(K)_tors. Consequently, if y_K has infinite order: when rootNumber E = −1, tr(y_K) ∈ E(ℚ) has infinite order (so rank E(ℚ) ≥ 1); when rootNumber E = +1, the point y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order (so rank E^K(ℚ) ≥ 1).

**Hypotheses.**

- Gross's normalisation of the parametrisation (Gross §5, Proposition 5.3 with n = 1, traced from K₁ to K); t comes from the Fricke translate of the cusp ∞ and is torsion by Manin–Drinfeld (HE.1/parameter-choice-and-degree).

**Proof route.**

1. σ maps x₁ to w_N(x₁)^{[𝔫]}, a Galois conjugate of the Fricke translate (HE.0/dihedral-conjugation).
2. φ ∘ w_N = ε_N·φ + φ(w_N(∞)) with ε_N the Fricke eigenvalue on F_E and φ(w_N(∞)) torsion; summing over Gal(H_K/K) gives σ y_K = ε_N y_K + t.
3. rootNumber E = −ε_N (BSD.0/completed-l-function), so σ y_K = −w y_K + t (the n = 1 case of HE.4/complex-conjugation-parity).
4. If w = −1, res(tr y_K) = y_K + σ y_K = 2y_K + t, of infinite order; if w = +1, y_K − σ y_K = 2y_K − t is anti-invariant, hence in range ι (BSD.1/quadratic-point-maps).
5. The geometric Fricke eigenvalue is ε_N=−w_E. Thus φ∘w_N=ε_N φ+t=−w_E φ+t; do not insert an additional minus sign in the parametrisation relation. Gross Proposition 5.3 (printed p.243) matches this convention.

**Inputs.** `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`; [RankZeroOneBSD:BSD.0/completed-l-function](#rankzeroonebsd-bsd-0-completed-l-function); [RankZeroOneBSD:BSD.1/quadratic-point-maps](#rankzeroonebsd-bsd-1-quadratic-point-maps); [RankZeroOneBSD:BSD.3/heegner-point-nontorsion](#rankzeroonebsd-bsd-3-heegner-point-nontorsion).

**Acceptance.**

- E = 37a1 (w = −1): y_K is, up to torsion, a nonzero multiple of the generator (0, 0) of E(ℚ).

**Sources.**

- [gross-kolyvagin](#source-gross-kolyvagin), §5, Proposition 5.3, p. 243 (read from the page image). Complex conjugation on the Heegner points, ε the Fricke eigenvalue; tracing to K gives σ(y_K) = ε y_K + torsion.
- [gross-kolyvagin](#source-gross-kolyvagin), §5, (5.2) and the sentence after it, p. 243. So ε = −w_E.

<a id="rankzeroonebsd-bsd-3-analytic-rank-one-theorem"></a>

### Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin)

`RankZeroOneBSD:BSD.3/analytic-rank-one-theorem` · theorem.

For every elliptic curve E/ℚ with analyticRank E = 1: Module.finrank ℤ (E(ℚ)/tors) = 1 and Ш(E/ℚ) is finite. No further hypothesis is placed on E: CM curves, nonsemistable curves and curves with exceptional primes are included.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E = 1 (BSD.0).

**Proof route.**

1. Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, ellipticL E^K 1 ≠ 0, so L(E/K, s) has a simple zero (BSD.0/base-change-central-identities (a)).
2. heegner-point-nontorsion: y_K has infinite order.
3. HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) is finite (Kolyvagin, with the CM and p = 2 cases included).
4. rootNumber E = −1 (BSD.0/root-number-parity), so heegner-point-eigenspace gives rank E(ℚ) ≥ 1; BSD.1/rank-splitting gives rank E(ℚ) + rank E^K(ℚ) = 1, hence rank E(ℚ) = 1 and rank E^K(ℚ) = 0. No appeal to this theorem for E^K is made.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

**Inputs.** [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity); [RankZeroOneBSD:BSD.3/heegner-point-nontorsion](#rankzeroonebsd-bsd-3-heegner-point-nontorsion); [RankZeroOneBSD:BSD.3/heegner-point-eigenspace](#rankzeroonebsd-bsd-3-heegner-point-eigenspace); `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`; [RankZeroOneBSD:BSD.1/rank-splitting](#rankzeroonebsd-bsd-1-rank-splitting); [RankZeroOneBSD:BSD.1/sha-finiteness-descent](#rankzeroonebsd-bsd-1-sha-finiteness-descent); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank).

**Acceptance.**

- E = 37a1: rank 1 and Ш(E/ℚ) finite (indeed trivial, a statement for BSD.8/BSD.9).
- The same argument gives rank E^K(ℚ) = 0 and finite Ш(E^K/ℚ) for the auxiliary K.

**Sources.**

- [jsw](#source-jsw), §1.2, p. 1. The theorem.
- [burungale-tian](#source-burungale-tian), §1.0.1, p. 1. Attribution of ord ≤ 1 ⇒ rank = ord and finite Sha.

## BSD.4 — Analytic rank zero and the combined rank theorem

For rank zero, choose a derivative-nonvanishing twist, prove the rank-one theorem over the quadratic field, and descend the appropriate rank and Sha conclusions. Kato provides an independent rank-zero route and a one-sided p-part bound. Its all-prime/CM specialization is an extension request, not supplied by the narrower existing ordinary L4 interface. Combining the two rank cases proves rank equality and whole-Sha finiteness for every E/ℚ of analytic rank at most one.

**Planets:** Kolyvagin's rank-zero theorem ([declaration](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem)); Analytic rank at most one theorem ([declaration](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem)).

<a id="rankzeroonebsd-bsd-4-analytic-rank-zero-theorem"></a>

### Analytic rank zero implies rank zero and finite Sha (Kolyvagin)

`RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem` · theorem.

For every elliptic curve E/ℚ with ellipticL E 1 ≠ 0 (analyticRank E = 0): E(ℚ) is finite and Ш(E/ℚ) is finite. No further hypothesis is placed on E.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E = 0.

**Proof route.**

1. rootNumber E = +1 (BSD.0/root-number-parity). Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, and analyticRank E^K = 1, so L(E/K, s) has a simple zero with L′(E/K, 1) = L(E, 1)L′(E^K, 1) ≠ 0 (BSD.0/base-change-central-identities (b)).
2. BSD.3/heegner-point-nontorsion: y_K has infinite order; HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) finite.
3. BSD.3/heegner-point-eigenspace with rootNumber E = +1: y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order, so rank E^K(ℚ) ≥ 1.
4. BSD.1/rank-splitting: rank E(ℚ) + rank E^K(ℚ) = 1, so rank E(ℚ) = 0 and E(ℚ) is finite. The sign calculation is direct: BSD.3 is not applied to E^K.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

**Inputs.** [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.0/root-number-parity](#rankzeroonebsd-bsd-0-root-number-parity); [RankZeroOneBSD:BSD.3/heegner-point-nontorsion](#rankzeroonebsd-bsd-3-heegner-point-nontorsion); [RankZeroOneBSD:BSD.3/heegner-point-eigenspace](#rankzeroonebsd-bsd-3-heegner-point-eigenspace); `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`; [RankZeroOneBSD:BSD.1/rank-splitting](#rankzeroonebsd-bsd-1-rank-splitting); [RankZeroOneBSD:BSD.1/sha-finiteness-descent](#rankzeroonebsd-bsd-1-sha-finiteness-descent); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank).

**Acceptance.**

- E = 11a1: E(ℚ) ≅ ℤ/5 and Ш(E/ℚ) finite.
- The argument also yields rank E^K(ℚ) = 1 and Ш(E^K/ℚ) finite for the auxiliary field.

**Sources.**

- [bfh90](#source-bfh90), Introduction, p. 544. The route: a twist with a simple zero, Gross–Zagier over K and Kolyvagin.

<a id="rankzeroonebsd-bsd-4-kato-rank-zero-finiteness"></a>

### The Beilinson–Kato route to finiteness in analytic rank zero

`RankZeroOneBSD:BSD.4/kato-rank-zero-finiteness` · theorem.

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0, and f = F_E. For every prime p and every G_ℚ-stable lattice T ⊂ V_p(E), Kato's Bloch–Kato Selmer group Sel(ℚ, T) ⊂ H¹(ℚ, T ⊗ ℚ/ℤ) is finite, and Sel(ℚ, T) = 0 for all but finitely many p. Consequently E(ℚ) is finite and Ш(E/ℚ) is finite, and Ш(E/ℚ)[p^∞] = 0 for all but finitely many p. This route uses the Beilinson–Kato Euler system, its explicit reciprocity law and the nonvanishing of L(E, 1); it uses no Heegner point, no primitivity of Kato's classes and no main conjecture.

**Hypotheses.**

- Kato, Theorem 14.2(2) with K = ℚ, χ trivial, k = 2, r = k/2 = 1, so V_{F_λ}(f)(1) ≅ V_p(E) by EllipticCurveModularity R29.4/tate-module-comparison.
- The identification of Kato's Sel(ℚ, T_p E) with Sel_{p^∞}(E/ℚ) of EllipticCurves Layer 7: Bloch–Kato's H¹_f at p is the Kummer image (finite flat or Tate-curve local condition).

**Proof route.**

1. KatoEulerSystems L3: the zeta class z_γ interpolates L(f, 1) through the dual exponential, so its localisation at p is nonzero when L(f, 1) ≠ 0.
2. KatoEulerSystems L4 and EulerSystemsAndKolyvaginSystems ES.4: the Euler-system bound kills the Selmer group up to the index of the bottom class, which is finite.
3. For almost all p the image of G_ℚ contains SL₂(ℤ_p) (or the CM Cartan analogue) and the bottom class is a unit multiple, giving vanishing.
4. Sel(E/ℚ) = ⊕_p Sel(ℚ, T_p E) (Kato §14.1) is then finite, so E(ℚ) ⊗ ℚ_p/ℤ_p and Ш(E/ℚ) are finite.

**Inputs.** `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`; `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`; `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`; `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`; `EllipticCurveModularity:R29.4/tate-module-comparison`; [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `KatoEulerSystems:L4`.

**Acceptance.**

- Agrees with analytic-rank-zero-theorem on every E; for E = 11a1 both give E(ℚ) finite and Ш(E/ℚ) finite.

**Sources.**

- [kato](#source-kato), Theorem 14.2(2), p. 235. Finiteness of the Selmer group (transcribed from the Numdam scan, whose text layer is garbled).
- [kato](#source-kato), §14.1, p. 235. Kato's Selmer groups recover the usual Selmer group.

<a id="rankzeroonebsd-bsd-4-kato-p-part-upper-bound"></a>

### Kato's upper bound for the p-part of Sha in analytic rank zero

`RankZeroOneBSD:BSD.4/kato-p-part-upper-bound` · theorem.

Let E/ℚ be elliptic with good or multiplicative reduction at an odd prime p, E[p] irreducible, and ellipticL E 1 ≠ 0. Then ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L(E, 1)/(Ω_E · ∏_ℓ c_ℓ(E))), where L(E, 1)/Ω_E ∈ ℚ^× by BSD.5/rank-zero-rationality.

**Hypotheses.**

- p odd, good or multiplicative reduction at p, E[p] irreducible (so E(ℚ)[p] = 0 and the torsion term is a p-adic unit).
- Ω_E is the full real period of EllipticCurves Layer 7.

**Proof route.**

1. Import the requested finite-level one-sided Kato bound with good ordinary, supersingular and multiplicative local cases stated separately. The current cohomological height-one divisibility alone does not give this conclusion.
2. Use the requested augmentation/Fitting and compact/discrete local-control comparison, retaining every Euler and Tamagawa factor. Do not use BSD.6/cyclotomic-specialization-formula here: it assumes an equality/main conjecture, whereas this is a one-sided input.
3. Transport canonical periods to the full Néron real period using the exact Manin-constant integrality hypotheses from GZ.3; the multiplicative p∥N branch needs its separately requested export. Rationality is an early modular-symbol result, currently located in BSD.5 and proposed for an early export.

**Inputs.** `KatoEulerSystems:L4/cohomological-divisibility-one-direction`; [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality); `GrossZagierAndArithmeticHeights:GZ.3`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `KatoEulerSystems:L4`.

**Acceptance.**

- E = 11a1, p = 3: ord₃(L(E,1)/(Ω_E c₁₁)) = ord₃(1/25) = 0, so Ш(E/ℚ)[3^∞] = 0.

**Sources.**

- [jsw](#source-jsw), Theorem 7.2.1(i), p. 42. Attribution and scope of the bound.

<a id="rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem"></a>

### Analytic rank at most one: rank equals analytic rank and Sha is finite

`RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` · theorem.

For every elliptic curve E/ℚ with analyticRank E ≤ 1: Module.finrank ℤ (E(ℚ)/tors) = analyticRank E and Ш(E/ℚ) is finite. The separate conclusions (rank equality; finiteness of the whole of Ш) are exported as distinct declarations.

**Hypotheses.**

- E/ℚ elliptic, analyticRank E ≤ 1; no hypothesis on reduction, CM or residual representations.

**Proof route.**

1. analyticRank E = 0: analytic-rank-zero-theorem.
2. analyticRank E = 1: BSD.3/analytic-rank-one-theorem.

**Inputs.** [RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem); [RankZeroOneBSD:BSD.3/analytic-rank-one-theorem](#rankzeroonebsd-bsd-3-analytic-rank-one-theorem).

**Acceptance.**

- 11a1: rank 0 = analytic rank; 37a1: rank 1 = analytic rank; both with finite Ш.

**Sources.**

- [burungale-tian](#source-burungale-tian), §1.0.1, p. 1. The combined theorem.

<a id="rankzeroonebsd-bsd-4-kato-heegner-comparison"></a>

### The Kato and Heegner routes in analytic rank zero compared

`RankZeroOneBSD:BSD.4/kato-heegner-comparison` · comparison.

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0. (a) Both analytic-rank-zero-theorem (Heegner points on an auxiliary E^K, Kolyvagin over K) and kato-rank-zero-finiteness (Beilinson–Kato elements over ℚ) prove that E(ℚ) and Ш(E/ℚ) are finite, and both prove Ш(E/ℚ)[p^∞] = 0 for all p outside a finite set. (b) At an odd prime p of good or multiplicative reduction with E[p] irreducible, the Kato route gives the explicit bound ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p(L(E,1)/(Ω_E ∏c_ℓ)) (kato-p-part-upper-bound), whereas the Heegner route bounds #Ш(E/K)[p^∞] by the square of the Heegner index of the auxiliary twist, which first involves the auxiliary height/index; conversion to L(E,1) requires Gross–Zagier and the auxiliary twist factors. (c) Neither route uses a main conjecture or the primitivity of an Euler system; the equality of p-parts needs the main-conjecture inputs of BSD.6.

**Hypotheses.**

- As in the two theorems compared.

**Proof route.**

1. (a) is the conjunction of the two theorems' conclusions; the finite exceptional sets are the primes where the Kolyvagin (HE.7/almost-all-primary-sha-vanishing) or Kato (large-image) arguments lose control.
2. (b) compares kato-p-part-upper-bound with HE.6/sha-square-index-bound applied to E^K and BSD.1/odd-selmer-sha-decomposition.
3. (c) records the inputs of each proof.

**Inputs.** [RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem); [RankZeroOneBSD:BSD.4/kato-rank-zero-finiteness](#rankzeroonebsd-bsd-4-kato-rank-zero-finiteness); [RankZeroOneBSD:BSD.4/kato-p-part-upper-bound](#rankzeroonebsd-bsd-4-kato-p-part-upper-bound); `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`; `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`; [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition).

**Acceptance.**

- 11a1: both routes give E(ℚ) finite and Ш(E/ℚ) finite; at p = 3 the Kato bound already gives Ш(E/ℚ)[3^∞] = 0.

**Sources.**

- [jsw](#source-jsw), §7.2, p. 42. The Kato route's p-adic bound.

## BSD.5 — The positive rational defect and Heegner indices

Modular-symbol periods establish rationality in rank zero; Gross–Zagier and the Heegner index give the rank-one counterpart with the fixed height dictionary. Positivity and whole-Sha finiteness make the rational defect usable in valuations. Isogeny invariance imports Cassels’ arithmetic quotient comparison and equality of the analytic factors. The definite congruence period and rank-zero rationality are independent early exports: their current parent-stage placement must not create a circular input to HE.6 or Kato’s upper bound.

**Planets:** Positivity of the leading term ([declaration](#rankzeroonebsd-bsd-5-leading-term-positivity)); Rationality of L′(E,1)/ΩReg ([declaration](#rankzeroonebsd-bsd-5-rank-one-rationality)); Heegner index ([declaration](#rankzeroonebsd-bsd-5-heegner-index)); Gross–Zagier index formula ([declaration](#rankzeroonebsd-bsd-5-gross-index-formula)); Ribet–Takahashi degree formula ([declaration](#rankzeroonebsd-bsd-5-ribet-takahashi-degree-comparison)); Rational BSD defect ([declaration](#rankzeroonebsd-bsd-5-rational-bsd-defect)).

<a id="rankzeroonebsd-bsd-5-rank-zero-rationality"></a>

### Rationality of L(E,1)/Ω_E

`RankZeroOneBSD:BSD.5/rank-zero-rationality` · theorem.

For every elliptic curve E/ℚ, ellipticL E 1 / Ω_E is rational, where Ω_E is the full real Néron period. When L(E,1)≠0 the ratio is nonzero. No specific denominator bound is asserted without a separate integral modular-symbol/Manin–Drinfeld computation.

**Hypotheses.**

- E/ℚ elliptic; the Manin constant enters through the comparison of Ω_E with the modular-symbol period Ω_f^+.

**Proof route.**

1. Modular symbols: L(f, 1) = −2πi ∫_0^{i∞} f(z)dz = Ω_f^+ · ½T(φ^+) with T(φ^+) ∈ ℚ (MSPL L1/critical-value-algebraicity with k = 0, j = 0, χ = 1, f = F_E, coefficient field ℚ).
2. Period comparison: φ_E^* ω_E = c·2πi F_E dz (EllipticCurveModularity R29.5/modular-parametrisation); the image of H₁(X₀(N), ℤ)^+ under ∫ φ_E^*ω_E is a sublattice of the real period lattice of E of finite index, so −2πiΩ_f^+(φ^+) ∈ ℚ^× · Ω_E⁰ for an integral generator φ^+ (MSPL L1/integral-period-lattices).
3. Ω_E = c∞ Ω_E⁰ (GZ.0/real-period-components), with c∞ ∈ {1, 2}.
4. Combine with BSD.0/rational-newform-bridge (L(E, s) = L(F_E, s)).

**Inputs.** `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`; `ModularSymbolsPadicLFunctions:L1/period-lines`; `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`; `EllipticCurveModularity:R29.5/modular-parametrisation`; `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`; [RankZeroOneBSD:BSD.0/rational-newform-bridge](#rankzeroonebsd-bsd-0-rational-newform-bridge); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `GrossZagierAndArithmeticHeights:GZ.3`.

**Acceptance.**

- E = 11a1: L(E,1)/Ω_E = 1/5.
- E = 37a1: L(E,1)/Ω_E = 0 (rank one).

**Sources.**

- [jsw](#source-jsw), Theorem 7.2.1(i), p. 42. The rank-zero quotient whose p-adic valuation is taken presupposes its rationality.
- [jsw](#source-jsw), §7.3.2, (7.3.b), p. 44. The comparison of Ω_E with −2πiΩ_f^+ up to ℤ_(p)^×.

<a id="rankzeroonebsd-bsd-5-leading-term-positivity"></a>

### Positivity of the leading term in analytic rank at most one

`RankZeroOneBSD:BSD.5/leading-term-positivity` · theorem.

For every elliptic curve E/ℚ with analyticRank E ≤ 1, leadingTerm E > 0: L(E, 1) > 0 if the analytic rank is 0, and L′(E, 1) > 0 if it is 1. Positivity rests on the nonnegativity of central values L(1/2, π ⊗ χ) ≥ 0 for cuspidal π on PGL₂/ℚ and quadratic χ (Waldspurger), requested from GrossZagierAndArithmeticHeights GZ.5, together with the sign of the Gross–Zagier formula.

**Hypotheses.**

- analyticRank E ≤ 1.
- The nonnegativity input is RT-AREA-iwasawa-1/16's missing statement; modular symbols give only rationality, not sign.

**Proof route.**

1. Rank zero: L(E, 1) = L(1/2, π_E) ≥ 0 by the requested Waldspurger nonnegativity (χ trivial), and L(E,1) ≠ 0.
2. Rank one: choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0; then L′(E/K, 1) = L′(E, 1)L(E^K, 1) (BSD.0/base-change-central-identities) and L′(E/K, 1) > 0 because y_K has infinite order (BSD.3/heegner-point-nontorsion, converse direction).
3. L(E^K, 1) > 0 by the rank-zero case applied to E^K, so L′(E, 1) > 0.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5`; `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`; [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.3/heegner-point-nontorsion](#rankzeroonebsd-bsd-3-heegner-point-nontorsion); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank).

**Acceptance.**

- L(11a1, 1) = 0.2538… > 0 and L′(37a1, 1) = 0.3059… > 0 (numerical values for orientation; certification is BSD.9's).

**Sources.**

- [gross-zagier-86](#source-gross-zagier-86), Chapter V §1, Corollary (1.1), pp. 308–309 (excerpt as verified by GZ.8). Sign of the derivative over K.

<a id="rankzeroonebsd-bsd-5-rank-one-rationality"></a>

### Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one

`RankZeroOneBSD:BSD.5/rank-one-rationality` · theorem.

For every elliptic curve E/ℚ with analyticRank E = 1, L′(E, 1)/(Ω_E · Reg_BSD(E/ℚ)) ∈ ℚ_{>0}, where Reg_BSD is GZ.0's regulator in the x-height normalisation (twice Tau Ceti's regulator in rank one).

**Hypotheses.**

- analyticRank E = 1 (so rank E(ℚ) = 1 by BSD.3/analytic-rank-one-theorem).
- Normalisation: GZ.0/height-convention-dictionary; with Tau Ceti's regulator the quotient changes by the factor 2.

**Proof route.**

1. Choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0 and D_K odd.
2. Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula): L′(E,1)·L(E^K,1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with C, u_K ∈ ℤ_{>0}.
3. heegner-index-height-formula: ĥ_K(y_K) = I_K² · 2 · Reg_BSD(E/ℚ)/4^a.
4. BSD.1/quadratic-period: ‖ω₀‖²/|D_K|^{1/2} = r·Ω_E·Ω_{E^K} with r ∈ ℚ^× (a power of 2 when (D_K, 2N) = 1).
5. rank-zero-rationality for E^K: L(E^K, 1)/Ω_{E^K} ∈ ℚ^×. Dividing gives L′(E,1)/(Ω_E Reg_BSD) ∈ ℚ^×, positive by leading-term-positivity.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`; [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality); [RankZeroOneBSD:BSD.5/leading-term-positivity](#rankzeroonebsd-bsd-5-leading-term-positivity); [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`; `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

**Acceptance.**

- E = 37a1: L′(E,1)/(Ω_E Reg_BSD) = 1 (Ш trivial, c₃₇ = 1, E(ℚ)_tors = 0), as BSD.9 certifies.

**Sources.**

- [jsw](#source-jsw), §1.2, p. 2. The statement, with its source.

<a id="rankzeroonebsd-bsd-5-heegner-index"></a>

### The Heegner index

`RankZeroOneBSD:BSD.5/heegner-index` · definition.

Let E/ℚ be elliptic, K imaginary quadratic satisfying the Heegner hypothesis, and y_K ∈ E(K) the Heegner point attached to a fixed modular parametrisation φ. When rank E(K) = 1 and y_K has infinite order, heegnerIndex := I_K = [E(K) : ℤ·y_K] (Gross's index, which includes E(K)_tors), and the free index I_K^free := [E(K)/tors : ℤ·ȳ_K]; I_K = I_K^free · #E(K)_tors. For positive integer multiples mφ on the fixed curve, I_K and c_φ both scale by m, so I_K/c_φ is unchanged. Across an isogeny the Mordell–Weil lattice and torsion change and need explicit correction factors.

**Hypotheses.**

- rank E(K) = 1 (supplied by BSD.3/BSD.4 for the fields of BSD.2) and y_K of infinite order.

**Proof route.**

1. Both indices are finite because ȳ_K is a nonzero element of the rank-one free group E(K)/tors.
2. I_K = I_K^free·#E(K)_tors from the exact sequence 0 → E(K)_tors → E(K) → E(K)/tors → 0 restricted to ℤy_K, which meets torsion trivially.
3. For positive multiples mφ on the fixed E, y_K becomes my_K and c_φ becomes mc_φ; in the rank-one free lattice the index scales by m. An arbitrary isogeny is not multiplication by an integer on the same lattice.

**Inputs.** [RankZeroOneBSD:BSD.3/heegner-point-nontorsion](#rankzeroonebsd-bsd-3-heegner-point-nontorsion); `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`; `tauceti:WeierstrassCurve.Affine.PointModTorsion`; `tauceti:WeierstrassCurve.Affine.finite_torsion`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD/HeegnerIndex`; namespace `TauCeti.BSD`.

**Uses.**

- RankZeroOneBSD:BSD.5/heegner-index-height-formula: ĥ_K(y_K) = I_K^free² Reg(E/K)
- RankZeroOneBSD:BSD.5/gross-index-formula: Gross's conjecture #Ш(E/K) = (I_K/(c·m))²
- HeegnerPointEulerSystems HE.6/sha-square-index-bound: Kolyvagin's bound ord_p #Ш(E/K) ≤ 2 ord_p I_K
- JSW §7.4: m_{K′} = [E(K′) : ℤ z_{K′}] in the lower and upper bounds

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.heegnerIndex` | constructor | I_K = [E(K) : ℤ y_K] as a positive natural number, given rank E(K) = 1 and y_K of infinite order. |
| `TauCeti.BSD.heegnerIndexFree` | constructor | I_K^free = [E(K)/tors : ℤ ȳ_K]. |
| `TauCeti.BSD.heegnerIndex_eq_free_mul_torsion` | relation | I_K = I_K^free · #E(K)_tors. |
| `TauCeti.BSD.heegnerIndex_pos` | other | 0 < I_K. |
| `TauCeti.BSD.heegnerIndex_div_maninConstant_invariant` | compatibility | For m>0 on the fixed E, I(my_K)/(m c_φ)=I(y_K)/c_φ; no arbitrary-isogeny invariance is asserted. |
| `TauCeti.BSD.torsion_dvd_heegnerIndex` | relation | #E(ℚ)_tors divides I_K. Assume y_K has infinite order and finite index. |
| `TauCeti.BSD.not_dvd_heegnerIndex_of_large` | other | For all but finitely many primes p, p ∤ I_K (HE.7/non-torsion-point-prime-divisibility). Assume finite index (so I_K>0); a zero junk index is divisible by every prime. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `TauCeti.BSD.heegnerIndex_torsion_factor` | characterisation | heegnerIndex = heegnerIndexFree * Nat.card (E(K)_tors). |
| `TauCeti.BSD.heegnerIndex_scale` | non-example | Replacing φ by 2φ doubles y_K and the index I_K while c_φ doubles too; so I_K alone is not an invariant of E and K, only I_K/c_φ. |
| `TauCeti.BSD.heegnerIndex_11a` | computation | For E₀ = J₀(11) = 11a1 (E(ℚ)_tors ≅ ℤ/5), 5 divides I_K for every point y_K of infinite order generating a finite-index subgroup: the torsion meets ℤy_K trivially (GZ86 Chapter V §2, before (2.3)). |
| `TauCeti.BSD.heegnerIndexFree_one_of_generator` | degenerate | If ȳ_K generates E(K)/tors then I_K^free = 1 and I_K = #E(K)_tors. Assume y_K has infinite order, not merely that its image generates a possibly rank-zero quotient. |

**Acceptance.**

- E = 37a1: y_K = m_K·(0,0) up to torsion and I_K = |m_K| (the integers m_K are coefficients of a weight-3/2 form, Gross §1).
- GZ86 (2.3): t = #E(ℚ)_tors divides I_K.

**Sources.**

- [gross-zagier-86](#source-gross-zagier-86), Chapter V §2, (2.2) Conjecture, p. 311. The index of ℤP_K in E(K).
- [jsw](#source-jsw), §7.4.1, p. 46. The index used in the p-part argument.

<a id="rankzeroonebsd-bsd-5-heegner-index-height-formula"></a>

### Height of the Heegner point and the squared index

`RankZeroOneBSD:BSD.5/heegner-index-height-formula` · theorem.

In the setting of heegner-index, with heights relative to K in the x-height normalisation: ĥ_K(y_K) = (I_K^free)² · Reg_BSD(E/K). If moreover rank E(ℚ) = 1 and rank E^K(ℚ) = 0 (the case of BSD.3), then Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ)/4^a with 2^a = [E(K)/tors : res(E(ℚ)/tors)] ∈ {1, 2}, so ĥ_K(y_K) = 2·(I_K^free)²·Reg_BSD(E/ℚ)/4^a.

**Hypotheses.**

- rank E(K) = 1; K-relative heights (GZ.0 gap on the number-field instance).

**Proof route.**

1. In a rank-one lattice the regulator is the height of a generator, and ĥ is quadratic: ĥ_K(y_K) = (I^free)² ĥ_K(generator).
2. BSD.1/quadratic-regulator-comparison with r₊ = 1, r₋ = 0.

**Inputs.** [RankZeroOneBSD:BSD.5/heegner-index](#rankzeroonebsd-bsd-5-heegner-index); [RankZeroOneBSD:BSD.1/quadratic-regulator-comparison](#rankzeroonebsd-bsd-1-quadratic-regulator-comparison); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`; `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`.

**Acceptance.**

- E = 37a1: if ȳ_K = m·res(P₀) + torsion with P₀ = (0,0) and a = 0, then ĥ_K(y_K) = 2m²·ĥ_x(P₀) = 2m²·0.0511…, with ĥ_x(P₀) = Reg_BSD(37a1).

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 46. JSW's version up to p-adic units (their index enters squared in the height).

<a id="rankzeroonebsd-bsd-5-gross-index-formula"></a>

### Gross–Zagier's index conjecture as a form of BSD over K

`RankZeroOneBSD:BSD.5/gross-index-formula` · theorem.

Let E/ℚ be elliptic of conductor N with optimal parametrisation of Manin constant c, K imaginary quadratic with D_K odd, every prime of N split, u_K = #𝓞_K^×/2, rank E(K) = 1, y_K has infinite order, and Ш(E/K) finite. For a prime ℓ | N let m_ℓ be the order of the component group of the Néron model at either prime above ℓ, and m = ∏_{ℓ|N} m_ℓ. Then for every odd prime p ∤ D_K, the p-part of the BSD formula for E/K (JSW (7.1.a)) holds if and only if ord_p I_K = ord_p(c · m · u_K) + ½ ord_p #Ш(E/K), i.e. the p-part of Gross–Zagier's Conjecture (2.2): I_K = c·m·u_K·#Ш(E/K)^{1/2}. In particular the p-part of BSD for E/K implies that t = #E(ℚ)_tors divides c·m·u_K·#Ш(E/K)^{1/2} in its p-part (Conjecture (2.3)). For D_K ∉ {−3, −4} (u_K = 1) this is Gross's Conjecture 1.2(2): #Ш(E/K) = (I_K/(c·∏_{ℓ|N} m_ℓ))² with m_ℓ = [E(ℚ_ℓ) : E⁰(ℚ_ℓ)]. The index bound, the Sha bound and the exact formula are three different statements: Kolyvagin's Theorem 1.3 (#Ш(E/K) divides t_{E/K}·I_K²) and Howard's ord_p #Ш(E/K) ≤ 2 ord_p I_K (HE.6) are only one inequality.

**Hypotheses.**

- Gross–Zagier's standing hypotheses (D_K odd, Heegner hypothesis); p odd and p ∤ D_K so that powers of 2 and the discriminant term are units.
- m_ℓ is the same at both primes above a split ℓ (m_𝔭 = m_𝔭̄), so ∏_{w|N} c_w(E/K) = m².
- The modular Heegner point y_K has infinite order (equivalently the base-change analytic rank is one in this setting). Algebraic rank one by itself is not an analytic simple-zero hypothesis.

**Proof route.**

1. Write BSD for E/K: L′(E/K,1)/(Ω_{E/K} Reg_BSD(E/K) |D_K|^{−1/2}) = #Ш(E/K)·∏_w c_w(E/K)/#E(K)_tors².
2. Substitute Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula) for L′(E/K,1), heegner-index-height-formula for ĥ_K(y_K) = (I_K^free)² Reg_BSD(E/K), and BSD.1/quadratic-period for ‖ω₀‖² versus Ω_{E/K}.
3. I_K = I_K^free·#E(K)_tors cancels the torsion term; the Tamagawa product over K is m² (split primes, BSD.1/tamagawa-base-change).
4. What remains is (I_K)² = (c·m·u_K)²·#Ш(E/K) up to powers of 2, which are p-adic units.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`; [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula); [RankZeroOneBSD:BSD.5/heegner-index](#rankzeroonebsd-bsd-5-heegner-index); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); [RankZeroOneBSD:BSD.1/odd-part-bsd-over-K](#rankzeroonebsd-bsd-1-odd-part-bsd-over-k); `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`; `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index`.

**Acceptance.**

- Gross's example E = X₀(37)/w₃₇ (37a1, φ of degree 2, c = 1, m₃₇ = 1): the formula reads #Ш(E/K) = I_K², and y_K = m_K·(0,0) with the m_K Fourier coefficients of a weight-3/2 form; certifying instances is BSD.9's.
- GZ86 examples at N = 11: (E₀ = J₀(11); c, m, t) = (1, 5, 5), (J₁(11); 5, 1, 5), (E₀/(ℤ/5ℤ); 1, 1, 1): t | c·m in each case.
- N = 65: for E₀ = J₀(65)/⟨w₅, w₁₃⟩, (c, m, t) = (1, 1, 2), so for K ≠ ℚ(i) with 5 and 13 split the conjecture forces 2 | #Ш(E/K)^{1/2} or rank E(K) > 1; Kramer's computation gives 2-Selmer rank ≥ 4 (stated in GZ86, not reproved here).

**Sources.**

- [gross-zagier-86](#source-gross-zagier-86), Chapter V §2, (2.2) Conjecture, p. 311. Conjecture (2.2).
- [gross-zagier-86](#source-gross-zagier-86), Chapter V §2, (2.3) Conjecture, p. 311. Conjecture (2.3), with t = |E(ℚ)_tors|.
- [gross-kolyvagin](#source-gross-kolyvagin), §1, Conjecture 1.2(2), p. 236 (read from the page image). Gross's form of the index formula.
- [gross-kolyvagin](#source-gross-kolyvagin), §1, Theorem 1.3(2), p. 236. Kolyvagin's one-sided bound.

<a id="rankzeroonebsd-bsd-3a-definite-congruence-period"></a>

### The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston)

`RankZeroOneBSD:BSD.3a/definite-congruence-period` · theorem.

Let g ∈ S₂(Γ₀(N)) be a newform with trivial character and Hecke field with ring O, 𝔭 | p ≥ 5 a prime of O with p ∤ N, ρ̄_{g,𝔭} : G_ℚ → GL₂(k₀) surjective, and N = N⁺N⁻ with N⁻ squarefree with an odd number of prime factors (the definite quaternion algebra of discriminant N⁻), satisfying Pollack–Weston's hypothesis CR (in particular ρ̄ ramified at every ℓ | N⁻ with ℓ ≡ ±1 mod p, and the nonsquarefree alternatives of Hypothesis ♥ when N is not squarefree). Let η_g(N) be the congruence number of g at full level and ξ_g(N⁺, N⁻) the self-pairing of a primitive integral eigenfunction on the definite quaternion algebra. Then ord_𝔭 (η_g(N)/ξ_g(N⁺, N⁻)) = Σ_{ℓ|N⁻} t_g(ℓ), where t_g(ℓ) = length_{O_𝔭} Φ(A_g/ℚ_ℓ)_𝔭 is the 𝔭-part of the Tamagawa (component-group) factor at ℓ.

**Hypotheses.**

- The hypotheses are those of HeegnerPointEulerSystems HE.6/ribet-takahashi-tamagawa-comparison, which consumes this node; its contract forbids HE.6, rank-zero BSD, Jochnowitz congruences and the final Heegner-index result as inputs.
- This node is the early export the HE.0 review requested (proposed sub-layer BSD.3a, recorded in restructure); it depends only on Néron-model character groups and the GL₂ transfer.

**Proof route.**

1. Character groups: for N₁N₂ with N₂ having an even number of primes, the character group X̂_r(J) of the Shimura curve Jacobian's toric part at r | N⁻ is free of rank one over the localised Hecke algebra under CR (Pollack–Weston Theorem 6.2, from NeronModelsAndSemistableAbelianVarieties R11.4/characters-graph-homology, R11.4/integral-monodromy-pairing).
2. The monodromy pairing on X̂_r computes congruence numbers: ⟨g_r, g_r⟩ = η_g(N₁/r, rN₂) (Pollack–Weston Proposition 6.4) and the cokernel of the monodromy map is the component group (R11.4/component-cokernel).
3. Ribet–Takahashi: comparing the pairings at successive levels gives ord_𝔭 η_g(aℓ, b) = t_g(ℓ) + ord_𝔭 η_g(a, ℓb) (Pollack–Weston (2)); degeneracy maps and their adjoints are R11.6/degeneracy-functoriality.
4. Iterate over the primes of N⁻ and identify ξ_g(N⁺, N⁻) with η_g(N⁺, N⁻) by freeness (the GL₂ transfer of GL2AutomorphicRepresentationsAndTransfer R17.3 gives the Jacquet–Langlands eigenfunction).

**Inputs.** `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; `NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing`; `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`; `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`; `NeronModelsAndSemistableAbelianVarieties:R11.6/character-exact-sequences`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GrossZagierAndArithmeticHeights:GZ.3`.

**Acceptance.**

- When N⁻ = ℓ is prime and p ∤ c_ℓ(g), ord_𝔭 η_g(N) = ord_𝔭 ξ_g(N⁺, ℓ).
- JSW use the elliptic case: δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ up to p-units (ribet-takahashi-degree-comparison).

**Sources.**

- [pollack-weston](#source-pollack-weston), §1, formula (1), p. 3. The identity ord_p(η_f(N)/ξ_f(N⁺,N⁻)) = Σ_{q|N⁻} t_f(q).
- [pollack-weston](#source-pollack-weston), §6.1, end of the section. The proof route.

<a id="rankzeroonebsd-bsd-5-ribet-takahashi-degree-comparison"></a>

### Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi)

`RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison` · theorem.

For the semistable optimal degree comparison under the localised multiplicity-one/freeness and residual hypotheses of JSW7.3.2 and the selected Ribet–Takahashi theorem, v_p(δ(N,1)/δ(N⁺,N⁻))=Σ_{ℓ|N⁻} v_p(ord_ℓ Δ_min(E)), with N⁻ of even cardinality. These are geometric component multiplicities. In JSW’s application ℓ|N⁻ is inert in K′, so over K′ the multiplicative torus splits and c_ℓ(E/K′)=ord_ℓ Δ_min. At a nonsplit rational multiplicative prime c_ℓ(E/ℚ) is only 1 or 2 and cannot be substituted.

**Hypotheses.**

- Indefinite quaternion algebra (N⁻ with an even number of primes); E[p] irreducible so that the relevant Hecke modules are free (Ribet's multiplicity one).
- The exact localised character-module freeness and period comparison must be proved under the endpoint hypotheses; irreducibility alone is not silently identified with Pollack–Weston CR/surjectivity.

**Proof route.**

1. Degrees are congruence numbers up to p-adic units: δ(N, 1) ~ η_E(N) and δ(N⁺, N⁻) ~ η_E(N⁺, N⁻) (multiplicity one at the maximal ideal of E[p]).
2. Apply the Ribet–Takahashi recursion of definite-congruence-period one prime at a time along N⁻, now in the indefinite case (component groups of J₀(N) and of the Shimura-curve Jacobian at ℓ | N⁻, R11.4).
3. An unramified quadratic extension makes the nonsplit multiplicative torus split; its geometric component multiplicity is ord_ℓ Δ_min. Rational c_ℓ need not have the same odd p-part. Use the K′ factor or the geometric multiplicity in the degree recursion.

**Inputs.** [RankZeroOneBSD:BSD.3a/definite-congruence-period](#rankzeroonebsd-bsd-3a-definite-congruence-period); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`; `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`; `GrossZagierAndArithmeticHeights:GZ.3`.

**Acceptance.**

- JSW §7.4.1: δ_{N⁺,N⁻} = δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ(E/K′) up to ℤ_p^×.

**Sources.**

- [jsw](#source-jsw), §7.4.1, p. 46. The degree comparison as JSW use it, up to a unit in ℤ_p^×.

<a id="rankzeroonebsd-bsd-5-rational-bsd-defect"></a>

### The rational BSD defect

`RankZeroOneBSD:BSD.5/rational-bsd-defect` · definition.

For E/ℚ elliptic with analyticRank E ≤ 1 (so rank E(ℚ) = analyticRank E and Ш(E/ℚ) is finite by BSD.4/analytic-rank-at-most-one-theorem), bsdDefect E := leadingTerm E · #E(ℚ)_tors² / (Ω_E · Reg_BSD(E/ℚ) · #Ш(E/ℚ) · ∏_ℓ c_ℓ(E)). It is a positive rational number: bsdDefect E ∈ ℚ_{>0}, with the real identity leadingTerm E = bsdDefect E · (Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors²). The Birch–Swinnerton-Dyer formula for E is the statement bsdDefect E = 1, and its p-part is padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- The arithmetic quotient Ω_E·Reg·#Ш·∏c_ℓ/#tors² is EllipticCurves Layer 7's BSD quotient, stated with GZ.0's Reg_BSD (x-height normalisation); with Tau Ceti's halved regulator the defect changes by 2^{rank}.
- Only finitely many c_ℓ differ from 1 (good primes), so the product is finite.

**Proof route.**

1. Rationality: rank-zero-rationality (rank 0, Reg = 1) and rank-one-rationality (rank 1); the arithmetic terms other than Ω_E and Reg are integers.
2. Positivity: leading-term-positivity, Ω_E > 0, Reg_BSD > 0 (positive-definite height on the free quotient), c_ℓ ≥ 1, #Ш ≥ 1.
3. Define the rational number as the quotient of the rational L*(E,1)/(Ω_E Reg_BSD) by #Ш ∏c_ℓ / #tors².

**Inputs.** [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality); [RankZeroOneBSD:BSD.5/rank-one-rationality](#rankzeroonebsd-bsd-5-rank-one-rationality); [RankZeroOneBSD:BSD.5/leading-term-positivity](#rankzeroonebsd-bsd-5-leading-term-positivity); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`; `mathlib:padicValRat`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD`; namespace `WeierstrassCurve`.

**Uses.**

- RankZeroOneBSD:BSD.6: each prime-part theorem is the statement padicValRat p (bsdDefect E) = 0 under its hypotheses
- RankZeroOneBSD:BSD.8/elliptic-endpoint: the full formula from a finite certificate of vanishing valuations (BSD.7 packet request: d_E ∈ ℚ, 0 < d_E, real identity)
- PeriodsAndSpecialValues:PS.6: re-export of prime-part and conditional full formulas
- JSW Theorem 1.2.1: (1.2.a) is ord_p of the defect being zero

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.bsdDefect` | constructor | bsdDefect E : ℚ for E/ℚ with analyticRank E ≤ 1. |
| `WeierstrassCurve.bsdDefect_pos` | other | 0 < bsdDefect E. |
| `WeierstrassCurve.leadingTerm_eq_bsdDefect_mul` | characterisation | leadingTerm E = bsdDefect E · Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors² as real numbers. |
| `WeierstrassCurve.bsdDefect_eq_one_iff` | characterisation | bsdDefect E = 1 ↔ the full BSD formula (1.1.a) holds for E. |
| `WeierstrassCurve.padicValRat_bsdDefect` | relation | padicValRat p (bsdDefect E) = v_p(L*/(Ω Reg)) + 2 v_p(#tors) − v_p(#Ш) − Σ_ℓ v_p(c_ℓ). |
| `WeierstrassCurve.bsdDefect_eq_of_isogenous` | compatibility | Isogenous curves have equal defects (defect-isogeny-invariance). |
| `WeierstrassCurve.bsdDefect_regulator_convention` | compatibility | The defect computed with Tau Ceti's regulator equals 2^{analyticRank E} · bsdDefect E (GZ.0/bsd-regulator). |
| `WeierstrassCurve.bsdDefect_eq_one_of_forall_padicValRat` | characterisation | If padicValRat p (bsdDefect E) = 0 for every prime p then bsdDefect E = 1 (positive rational, BSD.8's reconstruction). |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.bsdDefect_11a1` | computation | bsdDefect (11a1) = 1 (L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, #Ш = 1). |
| `WeierstrassCurve.bsdDefect_rank_zero_regulator` | degenerate | If analyticRank E = 0 then Reg_BSD = 1 and bsdDefect E = L(E,1)·#tors²/(Ω_E·#Ш·∏c_ℓ). |
| `WeierstrassCurve.bsdDefect_tauCeti_regulator` | non-example | For 37a1 (rank one) the quotient formed with Tau Ceti's halved regulator is 2, not 1: the regulator convention changes the answer. |
| `WeierstrassCurve.bsdDefect_11a_isogeny` | compatibility | bsdDefect (11a1) = bsdDefect (11a3) although their periods, torsion and Tamagawa numbers differ. |

**Acceptance.**

- 11a1: L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, Ш = 1 gives bsdDefect = (1/5)·25/5 = 1.

**Sources.**

- [jsw](#source-jsw), Conjecture 1.1.1(b), (1.1.a), p. 1. The defect is the ratio of the two sides of (1.1.a).
- [jsw](#source-jsw), §7, p. 41. The defect is the ratio and is isogeny invariant.

<a id="rankzeroonebsd-bsd-5-defect-isogeny-invariance"></a>

### Isogeny invariance of the rational BSD defect

`RankZeroOneBSD:BSD.5/defect-isogeny-invariance` · theorem.

If E and E′ are ℚ-isogenous elliptic curves with analyticRank E ≤ 1, then analyticRank E′ = analyticRank E and bsdDefect E = bsdDefect E′.

**Hypotheses.**

- The arithmetic invariance is Cassels' theorem and the analytic invariance is equality of all local factors; both are owned by EllipticCurves Layer 7 (RS-30) and only composed here.

**Proof route.**

1. Equal local Euler factors give ellipticL E = ellipticL E′ (BSD.0/actual-l-function, ellipticL_eq_of_isogenous), hence equal analytic rank and leading term.
2. Cassels: the arithmetic BSD quotient Ω·Reg·#Ш·∏c/#tors² is isogeny invariant (EllipticCurves Layer 7), stated with Reg_BSD; the normalisation adapter GZ.0/bsd-regulator is the same on both sides.
3. Divide.

**Inputs.** [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCeti.Isogeny`.

**Acceptance.**

- 11a1, 11a2, 11a3 all have defect 1.

**Sources.**

- [jsw](#source-jsw), §7, p. 41. Isogeny invariance of the ratio.

<a id="rankzeroonebsd-bsd-5-p-part-from-two-bounds"></a>

### The p-part of BSD from an upper and a lower bound

`RankZeroOneBSD:BSD.5/p-part-from-two-bounds` · lemma.

Let E/ℚ be elliptic with analyticRank E ≤ 1 and p a prime with E(ℚ)[p] = 0 (for instance p odd with E[p] irreducible). Then padicValRat p (bsdDefect E) = v_p(L*(E,1)/(Ω_E Reg_BSD ∏_ℓ c_ℓ)) − v_p(#Ш(E/ℚ)[p^∞]). Hence the upper bound v_p #Ш[p^∞] ≤ v_p(L*/(ΩReg∏c)) is equivalent to padicValRat p (bsdDefect E) ≥ 0, the lower bound to ≤ 0, and the p-part of the BSD formula to the conjunction of the two bounds. Neither a bound on the Heegner index nor a one-sided Euler-system divisibility alone gives padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- E(ℚ)[p] = 0 so the torsion term is a p-adic unit; for p = 2 or curves with rational p-torsion the torsion term is kept (BSD.7).

**Proof route.**

1. Expand padicValRat of the defining quotient (rational-bsd-defect, padicValRat_bsdDefect); v_p(#Ш) = v_p(#Ш[p^∞]); the torsion term vanishes.
2. Reg_BSD's powers of 2 and the regulator itself are absorbed in the rational L*/(Ω Reg) whose valuation is taken as a whole.

**Inputs.** [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); `mathlib:padicValRat`.

**Acceptance.**

- JSW (7.4.d) and (7.4.e) are the two bounds whose conjunction is Theorem 1.2.1.

**Sources.**

- [jsw](#source-jsw), §1.3, p. 2. The two-bound structure.

<a id="rankzeroonebsd-bsd-5-sha-bound-from-heegner-index"></a>

### Kolyvagin's index bound as a one-sided p-part statement

`RankZeroOneBSD:BSD.5/sha-bound-from-heegner-index` · lemma.

Let E/ℚ, K, y_K be as in heegner-index with rank E(K) = 1, p an odd prime with p ∤ D_K N and G_K → GL₂(ℤ_p) surjective on T_pE, D_K ∉ {−3, −4}. Then ord_p #Ш(E/K)[p^∞] ≤ 2 ord_p I_K (HE.6/sha-square-index-bound), whereas Gross–Zagier's conjecture (gross-index-formula) predicts 2 ord_p I_K = ord_p #Ш(E/K) + 2 ord_p(c·m·u_K). Combined with the rank-zero p-part for E^K (BSD.6) and the odd decomposition of Ш(E/K), the inequality gives an upper bound for ord_p #Ш(E/ℚ)[p^∞]. It is not an exact formula: equality needs the opposite inequality from a main conjecture or from Kolyvagin's primitivity, which this lemma does not supply.

**Hypotheses.**

- Retain all Howard Theorem A hypotheses and parametrisation/local error factors of HE.6; the stated clean inequality is used only when those factors are discharged.

**Proof route.**

1. HE.6/sha-square-index-bound gives length Ш[p^∞] ≤ 2·length(E(K) ⊗ ℤ_p/ℤ_p y_K).
2. With E(K)[p] = 0 (surjectivity), the length on the right is ord_p I_K.
3. Convert the index using the proved Gross–Zagier height formula plus quadratic regulator/period comparisons, and split Sha at odd p. gross-index-formula is only an equivalence with BSD; assuming its predicted equality here would assume the desired result.

**Inputs.** `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`; `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`; [RankZeroOneBSD:BSD.5/heegner-index](#rankzeroonebsd-bsd-5-heegner-index); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`; [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period).

**Acceptance.**

- HE.6/primitivity-versus-nonzero: a nonzero Kolyvagin class gives only this inequality.

**Sources.**

- [jsw](#source-jsw), §7.4.2, p. 47. The index bound as it is used.

## BSD.6 — Irreducible prime-part endpoints

State each p-part as valuation-zero for the same rational defect. Cyclotomic specialization cancels the ordinary local control factor before the arithmetic leading term is read off. Rank-one JSW bounds and corrected Castella A′ use separate auxiliary fields and reduction hypotheses. BSTW’s current direct signed rank-one theorem is recorded separately: its narrower theorem range does not automatically replace the withdrawn Wan proof for every JSW twist. Geometric multiplicity ord_q(Δ) is distinct from the rational Tamagawa number at a nonsplit prime.

**Planets:** Cyclotomic control at the trivial character ([declaration](#rankzeroonebsd-bsd-6-cyclotomic-specialization-formula)); Skinner–Urban rank-zero p-part ([declaration](#rankzeroonebsd-bsd-6-rank-zero-ordinary-multiplicative-p-part)); Jetchev–Skinner–Wan theorem ([declaration](#rankzeroonebsd-bsd-6-jsw-rank-one-p-part)); Castella's Theorem A′ ([declaration](#rankzeroonebsd-bsd-6-castella-multiplicative-rank-one-p-part)); Supersingular rank-one p-part ([declaration](#rankzeroonebsd-bsd-6-bstw-rank-one-p-part)).

<a id="rankzeroonebsd-bsd-6-cyclotomic-specialization-formula"></a>

### Specialising a cyclotomic main conjecture at the trivial character

`RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula` · theorem.

Let f=F_E have weight two and p≥3 good ordinary or multiplicative, with irreducible residual representation and L(f,1)≠0. Assume the integral cyclotomic main conjecture and the local control/period conventions of Skinner §3.2. If reduction is not split multiplicative, the final equality is #ℤ_p/(L_alg(f,1))=#Sel(f)·∏_ℓ c_ℓ(T_f). The anomalous factor #(ℤ_p/(α_p−1))² appears on both sides before cancellation, not as an extra factor in this final equality. For split multiplicative p use the leading coefficients at γ−1, Greenberg–Stevens and the nonzero L-invariant; the same finite equality results after keeping the p-local Tamagawa factor.

**Hypotheses.**

- Selmer groups with Σ-imprimitive conditions are compared with the primitive ones by local factors at ℓ ∈ Σ (Skinner §3.1).
- In case (b), the nonvanishing of L(V_f) is an input (transcendence of the Tate period), requested from DiophantineApproximationAndTranscendence DT.5; the Greenberg–Stevens derivative formula is requested from PadicFamilies L3.
- L(f,1)≠0, integral main conjecture, precise Greenberg no-finite-submodule/projective-dimension and local control hypotheses; all orders displayed are finite.

**Proof route.**

1. No nonzero finite Λ-submodules in X (Greenberg; Skinner Proposition 2.3.3), so char ideals equal Fitting ideals and specialise.
2. Control: 0 → S → Sel_{ℚ∞}(f) → H¹(F_p, (M⁻)^{I_p}) → 0, and the last term vanishes unless α_p = 1 (Skinner §3.2); SelmerIwasawaCohomology L3/iwasawa-descent.
3. Local terms: #K_ℓ = c_ℓ(T_f) for ℓ ≠ p, and #K_p = c′_p c″_p with c′_p = c″_p = #(ℤ_p/(α_p − 1)) when α_p ≠ 1 (Tate local duality).
4. Cancel the local anomalous factor against the interpolation factor before displaying the finite BSD equality, as in Skinner (3.2.7).
5. Split multiplicative case: the extra zero of L_f at the trivial character and of Ch at γ − 1; compare L′_f(0) with L(V_f)·L_alg(f,1) (Greenberg–Stevens) and c_p with ψ_ur/ψ_cyc of the extension class (log_p q_E).

**Inputs.** `SelmerIwasawaCohomology:L3/iwasawa-descent`; `SelmerIwasawaCohomology:L4/greenberg-main-conjecture`; `ModularIwasawaMainConjectures:L0`; `PadicFamilies:L3`; `DiophantineApproximationAndTranscendence:DT.5`; `PadicHodgeRegulators:L3/rubin-coleman-map`; `PadicHodgeRegulators:L4/split-multiplicative-augmentation`; `SelmerIwasawaCohomology:L3`.

**Acceptance.**

- 11a1 at p = 5 is excluded (E[5] reducible); 11a1 at p = 3 (ordinary, good) has L_alg(f,1) a 3-adic unit and Sel(f) = 0.

**Sources.**

- [skinner-mult](#source-skinner-mult), §3.2, p. 20. Control at γ − 1.
- [skinner-mult](#source-skinner-mult), §1, Theorem B (iii), p. 2. The exceptional-zero hypothesis, satisfied for elliptic curves by Barré-Sirieix–Diaz–Gramain–Philibert.

<a id="rankzeroonebsd-bsd-6-rank-zero-ordinary-multiplicative-p-part"></a>

### The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)

`RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part` · theorem.

Let E/ℚ be elliptic with good ordinary or multiplicative reduction at a prime p ≥ 3, E[p] irreducible, and a prime q ≠ p of multiplicative reduction at which E[p] is ramified. If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0, i.e. ord_p #Ш(E/ℚ)[p^∞] = ord_p (L(E,1)/(Ω_E ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- The hypotheses are JSW Theorem 7.2.1(ii) and Skinner Theorem C, kept exactly; the residual hypothesis is the Skinner–Urban form (q ∥ N with ρ̄ ramified at q), not the stronger FW 1.6 form (RT-AREA-iwasawa-1/14).
- Multiplicative p (p ∥ N): the main conjecture is Skinner's Theorem A for p | N, and in the split case the exceptional-zero inputs (Greenberg–Stevens, L(V_f) ≠ 0) are used (RT-AREA-iwasawa-1/4); good ordinary p: Skinner–Urban plus Kato.

**Proof route.**

1. Main conjecture Ch_Λ(X) = (L_f) in Λ: for p ∤ N, Skinner–Urban's Theorem in the SU/Skinner Theorem A (p ∤ N) form (requested from ModularIwasawaMainConjectures L1); for p ∥ N, Skinner's Theorem A deduced from the p ∤ N case through Hida families and Fitting ideals (requested as a new ModularIwasawaMainConjectures layer beside L1).
2. cyclotomic-specialization-formula turns the equality into #ℤ_p/(L_alg(E,1)) = #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ, with the split multiplicative case through L(V_f) ≠ 0.
3. Sel_{p^∞}(E/ℚ) = Ш(E/ℚ)[p^∞] as E(ℚ) is finite (BSD.4/analytic-rank-zero-theorem) and E(ℚ)[p] = 0.
4. Periods: Ω_E = −2πiΩ_f^+ up to ℤ_(p)^× (Manin constant prime to p, requested from GZ.3); then BSD.5/p-part-from-two-bounds.

**Inputs.** [RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula](#rankzeroonebsd-bsd-6-cyclotomic-specialization-formula); `ModularIwasawaMainConjectures:L1`; [RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem); [RankZeroOneBSD:BSD.5/p-part-from-two-bounds](#rankzeroonebsd-bsd-5-p-part-from-two-bounds); [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality); [RankZeroOneBSD:BSD.4/kato-p-part-upper-bound](#rankzeroonebsd-bsd-4-kato-p-part-upper-bound); `GrossZagierAndArithmeticHeights:GZ.3`; `PadicFamilies:L3`; `DiophantineApproximationAndTranscendence:DT.5`.

**Acceptance.**

- E = 11a1, p = 3: hypotheses hold with q = 11 (E[3] ramified at 11 since 3 ∤ ord₁₁Δ = 5), and the formula gives Ш(E/ℚ)[3^∞] = 0.

**Sources.**

- [skinner-mult](#source-skinner-mult), §1, Theorem C, p. 3. The hypotheses.
- [jsw](#source-jsw), Theorem 7.2.1(ii), pp. 42–43. The same branch as JSW state it.

<a id="rankzeroonebsd-bsd-6-rank-zero-supersingular-p-part"></a>

### The p-part of BSD in rank zero at supersingular primes

`RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part` · theorem.

Let E/ℚ be semistable, or a quadratic twist of a semistable curve by a character unramified at the primes dividing the conductor of the semistable curve and with discriminant supported at primes of ordinary reduction and coprime to Np, and let p > 2 be a prime of good supersingular reduction with a_p(E) = 0 (automatic for p ≥ 5). If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- Hypotheses of BSTW Theorems 1.3 and 1.5 (r = 0); the twist range is BSTW's, not a broader one from a differently normalised statement.
- JSW7.2.1(iii) cites a withdrawn Wan preprint and allows a larger coprime-twist range. BSTW1.3/1.5 repair the semistable and ordinary-support twist endpoint only; the statements must not be called identical.

**Proof route.**

1. Kobayashi's signed main conjecture (L^±_p(E)) = ξ_Λ(X^±(E)) for E and its permitted twists (BSD.6a/bstw-signed-main-conjecture).
2. Specialise the + (or −) equality at the trivial character: Kobayashi's control theorem for signed Selmer groups gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ against L^±_p(E)(1) = (unit)·L(E,1)/Ω_E (BSD.6a/bstw-rank-zero-p-part).
3. E(ℚ) finite (BSD.4) and E(ℚ)[p] = 0; conclude by BSD.5/p-part-from-two-bounds.

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part](#rankzeroonebsd-bsd-6a-bstw-rank-zero-p-part); [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture); [RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem); [RankZeroOneBSD:BSD.5/p-part-from-two-bounds](#rankzeroonebsd-bsd-5-p-part-from-two-bounds).

**Acceptance.**

- E = 37a1 has rank one and is outside this node; for a semistable rank-zero curve with a supersingular p ≥ 5 the node applies with a_p = 0.

**Sources.**

- [bstw](#source-bstw), Theorem 1.5, p. 3. The r = 0 case is used; the r = 1 case rests on the p-adic Gross–Zagier formula, which is not imported.
- [jsw](#source-jsw), Theorem 7.2.1(iii), p. 43. JSW's statement of the branch.

<a id="rankzeroonebsd-bsd-6-residually-ramified-prime"></a>

### A semistable curve with irreducible E[p] is residually ramified somewhere

`RankZeroOneBSD:BSD.6/residually-ramified-prime` · lemma.

Let E/ℚ be semistable of conductor N>1 and p an odd prime of good reduction with E[p] irreducible. Some q|N, necessarily q≠p, has E[p] ramified. At a multiplicative q≠p this is equivalent to p∤ord_q(Δ_min), the geometric component multiplicity; it is not equivalent to p∤c_q(E/ℚ) at a nonsplit prime. For an imaginary quadratic K in which q is inert or ramified, the residual representation remains irreducible over K under the cited index-two inertia argument.

**Hypotheses.**

- E semistable, p odd, E[p] irreducible.
- p has good reduction, the range used in JSW’s level-lowering application; q≠p is required in the Tate-curve residual criterion.

**Proof route.**

1. If E[p] were unramified at every q | N, Ribet's level-lowering theorem would remove each q in turn, producing a weight-two cusp form of level 1 with residual representation E[p]; there is none (requested from SerreWeightAndLevelOptimisation R20.2).
2. At a multiplicative q, E[p] is ramified iff p ∤ ord_q(Δ_min) (Tate curve), and c_q = ord_q(Δ_min) in the split case.
3. Irreducibility over K: a G_K-stable line would be stable under the inertia at q, whose image is unipotent nontrivial, forcing a G_ℚ-stable line.

**Inputs.** `SerreWeightAndLevelOptimisation:R20.2`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; [RankZeroOneBSD:BSD.0/twist-local-factors](#rankzeroonebsd-bsd-0-twist-local-factors).

**Acceptance.**

- E = 11a1, p = 3: ord₁₁Δ = 5, so E[3] is ramified at 11.

**Sources.**

- [jsw](#source-jsw), §7.4, p. 45. The argument.
- [jsw](#source-jsw), §7.4.1, p. 45. Irreducibility over K.

<a id="rankzeroonebsd-bsd-6-jsw-lower-bound"></a>

### The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1)

`RankZeroOneBSD:BSD.6/jsw-lower-bound` · theorem.

Let E/ℚ be semistable, optimal, analyticRank E = 1, p ≥ 3 a prime of good reduction with E[p] irreducible (and a_p = 0 if p = 3 is supersingular). Then ord_p #Ш(E/ℚ)[p^∞] ≥ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- Hypotheses of JSW Theorem 1.2.1; isogeny invariance (BSD.5/defect-isogeny-invariance) reduces to optimal E.

**Proof route.**

1. Choose q | N with E[p] ramified (residually-ramified-prime) and K′ by BSD.2/auxiliary-fields-for-prime-parts (a): (gen-H), q inert or ramified, p split, L(E^{K′},1) ≠ 0; so rank E(K′) = 1, Ш(E/K′) finite.
2. Anticyclotomic main-conjecture divisibility plus control (BSD.6a/wan-anticyclotomic-divisibility, BSD.6a/anticyclotomic-selmer-control): ord_p L_p(f,1) ≤ ord_p(#H¹_{F_ac}(K′,E[p^∞])·C(E[p^∞])).
3. Remove the excluded height-one and p factors using JSW6.1.6’s exact μ input: Burungale Proposition5.1.3 for BDP/Brooks, with Hsieh’s auxiliary conditions where needed. Check squarefree conductor, a nonsplit bad prime, (irred_K), corank1 and local surjectivity. A generic Hsieh μ=0 citation alone does not discharge these.
4. The BDP–Brooks formula (GZ.9/quaternionic-weight-two-formula, GZ.9/p-optimal-quotient-formula): ord_p L_p(f,1) = 2 ord_p(((1 + p − a_p)/p)·log_ω z_{K′}); hence (JSW (7.4.b)) ord_p #Ш(E/K′)[p^∞] ≥ 2 ord_p m_{K′} − ord_p ∏_{w|N⁺} c_w(E/K′).
5. Gross–Zagier in Zhang's form for z_{K′} and the Ribet–Takahashi comparison (BSD.5/ribet-takahashi-degree-comparison) give 2 ord_p m_{K′} = ord_p((L′(E,1)/(Ω_E Reg))·(L(E^{K′},1)/Ω_{E^{K′}})) − ord_p ∏_{ℓ|N⁻} c_ℓ(E/K′), using BSD.1/quadratic-period and the Manin constant prime to p.
6. BSD.1/tamagawa-base-change, BSD.1/odd-selmer-sha-decomposition and the Kato bound for E^{K′} (BSD.4/kato-p-part-upper-bound) give the bound for E.

**Inputs.** [RankZeroOneBSD:BSD.6/residually-ramified-prime](#rankzeroonebsd-bsd-6-residually-ramified-prime); [RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts](#rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts); [RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility](#rankzeroonebsd-bsd-6a-wan-anticyclotomic-divisibility); [RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control](#rankzeroonebsd-bsd-6a-anticyclotomic-selmer-control); `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`; `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`; [RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison](#rankzeroonebsd-bsd-5-ribet-takahashi-degree-comparison); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); [RankZeroOneBSD:BSD.4/kato-p-part-upper-bound](#rankzeroonebsd-bsd-4-kato-p-part-upper-bound); [RankZeroOneBSD:BSD.3/analytic-rank-one-theorem](#rankzeroonebsd-bsd-3-analytic-rank-one-theorem); [RankZeroOneBSD:BSD.5/defect-isogeny-invariance](#rankzeroonebsd-bsd-5-defect-isogeny-invariance); `GrossZagierAndArithmeticHeights:GZ.3`; `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`.

**Acceptance.**

- JSW (7.4.d).

**Sources.**

- [jsw](#source-jsw), §7.4.1, (7.4.d), p. 47. The lower bound.

<a id="rankzeroonebsd-bsd-6-jsw-upper-bound"></a>

### The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2)

`RankZeroOneBSD:BSD.6/jsw-upper-bound` · theorem.

Under the hypotheses of jsw-lower-bound, ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- As jsw-lower-bound.

**Proof route.**

1. Factor N = N⁺N⁻ (N⁺ = q, N⁻ = N/q if the number of primes of N is odd; N⁺ = 1 otherwise) and choose K″ by BSD.2/auxiliary-fields-for-prime-parts (b): N⁺ split, N⁻ inert, p split, L(E^{K″},1) ≠ 0.
2. Use the actual odd-prime Shimura-curve Kolyvagin bound of JSW Theorem4.4.1 with its full residual/local hypotheses and defect terms, requested from HE.7/ES.4. The HE.7 dyadic conjugation node and Howard’s more restrictive clean classical bound cannot be substituted without a hypothesis proof.
3. Gross–Zagier for z_{K″} and Ribet–Takahashi as in jsw-lower-bound; no prime w | N⁺ has p | c_w(E/K″).
4. The rank-zero equality for E^{K″} (rank-zero-ordinary-multiplicative-p-part or rank-zero-supersingular-p-part) and the odd decomposition give the bound for E.

**Inputs.** [RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts](#rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts); `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`; `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`; `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`; `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`; [RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison](#rankzeroonebsd-bsd-5-ribet-takahashi-degree-comparison); [RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part](#rankzeroonebsd-bsd-6-rank-zero-ordinary-multiplicative-p-part); [RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part](#rankzeroonebsd-bsd-6-rank-zero-supersingular-p-part); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); `GrossZagierAndArithmeticHeights:GZ.3`; `HeegnerPointEulerSystems:HE.7`.

**Acceptance.**

- JSW (7.4.e).

**Sources.**

- [jsw](#source-jsw), §7.4.2, (7.4.e), p. 48. The upper bound.

<a id="rankzeroonebsd-bsd-6-jsw-rank-one-p-part"></a>

### The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)

`RankZeroOneBSD:BSD.6/jsw-rank-one-p-part` · theorem.

Let E/ℚ be semistable with analyticRank E = 1 and p ≥ 3 a prime of good reduction with E[p] irreducible; if p = 3 and E is supersingular at 3, assume a₃(E) = 0. Then padicValRat p (bsdDefect E) = 0, i.e. ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_ℓ c_ℓ(E/ℚ)).

**Hypotheses.**

- Semistability of E is a global hypothesis and is not the same as good reduction at p; both are assumed.
- p = 3 is included under JSW's extra hypothesis; no upgrade beyond it is claimed.

**Proof route.**

1. Reduce to E optimal (BSD.5/defect-isogeny-invariance).
2. Combine jsw-lower-bound and jsw-upper-bound with BSD.5/p-part-from-two-bounds (E(ℚ)[p] = 0 as E[p] is irreducible).
3. For the semistable good-supersingular endpoint use bstw-rank-one-p-part directly; that source does not justify the separate jsw-upper-bound auxiliary-twist proof. The ordinary JSW route still needs the recorded exact finite/control/degree inputs.

**Inputs.** [RankZeroOneBSD:BSD.6/jsw-lower-bound](#rankzeroonebsd-bsd-6-jsw-lower-bound); [RankZeroOneBSD:BSD.6/jsw-upper-bound](#rankzeroonebsd-bsd-6-jsw-upper-bound); [RankZeroOneBSD:BSD.5/p-part-from-two-bounds](#rankzeroonebsd-bsd-5-p-part-from-two-bounds); [RankZeroOneBSD:BSD.5/defect-isogeny-invariance](#rankzeroonebsd-bsd-5-defect-isogeny-invariance); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.6/bstw-rank-one-p-part](#rankzeroonebsd-bsd-6-bstw-rank-one-p-part).

**Acceptance.**

- E = 37a1 (prime conductor, no rational isogeny) at every prime p ≥ 3 with p ≥ 5, p ≠ 37: ord_p of the defect is 0.

**Sources.**

- [jsw](#source-jsw), Theorem 1.2.1, p. 2. The theorem (with the p = 3 clause that follows it).
- [jsw](#source-jsw), §1.2, p. 2. The p = 3 case.

<a id="rankzeroonebsd-bsd-6-castella-multiplicative-rank-one-p-part"></a>

### The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)

`RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part` · theorem.

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3. Assume E[p] is irreducible, E has nonsplit multiplicative reduction at some prime q ≠ p at which E[p] is ramified, and E(ℚ_p)[p] = 0. If analyticRank E = 1, then padicValRat p (bsdDefect E) = 0: ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_{ℓ|N} c_ℓ(E/ℚ)). E need not be semistable (additive primes other than p allowed); the original wider Theorem A of Castella (2018) is not a target.

**Hypotheses.**

- Exactly the hypotheses of Theorem A′ of Castella's erratum; the nonsplit condition at q and E(ℚ_p)[p] = 0 are additional to the 2018 statement.

**Proof route.**

1. Choose K by BSD.2/auxiliary-fields-for-prime-parts (c) satisfying the hypotheses of the corrected Theorem 1.1, with L(E^K, 1) ≠ 0.
2. Anticyclotomic main conjecture Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)) (BSD.6a/castella-anticyclotomic-main-conjecture).
3. Specialise at the trivial character with the multiplicative-prime BDP formula L_p(f,1) = (1 − a_p p^{−1})²(log_{ω_E} P_K)² up to units (GZ.9/multiplicative-prime-formula; no exceptional zero) and the anticyclotomic control theorem at a multiplicative prime (Castella §5).
4. Convert the Heegner logarithm/index with the proved Gross–Zagier formula and quadratic comparisons. The chosen q is ramified in K, so E^K is additive there; Skinner C cannot be invoked using q as a multiplicative ramification prime. Supply a separate proved rank-zero input or an alternative inequality, and extend the semistable GZ.9 multiplicative formula/control to the additive-away-from-p range of A′.

**Inputs.** [RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-6a-castella-anticyclotomic-main-conjecture); [RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts](#rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts); `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`; [RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part](#rankzeroonebsd-bsd-6-rank-zero-ordinary-multiplicative-p-part); `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`; [RankZeroOneBSD:BSD.1/odd-part-bsd-over-K](#rankzeroonebsd-bsd-1-odd-part-bsd-over-k); [RankZeroOneBSD:BSD.5/p-part-from-two-bounds](#rankzeroonebsd-bsd-5-p-part-from-two-bounds); [RankZeroOneBSD:BSD.3/analytic-rank-one-theorem](#rankzeroonebsd-bsd-3-analytic-rank-one-theorem); [RankZeroOneBSD:BSD.5/defect-isogeny-invariance](#rankzeroonebsd-bsd-5-defect-isogeny-invariance); `GrossZagierAndArithmeticHeights:GZ.3`; `GrossZagierAndArithmeticHeights:GZ.9`.

**Acceptance.**

- Castella's Remark: for split multiplicative p, E(ℚ_p)[p] = 0 is equivalent to p ∤ ord_p(q_E) and log_p(q_E) ∈ pℤ_p^× (Skinner–Zhang's condition (b)).

**Sources.**

- [castella-erratum](#source-castella-erratum), Theorem A′, p. 1. The hypotheses of the corrected theorem.
- [castella-erratum](#source-castella-erratum), Remark after Theorem A′, pp. 1–2. Additive primes allowed.

<a id="rankzeroonebsd-bsd-6-bstw-rank-one-p-part"></a>

### BSTW supersingular rank-one p-part

`RankZeroOneBSD:BSD.6/bstw-rank-one-p-part` · theorem.

Let E/ℚ be semistable with analyticRank E=1, and p>2 a good supersingular prime with a_p=0 (explicit when p=3). Then v_p(bsdDefect E)=0. The same holds for twists in BSTW1.3’s coprime ordinary-support range. This direct endpoint does not assert the old JSW auxiliary-twist proof applies outside that range.

**Hypotheses.**

- Exactly BSTW1.5 rank-one hypotheses, with the Néron period and BSD regulator normalization. No residual irreducibility is added to the source endpoint.

**Proof route.**

1. Use the signed main conjecture and the source’s supersingular p-adic Gross–Zagier formula (Kobayashi [88]), signed Selmer control, cyclotomic descent and finite Sha/rank theorem.
2. Transfer the resulting leading-term equality to bsdDefect with the correct regulator and torsion denominator; good supersingular p gives no rational p-torsion.

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); `GrossZagierAndArithmeticHeights:GZ.9`; `SelmerIwasawaCohomology:L3`.

**Acceptance.**

- Retain a₃=0 when p=3; 37a1 has a₃=−3 and is not an example at that prime.

**Sources.**

- [bstw](#source-bstw), Theorem1.5, printed p.4 (rank one), and §11. Direct semistable rank-one supersingular endpoint, preserving the ordinary-support twist range.

## BSD.6a — Anticyclotomic and signed proof inputs

The control theorem specifies strict and relaxed local conditions and all finite corrections. The former Wan-labelled divisibility is routed through the current BSTW proof, under its current range. Signed zeta elements, their two reciprocity laws and the signed/Greenberg comparison are independent early inputs, distinct from ordinary Kato imports and downstream congruence applications. Castella’s corrected anticyclotomic theorem requires its higher-weight descent input. Missing signed carriers, a signed analogue of the ordinary Proposition 9.18 proof, and higher-weight integral Kolyvagin control remain explicit.

**Planets:** BSTW two-variable zeta element ([declaration](#rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element)); Kobayashi's signed main conjecture (BSTW) ([declaration](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture)); Castella's corrected Theorem 1.1 ([declaration](#rankzeroonebsd-bsd-6a-castella-anticyclotomic-main-conjecture)); Signed main-conjecture comparison ([declaration](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture-comparison)); Integral higher-weight Kolyvagin bound ([declaration](#rankzeroonebsd-bsd-6a-higher-weight-integral-kolyvagin-bound)).

<a id="rankzeroonebsd-bsd-6a-anticyclotomic-selmer-control"></a>

### Anticyclotomic control at the trivial character (JSW Theorem 3.3.1)

`RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control` · theorem.

Let E/ℚ be semistable, p ≥ 3 a prime of good reduction with E[p] irreducible, K imaginary quadratic with p = 𝔭𝔭̄ split, (gen-H) for N = N⁺N⁻ and (irred_K). Let K_∞ be the anticyclotomic ℤ_p-extension, Λ = ℤ_p[[Gal(K_∞/K)]], and X_ac the dual of the Selmer group with the 'relaxed at 𝔭, strict at 𝔭̄' conditions at p (the Greenberg-type condition of the BDP main conjecture). If rank E(K) = 1 and Ш(E/K)[p^∞] is finite, then X_ac is Λ-torsion and ord_p(Ch_Λ(X_ac)(0)) = ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])), where, by JSW (3.5.d), ord_p(#H¹_{F_ac}·C) = ord_p #Ш(E/K) − 2 ord_p [E(K) : ℤz_K] + 2 ord_p(((1 + p − a_p)/p)·log_ω z_K) + ord_p ∏_{w|N⁺} c_w(E/K).

**Hypotheses.**

- JSW's (split), (gen-H), (good), (-free), (irred_K), (corank 1), (sur); the control is a comparison of finite modules with all local terms kept.
- Use the finite-level/index/regulator convention of JSW3.5 with E(K)[p]=0, nonzero z_K and the (sur) local map; do not replace finite-level H1_ac and Λ-adic duals without the control theorem.

**Proof route.**

1. Control via Greenberg's method: compare the Λ-adic Selmer group at the augmentation ideal with H¹_{F_ac}(K, E[p^∞]), the kernel and cokernel being controlled by H⁰ terms that vanish under (irred_K) and local terms at primes w | N⁺ split in K (Tamagawa factors) (SelmerIwasawaCohomology L3/iwasawa-descent, L3/semilocal-cohomology). This requires a Selmer-specific map with its finite kernel/cokernel and augmentation correction; derived cohomology descent alone is insufficient.
2. No proper finite-index Λ-submodules (as in Castella erratum Lemma 2.2), so the characteristic ideal specialises to the Fitting ideal.
3. Express #H¹_{F_ac} through Ш, the index of z_K and the p-adic logarithm at 𝔭 using the Bloch–Kato logarithm of the Kummer class (GZ.9/bloch-kato-logarithm-of-heegner-class) and Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate).

**Inputs.** `SelmerIwasawaCohomology:L3/iwasawa-descent`; `SelmerIwasawaCohomology:L3/semilocal-cohomology`; `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`; `ArithmeticGaloisDuality:R02.4/poitou-tate`; [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); `ModularIwasawaMainConjectures:L0`; `SelmerIwasawaCohomology:L3`; `ArithmeticGaloisDuality:R02.4`.

**Acceptance.**

- Used with K = K′ in BSD.6/jsw-lower-bound (JSW (7.4.a)–(7.4.b)).

**Sources.**

- [jsw](#source-jsw), §1.3, p. 3. The control theorem.

<a id="rankzeroonebsd-bsd-6a-wan-anticyclotomic-divisibility"></a>

### The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6)

`RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility` · theorem.

In the setting of anticyclotomic-selmer-control (p ≥ 3 good ordinary or supersingular, with a_p = 0 if p = 3 is supersingular), the BDP–Brooks p-adic L-function L_p(f) ∈ Λ^ur (GZ.9) satisfies the divisibility Ch_{Λ^ur}(X_ac) ⊆ (L_p(f)) in Λ^ur ⊗ ℚ_p, and integrally in Λ^ur under JSW's hypotheses (the μ-part requiring JSW6.1.6/Burungale5.1.3 and all selected Hsieh hypotheses); consequently ord_p L_p(f, 1) ≤ ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])) (JSW Proposition 6.2.1).

**Hypotheses.**

- Inputs are owned elsewhere: the U(3,1) Eisenstein congruences (AutomorphicCongruences L2 for the ordinary FW route, L2s for the semi-ordinary CLW replacement of withdrawn Wan arXiv:1412.1767), Hsieh's μ theorem (AutomorphicPadicLFunctions L3h) and the Eischen–Wan finite-slope families (L4e).
- The divisibility direction is the one giving lower bounds for Sha; the reverse divisibility is not claimed here.

**Proof route.**

1. Construct the Klingen Eisenstein family on GU(3,1) whose constant term is L_p(f)·(Katz factor) and whose non-degenerate Fourier–Jacobi coefficients are p-adic units (AutomorphicCongruences L2/L2s; Eischen–Wan for finite slope, APL L4e).
2. Lattice construction: the congruence between the Eisenstein family and cusp forms produces Selmer classes, giving Ch(X_ac) ⊆ (L_p(f)) (the Ribet–Urban method).
3. Remove the ambiguity of powers of p: μ(L_p(f)) = 0 by Hsieh (APL L3h) and the comparison of BDP and Hida's two-variable functions (GZ.9/imprimitive-function-dictionary).
4. Specialise at the trivial character with anticyclotomic-selmer-control.
5. CLW L2s supplies fractional one-sided containment with auxiliary-character/local/residual hypotheses and inverted coefficient elements, not an unrestricted integral supersingular equality. Prove those conditions and removal of exceptional height-one primes before asserting the integral JSW consequence.

**Inputs.** `AutomorphicCongruences:L2`; `AutomorphicCongruences:L2s`; `AutomorphicPadicLFunctions:L3h`; `AutomorphicPadicLFunctions:L4e`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`; `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`; [RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control](#rankzeroonebsd-bsd-6a-anticyclotomic-selmer-control).

**Acceptance.**

- JSW (7.4.a) for K = K′.

**Sources.**

- [jsw](#source-jsw), §1.3, p. 3. The divisibility and its integral ambiguity, removed in JSW §6.

<a id="rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element"></a>

### The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW)

`RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element` · construction.

Let E/ℚ have good supersingular reduction at p∤2N with a_p=0, and L imaginary quadratic with (D_L,N)=1, p=v v̄ split (v fixed by the p-adic embedding), E[p](L)=0. Construct BSTW §6’s signed zeta element Z^•(E/L) in the actual two-variable relaxed/signed Iwasawa cohomology with its integral lattice and completed unramified coefficients. This node owns only the supersingular construction. The ordinary element, its laws and ordinary Proposition9.18 belong to the requested KatoEulerSystems L5; reuse that owner’s underlying classes/CM-family machinery.

**Hypotheses.**

- p>2 good supersingular and a_p=0 (explicit also at p=3); (D_L,N)=1, p split and E[p](L)=0. The embedding fixes v; signs •∈{+,−} use the actual Kobayashi/Pollack normalization.
- RT/30 ordinary ownership is KatoEulerSystems proposed L5, requested at its present nearest L4 stage. BSD.6a owns the signed §6 construction and signed §9.3.2 comparison only.

**Proof route.**

1. Import Kato’s actual classes/norm relations and the ordinary owner’s CM-family base construction; PadicFamilies L4, not merely its eigencurve L1, must supply the CM family specialization.
2. Carry out BSTW §6’s supersingular signed construction with the integral two-variable local maps, using the rank-one cohomology statement and no global congruence equality as a construction assumption.
3. Prove both local reciprocity laws with a common integral normalization; one-variable rational PHR maps require the requested signed/unramified two-variable extension and normalization proof.
4. Nonzero analytic images imply nonzero zeta class. Preserve local conditions and lattice under the specified cyclotomic projections, not arbitrary changes of the quadratic field.

**Inputs.** `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`; `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`; `PadicHodgeRegulators:L3/crystalline-regulator`; `PadicHodgeRegulators:L4/signed-local-condition`; `PadicHodgeRegulators:L4/actual-coleman-image`; `PadicHodgeRegulators:L4/integral-image-index`; `SelmerIwasawaCohomology:L3/iwasawa-cohomology`; `ArithmeticGaloisDuality:R02.4`; `KatoEulerSystems:L4`; `PadicFamilies:L4`; `PadicHodgeRegulators:L4`; `AutomorphicPadicLFunctions:L3`.

**Suggested home.** `TauCeti/NumberTheory/Iwasawa/BSTWZetaElement`; namespace `TauCeti.BSD`.

**Uses.**

- BSTW Proposition 1.19: one-sided divisibilities in the three main conjectures 1.16–1.18 are equivalent through the zeta element
- RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture: the comparison and cyclotomic descent of BSTW §§9–10
- AutomorphicCongruences:L5a: BCS Theorem 4.1.3's two-variable comparison is BSTW §9.3.2 and must import this element (RT-AREA-iwasawa-1/30)

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.bstwZetaElement` | constructor | Z^•(E/L) in the two-variable Iwasawa cohomology with the relaxed/signed local condition. |
| `TauCeti.BSD.bstwZetaElement_ne_zero` | other | Z^•(E/L) ≠ 0. |
| `TauCeti.BSD.bstwZetaElement_col` | relation | Col^•_v(loc_v Z^•(E/L)) = L^•_p(E/L) (first explicit reciprocity law). |
| `TauCeti.BSD.bstwZetaElement_log` | relation | Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L) in the completed unramified coefficient extension. The Coleman law uses v; the logarithm law uses v̄. |
| `TauCeti.BSD.bstwZetaElement_cyclotomic` | compatibility | Its image under the projection to the cyclotomic ℤ_p-extension of ℚ is Kato's zeta element up to the Euler factors of BSTW §10. |
| `TauCeti.BSD.bstwZetaElement_twist` | functoriality | Compatible with the specified twist/character projections in BSTW(1.3)–(1.8), after identifying representations, coefficient lattices and Euler factors. No canonical map between unrelated fields L is asserted. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `TauCeti.BSD.bstwZetaElement_ne_zero_test` | characterisation | Under the signed construction hypotheses Z^•≠0, because the nonzero signed analytic image under Col_v is prescribed. |
| `TauCeti.BSD.bstwZetaElement_cyclotomic_test` | compatibility | Under the source’s cyclotomic projection and both local non-torsion conditions (nv), the specialized class has the stated Kato/CM-twist projections with their exact Euler factors; this is not an identification of a single class with two unrelated classes. |
| `TauCeti.BSD.bstwZetaElement_requires_split` | non-example | If p is inert in L the construction does not apply: the two-variable signed Coleman maps of BSTW need p = 𝔭𝔭̄ split, and no element is asserted. |
| `TauCeti.BSD.bstwZetaElement_reciprocity_square` | degenerate | At the trivial character the signed Coleman law specializes at v, while the Greenberg logarithm law specializes at v̄; both keep their Euler/period factors. They are not the square of one map at one prime. |

**Acceptance.**

- Its images under the two explicit reciprocity laws are the nonzero p-adic L-functions L^•_p(E/L) and L^Gr_p(E/L), so Z^•(E/L) ≠ 0 (BSTW Remark 1.15(ii)).

**Sources.**

- [bstw](#source-bstw), Theorem 1.14, printed p. 7. The construction.
- [bstw](#source-bstw), Remark 1.15(ii), printed p. 7. Nonvanishing.

<a id="rankzeroonebsd-bsd-6a-bstw-explicit-reciprocity-laws"></a>

### The two explicit reciprocity laws for the BSTW zeta element

`RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws` · theorem.

In the signed setting of bstw-two-variable-zeta-element, Col^•_v(loc_v Z^•)=L^•_p(E/L) and Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L). The maps have the precise signed local domains and targets Λ_L, respectively its completed unramified coefficient extension, with the common integral normalization of BSTW Theorem1.14, printed p.7. The laws are at conjugate primes. The Greenberg function is the Rankin–Selberg/CM-family function from its analytic owner, with BDP obtained only by the specified anticyclotomic projection.

**Hypotheses.**

- As the signed zeta construction. No ordinary construction is replanned, and no one-variable BDP function is simply declared to be the two-variable Greenberg function.

**Proof route.**

1. First law: Kato's explicit reciprocity (KatoEulerSystems L3) interpolated over the family, with the signed Coleman maps of PadicHodgeRegulators L4.
2. Second law: the Perrin-Riou logarithm at the other prime above p, compared with the BDP–Brooks interpolation (GZ.9/bdp-p-adic-l-function, GZ.9/bdp-weight-two-heegner-formula) through the explicit reciprocity of PadicHodgeRegulators L3/explicit-reciprocity.
3. Common normalisation: both are computed with the same integral basis of D_cris and the same CM periods (BSTW §§5–6).

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element](#rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element); `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`; `PadicHodgeRegulators:L3/explicit-reciprocity`; `PadicHodgeRegulators:L4/regulator-coordinate-decomposition`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`; `ArithmeticGaloisDuality:R02.4`; `PadicHodgeRegulators:L4`; `AutomorphicPadicLFunctions:L3`.

**Acceptance.**

- Specialising both laws at the trivial character recovers Kato's reciprocity for E and the BDP formula for E/L.

**Sources.**

- [bstw](#source-bstw), Theorem 1.14, printed p. 7. The two displayed laws, transcribed visually with the conjugate-prime bar restored; the OCR loses it.

<a id="rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture"></a>

### Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3)

`RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture` · theorem.

Let E/ℚ be semistable and p > 2 a supersingular prime, with a₃(E) = 0 if p = 3. Then for ∘ ∈ {+, −}, (L^∘_p(E)) = ξ_Λ(X^∘(E)) in Λ = ℤ_p[[Gal(ℚ_∞/ℚ)]], where L^±_p(E) are Pollack's signed p-adic L-functions and X^±(E) the duals of Kobayashi's signed Selmer groups. The same holds for every quadratic twist E^K with D_K coprime to Np and divisible only by primes of ordinary reduction for E. The equality is exported to ModularIwasawaMainConjectures L6.

**Hypotheses.**

- Exactly BSTW's hypotheses and twist range; Wan arXiv:1411.6352 is withdrawn and superseded in part by BSTW (Remark 1.4); its CM case is Pollack–Rubin.

**Proof route.**

1. Choose auxiliary L with split p and the required local character/congruence hypotheses and cyclotomic (nv). Proposition1.19 uses (irr_L), stronger than (van_L), but BSTW §1.2.1 explicitly says (irr_L) holds for good supersingular p>2. Discharge it from the local supersingular residual representation at the split p-adic place; do not present it as an extra unproved field-existence restriction.
2. One divisibility in the two-variable Greenberg main conjecture over L from the semi-ordinary GU(3,1) congruences of Castella–Liu–Wan (AutomorphicCongruences L2s) and Hsieh's μ theorem (AutomorphicPadicLFunctions L3h).
3. Transfer the rational divisibility using bstw-signed-main-conjecture-comparison. BSTW Proposition1.19 upgrades to an integral comparison under E[p]|G_L irreducible (1.6); the weaker van_L is sufficient for Proposition9.18’s comparison identity but not for every integral MC step.
4. The opposite divisibility from Kato's signed Euler-system bound (KatoEulerSystems L4, EulerSystemsAndKolyvaginSystems ES.4, signed local conditions of PadicHodgeRegulators L4).
5. Cyclotomic descent from L to ℚ (BSTW §10), separating E and E^L; track the height-one primes and residual conditions.

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws](#rankzeroonebsd-bsd-6a-bstw-explicit-reciprocity-laws); [RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element](#rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element); `AutomorphicCongruences:L2s`; `AutomorphicPadicLFunctions:L3h`; `KatoEulerSystems:L4/cohomological-divisibility-one-direction`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`; `PadicHodgeRegulators:L4/signed-local-condition`; `ModularSymbolsPadicLFunctions:L4/plus-minus-decomposition`; `ModularIwasawaMainConjectures:L4`; `SelmerIwasawaCohomology:L3/iwasawa-descent`; [RankZeroOneBSD:BSD.2/heegner-local-conditions](#rankzeroonebsd-bsd-2-heegner-local-conditions); [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture-comparison).

**Acceptance.**

- 11a1 at p = 19 (a₁₉ = 0, E[19] irreducible, semistable): both signed main conjectures hold, and so does the twisted statement for E^K with D_K coprime to 11·19 supported at ordinary primes.

**Sources.**

- [bstw](#source-bstw), Theorem 1.3, p. 3. The theorem.
- [bstw](#source-bstw), Theorem 1.3, p. 3. The twist range.

<a id="rankzeroonebsd-bsd-6a-bstw-rank-zero-p-part"></a>

### Specialisation of the signed main conjecture in rank zero

`RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part` · theorem.

Under the hypotheses of bstw-signed-main-conjecture (E or a permitted twist E^K), if L(E, 1) ≠ 0 then #Ш(E/ℚ)[p^∞]·∏_ℓ c_ℓ(E) and L(E,1)/Ω_E have the same p-adic valuation (the r = 0 case of BSTW Theorem 1.5).

**Hypotheses.**

- Supersingular p > 2 with a_p = 0 (automatic for p ≥ 5).

**Proof route.**

1. Specialise (L^+_p(E)) = ξ_Λ(X^+(E)) at the trivial character: L^+_p(E)(1) is a p-adic unit times L(E,1)/Ω_E^+ (interpolation with the factor (p − 1) or 2 from the half-logarithms, ModularSymbolsPadicLFunctions L4/half-logarithms), and Kobayashi's control theorem for the + Selmer group gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ.
2. E(ℚ) is finite (BSD.4) so Sel = Ш[p^∞]; Ω_E^+ versus Ω_E needs the Manin constant prime to p (GZ.3).

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture); `ModularSymbolsPadicLFunctions:L4/half-logarithms`; `SelmerIwasawaCohomology:L3/iwasawa-descent`; [RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem](#rankzeroonebsd-bsd-4-analytic-rank-zero-theorem); `GrossZagierAndArithmeticHeights:GZ.3`; `SelmerIwasawaCohomology:L3`.

**Acceptance.**

- BSTW Theorem 1.5 with r = 0.

**Sources.**

- [bstw](#source-bstw), Theorem 1.5, p. 3. The r = 0 case.

<a id="rankzeroonebsd-bsd-6a-castella-anticyclotomic-main-conjecture"></a>

### Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1)

`RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture` · theorem.

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3, K imaginary quadratic with an ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N and p = 𝔭𝔭̄ split. Assume (i) E[p] irreducible; (ii) if 2 is nonsplit in K then 2 ∥ N; (iii) E has nonsplit multiplicative reduction at each prime q ∥ N nonsplit in K, and E[p] is ramified at at least one such q; (iv) E(ℚ_p)[p] = 0. Then X_ac(E[p^∞]) is Λ-torsion and Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)), with L_p(f) the BDP-type function of GZ.9/multiplicative-prime-formula.

**Hypotheses.**

- Exactly the corrected hypotheses; the invalid Hida specialisation step of Castella (2018) Theorem 4.2 is not used, and additive primes are allowed.

**Proof route.**

1. Choose a Hida family f through the p-stabilised newform and, for each m, a p-ordinary newform g of weight k > 2 with k≡2 mod p−1 and level M with p ∤ M congruent to f modulo p^m (Skinner §3.1's Hida-family/Fitting-ideal argument; requested from ModularIwasawaMainConjectures).
2. For g, the higher-weight main conjecture castella-higher-weight-input gives Ch(X_ac^Σ(A_g)) = (L^Σ_p(g)).
3. castella-higher-weight-input's Lemma 2.1 (needs (iv)) identifies Sel^Σ_p(K, M_f[ϖ^m]) with Sel^Σ_p(K, M_f)[ϖ^m]; Lemma 2.2 (no proper finite-index submodules) turns characteristic ideals into Fitting ideals, which are compatible with the congruence.
4. Congruence of p-adic L-functions modulo p^m (GH.7 big Heegner/BDP families) and letting m → ∞ gives the equality for f; remove Σ-imprimitivity with local factors.
5. Preserve the nonsplit special local type along the Hida family by FO12 Lemma2.14 from R21.3; carry hypotheses (iii)–(iv) into each g_m using the Hecke relation. Prove the anticyclotomic Fitting-congruence argument for every m, not merely its analogy with Skinner’s cyclotomic proof.

**Inputs.** [RankZeroOneBSD:BSD.6a/castella-higher-weight-input](#rankzeroonebsd-bsd-6a-castella-higher-weight-input); `GeneralizedHeegnerCycles:GH.7`; `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`; `ModularIwasawaMainConjectures:L1`; `SelmerIwasawaCohomology:L3/iwasawa-descent`; `GrossZagierAndArithmeticHeights:GZ.9`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`.

**Acceptance.**

- Castella erratum Theorem 1.1.

**Sources.**

- [castella-erratum](#source-castella-erratum), Theorem 1.1, p. 1. The conclusion.
- [castella-erratum](#source-castella-erratum), §1, p. 1. The correction.

<a id="rankzeroonebsd-bsd-6a-castella-higher-weight-input"></a>

### The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction

`RankZeroOneBSD:BSD.6a/castella-higher-weight-input` · theorem.

(a) (Erratum Theorem 2.3.) Let g ∈ S_k(Γ₀(M)) be a p-ordinary newform of even weight k ≥ 2 and level M ≥ 3 with p ∤ M, and K imaginary quadratic with p split and a Heegner ideal of norm M. Assume ρ̄_g|_{G_K} irreducible; 2 ∥ M if 2 is nonsplit in K; some q ∥ M nonsplit in K; and at every ℓ ∥ M nonsplit in K, π(g)_ℓ is the special representation twisted by the unramified character ℓ ↦ −ℓ^{k/2−1}. Then for every finite set Σ of primes not above p, X^Σ_ac(A_g) is Λ_O-torsion and Ch_{Λ_O}(X^Σ_ac(A_g))Λ^ur_O = (L^Σ_p(g)). (b) (Lemma 2.1.) If Σ contains the primes v ∤ p where T_g ramifies, ρ̄_g|_{G_K} is irreducible and H⁰(K_𝔭, A_g[ϖ]) = 0, then Sel^Σ_p(K, M_g[ϖ^m]) ≅ Sel^Σ_p(K, M_g)[ϖ^m]. (c) (Lemma 2.2.) If X_ac(A_g) is Λ_O-torsion, Sel^Σ_p(K, M_g) has no proper finite-index Λ_O-submodules.

**Hypotheses.**

- Use GH.2–7 generalized Heegner classes and the exact reciprocity laws; the higher-weight integral Kolyvagin bound is proved in BSD.6a/higher-weight-integral-kolyvagin-bound. Import only CGS’s elliptic-curve rational comparison as background, not a ready higher-weight integral theorem. The reverse divisibility uses FW Theorem4.41/Corollary7.21 from AC L2; CGS Proposition2.4.5 from APL L3h; FO12 Lemma2.14 from R21.3; BCK5.2 from HE.8/HE.8b; Greenberg no-finite-submodule theorem from SIC L3. Prove each local/residual/integral hypothesis and the Σ-imprimitive projection here.

**Proof route.**

1. (a) Use the higher-weight integral Kolyvagin bound added in this packet, retaining the augmentation-prime case, C1=C2=0 proof and corrected generalized Heegner local conditions. Combine the BCK comparison, exact GH reciprocity, FW reverse divisibility and APL anticyclotomic Rankin/Katz-to-BDP projection. Prove the Σ-imprimitive version via JSW3.4.2/6.1.6 with matching factors.
2. (b) Shapiro's lemma and H⁰(K, M_g) = H⁰(K_∞, A_g) = 0 give H¹(G_{K,S}, M_g[ϖ^m]) ≅ H¹(G_{K,S}, M_g)[ϖ^m]; the local kernel at 𝔭 is H⁰(K_𝔭, M_g)/ϖ^m, zero when H⁰(K_𝔭, A_g[ϖ]) = 0.
3. (c) Greenberg's general results (as in Hsieh–Lei and Skinner Proposition 2.3.3).
4. CGS6.5.1 is for T_pE and gives its displayed bound over Λ[1/p]. Prove the extension to T_g, rather than assuming it. Correct the erratum’s second C2=0 to C1=0 and discharge it via Cha05/large-image input. The nonexistent FO12 Cor7.2.1 is not a supplier.

**Inputs.** `GeneralizedHeegnerCycles:GH.7`; `AutomorphicCongruences:L2`; `AutomorphicPadicLFunctions:L3h`; `AutomorphicPadicLFunctions:L4e`; `HeegnerPointEulerSystems:HE.8b`; `HeegnerPointEulerSystems:HE.8`; `SelmerIwasawaCohomology:L3/iwasawa-shapiro`; `EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds`; `SelmerIwasawaCohomology:L3`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; [RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound](#rankzeroonebsd-bsd-6a-higher-weight-integral-kolyvagin-bound).

**Acceptance.**

- For g of weight 2 congruent to the p-stabilised form of E, (b) needs E(ℚ_p)[p] = 0: this is where hypothesis (iv) of Theorem 1.1 enters.

**Sources.**

- [castella-erratum](#source-castella-erratum), Theorem 2.3, p. 3. Part (a).
- [castella-erratum](#source-castella-erratum), Lemma 2.1, p. 2. Part (b).
- [castella-erratum](#source-castella-erratum), Remark after Theorem A′, p. 2. Why E(ℚ_p)[p] = 0 is needed.

<a id="rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture-comparison"></a>

### Signed Perrin–Riou and Greenberg main-conjecture comparison

`RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison` · theorem.

For the signed BSTW zeta datum with rank-one relaxed cohomology, nonzero analytic images and van_L:E[p](L)=0, the signed and Greenberg dual Selmer modules are torsion and char(X_Gr)·(L_p^•)=char(X_•)·(L_p^Gr) in Λ_L^ur. Obtain the cyclotomic-quotient version only when both localizations of the specialized class are non-torsion (nv). Without van_L retain the source’s rational form after inverting p. This comparison identity is distinct from the extra irreducibility assumptions in an integral main-conjecture proof.

**Hypotheses.**

- Good supersingular p>2, a_p=0, split p, (D_L,N)=1; actual two-variable and cyclotomic local conditions/coefficients of BSTW9.3.2.
- Rank-one relaxed cohomology, zeta nonzero and the signed analogues of exact sequences(9.11)–(9.13), with integral local image corrections computed; (nv) for the cyclotomic version.

**Proof route.**

1. Prove the signed Poitou–Tate sequences with actual signed lattices, common unramified coefficient extension and Coleman image factors. BSTW presents only the ordinary proof and explicitly leaves the supersingular argument to the reader.
2. Taking characteristic ideals gives char(H/ΛZ)char(X_Gr)=(L_Gr)char(X_st) and char(H/ΛZ)char(X_•)=(L_•)char(X_st); all canceled terms are nonzero torsion ideals. Cancel in the regular Iwasawa domain, keeping integral image terms until shown to match.
3. This identity transports both directions of divisibility; the cyclotomic comparison repeats the argument after the exact specialization and (nv), rather than specializing a characteristic ideal without Tor/control corrections.

**Inputs.** [RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element](#rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element); [RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws](#rankzeroonebsd-bsd-6a-bstw-explicit-reciprocity-laws); `ArithmeticGaloisDuality:R02.4`; `SelmerIwasawaCohomology:L3`; `PadicHodgeRegulators:L4`.

**Acceptance.**

- Verify the product-ideal identity with signed local image corrections and no unproved equality of the main conjectures.
- Verify (nv) is retained after cyclotomic specialization.

**Sources.**

- [bstw](#source-bstw), §9.3.2, Proposition9.18 and proof, printed pp.83–84. The signed comparison is an owned proof obligation; the source does not print its full proof.

<a id="rankzeroonebsd-bsd-6a-higher-weight-integral-kolyvagin-bound"></a>

### Higher-weight integral Kolyvagin bound

`RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound` · theorem.

Extend the rank-two conjugate-self-dual ordinary Kolyvagin-system argument to the actual lattice T_g of an even-weight p-ordinary newform over K with residual representation irreducible over G_K and the corrected generalized Heegner local conditions. For the nonzero Λ-adic generalized Heegner class κ_g, the ordinary compact Selmer group S and dual X have Λ_O-rank one, and char(X_tors)⊇char(S/Λ_O κ_g)^2 integrally, including the augmentation prime, once C1=C2=0 is proved. CGS6.5.1’s elliptic rational theorem alone is not this extension.

**Hypotheses.**

- The actual T_g, critical self-dual twist, saturated ordinary filtration and cartesian local conditions satisfying the rank-one Kolyvagin-system hypotheses of ES.8; p split in K.
- Residual irreducibility over G_K, nonzero generalized Heegner class from GH.7 and the required local conditions corrected by Kobayashi–Ota.
- Prove C1=C2=0 from the specified irreducible image/cohomology inputs rather than adding it as an unexplained assumption.

**Proof route.**

1. Transport the CGS6.1.1/6.5.1 rank-two linear-algebra proof to T_g and prove every image, local and cartesian hypothesis.
2. C2: supply CGLS22 Remark3.3.5 irreducible-image argument. C1: verify Cha05 Theorem2 and the applicable Matar–Nekovář0.9 variant for T_g and its finite-level restriction kernel.
3. Handle the augmentation prime before passing from height-one bounds to the integral characteristic ideal. Connect the corrected generalized Heegner class with this ordinary Kolyvagin system.

**Inputs.** `EulerSystemsAndKolyvaginSystems:ES.8`; `GeneralizedHeegnerCycles:GH.7`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `SelmerIwasawaCohomology:L3`.

**Acceptance.**

- Give an actual T_g local-condition signature and separate proofs for C1 and C2.
- Retain the augmentation-prime estimate and no unresolved power of p.

**Sources.**

- [castella-erratum](#source-castella-erratum), Proof of Theorem2.3, printed pp.3–4, equation(2.2). The integral extension is asserted here and must be justified for T_g.
- [cgs-v2](#source-cgs-v2), §6 opening and Theorems6.1.1,6.5.1. The source restricts to an elliptic Tate module and states the characteristic bound over Λ[1/p]; it is background, not the desired higher-weight integral conclusion.

## BSD.7 — Good Eisenstein prime-part endpoints

The reducible ordinary representation requires its own proof. CGLS gives the earlier nonexceptional prototype; CGS supplies integral cyclotomic and anticyclotomic equalities for the permitted local kernel character. Keller–Yin supplies the good-prime exceptional-character and rational-torsion cases with a different lattice and control analysis. The rank-one twist defect relation has a minus sign, and torsion-square terms are preserved. Good reduction at the selected odd prime is essential; no bad-prime endpoint follows from these branches.

**Planets:** Anticyclotomic control with torsion ([declaration](#rankzeroonebsd-bsd-7-ky-torsion-control)); CGS Eisenstein prime-part BSD ([declaration](#rankzeroonebsd-bsd-7-cgs-eisenstein-prime-bsd)); Keller–Yin Eisenstein prime-part BSD ([declaration](#rankzeroonebsd-bsd-7-ky-eisenstein-prime-bsd)).

<a id="rankzeroonebsd-bsd-7-cgls-torsion-free-control"></a>

### CGLS rank-one anticyclotomic control

`RankZeroOneBSD:BSD.7/cgls-torsion-free-control` · theorem.

Assume E has good ordinary reduction at odd split p, rank E(K)=1, finite Ш(E/K)[p∞], and E(ℚ_p)[p]=0. If F_E generates char of the primitive anticyclotomic Greenberg dual and P∈E(K) is nontorsion, then #ℤ_p/F_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P)) / [E(K):ℤP]_p )²·∏_{w|N}c_w(E/K)_p. The full index equals free index times torsion order; local vanishing makes the torsion order a p-unit in this branch.

**Hypotheses.**

- K has Heegner/split/discriminant conditions.
- p>2, good ordinary, E(ℚ_p)[p]=0; rank E(K)=1; finite p-primary Sha; P nontorsion.

**Proof route.**

1. Specialize SIC’s anticyclotomic descent and its global-to-local image with the actual local conditions.
2. Apply CGLS Theorem 5.1.1’s weakening of JSW residual irreducibility to E(K)[p]=0, justified by K_v=ℚ_p.
3. Compute the local Kummer/logarithm cokernel and the full lattice index, retaining the ordinary factor (1−a_p+p)/p and all K-primes over N.

**Inputs.** `SelmerIwasawaCohomology:L3`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; [RankZeroOneBSD:BSD.5/heegner-index](#rankzeroonebsd-bsd-5-heegner-index); [RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion](#rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The control theorem is not applied unchanged to X₁(11) at p=5.

**Sources.**

- [cgls](#source-cgls), Theorem 5.1.1, p.571. The control formula uses the full index and depends on local torsion vanishing.

<a id="rankzeroonebsd-bsd-7-ky-torsion-control"></a>

### Keller–Yin control with rational torsion

`RankZeroOneBSD:BSD.7/ky-torsion-control` · theorem.

In KY Appendix B’s weight-two rank-one setting, drop residual irreducibility but retain the stated rank, local nonzero and finite BK-Sha hypotheses. Put δ_v=coker(H¹_f(K,T)→H¹_f(K_v,T)/tors). Then #Sel_ac(W)=#Ш_BK(W/K)·#δ_v², and #O/f_ac^Σ(0)=#Sel_ac(W)·C^Σ(W)/(#H⁰(K,W)·#H⁰(K,W)^∨), with C^Σ the exact product of both p-place H⁰ orders and the listed unramified/removed local H¹ factors. Keep the global localization image G, since surjectivity can fail. For an elliptic E and P nontorsion the primitive specialization is #ℤ_p/f_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P))/(I_free,p·#E(K)_tors,p) )²·∏_{w|N}c_w(E/K)_p.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- rank E(K)=1 and finite Ш(E/K)[p∞]; nonzero localization; source Appendix B’s weight-two local/dual hypotheses; correct translation of its S and Σ.

**Proof route.**

1. Use the integral local finite condition modulo torsion for δ_v; correct the printed codomain typo by the immediately following (B.1).
2. Follow B.0.1/B.0.2’s snake-lemma control using G=image(loc) and both finite global H⁰ denominators; compute coinvariants as well as invariants.
3. Remove the same finite local factors and substitute the full index I=I_free·#tors as in §4.2; local and global torsion cannot be dropped before cancellation.

**Inputs.** `SelmerIwasawaCohomology:L3`; `SelmerIwasawaCohomology:L2`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; [RankZeroOneBSD:BSD.5/heegner-index](#rankzeroonebsd-bsd-5-heegner-index); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); `SelmerIwasawaCohomology:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- If p divides E(K)_tors, its contribution is −2v_p(#tors) in the Sha/log control equation.

**Sources.**

- [ky](#source-ky), Appendix B Proposition B.0.1 and Theorem B.0.2, (B.1)–(B.2); §4.2, p.42. The localization-image diagram replaces the earlier assumed surjectivity and retains torsion corrections.

<a id="rankzeroonebsd-bsd-7-greenberg-vatsal-rank-zero-prototype"></a>

### Greenberg–Vatsal rank-zero prototype

`RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype` · theorem.

Let A/ℚ have good ordinary reduction at p>2 and an actual cyclic p-isogeny whose kernel character is ramified at p and even, or unramified at p and odd. If L(A,1)≠0 then v_p(L(A,1)/Ω_A)=v_p(#Ш(A/ℚ)·Tam(A)/#A(ℚ)_tors²). The torsion denominator remains in the source statement. The parity/ramification restrictions are retained; the CGS cyclotomic route supplies the wider rank-zero case.

**Hypotheses.**

- The exact parity/ramification hypothesis above; p odd good ordinary; nonzero actual central value.

**Proof route.**

1. Use the source Greenberg–Vatsal ordinary main-conjecture input and its integral period comparison, as requested from MIMC/ModularSymbols.
2. Apply exact rank-zero control and the finite-Sha conclusion of BSD.4 to the actual curve.
3. Identify the rational positive leading-term quotient with BSD.5’s defect, including the torsion square and full real period.

**Inputs.** `ModularIwasawaMainConjectures:L0`; `SelmerIwasawaCohomology:L3`; `ModularSymbolsPadicLFunctions:L2`; [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); `ModularSymbolsPadicLFunctions:L1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The trivial kernel character is unramified and even, so it fails this prototype.

**Sources.**

- [cgls](#source-cgls), Theorem 5.1.4, p.573. This is the routed prototype; it is not a universal good Eisenstein theorem.

<a id="rankzeroonebsd-bsd-7-cyclotomic-rank-zero-defect"></a>

### Rank-zero defect from integral cyclotomic equality

`RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect` · comparison.

For an actual E/ℚ with analyticRank E=0 and an odd good ordinary p, an integral cyclotomic main-conjecture equality in the Néron-period MSD normalization, together with exact cyclotomic control including global/local torsion and Euler factors, implies v_p(bsdDefect E)=0. The interpolation factor (1−α_p⁻¹)² is retained on both sides until control cancels it; full real period versus positive period contributes c∞, a p-unit for odd p.

**Hypotheses.**

- analyticRank E=0; p odd good ordinary; the stated integral main-conjecture equality and exact control are proved for this E.

**Proof route.**

1. Apply MSD interpolation at the trivial character, using actual L(E,1)≠0 and Néron positive period.
2. Apply the torsion-sensitive rank-zero control theorem with its H⁰ and local factor terms. Match the ordinary Euler factor and torsion-square denominator.
3. Use GZ.0’s full-period component formula and BSD.5’s actual defect identity.

**Inputs.** `SelmerIwasawaCohomology:L3`; `ModularIwasawaMainConjectures:L0`; `ModularSymbolsPadicLFunctions:L2`; `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`; [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); `ModularSymbolsPadicLFunctions:L1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A rational main conjecture alone leaves a possible coefficient-prime error.

**Sources.**

- [cgs](#source-cgs), §1.2 proof of Theorem D; §2.1 Proposition 2.1.1. The rank-zero argument of CGLS §5.1 is upgraded using the new integral cyclotomic equality.

<a id="rankzeroonebsd-bsd-7-rank-one-twist-defect-comparison"></a>

### Rank-one twist comparison with torsion

`RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison` · comparison.

If analyticRank E=1 and K is selected with L(E^K,1)≠0 and the odd-p Heegner/split conditions, then the anticyclotomic main-conjecture equality, exact control and actual Gross–Zagier/BDP formulas imply v_p(bsdDefect E)+v_p(bsdDefect E^K)=0. In height/index terms use I_free=[E(K)/tors:ℤP̄], I=I_free·#E(K)_tors and h_BSD(P)=I_free²Reg_BSD(E/K). Thus the rank-one defect equals the negative of the rank-zero twist defect; the printed CGLS (5.7) sign and full-index height identity are corrected.

**Hypotheses.**

- p odd good ordinary, rank E(K)=1, finite whole Sha from BSD.4, L(E^K,1)≠0; source main-conjecture and either the CGLS or KY control hypotheses verified.

**Proof route.**

1. Choose K by BSD.2 with split p and twist nonvanishing. Import actual base-change L factorization and Heegner nonvanishing, avoiding a root-number-only argument.
2. Apply the squared BDP logarithm reciprocity and the appropriate exact control, using the full/free index conversion from BSD.5.
3. Apply Gross–Zagier and the height, quadratic-regulator, period, Tamagawa, odd Sha and torsion decompositions. Add the two defect valuations to zero, retaining the minus sign on transfer to E^K.

**Inputs.** [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.0/base-change-central-identities](#rankzeroonebsd-bsd-0-base-change-central-identities); [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula); [RankZeroOneBSD:BSD.1/quadratic-regulator-comparison](#rankzeroonebsd-bsd-1-quadratic-regulator-comparison); [RankZeroOneBSD:BSD.1/odd-part-bsd-over-K](#rankzeroonebsd-bsd-1-odd-part-bsd-over-k); `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`; [RankZeroOneBSD:BSD.7/cgls-torsion-free-control](#rankzeroonebsd-bsd-7-cgls-torsion-free-control); [RankZeroOneBSD:BSD.7/ky-torsion-control](#rankzeroonebsd-bsd-7-ky-torsion-control).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A nonzero twist defect δ produces −δ on the rank-one side, not +δ.
- The regulator formula uses the free index; full index includes torsion.

**Sources.**

- [ky](#source-ky), §4.2 pp.42–43; corrected CGLS §5.3 (5.5)–(5.7). KY explicitly gives the negative twist-defect relation and the torsion terms.

<a id="rankzeroonebsd-bsd-7-cgls-rank-one-prototype"></a>

### CGLS rank-one Eisenstein BSD prototype

`RankZeroOneBSD:BSD.7/cgls-rank-one-prototype` · theorem.

For analytic rank one, p>2 good ordinary, an actual p-isogeny kernel character φ with φ|G_p≠1,ω and φ ramified at p and odd, or unramified at p and even, v_p(bsdDefect E)=0. This is the source Theorem F/5.3.1 branch. Its opposite parity/ramification condition ensures the rank-zero quadratic twist satisfies Greenberg–Vatsal.

**Hypotheses.**

- The exact rank-one local exclusion and parity/ramification conditions above.

**Proof route.**

1. Select K with L(E^K,1)≠0, using BSD.2.
2. Apply the CGLS prototype anticyclotomic equality, whose (Sel) is supplied by analytic rank one over K and whole-Sha finiteness.
3. Use rank-one-twist-defect-comparison and greenberg-vatsal-rank-zero-prototype for E^K with its changed parity.

**Inputs.** [RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture](#rankzeroonebsd-bsd-7a-cgls-prototype-main-conjecture); [RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison](#rankzeroonebsd-bsd-7-rank-one-twist-defect-comparison); [RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype](#rankzeroonebsd-bsd-7-greenberg-vatsal-rank-zero-prototype); [RankZeroOneBSD:BSD.2/heegner-field-selection](#rankzeroonebsd-bsd-2-heegner-field-selection); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The parity hypothesis is opposite to the GV rank-zero one.

**Sources.**

- [cgls](#source-cgls), Theorem 5.3.1, pp.576–577. The prototype keeps its parity restriction; CGS replaces the rank-zero input.

<a id="rankzeroonebsd-bsd-7-cgs-eisenstein-prime-bsd"></a>

### CGS good Eisenstein prime-part BSD

`RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` · theorem.

Let E/ℚ be elliptic, p>2 a prime of good reduction, and φ the actual rational p-isogeny kernel character with φ|G_p≠1,ω. If analyticRank E∈{0,1}, then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). The local exclusion proves the torsion denominator is a p-unit, but it remains in this general interface. There is no global semistability or CM hypothesis added.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- analyticRank E is zero or one.

**Proof route.**

1. Prove ordinarity and local p-torsion vanishing by eisenstein-ordinary-local-exclusion.
2. At rank zero combine cgs-cyclotomic-main-conjecture with cyclotomic-rank-zero-defect; this removes the older GV parity restriction.
3. At rank one choose K with a nonzero rank-zero twist; use cgs-anticyclotomic-main-conjecture, torsion-free control and rank-one-twist-defect-comparison. Apply the same rank-zero theorem to the twist.
4. Use BSD.5’s exact positive rational defect identity and whole-Sha finiteness to express the formula.

**Inputs.** [RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion](#rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion); [RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-cyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect](#rankzeroonebsd-bsd-7-cyclotomic-rank-zero-defect); [RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison](#rankzeroonebsd-bsd-7-rank-one-twist-defect-comparison); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A rational p-torsion point fails the CGS local character check.

**Sources.**

- [cgs](#source-cgs), Introduction Theorem D and §1.2 proof, pp.4–5. This is the exact CGS branch, with its actual local character hypothesis.

<a id="rankzeroonebsd-bsd-7-ky-eisenstein-prime-bsd"></a>

### Keller–Yin good Eisenstein prime-part BSD

`RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` · theorem.

Let E/ℚ be elliptic with analyticRank E∈{0,1}, and p>2 a prime of good reduction at which E has an actual cyclic p-isogeny. Then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). Rational p-torsion and local characters 1/ω are allowed. This is the verified KY v2 preprint Theorem C/4.2.1, not a deletion of hypotheses from CGS.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- analyticRank E is zero or one.

**Proof route.**

1. Use KY’s corrected residual lattice, local cohomology and μ/λ arguments to prove its anticyclotomic and cyclotomic equalities on the actual original curve.
2. At rank zero apply torsion-sensitive cyclotomic-rank-zero-defect. At rank one use ky-torsion-control and rank-one-twist-defect-comparison with the full free-index/torsion correction.
3. The rank-zero twist has the same good Eisenstein property and its defect valuation vanishes by the new rank-zero route; conclude the negative twist defect is zero.
4. Express the result using the actual BSD.5 defect, retaining torsion squared.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-ky-cyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality); [RankZeroOneBSD:BSD.7/ky-torsion-control](#rankzeroonebsd-bsd-7-ky-torsion-control); [RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect](#rankzeroonebsd-bsd-7-cyclotomic-rank-zero-defect); [RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison](#rankzeroonebsd-bsd-7-rank-one-twist-defect-comparison); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinPrimeParts`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The X₁(11) curve at p=5 uses this branch with a nonunit torsion denominator.

**Sources.**

- [ky](#source-ky), Theorem C, p.4; Theorem 4.2.1 and proof, pp.41–43. The elliptic endpoint applies to every odd good Eisenstein prime with analytic rank at most one.

## BSD.7a — Integral Eisenstein Iwasawa comparisons

Keep the proof route explicit: normalized local conditions and imprimitive Euler factors, residual character comparison and congruence, equality of invariants with an independent divisibility, uniform near-trivial Kolyvagin control, and augmentation-inclusive descent. The KY trivial and ω cases retain their local ranks, finite terms and lattice corrections. A distinguished integral Kato input and a constructed Beilinson–Flach class with separate Perrin–Riou and Greenberg reciprocity laws support integral cyclotomic descent. Imaginary-quadratic elliptic-unit main conjectures require their proposed owner and verified character specializations; they are not consequences of merely constructing Katz functions.

**Planets:** Uniform Kolyvagin bound ([declaration](#rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound)); Eisenstein anticyclotomic main conjecture ([declaration](#rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture)); Keller–Yin anticyclotomic main conjecture ([declaration](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality)); Eisenstein cyclotomic main conjecture ([declaration](#rankzeroonebsd-bsd-7a-cgs-cyclotomic-main-conjecture)); Keller–Yin cyclotomic main conjecture ([declaration](#rankzeroonebsd-bsd-7a-ky-cyclotomic-main-conjecture)).

<a id="rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion"></a>

### Ordinarity and local invariants at a good Eisenstein prime

`RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion` · lemma.

Good reduction and a G_ℚ-stable line in E[p] imply ordinary reduction at p. Under CGS’s local exclusion both residual characters differ from 1 on G_p, so E(ℚ_p)[p]=0 and hence E(ℚ)[p]=0; for split p, E(K)[p]=0. In the Keller–Yin branch ordinarity still holds but this vanishing is not asserted.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof route.**

1. Use the supersingular inertia description to exclude a residual one-dimensional G_p-subrepresentation; import the local representation classification.
2. Use φψ=ω. If either φ or ψ were trivial locally, φ would be 1 or ω. A local invariant vector would yield a trivial composition factor.
3. Restrict along K_v=ℚ_p to deduce E(K)[p]=0 only in the excluded-character case.

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `SelmerIwasawaCohomology:L2`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A rational p-torsion point has character 1 and fails the CGS exclusion even when reduction is good ordinary.

**Sources.**

- [cgs](#source-cgs), §1 Introduction and §3.4, before Lemma 3.4.1. The residual local exclusions justify precisely the no-invariants hypotheses used in CGS; KY removes them by a different lattice argument.

<a id="rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization"></a>

### Ordinary, Greenberg and unramified Eisenstein Selmer comparisons

`RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization` · comparison.

Specialize the imported Selmer structures to T_pE, its ordinary filtration and the cyclotomic/two-variable/anticyclotomic towers. Keep ordinary, ordinary-relaxed, ordinary-strict, and Greenberg (strict at v, unrestricted at v̄) distinct. For the KY unramified versus Greenberg comparison, restriction has the finite cyclic kernel of Lemma 1.3.6, so characteristic ideals agree after localization at height one; this does not identify integral Fitting ideals or finite control groups.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof route.**

1. Instantiate SIC’s kernels and inverse limits with arithmetic Frobenius and the inverse tautological action.
2. Identify the finite restriction kernel from KY Lemma 1.3.6 and take the Pontryagin dual with the involution.
3. Use the source’s exact local conditions, not a name-based identification of different Selmer modules.

**Inputs.** `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L3`; `SelmerIwasawaCohomology:L3/iwasawa-shapiro`; `PadicMeasuresIwasawaAlgebras:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The strict/unrestricted places must not be interchanged without the induced conjugation/involution.
- A finite Λ-module can have unit characteristic ideal and nonunit Fitting ideal.

**Sources.**

- [ky](#source-ky), §1.3 Lemmas 1.3.3–1.3.6; §3.0.8; §4.2. Finite differences disappear from characteristic ideals only at height one and still enter control.

<a id="rankzeroonebsd-bsd-7a-finite-euler-factor-comparison"></a>

### Primitive and imprimitive Euler factors

`RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison` · comparison.

Let Σ contain the bad primes, v,v̄,∞ and have all finite places split in K. Put S=Σ∖{v,v̄,∞}. For each w∈S define P_w(V,X)=det(1−Frob_w X|V_{I_w}) on inertia coinvariants. For the anticyclotomic branch evaluate it at ℓ⁻¹γ_w, and for CGS’s cyclotomic branch at ℓ⁻¹γ_w⁺, where ℓ is the prime below w and γ is the image of arithmetic Frobenius. The inverse tautological action on the induced coefficient module is separate. Under the stated cotorsion and surjectivity conditions, char X^S=char X·∏_{w∈S}(P_w), and analytic removal multiplies by the same finite factors. Thus μ and λ corrections are those of exactly S before cancellation. This node supplies the locally excluded CGS/CGLS branch.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- The actual Selmer dual under comparison is torsion. For CGS’s cyclotomic comparison E(K)[p]=0 and global-to-local surjectivity are verified as in Proposition 3.3.2; the local exclusion above supplies E(K)[p]=0.

**Proof route.**

1. Apply SIC’s primitive/imprimitive exact sequence under the verified invariants and surjectivity conditions.
2. Identify the local quotient characteristic polynomial with CGS Proposition 3.3.2 for the cyclotomic branch, and CGLS §1.5/Theorem 1.5.1 for the anticyclotomic branch; add its μ,λ only after proving torsion.
3. Match CGS Definition 2.5.2 and CGLS §1.5, using inertia coinvariants and ℓ⁻¹γ_w; cancel the same nonzero finite Euler product in the domain.

**Inputs.** [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); `ModularIwasawaMainConjectures:L0`; `AutomorphicPadicLFunctions:L0`; `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- No infinite sum over all w∤p or archimedean Euler factor enters the λ formula.

**Sources.**

- [cgls](#source-cgls), Published §1.5, pp.537–538; Theorem 1.5.1. Only the finite S-indexed sum is used; the extraction’s E18 correction is retained.
- [cgs](#source-cgs), Definition 2.5.2, p.11; Proposition 3.3.2 and Corollary 3.3.3, pp.14–15. The cyclotomic Euler comparison has actual cotorsion and residual-invariant hypotheses; Definition 2.5.2 fixes the coinvariant/Frobenius convention.

<a id="rankzeroonebsd-bsd-7a-cgls-residual-character-comparison"></a>

### CGLS residual extension and algebraic Iwasawa invariants

`RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison` · theorem.

Under CGS conditions the strict-at-v, unrestricted-at-v̄ anticyclotomic dual X_E is torsion, μ(X_E)=0 and λ(X_E)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). The proof uses the actual residual extension E[p], residual Selmer comparison, and no finite Λ-submodules; it does not replace E[p] by its semisimplification as a representation.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Use the long exact cohomology sequence of 0→𝔽_p(φ)→E[p]→𝔽_p(ψ)→0 and the source local surjectivity/invariant vanishings to obtain the residual Selmer exact sequence (CGLS Proposition 1.4.1).
2. Use the elliptic-unit main-conjecture input for character modules and their μ=0. Identify residual dimension with λ using Proposition 1.4.2 and Corollary 1.4.3, whose no-finite-submodule proof is an input to this identification.
3. Remove imprimitive factors using finite-euler-factor-comparison, retaining only S.

**Inputs.** [RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion](#rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion); [RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-finite-euler-factor-comparison); `SelmerIwasawaCohomology:L2`; `AutomorphicPadicLFunctions:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Splitting the residual representation without checking the connecting map is rejected.

**Sources.**

- [cgls](#source-cgls), §1.4 Propositions 1.4.1–1.4.2, Corollary 1.4.3; Theorem 1.5.1, p.538. The theorem asserts cotorsion, μ=0 and the finite corrected λ formula.

<a id="rankzeroonebsd-bsd-7a-kriz-eisenstein-congruence"></a>

### Kriz congruence and analytic Iwasawa invariants

`RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence` · theorem.

For the ordinary weight-two newform f_E with reducible residual representation, compare its p-depleted q-expansion at CM points with the Eisenstein series attached to the residual characters. With the source’s integral periods and Euler factors, its anticyclotomic BDP function has μ=0 and λ(L_E)=λ(L_φ)+λ(L_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). In KY’s local 1/ω case the analytic ordering of characters is relabelled so the first is unramified at p; it need not equal the ordering of the nonsplit lattice.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Label the analytic characters with p∤cond(φ), as required by KY Theorem 2.2.2. This analytic ordering need not equal the chosen residual-lattice ordering.

**Proof route.**

1. Apply CGLS Theorem 2.2.1/Kriz’s congruence to the p-depleted forms, including integral CM evaluation and the unit periods; KY Theorem 2.2.1 proves that p-depletion kills the otherwise unmatched constant term.
2. Factor the Eisenstein CM values into the two Katz character functions and the finite S Euler products of KY §2.2/CGLS §2.2, with P_w evaluated at ℓ⁻¹γ_w. This analytic calculation uses the interpolation/Euler-factor dictionary, not the narrower algebraic CGS surjectivity theorem.
3. Use the proposed elliptic-unit/Katz μ theorem under its exact hypotheses, then apply CGLS Theorem 2.2.2 or KY Theorem 2.2.2.

**Inputs.** `AutomorphicCongruences:L0`; `PadicFamilies:L0`; `AutomorphicPadicLFunctions:L3`; `AutomorphicPadicLFunctions:L0`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A change of lattice ordering cannot silently change the analytic character convention.

**Sources.**

- [ky](#source-ky), §2.2 Theorems 2.2.1–2.2.2; compare CGLS §2.2. The congruence is for actual forms and CM values, including the broader character case.

<a id="rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants"></a>

### CGLS equality of anticyclotomic Iwasawa invariants

`RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants` · theorem.

Under CGS conditions μ(X_E)=μ(L_E)=0 and λ(X_E)=λ(L_E), with the same primitive anticyclotomic Greenberg module and squared BDP normalization. This is an independent residual/congruence computation; it gives equality of characteristic ideals only when combined with a proved one-sided divisibility.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Use cgls-residual-character-comparison and kriz-eisenstein-congruence.
2. Import equality of the character-module and Katz-function characteristic ideals from the elliptic-unit supplier, including its exceptional character conventions.
3. Cancel precisely the matching finite Euler correction terms.

**Inputs.** [RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison](#rankzeroonebsd-bsd-7a-cgls-residual-character-comparison); [RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence](#rankzeroonebsd-bsd-7a-kriz-eisenstein-congruence).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Equal μ and λ alone do not imply equal distinguished polynomials.

**Sources.**

- [cgls](#source-cgls), Theorem 2.2.3, p.545. This invariant equality is independent of the Heegner-system divisibility.

<a id="rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound"></a>

### Uniform near-trivial Kolyvagin bound

`RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound` · theorem.

Under CGS’s ordinary Heegner setup and E(K)[p]=0, let R be the integers of a finite extension Φ/ℚ_p and α an anticyclotomic character with α≡1 modulo ϖ^m. There are constants M₀,C≥0 depending only on T_pE and rank_ℤp R, independent of m and α in this neighborhood, such that for m≥M₀ and an actual κ∈KS(T_pE⊗R(α),F_ord,L_E) with κ₁≠0: the compact Selmer group has R-rank one, H¹_F(K,A)≅Φ/R⊕M⊕M for a finite M, and length_R M≤length_R(H¹_F(K,T)/Rκ₁)+C.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- E(K)[p]=0; the propagated ordinary self-dual local conditions and CGS’s admissible Kolyvagin primes/ideals are used.

**Proof route.**

1. Specialize the generic error-tolerant descent of ES.4 to CGS §6.2’s two-copy structure, keeping finite error constants.
2. Use the residual truncated comparison at level m and complex conjugation. CGS §6.3 chooses primes controlling two eigenspaces with the fixed restriction error C₁+C₂.
3. Follow §6.4’s two-step decrease of the largest elementary divisors; this is the new bounded-error argument, not the earlier bound whose error grows with m.
4. Pass to the finite and divisible parts with the same uniform C.

**Inputs.** `EulerSystemsAndKolyvaginSystems:ES.4`; `EulerSystemsAndKolyvaginSystems:ES.8`; [RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion](#rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion); `SelmerIwasawaCohomology:L2`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The constants remain fixed as m grows; replacing them with C(α)≥m fails the augmentation argument.

**Sources.**

- [cgs](#source-cgs), Theorem 6.1.1 and §§6.2–6.4, pp.21–28. Uniformity is the reason specialization can approach augmentation.

<a id="rankzeroonebsd-bsd-7a-augmentation-inclusive-heegner-divisibility"></a>

### Heegner divisibility including augmentation

`RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility` · theorem.

For the actual early HE.8 Λ-adic Heegner Kolyvagin system κ^Hg with κ₁≠0, under CGS conditions S_ord(K∞⁻) has Λ-rank one and X_ord(K∞⁻) is pseudo-isomorphic to Λ⊕M⊕M, with M torsion and char_Λ(M) dividing char_Λ(S_ord/Λκ₁) in Λ[1/p]. The height-one prime (γ−1) is included; the prime (p) is still not included by this assertion.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Import the actual Heegner classes, local conditions and nonzero bottom class from early HE.8, not an anticyclotomic equality.
2. Apply the existing weak torsion-localized bound away from augmentation.
3. Apply uniform-near-trivial-kolyvagin-bound along characters approaching 1 to bound the augmentation length and remove its inversion (CGS Theorems 6.5.1–6.5.2).

**Inputs.** [RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound](#rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound); `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`; `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`; `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`; `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- No inference about the p-height-one length is made from a rational divisibility.

**Sources.**

- [cgs](#source-cgs), Theorems 6.5.1–6.5.2, p.28. The new argument includes augmentation but the theorem still states Λ[1/p].

<a id="rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison"></a>

### Heegner index and BDP ideal comparison

`RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison` · comparison.

Under ordinary Heegner conditions, nonzero actual Heegner class and the source H⁰/rank hypotheses, Poitou–Tate and the integral p-adic logarithm reciprocity identify the two directions of the Heegner index-square characteristic divisibility with the corresponding directions for the Greenberg dual and the squared BDP function. KY’s transfer from the geometric lattice to its chosen lattice contributes the fixed p^{t+N} factors of Theorem 3.0.8; they are retained until μ/λ comparison removes them.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Use either CGS no-invariants data or the chosen KY residual-invariant-free lattice, and the actual rank-one compact Selmer group.

**Proof route.**

1. Use SIC’s strict/relaxed Poitou–Tate sequence and GZ.9’s actual Heegner logarithm formula with its Euler factor and isogeny/differential compatibility.
2. Within a fixed coefficient lattice identify κ∞ and κ₁ as generators of the same Λ-submodule as in CGLS Remark 4.1.3. Separately compare the geometric and chosen KY lattices through their actual maps: the fixed p^{t+N} contribution is not a unit change of generator of an integral Λ-line.
3. Take characteristic ideals in the correct unramified coefficient extension, track involution and the square, and record both implication directions separately.

**Inputs.** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`; `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`; `SelmerIwasawaCohomology:L2`; `ModularIwasawaMainConjectures:L0`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A square-root BDP measure is not substituted for the squared L_E in the Greenberg equality.

**Sources.**

- [ky](#source-ky), Theorem 3.0.8 proof, pp.39–40; CGLS Proposition 4.2.1. Comparison cannot silently normalize away the p-power from changing lattices.

<a id="rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture"></a>

### CGS anticyclotomic Greenberg main conjecture

`RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture` · theorem.

Under CGS conditions X_Gr(E/K∞⁻) is Λ-torsion and char_Λ X_Gr extended to Λ^ur equals the principal ideal of L_p^BDP(f_E/K) in the source’s squared normalization. The conclusion has no (Sel) corank-one assumption and is integral, including augmentation and the p-height-one prime.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Translate augmentation-inclusive-heegner-divisibility to a one-sided Greenberg/BDP divisibility via heegner-reciprocity-ideal-comparison.
2. Use cgls-equal-iwasawa-invariants: μ=0 removes the remaining p-power ambiguity, and equality of λ makes the integral quotient a unit.
3. Conclude both ideal containments; this removes the earlier CGLS (Sel) restriction by the uniform bound.

**Inputs.** [RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility](#rankzeroonebsd-bsd-7a-augmentation-inclusive-heegner-divisibility); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison); [RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The CGLS prototype alone cannot supply this unconditional-in-(Sel) equality.

**Sources.**

- [cgs](#source-cgs), Theorem 6.5.3, p.29; compare CGLS Theorem 4.2.2. The improved proof removes (Sel), not the residual local exclusion.

<a id="rankzeroonebsd-bsd-7a-cgs-heegner-index-square-equality"></a>

### CGS Heegner index-square equality

`RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality` · theorem.

Under CGS conditions the compact and dual ordinary anticyclotomic Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 integrally. The class is the actual geometric early HE.8 class, with its source lattice; κ∞ is not defined by this equality.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Apply cgs-anticyclotomic-main-conjecture and both directions of heegner-reciprocity-ideal-comparison.
2. Use μ=0 to remove the p-power ambiguity from the older index-square corollary.

**Inputs.** [RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Its exact characteristic equality includes the p-height-one prime.

**Sources.**

- [cgs](#source-cgs), Corollary 6.5.4, p.29. This is an output of BSD.7a for HE.8b and MIMC L6, never an input from them.

<a id="rankzeroonebsd-bsd-7a-ky-local-character-corrections"></a>

### Keller–Yin local character cohomology

`RankZeroOneBSD:BSD.7a/ky-local-character-corrections` · theorem.

For KY’s induced discrete character module M_θ over the anticyclotomic Λ=O⟦Γ⟧, the local unramified restriction kernel at a p-place w is O-cofree of rank one when θ|G_w=1. Its dual has Λ-rank zero, rather than being Λ-free of rank one. For θ|G_w=ω the restriction kernel is zero; H¹(K_w,M_θ)^∨ has Λ-rank one, projective dimension at most one, two generators and no nonzero finite Λ-submodule. It is not Λ-free. For the global character Selmer dual X_θ, finite Λ-submodules may occur when θ|G_K=ω; this does not contradict the local assertion. Residual-to-p-torsion comparison uses the source’s actual diagrams.

**Hypotheses.**

- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- θ is one of the finite-order residual character lifts used in KY §1.1; the full induced module and inverse tautological action are used.

**Proof route.**

1. Apply local inflation–restriction and duality with the decomposed p-place; compute invariants case by case (KY Proposition 1.1.3).
2. Use the finite cyclic restriction kernel calculation and the residual diagrams of §1.2 instead of the earlier no-invariants/free-local-module shortcut.
3. Carry these kernels to the global-to-local comparison and retain the finite-submodule errors.

**Inputs.** `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L3`; `ArithmeticGaloisDuality:R02.4`; `PadicMeasuresIwasawaAlgebras:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Rank one plus projective dimension at most one is insufficient to replace a two-generator module by Λ.

**Sources.**

- [ky](#source-ky), Proposition 1.1.3; Lemma 1.2.4 and Theorem 1.2.5. These are the separate trivial and cyclotomic local cases absent from the CGS branch.

<a id="rankzeroonebsd-bsd-7a-ky-ribet-lattice"></a>

### Keller–Yin nonsplit residual lattice

`RankZeroOneBSD:BSD.7a/ky-ribet-lattice` · theorem.

For KY’s ordinary Eisenstein weight-two representation V, choose a stable lattice T with nonsplit residual extension 0→𝔽_p(φ)→T/pT→𝔽_p(ψ)→0 and H⁰(K,T/pT)=0. In the local 1/ω case orient it with φ|G_p=ω and ψ|G_p=1, while φ|G_K may equal ω. The chosen lattice need not be T_p of the original E. For an elliptic curve realize it by an isogenous curve and retain the source’s p-power index between lattices.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Use Ribet’s lattice lemma for the irreducible characteristic-zero representation; do not require E[p] irreducible.

**Proof route.**

1. Apply KY Proposition 1.3.1 (Ribet lattice) with the ordinary local orientation.
2. Verify that the nonsplit extension has no invariant vector even when its quotient is trivial.
3. Use elliptic Tate-module/isogeny correspondence to relate the chosen lattice to the original curve; preserve the finite p-power quotient and induced Selmer maps.

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `ArithmeticGaloisRepresentations:R01.1`; [RankZeroOneBSD:BSD.7a/ky-local-character-corrections](#rankzeroonebsd-bsd-7a-ky-local-character-corrections).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A curve with rational p-torsion can use the theorem after lattice/isogeny comparison; it cannot be declared residual-invariant-free itself.

**Sources.**

- [ky](#source-ky), Proposition 1.3.1; beginning of §1.4; Remark 3.0.9. Vanishing is obtained on a chosen nonsplit lattice, not assumed for every isogenous curve.

<a id="rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture"></a>

### Keller–Yin trivial-character augmentation correction

`RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture` · comparison.

For the character Iwasawa modules in KY, μ(X_θ)=0. For θ|G_K≠1, char X_θ=(L_θ); in the trivial character case char X_1=(T·L_1), where T=γ−1. Consequently λ(X_1)=λ(L_1)+1. No p∤h_K, nonanomalous-prime, or p>3 hypothesis is added: the requisite Rubin/de Shalit specialization must provide precisely this version.

**Hypotheses.**

- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Use the full character modules and period-normalized Katz functions of KY Theorem 1.2.2.

**Proof route.**

1. Import Rubin’s elliptic-unit comparison and Hida’s μ theorem from the proposed elliptic-unit owner.
2. Retain the trivial-isotypic global unit/augmentation term in de Shalit III.1.10/Yager’s specialization, rather than applying the nontrivial character formula unchanged.
3. Read μ and λ from the factor T and the nonzero character function.

**Inputs.** `AutomorphicPadicLFunctions:L3`; `ModularIwasawaMainConjectures:L0`; `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The λ correction is one, whereas multiplication by T does not change μ.

**Sources.**

- [ky](#source-ky), Theorem 1.2.2; proof of Theorem 2.2.3 and Remark 2.2.4. The extra augmentation accounts for the global trivial-character λ correction.

<a id="rankzeroonebsd-bsd-7a-ky-imprimitive-residual-comparison"></a>

### Keller–Yin imprimitive residual Selmer comparison

`RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison` · theorem.

For the chosen invariant-free nonsplit weight-two lattice with residual subcharacter φ|G_p=ω and quotient ψ|G_p=1, let X_f^S, X_φ^S and X_ψ^S be the actual S-imprimitive unramified Selmer duals over Λ=O⟦Γ⟧. Both X_f^S and X_f are torsion with μ=0. If φ|G_K≠ω, λ(X_f^S)=λ(X_φ^S)+λ(X_ψ^S). If φ|G_K=ω (hence ψ|G_K=1), λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). This is an imprimitive comparison; removing S is a separate theorem.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The lattice is the actual nonsplit lattice of ky-ribet-lattice, with H⁰(K,M_f)=0. Σ contains v,v̄,∞ and every ramified place; its finite places split in K, and S=Σ∖{v,v̄,∞}. Character Selmer groups use KY’s same unramified normalization.

**Proof route.**

1. Use the residual sequence 0→M_φ[p]→M_f[p]→M_ψ[p]→0 and the Greenberg/unramified restriction diagrams of KY §1.4. Character residual Selmer finiteness, together with the finite restriction kernel, implies X_f^S and X_f are Λ-torsion with μ=0.
2. Apply the five-term Perrin–Riou comparison with the actual finite kernels and coinvariants, as in Theorem 1.4.1 and its Lemmas 1.4.3–1.4.4. Distinguish globally trivial ψ: the one-dimensional correction remains even though finite modules have unit characteristic ideal.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); [RankZeroOneBSD:BSD.7a/ky-local-character-corrections](#rankzeroonebsd-bsd-7a-ky-local-character-corrections); [RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture](#rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The globally trivial quotient contributes +1 on the left; no λ=dim(X/p) shortcut suppresses finite-submodule terms.

**Sources.**

- [ky](#source-ky), §1.4, Theorem 1.4.1 and its proof, pp.23–31; Lemmas 1.4.3–1.4.4. Separates the imprimitive residual-extension theorem from primitive Euler removal and retains the globally trivial +1.

<a id="rankzeroonebsd-bsd-7a-ky-finite-euler-factor-comparison"></a>

### Keller–Yin finite Euler comparison

`RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison` · comparison.

On KY’s chosen invariant-free lattice, and on its two character modules, the primitive and S-imprimitive unramified Selmer duals fit into 0→⊕_{w∈S}H¹(K_w,M_?)^∨→X_?^S→X_?→0. For ?=f,φ,ψ, define P_w(?)=det(1−Frob_w X|V_{?,I_w}) evaluated at X=ℓ⁻¹γ_w, where ℓ is the rational prime below w and γ_w is arithmetic Frobenius in Γ. Thus char(X_?^S)=char(X_?)·∏_{w∈S}(P_w(?)) and λ(X_?^S)=λ(X_?)+Σ_{w∈S}λ(P_w(?)). Inertia coinvariants and this Frobenius evaluation are fixed; the inverse tautological action on the induced coefficient module is a separate convention.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Use the chosen invariant-free lattice with φ|G_p=ω and ψ|G_p=1. Σ and finite S are as in ky-imprimitive-residual-comparison. Every module uses KY’s unramified local condition, and each global-to-local map is proved surjective; cotorsion is supplied by the imprimitive residual and character theorems.

**Proof route.**

1. For characters use KY Theorem 1.2.2 and Remark 1.2.3(ii) to prove surjectivity, retaining the corrected anticyclotomic/cyclotomic disjointness argument. For f use Remark 1.4.2: cotorsion from Theorem 1.4.1, Cartier-dual finite invariants, and the local coranks of Lemmas 1.3.5–1.3.6.
2. Dualize the primitive/imprimitive exact sequence. Compute local characteristic ideals using KY Lemma 1.1.1 and §1.5; KY Theorem 1.5.1 explicitly invokes the CGLS Theorem 1.5.1 proof after supplying these broader surjectivity hypotheses. Multiply only the finite S factors and then take μ,λ.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison](#rankzeroonebsd-bsd-7a-ky-imprimitive-residual-comparison); [RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture](#rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); `ArithmeticGaloisRepresentations:R01.1`; `SelmerIwasawaCohomology:L3`; `AutomorphicPadicLFunctions:L0`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Neither E(K)[p]=0 on the original geometric Tate module nor the CGS local character exclusion is inserted into this broader chosen-lattice branch.
- Do not infer finite-level control from height-one Euler-factor equality.

**Sources.**

- [ky](#source-ky), Lemma 1.1.1; Remark 1.2.3(ii), pp.14–15; Remark 1.4.2, p.25; §1.5 and Theorem 1.5.1, p.31. The broader primitive comparison is justified by KY’s own cotorsion and global-to-local surjectivity, rather than by importing the locally excluded CGS branch.

<a id="rankzeroonebsd-bsd-7a-ky-residual-extension-lambda"></a>

### Keller–Yin residual extension and corrected lambda formula

`RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda` · theorem.

For KY’s chosen nonsplit lattice with φ|G_p=ω, the primitive X_f is torsion with μ=0. If φ|G_K≠ω, λ(X_f)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(f))). If φ|G_K=ω (so ψ|G_K=1), the left side is λ(X_f)+1. The same +1 occurs in the imprimitive relation λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). S is finite and excludes v,v̄,∞.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The chosen lattice is as in ky-ribet-lattice; the generic non-1/ω case is supplied by the CGLS comparison.

**Proof route.**

1. Import the separate KY imprimitive residual comparison, including cotorsion, μ=0 and its globally trivial +1.
2. Apply the KY finite Euler comparison to f,φ,ψ under its chosen-lattice surjectivity hypotheses. Subtract the same finite S Euler λ terms.
3. Keep the +1 when φ|G_K=ω; it is cancelled only after importing the corresponding character main-conjecture correction in the subsequent algebraic/analytic comparison.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison](#rankzeroonebsd-bsd-7a-ky-imprimitive-residual-comparison); [RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-ky-finite-euler-factor-comparison).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- When ψ is globally trivial the uncorrected sum of λ invariants is off by one.

**Sources.**

- [ky](#source-ky), Theorems 1.4.1 and 1.5.1; Appendix A finite terms. The +1 is not suppressed by the fact that finite modules have unit characteristic ideal.

<a id="rankzeroonebsd-bsd-7a-ky-equal-iwasawa-invariants"></a>

### Keller–Yin equality of analytic and algebraic invariants

`RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants` · theorem.

For every good ordinary weight-two Eisenstein form in KY’s setting, μ(X_f)=μ(L_f)=0 and λ(X_f)=λ(L_f). In the globally trivial-character case the algebraic +1 in ky-residual-extension-lambda cancels the character main conjecture’s λ(X_1)=λ(L_1)+1. The result is not obtained by imposing the CGS local exclusion.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof route.**

1. Split the local cases. When both characters at G_p differ from 1 and ω, import cgls-equal-iwasawa-invariants. In the local 1/ω case use ky-residual-extension-lambda on the chosen lattice and kriz-eisenstein-congruence with its analytic relabelling.
2. Use ky-trivial-character-main-conjecture for the globally trivial constituent and the nontrivial character formulas for the others.
3. Cancel the same finite S factors and the explicit augmentation correction.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda](#rankzeroonebsd-bsd-7a-ky-residual-extension-lambda); [RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture](#rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture); [RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence](#rankzeroonebsd-bsd-7a-kriz-eisenstein-congruence); [RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The correction survives even though finite global torsion does not change a characteristic ideal.

**Sources.**

- [ky](#source-ky), Theorem 2.2.3 and Remark 2.2.4. The equality uses the exceptional character formula, not only the CGLS argument.

<a id="rankzeroonebsd-bsd-7a-ky-integral-kolyvagin-bound"></a>

### Keller–Yin integral Kolyvagin divisibility and lattice transfer

`RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound` · theorem.

On KY’s residual-invariant-free lattice, for a nonzero actual Heegner Kolyvagin system the ordinary compact and dual Selmer groups have Λ-rank one, X is pseudo-isomorphic to Λ⊕M⊕M and char(M) divides char(S/Λκ₁) at every height-one prime, including (ϖ). The canonical geometric system transfers as κ_n^Hg=p^t κ_n, and comparison with its limiting class retains the fixed additional p^N. These exponents are independent of the approaching character but cannot be set to zero without proof.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The chosen lattice has H⁰(K,T/pT)=0 and the actual transferred Heegner system has nonzero initial class.

**Proof route.**

1. Apply the nontrivial-character bound KY Theorem 3.0.1 and uniform near-trivial bound Theorem 3.0.2; Lemma 3.0.3 bounds the scalar-image constant.
2. Use KY Theorem 3.0.5 to include the coefficient height-one prime via specialization over ramified extensions; keep the dual two-copy structure.
3. Apply Theorem 3.0.6 to the actual geometric lattice, keeping t+N in the resulting characteristic divisibility.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); [RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound](#rankzeroonebsd-bsd-7a-ky-uniform-near-trivial-bound); `EulerSystemsAndKolyvaginSystems:ES.4`; `EulerSystemsAndKolyvaginSystems:ES.8`; `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The older HE weak divisibility after inverting p is not a substitute for this integral assertion.

**Sources.**

- [ky](#source-ky), Theorems 3.0.1–3.0.2, Lemma 3.0.3, Theorems 3.0.5–3.0.6. This includes the integral height-one length and compares the actual lattices.

<a id="rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality"></a>

### Keller–Yin anticyclotomic Greenberg main conjecture

`RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality` · theorem.

For KY’s weight-two good Eisenstein setup, the unramified Selmer dual X_f (and height-one-equivalent Greenberg dual) is Λ-torsion and char_Λ(X_f)Λ^nr=(L_f). First prove this on the chosen invariant-free lattice, then transfer to the original elliptic curve as in Remark 3.0.9. Local rational p-torsion is allowed. The equality is integral, and no unproved general finite-submodule vanishing is asserted.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof route.**

1. Translate ky-integral-kolyvagin-bound through heegner-reciprocity-ideal-comparison, yielding the source’s divisibility with p^{t+N}.
2. Use independently proved μ=0 and λ equality from ky-equal-iwasawa-invariants; the fixed p-power changes μ but not the distinguished factor, so the actual characteristic ideals coincide.
3. Use the lattice/isogeny characteristic comparison and the finite Greenberg/unramified restriction difference to return to the original curve.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound](#rankzeroonebsd-bsd-7a-ky-integral-kolyvagin-bound); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison); [RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-ky-equal-iwasawa-invariants); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A rational p-torsion original curve is accepted only with the proved transfer maps.

**Sources.**

- [ky](#source-ky), Theorem 3.0.8 (IMC2) and Remark 3.0.9, pp.39–40. The result is the integral BDP/Greenberg equality in completed unramified coefficients.

<a id="rankzeroonebsd-bsd-7a-ky-heegner-index-square-equality"></a>

### Keller–Yin Heegner index-square equality

`RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality` · theorem.

In the same KY setup the compact and dual ordinary Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 in the coefficient ring labelled Λ^ac in §3.0.8, with κ∞ the transferred actual Heegner class. Theorem B in the Introduction instead states Λ; record this internal ring discrepancy and require an integral two-way class/lattice comparison before exporting the stronger integral statement. The weaker rationalized index-square equality is retained; the integral Greenberg IMC2 is a separate output.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof route.**

1. Use ky-anticyclotomic-greenberg-equality and the reverse implication of heegner-reciprocity-ideal-comparison.
2. Return through the explicit lattice maps in the coefficient ring of the proved two-way comparison. Resolve the Theorem B/§3.0.8 ring discrepancy through the stated integral comparison gap.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The characteristic equality refers to the actual κ∞ line and retains the coefficient ring of the verified comparison.

**Sources.**

- [ky](#source-ky), Introduction Theorem B, p.5; Theorem 3.0.8 (IMC1), p.40. This is a BSD.7a output for the downstream HE.8b application.

<a id="rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input"></a>

### Distinguished Wüthrich lattice and integral Kato input adapter

`RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input` · comparison.

For an elliptic curve E/ℚ and an odd good ordinary Eisenstein p, use Wüthrich’s distinguished E_• in its isogeny class: T_f=T_pE_• and the lattice of all modular symbols agrees with its Néron lattice after tensoring with ℤ_p. The cyclic X₁(N)-optimal quotient isogeny is étale. Kato’s z₀ is integral in H¹_Iw(T_pE_•) even in the nonfree maximal-ideal case, L_p^MSD(E) is integral, and char X_ord(E/ℚ∞) divides (L_p^MSD(E)) as integral ideals. The supplier is the requested Wüthrich addition to Kato L4, with Ferrero–Washington; Kato’s existing rational node is insufficient.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof route.**

1. Import Wüthrich Theorem 4 and Proposition 8 for E_• and the actual lattice, valid at odd primes where reduction at that prime is semistable (not a global semistability hypothesis).
2. Import Theorem 13’s integral z₀ including the rational-torsion/nonfree case, and Theorem 16’s integral divisibility with Lemma 17’s isogeny comparison.
3. Apply Corollary 18 at good ordinary p. Record the split-multiplicative augmentation factor separately; it supplies no bad-prime BSD claim here.

**Inputs.** `KatoEulerSystems:L4`; `IntegralIwasawaTheory:L4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The assumptions concern reduction at p. Additive reduction elsewhere does not disqualify the input.
- For split multiplicative p the extra augmentation I is retained, without inferring a BSD formula.

**Sources.**

- [wuthrich](#source-wuthrich), Theorems 4,13,16; Proposition 8; Lemma 17; Corollary 18. The required containment is integral at the coefficient prime, including reducible representations.

<a id="rankzeroonebsd-bsd-7a-integral-two-variable-functions"></a>

### Integral Rankin functions and specialization normalization

`RankZeroOneBSD:BSD.7a/integral-two-variable-functions` · comparison.

Compare CGS’s actual two-variable Perrin–Riou Rankin function L_PR and Greenberg function L_Gr to the imported p-adic functions. Normalize L_PR with (deg π/c_π²)H_p(f), H_p(f)=(1−p/α_p²)(1−1/α_p²), and L_Gr with h_K times the anticyclotomic Katz factor. Cyclotomic projection of L_PR has ideal equal to the product of the Néron-period MSD functions of E and E^K; anticyclotomic projection of L_Gr has ideal equal to the squared BDP function. The CM-family congruence ideal and h_K factor must be supplied integrally, with Hida–Tilouine/Rubin input, rather than assumed units.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- α_p is the ordinary unit root; the modular parametrization and Néron differential are fixed.

**Proof route.**

1. Import the actual Rankin interpolation from ModularSymbols/AutomorphicPadicLFunctions and the CM Hida family/congruence module from PadicFamilies.
2. Apply CGS Definitions 2.2.2 and 2.4.3 and Lemma 2.4.4, retaining deg π, the Manin constant, h_K and the Katz congruence factor.
3. Verify Propositions 2.2.4 and 2.4.5 with the same integral periods and squared BDP convention.

**Inputs.** `AutomorphicPadicLFunctions:L3`; `PadicFamilies:L0`; `PadicFamilies:L1`; `AutomorphicCongruences:L0`; `ModularSymbolsPadicLFunctions:L2`; [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`; `ModularSymbolsPadicLFunctions:L1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- No condition p∤h_K is inserted to bypass the integral congruence argument.

**Sources.**

- [cgs](#source-cgs), §§2.2–2.4, Definitions 2.2.2/2.4.3, Lemma 2.4.4, Propositions 2.2.4/2.4.5. The Katz/CM congruence input removes a genuine integral denominator, not just a rational scalar.

<a id="rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity"></a>

### Beilinson–Flach class and two integral reciprocity laws

`RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity` · construction.

Construct the actual CGS class BF_α in H¹_ord,rel(K,T_f(α) completed-tensor Λ_K) from the KLZ Beilinson–Flach classes specialized to the CM family, as in CGS Theorem 4.1.1 (BSTW §5). On T_f=T_pE_•, rescale the two Coleman maps as in Corollary 4.1.3 to injective Λ_K-linear maps with pseudo-null cokernel whose images of p⁻loc_v̄ BF_α and loc_v BF_α are respectively L_PR(E_•(α)/K) and L_Gr(f(α)/K). Neither BF nor a map is defined by assigning those predicted images.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Use CGS’s CM Hida family, crystalline twists α, distinguished lattice and specified ordinary local conditions; retain all interpolation/coefficient choices.

**Proof route.**

1. Construct and specialize the motivic KLZ classes through the imported cohomology and family APIs; verify the norm and local conditions of the actual classes. This source-specific construction is owned here, with a recorded implementation gap for the missing class interfaces.
2. Apply CGS Theorem 4.1.1 for both explicit reciprocity laws on I_f and I_g^cusp, including injectivity and pseudo-null cokernel.
3. Use deg(π_•)I_f=ℤ_p (Lemma 4.1.2), the ordinary integral de Rham comparison and the exact CM congruence ideal to rescale both maps (Corollary 4.1.3).

**Inputs.** [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions); `EulerSystemsAndKolyvaginSystems:ES.2`; `PadicHodgeRegulators:L3`; `PadicFamilies:L1`; `ArithmeticGaloisDuality:R02.1`; `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- CGS Proposition 4.2.1 and Theorem 4.3.1: The two actual localization maps relate BF-index, ordinary and Greenberg characteristic containments.
- CGS §7.2: Nonzero twisted images and integral normalizations supply the cyclotomic reverse bound.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `EisensteinBF.class` | data | The actual specialized motivic Beilinson–Flach cohomology class, not a chosen inverse image of an L-function. |
| `EisensteinBF.ordinary_local` | characterisation | The class lies in the ordinary-relaxed Selmer group with the source strict/relaxed places. |
| `EisensteinBF.coleman_PR` | compatibility | The rescaled Coleman map on p⁻loc_v̄ sends the actual class to the integrally normalized L_PR. |
| `EisensteinBF.coleman_Gr` | compatibility | The rescaled Coleman map on loc_v sends the same actual class to L_Gr with its Katz congruence factor. |
| `EisensteinBF.twist_congruence` | compatibility | After the specified twist automorphism, congruent characters produce congruent images modulo the same coefficient power. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `EisensteinBF.test_PR_projection` | compatibility | Cyclotomic projection of the PR image agrees with the product of MSD functions of E_• and E_•^K in their Néron periods. |
| `EisensteinBF.test_Gr_projection` | compatibility | Anticyclotomic projection of the Gr image agrees with the squared BDP normalization, including the nonunit Katz/congruence factor. |
| `EisensteinBF.test_zero_image` | non-example | If an injective Coleman projection has nonzero reciprocal L-image then the actual localized class is nonzero; the zero class cannot pass. |
| `EisensteinBF.test_lattice_rescaling` | compatibility | Changing the distinguished quotient differential rescales class/map and period modules by the computed factors, preserving both laws together. |

**Acceptance.**

- Both reciprocity images are checked on the same actual class and lattice, before any characteristic equality.

**Sources.**

- [cgs](#source-cgs), Theorem 4.1.1, Lemma 4.1.2, Corollary 4.1.3, pp.17–18. Both maps and their actual common class carry the integral normalization used by the main-conjecture comparison.

<a id="rankzeroonebsd-bsd-7a-bf-poitou-tate-divisibility-comparison"></a>

### Beilinson–Flach divisibility comparison

`RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison` · comparison.

Under CGS Proposition 4.2.1’s H⁰, torsion and nonzero L-function conditions, the BF-index containment for the ordinary-relaxed compact Selmer group and ordinary-strict dual is equivalent direction by direction to the Greenberg/L_Gr containment and to the ordinary/L_PR containment. All characteristic ideals use the same Λ_K, inverse action and primitive/imprimitive convention. A rational BF bound remains rational until its p-power is removed.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- E_•(K)[p]=0, the relevant projected L_PR and L_Gr are nonzero, and the torsion/rank hypotheses in CGS Proposition 4.2.1 hold.

**Proof route.**

1. Apply the two strict/relaxed Poitou–Tate exact sequences to the actual BF class.
2. Use injectivity and pseudo-null cokernels of both normalized Coleman maps from beilinson-flach-integral-reciprocity.
3. Take height-one characteristic lengths in each exact sequence, record both containment directions, and keep any inversion of p in the coefficient ring.

**Inputs.** [RankZeroOneBSD:BSD.7a/bf-pr-reciprocity](#rankzeroonebsd-bsd-7a-bf-pr-reciprocity); [RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity](#rankzeroonebsd-bsd-7a-bf-greenberg-reciprocity); `SelmerIwasawaCohomology:L2`; `ModularIwasawaMainConjectures:L0`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- An equality for one projected Selmer group cannot be imported from downstream MIMC L6.

**Sources.**

- [cgs](#source-cgs), Proposition 4.2.1, pp.18–19. This is an equivalence of proved containments, not an assumed main conjecture.

<a id="rankzeroonebsd-bsd-7a-nontrivial-twist-rational-bf-bound"></a>

### Nontrivial-twist rational Beilinson–Flach bound

`RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound` · theorem.

For CGS’s nontrivial crystalline anticyclotomic α with BF_α≠0 and its verified Euler-system representation hypotheses, S_ord,rel has Λ-rank one, X_ord,str is torsion and its characteristic ideal contains the BF-index characteristic ideal over Λ_K[1/p]. The source checks irreducibility of V_pE⊗Ind_K^ℚ α in characteristic zero and a rank-one σ-coinvariant condition; it does not assume residual irreducibility of E[p].

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- α is nontrivial and crystalline as in §4.3, BF_α≠0; the auxiliary σ and Euler-system hypotheses of Theorem 4.3.1 are verified.

**Proof route.**

1. Use the actual BF Euler system and its projection to the initial class.
2. Verify the representation hypotheses by CGS’s non-CM/Serre argument and the explicit σ, not the clean irreducible residual MR theorem.
3. Apply the imported error-tolerant Euler-system bound to obtain the containment only after inverting p.

**Inputs.** [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); `EulerSystemsAndKolyvaginSystems:ES.4`; `EulerSystemsAndKolyvaginSystems:ES.8`; `ArithmeticGaloisRepresentations:R01.1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The coefficient-prime length is still unresolved by this node.

**Sources.**

- [cgs](#source-cgs), Theorem 4.3.1 and its proof, pp.19–20. The theorem supplies only the rational bound at this point.

<a id="rankzeroonebsd-bsd-7a-congruent-characteristic-series"></a>

### Congruent twists and integral characteristic series

`RankZeroOneBSD:BSD.7a/congruent-characteristic-series` · theorem.

For α≡1 modulo ϖ^m, the finite-S imprimitive L-functions of E and E(α) are congruent after the twist automorphism γ↦α(γ)γ. Under the source torsion and no-finite-submodule hypotheses, their ordinary Selmer characteristic generators are congruent modulo the same ϖ^m up to units. The proof identifies Fitting with characteristic ideals only after the finite-submodule condition, and compares actual residual Selmer modules.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- The primitive ordinary Selmer dual is torsion and E(K)[p]=0 for Proposition 3.4.4; use the finite imprimitive S of the relevant tower.

**Proof route.**

1. Use CGS Lemma 2.5.1 for the analytic congruence.
2. Use residual coefficient/cohomology comparison and the imprimitive global-to-local surjectivity to compare Selmer modules modulo ϖ^m.
3. Apply Proposition 3.4.3’s no-finite-submodule assertion and Proposition 3.4.4’s Fitting comparison; retain the unit choice of generators.

**Inputs.** [RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-finite-euler-factor-comparison); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); `SelmerIwasawaCohomology:L3`; `ModularIwasawaMainConjectures:L0`; `PadicMeasuresIwasawaAlgebras:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A finite Λ-submodule cannot be discarded while taking Fitting ideals.

**Sources.**

- [cgs](#source-cgs), Lemma 2.5.1; Propositions 3.4.3–3.4.4. Large-power congruence controls μ and λ only after integral characteristic generators have been justified.

<a id="rankzeroonebsd-bsd-7a-twisted-control-augmentation-comparison"></a>

### Twisted control and augmentation comparison

`RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison` · comparison.

For a sufficiently near-trivial crystalline α with nonzero BDP specialization, under CGS Proposition 3.4.2’s conditions, the cyclotomic and anticyclotomic Greenberg characteristic generators specialize at augmentation with equal p-valuations. Their common expression retains the finite twisted Greenberg Selmer cardinality, #H⁰(K_v,W_{α⁻¹})² and every p-primary local Tamagawa term. Nonzero BDP specialization supplies BK corank one and nonzero ordinary localization; these are proved before applying control.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- E(K)[p]=0, the twisted BK Selmer group has corank one and the ordinary localization is nonzero as required by Lemma 3.4.1.

**Proof route.**

1. Choose α away from the finitely many zeros of the nonzero BDP function.
2. Use actual Heegner reciprocity and the Kolyvagin bound to prove Lemma 3.4.1’s rank/local nonvanishing hypotheses.
3. Apply Proposition 3.4.2 to both towers and compare their finite terms; this is equality up to p-adic unit, not equality of arbitrary chosen generators.

**Inputs.** [RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound](#rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound); `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`; `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`; `SelmerIwasawaCohomology:L3`; [RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture); `SelmerIwasawaCohomology:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- No local H⁰ factor is dropped merely because E(K)[p]=0.

**Sources.**

- [cgs](#source-cgs), Lemma 3.4.1; Proposition 3.4.2; §7.2 Step 2. These are the precise specialization hypotheses needed for the unit-quotient argument.

<a id="rankzeroonebsd-bsd-7a-integral-twisted-cyclotomic-equality"></a>

### Integral twisted cyclotomic equality

`RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality` · theorem.

For the near-trivial nontrivial crystalline twists used by CGS §7.2, char X_ord(E_•(α)/K∞⁺)=(L_PR(E_•(α)/K)^+) integrally. First the BF bound is rational. Wüthrich’s untwisted integral containment and congruence give the μ inequality that removes its p-power denominator. The anticyclotomic equality and twisted control then show the remaining quotient has a nonzero unit augmentation, hence is a unit. Cyclotomic μ is allowed to be positive.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Use nontrivial-twist-rational-bf-bound and bf-poitou-tate-divisibility-comparison to obtain the rational ordinary/Greenberg containments.
2. Use distinguished-lattice-integral-input plus congruent-characteristic-series for m large to compare μ and make the containment integral (CGS Lemma 7.2.2).
3. Compare the nonzero augmentation values with twisted-control-augmentation-comparison and the anticyclotomic main conjecture. A quotient of integral power series with unit augmentation is a unit (SU Lemma 3.2).
4. Translate the resulting Greenberg equality back to ordinary/L_PR using the two-way BF comparison.

**Inputs.** [RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound](#rankzeroonebsd-bsd-7a-nontrivial-twist-rational-bf-bound); [RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison](#rankzeroonebsd-bsd-7a-bf-poitou-tate-divisibility-comparison); [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/congruent-characteristic-series](#rankzeroonebsd-bsd-7a-congruent-characteristic-series); [RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison](#rankzeroonebsd-bsd-7a-twisted-control-augmentation-comparison); `ModularIwasawaMainConjectures:L0`; `PadicMeasuresIwasawaAlgebras:L4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A rational containment plus specialization at a zero augmentation does not establish equality.

**Sources.**

- [cgs](#source-cgs), §7.2 Lemmas 7.2.1–7.2.2 and (7.10)–(7.11). The μ inequality repairs integrality; anticyclotomic μ=0 is not reused as a cyclotomic μ=0 claim.

<a id="rankzeroonebsd-bsd-7a-cgs-cyclotomic-main-conjecture"></a>

### CGS integral cyclotomic main conjecture

`RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture` · theorem.

Under CGS’s good Eisenstein local exclusion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char_Λℚ X_ord(E/ℚ∞)=(L_p^MSD(E/ℚ)) integrally with Néron real periods. No μ=0 hypothesis or conclusion is imposed on the cyclotomic functions.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof route.**

1. Use congruent-characteristic-series and integral-twisted-cyclotomic-equality for arbitrarily close twists to equate μ and λ of the untwisted imprimitive ordinary characteristic and L_PR generators; combine with Wüthrich’s integral containment to get equality over K∞⁺ (Theorem 7.2.3).
2. Apply odd-p quadratic Shapiro splitting of the ordinary Selmer dual and the exact Néron-period product specialization of integral-two-variable-functions.
3. Use Wüthrich’s individual integral containments for E and E^K. Equality of their product forces both quotients to be units. Return from E_• using the proved isogeny comparison.

**Inputs.** [RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality](#rankzeroonebsd-bsd-7a-integral-twisted-cyclotomic-equality); [RankZeroOneBSD:BSD.7a/congruent-characteristic-series](#rankzeroonebsd-bsd-7a-congruent-characteristic-series); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions); [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition](#rankzeroonebsd-bsd-1-odd-selmer-sha-decomposition); `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The result is an output to MIMC L6; that stage’s reexport cannot be its input.

**Sources.**

- [cgs](#source-cgs), Theorems 7.2.3 and 7.1.1, pp.30–31. Both integral individual containments are essential to descend product equality.

<a id="rankzeroonebsd-bsd-7a-ky-cyclotomic-main-conjecture"></a>

### Keller–Yin integral cyclotomic main conjecture

`RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture` · theorem.

For every odd good Eisenstein p of an elliptic curve E/ℚ, including local or global rational p-torsion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char X_ord=(L_p^MSD(E/ℚ)) with its integral Néron-period normalization. This is KY Theorem 3.0.10 in weight two.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof route.**

1. Repeat the CGS three-step cyclotomic argument using ky-anticyclotomic-greenberg-equality in place of the locally excluded CGS equality.
2. Work on the chosen residual-invariant-free isogenous lattice where the congruence and finite-submodule hypotheses hold; use ky-ribet-lattice and Wüthrich’s distinguished integral comparison to return to the original curve.
3. Keep the original curve’s periods, torsion, p-power isogeny factors and finite control terms; a rational lattice comparison alone does not preserve the integral endpoint.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality); [RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs](#rankzeroonebsd-bsd-7a-ky-cyclotomic-proof-inputs); [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions); `SelmerIwasawaCohomology:L3`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The original E may have rational p-torsion; the intermediate chosen lattice need not.

**Sources.**

- [ky](#source-ky), Theorem 3.0.10, p.41. KY substitutes its anticyclotomic theorem and lattice transfer into CGS, rather than deleting a hypothesis from CGS’s statement.

<a id="rankzeroonebsd-bsd-7a-cgls-prototype-main-conjecture"></a>

### CGLS anticyclotomic prototype

`RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture` · theorem.

Under the CGS local exclusion and Heegner/split/discriminant conditions, and additionally corank_ℤp Sel_{p∞}(E/K)=1, the CGLS primitive Greenberg dual is Λ-torsion with char(X_E)Λ^ur=(L_E), where L_E is squared BDP. Its Heegner index-square consequence is initially stated in Λ^ac=Λ[1/p] in the published Corollary 4.2.3. This prototype retains (Sel); the stronger CGS equality above removes it by a new proof.

**Hypotheses.**

- E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel.
- When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.
- The additional (Sel) condition of CGLS: corank_ℤp Sel_{p∞}(E/K)=1.

**Proof route.**

1. Use the early Heegner weak divisibility and its source corank-one augmentation upgrade.
2. Translate to Greenberg/BDP using heegner-reciprocity-ideal-comparison.
3. Use cgls-equal-iwasawa-invariants to obtain the integral Greenberg equality, and record the published rational index-square consequence without silently upgrading its coefficient ring.

**Inputs.** `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`; [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison); [RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- An analytic rank-two E cannot be fed to this source by omitting (Sel).

**Sources.**

- [cgls](#source-cgls), Theorem 4.2.2 and Corollary 4.2.3, pp.569–570. The routed Theorem C/Corollary D prototype has an extra corank condition.

<a id="rankzeroonebsd-bsd-7a-ky-cyclotomic-proof-inputs"></a>

### Keller–Yin cyclotomic input transfer

`RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs` · comparison.

On the actual invariant-free KY lattice, establish the cohomological, finite-submodule, twisted congruence and Coleman/Poitou–Tate inputs needed for the three-step CGS cyclotomic argument, now permitting local characters 1/ω. Use KY’s anticyclotomic equality in the specialization step and Wüthrich’s distinguished integral lattice in the individual containment step. Track the maps between these two lattices rather than identifying them. The original curve’s integral Néron-period ordinary characteristic comparison is part of this transfer, not a consequence of rational isogeny comparison alone.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- Chosen KY lattice and actual comparison maps to the distinguished E_• lattice; every rank, H⁰, surjectivity and no-finite-submodule condition used in the CGS argument must be verified on the lattice where it is applied.

**Proof route.**

1. KY Theorem 3.0.10 cites substitution of its 3.0.8/3.0.9 into CGS. Verify the §3.4 control and finite-submodule conditions through the exceptional local character diagrams of KY §§1.1–1.4.
2. Construct the actual transferred BF specialization and compare both Coleman images, twist congruences and integral characteristic/Fitting generators; preserve every p-power index.
3. Use the independent KY anticyclotomic equality, the integral Wüthrich individual bound and nonzero augmentation control to repeat CGS’s rational-bound/integral-repair/unit-quotient argument. The remaining source-to-interface verification is recorded explicitly as a gap.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); [RankZeroOneBSD:BSD.7a/ky-local-character-corrections](#rankzeroonebsd-bsd-7a-ky-local-character-corrections); [RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality); [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L3`; `PadicHodgeRegulators:L3`; `ModularIwasawaMainConjectures:L0`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A CGS lemma requiring φ|G_p≠1,ω cannot be applied to the KY branch merely by changing its name.

**Sources.**

- [ky](#source-ky), Theorem 3.0.10 proof, p.41; §1.4 lattice independence; Remark 3.0.9. This records the adaptation obligation; the narrower CGS-hypothesis lemmas are not theorem inputs for an exceptional local character.

<a id="rankzeroonebsd-bsd-7a-ky-uniform-near-trivial-bound"></a>

### Keller–Yin uniform near-trivial bound

`RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound` · theorem.

For KY’s chosen stable self-dual weight-two lattice T with H⁰(K,T/pT)=0 and the actual ordinary conditions, let α≡1 mod ϖ^m. Constants M₀,C depend only on the representation/lattice and rank of the coefficient extension, not on m or α in this neighborhood. If m≥M₀ and κ₁ is nontorsion, the compact Selmer group has rank one, the discrete group is Φ/R⊕M_α⊕M_α, and length_R M_α≤length_R(S/Rκ₁)+C. This generalization requires the chosen nonsplit lattice but not CGS’s local exclusions on its characters.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The invariant-free lattice and propagated ordinary local/dual conditions are verified; an actual Kolyvagin system with nontorsion κ₁ is supplied.

**Proof route.**

1. Use ky-ribet-lattice for the cohomological H⁰ hypothesis.
2. Use KY Lemma 3.0.3’s scalar-image argument (Bogomolov/Ribet) to bound the source C₁ on the representation; retain this supplier requirement explicitly.
3. Adapt the two-copy bounded-error descent of CGS §§6.2–6.4 to the KY lattice as Theorem 3.0.2 specifies; the error remains independent of m.

**Inputs.** [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); `ArithmeticGaloisRepresentations:R01.1`; `EulerSystemsAndKolyvaginSystems:ES.4`; `EulerSystemsAndKolyvaginSystems:ES.8`; `SelmerIwasawaCohomology:L2`.

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The lattice can be invariant-free when the original curve has rational p-torsion.

**Sources.**

- [ky](#source-ky), Theorems 3.0.1–3.0.2, Lemma 3.0.3 and Remark 3.0.4, pp.35–36. This is the KY version; the narrower CGS-hypothesis theorem is not used on an exceptional local character.

<a id="rankzeroonebsd-bsd-7a-bf-pr-reciprocity"></a>

### EisensteinBF.coleman_PR

`RankZeroOneBSD:BSD.7a/bf-pr-reciprocity` · lemma.

The normalized injective Coleman map with pseudo-null cokernel sends p⁻loc_v̄ BF_α to L_PR(E_•(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3. This promotes the consumed compatibility API to a separate declaration.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

**Proof route.**

1. Apply CGS Theorem 4.1.1 to the actual KLZ specialization.
2. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

**Inputs.** [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The image equality uses the actual same class as the other reciprocity law.

**Sources.**

- [cgs](#source-cgs), Corollary 4.1.3, p.18. The actual localization/map compatibility is used by the characteristic-ideal comparison.

<a id="rankzeroonebsd-bsd-7a-bf-greenberg-reciprocity"></a>

### EisensteinBF.coleman_Gr

`RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity` · lemma.

The normalized injective Coleman map with pseudo-null cokernel sends loc_v BF_α to L_Gr(f(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3. This promotes the consumed compatibility API to a separate declaration.

**Hypotheses.**

- E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.
- When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.
- The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

**Proof route.**

1. Apply CGS Theorem 4.1.1 to the actual KLZ specialization.
2. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

**Inputs.** [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions).

**Suggested home.** `TauCeti/NumberTheory/BSD/EisensteinMainConjectures`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The image equality uses the actual same class as the other reciprocity law.

**Sources.**

- [cgs](#source-cgs), Corollary 4.1.3, p.18. The actual localization/map compatibility is used by the characteristic-ideal comparison.

## BSD.8 — Finite certificates and the full leading term

Reduced numerator and positive denominator give a deterministic finite prime support. Valuation-zero checks on a covering finite set imply all-prime vanishing; positivity then reconstructs q=1. Apply this to BSD.5’s actual rational defect to obtain the real leading term. Source-qualified dispatch supplies only primes satisfying a named endpoint’s hypotheses. The remaining primes require certified Selmer/Sha, annihilator, saturation, local or isogeny adapters. Individual and family formulas are conditional on complete certificates; the adapters do not trust predicted Sha orders.

**Planets:** Prime support ([declaration](#rankzeroonebsd-bsd-8-prime-support)); All-prime reconstruction ([declaration](#rankzeroonebsd-bsd-8-positive-rational-reconstruction)); Finite-support certificate ([declaration](#rankzeroonebsd-bsd-8-finite-prime-certificate)); Certified finite descent ([declaration](#rankzeroonebsd-bsd-8-sha-annihilator-adapter)); Full BSD from prime certificates ([declaration](#rankzeroonebsd-bsd-8-individual-full-bsd-from-exceptions)).

<a id="rankzeroonebsd-bsd-8-prime-support"></a>

### Prime support of a rational number

`RankZeroOneBSD:BSD.8/prime-support` · definition.

For q in Q, Rat.primeSupport(q) is Nat.primeFactors(|q.num|) union Nat.primeFactors(q.den), using the existing reduced numerator and positive denominator. It is a finite set of natural numbers, not a set of arbitrary places. At q=0 its value is empty by the existing zero convention.

**Proof route.**

1. Take the union of the two existing finite prime-factor sets. The construction is deterministic and uses the canonical rational numerator and denominator; it makes no choice of a factorization or rational representative.

**Inputs.** `mathlib:Nat.primeFactors`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Uses.**

- BSD.8 finite-support assembly: Provides a finite, exact cover of all potentially nonzero rational prime valuations.
- BSD.9 zero and sign regression tests: Makes the degenerate conventions visible rather than hiding them in a positivity wrapper.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Rat.mem_primeSupport` | characterisation | For q nonzero, p belongs to its support exactly when p is prime and divides its absolute numerator or denominator. |
| `Rat.primeSupport_zero` | simp | The prime support of zero is empty. |
| `Rat.primeSupport_one` | simp | The prime support of one is empty. |
| `Rat.primeSupport_neg` | compatibility | Negation leaves prime support unchanged. |
| `Rat.primeSupport_inv` | compatibility | Inversion leaves prime support unchanged, including at zero. |
| `Rat.primeSupport_mul_subset` | relation | The support of a product is contained in the union of the supports of its factors; equality is not asserted because cancellation is possible. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `Rat.primeSupport_test_six_thirtyfive` | computation | The support of 6/35 is {2,3,5,7}. |
| `Rat.primeSupport_test_zero` | degenerate | The support of 0 is empty; this does not imply 0=1. |
| `Rat.primeSupport_test_cancellation` | non-example | The support of 2 times 1/2 is empty although the union of the two individual supports is {2}. |
| `Rat.primeSupport_test_negative` | compatibility | The support of -6/35 equals the support of 6/35. |

**Acceptance.**

- Changing a displayed fraction by a common nonzero factor does not change its rational prime support.

**Sources.**

- [mathlib-prime-fin](#source-mathlib-prime-fin), primeFactors; mem_primeFactors; primeFactors_zero. Compose the existing natural-number construction; do not reimplement factorization.

<a id="rankzeroonebsd-bsd-8-support-membership"></a>

### Membership in rational prime support

`RankZeroOneBSD:BSD.8/support-membership` · lemma.

For q nonzero and p natural, p belongs to Rat.primeSupport(q) if and only if p is prime and either p divides |q.num| or p divides q.den.

**Hypotheses.**

- q is a nonzero rational number.

**Proof route.**

1. Unfold the union defining prime support. Apply Nat.mem_primeFactors to each summand. Nonzero q gives nonzero absolute numerator; the canonical denominator is positive. Remove these two nonzero conditions and distribute the shared primality condition.

**Inputs.** [RankZeroOneBSD:BSD.8/prime-support](#rankzeroonebsd-bsd-8-prime-support); `mathlib:Nat.mem_primeFactors`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- At q=6/35, 5 belongs to the support and 4 does not. The nonzero hypothesis prevents treating every prime as a divisor contributing to the support of zero.

**Sources.**

- [mathlib-prime-fin](#source-mathlib-prime-fin), mem_primeFactors. Apply the exact membership theorem to both canonical integers.

<a id="rankzeroonebsd-bsd-8-zero-numerator-denominator"></a>

### Zero valuation in the reduced numerator and denominator

`RankZeroOneBSD:BSD.8/zero-numerator-denominator` · lemma.

For a prime p and any rational q with v_p(q)=0, both the natural valuation of |q.num| and that of q.den are zero.

**Hypotheses.**

- p is prime.
- v_p(q)=0; q may be zero.

**Proof route.**

1. Use Rat.num_or_den_zero_padicVal to obtain that at least one of the numerator and denominator valuations is zero.
2. Unfold padicValRat. Its vanishing equates the two natural valuations after integer coercion. In each branch, substitute the known zero and deduce that the other valuation is zero.

**Inputs.** `mathlib:Rat.num_or_den_zero_padicVal`; `mathlib:padicValRat`; `mathlib:padicValInt`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- The result also holds for q=0 under the library convention. It must not be applied to an unreduced numerator/denominator pair.

**Sources.**

- [mathlib-padic](#source-mathlib-padic), Rat.num_or_den_zero_padicVal; padicValRat. Reducedness prevents cancellation between two positive numerator and denominator valuations.

<a id="rankzeroonebsd-bsd-8-zero-iff-outside-support"></a>

### Prime valuation and exact support

`RankZeroOneBSD:BSD.8/zero-iff-outside-support` · comparison.

For a nonzero rational q and a prime p, v_p(q)=0 if and only if p does not belong to Rat.primeSupport(q).

**Hypotheses.**

- q is nonzero.
- p is prime.

**Proof route.**

1. For the forward implication, apply zero-numerator-denominator. Use dvd_iff_padicValNat_ne_zero, separately for the nonzero absolute numerator and the positive denominator, to exclude both divisibilities. Apply support-membership.
2. For the reverse implication, support-membership excludes both divisibilities. The same baseline equivalence gives zero for both natural valuations. Subtract them in the definition of padicValRat. Install Fact p.Prime locally when applying the baseline valuation lemma.

**Inputs.** [RankZeroOneBSD:BSD.8/support-membership](#rankzeroonebsd-bsd-8-support-membership); [RankZeroOneBSD:BSD.8/zero-numerator-denominator](#rankzeroonebsd-bsd-8-zero-numerator-denominator); `mathlib:dvd_iff_padicValNat_ne_zero`; `mathlib:padicValRat`; `mathlib:padicValInt`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- For q=1/2, the valuation at 2 is -1 and 2 is in the support; negative valuations are not discarded.

**Sources.**

- [mathlib-padic](#source-mathlib-padic), dvd_iff_padicValNat_ne_zero. Both uses retain the nonzero natural-argument hypothesis.
- [mathlib-prime-fin](#source-mathlib-prime-fin), mem_primeFactors. Identifies the two possible supports.

<a id="rankzeroonebsd-bsd-8-empty-support-units"></a>

### Empty prime support and rational units of absolute value one

`RankZeroOneBSD:BSD.8/empty-support-units` · lemma.

For nonzero q in Q, Rat.primeSupport(q) is empty if and only if q=1 or q=-1.

**Hypotheses.**

- q is nonzero.

**Proof route.**

1. A union is empty exactly when each of its finite sets is empty. Apply Nat.primeFactors_eq_empty to the absolute numerator and denominator.
2. Their nonzero properties eliminate the zero alternatives. Thus the absolute numerator and denominator are both one; the canonical rational normal form gives q=1 or q=-1. Conversely, substitute either value in the definition.

**Inputs.** [RankZeroOneBSD:BSD.8/prime-support](#rankzeroonebsd-bsd-8-prime-support); `mathlib:Nat.primeFactors_eq_empty`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- Both 1 and -1 must occur. The unrestricted implication with q=0 is false.

**Sources.**

- [mathlib-prime-fin](#source-mathlib-prime-fin), primeFactors_eq_empty. Apply twice, retaining nonzero q to eliminate the zero numerator.

<a id="rankzeroonebsd-bsd-8-positive-rational-reconstruction"></a>

### Reconstruction of a positive rational from all prime valuations

`RankZeroOneBSD:BSD.8/positive-rational-reconstruction` · theorem.

For q in Q with 0<q, q=1 if and only if v_p(q)=0 for every prime natural p.

**Hypotheses.**

- q is strictly positive.

**Proof route.**

1. If q=1, use padicValRat.one at every prime.
2. Conversely q is nonzero. Every member of primeSupport(q) is prime by support-membership, and zero-iff-outside-support contradicts its membership if all prime valuations vanish. Hence the support is empty.
3. Apply empty-support-units. Strict positivity eliminates the alternative q=-1.

**Inputs.** [RankZeroOneBSD:BSD.8/support-membership](#rankzeroonebsd-bsd-8-support-membership); [RankZeroOneBSD:BSD.8/zero-iff-outside-support](#rankzeroonebsd-bsd-8-zero-iff-outside-support); [RankZeroOneBSD:BSD.8/empty-support-units](#rankzeroonebsd-bsd-8-empty-support-units); `mathlib:padicValRat.one`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- Reject the conclusion for q=0 and q=-1 when positivity is removed. Testing only odd primes leaves q=2 undecided.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. This is only the rational reconstruction step, not a theorem establishing positivity or rationality of the BSD quotient.
- [mathlib-prime-fin](#source-mathlib-prime-fin), primeFactors_eq_empty. The proof reduces reconstruction to prime-factor uniqueness at one.

<a id="rankzeroonebsd-bsd-8-finite-prime-certificate"></a>

### Finite certificate of rational prime-valuation vanishing

`RankZeroOneBSD:BSD.8/finite-prime-certificate` · definition.

Rat.PrimeValuationCertificate(q) consists of a finite set primes of natural numbers, proofs that every member is prime, that Rat.primeSupport(q) is contained in primes, and that v_p(q)=0 for every member p. It stores no equality q=1, no positivity assumption, and no unproved assertion that a partial list covers the support.

**Proof route.**

1. Form the structure using the existing finite-set and valuation types and the explicit primeSupport construction. Constructor fields have the stated mathematical content. Extensionality reduces to equality of the finite sets, since the other fields are proofs.

**Inputs.** [RankZeroOneBSD:BSD.8/prime-support](#rankzeroonebsd-bsd-8-prime-support); `mathlib:padicValRat`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Uses.**

- BSD.8 individual-curve and family assembly: Separates finitely many local proofs from a proof of support coverage.
- BSD.9 missing-prime tests: Rejects partial local evidence without conflating it with rank or Sha finiteness.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.primes` | data | The finite set used by this certificate. |
| `Rat.PrimeValuationCertificate.prime_mem` | projection | Every member of primes is prime. |
| `Rat.PrimeValuationCertificate.covers` | projection | The canonical support is contained in primes. |
| `Rat.PrimeValuationCertificate.localZero` | projection | The valuation vanishes at every member of primes. |
| `Rat.PrimeValuationCertificate.ext` | extensionality | Certificates for the same q with equal finite sets are equal. |
| `Rat.PrimeValuationCertificate.zeroValuation` | characterisation | A certificate implies zero valuation at every prime, including outside its finite set. |
| `Rat.PrimeValuationCertificate.eq_one` | compatibility | A certificate for strictly positive q implies q=1. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.test_one` | computation | A certificate for 1 exists with empty finite set. |
| `Rat.PrimeValuationCertificate.test_zero` | degenerate | A certificate for 0 exists with empty finite set, but the positivity input is false. |
| `Rat.PrimeValuationCertificate.test_negative_one` | non-example | A certificate for -1 exists; its existence alone is not a full-formula certificate. |
| `Rat.PrimeValuationCertificate.test_two` | non-example | There is no certificate for 2. |
| `Rat.PrimeValuationCertificate.test_quarter` | non-example | There is no certificate for 1/4, whose missing dyadic valuation is negative. |

**Acceptance.**

- An empty list is not evidence of coverage for q=2. Zero and -1 can have such valuation certificates but cannot pass positive reconstruction.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. The data consist of finite support coverage and checked local valuations; positivity is a separate hypothesis of reconstruction.

<a id="rankzeroonebsd-bsd-8-certificate-from-all-primes"></a>

### Canonical certificate from all prime valuations

`RankZeroOneBSD:BSD.8/certificate-from-all-primes` · construction.

Given a rational q and a proof that v_p(q)=0 for every prime p, construct Rat.PrimeValuationCertificate.ofAllPrimes(q) with finite set exactly Rat.primeSupport(q). No nonzero or sign hypothesis is needed.

**Hypotheses.**

- All prime valuations of q vanish.

**Proof route.**

1. Choose the canonical support as the finite set; support coverage is reflexive.
2. Its members are prime by Nat.mem_primeFactors, even when the numerator is zero. The supplied all-prime assertion gives every local proof.

**Inputs.** [RankZeroOneBSD:BSD.8/finite-prime-certificate](#rankzeroonebsd-bsd-8-finite-prime-certificate); `mathlib:Nat.mem_primeFactors`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Uses.**

- BSD.8 independently proved all-prime family theorems: Turns a universal valuation theorem into the same certificate type as finite exceptional-prime arguments.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.ofAllPrimes` | constructor | Construct the certificate from the all-prime vanishing hypothesis. |
| `Rat.PrimeValuationCertificate.ofAllPrimes_primes` | simp | Its finite set is exactly Rat.primeSupport(q). |
| `Rat.PrimeValuationCertificate.ofAllPrimes_proof_independent` | extensionality | The constructed certificate is independent of the chosen proof of all-prime vanishing. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.ofAllPrimes_test_one` | computation | For q=1 the chosen finite set is empty. |
| `Rat.PrimeValuationCertificate.ofAllPrimes_test_zero` | degenerate | For q=0 the chosen finite set is empty. |
| `Rat.PrimeValuationCertificate.ofAllPrimes_test_negative_one` | non-example | For q=-1 the chosen finite set is empty without providing positivity. |

**Acceptance.**

- The chosen set is canonical rather than an unspecified finite witness.

**Sources.**

- [mathlib-prime-fin](#source-mathlib-prime-fin), mem_primeFactors. Primality of each member is unconditional.
- [roadmap](#source-roadmap), BSD.8. Packages genuine all-prime input, not a new proof of it.

<a id="rankzeroonebsd-bsd-8-certificate-all-primes"></a>

### A finite certificate controls every prime

`RankZeroOneBSD:BSD.8/certificate-all-primes` · lemma.

For any rational q, any Rat.PrimeValuationCertificate(q), and any prime p, v_p(q)=0.

**Hypotheses.**

- A finite prime-valuation certificate for q is supplied.
- p is prime.

**Proof route.**

1. If q=0 use padicValRat.zero. Otherwise split on membership of p in the certificate finite set.
2. Inside the set use localZero. Outside it, covers implies p is outside canonical support. Apply zero-iff-outside-support to nonzero q.

**Inputs.** [RankZeroOneBSD:BSD.8/finite-prime-certificate](#rankzeroonebsd-bsd-8-finite-prime-certificate); [RankZeroOneBSD:BSD.8/zero-iff-outside-support](#rankzeroonebsd-bsd-8-zero-iff-outside-support); `mathlib:padicValRat.zero`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- The outside-set branch must be justified by covers. The statement also applies at the zero convention without producing equality to one.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. This theorem proves that exclusion from the actual coverage field, rather than assuming that the displayed finite list is exhaustive.

<a id="rankzeroonebsd-bsd-8-certificate-reconstruction"></a>

### Positive reconstruction from a finite certificate

`RankZeroOneBSD:BSD.8/certificate-reconstruction` · theorem.

For strictly positive q in Q, a Rat.PrimeValuationCertificate(q) implies q=1.

**Hypotheses.**

- q is strictly positive.
- A finite prime-valuation certificate for q is supplied.

**Proof route.**

1. Use certificate-all-primes to get the valuation statement at every prime. Apply positive-rational-reconstruction with the supplied strict positivity.

**Inputs.** [RankZeroOneBSD:BSD.8/certificate-all-primes](#rankzeroonebsd-bsd-8-certificate-all-primes); [RankZeroOneBSD:BSD.8/positive-rational-reconstruction](#rankzeroonebsd-bsd-8-positive-rational-reconstruction).

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- Neither a certificate for -1 nor one for 0 supplies the positivity hypothesis.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. This supplies the algebraic identity only after the positive rational defect has been identified by its owner.

<a id="rankzeroonebsd-bsd-8-certificate-from-exceptions"></a>

### Certificate from an exceptional-prime set and an outside theorem

`RankZeroOneBSD:BSD.8/certificate-from-exceptions` · construction.

Given q in Q, a finite set S of primes, vanishing of v_p(q) on S, and vanishing at every prime outside S, construct Rat.PrimeValuationCertificate.ofExceptionSet(q,S) with finite set S. Its support coverage is proved, not an extra unverified field.

**Hypotheses.**

- Every member of S is prime.
- v_p(q)=0 for each p in S.
- For every prime p outside S, v_p(q)=0.

**Proof route.**

1. For q=0 the canonical support is empty, so coverage is immediate.
2. For q nonzero and p in canonical support, support-membership gives primality. If p were outside S, the outside theorem and zero-iff-outside-support would contradict membership. This proves coverage.
3. Use the given primality and inside vanishing statements for the remaining fields.

**Inputs.** [RankZeroOneBSD:BSD.8/finite-prime-certificate](#rankzeroonebsd-bsd-8-finite-prime-certificate); [RankZeroOneBSD:BSD.8/support-membership](#rankzeroonebsd-bsd-8-support-membership); [RankZeroOneBSD:BSD.8/zero-iff-outside-support](#rankzeroonebsd-bsd-8-zero-iff-outside-support).

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Uses.**

- BSD.8 exceptional 2, 3, and bad primes: Combines the named source-qualified branches with independent exceptional-prime calculations only after their ranges cover all primes.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.ofExceptionSet` | constructor | Construct the certificate from inside and outside prime-valuation proofs. |
| `Rat.PrimeValuationCertificate.ofExceptionSet_primes` | simp | Its finite set equals the supplied S. |
| `Rat.PrimeValuationCertificate.ofExceptionSet_proof_independent` | extensionality | For fixed q and S the constructed certificate is independent of the primality, inside and outside proofs. |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `Rat.PrimeValuationCertificate.ofExceptionSet_test_empty` | degenerate | For q=1 and S empty the supplied global outside theorem gives the empty certificate. |
| `Rat.PrimeValuationCertificate.ofExceptionSet_test_enlarged` | compatibility | For q=1 and S={2,3}, correct inside and outside proofs produce a certificate with exactly {2,3}, not the minimal support. |
| `Rat.PrimeValuationCertificate.ofExceptionSet_test_negative_one` | non-example | For q=-1 and S={2}, correct prime data produce a valuation certificate, still without positivity. |

**Acceptance.**

- The outside theorem has to cover every prime outside S, not just every sufficiently large prime beyond a second unstated exception set.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. The inside and outside proofs remain distinct inputs; deriving support coverage does not manufacture any missing prime-part theorem.

<a id="rankzeroonebsd-bsd-8-real-identity"></a>

### Transfer of a certified rational quotient to a real identity

`RankZeroOneBSD:BSD.8/real-identity` · comparison.

Let A,B be real numbers with B nonzero. If q is a strictly positive rational number, its canonical real image equals A/B, and q has a finite prime-valuation certificate, then A=B.

**Hypotheses.**

- B is nonzero.
- q is strictly positive.
- The real image of q is exactly A/B.
- A finite prime-valuation certificate for q is supplied.

**Proof route.**

1. Apply certificate-reconstruction to obtain q=1.
2. Transport this equality through the canonical rational-to-real map. The identified quotient is one. Multiply by nonzero B using field algebra.

**Inputs.** [RankZeroOneBSD:BSD.8/certificate-reconstruction](#rankzeroonebsd-bsd-8-certificate-reconstruction).

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- The theorem does not assert that arbitrary A/B is rational. It also does not identify A or B with elliptic-curve invariants.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. An exact rational-to-real identification is indispensable; numerical recognition of a quotient is not this hypothesis.

<a id="rankzeroonebsd-bsd-8-elliptic-endpoint"></a>

### Full leading term under the actual defect certificate

`RankZeroOneBSD:BSD.8/elliptic-endpoint` · application.

For an actual elliptic curve E/ℚ of analytic rank at most one, a Rat.PrimeValuationCertificate for BSD.5’s bsdDefect E proves the full real identity L*(E,1)=Ω_E Reg_BSD(E/ℚ) #Ш(E/ℚ) ∏c_ℓ(E)/#E(ℚ)_tors². Its hypotheses include the proved analytic-rank bound and a complete certificate, not just finitely many observed p-parts.

**Hypotheses.**

- analyticRank E≤1.
- A complete finite valuation certificate for the actual bsdDefect E.

**Proof route.**

1. Import rational-bsd-defect, its positivity and exact real quotient, including rank equality and whole-Sha finiteness from BSD.4.
2. Apply real-identity to the certificate and the positive arithmetic denominator.

**Inputs.** [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.8/real-identity](#rankzeroonebsd-bsd-8-real-identity).

**Suggested home.** `TauCeti/AlgebraicGeometry/EllipticCurve/BSD/LeadingTerm`; namespace `WeierstrassCurve`.

**Acceptance.**

- An arbitrary rational carrying the same label is not an admissible substitute for d_E. Keep rank equality and whole-Sha finiteness as separate public results.

**Sources.**

- [roadmap](#source-roadmap), BSD.8. The theorem is conditional on a complete certificate for the actual curve defect; it is not unrestricted rank-zero/one BSD.

<a id="rankzeroonebsd-bsd-8-torsion-square-valuation"></a>

### Rational valuation with torsion square

`RankZeroOneBSD:BSD.8/torsion-square-valuation` · lemma.

For a prime p and nonzero rationals q,a,t, v_p(q·t²/a)=v_p(q)+2v_p(t)−v_p(a). In an elliptic defect comparison q is the rational leading-term quotient after period/regulator rationality, t is the actual torsion order and a is the finite Sha–Tamagawa product. The sign of the torsion correction is positive in the defect and negative in the arithmetic leading term.

**Hypotheses.**

- p prime; q,a,t nonzero rational numbers.

**Proof route.**

1. Use padicValRat.mul, pow and div with the nonzero arguments; convert the natural exponent 2 to the integer coefficient.
2. Apply the identity only after BSD.5 provides the rational leading-term quotient.

**Inputs.** `mathlib:padicValRat.mul`; `mathlib:padicValRat.pow`; `mathlib:padicValRat.div`.

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `Rat`.

**Acceptance.**

- For q=1/25,t=5,a=1, the valuation at 5 is zero; omitting t² yields −2.

**Sources.**

- [mathlib-padic](#source-mathlib-padic), padicValRat.mul; padicValRat.pow; padicValRat.div. The pinned valuation algebra keeps denominator valuations and the square.

<a id="rankzeroonebsd-bsd-8-selmer-cardinality-adapter"></a>

### Finite Selmer cardinality and Sha torsion

`RankZeroOneBSD:BSD.8/selmer-cardinality-adapter` · comparison.

For E/ℚ with known Mordell–Weil rank r, exact torsion group and m=p^n>1, a verified finite presentation of Sel_m and the actual Kummer exact sequence give #Ш(E/ℚ)[m]=#Sel_m/(m^r·#E(ℚ)_tors/mE(ℚ)_tors). To conclude the p-primary order from this finite layer one must also prove that p^n annihilates Ш[p∞]. Finiteness alone does not make n=1 sufficient.

**Hypotheses.**

- m=p^n, p prime, n≥1; exact finite Sel_m presentation and correct actual local Kummer images; rank and torsion verified.

**Proof route.**

1. Import EllipticCurves Layer 7’s exact 0→E(ℚ)/mE(ℚ)→Sel_m→Ш[m]→0, not a new Selmer definition.
2. Use the actual finite generated Mordell–Weil decomposition from Layer 6 to compute the quotient cardinality; a subgroup of finite index is not automatically the full free lattice.
3. Take cardinalities of the verified finite presentation. With an independent exponent bound identify Ш[m] with Ш[p∞].

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`; `ArithmeticGaloisDuality:R02.4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A p-Selmer count can detect Sha[p] without measuring the higher p-power exponent.

**Sources.**

- [cremona3](#source-cremona3), §3.6 2-descent, exact sequence following the quartic Selmer description. The generic Kummer cardinality is the consumer adapter; finite descent is not confused with full Sha.

<a id="rankzeroonebsd-bsd-8-sha-annihilator-adapter"></a>

### Certified Sha annihilator and finite descent

`RankZeroOneBSD:BSD.8/sha-annihilator-adapter` · theorem.

For an analytic-rank-at-most-one actual E, take a proved positive integer B annihilating the whole Ш(E/ℚ), obtained from an explicit bounded-error Kolyvagin descent or another independently certified arithmetic bound. For each prime p|B, verified Sel_{p^{v_p(B)}} data determine #Ш[p∞] by selmer-cardinality-adapter. Their product is the whole Sha order; for p∤B the p-primary group vanishes. A claimed annihilator must include all exceptional, dyadic and bad-prime constants.

**Hypotheses.**

- A theorem proves B>0 and [B]Ш(E/ℚ)=0, not just predicted order or abstract finiteness.
- Each listed finite Selmer presentation is certified with its local images and actual Mordell–Weil quotient.

**Proof route.**

1. Import the all-prime arithmetic descent from HE.7 and the explicit error constants/annihilator promised for the particular curve or family; record a gap where no numerical annihilator producer has been established.
2. Factor B with the baseline primeFactors/factorization API. Apply selmer-cardinality-adapter at the full exponent.
3. Use primary decomposition for the finite group to reconstruct its cardinality and prove outside-prime vanishing.

**Inputs.** [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); `HeegnerPointEulerSystems:HE.7`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; [RankZeroOneBSD:BSD.8/selmer-cardinality-adapter](#rankzeroonebsd-bsd-8-selmer-cardinality-adapter); `mathlib:Nat.primeFactors`.

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A bound proved only away from a finite set does not certify an annihilator of the whole group.

**Sources.**

- [gross](#source-gross), Theorem 1.3, printed p.236; exceptional factor discussed on pp.236–239. The bound has exceptional constants, particularly powers of 2; the conjectural exact Sha index formula is not used.

<a id="rankzeroonebsd-bsd-8-mordell-weil-saturation-adapter"></a>

### Certified free lattice and saturation index

`RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter` · comparison.

For actual points P₁,…,P_r on E/ℚ, a certified rank bound and linear independence identify their subgroup as finite index, not as the full Mordell–Weil free lattice. A proved height bound plus finite complete search, or certified q-saturation for every prime dividing a proved index bound, supplies the exact index I_free. In rank one h_BSD(P)=I_free²Reg_BSD(E), while [E(ℚ):ℤP]=I_free·#tors.

**Hypotheses.**

- Actual points and torsion subgroup; exact rank r; a proved height/index bound and a complete finite enumeration or all required saturation proofs.

**Proof route.**

1. Import EllipticCurves Layer 6’s saturation and height-comparison algorithms, with their termination bounds.
2. Use Cremona Proposition 3.5.1’s explicit height comparison to bound possible divisors/generators; exclude them by exact rational arithmetic and a complete search.
3. Apply BSD.5’s free-index height identity with GZ.0’s BSD regulator normalization.

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`; [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula); `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Replacing a generator by 2P multiplies its height by 4 but does not change Reg_BSD of the full lattice.

**Sources.**

- [cremona3](#source-cremona3), §3.5, Proposition 3.5.1 and rank-one generator criterion. A rank-one point is not certified as a generator from its nonzero height alone.

<a id="rankzeroonebsd-bsd-8-local-tamagawa-certificate-adapter"></a>

### Local Tamagawa certificate adapter

`RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter` · comparison.

For the actual integral minimal models at every bad prime ℓ of E, a verified Tate-algorithm trace determines the reduction type, conductor exponent and component-group order c_ℓ. The finite Tamagawa product is over the support of the minimal discriminant; every good-prime factor is one. Dyadic, ternary and additive cases use their own residue-characteristic branches and exact minimality proofs.

**Hypotheses.**

- Integral models with certified local minimality and a complete bad-prime list; exact Tate-algorithm traces including ℓ=2,3.

**Proof route.**

1. Import EllipticCurves Layer 4 and Néron-model component groups rather than defining c_ℓ by a table.
2. Replay each integral coordinate change and residue calculation; identify the component group cardinality, not only its Kodaira symbol.
3. Prove all primes outside the discriminant support have good reduction and c_ℓ=1, then form the finite product.

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `mathlib:Nat.primeFactors`.

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- An additive prime at 2 is not certified by the ℓ≥5 table.

**Sources.**

- [cremona3](#source-cremona3), §3.2 Tate algorithm and local information. The adapter consumes an exact local trace with small-characteristic branches.

<a id="rankzeroonebsd-bsd-8-local-isogeny-certificate-adapter"></a>

### Exact local isogeny comparison

`RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter` · comparison.

For an actual ℚ-isogeny φ:E→E′ and its dual, certified kernel, cokernel and differential indices at each relevant place, with global Mordell–Weil/torsion and Sha terms, verify the Cassels arithmetic quotient comparison. Transport a proved p-part/full certificate via BSD.5’s bsdDefect-isogeny invariance. The local data are not replaced by isogeny degree alone, especially at p dividing deg φ and at additive or dyadic places.

**Hypotheses.**

- Actual isogeny and dual; exact finite local/global index calculations and the source’s finite-Sha hypotheses.

**Proof route.**

1. Import EllipticCurves Layers 1/4/7’s differential, local Kummer and Cassels comparison APIs.
2. Compute local cokernels and kernel orders on the actual models, with Néron differential pullback and full real components.
3. Use defect-isogeny-invariance, which combines the arithmetic comparison with equality of all analytic local factors.

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; [RankZeroOneBSD:BSD.5/defect-isogeny-invariance](#rankzeroonebsd-bsd-5-defect-isogeny-invariance).

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Isogenous curves may have different torsion and Tamagawa numbers and different real periods.

**Sources.**

- [wuthrich](#source-wuthrich), Lemma 17, p.398; Theorem 4 lattice construction. The arithmetic and analytic period changes must match integrally.

<a id="rankzeroonebsd-bsd-8-exceptional-prime-part-adapter"></a>

### Exceptional-prime leading-term certificate adapter

`RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter` · comparison.

For a specific E and a prime p excluded from the available named prime-part theorems, exact rational leading-term/period/regulator comparison, finite Sha/descent data, torsion order and all local Tamagawa factors compute v_p(bsdDefect E). A valuation-zero conclusion requires the computed equality, including p=2,3 or bad/additive p. Such data are certificate producers for a curve or specified family; they are not a uniform all-E exceptional-prime theorem.

**Hypotheses.**

- Actual positive rational defect and exact analytic rational quotient; certified whole-Sha p-primary data, torsion, free lattice and local invariants.

**Proof route.**

1. At rank zero import BSD.5 modular-symbol rationality and its actual period comparison; at rank one import its Gross–Zagier/free-index rationality.
2. Use sha-annihilator-adapter, mordell-weil-saturation-adapter and local-tamagawa-certificate-adapter, or an exact isogeny transfer with all indices verified.
3. Apply torsion-square-valuation and exact integer factorization; produce a proof that the resulting integer is zero rather than a numerical approximation to the real leading term.

**Inputs.** [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect); [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality); [RankZeroOneBSD:BSD.5/rank-one-rationality](#rankzeroonebsd-bsd-5-rank-one-rationality); [RankZeroOneBSD:BSD.8/sha-annihilator-adapter](#rankzeroonebsd-bsd-8-sha-annihilator-adapter); [RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter](#rankzeroonebsd-bsd-8-mordell-weil-saturation-adapter); [RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter](#rankzeroonebsd-bsd-8-local-tamagawa-certificate-adapter); [RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter](#rankzeroonebsd-bsd-8-local-isogeny-certificate-adapter); [RankZeroOneBSD:BSD.8/torsion-square-valuation](#rankzeroonebsd-bsd-8-torsion-square-valuation).

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A database’s analytic Sha order is not admitted as a finite-Sha proof.

**Sources.**

- [roadmap](#source-roadmap), BSD.8 exceptional-prime contract. Exact arithmetic producers discharge primes outside the named theorem ranges.

<a id="rankzeroonebsd-bsd-8-source-qualified-prime-part-dispatch"></a>

### Source-qualified fixed-prime dispatch

`RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch` · application.

For an actual curve E of analytic rank at most one and a prime p, a verified instance of a named BSD.6 branch, cgs-eisenstein-prime-bsd, ky-eisenstein-prime-bsd, or exceptional-prime-part-adapter proves v_p(bsdDefect E)=0. The instance includes every source hypothesis; no disjunction is discharged by an unproved blanket claim that p is good, large or irreducible.

**Hypotheses.**

- E actual elliptic; analyticRank E≤1; p prime; one exact source-qualified branch or a complete arithmetic certificate applies.

**Proof route.**

1. Match the actual residual representation/isogeny and local reduction to the chosen source branch.
2. Apply its defect-valuation conclusion and normalize it through BSD.5.
3. Retain the branch witness as the provenance for the finite certificate entry.

**Inputs.** [RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part](#rankzeroonebsd-bsd-6-rank-zero-ordinary-multiplicative-p-part); [RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part](#rankzeroonebsd-bsd-6-rank-zero-supersingular-p-part); [RankZeroOneBSD:BSD.6/jsw-rank-one-p-part](#rankzeroonebsd-bsd-6-jsw-rank-one-p-part); [RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part](#rankzeroonebsd-bsd-6-castella-multiplicative-rank-one-p-part); [RankZeroOneBSD:BSD.6/bstw-rank-one-p-part](#rankzeroonebsd-bsd-6-bstw-rank-one-p-part); [RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd](#rankzeroonebsd-bsd-7-cgs-eisenstein-prime-bsd); [RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd](#rankzeroonebsd-bsd-7-ky-eisenstein-prime-bsd); [RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter](#rankzeroonebsd-bsd-8-exceptional-prime-part-adapter); [RankZeroOneBSD:BSD.5/rational-bsd-defect](#rankzeroonebsd-bsd-5-rational-bsd-defect).

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Good irreducible reduction alone is insufficient for the rank-zero ramification-qualified branch.

**Sources.**

- [roadmap](#source-roadmap), BSD.6–BSD.8 named branches. Every fixed-prime certificate has an identified proof range.

<a id="rankzeroonebsd-bsd-8-individual-full-bsd-from-exceptions"></a>

### Individual full BSD from a finite exceptional set

`RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions` · theorem.

For an actual E/ℚ with analyticRank E≤1, let S be an explicit finite set of primes. Prove v_p(bsdDefect E)=0 for every p∈S, and prove the same for every prime p∉S using source-qualified theorem ranges or a certified arithmetic bound. Then the exact leading-term BSD formula holds for E. The outside theorem proves support coverage; alternatively supply the canonical numerator/denominator support cover directly. Both constructions require every listed localZero proof.

**Hypotheses.**

- S finite, all members prime; actual defect positivity; all inside and all outside valuations vanish.

**Proof route.**

1. Use certificate-from-exceptions to prove the actual support lies in S; no unverified support field remains.
2. Apply elliptic-endpoint to the resulting complete certificate.
3. When the outside range is p>B, include every prime ≤B together with all other named exclusions; simply recording “sufficiently large” is not an outside proof for a supplied S.

**Inputs.** [RankZeroOneBSD:BSD.8/certificate-from-exceptions](#rankzeroonebsd-bsd-8-certificate-from-exceptions); [RankZeroOneBSD:BSD.8/elliptic-endpoint](#rankzeroonebsd-bsd-8-elliptic-endpoint); [RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch](#rankzeroonebsd-bsd-8-source-qualified-prime-part-dispatch).

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Omitting a possibly nonzero dyadic valuation blocks this theorem.

**Sources.**

- [roadmap](#source-roadmap), BSD.8 full-formula assembly. The complete finite certificate is the final logical gate.

<a id="rankzeroonebsd-bsd-8-family-full-bsd-from-certificates"></a>

### Full BSD for an explicitly certified family

`RankZeroOneBSD:BSD.8/family-full-bsd-from-certificates` · theorem.

For a specified parameter type A and an actual elliptic curve E_a/ℚ for each a, if every E_a has analyticRank≤1 and a supplied complete Rat.PrimeValuationCertificate for bsdDefect E_a, then the full leading-term formula holds for every a. If S_a and source-qualified inside/outside proofs construct the certificate, they may depend on a. No uniform theorem on all residual exceptional primes is assumed.

**Hypotheses.**

- A specified family of actual curves; proved rank bound and complete certificate for each parameter.

**Proof route.**

1. Apply individual-full-bsd-from-exceptions or elliptic-endpoint pointwise.
2. Expose the parameter-dependent bad-prime set, reduction/isogeny data, and certified exceptional valuations in the family theorem’s hypotheses.

**Inputs.** [RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions](#rankzeroonebsd-bsd-8-individual-full-bsd-from-exceptions); [RankZeroOneBSD:BSD.8/elliptic-endpoint](#rankzeroonebsd-bsd-8-elliptic-endpoint).

**Suggested home.** `TauCeti/NumberTheory/BSD/PrimeCertificates`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A theorem proving only all sufficiently large p for every a does not satisfy this contract.

**Sources.**

- [roadmap](#source-roadmap), BSD.8 individual/family boundary. The quantified certificate is part of the family proof, not a predicted global BSD theorem.

## BSD.9 — Models, rigorous fixtures and regressions

Use the actual coefficient tuples for 11a3, 37a1 and 32a2, together with actual point constructors and order checks. The 11a3 model is not the optimal 11a1 model; its real period is five times that of 11a1, and its torsion square gives the central quotient 1/25. The eighth multiple on 37a1 proves non-torsion, not saturation. The CM/additive 32a2 model retains its dyadic Tamagawa factor. Mellin tail bounds and validated elementary-function intervals are combined with finite arithmetic certificates. The positive and negative dyadic defects test that odd-prime equalities alone cannot finish BSD.

**Planets:** Rational torsion at an Eisenstein prime ([declaration](#rankzeroonebsd-bsd-9-fixture-11-good-five)); CM curve with additive reduction ([declaration](#rankzeroonebsd-bsd-9-fixture-32-cm-additive)); Certified rank zero and one examples ([declaration](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures)).

<a id="rankzeroonebsd-bsd-9-away-from-prime"></a>

### A prime defect is invisible at every other prime

`RankZeroOneBSD:BSD.9/away-from-prime` · lemma.

For distinct primes p and ell, the rational number p has valuation zero at ell.

**Hypotheses.**

- p and ell are primes.
- p is different from ell.

**Proof route.**

1. Nat.Prime.dvd_iff_eq implies ell does not divide p, since ell is not one and the primes differ.
2. Apply padicValNat.eq_zero_of_not_dvd, then padicValRat.of_nat.

**Inputs.** `mathlib:Nat.Prime.dvd_iff_eq`; `mathlib:padicValNat.eq_zero_of_not_dvd`; `mathlib:padicValRat.of_nat`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- With p=2 this verifies all odd-prime checks even though the rational defect is not one. With p=3 the same issue affects an omitted triadic check.

**Sources.**

- [mathlib-prime-basic](#source-mathlib-prime-basic), Nat.Prime.dvd_iff_eq. Different primes cannot divide one another.
- [mathlib-padic](#source-mathlib-padic), padicValRat.of_nat. Move the divisibility calculation to the rational valuation.

<a id="rankzeroonebsd-bsd-9-prime-obstruction"></a>

### No complete certificate for a prime defect

`RankZeroOneBSD:BSD.9/prime-obstruction` · application.

For every prime p, Rat.PrimeValuationCertificate(p), where p is cast to Q, is uninhabited.

**Hypotheses.**

- p is prime.

**Proof route.**

1. Suppose a certificate were supplied. The rational p is positive, so certificate-reconstruction would give p=1. Primality gives p>1, a contradiction.

**Inputs.** [RankZeroOneBSD:BSD.8/certificate-reconstruction](#rankzeroonebsd-bsd-8-certificate-reconstruction).

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- Combine with away-from-prime for p=2: all odd-prime checks pass, but no complete certificate exists. The primitive baseline padicValRat.self gives the missing valuation as one.

**Sources.**

- [roadmap](#source-roadmap), BSD.9 acceptance tests. A rational countermodel tests the logical gate; it is not an elliptic curve or a claim about its Sha.

<a id="rankzeroonebsd-bsd-9-dyadic-gate"></a>

### The remaining dyadic equality under all odd-prime equalities

`RankZeroOneBSD:BSD.9/dyadic-gate` · comparison.

For strictly positive q in Q, assume v_p(q)=0 for every odd prime p. Then q=1 if and only if v_2(q)=0.

**Hypotheses.**

- q is strictly positive.
- All odd-prime valuations of q vanish.

**Proof route.**

1. Use Nat.forall_prime_iff_two_and_odd to combine the supplied odd-prime results with a dyadic equality, or extract that equality from all-prime vanishing.
2. Apply positive-rational-reconstruction in both directions.

**Inputs.** [RankZeroOneBSD:BSD.8/positive-rational-reconstruction](#rankzeroonebsd-bsd-8-positive-rational-reconstruction); `mathlib:Nat.forall_prime_iff_two_and_odd`.

**Suggested home.** `TauCeti/NumberTheory/Padics/RationalCertificates`; namespace `Rat`.

**Acceptance.**

- For q=2 and q=1/4 the dyadic hypothesis fails although every odd-prime test succeeds. For q=1 both sides hold.

**Sources.**

- [mathlib-prime-basic](#source-mathlib-prime-basic), forall_prime_iff_two_and_odd. Instantiate the existing prime split with vanishing of the rational valuation.

<a id="rankzeroonebsd-bsd-9-fixture-11"></a>

### Concrete 11a3 Weierstrass model

`RankZeroOneBSD:BSD.9/fixture-11` · definition.

Define fixture11 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,−1,1,0,0). Its invariants are Δ=−11, c₄=16 and j=−4096/11. It is nonsingular and supplies the rank zero with rational 5-torsion test. Labels are descriptive; changing the model changes the period and differential data.

**Proof route.**

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

**Inputs.** `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.Δ`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 analytic and arithmetic comparisons: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture11_coefficients` | characterisation | (a₁,a₂,a₃,a₄,a₆)=(0,−1,1,0,0) |
| `WeierstrassCurve.BSD.fixture11_discriminant` | simp | Δ=−11 |
| `WeierstrassCurve.BSD.fixture11_elliptic` | simp | fixture11.IsElliptic |
| `WeierstrassCurve.BSD.fixture11_origin_nonsingular` | simp | fixture11.toAffine.Nonsingular 0 0 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture11_test_equation` |  | (0,0) satisfies y²+y=x³−x² |
| `WeierstrassCurve.BSD.fixture11_test_not_optimal_model` |  | a₄=0, a₆=0; this is 11a3, not 11a1 |
| `WeierstrassCurve.BSD.fixture11_test_real_components` |  | Δ<0, so c∞=1 |

**Acceptance.**

- Exact rational arithmetic distinguishes the models and proves Δ≠0.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-fixture-11-discriminant"></a>

### 11a3 discriminant calculation

`RankZeroOneBSD:BSD.9/fixture-11-discriminant` · lemma.

The actual coefficient polynomial gives fixture11.Δ=−11.

**Proof route.**

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11](#rankzeroonebsd-bsd-9-fixture-11); `mathlib:WeierstrassCurve.Δ`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The result is nonzero and has the stated sign.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-fixture-11-elliptic"></a>

### 11a3 ellipticity and affine point domain

`RankZeroOneBSD:BSD.9/fixture-11-elliptic` · lemma.

fixture11 is elliptic and fixture11.toAffine.Nonsingular 0 0 holds.

**Proof route.**

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11-discriminant](#rankzeroonebsd-bsd-9-fixture-11-discriminant); `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A proof of Equation alone does not construct a Mathlib affine point.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-fixture-37"></a>

### Concrete 37a1 Weierstrass model

`RankZeroOneBSD:BSD.9/fixture-37` · definition.

Define fixture37 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,0,1,−1,0). Its invariants are Δ=37, c₄=48 and j=110592/37. It is nonsingular and supplies the rank one with a certified free generator test. Labels are descriptive; changing the model changes the period and differential data.

**Proof route.**

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

**Inputs.** `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.Δ`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 analytic and arithmetic comparisons: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture37_coefficients` | characterisation | (a₁,a₂,a₃,a₄,a₆)=(0,0,1,−1,0) |
| `WeierstrassCurve.BSD.fixture37_discriminant` | simp | Δ=37 |
| `WeierstrassCurve.BSD.fixture37_elliptic` | simp | fixture37.IsElliptic |
| `WeierstrassCurve.BSD.fixture37_origin_nonsingular` | simp | fixture37.toAffine.Nonsingular 0 0 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture37_test_equation` |  | (0,0) satisfies y²+y=x³−x |
| `WeierstrassCurve.BSD.fixture37_test_positive_discriminant` |  | Δ>0, so c∞=2 |
| `WeierstrassCurve.BSD.fixture37_test_distinct_from_11` |  | a₂=0 and Δ=37, excluding the rank-zero fixture |

**Acceptance.**

- Exact rational arithmetic distinguishes the models and proves Δ≠0.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.
- [gross](#source-gross), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

<a id="rankzeroonebsd-bsd-9-fixture-37-discriminant"></a>

### 37a1 discriminant calculation

`RankZeroOneBSD:BSD.9/fixture-37-discriminant` · lemma.

The actual coefficient polynomial gives fixture37.Δ=37.

**Proof route.**

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-37](#rankzeroonebsd-bsd-9-fixture-37); `mathlib:WeierstrassCurve.Δ`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The result is nonzero and has the stated sign.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.
- [gross](#source-gross), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

<a id="rankzeroonebsd-bsd-9-fixture-37-elliptic"></a>

### 37a1 ellipticity and affine point domain

`RankZeroOneBSD:BSD.9/fixture-37-elliptic` · lemma.

fixture37 is elliptic and fixture37.toAffine.Nonsingular 0 0 holds.

**Proof route.**

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-37-discriminant](#rankzeroonebsd-bsd-9-fixture-37-discriminant); `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A proof of Equation alone does not construct a Mathlib affine point.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.
- [gross](#source-gross), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

<a id="rankzeroonebsd-bsd-9-fixture-32"></a>

### Concrete 32a2 Weierstrass model

`RankZeroOneBSD:BSD.9/fixture-32` · definition.

Define fixture32 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,0,0,−1,0). Its invariants are Δ=64, c₄=48 and j=1728. It is nonsingular and supplies the CM and additive dyadic reduction test. Labels are descriptive; changing the model changes the period and differential data.

**Proof route.**

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

**Inputs.** `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.Δ`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 analytic and arithmetic comparisons: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture32_coefficients` | characterisation | (a₁,a₂,a₃,a₄,a₆)=(0,0,0,−1,0) |
| `WeierstrassCurve.BSD.fixture32_discriminant` | simp | Δ=64 |
| `WeierstrassCurve.BSD.fixture32_elliptic` | simp | fixture32.IsElliptic |
| `WeierstrassCurve.BSD.fixture32_origin_nonsingular` | simp | fixture32.toAffine.Nonsingular 0 0 |
| `WeierstrassCurve.BSD.fixture32_j` | simp | j=1728 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.fixture32_test_three_two_torsion_roots` |  | x³−x has the three distinct rational roots −1,0,1 |
| `WeierstrassCurve.BSD.fixture32_test_dyadic_discriminant` |  | v₂(Δ)=6, while c₄=48 |
| `WeierstrassCurve.BSD.fixture32_test_real_components` |  | Δ>0, so c∞=2 |

**Acceptance.**

- Exact rational arithmetic distinguishes the models and proves Δ≠0.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-fixture-32-discriminant"></a>

### 32a2 discriminant calculation

`RankZeroOneBSD:BSD.9/fixture-32-discriminant` · lemma.

The actual coefficient polynomial gives fixture32.Δ=64.

**Proof route.**

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-32](#rankzeroonebsd-bsd-9-fixture-32); `mathlib:WeierstrassCurve.Δ`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The result is nonzero and has the stated sign.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-fixture-32-elliptic"></a>

### 32a2 ellipticity and affine point domain

`RankZeroOneBSD:BSD.9/fixture-32-elliptic` · lemma.

fixture32 is elliptic and fixture32.toAffine.Nonsingular 0 0 holds.

**Proof route.**

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-32-discriminant](#rankzeroonebsd-bsd-9-fixture-32-discriminant); `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.Affine.Nonsingular`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A proof of Equation alone does not construct a Mathlib affine point.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

<a id="rankzeroonebsd-bsd-9-point-11"></a>

### Actual 11 fixture point

`RankZeroOneBSD:BSD.9/point-11` · definition.

Define point11 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-11-elliptic. Its additive order is 5 (zero denotes infinite order). Addition gives 2P=(1,−1), 3P=(1,0), 4P=(0,−1), 5P=O.

**Proof route.**

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11-elliptic](#rankzeroonebsd-bsd-9-fixture-11-elliptic); `mathlib:WeierstrassCurve.Affine.Point`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 rank, torsion and saturation comparisons: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point11_nonzero` | characterisation | P≠O |
| `WeierstrassCurve.BSD.point11_order` | characterisation | addOrderOf P=5 |
| `WeierstrassCurve.BSD.point11_coordinates` | characterisation | P is the actual point (0,0) on fixture11 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point11_test_double` |  | 2P=(1,−1) |
| `WeierstrassCurve.BSD.point11_test_order_five` |  | 5P=O and P≠O |
| `WeierstrassCurve.BSD.point11_test_not_two_torsion` |  | 2P≠O |

**Acceptance.**

- All points and multiples refer to the specified model.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

<a id="rankzeroonebsd-bsd-9-point-11-order"></a>

### Order of the 11 fixture point

`RankZeroOneBSD:BSD.9/point-11-order` · lemma.

For the actual point11, addOrderOf point11=5.

**Proof route.**

1. Use the concrete multiples and nonidentity tests of point-11.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

**Inputs.** [RankZeroOneBSD:BSD.9/point-11](#rankzeroonebsd-bsd-9-point-11); `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Infinite order is distinguished from a missing order calculation.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

<a id="rankzeroonebsd-bsd-9-point-37"></a>

### Actual 37 fixture point

`RankZeroOneBSD:BSD.9/point-37` · definition.

Define point37 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-37-elliptic. Its additive order is 0 (zero denotes infinite order). Addition gives 2P=(1,0), 3P=(−1,−1), 4P=(2,−3); x(8P)=21/25; under X=4x,Y=8y+4 on Y²=X³−16X+16, X(8P)=84/25.

**Proof route.**

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-37-elliptic](#rankzeroonebsd-bsd-9-fixture-37-elliptic); `mathlib:WeierstrassCurve.Affine.Point`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 rank, torsion and saturation comparisons: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point37_nonzero` | characterisation | P≠O |
| `WeierstrassCurve.BSD.point37_order` | characterisation | addOrderOf P=0 (infinite order) |
| `WeierstrassCurve.BSD.point37_coordinates` | characterisation | P is the actual point (0,0) on fixture37 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point37_test_double` |  | 2P=(1,0) |
| `WeierstrassCurve.BSD.point37_test_infinite_order` |  | 8P has x-coordinate 21/25; the explicit short integral model has X(8P)=84/25, so Lutz–Nagell excludes torsion |
| `WeierstrassCurve.BSD.point37_test_not_torsion_generator` |  | No nonzero integer multiple of P is O |

**Acceptance.**

- All points and multiples refer to the specified model.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.
- [gross](#source-gross), Printed p.236, E(ℚ)=ℤP and P=(0,0). The example identifies a free generator; the blueprint also requires replayable saturation.

<a id="rankzeroonebsd-bsd-9-point-37-order"></a>

### Order of the 37 fixture point

`RankZeroOneBSD:BSD.9/point-37-order` · lemma.

For the actual point37, addOrderOf point37=0.

**Proof route.**

1. Use the concrete multiples and nonidentity tests of point-37.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

**Inputs.** [RankZeroOneBSD:BSD.9/point-37](#rankzeroonebsd-bsd-9-point-37); `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Infinite order is distinguished from a missing order calculation.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.
- [gross](#source-gross), Printed p.236, E(ℚ)=ℤP and P=(0,0). The example identifies a free generator; the blueprint also requires replayable saturation.

<a id="rankzeroonebsd-bsd-9-point-32"></a>

### Actual 32 fixture point

`RankZeroOneBSD:BSD.9/point-32` · definition.

Define point32 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-32-elliptic. Its additive order is 2 (zero denotes infinite order). Addition gives 2P=O; the other nonzero rational 2-torsion points are (1,0),(−1,0).

**Proof route.**

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-32-elliptic](#rankzeroonebsd-bsd-9-fixture-32-elliptic); `mathlib:WeierstrassCurve.Affine.Point`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Uses.**

- BSD.9 rank, torsion and saturation comparisons: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point32_nonzero` | characterisation | P≠O |
| `WeierstrassCurve.BSD.point32_order` | characterisation | addOrderOf P=2 |
| `WeierstrassCurve.BSD.point32_coordinates` | characterisation | P is the actual point (0,0) on fixture32 |

**Unit tests.**

| Name | Kind | Expected statement |
| --- | --- | --- |
| `WeierstrassCurve.BSD.point32_test_double_zero` |  | 2P=O |
| `WeierstrassCurve.BSD.point32_test_three_distinct_points` |  | (−1,0),(0,0),(1,0) are distinct nonzero 2-torsion points |
| `WeierstrassCurve.BSD.point32_test_sum_two_other_points` |  | (1,0)+(−1,0)=P |

**Acceptance.**

- All points and multiples refer to the specified model.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

<a id="rankzeroonebsd-bsd-9-point-32-order"></a>

### Order of the 32 fixture point

`RankZeroOneBSD:BSD.9/point-32-order` · lemma.

For the actual point32, addOrderOf point32=2.

**Proof route.**

1. Use the concrete multiples and nonidentity tests of point-32.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

**Inputs.** [RankZeroOneBSD:BSD.9/point-32](#rankzeroonebsd-bsd-9-point-32); `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `mathlib:orderOf`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Infinite order is distinguished from a missing order calculation.

**Sources.**

- [cremona3](#source-cremona3), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

<a id="rankzeroonebsd-bsd-9-fixture-11-good-five"></a>

### Rational five-torsion theorem-range test

`RankZeroOneBSD:BSD.9/fixture-11-good-five` · theorem.

fixture11 has good ordinary reduction at p=5, with #E(𝔽₅)=5 and a₅=1, and the actual point11 gives a rational cyclic 5-isogeny kernel. Its character is 1 at G₅. Therefore Keller–Yin’s good Eisenstein hypotheses apply and CGS’s local exclusion fails. Once the certified rank-zero analytic bound is supplied, the 5-part of the actual BSD defect vanishes by ky-eisenstein-prime-bsd.

**Proof route.**

1. Reduce the nonsingular model modulo 5; enumerate its four affine points and O exactly.
2. Use point-11-order to construct the rational kernel/isogeny via EllipticCurves Layer 1, and read the trivial Galois action.
3. Apply ky-eisenstein-prime-bsd with analytic-fixture-enclosures. Check Δ=−11 gives good reduction and a₅ is a 5-adic unit.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11-discriminant](#rankzeroonebsd-bsd-9-fixture-11-discriminant); [RankZeroOneBSD:BSD.9/point-11-order](#rankzeroonebsd-bsd-9-point-11-order); [RankZeroOneBSD:BSD.9/analytic-fixture-enclosures](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures); [RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd](#rankzeroonebsd-bsd-7-ky-eisenstein-prime-bsd); `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- No local torsion-free control formula may be substituted in this example.

**Sources.**

- [ky](#source-ky), §0.3, p.5, example 11a3; Theorem C. A rational p-torsion example is in KY’s range and out of CGS’s local range.

<a id="rankzeroonebsd-bsd-9-fixture-32-cm-additive"></a>

### CM and additive dyadic fixture

`RankZeroOneBSD:BSD.9/fixture-32-cm-additive` · theorem.

For fixture32, exact local minimality and the dyadic Tate algorithm give conductor 32, Kodaira type III at 2 and c₂=2; all other c_ℓ=1. The automorphism (x,y)↦(−x,iy) over ℚ(i) squares to [−1], and the imported characteristic-zero endomorphism classification identifies End(E_ℚ̄)=ℤ[i]. Thus this actual CM curve is not semistable. Its full rational torsion group is (ℤ/2)², established from the three displayed points and reduction bounds.

**Proof route.**

1. Replay the residue-characteristic-two minimality and Tate-algorithm trace, not the ℓ≥5 classification.
2. Verify the automorphism on the actual equation, its group-law compatibility and square; use the CM endomorphism-ring theorem.
3. Combine point32 and the other two roots with prime-to-good-reduction torsion bounds at two odd good primes to exclude further rational torsion.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-32](#rankzeroonebsd-bsd-9-fixture-32); [RankZeroOneBSD:BSD.9/point-32-order](#rankzeroonebsd-bsd-9-point-32-order); [RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter](#rankzeroonebsd-bsd-8-local-tamagawa-certificate-adapter); `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; `ComplexMultiplicationAndExplicitReciprocity:CM.1`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The good-Eisenstein BSD theorem is not used at the bad prime 2.

**Sources.**

- [cremona-table1](#source-cremona-table1), Table 1, p.111, row 32A2. The additive dyadic trace and full torsion calculation must be certified separately from the table.

<a id="rankzeroonebsd-bsd-9-fixture-period-height-comparisons"></a>

### Fixture periods, heights and regulator conventions

`RankZeroOneBSD:BSD.9/fixture-period-height-comparisons` · comparison.

On fixture11, c∞=1, and on fixture37 and fixture32, c∞=2. Their actual BSD real periods are Ωfull=c∞Ωpositive. Rank zero gives Reg_BSD=1 using the existing Tau Ceti rank-zero regulator theorem; the convention adapter Reg_BSD=2^r Reg_Tau has no effect at r=0 and doubles the rank-one regulator. On fixture37, if point37 is a saturated generator, Reg_BSD=h_BSD(point37); replacing it by 2point37 multiplies the point height by four and must not replace the regulator of the full lattice.

**Hypotheses.**

- Actual rank certificates, invariant differentials, and a saturated free generator in rank one.

**Proof route.**

1. Use the discriminant signs with GZ.0 real-period-components.
2. Apply Tau Ceti’s regulator_eq_one_of_finrank_eq_zero under its actual finitely-generated PointModTorsion hypotheses; import GZ.0’s convention dictionary rather than replanning the regulator.
3. Use BSD.5’s free-index formula and rank-one saturation to compute the actual regulator; count c∞ only once.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11-discriminant](#rankzeroonebsd-bsd-9-fixture-11-discriminant); [RankZeroOneBSD:BSD.9/fixture-37-discriminant](#rankzeroonebsd-bsd-9-fixture-37-discriminant); [RankZeroOneBSD:BSD.9/fixture-32-discriminant](#rankzeroonebsd-bsd-9-fixture-32-discriminant); [RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter](#rankzeroonebsd-bsd-8-mordell-weil-saturation-adapter); `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`; `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`; `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A missing real-component factor is detected on both Δ>0 fixtures; a missing factor two in rank-one pairing is detected on fixture37.

**Sources.**

- [gross](#source-gross), Printed p.236, infinite cyclic rational group and free generator of the 37 curve. The convention dictionary, not a numerical height, supplies the factor in the BSD regulator.

<a id="rankzeroonebsd-bsd-9-mellin-central-tail-bounds"></a>

### Central Mellin formulas with explicit tails

`RankZeroOneBSD:BSD.9/mellin-central-tail-bounds` · lemma.

For the actual modular form of E of conductor N, write β=2π/√N, ρ=exp(−β) and a_n for its exact Fourier coefficients. If the root number is +1 then L(E,1)=2Σ_{n≥1}(a_n/n)exp(−βn). If it is −1 then L′(E,1)=2Σ_{n≥1}(a_n/n)E₁(βn), with E₁(x)=∫_x^∞exp(−t)/t dt. For |a_n|≤n² and a cutoff M, the absolute tails are bounded respectively by 2ρ^(M+1)((M+1)−Mρ)/(1−ρ)² and 2ρ^(M+1)/(β(1−ρ)). These concern the actual analytic continuation, never the raw Dirichlet series evaluated at 1.

**Hypotheses.**

- E modular, N>0, actual functional equation/root number; M≥0; exact coefficient bounds from Hasse and multiplicativity.

**Proof route.**

1. Import the modularity/functional-equation and actual-L interfaces. Split the Mellin transform at 1/√N and substitute the functional equation, keeping its sign convention.
2. Differentiate the completed Mellin formula in the sign −1 case; use Cremona Proposition 2.13.1, whose E₁ is the indicated integral.
3. Bound E₁(x)≤exp(−x)/x for x>0; sum Σ_{n>M}nρ^n and Σ_{n>M}ρ^n explicitly. Hasse plus multiplicativity gives |a_n|≤d(n)√n≤n².

**Inputs.** [RankZeroOneBSD:BSD.0/actual-l-function](#rankzeroonebsd-bsd-0-actual-l-function); [RankZeroOneBSD:BSD.0/completed-l-function](#rankzeroonebsd-bsd-0-completed-l-function); `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Swapping the root-number sign swaps the value and derivative formulas and fails the fixture test.

**Sources.**

- [cremona2](#source-cremona2), §§2.8,2.12 and Proposition 2.13.1, pp.41–45. The exponential-integral formula and explicit tails turn truncation into a proof obligation.

<a id="rankzeroonebsd-bsd-9-analytic-fixture-enclosures"></a>

### Certified central values for the three fixtures

`RankZeroOneBSD:BSD.9/analytic-fixture-enclosures` · theorem.

Replay exact rational interval certificates for the actual L-functions of fixture11, fixture37 and fixture32: 1/4<L(fixture11,1)<3/10, 1/4<L′(fixture37,1)<1/3 and 3/5<L(fixture32,1)<7/10. Their root numbers are respectively +1,−1,+1; the second sign forces L(fixture37,1)=0. The bounds then prove analytic ranks 0,1,0. The listed intervals are acceptance targets, not claims of completed interval proofs.

**Hypotheses.**

- Exact modular-form identification, conductor/root-number certificates and rigorous interval replay for π, square roots, exponentials and E₁ at each finite argument.

**Proof route.**

1. Use the exact coefficient recurrence and finite-field point counts through a cutoff such as M=40, including the bad-prime coefficient cases.
2. Evaluate each finite sum using outward rational enclosures for elementary functions and a proved E₁ quadrature/tail bound; add mellin-central-tail-bounds. Record the rational bounds and all rounding errors in the certificate.
3. Use the BSD.0 analytic-rank definition and the functional equation to conclude the orders of vanishing. A floating-point sum is only a diagnostic.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11](#rankzeroonebsd-bsd-9-fixture-11); [RankZeroOneBSD:BSD.9/fixture-37](#rankzeroonebsd-bsd-9-fixture-37); [RankZeroOneBSD:BSD.9/fixture-32](#rankzeroonebsd-bsd-9-fixture-32); [RankZeroOneBSD:BSD.9/mellin-central-tail-bounds](#rankzeroonebsd-bsd-9-mellin-central-tail-bounds); [RankZeroOneBSD:BSD.0/analytic-rank](#rankzeroonebsd-bsd-0-analytic-rank); `ComputationalNumberTheory:CN.4`.

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Certificates must enclose every finite-sum error and the infinite tail; no raw LSeries at 1 or decimal nonzero test is allowed.

**Sources.**

- [cremona-examples](#source-cremona-examples), N=11 and N=37 worked computations; compare Chapter 2 §2.13. Published decimal output selects broad target intervals but does not certify nonvanishing.

<a id="rankzeroonebsd-bsd-9-fixture-finite-arithmetic"></a>

### Finite descent and saturation for the three fixtures

`RankZeroOneBSD:BSD.9/fixture-finite-arithmetic` · theorem.

Construct replayable arithmetic certificates for fixture11, fixture37 and fixture32 proving respectively rank/torsion/Tamagawa data (0,5,1), (1,1,1), (0,4,2), with point37 a saturated free generator. A full-Sha certificate additionally supplies a proved annihilator B of the whole Sha group and complete Selmer presentations for every p^n needed by B; the target Sha order is 1 in each fixture. This target must be derived, not read from analytic-Sha tables. If an annihilator or a primary presentation is absent, only the certified primary components are output.

**Hypotheses.**

- Actual models and points; exact local traces, descent presentations, rank and saturation bounds; a proved whole-Sha exponent bound for any whole-Sha assertion.

**Proof route.**

1. Use analytic-fixture-enclosures and BSD.4 for rank equality and whole-Sha finiteness, but not an effective exponent bound.
2. Apply the Selmer-cardinality and Sha-annihilator adapters to each required p^n; finite Selmer computations with an unproved exponent do not finish this step.
3. Replay local-tamagawa-certificate-adapter and the torsion/reduction computations; use mordell-weil-saturation-adapter on point37.
4. Gross Theorem 1.3 bounds Sha by tI² with exceptional power of 2; retain that factor, and use actual 2-primary descent if necessary. Gross Conjecture 1.2 is not used as a theorem.

**Inputs.** [RankZeroOneBSD:BSD.9/analytic-fixture-enclosures](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures); [RankZeroOneBSD:BSD.9/point-11-order](#rankzeroonebsd-bsd-9-point-11-order); [RankZeroOneBSD:BSD.9/point-37-order](#rankzeroonebsd-bsd-9-point-37-order); [RankZeroOneBSD:BSD.9/fixture-32-cm-additive](#rankzeroonebsd-bsd-9-fixture-32-cm-additive); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem); [RankZeroOneBSD:BSD.8/selmer-cardinality-adapter](#rankzeroonebsd-bsd-8-selmer-cardinality-adapter); [RankZeroOneBSD:BSD.8/sha-annihilator-adapter](#rankzeroonebsd-bsd-8-sha-annihilator-adapter); [RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter](#rankzeroonebsd-bsd-8-mordell-weil-saturation-adapter); [RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter](#rankzeroonebsd-bsd-8-local-tamagawa-certificate-adapter).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- A 2-Selmer rank bound alone does not certify the odd primary components or the whole Sha order.

**Sources.**

- [gross](#source-gross), Printed pp.235–239, Conjecture 1.2 versus Theorem 1.3. The power-of-two qualification must survive into the whole-Sha certificate.

<a id="rankzeroonebsd-bsd-9-fixture-11-isogeny-period"></a>

### Five-isogeny and torsion-square comparison

`RankZeroOneBSD:BSD.9/fixture-11-isogeny-period` · comparison.

For fixture11=11a3 and the actual optimal curve 11a1, construct the cyclic five-isogeny and dual. With minimal Néron differentials and full real periods, verify Ω(11a3)=5Ω(11a1), c₁₁(11a3)=1, c₁₁(11a1)=5 and both rational torsion orders 5. The exact modular-symbol ratio L(11a1,1)/Ω(11a1)=1/5 then gives L(fixture11,1)/Ω(fixture11)=1/25. The arithmetic quotient has the same change; the p=5 torsion-square denominator cannot be dropped.

**Hypotheses.**

- Actual isogeny/differential and local/global index certificates on both models; exact modular-symbol period comparison.

**Proof route.**

1. Use point11’s kernel with EllipticCurves Layer 1; replay the isogeny formulas, minimal differential scaling and map on real components.
2. Import the exact N=11 modular-symbol computation and verify its optimal-model period; transport it through the actual isogeny.
3. Use local-isogeny-certificate-adapter and torsion-square-valuation. The two ratios are exact; decimal period ratios are insufficient.

**Inputs.** [RankZeroOneBSD:BSD.9/point-11-order](#rankzeroonebsd-bsd-9-point-11-order); [RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter](#rankzeroonebsd-bsd-8-local-isogeny-certificate-adapter); [RankZeroOneBSD:BSD.8/torsion-square-valuation](#rankzeroonebsd-bsd-8-torsion-square-valuation); `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; [RankZeroOneBSD:BSD.5/rank-zero-rationality](#rankzeroonebsd-bsd-5-rank-zero-rationality).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Replacing torsion² by torsion changes the predicted 5-adic valuation by one; deleting torsion changes it by two.

**Sources.**

- [cremona-examples](#source-cremona-examples), N=11 worked example, period and L-value. The optimal curve’s ratio must be transferred to the specific isogenous fixture.

<a id="rankzeroonebsd-bsd-9-rank-equality-example"></a>

### Rank equality comparison example

`RankZeroOneBSD:BSD.9/rank-equality-example` · application.

The actual fixtures have algebraic/analytic ranks 0,1,0 by applying BSD.4 to the certified analytic bounds.

**Hypotheses.**

- The exact certificates and source hypotheses listed by the prerequisite nodes.

**Proof route.**

1. Apply the imported rank theorem to each actual curve.

**Inputs.** [RankZeroOneBSD:BSD.9/analytic-fixture-enclosures](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

**Sources.**

- [roadmap](#source-roadmap), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

<a id="rankzeroonebsd-bsd-9-whole-sha-finiteness-example"></a>

### Whole Sha finiteness comparison example

`RankZeroOneBSD:BSD.9/whole-sha-finiteness-example` · application.

The whole Sha groups of the three actual fixtures are finite, independently of any exact cardinality certificate.

**Hypotheses.**

- The exact certificates and source hypotheses listed by the prerequisite nodes.

**Proof route.**

1. Apply BSD.4’s whole-Sha conclusion; no finite index or p-primary datum replaces it.

**Inputs.** [RankZeroOneBSD:BSD.9/analytic-fixture-enclosures](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures); [RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem](#rankzeroonebsd-bsd-4-analytic-rank-at-most-one-theorem).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

**Sources.**

- [roadmap](#source-roadmap), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

<a id="rankzeroonebsd-bsd-9-fixed-prime-example"></a>

### Fixed prime BSD comparison example

`RankZeroOneBSD:BSD.9/fixed-prime-example` · application.

For fixture11 at p=5, the KY theorem proves the actual prime part despite rational 5-torsion. A generic fixed-prime endpoint retains the named branch and its hypotheses, including every reduction/ramification exception.

**Hypotheses.**

- The exact certificates and source hypotheses listed by the prerequisite nodes.

**Proof route.**

1. Use the range-tested KY instance; do not infer all primes from this one instance.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-11-good-five](#rankzeroonebsd-bsd-9-fixture-11-good-five); [RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch](#rankzeroonebsd-bsd-8-source-qualified-prime-part-dispatch).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

**Sources.**

- [roadmap](#source-roadmap), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

<a id="rankzeroonebsd-bsd-9-full-bsd-example"></a>

### Full BSD certificate comparison examples

`RankZeroOneBSD:BSD.9/full-bsd-example` · application.

For each actual fixture, its proved complete prime certificate yields the full leading-term formula. Construct this certificate only after exact modular-symbol or Gross–Zagier/period/free-index comparison, finite arithmetic certificates and every exceptional valuation are available. This application is conditional on those concrete replayed inputs; it is not proved by rank equality or Sha finiteness alone.

**Hypotheses.**

- The exact certificates and source hypotheses listed by the prerequisite nodes.

**Proof route.**

1. Compute the actual rational defect with exact analytic/arithmetic comparisons.
2. Use exceptional-prime-part-adapter at every prime in its canonical support and construct PrimeValuationCertificate.
3. Apply elliptic-endpoint.

**Inputs.** [RankZeroOneBSD:BSD.9/fixture-finite-arithmetic](#rankzeroonebsd-bsd-9-fixture-finite-arithmetic); [RankZeroOneBSD:BSD.9/fixture-period-height-comparisons](#rankzeroonebsd-bsd-9-fixture-period-height-comparisons); [RankZeroOneBSD:BSD.9/fixture-11-isogeny-period](#rankzeroonebsd-bsd-9-fixture-11-isogeny-period); [RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter](#rankzeroonebsd-bsd-8-exceptional-prime-part-adapter); [RankZeroOneBSD:BSD.8/elliptic-endpoint](#rankzeroonebsd-bsd-8-elliptic-endpoint).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

**Sources.**

- [roadmap](#source-roadmap), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

<a id="rankzeroonebsd-bsd-9-missing-exception-fixture"></a>

### Missing exceptional prime regression

`RankZeroOneBSD:BSD.9/missing-exception-fixture` · theorem.

In an actual fixture proof, deleting the dyadic or any other exceptional localZero entry invalidates the full-formula application unless a separate proof recovers it. The positive rational countermodels q=2 and q=1/4 have zero valuation at every odd prime and nonzero dyadic valuation; their certificate type is empty. Thus odd-prime results and whole-Sha finiteness alone cannot satisfy the final gate.

**Proof route.**

1. Use dyadic-gate and the exact positive rational countermodels.
2. Check the full-bsd-example dependency still requires all support-covered entries, including the bad additive prime 2 for fixture32.

**Inputs.** [RankZeroOneBSD:BSD.9/dyadic-gate](#rankzeroonebsd-bsd-9-dyadic-gate); [RankZeroOneBSD:BSD.9/full-bsd-example](#rankzeroonebsd-bsd-9-full-bsd-example); [RankZeroOneBSD:BSD.9/fixture-32-cm-additive](#rankzeroonebsd-bsd-9-fixture-32-cm-additive).

**Suggested home.** `TauCeti/NumberTheory/BSD/ComparisonExamples`; namespace `WeierstrassCurve.BSD`.

**Acceptance.**

- Removing one undecided exceptional prime must fail the certificate construction.

**Sources.**

- [roadmap](#source-roadmap), BSD.8–BSD.9 missing-prime acceptance. The finite support certificate has no exception-erasing constructor.

## Coverage and unresolved contracts

Each stage below is planned or partial, not closed. The precise source/interface limitations are part of the plan and must be discharged before its targets are proved.

### BSD.0 — planned

- Prove the dyadic congruent-number trace/root table from the original Birch–Stephens computation or an acquired local epsilon-factor formula; the public full text was not acquired in this review.
- Odd, dyadic Artin–Schreier and ramified trace/base-change cases are already represented at target level; do not require a lemma-level split in this target-level job.

### BSD.1 — partial

- The exact power of 2 in the period comparison Ω_E Ω_{E^K}|D|^{1/2} versus Ω_{E/K}, and the 2-part of the Tamagawa comparison at ramified and dyadic places (recorded gap); every odd-primary statement is planned.
- K-relative heights wait for a number-field instance of Tau Ceti's height machinery (GZ.0 gap).
- Replace real-valued period-lattice/differential-ideal placeholders by genuine owner carriers and signatures (review gap); narrow or separately prove every broader Tamagawa/defect comparison outside split p.

### BSD.2 — planned

- Acquire Friedberg–Hoffstein Theorem B and prove nonvacuous ramified local compatibility for Castella and ordinary-support nonvanishing for the supersingular auxiliary route.
- BFH §9 weighted-series residue cancellation and infinitude were read and corrected; consume the exact MP.8 analysis export at target level.

### BSD.3 — planned



### BSD.4 — planned

- Kato14.2(2), printed p.235, includes all primes and CM curves; request its exact Selmer/local-condition endpoint, CM proof and one-sided finite-level bound instead of presuming the narrower current L4 supplier.
- Apply early BSD.0a rationality export to break the BSD.4↔BSD.5 stage cycle; see cumulative graph check and restructure proposal.

### BSD.5 — planned

- The 2-power bookkeeping in rank-one-rationality and gross-index-formula is stated only up to units at odd primes; the exact dyadic form is BSD.8/BSD.9 work.
- BSD.3a/definite-congruence-period is planned here pending the proposed sub-layer BSD.3a (restructure).
- Apply early BSD.0a rationality export to break the BSD.4↔BSD.5 stage cycle; see cumulative graph check and restructure proposal.

### BSD.6 — planned

- The main-conjecture inputs are requested from ModularIwasawaMainConjectures (L0, L1 and the proposed p ∥ N layer), PadicFamilies L3 (Greenberg–Stevens) and DiophantineApproximationAndTranscendence DT.5 (Barré-Sirieix–Diaz–Gramain–Philibert); the p-part theorems are planned on top of them.
- Discharge the JSW μ, degree, local/Tamagawa and Kolyvagin hypotheses. The old supersingular auxiliary-twist route and Castella ramified-q rank-zero deduction remain gaps; the added direct BSTW1.5 semistable rank-one node does not repair those arguments.

### BSD.6a — partial

- Supply actual signed Iwasawa cohomology/local-map carriers and six API/four example signatures (currently only comment names).
- Prove the added signed Proposition9.18 node; source prints only the ordinary proof. Ordinary element/reciprocity/comparison are requested from KatoEulerSystems proposed L5, not replanned.
- Prove the added higher-weight integral Kolyvagin bound and Σ-imprimitive projection with the exact C1/C2/local hypotheses; FW factorization belongs AC L2, FO local type R21.3, projection APL L3h.
- Discharge the recorded Selmer/Fitting/control, μ/exceptional-prime and additive-range gaps before identifying the suppliers with the claimed integral endpoint.

### BSD.7 — planned

- Refine actual defect/finite control interfaces and supplier rank-zero/twist comparisons; independently verify all integral period and torsion factors. Instantiate the good CGS and broader KY theorem branches without extending them to bad reduction.

### BSD.7a — planned

- Create the proposed elliptic-unit owner and verify the four primary source inputs under actual characters; implement requested Wüthrich/KLZ/early-Heegner/duality exports and exact integral lattice transfer. Review the source-specific residual, augmentation and μ/λ chains. Resolve the KY introductory/detail coefficient-ring discrepancy and the broader cyclotomic adaptation interfaces listed in the gaps; compare class lines only within the same fixed lattice.

### BSD.8 — planned

- Refine exact descent, whole-Sha exponent, local/isogeny and saturation certificate producers; connect the actual BSD.5 defect API to the rational certificate core. A particular exceptional prime remains unresolved until its actual certificate is supplied.

### BSD.9 — planned

- Supply/replay all stated rigorous central-value enclosures and finite arithmetic, local, period, saturation and whole-Sha certificates for the three fixtures; expose actual endpoint signatures when their provider APIs exist.

### Outstanding source and interface gaps

**Friedberg–Hoffstein Theorem B not read.** Friedberg–Hoffstein, Nonvanishing theorems for automorphic L-functions on GL(2), Annals of Math. 142 (1995), Theorem B, is used through JSW's citation only; the public full text was not acquired in this review. Its statement (arbitrary prescribed local conditions compatible with sign +1) and the double-cover construction must be read and checked before RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch is proved.

Needed by: [RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch](#rankzeroonebsd-bsd-2-prescribed-local-conditions-value-branch); [RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts](#rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts).

**Exact powers of 2 in the quadratic period and Tamagawa comparisons.** BSD.1/quadratic-period states Ω_E·Ω_{E^K}·|D|^{1/2} = 2^e·Ω_{E/K} with e determined by c∞(E), c∞(E^K) and the dyadic Néron-lattice change, and BSD.1/tamagawa-base-change is proved for odd p only. The explicit e and the 2-part of ∏_w c_w(E/K) versus c_ℓ(E)c_ℓ(E^K) at dyadic and ramified places are not established; they are needed only for statements at p = 2 (BSD.8/BSD.9).

Needed by: [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period); [RankZeroOneBSD:BSD.1/tamagawa-base-change](#rankzeroonebsd-bsd-1-tamagawa-base-change); [RankZeroOneBSD:BSD.1/odd-part-bsd-over-K](#rankzeroonebsd-bsd-1-odd-part-bsd-over-k); [RankZeroOneBSD:BSD.5/gross-index-formula](#rankzeroonebsd-bsd-5-gross-index-formula).

**Number-field heights at the pinned Tau Ceti.** K-relative canonical heights over imaginary quadratic K need an AdmissibleAbsValues instance for number fields, which Tau Ceti f790474 lacks (the GZ.0 gap); BSD.1/quadratic-regulator-comparison and BSD.5/heegner-index-height-formula are stated for that instance.

Needed by: [RankZeroOneBSD:BSD.1/quadratic-regulator-comparison](#rankzeroonebsd-bsd-1-quadratic-regulator-comparison); [RankZeroOneBSD:BSD.5/heegner-index-height-formula](#rankzeroonebsd-bsd-5-heegner-index-height-formula).

**Birch–Stephens dyadic root numbers not read.** The values w_2(E^(n)) for E : y² = x³ − x and n mod 8 are taken from Birch–Stephens (Topology 5, 1966) through Burungale–Tian's footnote 2; the public full text was not acquired in this review, and the local computation (or Rohrlich's formula for dyadic potentially good reduction) must be read before RankZeroOneBSD:BSD.0/congruent-number-root-numbers is proved.

Needed by: [RankZeroOneBSD:BSD.0/congruent-number-root-numbers](#rankzeroonebsd-bsd-0-congruent-number-root-numbers).

**Period geometry carrier and signatures.** BSD.1/quadratic-period needs the actual period lattice of a Néron differential and its covolume, plus the fractional differential ideal and norm. The suggested file uses explicit real-valued data placeholders; these must be replaced by the owner interfaces, not by an arbitrary existential positive real. Exact dyadic comparison remains separately recorded.

Needed by: [RankZeroOneBSD:BSD.1/quadratic-period](#rankzeroonebsd-bsd-1-quadratic-period).

**Auxiliary ramified twists and supersingular support.** Acquire Friedberg–Hoffstein Theorem B and prove compatible local signs, nonempty prescriptions and the ramified Heegner-ideal conditions. In the Castella choice q|D_K, E^K is additive at q; Skinner C does not follow at that q. In the supersingular JSW upper-bound choice, (D_K,Np)=1 alone does not imply the ordinary-support hypothesis of BSTW1.3/1.5. A direct semistable rank-one BSTW1.5 route is available, but does not validate that old auxiliary-twist proof.

Needed by: [RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts](#rankzeroonebsd-bsd-2-auxiliary-fields-for-prime-parts); [RankZeroOneBSD:BSD.6/jsw-upper-bound](#rankzeroonebsd-bsd-6-jsw-upper-bound); [RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part](#rankzeroonebsd-bsd-6-castella-multiplicative-rank-one-p-part).

**Integral modular-degree comparison hypotheses.** BSD.5/ribet-takahashi-degree-comparison must state and discharge the precise localised character-module freeness/multiplicity-one hypotheses of JSW7.3.2/Ribet–Takahashi. PW’s surjective CR definite theorem and a general character exact sequence are not automatically the irreducible indefinite application. Use geometric ord_ℓ Δ or split-over-K′ Tamagawa numbers, not rational nonsplit c_ℓ.

Needed by: [RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison](#rankzeroonebsd-bsd-5-ribet-takahashi-degree-comparison); [RankZeroOneBSD:BSD.6/jsw-lower-bound](#rankzeroonebsd-bsd-6-jsw-lower-bound); [RankZeroOneBSD:BSD.6/jsw-upper-bound](#rankzeroonebsd-bsd-6-jsw-upper-bound).

**Signed arithmetic signatures and control.** The suggested file still has six BSTW API names and four unit tests only in a comment, and omits named arithmetic/Selmer theorems whose genuine carriers have no owner interface at the pin. Supply actual continuous Iwasawa/Selmer carriers, signed two-variable maps and exact local hypotheses; then add signatures/examples. A generic Prop parameter or an arbitrary class specified by its images cannot repair this.

Needed by: [RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element](#rankzeroonebsd-bsd-6a-bstw-two-variable-zeta-element); [RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws](#rankzeroonebsd-bsd-6a-bstw-explicit-reciprocity-laws); [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture); [RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part](#rankzeroonebsd-bsd-6a-bstw-rank-zero-p-part); [RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-6a-castella-anticyclotomic-main-conjecture); [RankZeroOneBSD:BSD.6a/castella-higher-weight-input](#rankzeroonebsd-bsd-6a-castella-higher-weight-input).

**Castella higher-weight integral extension and Σ comparison.** Prove the extension of CGS v2 6.5.1 from elliptic T_pE to self-dual ordinary T_g, including the augmentation prime and C1=C2=0 under residual irreducibility. Acquire/verify Cha05 Theorem2/Matar–Nekovář0.9 for C1 and CGLS Remark3.3.5 for C2. Separately prove the Σ-imprimitive APL projection and FW/BCK/local-type hypotheses. Do not infer this from the elliptic rational theorem or from the words “in the same way”.

Needed by: [RankZeroOneBSD:BSD.6a/castella-higher-weight-input](#rankzeroonebsd-bsd-6a-castella-higher-weight-input); [RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-6a-castella-anticyclotomic-main-conjecture).

**Signed Proposition9.18 proof not printed.** BSTW v2 pp.83–84 prints the ordinary proof and leaves the supersingular case to the reader. BSD owns the full signed Poitou–Tate/rank/image argument and cyclotomic (nv) specialization. Record this as a source proof gap until written, as RT/30 requires.

Needed by: [RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison](#rankzeroonebsd-bsd-6a-bstw-signed-main-conjecture-comparison).

**Imaginary-quadratic elliptic-unit main-conjecture owner.** RT-AREA-iwasawa-1/5 is not solved by a Katz construction or by a request to a nonexistent stage. The proposed EU.0–EU.4 owner must acquire and verify integral elliptic-unit distributions/norm relations, Rubin 1991/1994, Hida–Tilouine Invent.117(1994) Theorem 0.3, and Hida Annals2010 anticyclotomic Katz μ=0. Check every coefficient, splitting, conductor and exceptional-character hypothesis in the character instances actually used by CGLS/CGS/KY. This packet does not claim to have read those four proofs.

Needed by: [RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison](#rankzeroonebsd-bsd-7a-cgls-residual-character-comparison); [RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence](#rankzeroonebsd-bsd-7a-kriz-eisenstein-congruence); [RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants); [RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture](#rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture); [RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda](#rankzeroonebsd-bsd-7a-ky-residual-extension-lambda); [RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-ky-equal-iwasawa-invariants); [RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison](#rankzeroonebsd-bsd-7a-ky-imprimitive-residual-comparison); [RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-ky-finite-euler-factor-comparison); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions).

**Integral arithmetic lattice and reciprocity exports.** The published Wüthrich inputs have been read and are precisely requested from KatoL4, but no suitable integral baseline interface exists. Early Heegner classes/KS local conditions, KLZ actual BF reciprocity, p-power isogeny transfer and Poitou–Tate supplier exports must be refined as the stated requests require. Weak rational/localized Heegner or Kato bounds cannot discharge these integral equalities.

Needed by: [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); [RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound](#rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound); [RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound](#rankzeroonebsd-bsd-7a-ky-integral-kolyvagin-bound); [RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality](#rankzeroonebsd-bsd-7a-integral-twisted-cyclotomic-equality).

**Exact arithmetic fixture certificates.** Replay finite Selmer presentations, proved whole-Sha annihilators including every exceptional primary component, local minimal/Tamagawa traces, isogeny/differential indices and the rank-one saturation search for 11a3/37a1/32a2. Target Sha order 1 is an acceptance value awaiting those proofs, not a theorem imported from analytic-Sha tables. Exact period/modular-symbol or Gross–Zagier comparisons must produce the actual rational defect before exceptional valuations are certified.

Needed by: [RankZeroOneBSD:BSD.8/sha-annihilator-adapter](#rankzeroonebsd-bsd-8-sha-annihilator-adapter); [RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter](#rankzeroonebsd-bsd-8-exceptional-prime-part-adapter); [RankZeroOneBSD:BSD.9/fixture-finite-arithmetic](#rankzeroonebsd-bsd-9-fixture-finite-arithmetic); [RankZeroOneBSD:BSD.9/fixture-11-isogeny-period](#rankzeroonebsd-bsd-9-fixture-11-isogeny-period); [RankZeroOneBSD:BSD.9/full-bsd-example](#rankzeroonebsd-bsd-9-full-bsd-example).

**Actual central-value interval replay.** The source Mellin formulas and explicit infinite-tail bounds are planned. The finite rational interval replay for elementary functions and E₁, exact coefficient lists/root numbers, and proof of the three listed enclosures still require CN.4 exports and fixture certificates. No source decimal is a proof of a nonzero value or derivative.

Needed by: [RankZeroOneBSD:BSD.9/mellin-central-tail-bounds](#rankzeroonebsd-bsd-9-mellin-central-tail-bounds); [RankZeroOneBSD:BSD.9/analytic-fixture-enclosures](#rankzeroonebsd-bsd-9-analytic-fixture-enclosures).

**Keller–Yin index-square coefficient ring.** The verified v2 Introduction Theorem B states its equality in Λ, whereas §3.0.8 (IMC1) and (IMC1′) print Λ^ac without a matching definition in that version. The CGLS predecessor uses Λ^ac=Λ[1/p]. Verify an integral two-way Heegner/Greenberg index comparison with the actual transferred lattice and p^{t+N} factors before exporting the stronger integral index-square statement. The integral KY IMC2 and its BSD consumer are kept separately; the discrepancy does not weaken their printed statements.

Needed by: [RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality](#rankzeroonebsd-bsd-7a-ky-heegner-index-square-equality); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison).

**Keller–Yin cyclotomic adaptation interfaces.** KY Theorem 3.0.10’s short substitution proof must be expanded at the actual lattice/interface boundary: check CGS §3.4 H⁰/control and no-finite-submodule hypotheses, transfer both BF/Coleman images and finite-power congruences, and compare the chosen invariant-free and distinguished Wüthrich lattices integrally. Narrower CGS nodes have the local exclusion and do not suffice for 1/ω. The target theorem is sourced, but these exact adaptation exports require refinement; its prerequisite chains terminate here and in the stated supplier contracts.

Needed by: [RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs](#rankzeroonebsd-bsd-7a-ky-cyclotomic-proof-inputs); [RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-ky-cyclotomic-main-conjecture).

**Concrete arithmetic Lean interfaces.** At the exact pinned baseline, the actual BSD.0 L-function/analytic rank, BSD.5 rational defect and periods/whole-Sha interfaces, Iwasawa Selmer modules, Coleman/BF classes and effective descent/interval certificates are not available together as Lean APIs. Their mathematical signatures remain definitive in this packet/reader. The suggested file omits them by name; it uses actual baseline curves/points and rational certificate interfaces, never arbitrary Prop-valued arithmetic stand-ins.

Needed by: [RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion](#rankzeroonebsd-bsd-7a-eisenstein-ordinary-local-exclusion); [RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization](#rankzeroonebsd-bsd-7a-eisenstein-selmer-normalization); [RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-finite-euler-factor-comparison); [RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison](#rankzeroonebsd-bsd-7a-cgls-residual-character-comparison); [RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence](#rankzeroonebsd-bsd-7a-kriz-eisenstein-congruence); [RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-cgls-equal-iwasawa-invariants); [RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound](#rankzeroonebsd-bsd-7a-uniform-near-trivial-kolyvagin-bound); [RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility](#rankzeroonebsd-bsd-7a-augmentation-inclusive-heegner-divisibility); [RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison](#rankzeroonebsd-bsd-7a-heegner-reciprocity-ideal-comparison); [RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-anticyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality](#rankzeroonebsd-bsd-7a-cgs-heegner-index-square-equality); [RankZeroOneBSD:BSD.7a/ky-local-character-corrections](#rankzeroonebsd-bsd-7a-ky-local-character-corrections); [RankZeroOneBSD:BSD.7a/ky-ribet-lattice](#rankzeroonebsd-bsd-7a-ky-ribet-lattice); [RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture](#rankzeroonebsd-bsd-7a-ky-trivial-character-main-conjecture); [RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda](#rankzeroonebsd-bsd-7a-ky-residual-extension-lambda); [RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants](#rankzeroonebsd-bsd-7a-ky-equal-iwasawa-invariants); [RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound](#rankzeroonebsd-bsd-7a-ky-integral-kolyvagin-bound); [RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality](#rankzeroonebsd-bsd-7a-ky-anticyclotomic-greenberg-equality); [RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality](#rankzeroonebsd-bsd-7a-ky-heegner-index-square-equality); [RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input](#rankzeroonebsd-bsd-7a-distinguished-lattice-integral-input); [RankZeroOneBSD:BSD.7a/integral-two-variable-functions](#rankzeroonebsd-bsd-7a-integral-two-variable-functions); [RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity](#rankzeroonebsd-bsd-7a-beilinson-flach-integral-reciprocity); [RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison](#rankzeroonebsd-bsd-7a-bf-poitou-tate-divisibility-comparison); [RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound](#rankzeroonebsd-bsd-7a-nontrivial-twist-rational-bf-bound); [RankZeroOneBSD:BSD.7a/congruent-characteristic-series](#rankzeroonebsd-bsd-7a-congruent-characteristic-series); [RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison](#rankzeroonebsd-bsd-7a-twisted-control-augmentation-comparison); [RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality](#rankzeroonebsd-bsd-7a-integral-twisted-cyclotomic-equality); [RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-cgs-cyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture](#rankzeroonebsd-bsd-7a-ky-cyclotomic-main-conjecture); [RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture](#rankzeroonebsd-bsd-7a-cgls-prototype-main-conjecture); [RankZeroOneBSD:BSD.7/cgls-torsion-free-control](#rankzeroonebsd-bsd-7-cgls-torsion-free-control); [RankZeroOneBSD:BSD.7/ky-torsion-control](#rankzeroonebsd-bsd-7-ky-torsion-control); [RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype](#rankzeroonebsd-bsd-7-greenberg-vatsal-rank-zero-prototype); [RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect](#rankzeroonebsd-bsd-7-cyclotomic-rank-zero-defect); [RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison](#rankzeroonebsd-bsd-7-rank-one-twist-defect-comparison); [RankZeroOneBSD:BSD.7/cgls-rank-one-prototype](#rankzeroonebsd-bsd-7-cgls-rank-one-prototype); [RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd](#rankzeroonebsd-bsd-7-cgs-eisenstein-prime-bsd); [RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd](#rankzeroonebsd-bsd-7-ky-eisenstein-prime-bsd); [RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs](#rankzeroonebsd-bsd-7a-ky-cyclotomic-proof-inputs); [RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound](#rankzeroonebsd-bsd-7a-ky-uniform-near-trivial-bound); [RankZeroOneBSD:BSD.7a/bf-pr-reciprocity](#rankzeroonebsd-bsd-7a-bf-pr-reciprocity); [RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity](#rankzeroonebsd-bsd-7a-bf-greenberg-reciprocity); [RankZeroOneBSD:BSD.8/elliptic-endpoint](#rankzeroonebsd-bsd-8-elliptic-endpoint); [RankZeroOneBSD:BSD.9/full-bsd-example](#rankzeroonebsd-bsd-9-full-bsd-example); [RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison](#rankzeroonebsd-bsd-7a-ky-imprimitive-residual-comparison); [RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison](#rankzeroonebsd-bsd-7a-ky-finite-euler-factor-comparison).

All declarations remain `implementationStatus: unchecked`. The suggested Lean file is a prototype of expressible interfaces with proof placeholders; omissions needing actual arithmetic carriers are explicit. The supplier request ledger and structural proposals are in the [assembly handoff](../handoff/ASM-RankZeroOneBSD.md).
