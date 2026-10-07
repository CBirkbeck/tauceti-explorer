# Nahm series, asymptotics and Habiro integrality

A Nahm series is a q-hypergeometric series controlled by a symmetric matrix. Its behavior near roots of unity connects a finite system of algebraic equations, dilogarithm regulators, modular functions and arithmetic Taylor gluing. This roadmap plans that connection from the existing libraries to two endpoints: modularity forces the distinguished Bloch class to be torsion, and formal Nahm collections at a chosen nondegenerate solution belong to the appropriate K₃-indexed Habiro module. The examples then test the coefficient rings and give actual degree-zero Habiro–Hodge exports where the owner comparisons apply.

The analytic and formal routes have different domains. The analytic route uses a rational positive-definite matrix and the distinguished solution in the open unit cube. The formal route uses an integral symmetric matrix with diagonal signs, allows indefinite or singular matrices, and requires nondegeneracy of the chosen solution for specialization. The formal identities do not extend the radial analytic theorem to arbitrary knot matrices.

This is the assembled reader of the accepted base packet and the six independently reviewed refinements, in layer order HB.3, HB.4, HB.5a, HB.5, HB.8, HB.9 and HB.10. It contains all 183 declaration plans, their proof routes, APIs and discriminating tests. A complete planning pass is not a closed proof: the six refined stages remain **planned**, with explicit supplier and proof obligations. The base's historical `partial` and `source_decomposed` labels remain in its packet for provenance. No declaration is claimed implemented; `implementationStatus` remains `unchecked`.

The refined contracts govern use of an older target wherever they add a field, sign, completion or nonvanishing hypothesis. Such an older target is identified in its declaration entry below and points to its controlling refinement. This avoids treating a historical proof sketch as an established supplier. The [combined suggested Lean file](../suggested/HabiroNahmSeries.lean) is a signature prototype; this document is definitive.

## Scope and neighboring owners

The link-screen files in [research/blueprint/links](../links/) were checked for incident Nahm edges and overlaps. Their occurrences of this roadmap are catalogue-screen records; no accepted incident edge was found. The concrete boundaries therefore use the reviewed packets' node imports and restructuring proposals, collected in the [assembly handoff](../handoff/ASM-HabiroNahmSeries.md). They do not invent dependencies from a catalogue mention.

| Owner | What is imported or exported |
| --- | --- |
| [Habiro number fields](HabiroNumberFields.md), HB.1–HB.2 and HB.6–HB.7 | Excluded integers, cyclic dilogarithms, finite-Chern/Kummer units, the number-field Habiro ring and indexed modules. This roadmap constructs specific Nahm collections and proves their membership subject to the owner interfaces; it does not define a second Habiro ring or K₃-indexed module. |
| [Bloch groups and K₃](K3BlochGroups.md), V.3–V.6 | CGZ versus Suslin conventions, unique divisibility, K₃ lifts and exact five-term certificates. HB.3 supplies the Nahm-specific boundary calculation. General Bloch/K-theory is imported. |
| [Polylogarithms](Polylogarithms.md), P.1; Borel regulators, R.4 | Classical/Bloch–Wigner/Rogers functions and Borel injectivity. The exact CGZ Rogers normalization and trigonometric acceptance identity are owner requests. HB.3 and HB.5 apply these functions to Nahm symbols. |
| [q-series, partitions and mock modular forms](QSeriesPartitionsAndMockModularForms.md), QM.0–QM.3 | q-Pochhammer symbols, Gaussian polynomials, q-Lucas, Dedekind sums, η-transformation, Andrews–Gordon products and weakly holomorphic modular forms. HB.4 owns their Nahm asymptotic application; HB.5a owns the finite-index cusp interface only to the extent not already supplied by QM.3. |
| [Habiro rings](HabiroRings.md), HR.1, HR.5–HR.6 | Étale Frobenius lifts, relative number-field comparisons and the degree-zero Habiro–Hodge coefficient identification. HB.10 composes the actual owner maps. |
| [Habiro cohomology foundations](HabiroCohomologyFoundations.md), HQ.5–HQ.8 | Algebraic cohomology and realizations. A proposed HQ.6 Part II owns the explicit naive-to-algebraic comparison on a supplied family and form. Ring membership alone does not furnish a higher geometric class. |
| [Arithmetic quantum topology](ArithmeticQuantumTopology.md), QT.5–QT.7 | Triangulations, volume, full Neumann–Zagier data, knot-series identification, state integrals, invariance and quantum modularity. QT.6 consumes HB.4/HB.8; it is not a prerequisite of the formal HB.10 matrix examples. |
| p-adic regulators D.1/D.3/D.4, Coleman L2, arithmetic K-theory N.6 | Modified integral polylogarithms and regulator comparisons; the certified quartic tame kernel. These are imported owner contracts. HB.9 supplies the explicit Nahm modified-potential formula; HB.10 supplies the input field and integral basis for the computation. |

Existing Mathlib carriers—intermediate fields, formal power series, polynomial rings, Frobenius-compatible ring maps, finite-index subgroups and meromorphic orders—are reused. The reviewed library audit marks the specialized Nahm targets as unbuilt and HB.5a as partly built. The individual pinned declarations used by each part are recorded in its `baseline` audit; specialized theorems are not inferred from similarly named library objects.

## Conventions

Use N for rank, including when CGZ writes r. Analytic data are (A,B,C), with A rational, symmetric and positive definite, and Q(n)=nᵀAn/2+Bᵀn+C. Formal data are symmetric integral A. Their series is

\[
 F_A(t,q)=\sum_{n\geq0}
 \frac{(-1)^{\operatorname{diag}(A)\cdot n}
 q^{(n^TAn+\operatorname{diag}(A)\cdot n)/2}t^n}
 {\prod_j(q;q)_{n_j}}.
\]

The analytic equations are 1−z_i=∏_j z_j^{A_ij}, with 0<z_i<1 and positive real powers. The formal equations are 1−z_j=(−1)^{A_jj}t_j∏_i z_i^{A_ij}; symmetry identifies row and column notation. At t=1 these agree with the analytic signs only for even diagonal. A chosen algebraic embedding preserves cleared polynomial equations; it need not preserve a newly selected principal branch of rational powers.

| Symbol | Convention and cross-part translation |
| --- | --- |
| d | A positive denominator clearing the relevant matrix/vector/quadratic data. A denominator of Q means dQ(ℤᴺ)⊂ℤ. The symbol δ is reserved for the Nahm discriminant, not a common denominator. |
| D | A strong denominator: Q(k) modulo ℤ depends only on k modulo D. Choose D divisible by the ordinary denominator when reducing rational phases. D=2d is available. HB.5 chooses a fixed D divisible by 24 as well. Strong denominators need not themselves be multiples of a least denominator. |
| m, ζ | Positive root order and a specified primitive root ζ=e(a/m), gcd(a,m)=1. In HB.5, n is a varying good order; in HB.8, k is a congruence vector. Neither is a rank. |
| q^b, analytic | q=e(τ), Im τ>0, and q^b=e(bτ). The analytic function lives on the upper half-plane when b is rational; a principal logarithm on the entire punctured disc is not used. |
| F, E, H_rad | F=ℚ(z_i); E adjoins coherent positive denominator roots. HB.4 adjoins ζ and coherent (dm)-th roots, then a separate ζ_D for rational Gauss values. Do not silently replace a radical/Gauss field by F(ζ). HB.5 fixes E=F(z_i^(1/D),ζ_D) before varying m. |
| δ, Δ | δ=∏z_j^(−A_jj)det(diag(1−z)A+diag(z)), nonzero at the chosen point. Δ is the excluded localization integer, divisible by the required HB.1 excluded integer and any needed denominators. They are different objects. |
| S | The t-deformed coefficient algebra, localized at the Nahm units and δ. Its inverse square root means the full quadratic algebra R[T]/(δT²−1), after 2 and δ are units. It need not be a field. The global S and its local factors are always distinguished. |
| 𝓛, λ, C₀ | 𝓛=∑L_CGZ(z_i)>0, λ=𝓛/(4π²), C₀=−λ. L_CGZ(x)=π²/6−Li₂(x)−½log(x)log(1−x). Its circle-valued regulator has period π²/2. GZ's shifted L has the opposite sign. The scalar named Λ in HB.4/HB.5 contracts means 𝓛. |
| H, Λ_A | Analytic H=A+diag(z/(1−z)) is positive definite. Formal Λ_A=−A−diag(z/(1−z)); its covariance is hΛ_A⁻¹. The Λ in a formal Gaussian contract is this matrix, not the scalar growth constant. |
| x, h, ε | q=ζ+x=ζ exp(h), h=log(1+x/ζ). The radial analytic path q=ζ exp(−ε/m) has h=−ε/m. HB.9's weights wt(w)=1, wt(h)=2 and HB.8's half-scaled weights describe the same completion generated by w,h,w³/h. |
| t, T | t is the deformation vector; T_j^m=t_j at level m. A descendant shift T_j=q^ν_j means t_j=q^(mν_j). It starts at t=1 and is not constant specialization. |
| Bloch and K₃ indices | True exterior and antisymmetric-square boundaries are distinct at 2. Rational A gives a rationalized class over F and an integral class over the coherent root field. Signed formal data need the exact owner convention and a specified K₃ lift; neither is chosen by suppressing an obstruction. |

All p-completed cyclotomic coefficient algebras retain their full finite product of components. Restricted root orders coprime to Δ and all-root Habiro membership are separate conclusions. A normalized individual Gaussian section may be a unit even when the finite sum of its sections has zero constant term. Every nonvanishing assumption is retained in the theorem that uses it.

## Sources and library baseline

The source editions, hashes, read sections and correction searches are inherited from the independently reviewed extraction records, not claimed as fresh source reads by this assembly. Equation numbers below are interpreted in the cited edition. The packets preserve the detailed version audit and the local versus confirmed status of every finding.

| Source | Use in this roadmap |
| --- | --- |
| Calegari–Garoufalidis–Zagier, [*Bloch groups, algebraic K-theory, units, and Nahm's conjecture*](https://arxiv.org/pdf/1712.04887v3), v3 (6 April 2021); published author copy | §7: analytic data, CGZ Rogers normalization, corrected root constants, modularity implication and Andrews–Gordon acceptance. HB.1–HB.2 own its general Kummer theory. |
| Garoufalidis–Zagier, [*Asymptotics of Nahm sums at roots of unity*](https://arxiv.org/pdf/1812.07690v1), v1 (18 December 2018); [published copy](https://d-nb.info/1217648526/34) | §§2–4: logarithmic Pochhammer expansion, Euler phase, saddle/Poisson proof and cancellation-safe radial theorem. §6: modular cusp valuation. Appendix A supplies the KMS analytic route, not a section 8. |
| Garoufalidis–Scholze–Wheeler–Zagier, [*The Habiro ring of a number field*](https://arxiv.org/pdf/2412.04241v2), v2 (27 August 2025) | §§1.6–1.9, 2–4: admissibility, formal Gaussian collection, Frobenius defect, indexed membership, residues, descendants and explicit examples. General number-field ring/module definitions are imported from their owners. |
| Zagier, [*The Dilogarithm Function*](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), public author copy | HB.3/HB.5 refinements obtained the previously missing chapter: coherent algebraicity, Rogers normalization and equations (28)/(29), with the complex-uniform modular argument supplied through cusp Laurent expansions. |
| Vlasenko–Zwegers, [*Nahm's conjecture: asymptotic computations and counterexamples*](https://arxiv.org/abs/1104.4008) | HB.4's reviewed remainder route and the boundary to all-solution versions of Nahm's conjecture. |
| Garoufalidis–Wheeler, [*Explicit classes in Habiro cohomology*](https://arxiv.org/pdf/2505.19885v1), v1 (26 May 2025) | Finite cubic Gaussian-polynomial symmetrisation and a separate naive geometric construction. Its (182) needs the scalar algebraic factors certified in HB.10; its all-prime theorem is not disproved by this auxiliary error. |
| Wagner, [*q-Hodge filtrations, Habiro cohomology, and ku*](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf); [*q-Hodge complexes over the Habiro ring*](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf), author copy (14 January 2026) | The actual relative dimension-zero étale comparison used through HR.5–HR.6/HQ.5. No all-prime independently shifted descendant proof or naive-to-algebraic higher comparison is imported merely from these titles. |

HB.8's audit also reads the actual Gaussian affine/Fubini rules in Garoufalidis–Störzer–Wheeler and the Århus integral, and screens the Kontsevich–Soibelman/Efimov route. The elementary arbitrary-rank finite-support chain below does not require a second general Donaldson–Thomas theory. The [Stacks Project, formally unramified maps](https://stacks.math.columbia.edu/tag/00UW) supports the coordinate-field differential bridge.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, the earlier “Poisson summation absent” claim is superseded: the pinned Mathlib has one-dimensional Poisson summation and Gaussian summation. This roadmap adds the particular shifted multivariable lattice estimates and remainder control. The prototype imports the existing modules, and its compilation tests signatures, not any of the `sorry` proofs.

## Layer overview and route through the plan

| Layer | Output | Declaration plans | Current mathematical boundary |
| --- | --- | ---: | --- |
| HB.3 | Nahm data, distinguished solution, coherent algebraicity, Bloch/regulator interfaces | 19 | Rogers, Borel injectivity, unique divisibility and signed integral convention remain owner inputs. |
| HB.4 | Radial analytic expansion with exact constants and remainder estimates | 33 | Analytic bounds are independent of the missing coefficientwise Kummer identity and rational arithmetic/eigenspace comparison. |
| HB.5a | Finite-index modular functions and cusp Laurent/growth interface | 8 | Import available subgroup/cusp carriers; reconcile the weakly holomorphic owner overlap with QM.3. |
| HB.5 | All-root growth, all-cusp valuation and modularity-to-torsion argument | 18 | Use a fixed enlarged field and actual multiplier; constant-term arithmetic descent is the HB.4 supplier obligation. |
| HB.8 | Formal Nahm series, elementary finite support, Gaussian/congruence comparison | 45 | Elementary finite support has an arbitrary-rank route. G1/G2/G3 govern corrected Gaussian identification and level-m cancellation. |
| HB.9 | Frobenius defect, regulator specialization and indexed Habiro membership | 35 | Faithful coefficient transfer, corrected HB.8 input, orientation, all-order gluing and descendant transport are distinct gaps. |
| HB.10 | Residues, explicit arithmetic examples and cohomology exports | 25 | Cubic small primes, quartic torsion/tame kernel and global module/geometric comparisons retain exact conditions. |

HB.3 precedes HB.4 and the formal HB.8 data. HB.4 and HB.5a feed HB.5. HB.8 feeds HB.9, and HB.9 feeds the arithmetic applications in HB.10. The degree-zero comparison in HB.10 imports existing cohomology owner maps; its higher extension and the QT.6 outputs do not become reverse prerequisites of the general Nahm stages.

The finer cross-part contracts are explicit node prerequisites in the packets. HB.5 consumes `HB.4/cgz-normalization-and-field-comparison`, `HB.4/coefficientwise-kummer-descent-interface` and `HB.4/nonzero-unit-series-descent-comparison`; its regulator descent consumes `HB.3/regulator-field-and-normalization-comparison`. HB.9 consumes `HB.8/refinement-gaussian-normalization`, the shift/regularity/identification nodes and `HB.8/refinement-corrected-level-admissibility`. HB.10 consumes `HB.9/followup-etale-module-contract`, `HB.9/followup-integral-gluing-contract` and `HB.9/followup-descendant-pullback-contract`, as well as the signed boundary in HB.3. These references specify conditional imports; they do not discharge the supplier gaps.

The six selected HB.8 planets are the refinement's cyclotomic orbit equations, Nahm potential, restricted Adams coefficients, corrected level-m admissibility, residue lemma and finite-support theorem. They replace the six older parent display entries while retaining every parent declaration. The assembled planet counts are 5, 6, 2, 4, 6, 5 and 6 in layer order. The inherited optional HB.8 split is collected in the handoff; no stage is silently moved or duplicated.

Within each layer, the base contracts precede its finer contracts. The base names remain stable for consumers. A “Controlling refinement” entry replaces a broader historical assertion with its reviewed qualified form; its API names remain naming targets under those same hypotheses. Every proof outline is a plan. The source locators and the packet links allow the reader to recover the original review provenance.


## HB.3 — Nahm equations and their Bloch classes

The algebraic route starts by clearing all rational powers coherently. For M=dA, ε_i∈{±1} and y_i^d=z_i, use

\[
 P_i(Y)=(1-Y_i^d)\prod_jY_j^{\max(-M_{ij},0)}
       -\varepsilon_i\prod_jY_j^{\max(M_{ij},0)}.
\]

At a zero with every y_i and 1−z_i nonzero, its Jacobian is −diag(c_i)[M+d diag(z/(1−z))]diag(y_i⁻¹), with the nonzero Laurent-clearing factors c_i. For the positive solution the central matrix is dH, hence nonsingular. The field generated by y has zero relative differentials; use finite generation, essential finite type and formal unramifiedness to conclude it is a finite algebraic extension. This supplies the actual route behind the older algebraicity target.

For the unsigned system the exterior boundary vanishes over the coherent root field. Over F, only its denominator multiple is asserted to vanish. For the signed system the diagonal signs leave ∑M_ii z_i∧(−1), killed by 2 and killed integrally when the diagonal is even. This is why the unmultiplied integral class and its Suslin/K₃ interpretation remain an exact supplier obligation. Rational circle-valued Rogers classes are compared through an integral lift and its denominator, never by dividing a point of a circle.


<a id="habironahmseries-hb-3-nahm-data"></a>

### The two kinds of Nahm data

**Definition** · `HabiroNahmSeries:HB.3/nahm-data` · [packet](../packets/HabiroNahmSeries.json)

Two separate bundled input records. An ANALYTIC Nahm datum is a triple (A, B, C) with A a symmetric positive definite r x r matrix over the rationals, B a rational column vector and C a rational number; a denominator of the datum is a positive integer d with d Q(n) integral for all integer vectors n, where Q(n) = (1/2) n^t A n + B n + C. A FORMAL Nahm datum is a single symmetric matrix A with integer entries and no positivity assumption. The analytic datum is the input of the convergent q-hypergeometric sum and of the root-of-unity asymptotics; the formal datum is the input of the multivariable admissible series of GSWZ. Neither record is a special case of the other: positivity is never imposed on a formal identity, and integrality is never imposed on a convergence theorem.

**Hypotheses and conventions.** A is symmetric; for an analytic datum A is positive definite with rational entries; for a formal datum A has integer entries. r = N is the rank, written r in the CGZ source and N in the GSWZ and GZ sources; this packet writes N everywhere and records the source's letter in each locator. A denominator of Q is a positive integer d with d Q(Z^N) contained in Z (GZ (1)). A strong denominator D of Q is a positive integer such that Q(k) modulo 1 depends only on k modulo D (GZ, before Theorem 3.1); D = 2d is a strong denominator for every denominator d. A strong denominator need not be a multiple of d (Q(n) = n^2/4 has strong denominator 2 and least denominator 4), so every statement that reduces a rational number modulo D (the Gauss sum of HB.4) takes D to be a multiple of d, for instance D = 2d.

**Proof route.**

1. Define the analytic record as a structure carrying A, B, C and the proof that A is symmetric and positive definite.
2. Define the formal record as a structure carrying an integral symmetric A.
3. Define denominator and strong denominator predicates on the analytic record and prove that 2d is a strong denominator whenever d is a denominator.
4. Define the coercion from an integral positive definite A to an analytic datum with B = 0 and C = 0, and prove that it is injective; do NOT define a coercion the other way.

**Direct inputs.** `mathlib:Matrix.PosDef`, `mathlib:Matrix.PosDef.transpose`, `mathlib:MvPolynomial`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `NahmDatum` | structure | The analytic Nahm datum: A symmetric positive definite over the rationals, B a rational vector, C a rational number. |
| `NahmDatum.posDef` | projection | The positive definiteness of A carried by an analytic datum. |
| `FormalNahmDatum` | structure | The formal Nahm datum: a symmetric integral matrix A. |
| `NahmDatum.IsDenominator` | data | The predicate that d is a denominator of the quadratic function of the datum. |
| `NahmDatum.IsStrongDenominator` | data | The predicate that D is a strong denominator. |
| `NahmDatum.isStrongDenominator_two_mul` | characterisation | Twice a denominator is a strong denominator. |
| `FormalNahmDatum.toNahmDatum` | coercion | A positive definite formal datum gives an analytic datum with B = 0 and C = 0. |
| `NahmDatum.ext` | extensionality | Two analytic data with the same A, B and C are equal. |

**Discriminating tests.**

- **`rogers_ramanujan_is_analytic`** (computation): A = (2), B = 0, C = -1/60 is an analytic Nahm datum, and d = 60 is a denominator: 60 Q(n) = 60 n^2 - 1 is an integer for every integer n.
- **`knot_matrix_not_posdef`** (non-example): A = (1 1; 1 1) is symmetric and integral with det A = 0, so it underlies a formal datum and no analytic datum (it is the 4_1 matrix of GSWZ (233)).
- **`half_integral_not_formal`** (non-example): A = (3/2 1/2; 1/2 3/2) is positive definite (det A = 2) with non-integral entries: it underlies an analytic datum and no formal datum (the Vlasenko-Zwegers matrix of CGZ Section 7.1).
- **`strong_denominator_two`** (computation): For A = (2), B = 0, C = 0 the integer 1 is a denominator and both 1 and 2 are strong denominators.
- **`strong_denominator_not_multiple`** (non-example): For A = (1/2), B = 0, C = 0, D = 2 is a strong denominator (Q(k+2) - Q(k) = k + 1) while the least denominator is 4; so the strong-denominator predicate does not imply divisibility by a denominator.
- **`toNahmDatum_injective`** (compatibility): FormalNahmDatum.toNahmDatum is injective on positive definite formal data, and its image has B = 0 and C = 0.

**Acceptance.**

- The rank one records A = (2), B = 0, C = -1/60 and A = (2), B = 1, C = 11/60 are analytic data (the two Rogers-Ramanujan cases).
- A = (1 1; 1 1) is a formal datum and is not positive definite, so it is not an analytic datum; the 4_1 knot matrix of GSWZ Remark 4.2 is exactly this matrix.
- A = (3/2 1/2; 1/2 3/2) is an analytic datum with non-integral entries, so it is not a formal datum; it is the Vlasenko-Zwegers matrix of CGZ Section 7.1.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, after equation (eq.FABC), printed p. 35. The analytic record, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, before equation (FAdef). The formal record, verbatim; note the absence of any positivity hypothesis. [gz](https://arxiv.org/pdf/1812.07690v1): Section 3, before Theorem 3.1. The strong denominator, verbatim.


<a id="habironahmseries-hb-3-nahm-equations"></a>

### Nahm's equations

**Definition** · `HabiroNahmSeries:HB.3/nahm-equations` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric matrix A = (a_ij) of size N, Nahm's equations are the system 1 - X_i = prod_j X_j^{a_ij} (i = 1, ..., N), written 1 - X = X^A (CGZ (41), GZ (6)). Over the reals with X in the open cube (0,1)^N the powers are real powers of positive reals and the equations make sense for rational A. For integral A and a sign vector eps in {+1,-1}^N the SIGNED system 1 - z_i = eps_i prod_j z_j^{a_ij} is a system of Laurent-polynomial equations over any commutative ring in which the z_i are units; CGZ's equations are eps = (1,...,1) and GSWZ's equations (41) are eps_i = (-1)^{a_ii}. The two agree exactly when every a_ii is even, and in general they have different solution fields. The t-deformed system of GSWZ is a separate object (HB.8).

**Hypotheses and conventions.** A is symmetric of size N; the entries are rational for the real form and integral for the signed Laurent form. For the real form the unknowns lie in the open cube (0,1)^N, so every real power is defined and positive. For the signed form the coordinates z_i are units of the ring; 1 - z_i is then automatically a unit, being plus or minus a monomial in the z_j.

**Proof route.**

1. Define the real form as a predicate on a point of the open cube, using real powers.
2. Define the signed form, for integral A and a sign vector eps, as the vanishing of the N Laurent polynomials 1 - z_i - eps_i prod_j z_j^{a_ij} at a point of (R^x)^N.
3. Prove that for integral A and a point of the open cube the real form is the signed form with eps = (1,...,1).
4. Prove equivariance: for a permutation s of {1..N}, X solves the equations for A exactly when X o s solves them for the permuted matrix (a_{s(i) s(j)}); and a ring homomorphism carries solutions of the signed form to solutions.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), `mathlib:Real.rpow`, `mathlib:MvPolynomial`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `NahmEq` | data | The predicate that a point of the open cube satisfies 1 - X_i = prod_j X_j^{a_ij} for a real matrix A. |
| `NahmEq.pos` | projection | Every coordinate of a solution is strictly between 0 and 1. |
| `SignedNahmEq` | data | For an integral matrix A, a sign vector eps and a commutative ring R, the predicate on z in (R^x)^N that 1 - z_i = eps_i prod_j z_j^{a_ij} for all i. |
| `NahmEq.iff_signedNahmEq` | characterisation | For integral A a point of the open cube satisfies NahmEq exactly when it satisfies SignedNahmEq with eps = 1. |
| `SignedNahmEq.gswz_eq_cgz_of_even` | compatibility | If every a_ii is even, SignedNahmEq with eps_i = (-1)^{a_ii} is SignedNahmEq with eps = 1. |
| `NahmEq.perm` | relation | Equivariance under simultaneous permutation of the coordinates and of the rows and columns of A. |
| `SignedNahmEq.map` | functoriality | A ring homomorphism f carries solutions to solutions: SignedNahmEq A eps z implies SignedNahmEq A eps (f o z); map_id and map_comp. |

**Discriminating tests.**

- **`golden_ratio`** (computation): For A = (2) the point X = (sqrt 5 - 1)/2 lies in (0,1) and satisfies 1 - X = X^2.
- **`eight_five_five_four`** (computation): For A = (8 5; 5 4) the point (0.884829..., 0.789393...) satisfies the equations; the resultant of the two equations in z_1 is z_1^24 (z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1)(z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1), so the system has exactly eight solutions with non-zero coordinates.
- **`boundary_rejected`** (non-example): No point with a coordinate equal to 1 satisfies the equations (1 - X_i = 0 while the right-hand side is positive); the predicate on the open cube rejects it.
- **`sign_convention`** (non-example): For A = (3) the CGZ equation 1 - X = X^3 gives X^3 + X - 1 = 0 (field discriminant -31) while the GSWZ equation 1 - z = -z^3 gives z^3 - z + 1 = 0 (field discriminant -23): the two sign conventions are different systems.
- **`permutation_equivariance`** (compatibility): For A = (4 1; 1 1) with distinguished solution (0.786151..., 0.559862...), the swapped point (0.559862..., 0.786151...) solves the equations for (1 1; 1 4).

**Acceptance.**

- For N = 1 and A = (2) the equation is 1 - X = X^2, whose solution in (0,1) is the golden-ratio number (sqrt 5 - 1)/2.
- For A = (8 5; 5 4) the equations are 1 - z_1 = z_1^8 z_2^5 and 1 - z_2 = z_1^5 z_2^4, which is GSWZ equation (z1z28554).
- A point with some X_i equal to 0 or 1 does not satisfy the equations, and the predicate rejects it.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), equation (NahmEq), printed p. 35. The equations and the field they generate, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, equation (zjt=0). GSWZ's sign convention for the same equations, with the (-1)^{A_jj} factor that the CGZ normalisation does not carry; the printed inner variable is z_j where the product must run over z_i, an erratum recorded in the gaps.


<a id="habironahmseries-hb-3-distinguished-solution"></a>

### Existence and uniqueness of the distinguished solution

**Theorem** · `HabiroNahmSeries:HB.3/distinguished-solution` · [packet](../packets/HabiroNahmSeries.json)

Let A be a symmetric positive definite N x N matrix with rational entries. Then Nahm's equations have exactly one solution X^A = (X_1, ..., X_N) with 0 < X_i < 1 for every i. It is called the distinguished solution and is the unique critical point on the open cube of the strictly concave potential W(u) = -(1/2) u^t A u - sum_i Li_2(e^{u_i}) in the coordinates u_i = log X_i.

**Hypotheses and conventions.** A is a real symmetric positive definite N x N matrix (rational in the sources; the proof uses only real entries). In the coordinates u = log X the open cube becomes the open orthant (-infinity,0)^N and the equations read g(u) = 0 with g_i(u) = log(1 - e^{u_i}) - (A u)_i. Li_2 is the dilogarithm of Polylogarithms:P.1/classical-polylogarithm, continuous on the closed unit disc with Li_2(1) = pi^2/6 and with d/du Li_2(e^u) = -log(1 - e^u) for u < 0.

**Proof route.**

1. Uniqueness. For u != v in the orthant, <g(u) - g(v), u - v> = -(u - v)^t A (u - v) + sum_i (log(1 - e^{u_i}) - log(1 - e^{v_i}))(u_i - v_i) < 0, because A is positive definite and t -> log(1 - e^t) is decreasing on (-infinity, 0). Hence g has at most one zero. This uses only Matrix.PosDef and one-variable monotonicity, not a multivariable second-derivative test (which the pinned Mathlib lacks).
2. Existence. W(u) = -(1/2) u^t A u - sum_i Li_2(e^{u_i}) is continuous on the closed orthant and W(u) <= -(1/2) lambda_min |u|^2, so the superlevel set {u <= 0 : W(u) >= W(-1,...,-1)} is compact and W attains its maximum there (IsCompact.exists_isMaxOn).
3. Boundary exclusion. If the maximiser u has u_i = 0, the mean value theorem along -e_i gives W(u - t e_i) - W(u) = t((A u')_i - log(1 - e^{xi_i})) > 0 for small t > 0, since log(1 - e^{xi_i}) tends to -infinity; so the maximiser lies in the open orthant.
4. At an interior maximiser each one-variable restriction has a local maximum, so its derivative vanishes (IsLocalMax.deriv_eq_zero); the partial derivative of W is g_i, so g(u) = 0 and X = e^u solves Nahm's equations in the cube.
5. Record that minus the Hessian of W at the solution is A-tilde = A + diag(z/(1 - z)), positive definite by Matrix.PosDef.add_posSemidef; HB.4 and HB.8 use this.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-equations](#habironahmseries-hb-3-nahm-equations), `mathlib:Matrix.PosDef`, `mathlib:Matrix.PosDef.add_posSemidef`, `mathlib:IsCompact.exists_isMaxOn`, `mathlib:IsLocalMax.deriv_eq_zero`, `mathlib:Real.log`, `Polylogarithms:P.1/classical-polylogarithm`.

**Acceptance.**

- For A = (2) the solution is the root (sqrt 5 - 1)/2 of X^2 + X - 1 in (0,1).
- For A = (8 5; 5 4) the solution is (0.884829..., 0.789393...), one of the two real embeddings of the quartic field of signature (2,1) and discriminant -5^2 . 19 defined by z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1; the other real solution (-0.266795..., 8.682742...) lies outside the cube.
- Positivity is needed: for the indefinite A = (0 1; 1 0) every (t, 1 - t) with 0 < t < 1 is a solution, and for A = (-1) there is none in (0,1). It is not necessary: the positive semidefinite A = (1 1; 1 1) has the single solution ((sqrt 5 - 1)/2, (sqrt 5 - 1)/2) in the cube.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (ii), printed p. 36. The statement, verbatim; the source asserts it without proof, and the proof outline above is the standard convexity argument. [gz](https://arxiv.org/pdf/1812.07690v1): Section 2, before equation (eq.nahm). The same assertion, again used without proof. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.3, after equation (z1eqn). The worked instance of the theorem.


<a id="habironahmseries-hb-3-nondegenerate-solution-and-discriminant"></a>

### Non-degenerate solutions and the discriminant delta

**Definition** · `HabiroNahmSeries:HB.3/nondegenerate-solution-and-discriminant` · [packet](../packets/HabiroNahmSeries.json)

For an integral symmetric N x N matrix A, a sign vector eps and a field K, a solution z in (K^x)^N of the signed Nahm equations 1 - z_i = eps_i prod_j z_j^{a_ij} (HB.3/nahm-equations) is NON-DEGENERATE when delta(z) := prod_j z_j^{-a_jj} det(diag(1 - z) A + diag(z)) is non-zero (GSWZ (36) at t = 1). Equivalently the Jacobian of the Laurent system in logarithmic coordinates, -diag(1 - z)^{-1}(diag(1 - z)A + diag(z)), is invertible. For the distinguished solution of a positive definite A, diag(1 - z)A + diag(z) = diag(1 - z) A-tilde with A-tilde = A + diag(z/(1 - z)) positive definite, so delta(z) = prod_j z_j^{-a_jj} prod_i (1 - z_i) det(A-tilde) > 0.

**Hypotheses and conventions.** A integral symmetric; z a solution of the signed equations with all z_i units and z_i != 1. The factor prod_j z_j^{-a_jj} is GSWZ's normalisation; it does not affect whether delta vanishes.

**Proof route.**

1. Define delta as the displayed element of K.
2. Differentiate log(1 - z_i) - sum_j a_ij log z_j in the variables log z_k to get -(z_i/(1 - z_i)) delta_ik - a_ik, and factor out diag(1 - z)^{-1}.
3. For the distinguished solution factor diag(1 - z)A + diag(z) = diag(1 - z) A-tilde and apply Matrix.PosDef.det_pos.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-equations](#habironahmseries-hb-3-nahm-equations), [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), `mathlib:Matrix.det`, `mathlib:Matrix.PosDef.det_pos`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `nahmDiscriminant` | data | delta(z) = prod_j z_j^{-a_jj} det(diag(1 - z)A + diag(z)) in K. |
| `IsNondegenerate` | data | The predicate nahmDiscriminant z != 0. |
| `isNondegenerate_iff_jacobian` | characterisation | z is non-degenerate iff the logarithmic Jacobian of the signed system at z is invertible. |
| `nahmDiscriminant_map` | functoriality | For a field homomorphism f, nahmDiscriminant (f o z) = f (nahmDiscriminant z). |
| `isNondegenerate_distinguished` | characterisation | The distinguished solution of a positive definite A is non-degenerate, with nahmDiscriminant = prod_j z_j^{-a_jj} prod_i (1 - z_i) det(A-tilde) > 0. |

**Discriminating tests.**

- **`discriminant_golden`** (computation): For A = (2), z = (sqrt 5 - 1)/2: nahmDiscriminant z = z^{-2}(2 - z).
- **`discriminant_cubic_norm`** (computation): For A = (3), GSWZ sign: the norm of nahmDiscriminant z from Q(z) (z^3 - z + 1 = 0) to Q is +-23.
- **`degenerate_line`** (non-example): For A = (0 1; 1 0) the solutions (t, 1 - t) all have nahmDiscriminant 0.
- **`distinguished_positive`** (compatibility): For A = (8 5; 5 4) the discriminant at (0.884829..., 0.789393...) equals z_1^{-8} z_2^{-4}(1 - z_1)(1 - z_2) det(A-tilde) > 0.

**Acceptance.**

- For A = (2) and z = (sqrt 5 - 1)/2, delta = z^{-2}(2(1 - z) + z) = z^{-2}(2 - z) != 0.
- For A = (3) with the GSWZ sign, delta = z^{-3}(3 - 2z), of norm 23 up to sign.
- A degenerate solution exists for the indefinite A = (0 1; 1 0): every (t, 1 - t) solves the system and diag(1 - z)A + diag(z) = ((t, 1 - t), (t, 1 - t)) has determinant 0.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, equation (36) and the sentence before Theorem 5, p. 13-14 (arXiv v2). The discriminant, specialised at t = 1. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, before Theorem 5, p. 14. The definition of non-degeneracy.


<a id="habironahmseries-hb-3-nondegenerate-points-are-algebraic"></a>

### Non-degenerate complex zeros of a polynomial system over Q are algebraic

**Lemma** · `HabiroNahmSeries:HB.3/nondegenerate-points-are-algebraic` · [packet](../packets/HabiroNahmSeries.json)

Let f_1, ..., f_N in Q[x_1, ..., x_N] and p in C^N with f(p) = 0 and det(d f_i/d x_j (p)) != 0. Then every coordinate of p is algebraic over Q.

**Hypotheses and conventions.** Square system: N equations in N unknowns; the Jacobian determinant at p is non-zero. Laurent systems reduce to this case by clearing the monomial denominators, which do not vanish at p.

**Proof route.**

1. Let P be the kernel of the Q-algebra map Q[x] -> C, x -> p; it contains I = (f_1, ..., f_N).
2. The Jacobian condition says that the images of df_1, ..., df_N span the cotangent space at p, so the local ring (Q[x]/I)_P is unramified over Q: Omega_{(Q[x]/I)_P / Q} = 0.
3. An essentially-of-finite-type local Q-algebra with vanishing Kaehler differentials is a finite separable field extension of Q; hence P is maximal and Q[x]/P is a number field (Zariski's lemma).
4. Conclude that p_i, the image of x_i in Q[x]/P embedded in C, is algebraic.

**Direct inputs.** `mathlib:MvPolynomial`, `mathlib:MvPolynomial.aeval`, `mathlib:IsAlgebraic`, `mathlib:Matrix.det`.

**Acceptance.**

- For N = 1, a simple root of a rational polynomial is algebraic.
- The hypothesis cannot be dropped for a single point of a positive-dimensional component: for f = x_1 + x_2 - 1, x_1 + x_2 - 1 (N = 2, a degenerate system) the point (pi, 1 - pi) is a zero.
- For A = (8 5; 5 4) the distinguished solution satisfies the hypothesis and its coordinates are roots of z_1^4 + z_1^3 + 3z_1^2 - 3z_1 - 1.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), p. 35 (arXiv v3). The source's heuristic; this lemma is the precise statement used, reconstructed here (the source gives no proof).


<a id="habironahmseries-hb-3-algebraicity-and-the-nahm-field"></a>

### Algebraicity of the distinguished solution and the Nahm field

**Theorem** · `HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field` · [packet](../packets/HabiroNahmSeries.json)

Let A be a symmetric positive definite N x N matrix with rational entries, let delta be a common denominator of its entries, and let X in (0,1)^N be its distinguished solution. Then every X_i is an algebraic number and F = Q(X_1, ..., X_N) is a number field. More precisely Y_i = X_i^{1/delta} (positive real root) is a non-degenerate zero (in the sense of HB.3/nondegenerate-solution-and-discriminant) of the integral system 1 - Y_i^delta = prod_j Y_j^{delta a_ij}, hence algebraic, and X_i = Y_i^delta.

**Hypotheses and conventions.** A is symmetric positive definite with rational entries; delta is a positive integer with delta A integral. Algebraicity is proved for the distinguished solution through its non-degeneracy; for an arbitrary complex solution of the cleared system it holds exactly when the solution is isolated, which is not claimed here.

**Proof route.**

1. Clear denominators: Y = X^{1/delta} satisfies the Laurent-polynomial system 1 - Y_i^delta = prod_j Y_j^{delta a_ij} with integer exponents.
2. Compute the Jacobian of the cleared system in logarithmic coordinates: it is -delta diag(1 - X)^{-1}(diag(1 - X)A + diag(X)) = -delta diag(1 - X)^{-1} diag(1 - X) A-tilde, invertible because A-tilde = A + diag(X/(1-X)) is positive definite (HB.3/distinguished-solution) and 0 < X_i < 1.
3. Apply HB.3/nondegenerate-points-are-algebraic to conclude that every Y_i, hence every X_i, is algebraic.
4. Deduce that F is a finite extension of Q, a number field, and compute its degree in examples from a resultant.

**Direct inputs.** [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), [HabiroNahmSeries:HB.3/nondegenerate-solution-and-discriminant](#habironahmseries-hb-3-nondegenerate-solution-and-discriminant), [HabiroNahmSeries:HB.3/nondegenerate-points-are-algebraic](#habironahmseries-hb-3-nondegenerate-points-are-algebraic), `mathlib:IsAlgebraic`, `mathlib:NumberField`, `mathlib:Matrix.PosDef.det_pos`.

**Acceptance.**

- For A = (2), F = Q(sqrt 5); for A = (3), F is the cubic field of discriminant -31 generated by the root of X^3 + X - 1 in (0,1) (CGZ sign; the GSWZ sign gives z^3 - z + 1 and discriminant -23, GSWZ Example 4.1, a different field).
- For A = (8 5; 5 4), F is the quartic field z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1 = 0 of discriminant -5^2 . 19, with z_2 = (-9 z_1^3 - 6 z_1^2 - 25 z_1 + 37)/5 (GSWZ (257)).
- For A = (4 1; 1 1), F = Q(X_1) with X_1^4 + X_1^2 - 1 = 0 (field discriminant -400) and X_2 = 1/(1 + X_1).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), p. 35 (arXiv v3), equation (41). The field of a solution; the source asserts algebraicity generically and gives no proof, which this node supplies for the distinguished solution through non-degeneracy. [gz](https://arxiv.org/pdf/1812.07690v1): Section 2, equation (9). The matrix whose positive definiteness gives non-degeneracy.


<a id="habironahmseries-hb-3-bloch-class-of-a-solution"></a>

### The Bloch class of a solution and the vanishing of its boundary

**Construction** · `HabiroNahmSeries:HB.3/bloch-class-of-a-solution` · [packet](../packets/HabiroNahmSeries.json)

Let F be a field and A an integral symmetric N x N matrix, and let X in (F - {0,1})^N solve 1 - X_i = prod_j X_j^{a_ij}. Then [X] = sum_i [X_i] in Z(F) = Z[P^1(F)] satisfies d([X]) = sum_i X_i wedge (1 - X_i) = sum_{i,j} a_ij X_i wedge X_j = 0 in the EXTERIOR square wedge^2 F^x (the diagonal terms vanish because x wedge x = 0 there, the others cancel in pairs by symmetry), so [X] lies in A(F) and defines xi_A in the CGZ Bloch group B_CGZ(F) of K3BlochGroups:V.3/cgz-bloch-group (CGZ Definition 1.1). If A is rational with common denominator delta and X is real with 0 < X_i < 1 (real powers), then delta . d([X]) = 0, so delta[X] lies in A(F) and xi_A := [delta[X]] tensor 1/delta is an element of B_CGZ(F) tensor Q; this is the precise meaning of CGZ's 'tensor everything with Q'. The relation with Suslin's antisymmetric convention is HB.3/suslin-obstruction-of-the-nahm-element: there the boundary of [X] is y wedge y with y = prod_i X_i^{a_ii}, which need not vanish.

**Hypotheses and conventions.** F is a field; A is symmetric; every X_i lies in F - {0,1}. The boundary is CGZ's map d : Z(F) -> wedge^2 F^x into the EXTERIOR square (CGZ (defd), K3BlochGroups:V.3/cgz-bloch-group), not the antisymmetric tensor quotient of K3BlochGroups:V.3/antisymmetric-tensor-quotient. CGZ's group satisfies [1] = 3[0] = [X] + [1/X] = [X] + [1 - X] - [0] = 0; its comparison with Suslin's group is K3BlochGroups:V.3/cgz-convention-comparison (the map kappa from Suslin's B(F) has elementary abelian 2-group kernel and cokernel; CGZ's remark that their group is a quotient of Suslin's concerns the exterior-kernel group B-tilde(F), see K3BlochGroups/E12).

**Proof route.**

1. Form [X] in Z(F).
2. For each i rewrite 1 - X_i = prod_j X_j^{a_ij}, so X_i wedge (1 - X_i) = sum_j a_ij X_i wedge X_j in wedge^2 F^x.
3. Sum over i: the terms with i = j vanish because X_i wedge X_i = 0 in the exterior square, and the terms (i,j), (j,i) with i != j cancel because a_ij = a_ji and X_i wedge X_j = -X_j wedge X_i.
4. For rational A with denominator delta, (1 - X_i)^delta = prod_j X_j^{delta a_ij} in F (the X_i are positive reals), so delta . d([X]) = 0 by the same computation; take the class of delta[X] and divide by delta in B_CGZ(F) tensor Q.
5. Record functoriality under field homomorphisms and the identification of xi_A for the distinguished solution with CGZ's element.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-equations](#habironahmseries-hb-3-nahm-equations), `K3BlochGroups:V.3/cgz-bloch-group`, `K3BlochGroups:V.3/cgz-convention-comparison`, `mathlib:exteriorPower.ιMulti`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `nahmElement` | data | [X] = sum_i [X_i] in Z(F) for a solution X in (F - {0,1})^N. |
| `nahmElement_boundary` | characterisation | For integral symmetric A, d(nahmElement X) = 0 in wedge^2 F^x (CGZ's exterior square). |
| `nahmBlochClass` | data | The class xi_A in B_CGZ(F) for integral A, and in B_CGZ(F) tensor Q for rational A with 0 < X_i < 1. |
| `nahmBlochClass_eq_sum` | simp | nahmBlochClass is the image of sum_i [X_i]. |
| `nahmBlochClass_map` | functoriality | For a field homomorphism s : F -> E, cgzBloch.map s (nahmBlochClass X) = nahmBlochClass (s o X). |
| `nahmBlochClass_clearDenominators` | compatibility | For rational A with common denominator delta, delta . nahmBlochClass X (in B_CGZ(F) tensor Q) is the image of the integral class of delta[X]. |

**Discriminating tests.**

- **`boundary_vanishes`** (computation): For A = (2) and X = (sqrt 5 - 1)/2, X wedge (1 - X) = X wedge X^2 = 2 (X wedge X) = 0 in wedge^2 Q(sqrt 5)^x.
- **`half_is_cgz_bloch`** (computation): For A = (1), [1/2] lies in A(Q) = ker(d : Z(Q) -> wedge^2 Q^x).
- **`half_not_suslin`** (non-example): For A = (1), the boundary of [1/2] in antisymSquare Z (Additive Q^x) is non-zero, so a definition using the antisymmetric target would not contain CGZ's xi_(1).
- **`torsion_example`** (computation): For A = (8 5; 5 4), 60 . xi_A = 0 in B_CGZ(F) (GSWZ Section 4.3; certified by a five-term certificate of K3BlochGroups V.6).
- **`map_compatibility`** (compatibility): For the two real embeddings of the quartic field of A = (8 5; 5 4), nahmBlochClass_map sends xi to the class of the corresponding real solution.

**Acceptance.**

- For the distinguished solution of a positive definite A the class is CGZ's xi_A of Section 7.1 (ii).
- For A = (8 5; 5 4) the class xi = [z_1] + [z_2] in B_CGZ(F), F of discriminant -5^2 . 19, is torsion (60-torsion by GSWZ Section 4.3); for the second Galois orbit, over z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1 (discriminant 229), it is not torsion (HB.3/embeddings-and-regulator-evaluations).
- For A = (1) the solution X = 1/2 gives [1/2] in A(Q) with CGZ's exterior boundary, while its boundary in the antisymmetric quotient is 2 wedge 2, the generator of antisymSquare Z Z = Z/2 on the factor generated by 2, which is non-zero: the element is a Bloch element in CGZ's convention and not in Suslin's (see HB.3/suslin-obstruction-of-the-nahm-element).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), printed p. 35. The whole construction and the rational caveat, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, after equation (zjt=0). The same class for an arbitrary non-degenerate solution, which is the setting of GSWZ Theorem 5.


<a id="habironahmseries-hb-3-general-nondegenerate-class"></a>

### The class of an arbitrary non-degenerate solution, and the ring it generates

**Construction** · `HabiroNahmSeries:HB.3/general-nondegenerate-class` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction](#habironahmseries-hb-3-signed-exterior-boundary-obstruction). Its hypotheses and limitations govern this target and the API names below.

For a symmetric integral A and a nondegenerate signed solution z, form K=Q(z) and the localized ring R=O_K[1/Δ]. The signed exterior boundary is the obstruction specified below; a class ξ in the owner’s integral Bloch/K₃ convention must be supplied before using an indexed module. Symmetry alone does not establish that the unmultiplied symbol ∑[z_j] has zero integral boundary. Retain the finite étale algebra R[T]/(δT²−1), after inverting 2 and δ, including both factors if it splits. Use the excluded integer of HB.1, not merely the field discriminant. The class convention and its K₃ lift are the HB.3 owner request.

**Proof route.**

1. Expand the signed product in the second wedge coordinate.
2. The unsigned symmetric double sum cancels exactly as in coherentRootBoundary with d=1. The diagonal signs remain ∑M_ii z_i∧(−1).
3. The unit −1 has order dividing 2, so twice every remaining wedge vanishes.
4. Apply the corrected CGZ exterior-kernel definition only to the doubled symbol. The parent general-nondegenerate-class cannot be used for an unmultiplied integral class until the convention request is supplied.

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/nondegenerate-solution-and-discriminant](#habironahmseries-hb-3-nondegenerate-solution-and-discriminant), [HabiroNahmSeries:HB.3/nondegenerate-points-are-algebraic](#habironahmseries-hb-3-nondegenerate-points-are-algebraic), `mathlib:NumberField`.

**Planning API (under the controlling refinement).**

| Declaration | Role | Contract |
| --- | --- | --- |
| `nahmRing` | data | The ring R = O_K[1/Delta] attached to a non-degenerate solution. |
| `nahmRing.deltaInv` | data | The ring R[delta^{-1/2}] with a chosen square root of the discriminant inverted. |
| `nahmRing.involution` | structure | The involution of R[delta^{-1/2}] over R negating the square root. |
| `nahmRing.involution_sq` | simp | The involution is an involution. |
| `nahmRing.class` | data | The Bloch class xi attached to the solution. |
| `nahmRing.delta_isUnit` | characterisation | The discriminant is a unit in R[delta^{-1/2}]. |

**Discriminating tests (retaining the same qualified hypotheses).**

- **`cubic_ring`** (computation): For A = (3), K = Q(z) with z^3 - z + 1 = 0 has discriminant -23, and R = O_K[1/Delta] with Delta = 6 . 23 (the convention 2, 3 | Delta of GSWZ Remark 1.8).
- **`quartic_ring`** (computation): For A = (8 5; 5 4), the selected quartic coefficient ring O_F[1/(6 · 5 · 19)] is the source localization. This computation tests the field and coefficient ring only. The complete excluded integer for indexed membership also requires the tame kernel and the specified integral class.
- **`involution_nontrivial`** (characterisation): The involution negating the square root of delta is not the identity whenever delta is not a square in R, for instance for A = (3).
- **`delta_unit`** (characterisation): delta is invertible in R[delta^{-1/2}] and its adjoined square root squares to it.
- **`sign_not_cgz`** (non-example): For A = (3) this node's field (discriminant -23) differs from the field of CGZ's distinguished solution (discriminant -31, HB.3/algebraicity-and-the-nahm-field): the GSWZ sign is not a relabelling of CGZ's equations.

**Acceptance.**

- For A = (3), the signed equation 1−z=−z³ gives z³−z+1=0 and field discriminant −23. The norm of δ=z⁻³(3−2z) is 23 up to sign. The full membership localization must satisfy the HB.1 excluded-integer contract.
- For A = (8 5; 5 4), separate the two quartic orbits, of discriminants −475 and 229. The source reports numerical regulator vanishing and 60-torsion for the first orbit; an exact integral certificate and K₃ lift remain obligations. The second orbit is the source non-example.
- Retain both components of R[T]/(δT²−1) when it splits. Nondegeneracy prevents the vacuous zero algebra obtained by inverting δ=0.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, the t = 1 specialisation. The ring, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 1.8. The convention on Delta and on the excluded primes. [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 1.9. The eigenspace statement that the involution is needed for.


<a id="habironahmseries-hb-3-embeddings-and-regulator-evaluations"></a>

### Embeddings of the solution field and the regulator evaluations

**Construction** · `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison). Its hypotheses and limitations govern this target and the API names below.

For symmetric rational A=M/d, the distinguished x, F=Q(x) and E=Q(positiveRootLift(d,x)), let c_d∈B_CGZ(F) be represented by d∑[x_i], and β∈B_CGZ(E) by ∑[x_i]. The field map sends c_d to dβ; hence ξ_F=c_d/d∈B_CGZ(F)⊗Q maps to β⊗1. The definition of ξ_F is independent of the clearing denominator. For every embedding τ:E→C, its Bloch–Wigner evaluation is ∑D(τx_i), equal to the evaluation of ξ_F at τ restricted to F; every embedding of F extends to E. With the requested Borel injectivity and unique divisibility, ξ_F=0 iff β is torsion iff β maps to zero over Qbar. At the preferred real embedding, put S=∑L_CGZ(x_i), with L_CGZ=π²/6−L_std and period π²/2. The Rogers map is applied to integral c_d or β: L(c_d)=dS modulo π²/2. Torsion of c_d implies S∈Qπ². A circle-valued Rogers map is never assigned a Q-linear extension or a unique division by d.

**Proof route.**

1. Use coherentRootBoundary in E and the accepted denominator-clearing construction in F. Functoriality of symbols gives c_d↦dβ. Rationalization embeds the relevant kernel into the rational pre-Bloch group, so changing d gives the same rational class.
2. Extend embeddings of F into C across the algebraic extension E/F using IsAlgClosed.surjective_domRestrict_of_isAlgebraic. Finite sums and the imported Bloch–Wigner descent give the same evaluations after restriction.
3. Import the parent torsion-criterion-by-regulators, with the nonzero rational scalar comparison from Polylogarithms P.2; exact scalar or sign is unnecessary for zero detection. The Borel injectivity request is still open.
4. Import the parent torsion-in-the-algebraic-closure subject to its precise unique-divisibility request. Torsion maps to zero over Qbar. Conversely fix an inclusion E→Qbar; for each τ:E→C, extend τ across the algebraic extension Qbar/E by IsAlgClosed.surjective_domRestrict_of_isAlgebraic. If β has zero image in B(Qbar), functoriality through each extended embedding gives all Bloch–Wigner values zero; the number-field Borel criterion then makes β torsion. No unsupported integral injection is used.
5. Use CGZ (42) and Zagier II.1A to pin the real convention. If m c_d=0, then m d S∈(π²/2)Z, so S∈Qπ². This is integer arithmetic and requires no division homomorphism on the circle.

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/bloch-wigner-five-term`, `Polylogarithms:P.1`, `mathlib:NumberField.Embeddings.card`, `mathlib:NumberField.InfinitePlace`.

**Planning API (under the controlling refinement).**

| Declaration | Role | Contract |
| --- | --- | --- |
| `nahmRegulator` | data | For a solution X over a number field F, the function sigma -> sum_i D(sigma X_i) on the complex embeddings of F. |
| `nahmRegulator_conj` | relation | nahmRegulator (conj o sigma) = - nahmRegulator sigma; in particular it vanishes at real embeddings. |
| `nahmRegulator_eq_cgzBloch` | compatibility | nahmRegulator depends only on xi_A in B_CGZ(F): it is the composite of cgzBloch.map sigma with the Bloch-Wigner homomorphism. |
| `rogersValue` | data | L(xi_A) = sum_i L(X_i) in R/(pi^2/2)Z for the distinguished solution, with L of CGZ (42) imported from Polylogarithms P.1. |
| `rogersValue_eq_neg_gz` | relation | rogersValue = -sum_i L_GZ(X_i) = Lambda, where L_GZ(z) = Li_2(z) + (1/2) log z log(1-z) - pi^2/6 is GZ's normalisation (8); so L_GZ = -L on (0,1). |
| `rogersValue_rat_of_torsion` | characterisation | If xi_A has finite order r then r . rogersValue lies in (pi^2/2)Z. |

**Discriminating tests (retaining the same qualified hypotheses).**

- **`rogers_at_golden`** (computation): For A = (2), rogersValue = pi^2/15 in R/(pi^2/2)Z (not pi^2/10, which is the standard normalisation).
- **`rogers_normalisation`** (characterisation): L(1) = 0 and L(0) = pi^2/6, and L(x) + L_std(x) = pi^2/6 for 0 < x < 1: CGZ's L is pi^2/6 minus the standard Rogers dilogarithm, not a translate of it.
- **`regulator_vanishes_torsion`** (computation): For A = (8 5; 5 4), nahmRegulator vanishes at the complex embedding of the quartic field of discriminant -5^2 . 19.
- **`regulator_nonzero_nontorsion`** (non-example): For A = (3), nahmRegulator = +-0.7915833... at the complex embedding of the field of discriminant -31, so xi_(3) is not torsion.
- **`rogers_nahm_rank_two`** (computation): For A = (4 1; 1 1), rogersValue = 7 pi^2/60 and nahmRegulator vanishes.

**Acceptance.**

- For A = (2), L(xi_A) = pi^2/6 - (pi^2/10 - log^2 phi) - log^2 phi = pi^2/15 (CGZ normalisation); the standard Rogers value L_std((sqrt 5 - 1)/2) = pi^2/10. Check: GZ's Lambda for A = (2) is 0.657973... = pi^2/15.
- For A = (8 5; 5 4), D(sigma xi) = 0 at the complex embedding (the first orbit) and L(xi)/pi^2 = 1/15; for the second orbit D(sigma xi) = +-1.18968... and +-1.69281... at the two pairs of complex embeddings.
- For A = (3), D(sigma X) = +-0.791583... at the complex embedding of the cubic field of discriminant -31, so xi_(3) is not torsion; for A = (4 1; 1 1), D vanishes and L(xi_A) = 7 pi^2/60.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, equation (normalization), printed p. 37. The Rogers dilogarithm in the normalisation this packet uses, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), printed p. 36. The torsion criterion and the two ways of certifying it, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (ii), printed p. 36. The rationality consequence, verbatim.


<a id="habironahmseries-hb-3-torsion-criterion-by-regulators"></a>

### Torsion of a Bloch class is detected by the Bloch-Wigner evaluations

**Theorem** · `HabiroNahmSeries:HB.3/torsion-criterion-by-regulators` · [packet](../packets/HabiroNahmSeries.json)

Let F be a number field and xi in B_CGZ(F) (or in B_CGZ(F) tensor Q). Then xi is torsion (respectively zero) if and only if sum_i n_i D(sigma x_i) = 0 for every complex embedding sigma of F, where xi is represented by sum_i n_i [x_i] and D is the Bloch-Wigner function.

**Hypotheses and conventions.** F a number field; the evaluations are those of HB.3/embeddings-and-regulator-evaluations. Borel's theorem enters as the injectivity of the Borel regulator on K_3(F)/torsion, requested from BorelRegulators R.4 (the image is a full lattice of rank r_2).

**Proof route.**

1. Pass to B_CGZ(F) tensor Q = B(F) tensor Q = K_3^ind(F) tensor Q = K_3(F) tensor Q (K3BlochGroups:V.3/cgz-convention-comparison, K3BlochGroups:V.6/comparison-rational).
2. Identify the vector of Bloch-Wigner evaluations with a non-zero rational multiple of the Borel regulator (K3BlochGroups:V.6/regulator-agreement, Polylogarithms:P.2/borel-comparison).
3. Injectivity of the Borel regulator on K_3(F) tensor Q (requested from BorelRegulators R.4) gives the claim.

**Direct inputs.** [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `K3BlochGroups:V.6/comparison-rational`, `K3BlochGroups:V.6/regulator-agreement`, `Polylogarithms:P.2/borel-comparison`, `K3BlochGroups:V.3/cgz-convention-comparison`, `BorelRegulators:R.4`.

**Acceptance.**

- For A = (8 5; 5 4) the evaluation vanishes and the class is torsion (60-torsion, GSWZ Section 4.3).
- For A = (3) the evaluation is +-0.7915833... at the complex embedding, so xi_(3) is not torsion.
- For a totally real field every evaluation vanishes and every class is torsion (r_2 = 0), for instance xi_(2) in B(Q(sqrt 5)).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), p. 35 (arXiv v3). The criterion, which the source asserts without proof; the proof is Borel's theorem through the regulator comparison.


<a id="habironahmseries-hb-3-torsion-in-the-algebraic-closure"></a>

### Torsion, and what vanishing in the Bloch group of the algebraic numbers means

**Lemma** · `HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure` · [packet](../packets/HabiroNahmSeries.json)

The Bloch groups of the algebraic numbers and of the complex numbers are uniquely divisible, hence torsion free. Therefore the image of xi_A in the Bloch group of the algebraic numbers vanishes exactly when xi_A is torsion in the Bloch group of the field F it is defined over. The two formulations of Nahm's conjecture, vanishing in the Bloch group of the algebraic numbers and torsion in the Bloch group of the smallest field containing the coordinates, are equivalent for this reason and for no other.

**Hypotheses and conventions.** F is the number field generated by the solution; the map is induced by an embedding of F into Q-bar (or C). Unique divisibility of the Bloch group of an algebraically closed field of characteristic zero is Suslin's theorem (CGZ cite [Suslinclosed, Theorem 6.3]); it is requested from K3BlochGroups V.4, where no node supplies it yet. For algebraically closed F the conventions of K3BlochGroups:V.3/cgz-convention-comparison agree (F^x is 2-divisible), so the statement is convention-independent. B_CGZ(F) is finitely generated (Borel), which is what makes 'torsion' a finiteness statement.

**Proof route.**

1. If xi_A has finite order r, its image in B(Q-bar) is killed by r, hence zero because B(Q-bar) is uniquely divisible (requested from K3BlochGroups V.4).
2. Conversely, if the image in B(C) vanishes for one embedding, then it vanishes for every embedding (compose with automorphisms of C), so D(sigma xi_A) = 0 for every sigma, and xi_A is torsion by HB.3/torsion-criterion-by-regulators.
3. Record that the equivalence concerns the target: xi_A itself is in general a non-zero torsion element of B_CGZ(F) whose order HB.9 uses.

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](#habironahmseries-hb-3-torsion-criterion-by-regulators), `K3BlochGroups:V.4`, `K3BlochGroups:V.3/cgz-convention-comparison`.

**Acceptance.**

- For A = (8 5; 5 4) the class is 60-torsion in B_CGZ(F) and zero in B(Q-bar).
- For A = (3) the class is non-zero in B(C): D(sigma X) = 0.7915833... != 0.
- The equivalence is not an equality of orders: the order of the torsion element is data that the image in B(Q-bar) forgets.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 1.3, after Theorem 1.8, printed p. 6. The equivalence and its reason, verbatim.


<a id="habironahmseries-hb-3-suslin-obstruction-of-the-nahm-element"></a>

### The Nahm element in Suslin's antisymmetric convention

**Lemma** · `HabiroNahmSeries:HB.3/suslin-obstruction-of-the-nahm-element` · [packet](../packets/HabiroNahmSeries.json)

Let F be a field, A integral symmetric and X a solution of Nahm's equations in (F - {0,1})^N (CGZ sign). In the antisymmetric tensor quotient antisymSquare Z (Additive F^x) of K3BlochGroups:V.3/antisymmetric-tensor-quotient, the boundary of [X] = sum_i [X_i] in the pre-Bloch group is y wedge y with y = prod_i X_i^{a_ii}. Hence [X] always lies in the exterior-kernel group B-tilde(F), its image under the map B-tilde(F) -> F^x/F^{x2} of K3BlochGroups:V.3/exterior-kernel-discrepancy is the class of y, and [X] lies in Suslin's B(F) exactly when y wedge y = 0. In particular [X] lies in Suslin's B(F) when every a_ii is even. Modulo odd n, or after tensoring with Z[1/2], the three conventions agree (K3BlochGroups:V.3/cgz-convention-comparison), which is the only form in which HabiroNumberFields HB.1 transports xi_A.

**Hypotheses and conventions.** F a field; A integral symmetric; X in (F - {0,1})^N solves the CGZ equations. The antisymmetric quotient kills a wedge b + b wedge a but not a wedge a; 2(a wedge a) = 0 and (a + b) wedge (a + b) = a wedge a + b wedge b there.

**Proof route.**

1. Compute the boundary as in HB.3/bloch-class-of-a-solution but in the antisymmetric quotient: the off-diagonal terms cancel in pairs and the diagonal terms leave sum_i a_ii (X_i wedge X_i).
2. Use antisymSquare.wedge_self_add and 2(a wedge a) = 0 to rewrite sum_i a_ii (X_i wedge X_i) = y wedge y with y = prod_i X_i^{a_ii}.
3. Read off the image in F^x/F^{x2} from the exact sequence of K3BlochGroups:V.3/exterior-kernel-discrepancy.

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), `K3BlochGroups:V.3/antisymmetric-tensor-quotient`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/exterior-kernel-discrepancy`, `K3BlochGroups:V.3/cgz-convention-comparison`.

**Acceptance.**

- For A = (1), X = 1/2, y = 1/2 and y wedge y = 2 wedge 2 != 0 in antisymSquare Z (Additive Q^x): [1/2] is in CGZ's A(Q) but not in Suslin's B(Q).
- For A = (2) (a_11 even), [X] lies in Suslin's B(Q(sqrt 5)).
- For A = (8 5; 5 4) all diagonal entries are even, so xi lies in Suslin's B(F) as well as in B_CGZ(F).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 2.1, Definition 2.1 and Lemma 2.2, p. 8-9 (arXiv v3). CGZ's comparison, stated for their exterior-square 'Suslin' group; the antisymmetric convention and its correction are K3BlochGroups/E12, E14. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, observation (i), p. 35. The computation this node repeats in the antisymmetric quotient, where it leaves the diagonal term.


### HB.3 finer contracts

These 7 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-3-clearing-polynomial-system"></a>

### Polynomial equations with cleared denominators

**Definition** · `HabiroNahmSeries:HB.3/clearing-polynomial-system` · [packet](../packets/HabiroNahmSeries--HB.3.json)

For n finite, d∈N, M∈Mat_n(Z), ε∈Z^n, define P_i∈Q[Y_1,…,Y_n] by P_i=(1−Y_i^d)∏_j Y_j^{max(−M_ij,0)}−ε_i∏_j Y_j^{max(M_ij,0)}. For d>0 and all y_j nonzero in a Q-algebra field, P_i(y)=0 exactly when 1−y_i^d=ε_i∏_j y_j^{M_ij}. For rational A=M/d and unsigned analytic data ε_i=1, put x_i=y_i^d; these are polynomial equations for coherent dth roots of the Nahm coordinates. Clearing negative exponents does not license y_j=0.

**Hypotheses and conventions.** n is a natural number; empty systems are permitted. d>0 for its interpretation as denominator clearing. All coordinates are units for the Laurent-equation equivalence; no positivity or symmetry is needed for this definition.

**Proof route.**

1. Split M_ij into its positive and negative parts, and multiply each Laurent equation by the negative-exponent monomial.
2. Use the existing multivariate-polynomial evaluation and its algebra-homomorphism laws.
3. Over a field, cancel the clearing monomial only under the explicit unit hypothesis.

**Direct inputs.** `mathlib:MvPolynomial.aeval`, [HabiroNahmSeries:HB.3/nahm-equations](#habironahmseries-hb-3-nahm-equations).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `clearingPolynomial.eval` | compatibility | For any Q-algebra field K and y∈K^n, aeval_y(P_i)=(1−y_i^d)∏y_j^{max(−M_ij,0)}−ε_i∏y_j^{max(M_ij,0)}. |
| `clearingPolynomial.zero_iff` | characterisation | For d>0 and all y_j≠0, P_i(y)=0 iff 1−y_i^d=ε_i∏y_j^{M_ij}. |
| `clearingPolynomial.nonnegative` | simp | If every M_ij≥0, P_i=1−Y_i^d−ε_i∏Y_j^{M_ij}. |
| `clearingPolynomial.map` | functoriality | For a Q-algebra field homomorphism φ:K→L, φ(aeval_y P_i)=aeval_{φ∘y} P_i. |
| `clearingPolynomial.reindex` | equivalence | For a permutation e of the indices, rename_e(P_i(d,M,ε))=P_{e(i)}(d,M∘(e⁻¹,e⁻¹),ε∘e⁻¹). |

**Discriminating tests.**

- **`clearingPolynomial_rank_one`** (computation): For d=1,M=(2),ε=1, P_1=1−Y_1−Y_1².
- **`clearingPolynomial_negative_entry`** (computation): For d=1,M=(−1),ε=1, P_1=(1−Y_1)Y_1−1.
- **`clearingPolynomial_zero_denominator`** (degenerate): For d=0,M=(0),ε=1 in rank one, P_1=−1. The polynomial definition makes sense, but d=0 cannot represent a denominator or root lift.
- **`clearingPolynomial_boundary_zero`** (non-example): For n=2,d=1,ε=(1,1),M_ii=−1 and M_ij=1 for i≠j, P_i(0,0)=0 for both i; the Laurent equivalence fails at the origin.
- **`clearingPolynomial_aeval_compatibility`** (compatibility): For rational y in rank one with d=1,M=(2),ε=1, the existing MvPolynomial.aeval returns 1−y−y².

**Acceptance.**

- For n=1,d=1,M=(2),ε=1, P=1−Y−Y².
- For M=(−1), P=(1−Y)Y−1, not 1−Y−Y.
- For the symmetric two-variable matrix with diagonal −1 and off-diagonal 1, the origin is a polynomial zero but is not a Laurent solution.

**Sources.** [zagier-2007](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf): II.3A, (3.3), p. 43. The root polynomial is an explicit refinement of the rational-power convention, allowing negative integral entries. [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §1.7, (41), p. 14. Taking d=1 and ε_j=(−1)^M_jj supplies the signed formal system, without positivity assumptions. The excerpt retains the printed z_j inside the product; the node uses the corrected z_i as in the already confirmed HabiroNahmSeries/E36, carried below.


<a id="habironahmseries-hb-3-cleared-system-jacobian"></a>

### Jacobian of the cleared Nahm equations

**Theorem** · `HabiroNahmSeries:HB.3/cleared-system-jacobian` · [packet](../packets/HabiroNahmSeries--HB.3.json)

Let d>0, M integral, ε integral, K a Q-algebra field, and y∈K^n satisfy P_i(y)=0, y_i≠0 and 1−y_i^d≠0. Set x_i=y_i^d, c_i=(1−x_i)∏_j y_j^{max(−M_ij,0)}, B=M+d diag(x_i/(1−x_i)). Then J_ij=(∂P_i/∂Y_j)(y) is exactly −diag(c) B diag(y_j⁻¹). In particular det J=(−1)^n(∏c_i)(∏y_i⁻¹)det B and det J≠0 iff det B≠0. When M=dA, B=d(A+diag(x/(1−x))); hence positive-definite A and x∈(0,1)^n imply a nonsingular polynomial Jacobian.

**Hypotheses and conventions.** The polynomial zero is a unit zero, and x_i≠1. The final positivity consequence is over R, with A=M/d symmetric positive definite; the factorization itself needs no symmetry or positivity.

**Proof route.**

1. Differentiate (1−Y_i^d) times the clearing monomial and the positive monomial term using pderiv.
2. Write a_ij=max(M_ij,0). Before restricting to a zero, J_ij+c_i(M_ij+d δ_ij x_i/(1−x_i))/y_j=a_ij P_i(y)/y_j. Hence at P_i(y)=0 the logarithmic derivative is exactly −c_i(M_ij+d δ_ij x_i/(1−x_i))/y_j; no clearing-factor derivative is discarded without its vanishing-equation hypothesis.
3. Take determinants of the three factors. All row and column scaling factors are units.
4. For the analytic solution, the parent distinguished-solution node gives positivity of A+diag(x/(1−x)); use Matrix.PosDef.det_pos.

**Direct inputs.** [HabiroNahmSeries:HB.3/clearing-polynomial-system](#habironahmseries-hb-3-clearing-polynomial-system), `mathlib:MvPolynomial.pderiv`, `mathlib:Matrix.det`, `mathlib:Matrix.PosDef`, `mathlib:Matrix.PosDef.det_pos`, [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), [HabiroNahmSeries:HB.3/nondegenerate-solution-and-discriminant](#habironahmseries-hb-3-nondegenerate-solution-and-discriminant).

**Acceptance.**

- For d=1,M=(2), at 1−y=y² the formula gives P′(y)=−1−2y.
- For d=2,M=(1), P=1−y²−y, its positive root has derivative −2y−1; no d factor may be omitted.
- For n=0, the determinant is 1 and every empty product is 1.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §1.7, (36), p. 13. The d=1 logarithmic Jacobian underlying δ; the displayed factorization extends it to root variables and cleared monomials. [zagier-2007](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf): II.3A, (3.3), p. 43. The polynomial differentiation is derived here, not a quoted general algebraicity theorem.


<a id="habironahmseries-hb-3-coordinate-field-differential-bridge"></a>

### The coordinate field of a nonsingular polynomial zero

**Theorem** · `HabiroNahmSeries:HB.3/coordinate-field-differential-bridge` · [packet](../packets/HabiroNahmSeries--HB.3.json)

Let k⊆L be fields, p=(p_1,…,p_n)∈L^n generate L as a field over k, and f_1,…,f_n∈k[Y_1,…,Y_n] satisfy f_i(p)=0. If det((∂f_i/∂Y_j)(p))≠0, then Ω_{L/k}=0, so L is formally unramified over k and is a finite-dimensional k-vector space. This supplies the previously missing differential/finite-generation input to the accepted parent nondegenerate-points-are-algebraic node; it does not assume beforehand that the coordinates are algebraic.

**Hypotheses and conventions.** n is finite, including n=0. L=k(p_1,…,p_n) as a field; L is not assumed generated as a k-algebra. The Jacobian is square and invertible over L; no analytic isolation argument is assumed.

**Proof route.**

1. Apply the universal k-derivation to f_i(p)=0. A monomial induction using Leibniz gives ∑_j (∂f_i/∂Y_j)(p) dp_j=0. Multiplication by the inverse Jacobian makes every dp_j zero.
2. The kernel of the universal derivation contains k and each p_j and is closed under addition, multiplication and inversion: differentiating aa⁻¹=1 gives the inverse rule. IntermediateField.adjoin_induction and field generation imply D(a)=0 for every a∈L.
3. KaehlerDifferential.span_range_derivation now makes Ω_{L/k} zero. This is exactly Algebra.FormallyUnramified and Stacks 00UO.
4. The finite set of field generators gives (top : IntermediateField k L).FG by IntermediateField.fg_adjoin_of_finite and the hypothesis adjoin k (range p)=top. Apply IntermediateField.fg_top_iff to obtain Algebra.EssFiniteType k L on L itself. A vector space over a field is free. Algebra.FormallyUnramified.finite_of_free therefore gives Module.Finite k L.
5. For a polynomial zero in C over Q, apply this argument to Q(p) and transport its finite-dimensional conclusion to algebraicity of each coordinate. This is the missing proof input for the existing parent target, not a second version of that target.

**Direct inputs.** `mathlib:MvPolynomial.aeval`, `mathlib:MvPolynomial.pderiv`, `mathlib:Matrix.det`, `mathlib:KaehlerDifferential.D`, `mathlib:KaehlerDifferential.span_range_derivation`, `mathlib:Algebra.FormallyUnramified`, `mathlib:IntermediateField.adjoin_induction`, `mathlib:IntermediateField.fg_adjoin_of_finite`, `mathlib:IntermediateField.fg_top_iff`, `mathlib:Algebra.FormallyUnramified.finite_of_free`.

**Acceptance.**

- f=Y²−2 at p=√2 gives the finite field Q(√2).
- The zero polynomial at a transcendental p has zero Jacobian and supplies no algebraicity conclusion.
- No use of the real or complex inverse function theorem is required.

**Sources.** [stacks-unramified](https://stacks.math.columbia.edu/tag/00UO): Lemma 10.148.3, tag 00UO. The equivalence with formal unramifiedness; the finite conclusion follows the pinned Mathlib theorem whose hypotheses are verified above. [cgz-v3](https://arxiv.org/pdf/1712.04887v3): §7.1, observation (i), p. 35. Motivates the finite coordinate field. The nonsingular-zero theorem is established by the differential argument, not by the source’s generic dimension heuristic.


<a id="habironahmseries-hb-3-positive-coherent-root-lift"></a>

### Positive coherent roots and the root field

**Construction** · `HabiroNahmSeries:HB.3/positive-coherent-root-lift` · [packet](../packets/HabiroNahmSeries--HB.3.json)

For d∈N and x∈R^n, define positiveRootLift(d,x)_i=x_i^{1/d} using Real.rpow. Its use is restricted to d>0 and x∈(0,1)^n. For A=M/d, M integral, and 1−x_i=∏x_j^{A_ij}, the canonical y=positiveRootLift(d,x) lies in (0,1)^n, y_i^d=x_i and 1−x_i=∏y_j^{M_ij}. Define E=Q(y_1,…,y_n) with the existing IntermediateField.adjoin, and F=Q(x_1,…,x_n); F⊆E. If A is positive definite, E is a number field by the cleared Jacobian and coordinate-field bridge, and therefore F is also a number field. Neither E=F nor arbitrary complex choices of roots are asserted.

**Hypotheses and conventions.** d>0 for every root, field or algebraicity assertion. The equation uses positive real rational powers; x∈(0,1)^n. Positive definiteness is required only for the finite-field conclusion, not for constructing the positive roots or proving the exact coherent equations.

**Proof route.**

1. Use the positive real branch of rpow and Real.rpow_inv_natCast_pow to recover x. Logarithms show y_j^{M_ij}=x_j^{M_ij/d}, including negative integer M_ij.
2. Apply clearingPolynomial.zero_iff with ε=1, and clearingJacobian plus positivity to obtain a nonsingular rational polynomial zero.
3. Apply coordinateFieldUnramified to the field generated by y. This gives E finite over Q; no independent field abstraction is introduced.
4. Because x_i=y_i^d, the existing adjoin universal property gives F⊆E. Preserve the choice of roots when transporting symbols and regulators.

**Direct inputs.** [HabiroNahmSeries:HB.3/clearing-polynomial-system](#habironahmseries-hb-3-clearing-polynomial-system), [HabiroNahmSeries:HB.3/cleared-system-jacobian](#habironahmseries-hb-3-cleared-system-jacobian), [HabiroNahmSeries:HB.3/coordinate-field-differential-bridge](#habironahmseries-hb-3-coordinate-field-differential-bridge), [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), `mathlib:Real.rpow_inv_natCast_pow`, `mathlib:IntermediateField.adjoin`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `positiveRootLift.eq_rpow` | projection | For every i, positiveRootLift(d,x)_i=Real.rpow(x_i,1/d). |
| `positiveRootLift.pow` | simp | For d>0 and x_i≥0, positiveRootLift(d,x)_i^d=x_i. |
| `positiveRootLift.mem_cube` | structure | For d>0 and x∈(0,1)^n, the root lift is also in (0,1)^n. |
| `positiveRootLift.one` | simp | For nonnegative x, positiveRootLift(1,x)=x. |
| `positiveRootLift.unique` | characterisation | For d>0 and nonnegative x,y with y_i^d=x_i, y=positiveRootLift(d,x). |
| `positiveRootLift.equations` | compatibility | For d>0, x∈(0,1)^n satisfying 1−x_i=∏x_j^{M_ij/d}, the lift y satisfies 1−x_i=∏y_j^{M_ij}. |
| `positiveRootLift.field_le` | compatibility | For d>0 and nonnegative x, adjoin_Q(range x)≤adjoin_Q(range positiveRootLift(d,x)). |
| `positiveRootLift.finite` | instance | For d>0, positive-definite A=M/d and x∈(0,1)^n satisfying its Nahm equations, Q(positiveRootLift(d,x)) is a finite Q-module, hence a number field. |

**Discriminating tests.**

- **`positiveRootLift_rank_one_half`** (computation): positiveRootLift(2,((3−√5)/2))=(√5−1)/2 in rank one.
- **`positiveRootLift_denominator_one`** (computation): positiveRootLift(1,(1/2))=1/2 in rank one.
- **`positiveRootLift_empty`** (degenerate): For n=0 and d=2, IntermediateField.adjoin Q of the root coordinates is the bottom intermediate field Q.
- **`positiveRootLift_negative_branch`** (non-example): positiveRootLift(2,(1/4))≠−1/2: the other square root is not the canonical coherent lift.

**Acceptance.**

- For A=(1/2),d=2,M=(1), x=(3−√5)/2 and y=(√5−1)/2, so y²=x and 1−x=y.
- For d=1 and nonnegative x, the lift is x and the two coordinate fields coincide.
- For n=0, the field adjoined by the empty coordinate list is Q.

**Sources.** [zagier-2007](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf): II.3A, p. 43, rational A paragraph. The survey requires coherent rational powers; positive roots supply the canonical coherent lift on the distinguished real component. [cgz-v3](https://arxiv.org/pdf/1712.04887v3): §7.1, after (42), p. 36. CGZ explicitly distinguishes the coordinate field from a field containing chosen roots; denominator roots use the same field discipline.


<a id="habironahmseries-hb-3-coherent-root-exterior-boundary"></a>

### The integral exterior boundary in the root field

**Theorem** · `HabiroNahmSeries:HB.3/coherent-root-exterior-boundary` · [packet](../packets/HabiroNahmSeries--HB.3.json)

Let K be a field, d∈N, M a symmetric integral matrix, and y_i,t_i∈Kˣ satisfy t_i=1−y_i^d and t_i=∏_j y_j^{M_ij}. Then ∑_i (y_i^d)∧t_i=0 in Λ²_Z(Additive Kˣ). Thus, for d>0, x_i=y_i^d and x_i≠0,1, the symbol sum ∑[x_i] is in the exact exterior kernel over the field containing the coherent roots, and defines an integral class in the corrected CGZ convention of K3BlochGroups V.3. In the coordinate field F alone, multiplying the boundary by d gives zero; the unmultiplied integral boundary is not thereby proved zero.

**Hypotheses and conventions.** M is symmetric. The roots satisfy the unraised coherent equations, not merely their dth powers. Units t_i encode x_i≠1; positivity is unnecessary once coherent roots exist.

**Proof route.**

1. Bilinearity gives ∑(y_i^d)∧t_i=d∑_{i,j}M_ij y_i∧y_j.
2. Pair off-diagonal terms using symmetry and antisymmetry; alternatingness kills every diagonal term.
3. Use K3BlochGroups:V.3/cgz-bloch-group to pass from this zero boundary to its corrected integral class. Use the existing parent bloch-class-of-a-solution for the rationalized coordinate-field class.
4. Keep the exact Suslin antisymmetric-square convention separate: its diagonal squares need not vanish, as the parent suslin-obstruction node records.

**Direct inputs.** [HabiroNahmSeries:HB.3/positive-coherent-root-lift](#habironahmseries-hb-3-positive-coherent-root-lift), `mathlib:exteriorPower.ιMulti`, [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/suslin-obstruction-of-the-nahm-element](#habironahmseries-hb-3-suslin-obstruction-of-the-nahm-element), `K3BlochGroups:V.3/cgz-bloch-group`, `K3BlochGroups:V.3/antisym-exterior-comparison`.

**Acceptance.**

- For d=2,M=(1), the rank-one root-field boundary is y²∧y=0.
- For unsigned integral A=(1), x=1/2 has exterior boundary zero but may have the parent’s nonzero diagonal 2-torsion in the antisymmetric square.
- A root with the wrong phase can satisfy a raised equation while failing the unraised coherent equation; this theorem does not apply to it.

**Sources.** [zagier-2007](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf): II.3A, p. 43, boundary calculation after (3.3). The symmetric boundary cancellation is valid integrally in the coherent root field; the display here uses integral M before any rationalization. [cgz-v3](https://arxiv.org/pdf/1712.04887v3): §7.1, observation (i), p. 35. The coordinate-field assertion is rationalized; no division in the integral exterior square is made.


<a id="habironahmseries-hb-3-signed-exterior-boundary-obstruction"></a>

### The boundary left by the formal diagonal signs

**Theorem** · `HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction` · [packet](../packets/HabiroNahmSeries--HB.3.json)

Let K be a field, M symmetric integral, and z_i,t_i∈Kˣ satisfy t_i=1−z_i and t_i=(−1)^{M_ii}∏_j z_j^{M_ij}. In the true exterior square, ∑z_i∧t_i=∑M_ii z_i∧(−1), and twice this boundary is zero. Thus 2∑[z_i] is an integral exterior-kernel class, and ∑[z_i] defines a rationalized CGZ class. This calculation alone does not give the unmultiplied integral CGZ class or the integral K3 element used by GSWZ; their exact convention requires the V.3 supplier interface.

**Hypotheses and conventions.** Each z_i and 1−z_i is a unit. No positive definiteness is imposed on the formal integral datum. The sign is (−1)^{M_ii}, exactly GSWZ (41).

**Proof route.**

1. Expand the signed product in the second wedge coordinate.
2. The unsigned symmetric double sum cancels exactly as in coherentRootBoundary with d=1. The diagonal signs remain ∑M_ii z_i∧(−1).
3. The unit −1 has order dividing 2, so twice every remaining wedge vanishes.
4. Apply the corrected CGZ exterior-kernel definition only to the doubled symbol. The parent general-nondegenerate-class cannot be used for an unmultiplied integral class until the convention request is supplied.

**Direct inputs.** [HabiroNahmSeries:HB.3/coherent-root-exterior-boundary](#habironahmseries-hb-3-coherent-root-exterior-boundary), `mathlib:exteriorPower.ιMulti`, [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), `K3BlochGroups:V.3/cgz-bloch-group`.

**Acceptance.**

- If every diagonal entry is even, the sign contribution is zero, recovering the unsigned result.
- In characteristic 2, −1=1 and the obstruction is zero.
- For odd diagonal entries, symmetry alone cancels the double sum but supplies no reason for the remaining wedge to be zero.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §1.7, (41) and the following class assertion, p. 14. The source’s signed equation is retained exactly. The obstruction is a derived boundary calculation, and its integral interpretation is requested rather than silently identified with CGZ. The excerpt retains the printed z_j inside the product; the node uses the corrected z_i as in the already confirmed HabiroNahmSeries/E36, carried below.


<a id="habironahmseries-hb-3-regulator-field-and-normalization-comparison"></a>

### Field change and the regulator conventions

**Comparison** · `HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison` · [packet](../packets/HabiroNahmSeries--HB.3.json)

For symmetric rational A=M/d, the distinguished x, F=Q(x) and E=Q(positiveRootLift(d,x)), let c_d∈B_CGZ(F) be represented by d∑[x_i], and β∈B_CGZ(E) by ∑[x_i]. The field map sends c_d to dβ; hence ξ_F=c_d/d∈B_CGZ(F)⊗Q maps to β⊗1. The definition of ξ_F is independent of the clearing denominator. For every embedding τ:E→C, its Bloch–Wigner evaluation is ∑D(τx_i), equal to the evaluation of ξ_F at τ restricted to F; every embedding of F extends to E. With the requested Borel injectivity and unique divisibility, ξ_F=0 iff β is torsion iff β maps to zero over Qbar. At the preferred real embedding, put S=∑L_CGZ(x_i), with L_CGZ=π²/6−L_std and period π²/2. The Rogers map is applied to integral c_d or β: L(c_d)=dS modulo π²/2. Torsion of c_d implies S∈Qπ². A circle-valued Rogers map is never assigned a Q-linear extension or a unique division by d.

**Hypotheses and conventions.** Use the corrected CGZ convention imported from K3BlochGroups V.3; regulator comparison with the exact Suslin convention is only rational. Rogers values are asserted at a specified real embedding and for an integral class; arbitrary conjugates need not lie in the positive cube. The signed formal class has a separate integral convention request and only the doubled/rationalized class is certified locally.

**Proof route.**

1. Use coherentRootBoundary in E and the accepted denominator-clearing construction in F. Functoriality of symbols gives c_d↦dβ. Rationalization embeds the relevant kernel into the rational pre-Bloch group, so changing d gives the same rational class.
2. Extend embeddings of F into C across the algebraic extension E/F using IsAlgClosed.surjective_domRestrict_of_isAlgebraic. Finite sums and the imported Bloch–Wigner descent give the same evaluations after restriction.
3. Import the parent torsion-criterion-by-regulators, with the nonzero rational scalar comparison from Polylogarithms P.2; exact scalar or sign is unnecessary for zero detection. The Borel injectivity request is still open.
4. Import the parent torsion-in-the-algebraic-closure subject to its precise unique-divisibility request. Torsion maps to zero over Qbar. Conversely fix an inclusion E→Qbar; for each τ:E→C, extend τ across the algebraic extension Qbar/E by IsAlgClosed.surjective_domRestrict_of_isAlgebraic. If β has zero image in B(Qbar), functoriality through each extended embedding gives all Bloch–Wigner values zero; the number-field Borel criterion then makes β torsion. No unsupported integral injection is used.
5. Use CGZ (42) and Zagier II.1A to pin the real convention. If m c_d=0, then m d S∈(π²/2)Z, so S∈Qπ². This is integer arithmetic and requires no division homomorphism on the circle.

**Direct inputs.** [HabiroNahmSeries:HB.3/positive-coherent-root-lift](#habironahmseries-hb-3-positive-coherent-root-lift), [HabiroNahmSeries:HB.3/coherent-root-exterior-boundary](#habironahmseries-hb-3-coherent-root-exterior-boundary), [HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction](#habironahmseries-hb-3-signed-exterior-boundary-obstruction), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](#habironahmseries-hb-3-torsion-criterion-by-regulators), [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure), `K3BlochGroups:V.3/cgz-convention-comparison`, `Polylogarithms:P.2/borel-comparison`, `Polylogarithms:P.1`, `BorelRegulators:R.4`, `K3BlochGroups:V.4`, `K3BlochGroups:V.3`, `mathlib:IsAlgClosed.surjective_domRestrict_of_isAlgebraic`.

**Acceptance.**

- At 0,1,∞ the CGZ circle values are respectively π²/6,0,−π²/6; the period is π²/2, not π²/6.
- For A=(1/2),(1),(2), the preferred S values are π²/10,π²/12,π²/15 respectively; the source’s reversed rank-one coordinates are corrected in E-HB3-rank-one.
- Vanishing at the preferred real place alone proves nothing about torsion: Bloch–Wigner vanishes at every real argument, and every complex embedding must be checked.
- Choosing an arbitrary dth preimage of a circle value is noncanonical and is not the asserted Rogers evaluation of ξ_F.

**Sources.** [cgz-v3](https://arxiv.org/pdf/1712.04887v3): §7.1, (42), p. 36. Pins the normalization on the positive interval and the immediately following projective extension and period. [zagier-2007](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf): II.1A, pp. 23–24. The standard normalization; its difference from CGZ is reflected in the corrected rank-one examples. [cgz-v3](https://arxiv.org/pdf/1712.04887v3): §1.3, p. 6; §7.1(i), p. 35. The algebraic-closure criterion is imported with an exact supplier request, not assumed built.


## HB.4 — Radial asymptotics and coefficient fields

The analytic proof first controls the logarithmic product, then the global summands, and only then sums a local expansion. Use the window |x_i|≤ε⁻¹/¹², a Gaussian majorant and exponentially small tails. Polynomial Gaussian integration and shifted Poisson summation give density m⁻ᴺε⁻ᴺ/². Combined with the Euler prefactor and the Gaussian integral, this leaves m⁻ᴺ/²(det H)⁻¹/². The finite congruence comparison is an absolute flat difference; it never divides by a Gauss sum, which can be zero.

For ζ=e(a/m), the phase is exp(πi s(a,m)). The printed elementary phase for a=1 does not extend to all primitive numerators. The Gaussian integrand retains exp(−B·x√ε/m−Nε/(24m)+∑ψ). The final analytic series is valid radially with odd m coprime to the specified denominator. Arbitrary-root bounds used by HB.5 are a weaker separate result, not a full extension of this asymptotic theorem.

Arithmetic descent is separate. Coherent radicals determine the actual automorphism group; an arbitrary vector of root multipliers need not extend to an automorphism. The missing coefficientwise identity must transform the complete Gaussian integrand and the finite sum. Rational Gauss phases also require their ζ_D field. The nonzero constant Kummer class, its χ⁻¹ eigenspace and the actual Dedekind/GZ normalization are required before the HB.5 arithmetic application.


<a id="habironahmseries-hb-4-q-pochhammer-symbols"></a>

### Analytic evaluation of the q-Pochhammer symbols and their logarithmic expansions

**Comparison** · `HabiroNahmSeries:HB.4/q-pochhammer-symbols` · [packet](../packets/HabiroNahmSeries.json)

The finite and infinite q-Pochhammer symbols and the q-factorials are owned by QSeriesPartitionsAndMockModularForms QM.0 (QM.0/q-pochhammer, QM.0/q-factorial) and are imported. This node records the analytic facts HB.4 uses: for complex q with |q| < 1 and complex x, the product (x;q)_infinity = prod_{n>=0}(1 - q^n x) is multipliable, holomorphic in (x,q), equals the evaluation of the formal symbol (QM.0 hasSum_eval_qPochhammerInf), satisfies (x;q)_infinity = (1 - x)(qx;q)_infinity and 1/(q;q)_n = (q^{n+1};q)_infinity/(q;q)_infinity, and (q;q)_infinity is Mathlib's eulerFunction(q) (eulerFunction_eq_tprod); and for |x| < 1, log (x;q)_infinity = -sum_{l>=1} x^l/(l(1 - q^l)) with the principal branch (GSWZ (46)). The Bernoulli form (47) and the root-of-unity form (59) are formal identities in Q[[t]]((x)) used by HB.8 and are not needed by HB.4.

**Hypotheses and conventions.** |q| < 1 for every analytic statement; |x| < 1 for the logarithmic expansion. The inversion (x;q^{-1})_infinity = 1/(qx;q)_infinity is an identity of formal power series in x with coefficients in Q(q), not of analytic functions for |q| < 1 (the left side diverges); it belongs to HB.8 and is not an API item of the analytic symbol.

**Proof route.**

1. Import the formal symbols from QM.0 and their evaluation for |q| < 1 (QM.0 hasSum_eval_qPochhammerInf); multipliability from summability of |q|^n.
2. Prove the shift identity and the expression of 1/(q;q)_n as a ratio of infinite products by splitting off finitely many factors (QM.0 qPochhammerInf_eq_mul, evaluated).
3. Identify (q;q)_infinity with eulerFunction(q) by mathlib:eulerFunction_eq_tprod.
4. Prove the logarithmic expansion by expanding each log(1 - q^n x) and summing the geometric series in n (absolute convergence for |x|, |q| < 1).

**Direct inputs.** `QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`, `QSeriesPartitionsAndMockModularForms:QM.0/q-factorial`, `mathlib:Multipliable`, `mathlib:tprod`, `mathlib:eulerFunction`, `mathlib:eulerFunction_eq_tprod`.

**Acceptance.**

- (x;q)_1 = 1 - x and (q;q)_1 = 1 - q.
- (q;q)_infinity = eulerFunction(q) for |q| < 1.
- At a root of unity q = zeta of order m the finite symbol (q;q)_n vanishes for n >= m, so statements at roots of unity in HB.4 are radial asymptotics, never evaluations.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, after equation (defgamma). The two definitions and Euler identity, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.1, equations (logpoc) and (logpoc2). The two complementary expansions of the logarithm, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, the two elementary identities. The shift and inversion identities, verbatim.


<a id="habironahmseries-hb-4-analytic-nahm-sum"></a>

### The analytic Nahm sum and its normalisation

**Definition** · `HabiroNahmSeries:HB.4/analytic-nahm-sum` · [packet](../packets/HabiroNahmSeries.json)

For an analytic Nahm datum (A,B,C) put f_{A,B,C}(q) = q^C sum over n in the non-negative integer vectors of q^{(1/2) n^t A n + B n} divided by (q)_{n_1} ... (q)_{n_N}. This is a formal Puiseux series with integer coefficients in q^{1/d} for any denominator d of the datum, and it converges in the punctured unit disc, defining a holomorphic function of tau in the upper half-plane through f(tau) = f_{A,B,C}(e^{2 pi i tau}) with the convention (e^{2 pi i tau})^lambda = e^{2 pi i tau lambda}. The factor q^C is part of the data and is never absorbed silently: it shifts the leading exponent of every expansion and, in the modular cases, it is exactly what makes the function modular.

**Hypotheses and conventions.** (A,B,C) is an analytic Nahm datum; d is a denominator and the Puiseux variable is q^{1/d}. Convergence is for 0 < |q| < 1 and follows from the positive definiteness of A, which makes the exponent grow quadratically while the denominators grow at a controlled rate. The value at a root of unity is not defined: the denominators vanish. Every statement at a root of unity in this layer is an asymptotic statement along the radial approach q = zeta e^{-h/n} with h decreasing to 0.

**Proof route.**

1. Define the summand as a function of a non-negative integer vector with values in the Puiseux series ring.
2. Prove that the family is summable coefficientwise, because for each power of q only finitely many n contribute, which uses the positive definiteness of A.
3. Prove absolute convergence for 0 < |q| < 1 and holomorphy in the disc.
4. Define the upper half-plane form and fix the branch convention for the fractional powers.
5. Record the special case C = 0 and the identity f_{A,B,C}(tau) = e(C tau) f_{A,B,0}(tau), which is why the asymptotic theorems may assume C = 0.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), [HabiroNahmSeries:HB.4/q-pochhammer-symbols](#habironahmseries-hb-4-q-pochhammer-symbols), `mathlib:PowerSeries`, `mathlib:UpperHalfPlane`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `nahmSum` | data | The Puiseux series f_{A,B,C}(q). |
| `nahmSum_coeff` | projection | The coefficient of a given rational power of q, a finite sum over the lattice points on a quadric. |
| `nahmSum_summable` | characterisation | Coefficientwise summability, from the positive definiteness of A. |
| `nahmSum_analytic` | characterisation | Absolute convergence and holomorphy on the punctured unit disc. |
| `nahmSum_shift_C` | simp | f_{A,B,C} = e(C tau) f_{A,B,0} in the upper half-plane form. |
| `nahmSum_upperHalfPlane` | coercion | The holomorphic function on the upper half-plane attached to the series. |
| `nahmSum_congr` | compatibility | The series depends only on the datum. |

**Discriminating tests.**

- **`rogers_ramanujan_series`** (computation): For A = (2), B = 0, C = 0 the coefficients of q^0, ..., q^6 are 1, 1, 1, 1, 2, 2, 3, agreeing with prod_{n = +-1 mod 5} 1/(1 - q^n) (checked to q^60).
- **`leading_term`** (computation): If B has non-negative entries, the coefficient of q^C is 1 (only n = 0 contributes).
- **`negative_B`** (non-example): For A = (2), B = -1, C = 0, both n = 0 and n = 1 contribute to q^0, so the coefficient of q^C is 2: the 'leading coefficient 1' test needs B >= 0.
- **`C_shift`** (characterisation): f_{A,B,C}(tau) = e(C tau) f_{A,B,0}(tau) on the upper half-plane.
- **`product_of_blocks`** (compatibility): For block-diagonal A = diag(A_1, A_2) and B = (B_1, B_2), f_{A,B,0} = f_{A_1,B_1,0} f_{A_2,B_2,0}; e.g. f_{diag(2,2),0,0} = G(q)^2.

**Acceptance.**

- For A = (2), B = 0, C = -1/60 the function is q^{-1/60} G(q) with G the first Rogers-Ramanujan series, modular (CGZ Section 7.1; QM.0/rogers-ramanujan-first).
- Only seven rank one triples are modular: (2,0,-1/60), (2,1,11/60), (1,0,-1/48), (1,+-1/2,1/24), (1/2,0,-1/40) and (1/2,1/2,1/40) (CGZ Section 7.1, citing Terhoeven and Zagier).
- Positive definiteness is what the construction uses: A = 0 is not an analytic datum; for A = 0 and B = 0 the constant term would receive 1 from every n and the coefficientwise sum diverges, while for A = 0, B = 1 the sum converges (to 1/(q;q)_infinity by Euler), so the exclusion is by definition and not because every such sum diverges.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, equation (eq.FABC), printed p. 35. The definition, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 1, equation (eq.FABC). The Puiseux series statement with the denominator, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, the list of modular cases, printed p. 35. The complete rank one list, verbatim.


<a id="habironahmseries-hb-4-cyclic-dilogarithm-interface"></a>

### The cyclic quantum dilogarithm, imported, and the identities this layer uses

**Comparison** · `HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface` · [packet](../packets/HabiroNahmSeries.json)

The cyclic quantum dilogarithm D_zeta(x) = prod_{t=1}^{m-1}(1 - zeta^t x)^t (CGZ (8), GZ (2)) and its principal m-th root D_zeta(x)^{1/m} = exp((1/m) sum_t t Log(1 - zeta^t x)) for |x| < 1 (GZ; GSWZ's D^{GSWZ}) are owned by HabiroNumberFields HB.2 (node HB.2/the-cyclic-quantum-dilogarithm) and imported. HB.4 uses: (i) the root-change identity D_zeta(zeta x)/D_zeta(x) = (1 - x)^m/(1 - x^m), iterated to D_zeta(zeta^k theta) = (theta;zeta)_k^m D_zeta(theta)/(1 - theta^m)^k, a polynomial identity that does not use Nahm's equation; (ii) its m-th-root form D_zeta(zeta^k theta)^{1/m} = (theta;zeta)_k D_zeta(theta)^{1/m}/(1 - theta^m)^{k/m} for 0 < theta < 1, exact with principal branches because every factor 1 - zeta^t theta has positive real part; (iii) the value D_zeta(1)^{24} = m^{12m} (not D_zeta(1)^{24m} = m^{12m}, which is false for m >= 2); and (iv) D_zeta(1)^{1/m} = sqrt(m) e(s(a,m)/2) for zeta = e(a/m), with principal branches, where s is the Dedekind sum (QM.1/dedekind-sum). Nahm's equation enters only when (1 - z_i)^{k_i/m} is rewritten as prod_j theta_j^{a_ij k_i}.

**Hypotheses and conventions.** zeta = e(a/m) is a primitive m-th root of unity; 0 < theta < 1 for the branch statements (ii) and (iv). (iv) follows from Arg(1 - e(x)) = pi(x - 1/2) for 0 < x < 1 and |prod_t (1 - zeta^t)^{t/m}| = sqrt m (pair t with m - t); it is proved in HB.4/euler-function-at-a-root-of-unity.

**Proof route.**

1. Import D_zeta, the root-change identity and D_zeta(1)^{24} = m^{12m} from HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm (API cyclicQuantumDilog_eval_mul_zeta_pow, cyclicQuantumDilog_eval_one_pow_24, gswzDilog).
2. Iterate the root-change identity k times.
3. Prove the principal-branch form (ii) by adding principal logarithms of factors in the right half-plane.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-equations](#habironahmseries-hb-3-nahm-equations), `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-sum`.

**Acceptance.**

- For m = 1, D_zeta = 1 and all identities are trivial.
- For m = 2, zeta = -1: D(x) = 1 + x and (1 - x)/(1 + x) = (1 - x)^2/(1 - x^2).
- For m = 3, zeta = e(1/3): D_zeta(1) = 3^{3/2} e(1/12), so D_zeta(1)^{24} = 3^{36} = m^{12m} while D_zeta(1)^{72} = 3^{108} != 3^{36}.
- (ii) holds to 30 digits for m in {3,5,7}, every primitive zeta, theta in {0.3, 0.9} and 0 <= k < m (mpmath check).

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 2, equation (eq.Dmz). The definition and the branch convention, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.2, equation (eq.Dzz). The two identities and the explicit dependence on Nahm equation, verbatim.


<a id="habironahmseries-hb-4-euler-maclaurin-with-remainder"></a>

### Euler-Maclaurin summation with Bernoulli remainder, uniform in the shift

**Lemma** · `HabiroNahmSeries:HB.4/euler-maclaurin-with-remainder` · [packet](../packets/HabiroNahmSeries.json)

Let K >= 1, let phi : [0, infinity) -> C be of class C^K with phi^{(j)} integrable on [0, infinity) and tending to 0 at infinity for j <= K, let 0 <= beta < 1 and epsilon > 0. Then sum_{j >= 0} phi((j + beta) epsilon) = epsilon^{-1} integral_0^infinity phi(y) dy - sum_{r=1}^{K} (B_r(beta)/r!) epsilon^{r-1} phi^{(r-1)}(0) + R_K, with |R_K| <= (sup |B_K-tilde|/K!) epsilon^{K-1} integral_0^infinity |phi^{(K)}(y)| dy, where B_K-tilde(y) = B_K(fract(y)) is the periodic Bernoulli function (Mathlib bernoulliFun composed with Int.fract).

**Hypotheses and conventions.** phi is C^K with integrable derivatives up to order K vanishing at infinity; beta in [0,1); the constant in the bound is independent of beta and epsilon. Shifts beta outside [0,1) are reduced to [0,1) by moving finitely many terms, which the application (beta = (t + nu)/m with |nu| epsilon <= 1) tracks explicitly.

**Proof route.**

1. Integrate by parts K times on each interval [(j + beta) epsilon, (j + 1 + beta) epsilon] against the periodic Bernoulli functions, using d/dy B_r(y) = r B_{r-1}(y) (mathlib:bernoulliFun and its derivative and antiderivative lemmas).
2. Sum over j and bound the remainder by the supremum of the periodic Bernoulli function times the L^1 norm of phi^{(K)}.
3. Check the formula on phi(y) = e^{-y}, where both sides are explicit: sum_j e^{-(j + beta) epsilon} = e^{-beta epsilon}/(1 - e^{-epsilon}) = epsilon^{-1} sum_r B_r(beta)(-epsilon)^r/r!.

**Direct inputs.** `mathlib:bernoulliFun`, `mathlib:Polynomial.bernoulli`, `mathlib:trapezoidal_error`, `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- phi(y) = e^{-y}: the expansion reproduces the Bernoulli generating function t e^{beta t}/(e^t - 1) at t = -epsilon.
- K = 1 is the trapezoid-type estimate; the pinned mathlib:trapezoidal_error is a finite-interval special case and does not suffice.
- Applied to phi_t(y) = -log(1 - zeta^t w e^{-y}) it gives GZ Lemma 2.1 with an explicit remainder (HB.4/pochhammer-radial-asymptotics).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, paragraph before Theorem 7.1, p. 36 (arXiv v3). The stage text's 'Euler-Maclaurin estimates'; GZ's proof of Lemma 2.1 exchanges divergent sums formally, and this lemma supplies the remainder. [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.1, proof of Lemma 2.1, p. 6-7 (arXiv v1). The formal chain this lemma makes rigorous.


<a id="habironahmseries-hb-4-pochhammer-radial-asymptotics"></a>

### Radial asymptotics of the infinite Pochhammer symbol at a root of unity

**Theorem** · `HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics` · [packet](../packets/HabiroNahmSeries.json)

Let w be complex with |w| <= w_0 < 1, zeta a primitive m-th root of unity (any numerator), q = zeta e^{-epsilon/m} with epsilon > 0, and nu real with |nu| epsilon <= 1. Then log(q w e^{-nu epsilon/m}; q)_infinity = -Li_2(z)/(m epsilon) - (nu/m - 1/2) log(1 - z) - (epsilon nu^2/(2m)) z/(1 - z) - (1/m) log D_zeta(w) - log(1 - w) + psi_{w,zeta}(nu, epsilon), with z = w^m and principal logarithms (GZ Lemma 2.1, (4)), and for every K >= 2 there is C_K, depending only on K, m and w_0, with |psi_{w,zeta}(nu, epsilon) - sum_{r=2}^{K} c_r(nu) epsilon^{r-1}| <= C_K epsilon^{-1} (epsilon (1 + |nu|))^{K+1}, where c_r(nu) = -sum_{t=1}^{m} (B_r(1 - (t + nu)/m) - delta_{r,2} nu^2/m^2) Li_{2-r}(zeta^t w)/r! (GZ (5)). In particular the coefficient of nu^n in the expansion is O(epsilon^{2n/3}) (indeed O(epsilon^{max(1, n-1)})).

**Hypotheses and conventions.** |w| <= w_0 < 1 fixed; zeta = e(a/m) primitive, any a; epsilon > 0; nu real (in the application nu = x epsilon^{-1/2} with x real). The remainder bound is uniform in nu in the stated range; this uniformity is what HB.4/summand-asymptotics and the Poisson step need, and GZ's proof (a formal interchange of sums) does not supply it: it is supplied by HB.4/euler-maclaurin-with-remainder.

**Proof route.**

1. Write -log(q w e^{-nu epsilon/m};q)_infinity = sum_{n>=1} -log(1 - zeta^n w e^{-(n + nu) epsilon/m}) and split n by its residue t modulo m, giving m sums of the form sum_{j>=0} phi_t(((j + (t + nu)/m) epsilon)) with phi_t(y) = -log(1 - zeta^t w e^{-y}).
2. Apply HB.4/euler-maclaurin-with-remainder to each phi_t with shift beta = (t + nu)/m, which produces the Bernoulli-polynomial terms B_r(beta) and a remainder bounded by epsilon^K times an integral of |phi_t^{(K)}| (uniform in beta in the stated range).
3. Identify the Taylor coefficients: phi_t^{(r-1)}(0) = (-1)^{r} Li_{2-r}(zeta^t w) up to sign conventions, and the integral term (1/epsilon) integral_0^infinity phi_t = Li_2(zeta^t w)/epsilon.
4. Sum over t using the distribution relation sum_t Li_s(zeta^t w) = m^{1-s} Li_s(w^m) (Polylogarithms:P.1/classical-distribution, including s <= 1), which gives the r = 0, 1, 2 terms displayed; note the r = 1 term contains (1/m) log D_zeta(w) (GZ's proof prints (1/m) D_zeta(w)).

**Direct inputs.** [HabiroNahmSeries:HB.4/q-pochhammer-symbols](#habironahmseries-hb-4-q-pochhammer-symbols), [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), [HabiroNahmSeries:HB.4/euler-maclaurin-with-remainder](#habironahmseries-hb-4-euler-maclaurin-with-remainder), `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/classical-distribution`, `mathlib:Polynomial.bernoulli`, `mathlib:bernoulli`.

**Acceptance.**

- For m = 1 and nu = 0: log(qw;q)_infinity = -Li_2(w)/epsilon - (1/2) log(1 - w) + O(epsilon).
- Numerically (mpmath) for (m, a, w, nu) = (3, 1, 0.5 e(0.1), 2), (5, 2, 0.7 e(-0.2), -1.5), (1, 0, 0.6, 0.7) and epsilon = 0.02, 0.01, 0.005, psi is O(epsilon) and psi minus its r = 2 term is O(epsilon^2).
- The lemma does not apply at w = 1 or w = zeta^t (|w| = 1): the Euler function (q;q)_infinity at a root of unity is HB.4/euler-function-at-a-root-of-unity, with a different constant.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Lemma 2.1 and equations (eq.l1), (eq.psi). The statement, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Proof of Lemma 2.1, Section 4.1. The four steps of the proof, verbatim from the displayed derivation. [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.2, equation (eq.etae). The Euler-function case, used as the denominator of the summand.


<a id="habironahmseries-hb-4-euler-function-at-a-root-of-unity"></a>

### The Euler function near a root of unity

**Theorem** · `HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity` · [packet](../packets/HabiroNahmSeries.json)

Let m >= 1, gcd(a, m) = 1, zeta = e(a/m) and q = zeta e^{-epsilon/m} with epsilon > 0. Then 1/(q;q)_infinity = e(s(a,m)/2) (epsilon/(2 pi))^{1/2} e^{pi^2/(6 m epsilon)} e^{-epsilon/(24 m)} (1 + O(e^{-4 pi^2/(m epsilon)})), where s(a,m) is the Dedekind sum (QM.1/dedekind-sum). Moreover e(s(a,m)/2) = m^{-1/2} D_zeta(1)^{1/m} with D_zeta(1)^{1/m} = prod_{t=1}^{m-1} (1 - zeta^t)^{t/m} (principal branches), and for a = 1 this equals e(binom(m-1,2)/(12m)), GZ's chi.

**Hypotheses and conventions.** gcd(a, m) = 1; epsilon > 0; the principal branch of (epsilon/2 pi)^{1/2} > 0. For a != 1 mod m, e(s(a,m)/2) differs from GZ's e(binom(m-1,2) a/(12 m)) (e.g. m = 3, a = 2: e(-1/36) against e(1/18)).

**Proof route.**

1. Write (q;q)_infinity = e(-tau/24) eta(tau) with tau = a/m + i epsilon/(2 pi m) (mathlib:eulerFunction_eq_tprod for the product).
2. Choose gamma = (x y; m -a) in SL(2,Z) with gamma(a/m) = infinity; then m tau - a = i epsilon/(2 pi) and Im(gamma tau) = 2 pi/(m epsilon).
3. Apply the eta transformation law with Rademacher's multiplier (QM.1/eta-transformation-law, QM.1/dedekind-eta-multiplier) and eta(gamma tau) = e(gamma tau/24)(1 + O(e^{-4 pi^2/(m epsilon)})).
4. Collect the phases into e(s(a,m)/2) using s(-d, c) and the reciprocity of Dedekind sums (QM.1/dedekind-reciprocity) as needed.
5. For the second formula: Arg(1 - e(x)) = pi(x - 1/2) for 0 < x < 1 gives arg D_zeta(1)^{1/m} = (pi/m) sum_t t({a t/m} - 1/2) = pi s(a,m), and pairing t with m - t gives |D_zeta(1)^{1/m}| = sqrt m.

**Direct inputs.** `QSeriesPartitionsAndMockModularForms:QM.1/eta-transformation-law`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-sum`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-reciprocity`, [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), `mathlib:eulerFunction_eq_tprod`.

**Acceptance.**

- m = 1: log(1/(q;q)_infinity) = pi^2/(6 epsilon) - (1/2) log(2 pi/epsilon) - epsilon/24 + O(e^{-4 pi^2/epsilon}) (GZ (23)).
- For m in {2,...,9}, every a and epsilon = 0.02, the ratio of 1/(q;q)_infinity to e(s(a,m)/2)(epsilon/2 pi)^{1/2} e^{pi^2/(6 m epsilon)} equals e^{-epsilon/(24 m)} (e.g. 0.9997223 for m = 3), mpmath.
- D_zeta(1)^{1/m} = sqrt(m) e(s(a,m)/2) holds to 30 digits for all a < m, m in {3,5,7,9,11}.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.2, equation (23), p. 7 (arXiv v1). The case m = 1; GZ use it for the denominator at q = zeta e^{-epsilon/m}, which needs this node (source issue). [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.2, equations (48)-(49), p. 38 (arXiv v3). The same modular mechanism, used by CGZ for the Andrews-Gordon sums.


<a id="habironahmseries-hb-4-summand-asymptotics"></a>

### The summand of a Nahm sum near its peak

**Theorem** · `HabiroNahmSeries:HB.4/summand-asymptotics` · [packet](../packets/HabiroNahmSeries.json)

Let (A,B,C) be an analytic Nahm datum with distinguished solution z, theta_i = z_i^{1/m} in (0,1), zeta = e(a/m) primitive, q = zeta e^{-epsilon/m}, k in (Z/mZ)^N, and for n in Z_{>=0}^N with n = k mod m write n_i = epsilon^{-1} log(1/z_i) + epsilon^{-1/2} x_i. Then e^{-epsilon Q(n)/m}/prod_i (q)_{n_i} = chi_a^N (epsilon/(2 pi))^{N/2} e^{Lambda/(m epsilon)} prod_i theta_i^{B_i} (1 - z_i)^{1/2 - 1/m} prod_i D_zeta(zeta theta_i)^{-1/m} prod_i theta_i^{(Ak)_i}/(zeta theta_i; zeta)_{k_i} . e^{-x^t A-tilde x/(2m)} . e^{-(1/m) B^t x epsilon^{1/2} - (C + N/24) epsilon/m} . exp(sum_i psi_{zeta^{k_i} theta_i, zeta}(x_i epsilon^{-1/2}, epsilon)) . (1 + O(e^{-c/epsilon})), where chi_a = e(s(a,m)/2) = m^{-1/2} D_zeta(1)^{1/m} (principal branch), Lambda = -sum_j L_GZ(z_j) = L(xi_A) and A-tilde = A + diag(z/(1 - z)). If |x_i| <= epsilon^{lambda - 1/6} with lambda > 0, the exponential of the psi-terms equals 1 + sum_{p=1}^{K} C_p(x) epsilon^{p/2} + O(epsilon^{(K+1) lambda'}) with polynomials C_p of degree at most 3p (not: coefficient of x^n of order epsilon^n).

**Hypotheses and conventions.** (A,B,C) analytic Nahm datum; z its distinguished solution; zeta = e(a/m) primitive, any a; the summand is taken without its phase e(alpha Q(n)), which the Gauss-sum node handles. Rogers normalisations: GZ's L_GZ(z) = Li_2(z) + (1/2) log z log(1 - z) - pi^2/6 is MINUS CGZ's L of HB.3 on (0,1) (not a translate), so Lambda = -sum L_GZ(z_j) = sum L(z_j) = L(xi_A). This corrects GZ Proposition 2.2 as printed in four places (source issues): D_zeta(theta_i), (theta_i;zeta)_{k_i} -> D_zeta(zeta theta_i), (zeta theta_i;zeta)_{k_i}; e^{-x^t A-tilde x/m} -> e^{-x^t A-tilde x/(2m)}; the root of unity chi_a^N and the factor e^{-N epsilon/(24m)} of the Euler denominators are added; e^{+(1/m)B^t x epsilon^{1/2}} -> e^{-(1/m)B^t x epsilon^{1/2}}; and the psi-factors are exponentiated.

**Proof route.**

1. Write 1/(q)_{n_i} = (q w_i e^{-nu_i epsilon/m}; q)_infinity/(q;q)_infinity with w_i = zeta^{k_i} theta_i, nu_i = x_i epsilon^{-1/2} (GZ (22)).
2. Expand the numerators by HB.4/pochhammer-radial-asymptotics and the denominators by HB.4/euler-function-at-a-root-of-unity (which supplies chi_a, (epsilon/2 pi)^{1/2}, e^{pi^2/(6 m epsilon)} and e^{-epsilon/(24 m)}).
3. Expand -(epsilon/m) Q(n) = -(1/(2 m epsilon)) log z . log(1 - z) + (1/m) B^t log z - (1/(2m)) x^t A x + (1/(m sqrt epsilon)) x^t log(1 - z) - (1/m) sqrt(epsilon) B^t x - (epsilon/m) C, using A log z = log(1 - z) (Nahm's equation).
4. The epsilon^{-1/2} terms cancel against the nu-linear term of the numerators (this is where Nahm's equation makes z the peak); the epsilon^{-1} terms combine to Lambda/(m epsilon) via the definition of L_GZ; the quadratic terms combine to -x^t A-tilde x/(2m).
5. Rewrite D_zeta(zeta^{k_i} theta_i)^{-1/m}/(1 - zeta^{k_i} theta_i) with HB.4/cyclic-dilogarithm-interface (ii): it equals D_zeta(zeta theta_i)^{-1/m} (1 - z_i)^{k_i/m - 1/m}/(zeta theta_i; zeta)_{k_i}, and (1 - z_i)^{k_i/m} = prod_j theta_j^{a_ij k_i} by Nahm's equation.
6. Collect the (1 - z_i)^{1/2} from the log(1 - z) term and the constant factors.

**Direct inputs.** [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics](#habironahmseries-hb-4-pochhammer-radial-asymptotics), [HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity](#habironahmseries-hb-4-euler-function-at-a-root-of-unity), [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), `mathlib:Matrix.PosDef.det_pos`, [HabiroNahmSeries:HB.3/positive-coherent-root-lift](#habironahmseries-hb-3-positive-coherent-root-lift).

**Acceptance.**

- For N = 1, m = 3, a = 1, A = (2), B = 0, epsilon = 0.0005 and n = 962, 963, 964 (k = 2, 0, 1) the ratio of the left side to the corrected right side (without the psi-factor) is 0.99999..., 0.9995..., 0.99987... (mpmath), whereas the printed Proposition 2.2 gives ratios 0.431 - 0.135i, 4.82 + 0.85i, 0.359 + 0.274i.
- A-tilde is positive definite, so det(A-tilde)^{1/2} > 0 and no branch is chosen.
- Without Nahm's equation the epsilon^{-3/2} term does not cancel and the point is not a peak.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Proposition 2.2, equation (eq.p1). The statement, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.2, the expansion of the quadratic form. The cancellation that makes the distinguished solution the peak, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 2, equations (alph) and (eq.rogers). The Garoufalidis-Zagier normalisation of the Rogers dilogarithm, which differs from the CGZ one of HB.3.


<a id="habironahmseries-hb-4-formal-gaussian-integration"></a>

### Formal Gaussian integration

**Construction** · `HabiroNahmSeries:HB.4/formal-gaussian-integration` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric invertible N x N matrix Lambda over a Q-algebra R, the formal Gaussian bracket <f>_Lambda of f(w,h) in R[[w, w^3 h^{-1}, h]] is exp((h/2) sum_{i,j} (Lambda^{-1})_{ij} d/dw_i d/dw_j) f evaluated at w = 0 (GSWZ (eq:bracket)). In one variable <sum_j c_j w^j>_Lambda = sum_l (2l - 1)!! c_{2l} (h/Lambda)^l. GZ's operator I_Lambda (GZ (13), (14)) is the same operator at h = 1 on functions whose x^n-coefficients have valuation tending to infinity: I_Lambda[sum_j c_j x^j] = sum_l (2l - 1)!! c_{2l} Lambda^{-l}. On polynomials both agree with the normalised Gaussian expectation (HB.4/gaussian-moments); the construction itself uses no measure theory.

**Hypotheses and conventions.** Lambda is symmetric and invertible over a Q-algebra; the rationals must be present because of the factorials. The argument f lies in the completed ring R[[w, w^3 h^{-1}, h]], the exact domain in which the odd-order terms are controlled; the cube in w^3 h^{-1} is what makes the expansion converge formally. This is the formal, all-orders object; no analytic Gaussian integral is claimed, and the comparison with the analytic integral is an asymptotic statement proved separately in the Poisson-summation node.

**Proof route.**

1. Define the Laplacian with respect to Lambda as the second-order differential operator with coefficients the entries of the inverse of Lambda.
2. Define the bracket as the exponential of (h/2) times that operator, applied termwise and evaluated at w = 0; check that the exponential is well defined on the stated domain because each coefficient receives only finitely many contributions.
3. Prove the one-variable closed formula with the double factorials, by computing the action on a monomial.
4. Prove linearity, the behaviour under a linear change of variables, and the translation rule used in the source's periodicity argument, namely that translating w by h changes the integrand in the way that the shift of the congruence class does.
5. Record the normalisation against the analytic integral, so that the prefactor (2 pi)^{-N/2} det^{-1/2} of the Gaussian density never appears twice.

**Direct inputs.** `mathlib:PowerSeries`, `mathlib:MvPowerSeries`, `mathlib:MvPolynomial`, `mathlib:Matrix.det`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `formalGaussian` | data | The bracket attached to a symmetric invertible Lambda. |
| `formalGaussian_const` | simp | The bracket of a constant is that constant. |
| `formalGaussian_odd` | simp | The bracket of an odd monomial vanishes. |
| `formalGaussian_sq` | characterisation | The bracket of a quadratic monomial is the corresponding entry of h times the inverse of Lambda. |
| `formalGaussian_linear` | functoriality | Linearity in the integrand. |
| `formalGaussian_changeOfVariables` | compatibility | Behaviour under an invertible linear change of the integration variable. |
| `formalGaussian_translate` | compatibility | The translation rule used for the periodicity of the congruence-class terms. |

**Discriminating tests.**

- **`second_moment`** (computation): With Lambda = 1 in one variable the bracket of w^2 is h.
- **`fourth_moment`** (computation): With Lambda = 1 the bracket of w^4 is 3h^2.
- **`odd_vanishes`** (degenerate): The bracket of w^3 is zero.
- **`diagonal_factorises`** (characterisation): For diagonal Lambda the bracket of f(w_1) g(w_2) is <f>_{Lambda_11} <g>_{Lambda_22}.
- **`gz_normalisation`** (compatibility): I_Lambda[f] equals <f>_Lambda at h = 1 for polynomial f, and equals the normalised Gaussian integral of f (HB.4/gaussian-moments).
- **`off_diagonal_second_moment`** (computation): For Lambda = (2 1; 1 2), <w_1 w_2>_Lambda = h (Lambda^{-1})_{12} = -h/3.

**Acceptance.**

- With Lambda = 1 in one variable, <w^2> = h and <w^4> = 3h^2 (GSWZ form); I_1[x^2] = 1 and I_1[x^4] = 3 (GZ form).
- The bracket of an odd monomial is zero.
- The bracket of a constant is that constant; for diagonal Lambda it is multiplicative on products of functions of separate variables.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.5, equation (eq:bracket). The definition, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 3, equations (eq.FGI) and (eq.FGI2). The same operator with the analytic motivation and the one-variable closed formula, verbatim.


<a id="habironahmseries-hb-4-gauss-sum-and-congruence-splitting"></a>

### Splitting by congruence classes, and the quadratic Gauss sum

**Construction** · `HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting` · [packet](../packets/HabiroNahmSeries.json)

Let d be a denominator of Q (analytic Nahm datum with C = 0) and let D be a strong denominator of Q that is a multiple of d (for instance D = 2d). For alpha = a/m with gcd(m, D) = 1 put alpha-bar = a m^{-1} mod D and G(Q, alpha) = D^{-N} sum_{k in (Z/DZ)^N} e(alpha-bar Q(k)) (GZ (16)); it is independent of such D and depends only on alpha-bar mod d. With zeta = e(alpha), Q-bar(k) := d Q(k) . d^{-1} mod m for k in (Z/mZ)^N, and f^{[k,k']} the sub-sums over n = k mod m, n = k' mod D, one has exactly f_Q(alpha + i epsilon/(2 pi m)) = sum_{k, k'} e(alpha-bar Q(k')) zeta^{Q-bar(k)} f_{Q,zeta}^{[k,k']}(epsilon) (GZ (25)-(27)), and, given HB.4/poisson-summation-and-remainders (f^{[k,k']} ~ D^{-N} f^{[k]}), f_Q(alpha + i epsilon/(2 pi m)) ~ G(Q, alpha) sum_{k in (Z/mZ)^N} zeta^{Q-bar(k)} f_{Q,zeta}^{[k]}(epsilon) (GZ (31)).

**Hypotheses and conventions.** C = 0; d a denominator; D a strong denominator divisible by d (without d | D the reduction 'alpha modulo D' does not determine e(alpha-bar Q(k)): for Q(n) = n^2/4, D = 2 is a strong denominator and e(Q(1) alpha-bar) depends on alpha-bar mod 4). gcd(m, D) = 1; zeta = e(alpha); the Chinese remainder theorem with u m + v d = 1 splits e(a Q(n)/m) = e(a u Q(n)) zeta^{v d Q(n)}.

**Proof route.**

1. Define G(Q, alpha) by the displayed average and prove independence of D among multiples of d by averaging over a refinement.
2. Split e(a Q(n)/m) with u m + v d = 1 into e(a u Q(n)), depending on n mod D, and zeta^{v d Q(n)}, depending on n mod m.
3. Record the exact splitting of the series into the (mD)^N congruence pieces and the resulting identity; the asymptotic form needs the Claim-1 equality of the D-class asymptotics from HB.4/poisson-summation-and-remainders.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `gaussSum` | data | G(Q, alpha) = D^{-N} sum_{k mod D} e(alpha-bar Q(k)) for D a strong denominator divisible by a denominator d and gcd(m, D) = 1. |
| `gaussSum_independent` | characterisation | gaussSum does not depend on the choice of such D. |
| `gaussSum_of_integral` | simp | If Q(Z^N) is contained in Z then gaussSum Q alpha = 1. |
| `gaussSum_periodic` | compatibility | gaussSum Q alpha depends only on alpha-bar modulo d; in particular it is unchanged by alpha -> alpha + d. |
| `nahmSum_split` | characterisation | The exact decomposition of f_Q(alpha + i epsilon/(2 pi m)) into congruence pieces with the phases e(alpha-bar Q(k')) zeta^{Q-bar(k)}. |
| `nahmSum_split_finite` | projection | The decomposition is a finite sum over (Z/mZ)^N x (Z/DZ)^N. |

**Discriminating tests.**

- **`integral_Q`** (computation): For A = (2), B = 0 and any alpha, gaussSum = 1.
- **`vanishing`** (computation): For A = (1), B = 0, alpha = 1/3, gaussSum = 0.
- **`rank_one_nonreal`** (computation): For A = (2/3), B = 1/3, alpha = 1/5, gaussSum = e(1/12)/sqrt 3.
- **`independence`** (characterisation): Computing gaussSum with D = 2d and with D = 4d gives the same value.
- **`not_modulo_small_D`** (non-example): For Q(n) = n^2/4 the average over k mod 2 of e(c Q(k)) takes different values for c = 1 and c = 3, which are congruent mod 2: D must be a multiple of d.
- **`splitting_recovers`** (compatibility): Summing the congruence pieces over all classes recovers the original series coefficientwise.

**Acceptance.**

- If Q is integer-valued (d = 1, e.g. A = (2), B = 0 or B = 1), G(Q, alpha) = 1 for every alpha.
- For Q(n) = n^2/2 (A = (1), B = 0) and alpha = 1/3: G = (1/2)(1 + e(1/2)) = 0, and the radial limit of f_Q at 1/3 vanishes (numerically e^{-Lambda/(3 epsilon)} f -> 0 exponentially): an instance of CGZ Remark 7.3.
- For A = (2/3), B = (1/3) and alpha = 1/5: G = (1/2) + i/(2 sqrt 3) = e(1/12)/sqrt 3.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 3, equation (eq.Gab). The definition and the independence, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.3, equations (eq.Fcong) and (eq.fQzcomb). The splitting and the resulting formula, verbatim.


<a id="habironahmseries-hb-4-gaussian-moments"></a>

### Gaussian moments equal the formal Gaussian bracket

**Lemma** · `HabiroNahmSeries:HB.4/gaussian-moments` · [packet](../packets/HabiroNahmSeries.json)

Let Lambda be a real symmetric positive definite N x N matrix and P a complex polynomial in x_1, ..., x_N. Then integral_{R^N} e^{-x^t Lambda x/2} dx = (2 pi)^{N/2} det(Lambda)^{-1/2} and integral P(x) e^{-x^t Lambda x/2} dx / integral e^{-x^t Lambda x/2} dx = sum_{n >= 0} (1/(2^n n!)) (Delta_{Lambda^{-1}}^n P)(0), a finite sum, with Delta_{Lambda^{-1}} = sum_{i,j} (Lambda^{-1})_{ij} d/dx_i d/dx_j; that is, it equals <P>_Lambda at h = 1 (HB.4/formal-gaussian-integration).

**Hypotheses and conventions.** Lambda real symmetric positive definite; P a polynomial (for power series integrands only the formal bracket is used).

**Proof route.**

1. Diagonalise Lambda by an orthogonal change of variables and reduce the normalisation to mathlib:integral_gaussian; alternatively use that TauCeti.multivariateGaussianPDFReal is a probability density (TauCeti.multivariateGaussian_eq_withDensity).
2. Prove the moment identity for P = e^{<y, x>} (exponential generating function): both sides equal e^{y^t Lambda^{-1} y/2}; compare Taylor coefficients in y.

**Direct inputs.** [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), `mathlib:integral_gaussian`, `tauceti:TauCeti.multivariateGaussianPDFReal`, `tauceti:TauCeti.multivariateGaussian_eq_withDensity`, `mathlib:Matrix.PosDef.det_pos`.

**Acceptance.**

- N = 1, Lambda = 1: the moments of x^2 and x^4 are 1 and 3.
- The moment of an odd monomial vanishes.
- Lambda = A-tilde/m: this is the normalisation behind the factor m^{-N/2} det(A-tilde)^{-1/2} of GZ Theorem 3.1.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 3, equation (13), p. 4 (arXiv v1). The identity for polynomials (the denominator's domain is printed R instead of R^N).


<a id="habironahmseries-hb-4-lattice-sums-by-poisson-summation"></a>

### Shifted lattice sums of a polynomial times a Gaussian

**Lemma** · `HabiroNahmSeries:HB.4/lattice-sums-by-poisson-summation` · [packet](../packets/HabiroNahmSeries.json)

Let Lambda be real symmetric positive definite, P a polynomial, x0 in R^N and s > 0. Then sum_{n in Z^N} P(s(n + x0)) e^{-s^2 (n + x0)^t Lambda (n + x0)/2} = s^{-N} integral_{R^N} P(x) e^{-x^t Lambda x/2} dx + O(e^{-c/s^2}) as s -> 0, with c > 0 depending only on Lambda, uniformly in x0.

**Hypotheses and conventions.** Lambda positive definite; P polynomial; the error is uniform in the shift x0. Mathlib has Poisson summation in one variable (Real.tsum_eq_tsum_fourier_of_rpow_decay, SchwartzMap.tsum_eq_tsum_fourier) and for one-variable Gaussians (Complex.tsum_exp_neg_quadratic); the N-variable Schwartz version is obtained by induction on N (apply the one-variable formula in the last coordinate for fixed others) or requested from AutomorphicLFunctionsAndLocalFactors AL.0.

**Proof route.**

1. Prove N-variable Poisson summation for Schwartz functions on R^N by induction from SchwartzMap.tsum_eq_tsum_fourier.
2. Apply it to g(y) = P(s(y + x0)) e^{-s^2 (y + x0)^t Lambda (y + x0)/2}; its Fourier transform at l != 0 is a polynomial in l/s times e^{-2 pi^2 l^t Lambda^{-1} l/s^2}, hence O(e^{-c/s^2}) summed over l != 0.
3. The l = 0 term is s^{-N} integral P e^{-x^t Lambda x/2}.

**Direct inputs.** `mathlib:SchwartzMap.tsum_eq_tsum_fourier`, `mathlib:Real.tsum_eq_tsum_fourier_of_rpow_decay`, `mathlib:Complex.tsum_exp_neg_quadratic`, `mathlib:fourier_gaussian_pi'`.

**Acceptance.**

- N = 1, P = 1, Lambda = 1: sum_n e^{-s^2 (n + x0)^2/2} = s^{-1} sqrt(2 pi) + O(e^{-2 pi^2/s^2}), which is Complex.tsum_exp_neg_quadratic.
- Taking s = m sqrt(epsilon) and Lambda = A-tilde/m, the points x = s(n + x0) run over the class lattice (m x0 + m Z^N) sqrt(epsilon) and the Gaussian is e^{-x^t A-tilde x/(2m)}; the main term is m^{-N} epsilon^{-N/2} integral P(x) e^{-x^t A-tilde x/(2m)} dx, which is GZ's Claim 4 with the corrected constant.
- The error is exponentially small, so the shift x0 (the congruence class) does not affect any order of the expansion.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.3, equations (35)-(36) and the proof of Claim 4, p. 9-10 (arXiv v1). The Poisson step; the source states it in one variable and applies it in N variables.


<a id="habironahmseries-hb-4-summand-tail-bound"></a>

### The summand of a Nahm sum away from its peak

**Lemma** · `HabiroNahmSeries:HB.4/summand-tail-bound` · [packet](../packets/HabiroNahmSeries.json)

Let (A,B,C) be an analytic Nahm datum, zeta a primitive m-th root of unity, q = zeta e^{-epsilon/m}. For every K there is C_K such that for 0 < epsilon <= 1 the sum of |e^{-epsilon Q(n)/m}/prod_i (q)_{n_i}| over the n in Z_{>=0}^N whose rescaled coordinate x = epsilon^{1/2}(n - epsilon^{-1} log(1/z)) satisfies max_i |x_i| >= epsilon^{lambda + 1/2} (lambda < -1/2 fixed) is at most C_K epsilon^K e^{Lambda/(m epsilon)}.

**Hypotheses and conventions.** A positive definite; z the distinguished solution; lambda < -1/2. This is the estimate GZ's Claim 2 needs outside the window where Proposition 2.2's expansion is not valid; GZ refer it to Vlasenko-Zwegers (not obtained).

**Proof route.**

1. Bound |1/(q)_n| <= prod_{j<=n} |1 - zeta^j e^{-j epsilon/m}|^{-1} by an explicit expression in the positive real variable e^{-epsilon/m} and the residues of j mod m.
2. Take logarithms: the bound is e^{-(1/epsilon) V(epsilon n) + O(log(1/epsilon))} with V a function whose unique minimum is at log(1/z) (the potential of HB.3/distinguished-solution, rescaled by m) and which grows quadratically.
3. Sum the resulting Gaussian-type bound over the complement of the window, where V exceeds its minimum by at least c epsilon^{2 lambda + 1} with 2 lambda + 1 < 0, giving a factor exp(-c epsilon^{2 lambda}) = O(epsilon^K).

**Direct inputs.** [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), [HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics](#habironahmseries-hb-4-pochhammer-radial-asymptotics), [HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity](#habironahmseries-hb-4-euler-function-at-a-root-of-unity), `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- For N = 1, A = (2), m = 1 the terms q^{n^2}/(q)_n are positive and the bound is a sum of a log-concave sequence away from its mode.
- The constant depends on m but not on the congruence class.
- Without positive definiteness no such bound holds (A = (0 1; 1 0) has a line of critical points).

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.3, Claim 2, equation (32), p. 9 (arXiv v1). The truncation this node justifies (GZ state it without the tail estimate).


<a id="habironahmseries-hb-4-poisson-summation-and-remainders"></a>

### Poisson summation, the truncation window and the uniform remainder bounds

**Lemma** · `HabiroNahmSeries:HB.4/poisson-summation-and-remainders` · [packet](../packets/HabiroNahmSeries.json)

For a fixed m-congruence class of a Nahm sum with positive definite A, and epsilon decreasing to 0: (Claim 1) the sums over the D-classes k' satisfy f^{[k,k']} ~ D^{-N} f^{[k]} for every k'; (Claim 2) for lambda < -1/2 the lattice sum may be truncated to |x_i| < epsilon^{lambda + 1/2} with error O(epsilon^K) for every K; (Claim 3) for lambda > -2/3 and every K the exponential of the psi-factors may be replaced by 1 + sum_{p <= K} C_p(x) epsilon^{p/2} with error o(epsilon^{K(3 lambda + 2)}) in the window; (Claim 4) for a polynomial P and lambda < -1/2, sum over x in (x^{(0)} + m Z^N) sqrt(epsilon), |x_i| < epsilon^{lambda + 1/2}, of P(x) e^{-x^t A-tilde x/(2m)} is asymptotic to m^{-N} epsilon^{-N/2} times integral over R^N of P(x) e^{-x^t A-tilde x/(2m)} dx, independently of the shift x^{(0)}. (GZ print (m epsilon)^{-N/2} and e^{-x^t A-tilde x/m} in Claim 4, which is inconsistent with its left side; the version here is the one that yields Theorem 3.1's constant.)

**Hypotheses and conventions.** Positive definite A; epsilon decreasing to 0; -2/3 < lambda < -1/2 for the combined use. One-dimensional Poisson summation IS in the pinned Mathlib (Real.tsum_eq_tsum_fourier_of_rpow_decay, SchwartzMap.tsum_eq_tsum_fourier, and the Gaussian case Complex.tsum_exp_neg_quadratic); the N-dimensional form over a shifted lattice is HB.4/lattice-sums-by-poisson-summation. The analytic details are referred by GZ to Vlasenko-Zwegers pp. 623-625 (not obtained; existing gap).

**Proof route.**

1. Claim 4: apply HB.4/lattice-sums-by-poisson-summation to P(x) e^{-x^t A-tilde x/(2m)} on the lattice m sqrt(epsilon) Z^N shifted by x^{(0)} sqrt(epsilon); the non-zero dual terms are O(epsilon^K) for every K, and the window restriction costs O(epsilon^K) since lambda + 1/2 < 0.
2. Claim 2: inside the window use the Gaussian bound; outside it use HB.4/summand-tail-bound, a bound on |e^{-epsilon Q(n)/m}/(q)_n| away from the peak that Proposition 2.2 does not provide.
3. Claim 3: in the window, deg C_p <= 3p and |x| <= epsilon^{lambda + 1/2} give |C_p(x) epsilon^{p/2}| <= C epsilon^{p(3 lambda + 2)}.
4. Claim 1: the same argument on the sublattice n = k' mod D, whose covolume is D^N times larger; the shift does not affect the leading and all higher terms.
5. Every step is a finite truncation with an explicit remainder, which is the stage text's uniform bound for each finite truncation.

**Direct inputs.** [HabiroNahmSeries:HB.4/summand-asymptotics](#habironahmseries-hb-4-summand-asymptotics), [HabiroNahmSeries:HB.4/lattice-sums-by-poisson-summation](#habironahmseries-hb-4-lattice-sums-by-poisson-summation), [HabiroNahmSeries:HB.4/summand-tail-bound](#habironahmseries-hb-4-summand-tail-bound), [HabiroNahmSeries:HB.4/gaussian-moments](#habironahmseries-hb-4-gaussian-moments), `mathlib:Asymptotics.IsBigO`, `mathlib:Real.tsum_eq_tsum_fourier_of_rpow_decay`, `mathlib:Complex.tsum_exp_neg_quadratic`.

**Acceptance.**

- N = 1, P = 1, A-tilde/m = 1: sum over (x0 + Z) sqrt(epsilon) of e^{-x^2/2} = sqrt(2 pi/epsilon) + O(e^{-2 pi^2/epsilon}), from Complex.tsum_exp_neg_quadratic.
- Both window constraints are needed: Claim 2 needs lambda < -1/2 and Claim 3 needs lambda > -2/3.
- With GZ's printed Claim 4 constant (m epsilon)^{-N/2} and Gaussian e^{-x^t A-tilde x/m}, Theorem 3.1's constant would be off by a factor m^{N/2} 2^{-N/2}; the numerical checks of HB.4/radial-asymptotic-expansion confirm the corrected constant.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 4.3, Claims 1 to 4, equations (29) and (32)-(34), p. 8-10 (arXiv v1). The claims, their constraints and the reference; Claim 4's constant is corrected here (source issue). [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.1, equation (43), p. 36 (arXiv v3). The form of the conclusion the finite-truncation bounds are needed for.


<a id="habironahmseries-hb-4-kummer-invariance-of-the-expansion"></a>

### The expansion is invariant under changing the m-th roots, so S^m has coefficients in F_m

**Lemma** · `HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface](#habironahmseries-hb-4-coefficientwise-kummer-descent-interface). Its hypotheses and limitations govern this target and the API names below.

With the coherent E,H_rad above, d clearing A,B,Q and m odd coprime to d, take the parent corrected finite sum T(η,ε) and C(θ)=∏_iD_ζ(ζθ_i). Each coefficient of T lies in H_rad. The exact missing assertion is σ(C(θ)^{−1}T(η,ε)^m)=C(θ)^{−1}T(η,ε)^m coefficientwise for every σ∈Aut_E(H_rad), with σ(η_i)=ζ^{s_i}η_i and σ(θ_i)=ζ^{ds_i}θ_i. It implies S(ε)^m∈E[[ε]]. This node specifies the parent field target with coherent rational powers; a proof of the displayed automorphism identity has not been established in the sources read and remains the named gap, not an inference from its constant term.

**Proof route.**

1. Negative-index polylogarithms, Bernoulli coefficients and Gaussian moments show T_p∈H_rad coefficientwise, using coherent η rather than unspecified θ^(1/d).
2. The required proof must combine the cyclic-dilogarithm transformation with reindexing the finite congruence sum and a formal Gaussian translation that transforms the complete exp(∑ψ) integrand. Reindexing the constant prefactors alone does not prove an all-orders identity.
3. Once the exact identity is proved, finite Kummer Galois fixed-field descent over E puts every coefficient in E. The parent lemma’s proposed reindexing is the starting interface, not evidence that this step has already been discharged.

**Direct inputs.** [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), [HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field](#habironahmseries-hb-3-algebraicity-and-the-nahm-field), `mathlib:IsPrimitiveRoot`, `mathlib:NumberField`, [HabiroNahmSeries:HB.3/positive-coherent-root-lift](#habironahmseries-hb-3-positive-coherent-root-lift).

**Acceptance.**

- At epsilon = 0, S^m is invariant under theta -> zeta^s theta to 1e-27 relative accuracy for (A,B) in {(2,0), (2,1), (3,0), (1,1/2), (4,1)} and m in {3,5,7} (mpmath).
- For A = (2/3), B = 0, m = 5 the leading constant's 10th power divided by mu^{10} has real part algebraic of degree 6, consistent with membership in the real subfield of Q(z, zeta_5) (PARI algdep).
- The single terms of T are not invariant: only the sum over all k is.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Theorem 3.1, equation (21), p. 5 (arXiv v1). The statement; the source's proof of Theorem 3.1 does not address it (source issue).


<a id="habironahmseries-hb-4-radial-asymptotic-expansion"></a>

### The all-orders radial asymptotic expansion of a Nahm sum at a root of unity

**Theorem** · `HabiroNahmSeries:HB.4/radial-asymptotic-expansion` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison](#habironahmseries-hb-4-radial-analytic-remainder-comparison). Its hypotheses and limitations govern this target and the API names below.

The analytic component of the parent radial-asymptotic-expansion holds in the strong, cancellation-safe sense: for every K≥0, e^{−Λ/(mε)}f_{A,B,0}(a/m+iε/(2πm))−∑_{j<K}a_j ε^j=O(ε^K). The coefficients are exactly those of χ_{a,m}^N m^{−N/2}c(Q)G(Q,a/m)S_{Q,ζ}(ε), with c(Q)=(det H)^{−1/2}∏θ_i^{B_i}(1−z_i)^{1/2−1/m}, S and I as in the parent corrected formula, and χ_{a,m}=m^{−1/2}exp[(1/m)∑_{t=1}^{m−1}t Log(1−ζ^t)]=exp(πi s(a,m)). The I integrand is exp[−B·x√ε/m−Nε/(24m)+∑ψ], and the Gaussian is exp(−xᵀHx/(2m)). All roots of positive real numbers and √det H are positive; cyclic-dilogarithm roots are defined by the weighted factor logarithms. For C≠0 multiply the coefficient series by exp(2πiaC/m) exp(−Cε/m). This theorem is solely radial ε→0+; it has no sectorial, minor-arc or arbitrary knot-matrix conclusion.

**Proof route.**

1. Use the corrected Euler reciprocal expansion, compact local expansion, global tail bound, and CRT theorem. Their bounds are uniform at each fixed order, which permits finite sums and lattice summation.
2. Combine (ε/2π)^{N/2}, the lattice factor m^{−N}ε^{−N/2}, and Gaussian integral (2πm)^{N/2}(det H)^{−1/2}. This gives exactly m^{−N/2}(det H)^{−1/2}.
3. Integrate each polynomial with the imported formal Gaussian bracket. Odd polynomial terms vanish and even terms give the ε-series. The analytic proof never invokes Kummer invariance; its field-of-definition assertion is separated below.

**Direct inputs.** [HabiroNahmSeries:HB.4/summand-asymptotics](#habironahmseries-hb-4-summand-asymptotics), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.4/gaussian-moments](#habironahmseries-hb-4-gaussian-moments), [HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting](#habironahmseries-hb-4-gauss-sum-and-congruence-splitting), [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), [HabiroNahmSeries:HB.4/poisson-summation-and-remainders](#habironahmseries-hb-4-poisson-summation-and-remainders), [HabiroNahmSeries:HB.4/lattice-sums-by-poisson-summation](#habironahmseries-hb-4-lattice-sums-by-poisson-summation), [HabiroNahmSeries:HB.4/summand-tail-bound](#habironahmseries-hb-4-summand-tail-bound), [HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion](#habironahmseries-hb-4-kummer-invariance-of-the-expansion), [HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity](#habironahmseries-hb-4-euler-function-at-a-root-of-unity), `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- m = 1, A = (2), B = 0: the limit is det(A-tilde)^{-1/2}(1 - z)^{-1/2} = 0.8506508... and S(epsilon)/S(0) = 1 - epsilon/60 + O(epsilon^2) (modularity of q^{-1/60} G(q)); GZ's printed I_{Q,zeta} gives 1 + epsilon/40 instead.
- A = (2), B = 0, alpha = 1/5: the limit is e(0.09) = e(5/24 - 1/8 + 1/60 - 1/100) (CGZ (49) for n = 5); alpha = 2/3: the limit is 0.4027334 - 0.3379334 i, the conjugate of the value at 1/3, whereas the printed chi gives a value off by e(-1/12).
- Rank two: A = (4 1; 1 1), B = 0, alpha = 2/3 and A = (2 2; 2 4), alpha = 2/5 match the corrected formula to 5 digits and differ from the printed one by e(-1/6) and e(-2/5); A = (3/2 1/2; 1/2 3/2) at alpha = 1/5 (d = 4) and A = (2 2; 2 4) at alpha = 1/7 (limit e(7/24 - 1/8 + 1/84 - 1/196) to 12 digits) match.
- Vanishing: A = (1), B = 0, alpha = 1/3 and A = (4 1; 1 1), B = (1/2, 1/2), alpha = 1/3 have G = 0 and the normalised radial function tends to 0.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Theorem 3.1, equations (eq.FGIII), (eq.CAB), (eq.SQz), (eq.PS). The theorem, verbatim, with all four displayed ingredients. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, before Theorem 7.1, printed p. 37. CGZ quote the Garoufalidis-Zagier theorem in simplified form; this node is the full form and the next node is the simplified one.


<a id="habironahmseries-hb-4-galois-equivariance-of-the-expansion"></a>

### Galois transformation law of the expansion coefficients

**Lemma** · `HabiroNahmSeries:HB.4/galois-equivariance-of-the-expansion` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison). Its hypotheses and limitations govern this target and the API names below.

Coefficient conjugation is to be proved for actual automorphisms of the coherent radical/Gauss coefficient fields, taking ζ to ζ^c when such an automorphism exists. The separate χ_cyc⁻¹ eigenspace statement about the nonzero constant Kummer class is the arithmetic comparison below; it does not follow merely by conjugating the displayed analytic formula.

**Proof route.**

1. Factor c(Q) into the positive ω and ∏θ_i^{B_i}(1−z_i)^{−1/m}. The analytic statement is purely algebraic rearrangement of the radial theorem.
2. Raise Φ to m. The rational powers become z_i^{B_i}∈Q(y), the (1−z) factors are in E and G is in Q(ζ_D). The coefficient claim follows from the separate descent identity in exactly K.
3. Import the cyclic near-unit map, coherent integral Bloch class, and the parent simplified theorem only for the arithmetic comparison under its required compatibility. The published CGZ (46) must be read as a Kummer-class statement. Its fixed μ is not used as a universal phase for all numerators a. Extend β from F₀=Q(y_i) to F_G when using R_ζ over that base; its coprimality hypothesis is gcd(m,w_{F_G})=1, where w counts roots of unity before adjoining ζ.

**Direct inputs.** [HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion](#habironahmseries-hb-4-kummer-invariance-of-the-expansion), `mathlib:IsPrimitiveRoot.autToPow`.

**Acceptance.**

- For A = (2), B = 0, m = 3 the constants S_{Q,e(1/3)}(0)^3 and S_{Q,e(2/3)}(0)^3 are complex conjugate.
- The law concerns S^m; the full constant also contains chi_alpha^N and G(Q, alpha), which transform differently.
- For m = 1 the statement is empty.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.1, last sentence, p. 36 (arXiv v3). The eigenspace statement this law yields.


<a id="habironahmseries-hb-4-simplified-form-and-the-unit"></a>

### The simplified form of the expansion and its unit

**Theorem** · `HabiroNahmSeries:HB.4/simplified-form-and-the-unit` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison). Its hypotheses and limitations govern this target and the API names below.

Choose d clearing A,B,Q and odd m coprime to d. For the corrected radial series put ω=m^{−N/2}(det H)^{−1/2}∏(1−z_i)^{1/2}>0, μ_{a,m}=χ_{a,m}^N and Φ=G(Q,a/m)∏θ_i^{B_i}(1−z_i)^{−1/m}S. Then ω²∈Q(z)^× and f_{A,B,0}(τ)=μ_{a,m}ωe^{Λ/(mε)}(Φ_{<K}(ε)+O(ε^K)) for every K. Conditional on the exact Kummer identity, Φ^m∈K[[ε]], K=Q(z_i^{1/d},ζ,ζ_D); for integral A with even diagonal and integral B, take d=D=1 and K=Q(z,ζ). Integer-valued Q with half-integral B still requires the B-root field for this displayed normalization. The full arithmetic CGZ package additionally requires the constant Kummer class [Φ(0)^m]=[P_ζ(β)D_ζ(1)^N]^{−1}, interpreted in H_G^×/H_G^{×m}, H_G=K(η_i), and only when Φ(0)≠0. The separate χ_cyc^{−1} eigenspace target is [Φ(0)^m]∈(K^×/K^{×m})^{χ_cyc^{−1}}, where F_G=Q(y_i,ζ_D), K=F_G(ζ), and χ_cyc:Aut_{F_G}(K)→(Z/mZ)^× is defined by σ(ζ)=ζ^{χ_cyc(σ)}. These are requested arithmetic comparisons, not conclusions of the analytic proof. For arbitrary rational Q the compatible Bloch class is β=∑[z_i] over Q(z_i^{1/d}), not an unverified integral class over Q(z_i). The rational-data Kummer-class/eigenspace comparison with the Gauss factor is a separate recorded gap. No root of a quotient class is presented as a chosen element.

**Proof route.**

1. Factor c(Q) into the positive ω and ∏θ_i^{B_i}(1−z_i)^{−1/m}. The analytic statement is purely algebraic rearrangement of the radial theorem.
2. Raise Φ to m. The rational powers become z_i^{B_i}∈Q(y), the (1−z) factors are in E and G is in Q(ζ_D). The coefficient claim follows from the separate descent identity in exactly K.
3. Import the cyclic near-unit map, coherent integral Bloch class, and the parent simplified theorem only for the arithmetic comparison under its required compatibility. The published CGZ (46) must be read as a Kummer-class statement. Its fixed μ is not used as a universal phase for all numerators a. Extend β from F₀=Q(y_i) to F_G when using R_ζ over that base; its coprimality hypothesis is gcd(m,w_{F_G})=1, where w counts roots of unity before adjoining ζ.

**Direct inputs.** [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](#habironahmseries-hb-4-radial-asymptotic-expansion), [HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion](#habironahmseries-hb-4-kummer-invariance-of-the-expansion), [HabiroNahmSeries:HB.4/galois-equivariance-of-the-expansion](#habironahmseries-hb-4-galois-equivariance-of-the-expansion), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `HabiroNumberFields:HB.2/kummer-value-P`, `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-sum`.

**Acceptance.**

- n = 1: Phi_1(h) is in F-natural[[h]] and omega^2 in F.
- For the Andrews-Gordon matrices and zeta = e(1/n) the constant term is computed by HB.4/andrews-gordon-radial-constant.
- Phi_zeta vanishes identically when G(Q, a/n) = 0, e.g. A = (1), B = 0 (modular with C = -1/48), n = 3: an explicit case of CGZ Remark 7.3.
- Non-integral Q: for A = (2/3), B = (1/3), n = 5, zeta = e(1/5), the radial constant K satisfies K^{10} mu^{-10} not in F_5 (the real part is not of degree <= 6 over Q, PARI algdep at 660 digits) while K^{10} mu^{-10} e(1/6) is in F_5; the extra 6th root of unity is G(Q, 1/5)^{10} 3^5 = e(-1/6).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.1, equations (43) and (44), p. 36 (arXiv v3). The theorem as printed; this node adds n odd, makes (44) precise modulo n-th powers, and restricts the fixed mu to integer-valued Q (source issues). [cgz](https://arxiv.org/pdf/1712.04887v3): Remark 7.3, p. 37. The non-vanishing caveat. [gz](https://arxiv.org/pdf/1812.07690v1): Theorem 3.1, equations (18)-(21), p. 5 (arXiv v1). The oddness hypothesis that CGZ's quotation drops.


<a id="habironahmseries-hb-4-unit-corollary-and-nonvanishing"></a>

### The unit corollary, under its own non-vanishing hypothesis

**Theorem** · `HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison](#habironahmseries-hb-4-nonzero-unit-series-descent-comparison). Its hypotheses and limitations govern this target and the API names below.

Let K⊆L be characteristic-zero fields, m≥1, Φ∈L[[ε]] with Φ₀≠0 and Φ^m∈K[[ε]]. Then U=Φ/Φ₀ belongs to K[[ε]]: it is the unique series with U₀=1 and U^m=Φ^m/Φ₀^m. If a representative ε_β∈K^× of R_ζ(β) and a chosen compatible m-th root satisfy ε_β^{1/m}Φ₀∈K^×, then ε_β^{1/m}Φ∈K[[ε]]. Apply this to the radial coefficients only after the preceding arithmetic comparison and the supplier hypotheses (including gcd(m,w_F)=1 where R_ζ is constructed over F with K=F(ζ); in the Gauss-enlarged application take F=F_G=Q(y_i,ζ_D)). If Φ₀=0, neither normalization nor this corollary is asserted; the analytic remainder theorem still applies.

**Proof route.**

1. Compare successive coefficients of U^m. At order p the new coefficient is mU_p plus a polynomial in preceding coefficients; characteristic zero allows division by m and inductively puts U_p in K.
2. The same recursion proves uniqueness of a root with constant term one. It does not require analytic convergence of the formal series.
3. For the near-unit corollary, multiply the descended U by the given scalar in K. The scalar membership is exactly the arithmetic constant-term comparison, not a conclusion of the recursion alone.

**Direct inputs.** [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), `HabiroNumberFields:HB.2/the-map-R-zeta`, `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces`.

**Acceptance.**

- For n = 1 the statement is that Phi_1(h) itself lies in F[[h]] once its constant term is non-zero.
- When Phi vanishes identically the conclusion is true but empty; the source says the corollary is vacuous in that case.
- Without the non-vanishing hypothesis the division is not allowed, and the argument produces nothing: this is the precise sense in which HB.4's stage text forbids dividing by Phi(0).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Corollary 7.2 and its proof, printed p. 38. The corollary and its whole proof, verbatim.


<a id="habironahmseries-hb-4-andrews-gordon-radial-constant"></a>

### The radial constant of the Andrews-Gordon Nahm sums at e(1/n)

**Theorem** · `HabiroNahmSeries:HB.4/andrews-gordon-radial-constant` · [packet](../packets/HabiroNahmSeries.json)

For odd n >= 5, r = (n - 3)/2, A_n = (2 min(i,j))_{1<=i,j<=r} and f_n = f_{A_n,0}: (a) f_n(q) = prod_{k>0, 2k != 0, +-1 mod n} 1/(1 - q^k) (Andrews-Gordon); (b) with C_n = -(n-3)/(24 n), f-tilde_n(tau) = q^{C_n} f_n(q) satisfies f-tilde_n(tau/(n tau + 1)) = e((n - 3)/24) f-tilde_n(tau) (CGZ (48)); (c) L(xi_{A_n}) = (n - 3) pi^2/(6 n); (d) e^{-L(xi_{A_n})/(n h)} f_n(e(1/n) e^{-h/n}) = e(n/24 - 1/8 + 1/(12 n) - 1/(4 n^2)) (1 + O(h)) as h decreases to 0 (CGZ (49)). This is the analytic input of CGZ Theorem 7.4 and needs nothing from HabiroNumberFields.

**Hypotheses and conventions.** n odd; the Andrews-Gordon identity and the dilogarithm identity (c) are imported (requests and gaps). The sign and branch conventions of theta and eta are those of QM.1.

**Proof route.**

1. (a) from the Andrews-Gordon identity (requested; QM.0 has only n = 5, QM.0/rogers-ramanujan-first).
2. (b) Rewrite f-tilde_n as q^{(r+1)^2/(2n)} theta(n tau, -(r+1) tau)/eta(tau) by the Jacobi triple product (QM.1/jacobi-theta-triple-product) and apply the T and S transformations of theta and eta (QM.1/jacobi-theta-function, QM.1/eta-transformation-law).
3. (c) From the explicit distinguished solution X_k = (1 - zeta_n^{k-1})(1 - zeta_n^{k+1})/(1 - zeta_n^k)^2 in the order (X_2, ..., X_{r+1}), 1 - X_k = ((zeta^{1/2} - zeta^{-1/2})/(zeta^{k/2} - zeta^{-k/2}))^2, the functional equation L(1 - x) = pi^2/6 - L(x) and the identity of Zagier's survey II.2C (gap).
4. (d) Apply (b) at tau = (1 + i h/(2 pi))/n, whose image (-1 + i/hbar)/n tends to the cusp at infinity, and read off the constant.

**Direct inputs.** [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-function`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-triple-product`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-transformation-law`, `QSeriesPartitionsAndMockModularForms:QM.0`, `QSeriesPartitionsAndMockModularForms:QM.0/rogers-ramanujan-first`, `Polylogarithms:P.1`.

**Acceptance.**

- n = 5: the constant e(0.09) agrees with the numerical limit 0.8443279 + 0.5358268 i of e^{-pi^2/(75 epsilon)} G(e(1/5) e^{-epsilon/5}).
- n = 7: GZ's formula for A_7 = (2 2; 2 4) at e(1/7) gives 0.4625383 + 0.8865993 i = e(7/24 - 1/8 + 1/84 - 1/196) to 12 digits, and L(xi_{A_7}) = 4 pi^2/42.
- (b) holds numerically to 30 digits for n = 5, 7, 9 at tau = 0.1 + 0.35 i and -0.05 + 0.5 i.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.2, equations (45)-(49), pp. 37-38 (arXiv v3). (a); (b)-(d) are CGZ (48)-(49) and (47).


<a id="habironahmseries-hb-4-acceptance-andrews-gordon"></a>

### CGZ Theorem 7.4: R_zeta(eta_zeta) = zeta^2

**Theorem** · `HabiroNahmSeries:HB.4/acceptance-andrews-gordon` · [packet](../packets/HabiroNahmSeries.json)

For odd n and zeta a primitive n-th root of unity, let eta_zeta be the n-torsion element of B_CGZ(Q(zeta)^+) of CGZ (34) (HabiroNumberFields:HB.2/the-element-eta). Then R_zeta(eta_zeta) = zeta^2 in (Q(zeta)^x/Q(zeta)^{x n})^{chi^{-1}}. The proof compares the radial constant of the Andrews-Gordon Nahm sum f_n = f_{A_n,0}, A_n = (2 min(i,j))_{1<=i,j<=r}, r = (n-3)/2, at zeta_n = e(1/n), computed by modularity (HB.4/andrews-gordon-radial-constant), with the unit corollary.

**Hypotheses and conventions.** n odd; n = 1 is trivial and for n = 3, f_3 = 1 (0-dimensional Nahm sum). The distinguished solution of 1 - X = X^{A_n} is (X_2, ..., X_{r+1}) with X_k = (1 - zeta_n^{k-1})(1 - zeta_n^{k+1})/(1 - zeta_n^k)^2 (CGZ prints (X_{r+1}, ..., X_2), which does not solve the equations: residual 0.160 for n = 7). The Andrews-Gordon identity f_n(q) = prod_{k>0, 2k != 0, +-1 mod n} 1/(1 - q^k) (CGZ (45); the condition is on 2k, not on k: with 'k != 0, +-1 mod n' the product differs from f_n at q^1, and for n = 5 it is H(q) instead of G(q)).

**Proof route.**

1. Form A_n and its distinguished solution; L(xi_{A_n}) = (n - 3) pi^2/(6n) (CGZ (47), the dilogarithm identity of Zagier's survey II.2C; gap).
2. HB.4/andrews-gordon-radial-constant: lim e^{-L/(nh)} f_{A_n,0}(zeta_n e^{-h/n}) = e(n/24 - 1/8 + 1/(12n) - 1/(4n^2)).
3. Compare with HB.4/simplified-form-and-the-unit (Q integer-valued, mu = e(r(n-1)(n-2)/(24n))) and HB.4/unit-corollary-and-nonvanishing after raising to the 4n-th power (CGZ (50)); with D_zeta(1) = zeta^{n/3} modulo n-th powers this gives R_zeta(xi_{zeta})^4 = e(1/n) (3 not dividing n) or e(1/n) e(-1/3) (3 | n) (CGZ (51)).
4. Use 2 xi_zeta = eta_{zeta^{1/2}} - [0] (CGZ (52)), R_zeta([0])^{-2} = D_zeta(1)^2, and eta_{zeta^k} = k^2 eta_zeta (HabiroNumberFields:HB.2/eta-galois-scaling, with k = 1/2) to conclude R_zeta(eta_zeta) = R_zeta(xi_zeta)^8 R_zeta([0])^{-2} = zeta^2.

**Direct inputs.** [HabiroNahmSeries:HB.4/andrews-gordon-radial-constant](#habironahmseries-hb-4-andrews-gordon-radial-constant), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), [HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing](#habironahmseries-hb-4-unit-corollary-and-nonvanishing), `HabiroNumberFields:HB.2/the-element-eta`, `HabiroNumberFields:HB.2/eta-galois-scaling`, `HabiroNumberFields:HB.2/the-map-R-zeta`, `HabiroNumberFields:HB.2/root-of-unity-dependence`, `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`.

**Acceptance.**

- n = 5: f_5 = G(q) and the radial constant at e(1/5) is e(0.09) = e(5/24 - 1/8 + 1/60 - 1/100) (numerically 0.8443279 + 0.5358268 i).
- n = 7: the GZ constant for A_7 = (2 2; 2 4) at e(1/7) equals e(7/24 - 1/8 + 1/84 - 1/196) to 12 digits, and L(xi_{A_7}) = 4 pi^2/42.
- The product condition is on 2k: prod_{2k != 0, +-1 mod n} 1/(1 - q^k) agrees with f_n to O(q^60) for n = 5, 7, 9; prod_{k != 0, +-1 mod n} does not (first difference at q^1).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.4 and its proof, equations (45)-(52), pp. 37-39 (arXiv v3). The theorem and the structure of its proof; the ordering of the solution and the last display are corrected (source issues).


### HB.4 finer contracts

These 13 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-4-analytic-convergence-and-branch-comparison"></a>

### Analytic convergence and the rational exponent covering

**Comparison** · `HabiroNahmSeries:HB.4/analytic-convergence-and-branch-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Use the q-symbol and analytic Nahm datum of the parent. For |q|<1, (w;q)∞=∏_{j≥0}(1−wq^j) is multipliable, locally uniformly for bounded w and |q|≤ρ<1, and nonzero exactly when no factor vanishes. For symmetric positive-definite rational A, rational B,C, the Nahm series converges normally on compact subsets of Im τ>0 with q^λ=exp(2πiτλ); it is holomorphic there. Clearing a denominator gives a Laurent-Puiseux series on a finite cover of the punctured disc, not in general a single-valued holomorphic function of q. f_{A,B,C}(τ)=exp(2πiCτ)f_{A,B,0}(τ); τ=a/m+iε/(2πm) fixes the branch.

**Proof route.**

1. Geometric norm summability and the listed product/nonzero declarations prove the product assertion; finite factors isolate its zeros. Euler w=q is already the pinned eta product, not a new definition.
2. For a compact upper-half-plane set, |q|≤ρ<1. The reciprocal finite q-factorials are uniformly bounded by the positive Euler product at ρ. Positive definiteness gives Q(n)≥c|n|²−b|n|−b, so the absolute series is normally convergent.
3. Apply termwise holomorphy and factor out exp(2πiCτ). A rational exponent takes its value from τ, not the principal log of q.

**Direct inputs.** [HabiroNahmSeries:HB.4/q-pochhammer-symbols](#habironahmseries-hb-4-q-pochhammer-symbols), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), `mathlib:multipliable_one_sub_of_summable`, `mathlib:tprod_one_add_ne_zero_of_summable`, `mathlib:ModularForm.multipliable_one_sub_pow`, `mathlib:ModularForm.differentiableOn_tprod_one_sub_pow`.

**Acceptance.**

- (0;q)∞=1; (1;q)∞=0 because of its initial factor.
- For C=1/2, changing τ to τ+1 changes q^C by −1.
- In rank zero the series is exp(2πiCτ), so C cannot be discarded.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): §3, (11), PDF p. 4. The printed finite-cover convention is retained exactly; convergence is supplied by a Gaussian majorant.


<a id="habironahmseries-hb-4-compact-pochhammer-remainder"></a>

### Uniform Pochhammer remainder at a radial root of unity

**Theorem** · `HabiroNahmSeries:HB.4/compact-pochhammer-remainder` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Fix a primitive m-th root ζ, m≥1, and 0<ρ<1. Put q=ζe^{−ε/m}. Uniformly for |w|≤ρ, real ν with |ν|ε/m≤−log(ρ)/2, and ε→0+, write log(qw e^{−νε/m};q)∞ as the sum of factorwise principal logs. Its Bernoulli expansion through r=J≥1 has remainder bounded by C_{J,ρ,m} ε^{−1}[ε(1+|ν|)]^{J+1}. Equivalently, the truncation of the parent ψ through ε^{J−1} has that same remainder after removing the r=0,1 terms and the quadratic ν² term. The displacement guard is essential: |ν|ε≤1 alone can cross a zero. The expansion is log(product)=−Li₂(w^m)/(mε)−(ν/m−1/2)Log(1−w^m)−εν²w^m/(2m(1−w^m))−m^{−1}log D_ζ(w)−Log(1−w)+ψ; log D is the weighted sum of logs, not an arbitrary principal log of its product.

**Proof route.**

1. Split the logarithmic series into residues t=1,…,m: −∑_{l≥1,t}(ζ^tw)^l e^{−l(t+ν)ε/m}/[l(1−e^{−lε})]. The guard bounds all deformed |w| by √ρ<1.
2. For lε(1+|ν|) small, Taylor-expand the Bernoulli generating function through J with a uniform analytic remainder. For the complementary l, use geometric decay (√ρ)^l. The weighted l-power sum is bounded independently of ν and ε; this gives the displayed bound. This is the two-variable argument of VZ Lemma 2.2, applied to each residue.
3. Use the imported classical distribution identity for r=0,1 and the removed r=2 term. The chosen factorwise logarithms make these identities exact; no global log-of-product rule is assumed.

**Direct inputs.** [HabiroNahmSeries:HB.4/euler-maclaurin-with-remainder](#habironahmseries-hb-4-euler-maclaurin-with-remainder), [HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics](#habironahmseries-hb-4-pochhammer-radial-asymptotics), [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), `mathlib:Polynomial.bernoulli`, `mathlib:IsPrimitiveRoot`, `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/classical-distribution`, `mathlib:Complex.cexp_tsum_eq_tprod`.

**Acceptance.**

- w=0 gives zero logarithm and zero remainder.
- The saddle substitution ν=x/√ε, |x|≤ε^{−1/12}, has ε(1+|ν|)=O(ε^{5/12}).
- At m=1, if w is positive and ν=−m log(1/w)/ε−1, a factor can vanish: a fixed displacement bound that permits this cannot be used.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): Lemma 2.1, (4)–(5), and §4.1. The asymptotic formula is imported; this continuation supplies a compact, guarded remainder. [vz-preprint](https://arxiv.org/pdf/1104.4008): Lemma 2.2(ii), proof (2.3)–(2.4), PDF pp. 3–4. The small/large summation-index split proves uniformity rather than interchanging a divergent infinite Bernoulli series.


<a id="habironahmseries-hb-4-finite-product-modulus-estimate"></a>

### A global modulus estimate for finite q-factorials

**Theorem** · `HabiroNahmSeries:HB.4/finite-product-modulus-estimate` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Fix ζ primitive of order m≥1. There are C>0 and ε₀>0 such that for every n≥0 and 0<ε<ε₀, with q=ζe^{−ε/m} and u=εn, | log |(q;q)_n| − [Li₂(e^{−u})−π²/6]/(mε) | ≤ C(1+|log ε|). At u=0 the numerator is zero, using Li₂(1)=π²/6. This is a modulus estimate valid for all n, not a positivity assertion about the complex summand.

**Proof route.**

1. Group j=mb+t, t=1,…,m. The undeformed block identity ∏_t(1−ζ^t r)=1−r^m controls its absolute logarithm. For b≥1 compare the actual radial offsets with r=e^{−bε}; the summed error is O(∑_{b≤1/ε}1/b)+O(1), uniformly in the final cutoff.
2. Treat the b=0 block separately; its ζ^m=1 factor has logarithm O(log ε), and all other factors are bounded away from zero. An incomplete final block contributes O(1+|log ε|).
3. Compare the monotone Riemann sum for log(1−e^{−v}) to its integral, including the integrable logarithmic singularity at zero. The primitive is Li₂(e^{−v}); the accumulated error has the same logarithmic bound.

**Direct inputs.** [HabiroNahmSeries:HB.4/q-pochhammer-symbols](#habironahmseries-hb-4-q-pochhammer-symbols), `Polylogarithms:P.1/classical-polylogarithm`, [HabiroNahmSeries:HB.4/analytic-convergence-and-branch-comparison](#habironahmseries-hb-4-analytic-convergence-and-branch-comparison).

**Acceptance.**

- n=0 gives both main terms zero.
- m=1 is the usual finite real Euler-product estimate.
- At m=3 an individual phase-free summand can be complex, although its modulus satisfies the bound.

**Sources.** [vz-preprint](https://arxiv.org/pdf/1104.4008): Lemma 2.2(i), PDF p. 3. Motivates the all-index estimate; the block proof given here extends the real estimate to roots of unity. [gz-published](https://d-nb.info/1217648526/34): §4.3, (27), Claims 2–3, PDF pp. 9–11. Supplies the global input required before the local saddle expansion can control the tails.


<a id="habironahmseries-hb-4-saddlepoint-global-domination"></a>

### Global Gaussian domination of the summands

**Theorem** · `HabiroNahmSeries:HB.4/saddlepoint-global-domination` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Let A be symmetric positive definite, B,C real, z∈(0,1)^N the distinguished Nahm solution, s=−log z, H=A+diag(z_i/(1−z_i)), and Λ=Nπ²/6−∑Li₂(z_i)−½∑log z_i log(1−z_i). H is positive definite and det H>0. For fixed ζ of order m, there are c,M,L,ε₀>0 with |e^{−Λ/(mε)} e^{−εQ(n)/m}/∏_i(q;q)_{n_i}| ≤ M ε^{−L} exp(−c∑_i[√ε(n_i−s_i/ε)]²) for all n∈N^N and 0<ε<ε₀. Consequently the normalized sum outside max_i|√ε(n_i−s_i/ε)|≤ε^{−1/12} is O(ε^K) for every K, including each congruence subsum.

**Proof route.**

1. For u≥0 use f_A(u)=½uᵀAu+∑Li₂(e^{−u_i}). Its interior Hessian is A+diag(1/(e^{u_i}−1)); strong convexity extends to the boundary by continuity and gives f_A(u)−f_A(s)≥c₀|u−s|².
2. Insert the global product estimate. The exponent is [Nπ²/6−f_A(u)]/(mε)−B·u/m−εC/m. Complete the square to absorb the linear term, keeping a constant times a power of ε.
3. Compare the shifted Gaussian lattice tail to integrals/cubes uniformly in the shift. Its bound is a power of ε times exp(−c′ε^{−1/6}), smaller than every ε^K. Positivity is used for the majorant, not the complex summand.

**Direct inputs.** [HabiroNahmSeries:HB.4/finite-product-modulus-estimate](#habironahmseries-hb-4-finite-product-modulus-estimate), [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), `mathlib:Matrix.PosDef.det_pos`, `mathlib:integral_gaussian`.

**Acceptance.**

- For A=(2), z=(√5−1)/2, H=2+z/(1−z) and the determinant branch is positive.
- The same bound holds when the Gauss sum vanishes; it never divides by the leading coefficient.
- Positive semidefiniteness alone is insufficient; the theorem retains positive definiteness.

**Sources.** [vz-preprint](https://arxiv.org/pdf/1104.4008): Lemma 2.1 and Theorem 2.3, PDF pp. 2, 4–7. The convexity and expanding-window proof provide the real prototype. [gz-published](https://d-nb.info/1217648526/34): §2, (6)–(9); §4.3, Claim 2. Uses the printed critical point and Hessian with the corrected factor 1/(2m) in the Gaussian.


<a id="habironahmseries-hb-4-uniform-local-saddle-remainder"></a>

### Uniform local saddle expansion and integrated remainders

**Theorem** · `HabiroNahmSeries:HB.4/uniform-local-saddle-remainder` · [packet](../packets/HabiroNahmSeries--HB.4.json)

In the parent corrected summand expansion let t=√ε and write R_k(x,t)=exp[−(B·x)t/m−(C+N/24)t²/m+∑_i ψ_{ζ^{k_i}θ_i,ζ}(x_i/t,t²)]=∑_{p≥0}P_{k,p}(x)t^p, θ_i=z_i^{1/m}>0. Each P_{k,p} is a polynomial of total degree≤3p, P_{k,0}=1, and P_{k,p}(−x)=(−1)^pP_{k,p}(x). On max|x_i|≤ε^{−1/12}, for every K one can choose finite J,P so that the local error after truncation is bounded by C_K ε^K(1+|x|^{M_K})e^{−c|x|²} after multiplication by the corrected Gaussian. Thus the lattice-scaled absolute error ε^{N/2}∑|error| is O(ε^K), uniformly in the residue and shifted lattice. One safe choice is J=12(K+1), P=4(K+1), retaining all terms p<P; Gaussian parity then removes the odd terms, and only p<2K contribute to the target truncation.

**Proof route.**

1. Each Bernoulli term ε^{r−1}ν^j=t^{2r−2−j}x^j has positive t-order after the removed r=2,j=2 term; j≤r gives j≤3p and j≡p mod 2. Exponentiation preserves these degree/parity bounds. The C+N/24 and negative B terms must remain.
2. On the fixed window, ε(1+|ν|)=O(ε^{5/12}). The compact product bound with J=12(K+1) has order at least (5J−7)/12>K. A t^p polynomial of degree≤3p has window size O(ε^{p/4}), so P=4(K+1) controls the exponential Taylor tail.
3. Use a weaker Gaussian to dominate the small exponential perturbation and its polynomial factors. The remaining finitely many terms p≥2K are bounded after summation by their Gaussian moments. This proves an absolute, integrated remainder rather than a relative one.

**Direct inputs.** [HabiroNahmSeries:HB.4/compact-pochhammer-remainder](#habironahmseries-hb-4-compact-pochhammer-remainder), [HabiroNahmSeries:HB.4/saddlepoint-global-domination](#habironahmseries-hb-4-saddlepoint-global-domination), [HabiroNahmSeries:HB.4/summand-asymptotics](#habironahmseries-hb-4-summand-asymptotics), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.4/gaussian-moments](#habironahmseries-hb-4-gaussian-moments), `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- In one dimension P₁ has a cubic contribution, of order √ε, rather than order ε³.
- Odd p integrates to zero; the resulting expansion uses ε, not √ε.
- At A=(2), B=C=0, m=1 the first normalized coefficient is −1/60; the missing eta factor gives the incorrect +1/40.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): Proposition 2.2 and §4.3, Claims 2–3, (31)–(32). Corrects the logarithmic/exponential confusion and gives the finite-order uniform estimate. [vz-preprint](https://arxiv.org/pdf/1104.4008): Theorem 2.3 proof, PDF pp. 5–7. The overlap −2/3<λ<−1/2 is made concrete by λ=−7/12.


<a id="habironahmseries-hb-4-poisson-covolume-comparison"></a>

### Poisson summation with the exact lattice covolume

**Comparison** · `HabiroNahmSeries:HB.4/poisson-covolume-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

For a real positive-definite H, m≥1, complex polynomial P and arbitrary real shift b, put h=m√ε. Uniformly in b modulo hZ^N, h^N∑_{v∈Z^N}P(b+hv)e^{−(b+hv)ᵀH(b+hv)/(2m)} differs from ∫_{R^N}P(x)e^{−xᵀHx/(2m)}dx by O(ε^K) for every K. Cutting off max|x_i|≤ε^{−1/12} preserves that conclusion. Hence the unscaled sum has factor m^{−N}ε^{−N/2}, not (mε)^{−N/2}. The Gaussian integral for P=1 is (2πm)^{N/2}/√det H, with the positive square root.

**Proof route.**

1. Iterate the pinned one-dimensional Schwartz Poisson identity using Fubini; polynomial times positive-definite Gaussian has the required integrability, including after partial Fourier transforms.
2. The transformed function is a polynomial times a Gaussian for H⁻¹. All nonzero dual modes are uniformly exponentially small; shift phases have modulus one. General Schwartz smoothness alone would give arbitrary-power decay, not exponential decay.
3. Use the global Gaussian window estimate to remove the cutoff. The volume of a lattice cell is h^N; combine it with the Gaussian determinant integral before simplifying powers of m.

**Direct inputs.** [HabiroNahmSeries:HB.4/lattice-sums-by-poisson-summation](#habironahmseries-hb-4-lattice-sums-by-poisson-summation), [HabiroNahmSeries:HB.4/gaussian-moments](#habironahmseries-hb-4-gaussian-moments), [HabiroNahmSeries:HB.4/saddlepoint-global-domination](#habironahmseries-hb-4-saddlepoint-global-domination), `mathlib:SchwartzMap.tsum_eq_tsum_fourier`, `mathlib:integral_gaussian`, `mathlib:Matrix.PosDef.det_pos`.

**Acceptance.**

- N=1,P=1,H=1 gives sum asymptotic √(2πm)/(m√ε).
- For odd P the integral is zero and the absolute error remains valid.
- Replacing the spacing by mD√ε gives exactly D^{−N} times the main coefficient.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): §4.3, Claim 4, (33)–(35) and following display. The parent covolume correction is checked against the journal text; its prefactor error persists.


<a id="habironahmseries-hb-4-cancellation-safe-congruence-remainder"></a>

### Congruence splitting without nonzero leading coefficients

**Theorem** · `HabiroNahmSeries:HB.4/cancellation-safe-congruence-remainder` · [packet](../packets/HabiroNahmSeries--HB.4.json)

For a rational Q with C=0, odd m coprime to a denominator d, D a strong denominator divisible by d with gcd(m,D)=1, use the parent exact CRT split into k mod m and k′ mod D. For every K, e^{−Λ/(mε)}(f^{[k,k′]}(ε)−D^{−N}f^{[k]}(ε))=O(ε^K), uniformly in the finitely many classes. This difference formulation holds whether either leading coefficient vanishes. Substituting into the exact split yields the normalized radial expansion with the finite factor G(Q,a/m)=D^{−N}∑_{k′}exp(2πi ᾱQ(k′)), ᾱ=am⁻¹ mod D. No division by G is used.

**Proof route.**

1. CRT identifies each joint residue class with a shifted lattice of spacing mD√ε. The local coefficient polynomials are identical for classes with the same k mod m.
2. Apply the absolute remainder and Poisson estimates to both lattice spacings. Their coefficients differ by D^{−N}; subtracting cancels every coefficient, even a zero one.
3. Sum over k′ with its phase in the exact parent splitting identity. The finite sum is the Gauss factor. This replaces GZ Claim 1’s ambiguous relative asymptotic notation by an absolute flat difference.

**Direct inputs.** [HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting](#habironahmseries-hb-4-gauss-sum-and-congruence-splitting), [HabiroNahmSeries:HB.4/uniform-local-saddle-remainder](#habironahmseries-hb-4-uniform-local-saddle-remainder), [HabiroNahmSeries:HB.4/poisson-covolume-comparison](#habironahmseries-hb-4-poisson-covolume-comparison), `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- A=(1),B=0,m=3 has strong D=2 and G=(1−1)/2=0.
- The normalized full expansion is flat in that example.
- For integer-valued Q choose D=1: G=1 and no auxiliary phase field is needed.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): §4.3, (24)–(30), Claim 1. The exact CRT identity is retained; subsum asymptotics are expressed as differences, avoiding cancellation errors.


<a id="habironahmseries-hb-4-radial-analytic-remainder-comparison"></a>

### The analytic all-orders radial theorem with explicit constants

**Theorem** · `HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

The analytic component of the parent radial-asymptotic-expansion holds in the strong, cancellation-safe sense: for every K≥0, e^{−Λ/(mε)}f_{A,B,0}(a/m+iε/(2πm))−∑_{j<K}a_j ε^j=O(ε^K). The coefficients are exactly those of χ_{a,m}^N m^{−N/2}c(Q)G(Q,a/m)S_{Q,ζ}(ε), with c(Q)=(det H)^{−1/2}∏θ_i^{B_i}(1−z_i)^{1/2−1/m}, S and I as in the parent corrected formula, and χ_{a,m}=m^{−1/2}exp[(1/m)∑_{t=1}^{m−1}t Log(1−ζ^t)]=exp(πi s(a,m)). The I integrand is exp[−B·x√ε/m−Nε/(24m)+∑ψ], and the Gaussian is exp(−xᵀHx/(2m)). All roots of positive real numbers and √det H are positive; cyclic-dilogarithm roots are defined by the weighted factor logarithms. For C≠0 multiply the coefficient series by exp(2πiaC/m) exp(−Cε/m). This theorem is solely radial ε→0+; it has no sectorial, minor-arc or arbitrary knot-matrix conclusion.

**Hypotheses and conventions.** As in the parent corrected radial target: A is rational symmetric positive definite, B rational, C=0, m≥1 odd, ζ=exp(2πia/m) primitive, and m is coprime to a denominator d of Q. Take a compatible strong denominator D with gcd(m,D)=1.

**Proof route.**

1. Use the corrected Euler reciprocal expansion, compact local expansion, global tail bound, and CRT theorem. Their bounds are uniform at each fixed order, which permits finite sums and lattice summation.
2. Combine (ε/2π)^{N/2}, the lattice factor m^{−N}ε^{−N/2}, and Gaussian integral (2πm)^{N/2}(det H)^{−1/2}. This gives exactly m^{−N/2}(det H)^{−1/2}.
3. Integrate each polynomial with the imported formal Gaussian bracket. Odd polynomial terms vanish and even terms give the ε-series. The analytic proof never invokes Kummer invariance; its field-of-definition assertion is separated below.

**Direct inputs.** [HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity](#habironahmseries-hb-4-euler-function-at-a-root-of-unity), [HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface](#habironahmseries-hb-4-cyclic-dilogarithm-interface), [HabiroNahmSeries:HB.4/uniform-local-saddle-remainder](#habironahmseries-hb-4-uniform-local-saddle-remainder), [HabiroNahmSeries:HB.4/cancellation-safe-congruence-remainder](#habironahmseries-hb-4-cancellation-safe-congruence-remainder), [HabiroNahmSeries:HB.4/poisson-covolume-comparison](#habironahmseries-hb-4-poisson-covolume-comparison), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- For m=1,A=(2),B=0, z=(√5−1)/2, a₀=[H(1−z)]^{−1/2} and a₁=−a₀/60.
- The root a=2,m=3 uses the Dedekind phase for 2/3, not the printed phase for 1/3.
- G=0 makes every a_j zero; the strong remainder remains meaningful.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): Theorem 3.1, (17)–(20), §4.2 (21)–(23), §4.3 (36). Imports the exact corrected parent formula, while strengthening the proof’s analytic estimates. [cgz-published](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf): §7.1, Theorem 7.1 and Remark 7.3, p. 419. The printed warning about possible vanishing is respected.


<a id="habironahmseries-hb-4-coherent-radical-coefficient-fields"></a>

### Coherent radical fields for the expansion coefficients

**Construction** · `HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields` · [packet](../packets/HabiroNahmSeries--HB.4.json)

The field definitions are total for real coordinates; their expansion uses require d,m≥1, gcd(d,m)=1, z∈(0,1)^N and ζ primitive of order m. Put y_i=z_i^{1/d}>0, η_i=z_i^{1/(dm)}>0 and θ_i=η_i^d=z_i^{1/m}. Construct E=Q(y_1,…,y_N,ζ) and H_rad=E(η_1,…,η_N) as Mathlib IntermediateField.adjoin inside C. If dA and dB are integral, every θ_i^{A_ij} means η_i^{dA_ij}, and θ_i^{B_i} means η_i^{dB_i}; this fixes the algebraic branches of the analytic positive powers. One has H_rad=E(θ_i), since Bezout dα+mβ=1 gives η_i=θ_i^αy_i^β. It is a finite Kummer extension of E; not every vector of root multipliers need define an automorphism. For the Gauss factor of rational Q also use K=E(ζ_D), D a strong denominator of Q chosen compatibly with the CRT split. Neither E=Q(z,ζ) nor K=E is asserted.

**Proof route.**

1. Use the imported positive root lift and Real.rpow identities for the positive embedding. Adjoin the displayed generators with the existing intermediate-field constructor.
2. Prove η_i^m=y_i and θ_i^m=z_i. All generators are nonzero; Bezout gives the equality of radical fields without a new root choice. The finite set of η_i is integral over E, satisfying X^m−y_i. H_rad contains all roots ζ^sη_i of these polynomials, so it is normal; characteristic zero gives separability.
3. An E-automorphism sends η_i to ζ^{s_i}η_i and θ_i to ζ^{ds_i}θ_i, subject to all algebraic relations. Gaussian coefficients use H⁻¹ with entries in E; the finite congruence weights and negative-index polylogarithms are rational expressions in H_rad.

**Direct inputs.** [HabiroNahmSeries:HB.3/positive-coherent-root-lift](#habironahmseries-hb-3-positive-coherent-root-lift), `mathlib:IntermediateField.adjoin`, `mathlib:IsPrimitiveRoot`, [HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting](#habironahmseries-hb-4-gauss-sum-and-congruence-splitting), `mathlib:IntermediateField.adjoin_le_iff`, `mathlib:IntermediateField.finiteDimensional_adjoin`, `mathlib:IsPrimitiveRoot.eq_pow_of_pow_eq_one`, `mathlib:IntermediateField.inclusion`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `radialBaseField_eq_adjoin` | characterisation | radialBaseField(d,z,ζ)=IntermediateField.adjoin Q ({z_i^(1/d)}∪{ζ}), where all real powers are cast to C. |
| `radialKummerField_eq_adjoin` | characterisation | radialKummerField(d,m,z,ζ)=IntermediateField.adjoin Q ({z_i^(1/d)}∪{ζ}∪{z_i^(1/(dm))}). |
| `radialBaseField.root_mem` | projection | The positive d-th root of each z_i and ζ belong to radialBaseField(d,z,ζ). |
| `radialKummerField.base_le` | structure | radialBaseField(d,z,ζ)≤radialKummerField(d,m,z,ζ). |
| `radialKummerField.radical_mem` | projection | The positive (dm)-th root of every z_i belongs to radialKummerField(d,m,z,ζ). |
| `radialKummerField.theta_mem` | compatibility | For d,m>0 and positive z_i, the positive m-th roots belong to radialKummerField(d,m,z,ζ). |
| `radialKummerField.eq_theta_adjoin` | characterisation | If d,m>0 and coprime and z_i>0, radialKummerField equals Q(y_i,ζ,θ_i), with positive powers interpreted inside C. |
| `radialBaseField_le_iff` | universal-property | For any intermediate field L⊆C over Q, radialBaseField(d,z,ζ)≤L iff ζ∈L and every real d-th-root coordinate belongs to L. This is the minimal generated field, including for the total definitions. |
| `radialKummerField_le_iff` | universal-property | For any intermediate field L⊆C over Q, radialKummerField(d,m,z,ζ)≤L iff radialBaseField(d,z,ζ)≤L and all real (dm)-th-root coordinates belong to L. |
| `radialKummerField.radical_pow` | relation | If d,m>0 and z_i>0, η_i^m=y_i and η_i^d=θ_i, as equalities in C, using the specified positive real roots. |
| `radialKummerField.finite_galois` | structure | For d,m>0, positive coordinates and ζ primitive of order m, the inclusion E≤H_rad equips H_rad with a finite-dimensional Galois E-algebra structure. Coprimality of d,m is needed for the alternate θ generators, not for this fact. |
| `radialKummerField.automorphism_radical` | functoriality | For d,m>0, positive coordinates and ζ primitive of order m, every ring automorphism σ of H_rad fixing each element in E sends each η_i to ζ^{s_i}η_i for some s_i∈Z/mZ. The radical-power relation then gives σ(θ_i)=ζ^{ds_i}θ_i. This describes actual automorphisms and does not assert that every vector s defines one. |

**Discriminating tests.**

- **`radialFields_order_one`** (degenerate): For m=1 and d>0, radialKummerField(d,1,z,1)=radialBaseField(d,z,1).
- **`radialFields_integral_case`** (compatibility): For d=m=1, both fields equal IntermediateField.adjoin Q {z_i}.
- **`radialFields_trivial_coordinates`** (computation): If z_i=1 for every i and d,m>0, both fields equal Q(ζ).
- **`radialFields_nontrivial_radical`** (non-example): For rank one, d=2,m=3,z=1/4 and ζ=exp(2πi/3), radialBaseField is strictly smaller than radialKummerField; the latter contains the positive cube root of 1/2.

**Acceptance.**

- At d=m=1,ζ=1 both fields are Q(z).
- At m=1 the radical extension is trivial even when d>1.
- For d=2,m=3,z=1/4, E=Q(ζ₃) while H_rad adjoins the positive cube root of 1/2 and is a genuine extension.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): Theorem 3.1, (20); §3 rational-power convention. Makes the printed field Q(z^(1/d),ζ) and its coherent m-th roots explicit.


<a id="habironahmseries-hb-4-coefficientwise-kummer-descent-interface"></a>

### The precise all-orders Kummer descent interface

**Theorem** · `HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface` · [packet](../packets/HabiroNahmSeries--HB.4.json)

With the coherent E,H_rad above, d clearing A,B,Q and m odd coprime to d, take the parent corrected finite sum T(η,ε) and C(θ)=∏_iD_ζ(ζθ_i). Each coefficient of T lies in H_rad. The exact missing assertion is σ(C(θ)^{−1}T(η,ε)^m)=C(θ)^{−1}T(η,ε)^m coefficientwise for every σ∈Aut_E(H_rad), with σ(η_i)=ζ^{s_i}η_i and σ(θ_i)=ζ^{ds_i}θ_i. It implies S(ε)^m∈E[[ε]]. This node specifies the parent field target with coherent rational powers; a proof of the displayed automorphism identity has not been established in the sources read and remains the named gap, not an inference from its constant term.

**Proof route.**

1. Negative-index polylogarithms, Bernoulli coefficients and Gaussian moments show T_p∈H_rad coefficientwise, using coherent η rather than unspecified θ^(1/d).
2. The required proof must combine the cyclic-dilogarithm transformation with reindexing the finite congruence sum and a formal Gaussian translation that transforms the complete exp(∑ψ) integrand. Reindexing the constant prefactors alone does not prove an all-orders identity.
3. Once the exact identity is proved, finite Kummer Galois fixed-field descent over E puts every coefficient in E. The parent lemma’s proposed reindexing is the starting interface, not evidence that this step has already been discharged.

**Direct inputs.** [HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields](#habironahmseries-hb-4-coherent-radical-coefficient-fields), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `mathlib:PowerSeries.coeff`, `mathlib:IsGalois.mem_range_algebraMap_iff_fixed`.

**Acceptance.**

- For m=1 no root automorphism remains, so coefficient descent follows directly from Gaussian moments.
- The first two coefficient orders are separate checks, not a replacement for the identity at arbitrary p.
- The proof must act on η_i, sending θ_i to ζ^{ds_i}θ_i; treating θ_i→ζθ_i while leaving its rational powers fixed is invalid.

**Sources.** [gz-published](https://d-nb.info/1217648526/34): Theorem 3.1, (20), and §4.3 entire proof. The field claim is stated, but the analytic proof ends at (36) without the coefficientwise invariance argument.


<a id="habironahmseries-hb-4-cgz-normalization-and-field-comparison"></a>

### CGZ normalization with separated coefficient and Gauss fields

**Comparison** · `HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Choose d clearing A,B,Q and odd m coprime to d. For the corrected radial series put ω=m^{−N/2}(det H)^{−1/2}∏(1−z_i)^{1/2}>0, μ_{a,m}=χ_{a,m}^N and Φ=G(Q,a/m)∏θ_i^{B_i}(1−z_i)^{−1/m}S. Then ω²∈Q(z)^× and f_{A,B,0}(τ)=μ_{a,m}ωe^{Λ/(mε)}(Φ_{<K}(ε)+O(ε^K)) for every K. Conditional on the exact Kummer identity, Φ^m∈K[[ε]], K=Q(z_i^{1/d},ζ,ζ_D); for integral A with even diagonal and integral B, take d=D=1 and K=Q(z,ζ). Integer-valued Q with half-integral B still requires the B-root field for this displayed normalization. The full arithmetic CGZ package additionally requires the constant Kummer class [Φ(0)^m]=[P_ζ(β)D_ζ(1)^N]^{−1}, interpreted in H_G^×/H_G^{×m}, H_G=K(η_i), and only when Φ(0)≠0. The separate χ_cyc^{−1} eigenspace target is [Φ(0)^m]∈(K^×/K^{×m})^{χ_cyc^{−1}}, where F_G=Q(y_i,ζ_D), K=F_G(ζ), and χ_cyc:Aut_{F_G}(K)→(Z/mZ)^× is defined by σ(ζ)=ζ^{χ_cyc(σ)}. These are requested arithmetic comparisons, not conclusions of the analytic proof. For arbitrary rational Q the compatible Bloch class is β=∑[z_i] over Q(z_i^{1/d}), not an unverified integral class over Q(z_i). The rational-data Kummer-class/eigenspace comparison with the Gauss factor is a separate recorded gap. No root of a quotient class is presented as a chosen element.

**Proof route.**

1. Factor c(Q) into the positive ω and ∏θ_i^{B_i}(1−z_i)^{−1/m}. The analytic statement is purely algebraic rearrangement of the radial theorem.
2. Raise Φ to m. The rational powers become z_i^{B_i}∈Q(y), the (1−z) factors are in E and G is in Q(ζ_D). The coefficient claim follows from the separate descent identity in exactly K.
3. Import the cyclic near-unit map, coherent integral Bloch class, and the parent simplified theorem only for the arithmetic comparison under its required compatibility. The published CGZ (46) must be read as a Kummer-class statement. Its fixed μ is not used as a universal phase for all numerators a. Extend β from F₀=Q(y_i) to F_G when using R_ζ over that base; its coprimality hypothesis is gcd(m,w_{F_G})=1, where w counts roots of unity before adjoining ζ.

**Direct inputs.** [HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison](#habironahmseries-hb-4-radial-analytic-remainder-comparison), [HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface](#habironahmseries-hb-4-coefficientwise-kummer-descent-interface), [HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields](#habironahmseries-hb-4-coherent-radical-coefficient-fields), [HabiroNahmSeries:HB.3/coherent-root-exterior-boundary](#habironahmseries-hb-3-coherent-root-exterior-boundary), `HabiroNumberFields:HB.2/kummer-value-P`.

**Acceptance.**

- For A=(2),B=0, d=D=1, Φ^m is targeted in Q(z,ζ).
- For A=(1),B=1/4,m=1 the leading coefficient is 2^(−1/4), whose square is not in F=Q(z)=Q. The coherent root field is necessary; for integer-valued Q with B=1/2 the displayed Φ₀ is √2 rather than rational.
- For A=(1),B=0,m=3, G=0 and Φ=0; no multiplicative class is formed.
- For rational A,B the Gauss-value extension is explicit, rather than absorbed into a scalar whose square is claimed to lie in Q(z).

**Sources.** [cgz-published](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf): Theorem 7.1, (45)–(46), p. 419. The simplified theorem is reconciled with GZ and the coherent-root field from HB.3. [gz-published](https://d-nb.info/1217648526/34): Theorem 3.1, (15), (17)–(20). Keeps the Gauss factor and Dedekind phase that the simplified printed form suppresses.


<a id="habironahmseries-hb-4-nonzero-unit-series-descent-comparison"></a>

### Unit descent and the nonzero constant-term condition

**Comparison** · `HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Let K⊆L be characteristic-zero fields, m≥1, Φ∈L[[ε]] with Φ₀≠0 and Φ^m∈K[[ε]]. Then U=Φ/Φ₀ belongs to K[[ε]]: it is the unique series with U₀=1 and U^m=Φ^m/Φ₀^m. If a representative ε_β∈K^× of R_ζ(β) and a chosen compatible m-th root satisfy ε_β^{1/m}Φ₀∈K^×, then ε_β^{1/m}Φ∈K[[ε]]. Apply this to the radial coefficients only after the preceding arithmetic comparison and the supplier hypotheses (including gcd(m,w_F)=1 where R_ζ is constructed over F with K=F(ζ); in the Gauss-enlarged application take F=F_G=Q(y_i,ζ_D)). If Φ₀=0, neither normalization nor this corollary is asserted; the analytic remainder theorem still applies.

**Proof route.**

1. Compare successive coefficients of U^m. At order p the new coefficient is mU_p plus a polynomial in preceding coefficients; characteristic zero allows division by m and inductively puts U_p in K.
2. The same recursion proves uniqueness of a root with constant term one. It does not require analytic convergence of the formal series.
3. For the near-unit corollary, multiply the descended U by the given scalar in K. The scalar membership is exactly the arithmetic constant-term comparison, not a conclusion of the recursion alone.

**Direct inputs.** [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison), `mathlib:PowerSeries.coeff`, `HabiroNumberFields:HB.2/the-map-R-zeta`.

**Acceptance.**

- m=1 is immediate.
- For Φ=0 the radial theorem is valid but U is not defined.
- Φ₀≠0 is required; Φ=ε with zero constant cannot be normalized by Φ₀.

**Sources.** [cgz-published](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf): Corollary 7.2 and its proof; Remark 7.3, p. 419. Makes the formal-root induction and the exact nonvanishing hypothesis explicit.


<a id="habironahmseries-hb-4-andrews-gordon-owner-and-acceptance-comparison"></a>

### Andrews–Gordon suppliers and radial acceptance cases

**Comparison** · `HabiroNahmSeries:HB.4/andrews-gordon-owner-and-acceptance-comparison` · [packet](../packets/HabiroNahmSeries--HB.4.json)

Use the existing QM.0/andrews-gordon-identities and QM.0/andrews-gordon-nahm-form, not a new identity in HB.4. For odd n=2r+3, A_ij=2min(i,j), B=0, the product excludes k≡0,±(r+1) mod n (equivalently 2k≡0,±1). The distinguished solution is (X₂,…,X_{r+1}), X_j=1−[sin(π/n)/sin(πj/n)]². With the requested Rogers trigonometric identity, Λ=(n−3)π²/(6n). The parent radial constant and acceptance nodes supply the phase e(n/24−1/8+1/(12n)−1/(4n²)) at ζ=e(1/n). The general Andrews–Gordon source gap is resolved by the existing supplier; the Rogers circle-valued and trigonometric identity request remains with Polylogarithms:P.1.

**Proof route.**

1. Compare the quadratic form with the supplier’s min(i,j) Nahm form; its tail-sum convention and reversed coordinates account for the ±(r+1) product classes at B=0.
2. Check the trigonometric tuple against the Nahm equation; X₁=0 cannot be a coordinate of the positive distinguished solution. The ordered tuple X₂,…,X_{r+1} passes already in rank two.
3. Combine the product identity and eta-theta radial expansion as in the parent acceptance theorem. Import the Rogers dilogarithm identity from its owner to identify Λ; do not replan the real regulator here.

**Direct inputs.** `QSeriesPartitionsAndMockModularForms:QM.0/andrews-gordon-identities`, `QSeriesPartitionsAndMockModularForms:QM.0/andrews-gordon-nahm-form`, [HabiroNahmSeries:HB.4/andrews-gordon-radial-constant](#habironahmseries-hb-4-andrews-gordon-radial-constant), [HabiroNahmSeries:HB.4/acceptance-andrews-gordon](#habironahmseries-hb-4-acceptance-andrews-gordon), `Polylogarithms:P.1`.

**Acceptance.**

- r=1,n=5 recovers the first Rogers–Ramanujan identity and Λ=π²/15.
- r=2,n=7 checks the tuple ordering for A=((2,2),(2,4)).
- r=0,n=3 gives the empty sum 1 and Λ=0.

**Sources.** [cgz-published](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf): §7.2, (47) and proof of Theorem 7.4, pp. 420–422. Imports the identity from its existing q-series owner and retains the parent coordinate correction. [zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf): II.2C, pp. 39–41, especially the final identity on p. 41. Supplies the precise trigonometric Rogers identity requested from Polylogarithms:P.1; the Gaussian/Poisson proof is cited separately by its analytic nodes.


## HB.5a — Modular functions at finite-index cusps

This interface works for any finite-index subgroup of SL₂(ℤ). Existing arithmetic-subgroup, cusp, period and meromorphic-order carriers are imported. A cusp b/d has a Bezout scaling matrix; a period gives a local parameter q_h=e(τ/h). The finite Laurent principal part gives the uniform growth statement, including the nonradial path needed when a modular transformation converts a radial root approach to an approach to 1.

Classical width and strict translation-orbit width differ when −I is absent. Likewise total meromorphic functions form the required subalgebra, not a field before quotienting junk values at poles. The weakly holomorphic specialization already belongs to QM.3. The handoff retains the owner-overlap proposal and the exact four facts consumed by the Nahm argument; it does not re-plan existing Tau Ceti subgroup or cusp arithmetic.


<a id="habironahmseries-hb-5a-finite-index-subgroups"></a>

### Finite-index subgroups of SL(2,Z), with no congruence assumption: the pinned Mathlib API

**Comparison** · `HabiroNahmSeries:HB.5a/finite-index-subgroups` · [packet](../packets/HabiroNahmSeries.json)

The groups of this layer are subgroups Gamma of SL(2,Z) with Mathlib's class Subgroup.FiniteIndex; no congruence predicate (CongruenceSubgroup.IsCongruenceSubgroup) appears in any statement. Nothing new is defined: Mathlib's coercion to GL(2,R) makes Gamma arithmetic exactly when it has finite index (Subgroup.isArithmetic_iff_finiteIndex, with the instance for finite-index Gamma); intersections of finite-index subgroups have finite index (the FiniteIndex instance for an infimum, Subgroup.index_inf_le, and Subgroup.IsArithmetic.inter in GL(2,R)); Gamma(M) has finite index (CongruenceSubgroup.instFiniteIndexGamma) and is described by congruences on its entries (CongruenceSubgroup.Gamma_mem); a finite-index subgroup contains a positive power of every element, of index at most the index (Subgroup.exists_pow_mem_of_index_ne_zero); whether -1 lies in Gamma is the proposition -1 in Gamma, and Mathlib's Subgroup.adjoinNegOne and IsRegularAtInfty handle the difference.

**Hypotheses and conventions.** Gamma is a subgroup of SL(2,Z) with [SL(2,Z) : Gamma] finite. The congruence subgroups Gamma(M) enter only through the intersection Gamma with Gamma(M) in HB.5/excluded-primes-and-hypotheses.

**Proof route.**

1. Cite the Mathlib declarations listed in the statement; no new declaration is needed.

**Direct inputs.** `mathlib:Subgroup.IsArithmetic`, `mathlib:Subgroup.isArithmetic_iff_finiteIndex`, `mathlib:Subgroup.IsArithmetic.inter`, `mathlib:Subgroup.index_inf_le`, `mathlib:CongruenceSubgroup.instFiniteIndexGamma`, `mathlib:CongruenceSubgroup.Gamma_mem`, `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`, `mathlib:UpperHalfPlane`, `mathlib:SlashAction`.

**Acceptance.**

- SL(2,Z) itself: index 1 (Subgroup.index_top).
- Gamma(2) has index 6 and Gamma(3) has index 24 (the order of SL(2, Z/NZ), since reduction is surjective); both have finite index by CongruenceSubgroup.instFiniteIndexGamma.
- [SL(2,Z) : Gamma intersected with Gamma(M)] <= [SL(2,Z) : Gamma] [SL(2,Z) : Gamma(M)] (Subgroup.index_inf_le).
- CGZ Remark 7.6 records that the non-congruence generality is deliberate; by Calegari-Dimitrov-Tang (J. Amer. Math. Soc. 38 (2025), Theorem 1.0.1) a modular Nahm sum is in fact modular for a congruence subgroup, a fact no statement here uses.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, the abuse of terminology, printed p. 35. The generality that the whole layer exists to support, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Remark 7.6, printed p. 41. The source explains why it avoids the congruence hypothesis and what is expected instead; the expectation is a conjecture and is not used.


<a id="habironahmseries-hb-5a-cusps-and-scaling-matrices"></a>

### Rational cusps and scaling matrices

**Construction** · `HabiroNahmSeries:HB.5a/cusps-and-scaling-matrices` · [packet](../packets/HabiroNahmSeries.json)

The cusps of a finite-index Gamma are the points of P^1(Q) (Mathlib: Subgroup.IsArithmetic.isCusp_iff_isCusp_SL2Z with isCusp_SL2Z_iff), each is g(infinity) for some g in SL(2,Z) (isCusp_SL2Z_iff'), and there are finitely many Gamma-orbits (Mathlib's Finite instance on CuspOrbits for arithmetic subgroups, via surjective_cosetToCuspOrbit). The layer adds only: (a) the explicit scaling matrix of a cusp b/d in lowest terms, an element (b beta; d delta) of SL(2,Z) obtained from a Bezout relation; (b) two elements g, g' of SL(2,Z) with g(infinity) = g'(infinity) satisfy g' = g (+-T^k) for some integer k; (c) for weight zero, a statement about f|g at i infinity that is invariant under f -> f|(+-T^k) does not depend on the scaling matrix, following Mathlib's pattern OnePoint.IsBoundedAt / OnePoint.isBoundedAt_iff, which quantifies over all g with g(infinity) = c.

**Hypotheses and conventions.** Gamma has finite index in SL(2,Z); c = b/d in lowest terms with d > 0, or c = infinity. Everything is stated for the action of SL(2,Z) on P^1(Q) and on the upper half-plane; no modular curve is constructed.

**Proof route.**

1. Cite the Mathlib declarations for the cusp set, the existence of scaling matrices and the finiteness of the orbit set.
2. (a): from gcd(b, d) = 1 pick delta, beta with b delta - beta d = 1 (IsCoprime.exists_SL2_col in Mathlib is the same construction).
3. (b): g^{-1} g' fixes infinity, so its lower-left entry is 0 (smul_infty_eq_self_iff) and, having determinant 1 over Z, it is +-T^k.
4. (c): immediate from (b), exactly as Mathlib's OnePoint.isBoundedAt_iff.

**Direct inputs.** [HabiroNahmSeries:HB.5a/finite-index-subgroups](#habironahmseries-hb-5a-finite-index-subgroups), `mathlib:IsCusp`, `mathlib:Subgroup.IsArithmetic.isCusp_iff_isCusp_SL2Z`, `mathlib:isCusp_SL2Z_iff`, `mathlib:isCusp_SL2Z_iff'`, `mathlib:CuspOrbits`, `mathlib:surjective_cosetToCuspOrbit`, `mathlib:OnePoint.exists_mem_SL2`, `mathlib:OnePoint.IsBoundedAt`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `scalingMatrixOfCoprime` | constructor | For coprime integers b, d, an element of SL(2,Z) with first column (b, d). |
| `scalingMatrixOfCoprime_smul_infty` | characterisation | scalingMatrixOfCoprime b d sends infinity to b/d. |
| `eq_mul_T_zpow_of_smul_infty_eq` | characterisation | If g(infinity) = g'(infinity) for g, g' in SL(2,Z), then g' = g T^k or g' = -g T^k for some integer k. |
| `slash_mul_T_zpow_weight_zero` | simp | For weight zero, (f\|(g (+-T^k)))(tau) = (f\|g)(tau + k). |

**Discriminating tests.**

- **`one_smul_infty`** (degenerate): The identity sends infinity to infinity, so it is a scaling matrix for infinity.
- **`S_smul_infty`** (computation): S = (0 -1; 1 0) sends infinity to 0.
- **`scalingMatrix_two_five`** (computation): (2 1; 5 3) is in SL(2,Z) and sends infinity to 2/5.
- **`card_cuspOrbits_Gamma_two`** (computation): The number of cusp orbits of Gamma(2) is 3.
- **`scalingMatrix_not_unique`** (non-example): T and the identity are distinct scaling matrices of infinity, so a definition asserting uniqueness of the scaling matrix is wrong; only uniqueness up to +-T^k holds.

**Acceptance.**

- The identity is a scaling matrix for infinity; S = (0 -1; 1 0) is one for 0.
- For b/d = 2/5 the scaling matrix (2 1; 5 3) is used in the acceptance test of HB.5a/radial-growth-at-a-cusp, where the phase depends on its lower-right entry 3.
- Gamma(2) has exactly three cusp orbits, represented by infinity, 0 and 1.
- The matrix in the proof of CGZ Theorem 7.5 is gamma in Gamma with gamma(0) = b/d; the corresponding scaling matrix of b/d is gamma S = (b -a; d -c).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The only use the Nahm application makes of this construction: the element gamma of Gamma supplies the cusp b/d and the scaling data, and the radial parameter is transported accordingly.


<a id="habironahmseries-hb-5a-cusp-width"></a>

### The width of a cusp

**Definition** · `HabiroNahmSeries:HB.5a/cusp-width` · [packet](../packets/HabiroNahmSeries.json)

For a finite-index subgroup Gamma of SL(2,Z) and g in SL(2,Z), the width of Gamma at the cusp g(infinity) is w(Gamma, g) = the least positive integer w such that g T^w g^{-1} or -g T^w g^{-1} lies in Gamma (the classical width; it is Mathlib's Subgroup.widthInfty of the conjugate g^{-1} Gamma g, viewed in GL(2,R)). It depends only on the Gamma-orbit of the cusp and is unchanged when g is replaced by g (+-T^k). The strict width (the least w with g T^w g^{-1} in Gamma, Mathlib's strictWidthInfty of the conjugate, and the period of the T-action on the coset of g, Tau Ceti's cuspTranslationOrbitWidth) is w or 2 w, and equals w when -1 lies in Gamma. The sum of the classical widths over the Gamma-orbits of cusps is [SL(2,Z) : +-Gamma] = [PSL(2,Z) : image of Gamma]; the sum of the strict widths over Tau Ceti's translation orbits (T-orbits on the coset space, of which a cusp contributes one or two) is [SL(2,Z) : Gamma]. The sum of widths over the cusps is NOT the index in general: for Gamma(3) the four cusps have width 3 and the index is 24.

**Hypotheses and conventions.** Gamma has finite index; g is any element of SL(2,Z); T = (1 1; 0 1). For weight zero the classical width is a period of f|g for every Gamma-invariant f, since -1 acts trivially; it gives the finest local parameter q = e(tau/w). The ratio (order at the cusp)/(period used) does not depend on which period is used, so the growth rates of HB.5a/radial-growth-at-a-cusp are insensitive to the factor two.

**Proof route.**

1. Existence and positivity: some positive power of T lies in the finite-index group g^{-1} Gamma g (Mathlib Subgroup.exists_pow_mem_of_index_ne_zero); take the least.
2. Identify w with Mathlib's widthInfty of the conjugate subgroup, and the strict width with strictWidthInfty; Mathlib's relIndex_strictPeriods gives the factor 1 or 2 and strictPeriods_eq_periods_of_neg_one_mem the case -1 in Gamma.
3. Invariance under g -> gamma g (gamma in Gamma) and g -> g (+-T^k): conjugation.
4. Identify the strict width with Tau Ceti's cuspTranslationOrbitWidth of the T-orbit of the coset of g^{-1} (TauCeti.ModularForm.minimalPeriod_TSL_dvd_iff) and quote TauCeti.ModularForm.sum_cuspTranslationOrbitWidth for the index formula over translation orbits.
5. For the formula over cusps, group the translation orbits in pairs according as the cusp is regular with -1 not in Gamma (two orbits of strict width w) or irregular (one orbit of strict width 2 w).

**Direct inputs.** [HabiroNahmSeries:HB.5a/cusps-and-scaling-matrices](#habironahmseries-hb-5a-cusps-and-scaling-matrices), [HabiroNahmSeries:HB.5a/finite-index-subgroups](#habironahmseries-hb-5a-finite-index-subgroups), `mathlib:Subgroup.widthInfty`, `mathlib:Subgroup.strictWidthInfty`, `mathlib:Subgroup.relIndex_strictPeriods`, `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`, `tauceti:TauCeti.ModularForm.cuspTranslationOrbitWidth`, `tauceti:TauCeti.ModularForm.sum_cuspTranslationOrbitWidth`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `cuspWidth` | data | w(Gamma, g), the least positive w with g T^w g^{-1} or -g T^w g^{-1} in Gamma. |
| `cuspWidth_pos` | characterisation | 0 < w(Gamma, g). |
| `cuspWidth_spec` | characterisation | g T^n g^{-1} or -g T^n g^{-1} lies in Gamma iff w(Gamma, g) divides n. |
| `cuspWidth_mul_T_zpow` | simp | w(Gamma, g T^k) = w(Gamma, g) and w(Gamma, -g) = w(Gamma, g). |
| `cuspWidth_mem_mul` | simp | w(Gamma, gamma g) = w(Gamma, g) for gamma in Gamma. |
| `cuspWidth_eq_widthInfty` | compatibility | (w(Gamma, g) : R) = Subgroup.widthInfty of the conjugate g^{-1} Gamma g in GL(2,R). |
| `strictWidth_eq_cuspWidth_or_two_mul` | compatibility | The strict width (Mathlib strictWidthInfty of the conjugate, Tau Ceti cuspTranslationOrbitWidth) is w or 2 w, and is w when -1 is in Gamma. |
| `sum_cuspWidth_eq_index_adjoinNegOne` | characterisation | The sum of w over the Gamma-orbits of cusps is the index of the group generated by Gamma and -1. |

**Discriminating tests.**

- **`cuspWidth_top`** (degenerate): w(SL(2,Z), g) = 1 for every g.
- **`cuspWidth_Gamma`** (computation): w(Gamma(M), g) = M for every M >= 1 and every g.
- **`cuspWidth_Gamma0_prime`** (computation): For a prime p, w(Gamma_0(p), 1) = 1 and w(Gamma_0(p), S) = p.
- **`cuspWidth_eq_widthInfty_Gamma0`** (compatibility): w(Gamma_0(N), 1) equals Mathlib's strictWidthInfty (Gamma_0(N)) = 1.
- **`sum_cuspWidth_Gamma_three_ne_index`** (non-example): For Gamma(3) the widths of the four cusps sum to 12 while [SL(2,Z) : Gamma(3)] = 24; a definition claiming that the widths over cusp orbits sum to the index is wrong when -1 is not in Gamma.

**Acceptance.**

- Gamma = SL(2,Z): every cusp has width 1 (Mathlib strictWidthInfty_SL2Z).
- Gamma(M), M >= 1: every cusp has width M (Gamma(M) is normal, so this is Mathlib's strictWidthInfty_Gamma at infinity).
- Gamma_0(p): widths 1 at infinity (Mathlib strictWidthInfty_Gamma0) and p at 0; -1 is in Gamma_0(p), and 1 + p = p + 1 is the index.
- Gamma(3): -1 is not in Gamma(3), 4 cusps of width 3, sum 12; 8 translation orbits of strict width 3, sum 24 = [SL(2,Z) : Gamma(3)] (checked by enumerating SL(2, Z/3Z)).

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 7, before Proposition 7.1, p. 13. The only use either source makes of the width: expansions at a cusp in rational powers of q, whose denominators are the widths.


<a id="habironahmseries-hb-5a-modular-function-of-finite-index"></a>

### Weight-zero meromorphic modular functions

**Definition** · `HabiroNahmSeries:HB.5a/modular-function-of-finite-index` · [packet](../packets/HabiroNahmSeries.json)

A modular function for a finite-index Gamma in SL(2,Z) is a function f from the upper half-plane to C such that (i) f|_0 gamma = f for all gamma in Gamma; (ii) f composed with UpperHalfPlane.ofComplex is meromorphic at every point of the open upper half-plane (Mathlib MeromorphicOn); (iii) f is meromorphic at every cusp: for every g in SL(2,Z) and every h > 0 that is a period of f|_0 g, the cusp function F = Function.Periodic.cuspFunction h ((f|_0 g) o ofComplex) is meromorphic at 0 (Mathlib MeromorphicAt), i.e. f|_0 g has a Laurent expansion in q_h = e(tau/h) with finitely many negative powers. As with every meromorphic function in Mathlib, f is a total function whose values at poles are junk. The modular functions form a C-subalgebra of the functions on the upper half-plane (NOT a field: f * f^{-1} differs from 1 at the zeros and poles of f; the field of modular functions is the quotient by equality off a discrete set, and no consumer needs it). The weakly holomorphic ones (holomorphic on the upper half-plane) are exactly the weight-zero case of QSeriesPartitionsAndMockModularForms QM.3/weakly-holomorphic-modular-form, and Nahm sums are of this kind.

**Hypotheses and conventions.** Gamma has finite index; the weight-zero slash action by g in SL(2,Z) is composition with the Moebius action (Mathlib ModularForm.SL_slash_apply). Condition (iii) for one period h implies it for all periods (the cusp functions for h and m h are related by F_{mh}(q) = F_h(q^m)), and for one g in a coset gamma g (+-T^k) it implies it for all; so it is a condition on the cusp. Finite principal part excludes essential singularities at the cusps, such as exp(j) at infinity.

**Proof route.**

1. Bundle the three conditions in a structure over Mathlib's SlashInvariantForm Gamma 0 (a structure with fields, not a placeholder proposition).
2. Prove independence of (iii) from the period and from the representative g (HB.5a/cusps-and-scaling-matrices (b)).
3. Prove closure under constants, sums, products and scalar multiples (Mathlib's MeromorphicAt.add, .mul and the corresponding cusp-function identities).
4. Prove the compatibilities: a weight-zero Mathlib ModularForm is a modular function, and is constant (Mathlib ModularForm.eq_const_of_weight_zero); an element of QM.3's weight-zero weakly holomorphic space is a modular function.

**Direct inputs.** [HabiroNahmSeries:HB.5a/cusp-width](#habironahmseries-hb-5a-cusp-width), [HabiroNahmSeries:HB.5a/cusps-and-scaling-matrices](#habironahmseries-hb-5a-cusps-and-scaling-matrices), `mathlib:SlashInvariantForm`, `mathlib:MeromorphicAt`, `mathlib:MeromorphicOn`, `mathlib:UpperHalfPlane.ofComplex`, `mathlib:Function.Periodic.cuspFunction`, `mathlib:Function.Periodic.qParam`, `mathlib:ModularForm.eq_const_of_weight_zero`, `mathlib:ModularForm.SL_slash_apply`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `ModularFunction` | structure | Functions on the upper half-plane, weight-zero Gamma-invariant, meromorphic on the upper half-plane and at every cusp. |
| `ModularFunction.slash_eq` | projection | f\|_0 gamma = f for gamma in Gamma. |
| `ModularFunction.meromorphicOn` | projection | f o ofComplex is meromorphic on the open upper half-plane. |
| `ModularFunction.meromorphicAt_cuspFunction` | projection | For every g and every period h > 0 of f\|_0 g, the cusp function of f\|_0 g for h is meromorphic at 0. |
| `ModularFunction.ext` | extensionality | Two modular functions with the same underlying function are equal. |
| `ModularFunction.const` | constructor | The constant function c. |
| `ModularFunction.instCommRing` | instance | Pointwise operations make the modular functions for Gamma a commutative ring and a C-algebra; the coercion to functions is an injective C-algebra homomorphism. |
| `ModularFunction.ofModularForm` | compatibility | A Mathlib ModularForm of weight 0 for the image of Gamma in GL(2,R) gives a modular function. |
| `ModularFunction.eq_const_of_holomorphic_of_bounded` | characterisation | If f is holomorphic on the upper half-plane and bounded at every cusp, then f is constant. |
| `ModularFunction.meromorphicAt_cuspFunction_iff_of_period` | characterisation | Meromorphy of the cusp function at 0 for one period of f\|_0 g implies it for every period. |
| `ModularFunction.restrict` | functoriality | A modular function for Gamma is one for every finite-index subgroup of Gamma (used for Gamma intersected with Gamma(M)). |

**Discriminating tests.**

- **`ModularFunction.const_apply`** (degenerate): (ModularFunction.const Gamma c) tau = c for all tau.
- **`jInvariant_modularFunction`** (computation): j = E_4^3/Delta defines a modular function for SL(2,Z) whose order at infinity (HB.5a/laurent-expansion-at-a-cusp, period 1) is -1 with leading coefficient 1.
- **`inv_jInvariant_modularFunction`** (characterisation): 1/j is a modular function for SL(2,Z) that is not holomorphic on the upper half-plane (pole at rho = e(1/3)); so the notion is strictly larger than QM.3's weakly holomorphic weight-zero forms.
- **`ofModularForm_const`** (compatibility): For f a Mathlib ModularForm of weight 0 for an arithmetic Gamma, ofModularForm f is a constant modular function (ModularForm.eq_const_of_weight_zero).
- **`exp_jInvariant_not_modularFunction`** (non-example): exp o j is SL(2,Z)-invariant and holomorphic on the upper half-plane but its cusp function at infinity is not meromorphic at 0; so it is not a modular function.

**Acceptance.**

- Every constant is a modular function for every Gamma.
- j = E_4^3/Delta (Mathlib ModularForm.E₄ and ModularForm.discriminant) is a modular function for SL(2,Z) with a simple pole at infinity; 1/j is a modular function with a pole at rho = e(1/3) in the upper half-plane, so poles in the interior are allowed.
- A modular function holomorphic on the upper half-plane and bounded at every cusp is constant (Mathlib ModularForm.eq_const_of_weight_zero, valid for every arithmetic subgroup).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.3, before Theorem 7.5, printed p. 40. The exact notion the application uses: invariance of the upper half-plane form under a finite-index subgroup, with the analytic behaviour at the cusps supplied by this layer. [cgz](https://arxiv.org/pdf/1712.04887v3): Remark 7.7, printed p. 41. Why weight zero is the right generality for the application, verbatim.


<a id="habironahmseries-hb-5a-laurent-expansion-at-a-cusp"></a>

### Order and leading coefficient at a cusp

**Definition** · `HabiroNahmSeries:HB.5a/laurent-expansion-at-a-cusp` · [packet](../packets/HabiroNahmSeries.json)

For f from the upper half-plane to C, g in SL(2,Z) and h > 0, let F be the cusp function of (f|_0 g) o ofComplex for the period h. The order of f at the cusp g(infinity) for the period h is ord_{g,h}(f) = meromorphicOrderAt F 0, an element of the integers with a top element (top exactly when F vanishes near 0), and the leading coefficient is a_{g,h}(f) = meromorphicTrailingCoeffAt F 0. For a modular function f and a period h of f|_0 g: if ord is an integer n_0 then a != 0 and q_h^{-n_0} (f|_0 g) tends to a as Im(tau) tends to infinity; ord_{g, m h}(f) = m ord_{g,h}(f) and a_{g, m h}(f) = a_{g,h}(f); ord_{g (+-T^k), h}(f) = ord_{g,h}(f) and a changes by e(k n_0/h). The normalised order ord_{g,h}(f)/h in Q is GZ's valuation v_{g(infinity)}(f).

**Hypotheses and conventions.** f is a modular function for a finite-index Gamma (for the characterisations); the definitions make sense for any f, with Mathlib's junk values (order 0 and coefficient 0 when F is not meromorphic at 0). h is a period of f|_0 g; for weight zero the classical width of HB.5a/cusp-width is the least one.

**Proof route.**

1. Define both quantities by Mathlib's meromorphicOrderAt and meromorphicTrailingCoeffAt applied to the cusp function; no new analysis is needed.
2. Non-vanishing of the leading coefficient and the limit: MeromorphicAt.meromorphicTrailingCoeffAt_ne_zero and MeromorphicAt.tendsto_nhds_meromorphicTrailingCoeffAt, transported through q_h (Function.Periodic.eq_cuspFunction).
3. Rescaling of the period: F_{mh}(q) = F_h(q^m) on a punctured disc (Function.Periodic.eq_cuspFunction at both periods), and the order and trailing coefficient of a composition with q -> q^m (MeromorphicAt.meromorphicTrailingCoeffAt_comp and meromorphicOrderAt of a composition).
4. Change of representative: f|_0 (g T^k)(tau) = f|_0 g(tau + k), and q_h(tau + k) = e(k/h) q_h(tau).

**Direct inputs.** [HabiroNahmSeries:HB.5a/modular-function-of-finite-index](#habironahmseries-hb-5a-modular-function-of-finite-index), `mathlib:meromorphicOrderAt`, `mathlib:meromorphicTrailingCoeffAt`, `mathlib:MeromorphicAt.meromorphicTrailingCoeffAt_ne_zero`, `mathlib:MeromorphicAt.tendsto_nhds_meromorphicTrailingCoeffAt`, `mathlib:meromorphicOrderAt_eq_top_iff`, `mathlib:Function.Periodic.eq_cuspFunction`, `mathlib:Function.Periodic.cuspFunction`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `orderAtCusp` | data | ord_{g,h}(f) = meromorphicOrderAt (cuspFunction h ((f\|_0 g) o ofComplex)) 0, in the integers with top. |
| `leadingCoeffAtCusp` | data | a_{g,h}(f) = meromorphicTrailingCoeffAt (cuspFunction h ((f\|_0 g) o ofComplex)) 0. |
| `orderAtCusp_eq_top_iff` | characterisation | The order is top iff f\|_0 g vanishes for all large Im(tau). |
| `leadingCoeffAtCusp_ne_zero` | characterisation | For a modular function with order an integer, the leading coefficient is non-zero. |
| `tendsto_leadingCoeffAtCusp` | characterisation | q_h(tau)^{-n_0} f\|_0 g(tau) tends to a_{g,h}(f) along atImInfty. |
| `orderAtCusp_mul_period` | simp | ord_{g, m h}(f) = m ord_{g,h}(f) for a positive integer m. |
| `orderAtCusp_mul_T_zpow` | simp | ord_{g T^k, h}(f) = ord_{g,h}(f). |
| `orderAtCusp_mul` | relation | The order of a product of modular functions with finite orders is the sum of the orders, and the leading coefficient is the product. |

**Discriminating tests.**

- **`orderAtCusp_zero`** (degenerate): orderAtCusp 0 g h = top and leadingCoeffAtCusp 0 g h = 0.
- **`orderAtCusp_const`** (computation): For c != 0, orderAtCusp (const c) g h = 0 and leadingCoeffAtCusp (const c) g h = c.
- **`orderAtCusp_jInvariant`** (computation): orderAtCusp j 1 1 = -1 and leadingCoeffAtCusp j 1 1 = 1.
- **`orderAtCusp_two_mul`** (characterisation): orderAtCusp j 1 2 = -2: doubling the period doubles the order, so the rate order/period is unchanged.
- **`orderAtCusp_eq_tauceti`** (compatibility): For a Mathlib ModularForm f and g = 1, orderAtCusp f 1 h agrees with Tau Ceti's qExpansionOrderAtCusp h f whenever the latter's q-expansion is non-zero.

**Acceptance.**

- j at infinity, h = 1: order -1, leading coefficient 1.
- The zero function: order top and leading coefficient 0.
- Rogers-Ramanujan at the cusp 0: for f = q^{-1/60} G(q) (invariant under Gamma(60)) and g = S, the normalised order ord/h is -1/60 = -lambda.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 7, before Proposition 7.1, p. 13. The normalised order ord_{g,h}/h is this valuation.


<a id="habironahmseries-hb-5a-local-parameter-and-laurent-expansion"></a>

### The local parameter at a cusp and the Laurent expansion

**Theorem** · `HabiroNahmSeries:HB.5a/local-parameter-and-laurent-expansion` · [packet](../packets/HabiroNahmSeries.json)

Let f be a modular function for a finite-index Gamma, g in SL(2,Z) and h > 0 a period of f|_0 g (for instance the classical width w(Gamma, g)). The local parameter is q_h(tau) = e(tau/h), with |q_h(tau)| = exp(-2 pi Im(tau)/h) (Mathlib Function.Periodic.norm_qParam); f|_0 g(tau) = F(q_h(tau)) for every tau in the upper half-plane, where F is the cusp function (Mathlib Function.Periodic.eq_cuspFunction). F is meromorphic on the punctured unit disc and, by definition of a modular function, meromorphic AT 0 (it extends meromorphically over the puncture). If f|_0 g is not identically zero near i infinity, then there are an integer n_0 = ord_{g,h}(f), a non-zero a = a_{g,h}(f) and y_0 such that f|_0 g(tau) = sum_{n >= n_0} a_n q_h(tau)^n, a_{n_0} = a, absolutely and uniformly on Im(tau) >= y_0 + 1, where y_0 is chosen so that F has no poles in 0 < |q| <= exp(-2 pi y_0/h). The identically zero case (order top) is separated.

**Hypotheses and conventions.** f is a modular function for Gamma; g in SL(2,Z); h > 0 is a period of f|_0 g. The Laurent series converges only on a punctured disc free of the poles of F, i.e. for Im(tau) large, since f may have poles in the upper half-plane. n_0 may be negative; it is the order of HB.5a/laurent-expansion-at-a-cusp.

**Proof route.**

1. Periodicity of (f|_0 g) o ofComplex with period h gives the factorisation through q_h (Function.Periodic.eq_cuspFunction).
2. Meromorphy of F on the punctured disc follows from meromorphy of f on the upper half-plane and the local invertibility of q_h (as in Function.Periodic.differentiableAt_cuspFunction).
3. By meromorphy at 0 and meromorphicOrderAt_eq_int_iff, F(q) = q^{n_0} G(q) with G analytic at 0 and G(0) = a != 0; expand G in its power series (Mathlib HasFPowerSeriesAt) on a disc free of poles.
4. Record the zero case with meromorphicOrderAt_eq_top_iff.

**Direct inputs.** [HabiroNahmSeries:HB.5a/modular-function-of-finite-index](#habironahmseries-hb-5a-modular-function-of-finite-index), [HabiroNahmSeries:HB.5a/laurent-expansion-at-a-cusp](#habironahmseries-hb-5a-laurent-expansion-at-a-cusp), `mathlib:Function.Periodic.qParam`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Function.Periodic.cuspFunction`, `mathlib:Function.Periodic.eq_cuspFunction`, `mathlib:MeromorphicAt`, `mathlib:meromorphicOrderAt_eq_int_iff`, `mathlib:meromorphicOrderAt_eq_top_iff`.

**Acceptance.**

- j at infinity, h = 1: j = q^{-1} + 744 + 196884 q + ..., n_0 = -1, a = 1.
- A modular function holomorphic at the cusp g(infinity) has n_0 >= 0 there.
- The zero function has order top and no leading coefficient; every statement selecting the first non-zero coefficient excludes it.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The transport of the radial parameter to the cusp b/d, which is the only computation with the local parameter that the application performs.


<a id="habironahmseries-hb-5a-radial-growth-at-a-cusp"></a>

### Growth of a modular function at a cusp, uniformly and along the radial approach

**Theorem** · `HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp` · [packet](../packets/HabiroNahmSeries.json)

Let f be a modular function for a finite-index subgroup Gamma of SL(2,Z) (HB.5a/modular-function-of-finite-index), g an element of SL(2,Z), h > 0 a period of the transported function f|g (weight zero, so f|g(tau) = f(g tau)), F the cusp function of f|g for the period h, n_0 = ord_0 F its order (HB.5a/laurent-expansion-at-a-cusp) and a = the trailing (leading Laurent) coefficient of F at 0. Assume f|g is not identically zero near i infinity, so n_0 is an integer and a is non-zero. (i) Uniform form: f|g(tau) - a q_h(tau)^{n_0} = O(exp(-2 pi (n_0 + 1) Im(tau)/h)) as Im(tau) tends to infinity, uniformly in Re(tau) (Mathlib's filter atImInfty), where q_h(tau) = exp(2 pi i tau/h); equivalently f|g(tau) = a q_h(tau)^{n_0} (1 + O(exp(-2 pi Im(tau)/h))). (ii) Radial form at a finite cusp: if g = (b beta; d delta) with d > 0, so that g infinity = b/d and b delta - beta d = 1, then as y decreases to 0, f(b/d + i y) = a e(-n_0 delta/(d h)) exp(-2 pi n_0/(h d^2 y)) (1 + O(exp(-2 pi/(h d^2 y)))), because g^{-1}(b/d + i y) = -delta/d + i/(d^2 y). (iii) Consequently the exponential rate in 1/y at the cusp b/d is -2 pi n_0/(h d^2), an element of 2 pi Q, and at the cusp 0 (g = S, b = 0, d = 1, delta = 0) the rate in 1/epsilon for tau = i epsilon/(2 pi) is -4 pi^2 n_0/h, an element of pi^2 Q. The ratio n_0/h, hence the rate, does not depend on the choice of the period h.

**Hypotheses and conventions.** Gamma has finite index in SL(2,Z); f is a modular function for Gamma in the sense of HB.5a; g is in SL(2,Z); h > 0 is a period of f|g; f|g does not vanish identically on any neighbourhood of i infinity (otherwise n_0 is the top element and there is no leading coefficient). q = e(tau) = exp(2 pi i tau) is the normalisation of HB.4; the radial approach at b/d is tau = b/d + i y, y > 0 decreasing to 0; for the Nahm application at the cusp 0 the variable is tau = i epsilon/(2 pi), and part (i) applies to every complex epsilon with Re(1/epsilon) tending to infinity, not only to real epsilon. delta is the lower-right entry of the scaling matrix g, so delta b = 1 mod d; the phase depends on delta (equivalently on g up to right multiplication by powers of T, which changes a by the matching root of unity), not on b. When n_0 = 0 the statement says that f tends to a with an exponentially small error.

**Proof route.**

1. Put G = q_h^{-n_0} F. By HB.5a/laurent-expansion-at-a-cusp and Mathlib's meromorphicOrderAt_eq_int_iff, G agrees on a punctured neighbourhood of 0 with a function analytic at 0 whose value at 0 is a (meromorphicTrailingCoeffAt); in particular the function tau -> q_h(tau)^{-n_0} f|g(tau) is h-periodic, holomorphic for Im(tau) large and bounded as Im(tau) tends to infinity.
2. Apply Mathlib's Function.Periodic.exp_decay_sub_of_bounded_at_inf to that function: its difference with its value at the cusp, which is a, is O(exp(-2 pi Im(tau)/h)) along the filter comap im atTop, which is uniform in Re(tau). Multiply back by q_h^{n_0}, using Function.Periodic.norm_qParam, to obtain (i).
3. For (ii) compute g^{-1}(b/d + i y) = -delta/d + i/(d^2 y) directly from the Moebius action (ModularForm.SL_slash_apply at weight zero) and substitute into (i): q_h(-delta/d + i/(d^2 y))^{n_0} = e(-n_0 delta/(d h)) exp(-2 pi n_0/(h d^2 y)).
4. For (iii) read off the rates; replacing h by m h replaces n_0 by m n_0 (the cusp function in q_{mh} is F(q^m)), so n_0/h is independent of h.
5. Record the excluded case: if f|g vanishes identically near i infinity the order is the top element (meromorphicOrderAt_eq_top_iff) and the statement is vacuous.

**Direct inputs.** [HabiroNahmSeries:HB.5a/laurent-expansion-at-a-cusp](#habironahmseries-hb-5a-laurent-expansion-at-a-cusp), [HabiroNahmSeries:HB.5a/local-parameter-and-laurent-expansion](#habironahmseries-hb-5a-local-parameter-and-laurent-expansion), `mathlib:Function.Periodic.exp_decay_sub_of_bounded_at_inf`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:meromorphicOrderAt_eq_int_iff`, `mathlib:meromorphicOrderAt_eq_top_iff`, `mathlib:UpperHalfPlane.atImInfty`, `mathlib:ModularForm.SL_slash_apply`, `mathlib:Asymptotics.IsBigO`.

**Acceptance.**

- For j = E_4^3/Delta and Gamma = SL(2,Z) at the cusp 1/2 (g = (1 0; 2 1), delta = 1, h = 1, n_0 = -1, a = 1): j(1/2 + i y) = -exp(pi/(2 y)) (1 + O(exp(-pi/(2 y)))); numerically j(1/2 + 0.05 i) = -4.40315058598880 x 10^13 against -exp(10 pi) = -4.40315058606320 x 10^13 (difference 744, the constant term).
- For j at the cusp 2/5 (g = (2 1; 5 3), delta = 3): j(2/5 + i y) ~ e(3/5) exp(2 pi/(25 y)); at y = 0.01 PARI gives j = -6.65224859496 x 10^10 - 4.83314156516 x 10^10 i and the prediction is -6.65224866936 x 10^10 - 4.83314156516 x 10^10 i. The phase e(2/5) that a formula using b instead of delta would give is the complex conjugate and is wrong.
- For a holomorphic modular function with a_0 non-zero (n_0 = 0) the radial limit is a_0.
- A function growing like exp(c/y) along a radial approach with c not in 2 pi Q is not a modular function for any finite-index subgroup.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The exact consequence the application draws from the growth of a modular function at a cusp: the exponential rate, which is the Rogers dilogarithm of the Bloch class, is forced to be a rational multiple of pi squared. [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, equation (eq.nc2), printed p. 40. The exponentially small error term, which is the second half of what the growth theorem provides.


<a id="habironahmseries-hb-5a-supplier-interface"></a>

### What HB.5 consumes from this layer, and nothing more

**Application** · `HabiroNahmSeries:HB.5a/supplier-interface` · [packet](../packets/HabiroNahmSeries.json)

The Nahm application uses exactly four facts from this layer. First (transport, an identity of complex numbers): for gamma = (a b; c d) in SL(2,Z) with d != 0, h > 0, h-bar = h/(2 pi), epsilon = d h/(1 - i c h-bar) and w = i epsilon/(2 pi), one has gamma(w) = (b + i h-bar)/d; if d > 0 then Re(epsilon) > 0 and Re(1/epsilon) = 1/(d h), and for a gamma-invariant f this gives f(i epsilon/(2 pi)) = f((b + i h-bar)/d), i.e. the RADIAL approach q = zeta e^{-h/d} to the PRIMITIVE d-th root of unity zeta = e(b/d) (gcd(b, d) = 1) corresponds to a NON-radial approach to 1, along the image under gamma^{-1} of a vertical ray, on which q = e^{-epsilon} with epsilon complex. Second (rationality): for a non-zero modular function the rate at the cusp 0 is -4 pi^2 n_0/h in pi^2 Q (HB.5a/radial-growth-at-a-cusp (iii)). Third (exponentially small error, uniformly): at the cusp 0 the expansion f(tau) = a e(-n_0/(h tau))(1 + O(exp(-2 pi Im(-1/tau)/h))) holds uniformly in Re(-1/tau), hence for complex epsilon with Re(1/epsilon) tending to infinity. Fourth (shrinking): for every M >= 1, Gamma intersected with Gamma(M) has finite index and each of its elements has lower-right entry d = 1 mod M (d = -1 mod M after replacing gamma by -gamma to make d > 0); these d are unbounded. No congruence hypothesis on Gamma, no algebraic model and no Fourier-coefficient arithmetic is used.

**Hypotheses and conventions.** Gamma is a finite-index subgroup and f a modular function for it (for a Nahm sum this is supplied by HB.5/nahm-sum-meromorphic-at-every-cusp). The transport identity is exact; the second and third facts are asymptotic along atImInfty after the S-transform. What avoids the modulus is the lower-right entry d, i.e. the denominator of the cusp gamma(0) = b/d; other cusps of Gamma intersected with Gamma(M) (such as 1/M) do not avoid it.

**Proof route.**

1. Transport: c w + d = d/(1 - i c h-bar) and a w + b = (b + i h-bar(a d - b c))/(1 - i c h-bar) = (b + i h-bar)/(1 - i c h-bar); divide.
2. Rationality and uniform error: HB.5a/radial-growth-at-a-cusp at g = S.
3. Shrinking: HB.5a/finite-index-subgroups (Mathlib CongruenceSubgroup.Gamma_mem, CongruenceSubgroup.instFiniteIndexGamma, the FiniteIndex instance for an intersection); unboundedness as in HB.5/excluded-primes-and-hypotheses (c).
4. State the four facts as separate lemmas so that HB.5 depends on this node and not on the internal definitions of the layer.

**Direct inputs.** [HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp](#habironahmseries-hb-5a-radial-growth-at-a-cusp), [HabiroNahmSeries:HB.5a/finite-index-subgroups](#habironahmseries-hb-5a-finite-index-subgroups), [HabiroNahmSeries:HB.5a/cusp-width](#habironahmseries-hb-5a-cusp-width), `mathlib:CongruenceSubgroup.Gamma_mem`, `mathlib:ModularForm.SL_slash_apply`.

**Acceptance.**

- gamma = T: c = 0, d = 1, b = 1, epsilon = h, zeta = 1; the identity is trivial.
- gamma = S: d = 0 and epsilon = 0; the transport is not defined, which is why d != 0 (indeed d > 0) is required.
- Rogers-Ramanujan, gamma = (-59 -60; 60 61) in Gamma(60), h = 0.01: f(i epsilon/(2 pi)) = f((b + i h-bar)/d) = 2.488246222692109 - 0.257203677708862 i (PARI, agreement to 6 x 10^{-68}).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The first fact; 'any gamma' must be read as gamma with d > 0 (source issue HabiroNahmSeries/E25). [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The fourth fact.


## HB.5 — Modularity, every-root growth and Bloch torsion

The elementary modulus route groups finite q-products into root-order blocks. With n=mℓ+s,

\[
 Q(m\ell+s)=m^2\left(\tfrac12\ell^TA\ell+
             ((As+B)/m)^T\ell\right)+Q(s).
\]

A uniform lower bound |(ζe⁻ᵗ;ζe⁻ᵗ)_N|≥c_m(e⁻ᵐ²ᵗ;e⁻ᵐ²ᵗ)_⌊N/m⌋ has a bounded total block loss, not a multiplicative loss for every block. Summing the finitely many residue classes gives growth O(exp(𝓛/(m²t))) for every order m. This proves valuation ≥−λ at every finite cusp; the value at 0 is −λ. At infinity use min Q(n), which is not generally C.

The torsion argument then fixes E before varying good orders. An integral Bloch class over E supplies finite Kummer reductions. A single bounded power of the actual root constant, with μ, ω and q^C retained, annihilates those reductions at unbounded orders. Compare to finitely generated indecomposable K₃ through the convention map, rather than asserting finite generation of B_CGZ itself. Regulator functoriality and extension of embeddings return the conclusion to F. The rationalized class vanishes; an original integral class is torsion. This direction uses only the distinguished solution and gives no modularity criterion or all-solution converse.


<a id="habironahmseries-hb-5-nahm-conjecture-statement"></a>

### Nahm's conjecture: the three properties and the two implications

**Definition** · `HabiroNahmSeries:HB.5/nahm-conjecture-statement` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric positive definite rational matrix A define three properties. (a) The class [X] vanishes in the Bloch group of the complex numbers for EVERY solution X of Nahm's equations. (b) The special class xi_A attached to the distinguished solution vanishes. (c) The function f_{A,B,C} is modular for SOME rational vector B and rational number C. Trivially (a) implies (b). Nahm's conjecture is the pair of implications (a) implies (c) and (c) implies (b). Both stronger forms are false: (b) alone does not imply (c), by Zagier's matrix (8 5; 5 4), and (c) does not require (a), by the Vlasenko-Zwegers matrix (3/2 1/2; 1/2 3/2). Only (c) implies (b) is a theorem, and it is the endpoint of this layer.

**Hypotheses and conventions.** A is symmetric positive definite with rational entries; B ranges over rational vectors and C over rational numbers. For rational A the equations 1 - X_i = prod_j X_j^{a_ij} are read in the cleared form (1 - X_i)^D = prod_j X_j^{D a_ij} (D a common denominator), which fixes the solution set used in property (a); the distinguished solution is the same in both readings. Vanishing in B(C) is equivalent to being torsion in the Bloch group of the field generated by the solution (HB.3/torsion-in-the-algebraic-closure). Modular in (c) means invariant under a finite-index subgroup of SL(2,Z), as in CGZ; by HB.5/nahm-sum-meromorphic-at-every-cusp this is the same as being a modular function in the sense of HB.5a for that subgroup.

**Proof route.**

1. Define the three properties as predicates on the matrix A.
2. Prove the trivial implication from (a) to (b).
3. Record, as data and not as theorems, the two counterexamples that rule out the stronger forms, with their matrices and the reason each fails.
4. State the two conjectural implications as named conjectures, clearly separated from the theorem of this layer.
5. Record the motivation, namely that both (b) and (c) force L(xi_A)/pi^2 to be rational, which is the shared consequence that made the conjecture plausible.

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), [HabiroNahmSeries:HB.5a/modular-function-of-finite-index](#habironahmseries-hb-5a-modular-function-of-finite-index).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `NahmProperty.a` | data | The property that every solution has vanishing class. |
| `NahmProperty.b` | data | The property that the distinguished solution has vanishing class. |
| `NahmProperty.c` | data | The property that some f_{A,B,C} is modular. |
| `NahmProperty.a_imp_b` | characterisation | Property (a) implies property (b). |
| `NahmConjecture.aImpC` | data | The conjectural implication from (a) to (c), stated and not proved. |
| `NahmConjecture.cImpB` | data | The implication from (c) to (b), which is the theorem of this layer. |
| `NahmProperty.b_not_imp_c` | example | Zagier's counterexample matrix, recorded as data. |
| `NahmProperty.c_not_imp_a` | example | The Vlasenko-Zwegers counterexample matrix, recorded as data. |

**Discriminating tests.**

- **`rogers_ramanujan_all_three`** (computation): For A = (2): both solutions (sqrt 5 - 1)/2 and -(sqrt 5 + 1)/2 have torsion class, and f_{2,0,-1/60} is modular (Rogers-Ramanujan with the Jacobi triple product, owned by QSeriesPartitionsAndMockModularForms QM.1); so (a), (b), (c) hold.
- **`rank_zero`** (degenerate): For r = 0 the Nahm sum is q^C, which is invariant under a finite-index subgroup iff C = 0; (a) and (b) hold (empty class) and (c) holds with C = 0.
- **`rank_one_lambda`** (computation): For A = (1), (2), (1/2): L(xi_A)/(4 pi^2) = 1/48, 1/60, 1/40, and -L(xi_A)/(4 pi^2) is the C of the modular triple with B = 0.
- **`a_implies_b`** (characterisation): Property (a) implies property (b) for every A.
- **`zagier_matrix_b_not_c`** (non-example): For A = (8 5; 5 4): (b) holds (lambda = 1/60 numerically; the torsion certificate is HB.10's) and (c) fails; the failure of (c) for all B, C rests on Zagier's survey, which was not obtained, and is recorded with that gap.
- **`vlasenko_zwegers_c_not_a`** (non-example): For A = (3/2 1/2; 1/2 3/2): (c) holds and (a) fails; this rests on Vlasenko-Zwegers, which was not obtained (distinguished solution (sqrt 5 - 1)/2 in both coordinates, lambda = 1/30).

**Acceptance.**

- For A = (2) all three properties hold: the Rogers-Ramanujan sums are modular and the Bloch class is torsion.
- For A = (8 5; 5 4) property (b) holds and property (c) fails, so (b) does not imply (c).
- For A = (3/2 1/2; 1/2 3/2) property (c) holds and property (a) fails, so (c) does not imply (a).

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, the three properties, printed pp. 36 to 37. The three properties and the conjecture, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.1, the two counterexamples, printed p. 37. Both counterexamples with their matrices, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 1.3, printed p. 5. Why only one direction is stated precisely, verbatim.


<a id="habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp"></a>

### An invariant Nahm sum is a modular function: moderate growth at every cusp

**Lemma** · `HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp` · [packet](../packets/HabiroNahmSeries.json)

Let (A, B, C) be an analytic Nahm datum and f(tau) = f_{A,B,C}(e(tau)). (a) All coefficients of f in its expansion in powers e(e tau), e in C + (1/D)Z (D a denominator of the datum), are non-negative, hence |f(x + i y)| <= f(i y) for all real x and y > 0. (b) There are constants c1, c2 > 0 with f(i y) <= c1 exp(c2/y) for 0 < y <= 1 (for instance c2 = L(xi_A)/(2 pi) + 1, from the expansion at q = 1). (c) Consequently, if f is invariant under a finite-index subgroup Gamma of SL(2,Z), then for every g in SL(2,Z) with lower row (c, d) and every period w of f|g, |f|g(tau)| <= c3 exp(c2 (c^2 Im(tau) + R)) for Im(tau) >= 1, with R depending on c, d and w only; so the cusp function of f|g for the period w is bounded by a power of |q_w|^{-1}, hence meromorphic at 0. Together with holomorphy on the upper half-plane this makes f a modular function for Gamma in the sense of HB.5a/modular-function-of-finite-index (indeed a weakly holomorphic one). In short: for Nahm sums, CGZ's notion of modularity (invariance only) and HB.5a's notion (invariance plus meromorphy at every cusp) coincide.

**Hypotheses and conventions.** (A, B, C) is an analytic Nahm datum (A symmetric positive definite rational). Invariance is under the weight-zero action of a finite-index subgroup Gamma of SL(2,Z), with no condition at the cusps; this is CGZ's definition of 'modular' in Section 7.3 and the hypothesis of Theorem 7.5. The bound (b) needs only an upper bound of exponential type e^{O(1/y)}; the full asymptotics of HB.4 at m = 1 provides it.

**Proof route.**

1. Expand 1/(q)_n as a power series with non-negative integer coefficients (partitions into parts at most n) and conclude (a) by the triangle inequality, using absolute convergence for |q| < 1.
2. Obtain (b) from HB.4/radial-asymptotic-expansion at m = 1 (the unconditional real statement, also part (a) of HB.5/expansion-at-one) together with continuity on [y1, 1].
3. For (c) write tau' = x + i Y with |x| <= w/2 (periodicity) and Y >= 1; then Im(g tau') = Y/((c x + d)^2 + c^2 Y^2) >= 1/(c^2 Y + R) with R = (|c| w/2 + |d|)^2, and (a), (b) give the bound; when c = 0 use the q-expansion of f directly (finitely many negative exponents).
4. A holomorphic function F on a punctured disc with |F(q)| <= C |q|^{-N} is meromorphic at 0 (q^N F is bounded, hence extends analytically by Riemann's theorem: Mathlib's Function.Periodic.differentiableAt_cuspFunction_zero applied to q_w^N f|g).
5. Conclude that f defines an element of HB.5a's ModularFunction for Gamma.

**Direct inputs.** [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](#habironahmseries-hb-4-radial-asymptotic-expansion), [HabiroNahmSeries:HB.5a/modular-function-of-finite-index](#habironahmseries-hb-5a-modular-function-of-finite-index), [HabiroNahmSeries:HB.5a/finite-index-subgroups](#habironahmseries-hb-5a-finite-index-subgroups), `mathlib:Function.Periodic.differentiableAt_cuspFunction_zero`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`.

**Acceptance.**

- For A = 2, B = 0, C = -1/60 the bound (a)-(b) holds with c2 = pi/30 + 1 (L = pi^2/15), and invariance under Gamma(60) was checked numerically for gamma = (-59 -60; 60 61).
- Without positivity the implication fails in general: a function invariant under SL(2,Z) such as exp(j) has an essential singularity at the cusp; the lemma is specific to series with non-negative coefficients and e^{O(1/y)} growth.
- The lemma is what licenses CGZ's step 'f(-1/tau) is invariant under some power of T, so lambda is rational': invariance alone does not give a finite principal part.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Section 7.3, before Theorem 7.5, printed p. 40. The hypothesis the lemma starts from: invariance only, with nothing at the cusps. [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The step that needs a finite principal part at the cusp 0, which this lemma supplies; the source does not argue it (source issue HabiroNahmSeries/E22).


<a id="habironahmseries-hb-5-expansion-at-one"></a>

### The expansion of a Nahm sum at q tending to one, and its improvement under modularity

**Lemma** · `HabiroNahmSeries:HB.5/expansion-at-one` · [packet](../packets/HabiroNahmSeries.json)

(a) Unconditionally, f_{A,B,C}(e^{-epsilon}) = e^{L(xi_A)/epsilon} (K + O(epsilon)) as real epsilon decreases to 0, where K = det(A-tilde)^{-1/2} prod_i z_i^{B_i} (1 - z_i)^{-1/2} > 0 (the m = 1 case of HB.4/radial-asymptotic-expansion, whose Gauss sum and cyclic-dilogarithm factors are 1 at m = 1), and K^{2 den(B)} lies in F. (b) If f is invariant under a finite-index subgroup Gamma, let w be a period of f|S and n_0, a the order and leading coefficient of f|S at i infinity (HB.5a/laurent-expansion-at-a-cusp; f|S is not identically zero because K != 0). Then n_0/w = -lambda with lambda = L(xi_A)/(4 pi^2), so lambda is rational, a = K, and for every COMPLEX epsilon with Re(1/epsilon) > 0, f_{A,B,C}(e^{-epsilon}) = f(i epsilon/(2 pi)) = K e^{L(xi_A)/epsilon} (1 + O(exp(-4 pi^2 Re(1/epsilon)/w))) as Re(1/epsilon) tends to infinity.

**Hypotheses and conventions.** A is an analytic Nahm datum, F the field of the distinguished solution z, L the Rogers dilogarithm in the CGZ normalisation (so L(xi_A) > 0). Part (b) assumes invariance only; meromorphy at the cusp 0 is supplied by HB.5/nahm-sum-meromorphic-at-every-cusp. Part (b) is used at the complex point epsilon = d h/(1 - i c h-bar), where Re(1/epsilon) = 1/(d h); the real-epsilon statement is not enough for HB.5/comparison-of-expansions.

**Proof route.**

1. Specialise HB.4/radial-asymptotic-expansion to alpha = 0, m = 1 (odd and prime to every denominator), and use f_{A,B,C}(i epsilon/2 pi) = e^{-C epsilon} f_{A,B,0}(i epsilon/2 pi); the constant is c(Q) S(0) with S(0) = 1, which is K.
2. Under invariance, apply HB.5/nahm-sum-meromorphic-at-every-cusp and the uniform growth theorem HB.5a/radial-growth-at-a-cusp (i) at g = S: f(tau) = f|S(-1/tau) = a e(-n_0/(w tau)) (1 + O(exp(-2 pi Im(-1/tau)/w))), and -1/tau = 2 pi i/epsilon, Im(-1/tau) = 2 pi Re(1/epsilon).
3. Compare with (a) for real epsilon: the exponential rates give -4 pi^2 n_0/w = L(xi_A) and the constants give a = K.
4. Substitute back to obtain (b) for complex epsilon.

**Direct inputs.** [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](#habironahmseries-hb-4-radial-asymptotic-expansion), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp](#habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp), [HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp](#habironahmseries-hb-5a-radial-growth-at-a-cusp), [HabiroNahmSeries:HB.5a/laurent-expansion-at-a-cusp](#habironahmseries-hb-5a-laurent-expansion-at-a-cusp), [HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison](#habironahmseries-hb-4-radial-analytic-remainder-comparison).

**Acceptance.**

- A = 2, B = 0, C = -1/60: L = pi^2/15, lambda = 1/60, z = (sqrt 5 - 1)/2, A-tilde = (5 + sqrt 5)/2, K = sqrt((5 + sqrt 5)/10) = 0.85065080835203993218...; PARI gives f(e^{-epsilon}) e^{-L/epsilon} = 0.850650808352039932181540... at epsilon = 0.05 and 0.02, agreeing with K to all 60 displayed digits (exponentially small error).
- A = 1, B = 0: z = 1/2, L = pi^2/12, lambda = 1/48, matching the modular triple (1, 0, -1/48); A = 1/2: lambda = 1/40, matching (1/2, 0, -1/40).
- For a non-invariant Nahm sum part (b) is unavailable and the O(epsilon) error is genuine.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40, (53). Part (a); the node proves it from HB.4 at m = 1 instead of citing Zagier's survey. [gz](https://arxiv.org/pdf/1812.07690v1): Theorem 3.1 and Remark 3.2, pp. 5-6 (the case zeta = 1). The m = 1 case used for (a).


<a id="habironahmseries-hb-5-comparison-of-expansions"></a>

### Comparing the two expansions at a cusp

**Theorem** · `HabiroNahmSeries:HB.5/comparison-of-expansions` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier](#habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier). Its hypotheses and limitations govern this target and the API names below.

Assume the modularity hypotheses and notation of the parent expansion-at-one. Put λ=Λ/(4π²)∈Q and K=det(Ã)^{-1/2}∏_iX_i^{B_i}(1-X_i)^{-1/2}>0. For γ=(a b;c d)∈Γ, d>0 a good odd order, ζ=e(b/d), μ_b=e(r s(b,d)/2), and ω_d=d^{-r/2}det(Ã)^{-1/2}∏_i(1-X_i)^{1/2}, the Dedekind-normalized expansion constant (Φ_ζ=(ν_b/μ_b)Φ_GZ, ν_b=e(r(d−1)(d−2)b/(24d))) is u=μ_b^{-1}ω_d^{-1}e(-Cb/d)e(-λc/d)K≠0. For one positive integer s divisible by 24, 2den(B), den(C) and den(λ), u^s∈F_d×⊂E_d× for every such d, with s independent of d. This extends the parent comparison-of-expansions to rational data without absorbing a general Gauss phase into a fixed μ.

**Proof route.**

1. Use ε=dh/(1-ich/(2π)). Matrix algebra gives γ(iε/(2π))=(b+ih/(2π))/d and 1/ε=1/(dh)-ic/(2πd).
2. The finite Laurent principal part at cusp zero makes the modular q=1 expansion uniform at this complex ε. Compare it with the HB.4 expansion after the specified multiplier rescaling for f_{A,B,0}, multiplying the latter by e(Cb/d)e^{-Ch/d}. This gives the displayed inverse factors and negative phase; positivity of K gives u≠0.
3. K^{2den(B)}∈F× and ω_d²∈F× by their formulas. From the displayed rational definition of the classical Dedekind sum, 12d s(b,d) is an integer: expand the floor term and use ∑_{j=1}^{d-1}j²=d(d-1)(2d-1)/6 and ∑j=d(d-1)/2. Thus μ_b^{24}=e(12r s(b,d))∈Q(ζ_d).
4. Since sC and sλ are integers, the two remaining phases raised to s also lie in Q(ζ_d). Multiplication proves u^s∈F_d× with a fixed s; no integral-Q premise or special Rademacher congruence is required.

**Direct inputs.** [HabiroNahmSeries:HB.5/expansion-at-one](#habironahmseries-hb-5-expansion-at-one), [HabiroNahmSeries:HB.5a/supplier-interface](#habironahmseries-hb-5a-supplier-interface), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison), [HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison](#habironahmseries-hb-4-nonzero-unit-series-descent-comparison).

**Acceptance.**

- Rogers-Ramanujan check of (1)-(2), computed with PARI at 77 digits: A = 2, B = 0, C = -1/60 (lambda = 1/60, K = sqrt((5 + sqrt 5)/10) = 0.8506508083520399), gamma = (-59 -60; 60 61) in Gamma(60), h = 0.01: f(i epsilon/(2 pi)) and f((b + i h-bar)/d) agree to 6 x 10^{-68}, and f(e^{-epsilon})/e^{L/(d h)} = 0.8461427862 - 0.0874636258 i, while K e(-lambda c/d) = 0.8461422533 - 0.0874647643 i and K e(+lambda c/d) = 0.8461422533 + 0.0874647643 i; the sign printed in CGZ is the wrong one.
- gamma = T (when T is in Gamma): c = 0, d = 1, b = 1, epsilon = h, and the conclusion is the statement at q = 1.
- gamma = S is excluded: d = 0 gives epsilon = 0, and the construction degenerates; the argument needs d > 0.
- CGZ Remark 7.3 says Phi_zeta may vanish identically, 'for instance, when f_{A,B,C} is modular and we are expanding at a cusp not equivalent to 0'; here b/d = gamma(0) is Gamma-equivalent to 0, which is why Phi_zeta(0) cannot vanish.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40, the display after (53) and (43). The comparison and both conclusions; the node corrects the phase sign and restores the factors omega and e(C b/d) (source issues HabiroNahmSeries/E19, E22). [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.1, printed p. 36, (43). The right-hand expansion, for f_{A,B} and not f_{A,B,C}, with the factor omega.


<a id="habironahmseries-hb-5-torsion-from-unbounded-orders"></a>

### An element of a finitely generated abelian group with unboundedly many divisibilities is torsion

**Lemma** · `HabiroNahmSeries:HB.5/torsion-from-unbounded-orders` · [packet](../packets/HabiroNahmSeries.json)

Let G be a finitely generated abelian group and x in G such that the set of positive integers n for which x lies in nG (that is, x = n y for some y in G) is infinite. Then x has finite additive order. Proof: by the structure theorem G is isomorphic to Z^k x (a finite group); a non-zero integer coordinate of the free part of x is divisible by infinitely many n, which is impossible.

**Hypotheses and conventions.** G is a finitely generated abelian group; the set of n for which x lies in nG is unbounded. The conclusion is that x is torsion, not that x vanishes; in the Bloch group of a number field the torsion is in general non-zero. Only divisibility by an unbounded family is needed, not by all n.

**Proof route.**

1. Apply Mathlib's AddCommGroup.equiv_free_prod_directSum_zmod to write G as Z^k times a finite direct sum of cyclic groups.
2. Each coordinate of the Z^k-component of x is divisible by every admissible n; choose an admissible n larger than its absolute value and apply Int.eq_zero_of_abs_lt_dvd to see that it vanishes.
3. So x lies in the finite part, and an element of a finite group has finite order.

**Direct inputs.** `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`, `mathlib:Int.eq_zero_of_abs_lt_dvd`, `mathlib:AddGroup.FG`.

**Acceptance.**

- In the integers, an element divisible by unboundedly many n is zero.
- In a finite group every element is torsion and the hypothesis is automatic.
- The hypothesis cannot be weakened to divisibility by a bounded set of n: 1 in the integers is divisible by 1, and is not torsion.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 41. The step of the proof that this lemma isolates, verbatim; the source states it in one sentence and the lemma makes the group-theoretic content explicit.


<a id="habironahmseries-hb-5-excluded-primes-and-hypotheses"></a>

### The finitely many excluded primes, and the arithmetic hypotheses of the orders used

**Lemma** · `HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](#habironahmseries-hb-5-fixed-extension-constant-term-lift). Its hypotheses and limitations govern this target and the API names below.

Choose one fixed strong denominator D divisible by 24 and clearing A and B. Enlarge F=Q(X) to E=F(X_i^(1/D),ζ_D), and use M_E=6|disc(E)||K₂(O_E)|. Intersect the finite-index group with Γ(6D M_E). Powers of both unipotents give matrices with unbounded positive lower-right entries n≡1 mod 6D M_E. These n are primitive good root orders for the arithmetic comparison over E. The original rationalized class over F is not reduced modulo n; descend the regulator conclusion from the integral class over E.

**Proof route.**

1. Put Y_i=X_i^{1/D}. Since D A_ij are integers, X_i=Y_i^D and 1-X_i=∏_jY_j^{D A_ij}. The boundary ∑X_i∧(1-X_i)=D∑_{i,j}(D A_ij)Y_i∧Y_j cancels by symmetry. Hence ∑[X_i] belongs to the integral Bloch group of E.
2. Since 12n s(a,n) is an integer, ν_a/μ_a has order dividing 24n. With 24 dividing D, E_n contains this ratio. Renormalizing Φ by it preserves coefficient descent over E_n and changes Φ(0)^n by an n-th power of an E_n element, so its Kummer class and eigenspace are unchanged. This is a normalization check, not a proof of the imported HB.4 descent inputs.
3. The parent HB.4 corrected constant-term statement is over exactly this fixed radical/cyclotomic extension. Use it with η_E, whose symbols are integral here; do not apply the parent integer-valued-only unit-corollary to the original rationalized class.
4. For n prime to 6, CGZ Lemma 2.4(b) and (23) make the class of D_ζ(1) trivial modulo n-th powers. The image of [u^{-n}] in the Kummer quotient is therefore P_ζ(η_E).
5. The same imported HB.4 statement puts [u^{-n}] in the χ^{-1} eigenspace. The unique-lift characterization of R_ζ (HabiroNumberFields:HB.2/the-map-R-zeta, Proposition 2.5 and Remark 2.6) identifies this lift with R_ζ(η_E).

**Direct inputs.** [HabiroNahmSeries:HB.5a/finite-index-subgroups](#habironahmseries-hb-5a-finite-index-subgroups), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), `HabiroNumberFields:HB.1/the-excluded-primes`, `mathlib:CongruenceSubgroup.Gamma_mem`, `mathlib:CongruenceSubgroup.instFiniteIndexGamma`, `mathlib:Subgroup.index_inf_le`, `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`.

**Acceptance.**

- For A integral with 2B = diag(A) mod 2 one may take D = 2 (the denominator of B) or read the hypothesis as GZ's 'prime to a denominator of Q' with denominator 1; in both cases M = 2 D M_F works because M_F is even.
- For A = (1/2) (D = 2): the admissible d are the odd d prime to M_F, an infinite set.
- For Gamma = Gamma(M) itself the family (1 0; M 1) T^{k M} = (1, k M; M, 1 + k M^2) lies in Gamma(M) and has lower-right entries d = 1 + k M^2, unbounded and = 1 mod M.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The shrinking step; the source never says which M is needed, and the node fixes it. [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.1, printed p. 36. The coprimality hypothesis; GZ Theorem 3.1, the proof CGZ cite, also requires the order to be odd. [gz](https://arxiv.org/pdf/1812.07690v1): Theorem 3.1, p. 5. The oddness hypothesis dropped in CGZ's quotation (source issue HabiroNahmSeries/E14). [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 1.2, printed p. 3. The two hypotheses on n that the orders must satisfy; Remark 1.4 (p. 3) gives M_F = 6 Delta_F |K_2(O_F)|.


<a id="habironahmseries-hb-5-torsion-criterion-for-the-cgz-bloch-group"></a>

### Divisibility by infinitely many odd n forces torsion in the CGZ Bloch group of a number field

**Lemma** · `HabiroNahmSeries:HB.5/torsion-criterion-for-the-cgz-bloch-group` · [packet](../packets/HabiroNahmSeries.json)

Let F be a number field and x in B_CGZ(F). If x lies in n B_CGZ(F) for infinitely many odd n, then x has finite order.

**Hypotheses and conventions.** F is a number field; B_CGZ is the Bloch group of K3BlochGroups V.3/cgz-bloch-group; B(F) is Suslin's Bloch group of V.3. Only odd n are used, because the comparison of B(F)/n with B_CGZ(F)/n is proved for odd n; the orders produced in HB.5 are odd. The source's phrase 'the finitely generated group B(F)' is not relied on: K3BlochGroups V.3 records that B_CGZ(F) is not in general a quotient of B(F), and the finiteness of the cokernel of kappa: B(F) -> B_CGZ(F) is not recorded anywhere; this proof avoids it.

**Proof route.**

1. By K3BlochGroups V.3/cgz-convention-comparison the cokernel of kappa: B(F) -> B_CGZ(F) is killed by 2, so 2x = kappa(x') for some x' in B(F).
2. For each admissible odd n, 2x lies in n B_CGZ(F), and kappa induces an isomorphism B(F)/n -> B_CGZ(F)/n (K3BlochGroups V.6/comparison-finite-coefficients), so x' lies in n B(F).
3. B(F) is a quotient of K_3^ind(F) (K3BlochGroups V.4/suslin-exact-sequence), which is finitely generated for a number field (K3BlochGroups V.2/k3-rank-borel); so B(F) is finitely generated.
4. Apply HB.5/torsion-from-unbounded-orders to x': it is torsion; hence 2x = kappa(x') is torsion, and so is x.

**Direct inputs.** [HabiroNahmSeries:HB.5/torsion-from-unbounded-orders](#habironahmseries-hb-5-torsion-from-unbounded-orders), `K3BlochGroups:V.3/cgz-convention-comparison`, `K3BlochGroups:V.6/comparison-finite-coefficients`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.2/k3-rank-borel`.

**Acceptance.**

- F = Q: B_CGZ(Q) is torsion (its rank is r_2(Q) = 0), and every element satisfies the conclusion.
- The hypothesis 'infinitely many n' cannot be replaced by 'one n': for F with r_2(F) > 0 a generator of the free part lies in 1 B_CGZ(F) and is not torsion.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. The step this lemma makes precise; the finite generation of B_CGZ(F) is asserted in the source without reference.


<a id="habironahmseries-hb-5-modularity-implies-torsion"></a>

### Modularity implies that the Bloch class is torsion

**Theorem** · `HabiroNahmSeries:HB.5/modularity-implies-torsion` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.5/rational-bloch-arithmetic-bridge](#habironahmseries-hb-5-rational-bloch-arithmetic-bridge). Its hypotheses and limitations govern this target and the API names below.

For positive-definite rational Nahm data, invariance of f_{A,B,C} under any finite-index subgroup of SL₂(Z) implies ξ_F=0 in B_CGZ(F)⊗Q, conditional on the exact HB.4 arithmetic inputs and the HB.3 regulator suppliers. If A is integral, the original integral class ξ_A is torsion in B_CGZ(F). Its image in the uniquely divisible Bloch group of Qbar is zero. The proof uses the distinguished solution only. There is no congruence-subgroup hypothesis and no converse.

**Proof route.**

1. The fixed-extension comparison gives R_ζ(η_E)=[u_n^n]^{-1}. Since u_n^s∈E_n×, R_ζ(sη_E)=1, so good-order injectivity over E gives sη_E∈nB_CGZ(E).
2. Apply the parent torsion-criterion-for-the-cgz-bloch-group: compare CGZ’s group with Suslin’s group through a kernel and cokernel killed by 2, then use finitely generated K₃(E)^ind and torsion-from-unbounded-orders. Do not assert that B_CGZ(E) itself is finitely generated. Conclude η_E is torsion.
3. For each embedding σ:F→C, the baseline algebraic embedding-extension theorem supplies an extension τ:E→C. Regulator functoriality gives ∑_iD(σX_i)=∑_iD(τX_i)=0, because η_E is torsion.
4. Apply the parent number-field regulator criterion to the rationalized ξ_F; all its embedding regulators vanish, so ξ_F=0. For integral A the same criterion gives torsion of its integral class.
5. For the modular application intersect Γ with Γ(6D M_E). Positive powers U^u,T^v of the lower and upper unipotents lie in this intersection. The matrices U^uT^{kv} have d=1+ukv≡1 modulo 6D M_E and b=kv, hence gcd(b,d)=1 and unbounded positive good d. The actual-multiplier comparison supplies u_d^s∈F_d×.
6. The introductory endpoint is then the parent map to the uniquely divisible Bloch group of Qbar: torsion maps to zero. This proves only the distinguished-solution implication and uses an arbitrary finite-index Γ.

**Direct inputs.** [HabiroNahmSeries:HB.5/comparison-of-expansions](#habironahmseries-hb-5-comparison-of-expansions), [HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses](#habironahmseries-hb-5-excluded-primes-and-hypotheses), [HabiroNahmSeries:HB.5/torsion-criterion-for-the-cgz-bloch-group](#habironahmseries-hb-5-torsion-criterion-for-the-cgz-bloch-group), [HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp](#habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp), [HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing](#habironahmseries-hb-4-unit-corollary-and-nonvanishing), [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.5a/supplier-interface](#habironahmseries-hb-5a-supplier-interface), `HabiroNumberFields:HB.2/R-injectivity-and-image`, [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison), [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison).

**Acceptance.**

- For A = (2) with the Rogers-Ramanujan data the conclusion is that xi_A is torsion, which is true and can be checked independently by the five-term certificates of K3BlochGroups V.6.
- For A = (8 5; 5 4) the theorem says nothing, because that Nahm sum is not modular; the class is nonetheless torsion, which is why the converse cannot be read off.
- The theorem does not assert the converse for a general A, and it does not turn the torsion of the class into a modularity test; both are recorded as non-conclusions.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.5, printed p. 40. The theorem; 'modular function' means invariance under a finite-index subgroup (p. 40, before the theorem). [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, printed p. 40. Steps 3 to 5; the exponent r there is the node's s (the source reuses r, which also denotes the rank of A).


<a id="habironahmseries-hb-5-boundaries-of-the-implication"></a>

### What this layer does not prove

**Application** · `HabiroNahmSeries:HB.5/boundaries-of-the-implication` · [packet](../packets/HabiroNahmSeries.json)

Four statements are explicitly not proved and must not be inferred. First, the converse (vanishing of the Bloch class implies modularity) is not proved for general A; CGZ record that it had no sufficiently precise formulation, and the precise form (a) implies (c) of Section 7.1 remains a conjecture. Second, torsion of the class is not a modularity test: for A = (8 5; 5 4) the class is torsion and no f_{A,B,C} is modular (CGZ citing Zagier). Third, the theorem is for invariant functions of weight zero; CGZ Remark 7.7 sketches why a modular FORM of non-zero weight is impossible, and that reduction is not formalised here, so no statement about modular forms of non-zero weight follows from this layer. Fourth, the finite-index generality is kept as the stage text requires; that a modular Nahm sum is automatically modular for a congruence subgroup, which CGZ Remark 7.6 calls a standard conjecture, is now a theorem (Calegari-Dimitrov-Tang, J. Amer. Math. Soc. 38 (2025) 627-702, Theorem 1.0.1, applied to f times a power of Delta), and is not used anywhere.

**Hypotheses and conventions.** The four items are statements about the theorem, each with the source passage that records it. The third item is a non-conclusion: CGZ's sketch would need weight-k slash actions with multiplier systems, which no node plans. The fourth item cites a result later than the source; it changes nothing in the proof.

**Proof route.**

1. State each non-conclusion with its source passage.
2. For the second, point to the counterexample data of HB.5/nahm-conjecture-statement and HB.10.
3. For the third, record that Remark 7.7 is a sketch (an extra factor h^{-k} in (53)) and is not planned.
4. For the fourth, record that no prerequisite of any HB.5 node is a congruence statement.

**Direct inputs.** [HabiroNahmSeries:HB.5/modularity-implies-torsion](#habironahmseries-hb-5-modularity-implies-torsion), [HabiroNahmSeries:HB.5/nahm-conjecture-statement](#habironahmseries-hb-5-nahm-conjecture-statement).

**Acceptance.**

- The implication proved is (c) implies (b) and nothing more.
- A future layer that wants the converse must state it as a conjecture with its own source, not as a consequence of this one.
- A statement of the form the Bloch class is torsion therefore the Nahm sum is modular is false as stated, by the counterexample.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Remark 7.7, printed p. 41. The third item, verbatim. [cgz](https://arxiv.org/pdf/1712.04887v3): Section 1.3, printed p. 5. The first item, verbatim.


<a id="habironahmseries-hb-5-valuation-bound-at-every-cusp"></a>

### The valuation of a modular Nahm sum at a good cusp is bounded below by -lambda, with equality at 0

**Theorem** · `HabiroNahmSeries:HB.5/valuation-bound-at-every-cusp` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.5/unrestricted-cusp-valuation-bound](#habironahmseries-hb-5-unrestricted-cusp-valuation-bound). Its hypotheses and limitations govern this target and the API names below.

Let A,B,C be as above and f=f_{A,B,C} be invariant under an arbitrary finite-index Γ≤SL₂(Z). The parent growth argument makes f meromorphic at all cusps. For P∈P¹(Q), define v_P as the least exponent in e(τ) in f∘γ with γ∞=P, so a cusp-width-w expansion with least integer k has v_P=k/w. Then v_P≥C_0(A):=-Λ/(4π²) for every P, v_0=C_0(A), and v_∞=min_{n∈N^r}Q(n)≥C_0(A). Consequently C=Q(0)≥C_0(A). Under Q(n)≥C for every n, v_∞=C. There is no general claim that equality with C_0 is equivalent to B=0.

**Proof route.**

1. Import the parent finite-principal-part and width argument; holomorphy and invariance alone would not suffice.
2. For reduced P=a/c, c>0, put τ=a/c+it/(2π). The inverse transform has imaginary part 2π/(c²t), so the nonzero leading Laurent coefficient gives log|f(τ)|=-4π²v_P/(c²t)+O(1).
3. The every-order root bound gives log|f(τ)|≤Λ/(c²t)+O(1). Compare the exponents to obtain v_P≥-Λ/(4π²), with no restriction on c. At zero the positive q=1 leading constant forces equality.
4. A positive power of the lower unipotent matrix belongs to Γ by finite index. It sends infinity to a finite cusp; Γ-invariance identifies its valuation with v_∞. The finite-cusp result therefore covers infinity.
5. Positive definiteness makes Q coercive on N^r, so its minimum exists. The product denominators have leading coefficient one and nonnegative coefficients; minimal terms cannot cancel, proving v_∞=min Q. Since min Q≤Q(0)=C, deduce C≥C_0. The additional minimum-at-zero hypothesis is needed only for v_∞=C.

**Direct inputs.** [HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp](#habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp), [HabiroNahmSeries:HB.5/expansion-at-one](#habironahmseries-hb-5-expansion-at-one), [HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp](#habironahmseries-hb-5a-radial-growth-at-a-cusp), [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](#habironahmseries-hb-4-radial-asymptotic-expansion), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations).

**Acceptance.**

- Rogers-Ramanujan (2, 0, -1/60): C_0 = -1/60 = v_0(f) = v_infinity(f) = C; equality at 0 and at infinity.
- Rogers-Ramanujan (2, 1, 11/60): v_infinity(f) = C = 11/60 > C_0 = -1/60; the inequality at infinity is STRICT, so the statement 'equality at infinity for both Rogers-Ramanujan triples' is false.
- Rank one: C_0(1) = -1/48, C_0(2) = -1/60, C_0(1/2) = -1/40, which are exactly the C of the modular triples (1, 0, -1/48), (2, 0, -1/60), (1/2, 0, -1/40); with GZ's printed sign one would get +1/48, +1/60, +1/40, and (55) would fail for (2, 0, -1/60).
- The inequality is strict at a cusp not Gamma-equivalent to 0 where the expansion vanishes identically, the phenomenon of CGZ Remark 7.3.

**Sources.** [gz](https://arxiv.org/pdf/1812.07690v1): Section 7, Proposition 7.1, (52), p. 14. The statement; the node restricts it to the cusps the proof reaches (source issue HabiroNahmSeries/E24). [gz](https://arxiv.org/pdf/1812.07690v1): Proof of Proposition 7.1, (53)-(54), p. 14. The proof, which uses Theorem 3.1 at the order c. [gz](https://arxiv.org/pdf/1812.07690v1): Section 7, (51), p. 13. The definition, whose sign the node corrects (source issue HabiroNahmSeries/E23). [gz](https://arxiv.org/pdf/1812.07690v1): Section 7, after Proposition 7.1, (55), p. 14. The consequence at infinity, recorded as unproved (gap).


<a id="habironahmseries-hb-5-introductory-formulation"></a>

### The introductory formulation: xi_A vanishes in the Bloch group of Qbar (CGZ Theorem 1.8)

**Theorem** · `HabiroNahmSeries:HB.5/introductory-formulation` · [packet](../packets/HabiroNahmSeries.json)

Under the hypotheses of HB.5/modularity-implies-torsion, for every field embedding sigma of F_A into an algebraic closure Qbar of Q, the image of xi_A in B_CGZ(Qbar) is zero.

**Hypotheses and conventions.** Same datum and invariance hypothesis as HB.5/modularity-implies-torsion. B_CGZ(Qbar) is uniquely divisible (Suslin), hence torsion free; this is imported through HB.3/torsion-in-the-algebraic-closure.

**Proof route.**

1. Apply HB.5/modularity-implies-torsion: xi_A is torsion.
2. The image of a torsion element in a torsion-free group is zero (HB.3/torsion-in-the-algebraic-closure).

**Direct inputs.** [HabiroNahmSeries:HB.5/modularity-implies-torsion](#habironahmseries-hb-5-modularity-implies-torsion), [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure).

**Acceptance.**

- A = (2): the image of xi_A in B(Qbar) is zero, while xi_A itself is a non-zero torsion element of B(Q(sqrt 5)) in general; the node asserts vanishing only after the base change.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 1.8 (Nahm's Conjecture), printed p. 6. Verbatim (tilde f in the source). [cgz](https://arxiv.org/pdf/1712.04887v3): Section 1.3, printed p. 6, after Theorem 1.8. The reduction to Theorem 7.5.


### HB.5 finer contracts

These 7 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-5-residue-class-majorant"></a>

### The positive residue-class majorant

**Construction** · `HabiroNahmSeries:HB.5/residue-class-majorant` · [packet](../packets/HabiroNahmSeries--HB.5.json)

Let r≥0, A∈M_r(Q) be symmetric positive definite, B∈Q^r, C∈Q, m≥1, t>0, Q(n)=n^t A n/2+B^t n+C and P(q,k)=∏_{j=1}^k(1-q^j), using the existing finite q-Pochhammer symbol. Define M_{A,B,C;m}(t)=∑_{n∈N^r} exp(-t Q(n))/∏_i P(exp(-m²t),⌊n_i/m⌋). This absolutely convergent positive real series is equivalently ∑_{s∈{0,…,m-1}^r} exp(-t Q(s)) f_{A,(As+B)/m,0}(i m²t/(2π)). The datum A is unchanged; the shifted linear term and zero constant are essential. This is a construction on the parent analytic Nahm datum, not a new Nahm-sum or q-product definition.

**Hypotheses and conventions.** m≥1 and t>0 for convergence and all analytic claims. The underlying Nahm sum uses exp(2πiτ Q(n)), not a branch of q raised to a rational power. Outside t>0 the prototype uses the usual total real sum; no analytic API is asserted there.

**Proof route.**

1. Use coordinatewise division with remainder, supplied by Nat.residueClassesEquiv, to write n=mℓ+s uniquely.
2. Symmetry gives Q(mℓ+s)=m²[ℓ^t Aℓ/2+((As+B)/m)^tℓ]+Q(s). The block denominator becomes ∏_i P(exp(-m²t),ℓ_i).
3. Each of the finitely many shifted Nahm sums converges by the parent analytic-series construction. Positive factors permit regrouping; the equality proves convergence and strict positivity without a new convergence theory.

**Direct inputs.** [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), `QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`, `mathlib:Matrix.PosDef`, `mathlib:Nat.residueClassesEquiv`, `mathlib:Finset.prod_range_succ`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `residueMajorant_eq_tsum` | characterisation | M_{A,B,C;m}(t)=∑_{n∈N^r} exp(-tQ(n))/∏_i P(exp(-m²t),⌊n_i/m⌋), with the empty product equal to one. |
| `residueMajorant_summable` | structure | For A symmetric positive definite, m≥1 and t>0, the displayed real summand is summable. |
| `residueMajorant_pos` | characterisation | For A symmetric positive definite, m≥1 and t>0, M_{A,B,C;m}(t)>0. |
| `residueMajorant_quadratic_split` | relation | For symmetric A, ℓ∈N^r and s∈{0,…,m-1}^r, Q(mℓ+s)=m²[ℓ^t Aℓ/2+((As+B)/m)^tℓ]+Q(s). |
| `residueMajorant_split` | compatibility | For A symmetric positive definite and t>0, M=∑_s exp(-tQ(s)) f_{A,(As+B)/m,0}(i m²t/(2π)); in the prototype each shifted f is written as its literal real series. |
| `residueMajorant_order_one` | compatibility | M_{A,B,C;1}(t)=f_{A,B,C}(it/(2π)); the right side uses the parent definition, and its literal positive series in the prototype. |
| `residueMajorant_rank_zero` | simp | For rank zero, M_{∅,∅,C;m}(t)=exp(-Ct). |
| `residueMajorant_shift_constant` | relation | M_{A,B,C+u;m}(t)=exp(-ut) M_{A,B,C;m}(t), for u∈Q, A symmetric positive definite and t>0. |

**Discriminating tests.**

- **`majorant_rank_one_even_order`** (computation): For A=(2), B=(1), C=11/60, m=2 and t>0, M=e^{-11t/60}∑_{ℓ≥0} e^{-4t(ℓ²+ℓ/2)}/P(e^{-4t},ℓ)+e^{-131t/60}∑_{ℓ≥0} e^{-4t(ℓ²+3ℓ/2)}/P(e^{-4t},ℓ).
- **`majorant_empty_rank`** (degenerate): For rank zero, C=7, m=2 and t=log 2, M=1/128.
- **`majorant_original_axis`** (compatibility): For A=(2), B=(1), C=11/60 and m=1, M=∑_{n≥0} exp[-t(n²+n+11/60)]/P(exp(-t),n), t>0.
- **`majorant_constant_shift`** (computation): For A=(2), B=(1), m=2 and t>0, M with C=71/60 is exp(-t) times M with C=11/60.

**Acceptance.**

- For m=1 the majorant is exactly the original positive imaginary-axis Nahm sum.
- The empty-rank majorant is exp(-Ct), including C≠0.
- At m=2 the base is exp(-4t), not exp(-2t), and every residue shift retains A.

**Sources.** [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §4.3, equations (24)–(25), pp. 227–228. Adaptation: the source groups Nahm summands by congruence classes; this new positive majorant discards their phases and uses the block-product estimate. Its exact reindexing identity is proved above, not claimed to be printed in GZ.


<a id="habironahmseries-hb-5-block-product-lower-bound"></a>

### A uniform lower bound for finite products at roots of unity

**Theorem** · `HabiroNahmSeries:HB.5/block-product-lower-bound` · [packet](../packets/HabiroNahmSeries--HB.5.json)

For every m≥1 there is c_m>0 such that, for every primitive complex m-th root ζ, 0<t≤1 and N≥0, |P(ζ exp(-t),N)|≥c_m P(exp(-m²t),⌊N/m⌋). The constant is uniform in N,t and the finitely many primitive ζ. One may take c_1=c_2=1. This statement needs neither odd m nor coprimality to a Nahm denominator.

**Hypotheses and conventions.** P is the existing finite q-Pochhammer product. Only positive real t is used; no full asymptotic expansion at the root is asserted.

**Proof route.**

1. Write N=mL+s, 0≤s<m. For the block mk+j, 1≤j≤m, compare exp[-t(mk+j)] with ρ_k=exp[-tm(k+1)].
2. For j<m, ζ^j≠1. The positive function |1-ζ^j u| has a positive minimum on 0≤u≤1; its logarithm has bounded derivative there. The mean-value theorem bounds the log difference by C_m m t exp(-mkt). The j=m factors agree exactly.
3. The factorization X^m-1=∏_{j=1}^m(X-ζ^j), from X_pow_sub_C_eq_prod, gives ∏_{j=1}^m |1-ζ^jρ_k|=1-exp[-m²t(k+1)]. Sum the log errors: t∑_{k≥0}exp(-mkt)=t/(1-exp(-mt))≤1/(1-exp(-m)) for 0<t≤1, by concavity of 1-exp(-mt).
4. The remaining s factors have phases ζ^j≠1 and contribute a fixed positive lower bound. Exponentiate the bounded total error and take the minimum over primitive roots.
5. For m=1 equality holds. For m=2, pair (1+e^{-(2k+1)t})(1-e^{-(2k+2)t})≥1-e^{-(4k+4)t}; a leftover odd factor is at least one.

**Direct inputs.** `QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`, `mathlib:Finset.prod_range_succ`, `mathlib:X_pow_sub_C_eq_prod`, `mathlib:norm_image_sub_le_of_norm_deriv_le_segment`, `mathlib:tsum_geometric_of_lt_one`.

**Acceptance.**

- At m=2, N=1, the right-hand product is empty and the left is 1+e^{-t}≥1.
- At m=1 the products agree for every N.
- The proof bounds the total error over all blocks, rather than paying a constant loss per block.

**Sources.** [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §4.1, the first display in the proof of Lemma 2.1, p. 225. New elementary adaptation of the source’s residue grouping of q-product factors. GZ does not state this bound; the proof here supplies it independently and does not extend Theorem 3.1 to forbidden orders.


<a id="habironahmseries-hb-5-growth-at-all-roots-of-unity"></a>

### An exponential upper bound at every root of unity

**Theorem** · `HabiroNahmSeries:HB.5/growth-at-all-roots-of-unity` · [packet](../packets/HabiroNahmSeries--HB.5.json)

For A symmetric positive definite rational, B,C rational, m≥1 and integers a with gcd(a,m)=1, set Λ=∑_i L_CGZ(X_i)≥0 (strictly positive when r>0) using the parent distinguished solution and complementary Rogers convention. Then |f_{A,B,C}(a/m+it/(2π))|≤c_m^{-r}M_{A,B,C;m}(t) for 0<t≤1, and this is O(exp(Λ/(m²t))) as t→0+. More precisely M=exp(Λ/(m²t))(∑_s K_{A,(As+B)/m}+O(t)), with each K>0. No nonvanishing of the original root expansion is needed.

**Hypotheses and conventions.** The function is the holomorphic parent analytic Nahm sum. m is arbitrary, including even m and m sharing primes with a strong denominator. The asymptotic constant at q=1 is positive for every shifted rational B; Λ depends only on A.

**Proof route.**

1. The complex exponential numerator has modulus exp(-tQ(n)); apply the block-product lower bound in each coordinate.
2. Absolute convergence and norm_tsum_le_tsum_norm give the first inequality, using summability of the majorant.
3. Use the finite residue-splitting API. Each shifted datum has the same A, and its positive imaginary-axis expansion is the parent expansion-at-one with C=0 and variable m²t.
4. The finite weights exp(-tQ(s))=1+O(t) preserve the leading sum of positive constants. This yields the claimed O bound and covers a vanishing original radial series as well.

**Direct inputs.** [HabiroNahmSeries:HB.5/residue-class-majorant](#habironahmseries-hb-5-residue-class-majorant), [HabiroNahmSeries:HB.5/block-product-lower-bound](#habironahmseries-hb-5-block-product-lower-bound), [HabiroNahmSeries:HB.4/analytic-nahm-sum](#habironahmseries-hb-4-analytic-nahm-sum), [HabiroNahmSeries:HB.5/expansion-at-one](#habironahmseries-hb-5-expansion-at-one), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `mathlib:norm_tsum_le_tsum_norm`.

**Acceptance.**

- The bound at m=1 is an equality of positive functions before taking the asymptotic.
- m=2 is covered with c_2=1 even though GZ Theorem 3.1 requires odd orders.
- For A=(2), Λ=π²/15, so the bound at a primitive second root is O(exp(π²/(60t))).

**Sources.** [zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf): II.3B, (29), p. 48; II.3C, general-rank conclusion on p. 55, continued on p. 56. The displayed leading coefficient on p. 55 and the positive constant (29) give the q=1 rate for every shifted B. The all-order majorant itself is the new argument, not a claim that the source proves unrestricted root asymptotics. [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §4.3, (24)–(25); §7, proof of Proposition 7.1. The source’s root growth is used for cusp valuations; the present upper bound fills the missing orders without requiring a full asymptotic series.


<a id="habironahmseries-hb-5-unrestricted-cusp-valuation-bound"></a>

### The cusp valuation bound at every cusp, including infinity

**Theorem** · `HabiroNahmSeries:HB.5/unrestricted-cusp-valuation-bound` · [packet](../packets/HabiroNahmSeries--HB.5.json)

Let A,B,C be as above and f=f_{A,B,C} be invariant under an arbitrary finite-index Γ≤SL₂(Z). The parent growth argument makes f meromorphic at all cusps. For P∈P¹(Q), define v_P as the least exponent in e(τ) in f∘γ with γ∞=P, so a cusp-width-w expansion with least integer k has v_P=k/w. Then v_P≥C_0(A):=-Λ/(4π²) for every P, v_0=C_0(A), and v_∞=min_{n∈N^r}Q(n)≥C_0(A). Consequently C=Q(0)≥C_0(A). Under Q(n)≥C for every n, v_∞=C. There is no general claim that equality with C_0 is equivalent to B=0.

**Hypotheses and conventions.** Γ has finite index; it need not be congruence. The valuation is normalized by e(τ), not by the width parameter; its value is rational. The distinguished solution and Rogers sign are fixed as in the parent.

**Proof route.**

1. Import the parent finite-principal-part and width argument; holomorphy and invariance alone would not suffice.
2. For reduced P=a/c, c>0, put τ=a/c+it/(2π). The inverse transform has imaginary part 2π/(c²t), so the nonzero leading Laurent coefficient gives log|f(τ)|=-4π²v_P/(c²t)+O(1).
3. The every-order root bound gives log|f(τ)|≤Λ/(c²t)+O(1). Compare the exponents to obtain v_P≥-Λ/(4π²), with no restriction on c. At zero the positive q=1 leading constant forces equality.
4. A positive power of the lower unipotent matrix belongs to Γ by finite index. It sends infinity to a finite cusp; Γ-invariance identifies its valuation with v_∞. The finite-cusp result therefore covers infinity.
5. Positive definiteness makes Q coercive on N^r, so its minimum exists. The product denominators have leading coefficient one and nonnegative coefficients; minimal terms cannot cancel, proving v_∞=min Q. Since min Q≤Q(0)=C, deduce C≥C_0. The additional minimum-at-zero hypothesis is needed only for v_∞=C.

**Direct inputs.** [HabiroNahmSeries:HB.5/growth-at-all-roots-of-unity](#habironahmseries-hb-5-growth-at-all-roots-of-unity), [HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp](#habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp), [HabiroNahmSeries:HB.5/expansion-at-one](#habironahmseries-hb-5-expansion-at-one), [HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp](#habironahmseries-hb-5a-radial-growth-at-a-cusp), [HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses](#habironahmseries-hb-5-excluded-primes-and-hypotheses).

**Acceptance.**

- Rogers–Ramanujan A=(2), B=0, C=-1/60 has v_0=-1/60 and C_0=-1/60, fixing the sign.
- An even-denominator cusp and the infinity orbit of Γ(M) are included without moving either to an odd good-order cusp.
- For the analytic datum A=(2), B=-3, C=5, the infinity expansion has valuation 3 and leading coefficient 2, not valuation C=5; this checks the minimum convention, without asserting modularity of this datum.

**Sources.** [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §7, (50)–(54), pp. 233–235, Proposition 7.1. Corrected sign and completion of the printed restricted proof: parent E23–E24. The all-order upper bound supplies finite cusps, and a finite-index lower-unipotent orbit supplies infinity.


<a id="habironahmseries-hb-5-fixed-extension-constant-term-lift"></a>

### The constant-term Kummer class over the fixed extension

**Comparison** · `HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift` · [packet](../packets/HabiroNahmSeries--HB.5.json)

For rational A,B fix a positive integer D divisible by 24, clearing the entries of A and B and satisfying the strong-denominator condition for Q(n)=n^t A n/2+B^t n. Let E=F(X_1^{1/D},…,X_r^{1/D},ζ_D), independent of the varying root order n, and let η_E=∑_i[X_i] in B_CGZ(E). Then η_E is an integral Bloch element. For n coprime to 6D M_E, where M_E=6|disc(E)||K₂(O_E)|, the HB.4 expansion in the Dedekind normalization specified below has u=Φ_ζ(0)≠0 algebraic with u^n∈E_n=E(ζ), and its Kummer class satisfies [u^n]=R_ζ(η_E)^{-1} in E_n×/(E_n×)^n. This is the constant-term form of Corollary 7.2 over E; it is conditional on the imported HB.4 coefficient-descent and eigenspace statement. It makes no integer-valued-Q assumption and does not reduce B(F)⊗Q modulo n.

**Hypotheses and conventions.** A is symmetric positive definite rational; X is its positive distinguished solution. D is divisible by 24 and may be enlarged to meet all denominator requirements; E is fixed once A,B are fixed. This enlargement includes the roots needed for multiplier renormalization. The corrected HB.4 simplified-form-and-the-unit supplies u^n∈E_n, the inverse P_ζ class in the Kummer extension and the χ^{-1} eigenspace. Their proof obligation is recorded separately. n coprime to M_E implies n odd, μ_n(E)=1 and the good-order injectivity hypotheses over E. In published GZ (17), write ν_a=e(r(n−1)(n−2)a/(24n)) and let Φ_GZ be the constant-series factor after removing ω. For μ_a=e(r s(a,n)/2), define Φ_ζ=(ν_a/μ_a)Φ_GZ. The parent’s explicitly displayed G·product·S expression must be multiplied by this ratio when the Dedekind multiplier is used.

**Proof route.**

1. Put Y_i=X_i^{1/D}. Since D A_ij are integers, X_i=Y_i^D and 1-X_i=∏_jY_j^{D A_ij}. The boundary ∑X_i∧(1-X_i)=D∑_{i,j}(D A_ij)Y_i∧Y_j cancels by symmetry. Hence ∑[X_i] belongs to the integral Bloch group of E.
2. Since 12n s(a,n) is an integer, ν_a/μ_a has order dividing 24n. With 24 dividing D, E_n contains this ratio. Renormalizing Φ by it preserves coefficient descent over E_n and changes Φ(0)^n by an n-th power of an E_n element, so its Kummer class and eigenspace are unchanged. This is a normalization check, not a proof of the imported HB.4 descent inputs.
3. The parent HB.4 corrected constant-term statement is over exactly this fixed radical/cyclotomic extension. Use it with η_E, whose symbols are integral here; do not apply the parent integer-valued-only unit-corollary to the original rationalized class.
4. For n prime to 6, CGZ Lemma 2.4(b) and (23) make the class of D_ζ(1) trivial modulo n-th powers. The image of [u^{-n}] in the Kummer quotient is therefore P_ζ(η_E).
5. The same imported HB.4 statement puts [u^{-n}] in the χ^{-1} eigenspace. The unique-lift characterization of R_ζ (HabiroNumberFields:HB.2/the-map-R-zeta, Proposition 2.5 and Remark 2.6) identifies this lift with R_ζ(η_E).

**Direct inputs.** [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `HabiroNumberFields:HB.2/kummer-value-P`, `HabiroNumberFields:HB.2/the-map-R-zeta`, `HabiroNumberFields:HB.1/the-excluded-primes`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-sum`, [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison), [HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface](#habironahmseries-hb-4-coefficientwise-kummer-descent-interface).

**Acceptance.**

- E depends on D,A,B but not on n; using a new radical field for each n would not yield a fixed exceptional integer.
- For integral A, ∑[X_i] already lies in B(F); the finite-extension statement specializes to the usual integral case.
- For n=1 both Kummer classes are trivial. For general n the exponent is n on u and the class is the inverse of R, not R itself.
- Changing from the GZ binomial multiplier to the Dedekind multiplier rescales Φ; leaving its explicitly displayed S-series formula unchanged is not valid. The fixed E includes ζ_24.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): §2.2, Lemma 2.4(b), (23), pp. 10–11; §2.3, Proposition 2.5 and Remark 2.6, p. 13. The uniqueness characterization identifies the Kummer lift. Apply it to E, not to the rationalized original Bloch class. [cgz](https://arxiv.org/pdf/1712.04887v3): §7.1, (44) and Corollary 7.2, pp. 36–37. Constant-term adaptation using the parent’s corrected coefficient field and actual multiplier. The parent HB.4 statement supplies the three descent inputs; this node does not assert an independent proof of them. [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §3, Theorem 3.1, (17)–(20), p. 224. The source multiplier is the binomial phase, raised to rank r. The Dedekind normalization rescales the series by ν_a/μ_a; it is not the unchanged formula in GZ. [cgz-published](https://math.uchicago.edu/~fcale/papers/CGZ.pdf): §7.1, Theorem 7.1, (45)–(46), and Corollary 7.2, p. 419. Version-of-record collation of the v3 constant-term passage; no proof of the requested rational-data descent is claimed here.


<a id="habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier"></a>

### Bounded powers with the actual Dedekind multiplier

**Comparison** · `HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier` · [packet](../packets/HabiroNahmSeries--HB.5.json)

Assume the modularity hypotheses and notation of the parent expansion-at-one. Put λ=Λ/(4π²)∈Q and K=det(Ã)^{-1/2}∏_iX_i^{B_i}(1-X_i)^{-1/2}>0. For γ=(a b;c d)∈Γ, d>0 a good odd order, ζ=e(b/d), μ_b=e(r s(b,d)/2), and ω_d=d^{-r/2}det(Ã)^{-1/2}∏_i(1-X_i)^{1/2}, the Dedekind-normalized expansion constant (Φ_ζ=(ν_b/μ_b)Φ_GZ, ν_b=e(r(d−1)(d−2)b/(24d))) is u=μ_b^{-1}ω_d^{-1}e(-Cb/d)e(-λc/d)K≠0. For one positive integer s divisible by 24, 2den(B), den(C) and den(λ), u^s∈F_d×⊂E_d× for every such d, with s independent of d. This extends the parent comparison-of-expansions to rational data without absorbing a general Gauss phase into a fixed μ.

**Hypotheses and conventions.** The parent meromorphic-at-cusps argument is used before claiming rationality of λ or a uniform complex expansion. Use μ_b and the rescaled Φ specified in fixed-extension-constant-term-lift. The Gauss factor remains inside Φ. The unrescaled GZ series uses ν_b instead of μ_b. Every denominator denotes a positive common denominator; s is independent of γ,d.

**Proof route.**

1. Use ε=dh/(1-ich/(2π)). Matrix algebra gives γ(iε/(2π))=(b+ih/(2π))/d and 1/ε=1/(dh)-ic/(2πd).
2. The finite Laurent principal part at cusp zero makes the modular q=1 expansion uniform at this complex ε. Compare it with the HB.4 expansion after the specified multiplier rescaling for f_{A,B,0}, multiplying the latter by e(Cb/d)e^{-Ch/d}. This gives the displayed inverse factors and negative phase; positivity of K gives u≠0.
3. K^{2den(B)}∈F× and ω_d²∈F× by their formulas. From the displayed rational definition of the classical Dedekind sum, 12d s(b,d) is an integer: expand the floor term and use ∑_{j=1}^{d-1}j²=d(d-1)(2d-1)/6 and ∑j=d(d-1)/2. Thus μ_b^{24}=e(12r s(b,d))∈Q(ζ_d).
4. Since sC and sλ are integers, the two remaining phases raised to s also lie in Q(ζ_d). Multiplication proves u^s∈F_d× with a fixed s; no integral-Q premise or special Rademacher congruence is required.

**Direct inputs.** [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](#habironahmseries-hb-5-fixed-extension-constant-term-lift), [HabiroNahmSeries:HB.5/expansion-at-one](#habironahmseries-hb-5-expansion-at-one), [HabiroNahmSeries:HB.5/nahm-sum-meromorphic-at-every-cusp](#habironahmseries-hb-5-nahm-sum-meromorphic-at-every-cusp), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](#habironahmseries-hb-4-simplified-form-and-the-unit), `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-sum`, [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison), [HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison](#habironahmseries-hb-4-nonzero-unit-series-descent-comparison).

**Acceptance.**

- For A=(2), B=0, C=-1/60 the phase is e(-λc/d), not e(+λc/d), with λ=1/60.
- s can be chosen divisible by 120 for that datum; taking s=120 handles every good d.
- Rational data A=(2/3), B=(1/3) keep their Gauss factor inside Φ and use the actual μ_b; they are not covered by the parent fixed-phase integer-valued normalization.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Proof of Theorem 7.5, p. 40, comparison of (53) and (43). Corrected comparison retaining ω and q^C, correcting the sign and using the actual Dedekind multiplier: inherited E19–E22. The elementary integrality computation replaces the fixed-phase argument. [zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf): II.3B, (28), p. 46 and (29), p. 48. Supplies the nonzero real leading constant and the exponential remainder under modularity; cusp meromorphy supplies the complex uniformity. [gz](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf): §3, Theorem 3.1, (17)–(20), p. 224. Checks the source normalization. Equivalently one can keep ν_b throughout; ν_b^24∈Q(ζ_d), so the same fixed-power argument works. The present node chooses the rescaled Dedekind convention. [cgz-published](https://math.uchicago.edu/~fcale/papers/CGZ.pdf): §7.3, proof of Theorem 7.5, comparison of (55) and (45), p. 423. The version of record retains the positive phase and omits ω and q^C in this comparison; the corrected comparison retains all three.


<a id="habironahmseries-hb-5-rational-bloch-arithmetic-bridge"></a>

### From bounded powers over one fixed field to the rational Bloch class

**Theorem** · `HabiroNahmSeries:HB.5/rational-bloch-arithmetic-bridge` · [packet](../packets/HabiroNahmSeries--HB.5.json)

Let A,B,C be rational Nahm data, F=Q(X_1,…,X_r), E the fixed extension above, η_E=∑[X_i]∈B_CGZ(E), and ξ_F=[δ∑[X_i]]⊗(1/δ)∈B_CGZ(F)⊗Q as in the parent rational construction. Suppose that for an unbounded set of positive integers n prime to 6D M_E the corrected root constants u_n are nonzero and satisfy u_n^s∈E_n× for one fixed s≥1. With the constant-term Kummer identity above, ξ_F=0. Applied to the modular bounded-power comparison, this supplies the missing rational-data bridge in the parent modularity-implies-torsion endpoint. If A is integral, the original integral ξ_A∈B_CGZ(F) is torsion.

**Hypotheses and conventions.** ξ_F is rationalized when A is rational; only the integral η_E is reduced modulo n. The set of good orders is unbounded, not merely a single prime or a fixed order. E,s,D and M_E are independent of n. Use the corrected constant-term Kummer identity, with its explicit HB.4 supplier obligation. For the introductory consequence use only the torsion-free algebraically closed target from HB.3/torsion-in-the-algebraic-closure; its finite-generation assertion is not used. The parent introductory-formulation is a consequence of the endpoint being supplied, not a proof input.

**Proof route.**

1. The fixed-extension comparison gives R_ζ(η_E)=[u_n^n]^{-1}. Since u_n^s∈E_n×, R_ζ(sη_E)=1, so good-order injectivity over E gives sη_E∈nB_CGZ(E).
2. Apply the parent torsion-criterion-for-the-cgz-bloch-group: compare CGZ’s group with Suslin’s group through a kernel and cokernel killed by 2, then use finitely generated K₃(E)^ind and torsion-from-unbounded-orders. Do not assert that B_CGZ(E) itself is finitely generated. Conclude η_E is torsion.
3. For each embedding σ:F→C, the baseline algebraic embedding-extension theorem supplies an extension τ:E→C. Regulator functoriality gives ∑_iD(σX_i)=∑_iD(τX_i)=0, because η_E is torsion.
4. Apply the parent number-field regulator criterion to the rationalized ξ_F; all its embedding regulators vanish, so ξ_F=0. For integral A the same criterion gives torsion of its integral class.
5. For the modular application intersect Γ with Γ(6D M_E). Positive powers U^u,T^v of the lower and upper unipotents lie in this intersection. The matrices U^uT^{kv} have d=1+ukv≡1 modulo 6D M_E and b=kv, hence gcd(b,d)=1 and unbounded positive good d. The actual-multiplier comparison supplies u_d^s∈F_d×.
6. The introductory endpoint is then the parent map to the uniquely divisible Bloch group of Qbar: torsion maps to zero. This proves only the distinguished-solution implication and uses an arbitrary finite-index Γ.

**Direct inputs.** [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](#habironahmseries-hb-5-fixed-extension-constant-term-lift), [HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier](#habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier), [HabiroNahmSeries:HB.5/torsion-criterion-for-the-cgz-bloch-group](#habironahmseries-hb-5-torsion-criterion-for-the-cgz-bloch-group), [HabiroNahmSeries:HB.5/torsion-from-unbounded-orders](#habironahmseries-hb-5-torsion-from-unbounded-orders), [HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses](#habironahmseries-hb-5-excluded-primes-and-hypotheses), `HabiroNumberFields:HB.2/R-injectivity-and-image`, `HabiroNumberFields:HB.1/the-excluded-primes`, [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](#habironahmseries-hb-3-torsion-criterion-by-regulators), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `mathlib:IsAlgClosed.surjective_domRestrict_of_isAlgebraic`, [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure), [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison).

**Acceptance.**

- An assertion about ξ_F modulo n would be invalid: B(F)⊗Q is divisible. Every reduction in this argument is of η_E.
- The field excluded integer is M_E, not merely M_F, after adjoining the fixed radicals.
- The pure group lemma is applied through Suslin’s finitely generated quotient, allowing the CGZ convention’s additional 2-primary ambiguity.
- For integral A the conclusion agrees with the parent integral torsion theorem; for rational A it is stated as zero in the rationalized group.

**Sources.** [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 7.5 and proof, p. 40; Remark 7.6, pp. 40–41. Refinement of the printed arithmetic argument: use one fixed enlarged field and an integral symbol there, then descend by regulators. The parent owns the endpoint; this node supplies its rational-data bridge. [cgz](https://arxiv.org/pdf/1712.04887v3): Theorem 1.2 and Remark 1.4, p. 3. Apply the good-order injectivity and finite exceptional integer to E. The absolute discriminant convention is from the supplier node. [cgz-published](https://math.uchicago.edu/~fcale/papers/CGZ.pdf): §7.3, Theorem 7.5, p. 422; proof (55) and Remark 7.6, p. 423. Version-of-record collation; this refinement keeps the fixed-field integral reduction and the regulator descent explicit.


## HB.8 — Admissibility, finite support and Gaussian comparison

There are two proof chains. The elementary chain begins with signed q-shift quotients, takes a full cyclotomic orbit, and obtains the t-deformed Nahm solution. Its logarithmic derivatives give a residue potential. All-root residues and integral plethystic quotients remove the possible cyclotomic poles of the DT coefficient functions; the resulting Laurent polynomials give finite support in arbitrary rank. This chain is independent of the unresolved Gaussian construction.

The Gaussian chain uses the same critical potential but must also control the determinant, cyclic prefactors and completions. For P=(q^(k+1)u exp(w);q)_∞, q=ζ exp(h), the local correction is

\[
\begin{aligned}
 \log\psi={}&\log P-\frac{\operatorname{Li}_2(u^m)}{m^2h}
 -\frac{\operatorname{Li}_1(u^m)}{mh}w
 -\frac{\operatorname{Li}_0(u^m)}{2h}w^2\\
 &+\sum_{s=0}^{m-1}\left(\frac{k+s+1}{m}-\frac12\right)
       \log(1-\zeta^{k+s+1}u).
\end{aligned}
\]

Its positive-weight completion allows w³/h. It is not the printed four-term removal in (114), and its local validity does not repair every global prefactor. G1 requires that reconciliation and the full affine-shift identities. G2 requires all-loop cancellation of vertex poles separately in each t_j and the justified passage to K((x))[[t]]. The determinant bound alone does not prove this. With those inputs, arbitrary-rank congruence uniqueness gives identification.

The corrected level-m denominator ring allows Φ_d poles when m∤d or when m|d and gcd(d/m,m)>1. The smaller printed ring fails already at A=0,m=2 through a Φ₄ pole. Restricted Adams decomposition exists uniquely in the stated ring; the all-rank cyclotomic cancellation and integral evaluation at ζ_m are G3. The full F_A residue lemma cannot be substituted for the congruence-series lemma.


<a id="habironahmseries-hb-8-formal-pochhammer-symbol"></a>

### The formal infinite Pochhammer symbol over Q(q)

**Construction** · `HabiroNahmSeries:HB.8/formal-pochhammer-symbol` · [packet](../packets/HabiroNahmSeries.json)

Define (x;q)_infinity in 1 + x Q(q)[[x]] by Euler's series sum_k (-1)^k q^{k(k-1)/2} x^k/(q;q)_k. Its image in Z((q))[[x]] is the q-adically convergent product prod_{j >= 0}(1 - q^j x) (QM.0's (x;q)_infinity after exchanging the order of the variables); log (x;q)_infinity = -sum_{l >= 1} x^l/(l(1 - q^l)); (1 - x)(qx;q)_infinity = (x;q)_infinity; and the automorphism q -> q^{-1} of Q(q) sends (x;q)_infinity to (x;q^{-1})_infinity = 1/(qx;q)_infinity. For a monomial c t^n (n != 0) the substitution gives (c t^n;q)_infinity in Q(q)[[t]].

**Hypotheses and conventions.** The coefficients are rational functions; the q -> q^{-1} identities are identities in Q(q)[[x]] and have no meaning in Z((q))[[x]]. Euler's identities are QM.0's; the logarithmic expansion follows from them by q-difference uniqueness.

**Proof route.**

1. Define the series and prove (1 - x)(qx;q)_infinity = (x;q)_infinity coefficientwise from (q;q)_k = (1 - q^k)(q;q)_{k-1}.
2. Prove that a series P in 1 + x Q(q)[[x]] with P(x) = (1 - x)P(qx) is unique; both (x;q)_infinity and exp(-sum_l x^l/(l(1-q^l))) satisfy it.
3. Apply q -> q^{-1} to the first identity and use uniqueness again to get (x;q^{-1})_infinity (qx;q)_infinity = 1.
4. Compare with QM.0/euler-first-identity for the product form in Z((q))[[x]].

**Direct inputs.** `QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`, `QSeriesPartitionsAndMockModularForms:QM.0/euler-first-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/euler-second-identity`, `mathlib:RatFunc`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.subst`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `eulerPoch` | data | (x;q)_infinity in Q(q)[[x]]. |
| `poch` | constructor | (c t^n; q)_infinity in Q(q)[[t]] by substitution. |
| `mvLog_poch` | characterisation | log (t^n;q)_infinity = -sum_l t^{ln}/(l(1-q^l)). |
| `poch_shift_one` | relation | (1 - t_j)(q t_j;q)_infinity = (t_j;q)_infinity. |
| `map_qInv_poch` | relation | (t_j;q^{-1})_infinity (q t_j;q)_infinity = 1. |
| `poch_toLaurentSeries` | compatibility | The image in Z((q))[[x]] is QM.0's product prod_j (1 - q^j x). |

**Discriminating tests.**

- **`euler_coeff_two`** (computation): The x^2-coefficient of (x;q)_infinity is q/((1-q)(1-q^2)).
- **`log_formula`** (characterisation): log (x;q)_infinity = -sum_l x^l/(l(1-q^l)) in Q(q)[[x]].
- **`qinv_identity`** (characterisation): (x;q^{-1})_infinity (qx;q)_infinity = 1.
- **`not_the_analytic_product`** (non-example): (x;q^{-1})_infinity is not the product prod_j (1 - q^{-j}x), which does not converge in Z((q))[[x]]; only the series definition gives it a meaning.

**Acceptance.**

- The x^2-coefficient is q/((1-q)(1-q^2)).
- log (x;q)_infinity at q = 1 + x' has polar part Li_2(x)/log(1+x') (GSWZ (47)).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, after (28), p. 11. The formal definition. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.1, eq. (46), p. 19. The logarithmic expansion. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, after (62), p. 20. The two functional identities.


<a id="habironahmseries-hb-8-admissible-series"></a>

### Admissible series

**Definition** · `HabiroNahmSeries:HB.8/admissible-series` · [packet](../packets/HabiroNahmSeries.json)

For N >= 1 and t = (t_1,...,t_N), a power series F in Q(q)[[t]] with F = 1 + O(t) is admissible when there are Laurent polynomials L_n in Z[q^{±1}], one for each non-zero n in N^N, with log F = -sum_{n != 0} sum_{l >= 1} L_n(q^l) t^{l n}/(l (1 - q^l)); the logarithm is the substitution of F - 1 into log(1+X), and the right side is coefficientwise a finite sum. For every F in 1 + t Q(q)[[t]] the displayed identity has a unique solution with L_n in Q(q); admissibility is the integrality of that solution. (GSWZ Definition 1.7.)

**Hypotheses and conventions.** N is a positive integer; coefficients lie in the field Q(q) = RatFunc Q, and t^{ln} is the monomial prod_i t_i^{l n_i}. F has constant coefficient 1, so log F = (log(1+X)).subst (F - 1) is defined (Mathlib PowerSeries.subst into MvPowerSeries). The rational functions L_n are determined by F by inverting the identity degree by degree in t (Moebius-type recursion over the l dividing every n_i).

**Proof route.**

1. Define log F as the substitution of F - 1 into PowerSeries.log, and the series admissibleLog(L) coefficientwise: at the multi-index e it is -sum over l >= 1 dividing every e_i of L_{e/l}(q^l)/(l(1 - q^l)).
2. Prove existence and uniqueness of rational L_n for every F in 1 + t Q(q)[[t]]: the coefficient of t^n of log F equals -L_n(q)/(1-q) plus terms involving L_{n/l} with l > 1, so L_n is determined recursively in the total degree.
3. Define admissibility as integrality: every L_n lies in the image of Z[q^{±1}].
4. Prove closure under products and inverses (the L_n add and change sign), under sigma_j (L_n becomes q^{n_j} L_n) and under q -> q^{-1} (L_n becomes -q L_n(q^{-1}), because 1/(1-q^{-l}) = -q^l/(1-q^l)); this is GSWZ (61).

**Direct inputs.** [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), `mathlib:MvPowerSeries`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.subst`, `mathlib:MvPowerSeries.rescale`, `mathlib:LaurentPolynomial`, `mathlib:RatFunc`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `Admissible` | data | The predicate on F in Q(q)[[t]]: constant coefficient 1 and log F = admissibleLog(L) for some L : N^N -> Z[q^{±1}] with L 0 = 0. |
| `admissibleLog` | constructor | For L : N^N -> Z[q^{±1}], the series -sum_{n != 0} sum_{l >= 1} L_n(q^l) t^{ln}/(l(1-q^l)), coefficientwise finite. |
| `Admissible.L` | projection | The Laurent polynomials L_n of an admissible series. |
| `Admissible.L_unique` | characterisation | If log F = admissibleLog(L') with L'_0 = 0 then L' = L. |
| `admissible_one` | simp | 1 is admissible with all L_n = 0. |
| `Admissible.mul` | constructor | FG is admissible and L^{FG} = L^F + L^G. |
| `Admissible.inv` | constructor | F^{-1} is admissible and L^{F^{-1}} = -L^F. |
| `Admissible.map_qInv` | functoriality | F(t,q^{-1}) is admissible with L_n replaced by -q L_n(q^{-1}) (GSWZ (61)). |
| `Admissible.shift` | functoriality | F(sigma_j t, q) is admissible with L_n replaced by q^{n_j} L_n. |
| `admissible_poch` | example | (t^n;q)_infinity is admissible with L_n = 1 and L_{n'} = 0 otherwise. |

**Discriminating tests.**

- **`pochhammer_admissible`** (computation): For N = 1, (t;q)_infinity is admissible with L_1 = 1 and L_n = 0 for n >= 2.
- **`qinv_pochhammer`** (computation): For N = 1, (t;q^{-1})_infinity = 1/(qt;q)_infinity is admissible with L_1 = -q.
- **`neg_t_not_admissible`** (non-example): (-t;q)_infinity is not admissible: its L_2 = 1/(1+q) is not a Laurent polynomial (a definition with L_n(q) in place of L_n(q^l) would accept it).
- **`integral_exponents_not_admissible`** (non-example): The series with log = -sum_l t^l/(l(1-q^l)^2), i.e. prod_{i >= 0}(q^i t;q)_infinity, is not admissible (L_1 = 1/(1-q)).
- **`product_admissible`** (characterisation): If F and G are admissible then L^{FG}_n = L^F_n + L^G_n for every n.
- **`rank_one_three_L`** (computation): For A = (3): L_1 = q^3, L_2 = q^7, L_3 = q^10 + q^11 + q^13.

**Acceptance.**

- For N = 1, (t;q)_infinity is admissible with L_1 = 1 and L_n = 0 for n >= 2, by the logarithmic expansion (46).
- (-t;q)_infinity is not admissible: its L_1 = -1 and L_2 = 1/(1+q).
- prod_{j >= 0}(1 - q^j t)^{j+1} = prod_{i >= 0}(q^i t;q)_infinity has integral product exponents c_{1,i} = 1 (i >= 0) and L_1 = 1/(1-q): integrality of the exponents is not admissibility.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Definition 1.7, eq. (27), Section 1.6, p. 11 (arXiv v2). The definition, transliterated. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, eq. (61), p. 20. The involution.


<a id="habironahmseries-hb-8-product-expansion-and-dt-exponents"></a>

### The product expansion and the Donaldson-Thomas exponents

**Theorem** · `HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents` · [packet](../packets/HabiroNahmSeries.json)

(a) Every F in 1 + t Z((q))[[t_1,...,t_N]] has a unique expansion F = prod_{n != 0} prod_{i in Z} (q^i t^n; q)_infinity^{c_{n,i}} with c_{n,i} in Z and, for each n, c_{n,i} = 0 for i < i_0(n); the product converges in Z((q))[[t]] (t-adically, and q-adically in each t-coefficient). Writing L_n = sum_i c_{n,i} q^i in Z((q)), log F = -sum_{n,l} L_n(q^l) t^{ln}/(l(1-q^l)) in Q((q))[[t]]. (b) A series F in 1 + t Q(q)[[t]] is admissible if and only if its image in Q((q))[[t]] lies in Z((q))[[t]] and for each n only finitely many c_{n,i} are non-zero; then L_n is its Laurent polynomial. (c) For admissible F, G(t,q) = F(qt,q)/F(t,q) = prod (q^i t^n;q)_{|n|}^{-c_{n,i}} and F(t,q)F(t,q^{-1}) = prod (q^{1-i} t^n;q)_{2i-1}^{-c_{n,i}} (with (a;q)_{-k} = 1/(aq^{-k};q)_k) lie in Z[q^{±1}][[t]].

**Hypotheses and conventions.** In (a) the coefficient ring is the Laurent series ring Z((q)), not the field Q((q)): over Q((q)) the exponents are not integral (F = 1 + t/2 gives sum_i c_{1,i} q^i = -(1-q)/2). The lower bound i_0(n) depends on n and need not be bounded below uniformly (indefinite A); the induction is on the t-degree |n|, not on the total degree of q^i t^n. (b) compares Q(q)[[t]] (Definition 1.7) with Z((q))[[t]] through the embedding Q(q) -> Q((q)).

**Proof route.**

1. Induction on |n|: after dividing F by the (convergent) product of the factors with |n'| < d, the remaining series is 1 + sum_{|n| = d} r_n(q) t^n + O(t^{d+1}) with r_n in Z((q)); since prod_i (q^i t^n;q)_infinity^{c_{n,i}} = 1 - sum_i c_{n,i} q^i t^n/(1-q) + O(t^{2n}), take c_{n,i} = the coefficients of -(1-q) r_n.
2. Convergence: for fixed n the factors with i >= i_0(n) are 1 + O(q^i t^n) (q-adic convergence in each t-coefficient); the product over n converges t-adically (mathlib MvPowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top for the outer product).
3. Take logarithms with the formal expansion of HB.8/formal-pochhammer-symbol to get L_n = sum_i c_{n,i} q^i.
4. (b): L_n is a Laurent polynomial exactly when the sum is finite; conversely an admissible F is the finite-support product, hence lies in Z((q))[[t]].
5. (c): from (1-x)(qx;q)_infinity = (x;q)_infinity and (x;q^{-1})_infinity = 1/(qx;q)_infinity (HB.8/formal-pochhammer-symbol).

**Direct inputs.** [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), `QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`, `mathlib:MvPowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`, `mathlib:LaurentSeries`.

**Acceptance.**

- For (t;q)_infinity the only non-zero exponent is c_{1,0} = 1.
- For A = (3) the exponents are non-negative and SUPPORTED IN 3n+1 <= i <= n^2+n+1 (plus c_{1,3} = 1); they are not all non-zero there: c_{n,n^2+n} = 0 for 3 <= n <= 12 (computed).
- prod_{i >= 0}(q^i t;q)_infinity has c_{1,i} = 1 for all i >= 0: a well-defined integral expansion of a non-admissible series.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, eqs. (28)-(29), p. 11. Statement (b). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, first paragraph, p. 24. Statement (a); the source's 'induction on the total degree of q^i t^n' is replaced by induction on the t-degree. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, eqs. (62)-(64), p. 20. Statement (c).


<a id="habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity"></a>

### Laurent expansion of rational functions at a root of unity

**Construction** · `HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity` · [packet](../packets/HabiroNahmSeries.json)

For a field K containing Q and zeta in K, the Q-algebra map E_zeta : Q(q) -> K((x)), q -> zeta + x (a rational function with a pole of order r at zeta goes to a Laurent series of valuation -r), extended coefficientwise to Q(q)[[t]] -> K((x))[[t]] and composed with t -> T^m. E_zeta is injective; on polynomials it is the Taylor expansion at zeta (compatible with HabiroCyclotomicCompletions:HC.3/the-taylor-map on the image of Z[q]); for L in Q(q) regular at zeta, E_zeta(L) = L(zeta) + L'(zeta)x + ... .

**Hypotheses and conventions.** K a field of characteristic 0, zeta in K; for the collections of GSWZ, K = Q(zeta_m) and zeta = zeta_m. The target of the coefficientwise extension is K((x))[[t]] (power series in t with Laurent coefficients), not K[[t]]((x)).

**Proof route.**

1. Compose the K-algebra automorphism q -> q + zeta of K(q) (fraction field of the Taylor shift) with the embedding K(q) -> K((x)).
2. Injectivity: a non-zero rational function has a non-zero Laurent expansion.
3. Coefficientwise extension via MvPowerSeries.map.

**Direct inputs.** `mathlib:RatFunc`, `mathlib:LaurentSeries`, `mathlib:Polynomial.taylor`, `mathlib:MvPowerSeries`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `expandAt` | data | E_zeta : Q(q) ->+* K((x)). |
| `expandAt_q` | simp | E_zeta(q) = zeta + x. |
| `expandAt_injective` | characterisation | E_zeta is injective. |
| `expandAt_taylor` | compatibility | On Z[q], E_zeta agrees with HC.3's Taylor map at zeta. |

**Discriminating tests.**

- **`expand_one_sub_q_at_one`** (computation): E_1(1/(1-q)) = -x^{-1}.
- **`expand_polynomial`** (compatibility): E_zeta(q^2) = zeta^2 + 2 zeta x + x^2.
- **`expand_injective`** (characterisation): E_zeta(f) = 0 implies f = 0.

**Acceptance.**

- E_zeta(1/(1-q)) = 1/(1-zeta) + x/(1-zeta)^2 + ... for zeta != 1 and -1/x for zeta = 1.
- The residue (x^{-1}-coefficient) of E_zeta(L(q^l)/(l(1-q^l))) for m | l, zeta = zeta_m, is -L(1) zeta/l^2.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, eq. (30), p. 11. The construction.


<a id="habironahmseries-hb-8-expansion-at-roots-of-unity"></a>

### Expanding an admissible series at a root of unity: the potential, the discriminant and the constants

**Construction** · `HabiroNahmSeries:HB.8/expansion-at-roots-of-unity` · [packet](../packets/HabiroNahmSeries.json)

Let F be admissible, m >= 1, zeta = zeta_m, q = zeta + x, T = t^{1/m}. Put V(t) = sum_n L_n(1) Li_2(t^n) in Q[[t]], log delta(t) = sum_n (L_n(1) - 2L_n'(1)) Li_1(t^n) in Q[[t]], and u_m(T) = ((m-1)/(2m)) sum_n L_n(1) Li_1(T^{mn}) + ((1-m)/m) sum_n L_n'(1) Li_1(T^{mn}) - sum_{j=1}^{m-1} sum_n (L_n(zeta^j)/(1-zeta^j)) sum_{k mod m} (zeta^{-kj}/m) Li_1(zeta^k T^n) in T Q(zeta)[[T]], U_m = exp(u_m). Then Phi_m(T^m, x) := F(T, zeta + x) lies in exp(V(T^m)/(m^2 log(1+x/zeta))) delta(T^m)^{-1/2} U_m(T) (1 + x T Q(zeta)[[T]][[x]]). Equivalently the x^{-1}-coefficient of log F(T, zeta + x) is zeta V(T^m)/m^2 and its x^0-coefficient is V(T^m)/(2m^2) - (1/2) log delta(T^m) + u_m(T). The first coefficient of u_m is +(m-1)/(2m); GSWZ (67) prints -(m-1)/(2m) (source issue E29).

**Hypotheses and conventions.** F is admissible; m >= 1; zeta a primitive m-th root of unity; x the local coordinate q = zeta + x; the expansion is the coefficientwise map of HB.8/laurent-expansion-at-a-root-of-unity followed by t -> T^m. V and delta are in Q[[t]] with V(0) = 0, delta(0) = 1; U_m is a power series in T = t^{1/m} over Q(zeta_m) with U_m(0) = 1 (it is not in Q[[t]]: for A = (3), U_2 = 1 + T/2 - 5T^2/8 + ...). L_n'(1) is the derivative at q = 1 of the Laurent polynomial L_n.

**Proof route.**

1. For l divisible by m, expand -L_n(q^l)/(l(1-q^l)) at q = zeta + x: it equals zeta L_n(1)/(l^2 x) + L_n(1)/(2l^2) - L_n(1)/(2l) + L_n'(1)/l + O(x) (GSWZ (71)); sum over l = mr and n.
2. For l = mr + j with 1 <= j <= m-1, the term is -L_n(zeta^j)/((mr+j)(1-zeta^j)) + O(x); sum over r with the finite Fourier identity sum_{k mod m} zeta^{-kj} Li_1(zeta^k T^n)/m = sum_{r} T^{n(mr+j)}/(mr+j).
3. Compare with V(T^m)/(m^2 log(1+x/zeta)) = zeta V(T^m)/(m^2 x) + V(T^m)/(2m^2) + O(x) and -(1/2) log delta(T^m): the remainder is u_m(T) with coefficient +(m-1)/(2m).
4. All x^k coefficients with k >= 1 are power series in T without constant term, since F(0,q) = 1.

**Direct inputs.** [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `Polylogarithms:P.1/classical-polylogarithm`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `admissibleExpansion` | data | F(T, zeta_m + x) in Q(zeta_m)((x))[[T]], i.e. Phi_m(T^m, x). |
| `potential` | data | V(t) = sum_n L_n(1) Li_2(t^n). |
| `logDiscriminantSeries` | data | log delta(t) = sum_n (L_n(1) - 2L_n'(1)) Li_1(t^n). |
| `logConstantSeries` | data | u_m(T) with the corrected sign, in T Q(zeta_m)[[T]]. |
| `admissibleExpansion_polar` | characterisation | The x^{-1}-coefficient of log Phi_m is zeta V(T^m)/m^2. |
| `admissibleExpansion_constant` | characterisation | The x^0-coefficient of log Phi_m is V(T^m)/(2m^2) - (1/2) log delta(T^m) + u_m(T). |
| `admissibleExpansion_zero` | simp | Phi_m(0, x) = 1. |

**Discriminating tests.**

- **`pochhammer_potential`** (computation): For (t;q)_infinity, V = Li_2(t) and delta = 1/(1-t).
- **`pochhammer_constant_m_two`** (computation): For (t;q)_infinity and m = 2, u_2(T) = -(1/2) log(1 + T), i.e. U_2 = (1 + t^{1/2})^{-1/2}; the printed sign of (67) gives (1 - t^{1/2})^{1/2}.
- **`constant_term_one`** (degenerate): Phi_m(0, x) = 1 for every m, and for F = 1 all of V, log delta, u_m vanish.
- **`polar_part_three`** (computation): For A = (3) and m = 2 the x^{-1}-coefficient of log F_A(T, -1 + x) is -V(T^2)/4 with V = t + 5t^2/4 + 28t^3/9 + ... .
- **`same_potential_different_series`** (non-example): (t;q)_infinity and (qt;q)_infinity have equal potentials and different log delta.

**Acceptance.**

- For F = (t;q)_infinity: V = Li_2(t), delta = 1/(1-t) and U_m(t) = prod_{j=1}^{m-1}(1 - zeta^j t^{1/m})^{-j/m} = D^{GSWZ}_{zeta_m}(t^{1/m})^{-1}; for m = 2, U_2 = (1 + t^{1/2})^{-1/2} (the printed (67) gives (1 - t^{1/2})^{1/2}).
- For A = (3) and m = 1, 2, 3 the x^0-coefficient of log F_A(T, zeta + x) agrees with the formula to T^9 (checked).
- (t;q)_infinity and (qt;q)_infinity have the same V = Li_2(t) but delta = 1/(1-t) and 1 - t: V alone does not determine F.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.3, eq. (68), p. 21. The statement; U_m is used with the corrected (67). [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, eqs. (65)-(67), p. 21. The printed definition; the first sign and the membership are corrected (E29). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.3, eq. (71), p. 21. The expansion from which the corrected sign follows.


<a id="habironahmseries-hb-8-dwork-quotient-admissible"></a>

### The Dwork-type quotient of an admissible series is p-integral

**Lemma** · `HabiroNahmSeries:HB.8/dwork-quotient-admissible` · [packet](../packets/HabiroNahmSeries.json)

If F is admissible then for every prime p and every positive integer m not divisible by p, the difference log F(t^{p/m}, q^p) - p log F(t^{1/m}, q), expanded at q = zeta_m + x, lies in (p/x) times the p-local power series ring in t^{1/m} and x over the m-th cyclotomic integers. The proof is one line from the definition: the logarithm of F(t^p,q^p)/F(t,q)^p is p times the sub-sum of the defining series over the l prime to p, and every term of that sub-sum is p-integral after expansion at a root of unity of order prime to p.

**Hypotheses and conventions.** F is admissible; p is a prime and m is prime to p; the expansion is at q = zeta_m + x. The conclusion has a single power of x in the denominator, coming from the residue term; this is the strong integrality the source emphasises. The statement is about the logarithm, not about F itself, and is the exact shape of the gluing condition of the Habiro modules.

**Proof route.**

1. Subtract p times the defining series from the series with t and q raised to the power p, and observe that the terms with l divisible by p cancel.
2. Record the resulting identity: the difference is p times the sum over l prime to p of L_n(q^l) t^{ln}/(l(1-q^l)).
3. Expand at q = zeta_m + x with m prime to p; each term has at most a simple pole in x and p-integral coefficients.
4. Conclude the stated membership.

**Direct inputs.** [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity).

**Acceptance.**

- For (t;q)_infinity and m = 1 this is GSWZ (48)/(logpocc): log(t^p;q^p)_infinity - p log(t;q)_infinity = p sum_{p ∤ l} t^l/(l(1-q^l)).
- For A = (3), p = 5 and m = 1, 2, 3, and p = 7, m = 4, the difference has a simple pole and all coefficients of x^{-1}, ..., x^3 lie in p Z_(p)[zeta_m] (checked).
- The hypothesis p ∤ m cannot be dropped, but not because of a pole: the terms with p | l cancel for every m, and when p | m the difference has no pole at all; it fails p-integrality through 1/(1 - zeta_m^l) with zeta_m^l of p-power order. For (t;q)_infinity and p = m = 2 the coefficient of t^{1/2} is 2/(1-q) = 1/(1 - x/2).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.5, eq. (75), p. 22. The statement. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.2, eq. (74), p. 22. The proof.


<a id="habironahmseries-hb-8-series-f-a"></a>

### The q-hypergeometric series F_A and its q-difference system

**Construction** · `HabiroNahmSeries:HB.8/series-F-A` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric integral N by N matrix A define F_A(t,q) as the sum over non-negative integer vectors n of (-1)^{diag(A).n} q^{(n^t A n + diag(A).n)/2} t^n divided by the product of the (q;q)_{n_j}. It satisfies the linear q-difference system F_A(t,q) - F_A(sigma_j t, q) = (-1)^{A_jj} t_j q^{A_jj} F_A(prod_i sigma_i^{A_ij} t, q) for j = 1,...,N, where sigma_j multiplies t_j by q, and this system together with F_A(0,q) = 1 determines F_A uniquely. It also satisfies the reflection F_A(t,q) = F_{I-A}(t,q^{-1}).

**Hypotheses and conventions.** A is symmetric with integer entries; no positivity is assumed; F_A lies in Q(q)[[t]]. The exponent (n^t A n + diag(A).n)/2 is an integer because n^t A n ≡ sum_j A_jj n_j^2 ≡ diag(A).n (mod 2). The congruence variants F_{A,m,k} are the node HB.8/congruence-sum-series.

**Proof route.**

1. Define the summand and prove that the exponent is an integer.
2. Prove the q-difference system from (q;q)_{n+1} = (1 - q^{n+1})(q;q)_n: both sides have t^n-coefficient (-1)^{diag(A).n} q^{(n^tAn + diag(A).n)/2}/((q;q)_{n_j - 1} prod_{i != j}(q;q)_{n_i}).
3. Uniqueness: the t^n-coefficient of F - F(sigma_j t) is (1 - q^{n_j}) a_n, so for n_j >= 1 the system determines a_n from a_{n - e_j}.
4. Prove the reflection F_A(t,q) = F_{I-A}(t,q^{-1}) from (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2}(q;q)_n.
5. The ratios and their Riccati system are the node HB.8/ratio-riccati-system.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), `mathlib:MvPowerSeries`, `mathlib:MvPowerSeries.rescale`, `mathlib:RatFunc`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `seriesFA` | data | F_A(t,q) in Q(q)[[t]] for a symmetric integral matrix A. |
| `seriesFA_constantCoeff` | simp | F_A(0,q) = 1. |
| `seriesFA_qdiff` | characterisation | The system (33). |
| `seriesFA_unique` | universal-property | A series with constant coefficient 1 satisfying (33) equals F_A. |
| `seriesFA_reflect` | relation | F_A(t,q) = F_{I-A}(t,q^{-1}). |
| `seriesFA_zero` | example | F_0 = prod_j (t_j;q)_infinity^{-1}. |

**Discriminating tests.**

- **`rank_one_three`** (computation): For A = (3), F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0 and the t^2-coefficient is q^9/((1-q)(1-q^2)).
- **`zero_matrix`** (degenerate): For N = 2 and A = 0, F_0 (t_1;q)_infinity (t_2;q)_infinity = 1.
- **`reflection_three`** (computation): F_{(-2)}(t,q^{-1}) = F_{(3)}(t,q).
- **`sign_normalisation`** (non-example): For A = (1), F_{(1)} = sum_n (-1)^n q^{n(n+1)/2} t^n/(q;q)_n = (qt;q)_infinity with L_1 = q; dropping the sign (-1)^{diag(A).n} gives (-qt;q)_infinity, whose L_2 = q^2/(1+q) is not a Laurent polynomial (checked).

**Acceptance.**

- For N = 1 and A = (3): F = sum_k (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k and F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0 (checked to t^8).
- For A = 0, F_0 = prod_j 1/(t_j;q)_infinity.
- For A positive definite, the specialisation t = (-1)^{diag A} q^b converges q-adically and gives the Nahm sum sum_n q^{n^tAn/2 + (b + diag(A)/2).n}/(q)_n of HB.4; for indefinite A it is not a formal operation.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, eq. (31), p. 12. The definition. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, eq. (33), p. 13. The q-difference system. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.3, eq. (78), p. 23. The reflection.


<a id="habironahmseries-hb-8-t-deformed-nahm-equations"></a>

### The t-deformed Nahm equations, their solution and the discriminant

**Construction** · `HabiroNahmSeries:HB.8/t-deformed-nahm-equations` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric integral N x N matrix A, the system 1 - z_j = (-1)^{A_jj} t_j prod_i z_i^{A_ij} (j = 1..N; GSWZ (34) with the printed z_j corrected to z_i) has a unique solution z(t) in (1 + t Z[[t]])^N. In rank one, with 1 - z = t(-z)^A, z(t) = sum_k (-1)^{(A+1)k} binom(Ak,k) t^k/((A-1)k+1) (generalised binomial for A < 0). The discriminant delta(t) = prod_j z_j^{-A_jj} det(diag(1-z) A + diag(z)) lies in 1 + t Z[[t]]; up to the unit (-1)^N prod_j z_j^{A_jj - 1} it is the Jacobian determinant of the system in z. The ring S and its level-m variants are the node HB.8/ring-S-and-its-level-m-variants.

**Hypotheses and conventions.** A is symmetric with integer entries; the equations are read in Z[[t]] with GSWZ's sign (-1)^{A_jj}. At t = 1 the equations become GSWZ's signed Nahm equations (41), the equations of HB.3/general-nondegenerate-class, not CGZ's unsigned 1 - X = X^A of HB.3/nahm-equations; CGZ's equations are the specialisation t = (-1)^{diag A}. Negative entries A_ij are allowed because z_i is a unit in Z[[t]].

**Proof route.**

1. Solve by the fixed-point iteration z_j = 1 - (-1)^{A_jj} t_j prod_i z_i^{A_ij}, which raises the t-adic precision by one at each step and preserves integrality.
2. Rank one: Lagrange inversion gives the hypergeometric series and log z = sum_k (-1)^{(A+1)k} binom(Ak,k) t^k/(Ak) (GSWZ (76)-(77)).
3. Differentiate the equations: J_{jk} = -delta_{jk} - (1-z_j) A_{kj}/z_k, so det J = (-1)^N prod_k z_k^{-1} det(diag(z) + diag(1-z)A) = (-1)^N prod_j z_j^{A_jj - 1} delta.
4. delta(0) = det(I) = 1.

**Direct inputs.** [HabiroNahmSeries:HB.3/nahm-data](#habironahmseries-hb-3-nahm-data), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), `mathlib:MvPowerSeries`, `mathlib:Matrix.det`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `tNahmSolution` | data | The unique z(t) in (1 + tZ[[t]])^N, as units of Z[[t]]. |
| `tNahmSolution_spec` | characterisation | 1 - z_j = (-1)^{A_jj} t_j prod_i z_i^{A_ij}. |
| `tNahmSolution_unique` | universal-property | Any solution in (1 + tZ[[t]])^N equals z(t). |
| `tDiscriminant` | data | delta(t) = prod_j z_j^{-A_jj} det(diag(1-z)A + diag(z)). |
| `tDiscriminant_constantCoeff` | simp | delta(0) = 1. |
| `jacobian_eq_discriminant` | relation | The Jacobian determinant of the system is (-1)^N prod_j z_j^{A_jj-1} delta. |

**Discriminating tests.**

- **`rank_one_three_solution`** (computation): For A = (3) the first coefficients of z(t) are 1, 1, 3, 12, 55, 273.
- **`zero_matrix_discriminant`** (degenerate): For A = 0 (N = 2), z_j = 1 - t_j and delta = (1 - t_1)(1 - t_2).
- **`rank_one_three_discriminant`** (computation): For A = (3) the first coefficients of delta(t) are 1, -5, -3, -10, -42.
- **`index_slip`** (non-example): For A = [[2,1],[1,1]] the printed system 1 - z_j = (-1)^{A_jj} t_j z_j^{sum_i A_ij} has a different solution: the closed V of HB.8/potential-pole-lemma built from it differs from sum_n L_n(1)Li_2(t^n) at order t^2.

**Acceptance.**

- For A = (3): 1 - z = -t z^3, z = 1 + t + 3t^2 + 12t^3 + 55t^4 + 273t^5 + ..., delta = -2t - t/(1-z) = 1 - 5t - 3t^2 - 10t^3 - 42t^4 - ... (checked).
- For A = 0: z_j = 1 - t_j and delta = prod_j (1 - t_j) (NOT 1), in agreement with the admissible-side delta = exp(-sum_j Li_1(t_j)) of F_0.
- In rank one and A >= 2 the only finite non-zero singular value of z(t) is t = (-1)^{A+1}(A-1)^{A-1}/A^A (A = 3: +4/27; A = 2: -1/4); GSWZ print (-1)^A (source issue E35). For A = 0, 1, z is rational (1 - t, 1/(1-t)).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, eqs. (34), (36), p. 13. The equations; the printed z_j inside the product is corrected to z_i (E36). [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.3, eqs. (76)-(77), p. 23. The rank-one closed form.


<a id="habironahmseries-hb-8-fgi-collection"></a>

### The collection of power series produced by formal Gaussian integration

**Construction** · `HabiroNahmSeries:HB.8/fgi-collection` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization). Its hypotheses and limitations govern this target and the API names below.

Construction target: assemble the congruence-indexed Gaussian integrals and their finite sum from the formal bracket, with the corrected local regularization below. Reconcile the exponential, determinant, cyclic and square-root prefactors in the same normalization before using periodicity or identifying this sum with the rational Nahm series. This is G1. Uniform t-regularity of the completed sum is G2. The historical formula (118) is not an already constructed carrier in this plan.

**Proof route.**

1. Apply (59) after splitting P into m Pochhammer factors with base q^m. The h^{-1} term is Li_2(u^m exp(mw))/(m^2 h), by the imported polylogarithm distribution identity.
2. Taylor expansion gives the three coefficients Li_2(u^m)/m^2, Li_1(u^m)/m and Li_0(u^m)/2. The h^0,w^0 coefficient of log P is -sum_s((k+s+1)/m-1/2)log(1-zeta_m^{k+s+1}u).
3. Subtract exactly these four coefficients. All residual pairs (b,r), with h-exponent b-1 and w-exponent r, satisfy b=0,r>=3, or b=1,r>=1, or b>=2,r>=0. Thus each has positive weight for weight(h)=1 and weight(w)=1/2.
4. Compare the printed formula coefficientwise; it fails the quadratic and constant subtraction already at m=1. The correction is a local identity, not a claimed completed repair of Theorem 8.

**Direct inputs.** [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `Polylogarithms:P.1/classical-polylogarithm`.

**Planning API (under the controlling refinement).**

| Declaration | Role | Contract |
| --- | --- | --- |
| `fgiFactor` | data | The regularised Pochhammer factor psi. |
| `fgiFactor_mem` | characterisation | It lies in the domain of the formal Gaussian integration. |
| `fgiIntegral` | data | The integral I_{A,m,k}. |
| `fgiIntegral_periodic` | characterisation | The m-periodicity in k. |
| `fgiCollection` | data | The collection Phi^FGI_{A,m}. |
| `fgiCollection_prefactor` | characterisation | The exponential prefactor is independent of k. |
| `fgiRefined` | data | The refined pieces CS_{A,m,k} and their relation to the collection. |

**Discriminating tests (retaining the same qualified hypotheses).**

- **`m_one`** (degenerate): For m = 1 the collection is the single integral I_{A,1,0}(t,x), whose prefactor is exp(V(t)/log(1+x)) (det(-Lambda(t))(1 - z(t)))^{-1/2}.
- **`critical_point`** (characterisation): The critical points of (115) are w_j = (1/m) log z_j(t), z the solution of the corrected equations (34).
- **`lambda_determinant`** (computation): prod_j z_j^{-A_jj}(1 - z_j) det(-Lambda(t)) = delta(t); for A = (3), det(-Lambda) = (1 - 5t - 3t^2 - ...)/(z^{-3}(1 - z)).
- **`refined_relation`** (compatibility): CS_{A,1,0}(t, zeta_{m'} + x) = Phi^FGI_A(t^{m'}, zeta_{m'} + x).

**Acceptance.**

- For m=1 the congruence sum has one Gaussian term. The Chern–Simons interpretation is an export to QT.6, subject to its identification and normalization inputs.
- Check the formal critical-point equations against the signed t-Nahm equations in the corrected local regularization.
- Independence of representatives requires the affine shift identities; it is conditional on G1 rather than a consequence of writing a finite sum.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Definition 2.11, equations (PhiFGIdef) and (Ikdef). The definition, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.5, after Definition 2.11. The periodicity and the equi-peakedness, verbatim; the source cites two references for the periodicity, which this packet records as an obligation. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.5, equation (eq:Vgen) and after. The critical point identification, verbatim.


<a id="habironahmseries-hb-8-congruence-sum-series"></a>

### The congruence sums F_{A,m,k} and their order-m q-difference system

**Construction** · `HabiroNahmSeries:HB.8/congruence-sum-series` · [packet](../packets/HabiroNahmSeries.json)

For A symmetric integral, m >= 1, k in {0..m-1}^N, F_{A,m,k}(t,q) = sum_{n in k + m N^N} (-1)^{diag(A).(n-k)} q^{(n^tAn - k^tAk + diag(A).(n-k))/2} t^{n-k}/prod_j (q^{k_j+1};q)_{n_j-k_j} in 1 + t^m Q(q)[[t^m]] (GSWZ (32)). H = t^k F_{A,m,k} satisfies sum_{l=0}^m (-1)^l q^{-l(l-1)/2} binom(m,l)_{q^{-1}} sigma_j^l H = (-1)^{A_jj m} q^{A_jj m(m+1)/2} t_j^m prod_i sigma_i^{m A_ij} H for every j, and this system with a_0 = 1 has a unique solution in t^k K((x))[[t^m]] for every expansion q = zeta + x. For c = am, F_{A,m,k} = sum_{k' in {0..c-1}^N, k' ≡ k (m)} w_{k'} t^{k'-k} F_{A,c,k'} with w_{k'} = (-1)^{diag(A).(k'-k)} q^{(k'^tAk' - k^tAk + diag(A).(k'-k))/2}/prod_j (q^{k_j+1};q)_{k'_j-k_j}. The sign (-1)^{A_jj m} corrects GSWZ (98), (137), (165) (E33).

**Hypotheses and conventions.** A symmetric integral; F_{A,1,0} = F_A. The weights w_{k'} are regular at every primitive c-th root of unity because the exponents in (q^{k_j+1};q)_{k'_j-k_j} are < c.

**Proof route.**

1. The q-binomial theorem gives sum_l (-1)^l q^{-l(l-1)/2} binom(m,l)_{q^{-1}} q^{nl} = (q;q)_n/(q;q)_{n-m}; the t^n-coefficient identity then reduces to (-1)^{A n} q^{An(n+1)/2}/(q;q)_{n-m} = (-1)^{Am} q^{Am(m+1)/2} (-1)^{A(n-m)} q^{A(n-m)(n-m+1)/2 + Am(n-m)}/(q;q)_{n-m}.
2. Uniqueness: the t^{k+mj}-coefficient satisfies (q^{k+mj+1-m};q)_m a_j = (-1)^{Am} q^{Am(m+1)/2 + Am(j-1)} a_{j-1} with a non-zero factor for j >= 1.
3. The splitting identity is a regrouping of the sum over n in k + mN^N by classes modulo c.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`, `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `congruenceSum` | data | F_{A,m,k}(t,q). |
| `congruenceSum_one` | simp | F_{A,1,0} = F_A. |
| `congruenceSum_qdiff` | characterisation | The corrected order-m system. |
| `congruenceSum_unique` | universal-property | Uniqueness of solutions in t^k K((x))[[t^m]]. |
| `congruenceSum_split` | relation | The splitting F_{A,m,k} = sum w_{k'} t^{k'-k} F_{A,am,k'}. |

**Discriminating tests.**

- **`zero_matrix_m_two`** (computation): F_{0,2,0} = (1/(t;q)_infinity + 1/(-t;q)_infinity)/2.
- **`sign_m_three`** (non-example): For A = 1, m = 3, k = 1 the equation without the sign (-1)^{Am} (GSWZ (98)) fails at order t^4.
- **`m_one`** (degenerate): For m = 1 the system is (33).

**Acceptance.**

- For N = 1, A in {-2..3}, m <= 4 and all k the corrected system holds (checked); (98) fails for A = 1, m = 3; (165) fails for A = 3, m = 2.
- F_{0,2,0}(t,q) = sum_j t^{2j}/(q;q)_{2j} = (1/(t;q)_infinity + 1/(-t;q)_infinity)/2.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.6, eq. (32), p. 12. The definition. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, eq. (165), p. 35. The system; sign corrected to (−1)^{Am} (E33).


<a id="habironahmseries-hb-8-periodicity-of-the-gaussian-integrals"></a>

### Periodicity of the Gaussian integrals and the first-order relation

**Lemma** · `HabiroNahmSeries:HB.8/periodicity-of-the-gaussian-integrals` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](#habironahmseries-hb-8-refinement-gaussian-shifts). Its hypotheses and limitations govern this target and the API names below.

For the normalized refined integrals I_{A,M,ell} with M=mmprime and the corrected local factor, the required identities are M-periodicity in ell, gamma_j I_ell=I_{ell+e_j} on the chosen M-th roots, and I_ell(t,x)-I_ell(sigma_j t,x)=(-1)^{A_jj} t_j q^{A_jj} I_{ell-e_j}(sigma^{A_{*,j}}t,x). These give the corrected order-m system for CS_{A,m,k}. This node is a proof obligation conditional on reconciling the global prefactors in gap G1, not a claim that (114) as printed defines these integrals.

**Proof route.**

1. Use the single Gaussian operator imported from HB.4, not a second operator. Its precise affine identity is <exp(-b^T Lambda w) f(w+h b)>_{Lambda,h}=exp(h b^T Lambda b/2)<f(w)>_{Lambda,h}, where the bracket has covariance h Lambda^{-1}. GSW Lemma 3.1(b) supplies this after w=h^{1/2}x.
2. Prove the affine identity algebraically by evaluating exponential generating functions, or Wick contractions, and then extend it in positive h-weight. GSW Lemma 3.2 supplies the determinant ratio needed when the shifted Nahm solution changes Lambda.
3. Apply Pochhammer’s shift identity (1-u)(qu;q)_infinity=(u;q)_infinity to the single vertex associated to j, keeping all polynomial prefactors and the corrected normalizer. Translate w_j by h to account for ell-e_j.
4. Iterate the first-order identity m times using the q-binomial theorem. The phase is (-1)^{m A_jj} q^{A_jj m(m+1)/2}; apply periodicity and the refined congruence weights. Full reconciliation of the changed prefactors is G1.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration).

**Acceptance.**

- For m = 1 periodicity is vacuous.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.5, after Definition 2.11, p. 30. The statement; its proof is the packet's existing gap.


<a id="habironahmseries-hb-8-q-difference-for-the-gaussian-collection"></a>

### The Gaussian collection satisfies the same q-difference system

**Lemma** · `HabiroNahmSeries:HB.8/q-difference-for-the-gaussian-collection` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](#habironahmseries-hb-8-refinement-gaussian-shifts). Its hypotheses and limitations govern this target and the API names below.

For the normalized refined integrals I_{A,M,ell} with M=mmprime and the corrected local factor, the required identities are M-periodicity in ell, gamma_j I_ell=I_{ell+e_j} on the chosen M-th roots, and I_ell(t,x)-I_ell(sigma_j t,x)=(-1)^{A_jj} t_j q^{A_jj} I_{ell-e_j}(sigma^{A_{*,j}}t,x). These give the corrected order-m system for CS_{A,m,k}. This node is a proof obligation conditional on reconciling the global prefactors in gap G1, not a claim that (114) as printed defines these integrals.

**Proof route.**

1. Use the single Gaussian operator imported from HB.4, not a second operator. Its precise affine identity is <exp(-b^T Lambda w) f(w+h b)>_{Lambda,h}=exp(h b^T Lambda b/2)<f(w)>_{Lambda,h}, where the bracket has covariance h Lambda^{-1}. GSW Lemma 3.1(b) supplies this after w=h^{1/2}x.
2. Prove the affine identity algebraically by evaluating exponential generating functions, or Wick contractions, and then extend it in positive h-weight. GSW Lemma 3.2 supplies the determinant ratio needed when the shifted Nahm solution changes Lambda.
3. Apply Pochhammer’s shift identity (1-u)(qu;q)_infinity=(u;q)_infinity to the single vertex associated to j, keeping all polynomial prefactors and the corrected normalizer. Translate w_j by h to account for ell-e_j.
4. Iterate the first-order identity m times using the q-binomial theorem. The phase is (-1)^{m A_jj} q^{A_jj m(m+1)/2}; apply periodicity and the refined congruence weights. Full reconciliation of the changed prefactors is G1.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series), [HabiroNahmSeries:HB.8/periodicity-of-the-gaussian-integrals](#habironahmseries-hb-8-periodicity-of-the-gaussian-integrals), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem`.

**Acceptance.**

- For m = 1 the system is (33).
- For N = 1, A in {-2..3}, m <= 4 and all k, t^k F_{A,m,k} satisfies the corrected equation and not the printed one whenever A m(m+1)/2 and A m have different parity (checked).
- The two sides meet here: F_{A,m,k} and CS_{A,m,k} solve the same system.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.15, equation (PhiFGIAshift). The statement, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.15, equation (SAshift). The first-order relation for the integrals, verbatim.


<a id="habironahmseries-hb-8-gaussian-pieces-are-power-series-in-t"></a>

### The refined Gaussian pieces are power series in t

**Lemma** · `HabiroNahmSeries:HB.8/gaussian-pieces-are-power-series-in-t` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](#habironahmseries-hb-8-refinement-gaussian-regularity). Its hypotheses and limitations govern this target and the API names below.

For every symmetric integral A, m>=1, 0<=k_j<m and mprime coprime to m, the normalized CS_{A,m,k}(t,zeta_{mmprime}+x) belongs coefficientwise to Q(zeta_{mmprime})((x))[[t]], has support on ordinary nonnegative multi-indices and constant coefficient 1. This is the regularity input needed for Theorem 8; its proof remains gap G2 after the normalization repair G1.

**Proof route.**

1. Write d_j=(1-z_j)/z_j; each d_j is t_j times a unit. Then Lambda^{-1}=-(I+D A)^{-1}D, D=diag(d_j). This gives covariance control entry by entry, which is stronger and more relevant than a determinant bound.
2. Expand the normalized vertices in Wick graphs. Each pole of Li_{2-b-r}(z_j) and each contraction must be counted against the separate t_j-orders; expand at fixed loop order before claiming a bound.
3. The source’s one-sentence argument does not establish this: for A=0,z=1-t, the no-leg h Li_0(z)/12 term has t^{-1} before graph contributions are combined. The needed cancellation and its preservation under the congruence sum must be proved, not replaced by a termwise nonnegative-order assertion.
4. Establish uniform lower bounds after summing graphs at each loop order, then justify changing the completion from x-first to t-first. These exact two conclusions constitute G2.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations).

**Acceptance.**

- For A = (3), m = 1 the x^1 and x^2 coefficients (242) are power series in t (checked).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, after (166), p. 36. The statement; the argument is a gap.


<a id="habironahmseries-hb-8-identification-theorem"></a>

### The congruence sums equal the refined Gaussian pieces (GSWZ Theorem 8, and Theorem 3)

**Theorem** · `HabiroNahmSeries:HB.8/identification-theorem` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification). Its hypotheses and limitations govern this target and the API names below.

With normalized Gaussian prefactors reconciled as in G1 and mprime coprime to m, the target equality is F_{A,m,k}(t^{1/m},zeta_{mmprime}+x)=CS_{A,m,k}(t,zeta_{mmprime}+x) in Q(zeta_{mmprime})((x))[[t]]. The arbitrary-rank uniqueness step is established here; the comparison still requires G1 and G2. It recovers the source’s Lemma 2.6 via Gaussian integration when m=1, while that residue lemma is already proved independently by the orbit route.

**Proof route.**

1. Apply the affine-shift node to obtain the corrected m-th order system.
2. Apply the regularity node to place both candidates in the same supported coefficient space. The refined normalization gives constant coefficient 1.
3. Before rescaling variables, multiply by t^k and use the multivariable congruence uniqueness theorem. Substitution t_j by t_j^m identifies the supported subspace with an ordinary power-series ring.
4. The equality of critical values V follows independently from the critical-value node; equality of determinant and cyclotomic prefactors must not be inferred until G1 and G2 are discharged.

**Direct inputs.** [HabiroNahmSeries:HB.8/q-difference-for-the-gaussian-collection](#habironahmseries-hb-8-q-difference-for-the-gaussian-collection), [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/gaussian-pieces-are-power-series-in-t](#habironahmseries-hb-8-gaussian-pieces-are-power-series-in-t), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity).

**Acceptance.**

- For A = 0 both sides are explicit.
- For A = (3) and m = 1 the expansion of F_A(t, 1 + x) matches (242) with the prefactor exp(V/log(1+x)) delta^{-1/2} (checked to x^2 and t^9).
- Theorem 8 uses neither Theorem 6 nor Theorem 7 nor Lemma 2.6: it is upstream of all three.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 8, eq. (163), p. 35. The refined form (restricted to m' prime to m). [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 3, eq. (38), p. 13. The form in the introduction. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, eqs. (164)-(166), pp. 35-36. Only N = 1 is written out.


<a id="habironahmseries-hb-8-ring-s-and-its-level-m-variants"></a>

### The rings S and S^{(m)} of the t-deformed equations

**Construction** · `HabiroNahmSeries:HB.8/ring-S-and-its-level-m-variants` · [packet](../packets/HabiroNahmSeries.json)

S = Z[t^{±1}, z^{±1}, delta^{-1/2}]/(1 - z_j - (-1)^{A_jj} t_j prod_i z_i^{A_ij}) with delta = prod_j z_j^{-A_jj} det(diag(1-z)A + diag(z)) in Z[z^{±1}] (GSWZ (35)); after inverting 2, S is etale over Z[t] (Jacobian criterion: the Jacobian is (-1)^N prod z_j^{A_jj-1} delta). S^{(m)} = S[zeta_m, t^{±1/m}] (GSWZ (37)), with S^{(1)} = S. The automorphisms gamma_j (z_j^{1/m} -> zeta_m z_j^{1/m}) act on S^{(m)}[z^{1/m}] and fix S^{(m)}. The specialisation t = 1 maps S onto R[delta^{-1/2}] of HB.3/general-nondegenerate-class.

**Hypotheses and conventions.** Presentation with variables t, t', z, z', w and relations t t' = 1, z z' = 1, the equations with non-negative exponents, w^2 delta = 1.

**Proof route.**

1. Write the presentation.
2. Etaleness: standard-etale-type presentation with invertible Jacobian (delta and z invertible) after inverting 2 (for the square root).
3. Define S^{(m)} and gamma_j on S^{(m)}[z^{1/m}].

**Direct inputs.** [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), `mathlib:MvPolynomial`, `mathlib:Algebra.Etale`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `ringS` | data | The ring S of a symmetric integral A. |
| `ringSAlgebra` | instance | S is a Z[t]-algebra via t_j -> t_j. |
| `ringS_etale` | characterisation | S[1/2] is etale over Z[t]. |
| `ringSm` | data | S^{(m)} = S[zeta_m, t^{±1/m}]. |
| `ringS_toPowerSeries` | compatibility | z -> z(t) defines S -> Z[1/2]((t))-type completion compatible with HB.8/t-deformed-nahm-equations. |
| `ringS_specialise` | functoriality | t = 1 gives R[delta^{-1/2}] of HB.3/general-nondegenerate-class. |

**Discriminating tests.**

- **`ringS_zero_matrix`** (degenerate): For A = 0 the relations give z_j = 1 - t_j and delta = prod_j (1 - t_j).
- **`ringS_etale_three`** (computation): For A = (3), delta = z^{-3}(3 - 2z) and 1 - z + t z^3 = 0; delta is a unit in S.
- **`ringS_not_etale_without_delta`** (non-example): Without delta^{-1}, for A = (3) the fibre over t = 4/27 is not etale (double root z = 3/2).

**Acceptance.**

- For A = 0, S = Z[t^{±1}, (1-t)^{-1}, (1-t)^{-1/2}...] with z = 1 - t and delta = prod (1 - t_j).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, eqs. (35)-(37), p. 13. The ring and the étaleness claim.


<a id="habironahmseries-hb-8-fgi-coefficients-in-s"></a>

### The coefficients of the Gaussian collection lie in the ring S

**Lemma** · `HabiroNahmSeries:HB.8/fgi-coefficients-in-S` · [packet](../packets/HabiroNahmSeries.json)

For every positive integer m, log Phi^FGI_{A,m}(t,x) lies in V^FGI(t)/(m^2 log(1+x/zeta_m)) - (1/2) log delta^FGI(t) + log U^FGI_m(t) + x S^{(m)}_Q[[x]], with delta^FGI in S and m^{Nm} (U^FGI_m)^{2m} in S^{(m)} (GSWZ Lemma 2.12). Here U^FGI_m is GSWZ (121) with the phase of its k-th term corrected to (-1)^{diag(A).k} zeta_m^{(k^tAk + diag(A).k)/2}, and D_{zeta_m} is GSWZ's normalisation (122), the m-th root of CGZ's cyclic quantum dilogarithm; the identity D^{GSWZ}_{zeta_m}(1)^{24m} = m^{12m} is imported from HabiroNumberFields HB.2.

**Hypotheses and conventions.** A is symmetric integral; m is a positive integer; the ring S^{(m)} is the one of the t-deformed equations, and the subscript Q denotes the rationalised ring. The a priori ring of the coefficients is larger, containing the m-th roots of z; descending to S^{(m)} is the content. The direct proof of the cyclic-dilogarithm identity replaces an appeal to the Dedekind eta multiplier system, which is not available in either library.

**Proof route.**

1. A priori the x^k coefficients (k >= 1) lie in Z[zeta_m, t^{±1/m}, z^{±1/m}, 1/delta]/(relations) (the factors 1 - zeta^l z^{1/m} are units there because their product over l is 1 - z = (-1)^A t z^A).
2. The endomorphism gamma_j (z_j^{1/m} -> zeta_m z_j^{1/m}) sends I_{A,m,k} to I_{A,m,k+e_j} (HB.8/periodicity-of-the-gaussian-integrals), so the sum over k is gamma-invariant and lies in S^{(m)}_Q.
3. delta^FGI = prod_j z_j^{-A_jj} det(diag(1-z)A + diag(z)) is in Z[z^{±1}], hence in S.
4. (U^FGI_m)^{2m} lies in m^{-2N} S^{(m)} from (121); D^{GSWZ}_{zeta_m}(1)^{2m} = prod_l (1 - zeta^l)^{2l} = m^m times a sixth root of unity (HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm, API cyclicQuantumDilog_eval_one_pow_24 and gswzDilog) removes m^{Nm}.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/ring-S-and-its-level-m-variants](#habironahmseries-hb-8-ring-s-and-its-level-m-variants), [HabiroNahmSeries:HB.8/periodicity-of-the-gaussian-integrals](#habironahmseries-hb-8-periodicity-of-the-gaussian-integrals), `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `mathlib:Polynomial.cyclotomic`.

**Acceptance.**

- For m = 1 the statement is that the coefficients lie in S.
- For m = 2, zeta = -1: prod_{l=1}^{1}(1 - (-1)^l)^l = 2, and 2^{24} = m^{12m}.
- For A = 0, U^FGI_m = prod_{j}(1 - zeta_m^j t^{1/m})^{j/m}, so already (U^FGI_m)^m lies in S^{(m)}: the factor m^{Nm} is needed in general by the proof, not for every A.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.12, eq. (123), p. 31. The statement. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.5, eqs. (121)-(122), p. 31. The printed constant; its phase is corrected (E30). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.12, eqs. (124)-(125), p. 31. The appeal replaced by the HB.2 import. [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 3.12, p. 51. Context only; it does not assert that m^{Nm} is necessary.


<a id="habironahmseries-hb-8-potential-pole-lemma"></a>

### The potential controls the pole of the logarithm at every root of unity

**Lemma** · `HabiroNahmSeries:HB.8/potential-pole-lemma` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-all-root-residue](#habironahmseries-hb-8-refinement-all-root-residue). Its hypotheses and limitations govern this target and the API names below.

For the full F_A, the all-root logarithmic residue is ζ_m V_A(t^m)/(m²x). The arbitrary-rank orbit/residue proof below establishes this without Gaussian identification. The critical-value formula for V_A is established independently. For the congruence series F_{A,m,k}, the stronger level-residue target remains conditional on corrected Gaussian identification and the level-residue contract; do not use the independent F_A lemma as a proof of that congruence statement.

**Proof route.**

1. The logarithmic pole bound in the orbit Nahm proof already kills every Laurent coefficient below -1.
2. Let R(t)=Res_zeta log F_A. Evaluation of log U_{j,m} gives m zeta^{-1}Theta_j R=log z_j(t^m), by the derivative m n_j zeta^{-1} of q^{m n_j}-1.
3. The Euler derivative of zeta V_A(t^m)/m^2 is zeta log z_j(t^m)/m. Both candidate residues have constant coefficient zero. The residue-potential uniqueness argument therefore proves equality.
4. The coordinatewise divisibility statement proves the residue is supported on m-multiples of multi-indices. No prior assertion that L_n is Laurent polynomial enters the proof.

**Direct inputs.** [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.8/fgi-coefficients-in-S](#habironahmseries-hb-8-fgi-coefficients-in-s), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `Polylogarithms:P.1/classical-polylogarithm`.

**Acceptance.**

- For A = (3), V = t + 5t^2/4 + 28t^3/9 + 165t^4/16 + ... and the x^{-1}-coefficient of log F_A(t, zeta_m + x) equals zeta_m V(t^m)/m^2 for m = 1, 2, 3, 4 to t^8 (checked; also for A = (2), (1), (-1)).
- For A = [[2,1],[1,1]], [[1,-1],[-1,0]], [[0,1],[1,0]], the closed formula with the corrected equations equals sum_n L_n(1)Li_2(t^n) to total degree 6 and the lemma holds at m = 1, 2, 3 (checked).
- The residue is zeta_m V(t^m)/m^2, not V(t^m)/m^2: the coefficient of 1/log(1+x/zeta_m) is V(t^m)/m^2.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.6, eq. (79), p. 23. The statement. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.3, eq. (80), p. 23. The rank-one closed form (stated there for A ∈ Z>0). [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.9, eq. (95), p. 26. The congruence version. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.7, proof of Lemmas 2.6 and 2.9, p. 36. The proof, and the dependency order.


<a id="habironahmseries-hb-8-ratio-riccati-system"></a>

### The ratios of F_A and their (corrected) Riccati system

**Lemma** · `HabiroNahmSeries:HB.8/ratio-riccati-system` · [packet](../packets/HabiroNahmSeries.json)

For G_j = F_A(sigma_j t, q)/F_A(t, q): 1 - G_j = (-q)^{A_jj} t_j F_A(prod_i sigma_i^{A_ij} t, q)/F_A(t, q), and the right side is t_j times a product of the G_i^{±1} at q-shifted arguments; consequently G_j is in 1 + t Z[q^{±1}][[t]] and, for admissible F, G_j = prod (q^i t^n;q)_{n_j}^{-c_{n,i}}. In rank one: 1 - G(t) = (-q)^A t prod_{j=0}^{A-1} G(q^j t) (A >= 0). GSWZ (89) omits the factor F_A(prod_{i != j} sigma_i^{A_ij} t)/F_A(t) (E31).

**Hypotheses and conventions.** A symmetric integral; for A_jj < 0 the rank-one product is prod_{j=1}^{|A|} G(q^{-j}t)^{-1}.

**Proof route.**

1. Divide (33) by F_A(t).
2. Write F_A(sigma^a t)/F_A(t) for a in Z^N as a telescoping product of G_i at shifted arguments.
3. Induction on the t-degree: the right side has an explicit t_j, so the t^n-coefficient of G_j is determined by lower coefficients through Laurent-polynomial operations.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents), `mathlib:MvPowerSeries.rescale`.

**Acceptance.**

- For A = (3), 1 - G + q^3 t G(t)G(qt)G(q^2t) = 0 (GSWZ (243); checked to t^8).
- For A = [[2,1],[1,1]] the printed (89) fails at order t_1 t_2 (residual q^3 t_1 t_2) and the corrected system holds to total degree 6 (checked).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, eqs. (83)-(84) and (88)-(89), pp. 24-25. The printed system, corrected here.


<a id="habironahmseries-hb-8-integral-plethystic-logarithm"></a>

### Integral plethystic logarithm over Z[q^{±1}]

**Lemma** · `HabiroNahmSeries:HB.8/integral-plethystic-logarithm` · [packet](../packets/HabiroNahmSeries.json)

For G in 1 + t Z[q^{±1}][[t_1..t_N]] there are unique M_n in Z[q^{±1}] (n != 0) with log G = sum_{n != 0} sum_{l >= 1} M_n(q^l) t^{ln}/l; equivalently G = prod_{n,i} (1 - q^i t^n)^{-b_{n,i}} with integers b_{n,i}, finitely many for each n, and M_n = sum_i b_{n,i} q^i. Conversely such a logarithm with integral M_n exponentiates into 1 + t Z[q^{±1}][[t]].

**Hypotheses and conventions.** The Adams operations of the lambda-ring Z[q^{±1}] are q -> q^l; the general lambda-ring statement is owned by QWittVectors QW.1 (RS-10), which has no packet, so the Z[q^{±1}] case is planned here.

**Proof route.**

1. Induction on |n|: after dividing by prod over |n'| < d, the t^n-coefficient r_n (|n| = d) is a Laurent polynomial; take b_{n,i} its coefficients, since prod_i (1 - q^i t^n)^{-b} = 1 + sum_i b q^i t^n + O(t^{2n}).
2. Take logarithms: -log(1 - q^i t^n) = sum_l q^{il} t^{ln}/l.
3. Uniqueness by the recursion on |n|.

**Direct inputs.** `mathlib:MvPowerSeries`, `mathlib:LaurentPolynomial`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.subst`.

**Acceptance.**

- G = 1 - t has M_1 = -1, M_n = 0 otherwise.
- For G = F_A(qt)/F_A(t), A = (3): M_n = L_n (1 + q + ... + q^{n-1}).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, (84)-(85), p. 24. The step this lemma makes explicit.


<a id="habironahmseries-hb-8-pole-location-lemma"></a>

### Where a non-integral L_n can have poles

**Lemma** · `HabiroNahmSeries:HB.8/pole-location-lemma` · [packet](../packets/HabiroNahmSeries.json)

Let n != 0 and L in Q(q) with L [n_i]_q in Z[q^{±1}] for every i with n_i != 0. Then either L is in Z[q^{±1}], or L has a simple pole at a primitive a-th root of unity with 1 < a and a | n_i for all i.

**Hypotheses and conventions.** [k]_q = 1 + q + ... + q^{k-1} = prod_{1 < a | k} Phi_a(q) is monic with simple roots.

**Proof route.**

1. The poles of L are among the common roots of the [n_i]_q, i.e. primitive a-th roots of unity with 1 < a | gcd(n), each simple.
2. If L has no pole, L = P/[n_i]_q with the division exact in Q[q^{±1}]; by Gauss's lemma (division by a monic integral polynomial) it is exact in Z[q^{±1}].

**Direct inputs.** `mathlib:Polynomial.cyclotomic`, `mathlib:LaurentPolynomial`, `mathlib:RatFunc`.

**Acceptance.**

- L = 1/(1+q) with n = 2: pole at -1.
- L = (1+q)/2 is not of the given form for n = 1 (L [1]_q not integral).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, before (87), p. 24. The fact, with its justification made explicit.


<a id="habironahmseries-hb-8-finite-support-theorem"></a>

### Finite support of the Donaldson-Thomas exponents of a q-hypergeometric series

**Theorem** · `HabiroNahmSeries:HB.8/finite-support-theorem` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-finite-support](#habironahmseries-hb-8-refinement-finite-support). Its hypotheses and limitations govern this target and the API names below.

For every symmetric integral A, the unique rational plethystic coefficients L_n of F_A belong to Z[q,q^{-1}] for all nonzero n. Consequently F_A=product_{n≠0,i in Z}(q^i t^n;q)_infinity^{c_{n,i}} with c_{n,i} in Z and finitely many nonzero i for each fixed n; L_n=sum_i c_{n,i}q^i. This is GSWZ Theorem 6, not merely integrality of an unrestricted infinite product.

**Proof route.**

1. Apply the imported integral plethystic logarithm to every G_j from signed-shift integrality. Uniqueness identifies its coefficient M_{j,n} with [n_j]_q L_n, since log G_j=(sigma_j-1)log F_A. This equality is also valid when n_j=0, with both sides zero.
2. Use the imported pole-location lemma on all j with n_j>0. An L_n outside Z[q^{±1}] must have a simple pole at a primitive a-th root zeta, where a>1 divides every coordinate of n. There is no pole at 1 because [n_j]_1=n_j.
3. Induct on total degree |n|. Write n=a b. In H_n=-sum_{ell|n} L_{n/ell}(q^ell)/(ell(1-q^ell)), every proper-divisor L_{n/ell} is already integral Laurent. The terms with a|ell contribute zeta/a^2 sum_{d|b} L_{b/d}(1)/d^2 to the residue, and the other proper-divisor terms contribute zero.
4. The all-root residue theorem predicts precisely that same sum: the coefficient V_b is sum_{d|b} L_{b/d}(1)/d^2, by taking the q=1 residue of H_b. The only extra possible contribution is -Res_zeta L_n/(1-zeta), from ell=1. It is forced to vanish, contradicting the pole.
5. The monic q-integer denominator and integral numerator in the pole-location lemma give integral Laurent coefficients by monic polynomial division once all possible poles are removed. This step excludes rational constant denominators.
6. Apply the imported product-expansion equivalence. The finite support is the finite Laurent support of L_n; it is not inferred just from integer exponents in Z((q)).

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents), [HabiroNahmSeries:HB.8/ratio-riccati-system](#habironahmseries-hb-8-ratio-riccati-system), [HabiroNahmSeries:HB.8/integral-plethystic-logarithm](#habironahmseries-hb-8-integral-plethystic-logarithm), [HabiroNahmSeries:HB.8/pole-location-lemma](#habironahmseries-hb-8-pole-location-lemma), [HabiroNahmSeries:HB.8/potential-pole-lemma](#habironahmseries-hb-8-potential-pole-lemma), [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity).

**Acceptance.**

- For A = (3) the exponents are non-negative and supported in 3n+1 <= i <= n^2+n+1 (plus c_{1,3} = 1), with the table (236) for n <= 6 (checked for n <= 20 at i < 160 and for n <= 12 in full); c_{n,n^2+n} = 0 for 3 <= n <= 12.
- c_{20,142} = 44549701024 (checked): finiteness is not boundedness.
- For A = [[2,1],[1,1]], [[1,-1],[-1,0]], [[0,1],[1,0]] every L_n with |n| <= 6 is a Laurent polynomial (checked); e.g. for [[2,1],[1,1]], L_{(1,0)} = -q^2, L_{(0,1)} = q, L_{(1,1)} = -q^3.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 6, eq. (81), p. 24. The theorem. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, eqs. (82)-(89), pp. 24-25. The contradiction step; (87) sign and (89) system corrected (E31, E34). [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.2, eq. (236), p. 64. The rank-one instance.


<a id="habironahmseries-hb-8-level-m-admissible-series"></a>

### Level m admissible series

**Definition** · `HabiroNahmSeries:HB.8/level-m-admissible-series` · [packet](../packets/HabiroNahmSeries.json)

Fix m >= 1. (a) Every F in 1 + t Z[1/m]((q))[[t_1..t_N]] can be written uniquely as F = exp(-sum_{n != 0} sum_{l >= 1, (l,m) = 1} L_n(q^l) t^{ln}/(l(1 - q^{ml}))) with L_n in Z[1/m]((q)) (GSWZ Lemma 2.7, stated there for N = 1). (b) F is level m admissible (corrected form) when every L_n lies in R_m = Z[1/m, q^{±1}, Phi_d(q)^{-1} : m ∤ d, or m | d and gcd(d/m, m) > 1] and L_n(zeta_m) in Z[1/m]. GSWZ Definition 2.8 inverts only the Phi_d with m ∤ d; with that ring GSWZ Theorem 7 is false (source issue E28). For m = 1, R_1 = Z[q^{±1}] and level 1 admissibility is admissibility.

**Hypotheses and conventions.** m is a positive integer; coefficients have m inverted; t is multivariable (GSWZ write Lemma 2.7 and Definition 2.8 for N = 1 only). R_m embeds in Z[1/m]((q)) because Phi_1(0) = -1 and Phi_d(0) = 1 for d >= 2. The value condition L_n(zeta_m) in Z[1/m] is a rationality condition: membership in R_m already makes L_n(zeta_m) an element of Z[1/m, zeta_m], since each inverted Phi_d(zeta_m) is a unit there.

**Proof route.**

1. Existence and uniqueness over Q((q)) by induction on |n| (remove one L_n at a time).
2. Integrality over Z[1/m]((q)): the building block with L_n = q^k is prod_{d | m} (q^{dk} t^{dn}; q^{dm})_infinity^{mu(d)/d} (Moebius inversion over the divisors of m), which lies in 1 + tZ[1/m]((q))[[t]] since binomial coefficients binom(c, j) with c in Z[1/m] lie in Z[1/m].
3. Define level m admissibility with the corrected ring R_m.
4. Level 1: R_1 = Z[q^{±1}] and the value condition is automatic.
5. Polar parts: at q = zeta_{am} + x with gcd(a, m) = 1 the x^{-1}-coefficient of log F(t, q) is zeta_{am} sum_n sum_{(r,m)=1} L_n(zeta_m^r) t^{nar}/(m a^2 r^2); at q = zeta_{am} with gcd(a,m) > 1 the level-m denominators 1/(1 - q^{ml}) are regular and any residue comes from poles of the L_n.

**Direct inputs.** [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), `mathlib:ArithmeticFunction.moebius`, `mathlib:Polynomial.cyclotomic`, `mathlib:LaurentPolynomial`, `mathlib:LaurentSeries`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `levelLog` | constructor | For L : N^N -> Q(q), the series -sum_n sum_{(l,m)=1} L_n(q^l) t^{ln}/(l(1-q^{ml})). |
| `LevelAdmissible` | data | The corrected predicate: log F = levelLog L with every L_n in R_m and L_n(zeta_m) in Z[1/m]. |
| `LevelAdmissible.L` | projection | The L_n of a level-m admissible series. |
| `LevelAdmissible.L_unique` | characterisation | Uniqueness of the L_n. |
| `levelAdmissible_one_iff` | compatibility | LevelAdmissible 1 F iff Admissible F. |
| `levelBuildingBlock_eq_prod` | relation | exp(-sum_{(l,m)=1} q^{kl} t^{nl}/(l(1-q^{ml}))) = prod_{d \| m} (q^{dk} t^{dn}; q^{dm})_infinity^{mu(d)/d}. |

**Discriminating tests.**

- **`level_one`** (compatibility): LevelAdmissible 1 F iff Admissible F.
- **`building_block_m_two`** (computation): (t;q^2)_infinity (t^2;q^4)_infinity^{-1/2} is level 2 admissible with L_1 = 1 and L_n = 0 for n >= 2.
- **`pochhammer_level_m`** (compatibility): (t;q^m)_infinity is level m admissible (corrected ring) with L_s = (1-q^m)/(s(1-q^{ms})) for s m-smooth and L_n = 0 otherwise; for m = 2, L_2 = 1/(2(1+q^2)) has a Phi_4-pole, so it is NOT 2-admissible for GSWZ's printed ring (93).
- **`value_condition`** (non-example): For m = 3 the block with L_1 = q, (qt;q^3)_infinity (q^3t^3;q^9)_infinity^{-1/3}, satisfies the membership condition but not L_1(zeta_3) in Z[1/3].
- **`congruence_sum_needs_corrected_ring`** (non-example): For A = 0, m = 2, k = 0, the series F_{0,2,0}(t^{1/2},q) = sum_j t^j/(q;q)_{2j} has L_2 = g_2/(1+q^2), g_2(i) = -1/4: a pole at Phi_4, so it is level 2 admissible in the corrected sense but not in GSWZ's printed sense.

**Acceptance.**

- Level 1 admissible = admissible.
- For m = 2 the building block with L_1 = 1 is (t;q^2)_infinity (t^2;q^4)_infinity^{-1/2}, with L_n = 0 for n >= 2 (checked).
- The value condition is independent of membership: for m = 3 the block (qt;q^3)_infinity (q^3 t^3;q^9)_infinity^{-1/3} has L_1 = q in R_3 but L_1(zeta_3) = zeta_3 not in Z[1/3].

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.7, eq. (90), p. 25. Statement (a) for N = 1. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.7, eq. (92), p. 25. The Moebius product identity. [gswz](https://arxiv.org/pdf/2412.04241v2): Definition 2.8, eq. (93), p. 26. The printed definition; its ring is enlarged here (E28).


<a id="habironahmseries-hb-8-residues-of-congruence-sums"></a>

### Residues of the congruence sums at all roots of unity of order divisible by m

**Lemma** · `HabiroNahmSeries:HB.8/residues-of-congruence-sums` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-level-residues](#habironahmseries-hb-8-refinement-level-residues). Its hypotheses and limitations govern this target and the API names below.

For c=m a with gcd(a,m)=1 and every permitted residue class k, log F_{A,m,k}(t,zeta_c+x)=zeta_c V_A(t^c)/(c^2 x)+O(x^0). This is the restricted all-root residue input required by corrected Theorem 7. The restriction matches the current definition of CS; no assertion at orders m a with gcd(a,m)>1 is imported from Theorem 8.

**Proof route.**

1. Use Gaussian identification and read the exponential potential in the corrected version of (118); the refined sum has constant-one regular factor, which contributes no negative Laurent powers to its logarithm.
2. Replace the Gaussian critical value by the residue potential using the critical-value node.
3. Alternatively split a congruence sum into classes modulo c and compare their common exponential potential; this also needs the regularity and nonvanishing conclusions of G1–G2.
4. Keep the coprimality condition visible because CS in (126) is defined only for mprime coprime to m. This theorem inherits G1–G2, whereas the unrefined residue theorem has neither gap.

**Direct inputs.** [HabiroNahmSeries:HB.8/potential-pole-lemma](#habironahmseries-hb-8-potential-pole-lemma), [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series).

**Acceptance.**

- For A = 0, m = 2, k = 0, c = 4: the residue is -i Li_2(t^4)/16 (from 1/(±t;q)_infinity).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 7, after (105), p. 27. The claim, with its proof supplied.


<a id="habironahmseries-hb-8-congruence-sums-are-level-m-admissible"></a>

### The congruence sums of a q-hypergeometric series are level m admissible (corrected GSWZ Theorem 7)

**Theorem** · `HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility). Its hypotheses and limitations govern this target and the API names below.

For m>=1 and 0<=k_j<m, write B(s,q)=F_{A,m,k}(s^{1/m},q), an ordinary series in s. Its restricted Adams coefficients L_n from this packet’s multi-index construction belong to R_m=Z[1/m,q,q^{-1},Phi_d(q)^{-1} : m does not divide d, or m divides d and gcd(d/m,m)>1], and L_n(zeta_m) belongs to Z[1/m]. This is the corrected Theorem 7 target. It remains G3, together with the inherited Gaussian inputs G1–G2; the false printed smaller ring is never used.

**Proof route.**

1. Use the multi-index restricted decomposition; ordinary integrality of B follows directly from the normalized coefficient formula.
2. For each coordinate apply the corrected m-step recurrence to the ratio sigma_j H/H, including its leading q^{k_j}. Linearization at this constant gives product_{s!=k_j,0<=s<m}(1-q^{k_j+m n_j-s}), up to a Laurent unit, rather than the k=0 formula for every k.
3. These factors have no root of order divisible by m. Prove the simultaneous ratio recurrence and its denominator bounds. Track every Adams pullback Phi_d(q^ell) under gcd(ell,m)=1 to show the allowed set of cyclotomic denominators is preserved.
4. At a forbidden root of order m a with gcd(a,m)=1, use the congruence residue theorem and subtract all proper-divisor contributions. Write the full multi-index equality, including the coefficient of the potential and evaluation at conjugate primitive m-th roots. This is the missing proof G3; the source’s rank-one paragraph does not by itself prove the corrected ring.
5. At primitive m-th roots the shared residue fixes the L_n values and their Z[1/m] denominators. Apply restricted uniqueness. G3 explicitly includes this value claim, not just pole removal.

**Direct inputs.** [HabiroNahmSeries:HB.8/level-m-admissible-series](#habironahmseries-hb-8-level-m-admissible-series), [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series), [HabiroNahmSeries:HB.8/residues-of-congruence-sums](#habironahmseries-hb-8-residues-of-congruence-sums), [HabiroNahmSeries:HB.8/ratio-riccati-system](#habironahmseries-hb-8-ratio-riccati-system), [HabiroNahmSeries:HB.8/integral-plethystic-logarithm](#habironahmseries-hb-8-integral-plethystic-logarithm), [HabiroNahmSeries:HB.8/pole-location-lemma](#habironahmseries-hb-8-pole-location-lemma), `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem`.

**Acceptance.**

- For m = 1, k = 0 this is HB.8/finite-support-theorem.
- For A = 0, m = 2, k = 0 the L_n for n <= 6 have cyclotomic denominators Phi_1, Phi_3, Phi_4, Phi_5, Phi_7, Phi_8, Phi_9, Phi_11 (checked): Phi_4 and Phi_8 are allowed by R_2 and forbidden by GSWZ (93).
- L_n(zeta_3) for (A, m, k) = (1, 3, 0) is 1/3, 0, 1/27 for n = 1, 2, 3 (checked).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 7, eq. (96), p. 26. The printed theorem, false with the ring of (93); stated here with the corrected ring (E28). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 7, eqs. (101)-(103), p. 27. The ratio step (correct; Φ_d there means Φ_d^{-1}). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 7, after (105), p. 27. The residue step; it fails for gcd(a,m) > 1.


<a id="habironahmseries-hb-8-wkb-algebraicity"></a>

### Algebraicity of the expansion coefficients by the WKB method

**Theorem** · `HabiroNahmSeries:HB.8/wkb-algebraicity` · [packet](../packets/HabiroNahmSeries.json)

There is a second, independent route to the algebraicity of the coefficients, which does not use formal Gaussian integration: the WKB method applied to the linear q-difference system. In rank one, writing the solution as the exponential of a sum of c_k(t) h^k and studying the ratio G(t;h) = F(e^h t;h)/F(t;h) written as z(t) times the exponential of a sum of b_k(t) h^k, one proves that b_1 = A(A-1)X^2/2 and that b_k lies in X Delta Q[X] for k at least 2, where X = (t/z) dz/dt and Delta = X(AX+1)((A-1)X+1); integrating then gives c_k in X Q[X] for k at least 1. Hence every coefficient of the expansion is an algebraic function of t.

**Hypotheses and conventions.** A is a one by one integral matrix; the general case is not written out in the source. Normalisation: GSWZ Section 2.6 solves F(t;h) - F(e^h t;h) = t F(e^{Ah} t;h) with 1 - z = t z^A; this F is F_A((-1)^A q^{-A} t, q) with q = e^h, and z_WKB(t) = z(( -1)^A t) for the z of HB.8/t-deformed-nahm-equations (checked for A = 3, 2, -1 together with G(t,1) = z and b_1 = A(A-1)X^2/2). X = (t/z) dz/dt, Delta = X(AX+1)((A-1)X+1) and t d/dt = Delta d/dX.

**Proof route.**

1. Introduce X and prove the change of variables t d/dt = Delta d/dX and the resulting membership of the iterated logarithmic derivatives of z in X Q[X].
2. Write the ansatz for F and derive the functional equation for the ratio G from the q-difference equation.
3. Compute b_1 explicitly and prove the two auxiliary memberships that start the induction.
4. Run the induction on k, showing that the relation for b_K has the form X^{-1} b_K in Delta Q[X], whence b_K lies in X Delta Q[X].
5. Integrate: c_k is obtained from b_{k+1} by integrating against dt/t = dX/Delta, and the division by Delta is exactly what the membership of b_{k+1} in X Delta Q[X] permits.
6. Record that the residue obstruction to integrating is what the argument overcomes, and that this is the delicate point the source signals.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations).

**Acceptance.**

- For A = 3, 2, -1: b_1 = A(A-1)X^2/2 (checked to t^7).
- For A = (3) the coefficient of x^k in Phi_1(t,x) exp(-V/log(1+x)) delta^{1/2+3k} lies in Q[t,z] (x^1, x^2 checked); with exp(-V/x), as printed after (242), it does not (E41).
- Without the vanishing-residue argument, integrating b_{k+1} would produce logarithms.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.6, opening. The method and the difficulty it overcomes, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.16 and Corollary 2.17. The two statements, verbatim.


<a id="habironahmseries-hb-8-equality-of-invariants"></a>

### The potential, discriminant and constants of the two sides agree

**Theorem** · `HabiroNahmSeries:HB.8/equality-of-invariants` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification). Its hypotheses and limitations govern this target and the API names below.

The equality of critical values V_A and the formal critical expression is supplied by refinement-critical-value independently of Gaussian identification. Equality of the determinant and cyclic prefactors, and hence δ_A=δ_FGI and U_{A,m}=U_FGI,m in the corrected normalization, remains conditional on G1 and G2. The printed sign in (67) and the cyclic phase in (121) must be corrected together.

**Proof route.**

1. Apply the affine-shift node to obtain the corrected m-th order system.
2. Apply the regularity node to place both candidates in the same supported coefficient space. The refined normalization gives constant coefficient 1.
3. Before rescaling variables, multiply by t^k and use the multivariable congruence uniqueness theorem. Substitution t_j by t_j^m identifies the supported subspace with an ordinary power-series ring.
4. The equality of critical values V follows independently from the critical-value node; equality of determinant and cyclotomic prefactors must not be inferred until G1 and G2 are discharged.

**Direct inputs.** [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.8/finite-support-theorem](#habironahmseries-hb-8-finite-support-theorem), [HabiroNahmSeries:HB.8/expansion-at-roots-of-unity](#habironahmseries-hb-8-expansion-at-roots-of-unity), [HabiroNahmSeries:HB.8/fgi-coefficients-in-S](#habironahmseries-hb-8-fgi-coefficients-in-s).

**Acceptance.**

- U_m (corrected) = U^FGI_m (corrected phase) to T^8, T = t^{1/m}, for (A,m) = (3,2), (3,3), (2,3), (1,4), (2,5), (-1,3) (checked); e.g. A = (3), m = 2: U_2 = 1 + T/2 - 5T^2/8 + 5T^3/16 - 173T^4/128 + ... .
- The printed (67) differs from U^FGI_m at order T^m (A = (3), m = 2: by -T^2/2).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 2.7, eq. (167), p. 36. The theorem, with (67) and (121) corrected.


<a id="habironahmseries-hb-8-potential-determines-the-matrix"></a>

### The potential determines the matrix, hence the series

**Lemma** · `HabiroNahmSeries:HB.8/potential-determines-the-matrix` · [packet](../packets/HabiroNahmSeries.json)

If V = V_A is the potential of F_A, then (t_j d/dt_j) V = log z_j(t) for each j (GSWZ (168)), and (t_i d/dt_i)(t_j d/dt_j) V = (Lambda(t)^{-1})_{ij} with Lambda(t) = -A - diag(z/(1-z)). Hence V determines z, then Lambda, then A = -Lambda - diag(z/(1-z)), and so F_A (GSWZ Corollary 2.18). GSWZ (169) prints the Hessian with respect to z_i, z_j as -A - diag(z/(1-z)), which is false (E32).

**Hypotheses and conventions.** A is symmetric integral and V = V_A = V^FGI. The Hessian is taken in the logarithmic variables log t; equivalently the Hessian of the Legendre transform sum_j log z_j log t_j - V with respect to log z is Lambda. The conclusion is injectivity of A -> V_A.

**Proof route.**

1. Differentiate V^FGI = -sum Li_2(1-z_j) - (1/2) sum A_ij log z_i log z_j using the corrected equations: t_j d/dt_j V = log z_j.
2. Differentiate log(1 - z_j) = log((-1)^{A_jj} t_j) + sum_i A_ij log z_i in log t_k: (-A - diag(z/(1-z))) (d log z/d log t) = I, so d log z/d log t = Lambda^{-1}.
3. Read off A.

**Direct inputs.** [HabiroNahmSeries:HB.8/potential-pole-lemma](#habironahmseries-hb-8-potential-pole-lemma), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/equality-of-invariants](#habironahmseries-hb-8-equality-of-invariants).

**Acceptance.**

- For A = (3), (t d/dt)^2 V = t + 5t^2 + 28t^3 + 165t^4 + ... = 1/(-3 - z/(1-z)) (checked to t^9); d^2V/dz^2 is finite at z = 1 while -3 - z/(1-z) is not, so (169) as printed is false.
- For A = [[2,1],[1,1]], [[1,-1],[-1,0]], [[0,1],[1,0]], Hess_{log t} V = Lambda^{-1} to total degree 6 (checked).
- Two different admissible series can have the same potential ((t;q)_infinity and (qt;q)_infinity); the statement is about F_A.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 2.18 and proof, eqs. (168)-(169), p. 36. (168) as printed; (169) corrected to the logarithmic Hessian (E32).


<a id="habironahmseries-hb-8-acceptance-rank-one"></a>

### Acceptance: the rank one series, its exponents and the product identity

**Application** · `HabiroNahmSeries:HB.8/acceptance-rank-one` · [packet](../packets/HabiroNahmSeries.json)

The rank one case A = (3) is the layer's acceptance case, and every convention of the layer is checked against it. The series F(t,q) = sum_k (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k satisfies F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0; its Donaldson-Thomas exponents are non-negative and supported in 3n+1 at most i at most n^2+n+1, with the exception c_{1,3} = 1; the deformed solution of 1 - z = -t z^3 is 1 + t + 3t^2 + 12t^3 + 55t^4 + ...; the discriminant is 1 - 5t - 3t^2 - 10t^3 - ...; the potential is t + 5t^2/4 + 28t^3/9 + 165t^4/16 + ...; and the ratio G satisfies the Riccati equation 1 - G(t,q) + q^3 t G(t,q)G(qt,q)G(q^2t,q) = 0, with the coefficient of x^k in G(t,1+x) lying in delta^{-3k} Z[t^{pm 1},z]. The product identity z(t) = product over n of (1-t^n)^{-n sum_i c_{n,i}} holds and proves that the exponent of 1 - t^n in that product is divisible by n.

**Hypotheses and conventions.** A = (3) is a one by one positive definite integral matrix, used here as a formal datum. All displayed series are those of GSWZ Section 4.2; (242) holds with the prefactor exp(V/log(1+x)) delta^{-1/2}, not exp(V/x) delta^{-1/2} as printed (E41). The product identity (244) is an application of the Kontsevich-Soibelman theorem (here: of HB.8/finite-support-theorem, which allows q -> 1 in G).

**Proof route.**

1. Compute the first exponents c_{n,i} from the product expansion and compare with the table of the source.
2. Compute z(t), delta(t) and V(t) to the displayed order from their defining equations.
3. Verify the Riccati equation for the ratio and the stated denominators of its coefficients.
4. Verify the product identity for z(t) and deduce the divisibility of the exponent by n.
5. Verify the first coefficients of the expansion of Phi_1(t,x), which the source displays to order x^2.

**Direct inputs.** [HabiroNahmSeries:HB.8/finite-support-theorem](#habironahmseries-hb-8-finite-support-theorem), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents).

**Acceptance.**

- The exponents for n <= 6 are the table (236), beginning c_{2,7} = 1 and c_{3,10..13} = 1, 1, 0, 1; c_{n,n^2+n} = 0 for 3 <= n <= 12.
- c_{20,142} = 44549701024.
- With q = 1 + x, the coefficient of x in F(t,1+x) exp(-V/log(1+x)) delta^{1/2} is ((308t^3 - 74t^2)z^2 + (234t^3 - 74t^2)z + (216t^3 - 382t^2 + 74t))/(24 delta^3) (checked to t^9); with exp(-V/x) the difference is -V/12.
- g_0 = z, delta^3 g_1 = (15t^3 - 3t^2)z^2 + (18t^3 - 3t^2)z + (-18t^2 + 3t) and z = prod_n (1 - t^n)^{-n sum_i c_{n,i}} (checked to t^9).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.2, equations (Fexdef), (Frec), (DTvalues), (z3), (zfew3), (V3), (delta3), (Grec), (gexp). The worked example's displays, verbatim in part.


<a id="habironahmseries-hb-8-dwork-quotient-level-m"></a>

### The Dwork quotient of a level m admissible series

**Lemma** · `HabiroNahmSeries:HB.8/dwork-quotient-level-m` · [packet](../packets/HabiroNahmSeries.json)

Let F be level m admissible (corrected ring R_m) and p a prime with (m,p) = 1. For m' with (m m', p) = 1 and gcd(m, m') = 1: log F(t^{p/m'}, q^p) - p log F(t^{1/m'}, q) lies in (p/x) Z_(p)[t^{1/mm'}, zeta_{mm'}][[t, x]] at q = zeta_{mm'} + x (GSWZ Lemma 2.10). The case m' = 1 is the one Theorem 4 uses.

**Hypotheses and conventions.** gcd(m, m') = 1 ensures that no inverted Phi_d of R_m vanishes at zeta_{mm'}^l for l prime to m; for gcd(m, m') > 1 the L_n(q^l) can have poles there and the lemma is not proved (the source's statement allows it).

**Proof route.**

1. F(t^p, q^p)/F(t,q)^p = exp(p sum_n sum_{(l, mp) = 1} L_n(q^l) t^{nl}/(l(1 - q^{ml}))) (the p | l terms cancel).
2. At q = zeta_{mm'} + x: 1/(1 - q^{ml}) has at most a simple pole with a p-unit leading coefficient ((l, p) = 1), and each inverted Phi_d(zeta_{mm'}^l) is a unit away from primes dividing mm' (Res(Phi_a, Phi_b) is 1 or a power of a prime dividing a/b or b/a).

**Direct inputs.** [HabiroNahmSeries:HB.8/level-m-admissible-series](#habironahmseries-hb-8-level-m-admissible-series), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity).

**Acceptance.**

- For m = 1 it is HB.8/dwork-quotient-admissible.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.10, eq. (108), p. 28. The statement, restricted to gcd(m, m') = 1.


<a id="habironahmseries-hb-8-admissible-recognition"></a>

### Recognising an admissible series from its expansions

**Lemma** · `HabiroNahmSeries:HB.8/admissible-recognition` · [packet](../packets/HabiroNahmSeries.json)

For admissible F^(1), F^(2) with the same N: (a) V^(1) = V^(2) iff L^(1)_n(1) = L^(2)_n(1) for all n; (b) F^(1) = F^(2) iff V, delta and all U_m agree; (c) F^(1) = F^(2) iff Phi^(1)_m = Phi^(2)_m for some (equivalently every) m (GSWZ Corollary 2.4).

**Hypotheses and conventions.** U_m is the corrected (67); the argument for (b) uses the t^{j/m} coefficients of U_m, which determine L_n(zeta_m^j), and a Laurent polynomial is determined by its values at all roots of unity.

**Proof route.**

1. (a) Moebius inversion of V = sum L_n(1) Li_2(t^n).
2. (b) V and delta give L_n(1), L_n'(1); then the t^{jn/m} coefficients of u_m give L_n(zeta_m^j) inductively in n; all m together determine L_n.
3. (c) injectivity of HB.8/laurent-expansion-at-a-root-of-unity.

**Direct inputs.** [HabiroNahmSeries:HB.8/expansion-at-roots-of-unity](#habironahmseries-hb-8-expansion-at-roots-of-unity), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity).

**Acceptance.**

- (t;q)_infinity and (qt;q)_infinity: same V, different delta.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 2.4, p. 22. The corollary.


### HB.8 finer contracts

These 15 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-8-refinement-signed-shifts"></a>

### Integral signed shift ratios

**Theorem** · `HabiroNahmSeries:HB.8/refinement-signed-shifts` · [packet](../packets/HabiroNahmSeries--HB.8.json)

Write sigma^a(t)_i=q^{a_i}t_i for a in Z^N and R_a=F_A(sigma^a t,q)/F_A(t,q). Every R_a has constant coefficient 1 and coefficients in Z[q,q^{-1}]. In particular G_j=R_{e_j} satisfies 1-G_j=(-q)^{A_jj} t_j R_{A_{*,j}}. Ratios obey R_{a+b}=R_a times sigma^a(R_b), for all signed a,b.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Use the corrected Riccati identity imported from HB.8/ratio-riccati-system, retaining all off-diagonal shifts.
2. For a signed coordinate path from 0 to a, telescope R_a as shifted G_i factors for positive steps and inverses of shifted G_i for negative steps. Rescaling by q^b preserves integral Laurent polynomials.
3. Induct on total t-degree. The coefficient of degree d in 1-G_j is minus that coefficient of G_j; the factor t_j on the right makes it depend only on coefficients of every G_i of degree less than d. Inversion of a series with constant coefficient 1 preserves integral Laurent coefficients.
4. After proving all G_i simultaneously, telescope every R_a. This also proves the cocycle identity without a restriction on the signs of the entries of A.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/ratio-riccati-system](#habironahmseries-hb-8-ratio-riccati-system), `mathlib:MvPowerSeries.rescale`, `mathlib:LaurentPolynomial`.

**Acceptance.**

- For A=0, G_j=1-t_j and R_{-e_j}=(1-q^{-1}t_j)^{-1}.
- For A=[[2,1],[1,1]], the t_1 t_2 coefficient of G_1 is -q^3.
- For A=[[-1,2],[2,-2]], all forward and inverse coordinate ratios checked through total degree four have integral Laurent coefficients.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, equation (89), p. 25; compare (83)–(84), p. 24. The source motivates the integral recursion; the signed-coordinate path repairs the omitted off-diagonal factor and covers negative entries.


<a id="habironahmseries-hb-8-refinement-orbit-ratio"></a>

### Cyclotomic orbit ratios

**Construction** · `HabiroNahmSeries:HB.8/refinement-orbit-ratio` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For m>=1 and j in {1,...,N}, define U_{j,m}(t,q)=R_{m e_j}=F_A(sigma_j^m t,q)/F_A(t,q). It is an integral Laurent-coefficient series of constant coefficient 1, and U_{j,m}=product_{s=0}^{m-1} G_j(sigma_j^s t,q). Evaluation at any nonzero algebraic q-value is therefore coefficientwise defined.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Construct the finite product of the already imported unit ratios G_j.
2. Telescope the adjacent factors to obtain the quotient expression.
3. Apply signed-shift integrality to ensure evaluation at roots of unity is legitimate before any pole cancellation theorem is known.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-signed-shifts](#habironahmseries-hb-8-refinement-signed-shifts), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), `mathlib:MvPowerSeries.rescale`, `mathlib:RatFunc.eval`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `HabiroNahmSeries.HB8Refinement.orbitRatio` | constructor | The finite product defining U_{j,m}; m=0 is also defined as the empty product 1 for API purposes. |
| `HabiroNahmSeries.HB8Refinement.orbitRatio_quotient` | characterisation | U_{j,m}=sigma_j^m(F_A)/F_A. |
| `HabiroNahmSeries.HB8Refinement.orbitRatio_add` | relation | U_{j,m+n}=U_{j,m} sigma_j^m(U_{j,n}). |
| `HabiroNahmSeries.HB8Refinement.orbitRatio_integral` | compatibility | Each coefficient lies in the image of the pinned LaurentPolynomial Z inside RatFunc Q. |
| `HabiroNahmSeries.HB8Refinement.orbitRatio_one` | simp | U_{j,1}=G_j. |

**Discriminating tests.**

- **`HabiroNahmSeries.HB8Refinement.orbitRatio_zero`** (degenerate): U_{j,0}=1 for every A.
- **`HabiroNahmSeries.HB8Refinement.orbitRatio_zeroMatrix`** (computation): For A=0, U_{j,2}=(1-t_j)(1-q t_j).
- **`HabiroNahmSeries.HB8Refinement.orbitRatio_root_zeroMatrix`** (computation): For A=0 and primitive zeta_m, U_{j,m}(t,zeta_m)=1-t_j^m.
- **`HabiroNahmSeries.HB8Refinement.orbitRatio_rescale`** (compatibility): sigma_j^m(F_A)=U_{j,m} F_A, with sigma_j^m exactly Mathlib rescale by q^m in coordinate j.

**Acceptance.**

- Evaluation is taken on the ratio, not separately on two polar series.
- U_{j,1}=G_j.
- The zero matrix gives U_{j,m}=product_{s=0}^{m-1}(1-q^s t_j).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 6, equation (83), p. 24; compare (33), (89), (98) and (165). The finite orbit product is a proof refinement assembled from the source’s ratio and higher q-difference operators, not a separately stated source theorem.


<a id="habironahmseries-hb-8-refinement-orbit-nahm"></a>

### Nahm equations on a cyclotomic orbit

**Theorem** · `HabiroNahmSeries:HB.8/refinement-orbit-nahm` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For m>=1 and a primitive m-th root zeta in a characteristic-zero field, U_{j,m}(t,zeta)=z_j(t_1^m,...,t_N^m), where z is the unique constant-one solution of 1-z_j=(-1)^{A_jj}t_j product_i z_i^{A_ij}. Thus the specialisation is invariant under every coordinate rescaling t_i by zeta.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Put H=log F_A. Since log G_i=(q^{n_i}-1)H_n coefficientwise and log G_i has rational Laurent-polynomial coefficients, H_n has only simple nonzero poles, at roots whose orders divide every nonzero n_i. Zero coordinates impose no restriction.
2. For U_{j,m}, log U=(q^{m n_j}-1)H_n. At q=zeta the factor vanishes. Its value is zero unless every n_i is divisible by m, and otherwise it is m n_j zeta^{-1} Res_zeta H_n. This proves orbit invariance without admissibility.
3. The coefficient formula for F_A gives product_{s=0}^{m-1}(1-q^{-s}sigma_j)F_A=(-1)^{m A_jj}q^{A_jj m(m+1)/2}t_j^m sigma^{m A_{*,j}}F_A. Coefficients with n_j<m vanish on both sides; the others follow by cancelling the last m Pochhammer factors.
4. Divide by F_A before evaluation. At q=zeta the operator becomes 1-sigma_j^m, and signed telescoping with orbit invariance identifies the right quotient with product_i U_{i,m}^{A_ij}. The phase (-1)^{m A_jj} zeta^{A_jj m(m+1)/2} equals (-1)^{A_jj}, for both even and odd m.
5. The imported Nahm uniqueness proof now identifies the U tuple with z(t^m).

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-orbit-ratio](#habironahmseries-hb-8-refinement-orbit-ratio), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `mathlib:IsPrimitiveRoot`, `mathlib:MvPowerSeries.expand`.

**Acceptance.**

- For A=(1), the answer is (1-t_j^m)^{-1}, independent of m.
- For A=(3) and m=2, the coefficient of t^2 is 1, rather than -1; the corrected phase is essential.
- For N=0, all tuples are empty and the assertion is vacuous.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.6 (79), corrected (98)/(165) and (34). This is a new elementary proof route to the source’s residue lemma. Its orbit invariance and matrix-valued recurrence are written out rather than attributed verbatim to the paper.


<a id="habironahmseries-hb-8-refinement-residue-potential"></a>

### The residue potential

**Construction** · `HabiroNahmSeries:HB.8/refinement-residue-potential` · [packet](../packets/HabiroNahmSeries--HB.8.json)

Define V_A in Q[[t]] by taking the coefficient of (q-1)^{-1} in every coefficient of log F_A(t,q). It has constant coefficient 0 and satisfies Theta_j V_A=log z_j, where Theta_j=t_j partial/partial t_j. This definition precedes admissibility and does not assume a Gaussian representation.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. The signed-shift proof bounds every nonconstant coefficient of log F_A to at most a simple pole at q=1. Apply the imported Laurent expansion map and take its coefficient at exponent -1.
2. For m=1, log U_{j,1}|_{q=1}=Theta_j V_A by multiplication with q^{n_j}-1 and extraction of the first derivative. The orbit Nahm theorem identifies U_{j,1}|_{q=1} with z_j.
3. The constant coefficient is zero since log F_A has zero constant coefficient. In characteristic zero, the Euler derivatives determine a zero-constant series uniquely: choose a nonzero coordinate of each nonzero multi-index.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-orbit-nahm](#habironahmseries-hb-8-refinement-orbit-nahm), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `mathlib:LaurentSeries`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.subst`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `HabiroNahmSeries.HB8Refinement.residuePotential` | constructor | The coefficientwise residue at q=1 of log F_A. |
| `HabiroNahmSeries.HB8Refinement.residuePotential_constantCoeff` | simp | V_A(0)=0. |
| `HabiroNahmSeries.HB8Refinement.residuePotential_euler` | relation | Theta_j V_A=log z_j for every j. |
| `HabiroNahmSeries.HB8Refinement.residuePotential_unique` | extensionality | If W(0)=0 and Theta_j W=log z_j for every j, then W=V_A. |
| `HabiroNahmSeries.HB8Refinement.residuePotential_coeff` | data | For n_j>0, the t^n coefficient of V_A is the t^n coefficient of log z_j divided by n_j. |

**Discriminating tests.**

- **`HabiroNahmSeries.HB8Refinement.residuePotential_rankZero`** (degenerate): For N=0 the potential is zero.
- **`HabiroNahmSeries.HB8Refinement.residuePotential_zeroMatrix`** (computation): For A=0, V_A=-sum_j Li_2(t_j), using Polylogarithms P.1’s formal polylogSeries.
- **`HabiroNahmSeries.HB8Refinement.residuePotential_three`** (computation): For A=(3), V_A=t+5t^2/4+28t^3/9+165t^4/16+O(t^5).
- **`HabiroNahmSeries.HB8Refinement.residuePotential_logCompatibility`** (compatibility): The coefficient of t_j in V_A is (-1)^{A_jj+1}, which is the residue of (-1)^{A_jj}q^{A_jj}/(1-q).

**Acceptance.**

- V_0=-sum_j Li_2(t_j).
- V_(1)=Li_2(t).
- V_(-1)=t-3t^2/4+10t^3/9-35t^4/16+O(t^5).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.6 (79); equations (116) and (168). The source supplies the potential and its derivative identity; this construction defines it directly by the residue and proves the derivative noncircularly.


<a id="habironahmseries-hb-8-refinement-congruence-uniqueness"></a>

### The multivariable congruence recurrence

**Theorem** · `HabiroNahmSeries:HB.8/refinement-congruence-uniqueness` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For m>=1 and 0<=k_j<m, put H=t^k F_{A,m,k}(t,q), with the normalization of the imported congruence-sum node, so its t^k coefficient is 1. For every j, product_{s=0}^{m-1}(1-q^{-s}sigma_j)H=(-1)^{m A_jj}q^{A_jj m(m+1)/2}t_j^m sigma^{m A_{*,j}}H. Over Q(q), or its injective Laurent expansion at any root of unity, this system has a unique solution supported on k+m N^N with that initial coefficient.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. For n=k+m b, the j-th operator has eigenvalue D_j(n,q)=product_{s=0}^{m-1}(1-q^{n_j-s}). If b_j=0 this vanishes because the factor s=k_j occurs.
2. If b_j>0, D_j is a nonzero rational function. The right coefficient is the stated phase times q^{m sum_i A_ij(n_i-m delta_ij)} times the coefficient at n-m e_j.
3. Induct on |b|, choosing any j with b_j>0. Existence is the imported explicit coefficient formula; it also ensures compatibility when more than one coordinate can be chosen. Uniqueness is obtained by subtracting two solutions and using the recurrence.
4. Apply the injective Laurent expansion map: each nonzero D_j remains invertible in the Laurent-series field even when its constant term vanishes at a root of unity. This is uniqueness over K((x)), not over K[[x]].

**Direct inputs.** [HabiroNahmSeries:HB.8/congruence-sum-series](#habironahmseries-hb-8-congruence-sum-series), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Acceptance.**

- m=1,k=0 is the first-order F_A system.
- For m=2,k_j=1 and b_j=0, D_j=0 as required for the initial term.
- A=(1),m=3 has sign -1; the printed sign +1 is rejected.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 8 proof, equation (165) and the subsequent recurrence, p. 35. The source omits the matrix-valued calculation. This node spells out the eigenvalue and compatible multi-index induction, with the corrected sign from HabiroNahmSeries/E33.


<a id="habironahmseries-hb-8-refinement-restricted-adams"></a>

### Restricted Adams decomposition in several variables

**Construction** · `HabiroNahmSeries:HB.8/refinement-restricted-adams` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For m>=1, let F be a constant-one series in Z[1/m]((q))[[t_1,...,t_N]]. There is a unique family L_n in Z[1/m]((q)), with L_0=0, such that log F=-sum_{n≠0} sum_{ell>=1,gcd(ell,m)=1} L_n(q^ell)t^{ell n}/(ell(1-q^{m ell})). If F has rational-function coefficients, all L_n are rational functions. Divisibility ell|n means divisibility of every coordinate; zero coordinates impose no bound.

**Hypotheses and conventions.** N is finite, m>=1, and F has constant coefficient 1. The coefficients lie in Z[1/m]((q)); the formal logarithm is taken after embedding in Q((q)). For the rational-function signature in the suggested file, F lies in Q(q)[[t]] and is embedded coefficientwise in Q((q)).

**Proof route.**

1. The coefficient at a nonzero n has leading term -L_n/(1-q^m); all other terms have ell>1 and therefore smaller total degree |n/ell|. Solve recursively, giving existence and uniqueness over Q((q)) and preserving Q(q) where applicable.
2. For integrality, use E_{n,i}=exp(-sum_{gcd(ell,m)=1} q^{i ell}t^{ell n}/(ell(1-q^{m ell}))). Inclusion-exclusion expresses it as product_{d|m}(q^{di}t^{dn};q^{dm})_infinity^{mu(d)/d}. More generally E_{n,i}^c has exponents c mu(d)/d for c in Z[1/m]. For any alpha in Z[1/m], every binomial coefficient binom(alpha,r) lies in Z[1/m]: at each prime p not dividing m, approximate alpha by an integer modulo a sufficiently high power of p and use the integer-valued binomial polynomial. Thus these powers have coefficients in Z[1/m]((q)).
3. Eliminate coefficients of F in increasing total degree. At nonzero n, let a_n(q) be the residual coefficient and expand -(1-q^m)a_n(q)=sum_i c_i q^i with c_i in Z[1/m] and i bounded below. The product over i of E_{n,i}^{c_i} has leading coefficient a_n(q); divide the residual F by this product. The q-adic limit exists at each fixed t-degree because i tends to infinity; negative i occur only finitely. The outer product is t-adic. The degree-|n| correction uniquely fixes L_n=sum_i c_i q^i. This uses arbitrary Z[1/m] powers, not only integer powers.
4. The argument never chooses a distinguished nonzero coordinate of n, so it applies to mixed monomials and the axes alike. Generic product existence is imported from the parent and Mathlib, not replanned.

**Direct inputs.** [HabiroNahmSeries:HB.8/level-m-admissible-series](#habironahmseries-hb-8-level-m-admissible-series), [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents), `mathlib:MvPowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs` | constructor | The uniquely normalized family L_0=0 of restricted Adams coefficients. |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs_log` | characterisation | The logarithmic expansion in the statement. |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs_unique` | extensionality | Any family with L_0=0 giving that expansion equals restrictedCoeffs(m,F). |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs_recursion` | data | L_n=-(1-q^m) times (H_n+sum_{ell>1,ell\|n,gcd(ell,m)=1} L_{n/ell}(q^ell)/(ell(1-q^{m ell}))), where H=log F. |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs_one` | compatibility | At m=1 it is the ordinary rational plethystic coefficient family of the imported admissible-series definition. |
| `HabiroNahmSeries.HB8Refinement.restrictedCoeffs_mul` | relation | For constant-one F and G and m>=1, restrictedCoeffs(m,F G)=restrictedCoeffs(m,F)+restrictedCoeffs(m,G), pointwise. This follows from log(F G)=log F+log G and uniqueness, and makes the normalized transform a group homomorphism. |

**Discriminating tests.**

- **`HabiroNahmSeries.HB8Refinement.restrictedCoeffs_unit`** (degenerate): If F=1, all L_n are zero.
- **`HabiroNahmSeries.HB8Refinement.restrictedCoeffs_linear`** (computation): For F=1+t_1 t_2, L_(1,1)=-(1-q^m).
- **`HabiroNahmSeries.HB8Refinement.restrictedCoeffs_two`** (computation): For m=2 and F=1+t_1 t_2, L_(2,2)=(1-q^2)/2.
- **`HabiroNahmSeries.HB8Refinement.restrictedCoeffs_mOne`** (compatibility): For m=1 and F=1+t_1 t_2, L_(2,2)=1-q, agreeing with the unrestricted rational decomposition.

**Acceptance.**

- The ell=1 term makes the transform triangular; omitting it would destroy uniqueness.
- When m=1 this is the ordinary admissible-series decomposition.
- Mixed monomials t_1 t_2 and t_1^2 t_2^2 obey the same recursion as one-variable t and t^2.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.7, equation (92) and its inclusion-exclusion proof, pp. 25–26. The source states the one-variable version; this construction replaces n by a nonzero multi-index and gives the explicit total-degree proof.


<a id="habironahmseries-hb-8-refinement-gaussian-normalization"></a>

### Normalization of the Gaussian local factor

**Comparison** · `HabiroNahmSeries:HB.8/refinement-gaussian-normalization` · [packet](../packets/HabiroNahmSeries--HB.8.json)

Let q=zeta_m exp(h), u a formal variable, k an integer, and P=(q^{k+1}u exp(w);q)_infinity interpreted by the Bernoulli expansion (59). A local remainder which removes h^{-1}w^0, h^{-1}w^1, h^{-1}w^2 and h^0w^0 must have log psi=log P-Li_2(u^m)/(m^2 h)-Li_1(u^m)w/(m h)-Li_0(u^m)w^2/(2h)+sum_{s=0}^{m-1}((k+s+1)/m-1/2)log(1-zeta_m^{k+s+1}u). Its remaining terms belong to the augmentation ideal in the completion generated by w, h and w^3/h. This repairs the local normalization of (114); propagating it through the global prefactor (118) is recorded as gap G1.

**Hypotheses and conventions.** m>=1, zeta_m is primitive of order m, k is an integer representative, and q=zeta_m exp(h). u and w are formal variables; use the Pochhammer Bernoulli expansion, not an analytic infinite product at a root of unity. After the four subtractions the coefficients lie in Q(u,zeta_m). The remainder is in the positive-weight augmentation completion generated by w,h,w^3/h, with weight(h)=1 and weight(w)=1/2. This is a local normalization independent of the symmetric matrix A.

**Proof route.**

1. Apply (59) after splitting P into m Pochhammer factors with base q^m. The h^{-1} term is Li_2(u^m exp(mw))/(m^2 h), by the imported polylogarithm distribution identity.
2. Taylor expansion gives the three coefficients Li_2(u^m)/m^2, Li_1(u^m)/m and Li_0(u^m)/2. The h^0,w^0 coefficient of log P is -sum_s((k+s+1)/m-1/2)log(1-zeta_m^{k+s+1}u).
3. Subtract exactly these four coefficients. All residual pairs (b,r), with h-exponent b-1 and w-exponent r, satisfy b=0,r>=3, or b=1,r>=1, or b>=2,r>=0. Thus each has positive weight for weight(h)=1 and weight(w)=1/2.
4. Compare the printed formula coefficientwise; it fails the quadratic and constant subtraction already at m=1. The correction is a local identity, not a claimed completed repair of Theorem 8.

**Direct inputs.** [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/classical-distribution`.

**Acceptance.**

- m=1,k=0: the printed residual h^{-1}w^2 coefficient is -Li_0(u)/2, while the corrected residual is zero.
- m=1,k=0: the printed residual h^0w^0 is -log(1-u), while the corrected residual is zero.
- m=2: the required linear subtraction is Li_1(u^2)w/(2h), not Li_1(u^2)w/(4h).
- The remaining cubic term h^{-1}w^3 rules out the printed ideal 1+x times the whole completion.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Equation (114) and the sentence immediately after it, p. 29; compare (59). The four-term removal is the stated intent; the printed coefficients and the claimed completion fail it. See HabiroNahmSeries/EHB8-1.


<a id="habironahmseries-hb-8-refinement-gaussian-shifts"></a>

### The affine shift of refined Gaussian integrals

**Theorem** · `HabiroNahmSeries:HB.8/refinement-gaussian-shifts` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For the normalized refined integrals I_{A,M,ell} with M=mmprime and the corrected local factor, the required identities are M-periodicity in ell, gamma_j I_ell=I_{ell+e_j} on the chosen M-th roots, and I_ell(t,x)-I_ell(sigma_j t,x)=(-1)^{A_jj} t_j q^{A_jj} I_{ell-e_j}(sigma^{A_{*,j}}t,x). These give the corrected order-m system for CS_{A,m,k}. This node is a proof obligation conditional on reconciling the global prefactors in gap G1, not a claim that (114) as printed defines these integrals.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Use the single Gaussian operator imported from HB.4, not a second operator. Its precise affine identity is <exp(-b^T Lambda w) f(w+h b)>_{Lambda,h}=exp(h b^T Lambda b/2)<f(w)>_{Lambda,h}, where the bracket has covariance h Lambda^{-1}. GSW Lemma 3.1(b) supplies this after w=h^{1/2}x.
2. Prove the affine identity algebraically by evaluating exponential generating functions, or Wick contractions, and then extend it in positive h-weight. GSW Lemma 3.2 supplies the determinant ratio needed when the shifted Nahm solution changes Lambda.
3. Apply Pochhammer’s shift identity (1-u)(qu;q)_infinity=(u;q)_infinity to the single vertex associated to j, keeping all polynomial prefactors and the corrected normalizer. Translate w_j by h to account for ell-e_j.
4. Iterate the first-order identity m times using the q-binomial theorem. The phase is (-1)^{m A_jj} q^{A_jj m(m+1)/2}; apply periodicity and the refined congruence weights. Full reconciliation of the changed prefactors is G1.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/periodicity-of-the-gaussian-integrals](#habironahmseries-hb-8-periodicity-of-the-gaussian-integrals), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.8/q-difference-for-the-gaussian-collection](#habironahmseries-hb-8-q-difference-for-the-gaussian-collection).

**Acceptance.**

- A constant integrand gives the affine exponential factor, not strict translation invariance.
- N=2,A=[[2,1],[1,1]] shifts both Gaussian coordinates on the right.
- The m=3,A=(1) sign is negative.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.15, equations (137)–(139), p. 32. The source-specific affine calculation, now traced to the two original sources. [gsw](https://arxiv.org/pdf/2305.14884v2): Lemma 3.1(b), equation (23); Lemma 3.2, equation (25), p. 10. The exact affine Gaussian rule, read directly in the cited original. [aarhus](https://arxiv.org/pdf/math/9801049v4): Proposition 2.13, pp. 8–9. Block Fubini supports recentering; it is not itself a proof of t-regularity.


<a id="habironahmseries-hb-8-refinement-gaussian-regularity"></a>

### Regularity in the Nahm deformation variables

**Theorem** · `HabiroNahmSeries:HB.8/refinement-gaussian-regularity` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For every symmetric integral A, m>=1, 0<=k_j<m and mprime coprime to m, the normalized CS_{A,m,k}(t,zeta_{mmprime}+x) belongs coefficientwise to Q(zeta_{mmprime})((x))[[t]], has support on ordinary nonnegative multi-indices and constant coefficient 1. This is the regularity input needed for Theorem 8; its proof remains gap G2 after the normalization repair G1.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Write d_j=(1-z_j)/z_j; each d_j is t_j times a unit. Then Lambda^{-1}=-(I+D A)^{-1}D, D=diag(d_j). This gives covariance control entry by entry, which is stronger and more relevant than a determinant bound.
2. Expand the normalized vertices in Wick graphs. Each pole of Li_{2-b-r}(z_j) and each contraction must be counted against the separate t_j-orders; expand at fixed loop order before claiming a bound.
3. The source’s one-sentence argument does not establish this: for A=0,z=1-t, the no-leg h Li_0(z)/12 term has t^{-1} before graph contributions are combined. The needed cancellation and its preservation under the congruence sum must be proved, not replaced by a termwise nonnegative-order assertion.
4. Establish uniform lower bounds after summing graphs at each loop order, then justify changing the completion from x-first to t-first. These exact two conclusions constitute G2.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/gaussian-pieces-are-power-series-in-t](#habironahmseries-hb-8-gaussian-pieces-are-power-series-in-t), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration).

**Acceptance.**

- For A=0,m=1, the final target is product_j (t_j;q)_infinity^{-1}, whose t-coefficients are Laurent in x.
- The identity Lambda^{-1}=-(I+D A)^{-1}D includes the sign and both indices.
- A proof must bound mixed negative powers t_1^{-a}t_2^{-b}, not just total degree.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, p. 35. This is the asserted regularity argument. The determinant alone does not control the separate vertex poles; the missing cancellation is recorded as G2.


<a id="habironahmseries-hb-8-refinement-gaussian-identification"></a>

### Gaussian identification in arbitrary rank

**Comparison** · `HabiroNahmSeries:HB.8/refinement-gaussian-identification` · [packet](../packets/HabiroNahmSeries--HB.8.json)

With normalized Gaussian prefactors reconciled as in G1 and mprime coprime to m, the target equality is F_{A,m,k}(t^{1/m},zeta_{mmprime}+x)=CS_{A,m,k}(t,zeta_{mmprime}+x) in Q(zeta_{mmprime})((x))[[t]]. The arbitrary-rank uniqueness step is established here; the comparison still requires G1 and G2. It recovers the source’s Lemma 2.6 via Gaussian integration when m=1, while that residue lemma is already proved independently by the orbit route.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Apply the affine-shift node to obtain the corrected m-th order system.
2. Apply the regularity node to place both candidates in the same supported coefficient space. The refined normalization gives constant coefficient 1.
3. Before rescaling variables, multiply by t^k and use the multivariable congruence uniqueness theorem. Substitution t_j by t_j^m identifies the supported subspace with an ordinary power-series ring.
4. The equality of critical values V follows independently from the critical-value node; equality of determinant and cyclotomic prefactors must not be inferred until G1 and G2 are discharged.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-congruence-uniqueness](#habironahmseries-hb-8-refinement-congruence-uniqueness), [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](#habironahmseries-hb-8-refinement-gaussian-shifts), [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](#habironahmseries-hb-8-refinement-gaussian-regularity), [HabiroNahmSeries:HB.8/refinement-critical-value](#habironahmseries-hb-8-refinement-critical-value), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem).

**Acceptance.**

- The m=1 statement gives the full F_A comparison.
- For A=0 the two-variable comparison factors into the rank-one Pochhammer identities.
- Uniqueness uses nonzero D_j in K((x)); evaluating D_j at x=0 prematurely would invalidate it.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 8, equations (163)–(166), pp. 35–36. The exact identification target with the definition’s coprimality restriction and its unresolved inputs displayed.


<a id="habironahmseries-hb-8-refinement-level-residues"></a>

### Residues of congruence sums in arbitrary rank

**Theorem** · `HabiroNahmSeries:HB.8/refinement-level-residues` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For c=m a with gcd(a,m)=1 and every permitted residue class k, log F_{A,m,k}(t,zeta_c+x)=zeta_c V_A(t^c)/(c^2 x)+O(x^0). This is the restricted all-root residue input required by corrected Theorem 7. The restriction matches the current definition of CS; no assertion at orders m a with gcd(a,m)>1 is imported from Theorem 8.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Use Gaussian identification and read the exponential potential in the corrected version of (118); the refined sum has constant-one regular factor, which contributes no negative Laurent powers to its logarithm.
2. Replace the Gaussian critical value by the residue potential using the critical-value node.
3. Alternatively split a congruence sum into classes modulo c and compare their common exponential potential; this also needs the regularity and nonvanishing conclusions of G1–G2.
4. Keep the coprimality condition visible because CS in (126) is defined only for mprime coprime to m. This theorem inherits G1–G2, whereas the unrefined residue theorem has neither gap.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification), [HabiroNahmSeries:HB.8/refinement-critical-value](#habironahmseries-hb-8-refinement-critical-value), [HabiroNahmSeries:HB.8/residues-of-congruence-sums](#habironahmseries-hb-8-residues-of-congruence-sums).

**Acceptance.**

- For m=1 this is the all-root residue lemma already proved independently.
- For A=0,m=2,c=2, the coefficient of t^2 in the residue is 1/4.
- c=4,m=2 is outside the imported comparison and must not be used to remove Phi_4 poles.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.9, equation (95), p. 26; proof after Theorem 8. The source derives the congruence residue from Gaussian identification; HabiroNahmSeries/E39 restricts the extra root order.


<a id="habironahmseries-hb-8-refinement-corrected-level-admissibility"></a>

### Corrected level-m admissibility

**Theorem** · `HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For m>=1 and 0<=k_j<m, write B(s,q)=F_{A,m,k}(s^{1/m},q), an ordinary series in s. Its restricted Adams coefficients L_n from this packet’s multi-index construction belong to R_m=Z[1/m,q,q^{-1},Phi_d(q)^{-1} : m does not divide d, or m divides d and gcd(d/m,m)>1], and L_n(zeta_m) belongs to Z[1/m]. This is the corrected Theorem 7 target. It remains G3, together with the inherited Gaussian inputs G1–G2; the false printed smaller ring is never used.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Use the multi-index restricted decomposition; ordinary integrality of B follows directly from the normalized coefficient formula.
2. For each coordinate apply the corrected m-step recurrence to the ratio sigma_j H/H, including its leading q^{k_j}. Linearization at this constant gives product_{s!=k_j,0<=s<m}(1-q^{k_j+m n_j-s}), up to a Laurent unit, rather than the k=0 formula for every k.
3. These factors have no root of order divisible by m. Prove the simultaneous ratio recurrence and its denominator bounds. Track every Adams pullback Phi_d(q^ell) under gcd(ell,m)=1 to show the allowed set of cyclotomic denominators is preserved.
4. At a forbidden root of order m a with gcd(a,m)=1, use the congruence residue theorem and subtract all proper-divisor contributions. Write the full multi-index equality, including the coefficient of the potential and evaluation at conjugate primitive m-th roots. This is the missing proof G3; the source’s rank-one paragraph does not by itself prove the corrected ring.
5. At primitive m-th roots the shared residue fixes the L_n values and their Z[1/m] denominators. Apply restricted uniqueness. G3 explicitly includes this value claim, not just pole removal.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-restricted-adams](#habironahmseries-hb-8-refinement-restricted-adams), [HabiroNahmSeries:HB.8/refinement-congruence-uniqueness](#habironahmseries-hb-8-refinement-congruence-uniqueness), [HabiroNahmSeries:HB.8/refinement-level-residues](#habironahmseries-hb-8-refinement-level-residues), [HabiroNahmSeries:HB.8/level-m-admissible-series](#habironahmseries-hb-8-level-m-admissible-series), [HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible](#habironahmseries-hb-8-congruence-sums-are-level-m-admissible).

**Acceptance.**

- At m=1 it is the proved finite-support theorem.
- A=0,m=2,k=0 has L_2=-(q^3+2q-1)/(2(q-1)^3(1+q^2)(1+q+q^2)); its Phi_4 pole is allowed by R_2 and excluded by the printed ring.
- A proof must handle k_j nonzero; replacing its linearization by the k=0 product loses factors.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 7, equation (96) and proof (98)–(104), pp. 26–27. The source proves only a rank-one sketch with a false denominator ring. This records the corrected target and the exact general-rank proof obligations.


<a id="habironahmseries-hb-8-refinement-all-root-residue"></a>

### The arbitrary-rank residue lemma

**Theorem** · `HabiroNahmSeries:HB.8/refinement-all-root-residue` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For every symmetric integral A, m>=1 and primitive m-th root zeta, log F_A(t,zeta+x)=zeta V_A(t^m)/(m^2 x)+O(x^0), coefficientwise in t. All Laurent coefficients at x^k for k<-1 vanish. The same rational potential V_A works for all m.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. The logarithmic pole bound in the orbit Nahm proof already kills every Laurent coefficient below -1.
2. Let R(t)=Res_zeta log F_A. Evaluation of log U_{j,m} gives m zeta^{-1}Theta_j R=log z_j(t^m), by the derivative m n_j zeta^{-1} of q^{m n_j}-1.
3. The Euler derivative of zeta V_A(t^m)/m^2 is zeta log z_j(t^m)/m. Both candidate residues have constant coefficient zero. The residue-potential uniqueness argument therefore proves equality.
4. The coordinatewise divisibility statement proves the residue is supported on m-multiples of multi-indices. No prior assertion that L_n is Laurent polynomial enters the proof.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-orbit-nahm](#habironahmseries-hb-8-refinement-orbit-nahm), [HabiroNahmSeries:HB.8/refinement-residue-potential](#habironahmseries-hb-8-refinement-residue-potential), [HabiroNahmSeries:HB.8/laurent-expansion-at-a-root-of-unity](#habironahmseries-hb-8-laurent-expansion-at-a-root-of-unity), `mathlib:IsPrimitiveRoot`, `mathlib:MvPowerSeries.expand`.

**Acceptance.**

- For A=0 and m=2, the t_j^2 residue at q=-1 is 1/4.
- A=(3), m=2 has residue -t^2/4-5t^4/16+O(t^6).
- For every n having a coordinate not divisible by m the residue is zero.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.6, equation (79), p. 23. Exactly Lemma 2.6, proved by a cyclotomic orbit argument instead of the source’s Gaussian synthesis.


<a id="habironahmseries-hb-8-refinement-critical-value"></a>

### The critical value equals the residue potential

**Comparison** · `HabiroNahmSeries:HB.8/refinement-critical-value` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For the constant-one Nahm solution z, V_A=-sum_j Li_2(1-z_j)-one-half sum_{i,j} A_ij log z_i log z_j, with each formal Li_2 composed with the zero-constant series 1-z_j. This agrees with the critical potential in GSWZ (116), independently of the equality of the full Gaussian series.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Differentiate the displayed expression using d Li_2(u)=-log(1-u) du/u in the formal power-series sense.
2. Differentiate the Nahm equations to get d log(1-z_j)=d log t_j+sum_i A_ij d log z_i; logarithmic derivatives of t_j mean Euler derivatives, so no log t_j series is introduced.
3. Symmetry of A cancels the double quadratic terms, leaving dV=sum_j log z_j d log t_j.
4. All constant coefficients vanish. Apply uniqueness from the residue-potential node.

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-residue-potential](#habironahmseries-hb-8-refinement-residue-potential), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), `Polylogarithms:P.1/classical-polylogarithm`, `mathlib:PowerSeries`.

**Acceptance.**

- For A=0 it is -sum_j Li_2(t_j).
- For A=[[2,1],[1,1]], the t_1 t_2 coefficient is -1.
- All analytic branch choices disappear because 1-z_j has zero constant coefficient.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Equation (116), p. 29; equation (168), p. 36. The exact critical value; the derivative calculation replaces reliance on full Gaussian identification.


<a id="habironahmseries-hb-8-refinement-finite-support"></a>

### Finite support in arbitrary rank

**Theorem** · `HabiroNahmSeries:HB.8/refinement-finite-support` · [packet](../packets/HabiroNahmSeries--HB.8.json)

For every symmetric integral A, the unique rational plethystic coefficients L_n of F_A belong to Z[q,q^{-1}] for all nonzero n. Consequently F_A=product_{n≠0,i in Z}(q^i t^n;q)_infinity^{c_{n,i}} with c_{n,i} in Z and finitely many nonzero i for each fixed n; L_n=sum_i c_{n,i}q^i. This is GSWZ Theorem 6, not merely integrality of an unrestricted infinite product.

**Hypotheses and conventions.** The number of variables N is finite; A is symmetric with entries in Z. No positivity or nonnegative-entry assumption is used. All expansions are coefficientwise in t, in the augmentation topology.

**Proof route.**

1. Apply the imported integral plethystic logarithm to every G_j from signed-shift integrality. Uniqueness identifies its coefficient M_{j,n} with [n_j]_q L_n, since log G_j=(sigma_j-1)log F_A. This equality is also valid when n_j=0, with both sides zero.
2. Use the imported pole-location lemma on all j with n_j>0. An L_n outside Z[q^{±1}] must have a simple pole at a primitive a-th root zeta, where a>1 divides every coordinate of n. There is no pole at 1 because [n_j]_1=n_j.
3. Induct on total degree |n|. Write n=a b. In H_n=-sum_{ell|n} L_{n/ell}(q^ell)/(ell(1-q^ell)), every proper-divisor L_{n/ell} is already integral Laurent. The terms with a|ell contribute zeta/a^2 sum_{d|b} L_{b/d}(1)/d^2 to the residue, and the other proper-divisor terms contribute zero.
4. The all-root residue theorem predicts precisely that same sum: the coefficient V_b is sum_{d|b} L_{b/d}(1)/d^2, by taking the q=1 residue of H_b. The only extra possible contribution is -Res_zeta L_n/(1-zeta), from ell=1. It is forced to vanish, contradicting the pole.
5. The monic q-integer denominator and integral numerator in the pole-location lemma give integral Laurent coefficients by monic polynomial division once all possible poles are removed. This step excludes rational constant denominators.
6. Apply the imported product-expansion equivalence. The finite support is the finite Laurent support of L_n; it is not inferred just from integer exponents in Z((q)).

**Direct inputs.** [HabiroNahmSeries:HB.8/refinement-signed-shifts](#habironahmseries-hb-8-refinement-signed-shifts), [HabiroNahmSeries:HB.8/refinement-all-root-residue](#habironahmseries-hb-8-refinement-all-root-residue), [HabiroNahmSeries:HB.8/integral-plethystic-logarithm](#habironahmseries-hb-8-integral-plethystic-logarithm), [HabiroNahmSeries:HB.8/pole-location-lemma](#habironahmseries-hb-8-pole-location-lemma), [HabiroNahmSeries:HB.8/admissible-series](#habironahmseries-hb-8-admissible-series), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents).

**Acceptance.**

- A=(1): L_1=q and L_n=0 for n>1.
- A=0: L_{e_j}=-1 and all other L_n=0.
- For A=[[2,1],[1,1]], L_(1,1)=-q^3; dropping off-diagonal shifts would give the false value 0.
- The wrong sign variant of A=(1) gives L_2=q^2/(1+q), so it is not admissible.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 6 and equations (81)–(89), pp. 24–25. The exact theorem, with the simultaneous coordinate induction and complete proper-divisor residue sum supplied. [ks](https://arxiv.org/pdf/1006.2706v2): Section 6.1, Theorem 9; Section 6.9. Original attribution covers arbitrary signed symmetric integer matrices; it is not used as an unplanned black box.


## HB.9 — Frobenius congruences and indexed membership

The coefficient-transfer lemma specifies a sufficient reduction-faithfulness/saturation hypothesis and proves transfer of all powers of p. Étaleness alone does not supply it. At A=5,p=5, the square-root algebra has branches T=±z²; selecting one loses the other. The target completion also permits unbounded negative Laurent degrees with p-adically tending-to-zero coefficients. Both distinctions remain visible in every Frobenius and descent contract.

The finite first-coefficient calculation uses Wick moments after the correct local regularization and the missing Euler factor exp(Nh/24). It supplies a polynomial local-shape interface; a coefficient test is not an all-order congruence. The explicit integral modified potential W_p is specialized through the full algebra and Coleman's good-disc functions, not by evaluating a formal t-series at t=1.

For product gluing keep the unpowered auxiliary family

\[
 \prod_{i=1}^{\gamma}F_A(q^{\gamma\mu_i}t,q^\gamma)
                       F_A(q^{-\nu}t,q^{-1}).
\]

Its covariance is t_j↦q^γt_j, μ↦μ+1⊗e_j, ν↦ν−γe_j; its unshifted principal parts cancel. The different powered family with t^γ has a valid q-system but retains (V(t^γ)−V(t))/(m²h). It cannot prove universal integral gluing. Neither cancellation nor uniqueness alone proves all-order integrality.

The membership endpoint requires local shape, positive p-adic regulator orientation, the signed finite-Chern constants, full finite étale module scalar change and global product/Frobenius descent. Individual sections generate a span, so a vanishing sum remains allowed. Restricted membership, all-root symmetrisation and torsion powers each retain their separate extension obligations. The converse to torsion powers retains nonvanishing at infinitely many good prime orders. Descendants pull this entire structure along t_j=q^(mν_j), with every algebraic and cyclotomic factor varying.


<a id="habironahmseries-hb-9-frobenius-on-the-coefficient-ring"></a>

### The Frobenius lift on the p-completed coefficient rings

**Construction** · `HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-branch-loss](#habironahmseries-hb-9-followup-branch-loss). Its hypotheses and limitations govern this target and the API names below.

After inverting 2m and δ, the full t-deformed coefficient algebra with Kummer roots is étale over its Laurent base. Import the unique p-completed Frobenius lift from HR.1 for p∤2m. Its action on the selected constant-one t-branch is coefficient Frobenius and t^(1/m)↦t^(p/m). This branch map need not be faithful on the full algebra. Its target is the p-adic inverse-limit Laurent completion described below; ordinary Z_p((t^(1/m))) does not capture unbounded negative exponents with p-adically decaying coefficients. Coefficient transfer and specialization must retain all square-root and Kummer components.

**Proof route.**

1. Reduce δ modulo 5, obtaining z^(−4); substitute the Nahm relation to eliminate t.
2. Factor T²−z⁴=(T−z²)(T+z²); the factors are comaximal because 2z² is a unit.
3. Evaluate T−z² on both components. The normalized branch picks the positive component by uniqueness of the formal square root with constant 1.

**Direct inputs.** [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), `HabiroRings:HR.1/the-etale-frobenius-lift`, `mathlib:IsAdicComplete`, `mathlib:AdicCompletion`.

**Planning API (under the controlling refinement).**

| Declaration | Role | Contract |
| --- | --- | --- |
| `frobeniusCoeff` | data | φ_p : S^{(m)}_p[z^{1/m}] → S^{(m)}_p[z^{1/m}], a ring endomorphism. |
| `frobeniusCoeff_t` | simp | φ_p(t^{1/m}) = t^{p/m}, φ_p(ζ_m) = ζ_m^p. |
| `frobeniusCoeff_sub_pow_mem` | characterisation | φ_p(s) − s^p ∈ p·S^{(m)}_p[z^{1/m}] for every s. |
| `frobeniusCoeff_unique` | universal-property | Any ring endomorphism with the values of frobeniusCoeff_t that lifts the p-th power map mod p equals φ_p. |
| `frobeniusCoeff_embed` | compatibility | ι(φ_p(s)) is ι(s) with t^{1/m} replaced by t^{p/m} and ζ_m by ζ_m^p. |
| `frobeniusCoeff_z` | simp | φ_p(z) = z^p·exp(pη) for a unique η ∈ S^{(1)}_p. |
| `frobeniusCoeff_specOne` | compatibility | The t = 1 specialisation of HB.9/specialisation-at-one intertwines φ_p with the Frobenius of R[δ^{-1/2}]^_p[ζ_m, z^{1/m}]. |

**Discriminating tests (retaining the same qualified hypotheses).**

- **`frobeniusCoeff_A_zero`** (degenerate): For A = 0 (N = 1), φ_p(1 − t) = 1 − t^p in Z_p⟨t, (1 − t)^{-1}⟩.
- **`frobeniusCoeff_z_series`** (computation): For A = (3) and p = 5, ι(φ_5(z)) = 1 + t^5 + 3t^{10} + 12t^{15} + O(t^{20}).
- **`frobeniusCoeff_not_id`** (non-example): φ_p(t) ≠ t: the identity map, the Frobenius of R^_p for R = Z[1/Δ], is not a Frobenius lift on S.
- **`frobeniusCoeff_congr`** (characterisation): For A = (3), φ_7(z) − z^7 ∈ 7·S_7 (checked on ι to order t^20).

**Acceptance.**

- A = 0 (N = 1): S = Z[t^{±1}, (1 − t)^{-1}], z = 1 − t and φ_p(1 − t) = 1 − t^p.
- A = (3): φ_p(z) = 1 + t^p + 3t^{2p} + 12t^{3p} + …, and φ_p(z) − z^p ∈ pS_p.
- φ_p is not the identity on S, unlike the Frobenius of R^_p for R = Z[1/Δ].

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, after (36), p. 13 (arXiv v2). The étaleness that gives the unique Frobenius lift. [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, after (41), p. 14. The Frobenius the source uses without constructing it. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.13, before (133), p. 31. The property used in Lemma 2.13.


<a id="habironahmseries-hb-9-dwork-difference-for-the-gaussian-data"></a>

### The Dwork difference of the potential and of the constants

**Lemma** · `HabiroNahmSeries:HB.9/dwork-difference-for-the-gaussian-data` · [packet](../packets/HabiroNahmSeries.json)

For all primes p and positive integers m with (m, p) = 1 and every k ∈ {0, …, m − 1}^N, the refined Gaussian piece Ω^FGI_{A,m,k}(t, q) of GSWZ (126) satisfies log Ω^FGI_{A,m,k}(t^p, q^p) − p log Ω^FGI_{A,m,k}(t, q) ∈ x^{-1}S^{(m)}_p[1/p, z^{1/m}][[x]] at q = ζ_m + x (GSWZ Lemma 2.13, (128)). The proof reduces to V(t^p)/p − pV(t) ∈ pS^{(1)}_p (GSWZ (130)) and to the analogous statement (131) for δ^{-1}U_{m,k}^2 in pS^{(m)}_p[z^{1/m}]. Both follow by writing φ_p(z) = z^p e^{pη} (φ_p of HB.9/frobenius-on-the-coefficient-ring), expanding the polylogarithms by Li_n(ze^x) = Σ_k x^k Li_{n−k}(z)/k!, and using Li_n^{(p)}(1 − z) ∈ S^{(1)}_p (GSWZ Lemma 2.1 along t ↦ 1 − z).

**Hypotheses and conventions.** A is symmetric integral; m is prime to p; the expansion is at q = zeta_m + x. The identity Li_n(z e^x) = sum_k x^k Li_{n-k}(z)/k! and the fact that Li_n(z) is a rational function with poles only at 1 for n at most 0 are the elementary inputs. The element eta with Frobenius of z equal to z^p times the exponential of p eta exists because z is a unit in the completed ring.

**Proof route.**

1. Write the difference of the potentials using the closed formula for V and the t-deformed equations.
2. Introduce eta by the displayed relation and expand the dilogarithm of the Frobenius, using the expansion of Li_n at a multiplicative perturbation.
3. Recognise the resulting terms as p times elements of the completed ring, using the integrality of Li_n^{(p)} at 1 - z.
4. Repeat the argument for the constants, using that delta^{-m} U_{m,k}^{2m} is a p-unit, so its Frobenius differs from its p-th power by the exponential of p times an element of the ring.
5. Assemble the two statements into the conclusion for the refined pieces, and record the remark that when U^FGI_m is a p-unit the statement lifts to the whole collection.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/fgi-coefficients-in-S](#habironahmseries-hb-8-fgi-coefficients-in-s), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), `HabiroNumberFields:HB.7/pochhammer-dwork-difference`.

**Acceptance.**

- For A = 0 the potential is explicit and the statement can be checked by hand.
- The hypothesis m prime to p cannot be dropped, exactly as in the admissible case.
- The conclusion has 1/p adjoined; removing it is the content of the next node and is not automatic.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.13, (128), p. 31 (arXiv v2; same in v1). The statement (printed Ω^FGI; the TeX macro is \CS). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Lemma 2.13, (130)-(135), pp. 31-32. The key step; the signs in (132)-(135) are corrected in source issue E60. [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 2.14, (136), p. 32. The lifting remark.


<a id="habironahmseries-hb-9-frobenius-congruence"></a>

### The Frobenius congruence for the congruence sums

**Theorem** · `HabiroNahmSeries:HB.9/frobenius-congruence` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract). Its hypotheses and limitations govern this target and the API names below.

Target GSWZ Theorem 4: for p∤m the logarithmic defect of F_{A,m,k}(t^(1/m),q) belongs to (p/x) times the full p-completed coefficient algebra with the indicated roots. Its proof requires the corrected HB.8 identification and level-m admissibility, the explicit modified-potential formula, and faithful integral coefficient transfer. The intersection argument (170) is conditional on the reduction/saturation hypothesis below; selected-branch p-integrality alone is insufficient.

**Proof route.**

1. Use followup-unpowered-product-system and followup-unpowered-product-uniqueness. The covariance is t_j↦q^γt_j, μ↦μ+1⊗e_j,ν↦ν−γe_j; this avoids inserting t^γ into the positive series arguments.
2. Construct the unpowered Gaussian family with the corrected normalization. Its unshifted volumes cancel: γV(t)/(m²γh)+V(t)/(−m²h)=0. Shifts change the regular terms but not the leading root-volume.
3. Show the family solves the unpowered system and has t-constant one; uniqueness identifies it with the rational product.
4. Prove all-order integral coefficients and reduction-faithful transport before specializing: G-coefficient-transfer and G-all-order-gluing. Neither recurrence uniqueness nor cancellation alone proves integrality.
5. Establish coefficient-Frobenius root reexpansion on the full finite product algebra, specialize to the chosen t=1 solution, and descend the Kummer extension using its actual action. The global coefficient ring inverts Δγ, correcting E63 and E66.
6. Do not import the powered-family universal integrality claim from the accepted base. That claim is an unsupported proof repair, now separated from the valid powered recurrences.

**Direct inputs.** [HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible](#habironahmseries-hb-8-congruence-sums-are-level-m-admissible), [HabiroNahmSeries:HB.9/dwork-difference-for-the-gaussian-data](#habironahmseries-hb-9-dwork-difference-for-the-gaussian-data), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.8/dwork-quotient-admissible](#habironahmseries-hb-8-dwork-quotient-admissible), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification), [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility).

**Acceptance.**

- A = 0, N = 1: F_0 = (t; q)_∞^{-1}, S = Z[t^{±1}, (1 − t)^{-1}], and the case m = 1 of (39) is minus GSWZ Proposition 2.2(a) (HabiroNumberFields:HB.7/pochhammer-dwork-difference).
- PARI: for N = 1, A ∈ {−1, …, 4}, p ∈ {3, 5, 7}, m ≤ 5 prime to p, every k, to t^9 and x^4, the left side of (39) has a pole of order exactly one in x and its coefficients have p-adic valuation at least 1 with equality attained; the same for (1 1; 1 1) and (2 −1; −1 2) on t_1 = t_2 = t. The factor is p/x, not p·x or p²/x.
- Neither ingredient alone gives the theorem: Lemma 2.10 has the wrong ring and Lemma 2.13 has 1/p adjoined.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 4, (39), p. 14 (arXiv v2; same in v1). The theorem. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 4, (170), pp. 36-37. The structure of the proof; the inclusion is argued only in outline (E59).


<a id="habironahmseries-hb-9-habiro-module-interface"></a>

### The Habiro ring, its K-three-indexed modules and the restriction to good orders, imported

**Comparison** · `HabiroNahmSeries:HB.9/habiro-module-interface` · [packet](../packets/HabiroNahmSeries.json)

The Habiro ring of a number field and its K_3-indexed modules are HabiroNumberFields HB.6 and HB.7 and are imported by node identifier. This layer uses exactly: (i) H_R and the restricted rings H_R|γ (HabiroNumberFields:HB.6/the-gluing-condition); (ii) invertible L_p(ξ)-sections with the corrected shape f_m ∈ ε_m(ξ)^{1/m}(R^_p[ζ_m]^× + xR^_p[ζ_m] + x²K_p[ζ_m][[x]]) (GSWZ (195); (20) as printed is wrong, HabiroNumberFields/E24), the formal completion log f̂_m = D_p(ξ)/(m² log q) + log f_m (GSWZ (22)) and the condition log(φ_p f̂(q^p)/f̂(q)^p) ∈ ∏_{(m,p)=1}(p/x)R^_p[ζ_m][[x]] (GSWZ (21), p divided by x), and the local module H_{R^_p,ξ} they span (HabiroNumberFields:HB.7/invertible-local-sections); (iii) the global module H_{R,ξ}: families f_m ∈ ε_m(ξ)^{1/m}K[ζ_m][[x]] whose restriction lies in H_{R^_p,ξ} for every p ∤ Δ and such that for every γ ≥ 1 the PRODUCT f(q^γ)^γ·f(q^{-1}) lies in H_{R[1/γ]}|γ (GSWZ (24)); and the restricted module H_{R,ξ}|Δ on orders prime to Δ, whose conditions are those of Definition 1.4 on those orders (GSWZ print '(13)', HabiroNumberFields/E25) (HabiroNumberFields:HB.7/the-global-module); (iv) H_{R,0} = H_R and the multiplication map H_{R,ξ} × H_{R,ξ'} → H_{R,ξ+ξ'} (HabiroNumberFields:HB.7/the-ring-case-and-tensor-products; the tensor isomorphism of Theorem 2 is a gap there and is not used); (v) τ and γ* (HabiroNumberFields:HB.7/operations-on-the-modules); (vi) f_m(0) ∈ R[ζ_m, ε_m(ξ)^{1/m}] for (m, Δ) = 1 (HabiroNumberFields:HB.7/constant-terms); (vii) ε_m(ξ) = c_{ζ_m}(ξ)^2 with its χ^{-1}-equivariance (HabiroNumberFields:HB.2/the-exported-interface). GSWZ Theorem 5 is stated over R[δ^{-1/2}] = R[T]/(δT² − 1), a quadratic étale R-algebra that is in general not the localised ring of integers of a number field; its module needs the extension of scalars along R → R[δ^{-1/2}] with ξ carried along, and the involution √δ ↦ −√δ. HabiroNumberFields records both as a gap; they are requested from HB.7.

**Hypotheses and conventions.** K a number field, Δ > 0 divisible by disc(K) and by 6, R = O_K[1/Δ]. (21) is read with p/x and (24) as a product in the restricted Habiro ring of R[1/γ], the readings fixed by REV-HabiroNumberFields. Nothing about the ring or the modules is proved in this packet.

**Proof route.**

1. Cite the HabiroNumberFields node for each of (i)-(vii).
2. Use the corrected readings HabiroNumberFields/E24 and E25 in HB.9/verifying-the-defining-conditions.
3. Record the request for the extension of scalars to R[δ^{-1/2}] and the involution.

**Direct inputs.** [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), `HabiroNumberFields:HB.6/the-gluing-condition`, `HabiroNumberFields:HB.7/invertible-local-sections`, `HabiroNumberFields:HB.7/the-global-module`, `HabiroNumberFields:HB.7/the-ring-case-and-tensor-products`, `HabiroNumberFields:HB.7/operations-on-the-modules`, `HabiroNumberFields:HB.7/constant-terms`, `HabiroNumberFields:HB.2/the-exported-interface`.

**Acceptance.**

- With ξ = 0 the module is the ring: H_{R,0} = H_R (HabiroNumberFields:HB.7/the-ring-case-and-tensor-products, part (1)).
- The restriction is not a formality: GSWZ Remark 1.9 says the unrestricted statement is probably true and follows if CGZ Theorem 1.6 holds for every m.
- The extension to R[δ^{-1/2}] is not cosmetic: for the figure-eight datum the constant term (−3)^{−1/4} of f_{A,z,1} is not in R.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, the paragraph before Theorem 5, p. 14 (arXiv v2). The restricted module; '(13)' is read as the conditions of Definition 1.4 (HabiroNumberFields/E25). [gswz](https://arxiv.org/pdf/2412.04241v2): Definition 1.4, (23)-(24), p. 10. The global module, imported. [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 1.9, p. 15. What the restriction costs.


<a id="habironahmseries-hb-9-specialisation-at-one"></a>

### The specialisation t = 1 and the choice of m-th roots

**Construction** · `HabiroNahmSeries:HB.9/specialisation-at-one` · [packet](../packets/HabiroNahmSeries.json)

Let z be a non-degenerate solution of GSWZ (41) (with ∏_i z_i^{A_ij}, source issue E36), K = Q(z), and R = O_K[1/Δ] with z_j^{±1} ∈ R. The specialisation (GSWZ (40)) is the ring homomorphism S → R[δ^{-1/2}] = R[T]/(δT² − 1) sending t ↦ 1, z(t) ↦ z, δ(t)^{-1/2} ↦ T. For m ≥ 1 it extends to S^{(m)}[z^{1/m}] → R[δ^{-1/2}][ζ_m][w]/(w^m − z) with t^{1/m} ↦ 1 and z^{1/m} ↦ w; the choice of the m-th root of z is a choice of w, and the automorphisms w ↦ ζ_m w are the Galois action under which GSWZ Lemma 2.12's invariance makes the final answer independent of the choice. The specialisation intertwines φ_p of HB.9/frobenius-on-the-coefficient-ring with the Frobenius of R[δ^{-1/2}]^_p (the lift of HabiroNumberFields:HB.6/coefficient-rings-and-frobenius extended to T).

**Hypotheses and conventions.** z_j and 1 − z_j are units of R (enlarge Δ if needed); for A = (2 −1; −1 2) the solution (1/2, 1/2) shows z need not be integral. δ ≠ 0 (non-degeneracy); T² = δ^{-1}. The specialisation is defined on S, not on the power-series completion: coefficients are specialised as elements of S, which the embedding into Q((t)) determines when that embedding is injective (it is when the t-deformed system is irreducible over Q(t), e.g. A = (3)).

**Proof route.**

1. Check that t ↦ 1 respects the defining relations of S (they become (41)).
2. Extend to S^{(m)}[z^{1/m}] by the choice of w.
3. Check Frobenius compatibility on generators: φ_p(t) = t^p ↦ 1 = φ_p(1).
4. Record the Galois action w ↦ ζ_m w.

**Direct inputs.** [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, `mathlib:AdjoinRoot`.

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `specOne` | data | The ring homomorphism S → R[δ^{-1/2}], t ↦ 1. |
| `specOne_level` | data | Its extension S^{(m)}[z^{1/m}] → R[δ^{-1/2}][ζ_m][w]/(w^m − z) for a chosen w. |
| `specOne_z` | simp | specOne(z(t)) = z, specOne(δ(t)) = δ, specOne(t) = 1. |
| `specOne_frobenius` | compatibility | specOne ∘ φ_p = φ_p ∘ specOne on p-completions. |
| `specOne_galois` | functoriality | Changing the chosen root w to ζ_m^j w composes specOne_level with the automorphism w ↦ ζ_m^j w. |

**Discriminating tests.**

- **`specOne_cubic_delta`** (computation): For A = (3): specOne(δ(t)) = −z² − z − 2, and (2z² + 3z − 9)·(−z² − z − 2) = 23 in Z[z]/(z³ − z + 1).
- **`specOne_zero`** (degenerate): For A = 0 (N = 1) the equation at t = 1 is 1 − z = 1, z = 0 is not a unit, and there is no specialisation: the datum A = 0 has no non-degenerate solution.
- **`specOne_needs_sqrt`** (non-example): For the figure-eight datum there is no ring homomorphism S → O_K[1/6] with t ↦ 1, because δ = −√−3 is not a square in Q(√−3).

**Acceptance.**

- A = (3): S → Z[z, 1/23][T]/(δT² − 1), z³ − z + 1 = 0, δ = −z² − z − 2 with N(δ) = −23 (PARI).
- A = (8 5; 5 4), first quartic component: δ = (753 − 505z_1 − 124z_1² − 186z_1³)/5 (GSWZ (262); equal to (36), PARI), N(δ) = 5²·19².
- Figure-eight datum: z = (ζ_6, ζ_6), δ = (2 − ζ_6)/ζ_6 = −√−3; T is a square root of (−√−3)^{-1} and does not lie in Q(√−3).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, (40), p. 14. The map, made precise.


<a id="habironahmseries-hb-9-constant-term-is-the-unit"></a>

### The constant term of the collection at a root of unity is the unit of the Bloch class

**Lemma** · `HabiroNahmSeries:HB.9/constant-term-is-the-unit` · [packet](../packets/HabiroNahmSeries.json)

Let A be symmetric integral, z a non-degenerate solution of the Nahm equations with Bloch class ξ, K = Q(z), and Δ divisible by disc(K), by 6 and by every prime dividing CGZ's excluded integer M_K. For every m prime to Δ the constant term of f_{A,z,m}(x) is δ^{-1/2}·U^FGI_m(1) (GSWZ (123) at t = 1) and lies in δ^{-1/2}·ε_m(ξ)^{1/m}·K[ζ_m], where ε_m(ξ) = c_{ζ_m}(ξ)^2 is HabiroNumberFields' exported unit. GSWZ's proof of Theorem 5 prints 'ε_m(ξ)^{1/m} times an element of K[ζ_m]', omitting δ^{-1/2} (for the figure-eight datum at m = 1 the constant term is (−3)^{−1/4}, which is not in Q(√−3)); and it cites 'equation (14)' of CGZ, which is the étale Bloch group in every arXiv version, where CGZ (12)-(13) are meant (source issue HabiroNahmSeries/E46). The proof has three steps: (a) U^FGI_m(1) is P_{ζ_m}(ξ)^{-1/m} times an element of K(ζ_m) up to the explicit factors of GSWZ (121), where P_ζ is CGZ's Kummer value; (b) CGZ Theorem 1.2: P_{ζ_m}(ξ) = R_{ζ_m}(ξ)·b^m with R_{ζ_m}(ξ) ∈ K(ζ_m)^× for m prime to M_K; (c) Hutchinson's refinement R_ζ = c_ζ^2 for n prime to M_F. Step (a) and the orientation of the exponent (ε_m^{1/m} rather than ε_m^{-1/m}) are the gap 'The constant term and the Kummer value'.

**Hypotheses and conventions.** m is prime to Δ, and Δ contains 2, 3, the primes of disc(K) and the primes of CGZ's M_K (HabiroNumberFields:HB.1/the-excluded-primes); GSWZ only say that Δ 'includes the primes 2 and 3 and finitely many other primes that depend only on the number field K'. ε_m(ξ) = c_{ζ_m}(ξ)^2 in the convention of HabiroNumberFields:HB.2/the-exported-interface; its m-th root is ambiguous, and the χ^{-1}-equivariance removes the ambiguity in the gluing (24). The sign of the exponent depends on the conventions recorded as open in HabiroNumberFields' gap 'The sign of the comparison scalar'.

**Proof route.**

1. Specialise GSWZ (123) (HabiroNahmSeries:HB.8/fgi-coefficients-in-S) at t = 1 (HabiroNahmSeries:HB.9/specialisation-at-one): the constant term of f_{A,z,m} is δ^{-1/2}U^FGI_m(1).
2. Relate U^FGI_m(1) to P_{ζ_m}(ξ): the m-th power of the factor product over j of (1 − z_j)D_{ζ_m}(1)/((1 − z_j^{1/m})D_{ζ_m}(z_j^{1/m})) in (121) is P_{ζ_m}(ξ)^{-1} times an explicit element of K(ζ_m, z^{1/m}) in CGZ's normalisation of D_ζ, and the sum over k in (121) is invariant under z^{1/m} ↦ ζ_m z^{1/m} (Lemma 2.12). This step is the gap 'The constant term and the Kummer value'.
3. Apply CGZ Theorem 1.2 (HabiroNumberFields:HB.2/kummer-value-P, HB.2/the-map-R-zeta, HB.2/R-injectivity-and-image).
4. Apply R_ζ = c_ζ^2 for n prime to M_F (HabiroNumberFields:HB.2/hutchinson-refinement) and ε_m = c_{ζ_m}^2 (HabiroNumberFields:HB.2/the-exported-interface).
5. Conclude f_{A,z,m}(0) ∈ δ^{-1/2}ε_m(ξ)^{1/m}K[ζ_m] for m prime to Δ.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-coefficients-in-S](#habironahmseries-hb-8-fgi-coefficients-in-s), [HabiroNahmSeries:HB.8/expansion-at-roots-of-unity](#habironahmseries-hb-8-expansion-at-roots-of-unity), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.9/habiro-module-interface](#habironahmseries-hb-9-habiro-module-interface), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), `HabiroNumberFields:HB.1/the-excluded-primes`, `HabiroNumberFields:HB.2/kummer-value-P`, `HabiroNumberFields:HB.2/the-map-R-zeta`, `HabiroNumberFields:HB.2/R-injectivity-and-image`, `HabiroNumberFields:HB.2/hutchinson-refinement`, `HabiroNumberFields:HB.2/the-exported-interface`.

**Acceptance.**

- If rξ = 0 then ε_m(ξ)^r is an m-th power, so f_{A,z,m}(0)^r ∈ δ^{-r/2}K[ζ_m]; this is the constant-term half of GSWZ Corollary 1.11(b).
- Figure-eight datum A = (1 1; 1 1), z = (ζ_6, ζ_6), δ = −√−3: the constant term at m = 1 is (−3)^{−1/4} (GSWZ (1)), which lies in δ^{-1/2}K and not in K.
- Without Hutchinson's refinement the unit is only known up to the exponent γ of CGZ Theorem 1.6, and the module index would be γξ/2 instead of ξ.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 5, first paragraph, §3.3, p. 43 (arXiv v2; same text in v1). The claim and its cited inputs; the factor δ^{-1/2} is missing and CGZ's (14) is the wrong display (source issue E46). [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.12, equation (123), p. 30. The constant term after the principal part is removed is δ^{-1/2}U_m. [cgz](https://arxiv.org/pdf/1712.04887v3): §1.2, Theorem 1.6 and (12)-(13), pp. 4-5 (arXiv v3; same numbering in v1, v2). The comparison GSWZ invoke; with (12) (Theorem 7.4) and Hutchinson's proof of (13) it gives γ = 2.


<a id="habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions"></a>

### The gluing condition, by uniqueness of the solutions of an auxiliary q-difference system

**Lemma** · `HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract). Its hypotheses and limitations govern this target and the API names below.

For γ≥1, gcd(m,γ)=1 and q=ζ_m+x, the unpowered auxiliary Nahm product ∏_i F_A(q^(γμ_i)t,q^γ)·F_A(q^(−ν)t,q^(−1)) is to yield a Gaussian expansion in S^(m)[1/(Δγ)][[x]] after level-m substitution t↦t^(1/m). At each p∤Δγ its coefficients must lie in S_p^(m)[[x]], and root reexpansion must satisfy the coefficient-Frobenius gluing of HB.6. At μ=ν=0 the principal parts cancel. After t=1 this is the product condition ∏_(i=1)^γ f(q^γ)·f(q^(−1)) in the indexed Habiro ring over coefficients with γ inverted on root orders prime to Δ and γ. The powered family of inherited E47 is a valid q-system but cannot supply this universal integrality claim: its principal part is (V(t^γ)−V(t))/(m²h).

**Proof route.**

1. Use followup-unpowered-product-system and followup-unpowered-product-uniqueness. The covariance is t_j↦q^γt_j, μ↦μ+1⊗e_j,ν↦ν−γe_j; this avoids inserting t^γ into the positive series arguments.
2. Construct the unpowered Gaussian family with the corrected normalization. Its unshifted volumes cancel: γV(t)/(m²γh)+V(t)/(−m²h)=0. Shifts change the regular terms but not the leading root-volume.
3. Show the family solves the unpowered system and has t-constant one; uniqueness identifies it with the rational product.
4. Prove all-order integral coefficients and reduction-faithful transport before specializing: G-coefficient-transfer and G-all-order-gluing. Neither recurrence uniqueness nor cancellation alone proves integrality.
5. Establish coefficient-Frobenius root reexpansion on the full finite product algebra, specialize to the chosen t=1 solution, and descend the Kummer extension using its actual action. The global coefficient ring inverts Δγ, correcting E63 and E66.
6. Do not import the powered-family universal integrality claim from the accepted base. That claim is an unsupported proof repair, now separated from the valid powered recurrences.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.9/frobenius-congruence](#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.9/habiro-module-interface](#habironahmseries-hb-9-habiro-module-interface), `HabiroNumberFields:HB.6/the-substitution-exists`, `HabiroNumberFields:HB.6/the-gluing-condition`, `HabiroNumberFields:HB.7/the-global-module`.

**Acceptance.**

- For gamma = 1 the condition is the symmetrisation statement, which is the first corollary of the theorem.
- For A = 0 the auxiliary family is explicit and the uniqueness can be checked directly.
- The uniqueness argument replaces an explicit computation of the gluing, which is not available; this is why the layer's statement is about a q-holonomic module and not about a single series.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 5, second paragraph, (211)-(213), p. 43 (arXiv v2; same in v1). The argument; (212)-(213) corrected as in E7. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 5, third paragraph, p. 44. The descent; the conclusion is S^(m)[1/∆] (E63).


<a id="habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm"></a>

### The potential specialises to the p-adic dilogarithm (the p-adic regulator identity)

**Lemma** · `HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-regulator-specialisation](#habironahmseries-hb-9-followup-regulator-specialisation). Its hypotheses and limitations govern this target and the API names below.

Under the nondegenerate t=1 specialization S_p→B_p, with B=R[T]/(δT²−1), p∤Δ and ξ=Σ_j[z_j], the explicit W_p of followup-modified-potential-formula maps to φ_p(D_p(ξ))/p−pD_p(ξ)∈pB_p. This uses the Iwasawa branch and the regulator normalization D_p(z)=Li₂(z)+(1/2)log(z)log(1−z). It supplies the principal-part comparison between (39) and the local-section defect (21) with f̂=exp(D_p(ξ)/(m²log(q/ζ_m)))f.

**Proof route.**

1. The integral modified polylogarithm specializes to Li_s(y)−p^(−s)Li_s(y^p) by ColemanIntegration:L2/frobenius-relation, because |1−y_j|=|z_j|=1.
2. Both y_j^p and φ_p(y_j) lie in the same permitted residue disc and differ by exp(pβ_j); the logarithmic Taylor expansion converges there. Reversing the calculation in the preceding lemma gives V_Coleman(φ_pz)/p−pV_Coleman(z).
3. Use followup-coleman-potential-sign at z and φ_pz, and Coleman equivariance, to obtain the stated regulator defect.
4. Apply the requested K₃ normalization/localization to identify Σ_jD_p(z_j) with the local K₃ regulator of ξ. Insert the common principal part in (39)/(21).

**Direct inputs.** [HabiroNahmSeries:HB.9/dwork-difference-for-the-gaussian-data](#habironahmseries-hb-9-dwork-difference-for-the-gaussian-data), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), `HabiroNumberFields:HB.7/pochhammer-dwork-difference`, `HabiroNumberFields:HB.7/invertible-local-sections`, `PadicHodgeRegulators:D.1`, `PadicHodgeRegulators:D.4`, `ColemanIntegration:L2`.

**Acceptance.**

- For ξ = 0 in the sense of a datum with every z_j a root of unity of order prime to p, D_p(z_j) = Li_2(z_j) ∈ p²Z_p[z_j] (GSWZ (175)) and both sides lie in pR^_p.
- Without this identity Theorem 4 at t = 1 controls log f with the algebraic principal part removed, while (21) concerns f̂ with D_p(ξ): the two conditions are not comparable.
- The identity is what makes the module index the Bloch class ξ and not an arbitrary element with the same unit.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, after (41), p. 14 (arXiv v2; same in v1). The identity; asserted without proof (E54). [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 2.13 proof, (130) and (132), pp. 31-32. The element whose specialisation is compared.


<a id="habironahmseries-hb-9-module-membership"></a>

### The Gaussian series of a non-degenerate Nahm solution lies in the Habiro module

**Theorem** · `HabiroNahmSeries:HB.9/module-membership` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-etale-module-contract](#habironahmseries-hb-9-followup-etale-module-contract). Its hypotheses and limitations govern this target and the API names below.

Target GSWZ Theorem 5: the polar-part-removed series at a chosen nondegenerate signed solution belongs to H_{R[T]/(δT²−1),ξ}|_Δ. Require the specified integral Bloch/K₃ index, corrected all-order Gaussian identification, integral local constant and first coefficient, signed finite-Chern orientation, full étale coefficient-module descent and product/Frobenius gluing. The algebra may split; every component is retained. This is restricted membership, on root orders prime to Δ. The refined contracts below make all five HB.9 gaps explicit.

**Proof route.**

1. Use the existing quadratic étale algebra construction and HB.6 Frobenius, extended componentwise.
2. Request the HB.7 indexed-module interface for finite products and finite étale coefficient base change; accepted field pullback alone does not supply a theorem for the split algebra.
3. For p∤m the Kummer algebra is finite étale; show corrected pieces and their sums descend via the actual action, and verify first jets, Frobenius defects and nonlinear global gluing before descent.
4. Combine the local-span interface with the coefficient product-gluing proof to obtain the imported module-membership theorem.

**Direct inputs.** [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), [HabiroNahmSeries:HB.9/frobenius-congruence](#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.9/habiro-module-interface](#habironahmseries-hb-9-habiro-module-interface), [HabiroNahmSeries:HB.8/fgi-coefficients-in-S](#habironahmseries-hb-8-fgi-coefficients-in-s), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), `HabiroNumberFields:HB.7/dworks-lemma`, `HabiroNumberFields:HB.7/invertible-local-sections`, `HabiroNumberFields:HB.7/the-global-module`, [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification).

**Acceptance.**

- For ξ torsion of order r, f_{A,z}^r lies in H_{R[δ^{-1/2}]} (HB.9/torsion-powers-lie-in-the-ring).
- For A = (3) the symmetrisation f(q)f(q^{-1}) has x-expansion (2z² + 3z − 9)/23 + (−6477z² − 5311z + 4318)x²/23⁴ + O(x³) (GSWZ (231) = (249), PARI).
- Dropping non-degeneracy makes R[δ^{-1/2}] the zero ring (δ = 0 gives T·0 = 1), so the statement becomes vacuous; dropping the restriction to Δ makes it open (Remark 1.9).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 5, (42), p. 14 (arXiv v2; same in v1). The theorem (printed notation f). [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 5, (214) and the last paragraph, p. 44. The conclusion of the proof.


<a id="habironahmseries-hb-9-descendants-by-specialisation"></a>

### Descendants: specialising the deformation parameter at a power of q

**Construction** · `HabiroNahmSeries:HB.9/descendants-by-specialisation` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](#habironahmseries-hb-9-followup-descendant-pullback-contract). Its hypotheses and limitations govern this target and the API names below.

For ν∈Z^N, root q=ζ_m+x and a nondegenerate t=1 solution, interpret the descendant by t_j^(1/m)=q^ν_j, hence t_j=q^(mν_j). This curve has t_j(0)=1. Pull the completed coefficient algebra at the chosen t=1 point along that curve by formal étale lifting, obtaining z_j(x),δ(x),T(x) and w_j(x) with their prescribed constants. The descendant expansion is the pullback of the full Gaussian expression along these series, including its principal part and varying constant prefactor. Its local and global module conditions require the same Frobenius/product compatibility under q-dependent pullback.

**Proof route.**

1. Use formal étaleness at the chosen solution to lift the curve uniquely, with the selected square-root and Kummer constants.
2. Differentiate the Nahm equations: the matrix A+diag(z/(1−z)) is −Λ, so at x=0 the logarithmic derivative of z is C·(mν/ζ_m). This supplies the first-order chain-rule terms of every algebraic prefactor.
3. Pull back W_p as its explicit completed expression and track the source/target descendant indices under q↦q^p,q^γ,q^(−1).
4. Prove the resulting local span and product gluing, including variation of the principal part; this is G-descendant-transport. Specializing only the unvarying z and δ is insufficient.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Planning API (under the controlling refinement).**

| Declaration | Role | Contract |
| --- | --- | --- |
| `descendant` | data | For ν ∈ Z^N, the collection f_{A,z,ν} = (f_{A,z,ν,m}(x))_{m ≥ 1}, f_{A,z,ν,m} ∈ δ^{-1/2}ε_m(ξ)^{1/m}K[ζ_m][[x]]. |
| `descendant_zero` | simp | descendant A z 0 = f_{A,z}. |
| `descendant_constantCoeff` | simp | The constant term of f_{A,z,ν,m} is that of f_{A,z,m} multiplied by the value at t = 1 of the ν-shift, an explicit element of K(ζ_m, z^{1/m}). |
| `descendant_mem` | characterisation | f_{A,z,ν} ∈ H_{R[δ^{-1/2}],ξ}\|Δ (GSWZ Remark 3.11; proof a gap). |
| `descendant_nahmSum` | compatibility | For positive definite A with even diagonal, f_{A,z,ν} at the distinguished solution is the asymptotic series of the Nahm sum F_ν(q) of GSWZ (259). |

**Discriminating tests (retaining the same qualified hypotheses).**

- **`descendant_nu_zero`** (degenerate): descendant A z 0 = f_{A,z} for A = (3) and z³ − z + 1 = 0.
- **`descendant_cubic_constant`** (computation): For A = (3), ν = 1, m = 1: the x^0 coefficient of the symmetrised descendant f_{A,z,1}(q)f_{A,z,1}(q^{-1}) is the value at t = 1 of the ν = 1 member of the family (222), an element of Z[z, 1/23].
- **`descendant_not_ring_map`** (non-example): The assignment t ↦ q^ν does not factor through a ring homomorphism S → R[δ^{-1/2}]: its values depend on x.
- **`descendant_quartic_integrality`** (compatibility): For A = (8 5; 5 4) and the distinguished solution, the 60-th powers of the eight descendants spanning the q-holonomic module have denominators supported on {5, 19} to the orders computed by GSWZ §4.3.

**Acceptance.**

- For nu = 0 the descendant is the collection itself.
- For the 60-torsion example the source computes the descendants for the eight values of nu that span the q-holonomic module, and finds the same integrality.
- The number of independent descendants is governed by the holonomic rank of the q-holonomic module of the Nahm sum, which is 8 in that example.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 3.11. The statement and the omitted proof, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.7, after Corollary 1.11. The expectation about the span, verbatim, recorded as an expectation.


<a id="habironahmseries-hb-9-p-adic-regulator-input"></a>

### The p-adic dilogarithm and the local K-theory input

**Comparison** · `HabiroNahmSeries:HB.9/p-adic-regulator-input` · [packet](../packets/HabiroNahmSeries.json)

The local p-adic regulator facts used through HabiroNumberFields HB.7 are owned by PadicHodgeRegulators D.3 and are imported by request, not planned here: GSWZ Lemma 3.1 (D_p(z) ∈ p²R^_p for units z with 1 − z a unit), Proposition 3.2 (p^{-2}D_p(ζ^p) ≡ li_{2,p}(ζ)/(ζ − 1)^p mod p), Proposition 3.3 (Span_{Z_p}{p^{-2}D_p(ζ) : ζ ∈ μ(Q_{p^s})} = Z_{p^s}) and Theorem 9 (for p > 3, D_p : K_3(K_p; Z_p) ≅ p²O_{K_p}, generated by the classes of roots of unity). HabiroNahmSeries uses them only through HabiroNumberFields:HB.7/pochhammer-sections and HB.7/local-freeness (GSWZ Theorems 10 and 1).

**Hypotheses and conventions.** p > 3 unramified; Iwasawa branch of the logarithm, which GSWZ note does not matter at the primes used. Owner: PadicHodgeRegulators D.3 (request); no joint ownership.

**Proof route.**

1. Cite PadicHodgeRegulators D.3 by request.
2. Record that HB.9 consumes these facts only through HabiroNumberFields HB.7.

**Direct inputs.** `PadicHodgeRegulators:D.3`, `PadicHodgeRegulators:D.4`, `HabiroNumberFields:HB.7/pochhammer-dwork-difference`, `K3BlochGroups:V.6/regulator-agreement-padic`.

**Acceptance.**

- For s = 1, μ(Q_p) = μ_{p−1} and p^{-2}D_p(ζ) = Li_2^{(p)}(ζ)/(p² − 1); for 5 ≤ p ≤ 23 this is a p-adic unit for p − 3 of the p − 2 roots ζ ≠ 1 (PARI), so the span is Z_p.
- Proposition 3.2 at s = 1 holds modulo p for 5 ≤ p ≤ 23 and every ζ ∈ μ_{p−1}∖{1} (PARI).
- Theorem 9 fails for p = 2, 3, which is one reason 6 | Δ.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Lemma 3.1. The first statement, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Proposition 3.3, equation (eq.xiz). The second statement, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 9. The third statement, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 3.1, the finite polylogarithm. The finite polylogarithm, verbatim.


<a id="habironahmseries-hb-9-torsion-powers-lie-in-the-ring"></a>

### Torsion powers of the Nahm collection lie in the Habiro ring (Corollary 1.11(b))

**Theorem** · `HabiroNahmSeries:HB.9/torsion-powers-lie-in-the-ring` · [packet](../packets/HabiroNahmSeries.json)

For A, z, ξ and R as in HB.9/module-membership: if rξ = 0 in K_3(K) for a positive integer r, then f_{A,z}(q)^r ∈ H_{R[δ^{-1/2}]}. The restricted statement f_{A,z}^r ∈ H_{R[δ^{-1/2}]}|Δ follows from Theorem 5, the multiplication map H_{R,ξ} × ⋯ × H_{R,ξ} → H_{R,rξ} and H_{R,0} = H_R (HabiroNumberFields:HB.7/the-ring-case-and-tensor-products, only its proved parts (0)-(1) and the multiplication map). To reach all orders, write the image of rξ in B(K) as a sum of five-term relations (Suslin's sequence) and use the Kashaev–Mangazeev–Stroganov identity to show that the constant term of f^r at every ζ_m lies in S^{(m)} specialised; the rest of the proof of Theorem 5 (Theorem 4 and the gluing) has no restriction to orders prime to Δ.

**Hypotheses and conventions.** rξ = 0 in K_3(K); ξ is the class of the Bloch element Σ_j [z_j] lifted to K_3(K) (the lift is ambiguous only up to the torsion of K_3^ind). R = O_K[1/Δ] with Δ as in HB.9/module-membership.

**Proof route.**

1. Restricted case: HB.9/module-membership and the multiplication map of HabiroNumberFields HB.7, with H_{R,0} = H_R.
2. Write the image of rξ in the Bloch group as a sum of five-term relations (K3BlochGroups:V.4/suslin-exact-sequence, certified as in K3BlochGroups:V.6/five-term-certificate).
3. Apply the Kashaev–Mangazeev–Stroganov identity (HabiroNumberFields:HB.2/kms-identity) as in CGZ to see that the constant term of f^r at each ζ_m is a specialisation of an element of S^{(m)}.
4. Rerun the local and gluing steps of HB.9/module-membership at the remaining orders.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), `HabiroNumberFields:HB.7/the-ring-case-and-tensor-products`, `HabiroNumberFields:HB.2/kms-identity`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/five-term-certificate`.

**Acceptance.**

- The 60-torsion quartic datum of HB.10: f^{60} ∈ H_{O_F[1/Δ]} with 2·3·5·19 | Δ (and the primes of M_F), δ being a unit there (N(δ) = 5²·19²).
- The (−2,3,7) components over Q(2cos(2π/7)) give a 3-torsion class (GSWZ §4.6); the cube of the series has smaller denominators (2^1997·7^466 instead of 2^1997·3^596·7^466 at x^400).
- For ξ not torsion no power of f lies in the ring by this theorem; see HB.9/bloch-torsion-converse for what is known in that direction.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 1.11(b), p. 15, and proof of Corollary 1.11, p. 44. The two steps of the proof.


<a id="habironahmseries-hb-9-bloch-torsion-converse"></a>

### The converse: a power in the Habiro ring forces Bloch-torsion, under a non-vanishing hypothesis

**Theorem** · `HabiroNahmSeries:HB.9/bloch-torsion-converse` · [packet](../packets/HabiroNahmSeries.json)

Let A, z, ξ, R, Δ be as in HB.9/module-membership and n ≥ 1. If f_{A,z}^n ∈ H_{R[δ^{-1}]} and f_{A,z,ℓ}(0) ≠ 0 for infinitely many primes ℓ ∤ Δ, then ξ is torsion. Proof: for such ℓ, f_{A,z,ℓ}(0)^n lies in R[δ^{-1}][ζ_ℓ] and in δ^{-n/2}ε_ℓ(nξ)^{1/ℓ}K[ζ_ℓ] (HB.9/constant-term-is-the-unit), so ε_ℓ(nξ) is an ℓ-th power in K(ζ_ℓ, √δ), hence in K(ζ_ℓ) (ℓ odd); CGZ Theorem 1.5 (c_{ζ_ℓ} injective on K_3(K)/ℓ for ℓ prime to M_K) gives nξ ∈ ℓK_3(K) for infinitely many ℓ, and K_3(K) is finitely generated, so nξ is torsion. GSWZ state 'an orbit is Bloch-torsion if and only if f_{A,z}(q)^{2r} ∈ H_R, where r is the order' without the non-vanishing hypothesis, which their argument needs (source issue E56); whether the constant terms can vanish for all but finitely many ℓ is open (gap 'Non-vanishing of the constant terms').

**Hypotheses and conventions.** Non-vanishing of f_{A,z,ℓ}(0) for infinitely many primes ℓ ∤ Δ; it is not known in general. The Bloch–Wigner route GSWZ mention would need an analytic link from the q-series to D(σξ) that neither source gives.

**Proof route.**

1. Compare the two descriptions of the constant term at ζ_ℓ.
2. Descend an ℓ-th root from K(ζ_ℓ, √δ) to K(ζ_ℓ) for ℓ odd by taking norms.
3. Apply CGZ Theorem 1.5 (HabiroNumberFields:HB.1/cgz-theorem-1-5).
4. Conclude with the finite generation of K_3(K) (ArithmeticKTheory, Borel).

**Direct inputs.** [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), [HabiroNahmSeries:HB.9/torsion-powers-lie-in-the-ring](#habironahmseries-hb-9-torsion-powers-lie-in-the-ring), `HabiroNumberFields:HB.1/cgz-theorem-1-5`, [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure).

**Acceptance.**

- With HB.9/torsion-powers-lie-in-the-ring: under the non-vanishing hypothesis, ξ is torsion if and only if some power of f_{A,z} lies in H_{R[δ^{-1}]}.
- The second quartic field E of GSWZ §4.3 (disc 229, signature (0,2)) carries a non-torsion class (Bloch–Wigner sums ±1.18968 and ±1.69281 at its complex places, PARI), consistent with the absence of Δ-integrality GSWZ report.
- Without the non-vanishing hypothesis the statement is not proved: a collection whose constant terms vanish carries no information about ε_ℓ(ξ).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.7, after Corollary 1.11, p. 15. The source's converse argument; it needs the non-vanishing hypothesis made explicit here (E56).


<a id="habironahmseries-hb-9-hypotheses-that-cannot-be-dropped"></a>

### Which hypotheses of the membership theorem are load-bearing

**Application** · `HabiroNahmSeries:HB.9/hypotheses-that-cannot-be-dropped` · [packet](../packets/HabiroNahmSeries.json)

Four hypotheses of GSWZ Theorem 5 change the statement if dropped. Non-degeneracy: without it δ = 0, R[δ^{-1/2}] = R[T]/(0·T² − 1) is the zero ring, and the statement is vacuous. The square root of the discriminant: the source states the theorem over R[δ^{-1/2}] and records that f_{A,z} lies in the −1-eigenspace of √δ ↦ −√δ (Remark 1.9); for the figure-eight datum the constant term (−3)^{−1/4} is not in R. The restriction to orders prime to Δ: the unrestricted statement is probably true and follows if CGZ Theorem 1.6 holds for every m (Remark 1.9); it is open. The index ξ: f_{A,z} ∈ H_{R[δ^{-1/2}],0}|Δ fails whenever ξ is non-torsion and f_{A,z,ℓ}(0) ≠ 0 for infinitely many primes ℓ ∤ Δ (HB.9/bloch-torsion-converse); without the non-vanishing hypothesis no failure is proved.

**Hypotheses and conventions.** The four items are statements about Theorem 5 and each is supported by a passage of the source. The third item is an explicit open problem, not an omission of this packet. The fourth item is what makes the theorem a statement about K-theory and not merely about integrality.

**Proof route.**

1. State each hypothesis and the failure that dropping it produces.
2. For the first, record that the ring becomes zero, so that no formalisation can state the conclusion.
3. For the second, record the eigenspace statement of Remark 1.9.
4. For the third, record the source's own assessment and the theorem it would follow from.
5. For the fourth, record the corollary that the torsion case is exactly when the module can be replaced by the ring.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/torsion-powers-lie-in-the-ring](#habironahmseries-hb-9-torsion-powers-lie-in-the-ring), [HabiroNahmSeries:HB.9/bloch-torsion-converse](#habironahmseries-hb-9-bloch-torsion-converse), [HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field](#habironahmseries-hb-3-algebraicity-and-the-nahm-field).

**Acceptance.**

- A degenerate solution gives a vacuous statement, not a false one.
- For torsion ξ of order r, f^r ∈ H_{R[δ^{-1/2}]} (HB.9/torsion-powers-lie-in-the-ring).
- The statement 'f_{A,z} ∈ H_R' without the index and the square root is false for the figure-eight datum already at m = 1.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 1.9. The opening of the remark, verbatim: the stronger statement without Delta and the sign under the Galois automorphism sqrt(delta) -> -sqrt(delta); the remark goes on to the other items, including rational A at the cost of a larger Delta.


<a id="habironahmseries-hb-9-verifying-the-defining-conditions"></a>

### How the defining conditions of the K-three-indexed modules are verified

**Comparison** · `HabiroNahmSeries:HB.9/verifying-the-defining-conditions` · [packet](../packets/HabiroNahmSeries.json)

Membership of f_{A,z} in H_{R[δ^{-1/2}],ξ}|Δ is verified condition by condition against HabiroNumberFields:HB.7/the-global-module, with GSWZ Definition 1.3 read with the corrected shape (195) and (21) with p/x. (1) Shape (23): HB.9/constant-term-is-the-unit gives f_{A,z,m} ∈ δ^{-1/2}ε_m(ξ)^{1/m}K[ζ_m][[x]]. (2) Local condition at every p ∤ Δ: on each disc of order m prime to pΔ, the specialisation of Theorem 4 (HB.9/frobenius-congruence) together with the potential identity (HB.9/potential-and-the-p-adic-dilogarithm) gives (21) for the formal completion with D_p(ξ). Dwork's lemma (HabiroNumberFields:HB.7/dworks-lemma) and the shape (195) then make each refined piece an invertible L_p(ξ)-section, so their weighted sum lies in the span H_{R^_p,ξ}. The integrality of the linear coefficient required by (195) is the gap 'Linear coefficient for the corrected shape'. (3) Gluing (24) for every γ ≥ 1: HB.9/gluing-by-uniqueness-of-q-difference-solutions. The local modules are free of rank one (HabiroNumberFields:HB.7/local-freeness, GSWZ Theorem 1), and their generators (the Pochhammer sections of Definition 3.9 and Theorem 10, HabiroNumberFields:HB.7/pochhammer-sections) are not needed for membership. They are what makes the local condition checkable numerically (GSWZ (287)).

**Hypotheses and conventions.** p > 3 unramified, i.e. p ∤ Δ; m prime to p. Nothing about the modules is proved here; the node only matches conditions to nodes. Remark 3.8 (simple poles with residues m^{-2}D_p(ξ)) is a heuristic of the source with 'mild assumptions' and is not used.

**Proof route.**

1. Shape: cite HB.9/constant-term-is-the-unit.
2. Local condition: cite HB.9/frobenius-congruence, HB.9/potential-and-the-p-adic-dilogarithm and HabiroNumberFields:HB.7/dworks-lemma, and record the linear-coefficient gap.
3. Gluing: cite HB.9/gluing-by-uniqueness-of-q-difference-solutions.
4. Assemble in HB.9/module-membership.

**Direct inputs.** [HabiroNahmSeries:HB.9/habiro-module-interface](#habironahmseries-hb-9-habiro-module-interface), [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), [HabiroNahmSeries:HB.9/frobenius-congruence](#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm), [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), `HabiroNumberFields:HB.7/dworks-lemma`, `HabiroNumberFields:HB.7/local-freeness`, `HabiroNumberFields:HB.7/pochhammer-sections`, `HabiroNumberFields:HB.7/the-global-module`.

**Acceptance.**

- For ξ = 0 the local sections are spanned by the constant collection 1, and (21) reduces to Dwork's lemma for a family of power series.
- Omitting the gluing (24) leaves a family of local sections that need not come from a single global element; (24) is what ties the discs of different orders together.
- With the printed shape (20) the local condition would admit the non-integral family (1 + x/ζ_m)^{1/p} (HabiroNumberFields/E24), so the linear-coefficient check is not optional.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 5, p. 44. The local condition as GSWZ argue it; made precise by the potential identity. [gswz](https://arxiv.org/pdf/2412.04241v2): Definition 1.3, (20)-(22), p. 9. Condition (21), with p divided by x.


<a id="habironahmseries-hb-9-constant-terms-of-the-series"></a>

### Constant terms of the Nahm collection at roots of unity of order prime to Δ

**Theorem** · `HabiroNahmSeries:HB.9/constant-terms-of-the-series` · [packet](../packets/HabiroNahmSeries.json)

For A, z, ξ, R and Δ as in HB.9/module-membership and every m prime to Δ, the constant term f_{A,z,m}(0) lies in R[δ^{-1/2}][ζ_m, ε_m(ξ)^{1/m}]. This is Theorem 5 combined with Proposition 1.5(f) over the ring R[δ^{-1/2}]. GSWZ Corollary 1.10 prints 'is in R[ζ_m]', which is false: for the figure-eight datum the constant term at m = 1 is (−3)^{−1/4} (source issue HabiroNahmSeries/E44).

**Hypotheses and conventions.** m prime to Δ; Δ as in HB.9/module-membership. The ring contains δ^{-1/2} and the Kummer root ε_m(ξ)^{1/m}; for ξ = 0 and δ a square unit of R it reduces to R[ζ_m]. For the figure-eight sum of GSWZ (43) the correct normalisation is 1/√(m*), m* = (−1)^{(m−1)/2}m (source issue E45).

**Proof route.**

1. Apply HB.9/module-membership.
2. Apply HabiroNumberFields:HB.7/constant-terms (Proposition 1.5(f)) to the module over R[δ^{-1/2}], i.e. after the extension of scalars requested from HabiroNumberFields HB.7.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), `HabiroNumberFields:HB.7/constant-terms`.

**Acceptance.**

- Figure-eight datum, m = 1: the constant term is (−3)^{−1/4} ∈ R[δ^{-1/2}] and not in R.
- Figure-eight datum, (m, 6) = 1, θ^m = ζ_6: S_m = Σ_{k∈Z/mZ}(ζ_mθ; ζ_m)_k(ζ_m^{-1}θ^{-1}; ζ_m^{-1})_k satisfies S_m²/m ∈ Z[ζ_{6m}], and S_m/√(m*) ∈ Z[ζ_{6m}]; S_m/√m ∉ Q(ζ_{6m}) for m = 7, 11 (PARI, m = 5, 7, 11, 13).
- For torsion ξ of order r, f_{A,z,m}(0)^r ∈ δ^{-r/2}R[ζ_m] (HB.9/torsion-powers-lie-in-the-ring).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 1.10 and (43), §1.7, p. 15 (arXiv v2; same in v1). The corollary, with its ring corrected to R[δ^{-1/2}][ζ_m, ε_m^{1/m}] (E44) and the normalisation of (43) corrected (E45).


<a id="habironahmseries-hb-9-symmetrisation-lies-in-the-ring"></a>

### The symmetrised collection lies in the Habiro ring (Corollary 1.11(a))

**Theorem** · `HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring` · [packet](../packets/HabiroNahmSeries.json)

For A, z and R as in HB.9/module-membership, f_{A,z}(q)·f_{A,z}(q^{-1}) ∈ H_{R[δ^{-1}]}, at ALL roots of unity (no restriction to orders prime to Δ). It equals H_R when δ ∈ R^×, which GSWZ's printed statement (44) tacitly assumes (source issue E55). The proof is the case γ = 1 of the gluing (24) established in HB.9/gluing-by-uniqueness-of-q-difference-solutions, together with the invariance of the product under √δ ↦ −√δ; it does not go through Theorem 5, which is restricted to orders prime to Δ.

**Hypotheses and conventions.** As in HB.9/module-membership, except that no restriction on the orders is needed. δ ∈ R^× is needed to write H_R; in all GSWZ examples N(δ) is supported on the primes of disc(K).

**Proof route.**

1. Apply HB.9/gluing-by-uniqueness-of-q-difference-solutions with γ = 1: the family ψ^{(1)}_{A,0,0}(t^{1/m}, ζ_m + x) has coefficients in S^{(m)}[1/Δ] for every m and glues after p-completion and Frobenius for every p ∤ Δ.
2. Specialise t = 1 (HB.9/specialisation-at-one); the principal parts cancel (GSWZ, after Definition 1.4).
3. The product is invariant under √δ ↦ −√δ because f_{A,z} lies in the −1-eigenspace (Remark 1.9), so its coefficients lie in R[δ^{-1}].

**Direct inputs.** [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), `HabiroNumberFields:HB.6/the-gluing-condition`.

**Acceptance.**

- A = (3): the constant term is 1/δ = (2z² + 3z − 9)/23 ∈ Z[z, 1/23] (PARI).
- Figure-eight datum: √−3·Φ(h)Φ(−h) = 1 − (q − 1)²/27 + … (GSWZ (2)); from the coefficients of (1), 2a_2 − a_1² = −1/27 (PARI).
- 5_2 datum: δf(x)f(−x/(1+x)) has x² coefficient (465α² − 465α + 54)/23³, which equals 2a_2 − a_1² for the coefficients of (282) (PARI).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Corollary 1.11(a), (44), p. 15, and proof of Corollary 1.11, p. 44. The proof through (24) at γ = 1.


### HB.9 finer contracts

These 18 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-9-followup-saturation-transfer"></a>

### Transfer of divisibility along a saturated coefficient map

**Lemma** · `HabiroNahmSeries:HB.9/followup-saturation-transfer` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let ι:S→T be a homomorphism of commutative rings, T a domain, p∈S with ι(p)≠0, and assume ι(a)∈ι(p)T implies a∈pS for every a∈S. Then ι(a)∈ι(p)^nT implies a∈p^nS for every n≥0. Consequently the image of S[1/p] intersects T inside S: if ι(a)/ι(p)^n belongs to T, a/p^n is represented by an element of S. The same statement with p^(n+1) instead of p^n transfers p-divisibility, coefficient by coefficient, in the logarithmic defect of (39).

**Hypotheses and conventions.** S and T are commutative; T is a domain and ι(p)≠0. The localization map into T[1/ι(p)] is understood. For coefficient products use the statement on each domain factor with jointly faithful reduction. Injectivity after rationalization alone is insufficient.

**Proof route.**

1. Induct on n. For n+1 reduce ι(a)=ι(p)^(n+1)b modulo ι(p); the hypothesis writes a=pc. Cancel ι(p) in T and apply induction to c.
2. If a denominator p^n occurs and its image is p-integral, the conclusion clears exactly that denominator. To prove membership in pS, apply the same argument to divisibility by p^(n+1).
3. A sufficient hypothesis is injectivity S/pS→T/ι(p)T. Check this on the actual completed rings before applying it; it is not a consequence of étaleness.

**Direct inputs.** `mathlib:RingHom`.

**Acceptance.**

- For S=T=Z_p and ι=id, all powers transfer.
- S=Z_p[u]/(u²−1), T=Z_p and u↦1 violates the reduction hypothesis; u−1 is invisible in T.
- An application to the entire Nahm coefficient algebra must account for every square-root/Kummer component.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.7, proof of Theorem 4, (170), pp.36–37. Own elementary denominator-clearing lemma specifying what the source intersection would require; no assertion that its hypothesis holds for the full S_p.


<a id="habironahmseries-hb-9-followup-branch-loss"></a>

### A single formal branch does not detect the full coefficient algebra

**Application** · `HabiroNahmSeries:HB.9/followup-branch-loss` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For N=m=1, A=(5), p=5, the Nahm relation is t=(z−1)z^(−5) and δ=z^(−5)(5−4z). In the mod-5 coefficient algebra, with z and z−1 inverted and T=δ^(−1/2), the relation is T²=z⁴. Its two maps to F₅[z,z^(−1),(z−1)^(−1)] send T to ±z². On the normalized t=0 branch z(0)=T(0)=1, T=z². Thus T−z² maps to zero on that branch but is nonzero in the full algebra, as the other map sends it to −2z². The full reduction map proposed in accepted source issue E59 is therefore not injective in general.

**Hypotheses and conventions.** This is a counterexample to a proposed proof repair, not to Theorem 4. The t=0 evaluation lands in F₅((t)), since t is inverted in S. Both square-root components are retained in S; no quotient selecting one sign is silently imposed.

**Proof route.**

1. Reduce δ modulo 5, obtaining z^(−4); substitute the Nahm relation to eliminate t.
2. Factor T²−z⁴=(T−z²)(T+z²); the factors are comaximal because 2z² is a unit.
3. Evaluate T−z² on both components. The normalized branch picks the positive component by uniqueness of the formal square root with constant 1.

**Direct inputs.** [HabiroNahmSeries:HB.8/ring-S-and-its-level-m-variants](#habironahmseries-hb-8-ring-s-and-its-level-m-variants), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring).

**Acceptance.**

- Both component maps satisfy δT²=1.
- The value −2z² is a unit on the negative component.
- A Frobenius-compatible branchwise proof must still justify transport to an arbitrary nondegenerate t=1 solution.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §1.7, (35)–(38), pp.13–14; (170), pp.36–37. Own rank-one mod-5 computation refining the already confirmed E59; do not create a duplicate erratum against the original source.


<a id="habironahmseries-hb-9-followup-regularisation-jet"></a>

### Corrected pole subtraction for the Gaussian factor

**Lemma** · `HabiroNahmSeries:HB.9/followup-regularisation-jet` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Put q=ζ_m e^h, Z=θ^m and y_a=ζ_m^(k+1+a)θ, 0≤a<m. The logarithm of (q^(k+1)θe^w;q)_∞ is Σ_a Σ_r≥0 B_r((k+1+a)/m)m^(r−1)Li_(2−r)(y_a e^w)h^(r−1)/r!. Its quadratic pole is Li₂(Z)/(m²h)+Li₁(Z)w/(mh)+Li₀(Z)w²/(2h). Its h⁰w⁰ term is −Σ_a B₁((k+1+a)/m)log(1−y_a). Subtract precisely these terms to obtain the regularized factor used by HB.8. The logarithmic residual has w³/h and w⁴/h vertices mLi_(−1)(Z)/6 and m²Li_(−2)(Z)/24, w and w² vertices Σ_a B₁(s_a)Li₀(y_a) and (1/2)Σ_a B₁(s_a)Li_(−1)(y_a), and h vertex (m/2)Σ_a B₂(s_a)Li₀(y_a).

**Hypotheses and conventions.** m≥1; θ and 1−θ^m are units in a characteristic-zero coefficient algebra containing a primitive ζ_m; k is an integer representative. The completion is the Gaussian weight completion: w has weight 1 and h weight 2; w³/h has weight 1. A statement that the residual is in 1+x times an ordinary w-power-series ring is not used. This corrects inherited HB.8/fgi-collection; it does not introduce another formal Pochhammer or Gaussian integration definition.

**Proof route.**

1. Use (59) with shifted argument q^(k+1)θe^w and the Bernoulli translation formula.
2. Apply Σ_a Li_s(ζ_m^aθ)=m^(1−s)Li_s(θ^m), then differentiate with respect to w.
3. Compute B₁(s)=s−1/2 and B₂(s)=s²−s+1/6; retain only Gaussian weight at most 2.
4. Correct all three subtractions in printed (114), including the constant-log sign; use source issue E64.

**Direct inputs.** [HabiroNahmSeries:HB.8/formal-pochhammer-symbol](#habironahmseries-hb-8-formal-pochhammer-symbol), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization).

**Acceptance.**

- At m=1 the subtracted quadratic coefficient is Li₀(θ)/(2h), not Li₀(θ)/h.
- The normalized residual has constant 1.
- At m=2 the subtracted linear coefficient is Li₁(θ²)/(2h), not Li₁(θ²)/(4h).

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.1, (59)–(60), p.19; §2.5, (114), p.29. Own derivation from the Bernoulli expansion, correcting (114). See E64; higher orders use the same series, not the printed erroneous factor.


<a id="habironahmseries-hb-9-followup-gaussian-first-jet"></a>

### The first Gaussian coefficient with diagonal vertices

**Definition** · `HabiroNahmSeries:HB.9/followup-gaussian-first-jet` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For a finite coordinate type I, a characteristic-zero field L, symmetric covariance C:I×I→L, vectors b,Q,T,U:I→L, and c∈L, define gaussianFirstJet(C,b,Q,T,U,c) = c + (1/2)Σ_i Q_i C_ii + (1/2)Σ_ij b_i b_j C_ij + (1/2)Σ_ij T_i b_j C_ii C_ij + (1/8)Σ_i U_i C_ii² + (1/8)Σ_ij T_i T_j C_ii C_jj C_ij + (1/12)Σ_ij T_i T_j C_ij³. This finite polynomial is the coefficient of h after Gaussian integration of exp(Σ_i b_iw_i +(1/2)Σ_i Q_iw_i² +(1/(6h))Σ_i T_iw_i³ +(1/(24h))Σ_i U_iw_i⁴ +hc), modulo terms of Gaussian weight >2.

**Hypotheses and conventions.** I is finite; L is a characteristic-zero field. Symmetry is needed for the interpretation as Gaussian covariance, although the finite polynomial itself is defined for any C. The Hessian inverse in the application is C=Λ^(−1), not −Λ^(−1). The exponent of the Gaussian density is −wᵗΛw/(2h).

**Proof route.**

1. Define the displayed finite polynomial on existing finite functions and finite sums.
2. Wick contractions give ⟨w_i³w_j⟩/h²=3C_iiC_ij, ⟨w_i⁴⟩/h²=3C_ii² and ⟨w_i³w_j³⟩/h³=9C_iiC_jjC_ij+6C_ij³.
3. Enumerate Gaussian weight 2: hc, Qw²/2, (bw)²/2, (Tw³/(6h))(bw), Uw⁴/(24h), and (Tw³/(6h))²/2. Other terms have weight >2 or odd moments.

**Direct inputs.** [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), `mathlib:PowerSeries.coeff`, [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `gaussianFirstJet` | constructor | The finite polynomial displayed in the statement. |
| `gaussianFirstJet_map` | functoriality | A field homomorphism maps the value to the value on the mapped data. |
| `gaussianFirstJet_zero_covariance` | simp | With C=0 the result is c. |
| `gaussianFirstJet_integral` | compatibility | For a subring O⊂L containing 1/2 and 1/3, if all entries of C,b,Q,T,U and c lie in O, the value lies in O. |

**Discriminating tests.**

- **`gaussianFirstJet_linear`** (computation): For I=Fin 1, C=1,b=1,Q=T=U=c=0, the value is 1/2.
- **`gaussianFirstJet_cubic`** (computation): For I=Fin 1, C=T=1,b=Q=U=c=0, the value is 5/24.
- **`gaussianFirstJet_quartic`** (computation): For I=Fin 1, C=U=1,b=Q=T=c=0, the value is 1/8.
- **`gaussianFirstJet_empty`** (degenerate): For I=Fin 0 the value is c.
- **`gaussianFirstJet_mixed`** (computation): For I=Fin 1,C=b=T=1,Q=U=c=0, the value is 29/24, including the mixed cubic-linear term.

**Acceptance.**

- The cubic-only rank-one term is 5T²C³/24.
- Only 2 and 3 occur as constant denominators.
- A covariance-zero or empty-coordinate test returns c.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.5, Gaussian integration (110), p.28; (114), (118), pp.29–30. Own finite coefficient formula for the imported Gaussian operation, not a new integration theory.


<a id="habironahmseries-hb-9-followup-refined-linear-integrality"></a>

### Integral first jet of each refined Gaussian piece

**Theorem** · `HabiroNahmSeries:HB.9/followup-refined-linear-integrality` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For symmetric integral A, a nondegenerate Nahm solution z in K, m coprime to Δ and p∤Δ, set O=(O_K[1/Δ])^∧_p[T,w,ζ_m]/(δT²−1,w_j^m−z_j). Here Δ contains 6, disc(K), M_K and denominators of z_j,z_j^(−1),δ^(−1). With corrected (114) and the Euler factor exp(Nh/24), the normalized principal-part-free refined piece Ω̄_(A,m,k)(1,x)/Ω̄_(A,m,k)(1,0) has linear coefficient ζ_m^(−1)gaussianFirstJet(C,b,Q,T₃,U₄,c)∈O. Put C=Λ^(−1); b_j=(Ak)_j+A_jj/2+Σ_a B₁(s_(j,a))Li₀(y_(j,a)), Q_j=Σ_a B₁(s_(j,a))Li_(−1)(y_(j,a)), T₃,j=mLi_(−1)(z_j), U₄,j=m²Li_(−2)(z_j), and c=N/24+Σ_j (m/2)Σ_a B₂(s_(j,a))Li₀(y_(j,a))−Σ_jΣ_(r=1)^k_j rζ_m^r/(1−ζ_m^r), with y_(j,a)=ζ_m^(k_j+1+a)w_j and s_(j,a)=(k_j+1+a)/m. The last sum is the first jet of ∏_j(q;q)_(k_j).

**Hypotheses and conventions.** 0≤k_j<m; Ω̄ is obtained by removing exp(V(t)/(m²h)) from the refined single piece at q=ζ_m+x (m′=1) BEFORE coefficient specialization at t=1. Its individual constant is a unit after adjoining the finite 2m-th roots occurring in that constant; the first-jet quotient is in O. Its identification with the fixed ε_m torsor is G-kummer-orientation. The full sum need not have a nonzero constant. Symbols T₃ and U₄ are cubic/quartic vertices; the square-root generator T is different. No claim at p=2 or 3, at p|m, or at a degenerate Hessian. O is a finite product algebra, not a chosen field.

**Proof route.**

1. Use followup-regularisation-jet and the covariance Λ^(−1) to identify the vertices; include N/24 from the Euler denominator, source issue E65.
2. The prefactor q^((kᵗAk+diag(A)·k)/2) cancels in the refined piece; differentiating the remaining finite Pochhammer factors gives the last term of c.
3. Each 1−ζ_m^a w_j is a unit because its product over a is 1−z_j=(-1)^A_jj∏_i z_i^A_ij, a unit. Each 1−ζ_m^r, 0<r<m, is a p-unit because p∤m.
4. C has integral entries by the adjugate formula and det(−Λ)=δ∏_j z_j^A_jj/(1−z_j). Bernoulli coefficients introduce only 2,3,m; all are p-units.
5. Apply gaussianFirstJet_integral. Since h=log(1+x/ζ_m)=x/ζ_m+O(x²), convert the coefficient by ζ_m^(−1).
6. This supplies the missing first-jet input to HB.7 Dwork; Kummer orientation and all-order defect/gluing remain separate inputs.

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-regularisation-jet](#habironahmseries-hb-9-followup-regularisation-jet), [HabiroNahmSeries:HB.9/followup-gaussian-first-jet](#habironahmseries-hb-9-followup-gaussian-first-jet), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity](#habironahmseries-hb-4-euler-function-at-a-root-of-unity), [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](#habironahmseries-hb-8-refinement-gaussian-normalization), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification).

**Acceptance.**

- For A=(3),m=1, substitute t=(z−1)z^(−3),δ=(3−2z)z^(−3): the formula with +1/24 agrees identically with (242); omitting it differs by −1/24.
- The formula works componentwise and is stable under permutation of the chosen w_j roots.
- A zero constant in the sum of pieces does not authorize division by that sum.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.5, (110), (118), (126), pp.28–32; §3.2, corrected shape (195), pp.39–41; §4.2, (242), p.49. Own first-jet proof, including the corrections E64/E65. It establishes local linear integrality of the intended series; compatibility of the corrected construction with all HB.8 identities is a named upstream proof obligation.


<a id="habironahmseries-hb-9-followup-auxiliary-product"></a>

### The powered auxiliary Nahm product

**Construction** · `HabiroNahmSeries:HB.9/followup-auxiliary-product` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let I be finite, γ≥1, L a field, q∈L×, F⁺,F⁻∈L[[t_i:i∈I]], μ=(μ₁,…,μ_γ) with μ_i∈Z^I, and ν∈Z^I. Define auxiliaryProduct(q,γ,F⁺,F⁻,μ,ν)(t)=∏_(i=1)^γ F⁺(q^(γμ_i)t^γ)·F⁻(q^(−ν)t), componentwise. In the Nahm application F⁺=F_A(t,q^γ), F⁻=F_A(t,q^(−1)). Use the existing power substitution t_j↦t_j^γ and rescale by q^(γμ_i) before that substitution; reversing these operations without changing the scale would insert γ².

**Hypotheses and conventions.** γ is a positive integer; q is a unit. No positivity or nondegeneracy of A is required for the rational t-series. For root expansion take L=Q(ζ_m)((x)),q=ζ_m+x, and gcd(m,γ)=1 for the integral/gluing application. The definition itself needs no coprimality.

**Proof route.**

1. Apply MvPowerSeries.rescale to F⁺ with coordinates q^(γμ_i), then MvPowerSeries.expand γ, and multiply the finite family with the rescaled F⁻.
2. Use the constant coefficient ring homomorphism to compute the product constant.
3. For covariance, scaling t_j by q shifts each μ_i by e_j and ν by −e_j. This computation is independent of the Nahm equations.

**Direct inputs.** `mathlib:MvPowerSeries.expand`, `mathlib:MvPowerSeries.rescale`, `mathlib:MvPowerSeries.map`, [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `auxiliaryProduct` | constructor | The finite product with rescale before expand as displayed. |
| `auxiliaryProduct_constantCoeff` | simp | Its constant is (F⁺(0))^γ F⁻(0), hence 1 when both constants are 1. |
| `auxiliaryProduct_one` | compatibility | At γ=1 it is F⁺(q^μ₁t)F⁻(q^(−ν)t). |
| `auxiliaryProduct_covariance` | characterisation | Scaling t_j by q gives auxiliaryProduct at μ_i+e_j for every i and ν−e_j. |
| `auxiliaryProduct_map` | functoriality | A field homomorphism commutes with the construction, mapping q and both coefficient series. |

**Discriminating tests.**

- **`auxiliaryProduct_units`** (degenerate): With F⁺=F⁻=1 all γ,μ,ν give 1.
- **`auxiliaryProduct_gamma_two`** (computation): Over Q, γ=2,q=2,F⁺=t,F⁻=1,μ₁=μ₂=1,ν=0 gives 16t⁴.
- **`auxiliaryProduct_inverse_shift`** (computation): Over Q,γ=1,q=2,F⁺=1,F⁻=t,μ=0,ν=1 gives t/2.
- **`auxiliaryProduct_two_coordinates`** (computation): Over Q,γ=1,q=2,F⁺=t₀+t₁,F⁻=1,μ=(1,−1),ν=0 gives 2t₀+t₁/2.
- **`auxiliaryProduct_covariance_test`** (compatibility): For γ=2,q=2,F⁺=t,F⁻=1,μ=0,ν=0, scaling t↦2t gives 16t⁴, equal to shifting both μ_i by 1.

**Acceptance.**

- The construction uses exactly γ factors with t^γ and one factor with t.
- Negative shifts are supported through integer powers of a unit.
- At γ=2,q=2,F⁺=t,μ₁=μ₂=1,F⁻=1 the value is 16t⁴, rather than 256t⁴.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3, proof of Theorem 5, corrected (212), p.43. General-rank extension of the powered repair proposed in inherited E47, importing the existing F_A. This is a diagnostic family; the source product (212) is unpowered and its covariance is repaired separately below.


<a id="habironahmseries-hb-9-followup-product-system"></a>

### The general-rank auxiliary q-difference system

**Theorem** · `HabiroNahmSeries:HB.9/followup-product-system` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For symmetric A∈Mat_I(Z), let Ψ_(μ,ν) be the auxiliary Nahm product. For i∈{1,…,γ},j∈I, write E_ij for the μ-array increment at (i,j), A_j for column j of A, and e_i⊗A_j for incrementing only μ_i by that column. Then Ψ_(μ,ν)−Ψ_(μ+E_ij,ν)=(-1)^A_jj q^(γ(A_jj+μ_ij))t_j^γ Ψ_(μ+e_i⊗A_j,ν); Ψ_(μ,ν)−Ψ_(μ,ν+e_j)=(-1)^A_jj q^(−(A_jj+ν_j))t_j Ψ_(μ,ν+A_j); and Ψ_(μ,ν)(t₁,…,qt_j,…)=Ψ_(μ+1⊗e_j,ν−e_j)(t). The constant is 1.

**Hypotheses and conventions.** γ≥1; q∈L×; F⁺ and F⁻ satisfy the imported HB.8 F_A systems at q^γ and q^(−1). Integer matrix entries, including negative ones, act by integer powers of q. The tail increments are columns, not just diagonal entries.

**Proof route.**

1. Apply (33) to exactly the i-th positive factor with parameter q^γ and argument q^(γμ_i)t^γ; multiply by all other factors.
2. Apply (33) to the negative factor with parameter q^(−1) and argument q^(−ν)t.
3. Use auxiliaryProduct_covariance for the last equation and its constant API for normalization.

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-auxiliary-product](#habironahmseries-hb-9-followup-auxiliary-product), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Acceptance.**

- For N=1 this reduces to corrected E47, including q^(γμ_i) and q^(−ν).
- Exact arithmetic through total degree 4 checks all three equations for A=[[2,−1],[−1,3]], [[0,1],[1,−2]], [[1,1],[1,1]],γ=2 and μ=((1,−1),(0,2)),ν=(−2,1),q=2.
- Dropping off-diagonal column shifts fails for the coupled matrices.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §1.7, (33), p.13; §3.3, corrected (213), pp.43–44. Own multivariable derivation of the source rank-one system; the printed coefficient is corrected by E47.


<a id="habironahmseries-hb-9-followup-product-uniqueness"></a>

### Uniqueness of the normalized auxiliary family in arbitrary rank

**Theorem** · `HabiroNahmSeries:HB.9/followup-product-uniqueness` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let L be a field, q∈L× with q^n≠1 for every integer n>0, γ≥1 and A symmetric integral. Any two families Ψ,Θ:((Z^I)^γ×Z^I)→L[[t]] with constant 1 satisfying all three equations of followup-product-system agree at every μ,ν. The statement applies to L=Q(ζ_m)((x)),q=ζ_m+x, regardless of ζ_m having finite order.

**Hypotheses and conventions.** Every parameter value μ,ν is included; a single solution without its shift family is insufficient. The equations have t_j^γ and t_j on the right. q itself, rather than its constant ζ_m, must have infinite order. For I empty, normalization already determines the series.

**Proof route.**

1. Induct on the total t-degree of the difference Ψ−Θ. Fix α≠0 and assume lower coefficients vanish for all parameters.
2. Both difference equations show the α-coefficient is invariant under every unit shift of μ and ν because their right sides have strictly smaller degree. Thus it is independent of all μ,ν.
3. The covariance then gives (q^α_j−1)c_α=0. Choose j with α_j>0 and cancel the nonzero scalar in L.
4. For q=ζ_m+x the polynomial q^n−1 has nonzero x^n coefficient, so it is a nonzero element of the Laurent-series field even when ζ_m^n=1.

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-product-system](#habironahmseries-hb-9-followup-product-system), `mathlib:MvPowerSeries`.

**Acceptance.**

- No division by 1−ζ_m^α_j occurs.
- Without covariance the first two equations only remove parameter dependence and do not force c_α=0.
- The same induction works with γ=1 and negative A entries.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3, paragraph following (213), p.44. Own complete general-rank induction replacing the source rank-one uniqueness paragraph.


<a id="habironahmseries-hb-9-followup-integral-gluing-contract"></a>

### Integral product gluing and Frobenius transport

**Comparison** · `HabiroNahmSeries:HB.9/followup-integral-gluing-contract` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For γ≥1, gcd(m,γ)=1 and q=ζ_m+x, the unpowered auxiliary Nahm product ∏_i F_A(q^(γμ_i)t,q^γ)·F_A(q^(−ν)t,q^(−1)) is to yield a Gaussian expansion in S^(m)[1/(Δγ)][[x]] after level-m substitution t↦t^(1/m). At each p∤Δγ its coefficients must lie in S_p^(m)[[x]], and root reexpansion must satisfy the coefficient-Frobenius gluing of HB.6. At μ=ν=0 the principal parts cancel. After t=1 this is the product condition ∏_(i=1)^γ f(q^γ)·f(q^(−1)) in the indexed Habiro ring over coefficients with γ inverted on root orders prime to Δ and γ. The powered family of inherited E47 is a valid q-system but cannot supply this universal integrality claim: its principal part is (V(t^γ)−V(t))/(m²h).

**Hypotheses and conventions.** The product is interpreted using root-coordinate substitutions: x↦(ζ_m+x)^γ−ζ_m^γ and x↦(ζ_m+x)^(−1)−ζ_m^(−1), together with the chosen-root transport of HB.6. For coefficients invert Δ and γ; local integrality is required only at p∤Δγ. This is the localization R[1/γ] in HB.7 and GSWZ Definition 1.4. The stronger assertion at p|γ is false (E66). This node is a conditional contract, not a claim that q-difference uniqueness implies integral coefficients.

**Proof route.**

1. Use followup-unpowered-product-system and followup-unpowered-product-uniqueness. The covariance is t_j↦q^γt_j, μ↦μ+1⊗e_j,ν↦ν−γe_j; this avoids inserting t^γ into the positive series arguments.
2. Construct the unpowered Gaussian family with the corrected normalization. Its unshifted volumes cancel: γV(t)/(m²γh)+V(t)/(−m²h)=0. Shifts change the regular terms but not the leading root-volume.
3. Show the family solves the unpowered system and has t-constant one; uniqueness identifies it with the rational product.
4. Prove all-order integral coefficients and reduction-faithful transport before specializing: G-coefficient-transfer and G-all-order-gluing. Neither recurrence uniqueness nor cancellation alone proves integrality.
5. Establish coefficient-Frobenius root reexpansion on the full finite product algebra, specialize to the chosen t=1 solution, and descend the Kummer extension using its actual action. The global coefficient ring inverts Δγ, correcting E63 and E66.
6. Do not import the powered-family universal integrality claim from the accepted base. That claim is an unsupported proof repair, now separated from the valid powered recurrences.

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-unpowered-product-uniqueness](#habironahmseries-hb-9-followup-unpowered-product-uniqueness), [HabiroNahmSeries:HB.9/followup-saturation-transfer](#habironahmseries-hb-9-followup-saturation-transfer), `HabiroNumberFields:HB.6/the-gluing-condition`, [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.9/followup-unpowered-auxiliary-product](#habironahmseries-hb-9-followup-unpowered-auxiliary-product), [HabiroNahmSeries:HB.9/followup-unpowered-product-system](#habironahmseries-hb-9-followup-unpowered-product-system), [HabiroNahmSeries:HB.9/followup-regularisation-jet](#habironahmseries-hb-9-followup-regularisation-jet), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](#habironahmseries-hb-8-refinement-gaussian-shifts), [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](#habironahmseries-hb-8-refinement-gaussian-regularity), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification), [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility).

**Acceptance.**

- At γ=1 the two products agree and the volume cancels.
- At γ=2,A=0,m=1, the powered product has volume −Li₂(t²)+Li₂(t), a nonzero formal series. It cannot be an ordinary x-power series.
- The unpowered family has q^γ covariance and a complete arbitrary-rank uniqueness proof; integral all-order coefficient estimates remain required.
- At A=0,m=1,γ=5 and zero shifts, the coefficient of t is 5/(1−q⁵)+q/(q−1)=3−2x+x²+x³/5+O(x⁴), q=1+x. Thus p=5 integrality requires inverting γ. For the nondegenerate A=(3) datum the corresponding x³ coefficient is 3224/5.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3, proof of Theorem 5, (212)–(214), pp.43–44. Refines the general-rank gap and corrects the localization in E63; distinguishes uniqueness from the missing integral/gluing proof.


<a id="habironahmseries-hb-9-followup-coleman-potential-sign"></a>

### The Coleman potential has the positive Bloch-class sign

**Lemma** · `HabiroNahmSeries:HB.9/followup-coleman-potential-sign` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let L be a characteristic-zero field, A symmetric integral, z_i∈L∖{0,1}, logarithm values L_i=log(z_i), and a dilogarithm satisfying Li₂(z_i)+Li₂(1−z_i)=−log(z_i)log(1−z_i). If log(1−z_j)=Σ_i A_ij L_i, then −Σ_j Li₂(1−z_j)−(1/2)Σ_ij A_ij L_iL_j = Σ_j (Li₂(z_j)+(1/2)log(z_j)log(1−z_j)). For the Iwasawa logarithm on a Nahm solution, log((-1)^A_jj)=0, so the right side is D_p(Σ_j[z_j]), with positive sign.

**Hypotheses and conventions.** The reflection identity is the p-adic one, with no complex π²/6 constant. The Nahm logarithm identity holds at t=1; at general t one also has log t_j and cannot delete it.

**Proof route.**

1. Use the reflection identity in each coordinate.
2. Sum the logarithmic Nahm equations multiplied by L_j to obtain Σ_j L_j log(1−z_j)=Σ_ij A_ij L_iL_j.
3. Combine the full sum with the negative half quadratic term.

**Direct inputs.** `ColemanIntegration:L2/dilogarithm-identities`, [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm).

**Acceptance.**

- A complex dilogarithm with its ζ(2) constant is excluded.
- The sign agrees with GSWZ (116) and (174).
- For a two-coordinate coupled A, the off-diagonal terms occur twice before the factor 1/2.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.5, (116), p.29; §3.1, (174), p.37. Own algebraic reduction using the imported Coleman reflection formula; establishes the regulator sign without evaluating the formal t-series at 1.


<a id="habironahmseries-hb-9-followup-modified-potential-formula"></a>

### An explicit integral formula for the potential defect

**Lemma** · `HabiroNahmSeries:HB.9/followup-modified-potential-formula` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For p>3, y_j=1−z_j, φ_p(z_i)=z_i^p exp(pη_i), η_i∈S_p, and β_j=Σ_i A_ijη_i, define W_p by the following convergent expression in S_p: pΣ_j ℓ₂(y_j)+pΣ_j β_jℓ₁(y_j)−(p/2)Σ_ij A_ijη_iη_j−Σ_jΣ_(r≥2) p^(r−1)β_j^r Li_(2−r)(y_j^p)/r!. Here ℓ_s is the imported integral modified polylogarithm, and Li_s for s≤0 is the rational function (u∂_u)^(−s)(u/(1−u)). This expression lies in pS_p and on the normalized formal t-branch equals V(t^p)/p−pV(t).

**Hypotheses and conventions.** S_p is the p-adic completion of the full coefficient algebra with 2 and all required Nahm units inverted; p∤m in the level-m use. η_i=p^(−1)log(φ_p(z_i)/z_i^p) is defined on 1+pS_p. Do not posit an Iwasawa logarithm for arbitrary units in S_p. The series converges p-adically; the formal branch identity alone does not provide an embedding of the entire algebra.

**Proof route.**

1. Nahm gives φ_p(y_j)=y_j^p exp(pβ_j), since p is odd and t↦t^p.
2. Expand Li₂(y_j^p exp(pβ_j)) by its logarithmic Taylor series; the r≥2 terms are rational functions with unit denominator 1−y_j^p.
3. Use Li₂(y^p)−p²Li₂(y)=−p²ℓ₂(y) and Li₁(y^p)−pLi₁(y)=−pℓ₁(y), correcting E60.
4. The linear Taylor term and the cross term of the quadratic logarithm combine to +pβ_jℓ₁(y_j). The remaining quadratic term is −pηᵗAη/2.
5. For r≥2, v_p(p^(r−1)/r!)≥1 and tends to infinity. Negative polylogarithms have integral rational coefficients at y_j^p with 1−y_j^p a unit. Hence every summand is divisible by p and the limit converges.

**Direct inputs.** [HabiroNahmSeries:HB.9/dwork-difference-for-the-gaussian-data](#habironahmseries-hb-9-dwork-difference-for-the-gaussian-data), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), `ColemanIntegration:L2/integral-modified-polylogarithm`.

**Acceptance.**

- Setting every η_i=0 gives W_p=pΣ_jℓ₂(y_j).
- The Li₁ term has positive sign in the displayed W_p.
- The expression is defined on all coefficient components without a logarithm of z_i.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.5, Lemma 2.13, (130), corrected (132)–(135), pp.31–32. Own explicit Taylor formula correcting the signs and omitted factors of the source argument; ℓ_s is imported rather than redefined.


<a id="habironahmseries-hb-9-followup-regulator-specialisation"></a>

### Specialization of the potential defect to the local regulator

**Theorem** · `HabiroNahmSeries:HB.9/followup-regulator-specialisation` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Under the nondegenerate t=1 specialization S_p→B_p, with B=R[T]/(δT²−1), p∤Δ and ξ=Σ_j[z_j], the explicit W_p of followup-modified-potential-formula maps to φ_p(D_p(ξ))/p−pD_p(ξ)∈pB_p. This uses the Iwasawa branch and the regulator normalization D_p(z)=Li₂(z)+(1/2)log(z)log(1−z). It supplies the principal-part comparison between (39) and the local-section defect (21) with f̂=exp(D_p(ξ)/(m²log(q/ζ_m)))f.

**Hypotheses and conventions.** p>3, R_p is a finite product of unramified integer rings, z_j and 1−z_j are units, and δ is inverted. Coleman Li₂, log and their Frobenius equivariance are imported; K₃ localization is requested from D.1/D.3/D.4. The equality concerns W_p as a p-adically completed algebraic expression. No evaluation of V(t)∈Q[[t]] at t=1 is performed.

**Proof route.**

1. The integral modified polylogarithm specializes to Li_s(y)−p^(−s)Li_s(y^p) by ColemanIntegration:L2/frobenius-relation, because |1−y_j|=|z_j|=1.
2. Both y_j^p and φ_p(y_j) lie in the same permitted residue disc and differ by exp(pβ_j); the logarithmic Taylor expansion converges there. Reversing the calculation in the preceding lemma gives V_Coleman(φ_pz)/p−pV_Coleman(z).
3. Use followup-coleman-potential-sign at z and φ_pz, and Coleman equivariance, to obtain the stated regulator defect.
4. Apply the requested K₃ normalization/localization to identify Σ_jD_p(z_j) with the local K₃ regulator of ξ. Insert the common principal part in (39)/(21).

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-modified-potential-formula](#habironahmseries-hb-9-followup-modified-potential-formula), [HabiroNahmSeries:HB.9/followup-coleman-potential-sign](#habironahmseries-hb-9-followup-coleman-potential-sign), `ColemanIntegration:L2/frobenius-relation`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/dilogarithm-identities`, [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), `PadicHodgeRegulators:D.1`, `PadicHodgeRegulators:D.4`.

**Acceptance.**

- The analytic comparison takes place on the punctured line in the variable y_j, not by an unstated continuation theorem on the whole Nahm variety.
- This removes the sign ambiguity in the p-adic potential; it does not remove the independent finite-Chern/Kummer orientation ambiguity.
- For ξ=0 the regulator defect vanishes.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §1.7, after (41), p.14; §3.1, (174), p.37; (130), pp.31–32. Own specialization proof conditional on the named Coleman and K₃ suppliers; refines E54 with an explicit expression, avoiding divergent formal evaluation.


<a id="habironahmseries-hb-9-followup-kummer-orientation-contract"></a>

### The finite-Chern orientation of Gaussian constants

**Comparison** · `HabiroNahmSeries:HB.9/followup-kummer-orientation-contract` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For every m prime to Δ, compare U_m(1) in corrected (121) to the exported HB.2 ε_m(ξ)=c_(ζ_m)(ξ)². On the universal Kummer algebra, D_GSWZ(θ)^m=D_CGZ(θ) and P_(ζ_m)(ξ)=∏_j D_CGZ(w_j)/D_CGZ(1) modulo m-th powers. The cyclic prefactor of U_m has the inverse P class. A proof must track the powers of z, the finite k-sum and the square-root normalization to establish that every refined constant is in ε_m(ξ)^(1/m)B_p[ζ_m]× and the whole constant in δ^(−1/2)ε_m(ξ)^(1/m)K[ζ_m]. The finite-Chern comparison must fix whether the exported class is R_(ζ_m)(ξ) or its inverse; this cannot be chosen to match the desired module index.

**Hypotheses and conventions.** Δ contains 6, disc(K), M_K, all Nahm-unit denominators and primes needed to invert δ; m prime to Δ means gcd(m,Δ)=1. The full family is allowed to have zero constant; only the individual refined constants are units in their torsors. Use the reviewed HB.2 base interface; the needs_changes HB.2 follow-up is a lead, not an accepted orientation proof.

**Proof route.**

1. Import the cyclic dilogarithm and Kummer maps from HB.2; raise the full (121) prefactor to the m-th power before passing to a quotient class.
2. Identify the finite k-sum and all monomial factors in the same Kummer extension, then prove the corrected k-permutation invariance. Invariance of the sum alone does not select the signed Chern class.
3. Request the signed comparison from HB.2; until supplied record G-kummer-orientation and retain the theorem as conditional.
4. Descend the Kummer algebra using the actual action and multiplication/torsor comparison from HB.7. Keep δ^(−1/2); dropping it fails already at m=1.

**Direct inputs.** [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `HabiroNumberFields:HB.2/kummer-value-P`, `HabiroNumberFields:HB.2/the-exported-interface`, `HabiroNumberFields:HB.2`.

**Acceptance.**

- The figure-eight constant (−3)^(−1/4) lies in δ^(−1/2)K, not K.
- D_CGZ uses exponent a while D_GSWZ uses a/m.
- A sign in the local regulator does not by itself fix the finite-Chern orientation.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §2.5, corrected (121)–(124), pp.30–31; §3.3, proof of Theorem 5, p.43. Refines the already recorded constant-term gap E46; CGZ v3 §2.2 (20)–(21), pp.10–11, is also read. No unproved sign choice is made. [CGZ.HB9.v3](https://arxiv.org/pdf/1712.04887v3): §1.1, (7)–(8), p.3; §2.2, (20)–(21), pp.10–11. Short literal PDF-text excerpt from the numerator of (20); the surrounding fraction is Dζ(x)/Dζ(1), interpreted modulo m-th powers. This compares CGZ with the inverse GSWZ cyclic prefactor.


<a id="habironahmseries-hb-9-followup-etale-module-contract"></a>

### Quadratic étale coefficients and Kummer descent for membership

**Comparison** · `HabiroNahmSeries:HB.9/followup-etale-module-contract` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let R=O_K[1/Δ], with δ a unit, and B=R[T]/(δT²−1). The membership target uses the Habiro module H_(B,ξ|B) on the full quadratic finite étale algebra, including the split case. Its local rings are the full products B_p[ζ_m], its Frobenius is the unique lift on every component, and ξ|B is the scalar restriction of the Bloch/K₃ class, componentwise. The HB.7 module, local spans, product gluing, multiplication and Kummer torsors must extend from number fields to this full algebra and preserve descent from B_p[ζ_m,w]/(w_j^m−z_j). This is a supplier contract to HB.7, not a new Habiro-module definition.

**Hypotheses and conventions.** 2δ∈R×; Δ includes the finite excluded-prime sets for the field factors of B⊗Q, enlarged to a common Δ. A formal square-root choice is not an embedding B→R. If δ is already a square in K, B⊗Q is K×K. Global effective module descent in the accepted HB.7 follow-up remains a gap and is inherited here.

**Proof route.**

1. Use the existing quadratic étale algebra construction and HB.6 Frobenius, extended componentwise.
2. Request the HB.7 indexed-module interface for finite products and finite étale coefficient base change; accepted field pullback alone does not supply a theorem for the split algebra.
3. For p∤m the Kummer algebra is finite étale; show corrected pieces and their sums descend via the actual action, and verify first jets, Frobenius defects and nonlinear global gluing before descent.
4. Combine the local-span interface with the coefficient product-gluing proof to obtain the imported module-membership theorem.

**Direct inputs.** [HabiroNahmSeries:HB.9/habiro-module-interface](#habironahmseries-hb-9-habiro-module-interface), `HabiroNumberFields:HB.7/invertible-local-sections`, `HabiroNumberFields:HB.7/the-global-module`, `HabiroNumberFields:HB.7/followup-field-pullback`, `HabiroNumberFields:HB.7/followup-effective-global-descent`, `HabiroRings:HR.1/the-etale-frobenius-lift`, `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, [HabiroNahmSeries:HB.9/followup-refined-linear-integrality](#habironahmseries-hb-9-followup-refined-linear-integrality), [HabiroNahmSeries:HB.9/followup-regulator-specialisation](#habironahmseries-hb-9-followup-regulator-specialisation), [HabiroNahmSeries:HB.9/followup-kummer-orientation-contract](#habironahmseries-hb-9-followup-kummer-orientation-contract), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract), `HabiroNumberFields:HB.7`, `PadicHodgeRegulators:D.3`.

**Acceptance.**

- If δ=a², B has two square-root factors, both retained.
- The figure-eight datum needs a nontrivial quadratic coefficient extension.
- The sum of local sections lies in the local module span even when it is not invertible.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §1.5, Definitions 1.3–1.4, pp.9–10; §1.7, Theorem 5, p.14. Clarifies the full-algebra target and precise HB.7 extension needed; no duplicate general Habiro ring or module is planned.


<a id="habironahmseries-hb-9-followup-descendant-pullback-contract"></a>

### Étale pullback along the level-m descendant curve

**Comparison** · `HabiroNahmSeries:HB.9/followup-descendant-pullback-contract` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For ν∈Z^N, root q=ζ_m+x and a nondegenerate t=1 solution, interpret the descendant by t_j^(1/m)=q^ν_j, hence t_j=q^(mν_j). This curve has t_j(0)=1. Pull the completed coefficient algebra at the chosen t=1 point along that curve by formal étale lifting, obtaining z_j(x),δ(x),T(x) and w_j(x) with their prescribed constants. The descendant expansion is the pullback of the full Gaussian expression along these series, including its principal part and varying constant prefactor. Its local and global module conditions require the same Frobenius/product compatibility under q-dependent pullback.

**Hypotheses and conventions.** δ≠0 and Δ inverts 2δ,m and all required Nahm units for each permitted m; negative ν is allowed since q is a unit. This refines the inherited descendant node; it is not a constant ring map S→B and is not the fixed t=q^ν convention for all m. All-order descendant membership is a target with G-descendant-transport, not asserted from equality of constant terms.

**Proof route.**

1. Use formal étaleness at the chosen solution to lift the curve uniquely, with the selected square-root and Kummer constants.
2. Differentiate the Nahm equations: the matrix A+diag(z/(1−z)) is −Λ, so at x=0 the logarithmic derivative of z is C·(mν/ζ_m). This supplies the first-order chain-rule terms of every algebraic prefactor.
3. Pull back W_p as its explicit completed expression and track the source/target descendant indices under q↦q^p,q^γ,q^(−1).
4. Prove the resulting local span and product gluing, including variation of the principal part; this is G-descendant-transport. Specializing only the unvarying z and δ is insufficient.

**Direct inputs.** [HabiroNahmSeries:HB.9/descendants-by-specialisation](#habironahmseries-hb-9-descendants-by-specialisation), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.9/followup-modified-potential-formula](#habironahmseries-hb-9-followup-modified-potential-formula), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/ring-S-and-its-level-m-variants](#habironahmseries-hb-8-ring-s-and-its-level-m-variants).

**Acceptance.**

- ν=0 recovers the fixed t=1 series.
- At m=2,q=−1+x,ν=1, t=q²=1−2x+x²; the incorrect t=q curve starts at −1.
- At m=1,q=1+x,ν=−1, t=(1+x)^(−1)=1−x+O(x²).

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3, Remark 3.11, p.44; §4.1, (222), p.45. Refines E57 with the exact formal étale pullback and a chain-rule calculation. The all-order transport remains explicit. HB.10 owns the integer-shift ring elements.


<a id="habironahmseries-hb-9-followup-unpowered-auxiliary-product"></a>

### The auxiliary product for volume cancellation

**Construction** · `HabiroNahmSeries:HB.9/followup-unpowered-auxiliary-product` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For finite I, γ≥1, a field L, unit q, series F⁺,F⁻∈L[[t]], μ∈(Z^I)^γ and ν∈Z^I, define unpoweredAuxiliaryProduct=∏_i rescale(q^(γμ_i),F⁺)·rescale(q^(−ν),F⁻). Thus its Nahm application is ∏_i F_A(q^(γμ_i)t,q^γ)·F_A(q^(−ν)t,q^(−1)). No t-power substitution occurs. This is the original source product (212), with its covariance repaired to q^γ as specified by the next node.

**Hypotheses and conventions.** γ≥1 and q is a unit; the finite product and all integer powers are defined. At a root, gcd(m,γ)=1 is required for the gluing application, but not for the construction.

**Proof route.**

1. Use existing MvPowerSeries.rescale homomorphisms and finite multiplication.
2. The construction commutes with coefficient homomorphisms, preserves the indicated constant product, and under rescaling t_j by q^γ increments all μ_ij by one while decrementing ν_j by γ.
3. At μ=ν=0 its common level-m Gaussian volume cancels; compare the powered construction, whose volume need not cancel.

**Direct inputs.** `mathlib:MvPowerSeries.rescale`, `mathlib:MvPowerSeries.map`, [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `unpoweredAuxiliaryProduct` | constructor | The displayed finite product of rescaled series. |
| `unpoweredAuxiliaryProduct_constantCoeff` | simp | Constant equals constant(F⁺)^γ·constant(F⁻). |
| `unpoweredAuxiliaryProduct_covariance` | relation | Rescale t_j by q^γ: μ↦μ+1⊗e_j and ν↦ν−γe_j. |
| `unpoweredAuxiliaryProduct_map` | functoriality | A coefficient field homomorphism maps the product to the product of the mapped inputs. |

**Discriminating tests.**

- **`unpoweredAuxiliaryProduct_gamma_two`** (computation): I=Fin 1,q=2,γ=2,F⁺=t,F⁻=1,μ_i=1,ν=0:16t².
- **`unpoweredAuxiliaryProduct_units`** (degenerate): F⁺=F⁻=1 gives 1 at every shift.
- **`unpoweredAuxiliaryProduct_inverse_shift`** (computation): I=Fin 1,q=2,γ=1,F⁺=1,F⁻=t,μ=0,ν=1:t/2.

**Acceptance.**

- All four API contracts and three unit tests below must hold.
- For γ=2 with F⁺=t,q=2,μ_i=1 the output is 16t², distinguishing this product from the powered one.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3, (211)–(213), p.43. Keep the source product and replace its wrong q covariance by q^γ covariance; this refines inherited E47 without another erratum.


<a id="habironahmseries-hb-9-followup-unpowered-product-system"></a>

### The unpowered auxiliary q-difference system

**Theorem** · `HabiroNahmSeries:HB.9/followup-unpowered-product-system` · [packet](../packets/HabiroNahmSeries--HB.9.json)

Let A be symmetric integral and F⁺=F_A(t,q^γ), F⁻=F_A(t,q^(−1)). For P_(μ,ν)=unpoweredAuxiliaryProduct, P_(μ,ν)−P_(μ+E_ij,ν)=(-1)^A_jj q^(γ(A_jj+μ_ij))t_j P_(μ+e_i⊗A_j,ν); P_(μ,ν)−P_(μ,ν+e_j)=(-1)^A_jj q^(−(A_jj+ν_j))t_j P_(μ,ν+A_j); and P_(μ,ν)(t₁,…,q^γt_j,…)=P_(μ+1⊗e_j,ν−γe_j). The constant is one.

**Hypotheses and conventions.** Finite I; γ≥1; q a unit. The input Nahm recurrences are at q^γ and q^(−1). Unlike the powered system, the positive right side has t_j, and covariance is q^γ rather than q.

**Proof route.**

1. Apply the imported F_A recurrence to each rescaled factor; all other factors remain fixed.
2. For covariance compare the arguments directly: q^(γμ_ij)q^γ=q^(γ(μ_ij+1)) and q^(−ν_j)q^γ=q^(−(ν_j−γ)).

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-unpowered-auxiliary-product](#habironahmseries-hb-9-followup-unpowered-auxiliary-product), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a).

**Acceptance.**

- Coupled matrices and negative entries are included.
- At γ=1 this is the powered system.
- Exact rank-two degree-four checks with γ=2 and nonzero positive/negative shifts verify every equation.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §1.7 (33), p.13; §3.3 (211)–(213), p.43. Own general-rank derivation using the original unpowered product and the corrected shift coefficients/q^γ covariance.


<a id="habironahmseries-hb-9-followup-unpowered-product-uniqueness"></a>

### Uniqueness with the q-power covariance

**Theorem** · `HabiroNahmSeries:HB.9/followup-unpowered-product-uniqueness` · [packet](../packets/HabiroNahmSeries--HB.9.json)

For γ≥1, finite I, a field L and q∈L× with q^n≠1 for all n>0, any two families P,Q indexed by all μ∈(Z^I)^γ and ν∈Z^I with t-constant one, satisfying all three equations of followup-unpowered-product-system, coincide.

**Hypotheses and conventions.** All integer parameter shifts are included. γ is positive; the covariance factor on a coefficient α is q^(γα_j).

**Proof route.**

1. Induct on total degree of the difference. Both recurrences have a positive t_j factor, so the coefficient is invariant under every unit μ and ν shift by the lower-degree induction hypothesis.
2. Covariance now gives (q^(γα_j)−1)c_α=0. If α is positive, choose α_j>0; γα_j>0 and the non-root hypothesis forces c_α=0.
3. The empty-coordinate case is the common constant. The field Q(ζ_m)((x)) with q=ζ_m+x satisfies the non-root hypothesis.

**Direct inputs.** [HabiroNahmSeries:HB.9/followup-unpowered-product-system](#habironahmseries-hb-9-followup-unpowered-product-system), `mathlib:MvPowerSeries`.

**Acceptance.**

- Does not claim coefficient integrality from uniqueness.
- At γ=1 agrees with the powered uniqueness argument.
- The proof uses total degree and works for coupled rank greater than one.

**Sources.** [GSWZ.HB9.v2](https://arxiv.org/pdf/2412.04241v2): §3.3 paragraph after (213), p.44. Own corrected uniqueness proof for the q^γ covariance; q^(γα_j)−1 replaces q^α_j−1.


## HB.10 — Residues, explicit examples and cohomology boundaries

The quadratic Gauss example is a constant Taylor family with values 1 at odd orders, 0 at orders congruent to 2 modulo 4 and 2 at orders divisible by 4. It glues over ℤ[1/2]; over ℤ the edge m=1,p=2 already fails. It is a rational coefficient-ring example, not a rational Nahm solution.

The quartic example separates exact algebra from source numerics. Its explicit integral basis gives field discriminant −475 rather than the polynomial discriminant −11875, and the discriminant inverse and norms certify the localized units. The source's 60-torsion claim needs an exact five-term certificate and a specified K₃ lift. Its complete excluded-prime list also needs the quartic tame kernel. A restricted section of the finite étale coefficient algebra does not automatically export globally to Picard or to a higher cohomology class.

The scalar cubic symmetrisation is a finite Gaussian-polynomial identity. At q=−1 its constant is (z(t)⁻¹+T)/δ(t), T²=t, beginning 1+T+4T²+5T³+21T⁴+28T⁵. This repairs the missing algebraic factors in GW (182); it does not prove every higher Taylor coefficient or the p=2,3 gluing of every independently shifted descendant. The supported ring is ℤ[z,1/138]; descent to ℤ[z,1/23] is conditional on those exact inputs.

For an admitted element s∈H_R, the dimension-zero export is the actual ℤ[q]-algebra map η_R=H⁰(d_R)⁻¹∘κ_R⁻¹, preserving all Taylor maps. It does not replace s by a constant family. A higher geometric output needs X/B, a form, convergence and Frobenius data, and the naive-to-algebraic comparison requested from HQ.6. Regulator tuples, coefficient lines and geometric cohomology classes have different targets.


<a id="habironahmseries-hb-10-symmetrisation-and-residue-formula"></a>

### Symmetrisation as a residue, and its integrality

**Theorem** · `HabiroNahmSeries:HB.10/symmetrisation-and-residue-formula` · [packet](../packets/HabiroNahmSeries.json)

For a symmetric integral A let J_A(t, w, q) = Σ_{n ∈ Z^N_{≥0}} (−q^{1/2})^{n^tAn} q^{diag(A)·n/2} w^{An} t^n/(qw; q)_n (GSWZ (215)). At q = ζ_m + x it lies in Z[ζ_m][t, w_i^{±1}, (1 − t_i^m P_i(w^m))^{-1}][[x]] with P_i(z) = (−1)^{A_ii}(1 − z_i)^{-1}∏_j z_j^{A_ij} (GSWZ (216)-(217)). Let z = z(t) be the power-series solution of t_iP_i(z) = 1 with z(0) = 1. Define Ψ_{A,m}(t, x) as the sum, over the m^N points w with w^m = z(t), of the residues of t^{-1/m}J_A(t^{1/m}, w, ζ_m + x)dw/w, where t^{-1/m} = ∏_i t_i^{-1/m} (GSWZ (218)). Then Ψ_A(t, q) = f_A(t, q)f_A(t, q^{-1}) in Z[ζ_m][[x]][[t^{1/m}]] for every m ≥ 1 (GSWZ Theorem 11, (221)); in particular the symmetrisation has coefficients in Z[ζ_m]. The proof compares the two families of (222), which satisfy the same q-difference system. The printed recursion (223) omits the factors q^µ and q^{−ν}: the coefficients are (−1)^A q^{A+µ}t^{1/m} and (−1)^A q^{−(A+ν)}t^{1/m} (source issue E48).

**Hypotheses and conventions.** A symmetric integral; m ≥ 1; the residue is at a single solution z(t) and summed over its m-th roots w. The t-deformed equations in the form t_iP_i(z) = 1 are (34) read with ∏_i z_i^{A_ij} (E36). Integrality means coefficients in Z[ζ_m], with no denominators.

**Proof route.**

1. Expand J_A at a root of unity and establish the displayed membership, by observing that each coefficient of a power of x is a sum of derivatives of geometric series in t.
2. Define Psi by the residue formula and compute its value at x = 0, which is a manifestly integral finite sum divided by the discriminant.
3. Prove that the two families Phi_{A,mu,nu} and Psi_{A,mu,nu}, indexed by two integer vectors, satisfy the same system of q-difference equations; for Psi this uses two identities for J_A which are proved by shifting the summation index.
4. Prove that the system determines its solution from the value at the origin, by the same coefficient-extraction argument used in HB.8.
5. Check that both families take the value 1 at t = 0; for Psi this uses that the residues of the higher powers of the denominators contribute at least one factor of t.
6. Conclude the identity, and read off the integrality of the symmetrisation.

**Direct inputs.** [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification).

**Acceptance.**

- At x = 0 the formula is the finite sum (220) divided by δ_A(t)m^N; for m = 1 it is 1/δ(t).
- PARI: f_A(t, q)f_A(t, q^{-1}) at q = ζ_m + x has no pole and integral coefficients for N = 1, A ∈ {−1, 1, 2, 3, 4}, m ≤ 6, to t^12 and x³.
- Summing over all three roots z for A = (3) gives −1/t at x = 0, not 1 + O(t): the residue must be taken at the single solution.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §4.1, (215)-(219), pp. 45-46 (arXiv v2; same in v1). The construction; z is the chosen (power-series) solution. [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 11, (221), p. 46. The theorem.


<a id="habironahmseries-hb-10-descendant-elements-of-the-habiro-ring"></a>

### Descendants give elements of the Habiro ring of a number field

**Theorem** · `HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring` · [packet](../packets/HabiroNahmSeries.json)

Specialise t = 1 and assume that the equations t_iP_i(z) = 1 at t = 1 define a reduced zero-dimensional scheme over Q. Fix a solution z, generating a number field K, and let R = O_K[1/Δ] with 6·disc(K) | Δ and z_j, δ ∈ R^×. Then Ψ_{A,µ,ν,z}(q) ∈ H_R for all µ, ν ∈ Z^N (GSWZ Theorem 12). The proof is Theorem 11 for the (µ, ν)-families of (222), which gives integrality at every order, combined with the gluing (24) at γ = 1 of HB.9/gluing-by-uniqueness-of-q-difference-solutions, which gives (13) at every p ∤ Δ, and the specialisation at z. GSWZ's Example 4.1 takes R = Z[z, 1/23] (Δ = 23), which needs the gluing at p = 2 and 3 as well; that is not proved (source issue E61).

**Hypotheses and conventions.** The scheme of t_iP_i(z) = 1 at t = 1 is reduced and zero-dimensional, so the residues are at simple poles and the specialisation at a single z is a ring map. δ and the z_j are units of R; otherwise the statement holds in H_{R[δ^{-1}]}. Some cases were first proved in Wagner's thesis, not read for this packet.

**Proof route.**

1. Apply Theorem 11 (HB.10/symmetrisation-and-residue-formula) to the (µ, ν)-families: Ψ_{A,µ,ν} = f_A(q^{mµ}t, q)f_A(q^{−mν}t, q^{-1}), with integral coefficients at every ζ_m.
2. Apply the γ = 1 case of HB.9/gluing-by-uniqueness-of-q-difference-solutions to obtain (13) at every p ∤ Δ.
3. Specialise at the chosen z (HB.9/specialisation-at-one) and read off membership in H_R (HabiroNumberFields:HB.6/the-gluing-condition).

**Direct inputs.** [HabiroNahmSeries:HB.10/symmetrisation-and-residue-formula](#habironahmseries-hb-10-symmetrisation-and-residue-formula), [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), [HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring](#habironahmseries-hb-9-symmetrisation-lies-in-the-ring), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), `HabiroNumberFields:HB.6/the-gluing-condition`, [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](#habironahmseries-hb-9-followup-descendant-pullback-contract), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract).

**Acceptance.**

- For the cubic field of discriminant -23 the theorem produces the explicit element computed in the next node.
- For a non-reduced specialisation the residue formula is not the symmetrisation and the conclusion is unavailable.
- The theorem produces elements of the Habiro ring of a number field, which are otherwise hard to write down: the source stresses that the polynomial ring over the ring of integers is not a subring of the Habiro ring of a number field.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.1, before Theorem 12. The setting and the deduction, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 12. The theorem, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.1, after Theorem 12. The attribution, verbatim; that thesis was not read for this packet.


<a id="habironahmseries-hb-10-cubic-example"></a>

### The rank-one worked example: A = (3) over the cubic field of discriminant −23

**Application** · `HabiroNahmSeries:HB.10/cubic-example` · [packet](../packets/HabiroNahmSeries.json)

For A = (3), J(t, w, q) = Σ_k (−1)^k q^{3k(k+1)/2} w^{3k} t^k/(qw; q)_k (GSWZ (227) = (215) for A = (3)). The residue formula of HB.10/symmetrisation-and-residue-formula at m = 1 and at the power-series solution z(t) of 1 − z = −tz³ gives Ψ_1(t, x) = (2z² + 3z − 9)/(27t − 4) + x²·[(−4374t³ − 2106t² + 3t)z² + (−2187t³ − 2997t² − 129t + 2)z + (2916t² + 1404t − 2)]/(27t − 4)⁴ + O(x³). GSWZ (229) prints every coefficient multiplied by t, dropping the factor t^{-1/m} of (218) (source issue E49). This equals f_A(t, q)f_A(t, q^{-1}) = Σ f^sym_k(t)x^k of GSWZ (248), with f^sym_0 = 1/δ(t) and f^sym_1 = 0. At t = 1, z³ − z + 1 = 0 generates the cubic field K of discriminant −23 (O_K = Z[z]), δ = −z² − z − 2 has norm −23, the Bloch class ξ = [z] ∈ B(K) is not torsion (Bloch–Wigner value ±0.9427073628 at the complex place, one third of vol(5_2)), and Ψ_1(x) = (2z² + 3z − 9)/23 + (−6477z² − 5311z + 4318)x²/23⁴ + O(x³) (GSWZ (231)). The element lies in H_{Z[z, 1/(6·23)]} by HB.10/descendant-elements-of-the-habiro-ring; GSWZ claim H_{Z[z, 1/23]}, and the gluing at p = 2, 3 is not proved (source issue E61).

**Hypotheses and conventions.** A = (3); at t = 1 the equation is 1 − z = −z³, i.e. z³ − z + 1 = 0. The residue is taken at the single solution z (the power-series branch z(t) = 1 + t + 3t² + 12t³ + … for Theorem 11; a fixed root at t = 1), summed over w with w^m = z. Excluded primes: 23 (disc and N(δ)); 2 and 3 are inverted by the theorems used (6 | Δ).

**Proof route.**

1. Expand J at q = 1 + x (GSWZ (228)) and take the residue of t^{-1}J(t, w, 1 + x)dw/w at w = z(t): the x⁰ term is (z − 1)/(tz(1 − 3tz²)) = z²/(1 − 3tz²) = 1/δ(t).
2. Record the corrected (229) and its agreement with (248).
3. Specialise t = 1 and simplify with z³ − z + 1 = 0 to obtain (231).
4. Check (231) against (249): the constant terms agree (1/δ = (2z² + 3z − 9)/23) and so do the x² coefficients ((−59z² − 51z + 36)/δ⁷).

**Direct inputs.** [HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring](#habironahmseries-hb-10-descendant-elements-of-the-habiro-ring), [HabiroNahmSeries:HB.10/symmetrisation-and-residue-formula](#habironahmseries-hb-10-symmetrisation-and-residue-formula), [HabiroNahmSeries:HB.8/acceptance-rank-one](#habironahmseries-hb-8-acceptance-rank-one), [HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field](#habironahmseries-hb-3-algebraicity-and-the-nahm-field), [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations).

**Acceptance.**

- (2z² + 3z − 9)·(−z² − z − 2) = 23 in Z[z]/(z³ − z + 1), so the constant term is 1/δ, in Z[z, 1/23] and not in O_K.
- Over Q(t)[z]/(tz³ − z + 1): (2z² + 3z − 9)·δ(t) = 27t − 4, while the printed (2tz² + 3tz − 9t)·δ(t) = t(27t − 4); the direct symmetrisation of F_3 matches (248) at x⁰, x¹, x², x³ to t^10 (PARI).
- The x-coefficient vanishes identically in t, and the x² coefficients of (231) and (249) agree (PARI).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Example 4.1. The worked example, verbatim, including the three-way comparison.


<a id="habironahmseries-hb-10-nonabelian-quartic-example"></a>

### The genuine nonabelian example: a 60-torsion Bloch class over a quartic field

**Application** · `HabiroNahmSeries:HB.10/nonabelian-quartic-example` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.10/quartic-module-export](#habironahmseries-hb-10-quartic-module-export). Its hypotheses and limitations govern this target and the API names below.

The matrix ((8,5),(5,4)) has a selected D₄ quartic orbit and a separate S₄ orbit. The exact coordinates, nondegeneracy, integral basis, discriminants and unit norms of the D₄ orbit are certified by the three quartic nodes below. GSWZ reports numerical regulator vanishing and 60-torsion; the integral 60-torsion relation and a specified K₃ lift require an exact certificate. Thus no unconditional sixtieth-power membership is asserted. The excluded primes also include those of the as-yet uncomputed tame kernel. The positive-dimensional and topological exports retain their own owners.

**Proof route.**

1. Use quartic-coordinate-certificate and quartic-integral-basis to certify units, discriminant and the exact field presentation.
2. Use the CGZ excluded-integer definition and request the tame-kernel computation to turn the symbolic ledger into a certified finite prime list.
3. Import the general GSWZ module-membership theorem with the explicit S, xi and root-order restriction, conditional on its recorded local-section and arbitrary-rank proof obligations.
4. Retain the first two source coefficients with their normalization; the exponential and inverse square root are not discarded from the type.
5. Keep the 60-torsion assertion separate: apply the five-term certificate soundness interface only once an exact certificate and the K3 torsion obstruction are supplied.

**Direct inputs.** [HabiroNahmSeries:HB.3/distinguished-solution](#habironahmseries-hb-3-distinguished-solution), [HabiroNahmSeries:HB.3/bloch-class-of-a-solution](#habironahmseries-hb-3-bloch-class-of-a-solution), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.9/torsion-powers-lie-in-the-ring](#habironahmseries-hb-9-torsion-powers-lie-in-the-ring), [HabiroNahmSeries:HB.9/descendants-by-specialisation](#habironahmseries-hb-9-descendants-by-specialisation), [HabiroNahmSeries:HB.5/nahm-conjecture-statement](#habironahmseries-hb-5-nahm-conjecture-statement), `K3BlochGroups:V.6/bloch-element-constructor`.

**Acceptance.**

- The exact quartic nodes certify the separated orbits, integral basis, field discriminant −475, polynomial discriminant −11875 and norm N(δ)=5²·19².
- The source numerical test reports Bloch–Wigner regulator vanishing to 10⁻⁷⁵ and the CGZ Rogers value π²/15 at the real places. Numerical agreement is not an exact torsion or regulator certificate.
- The source denominator experiment through order 27 improves after the sixtieth power. Global membership still requires exact integral 60-torsion, a specified K₃ lift, the tame-kernel exclusions and the HB.9 gluing inputs.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.3. The example with its status, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.3, the denominators. The numerical evidence, verbatim; note that the discriminant is printed as -5^2 . 19 earlier in the same section and as -5^4 . 19 here, a discrepancy recorded in the gaps. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.3, the second orbit. The non-example, verbatim.


<a id="habironahmseries-hb-10-knot-matrices-and-the-topological-boundary"></a>

### The knot matrices, and the boundary between a formal series and a topological invariant

**Application** · `HabiroNahmSeries:HB.10/knot-matrices-and-the-topological-boundary` · [packet](../packets/HabiroNahmSeries.json)

Record the three knot-derived matrices of GSWZ Remark 4.2 as formal Nahm data. Their identification with knot perturbative series is a QT.6 consumer theorem. A_{4_1} = (1 1; 1 1): the Nahm equations force z_1 = z_2 = z with z² − z + 1 = 0, so z = ζ_6, K = Q(√−3), δ = (2 − z)/z = −√−3 and ξ = 2[ζ_6], with Bloch–Wigner value approximately 2.0298832128; its comparison with vol(4_1) belongs to QT.5. A_{5_2} = (2 1 1; 1 1 0; 1 0 1): the solution field is the cubic field of discriminant −23 (with u = 1 − z_1, u³ − u² + 2u − 1 = 0). A_{(−2,3,7)} = (1 0 1; 0 1 2; 1 2 4): the solution scheme has a component over the same cubic field (v³ − v + 1 = 0) and one over Q(2cos(2π/7)) (v³ − 2v² − v + 1 = 0, discriminant 49). From an ideal triangulation with Neumann–Zagier matrices (A|B) and B^{-1}A integral, A_Nahm = I − B^{-1}A. For these data the theorems of this roadmap give membership of an explicit series in an explicit Habiro module. They do NOT give that the series is a topological invariant, that it is independent of the triangulation, that it computes a Chern–Simons quantity, or that the knot invariant is quantum modular. QT.5 supplies the underlying ideal triangulations and gluing equations and owns manifold volume. QT.6 owns the full Neumann-Zagier datum, the knot-series comparison and its independence of the triangulation and auxiliary choices, including the state-integral identification; QT.7 owns quantum modularity. QT.6 and QT.7 consume this roadmap and are not prerequisites of HB.10.

**Hypotheses and conventions.** The three matrices are those recorded by the source; the general recipe requires the integrality of B inverse times A, which may fail for a given triangulation. HB.3 supplies a chosen non-degenerate solution of the formal Nahm equations. Relating it to a gluing-equation solution and identifying the resulting series with the topological series are QT.6 obligations; the matrix recipe here does not prove them. The boundary statement is the one the layer's own text insists on and is recorded as a node so that no later work can elide it.

**Proof route.**

1. Record the three matrices and check that each is symmetric and integral.
2. Record the recipe from a Neumann-Zagier datum, with its integrality condition.
3. Apply the membership theorem to obtain the module statement for each of the three.
4. Keep the four additional assertions with their owners: QT.6 proves knot-series identification and invariance under changes of triangulation and auxiliary choices, and handles the state-integral/Chern-Simons comparison with its own hypotheses; QT.7 proves any quantum-modularity statement.
5. Record that ArithmeticQuantumTopology is the consumer of these series and must prove those statements itself.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), `ArithmeticQuantumTopology:QT.5`, [HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction](#habironahmseries-hb-3-signed-exterior-boundary-obstruction).

**Acceptance.**

- The figure-eight matrix is not positive definite, so it is a formal and not an analytic datum; the corresponding solution comes from the geometry and not from the cube.
- The integrality condition on the Neumann-Zagier datum can fail, in which case the recipe gives nothing and a different quad type must be chosen.
- Membership in a Habiro module is compatible with the series being a topological invariant and does not prove it; the two statements have different content.
- The singular figure-eight matrix has the nonzero kernel vector (1,-1). HB.4/radial-asymptotic-expansion cannot be applied to it; HB.8 formal Gaussian data use the non-degenerate Hessian at the chosen solution instead.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Remark 4.2, equation (3knots). The three matrices and the general recipe, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 1.8, the relation with perturbative Chern-Simons theory. The source itself separates the theorem from the physical interpretation; this node keeps that separation.


<a id="habironahmseries-hb-10-p-adic-computations-example"></a>

### The p-adic computations and the Frobenius by Hensel lifting

**Application** · `HabiroNahmSeries:HB.10/p-adic-computations-example` · [packet](../packets/HabiroNahmSeries.json)

The p-adic side of the examples is computed by Hensel lifting: if xi generates K with minimal polynomial P and p is unramified, then lifting the factorisation of P modulo p lifts the Frobenius of the residue field to an automorphism of the p-completion of R, and the lifting is constructive. The source uses this to compute the Frobenius endomorphism explicitly and to check the gluing conditions numerically, and gives a worked example illustrating the isomorphism between the p-adic K-theory of a local field and p^2 times its ring of integers.

**Hypotheses and conventions.** p is unramified in K and greater than 3; R is O_K[1/Delta]. The Hensel lifting is the standard constructive one, by induction on the p-adic precision. The worked example is Example 4.3 of the source, which illustrates Theorem 9.

**Proof route.**

1. Record the Hensel lifting argument and its constructive form.
2. Record the computation of the Frobenius as the lift of the p-power map.
3. Record the worked example and what it checks, namely the isomorphism given by the p-adic dilogarithm and the generation of the K-group by the classes of roots of unity.
4. Record that these computations are numerical verifications and not proofs of the theorems; the source says every result of the paper has been numerically verified.

**Direct inputs.** [HabiroNahmSeries:HB.9/p-adic-regulator-input](#habironahmseries-hb-9-p-adic-regulator-input), [HabiroNahmSeries:HB.10/cubic-example](#habironahmseries-hb-10-cubic-example), `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, `PadicHodgeRegulators:D.3`.

**Acceptance.**

- For K the cubic field of discriminant -23 and a small unramified p, the Frobenius is computed by lifting the factorisation of z^3 - z + 1.
- The verification is of the gluing condition at a specific p and m, not of the theorem.
- A numerical verification at finitely many primes is not a proof; this node records the distinction.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.4. The method, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.5, opening. The status of the computations, verbatim.


<a id="habironahmseries-hb-10-modularity-examples-and-their-lesson"></a>

### Modular examples: a quadratic Gauss sum and the symmetrised Rogers-Ramanujan function

**Application** · `HabiroNahmSeries:HB.10/modularity-examples-and-their-lesson` · [packet](../packets/HabiroNahmSeries.json)

Two examples show what modularity contributes. The quadratic Gauss sum gives the collection F_m = (sum over k modulo m of zeta_m^{k^2})(sum over k of zeta_m^{-k^2})/m, which equals 1 for m congruent to 1 or 3 modulo 4, 0 for m congruent to 2 and 2 for m divisible by 4, and is an almost trivial element of the Habiro ring with 2 inverted; the variant with a fourth root of unity gives a slightly less trivial element over the ring with i and 1/2. The Rogers-Ramanujan example is genuinely arithmetic: the function J(z,q), a one-variable deformation, has the property that its expansion at zeta_m lies in an explicit localisation, and the residues over the m-th roots of the golden-ratio unit give constants F_m(u) in the field generated by the square root of 5 and the m-th roots of unity, whose first values the source lists.

**Hypotheses and conventions.** The examples are those of GSWZ Section 4.7; the Rogers-Ramanujan field is the real quadratic field of the golden ratio, whose Galois group over the rationals is abelian. Both examples produce elements of Habiro rings of small fields, which are the easiest non-trivial instances of the whole theory. The lesson recorded is that modularity produces special elements associated to torsion classes in the third K-group, and that an abelian field is the easy case.

**Proof route.**

1. Compute the Gauss sum collection and check the four cases modulo 4.
2. Record the variant with the fourth root of unity and the ring it lives over.
3. Record the deformation J(z,q) of the Rogers-Ramanujan function and the localisation in which its expansion lies.
4. Compute the residues over the m-th roots of the golden-ratio unit and record the first values, which are constants in the field generated by the square root of 5.
5. Record the lesson: these are the abelian examples, and the quartic example of the previous node is the point of the theory, being genuinely nonabelian.

**Direct inputs.** [HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring](#habironahmseries-hb-10-descendant-elements-of-the-habiro-ring), [HabiroNahmSeries:HB.10/nonabelian-quartic-example](#habironahmseries-hb-10-nonabelian-quartic-example), `HabiroNumberFields:HB.6/the-gluing-condition`, `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`.

**Acceptance.**

- The Gauss sum element is almost trivial, taking only the values 0, 1 and 2.
- The Rogers-Ramanujan constants F_1 and F_2 are minus one half minus or plus the square root of 5 over 10.
- These examples cannot replace the nonabelian one: the layer text asks for a genuine nonabelian number-field example, and the abelian cases do not exhibit the phenomena that the Frobenius gluing is designed for.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §4.7, Example 4.4, (289)-(290), p. 57 (arXiv v2; same in v1). The first example; (289) prints '2 if m ≡ 4 (mod 4)' for m ≡ 0 (mod 4), and (290)'s value there is −2, not 2 (source issue E53). [gswz](https://arxiv.org/pdf/2412.04241v2): §4.7, Example 4.5, (291)-(295), pp. 57-58. The second example; F_1 = −1/2 − √5/10 for ξ = (−1 − √5)/2, and the conjugate for the other root. [gswz](https://arxiv.org/pdf/2412.04241v2): §4.7, opening, p. 57. The lesson.


<a id="habironahmseries-hb-10-export-interfaces-and-non-consequences"></a>

### What this roadmap exports, and what does not follow from it

**Application** · `HabiroNahmSeries:HB.10/export-interfaces-and-non-consequences` · [packet](../packets/HabiroNahmSeries.json)

**Controlling refinement:** [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](#habironahmseries-hb-10-etale-nahm-cohomology-export). Its hypotheses and limitations govern this target and the API names below.

Export actual coefficient rings, compatible Taylor families and the admitted restricted/global membership statements to their owners. In relative dimension zero the exact cohomology export is η_R=H⁰(d_R)⁻¹∘κ_R⁻¹, using HR.5–HR.6 and HQ.5. Higher classes require a supplied family, form, convergence and Frobenius data, and the HQ.6 naive-to-algebraic comparison requested below. QT.6 consumes the HB.4/HB.8 analytic/formal outputs under their respective hypotheses; it owns knot identification, state-integral comparisons and invariance. None of these exports is a premise for the general Nahm construction.

**Proof route.**

1. Import the number-field ring comparison and the étale degree-zero identification; do not reconstruct either owner theory.
2. Compose the two supplier isomorphisms in the displayed order. Apply the result to the supplied element s.
3. Their naturality and uniqueness of étale lifts identify every completion and quotient map; the equalizer Taylor projections identify the re-expansion/Frobenius arrows.
4. At q=1 the target is R[[q-1]], via completion. No equality with a higher-dimensional cohomology theory follows from this ring map.

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/descendants-by-specialisation](#habironahmseries-hb-9-descendants-by-specialisation), [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](#habironahmseries-hb-9-frobenius-on-the-coefficient-ring), [HabiroNahmSeries:HB.9/specialisation-at-one](#habironahmseries-hb-9-specialisation-at-one), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), [HabiroNahmSeries:HB.4/euler-maclaurin-with-remainder](#habironahmseries-hb-4-euler-maclaurin-with-remainder), [HabiroNahmSeries:HB.4/formal-gaussian-integration](#habironahmseries-hb-4-formal-gaussian-integration), [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](#habironahmseries-hb-4-radial-asymptotic-expansion), [HabiroNahmSeries:HB.8/fgi-collection](#habironahmseries-hb-8-fgi-collection), [HabiroNahmSeries:HB.8/identification-theorem](#habironahmseries-hb-8-identification-theorem).

**Acceptance.**

- The coefficient ring S is exported and is used by the relative Habiro ring of HabiroRings HR.5.
- The Frobenius congruence is exported as the arithmetic gluing statement that the modules of HB.7 are defined by.
- A statement of the form the Nahm series gives a class in q-de Rham cohomology is not a consequence of anything in this packet.
- A QT.6 application names the exact HB.4 or HB.8 input and verifies its hypotheses; no QT.6 or QT.7 theorem is required to construct the exported formal data.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.9, second bullet (Relative Bloch group), p. 17. The comparison with a relative Habiro ring is future work; recorded as a gap. [gswz](https://arxiv.org/pdf/2412.04241v2): §1.9, fourth bullet (Line bundles on Ainf), p. 17. A_inf statements are not consequences of this packet.


<a id="habironahmseries-hb-10-knot-series-pair-example"></a>

### The pair of the knot 5_2 and the (-2,3,7)-pretzel knot over the cubic field of discriminant minus twenty-three

**Application** · `HabiroNahmSeries:HB.10/knot-series-pair-example` · [packet](../packets/HabiroNahmSeries.json)

The knots 5_2 and (−2,3,7) have common trace field K = Q(α), α³ − α² + 1 = 0, of discriminant −23 (their Nahm schemes: 5_2 reduces to u³ − u² + 2u − 1 = 0, u = 1 − z_1, with u ∈ K; (−2,3,7) has the components v³ − v + 1 = 0 over K and v³ − 2v² − v + 1 = 0 over Q(2cos(2π/7))). They are scissors congruent, so their Bloch classes agree modulo 6-torsion. Their series at m = 1 are computed by formal Gaussian integration of one-dimensional state integrals (400 coefficients). The product f^{(5_2)}_1(x)·f^{(−2,3,7)}_1(−x/(1+x)) has denominators only at 2 and 23 (x^400: 2^1997·23^581). Its constant term is the product of the inverse square roots of the two δ-invariants, c = 1/√(−6α² + 10α − 4)·1/√(−24α² + 32α − 26). Since −24α² + 32α − 26 = −2(2α² − 2α + 3)², c = ±1/(√(−2)·(2α² − 2α + 3)·√(−6α² + 10α − 4)). GSWZ (280)'s further equality c = 1/(√2·(2α² − 2α + 3)) is false (source issue E52). By GSWZ Proposition 1.5(b) (HabiroNumberFields:HB.7/involution-pairing) the two series are H_R-proportional after the scalar extension adjoining both square roots, although no simpler relation was found. The coefficients of the 5_2 series lie in K, while those of the (−2,3,7) series as GSWZ compute it also involve Q(2cos(2π/7)).

**Hypotheses and conventions.** The trace field is the cubic field of discriminant -23; alpha satisfies alpha^3 - alpha^2 + 1 = 0. The 5_2 Gaussian integral is the displayed one-dimensional integral with delta = 3 alpha - 2, and the first coefficients are the ones the source lists. The computations are numerical or exact-arithmetic verifications, not proofs; the source says every result of the paper has been numerically verified.

**Proof route.**

1. Record the two knots, their common trace field and their scissors congruence, and the consequence for their Bloch classes modulo 6-torsion.
2. Record the three computational routes and the reduction of the state integrals to one dimension.
3. Record the product series with its denominators and its constant term, which is the strongest integrality observation in the source.
4. Record the difference between the two series through the etale algebras their coefficients generate.
5. Record the explicit Gaussian integral for 5_2 and the first coefficients, so that an implementation can be checked against them.

**Direct inputs.** [HabiroNahmSeries:HB.10/knot-matrices-and-the-topological-boundary](#habironahmseries-hb-10-knot-matrices-and-the-topological-boundary), [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.10/cubic-example](#habironahmseries-hb-10-cubic-example), [HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring](#habironahmseries-hb-9-symmetrisation-lies-in-the-ring), `HabiroNumberFields:HB.7/involution-pairing`.

**Acceptance.**

- The x^400 denominator 2^1997·23^581 of the product is the source's integrality test.
- PARI: −24α² + 32α − 26 = −2(2α² − 2α + 3)²; at α = −0.754877666 the middle expression of (280) is −0.0323520 and the right side 0.1251641, so the printed equality fails.
- From the coefficients of (282) (δ = 3α − 2), 2a_2 − a_1² = (465α² − 465α + 54)/23³, the x² coefficient of (283) (PARI).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.6. The setting, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.6, the product and its denominators. The computation, verbatim. [gswz](https://arxiv.org/pdf/2412.04241v2): Section 4.6, the difference between the two series. The non-example, verbatim. [gz](https://arxiv.org/pdf/1812.07690v1): Section 5, equations (eq.NZ), (eq.ABchi), (eq.NZ2nahm). The dictionary from a Neumann-Zagier datum to a Nahm datum, verbatim, which is how a knot produces the matrices of the previous node.


<a id="habironahmseries-hb-10-rank-one-product-identities"></a>

### Rank-one product identities as a check of the conventions

**Lemma** · `HabiroNahmSeries:HB.10/rank-one-product-identities` · [packet](../packets/HabiroNahmSeries.json)

For N = 1 and GSWZ's normalisation (31), F_A(t, q) = Σ_n (−1)^{An}q^{(An² + An)/2}t^n/(q; q)_n, the following hold. (i) A = 0: F_0(t, q) = (t; q)_∞^{-1} (Euler; printed in GSWZ §1.6); its DT exponents are c_{1,0} = −1 and all others 0. (ii) A = 1: F_1(t, q) = (qt; q)_∞ (Euler); c_{1,1} = 1 and all others 0. (iii) Both satisfy the q-difference equation (33), F(t) − F(qt) = (−1)^A t q^A F(q^A t). (iv) A = 3: z(t) = ∏_{n≥1}(1 − t^n)^{−n Σ_i c_{n,i}} (GSWZ (244)), where z(t) solves 1 − z = −tz³ and the c_{n,i} are the DT exponents of F_3; with GSWZ (236), Σ_i c_{n,i} = 1, 1, 3, 10, 40, 171 for n = 1, …, 6. A sign or exponent error in (31) or (33) breaks (i)-(iii); an error in the product expansion (28) breaks (iv).

**Hypotheses and conventions.** N = 1; A ∈ {0, 1} for (i)-(iii) and A = 3 for (iv). (iv) uses the exponents of GSWZ (236), which HB.8/acceptance-rank-one records, and the product expansion of HB.8/product-expansion-and-dt-exponents.

**Proof route.**

1. (i), (ii): Euler's identities, or the q-difference equation (33) with F(0, q) = 1 and its uniqueness (HB.8/series-F-A).
2. (iii): substitute into (33).
3. (iv): GSWZ (64): the limit q → 1 of F(qt, q)/F(t, q) is z(t), and the product expansion (28) gives the exponents.

**Direct inputs.** [HabiroNahmSeries:HB.8/series-F-A](#habironahmseries-hb-8-series-f-a), [HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents](#habironahmseries-hb-8-product-expansion-and-dt-exponents), [HabiroNahmSeries:HB.8/acceptance-rank-one](#habironahmseries-hb-8-acceptance-rank-one), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations).

**Acceptance.**

- PARI: F_0 = (t; q)_∞^{-1} and F_1 = (qt; q)_∞ to t^8 and q^25; (33) holds for A = 0, …, 4 to t^8.
- PARI: ∏_{n ≤ 6}(1 − t^n)^{−n s_n} with s = (1, 1, 3, 10, 40, 171) equals 1 + t + 3t² + 12t³ + 55t⁴ + 273t⁵ + 1428t⁶ + O(t⁷), the solution of 1 − z = −tz³ (GSWZ (239)).
- With q^{An²/2} in place of q^{(An² + An)/2}, F_1 is no longer (qt; q)_∞, so this test catches the most likely normalisation error.

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.6, after (28), p. 12 (arXiv v2). Identity (i). [gswz](https://arxiv.org/pdf/2412.04241v2): §4.2, (244), p. 49. Identity (iv).


<a id="habironahmseries-hb-10-figure-eight-example"></a>

### The abelian worked example: the figure-eight datum over Q(√−3)

**Application** · `HabiroNahmSeries:HB.10/figure-eight-example` · [packet](../packets/HabiroNahmSeries.json)

For A_{4_1} = (1 1; 1 1), which is formal and not positive definite, the Nahm equations 1 − z_1 = −z_1z_2, 1 − z_2 = −z_1z_2 force z_1 = z_2 = z with z² − z + 1 = 0. So z = ζ_6, K = Q(√−3) of discriminant −3, δ = (2 − z)/z = −√−3 ≠ 0 (non-degenerate, N(δ) = 3), and ξ = 2[ζ_6] ∈ B(K), non-torsion (Bloch–Wigner value 2.0298832128 = vol(4_1)). With Δ divisible by 6 and by the primes of CGZ's M_K, and R = Z[ζ_6, 1/Δ], Theorem 5 gives f_{A,z} ∈ H_{R[δ^{-1/2}],ξ}|Δ. At m = 1, f_{A,z,1} = Φ(h) = (−3)^{−1/4}(1 + 11h/(72√−3) + 697h²/(1152(3√−3)²) + …) (GSWZ (1), §4.5, h = log(1 + x)). The symmetrisation is (−3)^{−1/2}(1 − (q − 1)²/27 + …) (GSWZ (2)), in H_{R[δ^{-1}]} = H_R. GSWZ (278): ⁴√−3·f̂(x)(1 + x)^{−1/24}(ζ_6²; 1 + x)³_∞(1 − ζ_6)^{−3/2} = 1 + (5ζ_6 − 7)x/3 + … is integral away from 3. K is abelian, so footnote 1 (with φ_m^{-1}, HabiroNumberFields/E20) and the Pochhammer generator ∏_j(q^{1/2}ζ^j; q)_∞^{n_j} of §1.5 apply.

**Hypotheses and conventions.** A = (1 1; 1 1); z = (ζ_6, ζ_6); 6 | Δ, and Δ contains the primes of CGZ's M_K for K = Q(√−3) (for the symmetrisation Δ = 6 suffices). The identification of f_{A,z} with the asymptotic series of the Kashaev invariant is GSWZ §4.5's statement ('with Φ^{4_1}_1(h) = f^{4_1}_1(x)'); its topological meaning is ArithmeticQuantumTopology's. Numerical statements (the 600 computed coefficients, integrality away from 3) are the source's checks, not proofs.

**Proof route.**

1. Solve the Nahm equations and compute δ from (36).
2. Compute ξ and its Bloch–Wigner value (HB.3/embeddings-and-regulator-evaluations).
3. Apply HB.9/module-membership and HB.9/symmetrisation-lies-in-the-ring.
4. Record the first coefficients (1), (2) and the comparison (278).

**Direct inputs.** [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring](#habironahmseries-hb-9-symmetrisation-lies-in-the-ring), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.10/knot-matrices-and-the-topological-boundary](#habironahmseries-hb-10-knot-matrices-and-the-topological-boundary), `HabiroNumberFields:HB.6/abelian-fields`.

**Acceptance.**

- From (1): 2a_2 − a_1² = −1/27, the (q − 1)² coefficient of √−3·Φ(h)Φ(−h) in (2) (PARI).
- The constant term (−3)^{−1/4} lies in R[δ^{-1/2}] and not in R: Corollary 1.10 as printed fails here (E44).
- 2D(ζ_6) = 2.029883212819307… = vol(4_1) (PARI).

**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): §1.5, after Theorem 2, p. 11. The Bloch class. [gswz](https://arxiv.org/pdf/2412.04241v2): §4.5, (276)-(278), pp. 54-55. The worked abelian example.


### HB.10 finer contracts

These 14 contracts refine the preceding targets. Their supplier obligations remain explicit in the coverage ledger below.

<a id="habironahmseries-hb-10-rational-gauss-taylor"></a>

### The rational quadratic-Gauss Taylor family

**Definition** · `HabiroNahmSeries:HB.10/rational-gauss-taylor` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For a positive integer m, define rationalGaussTaylor(m) in Z[[x]] to be the constant power series C(a_m), where a_m = 2 if 4 divides m, a_m = 0 if m is even but 4 does not divide m, and a_m = 1 if m is odd. Its coefficientwise image in R[[x]], for R = Z[1/2], is the rational collection of GSWZ Example 4.4. For every primitive m-th root zeta in C, a_m equals m^-1 times (sum_{k=0}^{m-1} zeta^(k^2)) times (sum_{k=0}^{m-1} zeta^(-k^2)); the family is independent of the choice of primitive root.

**Hypotheses and conventions.** m is a positive integer. The Taylor variable is x=q-zeta_m. The construction is a constant series at each root, not a single polynomial in q or a Nahm datum over Q.

**Proof route.**

1. Use PowerSeries.C and the three divisibility cases.
2. Evaluate the product of the two quadratic sums: orthogonality reduces it to the gcd(m,2) cases, with cancellation in the even-but-not-four-divisible case.
3. Transport coefficients by PowerSeries.map. Membership and the obstruction at 2 are proved in rational-gauss-gluing, not baked into this definition.

**Direct inputs.** `mathlib:PowerSeries.C`, `mathlib:PowerSeries.coeff_C`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`, `mathlib:IsPrimitiveRoot`, [HabiroNahmSeries:HB.10/modularity-examples-and-their-lesson](#habironahmseries-hb-10-modularity-examples-and-their-lesson).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `rationalGaussTaylor_eq` | characterisation | The series is C(2), C(0) or C(1) in the three divisibility cases stated in the definition. |
| `rationalGaussTaylor_coeff_zero` | simp | Its constant coefficient is the integer a_m. |
| `rationalGaussTaylor_coeff_succ` | simp | Every coefficient of degree n+1 is zero. |
| `rationalGaussTaylor_map` | compatibility | For every commutative ring R, PowerSeries.map(Int.castRingHom R) sends the family to C((a_m)_R). |
| `rationalGaussTaylor_gauss_product` | compatibility | Under Z to C, the family equals the constant series of the normalised product of the quadratic sums for every primitive m-th root. |

**Discriminating tests.**

- **`rationalGaussTaylor_one`** (computation): rationalGaussTaylor(1)=C(1).
- **`rationalGaussTaylor_two`** (computation): rationalGaussTaylor(2)=C(0), so the even case is not uniformly 2.
- **`rationalGaussTaylor_four`** (computation): rationalGaussTaylor(4)=C(2), so it is not the parity indicator.
- **`rationalGaussTaylor_positive_degree`** (degenerate): The degree-one coefficient at m=4 is zero; m=0 is outside the declared domain.
- **`rationalGaussTaylor_complex_four`** (compatibility): For zeta=i, the two sums are 2+2i and 2-2i and their product divided by 4 is 2.

**Acceptance.**

- The values at m=1,2,4 are 1,0,2.
- All positive-degree coefficients vanish.
- The complex quadratic-sum formula agrees for every primitive root, not just the usual exp(2 pi i/m).

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.7, Example 4.4, (289), printed p. 57. Specialise the rational example, with the parent correction m congruent to 0 modulo 4.


<a id="habironahmseries-hb-10-rational-gauss-gluing"></a>

### Odd-prime gluing and the obstruction at 2

**Theorem** · `HabiroNahmSeries:HB.10/rational-gauss-gluing` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For every odd prime p and positive integer m, rationalGaussTaylor(pm)=rationalGaussTaylor(m). Consequently its image in the coefficient ring Z[1/2] satisfies every GSWZ gluing equation and is an element of H_{Z[1/2]}. The same family does not lie in H_Z: the p=2,m=1 equation would assert 1=0 in Z_2[[x]].

**Hypotheses and conventions.** Primitivity and compatibility of the roots are those of GSWZ (7). Frobenius on Z_p is the identity. Re-expansion of a constant series is itself.

**Proof route.**

1. Multiplication by an odd integer preserves the 2-adic valuation of m, hence the three cases defining a_m.
2. For p odd the GSWZ gluing (13) is exactly equality of these constants. For p=2 the completion of Z[1/2] is zero.
3. Over Z, use a_1=1 and a_2=0 to exhibit the failed equation.

**Direct inputs.** [HabiroNahmSeries:HB.10/rational-gauss-taylor](#habironahmseries-hb-10-rational-gauss-taylor), `HabiroNumberFields:HB.6/the-gluing-condition`.

**Acceptance.**

- Test p=3,m=2 and p=3,m=4: values stay 0 and 2.
- The m=1-to-2 edge is an actual non-example over Z.
- No class in H_Z is inferred from the integrality of each individual component.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.7, Example 4.4, (289), p. 57. The finite-case argument supplies the missing exact local certificate and shows why 2 is inverted.


<a id="habironahmseries-hb-10-quartic-coordinate-vector"></a>

### The selected quartic Nahm solution vector

**Definition** · `HabiroNahmSeries:HB.10/quartic-coordinate-vector` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For a characteristic-zero field K and u satisfying u^4+u^3+3u^2-3u-1=0, define quarticCoordinates(u) in K^2 by z_0=u and z_1=(-9u^3-6u^2-25u+37)/5. This is the orbit (257) of GSWZ, not the different orbit (258). The polynomial-root hypothesis is an explicit input; the distinguished real embedding is supplied by the parent nonabelian-quartic-example.

**Hypotheses and conventions.** K is a characteristic-zero field. u is a specified root of the displayed quartic; the polynomial is not silently changed to the S4-orbit polynomial.

**Proof route.**

1. Define the two coordinates by the displayed expressions. Characteristic zero makes 5 invertible.
2. Functoriality follows because field maps preserve rational constants and inverses.
3. Projection to the first coordinate recovers u, giving extensionality. Correctness as a Nahm solution and non-degeneracy are quartic-coordinate-certificate.

**Direct inputs.** [HabiroNahmSeries:HB.10/nonabelian-quartic-example](#habironahmseries-hb-10-nonabelian-quartic-example).

**Planning API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `quarticCoordinates_zero` | projection | The first coordinate is u. |
| `quarticCoordinates_one` | projection | The second coordinate is (-9u^3-6u^2-25u+37)/5. |
| `quarticCoordinates_ext` | extensionality | For two admitted roots u and u-prime, their coordinate vectors agree if and only if u=u-prime. |
| `quarticCoordinates_map` | functoriality | For any field homomorphism K to L, mapping the two coordinates equals the vector of the image root; this agrees with the ordinary pointwise map K^2 to L^2. |

**Discriminating tests.**

- **`quarticCoordinates_first_equation`** (characterisation): For every admitted root, 1-z_0=z_0^8 z_1^5.
- **`quarticCoordinates_second_equation`** (characterisation): For every admitted root, 1-z_1=z_0^5 z_1^4.
- **`quarticCoordinates_missing_five`** (non-example): The second coordinate is not -9u^3-6u^2-25u+37. The latter is five times the nonzero coordinate.
- **`quarticCoordinates_zero_not_root`** (degenerate): u=0 over Q fails the root hypothesis because the quartic evaluates to -1.

**Acceptance.**

- The first coordinate recovers the selected primitive element.
- A formula omitting the denominator 5 fails the second-coordinate test.
- A non-root cannot be used to assert the Nahm equations.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.3, (256)–(258), printed p. 51. Take the coordinate formula of (257) literally; do not combine the two orbits.


<a id="habironahmseries-hb-10-quartic-coordinate-certificate"></a>

### An exact certificate for the quartic Nahm equations and Hessian

**Theorem** · `HabiroNahmSeries:HB.10/quartic-coordinate-certificate` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For z=quarticCoordinates(u), set v=z_1 and d=(753-505u-124u^2-186u^3)/5. Both Nahm equations 1-u=u^8v^5 and 1-v=u^5v^4 hold. The four elements u,v,1-u,1-v are nonzero, and d is nonzero with inverse (18+45u-44u^2+9u^3)/475. Moreover (1-u)(1-v)((8+u/(1-u))(4+v/(1-v))-25)=d u^8v^4. Thus d is precisely delta for A=((8,5),(5,4)) under GSWZ (36), not the bare determinant of A.

**Hypotheses and conventions.** K,u are as in quartic-coordinate-vector. The equality is for the GSWZ discriminant, including the factor u^-8 v^-4.

**Proof route.**

1. Reduce the two Nahm-equation numerators modulo u^4+u^3+3u^2-3u-1.
2. The quartic excludes u=0 and u=1; the equations then exclude v=0 and v=1.
3. Multiply d by the displayed inverse and reduce modulo the quartic to obtain 1.
4. Expand the 2 by 2 determinant using Matrix.det_fin_two, multiply by (1-u)(1-v), and reduce the numerator modulo the quartic.

**Direct inputs.** [HabiroNahmSeries:HB.10/quartic-coordinate-vector](#habironahmseries-hb-10-quartic-coordinate-vector), `mathlib:Matrix.det_fin_two`.

**Acceptance.**

- The discriminant inverse identity can be verified over the polynomial quotient before choosing an embedding.
- det A=7 is not d.
- There is no appeal to decimal recognition to establish either Nahm equation.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.3, (256), (257) and (261)–(262), pp. 51–52. The exact polynomial-reduction identities certify the hypotheses of the parent membership application.


<a id="habironahmseries-hb-10-quartic-integral-basis"></a>

### An integral basis for the selected quartic field

**Theorem** · `HabiroNahmSeries:HB.10/quartic-integral-basis` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For F=Q(u) from the parent nonabelian-quartic-example, put e=(u^3-u^2+2)/5. Then (1,u,u^2,e) is an integral basis of O_F. It has trace Gram matrix ((4,-1,-5,6),(-1,-5,17,-4),(-5,17,-1,-15),(6,-4,-15,14)), determinant -475. Thus [O_F:Z[u]]=5 and the quartic polynomial discriminant -11875 is not the field discriminant. The element e satisfies e^2-3e+1=0, and v=-9e-3u^2-5u+11 is integral. The norms of u,v,1-u,1-v are -1,1,1,-1 and the norm of delta is 9025=5^2*19^2.

**Hypotheses and conventions.** F has the presentation, degree four and field discriminant -475 supplied by the parent example. The coordinates and delta are those of quartic-coordinate-certificate.

**Proof route.**

1. Reduce e^2-3e+1 modulo the quartic. The vectors 1,u,u^2,e are independent because the change from the power basis has determinant 1/5.
2. Compute all products in this lattice: u^3=-2+u^2+5e; ue=1+u-u^2-2e; u^4=3+3u-4u^2-5e; u^2e=-u+2u^2-e; e^2=-1+3e. Hence it is an integral order.
3. Use field traces from the multiplication matrices to obtain the displayed Gram matrix. Compare its discriminant with the field discriminant using an existing integral basis and Algebra.discr_of_matrix_vecMul. The integral transition determinant has square 1, so is a unit, and the order is O_F.
4. Evaluate norms by determinants of multiplication. The powers-basis discriminant differs by the index square 25.

**Direct inputs.** [HabiroNahmSeries:HB.10/quartic-coordinate-certificate](#habironahmseries-hb-10-quartic-coordinate-certificate), [HabiroNahmSeries:HB.10/nonabelian-quartic-example](#habironahmseries-hb-10-nonabelian-quartic-example), `mathlib:Algebra.discr_of_matrix_vecMul`, `tauceti:NumberField.discr_eq_of_integralBasis`.

**Acceptance.**

- e is integral although its written expression has a denominator 5.
- The trace determinant is -475, whereas the polynomial discriminant is -11875.
- The displayed delta inverse is (18+45u-44u^2+9u^3)/475, consistent with norm 9025.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.3, (257), printed p. 51. This explicit lattice certificate refines the stated field discriminant; the basis itself is derived here, not quoted from the paper.


<a id="habironahmseries-hb-10-cubic-laurent-symmetrisation"></a>

### The cubic symmetrisation as a Gaussian-binomial series

**Theorem** · `HabiroNahmSeries:HB.10/cubic-laurent-symmetrisation` · [packet](../packets/HabiroNahmSeries--HB.10.json)

In Q(q)[[t]], the GSWZ rank-one A=(3) series F_3(t,q) satisfies F_3(t,q)F_3(t,q^-1)=sum_{k>=0} q^(-k(k+1)) [3k+2 choose k]_q t^k. Every coefficient in t lies in Z[q,q^-1]. The k=1 coefficient is q^-2+q^-1+1+q+q^2. This equality concerns the formal t-series; specialisation t=1 uses algebraic continuation of its cyclotomic Taylor coefficients, not summation of this t-series at 1.

**Hypotheses and conventions.** Use the GSWZ normalisation F_3=sum (-1)^n q^(3n(n+1)/2)t^n/(q;q)_n. The Gaussian polynomial is the existing QM.0 object, and has nonnegative upper index 3k+2.

**Proof route.**

1. Apply the finite q-binomial theorem, imported from QM.0, to the convolution of the coefficients of F_3(t,q) and F_3(t,q^-1).
2. Rewrite (q^-1;q^-1)_l=(-1)^l q^(-l(l+1)/2)(q;q)_l, then collect the total t-degree.
3. Specialise Garoufalidis–Wheeler (47) to A=3: both signs become positive and the exponent becomes -k(k+1).
4. Use the Gaussian polynomial integrality from QM.0 to get Laurent-integral t-coefficients.

**Direct inputs.** [HabiroNahmSeries:HB.10/rank-one-product-identities](#habironahmseries-hb-10-rank-one-product-identities), `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`, `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem`.

**Acceptance.**

- At q=1 the t coefficient is 5; at q=-1 it is 1.
- At q=-1 the t^2 coefficient is 4, providing the root-expansion counterexample below.
- The formal equality does not justify evaluating t=1 in an infinite t-series.

**Sources.** [gw-classes-v1](https://arxiv.org/pdf/2505.19885v1): Proposition 1.14, (47), printed p. 11; proof (173), p. 30. Take the scalar A=3 case of the integral formula, which avoids inverse square roots and the module theorem.


<a id="habironahmseries-hb-10-cubic-root-constant"></a>

### The corrected constant term at the second root of unity

**Theorem** · `HabiroNahmSeries:HB.10/cubic-root-constant` · [packet](../packets/HabiroNahmSeries--HB.10.json)

Write t=T^2 and let z(t) be the formal root z=1+t z^3 with z(0)=1. Put delta(t)=z(t)^-3(3-2z(t)). The q=-1 constant term of the Laurent series in cubic-laurent-symmetrisation is (z(t)^-1+T)/delta(t), not (1+T)/delta(t). Its T-expansion starts 1+T+4T^2+5T^3+21T^4+28T^5. After algebraic specialisation t=1 and z^3-z+1=0, its constant is (z^-1+1)/delta, with delta=-z^2-z-2. More generally q-Lucas gives a finite numerator delta(t)^-1 sum_{l=0}^{m-1} z(t)^(a_l-2) zeta_m^(-l(l+1)) [b_l choose l]_{zeta_m} T^l, where T^m=t, a_l=floor((3l+2)/m), b_l=(3l+2) mod m.

**Hypotheses and conventions.** m is positive; 0<=a_l<=2. Gaussian coefficients with b_l<l vanish. The general finite numerator needs the requested q-Lucas evaluation from QM.0. The m=2 counterexample is already a direct polynomial evaluation.

**Proof route.**

1. For q=-1, [6h+2 choose 2h]_-1=binom(3h+1,h) and [6h+5 choose 2h+1]_-1=binom(3h+2,h).
2. Differentiate the Lagrange relation z=1+t z^3 to obtain sum_h binom(3h+a,h)t^h=z^(a+1)/(3-2z), for a=0,1,2. These give the two terms z^-1/delta and T/delta.
3. For a general m apply q-Lucas to k=mh+l and the same three ordinary binomial generating functions; keep the factor z^(a_l-2).
4. Specialisation is coefficientwise in the finite algebraic expression. It does not claim full small-prime gluing.

**Direct inputs.** [HabiroNahmSeries:HB.10/cubic-laurent-symmetrisation](#habironahmseries-hb-10-cubic-laurent-symmetrisation), [HabiroNahmSeries:HB.8/t-deformed-nahm-equations](#habironahmseries-hb-8-t-deformed-nahm-equations), `QSeriesPartitionsAndMockModularForms:QM.0`, [HabiroNahmSeries:HB.10/cubic-example](#habironahmseries-hb-10-cubic-example).

**Acceptance.**

- The T^2 coefficient is 4, not 5.
- For m=1 the finite numerator is 1/delta(t), as required.
- The concrete m=2 specialisation agrees with the root-average residue in GSWZ (220) at t=1.

**Sources.** [gw-classes-v1](https://arxiv.org/pdf/2505.19885v1): §3.2, (182), printed p. 31. The printed numerator is missing algebraic z-factors. Use the corrected scalar calculation, source issue HabiroNahmSeries/E64.


<a id="habironahmseries-hb-10-cubic-small-prime-criterion"></a>

### The precise small-prime gluing obligation for the cubic example

**Application** · `HabiroNahmSeries:HB.10/cubic-small-prime-criterion` · [packet](../packets/HabiroNahmSeries--HB.10.json)

Let R=Z[z,1/23], z^3-z+1=0, and let Psi_{3,mu,nu,z,m}(x) be the parent residue-descendant collection. For mu=nu=0 its m=1 coefficients are (2z^2+3z-9)/23, 0, and (-6477z^2-5311z+4318)/23^4 in degrees 0,1,2. For every pair (mu,nu), if (i) all coefficients of every component lie in R[zeta_m] and (ii) the GSWZ Frobenius re-expansion equation holds in R-hat_p[zeta_pm][[x]] for p=2 and p=3 and every m, then Psi_{3,mu,nu,z} belongs to H_R. At primes other than 2,3,23 use the imported proof over R[1/6]; at 23 the completion is zero. These two missing local inputs are required even for the unshifted collection; finite coefficient checks and the corrected m=2 constant do not prove them. Garoufalidis–Wheeler Theorem 1.13 offers an unshifted route, with its root-expansion proof requiring the repair of (182).

**Hypotheses and conventions.** The cubic ring is the full ring of integers with 23 inverted, by the parent cubic-example. The residue definition uses the parent corrected q-difference recursions, and has independent integer descendant indices mu,nu. No square root of delta or K3 comparison is needed for the symmetrised residue target.

**Proof route.**

1. Use delta^-1=(2z^2+3z-9)/23 and z^-1=1-z^2, so the algebraic specialisation lands in R.
2. Import the prime-to-six descendant result and the Frobenius gluing definition. A coefficient in R[1/6] that is integral at both 2 and 3 lies in R.
3. Check the two additional local equations at all m, then combine with the already proved prime-to-six equations to satisfy the definition of H_R.
4. For the unshifted case repair GW (182) using cubic-root-constant; prove the higher cyclotomic coefficients belong to the localized cubic étale algebra, and justify the p-completed coefficientwise identification. These steps remain the recorded gap.
5. For independent shifted descendants supply their own integral recurrences and gluing proof; membership of the unshifted product alone is insufficient.

**Direct inputs.** [HabiroNahmSeries:HB.10/cubic-root-constant](#habironahmseries-hb-10-cubic-root-constant), [HabiroNahmSeries:HB.10/cubic-example](#habironahmseries-hb-10-cubic-example), [HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring](#habironahmseries-hb-10-descendant-elements-of-the-habiro-ring), `HabiroNumberFields:HB.6/the-gluing-condition`, [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](#habironahmseries-hb-9-followup-descendant-pullback-contract), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract).

**Acceptance.**

- The known rigorous coefficient ring for the imported argument is R[1/6].
- To reduce that ring to R, both p=2 and p=3 equations are checked, including orders divisible by 2 or 3.
- The first-three-coefficient test is retained as a test rather than promoted to a global proof.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): Theorem 12 and Example 4.1, (231), printed p. 47. The thesis was now read, but supplies no identified residue-descendant proof. The p>3 limitation in Remark 1.8 remains relevant. [gw-classes-v1](https://arxiv.org/pdf/2505.19885v1): Theorem 1.13, p. 11; proof pp. 30–31. A possible independent unshifted route, with the erroneous auxiliary formula scoped in E64; it is not an all-descendant theorem.


<a id="habironahmseries-hb-10-etale-nahm-cohomology-export"></a>

### The actual degree-zero export of a Nahm symmetrisation

**Comparison** · `HabiroNahmSeries:HB.10/etale-nahm-cohomology-export` · [packet](../packets/HabiroNahmSeries--HB.10.json)

Let K be a number field, let Delta contain its ramified primes, and set R=O_K[1/Delta]. Import kappa_R:H_{R/Z} isomorphic to H_R from HR.5 and d_R:qHdg_{R/Z} equivalent to H_{R/Z} from HR.6. Since the étale Habiro–Hodge complex is concentrated in degree zero, eta_R=H^0(d_R)^-1 composed with kappa_R^-1 is a Z[q]-algebra isomorphism H_R to H^0(qHdg_{R/Z}). For every Nahm symmetrisation s whose H_R-membership has actually been supplied, eta_R(s) is its degree-zero cohomology coefficient. The completion square with H_R to R[[q-1]] and qHdg to its (q-1)-completion commutes, and each cyclotomic Taylor component and Frobenius re-expansion is preserved. Constant families of arbitrary elements of R are not used to define an R-algebra structure on H_R.

**Hypotheses and conventions.** Use the global Habiro–Hodge descent qHdg, not only the completed q-Hodge complex. R is étale over Z after the stated localization; the source comparisons apply to extra inverted primes as supplied by the HR.5 node. For the general GSWZ symmetrisation route also require 6|Delta and delta to be a unit in R. Reducing that localization is a separate result.

**Proof route.**

1. Import the number-field ring comparison and the étale degree-zero identification; do not reconstruct either owner theory.
2. Compose the two supplier isomorphisms in the displayed order. Apply the result to the supplied element s.
3. Their naturality and uniqueness of étale lifts identify every completion and quotient map; the equalizer Taylor projections identify the re-expansion/Frobenius arrows.
4. At q=1 the target is R[[q-1]], via completion. No equality with a higher-dimensional cohomology theory follows from this ring map.

**Direct inputs.** `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`, `HabiroRings:HR.6/the-degree-zero-identification`, `HabiroRings:HR.5/the-equaliser-presentation`, `HabiroCohomologyFoundations:HQ.5/the-export-to-the-coefficient-roadmap`, [HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring](#habironahmseries-hb-9-symmetrisation-lies-in-the-ring), `mathlib:RingEquiv.trans`, `mathlib:RingEquiv.trans_apply`.

**Acceptance.**

- The map sends 1 to 1 and is multiplicative.
- All Taylor components agree under the isomorphism, whereas completion at q=1 alone loses other components.
- The coefficient ring is the same R on both sides; no plain uncompleted tensor-product base-change formula is substituted.

**Sources.** [wagner-thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf): Corollary 2.13, printed p. 33; Corollary 3.13, p. 41. The explicit composite is an application of the coefficient-ring owners, resolving the old blanket no-export-map gap in relative dimension zero.


<a id="habironahmseries-hb-10-rational-cohomology-class"></a>

### The rational Gauss coefficient in degree-zero Habiro cohomology

**Application** · `HabiroNahmSeries:HB.10/rational-cohomology-class` · [packet](../packets/HabiroNahmSeries--HB.10.json)

Take R=Z[1/2] and the element g with Taylor family rationalGaussTaylor. Applying eta_R gives a class g_H in H^0(qHdg_{R/Z}) whose Taylor constants at orders 1,2,4 are respectively 1,0,2 and whose positive-degree coefficients vanish. Its q=1 completion is 1. This identifies a rational coefficient-ring example with an actual degree-zero class and does not assert a rational Nahm solution, a modularity theorem or a higher-degree cohomology class.

**Hypotheses and conventions.** The gluing certificate supplies g in H_R before applying eta_R.

**Proof route.**

1. Use rational-gauss-gluing for membership.
2. Instantiate etale-nahm-cohomology-export with K=Q and Delta=2.
3. Read off the Taylor components from preservation of the equalizer projections.

**Direct inputs.** [HabiroNahmSeries:HB.10/rational-gauss-gluing](#habironahmseries-hb-10-rational-gauss-gluing), [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](#habironahmseries-hb-10-etale-nahm-cohomology-export).

**Acceptance.**

- Order 2 retains the zero component after transport.
- The q=1 completion is 1 although the class has distinct other components.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): Example 4.4, (289), p. 57. The source element is transported through the established degree-zero comparison. [wagner-thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf): Corollary 3.13, p. 41. The comparison is applied only to the stated étale localization.


<a id="habironahmseries-hb-10-cubic-cohomology-class"></a>

### The cubic symmetrisation coefficient in degree-zero cohomology

**Application** · `HabiroNahmSeries:HB.10/cubic-cohomology-class` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For K=Q(z), z^3-z+1=0, set R_6=Z[z,1/138]. The parent descendant theorem gives the unshifted residue element Psi in H_{R_6}. Its degree-zero export eta_{R_6}(Psi) has q=1 Taylor coefficients (2z^2+3z-9)/23, 0 and (-6477z^2-5311z+4318)/23^4. If the two additional local obligations in cubic-small-prime-criterion are supplied, the same construction is defined over R=Z[z,1/23]; the map for R to R_6 takes that class to the class already constructed. The rational expressions for the first coefficients alone do not justify descent of the whole class.

**Hypotheses and conventions.** The proven imported localization is 6*23. The extension to Delta=23 depends explicitly on the local obligations, not on a K3 or regulator comparison.

**Proof route.**

1. Use the parent cubic presentation and the inverse discriminant identity.
2. Apply the proven prime-to-six residue membership over R_6, then eta_{R_6}.
3. For the smaller ring apply cubic-small-prime-criterion first; naturality of eta gives the localization square.
4. Verify the alternative x^2 coefficient (-59z^2-51z+36)/delta^7 by reduction modulo z^3-z+1.

**Direct inputs.** [HabiroNahmSeries:HB.10/cubic-example](#habironahmseries-hb-10-cubic-example), [HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring](#habironahmseries-hb-10-descendant-elements-of-the-habiro-ring), [HabiroNahmSeries:HB.10/cubic-small-prime-criterion](#habironahmseries-hb-10-cubic-small-prime-criterion), [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](#habironahmseries-hb-10-etale-nahm-cohomology-export), [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](#habironahmseries-hb-9-followup-descendant-pullback-contract).

**Acceptance.**

- The linear coefficient is zero.
- The two expressions for the quadratic coefficient agree by an exact polynomial reduction.
- A change of rings to R_6 is not confused with a proof of descent to R.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): Example 4.1, (231), p. 47. The three coefficients are exported over the localization warranted by the proof; the smaller coefficient ring is conditional. [wagner-thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf): Corollaries 2.13 and 3.13, pp. 33, 41. The ring comparison and degree-zero identification are applied to the explicit cubic localization.


<a id="habironahmseries-hb-10-quartic-module-export"></a>

### The nonabelian example with a complete excluded-prime ledger

**Application** · `HabiroNahmSeries:HB.10/quartic-module-export` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For the selected D4 quartic F=Q(u), let k_F=|K2(O_F)|>0, M_F=6*475*k_F, and choose Delta divisible by M_F (and hence by 2,3,5,19). Let R=O_F[1/Delta], with u,v and delta as certified above, and S=R[T]/(delta T^2-1), a finite étale quadratic algebra after 2 is inverted. Assuming the inherited proof obligations of HB.9/module-membership and the finite étale scalar-change interface requested by HB.9 from HabiroNumberFields HB.7, the parent nonabelian-quartic-example and general module-membership supply the polar-part-removed formal Gaussian collection f in the restricted K3-indexed Habiro module H_{S,xi}|Delta, for xi the specified K3 lift of [u]+[v]. The corresponding two complex regulator values are the evaluations of D(u)+D(v) through the parent embedding interface. The known required prime set is {2,3,5,19} union the prime divisors of k_F; it is not asserted to be exactly {2,3,5,19} until the tame kernel is certified. In the normalization fhat_1(x)=exp(pi^2/(15 log(1+x))) delta^-1/2 (1+a_1x+a_2x^2+...), a_1=(-1284u^3+384u^2-5520u+2047)/(12*25*19^2) and a_2=(-3084024u^3-11262336u^2-1073760u+17201653)/(32*9*25*19^4). The source claim 60xi=0 requires an exact class certificate; no 60th-power ring conclusion is drawn from regulator numerics.

**Hypotheses and conventions.** The even diagonal entries 8 and 4 make the symbol sum a Suslin Bloch element; a K3 lift is still specified rather than declared canonical. The source normalization and its q-inversion correction are imported from the parent. The GSWZ membership statement uses orders coprime to Delta and the inverse square-root algebra S. The scalar extension S is not assumed to be a field or to equal R. The finite étale coefficient extension and K3 scalar-change interface requested by the imported HB.9/module-membership are supplied by the module owner, HabiroNumberFields HB.7; this inherited input is not silently treated as implemented. The imported HB.9 proof obligations remain inputs: the linear-coefficient integrality needed for the corrected local-section shape, and the arbitrary-rank gluing/uniqueness argument (GSWZ writes out rank one). The exact quartic solution and discriminant certificates do not discharge these analytic and arithmetic inputs.

**Proof route.**

1. Use quartic-coordinate-certificate and quartic-integral-basis to certify units, discriminant and the exact field presentation.
2. Use the CGZ excluded-integer definition and request the tame-kernel computation to turn the symbolic ledger into a certified finite prime list.
3. Import the general GSWZ module-membership theorem with the explicit S, xi and root-order restriction, conditional on its recorded local-section and arbitrary-rank proof obligations.
4. Retain the first two source coefficients with their normalization; the exponential and inverse square root are not discarded from the type.
5. Keep the 60-torsion assertion separate: apply the five-term certificate soundness interface only once an exact certificate and the K3 torsion obstruction are supplied.

**Direct inputs.** [HabiroNahmSeries:HB.10/quartic-integral-basis](#habironahmseries-hb-10-quartic-integral-basis), [HabiroNahmSeries:HB.10/nonabelian-quartic-example](#habironahmseries-hb-10-nonabelian-quartic-example), [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.3/suslin-obstruction-of-the-nahm-element](#habironahmseries-hb-3-suslin-obstruction-of-the-nahm-element), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations), `HabiroNumberFields:HB.1/the-excluded-primes`, `K3BlochGroups:V.6/five-term-certificate`, `K3BlochGroups:V.6/suslin-lift-fibre`, `ArithmeticKTheory:N.6`, [HabiroNahmSeries:HB.9/followup-etale-module-contract](#habironahmseries-hb-9-followup-etale-module-contract), [HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction](#habironahmseries-hb-3-signed-exterior-boundary-obstruction).

**Acceptance.**

- The normal closure has D4 group, not an abelian group and not the S4 group of the second orbit.
- The coefficients a_1,a_2 are those of the displayed normalized factor, not coefficients of an ordinary integral power series after dropping its prefactors.
- The excluded-prime ledger names the K2 input instead of claiming its unknown order.
- A numerical zero of every regulator is not a certificate for the exact order 60.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): §4.3, (261)–(263), printed p. 52. The source coefficients and torsion assertion are kept separate from an exact proof of torsion. The field and discriminant certificates fix the membership hypotheses.


<a id="habironahmseries-hb-10-picard-and-regulator-export"></a>

### The coefficient-line and regulator exports of the explicit examples

**Comparison** · `HabiroNahmSeries:HB.10/picard-and-regulator-export` · [packet](../packets/HabiroNahmSeries--HB.10.json)

For a specified K3 class xi and coefficient ring S of quartic-module-export, import the GSWZ global module L_xi=H_{S,xi} and the tensor/addition theorem from HabiroNumberFields HB.7. Conditional on that supplier theorem and a global extension when a chosen series is known only on orders coprime to Delta, HR.6 transports L_xi along the ring comparison to an invertible module over the degree-zero Habiro coefficient ring, yielding xi to [L_xi] in Pic. This is an actual map of coefficient lines supplied by HR.6, not a map from the restricted series to an unrestricted cohomology class. Its q=1 completed line is free conditional on HR.6's separate completion-triviality input, while the full line may retain K3 information. Independently, the embedding-indexed real regulator tuple of the chosen Bloch class is the parent sum of Bloch–Wigner values. No isomorphism between this real tuple and the transported line, or with crystalline or étale cohomology, is supplied by module membership.

**Hypotheses and conventions.** The missing tensor-product and nonzero-global-module arguments in HabiroNumberFields/E23 are retained as supplier gaps. A series given only in H_{S,xi}|Delta is not made into a global generator by this comparison. S is treated componentwise as a finite étale number-field algebra if the quadratic algebra splits. The order-one freeness input of HR.6/the-regulator-dies-after-q-minus-one-completion is separately assumed: that supplier records the assertion without an identified proof. Tensor compatibility and the étale ring comparison alone do not prove it.

**Proof route.**

1. Import HR.6/the-transported-regulator and completed-scalar-extension; do not build a second Picard or module interface in HB.10.
2. Use the ring isomorphism of etale-nahm-cohomology-export to express the same invertible coefficient module over H^0(qHdg).
3. At q=1 use the separate completed-line triviality statement of HR.6, whose unresolved supplier hypotheses remain visible.
4. Export the regulator tuple through HB.3/embeddings-and-regulator-evaluations. A comparison with geometric cohomology would require the higher-cohomology-export-obligation.

**Direct inputs.** [HabiroNahmSeries:HB.10/quartic-module-export](#habironahmseries-hb-10-quartic-module-export), [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](#habironahmseries-hb-10-etale-nahm-cohomology-export), `HabiroNumberFields:HB.7/the-ring-case-and-tensor-products`, `HabiroRings:HR.6/the-transported-regulator`, `HabiroRings:HR.6/completed-scalar-extension`, `HabiroRings:HR.6/the-regulator-dies-after-q-minus-one-completion`.

**Acceptance.**

- The chosen local series need not generate an invertible module globally.
- Completing the coefficient line at q=1 cannot certify that its global Picard class vanishes.
- A Bloch–Wigner regulator is a real additive invariant with a different target from Pic.

**Sources.** [gswz-v2](https://arxiv.org/pdf/2412.04241v2): Theorem 2, (25)–(26), pp. 10–11; proof §3.3, p. 43. The coefficient-line map is imported with the source proof limitations already recorded by HabiroNumberFields/E23. [wagner-thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf): Corollary 3.13, printed p. 41. The completed cohomology coefficient object is identified through its owner; no higher cohomology claim is inferred.


<a id="habironahmseries-hb-10-higher-cohomology-export-obligation"></a>

### The additional map required for higher-dimensional Habiro cohomology

**Comparison** · `HabiroNahmSeries:HB.10/higher-cohomology-export-obligation` · [packet](../packets/HabiroNahmSeries--HB.10.json)

The proved HB.10 export eta_R has target H^0(qHdg_{R/Z}) for the zero-dimensional étale scheme Spec R. Garoufalidis–Wheeler Definition 1.2 defines H(V) for an R-module V equipped with compatible p-adic Frobenius automorphisms at all but finitely many primes, over an étale Z[lambda]-algebra R. Its rational Taylor series at every root must converge on the whole open disc |q-zeta_m|_p<1 and satisfy Frobenius re-expansion for every m and all but finitely many primes p. In their smooth proper setup (13)–(14), V=H^n_dR(X/B) modulo torsion and B=Spec R. Separately, Theorem 1.18 uses an étale map Z[x,lambda] to R', the affine X=Spec R' over B'=Spec Z[lambda,1/Delta(lambda)], an analytic relative Habiro element f whose Taylor series have positive radius at every prime-ideal completion, and a relative top form omega invariant under p-Frobenius for all but finitely many p. It sends f to [f omega] in H_naive^N(X/B'), where N is the number of x variables; this affine construction is distinguished from the preceding smooth proper setup. To export such a cycle into the algebraic Habiro cohomology of HQ.5 requires a specified comparison H_naive^N(X/B') to H^N(RGamma_Hab(X/B')), the same base and bad-prime localization, compatible cyclotomic completions, Frobenius and de Rham specialisation, and a proof for the selected input. This map is a requested comparison, not established by the paper or by GSWZ membership. The analogous crystalline, A_inf and étale realizations require the hypothesis-bearing HQ.8 comparison maps separately.

**Hypotheses and conventions.** The geometric family X, the form omega and the analytic convergence input are specified additional data; a Nahm matrix and its Bloch class alone do not specify them. The naive glued de Rham module is distinguished from Wagner algebraic Habiro cohomology. Source Theorem 1.18 concerns an analytic subring and Frobenius-invariant forms; it cannot be applied to every formal Habiro element. Definition 1.2 requires convergence on the entire open p-adic unit disc for the relevant primes, not merely some positive radius. Positive radius at every prime-ideal completion is the distinct analytic-domain condition of Theorem 1.18; it is not a substitute for the target carrier's convergence requirement.

**Proof route.**

1. Read GW Definitions 1.1–1.2 and Theorem 1.18 and keep their domains and targets.
2. Apply a push-forward only for a supplied geometric family and invariant top form; import its construction from the cohomology owner rather than define H(V) in HB.10.
3. Request the comparison to the HQ.5 algebraic object and the compatible realizations. The current source explicitly says the naive construction is expected to capture features of the other theories.
4. Maintain a recorded gap until that comparison is supplied; q-series, field embeddings or K3-indexed line modules alone do not produce it.

**Direct inputs.** [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](#habironahmseries-hb-10-etale-nahm-cohomology-export), `HabiroCohomologyFoundations:HQ.5/the-export-to-the-coefficient-roadmap`, `HabiroCohomologyFoundations:HQ.6`, `HabiroCohomologyFoundations:HQ.8/the-commutation-theorem`.

**Acceptance.**

- A dimension-zero coefficient-ring class passes through eta_R.
- An arbitrary restricted K3-module element lacks the X, omega and comparison needed for the higher-degree target.
- The analytic subring hypothesis is retained rather than inferred from formal coefficients.
- A series converging only on a smaller positive-radius disc does not satisfy Definition 1.2 merely by meeting the analytic-domain condition of Theorem 1.18.

**Sources.** [gw-classes-v1](https://arxiv.org/pdf/2505.19885v1): Definition 1.2 and (14), printed p. 5; Theorem 1.18, p. 12; proof §3.3, p. 32. The quoted expectation prevents treating the naive coefficient module as the algebraic theory. Definition 1.2's unit-disc convergence and smooth proper use are distinguished from the positive-radius analytic domain and affine target of Theorem 1.18.


## Coverage, source findings and what remains

The refinement packets give the current obligations. Historical source-access gaps in the base are superseded where later reading supplied the source: Zagier's survey in HB.3/HB.5, Vlasenko–Zwegers in HB.4, Gaussian affine/Fubini sources in HB.8 and Wagner's relative comparison in HB.10. The Gaussian all-order problem remains a mathematical obligation after the source was obtained. Likewise the elementary finite-support route resolves the full-series general-rank gap without resolving the congruence/Gaussian route. Obtaining a paper is not treated as proving a missing theorem.

The old signed integral class, rational arithmetic normalization, powered-product integrality and numerical quartic torsion assertions are governed by the controlling refinements identified above. Coarse source numbers are interpreted using the reviewed version records: CGZ printed pagination was corrected, and GZ has Appendix A rather than a section 8. Source finding identifiers are packet-local. In particular HB.8 `EHB8-1` and HB.9 `E64` concern the same GSWZ (114) regularization; HB.9 `E65` adds the Euler factor. HB.10 `E64` instead concerns GW (182), and its `E65` is a cross-reference. These are separate records and no verdict or source finding identifier is overwritten.

The following ledger retains each refined gap with its exact consumers. Detailed supplier requests and every restructuring proposal, including inherited base requests, are collected in the [handoff](../handoff/ASM-HabiroNahmSeries.md). Requests to the same owner are one interface family with several consumers, not parallel ownership plans.

### Outstanding HB.3 obligations

**Rogers supplier interface remains unsupplied.** The real Rogers dilogarithm in CGZ (42): L_CGZ=π²/6−Li₂−½ log(x)log(1−x) on (0,1), with the specified x>1 and x<0 continuations, extended to P¹(R) with values in R/(π²/2)Z and values π²/6,0,−π²/6 at 0,1,∞. Its linear extension must kill the CGZ projective five-term relations and descend to the corrected integral B_CGZ(R); include the standard-normalization comparison and the three rank-one values.

**Consumers:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](#habironahmseries-hb-3-embeddings-and-regulator-evaluations).

**Borel regulator injectivity remains unsupplied.** For each number field F, the degree-three Borel regulator on K₃(F)⊗Q is injective, with kernel before rationalization exactly torsion. Through the existing rational Suslin/Bloch comparison and Polylogarithms:P.2/borel-comparison, this detects the zero of ξ in B_CGZ(F)⊗Q by all complex-place Bloch–Wigner evaluations. Only the nonzero rational comparison scalar is needed.

**Consumers:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](#habironahmseries-hb-3-torsion-criterion-by-regulators).

**Unique divisibility remains unsupplied.** For an algebraically closed field of characteristic zero, in particular Qbar and C, B in the exact V.3 convention is uniquely divisible (Suslin, Theorem 6.3 cited by CGZ §1.3). Transport this to the corrected CGZ convention through the V.3 comparison, explaining why torsion maps to zero and rationalization does not change the algebraically closed group.

**Consumers:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](#habironahmseries-hb-3-torsion-in-the-algebraic-closure).

**Integral convention of the signed formal class remains unresolved.** Specify the integral Bloch/K₃ convention for GSWZ §1.7 (41)–(42): a signed symmetric integral solution has exterior boundary sum_i M_ii z_i wedge (−1), generally only certified 2-torsion. Give the correct integral target or an explicit lift and its relation to the V.3 antisymmetric and corrected CGZ conventions; explain what identifies the unmultiplied ξ used by the Habiro module. The local doubled CGZ class is insufficient for an assertion about its integral torsion order.

**Consumers:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/general-nondegenerate-class](#habironahmseries-hb-3-general-nondegenerate-class).

**Coverage tasks.**

- Supply and integrate the four exact owner interfaces in requests; the local algebraicity argument and HB.3 source access are resolved.
- Replace the commented regulator comparison in the suggested file by actual supplier signatures once their types are available.
- Reconcile the parent general-nondegenerate-class integral assertion with the signed-boundary calculation before its integral Habiro/K₃ interpretation is used.

### Outstanding HB.4 obligations

**Coefficientwise Kummer invariance is not proved in the read source.** Prove σ(C(θ)^{−1}T(η,ε)^m)=C(θ)^{−1}T(η,ε)^m for every actual E-automorphism, with η_i→ζ^{s_i}η_i and θ_i→ζ^{ds_i}θ_i. Establish the formal Gaussian translation on the full corrected exp(∑ψ) integrand, including class wraparound and coherent rational powers. GZ (20) states the result; §4.3 proves only the analytic expansion. The constant-term cyclic-dilogarithm transformation alone is insufficient.

**Consumers:** [HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface](#habironahmseries-hb-4-coefficientwise-kummer-descent-interface), [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison).

**Rational-data arithmetic normalization requires reconciliation.** Reconcile the parent simplified unit/eigenspace assertion with β over the coherent d-root field and with G(Q,a/m) in Q(ζ_D). Supply the precise Kummer-class transformation over K=Q(y,ζ,ζ_D), or prove an explicitly stated smaller field suffices. Do not apply CGZ’s fixed μ and F=Q(z) to arbitrary rational data. The analytic formula and its coefficient field conditional on invariance are specified independently. Concretely use H_G=K(η_i) for the constant class, and specify the χ_cyc^{−1} action of Aut_{F_G}(K), F_G=Q(y_i,ζ_D), K=F_G(ζ). The representative comparison requires gcd(m,w_{F_G})=1, not gcd(m,w_K)=1: K already contains ζ.

**Consumers:** [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](#habironahmseries-hb-4-cgz-normalization-and-field-comparison).

**Rogers and trigonometric dilogarithm owner input.** The exact Polylogarithms:P.1 request below is still unsupplied. The q-series identity itself now has supplier nodes and is not a remaining gap.

**Consumers:** [HabiroNahmSeries:HB.4/andrews-gordon-owner-and-acceptance-comparison](#habironahmseries-hb-4-andrews-gordon-owner-and-acceptance-comparison).

**Coverage tasks.**

- Prove the exact coefficientwise Kummer automorphism identity recorded below; the analytic theorem does not depend on that identity.
- Supply the real Rogers and trigonometric dilogarithm identities from Polylogarithms:P.1.
- Reconcile the rational-data near-unit statement with the coherent radical field and the Gauss-value field before exporting the full arithmetic CGZ package.

### Outstanding HB.5 obligations

**HB.4 constant-term coefficient and eigenspace descent.** The accepted parent exports the corrected fixed-extension identities used here, but records its root-change bookkeeping as an unwritten proof. Its Galois-equivariance proof only changes ζ to ζ^c, which by itself does not identify the resulting Kummer class with the χ^{-1} power at the original ζ. This pass gives the exact HB.5 bridge conditional on those imported inputs and sends their proof obligation to HB.4. The real q=1 and unrestricted cusp-majorant branches do not depend on this gap. A reviewer must not regard the new arithmetic bridge as an independent verification of the HB.4 eigenspace statement. The imported parent displays the unrescaled GZ series alongside a Dedekind multiplier. This review specifies Φ_Ded=(ν_a/μ_a)Φ_GZ and takes 24|D; the HB.4 proof must use this consistent normalization. An E_n scalar rescaling preserves the Kummer class, but does not supply the missing coefficient/eigenspace proof.

**Consumers:** [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](#habironahmseries-hb-5-fixed-extension-constant-term-lift), [HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier](#habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier), [HabiroNahmSeries:HB.5/rational-bloch-arithmetic-bridge](#habironahmseries-hb-5-rational-bloch-arithmetic-bridge).

**Coverage tasks.**

- Supply the HB.4 constant-term coefficient/Kummer/eigenspace proof over the fixed E, with the root-change and rational Gauss-factor bookkeeping specified in the request. The HB.5 arithmetic bridge is planned conditionally on these existing inputs. Include the multiplier rescaling required by the review, with 24 dividing the fixed strong denominator D.

### Outstanding HB.8 obligations

**G1 — Reconcile the corrected local Gaussian remainder with global prefactors.** The four subtractions in (114) are inconsistent with (59). The locally corrected expression is established, but its propagation through (118), the square-root/cyclotomic normalizers and the refined CS sum is not established. Recompute these from the same Pochhammer expansion and prove the affine shift with the resulting full prefactor. Imported parent Gaussian nodes are specifications with this gap, not facts used in the elementary Theorem 6 chain.

**Consumers:** [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](#habironahmseries-hb-8-refinement-gaussian-shifts), [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](#habironahmseries-hb-8-refinement-gaussian-regularity), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification), [HabiroNahmSeries:HB.8/refinement-level-residues](#habironahmseries-hb-8-refinement-level-residues), [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility).

**G2 — Uniform t-regularity of the corrected refined Gaussian sum.** Prove cancellation of vertex poles at z_j=1 after Wick contractions and congruence summation, at every loop order and separately in each t_j. Then justify t-first expansion in K((x))[[t]] and constant coefficient 1. The determinant estimate in the source is insufficient; e.g. the uncontracted h Li_0(1-t)/12 term has a t^{-1} pole.

**Consumers:** [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](#habironahmseries-hb-8-refinement-gaussian-regularity), [HabiroNahmSeries:HB.8/refinement-gaussian-identification](#habironahmseries-hb-8-refinement-gaussian-identification), [HabiroNahmSeries:HB.8/refinement-level-residues](#habironahmseries-hb-8-refinement-level-residues), [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility).

**G3 — Corrected level-m cyclotomic cancellation in arbitrary rank.** Complete the signed, multi-index ratio induction at arbitrary k; prove the Adams-stable denominator ring R_m and the forbidden-root residue cancellation for c=m a, gcd(a,m)=1. Prove the L_n(zeta_m) in Z[1/m] value claim. This gap does not concern existence/uniqueness of the restricted decomposition, which is supplied here.

**Consumers:** [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](#habironahmseries-hb-8-refinement-corrected-level-admissibility).

**Coverage tasks.**

- G1 — Reconcile the corrected local Gaussian remainder with global prefactors: The four subtractions in (114) are inconsistent with (59). The locally corrected expression is established, but its propagation through (118), the square-root/cyclotomic normalizers and the refined CS sum is not established. Recompute these from the same Pochhammer expansion and prove the affine shift with the resulting full prefactor. Imported parent Gaussian nodes are specifications with this gap, not facts used in the elementary Theorem 6 chain.
- G2 — Uniform t-regularity of the corrected refined Gaussian sum: Prove cancellation of vertex poles at z_j=1 after Wick contractions and congruence summation, at every loop order and separately in each t_j. Then justify t-first expansion in K((x))[[t]] and constant coefficient 1. The determinant estimate in the source is insufficient; e.g. the uncontracted h Li_0(1-t)/12 term has a t^{-1} pole.
- G3 — Corrected level-m cyclotomic cancellation in arbitrary rank: Complete the signed, multi-index ratio induction at arbitrary k; prove the Adams-stable denominator ring R_m and the forbidden-root residue cancellation for c=m a, gcd(a,m)=1. Prove the L_n(zeta_m) in Z[1/m] value claim. This gap does not concern existence/uniqueness of the restricted decomposition, which is supplied here.

### Outstanding HB.9 obligations

**A faithful integral coefficient model for (170).** The full quotient S^(m)[w]/p does not inject into one normalized t-branch: followup-branch-loss proves a counterexample. Prove the defect in all components using its canonical Gaussian/modified-polylogarithm formula, or construct a jointly faithful integral family of branches and prove reduction saturation. For completed Laurent targets use lim_r (Z/p^r)[ζ_m]((t^(1/m))), allowing p-adically vanishing coefficients with unbounded negative exponents; ordinary Z_p((t^(1/m))) is too small. Apply followup-saturation-transfer only after its hypothesis is proved. A selected component alone does not transport to every t=1 solution.

**Consumers:** [HabiroNahmSeries:HB.9/frobenius-congruence](#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract).

**Corrected HB.8 construction and admissibility in general rank.** HB.8 owns formal Pochhammer symbols, Gaussian integration, level-m admissibility and Theorems 7/8. Reconcile E64/E65 with its corrected fgiFactor, periodicity, difference equations and identification theorem at all orders; the first jet is checked here but does not prove those all-order identities. Prove its accepted corrected coefficient ring R_m and general-rank identification in Q(ζ_m)((x))[[t]], retaining m′ coprime to m. HB.9 uses only m′=1 of the Dwork lemma. Do not restore the false printed Theorem 7 or silently change the imported Gaussian construction.

**Consumers:** [HabiroNahmSeries:HB.9/frobenius-congruence](#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/followup-refined-linear-integrality](#habironahmseries-hb-9-followup-refined-linear-integrality), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract).

**Signed finite-Chern/Kummer comparison of all constants.** Compare the full corrected U_m(1) to the fixed HB.2 c_ζ and ε_m=c_ζ², including inverse cyclic prefactor, monomial factors and k-sum. Prove individual refined constants are units of the required torsor, descend the sum, and identify the module index. The accepted HB.2 base has an orientation gap; its needs_changes follow-up is not an accepted sign comparison. The positive Coleman regulator sign does not settle this separate finite-Chern convention.

**Consumers:** [HabiroNahmSeries:HB.9/constant-term-is-the-unit](#habironahmseries-hb-9-constant-term-is-the-unit), [HabiroNahmSeries:HB.9/followup-kummer-orientation-contract](#habironahmseries-hb-9-followup-kummer-orientation-contract), [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership).

**Integral all-order auxiliary products and indexed-module descent.** Both powered and unpowered general-rank systems and uniqueness are specified. Only the unpowered product has universal volume cancellation. Prove its all-order integral Gaussian coefficients, full coefficient-Frobenius root reexpansion and Kummer descent over S^(m)[1/(Δγ)] at primes p∤Δγ using faithful coefficient transfer. Supply actual HB.7 effective descent for the full quadratic étale algebra; local-span arguments allow a zero sum. The accepted base powered-family universal integrality statement is not a usable proof. The local first-jet argument and Theorem 5 cover root orders coprime to Δ. The imported all-root-order statements of Corollary 1.11 additionally require the source’s γ=1 product argument and the five-term/cyclic-dilogarithm identity for torsion constants, with their bad-order integrality and coefficient-gluing hypotheses checked. Restricted membership alone does not imply these unrestricted corollaries; retain their target IDs with this extension obligation.

**Consumers:** [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](#habironahmseries-hb-9-followup-integral-gluing-contract), [HabiroNahmSeries:HB.9/followup-etale-module-contract](#habironahmseries-hb-9-followup-etale-module-contract), [HabiroNahmSeries:HB.9/module-membership](#habironahmseries-hb-9-module-membership), [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions), [HabiroNahmSeries:HB.9/verifying-the-defining-conditions](#habironahmseries-hb-9-verifying-the-defining-conditions), [HabiroNahmSeries:HB.9/symmetrisation-lies-in-the-ring](#habironahmseries-hb-9-symmetrisation-lies-in-the-ring), [HabiroNahmSeries:HB.9/torsion-powers-lie-in-the-ring](#habironahmseries-hb-9-torsion-powers-lie-in-the-ring).

**All-order q-dependent descendant transport.** The level-m curve and logarithmic derivative are fixed here. Complete its all-order formal étale lift, changing principal part and algebraic prefactors, Frobenius comparison and product gluing. Use ν=0 and the level-2/nontrivial negative-shift tests; a constant t=1 specialization cannot prove Remark 3.11.

**Consumers:** [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](#habironahmseries-hb-9-followup-descendant-pullback-contract), [HabiroNahmSeries:HB.9/descendants-by-specialisation](#habironahmseries-hb-9-descendants-by-specialisation).

**Coverage tasks.**

- G-coefficient-transfer: A faithful integral coefficient model for (170)
- G-HB8-identification: Corrected HB.8 construction and admissibility in general rank
- G-kummer-orientation: Signed finite-Chern/Kummer comparison of all constants
- G-all-order-gluing: Integral all-order auxiliary products and indexed-module descent
- G-descendant-transport: All-order q-dependent descendant transport
- D.1/D.3/D.4 regulator suppliers and HB.2/HB.7 extension contracts.
- The converse to torsion powers retains nonvanishing of constants at infinitely many permitted prime orders; no unconditional equivalence is claimed.
- Imported all-root-order symmetrization and torsion powers require the separate Corollary 1.11 extension argument recorded in G-all-order-gluing; restricted membership does not prove it.

### Outstanding HB.10 obligations

**Cubic gluing at 2 and 3, with every descendant index.** For R=Z[z,1/23], prove all-component coefficient integrality and the p=2,3 re-expansion equations for every m and every independent pair (mu,nu). The accepted prime-to-six result proves only the localization R[1/6]. GW Theorem 1.13 is a possible unshifted route but its printed (182) fails the explicit m=2 scalar A=3 test (E64). The corrected finite numerator in cubic-root-constant is insufficient for all higher coefficients or shifted descendants. A repair must prove the localized étale coefficient descent and its p-completed compatibility, then address shifts independently.

**Consumers:** [HabiroNahmSeries:HB.10/cubic-small-prime-criterion](#habironahmseries-hb-10-cubic-small-prime-criterion), [HabiroNahmSeries:HB.10/cubic-cohomology-class](#habironahmseries-hb-10-cubic-cohomology-class).

**An exact 60-torsion certificate and specified K3 lift.** The paper asserts that [u]+[v] is 60-torsion, but no explicit five-term certificate for 60([u]+[v]) was located. Give one in the declared Bloch convention, use K3BlochGroups V.6 soundness, and handle the torsion fibre for the specified integral K3 lift before asserting 60xi=0 in K3(F). Numerical regulator vanishing is insufficient. Membership itself uses a supplied lift and does not need this exact-order claim.

**Consumers:** [HabiroNahmSeries:HB.10/quartic-module-export](#habironahmseries-hb-10-quartic-module-export), [HabiroNahmSeries:HB.10/picard-and-regulator-export](#habironahmseries-hb-10-picard-and-regulator-export).

**The quartic tame kernel and the complete numerical prime list.** ArithmeticKTheory:N.6 must supply k_F=|K2(O_F)| and its prime divisors. Until then Delta can be specified exactly as 6*475*k_F, but the certified explicit primes are only 2,3,5,19 plus the stated tame-kernel input; the list may not be shortened by guessing k_F.

**Consumers:** [HabiroNahmSeries:HB.10/quartic-module-export](#habironahmseries-hb-10-quartic-module-export).

**Supplier gaps in K3-indexed coefficient-line interfaces.** HabiroNumberFields HB.7/the-ring-case-and-tensor-products records missing arguments for closure under addition, nonzero global modules, and injectivity/surjectivity of the tensor map (source issue HabiroNumberFields/E23). The HR.6 Picard transport and completion-triviality statements inherit that gap. Additionally, GSWZ Theorem 5 gives only restricted-order series membership; a global extension or generator assertion requires an independent proof. The finite étale module scalar-change interface for S=R[T]/(delta T^2-1) is also inherited from the explicit HB.9/module-membership request to HB.7. The algebraic ring S is well defined, but the owner must provide this coefficient-line interface. The HB.9/module-membership import also retains its linear-coefficient local-section gap and the arbitrary-rank gluing/uniqueness argument, which the source only writes out for rank one. HR.6/the-regulator-dies-after-q-minus-one-completion separately records order-one freeness as an assertion without an identified proof; completing the tensor theorem does not by itself close that obligation.

**Consumers:** [HabiroNahmSeries:HB.10/picard-and-regulator-export](#habironahmseries-hb-10-picard-and-regulator-export), [HabiroNahmSeries:HB.10/quartic-module-export](#habironahmseries-hb-10-quartic-module-export).

**Naive-to-algebraic geometric cohomology comparison.** No source read constructs the requested map from GW H_naive^n(X/B) to HQ.5 algebraic Habiro cohomology, or identifies a general Nahm module element with a geometric cohomology class. Specify X/B and omega, prove convergence and Frobenius compatibility, supply the comparison map through the cohomology owner, and only then compose the selected HQ.8 realization. The proved dimension-zero map eta_R is already available and is not part of this gap.

**Consumers:** [HabiroNahmSeries:HB.10/higher-cohomology-export-obligation](#habironahmseries-hb-10-higher-cohomology-export-obligation).

**Coverage tasks.**

- Prove the all-component cubic p=2,3 integrality/gluing inputs, for unshifted and independently shifted descendants, repairing GW (182).
- Supply the quartic exact 60-torsion/K3-lift certificate and the numerical tame-kernel prime list.
- Close the inherited HB.9 local-section/arbitrary-rank membership obligations, HB.7 global-module/tensor-product gaps, and HR.6 order-one completion-freeness obligation before unconditional coefficient-line conclusions.
- Supply a geometric naive-to-algebraic cohomology comparison through the proposed cohomology extension; preserve all completion and Frobenius hypotheses.

### Traceability and prototype validation

The seven packet links retain the baseline declarations, source hashes, individual acceptance history, imports and planning notes. The assembly only refines dependency references and consolidates HB.8 display metadata; the review objects and packet statements are preserved. All 183 declaration IDs, all API names and all named tests occur in this reader. The prototype retains each part's declaration namespaces in scoped sections, so similarly named local functions are qualified rather than silently identified. Its HB.8 imported signatures are adapters to the base ownership targets, not a second roadmap for the same definitions.

The combined Lean file elaborates against the pinned Mathlib with only `sorry` warnings. Unavailable Bloch/K₃, regulator, Gaussian completion, Habiro module and cohomology carriers remain named omissions or explicit parametric interfaces. A `sorry` proof does not discharge any mathematical gap. The structural checker passes all seven packets. The assembled internal node-reference graph has no missing node target and no dependency cycle.
