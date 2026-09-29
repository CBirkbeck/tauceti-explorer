# RT-AREA-computational: fixes

Fixer: Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #3956, job FIX-RT-AREA-computational).
- Findings: `RT-AREA-computational.result.json` (16 findings, none high).
- Verdicts: `RT-AREA-computational.review.json`. Findings 1–10 and 12–16 were confirmed; finding 11 was rejected.

## How the fixes are delivered

This job's only deliverable is this report, and the intake merges a submission only when it changes the job's deliverables. The files the findings name are therefore not edited here:
- the roadmap document `content/campaign/ComputationalNumberTheory/README.md` (the `sourcePath` of the roadmap in `data/atlas.json`);
- the integrated decomposition `data/decompositions/ComputationalNumberTheory.json`;
- the packets of FiniteFieldsAndCharacterSums, GeometryOfNumbersAndQuadraticArithmetic and ComplexMultiplicationAndExplicitReciprocity.

Instead, each section below gives the exact edit for the maintainer to apply, and everything it cites has been checked.

**Checks behind the edits.**
- **Declarations.** Every declaration cited below was looked up in the pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474), and its file and line are given. `ModularForm.L` and `ModularForm.Λ` appear in that index under their bare names `L` and `Λ` (Mathlib/NumberTheory/ModularForms/LFunction.lean, `namespace ModularForm`; `Λ` at line 91). `FactorsHelper` is `Mathlib.Meta.Simproc.FactorsHelper` (Mathlib/Tactic/Simproc/Factors.lean:29).
- **Stage ids.** Every stage id resolves in `data/atlas.json`.
- **New links.** Each new stage link was tested against the atlas's 3,508 stage edges, and none closes a cycle.
- **Source quotations** (Shoup, Cremona) rest on the red-team evidence and its confirmed review; they were not reread here.

## /1 (medium, error): CN.4 certifies exact vanishing numerically: edit for the maintainer

**README, CN.4, Acceptance.** Replace the sentence with:

> A sign or nonvanishing claim (including L^(r)(1) ≠ 0, and the existence of a zero located by a sign change of a real-valued function) is certified by an enclosure that excludes the wrong value. An exact-vanishing claim (L^(j)(1) = 0, hence any lower bound on an analytic rank) is never certified numerically. It is imported from:
> - root-number parity (RankZeroOneBSD:BSD.0);
> - exact modular-symbol rationality of L(E,1)/Ω (RankZeroOneBSD:BSD.5);
> - or Gross–Zagier and Kolyvagin (GrossZagierAndArithmeticHeights, BSD.5).
>
> An analytic-rank certificate is the pair: exact vanishing below r, and an enclosure of the r-th derivative excluding 0.

**Link.** Add RankZeroOneBSD:BSD.0 → ComputationalNumberTheory:CN.4 (acyclic). The fix's other option, dropping "rank" from CN.4, is not taken: the rewritten acceptance keeps rank certificates in CN.4 and imports their exact half.

## /2 (medium, duplicate): CN.4 re-plans analytic continuation: edit for the maintainer

**README, CN.4, Construct and export.** Replace "analytic continuation where required" with:

> certified numerical evaluation (a smoothed approximate functional equation with explicit truncation and tail bounds) of L-functions whose continuation and functional equation are imported

**Links.** Add tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions → CN.4 and RankZeroOneBSD:BSD.0 → CN.4 (both acyclic).

**Built baseline.** Cite these declarations as built:

| Declaration | Location |
| --- | --- |
| `ModularForm.Λ` | Mathlib/NumberTheory/ModularForms/LFunction.lean:91 |
| `CuspForm.differentiable_Λ` | the same file, line 175 |
| `CuspForm.differentiable_L` | the same file, line 190 |
| Tau Ceti `CuspForm.hasEntireExtension_qExpansion_coeff` | TauCeti/NumberTheory/ModularForms/LFunction.lean:131 |

## /3 (medium, error): CN.3's prerequisites and Sturm target: edit for the maintainer

**README, CN.3.**
- **Inputs.** Replace `UPSTREAM:ModularForms-finite-index-subgroups` with `tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas`.
- **Links.** Add links to CN.3 from ModularForms layers 8 (modular symbols and the integral Hecke algebra), 9 (the LMFDB invariant layer) and 11 (the Eichler–Selberg trace formula). All are acyclic.
- **Sturm sentence.** Replace it with: "every equality of forms is certified by the built Sturm bound, with its weight and index hypotheses". The built bounds are `TauCeti.ModularForm.eq_of_sturm_bound` (TauCeti/NumberTheory/ModularForms/SturmBound.lean:102) and Mathlib `ModularForm.sturm_bound_levelOne` (Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:307).
- **Scope.** State CN.3's scope as the certified computations that the ModularForms README sends downstream:
  - explicit Manin-symbol presentations and Hecke matrices at a given level and weight;
  - q-expansion data beyond eta quotients;
  - identifications of LMFDB newform orbits through layer 9's labels.

## /4 (medium, missing): CN.3 lacks the items routed from PAPER-BOXER-CALEGARI-GEE-25: edit for the maintainer

Add to CN.3, the owner of certified modular-form computation:
- **(a)** M_k(SL₂(Z), Z) and S_k(SL₂(Z), Z), the forms with integral q-expansion, with Miller's basis theorem. It is built from:
  - `EisensteinSeries.E_qExpansion_coeff` (Mathlib/NumberTheory/ModularForms/EisensteinSeries/QExpansion.lean:323);
  - `ModularForm.discriminant_eq_q_prod` (Mathlib/NumberTheory/ModularForms/Discriminant.lean:117);
  - `TauCeti.ModularForm.evalE₄E₆_surjective` (TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean:314).
- **(b)** T_p-stability of that lattice, from Tau Ceti's coefficient recurrence in HeckeSlash/Recurrence.lean. The finding gives line 168. The declaration indexed there is `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1ModularFormEnd_diagCosetGamma1_of_mem_modFormCharSpace`, so the maintainer should confirm that this is the intended recurrence.
- **(c)** Sturm's congruence theorem at level one via the Miller basis, and at finite index via the norm map, as in TauCeti/NumberTheory/ModularForms/SturmBound.lean.

Also:
- Request the theta operator on mod-p q-expansions, with its weight shift, from AlgebraicModularFormsAndSerreWeights:R15.3.
- Record in the routed BCG items that a companion-form congruence is certified by (c), not by a common root of two characteristic polynomials.

## /5 (medium, missing): Fincke–Pohst belongs to GN.5: edit for the maintainer

**Packet of GeometryOfNumbersAndQuadraticArithmetic, GN.5.** Add a node "Fincke–Pohst enumeration":
- For a positive-definite rational quadratic form written by completing squares as Q(x) = Σ_i q_ii (x_i + Σ_{j>i} q_ij x_j)², the coordinate-by-coordinate bounds enumerate exactly the x ∈ Z^m with Q(x) ≤ c.
- Variant: for a form known through a certified lower bound Q′ ≤ Q, the list for Q′ contains the list for Q.

**Routing.** Route the enumeration half of PAPER-CHENEVIER-TAIBI-20/fincke-pohst-effective to GN.5, and keep only the certified Gram-matrix lower bounds in CN.4. The consuming CT roadmap imports both.

## /6 (medium, missing): CN.2 has no nodes for maximal orders or Newton polygons: edit for the maintainer

Add three CN.2 nodes:
1. **The p-radical and Pohst–Zassenhaus.** Define the p-radical I_p of an order O and its ring of multipliers O′ = {x ∈ K : x I_p ⊆ I_p}. Then O′ = O if and only if O is p-maximal, and iteration reaches the p-maximal order, the index dropping by a power of p at each step.
2. **Newton polygons and Ore's theorem.** The Newton polygon of a polynomial over a discretely valued field gives factorization by slopes and residual polynomials, and prime decomposition with ramification indices when the residual polynomials are separable. It consumes Mathlib's `hensels_lemma` (Mathlib/NumberTheory/Padics/Hensel.lean:461) and FF.3's Hensel interfaces.
3. **The integral-basis certificate.** Compare index and discriminant with Tau Ceti's `TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr` (TauCeti/NumberTheory/NumberField/Index/Discriminant.lean:56), and check p-maximality at each p with p² | disc.

Sources: Cohen, GTM 138, §§6.1–6.2, and Guàrdia–Montes–Nart.

## /7 (medium, error): CN.0's RAM versus bit-cost acceptance item: edit for the maintainer

**Decomposition, node `ComputationalNumberTheory:CN.0/ram-machine-model-and-bit-complexity`.** Replace acceptance item 2 with:

> Check that a claimed running time is a RAM running time in the sense of Shoup Section 3.2: unit cost per instruction, stored numbers at most a′(n+t)^b′ + c′, integers as base-B digit vectors with B a constant. A RAM bound becomes a bit-operation bound only after multiplying by the cost of the word operations the algorithm performs on its O(len(n+t))-bit indices and counters. The two measures can differ by a factor polylogarithmic in the input size (Shoup Section 3.6, p. 72).

Also:
- Delete the bracketed review remark that introduced the old item.
- Make the hypotheses item say that len(n)-costs are RAM costs, not bit costs.

## /8 (medium, library-claim): Miller–Rabin re-plans Mathlib's Carmichael API: edit for the maintainer

**Decomposition, node `ComputationalNumberTheory:CN.1/miller-rabin-probabilistic-primality`.** Cite these as baseline:

| Declaration | Location |
| --- | --- |
| `Nat.IsCarmichael` | Mathlib/NumberTheory/CarmichaelNumber.lean:46 |
| `Nat.IsCarmichael.odd` | the same file, line 85 |
| `Nat.IsCarmichael.squarefree` | line 97 |
| `Nat.IsCarmichael.prime_sub_one_dvd` | line 118 |
| `Nat.isCarmichael_iff_korselt` | line 127 |
| `Nat.isCarmichael_561` | line 151 |
| `Nat.ProbablePrime` | Mathlib/NumberTheory/FermatPsp.lean:55 |
| `Nat.probablePrime_iff_zmod_one` | the same file, line 58 |
| `ZMod.pow_card_sub_one_eq_one` | Mathlib/FieldTheory/Finite/Basic.lean:611 |

Keep only these as new nodes:
- the bridge "for odd n > 1, Nat.IsCarmichael n iff L_n = (ZMod n)ˣ";
- "a Carmichael number has at least three prime factors" (Shoup's r = 2 argument);
- L′_n with its membership procedure;
- Theorem 10.3;
- the Miller–Rabin error bound.

The 561 acceptance test becomes `Nat.isCarmichael_561`.

## /9 (medium, library-claim): primality certificates: edit for the maintainer

**README, CN.1, and the decomposition gaps "Primality certificates versus primality tests" and "Integer factorization has no read source anywhere in EXT-08".**

Cite as baseline:
- `lucas_primality` (Mathlib/NumberTheory/LucasPrimality.lean:39) and `lucas_primality_iff` (line 73);
- `Nat.ProbablePrime`;
- `Mathlib.Meta.Simproc.FactorsHelper`;
- `Nat.primeFactorsList_unique` (Mathlib/Data/Nat/Factors.lean:168).

Plan new nodes only for:
- the inductive Pratt certificate (n, a witness a, and a factorization of n−1 whose prime factors carry certificates), with its Boolean checker, soundness from `lucas_primality`, completeness from `reverse_lucas_primality` (the same file, line 57), and the O(log² n) size bound;
- Pocklington's criterion;
- a factorization certificate whose prime factors carry Pratt or Pocklington certificates instead of minFac proofs.

Algorithmic integer factoring (Shoup Chapter 15) remains a separate complexity target, not part of the certificate.

## /10 (medium, duplicate): finite-field factorization belongs to FF.3: edit for the maintainer

- **Move the node.** Move `ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields`, with its statement, sources and review corrections, to FiniteFieldsAndCharacterSums:FF.3 in `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`.
- **Replace it in CN.1** by a consumer node: given a claimed factorization f = ∏ f_i^{e_i} over F_q, check the product and each irreducibility witness, citing the FF.3 node.
- **Links.** The node's incoming link moves with it. The review rejected finding 11, which asked to rewrite that link, because `scripts/decompositions.py` already holds links to unpromoted refinements back until promotion. So only the move applies.

## /11 (low, error): rejected

The review found that `scripts/decompositions.py` (lines 46–55 and 223–230) holds links to unpromoted refinements back in `deferredLinks`, so the published graph has no invalid endpoint. No change.

## /12 (low, library-claim): AKS inputs: edit for the maintainer

**Decomposition, node `ComputationalNumberTheory:CN.1/aks-deterministic-primality`.**
- For Theorem 21.2's lower bound, cite `Chebyshev.theta_ge` (Mathlib/NumberTheory/Chebyshev.lean:498) with `Chebyshev.theta_le_log4_mul_x` (the same file, line 194). Note that θ(x) ≥ cx holds beyond an explicit x₀, and small x are checked by computation.
- For Theorem 21.1's forward direction, cite `add_pow_char` (Mathlib/Algebra/CharP/Lemmas.lean:176) with `ZMod.pow_card` (Mathlib/FieldTheory/Finite/Basic.lean:588).
- Delete the CN.1 coverage item that records these inputs as not read.

## /13 (low, error): CN.5 is disconnected from CN.2 and CN.3: edit for the maintainer

Connect them in RS-03's direction. Add CN.5 → CN.2 and CN.5 → CN.3, with the reason "instantiate the generic certificate schema for number-field and modular-form/elliptic-curve records". Both are acyclic.

Also state in the README that CN.2 and CN.3 check the LMFDB-derived number-field and modular-form claims by instantiating CN.5's schema. The fix's other direction (CN.5 checking those records itself) is not taken, because CN.5 is a methodology stage whose only input is CN.4.

## /14 (medium, duplicate): CM.5 re-plans ball arithmetic: edit for the maintainer

- **Link.** Add ComputationalNumberTheory:CN.4 → ComplexMultiplicationAndExplicitReciprocity:CM.5 (acyclic).
- **Narrow CM.5's construction** to the class-polynomial-specific parts:
  - the height bound on the coefficients of H_D;
  - the precision that bound requires for rounding;
  - the CRT variant;
  - the endomorphism-ring certificate.

  CM.5 imports ball arithmetic and precision propagation from CN.4.

## /15 (low, error): CN.2's inputs: edit for the maintainer

**README, CN.2, Inputs.** Replace `FoundationsAndLibraryIntegration:LI.4` with tauceti:TauCetiRoadmap/NumberFieldArithmetic layers 3 (the index, Dedekind–Kummer) and 7 (integral bases, monogenicity, explicit units), which are already linked.

**Baseline.** Cite as baseline, for example:
- `RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_pow_le_of_mem_primesOver_of_mem_Icc` (Mathlib/NumberTheory/NumberField/ClassNumber.lean:144);
- `hensels_lemma` (Mathlib/NumberTheory/Padics/Hensel.lean:461).

Name the Newton-polygon node of /6 as the local-expansion supplier.

## /16 (low, error): source routes: edit for the maintainer

**README, Source route of CN.2–CN.4.** Name these sources:
- **CN.2:** Cohen, *A Course in Computational Algebraic Number Theory* (GTM 138), §§6.1–6.2, and Guàrdia–Montes–Nart, arXiv:0807.2620.
- **CN.3:**
  - Stein, *Modular Forms: A Computational Approach* (GSM 79; the author's PDF at wstein.org/books/modform): §2.3 (Miller basis), Chapters 3 and 8 (modular symbols) and §9.4 (Sturm);
  - Cremona, *Algorithms for Modular Elliptic Curves* (the author's full text), Chapter II.
- **CN.4:**
  - Johansson, "Arb: Efficient Arbitrary-Precision Midpoint-Radius Interval Arithmetic", arXiv:1611.02831;
  - Cremona §2.13 for L-value evaluation.

These locators come from the finding and were not reopened here.
