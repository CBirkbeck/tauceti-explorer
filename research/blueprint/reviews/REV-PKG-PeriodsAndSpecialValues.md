# Independent package review: PeriodsAndSpecialValues

**Verdict: needs_changes.** This is the completed review of issue #10907, not a checkpoint. Codex, session `codex-WuvbPh`, reviewed the package by Claude, session `claude-RbFn0X` (package issue #10775). The reviewer did none of that package job. The input is commit `ca4e4472860c050c63eef495127ed230f7f80a3f`; the bot confirmed this session's claim. Feasible corrections are applied in the package. Six mathematical prerequisite groups remain unclosed and prevent an upstream draft.

The review read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE and PACKAGE_REVIEW; the accepted root, PS.0 and PS.8 packets and reader material; the reviewed library audit; and the tier map. Multiquadratic and UniversalCovers were the two complete atlas-snapshot README models. Current IntegralLattices and LocalGaloisGroups supplied representative Suggested.lean models. Only the package README and Suggested.lean, review verdict, this report and this review's handoff are changed; no packet or supplier is edited.

## Exact remaining blockers

These are missing constructions or proof inputs, not failures of the final Lean elaboration. Merely making each item an assumed structure would not close the roadmap.

| ID | Affected targets | Missing input and what closes it |
| --- | --- | --- |
| R1 | PS.0.5 | ComplexComparisonPartII C5 supplies proper smooth comparison and curve residue localization, but no named target identifies the proper elliptic second-kind class `xω`, the displayed closed homology basis and the integration pairing. Supply those constructions, the independence of the two de Rham classes and the nondegenerate pairing, with a source-backed route. The corrected matrix formula is then `I = B⁻¹` for cycle-row/form-column integration matrix B. |
| R2 | PS.2.1, hence PS.2.2 | C5 does not provide comparison for arbitrary algebraic pairs `(X,Y)`, natural for morphisms, boundary maps and relative products, equal to actual integration. Proper smooth comparison and a curve localization sequence do not imply the claimed formal-symbol evaluation. Give this relative comparison an owner and prerequisite chain, including the boundary and product identifications. |
| R3 | PS.3.1, PS.5.1 and the general noncommutative route through PS.5 | GeneralAlgebraicKTheory §§4.15–4.17 provides split relative groups and their boundary, not the Picard category of virtual objects and determinant functor on perfect complexes used in BF §§2.1–2.5, pp. 504–509. The finite-prime gluing into `Cl(O,ℝ)` in BF §§2.8–2.9, (12)–(15), is missing as well. Supply both constructions with exact-sequence, symmetry, base-change and quotient compatibilities. The real/finite reduced-norm image theorem is already ClassicalArithmeticCompletion §7.60 and is not an additional gap. |
| R4 | PS.6.6–PS.6.7 | AL.3 supplies analytic Rankin–Selberg normalization and SelmerIwasawaCohomology L2–L4 supplies finite conditions. Neither constructs the relevant Galois systems, common strong coefficient field, full L1–L7 admissibility, diagonal Abel–Jacobi class, level-raising/bipartite Euler systems, or LTXZZ Theorems 8.2.2 and 8.3.2. Assign named owners with source-backed decompositions and preserve every arithmetic hypothesis. LTXZZ Proposition 3.2.4/Definition 3.2.5, p. 145, and §§8.1–8.3, pp. 303–316, locate the missing inputs. The derivative-to-class step remains explicitly conditional. |
| R5 | PS.8.4 | IntegralLattices 5H/6A classifies abstract lattices under hypotheses; it does not prove that the resolved quartic's integral K3 cohomology is torsion-free, even and unimodular of signature `(3,19)`. Supply that geometric theorem and its proof route before applying the embedding theorem. The marked complement is the actual transcendental lattice only where `NS = M₂`; Picard-rank jumps do not satisfy that identification. |
| R6 | PS.8.17 | SS explicitly does not identify its twisted computation with crystalline Frobenius; SH does not repair this. General CR.5–CR.7 and RD.3 do not give the family-specific Dwork–crystalline comparison, a semistable boundary model, the compatible log comparison, integral torsion-freeness or the transported lattice/change of basis. Give `quinticDworkComparison`, `quinticLogComparison` and `quinticTransportedLattice` source-backed constructions with the projective/affine/completion comparisons. No integrality conclusion follows from SH's formal matrix before this is done. |

The README marks each blocker at its use and in the relevant supplier contract. These marks preserve the promised targets while exposing their unclosed proof paths; they are not a substitute for the missing plans.

An inherited obligation also remains visible: NeronModelsAndSemistableAbelianVarieties has the actual node `strict-compatible-system-export` for all `Hⁱ(A)`, but its proof uses the unresolved `G-strict-compatibility` input (Noot and Saito descent). This is a named supplier target with an inherited proof-input gap, not a newly missing all-degree extension. Supplier acceptance and completion remain prerequisites for upstream submission.

## Applied mathematical and ownership corrections

- **Comparison direction:** the explicit elliptic integration matrix is inverted without transposition. The nonsymmetric matrix `[[1,2],[0,1]]` gives `[[1,−2],[0,1]]`; a new real-bodied Lean definition and two proved examples pin the convention. The cycle-index check now distinguishes multiplication of det B from division of det I. Determinant-only checks could not detect this error.
- **Extended boundary:** PS.5.1 now gives the actual correction `∂ℝ Nrdℝ⁻¹(λx) − Σₚ ιₚ∂ₚ Nrdₚ⁻¹(λ)`. The rational central multiplier λ need not be a global or real norm. Each finite reduced norm is surjective, only finitely many corrections survive, and `ιₚ` is defined on the boundary image `K₁(Aₚ)/im K₁(Oₚ)`, not on arbitrary local relative K₀. Independence of λ is a gluing theorem still covered by R3. The scalar obstruction sign has a computed valuation witness.
- **Ownership:** removed PS.3.4, whose number-field/Borel and restricted CM regulator applications already belong to BorelRegulators R.7 and EllipticRegulators ER.5. Their factor-two and maximal-order/class-number-one qualifications remain in prerequisites and boundaries. The 79 input targets become 78 retained targets; no removed stub remains. PS.4.2 explicitly retains a finite-length DVR specialization distinct from PMIA's general commutative/Iwasawa determinant construction.
- **Suppliers:** corrected Rankin–Selberg from AL.5 to AL.3; geometric number-field duality from WC.2 to EDC.2's actual pairing and Galois-equivariance nodes, with MC.2 realization transport; blow-ups from SchemeAndStackFoundations §4.11 alone to its StableReduction Layer 4 import; conductor assembly to use R01's prime-to-coefficient-prime ideal and independent local data with the discriminant factor. The modular Schwarzian identity is now a local target with its formula and nonramification domain, not an output attributed to the formal Tate cusp. The false downstream dependency of RankZeroOneBSD on PS.6 is removed; the scalar-to-line transport is PS.6.4.
- **Quartic geometry:** distinguished the marked rank-three complement from the generic actual transcendental lattice; corrected the source of the symmetric-square identity to H §4.8, proof of Theorem 4.37 and Proposition 4.38; retained the distinct LYH identity. Added numeric dual-action witnesses at `p=i`, explicit Frobenius-series coefficients and compositional-inverse integrality checks.
- **Quintic:** renamed the constant Lean matrix `quinticBoundaryPairing`; the full flat pairing remains a README target. Restricted integral construction to odd `p ≠ 5`, made the missing crystalline/log bridge explicit and specified that the Artin–Hasse product is degreewise finite. Added raw-versus-normalized Frobenius and strict harmonic-pair checks; counting both orders doubles the symmetric pair weight, while simply reversing their order does not change it.
- **Multiple zeta values:** restricted stuffle to encoded positive indices `H¹`, while shuffle remains on the full word algebra; specified the encoding bijection. The 2-adic matrix criterion now has nonzero diagonal and explicit zero-entry alternatives because Mathlib's total valuation gives `v₂(0)=0`. Added `Module.Finite` to the numerical weight-span theorem so an infinite-dimensional space with total `finrank = 0` cannot satisfy a vacuous bound.
- **Checks and locators:** strengthened computed, degenerate and negative examples throughout, including the two regularizations, period rescaling, finite determinant signs, pair weights and positive/admissible indices. The Legendre worked example now doubles the analytic error budget when passing from K to the oval period 2K. Corrected the Beineke initial, BF Conjecture 1 locator, DG printed page ranges, IKZ proof range, and the internal Brown Lemma 3.8 arithmetic slip. BCGP bad-place local data are rational functions, not polynomial claims. The original shifted NE.7 zeta-isomorphism convention was already correct and was checked, not presented as a new fix.

## Source verification

The package author marked all inherited paper locators unverified, so the pass reopened all source families rather than stopping at fifteen. In addition, the reproducible random sample is `random.Random(10907).sample(original_targets, 15)` on the original README order. It selects PS.0.3, PS.0.4, PS.1.2, PS.1.4, PS.1.5, PS.2.1, PS.2.2, PS.2.3, PS.6.4, PS.6.7, PS.8.2, PS.8.7, PS.8.10, PS.9.15 and PS.9.21 (shown here sorted). The all-source pass includes every one. Public PDFs were downloaded separately, hashed and read; no restricted library book or other copy of a restricted book was used. Receipts below match the accepted plan's source hashes. Page numbers in the package are printed pages unless explicitly called PDF pages.

| Source | Passages read and result |
| --- | --- |
| Deligne, Ghate–Beineke translation | §§0.2–0.4; §§1–3; §§5.1–5.2, pp. 15–18; §§6.3–6.7, pp. 20–22; §7.8, p. 25. Confirmed geometric infinity action, inverse comparison, Tate scaling, plus/minus quotients and normalized finite values. The French original was not collated; the package explicitly cites the translation. |
| HMS, arXiv v5 | Definition 2.8/Remark 2.9 and Theorems 2.10/3.3, pp. 10–13. The general pair comparison needed to identify integration with formal-period evaluation is R2, not supplied by reading HMS's torsor statement alone. |
| BCGP, arXiv v3 | Conjecture 1.1.1, pp. 3–4; §2.8, pp. 35–38, including Proposition 2.8.1 and Corollary 2.8.7. Confirmed gamma convention, duality and all-degree compatibility; bad-place factors in the conjecture lie in `ℚ(T)`. |
| Serre | §§3.1–3.3, printed 19-9–19-10; §4.1, (26), printed 19-11–19-12; C9 later in §4. Conductor/discriminant formula checked in page images where OCR loses formulas. |
| Tate, 1977 notes | §3.4, printed p. 15, definitions/conventions (page image). Used only for additive-character/self-dual-measure/local-constant conventions. No theorem of Tate's thesis is planned or imported as a target. |
| BF | §§2.1–2.5, pp. 504–509; §§2.8–2.9, (12)–(15), pp. 516–517; §§3.1–3.5, pp. 517–529; Theorem 3.1 statement, p. 531; Conjectures 4–6, pp. 535–537; Theorem 4.1 statement, p. 539. Determinant-category/gluing gaps, boundary formula, sign, finite corrections and conjecture scopes checked. Later proof pages were not independently reconstructed. |
| BV, publication and author final | Published Definition 2.5, pp. 170–171; Definition 3.7, p. 177; §4.3, pp. 187–190; Theorem 5.5/Remark 5.6/Corollary 5.7, pp. 193–198. Compared author-final p. 27: the published Corollary 5.7 uses rational-valued characters. The permutation-character overstatement is excluded by the C₂ sign-character witness. |
| BK | Definition 5.5 and P1–P4, pp. 371–372; Proposition 5.4, pp. 370–371; §§5.6–5.15, pp. 372–377; isogeny discussion p. 379; Theorem 6.1, pp. 382–383. Checked all-prime versus fixed-prime finiteness, good mass orientation, weight cut and the weight −1 adapter. |
| LTXZZ | Definition 1.1.3/Theorems 1.1.5, 1.1.9/Remark 1.1.10, pp. 110–113; Proposition 3.2.4/Definition 3.2.5, p. 145; Definition 8.1.1, pp. 303–304; Theorems 8.2.2, p. 309, and 8.3.2, pp. 315–316, with Conjecture 8.3.1. All L1–L7 and class-nonvanishing hypotheses retained. |
| Johansson | §§1–3, pp. 1–6. Confirmed certified quadrature and analytic-domain requirements; these do not prove exact recognition of a normalized value. |
| H (Hartmann), arXiv v1 | §§4.1–4.8, PDF pp. 10–26: quotient/resolution, lattice theorem, Picard–Fuchs equation, monodromy, period basis and modular normalization. Symmetric square is §4.8, p. 25, not LYH Proposition 3.1. The unimodularity hypothesis remains necessary in the lattice application. |
| LYA, arXiv v3 | §4.1, (4.3), printed p. 8; §§4–5, pp. 11–16; §5.5, (5.18)–(5.19), p. 21; §6, pp. 22–23. Confirmed the Schwarzian formula, `J=j/1728`, polynomial and integrality criterion. |
| LYH | Proposition 3.1, printed pp. 3–4. Its hypergeometric expression with derivative and `(1−λx)` is a different identity; it is not used as the source for PS.8.7's Clausen square. |
| SH, arXiv v2 | §§3–4, pp. 3–10; §§5.4–5.9 and Theorem 5.13, pp. 11–14; Definition 6.1/Lemmas 6.2–6.3 and §§6.1–6.4, pp. 14–19. Checked convolution indices, normalization, the `24/25` constant and formal boundary matrix. There is no Theorem 6.1 in this version. |
| SS | §§2–3, pp. 11–13. The Dwork calculation does not establish equality with crystalline Frobenius; this is the explicit R6 gap. |
| IKZ | §§1–3, pp. 307–315, including Proposition 1, p. 309, Theorem 1/proof, pp. 310–312, and Theorem 2/Conjecture 1, pp. 314–315. Checked the polynomial regularizations, ρ and absence of a completeness theorem. |
| DG | §§1.1–1.9, printed pp. 3–17; §§2.1–2.3, pp. 18–20; §2.14 and §3.11–3.13; §4.4, p. 47, §§4.17–4.18, p. 53; §§5.1–5.4, pp. 56–57. Checked the unramified mixed Tate category, regulator full faithfulness, word/path-torsor descriptions and tangential points. |
| Brown, arXiv v1 | pp. 1, 3–19, including Theorem 2.4, Theorem 3.3, Lemma 3.8, Theorem 4.3, cut matrix and Lemma 7.1/Theorem 7.3. Checked coaction factor order, strict `r<N`, reversal of indices, factor 2, and determinant argument. In Lemma 3.8's proof the intermediate odd-zeta sum has coefficient −1 after the preceding division by 2; the final lemma's factor 2 remains. |
| Zagier | pp. 978–990: Theorem 1, p. 981, Propositions 1–6 and Lemma 2. Checked coefficient reversal, growth bounds and the analytic uniqueness route, not just weight-five values. |
| Soudères, arXiv v3 | Definitions 3.7/Proposition 3.8 and proof, pp. 10–12; §4.4/Proposition 4.24 and its proof, pp. 23–26. Checked framed-motive transport for convergent shuffle and stuffle; period-map injectivity is not used to lift a numerical identity. Font extraction was decoded and p. 10 checked visually. |
| NS | Printed p. 9, (26), and p. 14, (39). Confirmed the period normalization corrections recorded against H. |

## Adversarial pass over every input target

Each row records actual instances or boundary cases inspected in the statement, including negative controls. “Retained” means no further defect found in this pass, not a proof or a claim that Lean's `sorry` checks truth. The six blockers above and inherited supplier obligations qualify all dependent rows. Light definitions have real Lean bodies; heavy definitions retain API and checks in the README and are named in the closing Lean comment. Every retained subsection has at least three Checks; the count alone was not used as a mathematical test.

| Target | Instances and convention witnesses | Result |
| --- | --- | --- |
| PS.0.1 | Rank zero determinant is 1; rank one Betti scaling 2 and de Rham scaling 2 act in opposite directions; `C⁻¹PA` versus `A⁻¹PC`. | Retained the basis-change direction; geometric comparison required, not just equal ranks. |
| PS.0.2 | Tate twists 0, 1, 2 have infinity signs +, −, +; compare E-linear infinity action with semilinear scalar conjugation. | Retained; these are distinct involutions. |
| PS.0.3 | One simultaneous unit across embeddings: `(√2,−√2)` versus `(√2,√2)`; `i/1` is not a rational unit. | Retained the full coefficient-field orbit, not independent component scalings. |
| PS.0.4 | Zero-dimensional sign part gives 1; Tate odd/even twists select opposite signs; a noninvertible quotient comparison is excluded. | Retained the isomorphism hypothesis and Tate power, not its inverse. |
| PS.0.5 | Twists −1,0,1,2; nonsymmetric upper triangular B, identity B and diagonal `(2,1)`. | Fixed inverse-transpose error; two proved Lean examples. Elliptic input R1 remains. |
| PS.1.1 | Unit motive has `P=1−T`; a Steinberg WD representation needs `ker N`; conductor over ℚ is 1 for unit data, over ℚ(i) is 4 with discriminant. | Fixed all-place conductor assembly and the inertia negative control. |
| PS.1.2 | Complex gamma at 1,2,3; real gamma poles at 0,−2; rank-zero product is 1. | Retained the factor 2 per complex block; BCGP rational bad-place data qualified. |
| PS.1.3 | Unit critical m=2,−1 versus 0,1; `(p,q)=(0,1)` has only m=1; a zero-rank Hodge list is vacuous. | Retained both the motive and dual regularity tests. |
| PS.1.4 | `L=0,c=1` versus `c=0`; rational 2 is a unit coefficient but i is not; ζ(2)/(2πi)²=−1/24. | Retained nonzero-period condition and separate unit refinement; added concrete unit checks. |
| PS.1.5 | χ trivial at n=2; odd/even parity; omitted Euler factor vanishes. | Retained character/inverse and finite-value convention; zero corrections use leading terms. |
| PS.1.6 | Weight 2 has critical integer 1; weight k allows 1 through k−1; rescaled modular symbols change scalars but not period classes. | Retained actual rational-structure comparison and GL₂/ℚ scope. |
| PS.1.7 | Unit ζ functional equation exchanges s and 1−s; dual epsilon factors multiply to conductor; changing weight changes centre. | Retained as predicate in general; no general continuation theorem invented. |
| PS.1.8 | g=0 gives only H⁰; elliptic g=1 gives H⁰,H¹,H²; duality must act on geometric, not absolute Galois, cohomology. | Corrected EDC.2 ownership; R11 all-degree node exists with inherited gap. |
| PS.2.1 | Interval pair `(A¹,{0,1})` integrates dx to 1; Stokes boundary; inverted Tate symbol needs nonzero evaluation. | R2 exposed: proper smooth comparison alone does not justify these pairs. |
| PS.2.2 | Noncommuting P,Q,R give `PQ⁻¹R ≠ RQ⁻¹P`; evaluation at t=1 has kernel `(t−1)` in the Tate torsor algebra. | Added explicit heap matrices; no torsor-point injectivity assertion. |
| PS.2.3 | t times t⁻¹ evaluates to 1; t⁻² to `(2πi)⁻²`; the two points ±√2 change an algebraic period sign. | Retained Laurent, not effective polynomial, coordinate algebra. |
| PS.3.1 | Zero cohomology factor is the unit; ΔΞ=1; real quadratic units distinguish R from R⁻¹; rationalization erases finite torsion. | Noncommutative determinant-category gap R3 exposed; exponent retained. |
| PS.3.2 | Tate zero-rank regulator; imaginary-quadratic zero-rank terms; CM class-number-one/maximal-order limitations. | Kept real trivialization; regulator ownership deferred to R.7/ER.5. |
| PS.3.3 | A simple zero gives derivative, a double zero gives derivative/2, a simple pole uses negative order. | Retained nonzero leading coefficient and distinct rationality predicate. |
| PS.3.4 | Number-field Borel and restricted CM specializations compared with their actual R.7/ER.5 owners. | Deleted duplicate target; qualifications preserved only in boundaries. |
| PS.4.1 | Zero lattice, finite torsion rationalizing to zero, and nonperfect F₂ over ℤ₂[C₂]. | Retained perfectness/coherence; nonperfect torsion cannot be fed into a perfect determinant. |
| PS.4.2 | DVR map π³ in degrees 0,1 gives π³O and in −1,0 gives π⁻³O; the zero map is not acyclic; ramified uniformizer differs from p. | Scoped retained finite-length variant; coherent cones/termwise exact comparisons, not arbitrary triangle naturality. |
| PS.4.3 | Unramified rank one with `1−Fr` invertible; eigenvalue 1 retains cohomology; ℚp(1) needs tangent term at p. | Retained inverse local L-factor versus direct determinant and separate crystalline place. |
| PS.4.4 | Real place at p=2 has unbounded complete Tate cochains; odd p inverts group order; no-real-place case. | Retained bounded-perfect replacement or explicit dyadic exclusion. |
| PS.5.1 | Hamilton quaternion central multiplier −1; scalar boundary of 2 has valuation +1 and regulator term −1; unit −1 boundary zero. | Wrote exact corrected boundary and restricted gluing domain; R3 remains. |
| PS.5.2 | Nonzero rational relative class is not integral; inverting 2 loses dyadic information; ℚ(1) predicts order −1. | Retained four separate conjectural assertions and both cohomology terms in the order. |
| PS.5.3 | Shift `[1]` inverts the line; a two-term determinant distinguishes ζ from ζ⁻¹; order and `cγ` power both reverse. | Original `C′=RΓc[1]`, a=ζ, boundary plus, order −m and normalization retained after checking NE.7/BV. |
| PS.5.4 | C₂ sign character is rational-valued but not a permutation character; p=2 outside BV; ℤ[1/2] result is not integral at 2. | Retained published ℚ-valued scope and all nonvanishing/source hypotheses. |
| PS.6.1 | Change only the de Rham lattice by a prime; off-diagonal ℓ agreement without crystalline agreement; unit pair violates weight ≤−3. | Retained P2 lattice quantifiers, all-prime P3 and separate geometric origin. |
| PS.6.2 | Zero triple has all point groups/Sha zero and Tam=1; good mass `1−a`, not reciprocal; top-form scaling 2 has cancelling real/2-adic factors. | Retained probability normalization before infinite product and distinct primal/dual torsion. |
| PS.6.3 | Rank zero regulator=1; two real components double the identity-component period; index-3 sublattice multiplies regulator by 9. | Retained conditional prime-part equivalence, squared torsion denominator and dyadic restriction; removed unnecessary endpoint dependency here. |
| PS.6.4 | A proof away from 2 leaves 2 unresolved; rank equality without Sha/leading term is insufficient; finite support fully certified gives exact identity. | Retained imported endpoint hypotheses; scalar-to-line adapter has no reverse supplier dependency. |
| PS.6.5 | Weight −1 elliptic motive excluded, weight −4 Tate candidate admitted with data; ⊕p ℤ/p is not finite; form rescaling cancels globally. | Retained total finiteness and weight scope, not primary finiteness alone. |
| PS.6.6 | One coefficient place does not satisfy all-λ quantifier; derivative case needs root number −1; a vector in several copies shows nonzero, not dimension one. | Corrected AL.3; missing arithmetic systems and class R4 exposed. |
| PS.6.7 | Nonadmissible λ excluded; nonzero class need not prove nonzero L derivative; n=2,F⁺=ℚ is a separate source case. | Retained L1–L7 and geometric hypotheses; missing theorem suppliers R4 exposed. |
| PS.7.1 | Arctan S₀=1,S₁=2/3,S₂=13/15; λ=0 transformed integral gives π/2; λ=1 denominator vanishes; N=0 disallowed. | Added exact Legendre integrand/midpoint checks and positive panel count; doubled the certified budget for 2K in the worked example. |
| PS.7.2 | Denominator box contains zero; known integer candidate separation versus mere overlap; vanishing Euler correction. | Retained sound boxes and exact recognition hypotheses, not numerical algebraicity. |
| PS.7.3 | Rational period scaling changes normalized scalar inversely; CM/numerical unit scaling differs from conjugation; coefficient embeddings must agree. | Corrected deleted PS.3.4 reference to PS.3.2; retained covariance. |
| PS.7.4 | Rank-one Tate period; finite étale algebraic periods; exact relation versus close enclosure. | Retained period-map injectivity and special-value claims as predicates. |
| PS.8.1 | Quartic zero vector/all-ones values and fourth-power scaling; product-one diagonal quotient order 16 rather than 64; conifold t⁴=1 excluded. | Corrected StableReduction blow-up supplier; explicit six A₃ resolution remains local. |
| PS.8.2 | At t=0 coefficient at z₃=1 is πi/2, at z₃=2 is πi/16; z₃=0 outside chart. | Added numeric coefficient checks; no claim those sample coordinates all lie on one fibre. |
| PS.8.3 | Pulled-back operator on monomials k=−3,…,9; constant term −3/(32t⁴); top derivative coefficient vanishes at t=1. | Confirmed multiply by 1/t and factor `(1−t⁴)/64`; excluded t=0 in pullback chart. |
| PS.8.4 | Gram determinant −4; period line p=0,1,i; norm with conjugation is `8(Im p)²`; Picard-rank jump. | Added positivity/generic-NS qualification; geometric K3 lattice R5 remains. |
| PS.8.5 | All five isometries, ordered product and nilpotence; p=i reflection gives i/2, infinity gives 4+i; direct nondual action fails. | Independent rational checks passed; explicit dual-action witness added. |
| PS.8.6 | A₁=24,A₂=2520; g₁=104,g₂=12276; h₀=h₁=0,h₂=10816,h₃=2293824; harmonic zero term. | Computed series and recurrence; coefficients added as discriminating checks. |
| PS.8.7 | At z=0 both sides are 1; first coefficients 24 and 2520; wrong 256 scaling fails. | Symmetric square checked through degree 8; corrected source to H §4.8. |
| PS.8.8 | Square-root sign change swaps u±v; zero u−v or u+v excluded; translated chart has p≠1. | Retained separate based charts/reflections and nonzero denominators. |
| PS.8.9 | Linear term 1; q coefficients 104,15188,2585184; inverse coefficients −104,6444,−311744. | Independent compositions checked through degree 8; parameter 256 scaling retained. |
| PS.8.10 | Lowest polynomial part −x²+xy; q³ forces y₂=−104; `1/J` has leading coefficient 1728. | Polynomial verified through q⁸; explicit local Schwarzian target/domain/source added. |
| PS.8.11 | Inverse recursion gives q₂=104 and q₃=15188 from Z; polynomial `2y−2x−x²` needs multiplier 2. | Retained integral inverse argument and nonunit implicit-function multiplier qualification. |
| PS.8.12 | Quintic zero vector/all-ones and fifth-power scaling; invariant projector denominator 125; p=5 excluded for integral projector. | Retained full smoothness exclusions and family model. |
| PS.8.13 | λ=0 gives regular nilpotent N with N³≠0,N⁴=0; λ=1/5 gives g=1/2; λ=−1/5 denominator zero. | Added connection values; boundary J has determinant Y⁴ and requires Y≠0 for nondegeneracy. |
| PS.8.14 | p=3 raw last diagonal 9 versus normalized 1; λ³-semilinearity versus linearity; pairing scale 27 versus 1. | Added normalization witnesses; no assertion of crystalline equality before R6. |
| PS.8.15 | B₀=B₁=1,B₂=1/2; Bp=1/p!+1/p; strict pair weights 0,0,0,1/2,1,35/24; formal degreewise product. | Artin–Hasse inequality checked algebraically and numerically for p=3,5,7,11,n<160; convergence route retained. |
| PS.8.16 | p=3,Δ=0 diagonal 27,9,3,1; transpose fails horizontality when C≠0; pairing cannot determine C. | NF=pFN and pairing tested in 45 parameter triples; actual C still sourced from sums. |
| PS.8.17 | p=5 cannot use integral projector; arbitrary eᵢ lattice cannot be declared integral; formal matrix versus crystal at boundary. | Source-backed comparisons and lattice proof input R6 exposed, not resolved by naming targets. |
| PS.9.1 | Empty index/tuple gives 1; [0] not positive, [1] not admissible, [2,1] admissible; strict tuple `(2,1)` term 1/4. | Added positive-index/tuple controls; retained summability guard for total tsum. |
| PS.9.2 | Encode []/1/2,1; decode 001101 gives [3,1,2]; word 0 outside H¹; shuffle 01 with 01 has multiplicities 4 and 2. | Restricted stuffle domain; positive encoding bijection and multiplicities retained. |
| PS.9.3 | Empty integral is 1; [2] gives positive ζ(2); endpoint 1 letter diverges without tangential regularization. | Retained ω₁=dt/(1−t), path orientation and admissible endpoints. |
| PS.9.4 | Weight four shuffle gives coefficient 4 for [3,1]; ζ(3,1)=ζ(4)/4 and ζ(2,2)=3ζ(4)/4. | Retained convergent shuffle/stuffle and multiplicities. |
| PS.9.5 | Empty word maps 1; [1,1] differs by −ζ(2)/2 in stuffle; [1,2] gives different linear polynomials. | Retained formal T, not a chosen ζ(1) value; both extensions agree on admissibles. |
| PS.9.6 | ρ(1)=1,ρ(T)=T,ρ(T²)=T²+ζ(2),ρ(T³)=T³+3ζ(2)T−2ζ(3). | Retained linear triangular operator, explicitly nonmultiplicative. |
| PS.9.7 | Apply ρ to `(T²−ζ(2))/2`; compare 1 shuffled/stuffled with 01; remaining relation is ζ(2,1)=ζ(3). | Retained regularized identity, not relation completeness; corrected proof locator. |
| PS.9.8 | Mixed Tate zero object and unit ℚ(0); Ext weights 0/negative excluded; mixed Hodge structure alone not a motive. | Retained Beilinson–Soulé and unramified motivic input rather than an arbitrary realization category. |
| PS.9.9 | Ext¹ at weight 1 over ℤ is zero; odd weights ≥3 one dimensional; even positive weights zero. | Retained integral-base/unramified category and regulator injectivity inputs. |
| PS.9.10 | Tangents +1 at 0 and −1 at 1; empty path coefficient 1; reverse path changes word/order signs. | Retained de Rham word model, regularized endpoints and motivic path comparison. |
| PS.9.11 | Empty motivic index 1; ζᵐ(2) has nonzero period; descending [2,1] corresponds to reversed encoded word 110. | Retained largest stable ideal, not the full numerical kernel. |
| PS.9.12 | Δ1=1⊗1; Δζᵐ(2)=1⊗ζᵐ(2); Δζᵐ(3)=1⊗ζᵐ(3)+ζᵃ(3)⊗1. | Retained A in first tensor factor, empty cuts and unitality. |
| PS.9.13 | Dimensions d₀=1,d₁=0,d₂=1,d₅=2; no f₁; Hilbert product equals 1. | Retained noncanonical alphabet choice and central f₂. |
| PS.9.14 | N=3 has no r with 3≤r<N; ζᵐ(5) killed by D₃; D₃ζᵐ(2,3)=−2ζᴸ(3)⊗ζᵐ(2). | Retained one-dimensional kernel, strict inequality and N≥2. |
| PS.9.15 | n=1 shifted value −2ζᵐ(3); n=2 gives −2ζᵐ(3)ζᵐ(2)+2ζᵐ(5); motivic weight-four shuffle. | Soudères supplies framed-motive transport; no inference from period injectivity. Brown intermediate slip recorded. |
| PS.9.16 | c(0,0,1)=1; (c(1,0,1),c(1,0,2))=(−2,9/2); reversed a,b gives 3,−11/2. | Exact rational coefficients checked; descending reversal retained. |
| PS.9.17 | oneThree 0,0/1,0/0,1 gives [3]/[2,3]/[3,2]; weight-five sum agrees with stuffle; all-two exponent 0 gives 1. | Retained Zagier numerical theorem and analytic uniqueness route; explicit index checks added. |
| PS.9.18 | a=b=0 tautology; weight-five coefficients; αζ(N)=0 implies α=0 using ζ(N)>0 only. | Retained coaction induction; no general numerical period injectivity. |
| PS.9.19 | Empty word at weight 0; [2,3] accepted, [1]/[4] rejected; weight 6 levels 0,2 nonempty and level 1 empty. | Word counts independently checked to weight 15; parity/level lowering retained. |
| PS.9.20 | Weight 3 matrix (1); weight 5 matrix determinant 5/2; doubled second column upper triangular mod 2. | Retained row-source convention and descending prefix bijection, including r=N. |
| PS.9.21 | Invertible [[1,1],[2,1]], singular all-ones, singular zero diagonal [[0,1],[0,1]], determinant 5/2. | Added zero alternatives/nonzero diagonal; total valuation cannot accept singular zero-diagonal matrix. |
| PS.9.22 | Weight 0 unit, weight 1 zero, weight 5 two words; invertibility precedes basis independence. | Retained motivic basis theorem, not numerical independence. |
| PS.9.23 | Empty index at weight 0, no indices at weight 1, ζ(2) at weight 2; image of finite spanning set. | Added Module.Finite in Lean; finite upper bound only, no numerical basis/dimension equality conjectured as theorem. |

The checks use finite-rank determinant conventions over fields or perfect complexes, not arbitrary complexes. DVR examples use the uniformizer, not the rational prime in a ramified coefficient ring. Dyadic real places are explicitly separated, the quintic integral projector excludes p=5, empty MZV words are included, and all analytic/formal substitutions record their domains. The stated predicates do not acquire theorems from these sanity checks.

## Current duplication and dependency audit

The current roadmaps and current library were read only; no lake command was run there. The local roadmap checkout records revision `0d144d044dacebca17b654695b6f1ad58f159b27`. Additional individual current-main README reads used upstream revision `337f5042f13cff22bffd98c11131d9e13c90f9ec` for ClassicalArithmeticCompletion, PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations, ComplexTori and DerivedModuleAlgebra. The current Tau Ceti library is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Every target was compared by mathematical object, using operators, hypotheses and structure fields as well as names. This included all nine post-snapshot roadmaps (AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory including its nested topics, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry) and Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases, RestrictedProducts. Candidate hits were read. Generic pre-Schwarzian/conformal results are not the modular-j Schwarzian identity; simplex Stokes and generic Fubini are not the motivic three-punctured-line iterated-integral theory. No exact additional replacement was found there. Existing Gram-matrix coordinates are cited, not redeveloped.

| Candidate | Ownership decision |
| --- | --- |
| PS.3.4 regulator specializations | Removed. BorelRegulators R.7 and EllipticRegulators ER.5 own the results; only boundary qualifications remain. |
| PMIA §5.1 | Imported commutative determinant/acyclic trivialization and characteristic-divisor construction. PS.4.2 is explicitly a finite-length DVR specialization, not a duplicate general construction. |
| ClassicalArithmeticCompletion §§7.10,7.60 | Imported reduced norms and local/global norm images; no new reduced-norm-image theorem is planned here. |
| SchemeAndStackFoundations §§1.17,1.23,4.11 and StableReduction L4 | Imported general finite quotient, modification/strict transform and blow-ups. PS.8.1 retains the family-specific quotient and six A₃ resolution. |
| IntegralLattices 5H/6A and current Gram API | Imported abstract lattice theorems and coordinate API. The geometric integral K3 input remains R5. |
| ComplexTori and DerivedModuleAlgebra | Current torus/Roby-law constructions do not give the motivic geometric comparison or noncommutative virtual determinant category. No duplicate target found. |
| C5, GeneralAlgebraicKTheory L4, Selmer L2–L4, CR/RD | Read named contracts rather than inferring extra mathematics from roadmap titles; the exact absent inputs are R1–R4/R6. |
| NE.7, R11.5, R01.3, AL.3/AL.5, EDC.2 | Confirmed actual named nodes; corrected inflated or misrouted contracts as above. |
| MotivicEtaleKTheory M.8 and RankZeroOneBSD L13 | M.8 uses PS.0, not PS.3/PS.4; RankZeroOneBSD's scalar endpoint does not depend on PS.6. These stage cuts avoid the apparent cycles in the original prose. |

No `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder remains in the package. PeriodsAndSpecialValues is not assigned a tier among the 94 in the checked Caraiani–Newton order file. Absence is not evidence that an arbitrary supplier is lower-tier. This review therefore makes no claim that the whole package is eligible for the current upstream tier; it checks concrete ownership and stage closure and records the explicit blockers rather than inventing a tier assignment. No supplier target was moved or edited in this review.

## Ten Lean signature comparisons

The final file has 639 lines and follows the compact statement-only shape. It imports `Mathlib` and the particular Tau Ceti Tate module used. No sorry-backed data definition, ad hoc heavy carrier, admitted example, `True` placeholder or conclusion-bearing hypothesis was found. Heavy objects are README targets named in the closing comment. The following ten comparisons were made against the final signatures, not inferred from successful elaboration.

| Signature | README match / nonvacuity check |
| --- | --- |
| `comparisonMatrix_det_basisChange` | PS.0.1's exact determinant of `C⁻¹ P A`; over matrices at the pin, including size zero. This is the coordinate identity, not a fabricated motivic comparison carrier. |
| `ellipticComparisonMatrix` | PS.0.5's `B⁻¹`, not inverse transpose. The total matrix inverse is a light definition; the geometric application explicitly requires B invertible. |
| `unitCritical_iff` | PS.1.3: positive even or negative odd integers; both original and dual gamma regularity are present in `UnitCritical`. |
| `fixedPeriodAlgebraic_rescale` | PS.1.4/PS.7.3: nonzero period is part of the predicate and rescaling coefficient is an E-unit. Zero L-values remain allowed. |
| `legendre_midpoint_error` | PS.7.1: real `0<λ<1` and positive natural N; same error `2/(N(1−λ)√(1−λ))`. No general complex-parameter claim is encoded in this real signature. |
| `quartic_symmetric_square` | PS.8.7: complex `‖256z‖<1`, parameters 1/8,3/8,1 and scale 256. |
| `quarticMirror_integral` | PS.8.11: integer coefficients and a two-sided compositional inverse with integer coefficients, not pointwise reciprocals. |
| `quinticBoundary_horizontal` | PS.8.16's algebraic matrix identity `NF=pFN`, using residue at λ=0. It does not claim an integral lattice or a crystalline comparison. Boundary pairing likewise refers only to the constant boundary matrix. |
| `mzv_summable_iff` | PS.9.1: positive index required, `Summable` iff admissible; empty index allowed and [1] excluded. |
| `mzv_span_finrank_le` | PS.9.23: explicitly finite-dimensional weight-N span and upper bound dN. Added `Module.Finite` blocks the total-finrank infinite-dimension vacuity. |

The new inverse definition has two proved thematic examples. Existing proved examples were checked for the at-most-two-per-kept-definition rule and no example uses `sorry`. Other boundary facts remain named theorem targets, not admitted examples.

## Verification run by this reviewer

- Final `lean-check` on the submitted Suggested.lean: **exit 0**, **44 warnings**, all `declaration uses 'sorry'`; no errors or other warnings. The shared existing build uses Mathlib `082e2d37e8` and pinned Tau Ceti `f790474`. Available memory was above 20 GB. No lake build/update/cache command or language server was started.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/PeriodsAndSpecialValues/Suggested.lean`: exit 0.
- All three unchanged input packets passed `scripts/check_blueprint.py`: root (0 nodes, 12 gaps, 25 requests), PS.0 (39 nodes, 7 gaps, 16 requests), PS.8 (40 nodes, 5 gaps, 9 requests), each with zero errors and zero warnings. This validates their format, not resolution of their gaps.
- An independent Python exact-rational calculation checked five monodromy isometries, their ordered product, infinity nilpotence and the pulled-back operator on powers from −3 through 9; the A/g/h coefficients and recurrence; the hypergeometric square through degree 8; q and its compositional inverse through degree 8; and `P(1/j,Z)=0` through q⁸, with `1/j` independently built from E₄ and the Δ product.
- The same calculation checked `NF=pFN` and the pairing in 45 triples `p∈{0,2,3,5,7}`, `Δ∈{0,1,−2}`, `Y∈{0,1,−3}` (algebraic tests, not geometric good-prime assertions), Dwork coefficients/recurrence/valuation inequality for `p=3,5,7,11`, `n<160`, pair weights through n=5, the descending Zagier coefficients, determinant 5/2, Hoffman counts through weight 15, and the inverse/heap matrix witnesses. All assertions passed. Finite truncations and sampled parameter values are sanity checks, not proofs of the infinite identities or convergence.
- The Dwork convergence argument itself was checked: Artin–Hasse integrality and the degreewise-finite residual exponential product give slope `(2p−1)/((p−1)p²)`; subtracting this from the factorial's slope leaves `(p−1)/p²>0`. The strict harmonic-pair weights cost at most two logarithmic valuations. This proves the asserted term valuations tend to infinity for the stated odd primes, conditional only on the imported Artin–Hasse theorem.
- Final intake path/JSON checks and whitespace validation are recorded in the handoff after running them on all changed deliverables. No source passage or section-by-section source summary is included in the package or this report; all explanations above are the reviewer's own descriptions of specific claims and findings.

## Source receipts

All accessed on 2026-10-19. The SHA-256 is of the separately downloaded public PDF bytes. `BV` is the author-final comparison copy, `BVpub` the published reference used for theorem scopes. These receipts reproduce which versions were checked without retaining source files in the repository.

| Key | Public PDF | SHA-256 |
| --- | --- | --- |
| Deligne | [PDF](https://mathweb.tifr.res.in/~eghate/Deligne.pdf) | `08fbc56b42d829e3fc16067217001351962690921a7ffd20895b7ac1d9fac7f7` |
| HMS | [PDF](https://arxiv.org/pdf/1105.0865v5) | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| BCGP | [PDF](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| Serre | [PDF](https://numdam.org/article/SDPP_1969-1970__11_2_A4_0.pdf) | `7ed71db99ff8cf5e24d2c45056048dadfc29ce4b2e3a387061ccfb7baa875754` |
| Tate | [PDF](https://ncatlab.org/nlab/files/TateNumberTheory.pdf) | `a79bd2822b480cde931069ed3f4ada23067a800883dbb4cae2739a3372601f41` |
| BF | [PDF](https://ems.press/content/serial-article-files/25892?nt=1) | `d9caa72585d3ae77f34fd1798289345ca2d7a0f4284933c1c0945cb0f0994e5b` |
| BV | [PDF](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/bock-final.pdf) | `3b59955e39bf8d432aab1a413b992e3ee31222b5cc9fe07a5ada3af1e294e84c` |
| BK | [PDF](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf) | `ec89c6436c7e16580791eddd562c8c04a12442d8a8484f8ac75c5ea8dc04f5e5` |
| LTXZZ | [PDF](https://par.nsf.gov/servlets/purl/10323568) | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| Johansson | [PDF](https://arxiv.org/pdf/1802.07942v1) | `64abe78ce44e513bacf764e205f5f4eb728e6c6a0c79dc1a114b2cbfb44aae78` |
| H | [PDF](https://arxiv.org/pdf/1101.4601v1) | `11e54e5ed83a516011217fa7f6fb40d4d890fb7ecf276d7ae398b5ae97a49909` |
| LYA | [PDF](https://arxiv.org/pdf/hep-th/9411234v3) | `dcf9ee72c383e88d539a710e45947392514e78a1aaa3e4a023fd7a371e8394d0` |
| LYH | [PDF](https://arxiv.org/pdf/hep-th/9507151) | `3f4aa8fcc1d5cd45cb130a4f1a05c09038eaa45621546fdb82d48af53ff410e6` |
| SH | [PDF](https://arxiv.org/pdf/0809.3742v2) | `cc57d22b1c173ef1837c6d31af4e76546233f0d9ac053cffa403e6017e551e16` |
| SS | [PDF](https://arxiv.org/pdf/0809.0086) | `733ff216eec53ce563c69e31957cb028775646c76e225c18562f052b7a3981d8` |
| IKZ | [PDF](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf) | `0f2ca065e44b28dd8d51d825a46f06e34abf2c2fe9892bdcd01b8a511e692c77` |
| DG | [PDF](https://www.math.ias.edu/files/deligne/Tate.pdf) | `42039a170972f033f28eb481929aca3fc411a7e041c0f867157a769484ea21a4` |
| B | [PDF](https://arxiv.org/pdf/1102.1312v1) | `e795b842a6820ed87685db81e0eeadfc220394d52ec88a95696111b4b0cd8367` |
| Z | [PDF](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf) | `28a98d968fe6998979008164252b5a9711a780c3f009ae6dfa55aae7c41014cd` |
| SO | [PDF](https://arxiv.org/pdf/0808.0248v3) | `91259e395f1a550088e297a006a0e8ab811d48982e25d78c7599e1a596e85f0e` |
| NS | [PDF](https://arxiv.org/pdf/hep-th/9312159) | `3d5b118a8db84976a344e9c13408cefc229853641bb9fae7255b71f322ab6d6d` |
| BVpub | [PDF](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/burns_venjakob.pdf) | `2da5c1f39c60fe84aed79ad02a69d8ae81ba77013462763ef744d68dd56413ce` |
