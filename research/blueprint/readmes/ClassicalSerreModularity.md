# Classical Serre Modularity

This roadmap assembles the proof of Serre’s modularity conjecture for two-dimensional residual representations of the absolute Galois group of ℚ. Its public endpoint is a normalized characteristic-zero newform of **weight k(ρ̄), level N(ρ̄)** and the specified reduced nebentypus, together with a coefficient prime above the residual characteristic and an isomorphism to its residual representation. R27.6 owns that statement. Khare–Wintenberger’s classical argument and the Dieulefait–Pacetti argument give two proposed proofs of it.

Khare’s level-one theorem supplies the seed for the classical conductor induction. The modern qualitative proof removes that induction and its weight recursion, while still importing lift existence, compatible systems, small-ramification base cases and modularity lifting. Its final weight-and-level refinement uses R27.4’s conditional minimal-lift argument, including the scalar local dyadic case. Independence from the general Serre endpoint additionally requires the unresolved supplier globalisation audits; a dependency reference is not an independence certificate.

This is a **formalisation plan**. All 81 declaration nodes retain implementation status `unchecked`. The input packets retain their independent verdicts: R26.1 and R27.3 have `needs_changes`; R33.5 has `accepted` as a partial plan. Source decomposition, acceptance of a plan and formal proof are distinct. The [part packets](../packets/) remain the machine-readable statement and dependency records. This reader reconciles their current mathematics; the [suggested file](../suggested/ClassicalSerreModularity.lean) gives proposed Lean names and signatures, and the [assembly handoff](../handoff/ASM-ClassicalSerreModularity.md) collects every supplier request and restructuring proposal.

## Scope, neighbours and ownership

The base field is ℚ and the representation has dimension two. Conductor one means unramified outside the residual prime; it permits ramification at that prime in a characteristic-zero lift. Qualitative modularity asserts some eigenform of weight at least two, without the optimized conductor or Serre weight. The weight-one Artin consequence is a separate export. Higher rank, other base fields, the general construction of attached representations, local classifications, deformation theory and lifting theorems belong to their suppliers.

| Supplier or consumer | Boundary of this roadmap |
| --- | --- |
| [Arithmetic Galois Representations](../../../content/campaign/ArithmeticGaloisRepresentations/README.md), R01 | Supplies Galois representations, inertia, conductor, coefficient changes, Dickson classification and its dyadic refinement. R27.1 records their good-dihedral application. |
| [Global Galois Deformations](../../../content/campaign/GlobalGaloisDeformations/README.md), R04; [Local Galois Deformation Rings](../../../content/campaign/LocalGaloisDeformationRings/README.md), R08 | Own presentation and local-ring results. R26 verifies the hypotheses of the prescribed-lift applications. |
| [Finite Flat Groups and Integral p-adic Hodge Theory](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md), R07; [Algebraic Modular Forms and Serre Weights](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md), R15 | R07.5 owns the integral Breuil–Mézard/Savitt classification. R15 owns Serre’s local weight recipe, finite-flat weight-two comparison and “arises from”. A weight recipe cannot replace the integral classification. |
| [GL₂ Automorphic Representations and Transfer](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md), R17 | Owns Langlands–Tunnell, Rohrlich–Tunnell and the solvable or dihedral modularity inputs. |
| [Serre Weight and Level Optimisation](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md), R20 | Owns weight/level/character optimization and the dyadic multiplicity-one obstruction. The application supplying the scalar dyadic case is R27.4 here. |
| [Ordinary Automorphic Forms and Modularity Lifting](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md), R21; [GL₂ Modularity Lifting](../../../content/campaign/GL2ModularityLifting/README.md), R22/R32 | Supply ordinary, potentially Barsotti–Tate and modern de Rham lifting with their actual residual restriction and local hypotheses. R32.6 owns the unresolved globalisation audit. |
| [Potential Modularity and Compatible Systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md), R24 | Owns lift and system existence, residual-member invariants and linked-system modularity transfer. Every change of prime here checks those contracts. |
| [Small Ramification and Abelian Variety Base Cases](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md), R25 | Owns Tate–Serre, Fontaine/Schoof exclusions, GL₂-type realizations and terminal case tables. The present roadmap applies them with dimension, reduction set and local type checked. |
| [Tau Ceti Chebotarev](../../../content/tau-ceti/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev) | Supplies density and infinitude after the consumer exhibits a nonempty compatible Frobenius class. CH-L08 does not supply the inertial type, its order or lifting. |
| [Elliptic Curve Modularity](../../../content/campaign/EllipticCurveModularity/README.md), R29; [Modularity and Langlands Extensions](../../../content/campaign/ModularityAndLanglandsExtensions/README.md), ML.1 | Consume the finite-flat weight-two and odd-Artin weight-one exports respectively. The latter’s early descent input is requested by its own contract, without importing its consumer in reverse. |

The accepted RS-06 component assignments govern these boundaries. The remaining R27.1 stage split is a maintainer action: its inherited R26.6 requirement contradicts the intended early good-dihedral package. At declaration level the early definition, image lemma and prime choice do not depend on R26. Their stable identifiers are retained here. The modern dyadic consumers use the exact R01.4 Dickson component rather than the mixed R27.1 modularity/weight alias. No new stage identifiers or atlas edges are installed by this assembly.

## Conventions and existing carriers

Write G_ℚ for Gal(ℚ̄/ℚ), with its Krull topology. Residual representations are continuous homomorphisms to GL₂ over a finite field of characteristic p, or over its algebraic closure after a chosen scalar extension. Oddness is det ρ̄(c)=−1 for complex conjugation; in characteristic two it is automatic. Irreducibility over an algebraically closed coefficient field is absolute irreducibility. Lemma 8.2 has the stricter **𝔽_p-rational** coefficient hypothesis, retained in its signature and Chebotarev argument.

N(ρ̄) is the positive prime-to-p Artin conductor, k(ρ̄) Serre’s weight, and ε(ρ̄) the finite-order character in det ρ̄=ε(ρ̄)χ̄_p^(k(ρ̄)−1). A fixed embedding ℚ̄→ℚ̄_p, integral lattice and coefficient prime are part of “arises from”. Passages between coefficient fields preserve that convention. A newform’s characteristic-zero nebentypus reducing to 1 need not itself be trivial; the finite-flat export uses Carayol at p≥5 to obtain trivial nebentypus.

In Khare’s recursion, p₀ (also written p_n in source statements) is the previous characteristic bound, P=P_{n+1} the chosen larger non-Fermat prime, ℓ the foil coefficient prime, and j the tame exponent. The variable e is the exponent in ℓ^e∥P−1. In KW’s hypotheses r counts odd conductor primes or bounds the dyadic conductor valuation; it is independent of e. In the modern local construction q is the coefficient characteristic and N is an **auxiliary rational prime**, not N(ρ̄). These source-local variable names are kept in the declarations below. Always distinguish inertia I_N, decomposition group D_N and their projective images.

Q(n) is the existing Nat.maxPrimeFac: Q(1)=1, and for n>1 it is the greatest prime divisor. π(x) is Nat.primeCounting of the natural floor of x, counting primes ≤x. The old printed uniform Chebyshev bound is not used. The next-prime constant printed with a repeating decimal bar is exactly 22/15. Compatible systems have a fixed Weil–Deligne support, while each member may also ramify at its own coefficient prime. Irreducibility of every characteristic-zero member never implies irreducibility of its residual reduction.

The [reviewed library audit](../../../data/library-coverage.json), AUDIT-31, finds the endpoint statements and proof machinery absent. It recognizes existing modular/newform and abelian-variety carriers, and partial prime-estimate infrastructure. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the following statements were checked directly:

| Existing declaration | Exact contribution |
| --- | --- |
| Matrix.GeneralLinearGroup | Units in the ring of square matrices; reuse it for GL₂. |
| Field.absoluteGaloisGroup | Automorphisms of the algebraic closure over the base field, with Krull topology; reuse the group. The arithmetic residual-modularity interface is still missing. |
| Nat.maxPrimeFac, Nat.maxPrimeFac_one | Greatest prime divisor for n>1, defaults 0 and 1 at 0 and 1. |
| Nat.isGreatest_maxPrimeFac | For 1<n, Q(n) is prime, divides n and bounds every prime divisor. |
| Nat.maxPrimeFac_mul, Nat.maxPrimeFac_pow | Q(mn)=max(Q(m),Q(n)) requires m,n≠0; Q(n^e)=Q(n) requires e≠0. |
| Nat.primeCounting | Counts primes ≤n, as the strict count at n+1. |
| Nat.exists_prime_lt_and_le_two_mul | For n≠0, a prime q with n<q≤2n. It does not supply the sharper recursion inequality. |
| MonoidAlgebra.Submodule.exists_isCompl | For a field, a finite group and invertible group order in the field, every group-algebra submodule has a complement. This is semisimplicity, not irreducibility of a chosen reduction. |
| ModularForm and CuspForm | Existing analytic modular-form carriers; attached Galois representations and residual modularity require suppliers. |

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, HeckeRing.GL2.Newform has level and integral weight parameters and an inherited character field χ, newness and normalization by a₁=1. Its existing coefficient infrastructure does not provide the residual Galois representation. AbelianVariety is an existing proper geometrically integral group scheme over a field; GL₂-type realization, reduction control and Schoof’s exclusion are additional supplier theorems. None of these carriers is planned again.

## Sources and edition discipline

The declarations use the parts’ recorded primary-source versions and their locators. A source ID identifies the edition listed below; aliases are consolidated when the URL is the same. The short matching excerpts and full version hashes remain in the packets. This assembly does not turn an author preprint’s page or theorem number into a published number.

Khare’s arXiv v1 has Propositions 2.1, 2.2 and 3.1; KW’s corrected prime-conductor argument cites Theorems 5.1 and 6.1 of the published Duke paper, whose numbering was not reconciled. KW’s Annals paper has its own published numbering. Savitt’s corrected v3, including the semisimplification qualification in Remark 6.17, is the operative version. Breuil–Mézard Proposition 6.1.1 has been obtained in the recorded author copy; its missing calculation details remain an integral-classification supplier obligation. Skinner’s unpublished CM-dihedral correction and the early weight-one descent references remain explicit source gaps.

- **khare-level-one**: [On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p](https://arxiv.org/pdf/math/0504080v1). arXiv:math/0504080v1, 5 April 2005. This is the preprint of the paper published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557-589, under a different title. Locators give the preprint's own page numbers
- **kw-serre-modularity-I**: [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Author's preprint (results.pdf) of the paper published as Invent. Math. 178 (2009), 485-504. Locators give the preprint's own running page numbers (2-21), which are NOT the Invent. Math. pages
- **bockle-appendix-2003**: [Appendix 1: On the isomorphism R_empty -> T_empty](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf). Appendix to Chandrashekhar Khare, 'On isomorphisms between deformation rings and Hecke rings', Invent. Math. 154 (2003). Locators give that file's own page numbers 1-7 (mathematics pp.1–6, references p.7)
- **savitt-cdt**: [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327v3). arXiv:math/0404327v3, 15 September 2010; corrected author version of Duke Math. J. 128 (2005)
- **dp-serre, dieulefait-pacetti**: [A simplified proof of Serre’s conjecture](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2, 3 May 2022
- **ribet-semistable**: [Images of semistable Galois representations](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf). Pacific J. Math. 1997, special issue, 277–297
- **rosser-schoenfeld**: [Approximate formulas for some functions of prime numbers](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf). Illinois J. Math. 6 (1962), 64–94; scan of published article
- **bcdt-modularity**: [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf). Breuil author copy, 80 PDF pages; Introduction printed pp.1–2 corresponds to published pp.843–845
- **kw-annals, kw-annals-2009**: [On Serre’s conjecture for 2-dimensional mod p representations of Gal(Qbar/Q)](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf). Annals of Mathematics 169 (2009), 229–253
- **breuil-mezard**: [Multiplicités modulaires et représentations de GL₂(ℤ_p) et de Gal(ℚ̄_p/ℚ_p) en ℓ=p](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf). Author copy, 82 PDF pages; Duke Mathematical Journal 115 (2002), 205–310. Locators use the author copy’s running page numbers, not Duke pagination.
- **serre87-duke**: [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf). Duke Math. J. 54 (1987), 179–230, scan with an OCR text layer. Locators give printed pages

## Layer overview

The following order presents the level-one seed, classical induction and modern proof in turn. The early R27.1 declarations are shared; the stable prime-choice and insertion nodes owned by the second packet are presented before its conductor induction.

| Layer | Purpose | Declaration nodes / planets |
| --- | --- | --- |
| [R26.1](#r26-1) | Level-one target and deformation contracts | 3 / 1 |
| [R26.2](#r26-2) | Lifts, tame nebentypus and compatible systems | 5 / 2 |
| [R26.3](#r26-3) | Prime estimates and the weight recursion | 7 / 1 |
| [R26.4](#r26-4) | Ordinary and degenerate lifting branches | 4 / 0 |
| [R26.5](#r26-5) | The terminal weights through 32 | 7 / 0 |
| [R26.6](#r26-6) | Level-one assembly and the initial conductor case | 4 / 1 |
| [R27.1](#r27-1) | The shared good-dihedral package | 5 / 2 |
| [R27.2](#r27-2) | The induction hypotheses and weight reduction | 3 / 1 |
| [R27.3](#r27-3) | Killing ramification and the double induction | 4 / 3 |
| [R27.4](#r27-4) | Removing good-dihedral hypotheses and refining modularity | 4 / 3 |
| [R27.5](#r27-5) | The dyadic closure | 4 / 1 |
| [R27.6](#r27-6) | The strong theorem and its exports | 8 / 3 |
| [R33.1](#r33-1) | Modern lifting inputs and the first weight change | 5 / 2 |
| [R33.2](#r33-2) | The prescribed good-dihedral type and removal of odd level | 4 / 2 |
| [R33.3](#r33-3) | Changing the dyadic type and removing the auxiliary prime | 4 / 3 |
| [R33.4](#r33-4) | The terminal characteristic-five argument | 2 / 2 |
| [R33.5](#r33-5) | Characteristic two and the qualitative endpoint | 4 / 2 |
| [R33.6](#r33-6) | The common strong statement from the modern proof | 4 / 1 |

The classical dependency chain is the level-one theorem → the prime-power-inertia corollary → (W₁) → alternating weight reduction and killing ramification → good-dihedral removal → dyadic closure → the strong statement. The modern chain is weight-two system → prescribed good-dihedral type → removal of odd level → dyadic type change → removal of the auxiliary prime → characteristic-five terminal case → odd qualitative theorem → characteristic-two qualitative theorem → conditional strong refinement. Its qualitative chain has no R26 or R27.2–R27.6 declaration prerequisite. The final refinement calls R27.4/strong-form-by-minimal-lifts alone among those later classical nodes.

## I. Level one and the shared good-dihedral interface

The level-one argument owns the weight recursion and its numerical support. The deformation-ring, local-type and compatible-system statements below are application contracts for external owners. The full solvable and bad-dihedral branch checks accompany each terminal row.


<a id="r26-1"></a>

### R26.1. Level-one target and deformation contracts

State the precise level-one target and the prime-conductor corollary. Verify the hypotheses under which the external deformation-ring results apply; their construction stays in R04 and R24.

<a id="r26-1-level-one-theorem-and-the-meaning-of-arises-from"></a>

#### Khare's level-one theorem, with the exact sense of 'arises from'

Identifier: `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`. Kind: theorem. Planet: **Khare's level-one theorem**.

Let ρ̄: G_Q -> GL_2(F) be continuous, absolutely irreducible, two-dimensional, odd (det ρ̄(c) = -1), with F a finite field of characteristic p, and suppose ρ̄ is unramified outside p, i.e. N(ρ̄) = 1. Then ρ̄ arises from S_{k(ρ̄)}(SL_2(Z)) with respect to an embedding iota: Qbar -> Qbar_p. 'Arises from a newform f' means: there is an integral model ρ: G_Q -> GL_2(O) of the p-adic representation rho_f attached to f, with O the ring of integers of a finite extension of Q_p, such that ρ̄ is isomorphic to the reduction of ρ modulo the maximal ideal of O. The weight is Serre's k(ρ̄) and the level is N(ρ̄) = 1; conductor one does not assert that the p-adic lift is unramified at p.

**Hypotheses and scope.**

- p is odd throughout the proof; the cases p = 2 and p = 3 of the level-one statement are due to Tate and to Serre respectively and are cited, not reproved
- the theorem is for GL_2 over Q; no analogue for other base fields or higher rank is claimed
- the embedding iota_p: Qbar -> Qbar_p is fixed in advance and the statement is relative to it
- the modularity lifting inputs used are restricted: either the p-adic lift is crystalline at p of weight k <= p+1 (ordinary when the weight is p+1), or it is of Hodge-Tate weights (1,0) and Barsotti-Tate over Q_p(mu_p)

**Proof obligations.**

- Khare uses the inductive method proposed in Theorem 5.1 of the joint Annals paper, and adds a new 'weight reduction' technique that changes the inductive step.
- He uses the results of the Annals paper for weights 2, 4, 6, and after that proves the level-one case without further appeal to classification results for abelian varieties; the only such input that remains is the nonexistence of a semistable abelian variety over Q with good reduction outside 5 (Fontaine, Schoof, Brumer-Kramer).
- Taylor's potential modularity and Bockle's deformation-theoretic appendix result are used to construct the minimal and non-minimal lifts; Dieulefait's and Wintenberger's arguments refine them into compatible systems.
- At changes of prime separate reducible, irreducible bad-dihedral, and cyclotomically absolutely irreducible solvable residuals. The first two use ordinary distinguished lifting (with the recorded CM correction gap); the last uses solvable residual modularity and the appropriate R22 lifting theorem. Breuil–Mézard/Savitt supply local ordinarity only for the specified reducible tame type, not from solvability alone.
- Kisin's potentially Barsotti-Tate theorem is used only when the p-adic lift is locally at p Barsotti-Tate over Q_p(mu_p).

**Acceptance.**

- Check the p = 2 and p = 3 level-one cases separately against Tate's and Serre's arguments rather than inheriting them from the odd-p induction
- Check that the produced newform has weight exactly k(ρ̄) and level exactly 1, and that the isomorphism is with the residual semisimplification for the chosen prime of O

**Prerequisites.** [R26.6/level-one-proof-assembly](#r26-6-level-one-proof-assembly); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), p. 2 of the preprint. Theorem 1.1.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §1.1, p. 2 of the preprint. p = 2, 3 are Tate's and Serre's.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. The meaning of 'arises from'.
- [bcdt-modularity](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf), Introduction, author-copy p.2 (published pp.844–845). Modularity versus exact Serre-weight/level modularity; canonical notions are owned by R15/R19 and optimisation by R20.

<a id="r26-1-corollary-1-2-conductor-a-prime-and-its-corrected-proof"></a>

#### Corollary 1.2 (conductor a prime, weight 2) and the correction of its proof in KW I

Identifier: `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`. Kind: theorem.

Khare's Corollary 1.2: if ρ̄ is an irreducible, odd, 2-dimensional mod p representation of G_Q with k(ρ̄) = 2 and N(ρ̄) = q a prime, and p > 2, then it arises from S_2(Gamma_1(q)). KW I restate this as Corollary 8.1(i) WITHOUT the hypothesis p > 2 ('Note that p = 2 is included'), treating q = 2 by the earlier Annals paper, and explicitly correct the reference given for the proof: 'the reference to 3 of Theorem 5.1 of [24] is not enough as p may not divide q-1'. The corrected argument uses Theorem 5.1(1) to build an almost strictly compatible weight-2 system with unramified Weil-Deligne parameter away from q and with rho_p minimal at q; at a place above q the Weil-Deligne parameter r_q is either semistable with nontrivial monodromy (so rho_q is semistable of weight 2) or unramified after restriction to Q_q(mu_q) (so rho_q is geometric of weight 2, crystalline over Q_q(mu_q)); the level-one theorem gives modularity of ρ̄_q, possibly reducible, and then part (2) of Theorem 6.1 of [24] - Khare's level-one paper in its published Duke numbering, NOT the Annals paper - concludes, with its Skinner-Wiles references [39], [40] augmented by the correction [41]. The semistable case uses [36] = T. Saito, Modular forms and p-adic Hodge theory, and the other case the proof of Theorem 5.1(3 ii) of [24].

**Hypotheses and scope.**

- ρ̄ irreducible and odd with k(ρ̄) = 2 and N(ρ̄) = q prime
- Khare's version additionally assumes p > 2; KW I's Corollary 8.1(i) does not, and its proof imports the case q = 2 from [22] = the KW Annals paper
- one may assume the projective image of ρ̄ is not dihedral; otherwise KW I Lemma 6.2 applies directly
- the final step uses (2) of Theorem 6.1 of [24] = Khare, Duke Math. J. 134 (2006); the copy of [24] read here is the arXiv v1 preprint, which has no Theorem 5.1 or 6.1 (its compatible-system result is Proposition 3.1), so these corrected references cannot be resolved from it
- KW I's [41] is C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'; listed as a 2009 preprint by Allen, arXiv:1301.1113), which KW I call a correction to Skinner–Wiles 2001 ([40]); it is unpublished and was not read (a gap), and it concerns the dihedral case of OrdinaryAutomorphicFormsAndModularityLifting/E11

**Proof obligations.**

- Reduce to non-dihedral projective image via Lemma 6.2.
- Build the compatible system by Theorem 5.1(1): weight 2, unramified Weil-Deligne parameter away from q, rho_p a minimal lift at q.
- Split on the shape of r_q: semistable with nontrivial monodromy, or unramified after restriction to Q_q(mu_q).
- Use the level-one theorem to get modularity of ρ̄_q (which may be reducible), and apply (2) of Theorem 6.1 of [24] (Khare, Duke numbering; references to Skinner-Wiles augmented by Skinner's correction [41]) to rho_q; the semistable weight-2 property of rho_q comes from T. Saito [36].
- Transfer modularity back along the compatible system.

**Acceptance.**

- Check the case p | q-1 versus p not dividing q-1 separately, since this is exactly where Khare's original reference fails
- Check that the conclusion is a form in S_2(Gamma_1(q)) with the correct nebentype, not merely S_2(Gamma_0(q))

**Prerequisites.** [R26.6/corollary-1-2-proof](#r26-6-corollary-1-2-proof); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), p. 3 of the preprint. Corollary 1.2 (with p > 2).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.3, proof of Corollary 8.1, p. 16 of the preprint. KW I's corrected reference.
- [kw-annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf), Published Definition4.1, Theorem4.2(ii), pp.243–244; Theorem5.2(ii), p.247; §6.2, pp.250–251 (older cited Theorem4.1(ii)/§5.2). The q=2 case first needs the conductor-one-at-2 ⇒ unipotent local inference. Annals Theorem5.2(ii) then excludes this semistable weight-two case; its abelian-variety proof imports Schoof through R25, not an arbitrary conductor-two theorem from R25.

<a id="r26-1-bockle-appendix-minimal-deformation-ring-presentation"></a>

#### Böckle's appendix as Khare uses it: the application contract

Identifier: `ClassicalSerreModularity:R26.1/bockle-appendix-minimal-deformation-ring-presentation`. Kind: theorem.

Khare's level-one argument applies Böckle's appendix to the minimal deformation ring R_∅ and to R_Q^{α-new}, and this node records exactly what must be verified for that application. The presentation (Proposition 1), Lemma 2 (finite with no more relations than variables gives a finite flat complete intersection) and Theorem 1 (an auxiliary R_Q ≅ T_Q gives R_∅ ≅ T_∅) are PotentialModularityAndCompatibleSystems R24.3/bockle-presentation, /finite-presentation-complete-intersection and /bockle-minimal-r-equals-t, with the generic presentation at GlobalGaloisDeformations R04.3. The contract: (i) ρ̄ is odd (used once, in the Euler-characteristic count); (ii) Corollary 1 — Δ_ℓ = 0 in the four cases used: no ramification allowed at ℓ, no condition at ℓ, the minimal condition at a prime where ρ̄ ramifies, and the Q-new condition at a prime of Q (where R_{X,ℓ} = 𝒪⟦T⟧, implicitly shown by Ramakrishna); at p, Δ_p = 0 for finite or Selmer conditions (Darmon–Diamond–Taylor §2) except when ρ̄|_{G_p} is decomposable and flat, where Lemma 1 (after Ramakrishna's thesis) gives R = W(k)⟦X₁, X₂⟧; (iii) Corollary 2: R_Q finite over 𝒪 makes R_∅ a finite flat complete intersection; (iv) Theorem 1 needs T_Q reduced (the choice of Q) and Carayol's conductor theorem. The statement is a contract, not a second proof of the appendix.

**Hypotheses and scope.**

- d and Ad_X(ρ) are tied to whether X fixes a determinant: d = 0 and Ad_X = Ad^0 if the determinant is fixed, otherwise d = 1 and Ad_X = Ad
- Proposition 1's proof uses that ρ is ODD, through the formula of [1], Lem. 5.5(ii); oddness is not decorative here
- Theorem 1's proof needs T_Q and T_empty finite flat over W(k) ('standard fact') and reduced - T_Q by the choice of Q - and uses Carayol [3] (Ann. ENS 1986) to conclude that a newform unramified at the primes of Q has conductor prime to Q
- the case where ρ restricted to a decomposition group at p is decomposable and flat is NOT covered by the generic computation Delta_p = 0 and is handled by a separate Lemma 1 following Ramakrishna's thesis
- RS-06 moves the generic presentation to GlobalGaloisDeformations R04.3 and the prescribed-lift application to PotentialModularityAndCompatibleSystems R24.3; this node keeps its id and the contract (checkpoint 2)

**Proof obligations.**

- Verify (i)–(iv) for Khare's minimal and Q-new conditions, case by case as in Corollary 1 and Lemma 1.
- Apply PotentialModularityAndCompatibleSystems R24.3/bockle-presentation, /finite-presentation-complete-intersection and /bockle-minimal-r-equals-t.
- Lemma 1 (decomposable flat at p): the flat lifts of determinant ε are reducible (Conrad), the tangent space has dimension 2, and a rigid-analytic fibre argument shows the ideal of relations is 0.

**Acceptance.**

- Check that the oddness of ρ is used exactly once, in the dimension count of Proposition 1, and that removing it breaks n + Delta = j
- Check the excluded decomposable-and-flat case at p against Lemma 1 rather than assuming Delta_p = 0 uniformly

**Prerequisites.** [PotentialModularityAndCompatibleSystems:R24.3/bockle-presentation](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/bockle-minimal-r-equals-t](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GlobalGaloisDeformations:R04.3/local-to-global-presentation](../../../content/campaign/GlobalGaloisDeformations/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [bockle-appendix-2003](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf), p. 1. Theorem 1.
- [bockle-appendix-2003](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf), p. 2. Proposition 1.
- [bockle-appendix-2003](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf), proof of Proposition 1, p. 2. Oddness in the proof.

<a id="r26-2"></a>

### R26.2. Lifts, tame nebentypus and compatible systems

Record each lift with determinant, ramification and local type. Distinguish a system’s fixed Weil–Deligne support from the ramification permitted at a member’s own coefficient prime.

<a id="r26-2-lifting-method-flatness"></a>

#### Flatness of the deformation rings of prescribed lifts

Identifier: `ClassicalSerreModularity:R26.2/lifting-method-flatness`. Kind: lemma.

(Khare §2.1, after KW Annals §2.) Let p be odd, ρ̄ : G_ℚ → GL₂(F) odd irreducible with non-solvable image, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p, and let R be the global deformation ring of lifts with fixed determinant, unramified outside a fixed finite set, with prescribed local conditions. If (a) each local ring R_ℓ (ℓ ≠ p) is a flat complete intersection over 𝒪 of relative dimension h⁰(D_ℓ, Ad⁰ρ̄) and R_p one of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1, and (b) R/(π) is finite, then R is finite flat and a complete intersection over 𝒪; in particular ρ̄ has a lift of the prescribed type. Finiteness of R/(π) follows from finiteness of R_F/(π) for a totally real Galois F of even degree over which ρ̄|_{G_F} is modular by a suitable cuspidal π (Taylor), through R_F ≅ T_F (KW Annals Lemma 2.4).

**Hypotheses and scope.**

- Non-solvable image of ρ̄ (so ρ̄|_{G_F} has non-solvable image for totally real F); k(ρ̄) ≠ p; for p = 3 an auxiliary prime handles non-neatness.

**Proof obligations.**

- Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
- Böckle's Proposition 1 turns the local dimension counts into a presentation 𝒪[[X_1, …, X_r]]/(f_1, …, f_s) with s ≤ r.
- Taylor's potential modularity gives F and π; R_F ≅ T_F (Fujiwara / Taylor §3) makes R_F finite over 𝒪; the orders of ρ_R(I_ℓ) and ρ̄(I_ℓ) agree for the prescribed lifts, so ρ_R|_{G_F} specialises ρ_{R_F} and R/(π) is finite (KW Annals Lemma 2.4).
- A finite 𝒪-algebra with a presentation by at most r relations in r variables is a flat complete intersection.

**Acceptance.**

- Existence of a lift comes from flatness, not from an explicit construction.

**Prerequisites.** [R26.1/bockle-appendix-minimal-deformation-ring-presentation](#r26-1-bockle-appendix-minimal-deformation-ring-presentation); [PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.1](../../../content/campaign/GL2ModularityLifting/README.md); [PotentialModularityAndCompatibleSystems:R24.3/required-lift-types](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §2.1, p. 8 of the preprint. §2.1.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §2.1, p. 11 of the preprint. The local criterion.

<a id="r26-2-minimal-weight-two-lift"></a>

#### Minimal weight-two lifts of ordinary residual representations

Identifier: `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`. Kind: theorem.

(Proposition 2.1.) Let p > 3 and ρ̄ odd absolutely irreducible with 2 ≤ k(ρ̄) ≤ p + 1, k(ρ̄) ≠ p, ordinary at p. Then ρ̄ has a lift ρ minimal of weight 2: minimal at every ℓ ≠ p, with determinant εω_p^{k(ρ̄)−2}χ_p, and ρ|_{I_p} ≅ (ω_p^{k−2}χ_p *; 0 1) when ρ̄|_{I_p} ≅ (χ̄_p^{k−1} *; 0 1), Barsotti–Tate when k(ρ̄) = 2. In the conductor-one induction the k=p+1 endpoint uses the semistable weight-two branch; for 2<k<p+1 the tame character ω_p^(k−2) is nontrivial and the lift becomes Barsotti–Tate over Q_p(μ_p).

**Hypotheses and scope.**

- p > 3; odd absolutely irreducible residual representation, ordinary at p; 2≤k≤p+1 and k≠p. The later level-one application further assumes N=1.

**Proof obligations.**

- Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
- Solvable image: Serre's conjecture is known in its refined form, and a mod p ordinary eigenform of weight k(ρ̄) also arises in S₂(Γ₁(N) ∩ Γ₀(p), ω^{k(ρ̄)−2}) (Gross, Edixhoven).
- Otherwise apply lifting-method-flatness: the local ring R_p of lifts of the given ordinary shape with fixed determinant (Barsotti–Tate if k(ρ̄) = 2) is smooth of relative dimension 1 + h⁰(D_p, Ad⁰ρ̄) (Taylor E3–E4; LocalGaloisDeformationRings R08.6).

**Acceptance.**

- Retain the k=2 Barsotti–Tate condition, the conductor-one k=p+1 semistable branch, and the nontrivial tame nebentype for 2<k<p+1; trivial finite-order nebentype alone does not distinguish crystalline from semistable.

**Prerequisites.** [R26.2/lifting-method-flatness](#r26-2-lifting-method-flatness); [LocalGaloisDeformationRings:R08.6](../../../content/campaign/LocalGaloisDeformationRings/README.md); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [PotentialModularityAndCompatibleSystems:R24.3/required-lift-types](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.6](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §2.2, p. 12 of the preprint. Proposition 2.1.

<a id="r26-2-local-ring-at-q-smooth"></a>

#### The local lifting ring at a prime with prescribed nebentypus is smooth

Identifier: `ClassicalSerreModularity:R26.2/local-ring-at-q-smooth`. Kind: lemma.

(Khare §2.3, with Böckle's calculation.) Let p and q be distinct odd primes with p^r ∥ q − 1 (r > 0), ρ̄|_{I_q} ≅ (χ̄ *; 0 1) ramified, χ̄ a mod p character of Gal(ℚ_q(μ_q)/ℚ_q) with Teichmüller lift χ, η_q = ω_q^{(q−1)/p^r}. The versal ring R_q of lifts of ρ̄|_{D_q} with determinant εχ_p^{k(ρ̄)−1}η_q^i and ρ|_{I_q} ≅ (χη_q^i *; 0 1) is smooth over 𝒪 of relative dimension h⁰(D_q, Ad⁰ρ̄) = 1.

**Hypotheses and scope.**

- p and q are distinct odd primes; r>0 and p^r exactly divides q−1; ρ̄ is ramified at q with the displayed triangular inertial shape; enlarge the coefficient DVR 𝒪 to contain χ and η_q.

**Proof obligations.**

- The mod π tangent space has dimension 1 (Wiles' minimal-lift computations).
- Infinitely many 𝒪-valued lifts: lifts are tame, given by images A of σ_q and B of τ_q with AB A^{−1} = B^q. If χ ≠ 1 take diagonal lifts. If χ = 1 and χ′ = η_q^i ≠ 1, with ρ̄(σ) = (r_F b; 0 r_F), ρ̄(τ) = (1 1; 0 1), seek A = (α γ; 0 β), B = (χ′(τ) 1; 0 1); since B has order dividing q − 1, the relation is AB = BA, i.e. α − β = γ(χ′(τ) − 1); with αβ = ψ this gives β² + βγ(χ′(τ) − 1) − ψ = 0 (the printed minus is E13). The derivative reduces to 2r_F, a unit because p is odd and the residual Frobenius eigenvalue r_F is nonzero; Hensel gives a unique β ≡ r_F for each γ ≡ b: a one-parameter family.
- If χ′ = 1 this is Taylor's E3.

**Acceptance.**

- The only case with non-abelian local image is χ = χ′ = 1.

**Prerequisites.** [LocalGaloisDeformationRings:R08.2](../../../content/campaign/LocalGaloisDeformationRings/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), proof of Proposition 2.2, p. 15 of the preprint. The printed quadratic has a sign misprint (E13). Its preceding commutation and determinant relations yield the corrected plus sign; the Hensel derivative and smoothness conclusion are unchanged.

<a id="r26-2-nebentype-lift-at-q"></a>

#### Lifts with prescribed nebentypus at an auxiliary prime

Identifier: `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`. Kind: theorem. Planet: **Lifts with prescribed nebentypus**.

(Proposition 2.2.) Let p be odd, ρ̄ odd irreducible with non-solvable image, 2 ≤ k(ρ̄) ≤ p + 1, k(ρ̄) ≠ p, with ρ̄|_{I_q} as in local-ring-at-q-smooth. For every integer i there is a lift ρ of determinant εχ_p^{k(ρ̄)−1}η_q^i, minimal outside p, q, crystalline of weight k(ρ̄) at p, with ρ|_{I_q} ≅ (χη_q^i *; 0 1) (nebentypus χη_q^i at q).

**Hypotheses and scope.**

- Non-solvable image; used only for k(ρ̄) = 2, ρ̄ unramified outside p, q, and nontrivial nebentypus.

**Proof obligations.**

- Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
- R_p (crystalline of weight k(ρ̄), fixed determinant) is smooth of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1 (Ramakrishna, Taylor; KW Annals Prop. 2.3 for k = p + 1); R_q by local-ring-at-q-smooth; conclude by lifting-method-flatness.

**Acceptance.**

- The nebentypus can only be moved within the coset χ·⟨η_q⟩: j ≡ (exponent of χ) mod (q − 1)/p^r.

**Prerequisites.** [R26.2/lifting-method-flatness](#r26-2-lifting-method-flatness); [R26.2/local-ring-at-q-smooth](#r26-2-local-ring-at-q-smooth); [LocalGaloisDeformationRings:R08.3](../../../content/campaign/LocalGaloisDeformationRings/README.md); [PotentialModularityAndCompatibleSystems:R24.3/required-lift-types](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §2.3, p. 13 of the preprint. Proposition 2.2.

<a id="r26-2-compatible-system-lifts"></a>

#### Placing the lifts in compatible systems

Identifier: `ClassicalSerreModularity:R26.2/compatible-system-lifts`. Kind: theorem. Planet: **Compatible systems through potential modularity**.

(Proposition 3.1.) (i) For ρ̄ as in minimal-weight-two-lift (p > 3) and a minimal weight-2 lift ρ, there is a weakly compatible system (ρ_λ) over a number field E containing ρ at the place given by ι_p, such that ρ_λ at a place above ℓ > 2 unramified in ρ̄ is Barsotti–Tate at ℓ, unramified outside {ℓ}∪Ram(ρ̄), and has the same inertial Weil–Deligne parameter at p as ρ. (ii) For ρ̄ as in nebentype-lift-at-q with k(ρ̄) = 2 and nontrivial nebentypus χη_q^i = ω_q^j (1 ≤ j ≤ q − 2), there is such a system in which the member above q (via ι_q) is unramified outside {q}∪(Ram(ρ̄)\{p}), unramified at p, Barsotti–Tate over ℚ_q(μ_q) at q; if its residual representation has non-solvable image then its residual representation has weight j + 2, or its twist by χ_q^{−j} has weight q + 1 − j.

**Hypotheses and scope.**

- In (i), p>3 and the ordinary residual hypotheses of Proposition 2.1; at the new member ℓ>2 is unramified in ρ̄ (in particular ℓ≠p). In (ii), p is odd (p=3 allowed), the original ρ̄ has non-solvable image, k(ρ̄)=2 and the nebentypus at q is nontrivial. The last weight assertion additionally assumes that the new residual q-adic member has non-solvable image.

**Proof obligations.**

- Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
- Taylor's potential modularity over a Galois totally real F, Brauer induction 1_G = Σ n_i Ind χ_i over solvable Gal(F/F_i), and Arthur–Clozel base change give ρ = Σ n_i Ind(χ_i ⊗ ρ_{π_i}); the same virtual sum at other embeddings is a true representation (PotentialModularityAndCompatibleSystems R24.5–R24.6).
- (i): Taylor's F is unramified at p and the form is ordinary or Steinberg at p.
- (ii): over a solvable F″ completing to ℚ_q(μ_q), Barsotti–Tate by Breuil's theorem on finite flat reductions; level raising (Taylor [52]) to a form square-integrable at an auxiliary place; Saito [41] for the inertial parameter; Breuil–Mézard Prop. 6.1.1 and Savitt Thm 6.11 for the weights j + 2 or q + 1 − j.

**Acceptance.**

- The residual weight is determined only up to the twist: j + 2 or q + 1 − j.
- Ramification support for a member above ℓ always allows its own coefficient prime ℓ. The fixed Weil–Deligne support, rather than all member ramification sets literally, is independent of the coefficient prime.

**Prerequisites.** [R26.2/minimal-weight-two-lift](#r26-2-minimal-weight-two-lift); [R26.2/nebentype-lift-at-q](#r26-2-nebentype-lift-at-q); [PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6/residual-members](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/required-lift-types](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOneLifts; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §3, pp. 16–17 of the preprint. Proposition 3.1.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §3, p. 17 of the preprint. The weight statement.

<a id="r26-3"></a>

### R26.3. Prime estimates and the weight recursion

Separate the valid explicit prime-counting input, finite prime certificates, twisting interval and decreasing weight bound. The printed uniform Chebyshev estimate is replaced by the stated Rosser–Schoenfeld bounds.

<a id="r26-3-chebyshev-next-prime"></a>

#### Khare's prime estimate for the inductive step

Identifier: `ClassicalSerreModularity:R26.3/chebyshev-next-prime`. Kind: lemma.

(Khare §4.) For every prime p_n ≥ 31 there are a prime P_{n+1} > p_n, not a Fermat prime (P_{n+1} = p_{n+1}, or p_{n+2} when p_{n+1} is a Fermat prime), and an odd prime power ℓ^r = 2m + 1 exactly dividing P_{n+1} − 1 with P_{n+1}/p_n ≤ (2m + 1)/(m + 1) − (m/(m + 1))(1/p_n) (1). This is the shared odd-prime estimate imported by KW I §7 case (i); write its exponent e, distinct from KW’s conductor-count parameter r. The finite range also supplies p=5,7,11,13,17,19,23,29.

**Hypotheses and scope.**

- p_n ≥ 31; the verification for 31 ≤ p_n ≤ 21591 is a finite check (with P = 263 after p_n = 251, since 257 is Fermat).

**Proof obligations.**

- Use finite-auxiliary-prime-checks for p≤21591.
- For p≥21591, next-prime-ratio gives P/p<1499/1000≤3/2−1/p; for m≥1 the right side of (1) is at least 3/2−1/p.
- Since P is not Fermat, P−1 has a nontrivial exact odd prime-power divisor ℓ^e. For the finite range the certificate checks ℓ≤p. In the asymptotic range P<3p/2<2p, and every odd factor ℓ of the even integer P−1 is at most (P−1)/2<p, including after a Fermat skip.
- The supplied Chebyshev bound is false as a uniform π(x) bound; use the corrected explicit-prime-counting-input.

**Acceptance.**

- R26.3 owns the shared odd estimate; R27.2 imports it and owns only its dyadic arithmetic application. Certify the finite range and the replacement Rosser–Schoenfeld derivation rather than the false uniform Chebyshev π bound.

**Prerequisites.** [R26.3/next-prime-ratio](#r26-3-next-prime-ratio); [R26.3/finite-auxiliary-prime-checks](#r26-3-finite-auxiliary-prime-checks).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §4, p. 19 of the preprint. §4.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §4, p. 20 of the preprint. The conclusion.

<a id="r26-3-serre-weight-twist"></a>

#### Twisting the Serre weight

Identifier: `ClassicalSerreModularity:R26.3/serre-weight-twist`. Kind: lemma.

(Lemma 5.2.) Let τ : G_{ℚ_p} → GL₂(F) have Serre weight k ≠ 2 with k < p. If τ is irreducible and k − 1 = p − k′ (k′ ≥ 0), then τ ⊗ χ̄_p^{k′} has weight k′ + 2 = p + 3 − k; if τ|_{I_p} is split, τ ⊗ χ̄_p^{1−k} has weight p + 1 − k.

**Proof obligations.**

- Immediate from Serre's recipe for k(ρ̄) (AlgebraicModularFormsAndSerreWeights R15.6).

**Acceptance.**

- Used to assume ρ̄ ordinary at p once all weights ≤ p_n + 1 are known.

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §5, p. 21 of the preprint. Lemma 5.2.

<a id="r26-3-weight-interval-containment"></a>

#### The new residual weights fall into the known range

Identifier: `ClassicalSerreModularity:R26.3/weight-interval-containment`. Kind: lemma.

(Khare §6.2.) Let p = P_{n+1} and ℓ^r = 2m + 1 satisfy (1) of chebyshev-next-prime. For every integer j with m(p − 1)/(2m + 1) < j ≤ (m + 1)(p − 1)/(2m + 1), both j + 2 and p + 1 − j lie in [2, p_n + 1]; and the half-open interval contains exactly one element of each residue class modulo (p − 1)/ℓ^r, so a nebentypus χη_p^i with j in it can always be chosen.

**Hypotheses and scope.**

- p_n and P_{n+1} are odd primes with p_n≥31 and P_{n+1}>p_n; ℓ is odd prime, e≥1, ℓ^e=2m+1 exactly divides P_{n+1}−1, so m≥1 and L=(P_{n+1}−1)/ℓ^e is a positive integer. The auxiliary-prime inequality holds.

**Proof obligations.**

- (m + 1)(p − 1)/(2m + 1) + 2 ≤ p_n + 1 and p + 1 − m(p − 1)/(2m + 1) ≤ p_n + 1 are both equivalent to (m + 1)p ≤ (2m + 1)p_n − m, i.e. to (1). For the lower bounds use m≥1, P_{n+1}≥3 and the upper interval endpoint, which is at most P_{n+1}−1. These are mathematical proof obligations; the suggested Lean signatures have unproved placeholders.
- The interval is (mL,(m+1)L] with L a positive integer, so its L integer points give exactly one representative of each residue class modulo L. Choose the representative of the original tame exponent coset; do not choose j independently of that coset.

**Acceptance.**

- The upper end p + 1 − j < p + 1 − m(p − 1)/(2m + 1) is strict, so the bound (1) with ≤ suffices.

**Prerequisites.** [R26.3/chebyshev-next-prime](#r26-3-chebyshev-next-prime); [R26.2/nebentype-lift-at-q](#r26-2-nebentype-lift-at-q).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, p. 27 of the preprint. The containment.

<a id="r26-3-level-one-induction-scheme"></a>

#### The well-founded induction on the weight bound

Identifier: `ClassicalSerreModularity:R26.3/level-one-induction-scheme`. Kind: theorem. Planet: **Weight induction for level one**.

For B ≥ 2 let S(B) be: every odd irreducible ρ̄ : G_ℚ → GL₂(F̄_ℓ) (any ℓ) with N(ρ̄) = 1 and k(ρ̄) ≤ B is modular. Then S(32) holds (small-weights-table with the base cases), and S(p_n + 1) ⇒ S(P_{n+1} + 1) for the primes p_n ≥ 31 of chebyshev-next-prime. Every recursive appeal in the step is to a weight ≤ p_n + 1 (weight-interval-containment), to weight 2 at level one (excluded, so ρ̄ is reducible), or to solvable image (known); hence the induction is on the bound B, not on the prime, and terminates.

**Hypotheses and scope.**

- Corollary 5.5(i) transfers a fixed normalized weight k≤p+1 from characteristic p to q≥k−1. Corollary 5.5(ii) transfers all weights≤p+1 to every q only after the full level-one theorem in characteristic p is proved. A bounded assertion at an arbitrary single characteristic does not suffice.

**Proof obligations.**

- Measure: the weight bound B ∈ ℕ. The step at P = P_{n+1} treats weights p_n + 2 ≤ k ≤ P + 1 and calls S(p_n + 1) only (for ρ̄″ of weight j + 2 or P + 1 − j) and the two known classes.
- For the step first prove the full theorem in characteristic P: weights≤p_n+1 follow from S(p_n+1), and the new normalized weights are the ones treated by the step. Then invoke Corollary 5.5(ii) to export S(P+1) to every characteristic. Cyclotomic normalization and restoration are supplied by R15.4; the small-characteristic cases use Tate–Serre.
- Changing the prime (to the foil ℓ and back to P) does not change B, so it is not itself the decreasing measure.

**Acceptance.**

- This makes the stage's 'well-founded measure' explicit; Khare's text leaves it implicit.

**Prerequisites.** [R26.3/weight-interval-containment](#r26-3-weight-interval-containment); [R26.3/serre-weight-twist](#r26-3-serre-weight-twist); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [R26.5/small-weights-table](#r26-5-small-weights-table); [R26.4/ordinary-reduction-and-parity](#r26-4-ordinary-reduction-and-parity); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, p. 26 of the preprint. The inductive step.

<a id="r26-3-explicit-prime-counting-input"></a>

#### Explicit prime counting input and Khare’s Chebyshev comparison

Identifier: `ClassicalSerreModularity:R26.3/explicit-prime-counting-input`. Kind: lemma.

For real x≥17, π(x)>x/log x; for x>1, π(x)<1.25506 x/log x. For x≥67, π(x)>x/(log x−1/2), and for x>exp(3/2), π(x)<x/(log x−3/2). These are Rosser–Schoenfeld (3.3)–(3.6). Khare §4’s claimed uniform A x/log x≤π(x)≤B x/log x for x>30, A≈0.921 and B/A=6/5, is not used as a theorem: π(31)=11 violates its upper bound (E11). If such bounds hold on a specified range, the formal comparison with a>6/5 yields a next-prime bound when p>max(30,a^(6/(5a−6))); this conditional algebra does not repair the false uniform range.

**Hypotheses and scope.**

- For the four prime-counting bounds respectively: real x≥17; real x>1; real x≥67; real x>exp(3/2). Use π(x)=Nat.primeCounting(⌊x⌋₊).

**Proof obligations.**

- Import prime-counting and real logarithm infrastructure; prove the explicit inequalities by the Rosser–Schoenfeld analytic argument and its stated finite checks, with the unread proof boundary recorded as a gap.
- Compare lower π(ap) with upper π(p); a strict inequality produces a prime in (p,ap].
- Retain Khare’s B/A=6/5 calculation as a conditional source comparison with its range explicit.

**Acceptance.**

- π(31)=11 and π(100)=25 refute Khare’s stated upper bound; never feed it unconditionally into weight reduction.
- The strict prime-count inequalities are applied only above their exact thresholds.

**Prerequisites.** `mathlib:Nat.primeCounting`.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/PrimeEstimates; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [rosser-schoenfeld](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf), Theorem 2 and Corollary 1, p.69. The excerpt transcribes the displayed fractions into inline notation; Theorem 2 (3.5),(3.6) are on published p.69. Corollary 1 on the same page supplies the two sharper denominator bounds. All four exact domains were independently read.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §4, p.19. The advertised Chebyshev constants, corrected by E11.

<a id="r26-3-next-prime-ratio"></a>

#### Consecutive-prime ratio for the shared recursion

Identifier: `ClassicalSerreModularity:R26.3/next-prime-ratio`. Kind: lemma.

If p≥31 is prime and P is the least prime greater than p, then P/p<22/15 (hence ≤3/2−1/30). If p≥21591, the next two consecutive primes are each at most (61/50) times the preceding one. Since (61/50)^2=3721/2500<1499/1000, the least non-Fermat prime greater than p is <(1499/1000)p.

**Hypotheses and scope.**

- p is prime, p≥31 and P is the least prime strictly greater than p. For the sharper two-step comparison assume p≥21591. Bertrand is invoked only at a positive integer, with its actual pinned-library hypotheses.

**Proof obligations.**

- For a=22/15, use π(ap)>ap/log(ap) and π(p)<1.25506p/log p. Verify a log p >1.25506(log p+log a) at p=31 and monotonicity in log p.
- For a=61/50 and p≥21591 use the sharper denominators: a(log p−3/2)>log p+log a−1/2. It is sufficient at the lower endpoint and increases thereafter.
- Among two consecutive odd primes above 5 at most one is Fermat: if both were Fermat, Bertrand supplies an intervening prime (the later Fermat is larger than twice the earlier).

**Acceptance.**

- Distinguish the next prime from the least non-Fermat prime; do not erase the Fermat skip.
- Use the exact repeating decimal 22/15 in KW §7; 1.46 is not its exact rational value.
- The endpoint logarithmic comparisons have positive margins (at p=31 and p=21591); strict rational ratio statements use that a·p cannot be an integer prime at these denominators.

**Prerequisites.** [R26.3/explicit-prime-counting-input](#r26-3-explicit-prime-counting-input); `mathlib:Nat.exists_prime_lt_and_le_two_mul`.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/PrimeEstimates; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §7, p.12. Consecutive-prime ratio for the shared recursion

<a id="r26-3-finite-auxiliary-prime-checks"></a>

#### Finite auxiliary-prime checks

Identifier: `ClassicalSerreModularity:R26.3/finite-auxiliary-prime-checks`. Kind: lemma.

For each prime p with 5≤p≤21591, let P be the least non-Fermat prime greater than p. There are an odd prime ℓ and e≥1 with ℓ^e exactly dividing P−1, ℓ^e=2m+1, and (m+1)P+m≤(2m+1)p. In particular the (p,P,ℓ^e) rows for p≤31 are (5,7,3),(7,11,5),(11,13,3),(13,19,9),(17,19,9),(19,23,11),(23,29,7),(29,31,5),(31,37,9). At p=251 skip 257 and choose P=263, ℓ^e=131.

**Hypotheses and scope.**

- p is prime with 5≤p≤21591; P is the least non-Fermat prime strictly greater than p. All odd factors are taken to their exact maximal prime powers.

**Proof obligations.**

- Use an exhaustive sieve through 21649, with primality certificates for each chosen P and factorization certificates for P−1; check absence of a smaller non-Fermat prime.
- Compute the maximal odd prime-power divisors, select one satisfying the displayed integer inequality. All assertions have finite bounds, so use decision procedures against Nat.Prime in implementation.

**Acceptance.**

- Check every prime p in the range, not just the nine displayed rows.
- p=251 must not select the Fermat prime 257.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/PrimeEstimates; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §4, pp.19–20. Finite auxiliary-prime checks

<a id="r26-4"></a>

### R26.4. Ordinary and degenerate lifting branches

Separate reducible residuals, bad-dihedral residuals and residuals absolutely irreducible on the cyclotomic restriction. Local ordinarity comes from the precise crystalline or nonscalar tame type, and never from solvability alone.

<a id="r26-4-local-reducibility-ordinary"></a>

#### Residually reducible potentially Barsotti–Tate lifts are ordinary

Identifier: `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`. Kind: lemma.

(Khare Lemma 5.3, in the nonscalar type used in the induction; Breuil–Mézard Proposition 6.1.1.) Let p be odd and V a two-dimensional potentially crystalline representation of G_{ℚ_p} with Hodge–Tate weights {0,1}. After a finite Teichmüller twist, assume WD(V)|I_p≅ω_p^i⊕1 with 1≤i≤p−2, and choose any G_{ℚ_p}-stable lattice T over a sufficiently large coefficient DVR. If T modulo its maximal ideal is reducible, then V is reducible and ordinary up to a power of ω_p. This is the tame niveau-one type becoming Barsotti–Tate over ℚ_p(μ_p) used here; no assertion about arbitrary potentially Barsotti–Tate types is made.

**Hypotheses and scope.**

- p odd; Hodge–Tate weights {0,1}; potentially crystalline nonscalar tame niveau-one type ω_p^i⊕1 up to twist with 1≤i≤p−2; a Galois-stable lattice. Proposition 6.1.1 has no End(ρ̄)=F premise (unlike Proposition 6.1.2 and Savitt Corollary 6.15).

**Proof obligations.**

- In the Breuil–Mézard parameter V(μ,ξ), Proposition 6.1.1(ii) gives an irreducible residual niveau-two representation when 0<v_p(ξ)<1. Thus a reducible residual lattice forces slope 0 or 1, the reducible characteristic-zero endpoint cases (i),(iii). They become ordinary after a Teichmüller twist; the two endpoints are related by twist and Cartier duality.
- Savitt Theorem 6.11 supplies the corresponding integral classification. For lattices without the trivial-endomorphism condition, use Remark 6.17 only to determine semisimplification; in dimension two reducibility is equivalent to reducibility of semisimplification. The integral calculations remain an R07.5 supplier obligation.

**Acceptance.**

- This is what makes the lifts in the degenerate branches ordinary up to twist, as Skinner–Wiles require.

**Prerequisites.** [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §5, p. 21 of the preprint. Lemma 5.3.
- [savitt-cdt](https://arxiv.org/pdf/math/0404327v3), Theorem 6.11, pp.34–35; Corollary 6.15(1), p.38. Ordinary and nonordinary reductions of the tame niveau-one type.
- [breuil-mezard](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf), §6.1, author-copy pp.67–68, Proposition 6.1.1; standing odd-prime convention in Introduction p.2. Read the nonscalar principal-series setup, the arbitrary stable lattice T, and the three slope cases. The End condition first appears in Proposition 6.1.2, not Proposition 6.1.1.

<a id="r26-4-level-one-lifting-lemma"></a>

#### Level-one lifting and the change of prime

Identifier: `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`. Kind: theorem.

(Lemma 5.4, Corollary 5.5.) For odd p, an irreducible p-adic ρ unramified outside p, crystalline at p with Hodge–Tate weights (k − 1, 0), k even, 2 ≤ k ≤ p + 1, with ρ̄ modular, arises from S_k(SL₂(ℤ)). Consequently: (i) if all odd irreducible mod p ρ̄ of level one and weight k ≤ p + 1 are modular, so are those mod q of weight k for every prime q ≥ k − 1; (ii) the level-one conjecture mod one p > 2 gives it mod every q for weights ≤ p + 1.

**Hypotheses and scope.**

- k even (forced by oddness); for the corollary, q > 3 after the known small cases.
- Skinner–Wiles 2001 (OrdinaryAutomorphicFormsAndModularityLifting R21.5/nearly-ordinary-irreducible-lifting-over-q) covers a residually irreducible ρ̄ that is reducible over ℚ(√((−1)^{(p−1)/2}p)), i.e. induced from that field; for p ≡ 3 mod 4 the field is imaginary, the case that node excludes pending OrdinaryAutomorphicFormsAndModularityLifting/E11 (Lemma 2.2's dihedral bound fails for CM fields split above p; here p ramifies in ℚ(√−p)). KW I cite Skinner's correction for this case, unpublished (a gap)

**Proof obligations.**

- If ρ̄ is irreducible and reducible over ℚ(√((−1)^{(p−1)/2}p)), Wintenberger's lemma makes ρ̄|_{I_p} ordinary and distinguished; otherwise Wiles, Taylor–Wiles, Diamond, Skinner–Wiles apply, except weight p + 1 non-ordinary, which Berger–Li–Zhu Cor. 4.1.3 excludes (it forces ρ̄|_{D_p} irreducible of weight 2, impossible at level one).
- For Corollary 5.5 first remove residual dihedral/bad-dihedral cases using the R17 theta-series modularity and R20 exact weight/level result. In the remaining case the residual restriction to G_{ℚ(μ_q)} is absolutely irreducible. Import the crystalline weight-k minimal lift from R24.3/kw-annals-minimal-lifts (published Annals Theorem 3.3), and its general-weight compatible system from R24.5/kw-theorem-5-1-systems type (1) / published Annals Theorem 4.2(i). The weight-two system of Khare Proposition 3.1 alone does not supply this lift. Check the residual weight at p through R24.6/residual-members and R15.4, apply Lemma 5.4, and transfer through the system. Keep the bounds k≤p+1 and q≥k−1; part (ii) assumes the full theorem at p.

**Acceptance.**

- The weight p + 1 non-ordinary case is excluded, not proved.

**Prerequisites.** [SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/weight-two-level-one-excluded](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.6](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [R26.2/lifting-method-flatness](#r26-2-lifting-method-flatness); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [GL2ModularityLifting:R22.6](../../../content/campaign/GL2ModularityLifting/README.md); [LocalGaloisDeformationRings:R08.3](../../../content/campaign/LocalGaloisDeformationRings/README.md); [PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6/residual-members](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.5](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [SerreWeightAndLevelOptimisation:R20.5](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), p. 22 of the preprint. Lemma 5.4.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), p. 22 of the preprint. Corollary 5.5.
- [breuil-mezard](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf), §4.1, Proposition 4.1.1 and proof, author-copy pp.30–31. For crystalline HT {0,k−1} in this safe range, any stable-lattice reduction of a locally irreducible V is irreducible of niveau two. Thus reducible reduction forces the ordinary characteristic-zero branch. At the foil take k=2<p, including p=3. This scalar crystalline input is distinct from the nonscalar type of Proposition 6.1.1.

<a id="r26-4-degenerate-branches"></a>

#### The degenerate branches of the level-one step

Identifier: `ClassicalSerreModularity:R26.4/degenerate-branches`. Kind: theorem.

In the inductive step at P (Khare §6.2), let ρ be the irreducible minimal weight-two lift, ρ̄_ℓ its residual mod-ℓ member, and ρ″ the P-adic member of the second system. (a) If ρ̄_ℓ is solvable, distinguish three cases: reducible; irreducible but reducible on G_{ℚ(μ_ℓ)}; and absolutely irreducible on that restriction. In the first case its Barsotti–Tate lift is ordinary and distinguished, so residually reducible ordinary lifting applies. In the second, the GENERAL bad-dihedral local weight lemma excludes local irreducibility at weight 2 (it would force weight (ℓ+3)/2), giving the distinguished ordinary branch, with the stated CM correction gap. In the third, R17 gives residual modularity and the appropriate R22 potentially Barsotti–Tate theorem applies; do not infer ordinarity merely from solvable image. (b) If ρ̄_ℓ is unramified at P it has weight 2 and level one, hence is reducible, and the ordinary lifting branch applies. (c) For the return member, local residual reducibility at P makes ρ″ ordinary up to a Teichmüller twist by the nonscalar local classification, distinguished by even j. Globally irreducible bad-dihedral return residuals have level one and are ordinary by the level-one dihedral classification; cyclotomically absolutely irreducible solvable residuals use R17 and R22 instead. Residual reducibility after a change of prime is a branch, never ruled out by characteristic-zero irreducibility.

**Hypotheses and scope.**

- ℓ odd; the characteristic-zero representations are irreducible (they come from compatible systems of irreducible members).
- Skinner–Wiles 2001 (OrdinaryAutomorphicFormsAndModularityLifting R21.5/nearly-ordinary-irreducible-lifting-over-q) covers a residually irreducible ρ̄ that is reducible over ℚ(√((−1)^{(p−1)/2}p)), i.e. induced from that field; for p ≡ 3 mod 4 the field is imaginary, the case that node excludes pending OrdinaryAutomorphicFormsAndModularityLifting/E11 (Lemma 2.2's dihedral bound fails for CM fields split above p; here p ramifies in ℚ(√−p)). KW I cite Skinner's correction for this case, unpublished (a gap)

**Proof obligations.**

- Split residual reducibility and cyclotomic restriction before selecting a lifting theorem. At the foil ℓ the residual representation may be ramified at both ℓ and P, so import Khare Lemma 5.1(ii)/KW Lemma 6.2(ii)/DP Lemma 1.14 in their general normalized-weight form from R15.4; the level-one classification cannot be applied there.
- For the scalar crystalline weight-two lift at the foil ℓ, use Breuil–Mézard Proposition 4.1.1 with k=2<ℓ, an arbitrary stable lattice and the safe Fontaine–Laffaille interval [0,1]⊆[0,ℓ−2]. Its irreducible characteristic-zero branch has irreducible residual reduction; otherwise its ordinary characters reduce to χ̄_ℓ and 1, which are distinct for ℓ odd. Do not use the nonscalar Proposition 6.1.1 for a scalar type.
- For the ordinary branches verify irreducibility of the characteristic-zero lift, ordinary local shape and distinct residual inertia characters before applying R21.5/theorem-a-over-q or the residually irreducible ordinary export. Retain the explicit unpublished CM correction gap.
- For cyclotomically absolutely irreducible residuals obtain solvable residual modularity from R17 and use the R22 potentially BT/crystalline export with its precise local conditions. Transfer modularity through the linked systems.

**Acceptance.**

- Skinner–Wiles needs irreducibility of the characteristic-zero representation and ordinarity: both are checked here.

**Prerequisites.** [R26.4/local-reducibility-ordinary](#r26-4-local-reducibility-ordinary); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/weight-two-level-one-excluded](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.6](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [R26.4/ordinary-reduction-and-parity](#r26-4-ordinary-reduction-and-parity); [GL2AutomorphicRepresentationsAndTransfer:R17.6](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [GL2ModularityLifting:R22.6](../../../content/campaign/GL2ModularityLifting/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, pp. 26–27 of the preprint. Branch (a)(b).
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, p. 27 of the preprint. Branch (c).
- [breuil-mezard](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf), §4.1, Proposition 4.1.1 and proof, author-copy pp.30–31. For crystalline HT {0,k−1} in this safe range, any stable-lattice reduction of a locally irreducible V is irreducible of niveau two. Thus reducible reduction forces the ordinary characteristic-zero branch. At the foil take k=2<p, including p=3. This scalar crystalline input is distinct from the nonscalar type of Proposition 6.1.1.

<a id="r26-4-ordinary-reduction-and-parity"></a>

#### Ordinary reduction and residual distinction

Identifier: `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`. Kind: lemma.

At level one k is even. In the Khare step with previous bound p0+1 and new characteristic P, p0+2≤k≤P+1, a locally irreducible representation with k<P has a cyclotomic twist of weight P+3−k; a split local representation has a twist of weight P+1−k. The auxiliary-prime inequality places these weights in the already proved range. The remaining representation is ordinary (including k=P+1). The ordinary weight-2 lift has inertial characters whose residual ratio is nontrivial because k−1 is odd and P−1 is even. At a return member with even tame exponent j, the same parity checks the ordinary distinguished hypothesis after its Teichmüller twist.

**Hypotheses and scope.**

- Level one, odd characteristic P and even normalized weight k. Twist formulas require k≠2 and k<P; treat k=P+1 separately. In the return type j is even and 1≤j≤P−2, hence the ordinary residual character ratio has odd exponent and is nontrivial modulo the even integer P−1.

**Proof obligations.**

- Apply the two twist formulas only when k≠2 and k<P, treating k=P+1 by its ordinary classification.
- Use the previous bound to conclude the modularity of the twisted exceptional cases, and restore the twist.
- Compute inertia-character ratios; the parity assertion is a non-scalar check, not a general automatic lifting theorem.

**Acceptance.**

- Even weight does not authorize a p=2 distinguished-character conclusion.
- Keep the finite-order Teichmüller twist separate from the residual cyclotomic twist.

**Prerequisites.** [R26.3/serre-weight-twist](#r26-3-serre-weight-twist); [R26.3/chebyshev-next-prime](#r26-3-chebyshev-next-prime); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, pp.26–27. Ordinary reduction and residual distinction

<a id="r26-5"></a>

### R26.5. The terminal weights through 32

Prove the five successive rows after the imported weights 2, 4 and 6. Each row includes the full lifting branch contract and finishes the normalized range in its chosen characteristic before exporting to every characteristic.

<a id="r26-5-small-weights-table"></a>

#### The small-weight table of the level-one proof

Identifier: `ClassicalSerreModularity:R26.5/small-weights-table`. Kind: application.

(Khare §6.1.) Weights 2, 4, 6 are the older KW Annals Theorem 4.1 (published Theorems 5.2/5.4) (Fontaine, Schoof, Brumer–Kramer); p = 2, 3 are Tate and Serre. The remaining weights up to 32 are proved in the characteristic P with foil prime ℓ (ℓ^r ∥ P − 1) and nebentypus ω_P^j, giving new weights j + 2 or P + 1 − j already known: weight 8: P = 7, ℓ = 3, j = 2 → 4 or 6; weights 10, 12: P = 11, ℓ = 5, j = 4 → 6 or 8; weights 14–20: P = 19, ℓ = 3, j = 8 → 10 or 12; weights 22–30: P = 29, ℓ = 7, j = 16 (weights 22, 26, 30) → 18 or 14, j = 14 (weights 24, 28) → 16; weight 32: P = 31, ℓ = 5, j = 18 → 20 or 14 (Khare prints j = 16, which is not in the admissible coset: E2).

**Hypotheses and scope.**

- In each row j lies in the coset allowed by nebentype-lift-at-q: j ≡ (prime-to-ℓ part of k − 2) mod (P − 1)/ℓ^r, e.g. at P = 29, ℓ = 7: k − 2 = 22, 26 give ω^{14}, and k − 2 = 20, 24, 28 give the trivial character.

**Proof obligations.**

- Use R25 for p=2,3 and weights 2,4,6.
- Apply the five terminal row nodes in increasing order; every row includes the branch contract and characteristic-transfer corollary.
- This proves the even weights ≤32 for every characteristic. Odd weights at level one are excluded by determinant parity.

**Acceptance.**

- The 22–30 row prints 'unramified outside 3, 19' for the mod-7 lift; it should be 7, 29 (E1).
- The weight-32 row prints nebentypus ω_31^{16}; with foil 5, η_31 = ω_31^6 and the lift is semistable at 31, so j must be a multiple of 6; j = 18 (weights 20 or 14) works (E2).

**Prerequisites.** [R26.5/weight-eight](#r26-5-weight-eight); [R26.5/weights-ten-twelve](#r26-5-weights-ten-twelve); [R26.5/weights-fourteen-twenty](#r26-5-weights-fourteen-twenty); [R26.5/weights-twentytwo-thirty](#r26-5-weights-twentytwo-thirty); [R26.5/weight-thirtytwo](#r26-5-weight-thirtytwo); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md).

**Uses.**

- ClassicalSerreModularity:R26.3/level-one-induction-scheme: S(32).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, p. 23 of the preprint. §6.1.
- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, p. 25 of the preprint. The 22–30 row.

<a id="r26-5-terminal-row-branch-contract"></a>

#### Terminal-row lifting and degeneracy contract

Identifier: `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`. Kind: application.

In each terminal row (P,ℓ,j), start with an odd absolutely irreducible level-one mod-P representation of the listed even weight. After the local twist reduction it is ordinary; construct its minimal weight-2 lift/system. The mod-ℓ member is weight 2 and ramified only at ℓ,P. If solvable, separate reducible, bad-dihedral ordinary, and cyclotomically absolutely irreducible solvable branches, then apply the matching R21 or R22 lifting theorem; if unramified at P, the level-one weight-2 exclusion makes it reducible. Otherwise change its P-nebentype to ω_P^j, keeping j≡k−2 modulo (P−1)/ℓ^e, form the second system and return to P. Reducible/solvable return members use local ordinarity and the explicit lifting contracts; non-solvable members have weight j+2 or a cyclotomic twist of weight P+1−j, both in an earlier row. Restore that twist, lift modularity, transfer at ℓ, then transfer to the initial residual representation and optimise its weight and level.

**Hypotheses and scope.**

- P and ℓ are distinct odd primes, ℓ^e exactly divides P−1 and the listed weight is even. Choose even j with 1≤j≤P−2 and j≡k−2 mod (P−1)/ℓ^e; keep the ramification set {ℓ,P}. New residual members need not be irreducible.

**Proof obligations.**

- Verify the full determinant and local type at each transition rather than equating weights by numerical arithmetic alone.
- At the foil ℓ (including ℓ=3), exclude locally irreducible bad-dihedral weight 2 by the general R15.4 normalized-weight lemma, not the level-one classification: ramification at P may remain. Follow the three solvable branches of degenerate-branches. The residually irreducible ordinary CM case retains its correction gap.
- At P, local reducibility gives ordinary up to a Teichmüller twist via R07.5; the potentially BT nonordinary lift uses R22.6 with cyclotomic irreducibility.
- Check the unipotent/semistable endpoint k=P+1 separately: its admissible exponent coset is 0.

**Acceptance.**

- Neither compatible-system construction guarantees that the new residual member is irreducible.
- The nonordinary lifting theorem needs the residual restriction hypothesis; a numerical weight bound alone is insufficient.

**Prerequisites.** [R26.2/minimal-weight-two-lift](#r26-2-minimal-weight-two-lift); [R26.2/nebentype-lift-at-q](#r26-2-nebentype-lift-at-q); [R26.2/compatible-system-lifts](#r26-2-compatible-system-lifts); [R26.4/degenerate-branches](#r26-4-degenerate-branches); [R26.4/ordinary-reduction-and-parity](#r26-4-ordinary-reduction-and-parity); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Terminal-row lifting and degeneracy contract

<a id="r26-5-weight-eight"></a>

#### Weight eight

Identifier: `ClassicalSerreModularity:R26.5/weight-eight`. Kind: application.

Every odd absolutely irreducible residual level-one representation of weight k∈[8] is modular. Work first in characteristic P=7; choose foil ℓ=3, ℓ^e=3 exactly dividing P−1, and j=2. The earlier weights after the return to P are [4, 6], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Hypotheses and scope.**

- The initial representation has characteristic P=7, level one and the listed even weight; after reduction at ℓ=3 its ramification support is contained in {3,7}.
- Use j=2 in the admissible residue coset.

**Proof obligations.**

- Local irreducible/split twists of the listed weights at P=7 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
- Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
- Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤8 in characteristic 7, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 8 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Acceptance.**

- Check exact divisor 3∥6 and the coset modulo 2.
- Both residual weights belong to [4, 6]; no recursion to the current row.

**Prerequisites.** [R26.5/terminal-row-branch-contract](#r26-5-terminal-row-branch-contract); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Weight eight

<a id="r26-5-weights-ten-twelve"></a>

#### Weights ten and twelve

Identifier: `ClassicalSerreModularity:R26.5/weights-ten-twelve`. Kind: application.

Every odd absolutely irreducible residual level-one representation of weight k∈[10, 12] is modular. Work first in characteristic P=11; choose foil ℓ=5, ℓ^e=5 exactly dividing P−1, and j=4. The earlier weights after the return to P are [6, 8], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Hypotheses and scope.**

- The initial representation has characteristic P=11, level one and the listed even weight; after reduction at ℓ=5 its ramification support is contained in {5,11}.
- Use j=4 in the admissible residue coset.

**Proof obligations.**

- Local irreducible/split twists of the listed weights at P=11 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
- Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
- Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤12 in characteristic 11, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 12 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Acceptance.**

- Check exact divisor 5∥10 and the coset modulo 2.
- Both residual weights belong to [6, 8]; no recursion to the current row.

**Prerequisites.** [R26.5/terminal-row-branch-contract](#r26-5-terminal-row-branch-contract); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [R26.5/weight-eight](#r26-5-weight-eight).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Weights ten and twelve

<a id="r26-5-weights-fourteen-twenty"></a>

#### Weights fourteen through twenty

Identifier: `ClassicalSerreModularity:R26.5/weights-fourteen-twenty`. Kind: application.

Every odd absolutely irreducible residual level-one representation of weight k∈[14, 16, 18, 20] is modular. Work first in characteristic P=19; choose foil ℓ=3, ℓ^e=9 exactly dividing P−1, and j=8. The earlier weights after the return to P are [10, 12], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Hypotheses and scope.**

- The initial representation has characteristic P=19, level one and the listed even weight; after reduction at ℓ=3 its ramification support is contained in {3,19}.
- Use j=8 in the admissible residue coset.

**Proof obligations.**

- Local irreducible/split twists of the listed weights at P=19 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
- Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
- Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤20 in characteristic 19, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 20 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Acceptance.**

- Check exact divisor 9∥18 and the coset modulo 2.
- Both residual weights belong to [10, 12]; no recursion to the current row.

**Prerequisites.** [R26.5/terminal-row-branch-contract](#r26-5-terminal-row-branch-contract); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [R26.5/weights-ten-twelve](#r26-5-weights-ten-twelve).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Weights fourteen through twenty

<a id="r26-5-weights-twentytwo-thirty"></a>

#### Weights twenty-two through thirty

Identifier: `ClassicalSerreModularity:R26.5/weights-twentytwo-thirty`. Kind: application.

Every odd absolutely irreducible residual level-one representation of weight k∈[22, 24, 26, 28, 30] is modular. Work first in characteristic P=29; choose foil ℓ=7, ℓ^e=7 exactly dividing P−1, and j=16 for k=22,26,30 and j=14 for k=24,28. The earlier weights after the return to P are [14, 16, 18], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Hypotheses and scope.**

- The initial representation has characteristic P=29, level one and the listed even weight; after reduction at ℓ=7 its ramification support is contained in {7,29}.
- Use j=16 for k=22,26,30 and j=14 for k=24,28, modulo (29−1)/7=4. E1 changes only the ramification list to {7,29}; E2 does not apply to this row.

**Proof obligations.**

- Local irreducible/split twists of the listed weights at P=29 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
- Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
- Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤30 in characteristic 29, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 30 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Acceptance.**

- Check exact divisor 7∥28 and the coset modulo 4.
- Both residual weights belong to [14, 16, 18]; no recursion to the current row.

**Prerequisites.** [R26.5/terminal-row-branch-contract](#r26-5-terminal-row-branch-contract); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [R26.5/weights-fourteen-twenty](#r26-5-weights-fourteen-twenty).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Weights twenty-two through thirty

<a id="r26-5-weight-thirtytwo"></a>

#### Weight thirty-two

Identifier: `ClassicalSerreModularity:R26.5/weight-thirtytwo`. Kind: application.

Every odd absolutely irreducible residual level-one representation of weight k∈[32] is modular. Work first in characteristic P=31; choose foil ℓ=5, ℓ^e=5 exactly dividing P−1, and j=18. The earlier weights after the return to P are [14, 20], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Hypotheses and scope.**

- The initial representation has characteristic P=31, level one and the listed even weight; after reduction at ℓ=5 its ramification support is contained in {5,31}.
- Use j=18, which lies in (12,18] and is divisible by 6; the source’s j=16 is inadmissible (E2).

**Proof obligations.**

- Local irreducible/split twists of the listed weights at P=31 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
- Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
- Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤32 in characteristic 31, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 32 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Acceptance.**

- Check exact divisor 5∥30 and the coset modulo 6.
- Both residual weights belong to [14, 20]; no recursion to the current row.

**Prerequisites.** [R26.5/terminal-row-branch-contract](#r26-5-terminal-row-branch-contract); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [R26.5/weights-twentytwo-thirty](#r26-5-weights-twentytwo-thirty).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, pp.23–26. Weight thirty-two

<a id="r26-6"></a>

### R26.6. Level-one assembly and the initial conductor case

Assemble the two-system weight induction, the corrected prime-conductor corollary, finiteness, and the odd prime-power inertia corollary that supplies (W₁). This is the level-one seed used by the classical induction.

<a id="r26-6-level-one-proof-assembly"></a>

#### Proof of the level-one theorem

Identifier: `ClassicalSerreModularity:R26.6/level-one-proof-assembly`. Kind: theorem. Planet: **Assembly of the level-one proof**.

(Khare §6.2, end.) In the inductive step, the second compatible system (ρ′_λ) is modular (its P-adic member ρ″ has residual weight ≤ p_n + 1, or falls in a degenerate branch), and it is linked to (ρ_λ) at the place above ℓ (isomorphic non-solvable residual representations); Wiles–Taylor–Wiles make (ρ_λ) modular, so ρ̄ is modular of some weight and level, hence of weight k(ρ̄) and level N(ρ̄) = 1 by Ribet and Edixhoven. With S(32) this proves S(B) for all B.

**Hypotheses and scope.**

- The two systems have no added fixed Weil–Deligne ramification at the foil ℓ: the relevant ℓ-adic lifts are crystalline weight two. A member may still be ramified at its own coefficient prime. Apply linked-system transfer only after verifying the residual and local lifting hypotheses.

**Proof obligations.**

- Chain the two systems through the linking prime ℓ; apply the weight and level optimisation (Ribet; Edixhoven) to pass from 'some weight and level' to (k(ρ̄), 1).

**Acceptance.**

- Two lifting theorems of the residually irreducible type are used at the linking step; the residually degenerate ones only in degenerate-branches.

**Prerequisites.** [R26.3/level-one-induction-scheme](#r26-3-level-one-induction-scheme); [R26.4/degenerate-branches](#r26-4-degenerate-branches); [R26.5/small-weights-table](#r26-5-small-weights-table); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.6](../../../content/campaign/GL2ModularityLifting/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.2, p. 28 of the preprint. The conclusion.

<a id="r26-6-corollary-1-2-proof"></a>

#### Proof of Corollary 1.2 (conductor a prime, weight 2)

Identifier: `ClassicalSerreModularity:R26.6/corollary-1-2-proof`. Kind: theorem.

(Khare §7.1, corrected by KW I §8.3.) Corollary 1.2 holds (for all p, KW I Corollary 8.1(i)): for q = 2 by the semistable weight-two input of KW Annals (old Theorem4.1(ii), published Theorem5.2(ii)), after the conductor-two semistability check from R01.5 and the R25 abelian-variety application; for q odd by killing ramification: a minimal p-adic lift in a compatible system, whose member above q reduces to a mod-q representation unramified outside q, modular by the level-one theorem; then the lifting theorems (Lemmas 5.1, 5.3) make the system modular. KW I replace the reference 'Theorem 5.1(3) of [24]' (insufficient when p ∤ q − 1) by Theorem 6.1(2) of [24] with Skinner–Wiles [39]–[41], via Saito (semistable case) or Theorem 5.1(3 ii) (unramified over ℚ_q(μ_q)).

**Hypotheses and scope.**

- The copy of [24] read here is the arXiv v1 preprint, whose numbering (Proposition 3.1) differs from the published Duke numbering (Theorems 5.1, 6.1) used by KW I.
- KW I's [41] is C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'; listed as a 2009 preprint by Allen, arXiv:1301.1113), which KW I call a correction to Skinner–Wiles 2001 ([40]); it is unpublished and was not read (a gap), and it concerns the dihedral case of OrdinaryAutomorphicFormsAndModularityLifting/E11

**Proof obligations.**

- For q=2, prime-to-p conductor forces p odd. Conductor exponent one means inertia has one-dimensional invariants and Swan conductor zero. On the quotient the tame inertia character is Frobenius-stable, so χ=χ² and χ=1; the inertia image is unipotent of p-power order. Together with k=2 this is precisely published Annals Definition4.1 semistability. Request this local inference from R01.5.
- Apply published Annals Theorem5.2(ii). Its proof first handles reducible cyclotomic restriction by known dihedral modularity and weight/level optimisation; otherwise Theorem4.2(ii) realises a weight-two minimal compatible system in a positive-dimensional GL2-type abelian variety with good reduction outside 2 and semistable reduction at 2. Import the compatible-system/realisation contracts and R25.4/schoof-theorem; the abelian variety must be zero, a contradiction. R25 does not itself export an arbitrary conductor-two residual theorem.
- For q odd use the required minimal weight-two system and split the q-adic local parameter into semistable with nonzero monodromy or unramified over Q_q(μ_q). Its residual representation is unramified outside q, so the level-one theorem or its reducible convention gives residual modularity.
- Identify and apply the published Duke Theorem6.1(2) with the corrected Skinner–Wiles references; this is an explicit source boundary, not inferred from Proposition3.1 of the preprint. Transfer modularity through the system and optimise to weight2, level Γ₁(q).
- Killing ramification is published Annals §6.2 (older cited §5.2); it is a method with lifting hypotheses, not an unconditional licence to remove local ramification.

**Acceptance.**

- Keep KW I's correction: the q-adic member may be ramified at q, and the split into the semistable and the unramified-over-ℚ_q(μ_q) cases is needed.
- Check q=2 semistability from Artin exponent one before invoking Annals Theorem5.2(ii); the residual prime-to-p conductor rules out p=q=2.

**Prerequisites.** [R26.6/level-one-proof-assembly](#r26-6-level-one-proof-assembly); [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [R26.4/local-reducibility-ordinary](#r26-4-local-reducibility-ordinary); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [ArithmeticGaloisRepresentations:R01.5](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.4/schoof-theorem](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/descent-of-gl2-type-realisation](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/reduction-of-the-realisation](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.5](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §7.1, p. 28 of the preprint. §7.1.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.3, p. 16 of the preprint. KW I's corrected step.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.3, proof of Corollary 8.1, p. 16 of the preprint. KW I's [41] = C. Skinner, Nearly ordinary deformations of residually dihedral representations ('to appear'), a correction to Skinner–Wiles 2001 ([40]).
- [kw-annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf), Published Definition4.1, Theorem4.2(ii), pp.243–244; Theorem5.2(ii), p.247; §6.2, pp.250–251 (older cited Theorem4.1(ii)/§5.2). The q=2 case first needs the conductor-one-at-2 ⇒ unipotent local inference. Annals Theorem5.2(ii) then excludes this semistable weight-two case; its abelian-variety proof imports Schoof through R25, not an arbitrary conductor-two theorem from R25.

<a id="r26-6-finiteness-corollary-1-3"></a>

#### Finiteness of level-one representations

Identifier: `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`. Kind: theorem.

For each prime p there are finitely many isomorphism classes of continuous semisimple odd representations G_Q→GL₂(F̄_p) unramified outside p. In the absolutely irreducible case the level-one theorem, weight normalisation by one of finitely many cyclotomic twists and realisation in S₂(Γ₁(p²)) bound the residual systems of Hecke eigenvalues. The reducible semisimple case consists of sums of two characters unramified outside p: finite-order characters with values in F̄_pˣ factor through the prime-to-p quotient of Z_pˣ, hence have order dividing p−1 (trivial when p=2). Finiteness of a complex vector-space dimension alone is insufficient: use the finite integral Hecke algebra reduced modulo p.

**Proof obligations.**

- Normalise irreducible weights by the finite cyclotomic-twist set; use the level-one theorem and its weight-2 realisation.
- Use finite generation of the integral Hecke algebra and finiteness of its mod-p eigencharacters; residual attached representations are determined up to semisimplification by Frobenius.
- Use Kronecker–Weber/abelian character classification for the reducible semisimple branch; unipotent extensions are excluded by semisimplicity.

**Acceptance.**

- Quantitative refinements are open (Khare §7.2).

**Prerequisites.** [R26.6/level-one-proof-assembly](#r26-6-level-one-proof-assembly); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [ArithmeticGaloisRepresentations:R01.5](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [AlgebraicModularFormsAndSerreWeights:R15.3](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/LevelOne; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [khare-level-one](https://arxiv.org/pdf/math/0504080v1), §7.1, p. 28 of the preprint. The proof.

<a id="r26-6-corollary-8-1-ii-and-the-statement-w1"></a>

#### Corollary 8.1(ii) and the derivation of the induction's starting point (W_1)

Identifier: `ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1`. Kind: theorem.

Corollary 8.1(ii): if ρ̄ is an irreducible, odd, 2-dimensional mod p representation of G_Q with k(ρ̄) = 2, unramified outside p and one other odd prime q, tamely ramified at q, such that the order of ρ̄(I_q) is a power of an odd prime t > 5, then ρ̄ arises from S_2(Gamma_1(q^2)). Theorem 3.3 - the hypothesis (W_r) for r = 1 - follows from this. Thus the starting point of the KW induction is NOT the conductor-one theorem restated: (W_1) concerns locally good-dihedral representations of weight 2 whose odd conductor has at most one prime divisor, and Corollary 8.1(ii) is the statement about representations ramified at exactly one odd prime q with tame image of odd prime-power order t > 5 - i.e. exactly the shape a good dihedral prime produces.

**Hypotheses and scope.**

- For the main reduction one may first dispose of t=p by Corollary 8.1(i); otherwise t is an odd prime >5 distinct from p. Tameness rules out t=q. The original corollary itself does not assume t≠p.
- one may assume the projective image of ρ̄ is not dihedral, the A_4 and S_4 cases reducing to level one because t > 5
- the conclusion is stated at level q^2 (S_2(Gamma_1(q^2))); the source gives no further explanation of the exponent
- the argument uses modularity lifting results of Skinner-Wiles in the residually reducible branch and Wiles/Taylor-Wiles in the residually irreducible branch

**Proof obligations.**

- Reduce (ii) to (i). Build an almost strictly compatible lift by Theorem 5.1(1): rho_p unramified outside {p, q}, crystalline of weight 2 at p, with |rho_p(I_q)| = |ρ̄_p(I_q)|.
- Consider the mod t reduction ρ̄_t. If it is reducible, or unramified at q (which forces reducibility by the level-one weight-2 case), apply Skinner-Wiles to conclude rho_t is modular; note rho_t is crystalline of weight 2 because the system is almost strictly compatible of weight 2 and t is not 2.
- If ρ̄_t is irreducible and ramified at q, then k(ρ̄_t) = 2 by almost strict compatibility and part (i) gives modularity (the ramification at q is unipotent); Wiles/Taylor-Wiles then gives modularity of rho_t.
- In the last case, irreducibility of ρ̄_t restricted to Q(mu_t) is checked either from |ρ̄_t(I_q)| = t or from k(ρ̄_t) = 2 together with Lemma 6.2(ii).

**Acceptance.**

- Check that the produced form has level q^2 and not q, and that this is what (W_1) consumes
- Check that the branch where ρ̄_t becomes reducible after the change of prime is actually reachable, so that it is a branch of the proof and not an impossible case

**Prerequisites.** [R26.6/corollary-1-2-proof](#r26-6-corollary-1-2-proof); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.3, p. 15 of the preprint. §8.3.

<a id="r27-1"></a>

### R27.1. The shared good-dihedral package

Definition 2.1 and Lemma 6.3 supply the early image-control interface. Dickson, dihedral modularity and the bad-dihedral weight recipe remain imported from their component owners. The next block adds Lemma 8.2 and the insertion application under their same stable R27.1 identifiers.

<a id="r27-1-good-dihedral-prime-definition"></a>

#### Definition 2.1: good dihedral prime

Identifier: `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`. Kind: definition. Planet: **Good dihedral primes**.

Use Mathlib Nat.maxPrimeFac for KW’s Q: Q(1)=1 and Q(n) is the largest prime divisor for n≥2. N is the positive prime-to-p Artin conductor; q² divides N in the specified nontrivial tame niveau-two shape. For ρ̄: G_Q -> GL_2(F_p-bar) continuous, a prime q different from p is a good dihedral prime for ρ̄ if (i) ρ̄ restricted to I_q is of the form diag(psi, psi^q) with psi a NON-TRIVIAL character of I_q whose order is a power of an odd prime t such that t divides q+1 and t > max(Q(N(ρ̄)/q^2), 5, p); and (ii) q is 1 mod 8, and 1 mod r for every prime r with r <= max(Q(N(ρ̄)/q^2), p). If such a q exists, ρ̄ is called locally good-dihedral (for the prime q), or q-dihedral.

**Hypotheses and scope.**

- psi must be nontrivial and of order a power of an ODD prime t with t | q+1 - so psi is of level 2 at q and t does not divide q-1
- the bound on t is taken against Q(N(ρ̄)/q^2), i.e. the largest prime dividing the prime-to-q part of the conductor, together with 5 and p
- condition (ii) (q = 1 mod 8 and q = 1 mod r for the primes r in range) is used in the proof of Lemma 6.3(i) to show that q splits or ramifies in any quadratic field K unramified outside the primes at which ρ̄ ramifies, both of which are then excluded
- the definition is a property of the pair (ρ̄, q), and both conditions refer to N(ρ̄), so it is not stable under arbitrary changes of level

**Proof obligations.**

- The definition is stated outright in the source. Its purpose, made explicit in Remark 2 after the proof of Theorem 3.2, is that starting with a q-dihedral ρ̄ in characteristic P ramified at a set S, the proofs of Theorems 3.1 and 3.2 only need residual representations in characteristic at most max over l in S minus {q} of (P, l) - which is exactly the range in which (i) and (ii) have been imposed.

**Acceptance.**

- Check on an explicit example that t > 5, t | q+1 and t odd force ρ̄ restricted to D_q to be irreducible
- Check that condition (ii) fails for some q = 5 mod 8 and that the Lemma 6.3 argument then breaks at the ramified-quadratic-field step

**Prerequisites.** [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.5](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); `mathlib:Nat.maxPrimeFac`; `mathlib:Nat.maxPrimeFac_one`; `mathlib:Nat.isGreatest_maxPrimeFac`; `mathlib:Matrix.GeneralLinearGroup`.

**Uses.**

- ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved: Lemma 6.3.
- ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr: the restriction to locally good-dihedral ρ̄.
- ClassicalSerreModularity:R33.2, R33.3, R33.6: The modern strand consumes only this definition, image protection and the early Chebotarev prefix, independent of R26 modularity.

**Planning API.**

| Proposed name | Role | Statement |
| --- | --- | --- |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime` | constructor | For supplied continuous residual ρ, p, its actual positive conductor N, inertia subgroups I_q and q, return the conjunction of prime/noncharacteristic conditions, a basis conjugating ρ\|I_q to diag(ψ,ψ^q), nontrivial exact order t^a (a>0), odd prime t\|q+1 with the strict size bound, and the two congruence conditions. |
| `TauCeti.SerreConjecture.IsLocallyGoodDihedral` | characterisation | IsLocallyGoodDihedral ρ iff there exists q with IsGoodDihedralPrime ρ q. |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime.inertia` | projection | Extract t,a,ψ and the change of basis, with a>0, exact order t^a and all the size/divisibility conditions. The character is not trivial. |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime.congruences` | projection | q≡1 mod8 and q≡1 mod s for every prime s≤max(Q(N/q²),p). Include equality at the upper endpoint. |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime.conjugate` | compatibility | Replacing ρ by B⁻¹ρB for an invertible B leaves the predicate unchanged (with the same p,N and transported inertia). |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime.q_sq_dvd_conductor` | relation | For the actual residual Galois representation, its nontrivial tame niveau-two inertia has no invariants, so the local Artin conductor exponent is 2 and q² divides N. |
| `TauCeti.SerreConjecture.IsGoodDihedralPrime.locallyGood` | constructor | A proof that q is good-dihedral gives IsLocallyGoodDihedral with q as witness. |
| `TauCeti.SerreConjecture.IsLocallyGoodDihedral.exists_good` | projection | A locally good-dihedral representation has a prime witness q and the full IsGoodDihedralPrime proof, without unfolding the predicate. |
| `TauCeti.SerreConjecture.IsLocallyGoodDihedral.conjugate` | compatibility | Conjugating the representation by B∈GL₂ preserves existence of a good-dihedral prime, with the same p,N and supplied inertia. |

**Unit-test statements.**

- `goodDihedral_congruence_fails` (non-example): For any representation, characteristic p and conductor N, q=13 cannot be good-dihedral because 13≢1 mod8.
- `goodDihedral_trivial_inertia_fails` (degenerate): For any field of characteristic p and q≠p with positive actual conductor N, a representation trivial on I_q is not good-dihedral: exact character order t^a with a>0,t>5 rules out ψ=1.
- `goodDihedral_upper_endpoint` (characterisation): For p=7, q=241 and N=9·241², Q(N/q²)=3. The congruences at 2,3,5 and modulo8 hold, but 241≢1 mod7. Thus the predicate fails: equality at the upper endpoint s=p is required.
- `goodDihedral_basis_change` (compatibility): For any B∈GL₂(F), the predicates at ρ and g↦B⁻¹ρ(g)B are equivalent; the witness basis is composed with B.
- `locallyGood_single_witness` (characterisation): Given one good prime q, the representation is locally good-dihedral although 13 is never a good candidate. This detects replacing the existential wrapper by a universal quantifier.
- `locallyGood_trivial_inertia_fails` (non-example): If the representation is trivial on every supplied I_q, it is not locally good-dihedral, whatever the conductor parameter; an unconstrained existential prime is insufficient.
- `locallyGood_basis_change` (compatibility): Global existence of a good-dihedral prime is equivalent before and after any basis change B∈GL₂; the prime witness and local character order must survive.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Definition 2.1, p. 5 of the preprint. Condition (i).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Definition 2.1, p. 5 of the preprint. Condition (ii).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.2, Remark 2, p. 15 of the preprint. Remark 2: the motivation.

<a id="r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved"></a>

#### Lemma 6.3: a locally good-dihedral representation has non-solvable, non-A_5 image, and the property propagates through a compatible system

Identifier: `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`. Kind: lemma.

Let ρ̄ be locally good-dihedral for a prime q. (i) The image of ρ̄ is not solvable and its projective image is not isomorphic to A_5. (ii) Let (rho_iota) be any compatible system lifting ρ̄ whose ramified primes are contained in the prime divisors of N(ρ̄)p, and such that rho_p restricted to D_q is a minimal lift of ρ̄ restricted to D_q. Then for any prime r <= max(Q(N(ρ̄)/q^2), p), any mod r representation ρ̄_r arising from (rho_iota) is again locally good-dihedral for the prime q, and hence has non-solvable image with projective image not A_5.

**Hypotheses and scope.**

- in (ii) the two hypotheses on the system are essential: the ramification set must be contained in the primes dividing N(ρ̄)p, and rho_p must be MINIMAL at q
- the range of r is bounded by max(Q(N(ρ̄)/q^2), p), exactly the bound built into Definition 2.1
- the argument for (i) uses t > 5 twice: to exclude A_5, and to force the projective image to be dihedral in the solvable case via Dickson

**Proof obligations.**

- Use only Dickson’s generic image classification from R01.4, not the mixed source alias’s modularity/weight components. Compatible-system preservation is conditional on the stated system; it does not use any theorem that produces lifts or proves modularity.
- (ii) follows from compatibility, (i), and two observations: for t different from 2 and r a prime different from t, the reduction map is bijective on a dihedral subgroup D_{2t^a} of PGL_2(Q_r-bar) sitting inside PGL_2(O); and for r <= max(Q(N(ρ̄)/q^2), p) one has max(Q(N(ρ̄_r)/q^2), r) <= max(Q(N(ρ̄)/q^2), p).
- (i): since t divides q+1 and not q-1, ρ̄ restricted to D_q is irreducible, hence so is ρ̄; since t > 5 the projective image cannot be A_5.
- If the image were solvable then by Dickson the projective image is dihedral, so ρ̄ is induced from a quadratic K unramified outside the primes ramified in ρ̄; the primes s different from q at which ρ̄ is ramified satisfy q = 1 mod s (and 1 mod 8 if s = 2), so q either splits or ramifies in K. Splitting contradicts irreducibility of ρ̄ restricted to D_q; ramification contradicts t being odd.
- t exceeds each new residual characteristic r in the bound, so reduction preserves its prime-power inertia order. New prime divisors away from q are bounded by max(Q(N/q²),p), using the Nat.maxPrimeFac product/power API. The new good-dihedral threshold therefore does not exceed the original one.

**Acceptance.**

- Check the bijectivity of reduction on D_{2t^a} directly for a small t and r, and check it fails when r = t
- Check the two contradictions in (i) on an explicit K, confirming that the 1 mod 8 clause of Definition 2.1 is what closes the s = 2 case

**Prerequisites.** [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.5](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [PotentialModularityAndCompatibleSystems:R24.6/residual-members](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); `mathlib:Nat.maxPrimeFac_mul`; `mathlib:Nat.maxPrimeFac_pow`.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma 6.3, p. 11 of the preprint. Lemma 6.3.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), proof of Lemma 6.3(i), p. 12 of the preprint. The step using (ii).

<a id="r27-1-dickson-and-the-dyadic-solvable-refinement"></a>

#### Dickson's classification, its p = 2 refinement, and the dihedral and degenerate weight lemmas

Identifier: `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`. Kind: lemma.

Dickson: for any prime p, a finite subgroup of GL_2(F_p-bar) acting irreducibly on the plane has projective image isomorphic to a dihedral group, A_4, S_4, A_5, PSL_2(F_0) or PGL_2(F_0) for F_0 a finite subfield of F_p-bar; PSL_2(F_0) is simple nonabelian as soon as |F_0| >= 4. Lemma 6.1: a finite SOLVABLE subgroup G of GL_2(F_2-bar) acting irreducibly has dihedral projective image. Lemma 6.2(i): an S-type ρ̄ with dihedral projective image is modular, and arises from S_{k(ρ̄)}(Gamma_1(N(ρ̄))). Lemma 6.2(ii): if ρ̄ is of S-type, p >= 3, 2 <= k(ρ̄) <= p+1, and ρ̄ restricted to G_{Q(mu_p)} is reducible, then k(ρ̄) is (p+1)/2 or (p+3)/2.

**Hypotheses and scope.**

- Lemma 6.1 is over F_2-bar and uses that an element of GL_2(F_2-bar) of 2-power order has order 1 or 2, and that a Sylow 2-subgroup is unipotent
- Lemma 6.2(i) at p = 2 is not 'well known': it goes through the method of Proposition 10 of Serre's Duke paper (the 'trick of Serre'), with the refined level and weight coming from a separate theorem of Wiese
- Lemma 6.2(ii) needs p > 2 (the projectivisation must be tamely ramified at p) and the normalized weight range 2 <= k <= p+1

**Proof obligations.**

- Lemma 6.1: by Dickson the projective image is dihedral, A_4 or S_4; S_4 is excluded because 2-power-order elements of GL_2(F_2-bar) have order at most 2; A_4 is excluded because it has a normal subgroup of order 4, which forces G into the upper triangular matrices, contradicting irreducibility.
- Lemma 6.2(ii): for p > 2 the projectivisation is tamely ramified at p so its inertia image is cyclic; as the quadratic subfield of Q(mu_p) is ramified at p, that image has order 2, and the two possible weights follow from Serre's definition of k.

**Acceptance.**

- Check Lemma 6.2(ii) against Serre's weight recipe directly, recovering (p+1)/2 and (p+3)/2 from the level-1 and level-2 tame cases
- Check that Lemma 6.1 fails over F_p-bar for odd p, by exhibiting a solvable irreducible subgroup with projective image A_4

**Prerequisites.** [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.5](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.6](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [SerreWeightAndLevelOptimisation:R20.5](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma 6.1, p. 10 of the preprint. Lemma 6.1.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma 6.2, p. 11 of the preprint. Lemma 6.2(i).
- [ribet-semistable](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf), Published Proposition 2.2 proof, pp.279–280. An analogy for the component-owned inertia argument, not a direct proof of general bad-dihedral weights. E14 corrects center to index-two rotation subgroup; retain semistability and cyclotomic determinant in the theorem itself.

<a id="r27-2"></a>

### R27.2. The induction hypotheses and weight reduction

State (Lᵣ), (Wᵣ) and (Dᵣ) with their different conductor, weight and characteristic restrictions. Prove (Wᵣ) ⇒ (Lᵣ), importing the shared odd-prime estimates and separately recording the exact dyadic interval.

<a id="r27-2-hypotheses-lr-wr-and-dr"></a>

#### The three families of hypotheses (L_r), (W_r) and (D_r)

Identifier: `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`. Kind: definition.

For an integer r >= 1: (L_r) all ρ̄ of S-type are modular provided (a) ρ̄ is locally good-dihedral, (b) k(ρ̄) = 2 IF p = 2, and (c) N(ρ̄) is odd and divisible by at most r primes. (W_r) the same with (b) strengthened to k(ρ̄) = 2 for every p. For an integer r >= 0: (D_r) all ρ̄ of S-type are modular provided (a) ρ̄ is locally good-dihedral, (b) the residue characteristic of ρ̄ is an odd prime, and (c) N(ρ̄) is NOT divisible by 2^{r+1}. Obviously (L_r) implies (W_r). Note that (L_r) and (W_r) require the conductor to be odd, while (D_r) allows even conductor with bounded 2-valuation and instead forbids p = 2.

**Hypotheses and scope.**

- all three hypotheses are restricted to locally good-dihedral ρ̄; this is the device that avoids residually degenerate modularity lifting beyond what Theorem 1.1 already uses
- (L_r) imposes weight 2 only at p = 2; (W_r) imposes it at all p
- (D_r) bounds v_2(N(ρ̄)) by r, and excludes p = 2 entirely

**Proof obligations.**

- The hypotheses are stated outright. The source records the two consequences used: by Theorem 3.4, (D_0) implies Serre's conjecture for S-type ρ̄ in odd characteristic with N(ρ̄) odd and for ρ̄ in characteristic 2 with k(ρ̄) = 2; and (D_1) implies Serre's conjecture in characteristic 2 and in odd characteristic with N(ρ̄) not divisible by 4.

**Acceptance.**

- Check that (W_r) does not trivially give (L_r): (L_r) covers every weight at odd p while (W_r) covers only weight 2, so Theorem 3.2 is a genuine statement (the source notes only the obvious converse, that (L_r) implies (W_r))
- Check the bookkeeping 'at most r primes' against an example where a change of prime adds a divisor to the conductor

**Prerequisites.** [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Uses.**

- ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction: (W_r) ⇒ (L_r).
- ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1: (W_1).
- ClassicalSerreModularity:R27.3, R27.5: Conductor-count and dyadic induction need the direction of monotonicity and the distinction between odd conductor and bounded dyadic valuation.

**Planning API.**

| Proposed name | Role | Statement |
| --- | --- | --- |
| `TauCeti.SerreConjecture.HypL` | constructor | For r≥1 quantify over every S-type finite-field residual representation; if it is good-dihedral, N is odd with at most r distinct prime divisors and p=2 implies k=2, conclude modularity. |
| `TauCeti.SerreConjecture.HypW` | constructor | For r≥1 use the same quantification with k=2 in every characteristic. |
| `TauCeti.SerreConjecture.HypD` | constructor | For r≥0 quantify over S-type good-dihedral representations of odd characteristic with 2^(r+1) not dividing N, and conclude modularity. |
| `TauCeti.SerreConjecture.hypL_imp_hypW` | relation | For r≥1, HypL r implies HypW r by restriction to weight two. |
| `TauCeti.SerreConjecture.hypL_mono` | relation | For 1≤r≤s, HypL s implies HypL r; the reverse direction is not a consequence of inclusion. |
| `TauCeti.SerreConjecture.hypW_mono` | relation | For 1≤r≤s, HypW s implies HypW r. |
| `TauCeti.SerreConjecture.hypD_mono` | relation | For r≤s, HypD s implies HypD r: exclusion of 2^(r+1) implies exclusion of 2^(s+1). |

**Unit-test statements.**

- `hypL_imp_hypW_test` (compatibility): For r≥1 and any supplied proof of HypL r, specialize it to an S-type good-dihedral weight-two representation with odd N and at most r prime factors to obtain exactly HypW r.
- `hypD_even_conductor` (non-example): For an S-type good-dihedral representation with odd characteristic and N=2q² (q odd), the D1 conductor premise holds while the Lr/Wr odd-conductor premise fails. Do not assert that such a representation exists merely from the integer example.
- `hyp_count_primes` (computation): For distinct odd primes q,3,5, conductor N=3·5·q² has three distinct prime factors: it satisfies the L3/W3 conductor bound and fails the L2/W2 bound, regardless of the exponent 2 at q.
- `hyp_dyadic_weight` (degenerate): In characteristic 2 the Lr premise admits weight 2 and rejects weight 4; in odd characteristic Lr permits both weights whereas Wr rejects weight 4.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §3.1, p. 5 of the preprint. (L_r).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 3.4, p. 6 of the preprint. (D_r).

<a id="r27-2-prime-gap-estimates-driving-the-weight-recursion"></a>

#### The explicit prime-gap inequalities that make the weight recursion terminate

Identifier: `ClassicalSerreModularity:R27.2/prime-gap-estimates-driving-the-weight-recursion`. Kind: lemma.

KW §7’s arithmetic application imports the odd estimate (1) from R26.3/chebyshev-next-prime and the consecutive-prime bound from R26.3/next-prime-ratio. In the exact next-prime proof, if P−1 has no odd factor then P is Fermat and 2^e∥P−1 with e≥4 (P≥17). The separate dyadic requirement is (2^(e−1)+2)P+(2^(e−1)−2)≤2^e p. It implies (2^(e−1)+2)(P−1)+2·2^e≤(p+1)2^e, KW (4). Choose an even exponent i in [(P−1)/2, ((2^(e−1)+2)/2^e)(P−1)], whose length is 2 when P is Fermat. For odd ℓ use the half-open interval from R26.3. KW’s r counting conductor primes is never used as e. The decimal printed 1.46 has a repeating bar and denotes exactly 22/15.

**Hypotheses and scope.**

- the inequalities are needed only for p >= 5; smaller primes are handled by the separate mod 3 and mod 5 arguments
- Case (ii) requires the prime-power exponent e≥4, i.e. 16 divides P−1; e=1,2,3 are not covered. The conductor-count r stays fixed and is unrelated to e.
- the numerical verification for p <= 31 is by hand and is a finite exceptional check, not a consequence of the asymptotic estimate
- Khare's level-one paper [24] (not the Annals paper) proves the stronger statement that one can always find P with (i), for example P the smallest non-Fermat prime > p

**Proof obligations.**

- For a non-Fermat next prime P, the shared odd estimate applies; choose the exact odd prime-power divisor.
- For p≤31 the only next Fermat case in the induction is (p,P,e)=(13,17,4), which satisfies the dyadic inequality 176≤208 (strictly, not with equality).
- For p>31 use P/p<22/15≤3/2−1/p and 2^e/(2^(e−1)+2)≥3/2 for e≥4; the correction coefficient is ≤1.
- Multiply by positive denominators to derive (4). The closed dyadic interval contains an even i in each admissible even exponent coset; its endpoint/parity contract is checked explicitly.

**Acceptance.**

- Verify (1) and (2) by direct computation for every prime p <= 31, and record the list of (p, P, l^r) triples used
- Verify that (3) and (4) really give a nonempty integer interval for the exponent i in each case, including the parity constraint when l = 2

**Prerequisites.** [R26.3/chebyshev-next-prime](#r26-3-chebyshev-next-prime); [R26.3/next-prime-ratio](#r26-3-next-prime-ratio); [R26.3/finite-auxiliary-prime-checks](#r26-3-finite-auxiliary-prime-checks); [R26.3/weight-interval-containment](#r26-3-weight-interval-containment).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §7, p. 12 of the preprint. The estimates.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §7, Remark, p. 12 of the preprint. Khare's stronger form.

<a id="r27-2-theorem-3-2-weight-reduction"></a>

#### Theorem 3.2 (reduction to weight 2): (W_r) implies (L_r), with its three-part proof

Identifier: `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`. Kind: theorem. Planet: **Reduction to weight two**.

For a positive integer r, (W_r) implies (L_r). The proof is an induction on the residue characteristic p, with the cases p = 3 and p = 5 done separately and a general inductive step. Mod 3: lift a q-dihedral ρ̄ with k(ρ̄) <= 4 by Theorem 5.1(2), pass to rho_2; ρ̄_2 is q-dihedral hence non-solvable, k(ρ̄_2) = 2 by almost strict compatibility, and N(ρ̄_2) has at most r+1 prime divisors, namely those of N(ρ̄) together with 3. If ρ̄_2 is unramified at 3 one concludes by (W_r) and Theorem 4.1. Otherwise ρ̄_2 restricted to I_3 is nontrivial unipotent (because omega_3 has order 2), so ρ̄_2 restricted to D_3 is, up to unramified twist, upper triangular with diagonal (chi_2, 1); apply Theorem 5.1(4) with chi' = omega_{3,2}^2 and conclude through ρ̄'_3. Mod 5: same with chi' = omega_5^2 in Theorem 5.1(3), producing ρ̄'_5 of weight 4, then splitting on whether 3 divides N(ρ̄'_5). Inductive step: let P be the next prime after p, choose a prime power l^e exactly dividing P-1 satisfying (1) or (2) of section 7, and choose the twisting exponent i in the interval [(2m+1)^{-1} m (P-1), (m+1)(2m+1)^{-1}(P-1)] (respectively an even i in [(P-1)/2, (2^{e-1}+2)/2^e (P-1)] when l = 2); the estimates (3) and (4) then give k(ρ̄'_P) <= p+1 after a twist. Fix the conductor-count r throughout. After the return residual mod-P representation has weight≤p+1, it is still in characteristic P, so induction cannot yet be invoked. If p divides its conductor, use the weight-two lift and reduce at p; its prime support is contained in that of the prime-to-p part of P·N. If p does not divide its conductor, use the crystalline lift of that reduced weight and reduce at p with no added conductor prime. In both cases at most r primes divide the odd conductor, the good-dihedral prime persists, and the modularity hypothesis applies in the strictly smaller characteristic p. Transfer modularity through the third, second and first systems and restore twists.

**Hypotheses and scope.**

- throughout, ρ̄ is locally good-dihedral, p is odd, N(ρ̄) is odd and has at most r prime divisors
- the mod 3 step uses that omega_3 has order 2, so ramification at 3 is unipotent; the mod 5 step uses that omega_5 has order 4
- the choice of i in the inductive step is constrained by the prime estimates AND, when l = 2, by a parity condition needed for the lift to be odd
- at every change of prime the new residual representation is again q-dihedral by Lemma 6.3, which is what keeps the residually degenerate cases out of reach

**Proof obligations.**

- Base cases p = 3 and p = 5 are run explicitly, each splitting on whether the auxiliary residual representation is ramified at the old prime.
- In the general step, Theorem 5.1(2) gives a weight-2 lift with prescribed inertial Weil-Deligne parameter at P; reduction mod l gives ρ̄_l, q-dihedral with conductor divisible by at most r+1 primes.
- If ρ̄_l is unramified at P the conductor drops to r primes and the inductive hypothesis (in characteristic l <= p) applies.
- Otherwise Theorem 5.1(3) is applied to a twist ρ̄'_l with 2 <= k <= l+1 (when l is odd), producing a system whose P-adic member has residual weight <= p+1 by the estimates, and whose conductor is odd with at most r prime divisors.
- Check removal of the foil from fixed ramification: if ℓ does not divide the original N, the second system is crystalline of weight two at ℓ and has unramified Weil–Deligne parameter there, so ℓ does not divide the return conductor. If ℓ divides the return conductor, it already divided N. Thus the asserted ≤r conductor count is justified; almost strict compatibility without this local type is insufficient.
- Modularity is then transported back along the two systems, which are linked at l, by two applications of Theorem 4.1.
- It remains to show ρ̄'_P modular (and, at p = 5, ρ̄'_5): split on whether p (resp. 3) divides N(ρ̄'_P). If it does, lift by Theorem 5.1(2) and reduce mod p, obtaining an odd conductor with at most r prime divisors (a subset of those of the prime-to-p part of P N(ρ̄'_P)); if it does not, lift by Theorem 5.1(1) and reduce mod p. In both cases the residual representation is q-dihedral and modular by the inductive hypothesis (at p = 5, by the mod 3 case), and Theorem 4.1 gives modularity of the lift, hence of ρ̄'_P.
- Fix r≥1 and use strong induction on the natural-number residue characteristic; p=2 is HypW itself, p=3 and p=5 use the explicit source branches.
- In the general step for new prime P let p be its predecessor. Return to weight≤p+1 at P, then perform the final reduction at p described in the statement. This, not the weight change itself, strictly lowers the induction variable.
- All reductions lie below max(Q(N/q²),P), so Lemma 6.3 preserves the good-dihedral prime. Count prime support when exchanging p for P, without confusing it with the prime-power exponent e.

**Acceptance.**

- Run the smallest nontrivial transition (p = 5, P = 7) and exhibit the admissible interval of exponents i explicitly
- Check that at each recursive call either the residue characteristic strictly decreases or the number of prime divisors of the conductor strictly decreases, and record the well-founded measure; a change of prime alone is not a decrease
- The final reduction at the predecessor characteristic is mandatory. Establish that the foil does not add a new conductor prime by the crystalline weight-two local condition; do not infer this from a numerical weight bound.

**Prerequisites.** [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R27.2/prime-gap-estimates-driving-the-weight-recursion](#r27-2-prime-gap-estimates-driving-the-weight-recursion); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [OrdinaryAutomorphicFormsAndModularityLifting:R21.6](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.2, p. 13 of the preprint. The mod 3 case.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.2, p. 14 of the preprint. The inductive step.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.2, p. 15 of the preprint. The weight bound.

## II. The classical conductor induction and modern odd-characteristic proof

The two following R27.1 nodes complete the shared package. Lemma 8.2 supplies the nonempty Frobenius class for the imported Chebotarev result; the insertion node applies prescribed-type lifting. Their later packet location changes neither their stable identifiers nor their actual prerequisites.


<a id="r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes"></a>

#### Lemma 8.2: auxiliary primes with Frobenius of complex-conjugation type (F_p-rational form)

Identifier: `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`. Kind: theorem. Planet: **Lemma 8.2: Chebotarev choice of auxiliary primes**.

Let p ≡ 1 (mod 4) be prime and ρ̄ : G_ℚ → GL₂(𝔽_p) of S-type, with coefficients in the PRIME field 𝔽_p, whose image is not solvable. Let ρ̄_proj be its projectivisation and c a complex conjugation. There is a set of primes q of positive Dirichlet density, unramified in ρ̄, such that (i) ρ̄_proj(Frob_q) and ρ̄_proj(c) are conjugate in ρ̄_proj(G_ℚ); (ii) q ≡ 1 mod ℓ for every prime ℓ ≤ p − 1, and q ≡ 1 mod 8; (iii) q ≡ −1 mod p. Consequently Tr ρ̄(Frob_q) = 0, p | q + 1, and ρ̄|_{D_q} is, up to an unramified twist, diag(χ̄_p, 1) with χ̄_p(Frob_q) = −1. Dieulefait–Pacetti Lemma 1.15 is the same statement, cited from KW I.

**Hypotheses and scope.**

- the coefficients are 𝔽_p and not 𝔽̄_p: KW I record that an earlier version allowed 𝔽̄_p-coefficients and that Dieulefait and Wiese pointed out that a rationality hypothesis may be necessary. Every use first makes the residual representation 𝔽_p-valued (KW I §8.4: p′ splits completely in the coefficient field E; DP Paso 2: q splits in K)
- p ≡ 1 mod 4 is used twice: ρ̄_proj(c) lies in PSL₂(𝔽_p) when the projective image is PGL₂(𝔽_p) (det ρ̄(c) = −1 is then a square), and −1 is a square mod p, which makes (iii) compatible with splitting in L
- non-solvable image gives, by Dickson, projective image PSL₂(𝔽_p), PGL₂(𝔽_p) or A₅; PSL₂(𝔽_p) (p > 3) and A₅ are simple and non-abelian, which bounds their intersection with an abelian extension
- S-type here means only continuous, absolutely irreducible and odd, supplied by R01.3. No Serre weight or modularity witness is used.

**Proof obligations.**

- Import Dickson's classification (ArithmeticGaloisRepresentations R01.4/dickson-classification-and-the-dyadic-refinement) in its prime-field form, requested from R01.4: a non-solvable subgroup of GL₂(𝔽_p) has projective image PSL₂(𝔽_p), PGL₂(𝔽_p) or A₅. This uses no modularity theorem and nothing from R26.
- Let M be the field cut out by ρ̄_proj and C the cyclotomic field generated by µ₈, µ_ℓ for odd ℓ < p and µ_p. C/ℚ is abelian and PSL₂(𝔽_p), A₅ have no nontrivial abelian quotient, so L = M ∩ C has degree 1 or 2 over ℚ; in degree 2 the image is PGL₂(𝔽_p) and L is the fixed field of PSL₂(𝔽_p).
- The four conditions are q ≡ 1 mod 8, χ̄_ℓ(Frob_q) = 1 for odd ℓ < p, χ̄_p(Frob_q) = −1 and ρ̄_proj(Frob_q) ~ ρ̄_proj(c). The first three together make Frob_q trivial on every quadratic subfield of C, hence on L: on ℚ(i) and ℚ(√±2) by q ≡ 1 mod 8, on ℚ(√ℓ*) by q ≡ 1 mod ℓ, and on ℚ(√p) because q ≡ −1 mod p and −1 is a square mod p. The fourth makes Frob_q trivial on L because ρ̄_proj(c) ∈ PSL₂(𝔽_p). So the conditions are compatible and describe a nonempty union of conjugacy classes of Gal(MC/ℚ).
- The Chebotarev density theorem (Tau Ceti Chebotarev, Layer 10: Dirichlet-density Chebotarev) for the Galois extension MC/ℚ gives such q with density |X|/[MC : ℚ] > 0, X the union of conjugacy classes; discard the finitely many ramified primes.
- ρ̄_proj(Frob_q) has order 2, like ρ̄_proj(c), so ρ̄(Frob_q) has eigenvalues α, −α and trace 0; with χ̄_p(Frob_q) = q = −1 this is diag(χ̄_p, 1) after the unramified twist by α.

**Acceptance.**

- Check the degree bound on L for projective image PGL₂(𝔽₅) ≅ S₅: its abelianisation is ℤ/2, and L is the fixed field of PSL₂(𝔽₅) ≅ A₅
- Check a numerical instance of the congruences: for p = 5 the prime q = 409 satisfies q ≡ 1 mod 8, q ≡ 1 mod 3 and q ≡ −1 mod 5 (checked in the suggested Lean file)

**Prerequisites.** [ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.3](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev](../../../content/tau-ceti/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

**Component ownership.** proposed: ClassicalSerreModularity:R27.1a; title: Good-dihedral primes: definition, image and the Chebotarev choice; status: proposed in this packet's restructure entry and in that of part R26.1; the stage split is the maintainer's to apply; note: The node id and the parent layer R27.1 are unchanged. Every prerequisite of this node is in ArithmeticGaloisRepresentations R01.3–R01.4 or Tau Ceti's Chebotarev roadmap, so the node belongs to the sub-layer that R33.2–R33.3 import.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma 8.2, p. 17 of the preprint. The hypotheses, with 𝔽_p coefficients (the bar is absent on the page image).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma 8.2 (ii), (iii), p. 17 of the preprint. Conditions (ii) and (iii).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Remark after Lemma 8.2, p. 17 of the preprint. The rationality correction; the page image shows 𝔽̄_p in the Remark.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Lemma 8.2, p. 18 of the preprint. The compatibility of the Chebotarev conditions.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma 1.15, p. 9 of the arXiv version. DP reproduce the lemma with 𝔽_p coefficients and prove it by citing KW I Lemma 8.2.

<a id="r27-1-good-dihedral-prime-insertion"></a>

#### Inserting a good dihedral prime with Theorem 5.1(4) (KW I §8.4)

Identifier: `ClassicalSerreModularity:R27.1/good-dihedral-prime-insertion`. Kind: theorem.

Let p′ > 5 be a prime with p′ ≡ 1 mod 4, let ρ̄′ : G_ℚ → GL₂(𝔽_{p′}) be of S-type with non-solvable image and k(ρ̄′) = 2, and let q be a prime given by Lemma 8.2 for ρ̄′. Then p′ | q + 1 and ρ̄′|_{D_q} is, up to unramified twist, (χ̄_{p′} ∗; 0 1), so KW I Theorem 5.1(4) gives an almost strictly compatible system (ρ′_λ) lifting ρ̄′, minimally ramified at primes ≠ p′, q, of weight 2 and crystalline at p′, with ρ′_{p′}|_{I_q} ≅ χ′ ⊕ χ′^q for a character χ′ of I_q of level 2 and p′-power order. If moreover every prime at which ρ̄′ ramifies is smaller than p′, then for every prime s < p′, s ≠ q, the residual representation ρ̄′_s is good dihedral for q (Definition 2.1 with t = p′) and so has non-solvable image (Lemma 6.3).

**Hypotheses and scope.**

- p′ must split completely in the coefficient field so that ρ̄_{p′} is 𝔽_{p′}-valued, as Lemma 8.2 requires
- k(ρ̄′) = 2 makes the new system crystalline at p′ (Theorem 5.1(4) gives the Weil–Deligne parameter of item 2, unramified when k = 2), so p′ does not divide the new conductor
- Theorem 5.1(4) needs p′ | q + 1 and the local shape (χ̄_{p′} ∗; 0 1) at q: these are Lemma 8.2 (iii) and (i)
- characters χ′ of level 2 and p′-power order exist because p′ ≠ 2 (Remark after Theorem 5.1)

**Proof obligations.**

- Lemma 8.2 (i), (iii): ρ̄′(Frob_q) has trace 0 and χ̄_{p′}(Frob_q) = −1, so ρ̄′|_{D_q} is an unramified twist of diag(χ̄_{p′}, 1), and p′ | q + 1.
- Apply Theorem 5.1(4) (supplied by PotentialModularityAndCompatibleSystems R24.6) with a pair {χ′, χ′^q} of level-2 characters of p′-power order.
- For s < p′, s ≠ q: by compatibility at q, ρ′_s|_{I_q} ≅ χ′ ⊕ χ′^q; reduction modulo s is injective on this group of p′-power order, so ρ̄′_s|_{I_q} = ψ ⊕ ψ^q with ψ ≠ 1 of order a power of t = p′, t | q + 1, and t > max(Q(N(ρ̄′_s)/q²), 5, s) because every other ramified prime is smaller than p′.
- Definition 2.1(ii) for ρ̄′_s: q ≡ 1 mod 8 and q ≡ 1 mod every prime ≤ p′ − 1 (Lemma 8.2 (ii)), which contains every prime ≤ max(Q(N(ρ̄′_s)/q²), s). Lemma 6.3(i) then gives non-solvable image.

**Acceptance.**

- Check on p′ = 13, q = 406561 (a prime given by the congruences of Lemma 8.2): 13 | q + 1 and 13 ∤ q − 1, so χ′ has level 2 (checked in the suggested Lean file)
- Check that no prime ≥ p′ divides N(ρ̄′_s)/q², by listing the ramified primes of (ρ′_λ)

**Prerequisites.** [R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes](#r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Component ownership.** proposed: ClassicalSerreModularity:R27.1b; title: Inserting a good-dihedral prime (KW I §8.4); status: proposed in this packet's restructure entry; the stage split is the maintainer's to apply; note: An application of KW I Theorem 5.1(4) (PotentialModularityAndCompatibleSystems R24.3, R24.6) to the three R27.1a declarations. It is used by the classical route only (R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice); no node of R33.1–R33.4 has it as a prerequisite.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/GoodDihedral; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), 8.4, p. 18 of the preprint. The insertion step of the proof of Theorem 3.4.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Remark after Theorem 5.1, p. 10 of the preprint. Level-2 characters of p-power order exist for odd p.

<a id="r27-3"></a>

### R27.3. Killing ramification and the double induction

Starting from (W₁), alternate (Wᵣ) ⇒ (Lᵣ) with (Lᵣ) ⇒ (Wᵣ₊₁). Retain local minimality at the good-dihedral prime when changing coefficient characteristic.

<a id="r27-3-theorem-3-1-killing-ramification"></a>

#### Theorem 3.1 (killing ramification in weight 2): (L_r) implies (W_{r+1})

Identifier: `ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification`. Kind: theorem. Planet: **Killing ramification (KW Theorem 3.1)**.

For a positive integer r, (L_r) implies (W_{r+1}). Proof: let ρ̄ be of S-type, locally good-dihedral for a prime q, with k(ρ̄) = 2 and N(ρ̄) odd with at most r + 1 prime divisors. Choose a prime s ≠ q dividing N(ρ̄). By Theorem 5.1(1) construct an almost strictly compatible lift (ρ_ι) and consider ρ_s. Then ρ̄_s is of S-type, is q-dihedral and so has non-solvable image (Lemma 6.3(ii)), and N(ρ̄_s) has at most r prime divisors, because the prime divisors of N(ρ̄_s) are among those of the prime-to-s part of N(ρ̄). By (L_r), ρ̄_s is modular, and Theorem 4.1 (at s) makes (ρ_ι), hence ρ̄, modular.

**Hypotheses and scope.**

- s must be different from q: the good-dihedral prime is deliberately not killed at this step
- the conductor bookkeeping uses that the ramification at s is absorbed into the coefficient prime, so s drops out of the conductor — this is the whole content of "killing ramification"
- Theorem 5.1(1) requires k(ρ̄) = 2 when p = 2 and gives a lift minimally ramified away from p and crystalline of weight k(ρ̄) at p
- Theorem 4.1 at s requires ρ̄_s of non-solvable image if s = 2 and ρ̄_s|_{ℚ(µ_s)} absolutely irreducible if s > 2; the source derives non-solvable image from q-dihedrality (Lemma 6.3(ii)), and absolute irreducibility over ℚ(µ_s) follows since a reducible restriction would make the image solvable

**Proof obligations.**

- The proof is three sentences in the source and is reproduced above.
- The published Annals paper describes the same device in general form in §6.2 ("killing ramification"): take λ₀ above a prime of ramification, apply its Theorem 4.2 to a cyclotomic twist of ρ̄_{λ₀} to get a system with a strictly smaller ramification set, and induct; its Theorem 6.2 is conditional (on the modularity lifting conjecture and on de Rham members of weight k(ρ̄)) and concludes only for p > 2 and N(ρ̄) odd.

**Acceptance.**

- Check that after the step the conductor really loses the prime s and gains nothing, using the inclusion of prime divisor sets stated in the source
- Check that the good-dihedral prime q survives the step, i.e. that ρ̄_s is still q-dihedral

**Prerequisites.** [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic](../../../content/campaign/GL2ModularityLifting/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), 8.1, p. 13 of the preprint. The lift used to kill the prime s.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), 8.1, p. 13 of the preprint. The exact conductor bookkeeping; this, not a general monotonicity claim, is what makes the induction work.
- [kw-annals-2009](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf), §6.2 Killing ramification, printed p. 250. The general formulation of the same device in the published Annals paper, at §6.2 (not §5.2, the numbering of the preprint cited by Khare).

<a id="r27-3-theorem-3-3-initial-case"></a>

#### Theorem 3.3: the initial case (W_1)

Identifier: `ClassicalSerreModularity:R27.3/theorem-3-3-initial-case`. Kind: theorem. Planet: **Theorem 3.3: the initial case (W₁)**.

(W_1) holds: every ρ̄ of S-type that is locally good-dihedral (for a prime q), with k(ρ̄) = 2 and N(ρ̄) odd with at most one prime divisor, is modular. Such a ρ̄ has N(ρ̄) = q²: q divides N(ρ̄) because ρ̄|_{I_q} ≅ ψ ⊕ ψ^q with ψ ≠ 1, so q is the only prime divisor, and the tame representation ψ ⊕ ψ^q has no inertia invariants, so the conductor exponent is 2. Thus ρ̄ is unramified outside p and q, tamely ramified at q (ψ has order a power of t ≠ q), and |ρ̄(I_q)| = ord ψ is a power of the odd prime t > 5. Corollary 8.1(ii) (R26.6) says that ρ̄ arises from S₂(Γ₁(q²)).

**Hypotheses and scope.**

- q is odd (q ≡ 1 mod 8), as Corollary 8.1(ii) requires
- the residue characteristic p may be 2: (W_1) imposes k(ρ̄) = 2 for every p, and Corollary 8.1(ii) includes p = 2
- t > p by Definition 2.1(i), so the branch t = p in the proof of Corollary 8.1(ii) does not arise

**Proof obligations.**

- Unwind (W_1) (R27.2/hypotheses-Lr-Wr-and-Dr) and Definition 2.1 (R27.1): the only prime of the odd conductor is the good dihedral prime q, and ρ̄|_{I_q} ≅ ψ ⊕ ψ^q is tame with |ρ̄(I_q)| = t^a, t > 5 odd.
- Apply Corollary 8.1(ii), which KW I derive from Corollary 8.1(i), i.e. Khare's Corollary 1.2 with its corrected proof (R26.6).

**Acceptance.**

- Check that ψ^q ≠ 1 and that the Artin conductor exponent of ψ ⊕ ψ^q at q is exactly 2
- Check that Corollary 8.1(ii)'s hypothesis "unramified outside p and one other odd prime" holds with the other prime equal to the good dihedral prime

**Prerequisites.** [R26.6/corollary-8-1-ii-and-the-statement-W1](#r26-6-corollary-8-1-ii-and-the-statement-w1); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [ArithmeticGaloisRepresentations:R01.3](../../../content/campaign/ArithmeticGaloisRepresentations/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 3.3, p. 6 of the preprint. The statement.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.3, p. 15 of the preprint. Where it comes from.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Corollary 8.1(ii), p. 16 of the preprint. The shape that a good dihedral prime produces.

<a id="r27-3-double-induction-assembly"></a>

#### The assembly: (W_1) and Theorems 3.1–3.2 give every (L_r)

Identifier: `ClassicalSerreModularity:R27.3/double-induction-assembly`. Kind: theorem. Planet: **The (L_r)/(W_r) double induction**.

For every r ≥ 1, (L_r) holds, by induction on r: Theorem 3.3 gives (W_1) and Theorem 3.2 turns it into (L_1); for the step, (L_r) implies (W_{r+1}) by Theorem 3.1, which Theorem 3.2 turns into (L_{r+1}). KW I describe the proof of Theorem 1.2 as a double induction on two parameters, the number of prime divisors of N(ρ̄) and the residue characteristic p (§1.2): the induction on r is this node, the induction on p is inside Theorem 3.2 (R27.2). It is NOT a claim that the conductor decreases at every congruence: inside the proof of Theorem 3.2 the auxiliary residual representations can have r + 1 prime divisors. As RS-06 requires, the consequence Theorem 1.2 is derived in R27.4 (R27.4/theorem-1-2), and this induction does not use it.

**Hypotheses and scope.**

- the whole chain is restricted to locally good-dihedral ρ̄ until Theorem 3.4 removes that restriction
- (L_r) allows p = 2 only with k(ρ̄) = 2; for odd p there is no weight condition
- each round uses Theorem 3.2 once and Theorem 3.1 once; Theorem 3.3 is used only at r = 1

**Proof obligations.**

- §3.2: (L_1) from Theorem 3.3 and Theorem 3.2.
- Step: (L_r) ⇒ (W_{r+1}) (Theorem 3.1) ⇒ (L_{r+1}) (Theorem 3.2).

**Acceptance.**

- Exhibit the well-founded measure on pairs (number of prime divisors, residue characteristic) and verify that each of Theorems 3.1 and 3.2 moves strictly along it
- Check that neither Theorem 3.1 nor Theorem 3.2 invokes Theorem 1.2 or any (D_r), so the induction is not circular

**Prerequisites.** [R27.3/theorem-3-1-killing-ramification](#r27-3-theorem-3-1-killing-ramification); [R27.3/theorem-3-3-initial-case](#r27-3-theorem-3-3-initial-case); [R27.2/theorem-3-2-weight-reduction](#r27-2-theorem-3-2-weight-reduction); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §3.2, p. 6 of the preprint. The start of the induction.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §3.2, p. 6 of the preprint. The literal two-stage induction step.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.2, p. 3 of the preprint. The two parameters.

<a id="r27-3-d0-from-all-lr"></a>

#### All (L_r) give (D_0)

Identifier: `ClassicalSerreModularity:R27.3/d0-from-all-lr`. Kind: lemma.

If (L_r) holds for every r ≥ 1, then (D_0) holds. A ρ̄ as in (D_0) is locally good-dihedral, has odd residue characteristic and odd conductor (2¹ ∤ N(ρ̄)); its good dihedral prime divides N(ρ̄), so r = ω(N(ρ̄)) ≥ 1, and (L_r) applies because its weight condition (b) concerns only p = 2.

**Hypotheses and scope.**

- (D_0)(c) "N(ρ̄) not divisible by 2^{0+1}" is exactly the oddness in (L_r)(c)
- (D_0)(b) excludes p = 2, so (L_r)(b) is vacuous

**Proof obligations.**

- Take r = ω(N(ρ̄)) and apply (L_r).

**Acceptance.**

- Check r ≥ 1: the good dihedral prime q divides N(ρ̄), so N(ρ̄) > 1
- Check that N(ρ̄) = 6 satisfies (D_1)(c) but not (D_0)(c): 2 | 6 and 4 ∤ 6 (checked in the suggested Lean file)

**Prerequisites.** [R27.3/double-induction-assembly](#r27-3-double-induction-assembly); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §3.2, p. 6 of the preprint. The reduction of (D_0) to all (L_r).

<a id="r27-4"></a>

### R27.4. Removing good-dihedral hypotheses and refining modularity

The raising-levels argument removes the good-dihedral hypothesis. A separate conditional argument takes an already modular residual representation to its exact Serre weight and conductor; the modern proof imports this conditional argument, not the classical induction.

<a id="r27-4-auxiliary-characteristic-choice"></a>

#### Choosing the auxiliary characteristic p′ in the proof of Theorem 3.4

Identifier: `ClassicalSerreModularity:R27.4/auxiliary-characteristic-choice`. Kind: lemma.

Let ρ̄ be of S-type with ρ̄|_{ℚ(µ_p)} absolutely irreducible (non-solvable image if p = 2), and let (ρ_λ) be an E-rational almost strictly compatible lift from Theorem 5.1(2), ramified at the set S ∪ {p}. Then either ρ̄ is modular, or there is a prime p′ > 5 with p′ ≡ 1 mod 4, larger than every prime in S ∪ {p} and split completely in E, such that ρ̄_{p′} : G_ℚ → GL₂(𝔽_{p′}) is absolutely irreducible of Serre weight 2 with non-solvable image. For p′ ∉ S ∪ {p, 2}: k(ρ̄_{p′}) = 2 by almost strict compatibility; ρ̄_{p′} is not induced from the quadratic subfield of ℚ(µ_{p′}) (Lemma 6.2(ii) would force k ∈ {(p′+1)/2, (p′+3)/2}); the projective image of ρ̄_{p′}(I_{p′}) has an element of order p′ − 1 or p′ + 1, hence ≥ 6; so by Dickson a solvable projective image is dihedral, and then ρ̄_{p′} is modular by Lemma 6.2(i) and (ρ_λ), hence ρ̄, is modular by a lifting theorem for weight-two lifts with ρ̄_{p′}|_{ℚ(µ_{p′})} absolutely irreducible (Diamond's, in the source).

**Hypotheses and scope.**

- almost all residual representations of an irreducible compatible system are absolutely irreducible; only those are considered
- k(ρ̄_{p′}) = 2 means ρ̄_{p′}|_{I_{p′}} is (ω_{p′} ∗; 0 1) or ω_{p′,2} ⊕ ω_{p′,2}^{p′}, of projective order divisible by p′ − 1 or p′ + 1
- p′ ≡ 1 mod 4 and complete splitting in E are Chebotarev conditions on E(i), so infinitely many p′ qualify
- the dihedral branch uses a lifting theorem with residually dihedral image (Diamond, "An extension of Wiles' results", Th. 4.1 in the source); GL2ModularityLifting R22.5/kisin-potentially-bt-lifting (3) covers it

**Proof obligations.**

- Almost strict compatibility at p′ ∉ S ∪ {p, 2}: ρ_{p′} is crystalline of weight 2, so k(ρ̄_{p′}) = 2.
- Lemma 6.2(ii) (R27.1): ρ̄_{p′}|_{ℚ(µ_{p′})} reducible would give k ∈ {(p′+1)/2, (p′+3)/2} ≠ 2 for p′ > 5.
- The inertia image gives a projective element of order ≥ 6; Dickson leaves only the dihedral solvable case, handled by Lemma 6.2(i) and the dihedral lifting theorem.
- Otherwise pick p′ by Chebotarev in E(i).

**Acceptance.**

- Check the order bound for the smallest case p′ = 7: p′ − 1 = 6 and p′ + 1 = 8 (checked in the suggested Lean file)
- Check that complete splitting of p′ in E makes ρ̄_{p′} 𝔽_{p′}-valued, as Lemma 8.2 requires

**Prerequisites.** [R27.1/dickson-and-the-dyadic-solvable-refinement](#r27-1-dickson-and-the-dyadic-solvable-refinement); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting](../../../content/campaign/GL2ModularityLifting/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.4, p. 17 of the preprint. Where the weight of the auxiliary residual representation forces a large projective image.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.4, p. 17 of the preprint. The choice of p′.

<a id="r27-4-theorem-3-4-raising-levels-and-the-chebotarev-choice"></a>

#### Theorem 3.4 (raising levels): (D_r) removes the good-dihedral hypothesis

Identifier: `ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`. Kind: theorem. Planet: **Raising levels (KW Theorem 3.4)**.

Theorem 3.4: assume (D_r) for a given r ≥ 0. Then every ρ̄ of S-type of residue characteristic p whose conductor is not divisible by 2^{r+1}, with k(ρ̄) = 2 if p = 2 and r = 0, is modular. Proof (§8.4): reduce to ρ̄|_{ℚ(µ_p)} absolutely irreducible (Lemma 6.2) and non-solvable image when p = 2 (Lemma 6.1); lift by Theorem 5.1(2) to an E-rational almost strictly compatible system (ρ_λ); choose the auxiliary prime p′ (R27.4/auxiliary-characteristic-choice); take q from Lemma 8.2 for ρ̄_{p′} and insert it as a good dihedral prime with Theorem 5.1(4) (R27.1/good-dihedral-prime-insertion), obtaining (ρ′_λ) linked to (ρ_λ) at ρ̄_{p′}; let s be the largest prime < p′: ρ̄′_s is good dihedral for q, s > 2 and 2^{r+1} ∤ N(ρ̄′_s), so (D_r) makes ρ̄′_s modular; Theorem 4.1 at s makes (ρ′_λ) modular, and Theorem 4.1 at p′ makes (ρ_λ), hence ρ̄, modular. (The id keeps the reviewed decomposition's; Lemma 8.2 itself is R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes.)

**Hypotheses and scope.**

- k(ρ̄) = 2 is required only when p = 2 and r = 0: for k(ρ̄) = 4 the Theorem 5.1(2) lift is Steinberg at 2, so every member of the first system at a coefficient prime λ ∤ 2 has dyadic conductor exponent 1, and the argument bounds v₂(N(ρ̄′_s)) only by 1, which (D_0) cannot use
- the conductor condition is propagated as a bound, not an equality. Let A be the dyadic conductor exponent of the first system (ρ_λ): the exponent a(r₂) of its Weil–Deligne parameter r₂ at 2, shared by every member ρ_λ with λ ∤ 2 (and by the 2-adic member when ρ̄ is irreducible, by almost strict compatibility). (i) p odd: ρ_p is minimally ramified at 2, so A = v₂(N(ρ̄)) ≤ r. (ii) p = 2, k(ρ̄) = 2: the inertial parameter at 2 is (1 ⊕ 1, 0), so A = 0 ≤ r. (iii) p = 2, k(ρ̄) = 4: the inertial parameter at 2 is (id, N) with N ≠ 0, so A = 0 + dim V^{I₂} − dim ker N = 2 − 1 = 1, while v₂(N(ρ̄)) = 0 because N(ρ̄) is prime to p; the theorem excludes r = 0 here, so A = 1 ≤ r. Then v₂(N(ρ̄_{p′})) ≤ A (reduction at p′ ≠ 2 cannot increase the conductor); the dyadic exponent of the second system (ρ′_λ) equals v₂(N(ρ̄_{p′})), because ρ′_{p′} is minimally ramified at 2 (Theorem 5.1(4): minimal at primes ≠ p′, q, and q ≡ 1 mod 8 is odd); and v₂(N(ρ̄′_s)) is at most that exponent (reduction at s ≠ 2). So v₂(N(ρ̄′_s)) ≤ A ≤ r, that is 2^{r+1} ∤ N(ρ̄′_s). Minimality refers to the intermediate ρ̄_{p′}, not to ρ̄, and each reduction may lower the conductor, so no equality with v₂(N(ρ̄)) is claimed
- s > 2 because p′ > 5; s odd is what (D_r)(b) needs
- the last transfer is Theorem 4.1 at p′, where ρ̄_{p′} has non-solvable image, so no residually degenerate lifting theorem is needed

**Proof obligations.**

- Reduce to ρ̄|_{ℚ(µ_p)} absolutely irreducible (Lemma 6.2) and to non-solvable image at p = 2 (Lemma 6.1).
- Build an almost strictly compatible system by Theorem 5.1(2) and choose p′ (auxiliary-characteristic-choice).
- Apply Lemma 8.2 to ρ̄_{p′} and insert q (good-dihedral-prime-insertion).
- Let s be the largest prime < p′, so s > 2; ρ̄′_s is good-dihedral for q, and v₂(N(ρ̄′_s)) ≤ (dyadic exponent of (ρ′_λ)) = v₂(N(ρ̄_{p′})) ≤ A ≤ r by the chain of the second hypothesis: PotentialModularityAndCompatibleSystems R24.6/residual-members (iii) for the two reductions, minimality at 2 of the Theorem 5.1(4) lift, and, for A, the Weil–Deligne parameters of R24.3/theorem-5-1-part-2-weight-two with the conductor of ArithmeticGaloisRepresentations R01.3 (monodromy term included). So 2^{r+1} ∤ N(ρ̄′_s) and (D_r) applies.
- Theorem 4.1 at s, then along the link at ρ̄_{p′}, gives modularity of (ρ_λ) and of ρ̄.

**Acceptance.**

- Boundary case p = 2, k(ρ̄) = 4, r = 1: v₂(N(ρ̄)) = 0 (N(ρ̄) is prime to 2), the first system has dyadic exponent A = 1 (unramified semisimple part, rank-one monodromy: 2 − dim ker N = 1), and the chain gives v₂(N(ρ̄′_s)) ≤ 1 = r; equality with the original exponent 0 is neither claimed nor needed
- Check that conductor drop is allowed at each reduction: a member that is Steinberg at a prime can reduce to a representation unramified there, as ρ̄_{E,5} for the elliptic curve 11a1 is unramified at 11 although E has multiplicative reduction at 11 (Δ = −11⁵); the chain uses only ≤
- Check the role of k(ρ̄) = 2 at p = 2, r = 0 against the Steinberg type of the weight-4 lift of Theorem 5.1(2)

**Prerequisites.** [R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes](#r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes); [R27.1/good-dihedral-prime-insertion](#r27-1-good-dihedral-prime-insertion); [R27.4/auxiliary-characteristic-choice](#r27-4-auxiliary-characteristic-choice); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R27.1/dickson-and-the-dyadic-solvable-refinement](#r27-1-dickson-and-the-dyadic-solvable-refinement); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic](../../../content/campaign/GL2ModularityLifting/README.md); [PotentialModularityAndCompatibleSystems:R24.6/residual-members](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [ArithmeticGaloisRepresentations:R01.3](../../../content/campaign/ArithmeticGaloisRepresentations/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 3.4, p. 6 of the preprint. The conclusion of Theorem 3.4.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.4, p. 18 of the preprint. The characteristic in which (D_r) is applied.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §8.4, p. 18 of the preprint. The link through which modularity returns.

<a id="r27-4-strong-form-by-minimal-lifts"></a>

#### From modularity to weight k(ρ̄) and level N(ρ̄), including the scalar dyadic case

Identifier: `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`. Kind: theorem. Planet: **Weight and level from minimal lifts**.

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, and assume p odd, or p = 2 and k(ρ̄) = 2. Then ρ̄ arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))). If the projective image is dihedral — which covers ρ̄|_{G_{ℚ(µ_p)}} reducible for odd p, every solvable image at p = 2 (Lemma 6.1), and every ρ̄ induced from ℚ(i) — Lemma 6.2(i) gives the conclusion (Wiese's theorem at p = 2). Otherwise choose i with 2 ≤ k(ρ̄ ⊗ χ_p^i) ≤ p + 1 (p odd; i = 0 when p = 2) and put ρ̄′ = ρ̄ ⊗ χ_p^i, again of S-type with non-dihedral projective image, and with N(ρ̄′) = N(ρ̄) since twisting by χ_p leaves the prime-to-p conductor unchanged. Theorem 5.1(1) gives a lift ρ′_p of ρ̄′ that is minimally ramified at every prime ≠ p and crystalline of weight k(ρ̄′) at p (this is where k(ρ̄) = 2 is needed at p = 2); Theorem 4.1 makes ρ′_p modular, and the newform f′ with ρ_{f′} ≅ ρ′_p has weight k(ρ̄′), level prime to p (ρ′_p is crystalline) and level exactly N(ρ̄) away from p (a minimal lift has the conductor of ρ̄′ at every q ≠ p). Untwist (empty when i = 0, in particular at p = 2): ρ̄ = ρ̄′ ⊗ χ_p^{−i} is modular of level N(ρ̄) prime to p, since twisting by χ_p is the θ-operator on mod p forms of level prime to p; Edixhoven's weight theorem gives a mod p eigenform of type (N(ρ̄), k(ρ̄), ε) with representation ρ̄ (Serre's weight, with no exceptional case for p > 2), and as k(ρ̄) ≥ 2 the Deligne–Serre lifting lemma lifts it to a characteristic-zero eigenform of weight k(ρ̄) and level N(ρ̄), whose newform has level dividing N(ρ̄) and divisible by N(ρ̄) (the prime-to-p conductor of ρ̄ divides that of every characteristic-zero lift), hence equal to N(ρ̄). At p = 2 this includes ρ̄|_{D₂} scalar with non-dihedral projective image, where Buzzard's multiplicity-one level lowering is not available: the "missing case in characteristic 2" that KW I say Theorem 1.2(2) fills.

**Hypotheses and scope.**

- KW I state the refined conclusion in Theorem 1.2 but write out only modularity in §3.2 (Theorem 3.4 and the remark after it); this node supplies the passage to weight k(ρ̄) and level N(ρ̄) from the source's own Theorems 5.1(1) and 4.1 and Lemma 6.2(i), applied to a twist of weight in [2, p + 1], and imports the untwisting from SerreWeightAndLevelOptimisation R20.3 (source issue ClassicalSerreModularity/E9)
- Theorems 4.1(2)(i) and 5.1 assume 2 ≤ k(ρ̄) ≤ p + 1 for odd p, while Serre's weight reaches p² − 1: for p ≥ 5, ρ̄|_{I_p} ≅ χ̄_p ⊕ χ̄_p² has weight p + 3, while its twist by χ̄_p^{−1}, 1 ⊕ χ̄_p, has weight 2 and is in range (so, when ρ̄|_{D_p} is split, does its twist by χ̄_p^{−2}, of weight p − 1); so for k(ρ̄) > p + 1 the lift is built for the twist and the conclusion for ρ̄ needs the untwisting
- p = 2 with k(ρ̄) = 4 is excluded: Theorem 5.1(1) has no crystalline branch there; R27.6 imports the optimisation for that case
- "minimal" is KW I §5's notion (Diamond §3 for odd p, KW II §3.3.1 at p = 2), which preserves the prime-to-p conductor; it is stronger than "unramified wherever ρ̄ is"
- the scalar dyadic case has k(ρ̄) = 2 automatically: ρ̄|_{D₂} scalar is unramified up to twist, hence finite at 2
- representations induced from ℚ(i) are kept on the dihedral branch (Lemma 6.2(i)), separate from Buzzard's Theorem 2.8, which excludes them (SerreWeightAndLevelOptimisation R20.5)

**Proof obligations.**

- Dihedral projective image: Lemma 6.2(i) (R27.1).
- Otherwise twist: choose i with 2 ≤ k(ρ̄ ⊗ χ_p^i) ≤ p + 1 (AlgebraicModularFormsAndSerreWeights R15.4; i = 0 at p = 2); N(ρ̄ ⊗ χ_p^i) = N(ρ̄).
- Theorem 5.1(1) lift of ρ̄ ⊗ χ_p^i (PotentialModularityAndCompatibleSystems R24.6), Theorem 4.1 (R24.4; GL2ModularityLifting R22.5/R22.6), and read off weight and level from the local properties of the lift.
- Untwist: θ-operators (SerreWeightAndLevelOptimisation R20.3/ribet-twist-to-small-weight) and Edixhoven's weight theorem (R20.3/edixhoven-weight-theorem) give a mod p eigenform of weight k(ρ̄) and level N(ρ̄) for ρ̄; the Deligne–Serre lifting lemma (AlgebraicModularFormsAndSerreWeights R15.5) lifts it, and the level of its newform is N(ρ̄) by R24.6/residual-members (iii).

**Acceptance.**

- Check that the level of the newform equals N(ρ̄) at each q ≠ p, including q where ρ̄(I_q) is projectively cyclic of order p (the unipotent-type minimal lift)
- Check the scalar dyadic case: ρ̄|_{D₂} scalar ⇒ unramified up to twist ⇒ finite ⇒ k(ρ̄) = 2, so it lies inside the hypothesis
- Check the untwisting on ρ̄|_{I_p} ≅ χ̄_p ⊕ χ̄_p² with p ≥ 5 (Serre weight p + 3): Theorem 5.1(1) applies to ρ̄ ⊗ χ̄_p^{−1} (weight 2), and the conclusion is for ρ̄ at weight p + 3, not only for the twist

**Prerequisites.** [R27.1/dickson-and-the-dyadic-solvable-refinement](#r27-1-dickson-and-the-dyadic-solvable-refinement); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.5/kw-odd-prime-lifting](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.6/kw-dyadic-lifting](../../../content/campaign/GL2ModularityLifting/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [SerreWeightAndLevelOptimisation:R20.3/ribet-twist-to-small-weight](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.1, p. 2 of the preprint. The scalar dyadic case that KW I say Theorem 1.2(2) settles.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 5.1(1), p. 9 of the preprint. The minimal crystalline lift.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Lemma 6.2(i), p. 11 of the preprint. The dihedral branch at p = 2 (Wiese).

<a id="r27-4-theorem-1-2"></a>

#### KW I Theorem 1.2: odd conductor in odd characteristic, weight two in characteristic two

Identifier: `ClassicalSerreModularity:R27.4/theorem-1-2`. Kind: theorem. Planet: **Khare–Wintenberger Theorem 1.2**.

(1) For p odd, every ρ̄ of S-type with N(ρ̄) odd arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))). (2) For p = 2, every ρ̄ of S-type with k(ρ̄) = 2 arises from S₂(Γ₁(N(ρ̄))). Proof: (D_0) holds (R27.3/d0-from-all-lr); Theorem 3.4 with r = 0 makes every ρ̄ as in (1) or (2) modular (2¹ ∤ N(ρ̄) is the odd-conductor condition; in characteristic 2 the conductor is odd and k(ρ̄) = 2 is imposed); R27.4/strong-form-by-minimal-lifts gives weight k(ρ̄) and level N(ρ̄). Scope: at p = 2 the theorem does not give the strong form in Edixhoven's sense (unramified at 2 iff arising from a Katz form of weight 1); weight four at p = 2 and even conductor in odd characteristic are Theorem 9.1 (R27.5).

**Hypotheses and scope.**

- the ranges are exact: (1) needs N(ρ̄) odd; (2) needs k(ρ̄) = 2 and allows any (necessarily odd) conductor
- part (2) is where the qualitative-to-refined passage in characteristic 2 is completed in the scalar local case

**Proof obligations.**

- (D_0) from R27.3.
- Theorem 3.4 with r = 0 and the remark after it.
- Weight and level from R27.4/strong-form-by-minimal-lifts.

**Acceptance.**

- Check the ranges against the remark after Theorem 3.4: (D_0) gives odd p with N(ρ̄) odd and p = 2 with k(ρ̄) = 2; (D_1) gives all of characteristic 2 and odd p with 4 ∤ N(ρ̄)
- Check Theorem 1.2(2)'s scope: it does not give the Edixhoven-strong form at p = 2

**Prerequisites.** [R27.3/d0-from-all-lr](#r27-3-d0-from-all-lr); [R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice](#r27-4-theorem-3-4-raising-levels-and-the-chebotarev-choice); [R27.4/strong-form-by-minimal-lifts](#r27-4-strong-form-by-minimal-lifts); [R27.3/double-induction-assembly](#r27-3-double-induction-assembly).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 1.2, p. 2 of the preprint. The statement.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Remark after Theorem 3.4, p. 6 of the preprint. The ranges reached from (D_0).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.1, p. 3 of the preprint. Explicit scope limit at p = 2.

<a id="r27-5"></a>

### R27.5. The dyadic closure

Separate the weight-two dyadic claim, the congruence-at-three argument and (Dᵣ) for r≥2. Hypothesis (H) is the supplied R22.6 theorem; the present roadmap applies it.

<a id="r27-5-dyadic-weight-two-claim"></a>

#### The ad hoc dyadic weight claim: k(ρ̄′₂) = 2

Identifier: `ClassicalSerreModularity:R27.5/dyadic-weight-two-claim`. Kind: lemma.

In the proof of (D_1) (R27.5/d1-by-the-prime-three): k(ρ̄′₂) = 2. If k(ρ̄′₂) were 4, ρ̄′₂|_{D₂} would be très ramifiée (Serre 2.6), and a très ramifiée representation restricted to G_K is finite flat for no finite K/ℚ₂ of odd ramification index: its Kummer class has odd 2-adic valuation, which stays odd in K when e(K/ℚ₂) is odd. But for K the field cut out by χ′ over the unramified quadratic extension ℚ₄ of ℚ₂ (ramification index 3, the order of χ′), ρ′₂|_{G_K} is crystalline with Hodge–Tate weights {0, 1} (its Weil–Deligne parameter (τ, 0) becomes unramified over K), hence comes from a 2-divisible group (Kisin), so ρ̄′₂|_{G_K} is finite flat: a contradiction.

**Hypotheses and scope.**

- the source cites "Theorem 5.1(2)" for the finite flatness over K; the input is the local type at 2 from Theorem 5.1(4) together with almost strict compatibility at 2 (source issue ClassicalSerreModularity/E3)
- the odd-ramification-index criterion is asserted in KW I without reference; it is requested from AlgebraicModularFormsAndSerreWeights R15.4, which owns Serre's dyadic recipe
- Savitt's computation of residual weights, used for odd primes in Theorem 5.1(3),(4), does not cover p = 2; hence the ad hoc argument
- almost strict compatibility at 2 applies because ρ̄′₂ is irreducible (non-solvable image, Lemma 6.3)

**Proof obligations.**

- Suppose k(ρ̄′₂) = 4, i.e. très ramifiée (Serre 2.4.7, 2.6).
- Over K = ℚ₄(χ′), e(K/ℚ₂) = 3: ρ′₂ is crystalline with Hodge–Tate weights {0, 1}, so it comes from a 2-divisible group (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4) and ρ̄′₂|_{G_K} is finite flat.
- The criterion of R15.4 forbids finite flatness over odd ramification index: contradiction.

**Acceptance.**

- Check the très ramifiée / odd-ramification-index argument against Serre's definition (2.4.7) and the p = 2 value k = 4 of 2.6, confirming that the parity of the ramification index is the operative fact
- Check that K = ℚ₄(χ′) has e(K/ℚ₂) = 3 and that τ|_{I_K} is trivial

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The dyadic weight argument, with the source's note that Savitt does not cover p = 2.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The finite flatness over a field of ramification index 3 (with the misprinted reference).
- [serre87-duke](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), §2.6, printed p. 188. Serre's dyadic weight dichotomy.
- [serre87-duke](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), (2.4.7), printed p. 186. Peu ramifiée means the Kummer classes can be chosen among units; très ramifiée otherwise.

<a id="r27-5-d1-by-the-prime-three"></a>

#### (D_1) and characteristic two, by a congruence at 3 (roles of 2 and 3 reversed)

Identifier: `ClassicalSerreModularity:R27.5/d1-by-the-prime-three`. Kind: theorem.

Assume Hypothesis (H) at p = 2. Then (D_1) holds: every locally good-dihedral ρ̄ of S-type in odd characteristic p with 4 ∤ N(ρ̄) is modular. Proof: lift ρ̄ by Theorem 5.1(2) to an almost strictly compatible system (ρ_λ) with ρ_p a minimal weight-2 lift; ρ̄₃ is good dihedral (Lemma 6.3), so of non-solvable image. If ρ̄₃ is unramified at 2, N(ρ̄₃) is odd and Theorem 1.2(1) at p = 3 with Theorem 4.1 conclude. Otherwise ρ̄₃(I₂) is unipotent and ρ̄₃|_{D₂} is, up to unramified twist, (χ̄₃ ∗; 0 1); Theorem 5.1(4), applied to ρ̄₃ at q = 2 with the pair χ′, χ′² of 3-adic characters of I₂ of order 3 (level 2, as 3 | 2 + 1), gives an almost strictly compatible system (ρ′_λ) lifting ρ̄₃ with ρ′₃|_{I₂} ≅ (χ′ ∗; 0 χ′²) and Weil–Deligne parameter (τ, 0) at 2, τ irreducible. Then ρ̄′₂ has non-solvable image (Lemma 6.3), k(ρ̄′₂) = 2 (R27.5/dyadic-weight-two-claim), so ρ̄′₂ is modular by Theorem 1.2(2); ρ′₂ is potentially crystalline of weight 2 at 2, and (H) makes it, hence (ρ′_λ), modular; Theorem 4.1 at 3 transfers modularity to (ρ_λ) and ρ̄. By Theorem 3.4 with r = 1, (D_1) gives Serre's conjecture in characteristic 2.

**Hypotheses and scope.**

- the system (ρ′_λ) lifts ρ̄₃, not ρ̄ as printed (source issue ClassicalSerreModularity/E3)
- Lemma 6.3 applies to ρ̄₃ and ρ̄′₂ because 2, 3 ≤ max(Q(N(ρ̄)/q²), p) for odd p
- the argument mirrors the mod-3 step of Theorem 3.2 (R27.2) with 2 and 3 exchanged; there the new weight is read off from Savitt, here it needs the ad hoc dyadic claim
- ρ′₂ is potentially crystalline at 2 by almost strict compatibility at 2 (ρ̄′₂ irreducible), with Weil–Deligne parameter (τ, 0)

**Proof obligations.**

- Theorem 5.1(2) lift and the branch on ρ̄₃ at 2.
- Unramified branch: Theorem 1.2(1) at 3 and Theorem 4.1.
- Ramified branch: Theorem 5.1(4) with the order-3 level-2 characters, the dyadic weight claim, Theorem 1.2(2), (H) at 2, then Theorem 4.1 at 3.

**Acceptance.**

- Check that χ′ of order 3 on I₂ has level 2: it factors through 𝔽₄^× of order 3 and not through 𝔽₂^× = 1, and 3 | 2 + 1 (checked in the suggested Lean file)
- Check that ρ̄₃ unramified at 2 really gives N(ρ̄₃) odd, so Theorem 1.2(1) at p = 3 applies

**Prerequisites.** [R27.4/theorem-1-2](#r27-4-theorem-1-2); [R27.5/dyadic-weight-two-claim](#r27-5-dyadic-weight-two-claim); [GL2ModularityLifting:R22.6/hypothesis-h](../../../content/campaign/GL2ModularityLifting/README.md); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic](../../../content/campaign/GL2ModularityLifting/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The ramified branch.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The order-3 type at 2 (with the misprinted "of ¯ρ").
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 18 of the preprint. What this step proves.

<a id="r27-5-dr-for-r-at-least-two"></a>

#### (D_r) for r ≥ 2 from (D_1), characteristic two and (H)

Identifier: `ClassicalSerreModularity:R27.5/dr-for-r-at-least-two`. Kind: theorem.

Assume Hypothesis (H) at p = 2. For every r ≥ 2, (D_r) holds: every locally good-dihedral ρ̄ of S-type in odd characteristic with 2^{r+1} ∤ N(ρ̄) is modular. If ρ̄(I₂) is unipotent up to twist, a twist of ρ̄ by a character unramified outside 2 has 4 ∤ N and is modular by (D_1). Otherwise lift ρ̄ by Theorem 5.1(2) (ρ_p a minimal weight-2 lift); ρ̄₂ is good dihedral (Lemma 6.3), so of non-solvable image, and modular by Serre's conjecture in characteristic 2 (R27.5/d1-by-the-prime-three with Theorem 3.4); ρ₂ is potentially crystalline of weight 2 at 2, because a minimal lift of a ρ̄|_{I₂} that is not unipotent up to twist has finite inertia image; (H) makes ρ₂, hence (ρ_λ) and ρ̄, modular.

**Hypotheses and scope.**

- the twist reducing to a non-unipotent ρ̄(I₂) is by a character unramified outside 2, which preserves good dihedrality and the odd part of the conductor
- potential crystallinity of ρ₂ is where "not unipotent up to twist" is used: minimality gives ρ_p(I₂) ≅ ρ̄(I₂) unless ρ̄(I₂) is projectively cyclic of order p
- (H) is applied with non-solvable residual image, as it requires

**Proof obligations.**

- Reduce to ρ̄(I₂) not unipotent up to twist using (D_1).
- Theorem 5.1(2) lift; ρ̄₂ modular in characteristic 2.
- (H) at 2.

**Acceptance.**

- Check the reduction: extend the local twisting character of I₂ to a Dirichlet character of 2-power conductor
- Check that the Weil–Deligne parameter of the system at 2 has finite inertia image and zero monodromy

**Prerequisites.** [R27.5/d1-by-the-prime-three](#r27-5-d1-by-the-prime-three); [R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice](#r27-4-theorem-3-4-raising-levels-and-the-chebotarev-choice); [GL2ModularityLifting:R22.6/hypothesis-h](../../../content/campaign/GL2ModularityLifting/README.md); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The reduction.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the preprint. The conclusion.

<a id="r27-5-hypothesis-h-and-theorem-9-1"></a>

#### Theorem 9.1: Serre's conjecture from Hypothesis (H)

Identifier: `ClassicalSerreModularity:R27.5/hypothesis-H-and-theorem-9-1`. Kind: theorem. Planet: **Theorem 9.1 (reduction to Hypothesis (H))**.

KW I Theorem 9.1: every S-type residual representation is modular. Its proof invokes Hypothesis (H) only at p = 2, imported from GL2ModularityLifting:R22.6/hypothesis-h, including the potentially crystalline weight-two to potentially Barsotti–Tate step. This node owns only the conductor reductions: D₀ from R27.3, D₁ from d1-by-the-prime-three and D_r for r ≥ 2 from dr-for-r-at-least-two, followed by Theorem 3.4. It neither reconstructs Hypothesis (H) nor proves the Breuil–Kisin comparison.

**Hypotheses and scope.**

- Hypothesis (H) requires the residual representation to have NON-SOLVABLE image and to be modular; it is not a general lifting statement
- Theorem 9.1 gives modularity; weight and level are R27.6
- like the rest of KW I it uses Theorems 4.1 and 5.1, now supplied by PotentialModularityAndCompatibleSystems R24.4 and R24.6

**Proof obligations.**

- Use the dyadic Hypothesis (H) theorem with its non-solvable residual modularity, oddness, finite ramification and potentially crystalline weight-two hypotheses checked by the consuming reduction nodes.
- (D_0), (D_1), (D_r) for r ≥ 2.
- Theorem 3.4 for each r.

**Acceptance.**

- Check that Hypothesis (H) is only invoked with non-solvable residual image at every use in the proof
- Check that the three cases r = 0, r = 1, r ≥ 2 cover every conductor

**Prerequisites.** [R27.3/d0-from-all-lr](#r27-3-d0-from-all-lr); [R27.5/d1-by-the-prime-three](#r27-5-d1-by-the-prime-three); [R27.5/dr-for-r-at-least-two](#r27-5-dr-for-r-at-least-two); [R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice](#r27-4-theorem-3-4-raising-levels-and-the-chebotarev-choice); [GL2ModularityLifting:R22.6/hypothesis-h](../../../content/campaign/GL2ModularityLifting/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §9, Hypothesis (H), p. 18 of the preprint. Literal hypotheses of (H), which must not be weakened when it is imported as Kisin's theorem.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 18 of the preprint. The structure of the proof.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.1, p. 3 of the preprint. (H) is Kisin's theorem.

<a id="r27-6"></a>

### R27.6. The strong theorem and its exports

Give the single public strong Serre conclusion, finite-flat weight-two and compatible-system consequences. The weight-one Artin export has its own reduction, Katz-form comparison and descent chain; it does not follow merely from the weight-at-least-two convention.

<a id="r27-6-full-classical-serre-theorem"></a>

#### Serre's modularity conjecture, strong form

Identifier: `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`. Kind: theorem. Planet: **Serre's modularity conjecture (strong form)**.

Let ρ̄ : G_ℚ → GL₂(𝔽̄_p) be continuous, odd and absolutely irreducible. There are a normalised newform f of weight k(ρ̄) ≥ 2, level N(ρ̄) and character ε, a prime λ | p of its coefficient field (for the fixed embedding ι_p) and an isomorphism of the reduction of ρ_{f,λ} with ρ̄; and det ρ̄ = ε̄ χ̄_p^{k(ρ̄)−1}, so ε reduces to Serre's character ε(ρ̄). Assembly: ρ̄ is modular by Theorem 1.2 (R27.4) and Theorem 9.1 (R27.5, with (H) at p = 2 from Kisin). Weight and level: for p odd, and for p = 2 with k(ρ̄) = 2, R27.4/strong-form-by-minimal-lifts; for p = 2 with k(ρ̄) = 4, the optimisation imported from SerreWeightAndLevelOptimisation (Buzzard's dyadic level lowering for ρ̄ not induced from ℚ(i), R20.5; Lemma 6.2(i) for dihedral ρ̄; and the passage from weight 2 at level 2N(ρ̄), Steinberg at 2, to weight 4 at level N(ρ̄), R20.6). The determinant identity is the elementary congruence of AlgebraicModularFormsAndSerreWeights R15.6, and the statement is invariant under enlarging the coefficient field (R15.4, R15.6).

**Hypotheses and scope.**

- only classical forms of weight ≥ 2 are produced; Katz weight-one forms and Edixhoven's strong form at p = 2 lie outside the theorem
- no statement is made for base fields other than ℚ or for representations of dimension greater than 2
- at p = 2, k(ρ̄) = 4, the weight and level come from the imported optimiser, not from the KW argument (Theorem 5.1(1) has no crystalline branch there)
- the level-one theorem (Khare, R26.1) is the base of the induction through Corollary 8.1, not a separate branch here

**Proof obligations.**

- Case p odd, N(ρ̄) odd: Theorem 1.2(1).
- Case p odd, N(ρ̄) even: Theorem 9.1, then strong-form-by-minimal-lifts.
- Case p = 2, k(ρ̄) = 2: Theorem 1.2(2).
- Case p = 2, k(ρ̄) = 4: Theorem 9.1, then the imported optimisation.
- Determinant and coefficient compatibility from R15.6 and R15.4.

**Acceptance.**

- Check that every (p, N(ρ̄), k(ρ̄)) falls into one of the four branches
- Check that the newform has level exactly N(ρ̄) and weight exactly k(ρ̄) in each branch

**Prerequisites.** [R27.4/theorem-1-2](#r27-4-theorem-1-2); [R27.5/hypothesis-H-and-theorem-9-1](#r27-5-hypothesis-h-and-theorem-9-1); [R27.4/strong-form-by-minimal-lifts](#r27-4-strong-form-by-minimal-lifts); [R27.1/dickson-and-the-dyadic-solvable-refinement](#r27-1-dickson-and-the-dyadic-solvable-refinement); [SerreWeightAndLevelOptimisation:R20.5/buzzard-mod-two-level-lowering](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [GL2ModularityLifting:R22.6/hypothesis-h](../../../content/campaign/GL2ModularityLifting/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. The refined statement.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. The meaning of "arises from".
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.1, p. 20 of the preprint. The assembled theorem: Theorems 1.2 and 9.1 with Kisin's theorem.

<a id="r27-6-finite-flat-weight-two-export"></a>

#### The finite-flat weight-two export (consumed by EllipticCurveModularity R29)

Identifier: `ClassicalSerreModularity:R27.6/finite-flat-weight-two-export`. Kind: theorem.

Let p ≥ 5 and ρ̄ : G_ℚ → GL₂(𝔽̄_p) be odd and absolutely irreducible, finite at p (ρ̄|_{D_p} extends to a finite flat group scheme over ℤ_p) with det ρ̄ = χ̄_p. Then there are a normalised newform g of weight 2, level N(ρ̄) and TRIVIAL character and a prime λ | p of its coefficient field with ρ̄_{g,λ} ≅ ρ̄; in particular a_ℓ(g) ≡ Tr ρ̄(Frob_ℓ) mod λ for ℓ ∤ pN(ρ̄). Proof: by Serre's Proposition 4, finite at p with det ρ̄|_{I_p} = χ̄_p gives k(ρ̄) = 2; det ρ̄ = χ̄_p gives ε(ρ̄) = 1; the strong form gives f of weight 2 and level N(ρ̄) with ε̄ = 1; Carayol's change of nebentypus replaces ε by the trivial character at the same weight and level (p ≥ 5).

**Hypotheses and scope.**

- p ≥ 5 is needed for the change of nebentypus; the consumer (R29.2) uses primes outside its exceptional set, all > 5
- finite at p is used only through Serre's Proposition 4 (k = 2 iff det|_{I_p} = χ̄_p and finite at p), part of AlgebraicModularFormsAndSerreWeights R15.6's finite-flat weight-two consequences
- the level is the full prime-to-p Artin conductor N(ρ̄), not the conductor of an elliptic curve; R29 compares them

**Proof obligations.**

- k(ρ̄) = 2 and ε(ρ̄) = 1 from R15.6.
- Strong form (R27.6/full-classical-serre-theorem).
- Trivial character by Carayol (SerreWeightAndLevelOptimisation R20.4/nebentypus-congruent-character).
- Trace congruence from the definition of ρ_{g,λ}.

**Acceptance.**

- Check on E[p] for an elliptic curve E/ℚ with p ∤ N_E, p ≥ 5 and E[p] irreducible: finite at p and det = χ̄_p, so the node applies, with level N(ρ̄_{E,p}) dividing N_E
- Check that the character produced before Carayol's step is only congruent to 1 mod λ, not equal to 1

**Prerequisites.** [R27.6/full-classical-serre-theorem](#r27-6-full-classical-serre-theorem); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [serre87-duke](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 4, printed p. 189. k = 2 exactly for finite ρ̄|_{D_p} with det|_{I_p} = χ.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. The same dichotomy at p = 2, which the export does not use.

<a id="r27-6-scope-of-the-final-statement-and-the-compatible-system-export"></a>

#### Theorem 10.1(i): regular compatible systems that arise from newforms

Identifier: `ClassicalSerreModularity:R27.6/scope-of-the-final-statement-and-the-compatible-system-export`. Kind: application.

Theorem 10.1(i), a corollary of the assembled theorem (KW I Theorems 1.2 and 9.1 with Kisin's theorem): a two-dimensional REGULAR compatible system that is irreducible and odd arises up to twist from a newform of weight ≥ 2. Theorem 10.1(ii) (a two-dimensional IRREGULAR compatible system that is irreducible and odd arises up to twist from a newform of weight 1) is stated for general systems by ModularityAndLanglandsExtensions:ML.1. Its proof after Serre's conjecture is planned in this layer and imported by ML.1: the strong form (R27.6/full-classical-serre-theorem), the weight-one form modulo ℓ of an unramified residual representation (R27.6/unramified-residual-representations-arise-in-weight-one) and Khare's descent (R27.6/weight-one-descent-from-infinitely-many-primes). ML.1 adds the inputs special to a general irregular system: the Sen–Fontaine unramifiedness at the residue characteristic, the irreducibility of ρ̄_λ for almost all λ, and the use of the weight-one step in its form without a hypothesis on Frobenius, because distinct Frobenius eigenvalues cannot be arranged before the image is known to be finite. The finite-image case, Corollary 10.2(ii), is proved here (R27.6/odd-artin-weight-one-modularity). Corollary 10.2(i) (modularity of GL₂-type abelian varieties over ℚ) follows from part (i) with Faltings' isogeny theorem, outside this roadmap. KW I only sketch the proof. No statement is made for base fields other than ℚ or rank greater than 2.

**Hypotheses and scope.**

- irreducibility of ρ̄_λ for almost all λ comes first, from the bounded conductor and the fixed Hodge–Tate weights
- the general statement of part (ii) of KW I Theorem 10.1, with the Sen–Fontaine unramifiedness, is ModularityAndLanglandsExtensions:ML.1's; the Gross / Coleman–Voloch weight-one criterion and Khare's descent that it uses are declarations of this layer, so ML.1 consumes R27.6 and R27.6 imports nothing from ML.1
- the conclusion is "up to twist"; the twist normalises the Hodge–Tate numbers to (a, 0) with a ≥ 0

**Proof obligations.**

- Twist so that the Hodge–Tate numbers are (a, 0) with a ≥ 0; regularity gives a > 0.
- Apply the strong form to ρ̄_λ for infinitely many λ; the resulting forms are one newform in S_k(Γ₁(N)) with k = a + 1 and N fixed.

**Acceptance.**

- Check that the newform produced in (i) has weight a + 1 and level N, both independent of λ
- Check that the finitely many λ excluded in each step are identified, since the statement is about almost all λ

**Prerequisites.** [R27.6/full-classical-serre-theorem](#r27-6-full-classical-serre-theorem); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/KhareWintenberger; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 10.1, p. 20 of the preprint. The export that downstream roadmaps consume: part (i) here; part (ii) is ModularityAndLanglandsExtensions:ML.1's.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. A sketch, recorded as an application rather than a decomposed argument.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. Unramifiedness at the residue characteristic, which is immediate for an Artin representation and is the input ModularityAndLanglandsExtensions ML.1 adds for a general irregular system (the extraction prints ℓ as a backquote).

<a id="r27-6-odd-artin-weight-one-modularity"></a>

#### Weight-one modularity of odd two-dimensional Artin representations

Identifier: `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`. Kind: theorem. Planet: **Odd Artin representations and weight-one modularity**.

KW I Corollary 10.2(ii): a continuous, odd, irreducible representation ρ : G_ℚ → GL₂(ℂ), for the usual topology and so of finite image (the Artin setting), arises from a newform of weight one. Precisely: if N is the Artin conductor of ρ and N′ = N for N ≥ 5, N′ = 5N otherwise, there is a normalised cuspidal newform f of weight one, of level dividing N′ and with character det ρ (on the integers prime to N′), such that ρ is isomorphic to the Deligne–Serre representation ρ_f. ModularityAndLanglandsExtensions ML.1 registers this export over ℚ beside Langlands–Tunnell; the statement for a general irregular compatible system (KW I Theorem 10.1(ii)) is ML.1's, and it imports the weight-one step and the descent from this layer.

**Hypotheses and scope.**

- Oddness is det ρ(c) = −1, and irreducibility is over ℂ.
- The proof uses Serre's conjecture in infinitely many residue characteristics: the strong form of this layer at every prime ℓ of the positive-density set P_c.
- Only primes ℓ ∈ P_c are used, at which ρ̄_λ(Frob_ℓ) has distinct eigenvalues; so the weight-one step is the non-exceptional case of Edixhoven's theorem and does not rest on the removal of the exceptional case.
- Nothing is imported from ModularityAndLanglandsExtensions: the dependency runs from this node to ML.1.

**Proof obligations.**

- Reductions (R27.6/artin-reductions-of-serre-type): fix a number-field model over E; for ℓ ∈ P_c and λ | ℓ, ρ̄_λ is absolutely irreducible, odd, unramified at ℓ, of conductor N and character det ρ mod λ, with tr ρ̄_λ(Frob_r) = tr ρ(Frob_r) mod λ, and ρ̄_λ(Frob_ℓ) has the eigenvalues 1 and −1.
- Weight one modulo ℓ (R27.6/unramified-residual-representations-arise-in-weight-one, which applies the strong form R27.6/full-classical-serre-theorem and Edixhoven's theorem): there is a Katz cuspidal eigenform h_ℓ of type (N, 1, det ρ mod λ) over 𝔽̄_ℓ with T_r h_ℓ = (tr ρ(Frob_r) mod λ)·h_ℓ for r ∤ Nℓ.
- Descent (R27.6/weight-one-descent-from-infinitely-many-primes) with t_r = tr ρ(Frob_r) ∈ 𝒪_E and ε = det ρ, P_c being infinite: a newform f of weight one with a_r(f) = tr ρ(Frob_r) for r ∤ N′, and ρ ≅ ρ_f.

**Acceptance.**

- Even Artin representations do not meet the oddness hypothesis.
- Reducible sums of characters do not meet the irreducibility hypothesis; the corresponding forms are Eisenstein series.
- For the S₃ representation of conductor 23 the theorem returns the weight-one form η(z)η(23z) of level 23, known classically (Hecke); the new cases are those of projective image A₅.
- The weight-one conclusion needs the descent node, not only the existence of a form of weight ℓ congruent to ρ modulo λ for each ℓ.

**Prerequisites.** [R27.6/artin-reductions-of-serre-type](#r27-6-artin-reductions-of-serre-type); [R27.6/unramified-residual-representations-arise-in-weight-one](#r27-6-unramified-residual-representations-arise-in-weight-one); [R27.6/weight-one-descent-from-infinitely-many-primes](#r27-6-weight-one-descent-from-infinitely-many-primes); [R27.6/full-classical-serre-theorem](#r27-6-full-classical-serre-theorem); [AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation](../../../content/campaign/AutomorphicGaloisRepresentations/README.md).

**Uses.**

- ModularityAndLanglandsExtensions:ML.1: Register this general ℚ weight-one Artin export alongside the solvable Langlands–Tunnell export from R17.5.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Artin; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Corollary 10.2(ii) and discussion after Theorem 10.1, author PDF p. 21. Corollary 10.2(ii), including its weight-one conclusion; continuous complex representations use the usual topology, in the finite-image Artin setting.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.2, p. 21 of the preprint. The passage from the irregular system of an Artin representation to Corollary 10.2(ii).

<a id="r27-6-artin-reductions-of-serre-type"></a>

#### Reductions of an odd irreducible Artin representation: Serre type, conductor and weight

Identifier: `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`. Kind: lemma.

Let ρ : G_ℚ → GL₂(ℂ) be continuous for the usual topology (so of finite image G = ρ(G_ℚ) = Gal(M/ℚ)), irreducible and odd, with Artin conductor N and determinant ε, a Dirichlet character modulo N with ε(−1) = −1. (a) There are a number field E ⊂ ℂ and ρ_E : G → GL₂(E) with ρ_E ⊗_E ℂ ≅ ρ. For every finite place λ of E, with ring of integers 𝒪_λ of the completion and residue field k_λ of characteristic ℓ, ρ_E stabilises an 𝒪_λ-lattice Λ, and ρ̄_λ := Λ/λΛ : G_ℚ → GL₂(k_λ) satisfies tr ρ̄_λ(Frob_r) = tr ρ(Frob_r) mod λ and det ρ̄_λ(Frob_r) = ε(r) mod λ for every prime r ∤ Nℓ. (b) If ℓ ∤ |G| (so ℓ is odd, because ρ(c) has order 2), then ρ̄_λ is absolutely irreducible and odd, it is faithful on G (it cuts out the same field M), it does not depend on Λ up to isomorphism, and dim (ρ̄_λ)^H = dim ρ^H for every subgroup H ≤ G. (c) If moreover ℓ ∤ N, then ρ̄_λ is unramified at ℓ, its prime-to-ℓ Artin conductor is N(ρ̄_λ) = N, its character is ε(ρ̄_λ) = ε mod λ, Serre's weight is k(ρ̄_λ) = ℓ, and Edixhoven's weight is 1. (d) The set P_c of primes ℓ ∤ N|G| for which ρ(Frob_ℓ) is conjugate in G to ρ(c), c a complex conjugation, has Dirichlet density |C|/|G| > 0, C the conjugacy class of ρ(c). For ℓ ∈ P_c and λ | ℓ, ρ̄_λ(Frob_ℓ) has the two distinct eigenvalues 1 and −1, so ρ̄_λ|_{D_ℓ} ≅ 1 ⊕ η with η ≠ 1 unramified; in particular it is not an extension of an unramified character by itself.

**Hypotheses and scope.**

- Continuity for the usual topology of GL₂(ℂ) forces a finite image, since GL₂(ℂ) has no small subgroups; this is the Artin setting of KW I §10.2.
- ℓ ∤ |G| is what makes reduction exact on invariants: |H| is invertible in 𝒪_λ, the averaging element e_H = |H|⁻¹ Σ_{h∈H} h acts on Λ, Λ^H = e_HΛ is a direct summand, and (Λ/λΛ)^H = e_H(Λ/λΛ) = Λ^H/λΛ^H.
- E need not be the field of traces. Any number field over which ρ is realisable serves; no statement about Schur indices is used.
- ℓ odd, which follows from ℓ ∤ |G|, is needed for oddness (det ρ̄_λ(c) = −1 ≠ 1) and for (d) (the eigenvalues 1 and −1 are distinct).
- Serre's weight in the unramified case is ℓ by his convention, not 1 (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases); the weight-one form comes from Edixhoven's refinement, in R27.6/unramified-residual-representations-arise-in-weight-one.

**Proof obligations.**

- A model. The image is finite, so ρ is a representation of the finite group G; a complex representation of a finite group is realisable over the algebraic closure of ℚ in ℂ (ℚ̄[G] is split semisimple), hence over a number field E. For a place λ the lattice Λ = Σ_{g∈G} ρ_E(g)𝒪_λ² is stable (ArithmeticGaloisRepresentations R01.1/continuity-descent-and-lattice-independence). The Frobenius identities hold in 𝒪_E before reduction.
- Absolute irreducibility for ℓ ∤ |G|. By exactness of G-invariants, End_{k_λ[G]}(Λ/λΛ) = End_{𝒪_λ[G]}(Λ) ⊗ k_λ, and End_{𝒪_λ[G]}(Λ) is a direct summand of End(Λ) of rank dim End_{E_λ[G]}(ρ_E ⊗ E_λ) = 1; the same holds after any finite extension of 𝒪_λ. By Maschke's theorem (mathlib MonoidAlgebra.Submodule.exists_isCompl, as ℓ ∤ |G|) the reduction is semisimple over every finite extension of k_λ, and a semisimple module whose endomorphism ring is the field of scalars is simple.
- Faithfulness and oddness. The kernel of GL₂(𝒪_λ) → GL₂(k_λ) is a pro-ℓ group and |G| is prime to ℓ, so ρ̄_λ is injective on G. det ρ̄_λ(c) = −1 ≠ 1 because ℓ is odd. Independence of Λ: the reduction is irreducible, so all stable lattices are homothetic.
- Conductor. In the formula n(q, ·) = Σ_{i≥0} [G₀ : G_i]⁻¹ dim V/V^{G_i} of ArithmeticGaloisRepresentations R01.3/artin-conductor-with-its-wild-part, the ramification groups G_i at a prime q are the same subgroups of G for ρ and for ρ̄_λ (same field M), and by (b) the dimensions agree; so n(q, ρ̄_λ) = n(q, ρ) for every q ≠ ℓ. If ℓ ∤ N the inertia group at ℓ is trivial in G.
- Weight and character. ρ̄_λ|_{I_ℓ} is trivial, so (a, b) = (0, 0) in Serre's tame recipe and k(ρ̄_λ) = ℓ, while Edixhoven's weight is 1 (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases and R15.4/edixhoven-weight-k-ρ-and-its-comparison-with-serre-k). From det ρ̄_λ = ε(ρ̄_λ)χ̄_ℓ^{k−1} and χ̄_ℓ^{ℓ−1} = 1, ε(ρ̄_λ) = det ρ̄_λ = ε mod λ.
- (d). The Chebotarev density theorem (Tau Ceti Chebotarev, Layer 10) for M/ℚ and the class C; removing the finitely many ℓ | N|G| does not change the density. ρ(c) has order 2 and determinant −1, so its eigenvalues are 1 and −1, and so are those of the conjugate ρ(Frob_ℓ); they stay distinct modulo λ.

**Acceptance.**

- G ≅ S₃ in its reflection representation (the Artin representation of conductor 23 attached to the splitting field of x³ − x − 1): at ℓ = 3 the reduction is reducible, because the sum-zero plane of 𝔽₃³ contains (1, 1, 1); so ℓ ∤ |G| cannot be dropped from (b).
- For the same ρ and ℓ ∤ 6·23: the inertia group at 23 has order 2 and acts by a reflection, n(23, ρ) = 1 = n(23, ρ̄_λ), and N(ρ̄_λ) = 23.
- For the same ρ, c is a transposition and P_c is the set of ℓ ∤ 138 whose Frobenius is a transposition, of density 3/6 = 1/2 (the primes inert in ℚ(√−23)).
- An even ρ (det ρ(c) = 1) gives reductions that are not of S-type for odd ℓ; a reducible ρ gives reducible reductions.

**Prerequisites.** [ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.3/artin-conductor-with-its-wild-part](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev](../../../content/tau-ceti/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev); `mathlib:MonoidAlgebra.Submodule.exists_isCompl`.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Artin; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.2, p. 21 of the preprint. The passage from the irregular system of an Artin representation to Corollary 10.2(ii).
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. Irreducibility of almost all reductions; for a system of finite image the node gives the direct argument.

<a id="r27-6-unramified-residual-representations-arise-in-weight-one"></a>

#### An odd irreducible mod ℓ representation unramified at ℓ arises from a Katz eigenform of weight one

Identifier: `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`. Kind: theorem.

Let ℓ be an odd prime and ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ) continuous, irreducible and odd, unramified at ℓ, with conductor N = N(ρ̄) and character ε = ε(ρ̄) = det ρ̄, and suppose that ρ̄(Frob_ℓ) has two distinct eigenvalues. Then there is a Katz cuspidal eigenform h of type (N, 1, ε) over 𝔽̄_ℓ (in Katz's sense, as in SerreWeightAndLevelOptimisation R20.3: a section of ω ⊗ 𝒪(−cusps) on the Γ₁(N) moduli stack over 𝔽̄_ℓ, which for N ≥ 5 is the scheme X₁(N), on which the diamond operators act through ε, and an eigenvector of T_r for every prime r ∤ Nℓ) with T_r h = tr ρ̄(Frob_r)·h for every prime r ∤ Nℓ. Without the hypothesis on ρ̄(Frob_ℓ) the same conclusion holds, by the form of Edixhoven's theorem for ℓ > 2 that has no exceptional case (Coleman–Voloch, as SerreWeightAndLevelOptimisation R20.3/edixhoven-weight-theorem records it from the note in Edixhoven's paper). The Artin case of this layer uses only the form with the hypothesis, whose proof is given below; a general irregular compatible system needs the form without it.

**Hypotheses and scope.**

- ℓ is odd. At ℓ = 2 Edixhoven's theorem keeps its exceptional case, and KW I's sketch concerns almost all λ only.
- The form is a Katz form over 𝔽̄_ℓ. It need not be the reduction of a characteristic-zero form of weight one for the given ℓ; that holds for all but finitely many ℓ (R27.6/weight-one-reduction-is-onto-for-almost-all-primes).
- Serre's weight of ρ̄ is ℓ, so the strong form produces a newform of weight ℓ and level N. The descent to weight one is the minimal-weight part of Edixhoven's theorem; for weight ℓ it is Gross's companion-form theorem, with Coleman–Voloch for the parts of Gross's argument that rest on unchecked compatibilities.
- With distinct eigenvalues α ≠ β of ρ̄(Frob_ℓ), ρ̄|_{D_ℓ} ≅ λ(α) ⊕ λ(β) is not an extension of an unramified character by itself, so ρ̄ is not exceptional in Edixhoven's sense and the minimal-weight statement applies without the note.
- The supplier statement is for every level N ≥ 1 prime to ℓ. KW II §10.2 remarks that Gross's own hypothesis N > 4 is harmless when the optimal level is not required.
- The form without the hypothesis on Frobenius rests on Coleman–Voloch through the supplier node; neither their paper nor Edixhoven's note was read here (see the gap on primary sources). It is not used by any node of this packet.

**Proof obligations.**

- Serre's weight is k(ρ̄) = ℓ (AlgebraicModularFormsAndSerreWeights R15.4/serre-weight-tame-cases with trivial inertia action). The strong form (R27.6/full-classical-serre-theorem) gives a newform f of weight ℓ, level N and a character reducing to ε, and a prime λ′ | ℓ of its coefficient field with ρ̄_{f,λ′} ≅ ρ̄.
- The reduction of f modulo λ′ is a Katz cuspidal eigenform g of type (N, ℓ, ε) over 𝔽̄_ℓ with ρ_g ≅ ρ̄ (AlgebraicModularFormsAndSerreWeights R15.2/integral-lattice-and-reduction-image and R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field: the reduction-image space lies in the Katz space, Hecke-compatibly).
- g is ordinary: if a_ℓ(g) = 0, ρ_g|_{I_ℓ} would be ψ^{ℓ−1} ⊕ ψ′^{ℓ−1} with ψ of level 2 (SerreWeightAndLevelOptimisation R20.3/local-form-of-supersingular-eigenforms), which is ramified. So ρ_g|_{D_ℓ} ≅ (λ(ε(ℓ)/a_ℓ) ∗; 0 λ(a_ℓ)) (R20.3/local-form-of-ordinary-eigenforms, with χ̄^{ℓ−1} = 1), its Frobenius eigenvalues ε(ℓ)/a_ℓ and a_ℓ are α and β, and α ≠ β gives a_ℓ² ≠ ε(ℓ).
- Edixhoven's theorem (R20.3/edixhoven-weight-theorem), minimal-weight part: ρ̄ is not exceptional and Edixhoven's weight is 1 (R15.4/edixhoven-weight-k-ρ-and-its-comparison-with-serre-k), so there is a cuspidal eigenform h of type (N, 1, ε) with the eigenvalues of g for T_r, r ≠ ℓ, and ρ_h ≅ ρ̄. Concretely, ρ_g|_{D_ℓ} is unramified, hence tamely ramified, and a_ℓ² ≠ ε(ℓ), so Gross's theorem (R20.3/companion-forms, k = ℓ, k′ = ℓ + 1 − ℓ = 1) gives the companion h with r·a_r(h) = r·a_r(g), that is a_r(h) = a_r(g), for r ≠ ℓ.
- So T_r h = a_r(g)h = tr ρ̄(Frob_r)h for r ∤ Nℓ, and the diamond operators act on h through ε.
- Without the hypothesis on ρ̄(Frob_ℓ): steps 1 and 2 are unchanged, and the minimal-weight part of R20.3/edixhoven-weight-theorem is applied to g in its form for ℓ > 2, in which 'not exceptional' is not required.

**Acceptance.**

- ρ̄ = ρ̄_λ for an odd irreducible Artin representation and ℓ ∈ P_c (R27.6/artin-reductions-of-serre-type (d)): the eigenvalues are 1 and −1, a_ℓ(g) = ±1 and ε(ℓ) = −1, so a_ℓ(g)² = 1 ≠ −1.
- Consistency with the converse (R20.3/weight-one-forms-unramified-at-p): a weight-one Katz eigenform h with T_ℓ-eigenvalue a and character ε gives the two weight-ℓ forms Ah and Vh, on whose span U has characteristic polynomial X² − aX + ε(ℓ); here a = α + β.
- If ρ̄ is ramified at ℓ, Edixhoven's weight is at least 2 and no weight-one eigenform of level prime to ℓ has representation ρ̄ (the minimality in Edixhoven's theorem).

**Prerequisites.** [R27.6/full-classical-serre-theorem](#r27-6-full-classical-serre-theorem); [SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.3/companion-forms](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.3/local-form-of-ordinary-eigenforms](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.3/local-form-of-supersingular-eigenforms](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Artin; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. KW I's one-sentence sketch of the weight-one step; [21] is Khare's IMRN note, [19] Gross, [7] Coleman–Voloch, [14] Edixhoven.

<a id="r27-6-weight-one-reduction-is-onto-for-almost-all-primes"></a>

#### Katz cusp forms of weight one and level N are reductions of characteristic-zero forms for all but finitely many ℓ

Identifier: `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`. Kind: lemma.

Let N ≥ 5, X = X₁(N) the compactified fine moduli scheme over ℤ[1/N] (proper and smooth of relative dimension one), ω its Hodge bundle and C the cuspidal divisor, and put S₁(N; A) = H⁰(X_A, ω ⊗ 𝒪(−C)) for a ℤ[1/N]-algebra A. There is a finite set B(N) of primes such that for every prime ℓ ∤ N outside B(N) and every discrete valuation ring 𝒪 flat over ℤ_(ℓ) with residue field k, the base-change map S₁(N; 𝒪) ⊗_𝒪 k → S₁(N; k) is an isomorphism, compatible with the operators T_r (r ∤ Nℓ) and the diamond operators. B(N) can be taken to be the set of primes ℓ for which H¹(X, ω ⊗ 𝒪(−C)) has nonzero ℓ-torsion.

**Hypotheses and scope.**

- N ≥ 5 makes the Γ₁(N) moduli problem representable; smaller levels are handled in R27.6/weight-one-descent-from-infinitely-many-primes by passing to a multiple of N.
- The statement is specific to weight one. For k ≥ 3 the group H¹(X, ω^k ⊗ 𝒪(−C)) vanishes by degree; for k = 2, ω² ⊗ 𝒪(−C) ≅ Ω¹ by Kodaira–Spencer and H¹(X, Ω¹) is locally free by duality, so it has no torsion. In weight ≥ 2 the exceptional set is therefore empty. (AlgebraicModularFormsAndSerreWeights R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary treats ω^k without the cusp twist.)
- B(N) is allowed to be nonempty: the lemma does not say that every Katz form of weight one lifts. Katz leaves base change in weight one open for full level n ≥ 12 (the same R15.2 node).
- The Hecke action on H⁰ and H¹ with arbitrary coefficients and its compatibility with coefficient maps are R15.2/torsion-cohomology-hecke-action, stated there for ℓ odd and N ≥ 5 prime to ℓ.

**Proof obligations.**

- Multiplication by ℓ on the invertible sheaf ℒ = ω ⊗ 𝒪(−C) of the flat ℤ[1/N]-scheme X is injective with cokernel ℒ/ℓ, and the long exact sequence gives 0 → H⁰(X, ℒ)/ℓ → H⁰(X_{𝔽_ℓ}, ℒ) → H¹(X, ℒ)[ℓ] → 0.
- H¹(X, ℒ) is a finitely generated ℤ[1/N]-module, because X is proper over the noetherian ring ℤ[1/N] (the H¹ form of AlgebraicModularFormsAndSerreWeights R15.2/finite-generation-of-geometric-sections, requested). ℤ[1/N] is a principal ideal domain, so the torsion submodule of a finitely generated module is finite, and its ℓ-torsion vanishes for all but finitely many ℓ.
- For ℓ outside this finite set the first map is an isomorphism; this is the surjectivity criterion of R15.2/integral-lattice-and-reduction-image (no λ-torsion in the H¹ of the cusp sheaf). Flat base change from ℤ_(ℓ) to 𝒪 gives the general form.
- The maps of the exact sequence commute with T_r and the diamond operators (R15.2/torsion-cohomology-hecke-action).

**Acceptance.**

- Weight 3 at any level N ≥ 5: H¹(X, ω³ ⊗ 𝒪(−C)) = 0 by degree, and the corresponding set is empty. Weight 2: the group is H¹(X, Ω¹), free of rank one over the ring of constants and not zero, but torsion-free, and the set is again empty.
- If H¹(X, ℒ) has an element of order 7, then 7 ∈ B(N), and the lemma says nothing about Katz forms of weight one modulo 7.
- The lemma gives no bound on B(N); only its finiteness is used, in the pigeonhole argument of the descent.

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2/torsion-cohomology-hecke-action](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Artin; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. KW I's one-sentence sketch of the weight-one step; [21] is Khare's IMRN note, [19] Gross, [7] Coleman–Voloch, [14] Edixhoven.

<a id="r27-6-weight-one-descent-from-infinitely-many-primes"></a>

#### Khare's descent: weight-one eigenvalues modulo infinitely many primes come from a weight-one newform

Identifier: `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`. Kind: theorem. Planet: **Khare's weight-one descent**.

Let N ≥ 1, ε a Dirichlet character modulo N, E ⊂ ℂ a number field containing the values of ε, and (t_r) a family of elements of 𝒪_E indexed by the primes r ∤ N. Put N′ = N if N ≥ 5 and N′ = 5N otherwise. Suppose that for infinitely many primes ℓ there are a place λ | ℓ of E, an embedding of its residue field k_λ in 𝔽̄_ℓ and a Katz cuspidal eigenform h_ℓ of type (N, 1, ε mod λ) over 𝔽̄_ℓ with T_r h_ℓ = (t_r mod λ)·h_ℓ for every prime r ∤ Nℓ. Then there is a normalised newform f of weight one, of level dividing N′, whose character agrees with ε on the integers prime to N′, such that a_r(f) = t_r for every prime r ∤ N′. In particular, if ρ : G_ℚ → GL₂(ℂ) is continuous, semisimple and unramified outside N with tr ρ(Frob_r) = t_r and det ρ(Frob_r) = ε(r) for r ∤ N, then ρ ≅ ρ_f, the Deligne–Serre representation of f.

**Hypotheses and scope.**

- Infinitely many ℓ are needed, and finitely many may be discarded at each step (ℓ | N′, ℓ = 2, ℓ ∈ B(N′)).
- h_ℓ is only an eigenvector of T_r for r ∤ Nℓ and of the diamond operators. Nothing is assumed about T_ℓ or about the operators at primes dividing N.
- The family (t_r) is fixed in characteristic zero; this is what turns congruences modulo infinitely many primes into equalities.
- The conclusion gives a level dividing N′, not the exact level. That the level of f is the Artin conductor of ρ_f is Deligne–Serre's Théorème 4.6, which is not used.
- KW I attribute the argument to Khare's note [21] (Internat. Math. Res. Notices 1997, with a corrigendum in 1999), which was not read; the proof below is complete from the listed prerequisites.

**Proof obligations.**

- Level. A Katz form of level N pulls back to level N′ along X₁(N′) → X₁(N), remaining an eigenvector of T_r for r ∤ N′ℓ with the same eigenvalues and with character ε viewed modulo N′. Discard the ℓ dividing 2N′ and those in B(N′).
- Lifting. Let M = S₁(N′; ℤ[1/N′]), a finite free module with the commuting operators T_r (r ∤ N′) and ⟨d⟩ (AlgebraicModularFormsAndSerreWeights R15.2/finite-generation-of-geometric-sections). For the remaining ℓ, h_ℓ lies in M ⊗ 𝔽̄_ℓ (R27.6/weight-one-reduction-is-onto-for-almost-all-primes). Take for 𝒪 the ring of integers of a finite unramified extension of the completion E_λ whose residue field contains a field of definition of h_ℓ, and apply the Deligne–Serre lifting lemma (R15.5/deligne-serre-eigenvalue-lifting-lemma) to M ⊗ 𝒪 and the family {T_r : r ∤ N′ℓ} ∪ {⟨d⟩}: there are a discrete valuation ring V dominating 𝒪 and an eigenvector in M ⊗ V whose eigenvalues b_r ∈ V satisfy b_r ≡ t_r modulo the maximal ideal of V, and whose diamond character reduces to ε mod λ.
- Finitely many systems. The eigenvalue systems of {T_r : r ∤ N′} ∪ {⟨d⟩} on M ⊗ ℚ̄ form a finite set, stable under Gal(ℚ̄/ℚ) because M is defined over ℤ[1/N′]; their values are integral over ℤ[1/N′]. Let E′ ⊃ E be a finite Galois extension of ℚ containing all these values. Every eigenvalue system of the smaller family {T_r : r ∤ N′ℓ} ∪ {⟨d⟩} is the restriction of one of them. Fix an embedding τ of E′ in an algebraic closure of Frac V extending E ⊂ Frac V, and a valuation ring W of that algebraic closure dominating V, with maximal ideal 𝔪_W. Then (b_r)_{r ∤ N′ℓ} = (τΘ(T_r))_r for one of the systems Θ, and λ′ = τ⁻¹(𝔪_W) ∩ 𝒪_{E′} is a prime of E′ above λ with Θ(T_r) ≡ t_r mod λ′ for r ∤ N′ℓ and Θ(⟨d⟩) ≡ ε(d) mod λ′.
- Pigeonhole. There are infinitely many ℓ and finitely many systems, so one system Θ occurs for infinitely many ℓ. For a fixed prime r ∤ N′, the element Θ(T_r) − t_r of 𝒪_{E′}[1/N′] lies in primes above infinitely many rational primes, hence is zero; likewise Θ(⟨d⟩) = ε(d).
- Newform. Θ is the eigensystem of a nonzero f₀ ∈ S₁(Γ₁(N′), ε; ℂ) (R15.1/all-weight-analytic-comparison). By the theory of newforms (Tau Ceti ModularForms, Layer 4) there is a unique normalised newform f of level dividing N′, with character agreeing with ε on the integers prime to N′, such that a_r(f) = Θ(T_r) = t_r for r ∤ N′.
- Galois representations. ρ_f (AutomorphicGaloisRepresentations R19.1/weight-one-artin-representation) and ρ are semisimple, of finite image, with the same trace and determinant at Frob_r for all r ∤ N′; every element of a finite Galois group is such a Frobenius (Chebotarev), so their characters agree and ρ ≅ ρ_f (ArithmeticGaloisRepresentations R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent).

**Acceptance.**

- The pigeonhole step uses primes above infinitely many different ℓ: a nonzero element of 𝒪_{E′}[1/N′] has only finitely many prime divisors.
- The theorem does not need ρ. It produces f from the family (t_r), so it also serves KW I Theorem 10.1(ii) for a general irregular compatible system (ModularityAndLanglandsExtensions ML.1), where finiteness of the image is a consequence; there the Katz forms h_ℓ come from the weight-one step without the hypothesis on Frobenius.
- With weight k ≥ 2 in place of 1 the same argument, without the lifting step, is the proof of Theorem 10.1(i) (R27.6/scope-of-the-final-statement-and-the-compatible-system-export).
- If the hypothesis holds for finitely many ℓ only, there is no conclusion: a Katz eigenform of weight one modulo ℓ need not lift.

**Prerequisites.** [R27.6/weight-one-reduction-is-onto-for-almost-all-primes](#r27-6-weight-one-reduction-is-onto-for-almost-all-primes); [AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor](../../../content/tau-ceti/ModularForms/README.md#layer-4-eigenforms-newforms-primitive-forms-the-conductor); [AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation](../../../content/campaign/AutomorphicGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev](../../../content/tau-ceti/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Artin; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1, p. 20 of the preprint. KW I's one-sentence sketch of the weight-one step; [21] is Khare's IMRN note, [19] Gross, [7] Coleman–Voloch, [14] Edixhoven.

<a id="r33-1"></a>

### R33.1. Modern lifting inputs and the first weight change

State the qualitative target, imported lifting alternatives, the Fontaine–Laffaille bad-dihedral exclusion and the construction of the first weight-two system. This proof does not call the level-one induction.

<a id="r33-1-dp-target-and-the-weight-at-least-two-convention"></a>

#### The Dieulefait–Pacetti target and the reduction to non-solvable image

Identifier: `ClassicalSerreModularity:R33.1/dp-target-and-the-weight-at-least-two-convention`. Kind: theorem. Planet: **Serre's conjecture, weak form (Dieulefait–Pacetti)**.

Target (weak Serre): an odd continuous irreducible ρ̄ : G_ℚ → GL₂(𝔽̄_p) is modular, i.e. ρ̄ ≅ ρ̄_{f,p} for some f in S_k(Γ₀(N), ε). Only cohomological forms, k ≥ 2, are used: by the congruence of Deligne–Serre §6.9, a ρ̄ congruent to the representation of a weight-one form is congruent to one of weight ≥ 2. For p odd, a ρ̄ with solvable image is modular (Theorem 1.3, Langlands–Tunnell): by Dickson the projective image is cyclic, dihedral, A₄ or S₄, ρ̄ lifts to an odd representation into GL₂(ℂ), which comes from a weight-one form (Hecke; Langlands; Tunnell). So in odd characteristic the target reduces to non-solvable image. The equivalence of the weak and strong forms is imported (Edixhoven for the weight, Ribet and Boston–Lenstra–Ribet for the level), not reproved.

**Hypotheses and scope.**

- irreducible and odd are hypotheses of the statement
- the restriction to k ≥ 2 is a convention justified by the Deligne–Serre congruence, not an omission
- Theorem 1.3 is used only for odd p; at p = 2 the solvable case is Rohrlich–Tunnell (R33.5)
- Dickson's classification is cited from its owner, ArithmeticGaloisRepresentations R01.4/dickson-classification-and-the-dyadic-refinement, not from the mixed KW I §6 node of R27.1: the modern strand takes from R27.1 only the three good-dihedral declarations (Definition 2.1, Lemma 6.3, Lemma 8.2).

**Proof obligations.**

- State the target and the convention (Introduction, Remark 1).
- Theorem 1.3 (GL2AutomorphicRepresentationsAndTransfer R17.5) with the weight shift of Remark 1 (AlgebraicModularFormsAndSerreWeights R15.5).

**Acceptance.**

- Check that the produced form has k ≥ 2 and that no step silently uses a weight-one form
- Check that the weight and level refinements really are imported, so the independence of this strand concerns only the qualitative statement

**Prerequisites.** [GL2AutomorphicRepresentationsAndTransfer:R17.5](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement](../../../content/campaign/ArithmeticGaloisRepresentations/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 1 of the arXiv version. The target.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 1, p. 1 of the arXiv version. The literal justification for k ≥ 2.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Theorem 1.3, p. 3 of the arXiv version. The solvable case.

<a id="r33-1-dp-modularity-lifting-inputs"></a>

#### Modularity transfer along congruences (DP Theorems 1.4–1.7)

Identifier: `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`. Kind: theorem.

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) be continuous, odd, finitely ramified and de Rham at p with Hodge–Tate weights {0, k−1} and {0, k′−1} (k, k′ > 1), with isomorphic residual representations. If p is odd and ρ̄|_{G_{ℚ(√p*)}} is absolutely irreducible (Theorem 1.4), or p = 2 and ρ̄ has non-solvable image (Theorem 1.5), then ρ is modular if and only if ρ′ is. For residually reducible ρ̄ the inputs are Theorem 1.6 (p ≥ 5, ρ irreducible, de Rham with Hodge–Tate weights {0, k−1}: ρ is modular; Skinner–Wiles and Pan) and Theorem 1.7 (p = 3, ρ̄^{ss} ≅ 1 ⊕ χ₃, ρ|_{I₃} of the form (∗ ∗; 0 1), det ρ = ψχ₃^{k−1}: Skinner–Wiles). With Remark 4 (a compatible system is modular iff one member is) these propagate modularity along every chain of systems in §2.

**Hypotheses and scope.**

- Theorem 1.4's residual hypothesis is over ℚ(√p*), the quadratic field unramified outside p; Lemma 1.13 shows it is equivalent to absolute irreducibility over ℚ(ζ_p) (ArithmeticGaloisRepresentations R01.4)
- Theorem 1.5 requires non-solvable residual image; it is not available for solvable image at p = 2
- Theorem 1.6 requires p ≥ 5; p = 3 residually reducible is the separate, more restrictive Theorem 1.7
- the attributions are layered: Kisin for Theorem 1.4 with Emerton or Paškūnas removing the local-global hypothesis, Hu–Tan (p ≥ 5) and Tung (p = 3) the other; Kisin, Paškūnas and Tung for Theorem 1.5; Skinner–Wiles and Pan for Theorem 1.6; Skinner–Wiles for Theorem 1.7
- the lifting theorems are imported (GL2ModularityLifting R32.6 for 1.4–1.6, R32.5 for 1.7); this node records the transfer form in which §2 uses them
- Theorem 1.4 is GL2ModularityLifting R32.2/odd-prime-statement-over-q, and what an application of it must verify is the contract R32.2/application-requirements (residual image over ℚ(√p*), Hodge–Tate weights {0, k−1} with k ≥ 2, oddness, residual modularity or the congruence, and no condition of ordinarity). The verification belongs to the nodes of R33.1–R33.4 that apply the theorem, each of which cites this node: Lemma 1.14 through R33.1/fontaine-laffaille-member-not-bad-dihedral in Paso 1; Lemma 2.1 (R33.2/lemma-2-1-large-image) in Pasos 2–4 and in Lemma 2.3; the case split 'irreducible and not bad dihedral' in Pasos 5–6. The dependency therefore runs from R32.2 to R33.1–R33.4 only.

**Proof obligations.**

- If ρ is modular, ρ̄ is modular, so ρ′ satisfies the hypotheses of Theorem 1.4 (resp. 1.5) and is modular; the statement is symmetric.
- Remark 4: members of one compatible system are simultaneously modular or not (Brauer–Nesbitt on Frobenius traces).

**Acceptance.**

- Check that the version of Theorem 1.4 used at p = 3 incorporates Tung's removal of Kisin's extra hypothesis, since the argument uses p = 3 in Paso 4
- Check Theorem 1.7's local hypotheses where it is applied (Paso 6, through SmallRamificationAndAbelianVarietyBaseCases R25.5)

**Prerequisites.** [GL2ModularityLifting:R32.2/odd-prime-statement-over-q](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R32.2/application-requirements](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R32.6](../../../content/campaign/GL2ModularityLifting/README.md); [GL2ModularityLifting:R32.5](../../../content/campaign/GL2ModularityLifting/README.md); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Theorem 1.4, p. 4 of the arXiv version. Theorem 1.4 and its residual hypothesis.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.4, p. 4 of the arXiv version. The layered attribution.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Theorem 1.6, p. 4 of the arXiv version. The p ≥ 5 restriction.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 4, p. 7 of the arXiv version. Modularity of one member is modularity of all.

<a id="r33-1-fontaine-laffaille-member-not-bad-dihedral"></a>

#### Members in the Fontaine–Laffaille range are not bad dihedral

Identifier: `ClassicalSerreModularity:R33.1/fontaine-laffaille-member-not-bad-dihedral`. Kind: lemma.

Let p be odd and ρ : G_ℚ → GL₂(ℚ̄_p) crystalline at p with Hodge–Tate weights {0, k−1}, k ≥ 2, and p > 2k. Then k(ρ̄) = k (Fontaine–Laffaille), and if ρ̄ is irreducible it is not bad dihedral: ρ̄|_{G_{ℚ(√p*)}}, equivalently ρ̄|_{G_{ℚ(ζ_p)}} (Lemma 1.13), is absolutely irreducible. Indeed a bad-dihedral ρ̄ has p = 2k(ρ̄) − 1 (niveau 1) or p = 2k(ρ̄) − 3 (niveau 2) by Lemma 1.14 (= KW I Lemma 6.2(ii)), so p ≤ 2k − 1. For k = 2 the bound p > 3 already suffices.

**Hypotheses and scope.**

- the weight identification needs the Fontaine–Laffaille range k ≤ p − 1, implied by p > 2k
- uses: (k, w) with w > 2k in Paso 1, (2, q) with q > 5 in Paso 2, and (2, p) with p > 3 in §3
- the statement of Lemma 1.14 is KW I Lemma 6.2(ii), whose owner under RS-06 is AlgebraicModularFormsAndSerreWeights R15.4/bad-dihedral-normalized-weight-application, with the definition and Lemma 1.13 in ArithmeticGaloisRepresentations R01.4/bad-dihedral-representations-and-the-oddness-criterion; DP give a detailed proof separating niveaux 1 and 2

**Proof obligations.**

- Fontaine–Laffaille: the residual inertia weights of a crystalline ρ with Hodge–Tate weights {0, k−1}, k ≤ p − 1, give k(ρ̄) = k (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3, with Serre's recipe from R15.4).
- Lemma 1.14: the projective image of I_p has order ≤ 2 for bad-dihedral ρ̄; in niveau 1, χ^{k−1} of order ≤ 2 with k ≤ p gives 2k − 2 = p − 1; in niveau 2, ψ^{(k−1)(p−1)} has order (p+1)/gcd(p+1, k−1), ≤ 2 only for k − 1 = (p+1)/2.
- p > 2k excludes both.

**Acceptance.**

- Check the arithmetic: p > 2k excludes p = 2k − 1 and p = 2k − 3 (checked in the suggested Lean file)
- Check the niveau-2 order computation on p = 7, k = 5: (p + 1)/gcd(8, 4) = 2, so p = 2k − 3 is attained

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.4/bad-dihedral-normalized-weight-application](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representations-and-the-oddness-criterion](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-tame-inertia](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma 1.14, p. 8 of the arXiv version. The statement.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 1.14, p. 9 of the arXiv version. The niveau-2 computation.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. A use of the lemma.

<a id="r33-1-solvable-residual-termination"></a>

#### Solvable residual image terminates the argument

Identifier: `ClassicalSerreModularity:R33.1/solvable-residual-termination`. Kind: lemma.

Let p ≥ 5 and ρ : G_ℚ → GL₂(ℚ̄_p) be odd, irreducible, finitely ramified and de Rham at p with Hodge–Tate weights {0, k−1}, k > 1, whose residual representation ρ̄ has solvable image and is not bad dihedral. Then ρ is modular: if ρ̄ is reducible, by Theorem 1.6; if ρ̄ is irreducible, ρ̄ is modular by Theorem 1.3 and ρ by Theorem 1.4. DP call this argument crucial: it ends Paso 1 at w, Paso 2 at q, and the reduction of §3.

**Hypotheses and scope.**

- p ≥ 5 is needed for Theorem 1.6; w > 2k ≥ 4 and q > 5 provide it
- "not bad dihedral" is needed for Theorem 1.4; R33.1/fontaine-laffaille-member-not-bad-dihedral provides it
- ρ is irreducible because it is a member of an irreducible compatible system

**Proof obligations.**

- Reducible branch: Theorem 1.6.
- Irreducible solvable branch: Theorem 1.3, then Theorem 1.4.

**Acceptance.**

- Check that every application has residue characteristic ≥ 5
- Check that the irreducible solvable branch uses Theorem 1.3 only in odd characteristic

**Prerequisites.** [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [R33.1/dp-target-and-the-weight-at-least-two-convention](#r33-1-dp-target-and-the-weight-at-least-two-convention); [R33.1/fontaine-laffaille-member-not-bad-dihedral](#r33-1-fontaine-laffaille-member-not-bad-dihedral).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. The two branches.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. DP flag the argument for reuse.

<a id="r33-1-paso-1-weight-two-system"></a>

#### Paso 1: change to a weight-two system

Identifier: `ClassicalSerreModularity:R33.1/paso-1-weight-two-system`. Kind: theorem. Planet: **Paso 1: change to a weight-two system**.

Let p be odd and ρ̄ : G_ℚ → GL₂(𝔽̄_p) odd and irreducible with non-solvable image, twisted so that 2 ≤ k = k(ρ̄) ≤ p + 1. Let ρ^{(0)} be a minimal crystalline lift (Theorem 1.9(3)) in an almost strictly compatible system {ρ^{(0)}_ℓ} (Theorem 1.11). Choose a prime w > 2k outside its ramification set. Then either ρ^{(0)}_w, and so ρ̄, is modular, or ρ̄^{(0)}_w has non-solvable image and there is an almost strictly compatible system {ρ^{(1)}_ℓ} with Hodge–Tate weights {0, 1}, containing a weight-2 lift ρ^{(1)}_w of ρ̄^{(0)}_w with the same ramification set (Theorem 1.9(4)), such that ρ̄ is modular if and only if {ρ^{(1)}_ℓ} is. S₁ denotes its ramification set.

**Hypotheses and scope.**

- w > 2k puts ρ^{(0)}_w in the Fontaine–Laffaille range, so the Serre weight of ρ̄^{(0)}_w is k and it is not bad dihedral
- the first system exists because non-solvable image makes ρ̄|_{ℚ(ζ_p)} absolutely irreducible, which Theorems 1.9 and 1.11 require
- ρ^{(1)}_w need not be crystalline at w, so w may lie in S₁

**Proof obligations.**

- Fontaine–Laffaille member at w: not bad dihedral (R33.1/fontaine-laffaille-member-not-bad-dihedral).
- Solvable residual image at w: modular (R33.1/solvable-residual-termination).
- Otherwise the weight-2 lift and its system; modularity transfer by Theorem 1.4 at w and Remark 4.

**Acceptance.**

- Check that S₁ is contained in the ramification set of {ρ^{(0)}_ℓ} together with w
- Check that the transfer at w uses Theorem 1.4 with ρ̄^{(0)}_w not bad dihedral

**Prerequisites.** [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [R33.1/fontaine-laffaille-member-not-bad-dihedral](#r33-1-fontaine-laffaille-member-not-bad-dihedral); [R33.1/solvable-residual-termination](#r33-1-solvable-residual-termination); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. The choice of w.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. The weight-2 lift.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 1, p. 10 of the arXiv version. Propagating modularity.

<a id="r33-2"></a>

### R33.2. The prescribed good-dihedral type and removal of odd level

Choose the local induction Ind κ with its normalized Frobenius value and specify the standard lattice. Insert the prescribed inertial type, retain it with KW-minimal lifts, then remove the other odd ramified primes.

<a id="r33-2-dihedral-local-type-at-n"></a>

#### The dihedral local type Ind κ at the auxiliary prime N

Identifier: `ClassicalSerreModularity:R33.2/dihedral-local-type-at-n`. Kind: construction.

Let q be an odd prime and N a prime with q | N + 1 (so q ∤ N − 1). Let ℚ_{N²} be the unramified quadratic extension of ℚ_N; its residue field is 𝔽_{N²}, whose unit group has order N² − 1 = (N − 1)(N + 1). By local class field theory there is a character κ : G_{ℚ_{N²}} → ℤ̄_q^× of order q whose restriction to the inertia group I_N factors through 𝔽_{N²}^× and not through 𝔽_N^× (niveau 2), normalised by κ(Art(N)) = 1, that is, trivial on the Frobenius of G_{ℚ_{N²}} attached to the uniformiser N. Its induction τ_N = Ind_{G_{ℚ_{N²}}}^{G_{ℚ_N}} κ is irreducible, τ_N|_{I_N} ≅ κ ⊕ κ^N, and its image is dihedral of order 2q. Without the normalisation, κ(Art(N)) = ζ ≠ 1 is a scalar in the image, which then has order 2q²; the projective image is dihedral of order 2q in either case, and the inertial type depends only on κ|_{I_N}. Its standard integral model is the induced lattice L_std = Ind 𝒪(κ) = 𝒪[G_{ℚ_N}] ⊗_{𝒪[G_{ℚ_{N²}}]} 𝒪(κ), over the ring of integers 𝒪 of a finite extension of ℚ_q containing µ_q, with basis e₁ = 1 ⊗ 1, e₂ = s ⊗ 1 for a Frobenius lift s: a generator σ of tame inertia acts by diag(κ(σ), κ(σ)^N) and s by (0 1; 1 0), because κ(s²) = κ(Art(N)) = 1 for every Frobenius lift s. The reduction of L_std modulo the maximal ideal is unramified (κ̄ = 1, as 𝔽̄_q^× has no element of order q), namely 1 ⊕ η with η the unramified quadratic character, with zero trace at Frobenius. This residual statement is about L_std: every G_{ℚ_N}-stable lattice has semisimplified reduction 1 ⊕ η (Brauer–Nesbitt), but another stable lattice can reduce to a non-split extension with nontrivial unipotent inertia, as the lattice L₁ of R33.3/dp-dyadic-transition-and-the-order-three-type does at (q, N) = (3, 2). The same construction with coefficients in ℤ̄_p for p ≠ q stays irreducible after reduction.

**Hypotheses and scope.**

- q odd and q | N + 1; the source prints "residue field has order (N − 1)(N + 1)" and "restriction to the inertia group at q" (source issues ClassicalSerreModularity/E4 and E5)
- κ exists because 𝒪_{ℚ_{N²}}^× → 𝔽_{N²}^× has a cyclic quotient of order q (q | N² − 1), extended to G_{ℚ_{N²}} by local class field theory
- level 2 is essential: a character of order q factoring through 𝔽_N^× would make Ind κ reducible on inertia
- the normalisation κ(Art(N)) = 1 is needed for the image of τ_N to be dihedral of order 2q; the source (Paso 2) speaks of a dihedral representation, which is true for every κ in the sense of being induced, and only the inertial type of τ_N is used by the nodes that consume it
- the split residual statement is tied to the standard lattice L_std; it is what Paso 2 uses (R33.2/dp-lift-existence-and-good-dihedral-insertion), where N ∉ S₁, so ρ̄|_{I_N} is trivial and L_std realises it, which is the compatibility DP Theorem 1.9(4) asks for at N (DP p. 6). A consumer whose residual inertia at N is nontrivial needs another stable lattice (R33.3 at (q, N) = (3, 2))

**Proof obligations.**

- Local class field theory for ℚ_{N²} and the tame quotient of I_N (ArithmeticGaloisRepresentations R01.2).
- Irreducibility: κ ≠ κ^N because κ^{N−1} ≠ 1 (q ∤ N − 1).
- Image: with κ(Art(N)) = 1, κ^{Frob} = κ^N = κ^{−1} on all of G_{ℚ_{N²}}, so G_{ℚ_{N²}} maps onto {diag(ζ, ζ^{−1}) : ζ ∈ µ_q}; a Frobenius lift s maps to an antidiagonal matrix with s² ↦ κ(Art(N))·1 = 1, so the image is dihedral of order 2q.
- The standard lattice: s e₁ = e₂ and s e₂ = s² ⊗ 1 = κ(s²) e₁. The transfer G_{ℚ_N}^{ab} → G_{ℚ_{N²}}^{ab} sends s to s² and corresponds to the inclusion ℚ_N^× ⊂ ℚ_{N²}^×, so s² = Art(Nu) with u ∈ ℤ_N^×; κ is trivial on ℤ_N^× because the image of 𝔽_N^× in the order-q quotient of 𝔽_{N²}^× is trivial (q ∤ N − 1). Hence κ(s²) = κ(Art(N)) = 1 and s acts by (0 1; 1 0); σ ∈ I_N acts on e₂ by κ(s⁻¹σs) = κ(σ)^N.
- Reduction of the standard lattice: κ̄ = 1, so L_std/𝔪L_std is Ind 1 = 1 ⊕ η with η the unramified quadratic character, and the trace at Frob_N is 1 − 1 = 0. Every other stable lattice has the same semisimplified reduction by Brauer–Nesbitt; its reduction itself need not be split.

**Acceptance.**

- Check |𝔽_{N²}^×| = (N − 1)(N + 1) and |𝔽_{N²}| = N² on N = 5 (checked in the suggested Lean file)
- Check that for p ≠ q the reduction of Ind κ is irreducible, since κ̄ (mod p) still has order q and level 2
- Check that the split residual statement is applied only to L_std, and that Paso 2 needs no other lattice (ρ̄ unramified at N)

**Prerequisites.** [ArithmeticGaloisRepresentations:R01.2](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [ArithmeticGaloisRepresentations:R01.4](../../../content/campaign/ArithmeticGaloisRepresentations/README.md).

**Uses.**

- ClassicalSerreModularity:R33.2/dp-lift-existence-and-good-dihedral-insertion: the local type imposed at N through Theorem 1.9(4)
- ClassicalSerreModularity:R33.2/lemma-2-1-large-image: Lemma 2.1: the reduction of Ind κ modulo p ≠ q is irreducible on D_N
- ClassicalSerreModularity:R33.3/dp-dyadic-transition-and-the-order-three-type: the same induction with (q, N) = (3, 2) gives the order-3 type at 2

**Planning API.**

| Proposed name | Role | Statement |
| --- | --- | --- |
| `TauCeti.SerreConjecture.DP.levelTwoCharacter` | constructor | κ : G_{ℚ_{N²}} → 𝒪^× of order q, for q \| N + 1, with κ(Art(N)) = 1 |
| `TauCeti.SerreConjecture.DP.levelTwoCharacter_orderOf` | characterisation | orderOf κ = q, and κ\|_{I_N} does not factor through 𝔽_N^× |
| `TauCeti.SerreConjecture.DP.levelTwoCharacter_artin` | characterisation | κ(Art(N)) = 1: κ is trivial on the Frobenius attached to the uniformiser N |
| `TauCeti.SerreConjecture.DP.dihedralType` | constructor | τ_N = Ind κ : G_{ℚ_N} → GL₂(𝒪), written in the basis e₁ = 1 ⊗ 1, e₂ = s ⊗ 1 of the standard lattice L_std = Ind 𝒪(κ) |
| `TauCeti.SerreConjecture.DP.dihedralType_irreducible` | characterisation | τ_N is irreducible, and so is its reduction modulo any prime p ≠ q |
| `TauCeti.SerreConjecture.DP.dihedralType.standardLattice` | data | L_std = Ind 𝒪(κ) = 𝒪e₁ ⊕ 𝒪e₂, e₁ = 1 ⊗ 1, e₂ = s ⊗ 1 for a Frobenius lift s; on it σ ∈ I_N acts by diag(κ(σ), κ(σ)^N) and s by (0 1; 1 0), since κ(s²) = κ(Art(N)) = 1 |
| `TauCeti.SerreConjecture.DP.dihedralType_standardLattice_residual` | compatibility | the reduction of the standard lattice, L_std/𝔪L_std, is 1 ⊕ η with η unramified quadratic: unramified, with trace 0 at Frob_N. This is a statement about L_std only |
| `TauCeti.SerreConjecture.DP.dihedralType_residual_semisimplification` | compatibility | for every G_{ℚ_N}-stable 𝒪-lattice Λ in τ_N, (Λ/𝔪Λ)^{ss} ≅ 1 ⊕ η (Brauer–Nesbitt); the reduction Λ/𝔪Λ itself depends on Λ |

**Unit-test statements.**

- `residue_field_units` (example): 5² − 1 = 24 = 4·6 while |𝔽₂₅| = 25, so "(N − 1)(N + 1)" is the order of the unit group (checked in Lean)
- `level_two_q7_N13` (example): q = 7, N = 13: 7 | 14 and 7 ∤ 12, so κ has niveau 2 (checked in Lean)
- `level_one_nonexample` (non-example): q = 3, N = 7: 3 | 6 = N − 1, so a character of order 3 factors through 𝔽₇^× and Ind κ is reducible on I_N
- `residual_trace_zero` (degenerate): on the standard lattice, κ̄ = 1 and Ind 1 = 1 ⊕ η has trace 1 + η(Frob_N) = 1 − 1 = 0 at Frob_N
- `unnormalised_character` (non-example): if κ(Art(N)) = ζ ≠ 1 then G_{ℚ_{N²}} maps onto µ_q × µ_q (the scalar ζ together with diag(ξ, ξ^{−1})), so Ind κ has image of order 2q², while its projective image is still dihedral of order 2q
- `residual_depends_on_lattice` (non-example): (q, N) = (3, 2), 𝒪 = ℤ₃[ζ], π = ζ − 1: the stable lattice L₁ = 𝒪(e₁ + e₂) + 𝒪πe₂ reduces to σ ↦ (1 0; 1 1), with one-dimensional inertia invariants, while L_std reduces to the trivial inertia action; a residual statement that names no lattice is therefore false (checked in Lean, with the R33.3 tests)

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of the arXiv version. ℚ_{N²} (with the misprinted residue-field order).
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of the arXiv version. Niveau 2 (with the misprint q for N).
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of the arXiv version. The residual type.

<a id="r33-2-dp-lift-existence-and-good-dihedral-insertion"></a>

#### Paso 2: application of the prescribed-type lift at the good-dihedral prime

Identifier: `ClassicalSerreModularity:R33.2/dp-lift-existence-and-good-dihedral-insertion`. Kind: construction. Planet: **Paso 2: the good-dihedral prime N**.

Let {ρ^{(1)}_ℓ} be the weight-2 system of Paso 1, with coefficient field K and ramification set S₁. Choose a prime q ≡ 1 mod 4, q > 5, larger than every prime of S₁ and split in K. Either ρ^{(1)}_q is modular (solvable residual image: R33.1/solvable-residual-termination, with ρ̄^{(1)}_q not bad dihedral since k = 2 and q > 5), or ρ̄^{(1)}_q : G_ℚ → GL₂(𝔽_q) — 𝔽_q-valued because q splits in K — has non-solvable image. Choose N ∉ S₁ by Lemma 1.15 (= KW I Lemma 8.2, R27.1): Tr ρ̄^{(1)}_q(Frob_N) = 0 and χ̄_q(Frob_N) = −1, so ρ̄^{(1)}_q|_{D_N} is, up to twist, diag(χ̄_q, 1), and q | N + 1. Theorem 1.9(4) gives a lift ρ^{(2)}_q, crystalline of weight 2 at q, whose inertial type at N is that of τ_N = Ind κ (R33.2/dihedral-local-type-at-n): ρ^{(2)}_q(I_N) is cyclic of order q, acting through κ ⊕ κ^N, and the projective image of D_N is dihedral of order 2q. The image of D_N itself is infinite, since det ρ^{(2)}_q(Frob_N) = ψ(N)·N is not a root of unity; by Theorem 1.4, ρ^{(1)}_q is modular iff ρ^{(2)}_q is, and Theorem 1.11 puts ρ^{(2)}_q in an almost strictly compatible system {ρ^{(2)}_ℓ} with ramification set S = S₁ ∪ {N}. This is exclusively the Paso 2 application of Theorem 1.9(4), supplied by PotentialModularityAndCompatibleSystems R24.3. The general existence theorem and its cases (1)–(4) are not proved here. Its crystalline clause uses k(ρ̄_q) = 2, inherited from the weight-two Fontaine–Laffaille system at the chosen q.

**Hypotheses and scope.**

- Theorem 1.9 requires absolute irreducibility over ℚ(ζ_q) (non-solvable image gives it) and allows prescribing any compatible type at primes of Σ
- Lemma 1.15 is stated for 𝔽_q-valued ρ̄, matching the rationality correction to KW I Lemma 8.2; this is why q is taken split in K
- the attributions of Theorem 1.9(4) split: partial results in KW I Theorem 5.1, the general case Gee and Snowden Theorem 7.2.1 (PotentialModularityAndCompatibleSystems R24.3)
- N ≡ 1 mod 8 and N ≡ 1 modulo every prime ≤ q − 1 (Lemma 1.15(2)) are what Lemma 2.1 needs later
- DP p. 11 speaks of a lift "with such a dihedral image of order 2q at the prime N"; only the inertial type and the projective image have that form (source issue ClassicalSerreModularity/E8), and Lemma 2.1 uses only the inertial type
- The coefficient prime q lies outside the ramification set S₁ of the weight-two system, so the residual Serre weight is 2, not q + 1. Establish this before invoking the crystalline alternative of Theorem 1.9(4).

**Proof obligations.**

- Choose q; dispose of solvable residual image.
- Choose N by Lemma 1.15; read off ρ̄^{(1)}_q|_{D_N}.
- Apply the R24.3 prescribed-type lift export in its crystalline weight-two alternative at q, with the compatible type τ_N at N; retain the projective/inertial correction E8. Transfer modularity using dp-modularity-lifting-inputs and form the system by the R24.6 compatible-system export.

**Acceptance.**

- Check that N satisfies the congruences of Lemma 1.15 before Lemma 2.1 is invoked
- Check that the inertial type at N is preserved through every congruence of Pasos 3 and 4, since Lemma 2.1's hypothesis refers to it

**Prerequisites.** [R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes](#r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes); [R33.2/dihedral-local-type-at-n](#r33-2-dihedral-local-type-at-n); [R33.1/solvable-residual-termination](#r33-1-solvable-residual-termination); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [R33.1/paso-1-weight-two-system](#r33-1-paso-1-weight-two-system).

**Uses.**

- ClassicalSerreModularity:R33.2/lemma-2-1-large-image: Lemma 2.1: ramification in S ∪ {2, 3} and the type Ind κ at N
- ClassicalSerreModularity:R33.2/paso-3-killing-the-odd-level: the starting system of Paso 3
- ClassicalSerreModularity:R33.3/paso-4-removing-two: Lemma 2.1 keeps the image large through the congruences at 3 and 2
- ClassicalSerreModularity:R33.3/paso-5-killing-the-good-dihedral-prime: N is the last prime removed

**Planning API.**

| Proposed name | Role | Statement |
| --- | --- | --- |
| `TauCeti.SerreConjecture.DP.GoodDihedralInsertion` | structure | the data (q, N, κ, {ρ^{(2)}_ℓ}) with q ≡ 1 mod 4, q > 5, q > max S₁, q split in K, and N as in Lemma 1.15 for ρ̄^{(1)}_q |
| `TauCeti.SerreConjecture.DP.GoodDihedralInsertion.system` | projection | the almost strictly compatible system {ρ^{(2)}_ℓ}, ramified exactly at S₁ ∪ {N} |
| `TauCeti.SerreConjecture.DP.GoodDihedralInsertion.type_at_N` | characterisation | the Weil–Deligne parameter at N restricted to inertia is κ ⊕ κ^N |
| `TauCeti.SerreConjecture.DP.GoodDihedralInsertion.congruences` | characterisation | N ≡ 1 mod 8, N ≡ 1 mod every prime ≤ q − 1, and N ≡ −1 mod q |
| `TauCeti.SerreConjecture.DP.GoodDihedralInsertion.modular_iff` | equivalence | {ρ^{(1)}_ℓ} is modular iff {ρ^{(2)}_ℓ} is |

**Unit-test statements.**

- `insertion_congruences_q13` (example): for q = 13 the prime N = 406561 satisfies N ≡ 1 mod 8, N ≡ 1 mod 3, 5, 7, 11 and N ≡ −1 mod 13 (checked in Lean)
- `insertion_level_two` (example): 13 | 406561 + 1 and 13 ∤ 406561 − 1, so κ has level 2 (checked in Lean)
- `insertion_needs_rationality` (non-example): if q is inert in K the residual representation is only 𝔽_{q²}-valued and Lemma 1.15 (over 𝔽_q) does not apply
- `insertion_q_gt_5` (degenerate): q = 5 is excluded by the choice q > 5 in Paso 2; the Dickson step of Lemma 2.1 uses only that q divides neither |A₄| = 12 nor |S₄| = 24, so a solvable projective image of order divisible by q is dihedral
- `insertion_not_general_lift_owner` (non-example): A request for all four branches of DP Theorem 1.9 cannot be answered by this Paso 2 construction; R24.3 is its single owner.
- `insertion_crystalline_needs_weight_two` (non-example): Residual weight q + 1 at q selects the Steinberg clause of Theorem 1.9(4), and cannot be used to claim the crystalline Paso 2 lift.

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 10 of the arXiv version. The choice of q.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of the arXiv version. The local shape at N from Lemma 1.15.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Theorem 1.9(4), p. 6 of the arXiv version. Prescribed local types.

<a id="r33-2-lemma-2-1-large-image"></a>

#### Lemma 2.1: the good-dihedral prime keeps the residual images large

Identifier: `ClassicalSerreModularity:R33.2/lemma-2-1-large-image`. Kind: theorem.

Let {ρ_ℓ} be an almost strictly compatible system whose ramification set is contained in S ∪ {2, 3} and whose inertial type at N is that of Ind κ. Then for every prime p ∈ S₁ ∪ {2, 3} the residual representation ρ̄_p has non-solvable image. In fact ρ̄_p is good dihedral for N in the sense of KW I Definition 2.1, with t = q: ρ̄_p|_{I_N} ≅ κ̄ ⊕ κ̄^N with κ̄ of order q, q | N + 1, and q > max(Q(N(ρ̄_p)/N²), 5, p) because every other ramified prime and p lie in S₁ ∪ {2, 3}, below q; and N ≡ 1 mod 8 and N ≡ 1 modulo every prime ≤ q − 1. So KW I Lemma 6.3(i) (R27.1) applies. DP's own proof: ρ̄_p|_{D_N} is irreducible because reduction is injective on elements of order q ≠ p; a solvable image would be dihedral (Dickson, q > 5), induced from a quadratic K ramified only in S ∪ {2, 3}; N splits or ramifies in K by the congruences; splitting contradicts irreducibility on D_N and ramification contradicts the odd order of the type.

**Hypotheses and scope.**

- what the argument uses is q ≠ p; DP state q > p, which holds by construction
- the hypothesis on the type at N must survive every congruence of Pasos 3–4; it does for minimal lifts in KW I's sense (source issue ClassicalSerreModularity/E7)
- this is DP's form of KW I Lemma 6.3, which RS-06 lets the modern strand import from R27.1

**Proof obligations.**

- Verify Definition 2.1 for ρ̄_p and N from Ind κ (R33.2/dihedral-local-type-at-n) and the congruences of Lemma 1.15.
- Apply Lemma 6.3(i) (R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved).

**Acceptance.**

- Check q > max(Q(N(ρ̄_p)/N²), 5, p) for every p ∈ S₁ ∪ {2, 3}
- Check that the splitting argument uses N ≡ 1 mod 8 at the prime 2 and N ≡ 1 mod p at odd p ∈ S₁ ∪ {3}

**Prerequisites.** [R33.2/dihedral-local-type-at-n](#r33-2-dihedral-local-type-at-n); [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved); [R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes](#r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma 2.1, p. 11 of the arXiv version. The statement.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 2.1, p. 11 of the arXiv version. Irreducibility on D_N.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 2.1, p. 12 of the arXiv version. The splitting argument.

<a id="r33-2-paso-3-killing-the-odd-level"></a>

#### Paso 3: killing the odd part of the level

Identifier: `ClassicalSerreModularity:R33.2/paso-3-killing-the-odd-level`. Kind: theorem. Planet: **Paso 3: killing the odd part of the level**.

Let the system {ρ^{(2)}_ℓ} be ramified at {p₁ < … < p_r} ∪ {N}, S₁ = {p₁, …, p_r}. For i = 2, …, r (and also i = 1 if p₁ is odd): reduce the p_i-adic member modulo p_i; ρ̄^{(i)}_{p_i} has non-solvable image (Lemma 2.1), so Theorem 1.9(3) gives a minimal crystalline lift, unramified at p_i, and Theorem 1.11 a system {ρ^{(i+1)}_ℓ} whose ramification set omits p_i and stays inside S₁ ∪ {2, 3, N}, with the type at N unchanged; Theorem 1.4 makes consecutive systems simultaneously modular. The result is a system ramified only in {2, N} (only at N if p₁ is odd; then go to Paso 5), equivalent for modularity to {ρ^{(2)}_ℓ}. The good-dihedral prime N is kept.

**Hypotheses and scope.**

- the lifts must be minimal in KW I's sense (reduction bijective on inertia at N) so that the type at N, Lemma 2.1's hypothesis, is preserved; DP's definition of "minimal lift" (unramified wherever ρ̄ is) does not guarantee this (source issue ClassicalSerreModularity/E7)
- the intermediate systems have weight k(ρ̄^{(i)}_{p_i}), not necessarily 2; Paso 4 restores weight 2
- Theorem 1.9(3) needs ρ̄|_{ℚ(ζ_{p_i})} absolutely irreducible, given by non-solvable image

**Proof obligations.**

- For each i: Lemma 2.1, Theorem 1.9(3), Theorem 1.11, Theorem 1.4.
- Track the ramification set and the type at N.

**Acceptance.**

- Check that N stays ramified with type Ind κ at every step
- Check that the ramification set after step i is contained in (S₁ ∖ {p₂, …, p_i}) ∪ {2, N}

**Prerequisites.** [R33.2/lemma-2-1-large-image](#r33-2-lemma-2-1-large-image); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [R33.2/dp-lift-existence-and-good-dihedral-insertion](#r33-2-dp-lift-existence-and-good-dihedral-insertion); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 3, p. 12 of the arXiv version. The step.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 3, p. 12 of the arXiv version. The ramification bookkeeping (the type at N is not mentioned).
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 3, p. 12 of the arXiv version. The odd p₁ case.

<a id="r33-3"></a>

### R33.3. Changing the dyadic type and removing the auxiliary prime

Use the order-three type at 2 with a lattice adapted to the residual Steinberg branch. The odd-index finite-flat obstruction forces dyadic weight two. Pan’s de Rham input handles the reducible residual branch at the ramified coefficient prime.

<a id="r33-3-dp-dyadic-transition-and-the-order-three-type"></a>

#### Lemma 2.3: the order-three local type at 2, reached by a congruence at 3

Identifier: `ClassicalSerreModularity:R33.3/dp-dyadic-transition-and-the-order-three-type`. Kind: construction. Planet: **Lemma 2.3: the order-three type at 2**.

Let {ρ_ℓ} be an almost strictly compatible system with Hodge–Tate weights {0, 1}, unramified at 3, whose Weil–Deligne representation at 2 is Steinberg up to an unramified twist, and with ρ̄₃ of non-solvable image. Let χ′ be a character of G_{ℚ₄} (ℚ₄ the unramified quadratic extension of ℚ₂) of order 3 and niveau 2, normalised by χ′(Art(2)) = 1, with values in 𝒪 = ℤ₃[ζ], ζ² + ζ + 1 = 0, uniformiser π = ζ − 1, and ρ̃₂ = Ind_{G_{ℚ₄}}^{G_{ℚ₂}} χ′, so ρ̃₂|_{I₂} ≅ χ′ ⊕ χ′² with trivial monodromy. Then ρ̄₃|_{D₂} ≅ γ ⊗ (χ̄₃ c; 0 1) with γ unramified, and either c = 0 (split case: ρ̄₃ is unramified at 2 and ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1), η = χ̄₃|_{D₂} the unramified quadratic character) or ρ̄₃|_{I₂} is a nontrivial unipotent module (non-split case). There is a G_{ℚ₂}-stable 𝒪-lattice Λ in ρ̃₂ with γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}: the standard lattice L₀ = 𝒪e₁ ⊕ 𝒪e₂ of R33.2/dihedral-local-type-at-n in the split case, and the adapted lattice L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂ in the non-split case; L₀ does not serve in the non-split case. Hence ρ̃₂|_{I₂} is an inertial type compatible with ρ̄₃ at 2 in DP's sense (p. 6), and both reductions have trace 0 at Frobenius. A lift ρ′₃ of ρ̄₃, crystalline of weight 2 at 3, minimal away from 2 and 3, with ρ′₃|_{I₂} ≅ χ′ ⊕ χ′², exists by Theorem 1.9(4), and also by KW I Theorem 5.1(4) at (p, q) = (3, 2), whose hypotheses ρ̄₃ satisfies; Theorem 1.11 gives a system {ρ′_ℓ} with the same Hodge–Tate weights and ramification set, congruent to {ρ_ℓ} at 3, whose type at 2 comes from an order-3 character. Modularity of one system is equivalent to modularity of the other (Theorem 1.4 at 3).

**Hypotheses and scope.**

- Lemma 2.3 needs the system unramified at 3, Steinberg (up to twist) at 2, and non-solvable residual image at 3. Where the lemma is used the twist is unramified: Paso 4 step (1) produces the Steinberg type by Theorem 1.9(2), whose inertial parameter at 2 is (ω₁ ⊕ 1, N) with N ≠ 0, and KW I (proof of Theorem 9.1) say "up to unramified twist"
- k(ρ̄₃) = 2: the system is unramified at 3 with Hodge–Tate weights {0, 1}, so ρ₃ is crystalline at 3 and ρ̄₃ is finite flat; this is what allows a crystalline lift at 3
- the construction is DP Paso 2's with (q, N) = (3, 2): 3 | 2 + 1
- the reduction of ρ̃₂ depends on the lattice: R33.2/dihedral-local-type-at-n computes it for the standard lattice L₀ only, where it is split and unramified. Matching the characteristic-zero inertial type and the Frobenius trace does not identify residual I₂-modules. DP's compatibility (p. 6) asks for a stable 𝒪_E-lattice whose reduction is ρ̄₃|_{I₂}, so the lattice is chosen by the case: L₀ when ρ̄₃ is unramified at 2, L₁ when ρ̄₃|_{I₂} is nontrivial. DP's sentence that both representations "have the same reduction" on I₂ holds for this choice; no source erratum is asserted
- KW I Theorem 5.1(4) at (p, q) = (3, 2): ρ̄₃ is of S-type with k(ρ̄₃) = 2 ∈ [2, p + 1]; ρ̄₃|_{ℚ(µ₃)} is absolutely irreducible, since the image of ρ̄₃ is non-solvable and ℚ(µ₃) is quadratic; ρ̄₃|_{D₂} is (χ̄₃ ∗; 0 1) up to unramified twist; 3 | 2 + 1; χ′|_{I₂} = ω_{2,2} (i = 1, j = 0) has level 2 and order 3; there is no parity condition, as p = 3 is odd. Its conclusion at p is item 2 with k = 2, inertial parameter (1 ⊕ 1, 0), so ρ′₃ is crystalline of weight 2 at 3 and minimal at every ℓ ≠ 2, 3. Its local input at 2 is the level-two inertia-rigid condition of LocalGaloisDeformationRings R08.6/export-away-from-p (b), whose explicit lifts (ρ(F), ρ(σ)) with ρ(F)ρ(σ)ρ(F)⁻¹ = ρ(σ)^q are, at (p, q) = (3, 2), the matrices of L₀ and L₁
- KW I build the same order-3 type at 2 with their Theorem 5.1(4) in the proof of (D_1) (R27.5)

**Proof obligations.**

- Residual shape at 2. Steinberg up to an unramified twist γ̃ gives ρ₃(Frob₂) the eigenvalues γ̃(Frob₂)·{2, 1}, which reduce to γ(Frob₂)·{−1, 1} because χ̄₃(Frob₂) = 2 = −1 in 𝔽₃; and ρ̄₃(I₂) is unipotent, of order 1 or 3, so wild inertia acts trivially and I₂ acts through its quotient of order 3, generated by the image of a tame generator σ (ArithmeticGaloisRepresentations R01.2). If ρ̄₃(σ) = 1, ρ̄₃(Frob₂) has the distinct eigenvalues ±γ(Frob₂), so ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1): the split case. Otherwise, in a basis whose first vector spans the inertia invariants, ρ̄₃(σ) = (1 b; 0 1) with b ≠ 0 and ρ̄₃(Frob₂) = (α x; 0 β); the tame relation Frob₂ σ Frob₂⁻¹ = σ² forces α = −β; conjugating by an upper unipotent matrix, which commutes with ρ̄₃(σ), makes ρ̄₃(Frob₂) diagonal, and conjugating by diag(b⁻¹, 1) makes b = 1. So ρ̄₃|_{D₂} ≅ β ⊗ (Frob₂ ↦ diag(−1, 1), σ ↦ (1 1; 0 1)): the non-split case, with one-dimensional inertia invariants.
- The standard lattice L₀ (R33.2/dihedral-local-type-at-n at (q, N) = (3, 2)): σ ↦ D₀ = diag(ζ, ζ²) and Frob₂ ↦ F₀ = (0 1; 1 0). Modulo π, D₀ ≡ 1 and F₀ has eigenvalues 1 and −1, so L₀/πL₀ ≅ 1 ⊕ η: twisted by an unramified lift γ̃ of γ it realises the split case; it cannot realise the non-split case, whose inertia invariants are one-dimensional.
- The adapted lattice L₁ = 𝒪f₁ ⊕ 𝒪f₂, f₁ = e₁ + e₂, f₂ = πe₂, with change of basis P = (1 0; 1 π): D₀P = PD₁ and F₀P = PF₁ for D₁ = (ζ 0; ζ ζ²) and F₁ = (1 π; 0 −1), so L₁ is G_{ℚ₂}-stable, and both pairs satisfy D³ = F² = 1 and FDF⁻¹ = D². Modulo π, D₁ ≡ (1 0; 1 1) and F₁ ≡ diag(1, −1); in the basis (f₂, f₁) this is Frob₂ ↦ diag(−1, 1), σ ↦ (1 1; 0 1), the non-split module of step 1. Twisted by γ̃ it realises ρ̄₃|_{D₂}.
- So ρ̃₂|_{I₂} is compatible with ρ̄₃ at 2 in DP's sense, and after the twist both reductions have trace γ(Frob₂)·(1 − 1) = 0 at Frobenius.
- The lift: Theorem 1.9(4) with the compatible type ρ̃₂|_{I₂} at 2 and the crystalline clause at 3 (k(ρ̄₃) = 2; PotentialModularityAndCompatibleSystems R24.3/modern-prescribed-type-lifts, under the R24.3 request), or KW I Theorem 5.1(4) at (p, q) = (3, 2) (R24.3/theorem-5-1-part-4-level-two-type-at-q), whose hypotheses are checked above and whose local input at 2 is LocalGaloisDeformationRings R08.6/export-away-from-p (b). Then Theorem 1.11 (R24.6) and Theorem 1.4 at 3 (R33.1/dp-modularity-lifting-inputs).

**Acceptance.**

- Check that the congruence used is at 3 and that "unramified at 3" holds where the lemma is used (after Paso 3)
- Check that ρ̃₂ has trivial monodromy, so the new system is potentially crystalline at 2
- Check the lattice identities exactly over ℤ[ζ] and their reductions modulo π: L₀ reduces to a split module, L₁ to the non-split one (checked in the suggested Lean file)
- Check that the lattice is chosen by the residual case: L₀ when ρ̄₃ is unramified at 2, L₁ when it is ramified

**Prerequisites.** [R33.2/lemma-2-1-large-image](#r33-2-lemma-2-1-large-image); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [R33.2/dihedral-local-type-at-n](#r33-2-dihedral-local-type-at-n); [ArithmeticGaloisRepresentations:R01.2](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/modern-prescribed-type-lifts](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [LocalGaloisDeformationRings:R08.6/export-away-from-p](../../../content/campaign/LocalGaloisDeformationRings/README.md).

**Uses.**

- ClassicalSerreModularity:R33.3/paso-4-removing-two: step (2): change of the type at 2 through a congruence at 3
- ClassicalSerreModularity:R33.3/remark-6-weight-two-after-type-change: over K = ℚ₄(χ′), of ramification index 3, the new 2-adic member is crystalline
- ClassicalSerreModularity:R27.5/d1-by-the-prime-three: the same order-3 type at 2 in KW I's proof of (D_1)
- Dieulefait–Pacetti, Theorem 1.9(4), p. 6: the inertial type at 2 must be compatible with ρ̄₃: a stable lattice reducing to ρ̄₃|_{I₂}

**Planning API.**

| Proposed name | Role | Statement |
| --- | --- | --- |
| `TauCeti.SerreConjecture.DP.orderThreeCharacter` | constructor | χ′ : G_{ℚ₄} → ℤ₃[ζ]^× of order 3 and niveau 2, normalised by χ′(Art(2)) = 1; on I₂ it is the level-2 fundamental character ω_{2,2} : I₂ → 𝔽₄^×, composed with an identification 𝔽₄^× ≅ µ₃ ⊂ ℤ₃[ζ]^× |
| `TauCeti.SerreConjecture.DP.orderThreeType` | constructor | ρ̃₂ = Ind χ′ with ρ̃₂\|_{I₂} ≅ χ′ ⊕ χ′² and monodromy 0 |
| `TauCeti.SerreConjecture.DP.orderThreeType.standardLattice` | data | L₀ = 𝒪e₁ ⊕ 𝒪e₂, the standard lattice of R33.2 at (q, N) = (3, 2): σ ↦ diag(ζ, ζ²), Frob₂ ↦ (0 1; 1 0) |
| `TauCeti.SerreConjecture.DP.orderThreeType.adaptedLattice` | data | L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂, π = ζ − 1, G_{ℚ₂}-stable: σ ↦ (ζ 0; ζ ζ²), Frob₂ ↦ (1 π; 0 −1) |
| `TauCeti.SerreConjecture.DP.orderThreeType_standardLattice_reduction` | compatibility | L₀/πL₀ ≅ 1 ⊕ η as a G_{ℚ₂}-module: inertia acts trivially |
| `TauCeti.SerreConjecture.DP.orderThreeType_adaptedLattice_reduction` | compatibility | L₁/πL₁ is the non-split extension: σ acts by (1 0; 1 1), with one-dimensional invariants, and Frob₂ by diag(1, −1) |
| `TauCeti.SerreConjecture.DP.orderThreeType_exists_lattice_reduction_iso` | characterisation | if ρ̄₃\|_{D₂} ≅ γ ⊗ (χ̄₃ c; 0 1) with γ unramified, there is a G_{ℚ₂}-stable lattice Λ in ρ̃₂ with γ ⊗ (Λ/πΛ) ≅ ρ̄₃\|_{D₂}: Λ = L₀ if c = 0 and Λ = L₁ if c ≠ 0; L₀ fails when c ≠ 0 |
| `TauCeti.SerreConjecture.DP.orderThreeType_isCompatible` | compatibility | ρ̃₂\|_{I₂} is an inertial type compatible with ρ̄₃ at 2 (DP p. 6), and both reductions have trace 0 at Frobenius: the hypothesis of Theorem 1.9(4) at ℓ = 2 |
| `TauCeti.SerreConjecture.DP.typeChangeAtTwo` | equivalence | {ρ_ℓ} is modular iff {ρ′_ℓ} is |

**Unit-test statements.**

- `order_three_level_two` (example): |𝔽₄^×| = 3 and |𝔽₂^×| = 1, so an order-3 character of I₂ through the tame quotient has niveau 2 (checked in Lean)
- `ramification_index_three` (example): K = ℚ₄(χ′) has e(K/ℚ₂) = 3, which is odd (checked in Lean as 3 % 2 = 1)
- `steinberg_nonexample` (non-example): the Steinberg type (ω₁ ⊕ 1, N ≠ 0) has nonzero monodromy and is not potentially crystalline; the order-3 type is
- `needs_unramified_at_3` (degenerate): if the system is ramified at 3, ρ₃ need not be crystalline and k(ρ̄₃) = 2 can fail, so Theorem 1.9(4) gives no crystalline lift at 3
- `standard_lattice_relations` (computation): over ℤ[ζ]: D₀³ = F₀² = 1 and F₀D₀F₀⁻¹ = D₀² (the tame relation at 2), and D₀ ≡ 1 mod π (checked in Lean)
- `adapted_lattice_change_of_basis` (computation): D₀P = PD₁ and F₀P = PF₁ for P = (1 0; 1 π), so L₁ is stable; D₁³ = F₁² = 1 and F₁D₁F₁⁻¹ = D₁² (checked in Lean)
- `adapted_lattice_nonsplit` (characterisation): modulo π, D₁ ≡ (1 0; 1 1) ≠ 1 and F₁ ≡ diag(1, −1): the inertia invariants of L₁/πL₁ are one-dimensional, as for ramified ρ̄₃ (checked in Lean)
- `standard_lattice_nonexample` (non-example): when ρ̄₃ is ramified at 2, L₀ does not realise ρ̄₃|_{I₂}: D₀ ≡ 1 mod π has two-dimensional invariants (checked in Lean)
- `split_case_standard_lattice` (degenerate): when ρ̄₃ is unramified at 2, ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1), which L₀ realises: F₀ mod π squares to 1 and is neither 1 nor −1, so its eigenvalues are 1 and −1 = 2 = χ̄₃(Frob₂) (checked in Lean)

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma 2.3, p. 12 of the arXiv version. The hypotheses.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 2.3, p. 13 of the arXiv version. The order-3 character of ℚ₄.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma 2.3, p. 12 of the arXiv version. The equivalence.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §1.3, before Theorem 1.9, p. 6 of the arXiv version. DP's compatibility of an inertial type, which the choice of L₀ or L₁ verifies at ℓ = 2.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 2.3, p. 13 of the arXiv version. The comparison of reductions that the lattice choice makes precise.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 5.1(4), p. 10 of the preprint. The residual hypothesis of the level-two type at q, checked for ρ̄₃ at (p, q) = (3, 2).

<a id="r33-3-remark-6-weight-two-after-type-change"></a>

#### Remark 6: after the type change the dyadic weight is 2

Identifier: `ClassicalSerreModularity:R33.3/remark-6-weight-two-after-type-change`. Kind: lemma.

In Paso 4, if ρ̄₂ has non-solvable image and k(ρ̄₂) = 4, the system {ρ′_ℓ} of Lemma 2.3 satisfies k(ρ̄′₂) = 2. The type of ρ′₂ at 2 comes from χ′ (almost strict compatibility, ρ̄′₂ irreducible), so ρ′₂|_{G_K} is crystalline with Hodge–Tate weights {0, 1} over K = ℚ₄(χ′), e(K/ℚ₂) = 3; it comes from a 2-divisible group and ρ̄′₂|_{G_K} is finite flat; a très ramifiée residual representation is finite flat over no extension of odd ramification index; so ρ̄′₂ is not très ramifiée, i.e. k(ρ̄′₂) = 2. This is KW I's argument in the proof of their Theorem 9.1. The detour is needed because Theorem 1.9 gives a crystalline lift at p = 2 only in Serre weight 2.

**Hypotheses and scope.**

- DP's own sentence ("flat over an extension with even ramification index") does not give the contradiction; the operative fact is non-flatness over odd ramification index (source issue ClassicalSerreModularity/E6)
- the criterion is requested from AlgebraicModularFormsAndSerreWeights R15.4; this strand imports it from there, not from R27.5, so that the modern route stays independent of the classical induction
- ρ̄′₂ is irreducible (non-solvable, Lemma 2.1), which almost strict compatibility at 2 needs

**Proof obligations.**

- Type at 2 from Lemma 2.3 and almost strict compatibility.
- Crystalline over K with Hodge–Tate weights {0, 1} ⇒ 2-divisible group ⇒ finite flat residual.
- The odd-ramification-index criterion.

**Acceptance.**

- Check the flatness-over-a-cubic-extension argument against Serre's très ramifiée definition, confirming that the parity of the ramification index is the operative fact
- Check that "cubic" means ramification index 3: K = ℚ₄(χ′) has degree 6 over ℚ₂

**Prerequisites.** [R33.3/dp-dyadic-transition-and-the-order-three-type](#r33-3-dp-dyadic-transition-and-the-order-three-type); [AlgebraicModularFormsAndSerreWeights:R15.4](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt](../../../content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md); [R33.2/lemma-2-1-large-image](#r33-2-lemma-2-1-large-image); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 6, p. 13 of the arXiv version. The dyadic weight argument (with the imprecise reason).
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 6, p. 13 of the arXiv version. Why the detour is needed.

<a id="r33-3-paso-4-removing-two"></a>

#### Paso 4: removing 2 from the level

Identifier: `ClassicalSerreModularity:R33.3/paso-4-removing-two`. Kind: theorem. Planet: **Paso 4: removing 2 from the level**.

After Paso 3 let the system {ρ^{(r+1)}_ℓ} be ramified only at 2 and N. There is an almost strictly compatible system of weight 2 unramified outside N, equivalent for modularity: (1) if k(ρ̄^{(r+1)}₂) = 4, take a minimal weight-2 lift with Steinberg type at 2 (Theorem 1.9(2)) in a system {ρ^{(r+2)}_ℓ} (transfer by Theorem 1.5); (2) change the type at 2 by Lemma 2.3, getting {ρ^{(r+3)}_ℓ} with an order-3 type at 2; (3) now k(ρ̄^{(r+3)}₂) = 2 (Remark 6; directly when k(ρ̄^{(r+1)}₂) = 2), and a minimal crystalline weight-2 lift (Theorem 1.9(1)) lies in a system {ρ^{(r+4)}_ℓ} unramified at 2 (transfer by Theorem 1.5).

**Hypotheses and scope.**

- non-solvable image at 2 (Lemma 2.1) is needed for Theorem 1.9(1), (2) and Theorem 1.5
- Lemma 2.3 needs the system unramified at 3 (after Paso 3) and Hodge–Tate weights {0, 1} (after step (1))
- the type at N is preserved by minimal lifts and by prescribing τ_N at N in Theorem 1.9(4), so Lemma 2.1 keeps applying (source issue ClassicalSerreModularity/E7)
- the order of the steps matters: the Steinberg lift makes Lemma 2.3 applicable, and Remark 6 needs Lemma 2.3's type

**Proof obligations.**

- Step (1): Theorem 1.9(2), Theorem 1.11, Theorem 1.5.
- Step (2): Lemma 2.3.
- Step (3): Remark 6, Theorem 1.9(1), Theorem 1.11, Theorem 1.5.

**Acceptance.**

- Check that the system entering step (2) is unramified at 3 and has Hodge–Tate weights {0, 1}
- Check that the final system is unramified outside N

**Prerequisites.** [R33.3/dp-dyadic-transition-and-the-order-three-type](#r33-3-dp-dyadic-transition-and-the-order-three-type); [R33.3/remark-6-weight-two-after-type-change](#r33-3-remark-6-weight-two-after-type-change); [R33.2/lemma-2-1-large-image](#r33-2-lemma-2-1-large-image); [R33.2/paso-3-killing-the-odd-level](#r33-2-paso-3-killing-the-odd-level); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 4, p. 13 of the arXiv version. Why the dyadic lifting theorems apply.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 4, p. 13 of the arXiv version. The outcome.

<a id="r33-3-paso-5-killing-the-good-dihedral-prime"></a>

#### Paso 5: killing the good-dihedral prime

Identifier: `ClassicalSerreModularity:R33.3/paso-5-killing-the-good-dihedral-prime`. Kind: theorem. Planet: **Paso 5: killing the good-dihedral prime**.

Let {ρ′_ℓ} be an almost strictly compatible system of weight 2 unramified outside N (after Pasos 3–4). Reduce the N-adic member modulo N. (1) If ρ̄′_N is reducible, ρ′_N is modular by Theorem 1.6 (N > 5), which needs only that ρ′_N is de Rham at N with Hodge–Tate weights {0, 1}: here almost strict compatibility gives no Weil–Deligne information at N (N is ramified in the system and ρ̄′_N is reducible), and Pan's theorem needs none. (2) If ρ̄′_N is irreducible and not bad dihedral, a minimal crystalline lift (Theorem 1.9(3)) lies in a system {ρ″_ℓ} with empty ramification set, equivalent for modularity (Theorem 1.4). (3) ρ̄′_N is not bad dihedral: it has Serre level 1, and a bad-dihedral representation of level 1 in characteristic N needs N ≡ 3 mod 4 (Lemma 1.14 and Remark 5), while N ≡ 1 mod 8.

**Hypotheses and scope.**

- case (1) is the only point of the proof where almost strict, rather than strict, compatibility matters; the de Rham property at N is part of Definition 1.10(4)
- ρ′_N is irreducible, since other members of the system have irreducible residual representations
- Remark 5 combines Wintenberger's lemma (no niveau-2 bad dihedral at level 1) with Lemma 1.14; it is imported from SmallRamificationAndAbelianVarietyBaseCases R25.5/level-one-dihedral-classification

**Proof obligations.**

- Case split on ρ̄′_N.
- Reducible: Theorem 1.6 with only the de Rham hypothesis.
- Irreducible: Remark 5 excludes bad dihedral; Theorem 1.9(3), Theorem 1.11, Theorem 1.4.

**Acceptance.**

- Check that Theorem 1.6 is applied at the ramified coefficient prime N with only the de Rham hypothesis, as the roadmap's R33.3 text requires
- Check N ≢ 3 mod 4 from N ≡ 1 mod 8 (checked in the suggested Lean file)

**Prerequisites.** [R33.3/paso-4-removing-two](#r33-3-paso-4-removing-two); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [R33.1/fontaine-laffaille-member-not-bad-dihedral](#r33-1-fontaine-laffaille-member-not-bad-dihedral); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 5, p. 14 of the arXiv version. Only the de Rham property at N is known, and it suffices.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 5, p. 14 of the arXiv version. The bad-dihedral case is empty.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 5, p. 9 of the arXiv version. The two inputs of Remark 5.

<a id="r33-4"></a>

### R33.4. The terminal characteristic-five argument

Reduce the level-one weight-two system to its characteristic-five cases and invoke the exact small-ramification suppliers. Assemble the odd-characteristic qualitative theorem.

<a id="r33-4-dp-terminal-characteristic-five-and-the-schoof-base-case"></a>

#### Paso 6: the level-one system at p = 5

Identifier: `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`. Kind: theorem. Planet: **Paso 6: terminal characteristic five**.

Let {ρ″_ℓ} be the almost strictly compatible system with empty ramification set from Paso 5. At p = 5: (1) if ρ̄″₅ is reducible, ρ″₅ is modular by Theorem 1.6; (2) ρ̄″₅ is not bad dihedral, since the system has level 1 and 5 ≢ 3 mod 4 (Remark 5); (3) otherwise k(ρ̄″₅) ∈ {2, 4, 6} (level 1 forces an even twist-normalised weight), and the terminal cases are imported from SmallRamificationAndAbelianVarietyBaseCases R25.5/paso-six-terminal-cases: for weight 2 or 4, a minimal crystalline lift in a system with empty ramification set has a 3-adic member ρ̃₃ with reducible reduction (Tate–Serre: nothing irreducible is unramified outside 3), ordinary by Berger–Li–Zhu (weight 2 or 4 = 3 + 1), hence modular by Theorem 1.7; for weight 6, a weight-2 lift Steinberg at 5 and unramified elsewhere (Theorem 1.9(4)) comes from a GL₂-type abelian variety A/ℚ (Snowden, Proposition 9.4.1), semistable with good reduction outside 5, contradicting Schoof. In every case the system, hence ρ̄″₅, and by the chain of Pasos 1–5 the original ρ̄, is modular (Theorem 1.4 at 5 for the lifts in case (3)).

**Hypotheses and scope.**

- Remark 5 has two inputs, Wintenberger's lemma and Lemma 1.14; both are in R25.5/level-one-dihedral-classification
- ordinarity of ρ̃₃ uses Berger–Li–Zhu and the reducibility of ρ̄̃₃; the weight must be 2 or 4 = 3 + 1
- before Schoof's theorem is invoked, A must be checked to be of GL₂-type, semistable at 5 and of good reduction outside 5 (R25.5/reduction-of-the-realisation)
- k is even at level 1: det ρ̄ = χ̄₅^{k−1} after the twist normalisation, and oddness forces k − 1 odd

**Proof obligations.**

- Case analysis at 5.
- Weight 2/4 and weight 6 branches from R25.5/paso-six-terminal-cases (with R25.2, R25.4, R25.5).
- Transfer back along the lifts at 5 by Theorem 1.4.

**Acceptance.**

- Check that A has GL₂-type, is semistable and has good reduction outside 5 before Schoof's theorem is used
- Check Remark 5's congruence condition at p = 5 and confirm that the bad-dihedral branch is empty

**Prerequisites.** [R33.3/paso-5-killing-the-good-dihedral-prime](#r33-3-paso-5-killing-the-good-dihedral-prime); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/paso-six-terminal-cases](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.4/schoof-theorem](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/snowden-realisation](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/reduction-of-the-realisation](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/weight-p-plus-one-excluded-at-schoof-primes](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.5/ordinary-reducible-terminal-weights](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case](../../../content/campaign/SmallRamificationAndAbelianVarietyBaseCases/README.md); [GL2ModularityLifting:R32.5](../../../content/campaign/GL2ModularityLifting/README.md); [PotentialModularityAndCompatibleSystems:R24.3](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 6, p. 14 of the arXiv version. Why the weight-2/4 branch reaches Theorem 1.7.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 6, p. 14 of the arXiv version. The weight-6 branch and the properties of A.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 6, p. 14 of the arXiv version. The Tate–Serre base case at 3.

<a id="r33-4-dp-odd-characteristic-assembly"></a>

#### Serre's conjecture in odd characteristic (Dieulefait–Pacetti §2)

Identifier: `ClassicalSerreModularity:R33.4/dp-odd-characteristic-assembly`. Kind: theorem. Planet: **Serre's conjecture for odd p (Dieulefait–Pacetti §2)**.

Every odd irreducible ρ̄ : G_ℚ → GL₂(𝔽̄_p) with p odd is modular. Solvable image: Theorem 1.3 (R33.1). Otherwise Paso 1 (R33.1), Pasos 2 and 3 (R33.2), Pasos 4 and 5 (R33.3) and Paso 6 (R33.4) give a chain of almost strictly compatible systems, consecutive ones simultaneously modular (Theorems 1.4, 1.5, Remark 4), ending in a modular system or a contradiction. The proof uses no weight reduction and none of KW's (L_r)/(W_r) induction; its base cases are Tate–Serre (Theorem 1.1) and Schoof (Theorem 1.2). It is the odd-characteristic input of R33.5.

**Hypotheses and scope.**

- qualitative only: weight k(ρ̄) and level N(ρ̄) are not claimed (R33.6 compares with the strong form)
- independent of the classical strand R27.2–R27.6: from this roadmap it imports only R27.1's early package (Definition 2.1, Lemmas 6.2(ii), 6.3 and 8.2)

**Proof obligations.**

- Paso 1 to Paso 6 in order, with the modularity transfers.

**Acceptance.**

- Check that each Paso's output satisfies the next Paso's hypotheses (ramification set, type at N, weight, image)
- Check that no step imports a node of R27.2–R27.6

**Prerequisites.** [R33.1/dp-target-and-the-weight-at-least-two-convention](#r33-1-dp-target-and-the-weight-at-least-two-convention); [R33.1/paso-1-weight-two-system](#r33-1-paso-1-weight-two-system); [R33.2/dp-lift-existence-and-good-dihedral-insertion](#r33-2-dp-lift-existence-and-good-dihedral-insertion); [R33.2/paso-3-killing-the-odd-level](#r33-2-paso-3-killing-the-odd-level); [R33.3/paso-4-removing-two](#r33-3-paso-4-removing-two); [R33.3/paso-5-killing-the-good-dihedral-prime](#r33-3-paso-5-killing-the-good-dihedral-prime); [R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case](#r33-4-dp-terminal-characteristic-five-and-the-schoof-base-case); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §2, p. 15 of the arXiv version. The conclusion.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §2, p. 15 of the arXiv version. Propagation from the base cases of Serre and Schoof.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §2, p. 10 of the arXiv version. The reduction to non-solvable image.

## III. Modern characteristic-two closure and the common strong endpoint

The odd-characteristic theorem is now available. At characteristic two use the solvable-image supplier or the specific KW dyadic system; its auxiliary odd residual member can be reducible. Only after qualitative existence is established do the exact weight, level and character enter through the shared refinement.


<a id="r33-5"></a>

### R33.5. Characteristic two and the qualitative endpoint

Handle solvable dyadic image by the imported Dickson refinement and Rohrlich–Tunnell. For non-solvable image, use exactly the KW-constructed dyadic system and an auxiliary odd coefficient prime. Keep the globalisation audit conditional.

<a id="r33-5-auxiliary-odd-prime-for-the-dyadic-system"></a>

#### The auxiliary odd prime for a dyadic weight-two system

Identifier: `ClassicalSerreModularity:R33.5/auxiliary-odd-prime-for-the-dyadic-system`. Kind: lemma.

Let ρ̄ : G_ℚ → GL₂(𝔽̄₂) be irreducible with non-solvable image. Choose the E-rational almost strictly compatible, irreducible, odd system supplied by KW I Theorem 5.1(1) when k(ρ̄)=2 or (2) when k(ρ̄)=4, whose dyadic member lifts ρ̄ and has Hodge–Tate weights {0,1}. For every rational prime p>3 outside the finite ramification set of this system and every chosen coefficient place above p, its p-adic member ρ_p is odd, irreducible, finitely ramified and crystalline of weight 2 at p. Its residual representation ρ̄_p may be reducible; if it is irreducible, it has Serre weight 2 and is not bad dihedral. Such auxiliary primes exist because the ramification set is finite. No assertion about arbitrary compatible systems is needed.

**Hypotheses and scope.**

- Use exactly the KW I Theorem 5.1 system (R24.5/kw-theorem-5-1-systems), with type (1) at dyadic Serre weight 2 and type (2) at dyadic Serre weight 4. DP Theorem 1.9(1)–(2), proof on p.6, cites this same KW theorem.
- KW I p.8 defines an irreducible, odd system to have every characteristic-zero member irreducible and odd. These are part of the theorem’s output, not a cross-characteristic Brauer–Nesbitt deduction or a new determinant-character claim.
- For an odd p outside the ramification set, r_p is unramified. KW I p.8’s almost-strict clause for ℓ≠2 and unramified r_q makes the member at ℓ=q=p crystalline with weights {0,1}, even if its reduction is reducible. No assertion of dyadic strict compatibility for reducible residual members is used.
- For the irreducible residual branch, the Fontaine–Laffaille weight-two comparison gives k(ρ̄_p)=2. Lemma 1.14’s bad-dihedral alternatives would force p=2·2−1=3 or p=2·2−3=1; p>3 excludes both.
- The non-solvable image hypothesis is on the initial dyadic residual representation; the solvable dyadic case is separate. Characteristic-zero irreducibility of ρ_p does not imply residual irreducibility of ρ̄_p.

**Proof obligations.**

- Choose KW I Theorem 5.1(1)/(2)’s system with the stated dyadic lift, via R24.5/kw-theorem-5-1-systems. Its type-(1)/(2) lifts are the exact R24.3 supplier nodes.
- Read oddness and irreducibility of every member from the supplied system. At every odd unramified p apply KW’s almost-strict crystallinity clause.
- Choose p>3 outside the finite ramification set. If ρ̄_p is irreducible, apply R33.1/fontaine-laffaille-member-not-bad-dihedral with k=2; retain the separate reducible-residual branch for Theorem 1.6.

**Acceptance.**

- Check the arithmetic of the bound: 2·2 − 1 = 3 and 2·2 − 3 = 1, so p > 3 excludes both (checked in the suggested Lean file)
- Check that the residual representation ρ̄_p may be reducible and that this branch is handled by Theorem 1.6 (p ≥ 5)
- The input is the KW-constructed irreducible odd system, not an arbitrary system through a dyadic lift; no rank-one companion theorem is requested.
- Crystallinity at an odd unramified auxiliary prime is independent of residual irreducibility; the source’s possible dyadic exception is not used.
- No proof step compares p-adic and 2-adic representations by Brauer–Nesbitt without first constructing companions; that step has been removed.

**Prerequisites.** [R33.1/fontaine-laffaille-member-not-bad-dihedral](#r33-1-fontaine-laffaille-member-not-bad-dihedral); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §3, p. 15 of the arXiv version. The lift, the system and the choice of the prime.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §3, p. 15 of the arXiv version. The bound p > 3 from Lemma 1.14.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §5, definitions on p.8 and Theorem 5.1(1)–(2) on p.9 of the author preprint. The selected system has all members irreducible and odd by the definitions on p.8. Types (1)/(2) supply the two dyadic weight-two lifts. This is the restricted input used here.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §5, p.8, almost-strict compatibility at equal residue characteristics. At an odd auxiliary prime outside the ramification set, this clause supplies crystallinity with the common Hodge–Tate weights even for a reducible residual member.

<a id="r33-5-dp-characteristic-two-closure"></a>

#### Section 3: characteristic two, reduced to the odd case

Identifier: `ClassicalSerreModularity:R33.5/dp-characteristic-two-closure`. Kind: theorem. Planet: **Characteristic two (Dieulefait–Pacetti §3)**.

Every irreducible ρ̄ : G_ℚ → GL₂(𝔽̄₂) is modular (oddness is automatic in characteristic 2). If the image is solvable, the projective image is dihedral (KW I Lemma 6.1: S₄ does not occur, and A₄ would lie in a Borel subgroup over 𝔽₄), and the dihedral case is Rohrlich–Tunnell. If the image is non-solvable, take the KW I Theorem 5.1(1)/(2) dyadic weight-2 system and an auxiliary prime p > 3 (R33.5/auxiliary-odd-prime-for-the-dyadic-system): ρ̄_p is either reducible, and ρ_p is modular by Theorem 1.6, or irreducible, odd and not bad dihedral in odd characteristic, hence modular by the already proved odd case (R33.4/dp-odd-characteristic-assembly), and ρ_p is modular by Theorem 1.4. By Remark 4 the whole system, hence ρ̄, is modular.

**Hypotheses and scope.**

- this stage uses the odd-characteristic qualitative theorem of §2; it does not use its own p = 2 conclusion
- the solvable branch is entirely imported: Rohrlich–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.6), with the dyadic refinement of Dickson (KW I Lemma 6.1, ArithmeticGaloisRepresentations R01.4/dickson-classification-and-the-dyadic-refinement)
- the lifting theorems used are Theorem 1.6 at p ≥ 5 and Theorem 1.4 at odd p; no dyadic lifting theorem is needed here, only the dyadic lift-existence Theorem 1.9(1)–(2)

**Proof obligations.**

- Split on the solvability of the image.
- Solvable: Lemma 6.1 and Rohrlich–Tunnell.
- Non-solvable: auxiliary prime p > 3; reducible branch by Theorem 1.6, irreducible branch by the odd case and Theorem 1.4; Remark 4. The last step imports R24.6/linked-systems-modularity-transfer, comparing each member to Deligne’s system of a modular form in the same coefficient characteristic.

**Acceptance.**

- Check that the bound p > 3 from Lemma 1.14 is exactly what avoids bad dihedral at residual weight 2
- Check that the claimed independence of this strand concerns only the qualitative argument, since the weight and level refinements come from elsewhere (R33.6)

**Prerequisites.** [R33.5/auxiliary-odd-prime-for-the-dyadic-system](#r33-5-auxiliary-odd-prime-for-the-dyadic-system); [R33.4/dp-odd-characteristic-assembly](#r33-4-dp-odd-characteristic-assembly); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [GL2AutomorphicRepresentationsAndTransfer:R17.6](../../../content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §3, p. 15 of the arXiv version. The solvable branch: Lemma 6.1 and Rohrlich–Tunnell.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), §3, p. 15 of the arXiv version. The non-solvable branch ends in the odd case or in Theorem 1.6.

<a id="r33-5-qualitative-serre-theorem"></a>

#### The qualitative Serre theorem in every characteristic (modern route)

Identifier: `ClassicalSerreModularity:R33.5/qualitative-serre-theorem`. Kind: theorem. Planet: **The qualitative Serre theorem (all p)**.

Every odd irreducible ρ̄ : G_ℚ → GL₂(𝔽̄_p), for every prime p, is modular in the sense of R33.1: ρ̄ ≅ ρ̄_{f,p} for a cuspidal eigenform f of some weight k ≥ 2, level N and character. Odd p: R33.4/dp-odd-characteristic-assembly; p = 2: R33.5/dp-characteristic-two-closure. The proof uses none of Khare–Wintenberger's (L_r)/(W_r)/(D_r) induction and no node of R27.2–R27.6; its dependencies are listed in R33.5/globalisation-dependency-check.

**Hypotheses and scope.**

- qualitative only: no weight or level is asserted (R33.6)
- the notion of modularity is DP's; R33.6/modern-and-classical-modularity-agree identifies it with AlgebraicModularFormsAndSerreWeights R15.6's

**Proof obligations.**

- Odd p from R33.4, p = 2 from §3.

**Acceptance.**

- Check that the p = 2 branch calls the odd case only at primes p > 3, never at p = 2 itself
- Check that the statement matches R33.1's target (k ≥ 2, Deligne–Serre §6.9 convention)

**Prerequisites.** [R33.4/dp-odd-characteristic-assembly](#r33-4-dp-odd-characteristic-assembly); [R33.5/dp-characteristic-two-closure](#r33-5-dp-characteristic-two-closure); [R33.1/dp-target-and-the-weight-at-least-two-convention](#r33-1-dp-target-and-the-weight-at-least-two-convention).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 1 of the arXiv version. The weak statement proved.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 2 of the arXiv version. The structure: odd case first, then p = 2.

<a id="r33-5-globalisation-dependency-check"></a>

#### What the qualitative proof depends on

Identifier: `ClassicalSerreModularity:R33.5/globalisation-dependency-check`. Kind: comparison.

The qualitative theorem R33.5/qualitative-serre-theorem rests on exactly: (a) lift existence, DP Theorem 1.9 — cases (1)–(3) are KW I Theorem 5.1 with its proof in KW II, case (4) Gee and Snowden (PotentialModularityAndCompatibleSystems R24.3); (b) almost strictly compatible systems, DP Theorem 1.11 (Dieulefait 2004, via Taylor's potential modularity; R24.5/dieulefait-families); (c) the lifting theorems 1.4–1.7 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung, Skinner–Wiles, Pan; GL2ModularityLifting R32.5–R32.6); (d) Langlands–Tunnell and Rohrlich–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.5–R17.6); (e) the base cases of Tate, Serre and Schoof with Snowden's realisation (SmallRamificationAndAbelianVarietyBaseCases R25.2–R25.5); (f) from this roadmap, only R27.1's early package (Dickson, Lemma 6.2(ii), Lemma 6.3, Lemma 8.2). It uses no node of R26 or R27.2–R27.6. It is independent of Serre's conjecture itself only if no globalisation step inside (a)–(c) invokes the general Serre theorem; the existing partial GL2ModularityLifting:R32.6/globalisation-dependency-audit records which forms have been checked and which global inputs remain unaudited. System existence is supplied by R24.5; modularity transfer is R24.6/linked-systems-modularity-transfer. A named partial supplier is not a completed independence certificate.

**Hypotheses and scope.**

- KW I Theorem 5.1 (lift existence) is used, although KW's induction is not: the modern route is independent of the KW induction, not of all of Khare–Wintenberger's work
- DP themselves attribute the removal of weight reduction to Kisin's and Pan's lifting theorems
- Independence from the general Serre endpoint is conditional on the unresolved global inputs recorded in R32.6/globalisation-dependency-audit, plus any still-unaudited lift/system source. The supplier packet is partial and unreviewed at this snapshot; an exact node reference is not proof of its statement.

**Proof obligations.**

- List the imports of every node of R33.1–R33.5 and classify them by owner.
- Check that no import lies in ClassicalSerreModularity R26 or R27.2–R27.6.

**Acceptance.**

- Check the list against the prerequisites of every R33 node (a script over the two packets suffices)
- Use R32.6/globalisation-dependency-audit’s checked residual-modularity forms; do not import Pan Theorem 1.0.4 or the other introduction forms that obtain residual modularity from the full Serre theorem. Keep its stated Tung/Gee globalisation obligations open.

**Prerequisites.** [R33.5/qualitative-serre-theorem](#r33-5-qualitative-serre-theorem); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [R33.1/paso-1-weight-two-system](#r33-1-paso-1-weight-two-system); [GL2ModularityLifting:R32.6/globalisation-dependency-audit](../../../content/campaign/GL2ModularityLifting/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md); [R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes](#r27-1-lemma-8-2-chebotarev-choice-of-auxiliary-primes); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti; namespace TauCeti.SerreConjecture.DP. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.9, p. 6 of the arXiv version. DP Theorem 1.9(1)–(3) is KW I Theorem 5.1.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 2 of the arXiv version. The lifting theorems that replace weight reduction.

<a id="r33-6"></a>

### R33.6. The common strong statement from the modern proof

Identify the two notions of modularity and apply the shared conditional refinement. Preserve the scalar local dyadic case and the conditional finite-flat export, with its explicit p≥5 change of nebentypus.

<a id="r33-6-modern-and-classical-modularity-agree"></a>

#### DP's modularity is the atlas's modularity

Identifier: `ClassicalSerreModularity:R33.6/modern-and-classical-modularity-agree`. Kind: comparison.

For ρ̄ : G_ℚ → GL₂(𝔽̄_p) odd and irreducible, the following are equivalent: (i) (DP) ρ̄ ≅ ρ̄_{f,p} for some modular form f ∈ S_k(Γ₀(N), ε) that is a Hecke eigenform, with k ≥ 2; (ii) (KW I, AlgebraicModularFormsAndSerreWeights R15.6) ρ̄ arises from a newform: there are a newform f, a prime λ | p of its coefficient field and an isomorphism of ρ̄ with the reduction of an integral model of ρ_{f,λ}. (ii) ⇒ (i) is immediate; (i) ⇒ (ii) passes from an eigenform to the newform with the same eigenvalues away from the level (Atkin–Lehner) and uses Brauer–Nesbitt, as ρ̄ is irreducible. Weight-one forms are covered by Deligne–Serre §6.9 (R33.1). So R33.6 proves the SAME statement as R27.6, with no competing definition of modularity.

**Hypotheses and scope.**

- the residual isomorphism is with the semisimplification in general; irreducibility of ρ̄ makes it an isomorphism with ρ̄ itself
- the level and weight in (i) are unconstrained; the strong form is R33.6/strong-form-by-the-modern-route
- Use R15.6/s-type-arises-from-and-modular for S-type, the chosen coefficient embedding, residual isomorphism and invariants N,k,ε. This node proves the remaining eigenform/newform comparison; it introduces no second definition.

**Proof obligations.**

- (ii) ⇒ (i): a newform is an eigenform.
- (i) ⇒ (ii): take the newform attached to f's eigenvalue system, compare Frobenius traces, and apply Brauer–Nesbitt.

**Acceptance.**

- Check that the character ε of (i) plays no role in the equivalence
- Check that R15.6's definition uses the same fixed embedding ι_p as DP's ρ_{f,p}

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [R33.1/dp-target-and-the-weight-at-least-two-convention](#r33-1-dp-target-and-the-weight-at-least-two-convention).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Comparison; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 1 of the arXiv version. DP's notion.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. KW I's notion, which the atlas adopts.

<a id="r33-6-strong-form-by-the-modern-route"></a>

#### The strong form from the qualitative theorem

Identifier: `ClassicalSerreModularity:R33.6/strong-form-by-the-modern-route`. Kind: theorem. Planet: **The strong form via the modern route**.

The statement of R27.6/full-classical-serre-theorem — every odd absolutely irreducible ρ̄ : G_ℚ → GL₂(𝔽̄_p) arises from a newform of weight k(ρ̄), level N(ρ̄) and character lifting ε(ρ̄) — follows from R33.5/qualitative-serre-theorem (via R33.6/modern-and-classical-modularity-agree) together with: R27.4/strong-form-by-minimal-lifts for p odd and for p = 2 with k(ρ̄) = 2, including ρ̄|_{D₂} scalar with non-dihedral projective image; and the optimisation of SerreWeightAndLevelOptimisation R20.5–R20.6 for p = 2 with k(ρ̄) = 4. This is a second proof of the one public theorem, not a second theorem.

**Hypotheses and scope.**

- R27.4/strong-form-by-minimal-lifts needs only modularity of ρ̄, KW I Theorem 5.1(1) and Theorem 4.1, so it can be fed by the modern qualitative theorem; it does not use the KW induction
- DP cite Edixhoven, Ribet and Boston–Lenstra–Ribet for the refinement; those do not cover the scalar local dyadic case, which KW I Theorem 1.2(2) was the first to settle (R33.6/two-routes-comparison); KW I state that case in Theorem 1.2(2) but do not write its proof out, and R27.4/strong-form-by-minimal-lifts supplies it (source issue ClassicalSerreModularity/E9, part R27.3)
- the determinant and coefficient compatibilities are those of R27.6 (AlgebraicModularFormsAndSerreWeights R15.6)

**Proof obligations.**

- Qualitative theorem (R33.5) and the comparison of notions.
- Weight and level by R27.4/strong-form-by-minimal-lifts, or by R20.5–R20.6 when p = 2 and k(ρ̄) = 4.

**Acceptance.**

- Check that every (p, k(ρ̄)) is covered: p odd; p = 2, k = 2; p = 2, k = 4
- Check that the output is literally R27.6's statement (same definitions of N(ρ̄), k(ρ̄), ε(ρ̄))

**Prerequisites.** [R33.5/qualitative-serre-theorem](#r33-5-qualitative-serre-theorem); [R33.6/modern-and-classical-modularity-agree](#r33-6-modern-and-classical-modularity-agree); [R27.4/strong-form-by-minimal-lifts](#r27-4-strong-form-by-minimal-lifts); [SerreWeightAndLevelOptimisation:R20.5/buzzard-mod-two-level-lowering](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [SerreWeightAndLevelOptimisation:R20.6](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement](../../../content/campaign/ArithmeticGaloisRepresentations/README.md); [AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Comparison; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 1 of the arXiv version. DP import the refinement from Edixhoven and Ribet.
- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.1, p. 2 of the preprint. The dyadic scalar case that the older refinement results left open.

<a id="r33-6-two-routes-comparison"></a>

#### Two proofs of Serre’s conjecture: what each route uses from Khare–Wintenberger

Identifier: `ClassicalSerreModularity:R33.6/two-routes-comparison`. Kind: comparison.

R27.6 and R33.6 prove the same theorem. (1) Qualitative existence: the classical route uses KW I §§3, 8, 9 (the (L_r)/(W_r)/(D_r) induction with Theorems 3.1–3.4 and 9.1, and Khare's level-one theorem for (W₁)); the modern route (R33.1–R33.5) uses none of it, but shares KW I Theorem 5.1 (lift existence) and the base cases. (2) Refinement: both routes pass from modularity to weight k(ρ̄) and level N(ρ̄) through R27.4/strong-form-by-minimal-lifts, that is KW I Theorems 5.1(1) and 4.1 applied to a modular ρ̄, with Lemma 6.2(i) in the dihedral case. Outside one case the refinement was known before KW (DP p. 1: Edixhoven, Ribet, Boston–Lenstra–Ribet; KW I p. 2: Buzzard's mod-2 level lowering and Wiese in characteristic 2), so KW's argument is indispensable only at ρ̄|_{D₂} scalar with non-dihedral projective image (p = 2, k(ρ̄) = 2): there Buzzard's dyadic level lowering needs multiplicity one, which is not known (SerreWeightAndLevelOptimisation R20.5/dyadic-scalar-multiplicity-one-obstruction), and KW I Theorem 1.2(2), i.e. Theorem 5.1(1) with Theorem 4.1(1) at 2, supplies the level. KW I do not write that argument out (source issue ClassicalSerreModularity/E9, part R27.3). (3) The dyadic weight-four optimisation (R20.5–R20.6) is common to both routes.

**Hypotheses and scope.**

- a statement about proofs: it is checked by comparing the prerequisite closures of R27.6/full-classical-serre-theorem and R33.6/strong-form-by-the-modern-route
- RS-06: do not claim that the modern qualitative proof alone supplies the scalar local dyadic optimisation
- the modern route already uses KW I Theorem 5.1 for lift existence (item (1)); item (2) concerns only which refinement argument is indispensable, not independence from Khare–Wintenberger's work

**Proof obligations.**

- Compute both prerequisite closures and intersect them with ClassicalSerreModularity R26–R27.
- The intersection for the modern route is R27.1's early package together with R27.4/strong-form-by-minimal-lifts.

**Acceptance.**

- Check that the only R27.2–R27.6 node in the modern route's closure is R27.4/strong-form-by-minimal-lifts
- Check that the scalar dyadic case really needs it: Buzzard's Theorem 2.8 assumes multiplicity one, unknown when ρ̄|_{D₂} is scalar

**Prerequisites.** [R27.6/full-classical-serre-theorem](#r27-6-full-classical-serre-theorem); [R33.6/strong-form-by-the-modern-route](#r33-6-strong-form-by-the-modern-route); [R27.4/strong-form-by-minimal-lifts](#r27-4-strong-form-by-minimal-lifts); [R27.4/theorem-1-2](#r27-4-theorem-1-2); [R27.5/hypothesis-H-and-theorem-9-1](#r27-5-hypothesis-h-and-theorem-9-1); [R33.5/globalisation-dependency-check](#r33-5-globalisation-dependency-check); [SerreWeightAndLevelOptimisation:R20.5/dyadic-scalar-multiplicity-one-obstruction](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Comparison; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1.1, p. 2 of the preprint. The scalar local dyadic case.
- [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Introduction, p. 2 of the arXiv version. What the modern route removes.

<a id="r33-6-elliptic-curve-export-via-either-route"></a>

#### The R29 input, from either proof of the strong form

Identifier: `ClassicalSerreModularity:R33.6/elliptic-curve-export-via-either-route`. Kind: theorem.

Conditional corollary for the given representation: let p≥5 and let ρ̄ : G_ℚ → GL₂(𝔽̄_p) be continuous, odd and absolutely irreducible, finite at p, with det ρ̄=χ̄_p. Assume the strong-form conclusion for this ρ̄: it arises, in the sense of R15.6/s-type-arises-from-and-modular, from a newform of weight k(ρ̄), level N(ρ̄) and nebentypus reducing to ε(ρ̄). Then ρ̄ arises from a normalized newform g of weight 2, level N(ρ̄) and trivial nebentypus, with a chosen coefficient prime λ above p and ρ̄_(g,λ)≅ρ̄; hence a_ℓ(g)≡Tr ρ̄(Frob_ℓ) mod λ for ℓ∤pN(ρ̄). This is the shared conditional form of the already owned R27.6 finite-flat export; specialize its hypothesis from R33.6/strong-form-by-the-modern-route for R29. StrongSerre remains R27.6’s one statement/interface; neither its classical proof nor its unconditional export is a prerequisite of this corollary.

**Hypotheses and scope.**

- The theorem parameter is the strong conclusion for this fixed ρ̄ (newform, coefficient place, residual isomorphism, exact weight, level and reduced character), not the proved classical StrongSerre theorem. The modern strong theorem provides an instance.
- p≥5 is required for Carayol’s change of nebentypus; the local finite-flat weight recipe and its coefficient hypotheses are imported from R15.4/weight-two-iff-finite-flat-at-p. For coefficients beyond F_p, use that supplier’s Raynaud F-vector-space formulation, not an unqualified (p,p)-group-scheme argument.
- Use the same fixed embedding/coefficient extension conventions as R15.6/s-type-arises-from-and-modular. N(ρ̄) is the prime-to-p Artin conductor of the residual representation, not automatically the conductor of an elliptic curve.

**Proof obligations.**

- Apply the imported local recipe R15.4/weight-two-iff-finite-flat-at-p to finite flatness and det|I_p=χ̄_p to obtain k(ρ̄)=2. The determinant relation in R15.6/s-type-arises-from-and-modular gives ε(ρ̄)=1.
- Apply the supplied strong-form conclusion for this ρ̄, obtaining a newform of weight 2 and level N(ρ̄) whose nebentypus reduces to 1.
- Apply R20.4/nebentypus-congruent-character at p≥5 to replace that nebentypus by 1 at the same weight and level; pass to the attached normalized newform and retain the residual isomorphism. Its level divides N(ρ̄), and N(ρ̄) divides it, since the prime-to-p conductor of ρ̄ divides that of every characteristic-zero lift (PotentialModularityAndCompatibleSystems:R24.6/residual-members (iii)); so the level is N(ρ̄). The coefficient/trace statement is the imported meaning of arises from.
- Instantiate the hypothesis using R33.6/strong-form-by-the-modern-route. The same conditional mathematical argument also underlies the existing R27.6 export; its supplier should reuse this conditional API when coordinated, rather than reproving it.

**Acceptance.**

- The prerequisite closure of this modern instantiation reaches no ClassicalSerreModularity R26 or R27.2–R27.6 node except R27.4/strong-form-by-minimal-lifts. In particular neither full-classical-serre-theorem nor finite-flat-weight-two-export is an unconditional input.
- The conditional proof uses only the stated strong conclusion and the three named definition/local-weight/nebentypus suppliers; it does not call KW’s double induction or Khare’s level-one theorem.
- Keep p≥5: a nebentypus reducing to 1 is not automatically the trivial characteristic-zero character. The Carayol step is explicit.
- Check the R29 consumer output: weight 2, level N(ρ̄), trivial character, a coefficient prime above p and the residual isomorphism/trace congruences. Retain the supplier’s finite-field/Raynaud coefficient obligations.

**Prerequisites.** [AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p](../../../content/campaign/AlgebraicModularFormsAndSerreWeights/README.md); [SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character](../../../content/campaign/SerreWeightAndLevelOptimisation/README.md); [R33.6/strong-form-by-the-modern-route](#r33-6-strong-form-by-the-modern-route); [PotentialModularityAndCompatibleSystems:R24.6/residual-members](../../../content/campaign/PotentialModularityAndCompatibleSystems/README.md).

**Proposed placement.** TauCeti/NumberTheory/SerreConjecture/Comparison; namespace TauCeti.SerreConjecture. Existing carrier imports remain owned upstream.

**Source locators.**

- [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 of the preprint. The refined statement that the export specialises.

## Remaining proof and source boundaries

A layer marked `planned` or `source_decomposed` has a declaration-level plan, not a proof-closure claim. The following part gaps remain open. Requests specifying how suppliers must close them are collected, without dropping repeated consumers, in the [assembly handoff](../handoff/ASM-ClassicalSerreModularity.md#supplier-requests).

### R26.1 gap 1: Edition discrepancy in the level-one source

Verified: arXiv:math/0504080v1 (5 April 2005) is titled 'On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p'. It was published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557-589. Not verified: whether the numbering of results is the same in the two versions; all locators in this packet are to the preprint. Next source action: if Duke pagination is required downstream, obtain the published version and re-map Theorem 1.1, Corollaries 1.2, 1.3 and Propositions 2.1, 2.2.

Consumers: [R26.1/level-one-theorem-and-the-meaning-of-arises-from](#r26-1-level-one-theorem-and-the-meaning-of-arises-from); [R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof](#r26-1-corollary-1-2-conductor-a-prime-and-its-corrected-proof).

### R26.1 gap 2: KW I's corrected references to Khare's level-one paper use numbering absent from the arXiv preprint

Verified (reviewer): KW I's bibliography gives [24] = Khare, 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006); the proof of Corollary 8.1(i) cites '3 of Theorem 5.1 of [24]' (as insufficient) and '(2) of Theorem 6.1 of [24]' (as the correct input), and 1.2 relates KW I Theorems 4.1 and 5.1 to Theorems 6.1 and 5.1 of [24]. The copy read, arXiv:math/0504080v1, has no Theorem 5.1 or 6.1 (its compatible-system result is Proposition 3.1 and its section 6 is the proof of Theorem 1.1). The drafter's reading 'Theorem 6.1(2) of the Annals paper' confused [24] with [22]. Next source action: obtain the published Duke version of Khare's paper and locate Theorems 5.1 and 6.1.

Consumers: [R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof](#r26-1-corollary-1-2-conductor-a-prime-and-its-corrected-proof).

### R26.1 gap 3: Skinner's correction to Skinner–Wiles 2001 (KW I's [41]) is unpublished

Verified: KW I (preprint pp. 3 and 16) augment their Skinner–Wiles references [39] (1999) and [40] (2001) by [41] = C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'), 'which is a correction to [40]'; Allen (arXiv:1301.1113) lists it as a 2009 preprint. It was not obtained. It bears on the residually dihedral branches of Khare's argument (ρ̄ induced from ℚ(√((−1)^{(p−1)/2}p))), which OrdinaryAutomorphicFormsAndModularityLifting R21.5 plans with the dihedral CM case excluded (its source issue E11). For p ≡ 1 mod 4 the field is real and the plan applies; for p ≡ 3 mod 4 the branch waits on E11.

Consumers: [R26.4/level-one-lifting-lemma](#r26-4-level-one-lifting-lemma); [R26.4/degenerate-branches](#r26-4-degenerate-branches); [R26.6/corollary-1-2-proof](#r26-6-corollary-1-2-proof); [R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof](#r26-1-corollary-1-2-conductor-a-prime-and-its-corrected-proof).

### R26.1 gap 4: Explicit prime-counting proof and omitted integral-classification calculations

Read Rosser–Schoenfeld p.69 exact statements, not its analytic proof or finite verification tables; a formal proof must cover both. Independently checked the resulting finite auxiliary-prime applications for all 2,422 primes 5≤p≤21591, with largest selected P=21599. Breuil–Mézard §6.1 Proposition 6.1.1 has now been obtained and read with its odd-prime, nonscalar type, HT {0,1} and arbitrary-lattice hypotheses. Its introduction to §6 omits computation details; R07.5 must supply those integral proofs, alongside the read Savitt v3 Theorem 6.11/Corollary 6.15/Remark 6.17. The earlier source-access gap is resolved, not the integral supplier proof obligation.

Consumers: [R26.3/explicit-prime-counting-input](#r26-3-explicit-prime-counting-input); [R26.4/local-reducibility-ordinary](#r26-4-local-reducibility-ordinary).

### R26.1 gap 5: Canonical suggested Lean interfaces absent at the pin

Pinned libraries contain matrix GL2 and cusp-form carriers but not the assembled residual G_Q representation with actual Artin conductor, classical Serre weight and attached-newform residual modularity witness. Suggested Lean states the full good-dihedral matrix predicate with explicitly supplied inertia and conductor parameters and its expressible API/tests, and the arithmetic theorem signatures. Canonical specialization, q²-conductor theorem, HypL/HypW/HypD and representation-valued headline signatures are omitted with a name-by-name ledger; never replace these missing objects with arbitrary proposition fields.

Consumers: [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [R27.2/hypotheses-Lr-Wr-and-Dr](#r27-2-hypotheses-lr-wr-and-dr); [R26.1/level-one-theorem-and-the-meaning-of-arises-from](#r26-1-level-one-theorem-and-the-meaning-of-arises-from); [R27.2/theorem-3-2-weight-reduction](#r27-2-theorem-3-2-weight-reduction).

### R26.1 gap 6: Stage-graph split requires maintainer application

Current R27.1 inherits R26.6, so node-level early-prefix independence does not remove the stage path to R33.2–R33.5. The packet’s explicit R27.1a/R27.1b rescope proposal must replace the base requires and RS-06 source endpoints; adding links alone cannot fix it. The Chebotarev/insertion nodes are preserved in the sibling R27.3 packet. Verify no R26.x ancestor of R33.1–R33.5 after application; until then this structural target is planned, not closed.

Consumers: [R27.1/good-dihedral-prime-definition](#r27-1-good-dihedral-prime-definition); [R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved](#r27-1-good-dihedral-implies-nonsolvable-image-and-is-preserved).

### R27.3 gap 1: DP Theorem 1.7: the second hypothesis and its check in Paso 6

Verified: the page image of DP p. 4 prints "ρ|_{D₃} ≠ (1 0; 0 1)" without a bar and Paso 6 says "Since Serre's weight is not 3, the image of ρ̃₃|_{D₃} is non-trivial". Not verified: the hypothesis of Skinner–Wiles (1999) that this bullet transcribes. For ρ̄^{ss} ≅ 1 ⊕ χ₃ the restriction to D₃ is never trivial (χ̄₃ is ramified at 3), so the printed bullet, read residually, holds automatically; the intended condition may be p-distinguishedness or non-splitness. The branch itself is SmallRamificationAndAbelianVarietyBaseCases R25.5/paso-six-terminal-cases (which rests on OrdinaryAutomorphicFormsAndModularityLifting R21.5). Next source action: read the main theorem of Skinner–Wiles, Residually reducible representations and modular forms (Publ. IHÉS 89), and match it.

Consumers: [R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case](#r33-4-dp-terminal-characteristic-five-and-the-schoof-base-case); [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs).

### R27.3 gap 2: Imported lifting and lift-existence theorems were not read in their primary sources

Verified: DP's statements of Theorems 1.3–1.7, 1.9 and 1.11 and their attributions (Kisin; Emerton; Paškūnas; Hu–Tan; Tung; Skinner–Wiles; Pan; Gee; Snowden; Dieulefait 2004; Berger–Li–Zhu). Not verified: those papers. Under RS-06 they are owned by GL2ModularityLifting R32.5–R32.6, PotentialModularityAndCompatibleSystems R24.3–R24.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5; the requests name the exact forms used here.

Consumers: [R33.1/dp-modularity-lifting-inputs](#r33-1-dp-modularity-lifting-inputs); [R33.2/dp-lift-existence-and-good-dihedral-insertion](#r33-2-dp-lift-existence-and-good-dihedral-insertion); [R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case](#r33-4-dp-terminal-characteristic-five-and-the-schoof-base-case).

### R27.3 gap 3: KW I Theorems 4.1 and 5.1 are used as stated; their proofs are in KW II

Verified: the statements of Theorems 4.1 and 5.1 (KW I pp. 6–10) and KW II's contents and §8.2 (residual conditions (α), (β)); for Theorem 4.1 also KW II §10.2 (p. 92), which derives it from Theorem 9.7, the weight part of Serre's conjecture and cited cases, with no use of Theorem 6.1 or Theorem 10.1. Theorem 4.1 is a pair of declarations of GL2ModularityLifting, R22.5/kw-i-theorem-4-1-odd-prime and R22.6/kw-i-theorem-4-1-dyadic, which the four consumers here cite directly; the request to PotentialModularityAndCompatibleSystems R24.4 is withdrawn. The four consumers apply it to members of weight-two systems (crystalline of weight 2, or potentially semistable of weight 2) and to minimal lifts crystalline of weight k(ρ̄); none is in the case k = p + 1 with k(ρ̄) = 2 that R22.5 leaves as a gap. PotentialModularityAndCompatibleSystems R24.4 is a consumer layer with a node R24.4/kw-theorem-4-1 that binds the same export, and two nodes of part R26.1 cite it (R26.6/corollary-8-1-ii-and-the-statement-W1 and R27.2/theorem-3-2-weight-reduction); citing the R22.5/R22.6 nodes directly, as here, keeps a consumer independent of R23 and R24.1–R24.3. Not verified: KW II §10.3, which proves Theorem 5.1; it is supplied by PotentialModularityAndCompatibleSystems R24.3 and R24.6 (requested).

Consumers: [R27.3/theorem-3-1-killing-ramification](#r27-3-theorem-3-1-killing-ramification); [R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice](#r27-4-theorem-3-4-raising-levels-and-the-chebotarev-choice); [R27.4/strong-form-by-minimal-lifts](#r27-4-strong-form-by-minimal-lifts); [R27.5/d1-by-the-prime-three](#r27-5-d1-by-the-prime-three); [R27.5/dr-for-r-at-least-two](#r27-5-dr-for-r-at-least-two).

### R27.3 gap 4: Primary sources of the weight-one descent were not read

Verified: KW I's sketch of Theorem 10.1 (p. 20) and Corollary 10.2 with §10.2 (p. 21); Maschke's theorem at the pinned Mathlib; and the supplier statements as their packets record them: Edixhoven's Theorem 4.5 with its note on the exceptional case and Gross's companion forms (SerreWeightAndLevelOptimisation R20.3), the reduction-image criterion and finite generation (AlgebraicModularFormsAndSerreWeights R15.2), the Deligne–Serre lifting lemma (R15.5) and the Deligne–Serre representation (AutomorphicGaloisRepresentations R19.1). Not verified: Khare, Remarks on mod p forms of weight one (Internat. Math. Res. Notices 1997, no. 3, 127–133; corrigendum 1999, no. 18), which KW I cite for the argument and which is not freely available; Gross's and Coleman–Voloch's papers themselves. In particular the form of R27.6/unramified-residual-representations-arise-in-weight-one without a hypothesis on Frobenius, which ModularityAndLanglandsExtensions ML.1 needs and no node here uses, rests on Coleman–Voloch only through the supplier's record of Edixhoven's note. The number-field model, the reductions and the descent are now declarations of this layer (R27.6/artin-reductions-of-serre-type, R27.6/unramified-residual-representations-arise-in-weight-one, R27.6/weight-one-reduction-is-onto-for-almost-all-primes, R27.6/weight-one-descent-from-infinitely-many-primes), and the descent is proved from its listed prerequisites without the unread note. Next source action: compare the descent node with Khare's note and its corrigendum when a copy is available.

Consumers: [R27.6/unramified-residual-representations-arise-in-weight-one](#r27-6-unramified-residual-representations-arise-in-weight-one); [R27.6/weight-one-descent-from-infinitely-many-primes](#r27-6-weight-one-descent-from-infinitely-many-primes); [R27.6/odd-artin-weight-one-modularity](#r27-6-odd-artin-weight-one-modularity).

### R33.5 gap 1: Unresolved globalisation inputs of the existing R32.6 audit

The current partial, unreviewed GL2ModularityLifting:R32.6/globalisation-dependency-audit (packets/GL2ModularityLifting--R32.3.json) supplies the checked Kisin/Hu–Tan/Tung residual-modularity forms and the exclusions for Pan/Emerton forms that use Serre’s conjecture. It explicitly leaves Tung’s global Breuil–Mézard inputs ([CEG+16] patching, Emerton–Paškūnas faithfulness, BLGG13 Theorem A.4.1) and Gee’s Theorem 4.4.12 unaudited, requested there from R31.6/R20.6. Those requirements remain open here; so does any independent unaudited lift/system input. Exact references to R24.3 lift nodes, R24.5 system-existence nodes and R24.6 modularity transfer clarify ownership without certifying those partial suppliers. The qualitative route’s recorded ClassicalSerreModularity closure avoids R26 and R27.2–R27.6; full source-level independence is still conditional.

Consumers: [R33.5/globalisation-dependency-check](#r33-5-globalisation-dependency-check); [R33.5/qualitative-serre-theorem](#r33-5-qualitative-serre-theorem).

## Recorded corrections to the source editions

The existing independent source-issue verdicts remain unchanged. Corrections below are scoped to the edition and locator actually recorded; an unexamined published edition is not certified. Literal source excerpts and the existing verification trail stay in the packets.

### ClassicalSerreModularity/E1: misprint

[khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, weights 22–30, p. 25 of the preprint (arXiv v1). Existing verdict: **confirmed**; affects nothing.

unramified outside 7, 29 (the mod-7 representation is ramified only at 7 and 29).

The row concerns ρ̄ mod 29 of level one and its mod-7 companion ρ̄_7, which is unramified outside 7 and 29; the list '3, 19' is copied from the previous row (weights 14–20: the mod-3 companion of a mod-19 representation).

Edition boundary: new: present in arXiv v1; the published version (Duke Math. J. 134 (2006)) was not checked

### ClassicalSerreModularity/E2: error

[khare-level-one](https://arxiv.org/pdf/math/0504080v1), §6.1, weight 32, pp. 25–26 of the preprint (arXiv v1). Existing verdict: **confirmed**; affects nothing.

nebentypus ω_31^{18} (or ω_31^{12}), giving residual weights 20 or 14, both already known.

A weight-32 = p + 1 representation mod 31 has a minimal weight-2 lift semistable at 31, so its mod-5 member is unipotent on I_31 (χ = 1 in Proposition 2.2) and the available nebentypes are η_31^i = ω_31^{6i} (5 ∥ 30). 16 is not a multiple of 6 (nor of 10, for the foil 3). The general interval (12, 18] of §6.2 (m = 2) gives j = 18.

Edition boundary: new: present in arXiv v1; the published version was not checked

### ClassicalSerreModularity/E10: misprint

[kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §7 and §8.2, preprint pp.12–15. Existing verdict: **confirmed**; affects nothing.

Write ℓ^e∥P−1 and 2^e∥P−1, keeping r for the fixed number of conductor prime divisors.

Theorem3.2 fixes r independently of the auxiliary prime P−1. Its prime-power exponent is not that conductor-count bound.

Edition boundary: Known: PAPER-KHARE-WINTENBERGER-09-I/E4 and its independent review record the collision.

### ClassicalSerreModularity/E11: error

[khare-level-one](https://arxiv.org/pdf/math/0504080v1), §4, p.19 of arXiv:math/0504080v1. Existing verdict: **confirmed**; affects the proof.

Do not use this uniform prime-counting inequality. Use Rosser–Schoenfeld Theorem2/Corollary1 with exact thresholds, the finite auxiliary-prime checks, and the large-range 61/50 bound to derive the same required odd estimate.

π(31)=11 whereas B·31/log31<10 for the given constants; π(100)=25 whereas the claimed upper bound is below24.1. The classical Chebyshev constants cannot give this stated uniform π bound. The replacement proof yields P/p<1499/1000 for p≥21591 (at most one Fermat skip) and finite certified checks below it.

Edition boundary: New discrepancy in v1; the inaccessible Duke version was not checked for a correction. The main auxiliary-prime conclusion is retained with a different proved-source route.

### ClassicalSerreModularity/E12: error

[savitt-cdt](https://arxiv.org/pdf/math/0404327v3), Author correction quoted from v3 Remark1.7, p.4, describing the published Theorem6.12(4), i=1; the old published text was not obtained. Existing verdict: **confirmed**; affects nothing.

They coincide and are niveau one; the reduction is split. Use the corrected v3 lattice statement.

Savitt’s author correction explicitly repairs the exceptional lattice classification without changing the principal results. Our tame ordinary/weight contract uses Theorem6.11 and Corollary6.15 with Remark6.17; it does not invoke the erroneous old corner.

Edition boundary: Known author correction, arXiv v3 Remark1.7 (2010).

### ClassicalSerreModularity/E13: misprint

[khare-level-one](https://arxiv.org/pdf/math/0504080v1), Proof of Proposition 2.2, arXiv:math/0504080v1, running p.15, quadratic equation following AB=BA. Existing verdict: **confirmed**; affects nothing.

β² + βγ(χ′(τ) − 1) − ψ = 0

The preceding relation is α−β=γ(c−1) and αβ=ψ, hence β(β+γ(c−1))=ψ. For α=3, β=2, γ=1, c=2, ψ=6 the correct polynomial is zero and the printed one is −4. The derivative still reduces to 2r≠0 for odd p, so the Hensel and smoothness conclusions are unchanged.

Edition boundary: new in the arXiv v1 text read; the published Duke version was not obtained and is not accused

### ClassicalSerreModularity/E14: misprint

[ribet-semistable](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf), Images of semistable Galois representations, published Pacific J. Math. special issue (1997), Proposition 2.2 proof, p.280, dihedral case. Existing verdict: **confirmed**; affects nothing.

let Z be the cyclic rotation subgroup of index two in G

A dihedral center has at most two elements and cannot contain the cyclic inertia subgroup of order p±1>2. Every cyclic subgroup of order>2 lies in the rotation subgroup. That subgroup has index two and gives the quadratic extension used in the proof; the theorem’s semistable cyclotomic-determinant hypotheses are unchanged.

Edition boundary: new in the published text checked; no public correction found

### ClassicalSerreModularity/E3: misprint

[kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 9.1, p. 19 of the author's preprint results.pdf (Invent. Math. 178 (2009) not compared). Existing verdict: **confirmed**; affects nothing.

"… lift (ρ′_λ) of ρ̄₃ …" (the mod-3 member, to which Theorem 5.1(4) is applied at q = 2), and "by Theorem 5.1(4) and almost strict compatibility at 2" in place of "by Theorem 5.1(2)".

Theorem 5.1(4) needs ρ̄|_{D_q} of the form (χ_p ∗; 0 1) with p | q + 1; here this holds for ρ̄₃ at q = 2 (p = 3), not for ρ̄, which is a representation in the original characteristic. The identical step in the mod-3 case of Theorem 3.2 (p. 13) reads "use Theorem 5.1 (4) to lift ¯ρ2". Theorem 5.1(2) describes the Weil–Deligne parameter at p of a weight-2 minimal lift and says nothing about the prime 2 for the 3-adic system (ρ′_λ); the finite flatness over K of ramification index 3 comes from ρ′₂|_{I₂} ≅ χ′ ⊕ χ′², i.e. Theorem 5.1(4) transported to ℓ = 2 by almost strict compatibility.

Edition boundary: new: present in the author's preprint; the Inventiones version was not obtained

### ClassicalSerreModularity/E4: misprint

[dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of arXiv:2108.07577v2. Existing verdict: **confirmed**; affects nothing.

"… so that the unit group of its residue field 𝔽_{N²} has order N² − 1 = (N − 1)(N + 1)"; the residue field itself has N² elements.

The residue field of the unramified quadratic extension of ℚ_N is 𝔽_{N²}. The next sentence ("Since q | (N + 1), there exists … a character … of order q") needs the order of 𝔽_{N²}^×, which is N² − 1. For N = 5: |𝔽₂₅| = 25, while 4·6 = 24 = |𝔽₂₅^×|.

Edition boundary: new: present in arXiv v2; the arXiv listing records no journal reference

### ClassicalSerreModularity/E5: misprint

[dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of arXiv:2108.07577v2. Existing verdict: **confirmed**; affects nothing.

"… whose restriction to the inertia group at N is precisely a character of niveau 2".

κ is a character of G_{ℚ_{N²}}, a local Galois group at N, so it has no inertia group at q; "niveau 2" means that κ|_{I_N} factors through 𝔽_{N²}^× and not through 𝔽_N^×, which holds because q | N + 1 and q ∤ N − 1.

Edition boundary: new: present in arXiv v2; the arXiv listing records no journal reference

### ClassicalSerreModularity/E6: gap

[dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Remark 6, p. 13 of arXiv:2108.07577v2. Existing verdict: **confirmed**; affects the proof.

The operative fact is that a très ramifiée ρ̄ : G_{ℚ₂} → GL₂(𝔽̄₂) is finite flat over NO finite extension of ℚ₂ of odd ramification index (KW I, proof of Theorem 9.1, p. 19). Since the new 2-adic member becomes crystalline with Hodge–Tate weights {0, 1}, so its reduction finite flat, over K = ℚ₄(χ′) with e(K/ℚ₂) = 3, the new residual representation is not très ramifiée and has weight 2.

Up to twist a très ramifiée representation is given by a Kummer class x ∈ ℚ₂^×/ℚ₂^{×2} of odd valuation, and over K it is finite flat exactly when v_K(x) = e(K/ℚ₂)·v(x) is even. So it is flat over some extensions of even ramification index (for instance ℚ₂(√x)), and that is compatible with becoming flat over a further extension; being "flat over an extension with even ramification index" gives no contradiction with flatness over a cubic extension. The contradiction needs non-flatness over every extension of odd ramification index.

Edition boundary: new: present in arXiv v2; the arXiv listing records no journal reference

### ClassicalSerreModularity/E7: gap

[dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), the definition of "minimal lift" (p. 6), Lemma 2.1 (p. 11) and Pasos 3–4 (pp. 12–13) of arXiv:2108.07577v2. Existing verdict: **confirmed**; affects the proof.

The lifts in Pasos 3–4 must be minimal in KW I's sense (for ℓ ≠ p, ρ(I_ℓ) → ρ̄(I_ℓ) bijective unless ρ̄(I_ℓ) is projectively cyclic of order p), which the cited source of Theorem 1.9(1)–(3), KW I Theorem 5.1(1)–(2), provides. Then ρ(I_N) ≅ ρ̄(I_N) = κ̄ ⊕ κ̄^N, the type at N is again that of Ind κ, and Lemma 2.1 applies to each new family.

Lemma 2.1 assumes that the inertial type at N is that of Ind κ, but Paso 3 checks only that the ramification set stays inside S₁ ∪ {2, 3}. Under DP's definition (unramified wherever ρ̄ is) a lift of ρ̄_{p_i} could have type Ind(κε) at N with ε of p_i-power order (possible, as N ≡ 1 mod p_i), which is not the type of Ind κ; for the dyadic lifts of Paso 4, ε could have even order, and the last step of Lemma 2.1's proof ("the inertia group at the prime N has even order contradicting … an odd order character") would no longer apply.

Edition boundary: new: present in arXiv v2; the arXiv listing records no journal reference

### ClassicalSerreModularity/E8: misprint

[dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2), Paso 2, p. 11 of arXiv:2108.07577v2. Existing verdict: **confirmed**; affects nothing.

"… a crystalline lift ρ^{(2)}_q of weight 2 whose inertial type at N is that of Ind κ": then ρ^{(2)}_q(I_N) is cyclic of order q and the projective image of D_N is dihedral of order 2q, which is all that Lemma 2.1 uses (its hypothesis is stated for the inertial type).

The determinant of a weight-2 lift is ψχ_q with ψ of finite order, so det ρ^{(2)}_q(Frob_N) = ψ(N)·N, which is not a root of unity; hence ρ^{(2)}_q(D_N) is infinite and cannot be dihedral of order 2q. Even Ind κ has image of order 2q only when κ is trivial on the Frobenius attached to N. The proof of Lemma 2.1 speaks in the same way of "a ramified character of order q", where only its restriction to inertia has order q.

Edition boundary: new: present in arXiv v2; the arXiv listing records no journal reference

### ClassicalSerreModularity/E9: gap

[kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §3.2 (Proof of Theorem 1.2) and the Remark after Theorem 3.4, p. 6 of the author's preprint results.pdf (Invent. Math. 178 (2009) not compared). Existing verdict: **confirmed**; affects the proof.

Theorem 3.4 gives only that ρ̄ is modular. The passage to weight k(ρ̄) and level N(ρ̄): if the projective image is dihedral, Lemma 6.2(i); otherwise choose i with 2 ≤ k(ρ̄ ⊗ χ_p^i) ≤ p + 1 (p odd; i = 0 when p = 2); Theorem 5.1(1) gives a lift of ρ̄ ⊗ χ_p^i minimally ramified away from p and crystalline of weight k(ρ̄ ⊗ χ_p^i) (k(ρ̄) = 2 when p = 2), Theorem 4.1 makes it modular, and its newform has level N(ρ̄) (twisting by χ_p leaves the prime-to-p conductor unchanged). Untwist: ρ̄ is then modular of level N(ρ̄) prime to p, and Edixhoven's weight theorem (with θ-operators and the Deligne–Serre lifting lemma) gives a newform of weight k(ρ̄) and level N(ρ̄). This covers the dyadic scalar case that the introduction says Theorem 1.2(2) fills.

Theorem 3.4 concludes "is modular" and its proof (§8.4) lifts with Theorem 5.1(2), which gives weight 2 and a type at p, so the weight k(ρ̄) and level N(ρ̄) of Theorem 1.2 are asserted without an argument in the paper. The introduction (pp. 2–3) says Theorem 1.2(2) fills the missing case of the qualitative-implies-refined problem at 2 (ρ̄|_{D₂} scalar, projective image not dihedral), which is exactly the step not written out. Theorems 4.1(2)(i) and 5.1 assume 2 ≤ k(ρ̄) ≤ p + 1 when p > 2 (p. 9), and only some twist ρ̄ ⊗ χ_p^i has weight in that range (p. 2), so for odd p the argument ends with an untwisting (Edixhoven's weight theorem). Every ingredient is a theorem of the paper or of Edixhoven's weight theorem, so the result stands.

Edition boundary: new as far as found: not in the arXiv or preprint versions read; the published version was not compared

## Acceptance of the assembled roadmap

- Keep one public strong statement at R27.6. R33.6 must instantiate that same interface with its second proof and supply every scalar dyadic and weight-four case.
- Keep every hypothesis of the five terminal rows, the foil ramification support, admissible exponent coset and full normalized-characteristic transfer. Certify the finite prime range separately from asymptotic prime estimates.
- Keep stable declaration identifiers across parts. Every cross-part prerequisite must resolve to the exact node. The early R27.1 stage repair is proposed separately and is not inferred from textual declaration independence.
- Close local and global supplier contracts before marking any theorem proved. In particular, settle the ordinary CM correction, the R07.5 integral classification and the R32.6 globalisation audit.
- Reuse existing library carriers and upstream results. The good-dihedral API needs the actual conductor and canonical inertia specialization; arbitrary supplied natural-number and group parameters do not give it.
- The suggested file has one import block and one standard note. Executable signatures, arithmetic/lattice checks and non-executable supplier sketches are distinguished there. A successful elaboration checks the executable suggestions, not the mathematical proof outlines or the completeness of supplier interfaces.
