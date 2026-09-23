# REV-PAPER-WEI-26 — independent review

Codex — codex-a71f92. Issue #1194. 23 September 2026.

Verdict: **revise**. Route 1 rejected; narrowed source routes 2 and 3 accepted. This review is finished; the reviewed extraction is deliberately partial.

## Independence and source record

Input is Claude Code cc-7b31c4's PAPER-WEI-26, PR #1982, merged at 86e71c7e93d2bb7a6ea43be8c1adcb2f18d3c95c. Claim comment 5802615997 was confirmed by bot comment 5802618052, then the issue was reread. No own work reviewed.

Read the entire [published paper](https://link.springer.com/article/10.1007/s00222-026-01406-8), pp.815–897, §§1–7 and bibliography. It is open access, contrary to the input report. Compared disputed formulas with [arXiv v2](https://arxiv.org/pdf/2207.01165v2) and its TeX source. Published PDF SHA256: 5166033945ef2094d03a7ee897c980ec518bc100655117277538d43842f62b2c. v2 PDF: 7bc90192f53212daa484e0aa6ed07fad68ad9f117470df09471872a3e1460a65. Source: 8b5cef6bf94bb297d1c633f4b0226bc08c032bf3e704fcce8dcd3b8a59520a4a. Visually inspected published pp.842,843,864,866 to exclude extraction/OCR artifacts in the central counterexamples.

Also read ABP's [Theorem 1.3.2 and its coefficient-ring definition](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p06.pdf), p.240. This is a spot-check, not a full read of every prerequisite. The bounded errata search, URLs and dates are attached to every source finding; “new” means no correction was found there.

## Main corrections

The quasi-period theorem 6.1.4 gives a span of a **Galois orbit** of monomials, not a single line (item 61). Theorem 6.2.2 supplies an ideal-parametrized entire period lattice, with a coordinate isomorphism (14). Theorem 6.2.3 also gives algebraic independence and a quasi-period basis (62). Theorem 7.3.1 requires a nonzero **algebraic eigendifferential** and a nonzero pairing, with inverse Galois action on the exponents (15/77). Scaling a differential by arbitrary transcendental scalars shows why the original “every period” formulation cannot be retained.

The source's ambient scalar field is algebraically closed and contains k-bar. This was missing from the dual-motive/descent claims (16,17,20,21,27). Scalar field L and CM field K must not share a symbol (26). Contravariant τ-motives are not σ-dual motives just because both are contravariant (16/89).

The report's number-field-style definition “φ+φ raised by one conjugation is constant” was wrong: Definition 3.2.1 requires invariance under the commutator subgroup [G,G∞] and a constant **average over G∞**. Item 32 itself had the right conditions and is retained.

Other clear repairs include the arithmetic field for x (9), embedding locator (11), full finite coset formula (34), conductor factors (82), unbracketed digit expansion (40), geometric multiplication formula (41), the actual St/Ξ versus St/Φ identities (53), analytic rather than algebraic units (56), monic product (57), reflection factor (58), exact four soliton evaluations (59), character function rather than undefined eχ (63), twisted CM type and normalized character sum (64), Γ-tilde argument (65), examples (66–68), exact logarithmic formula (71), and local semistability including equality on weight steps (72). Locators 47,48,55,76 corrected against the publication.

## Library/status audit

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Read reviewed coverage entries for every DM.0–DM.8 and FA.0–FA.7 layer, all descriptions cited by the extraction, and both campaign roadmap documents in full. Read upstream HodgeStructures in full; its classical real/complex scope does not cover Hodge–Pink structures. ClassFieldTheory and LocalFieldsRamification were already read in this worker run; neither licenses replacing equal-characteristic contracts by number-field ones.

Every original library reference was opened at the pin:

| Provider | File and exact declaration | Scope checked |
| --- | --- | --- |
| Mathlib | Algebra/Polynomial/Basic.lean: Polynomial | Semiring polynomial carrier |
| Mathlib | FieldTheory/RatFunc/Defs.lean: RatFunc | Fraction-ring carrier |
| Mathlib | NumberTheory/FunctionField.lean: FunctionField | Finite-dimensional extension of RatFunc |
| Mathlib | Algebra/Polynomial/Degree/Defs.lean: Polynomial.Monic | Leading coefficient = 1 |
| Mathlib | RingTheory/LaurentSeries.lean: LaurentSeries | Hahn-series carrier, not C∞ |
| Mathlib | RingTheory/Algebraic/Defs.lean: Transcendental | Nonalgebraicity, not trdeg itself |
| Mathlib | RingTheory/AlgebraicIndependent/Defs.lean: IsTranscendenceBasis | Maximal algebraically independent family |
| Mathlib | FieldTheory/FinTrdeg.lean: exists_finset_isTranscendenceBasis | Requires FinTrdeg |
| Mathlib | RingTheory/AlgebraicIndependent/Basic.lean: Algebra.trdeg | Cardinal-valued definition, now cited |
| Mathlib | Topology/LocallyConstant/Basic.lean: IsLocallyConstant | Function predicate |
| Mathlib | Topology/Algebra/Category/ProfiniteGrp/Basic.lean: ProfiniteGrp | Compact profinite group carrier |
| Mathlib | MeasureTheory/Measure/Haar/Basic.lean: haarMeasure, haarMeasure_self | Normalize on PositiveCompacts; choose univ for compact group |
| Mathlib | RingTheory/MvPowerSeries/Restricted.lean: IsRestricted, IsRestricted.subring | Radius-one restricted-series carrier |
| Tau Ceti | RingTheory/Huber/Restricted/PowerSeries.lean: TauCeti.Huber.IsRestricted, restrictedMvPowerSeriesSubring | Topological nonarchimedean restricted-series ring |

The completed algebraic closure C∞ was not supplied by the first five declarations. DM.2's reviewed audit explicitly records norm-normalization/completion-algebraic-closedness gaps. Item 1 is now only the existing carriers; 85 records the planned analytic assembly. Conversely, the restricted-series Tate carrier **already exists** and is item 87. No second Tate algebra is proposed. Rational finite-quotient averages need their comparison to real Haar integration; a Q-valued Bochner integral was not certified.

Family searches across both pinned source trees covered gamma/CM/Drinfeld/Carlitz/Hodge–Pink/soliton/Stickelberger/period-symbol/dual-motive/rigid-triviality/Frobenius-difference/Tannakian terms, followed by declaration and scope inspection for hits. Drinfeld centers and number-field Stickelberger discriminant congruences are unrelated. Tau Ceti's finite-comodule Tannaka reconstruction is useful infrastructure, not the specific analytic difference-group theorem or BCPW CM computation. Absence claims concern these specific targets, not all general algebra or geometry.

Searched data/atlas.json, new-roadmap files, packets and paper routes for these families and the already proposed DrinfeldModulesAndTModulesPartII. The Chang–Chen–Mishiba, Im–Kim–Le–Ngo Dac–Pham and Ngo Dac extractions explicitly share ABP/dual-motive foundations. Their proposals are not established Lean providers, but cannot be ignored when designing shared ownership. AdicSpaces already owns general Tate algebra theory; FA and curve roadmaps own their generic geometry.

Status changes are conservative: 16,17,19,54,79 lose unsupported planned claims; 60 and 81 are narrowed; 5/7/38 have unsupported components split off. DM.4 does plan purity/uniformizability, but exact σ-convention comparisons remain visible gaps. No generic theory is declared unowned merely because a source-specific assembly is missing.

## Routes

| Route | Verdict | Usable scope |
| --- | --- | --- |
| 1 GammaValuesAndCMPeriods | reject | Candidate only; 80 missing items assigned once, no design activation |
| 2 DrinfeldModulesAndTModules | accept after narrowing | 5,60,80,81,85; DM.0/DM.2/DM.4/DM.8 |
| 3 FunctionFieldArithmetic | accept after narrowing | 7,38,48,82; FA.3/FA.4/FA.5 |

DM.5's precise Drinfeld Tate theorem does not supply arbitrary dual-isogeny calculus; DM.7's elliptic-sheaf chains do not supply ABP's special soliton function. DM.8's general criterion and Carlitz-log example do not supply BCPW's CM group calculation. FA.4's Carlitz comparison must come **after** reciprocity, not as a circular input. Source route 3 excludes the CM period distribution and compatible absolute-Galois assembly.

## Source findings and reach

All four original findings confirmed, with E3 restricted to the notation mismatch. Nineteen additional checked findings give 23 total. Full printed passages, corrections, reasoning and reviewer verdicts are in sourceIssues.

- E1 — misprint; nothing. Published proof of Theorem 6.2.3, p.873; also arXiv v2.
  (by Theorem 3.3.5). Statement 3.3.5, the transcendence-degree theorem quoted from Brownawell–Chang–Papanikolas–Wei, is a Theorem, not a Proposition.

- E2 — misprint; nothing. Published Theorem 6.4.5, p.882; also arXiv v2.
  Given a character χ ∈ 𝔊̂_{𝔫,ℓ}: the character belongs to the dual group, not to 𝔊_{𝔫,ℓ} itself.

- E3 — misprint; nothing. Published Remark 1.3.4(2), p.824, and Example 6.3.11, p.880; also arXiv v2.
  The same object is written ϖ (varpi) in one place and ω (omega) in the other. In Example 6.3.11 the intended symbol is ϖ_𝕂^±, the quantity defined in the display earlier in that example; in §1.3 the intended symbol in the two closing sentences is ω_𝕂^±, the quantity the display just defined — equivalently, the display should define ϖ_𝕂^±.

- E4 — misprint; nothing. Published Remark 6.3.6, p.876; also arXiv v2.
  n_𝔠(ϱ,a,i) in both places, the rational number defined by the displayed equation the sentence points at.

- E5 — error; a stated result. Published Lemma 4.1.2(1), p.842; Proposition 4.1.5(1)–(3), p.843; Remark 4.1.6(3), p.844; same issue in arXiv:2207.01165v2.
  Use unbracketed fractions for the digit uniqueness, as immediately before the lemma. Exclude q=2,ℓ=1 from the seed formula and define the bracket through nondegenerate expansions. Remark 4.1.6(3) needs q>2; repairing the seed alone does not fix all later statements.

- E6 — error; a stated result. Published Proposition 4.2.4(1),(3), p.848; (4.2.8), p.850; Corollaries 4.3.3 and 4.3.13, pp.852,855; Lemma 6.3.2, p.874; same issue in arXiv:2207.01165v2.
  Separate q=2,ℓ=1. Its arithmetic source quotient is zero, not one-dimensional. A larger arithmetic level or an additional constant generator is required; proving the appropriate replacement and downstream compatibility remains open in this review. Restrict the claimed finite-level assertions to nondegenerate levels meanwhile.

- E7 — error; a stated result. Published Remark 4.2.3(4), p.847; definition of Γ-tilde_geo before Theorem 5.4.5, p.868; same issue in arXiv:2207.01165v2.
  For q=2 retain the independently specified piecewise geometric normalization, not its claimed equality with the two-variable quotient specialization. Supply a separate geometric argument; the printed equality of distributions cannot be used there.

- E8 — error; a stated result. Published Lemma 5.1.2, p.859, and Lemma 5.3.1, p.863; same issue in arXiv:2207.01165v2.
  Require the relevant Ξ_* to be nonzero: x≠0, y≠0, or both, respectively. Zero divisors are effective elements of I⁰, not generalized CM types. Treat their trivial analytic products separately rather than as dual t-motives finite over the skew polynomial ring.

- E9 — misprint; a stated result. Published Proposition 5.3.4, p.864; same issue in arXiv:2207.01165v2.
  Replace a∈A by a∈A_+ (monic polynomials), exactly as in both products in the proof.

- E10 — error; a stated result. Published Proposition 5.4.2(1), p.866; same issue in arXiv:2207.01165v2.
  Insert x^{q−3} on the right, or restrict x to nonzero algebraic elements. The original broad statement is valid without this factor only at q=3.

- E11 — misprint; a stated result. Published Remark 7.3.3, p.893; same issue in arXiv:2207.01165v2.
  Replace m_ρ n_c by Σ_{ρ∈G_K}m_ρn_c in both cases of ε; retain 1/[K:𝕜] in the following character-sum term. Keep the existing constant term.

- E12 — error; a stated result. Published §3.4, (3.4.2), p.840, and §5.1 point count, p.856; same issue in arXiv:2207.01165v2.
  Require deg n>0 for these geometric assertions; for n=1 the field is 𝕜, the index and number of infinite points are 1. Equivalently use (q−1)^{ε_n}. The geometric shtuka divisor construction must either restrict to positive modulus or justify inflation for purely arithmetic targets.

- E13 — error; a stated result. Published Example 6.3.9, p.878; same issue in arXiv:2207.01165v2.
  Use q−1+ℓ·1_{i=0}−ℓq·1_{i=ℓ−1}; or restrict the piecewise display to ℓ≥2 and give ℓ=1 separately.

- E14 — misprint; nothing. Published Definition 2.4.1(1), p.831; same issue in arXiv:2207.01165v2.
  Use End_{L[t,σ]}(M).

- E15 — misprint; nothing. Published proof of Lemma 2.2.7, pp.827–828; same issue in arXiv:2207.01165v2.
  Use column vectors Mat_{n,1} and Mat_{n',1}, leaving the displayed multiplication and U∈Mat_{n,n'} unchanged.

- E16 — misprint; nothing. Published Theorem 6.1.4, p.871; same issue in arXiv:2207.01165v2.
  H_K=Gal(K^cyc/K).

- E17 — misprint; nothing. Published §6.2 period-vector display, p.871; same issue in arXiv:2207.01165v2.
  The last entry is ∫γ_λ ω_{M,ξ_d}.

- E18 — error; a stated result. Published Example 6.3.11, pp.879–880; same issue in arXiv:2207.01165v2.
  Use Γ-tilde(a(θ)/d(θ),q^i/(1−q²)), as in Remark 1.3.4, or restrict the raw-Γ example to positive-degree d and send constant quadratic fields to Example 6.3.9.

- E19 — misprint; nothing. Published Example 7.3.4, p.894; same issue in arXiv:2207.01165v2.
  Replace 𝕜 by K.

- E20 — error; a stated result. Published Remark 7.2.5, p.889; same issue in arXiv:2207.01165v2.
  Effective implies Φ_H is effective in I_K⁰. Require Φ_H≠0 (equivalently positive weight in this pure effective setting) for a generalized CM type.

- E21 — misprint; nothing. Published equation (6.4.4), p.882; same issue in arXiv:2207.01165v2.
  Denominator Γ*_ari(y); define the x=0 extension separately as stated just below.

- E22 — misprint; nothing. Published Example 7.1.7, p.886; same issue in arXiv:2207.01165v2.
  Replace ν by μ in the second branch.

- E23 — misprint; nothing. Published §1.4, p.824, setup before Theorem 1.4.1; same issue in arXiv:2207.01165v2.
  Use H'⊂H(M) and place the full-CM assumption on H'.


The strongest counterexamples are small and independent:

- At q=2,ℓ=1, arithmetic residues are Z/Z. All arithmetic and two-variable St generators are zero, yet S of the trivial Galois group contains 1. The universal arithmetic quotient has dimension 0, not 1. Periodicity forces ⟨θ⁻¹,1⟩=0 while the printed seed says 1. This disproves the cited **auxiliary finite-level** claims.
- At q=3,n=t,ℓ=1, the zero geometric type gives M=O_n=k-bar[z], t=−z², with σ acting on coefficients only. A finite k-bar[σ]-span has bounded z-degree. Thus it is not a dual t-motive in the paper's finite-generation sense.
- Complementing the q-adic digits of y−1 and −y shows the reflection factor is x^(q−3). The omission matters for transcendental x when q≠3; it is absorbed at algebraic x.
- In the q=3, degree-two constant-field example, corrected ε=(1,−3) pairs with St values (−1/8,−3/8) to give 1. The omitted 1/[K:𝕜] produces 3/2.
- At n=1 the cyclotomic field is the base field; an index q−1 or 1/(q−1) infinite-point count cannot be right for q>2. Constant quadratic fields similarly expose the forbidden raw Γ(0,y).

These do **not** establish that the headline transcendence-degree formula or every period theorem is false. In particular Γ_ari(0) retains the Carlitz-period direction even when its normalized residue-class version loses it. Repairing q=2 can require larger levels or an extra generator; no complete repair is asserted here.

## Remaining extraction gaps

### G1. Atomic extraction

Items 18–19,22,25,27–31,35–36,44–46,49–52,53,55–59,65,72–76,78 still bundle definitions or multiple assertions. Extract each actual formula/proof prerequisite and link it once; introductory duplicates 12/62,15/77 and imported-versus-derived 79/37 are not separate new owners.

### G2. Analytic and duality boundary

Separate coefficient Frobenius, dagger continuation, Betti rank/comparison, evaluation and descent. Supply the τ/σ Hartl–Juschka bridge and exact purity/isogeny scope. Import existing Tate/valuation/category infrastructure; do not re-plan DM.4/DM.8.

### G3. CM and distribution closure

Extract CM-type divisors and ideals, their tensor/restriction/inflation comparisons, essentially-surjective functoriality, de Rham eigenlines, the finite-level dimension lemma, composita and colimit proof, rational quotient C_∞×/k-bar× and normalization P(1). BCPW's special CM group calculation needs its own input beyond DM.8.

### G4. Universal distribution presentation

Items 39–43 now show basic formulas but 44–52 lack all weights, Galois actions, every relation-subspace generator, the ramified Euler-factor two-case evaluator, and the induction/dimension proof. Repair E5–E7 explicitly; a q>2 theorem alone is not the paper's stated all-q target.

### G5. Soliton proof interior

Extract the componentwise CM divisors, h/W functions, three Proposition 5.2.5 divisor identities, sheaf-section modules, Frobenius action, convergence/units, arithmetic half of Proposition 5.3.4 and evaluation. Handle zero types (E8), positive modulus (E12) and monic factors (E9). Generic elliptic-sheaf DM.7 is not a supplier for these formulas.

### G6. Gamma relation presentation

Split all six parts of Proposition 5.4.2 plus geometric specialization; item 58 currently records only corrected part (1). Prove compatibility of raw/normalized gamma maps, including unit conductor and q=2, without using the inconsistent identity in E7. Specify radical/root-extraction meaning of completeness of relations.

### G7. Explicit target closure

Split Theorem 6.3.7 into exact quasi-period orbit, ideal-parametrized lattice, period powers and independent basis. Preserve all conductor/character shifts, n_c rationality, class-number/regulator data. Item 65 remains a synopsis, not an exact design target.

### G8. Logarithmic and Hodge–Pink closure

Extract Kronecker-limit, Drinfeld–Siegel and stable Taguchi-height consequences; acquire Wei 2020 and Namoijam–Papanikolas. Split HP morphisms/strictness, substructures, realization/full-faithfulness, lattice filtration/weights/effectiveness and determinant integral comparison. E20 corrects weight-zero effectiveness; Theorem 7.3.1 only concerns algebraic eigenperiods.

### G9. Ownership before design

Reconcile shared dual-motive/ABP foundations with the three multiple-zeta Part II proposals. Resolve general profinite Galois assembly and classical geometric/analytic providers. Classical HodgeStructures is not Hodge–Pink; number-field Stickelberger/CFT results are not function-field theorems. A keyword search is not a proof that general infrastructure is absent.


## Complete item-change ledger

All 84 original items were checked against the paper and the cited ownership; IDs retained for traceability. Nine new items isolate previously concealed imports/definitions. “Retained” does not certify proof-interior closure: the gap ledger still applies to bundled items.

| Item | Final status | Changed fields |
| --- | --- | --- |
| 1 | library | name, statement, note |
| 2 | missing | retained after source check |
| 3 | missing | retained after source check |
| 4 | missing | retained after source check |
| 5 | planned | statement, note |
| 6 | missing | note |
| 7 | planned | name, statement, planned, note |
| 8 | missing | statement, note |
| 9 | missing | statement, note |
| 10 | missing | statement, note |
| 11 | missing | statement, note |
| 12 | missing | retained after source check |
| 13 | missing | statement |
| 14 | missing | statement, locator, note |
| 15 | missing | statement, note |
| 16 | missing | statement, status, planned, note |
| 17 | missing | statement, status, planned, note |
| 18 | missing | note |
| 19 | missing | status, planned, note |
| 20 | missing | statement |
| 21 | missing | statement, note |
| 22 | missing | note |
| 23 | missing | statement |
| 24 | missing | retained after source check |
| 25 | missing | retained after source check |
| 26 | missing | statement, locator |
| 27 | missing | statement |
| 28 | missing | statement |
| 29 | missing | statement |
| 30 | missing | retained after source check |
| 31 | missing | retained after source check |
| 32 | missing | retained after source check |
| 33 | missing | statement |
| 34 | missing | statement |
| 35 | missing | retained after source check |
| 36 | missing | retained after source check |
| 37 | missing | retained after source check |
| 38 | planned | name, statement, note |
| 39 | missing | statement, note |
| 40 | missing | statement, note |
| 41 | missing | statement |
| 42 | missing | statement |
| 43 | missing | statement, note |
| 44 | missing | retained after source check |
| 45 | missing | retained after source check |
| 46 | missing | statement, note |
| 47 | missing | locator, note |
| 48 | planned | locator, note |
| 49 | missing | retained after source check |
| 50 | missing | statement, note |
| 51 | missing | retained after source check |
| 52 | missing | statement, note |
| 53 | missing | statement, note |
| 54 | missing | statement, status, planned, note |
| 55 | missing | locator, note |
| 56 | missing | statement, note |
| 57 | missing | statement, note |
| 58 | missing | statement, note |
| 59 | missing | statement, note |
| 60 | planned | name, statement, planned, note |
| 61 | missing | statement, note |
| 62 | missing | statement, note |
| 63 | missing | statement, note |
| 64 | missing | statement, note |
| 65 | missing | statement, note |
| 66 | missing | statement, note |
| 67 | missing | statement, note |
| 68 | missing | statement, note |
| 69 | missing | retained after source check |
| 70 | missing | retained after source check |
| 71 | missing | statement, note |
| 72 | missing | statement, note |
| 73 | missing | retained after source check |
| 74 | missing | retained after source check |
| 75 | missing | retained after source check |
| 76 | missing | name, locator, note |
| 77 | missing | statement, note |
| 78 | missing | statement, note |
| 79 | missing | status, planned, note |
| 80 | planned | statement, locator, note |
| 81 | planned | statement, planned, note |
| 82 | planned | statement, note |
| 83 | library | library, note |
| 84 | library | note |
| 85 | planned | added by review |
| 86 | missing | added by review |
| 87 | library | added by review |
| 88 | missing | added by review |
| 89 | missing | added by review |
| 90 | missing | added by review |
| 91 | missing | added by review |
| 92 | missing | added by review |
| 93 | missing | added by review |

## Verification

All commands below passed before submission: paper validator; 9 paper tests, 7 source-issue tests and 3 queue tests; 676 exact digit identities plus the stated boundary and inventory assertions.

- python3 scripts/check_paper.py research/blueprint/papers/PAPER-WEI-26.result.json
- python3 -m unittest discover -s tests -p test_check_paper.py
- python3 -m unittest discover -s tests -p test_source_issues.py
- python3 -m unittest discover -s tests -p test_papers_queue.py

A scratch standard-library Python check enumerates all canonical digits for q∈{2,3,4,5,7}, ℓ∈{1,2,3}, checks exact fractional-part sums, the degenerate witnesses, q=3 epsilon normalization, conductor-one and overlapping-case arithmetic, and 93 unique items / 23 reviewed findings / exactly-one routing of all 80 missing items. Its essential witness computations are reproduced above; it is not a numerical test of the full gamma functions.

No Lean file belongs to this review; none was compiled. These checks validate schema/regressions and the stated finite witnesses, not a formalization of the paper.
