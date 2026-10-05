# Independent review: AnalyticNumberTheory AN.8–AN.9

**Verdict: needs_changes.** The independent review is complete. The selected target sketches contain useful mathematics, but this issue requires lemma-level planning. Both stages and the packet are now `partial`. This is not a checkpoint of an unfinished review, and it does not authorize promotion.

Job: `REV-AnalyticNumberTheory--AN.8`, issue #528. Reviewer: Codex (GPT-6), session `codex-ffkHXI`, independent of author session `codex-rtOQ9t`. Date: 2026-10-05.

Reviewed all 88 original nodes; added 9 (97 total). Per-node verdicts: 23 verified, 12 corrected, 9 added, 53 unverifiable. Read all 37 original baseline declarations at their pins; added 4 exact citations (41 total). There are 95 API items, 75 tests, 12 planets, 23 gaps and 12 supplier requests. Six inherited source issues are confirmed; one additional misprint is confirmed. All implementation statuses remain unchecked.

## Corrections

1. The reflected cubic bound lost the right-half-plane factor `D^(1/2+ε)`. Its corrected discriminant exponent is `5/2−4σ+ε`; at `σ=−1/2−δ` this gives `9/2+4δ+ε`, matching the left-boundary estimate in LOWW Lemma 3.11. The height exponent stays `n(2−4σ)+ε`. The convexity exponent `7/2−2σ` was already correct.
2. The positive spectral zeta Mellin transform uses `H(t)−1`. Subtraction must give `Σ ak/(s+k−1)−1/s`, so the coefficient at zero is `a1−1`. The earlier subtraction omitted the removed simple zero mode.
3. With the chosen left representation `(g·f)(u,v)=det(g)⁻¹ f((u,v)g)`, rational reindexing makes `Σx Φ(g·x)` right invariant. Replaced `GL2(F)\GL2(A_F)` by `GL2(A_F)/GL2(F)` and specified inversion transport from the requested left-quotient measure. On the left quotient the equivalent formula uses inverse action and exponent `−2s`. Original-source normalization remains unverified.
4. Bounded faithful convolution must precede C*-closure. Replaced the backward norm-bound dependency by the algebra, degrees and `lp`; made completion depend on that bound. Spectral regularity must precede the determinant definition: removed the determinant edge from regularity and reversed it.
5. Added the explicit dual simple-pole input used to deduce vanishing at zero. Ordinary-series residues do not provide that dual pole-order bound. Extracted eight rational generator relation inputs, including separate dilation and inverse-dilation products. The abstract presentation universal property and remaining bundled normal-form results still need refinement.
6. Replaced references to retired `AN.1` and `AN.6` stages, following accepted RS-07, by exact pinned Dirichlet functional-equation/change-level and Möbius inversion citations. Recorded the quadratic conductor/root-number adapter separately. Made the quadratic mean request numerical and identified it as an extension, not a consequence of PNT.
7. Corrected Blomer series locator to equation (1), p.356; mean bound to (16), p.359; DW order enumeration to Theorem 6.1 via LOWW Lemma 3.9; Neshveyev correspondence/unit decomposition to pp.1–2 and corollary to p.3; JSS heat/transform locators to §5. Corrected Connes–Marcolli PDF offset to printed page = PDF page −22, verified on PDF pages 484/487 (printed 462/465). Other leaf locators are now specific to the displayed results.
8. Corrected the meaning of `HilbertBasis` (a linear isometry equivalence, not by itself the named coordinate-basis laws) and the kind of `Polynomial` (structure). No original baseline declaration was removed; the revised descriptions preserve only the scope actually read.
9. Native `shellDensity` now excludes zero discriminant explicitly. Unweighted shell masses are only asserted for indicator tests on integral support; general tests require weighted shell integrals. Split-weight and dual-selector tests now invoke the actual generic cubic series, instead of testing scalar arithmetic alone. Added six missing named generator relation signatures; existing `e_zero` and `e_add` supply the other two. Removed a redundant Gibbs example. Mirrored corrected mathematical obligations and added the dual-pole omission explicitly. None of these edits is claimed elaborated.
10. Recorded source issue E23: in Connes–Marcolli Lemma 3.28 proof, the second `bc=0 mod n` case should be `bc≠0 mod n`. The page image itself repeats the equality while requiring `φ(a)≠0` and `U≠1`. The finite Fourier formula is unaffected.

## Why acceptance is blocked

The issue mandates lemma level; the roadmap has distance 4 and the configured maximum is 5. The original packet called itself a target-planning pass. Numerous nodes package definitions, comparison theorems and nonroutine proof arguments. Eight presentation relations have been extracted where the source makes the split immediate; the remaining source-dependent refinements are precise review gaps, not presumed library facts.

The local-density comparison gives no numerical constants or exact orbit-weight theorem. LOWW §3.2 supplies global Shintani statements, not the local/adelic integral definitions used here. Its original Wright/Datskovsky–Wright proofs are not present in the cited excerpt. The first-moment node is qualitative and needs a pole-aware exact strip estimate: the printed estimate includes the principal term at s=1 if read literally, so it cannot be imported uniformly across that pole. The request now states a safe critical-line contract while leaving the needed strip extension open.

C*-norm bounds, GNS continuity, universal/reduced comparison, analytic-core strip equivalence, state/measure reconstruction, the Choquet simplex, ratio sets and full-corner factor classification remain broad foundations rather than declaration-sized contracts. Spectral determinant continuation needs an actual holomorphic shifted family and a zero-divisor theorem; the multiplicity at λ=1/4 must account for the double root of s(1−s). Many omitted signatures could already be stated using the generic series/state carriers and should not be excused by a generic missing-carrier sentence.

Every original definition/construction has at least three listed tests. Some do not test their named object: the local linear benchmark tests a geometric sum; the completed temperature-one test checks only the algebraic core; rejecting the zero functional does not distinguish ground states from KMS-infinity. Generic finite-spectrum/ring tests do not supply the canonical geometric/arithmetic adapters. Add the missing reusable APIs and genuinely discriminating native examples before acceptance. The 12 planet names identify central objects/theorems and have no locator-only names; no renaming was needed.

## Supplier and ownership checks

Read the reviewed library audit and accepted RS-07. Neither AN.8 nor AN.9 is audited as already built. Existing Hecke, complex-power, LSeries, gamma, Mellin and closed star-subalgebra carriers are imported rather than replanned. The multiple-zeta-value branch belongs to PS.9 and is not introduced here.

- Read the accepted ST.1 Delone–Faddeev and stabilizer statements. They assume a PID or local ring; they do not prove the nonprincipal locally free O_F module adapter. ST.0 coefficient finiteness and ST.3 field-counting needs remain explicit extension requests.
- Read AN.2 rational PNT and fixed-progression PNT statements in the AN.0 packet. They are suitable proposed prime-asymptotic suppliers for the Q specialization, but that packet has no accepted review. The reciprocal-prime divergence implication must be an explicit partial-summation lemma. They do not supply a quadratic mean estimate.
- Read AL.0 local/adelic Schwartz and Poisson statements. Their Tate carrier is one-dimensional. Binary-cubic V and singular-orbit corrections need additional interfaces. LD.3 is a specialization/rationality direction, not a source of the missing cubic density constants.
- Read AA.0/AA.2: restricted-product Haar measures are in AA.0; reductive quotient measures are in AA.2. GlobalNumberFields layer 4 owns finite-adele arithmetic. The current KMS measure carrier needs that ownership resolution.
- Read ALS.0 and AS.4/AS.6 stage statements. Discrete automorphic decomposition alone does not provide the scalar geometric Weyl/heat package; compactly supported smooth trace tests alone do not provide Gaussian tests. These requests are now labelled as extensions.
- Read AN.7 scope: Hurwitz/Lerch does not supply Barnes G. Read upstream GlobalNumberFields layer 10: finite cyclotomic Galois/Frobenius compatibility is supplied, but a global Artin map is explicitly excluded. The request now asks for compatible finite restrictions and an inverse-limit adapter. No upstream roadmap was edited or replanned.

## Source receipts and source issues

All nine public PDFs were independently downloaded and their SHA256 hashes matched the packet. JSS v1 was additionally compared (SHA256 `4e3201122954f4a42ec0dd4c46fbbbc39b7f536346f60f12e3b816639402ade1`). The following are the passages used; this is not a claim to have read the original proofs that these sources cite.

- [Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf): Page images pp.431–433: generator relations, convolution, finite normal forms and formula (7).
- [Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf): Chapter 3 Definitions 3.4–3.7 and Proposition 3.8, pp.445–448; presentation/evolution/Hecke conventions pp.457–462; Lemmas 3.27–3.29 and Theorem 3.30 proof pp.464–470; Theorem 3.32 and Gibbs formulas pp.474–476. Page-image check of printed p.465.
- [Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf): Published definition (1), p.356; §2.1 characters/conductors and moment (16), pp.358–359; complete Lemma 2 continuation proof §3, pp.361–364.
- [Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1): All four pages: scaling/KMS correspondence, local product density, full projection/character proof, corollary and references.
- [Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1): §§1–2, pp.1–5, including ratio-set definitions, Lemma 2.3 and Theorem 2.1 proofs; only the Q specialization is used.
- [The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712): §3.2 in full, pp.12–14 of the hashed public preprint: series, Proposition 3.7, Lemmas 3.8–3.11 and proofs. Published-version evidence remains with the accepted paper extraction.
- [Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf): Page image p.603, spectral definition, heat Mellin subtraction, zero regularity and determinant.
- [New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf): §1, pp.1–2: primitive product and spectral-parameter conventions; survey context is not proof closure.
- [Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2): §5 equations (5.1)–(5.14), Lemmas 5.1–5.3 and Propositions 5.4–5.5, pp.16–19; Theorem 6.1 proof pp.20–24; scalar functional-equation/determinant formulas §§7–8, pp.24–28; v1/v2 sign comparison.

Source issue decisions are stored in each entry: E14 confirmed (γ/m); E18 confirmed (character signs); E19 confirmed (complementary conductor conditions); E20 confirmed (absolute heights); E21 confirmed (squared tube coordinate); E22 confirmed (v1 sign already corrected in v2); E23 added and confirmed (nonzero second congruence case). The E23 exact-title/author/Lemma 3.28 searches found no identified correction; absence of an erratum is not established. Existing search claims were retained as the author’s receipts, not represented as newly exhaustive searches.

## Baseline declaration ledger

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Read exact source objects at these commits; the current shared build HEAD was not substituted for the Tau pin. All 41 declarations below exist; limited scope is retained in `provides` and adapter gaps rather than inferred from names.

| Declaration | Source module | Verified scope |
| --- | --- | --- |
| `mathlib:AddCircle` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | ℚ/ℤ as AddCircle (1 : ℚ), the index set of the e(γ). |
| `mathlib:Complex.cpow` | `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean` | Complex powers a^{iz}. |
| `mathlib:HeckeCoset` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Double cosets H₁\Δ/H₂. |
| `mathlib:HeckeCoset.mk` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The double coset of an element. |
| `mathlib:HeckeCosetModule` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The Hecke coset module underlying the Hecke ring. |
| `mathlib:HeckeRing` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The Hecke ring 𝕋 Δ H Z of finitely supported functions on double cosets. |
| `mathlib:HilbertBasis` | `Mathlib/Analysis/InnerProductSpace/l2Space.lean` | An indexed Hilbert basis is a linear isometry equivalence with lp over the index type. This structure does not itself choose the canonical coordinate vectors or prove their basis laws. |
| `mathlib:IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | Cyclotomic fields, where the ground-state values lie. |
| `mathlib:IsHeckeTriple` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Hecke triples (H₁, Δ, H₂): Δ in the commensurator, the input of the Hecke ring. |
| `mathlib:IsHeckeTriple.of_diagonal` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | A pair H ≤ Δ ≤ commensurator H is a Hecke triple. |
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | GL₂(ℚ), the ambient group of the ax+b pair. |
| `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | Invertible matrices from a nonzero determinant, for the named elements [1 b; 0 a]. |
| `mathlib:MulAut` | `Mathlib/Algebra/Group/End.lean` | Automorphism groups; its additive twin AddAut (ℚ/ℤ) is Ẑ^×. |
| `mathlib:PNat` | `Mathlib/Data/PNat/Notation.lean` | The index set ℕ≥1. |
| `mathlib:Rat.num_div_den` | `Mathlib/Algebra/Ring/Rat.lean` | a = num a / den a. |
| `mathlib:Real.log` | `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean` | The eigenvalues log k of the Hamiltonian. |
| `mathlib:Subgroup.Commensurable` | `Mathlib/GroupTheory/Commensurable.lean` | Commensurability of subgroups. |
| `mathlib:Subgroup.Normal` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Normality, for the test that P⁺_ℤ is not normal in P⁺_ℚ. |
| `mathlib:Subgroup.relIndex` | `Mathlib/GroupTheory/Index.lean` | Relative index, for the degrees of double cosets. |
| `mathlib:lp` | `Mathlib/Analysis/Normed/Lp/lpSpace.lean` | The Hilbert space ℓ²(ℕ≥1). |
| `mathlib:riemannZeta` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean` | The Riemann zeta function, the partition function. |
| `mathlib:zeta_eq_tsum_one_div_nat_cpow` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean` | ζ(s) = Σ n^{−s} for Re s > 1. |
| `tauceti:HeckeCoset.degree` | `TauCeti/NumberTheory/HeckeRing/Basic.lean` | The number of left cosets in a double coset. |
| `tauceti:HeckeCoset.degree_eq_relIndex` | `TauCeti/NumberTheory/HeckeRing/Basic.lean` | The degree as a relative index. |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | `TauCeti/NumberTheory/HeckeRing/Associativity.lean` | The ring structure (Shimura's convolution) on the Hecke ring. |
| `tauceti:HeckeCosetModule.mul_single_single` | `TauCeti/NumberTheory/HeckeRing/Multiplication.lean` | Product of two basis elements through the structure constants. |
| `tauceti:HeckeCosetModule.single` | `TauCeti/NumberTheory/HeckeRing/Basic.lean` | The basis element of a double coset. |
| `tauceti:HeckeCosetModule.single_mul_single` | `TauCeti/NumberTheory/HeckeRing/Multiplication.lean` | Product of basis elements in the Hecke ring. |
| `mathlib:DirichletCharacter` | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | Real mod8 character carrier. |
| `mathlib:jacobiSym` | `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean` | Jacobi symbol on integer numerator and natural denominator. |
| `mathlib:LSeries` | `Mathlib/NumberTheory/LSeries/Basic.lean` | Totalized Dirichlet sum; domain assertions remain separate. |
| `mathlib:Complex.Gamma` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Complex gamma, totalized at poles; meromorphic identities use germs. |
| `mathlib:mellin` | `Mathlib/Analysis/MellinTransform.lean` | Mellin integral on positive reals. |
| `mathlib:AnalyticOnNhd` | `Mathlib/Analysis/Analytic/Basic.lean` | Analytic carrier on C and normed C². |
| `mathlib:MeromorphicOn` | `Mathlib/Analysis/Meromorphic/Basic.lean` | One-variable meromorphic carrier. |
| `mathlib:StarSubalgebra.topologicalClosure` | `Mathlib/Topology/Algebra/StarSubalgebra.lean` | Existing operator star-subalgebra closure. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomial carrier for the Eisenstein recurrence. |
| `mathlib:ArithmeticFunction.moebius` | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean` | The integer-valued arithmetic Möbius function, zero at zero and at nonsquarefree positive integers. |
| `mathlib:ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean` | For a NonAssocRing R and functions f,g : ℕ→R, the divisor-sum identity for every n>0 is equivalent to Möbius inversion over divisorsAntidiagonal. Apply over ℚ to positive integers; negative powers are rational powers of nonzero integers. |
| `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | For a primitive complex character at nonzero level N and any s, completedLFunction χ (1−s)=N^(s−1/2) rootNumber χ completedLFunction χ⁻¹ s. Identification of quadratic root number and conductor is a separate adapter. |
| `mathlib:DirichletCharacter.LFunction_changeLevel` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | For nonzero levels M\|N, χ mod M and χ≠1 or s≠1, the changed-level L-function equals LFunction χ times the deleted Euler factors at prime divisors of N. At the principal pole use meromorphic germs. |

## Every-node review

| Node | Verdict | Evidence or remaining obligation |
| --- | --- | --- |
| `AnalyticNumberTheory:AN.9/ax-plus-b-pair` | unverifiable | The two subgroup constructions, inclusion and diagonal/translation maps are bundled. Split them and their conjugation API at lemma level; source conventions match. |
| `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple` | verified | The conjugation indices prove commensurability for every positive rational diagonal. The pinned IsHeckeTriple hypotheses match the subgroup inclusions. |
| `AnalyticNumberTheory:AN.9/double-cosets-and-degrees` | unverifiable | The coset classification and both degree laws are bundled; denominator convention matches Tau degree, but representative bijection and degree proofs need distinct declarations. |
| `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra` | unverifiable | The Hecke carrier is available, but convolution comparison and conjugate-linear involution are separate nonroutine results hidden in this definition node. The finite coefficient tests are useful. |
| `AnalyticNumberTheory:AN.9/rational-presentation` | unverifiable | Eight relation nodes were extracted. The normal-form basis, abstract presented algebra, universal property and complex rescaling still share this node. Native presentation proves only a conjunction of relations. |
| `AnalyticNumberTheory:AN.9/rational-forms-comparison` | verified | The rational-valued Hecke form and the rational generator form are related by complex time evolution, not by a star map; the packet correctly retains this distinction. |
| `AnalyticNumberTheory:AN.9/time-evolution` | unverifiable | The diagonal character gives the algebraic evolution and its sign is correct. Split its multiplicativity/support proof, entire-orbit property and real star compatibility; the completion needs strong continuity. |
| `AnalyticNumberTheory:AN.9/regular-representation` | unverifiable | The positive-integer representation is correctly distinguished from left regular convolution. Bounded shifts/diagonal operators, adjoints and Hamiltonian implementation need named lemmas; HilbertBasis alone is not their proof. |
| `AnalyticNumberTheory:AN.9/partition-function` | verified | The diagonal Gibbs trace is Σk≥1 k^(-β)=ζ(β), with β>1. The pinned zeta sum uses naturals including a zero term; removing that term gives the stated positive-integer convention. |
| `AnalyticNumberTheory:AN.9/gibbs-states` | unverifiable | The Gibbs functional has the correct normalization and inverse temperature, but convergence, positivity, bounded extension and trace/diagonal formula need separate contracts. Core examples do not test completed bounded states. |
| `AnalyticNumberTheory:AN.9/kms-states` | verified | The algebraic-core KMS predicate uses positive normalized functionals and the correct +iβ boundary shift. Equivalence with completed KMS is explicitly a later gap. |
| `AnalyticNumberTheory:AN.9/gibbs-states-are-kms` | unverifiable | The Gibbs KMS computation has the correct index factors. Absolute/locally uniform convergence of the strip series, bounds and extension are not separate prerequisites; add those lemmas rather than citing trace cyclicity. |
| `AnalyticNumberTheory:AN.9/kms-classification` | unverifiable | Theorem 3.32 supports the stated regimes, but uniqueness, classification of extremes, barycentres and transitive symmetry require separate nodes and the state-simplex/correspondence inputs. |
| `AnalyticNumberTheory:AN.9/symmetry-action` | verified | The symmetry is induced by the automorphism of Q/Z, fixes dilation generators and commutes with evolution. The test excluding multiplication by 2 catches failure of invertibility. |
| `AnalyticNumberTheory:AN.9/galois-action-on-ground-states` | unverifiable | The arithmetic ground-state conclusion matches Theorem 3.32. The actual finite cyclotomic restrictions/inverse-limit adapter must be supplied; GlobalNumberFields layer 10 explicitly excludes a global Artin-map construction. |
| `AnalyticNumberTheory:AN.8/characters-mod-eight` | verified | Independently read the published four characters and checked the corrected signs and multiplicative unit table. E18 and E19 are confirmed; primitive conductor adapters remain separate. |
| `AnalyticNumberTheory:AN.8/quadratic-double-series` | corrected | Definition is equation (1), p.356, not (2), p.355. Repaired locator; odd imprimitive characters and the deleted factor at 2 are retained. Continuation is distinct from the totalized tsum. |
| `AnalyticNumberTheory:AN.8/double-functional-system` | unverifiable | The matrices and affine maps match (31)-(35), including conductor/parity. This bundles several constructions; fill-in of removable singularities and B(s)B(1-s) need precise native contracts and separate lemmas. |
| `AnalyticNumberTheory:AN.8/odd-double-sum-absolute` | unverifiable | The initial absolute convergence follows from \|χψ\|≤1 and scalar zeta majorants. Local uniformity needs its own domination input. The existing concrete series carrier permits a signature, so the generic omission is not justified. |
| `AnalyticNumberTheory:AN.8/squarefree-square-decomposition` | unverifiable | The squarefree/square identity matches (29). Supply the unique factorization node, denominator nonvanishing domain and native identity; generic omitted-carrier wording does not specify the obstacle. |
| `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import` | unverifiable | Repaired locator to (16), p.359, and made the AN.2 extension request numerical. The node itself still has no exact quantifiers/constants or principal-pole exclusion. Ordinary PNT does not supply this mean bound. |
| `AnalyticNumberTheory:AN.8/double-R1-convergence` | unverifiable | R1 and its possible principal pole match the proof. Its chain needs the exact mean estimate and compact-uniform denominator bounds; this is not yet lemma-level closure. |
| `AnalyticNumberTheory:AN.8/reciprocity-swap-equation` | unverifiable | Equation (31) matches quadratic reciprocity and the finite A matrix. Explicit odd-symbol reciprocity and Fubini/continuation inputs are not direct named prerequisites. |
| `AnalyticNumberTheory:AN.8/quadratic-reflection-equation` | unverifiable | Replaced the retired AN.1 edge with audited primitive functional equation/change-level declarations. Quadratic conductor, root-number and deleted-Euler-factor adapters remain a precise gap. |
| `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero` | unverifiable | The source states holomorphy and B1(0)=0, but entrywise removable-singularity cancellations and uniform gamma-ratio growth are nonroutine unnamed leaves. |
| `AnalyticNumberTheory:AN.8/tube-overlap-gluing` | unverifiable | The overlap gluing uses matching germs and residual polar-factor checks. State these extension/uniqueness contracts precisely; the tube sketch is not a lemma decomposition. |
| `AnalyticNumberTheory:AN.8/tube-hull-extension` | unverifiable | Corrected tube locator and confirmed E21. The bounded shell-to-hull theorem from DGH03 is not read or stated with exact bounds; record its hypotheses and canonical analytic carrier. |
| `AnalyticNumberTheory:AN.8/double-series-continuation` | unverifiable | The three polar hyperplanes agree with Lemma 2. Its native pole-cleared entireness assertion exists, but the continuation graph still inherits the exact-mean and tube-hull gaps. |
| `AnalyticNumberTheory:AN.8/pvs-local-zeta` | unverifiable | Restricted unweighted shells to indicator tests on integral support and excluded zero discriminant in native shellDensity. LOWW does not state this local integral normalization. The linear test only tests a geometric sum; supply a genuine integral test and weighted-shell API. |
| `AnalyticNumberTheory:AN.8/cubic-shintani-series` | unverifiable | Source weights/signatures/dual selector match. Repaired native split-weight and dual-subseries tests to call the series. The canonical locally free O_F ring enumeration/trace adapter and coefficient finiteness still need suppliers. |
| `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix` | corrected | Repaired locator to the matrix definition (3.1). The real off-diagonal factor 3 and complex four-sine product agree with the source; zero-order tests catch their omission. |
| `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient` | unverifiable | Read both accepted ST.1 supplier statements: they cover PID/local rings, not arbitrary nonprincipal locally free O_F modules. The packet records this extension gap; it must not call the general adapter supplied. |
| `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison` | unverifiable | No numerical orbit-density comparison or constants are stated. The generic local-selector wording and LD.3 request cannot certify matching arithmetic coefficients, especially at residue characteristics 2 and 3. |
| `AnalyticNumberTheory:AN.8/cubic-adelic-zeta` | unverifiable | Corrected the quotient to GL2(A_F)/GL2(F) for Φ(g·x), added right-invariance API/test and inversion comparison. This ensures descent, but the original PVS action/exponent, local factors and canonical native quotient remain unverified. |
| `AnalyticNumberTheory:AN.8/cubic-absolute-convergence` | verified | Proposition 3.7(1) states absolute convergence for Re s>1. The original Wright proof remains an explicit gap; no bounded-coefficient proof is asserted for cubic counts. |
| `AnalyticNumberTheory:AN.8/cubic-global-functional-equation` | verified | The discriminant exponent, 3/pi factor, gamma arguments and cαβ orientation agree with Proposition 3.7(3). Its original global proof is explicitly open, not attributed to a generic Tate Poisson theorem. |
| `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance` | unverifiable | The ordinary residues and order-one statement match Proposition 3.7(2),(5). Split the two residues, meromorphic continuation and growth clearance; native canonical residue/continuation signatures are still absent. |
| `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one` | verified | Each real factor has at least a simple zero at s=1 and each complex factor a double zero. Their product has order at least [F:Q], including the diagonal and off-diagonal cases. |
| `AnalyticNumberTheory:AN.8/gamma-unit-at-one` | verified | The listed gamma arguments 1,5/6,7/6 avoid poles and zeros, and all exponential/discriminant factors are nonzero there. This is a local prefactor statement, not an entire-function claim. |
| `AnalyticNumberTheory:AN.8/cubic-zero-at-origin` | corrected | Added the explicit dual-simple-pole prerequisite from Proposition 3.7(4). Ordinary residues alone do not bound the dual pole. The vanishing order at least n-1 is then the correct local functional-equation consequence. |
| `AnalyticNumberTheory:AN.8/cubic-orders-generating-series` | corrected | DW86 is Theorem 6.1 for order enumeration, as LOWW Lemma 3.9 says. The packet counts index norm n with n^(-2s); the source counts index-squared n with n^(-s), which are equivalent conventions. |
| `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound` | verified | Lemma 3.10 gives h2(F)D^(1/2+ε), uniform in t at fixed σ>3/2. Its reducible/field estimate and ST.3 extension request are kept explicit. |
| `AnalyticNumberTheory:AN.8/cubic-reflected-bound` | corrected | The reflected discriminant exponent must be 5/2-4σ+ε. The functional-equation factor D^(2-4σ) must multiply the right bound D^(1/2+ε). Corrected statement, acceptance and native obligation; the height exponent is unchanged. |
| `AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity` | verified | The convexity discriminant exponent 7/2-2σ matches the two boundary exponents. The packet restriction \|t\|≥1 excludes the actual poles; original Phragmen-Lindelof/Stirling proof leaves remain open. |
| `AnalyticNumberTheory:AN.9/spectral-zeta-series` | verified | The spectral series excludes the simple zero eigenvalue and converges for Re s>1 in dimension two. The finite-spectrum model tests are useful normalization checks, but do not supply the canonical compact-spectrum carrier. |
| `AnalyticNumberTheory:AN.9/selberg-primitive-product` | verified | The product over primitive conjugacy classes and k≥0 agrees with Zagier. Preserve the same orientation/inverse-class convention in the scalar trace supplier; no noncompact specialization is asserted. |
| `AnalyticNumberTheory:AN.9/spectral-regularized-determinant` | corrected | The determinant is conditional on spectral regularity at zero. Reversed the misplaced dependency through spectral-regularity-zero: prove regularity before using it, rather than making regularity depend on the determinant definition. |
| `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl` | unverifiable | AS.4 provides a discrete automorphic Hilbert sum, not the geometric scalar Laplacian, Weyl law or heat expansion. Marked those outputs as explicit extension requests; source p.603 is not their full proof. |
| `AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane` | verified | The Mellin transform uses H(t)-1 and Gamma(s), with Re s>1 and positive spectrum. Fubini follows under the stated Weyl/heat inputs; it cannot use the full heat trace without zero subtraction. |
| `AnalyticNumberTheory:AN.9/heat-small-time-subtraction` | corrected | Inserted the removed zero mode explicitly: rational Mellin terms are Σak/(s+k-1)-1/s. The coefficient at s=0 is a1-1. Matched remainder domain Re s>-N and corrected native obligation. |
| `AnalyticNumberTheory:AN.9/spectral-regularity-zero` | corrected | Removed the determinant prerequisite and used the heat subtraction/Gamma chain. A simple zero of reciprocal Gamma cancels the simple Mellin pole, independent of defining det prime. |
| `AnalyticNumberTheory:AN.9/selberg-log-product` | verified | The logarithmic geodesic expansion has the correct negative sign and 1/m denominator. The source product convention is retained; compact absolute convergence is an explicit trace/geodesic supplier input. |
| `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula` | unverifiable | Repaired locator to JSS (5.1)-(5.3), p.16 and the scalar operator shift. The source gives the stated constants, but AS.6 only promises compactly supported smooth tests; the Gaussian extension is still missing. |
| `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin` | unverifiable | Repaired locator to JSS Lemmas 5.1-5.3 and Proposition 5.4. The transform identity has the correct normalization, but branch/domain, locally uniform interchange and geodesic growth must be separate inputs. |
| `AnalyticNumberTheory:AN.9/identity-barnes-transform` | unverifiable | The scalar identity factor and constant agree with the Theorem 6.1 proof. AN.7 currently covers Hurwitz/Lerch, not Barnes G; its normalization, branches and asymptotic proofs are an extension gap. |
| `AnalyticNumberTheory:AN.9/selberg-determinant-comparison` | verified | The compact scalar determinant formula and 2C constant agree with Theorem 6.1 and (8.8). E22 is scoped to v1; v2 has the corrected Euler-characteristic sign. The formula inherits explicitly recorded Barnes/heat inputs. |
| `AnalyticNumberTheory:AN.9/selberg-functional-equation` | unverifiable | The scalar functional equation follows from the determinant symmetry after entire continuation. The packet lacks a holomorphic shifted determinant family and a branch-aware identity-factor comparison. |
| `AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison` | unverifiable | The location relation s(1-s)=λ is correct, but multiplicities are left as determined by the comparison. State them explicitly, including the double root at λ=1/4 and identity-factor cancellation. |
| `AnalyticNumberTheory:AN.9/bc-cstar-completion` | unverifiable | Corrected the dependency direction so bounded faithful convolution precedes operator closure. The left regular star map, faithfulness, C*-instances and dense-image API still need exact contracts. |
| `AnalyticNumberTheory:AN.9/bc-completed-kms` | unverifiable | The bounded strip predicate matches Definition 3.6; repaired an unrelated Q-lattices excerpt. The temperature-one native test uses only algebraic IsKMS, so it does not test this completed definition. Add completed base state and API. |
| `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground` | unverifiable | Weak KMS-infinity and upper-half-plane ground states match Definition 3.7 and its distinction. Both fail for the zero functional, so the current third test does not catch equating the two predicates; split construction and limit theorem. |
| `AnalyticNumberTheory:AN.9/bc-normal-form-product` | unverifiable | Added the eight generator relation prerequisites. Product/star closure, gcd cancellation and finite preimage reduction still hide nonroutine rewriting and rational-to-complex rescaling in one lemma. |
| `AnalyticNumberTheory:AN.9/bc-normal-form-independent` | unverifiable | The corrected γ/m support formula agrees with BC convolution. Support equality, representative bijection and basis independence should be separate declarations; the native basis equality alone does not state independence. |
| `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound` | unverifiable | Removed the backward C*-completion prerequisite and imported the algebra, coset degrees and lp. The finite row/column bound, boundedness, adjoint and coefficient recovery remain bundled and lack exact estimates. |
| `AnalyticNumberTheory:AN.9/bc-real-dynamics-extension` | verified | Real-time multiplication is isometric on the regular carrier and extends to the closure. Strong continuity/dense core belongs to the operator extension gap; complex times are not asserted bounded on the completion. |
| `AnalyticNumberTheory:AN.9/bc-bounded-state-extension` | unverifiable | The source amenability remark permits universal=reduced, but this node hides the GNS bounded-generator and universal norm comparison. Pin their statements and sources rather than treating positivity as a ready continuity theorem. |
| `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence` | unverifiable | Corrected citation to Definition 3.6/(3.17). Dense entire-core boundary identities require a bounded-state analytic continuation theorem for the converse; the source description does not prove that theorem. |
| `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure` | unverifiable | Repaired source locator to pp.1-2. The local product density and scaling are correct; native finite-adele measure carrier is omitted and AA.2 is not the restricted-product measure owner. |
| `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence` | unverifiable | Repaired locator to the p.1 condition (1β). The correspondence is with all normalized scaling measures, not just the canonical W-invariant μβ. Crossed-product/full-corner and measure reconstruction are missing exact contracts. |
| `AnalyticNumberTheory:AN.9/bc-finite-prime-projection` | corrected | Repaired locator to projection formula (2), p.2. Weighted averaging uses n^(-β)/ζA(β); the normalized finite-prime orbit formula matches the source, conditional on the explicitly open measure/Hilbert carrier. |
| `AnalyticNumberTheory:AN.9/bc-local-character-density` | corrected | Repaired locator to pp.2-3. Character cylinder density needs valuation translates and the correct locally compact multiplicative characters; full carrier/Fourier foundation is honestly a gap. |
| `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection` | unverifiable | Repaired locator to p.3 and read the AN.2 fixed-progression PNT statement. It is a sufficient requested prime-divergence input, but prove the partial-summation implication; mere infinitude is not enough. |
| `AnalyticNumberTheory:AN.9/bc-critical-ergodicity` | unverifiable | Ergodicity for 0<β≤1 matches the Proposition. The limiting finite-prime projections and constant-subspace convergence need explicit Hilbert lemmas; the character-density supplier is still open. |
| `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness` | unverifiable | The corollary is on p.3, not p.4. Passing from the canonical ergodic measure to uniqueness of all scaling measures uses the KMS simplex/factor argument, still not a precise dependency chain. |
| `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits` | corrected | Repaired locator to pp.1-2. For β>1 the disjoint qW orbits have full measure and μ(W)=1/ζ(β); β≤1 has zero unit measure. Reconstruction of all measures is the subsequent simplex contract. |
| `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres` | unverifiable | The high-beta barycentre conclusion matches Theorem 3.32 and the general Choquet statement. State the topological simplex and affine measure/state bijection, its inverse and uniqueness, as named declarations. |
| `AnalyticNumberTheory:AN.9/bc-prime-pair-ratio` | verified | Read Neshveyev Lemma 2.3 and the AN.2 rational PNT supplier. The q/p approximation and disjoint prime-pair sum support the Q specialization; no general number-field class-group input is imported. |
| `AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio` | verified | The two-coordinate valuation swap gives the exact derivative (q/p)^β after shell constants cancel. The source only needs approximation; the packet exact finite ratio is consistent with its measure law. |
| `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set` | unverifiable | The cylinders support the asymptotic ratio argument, but the ratio-set definition, asymptotic-ratio inclusion and compact-unit lifting have no exact carriers/contracts. The stage cannot inherit them from a retired logic supplier. |
| `AnalyticNumberTheory:AN.9/bc-type-three-one` | unverifiable | The Q type III1 conclusion matches Theorem 2.1. Ergodicity-to-factor, ratio-set classification, crossed-product and full-corner invariance are substantial missing operator/measure declarations. |
| `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein` | unverifiable | Finite Eisenstein sum and recurrence match Lemmas 3.27-3.28; recorded the newly confirmed second-case misprint. Split first generator, recurrence, finite Fourier identity and higher functions; denominator-independent API is insufficiently granular. |
| `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility` | corrected | Replaced retired AN.6 with the pinned Möbius function and exact inversion theorem over Q. Source (3.103)-(3.107) includes negative exponents on positive integers, which the arithmetic-function domain permits. |
| `AnalyticNumberTheory:AN.9/bc-eisenstein-division` | verified | The k-division coefficients agree with Lemma 3.29/(3.108). Retaining the degenerate term and n=1-k Möbius expression is essential; no illegal zero-to-negative-power index is included. |
| `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections` | verified | The prime 2 recovery uses the doubled level 2^(b+1), not the vanishing top coefficient at level 2^b. This agrees with the explicit pi2 example and prevents circular induction. |
| `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery` | unverifiable | The roots/Newton argument matches Theorem 3.30 but its polynomial degree, repeated-root handling and symmetric-function declarations are not matched to exact pinned statements. |
| `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation` | unverifiable | The arithmetic generation conclusion matches Theorem 3.30. Group-ring generation, adjoining shifts, rational form and complexification must be separate results with the preceding exact roots-recovery inputs. |
| `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit` | verified | For bounded a, isolate the k=1 Gibbs term and bound the remaining diagonal sum by \|\|a\|\| Σk≥2 k^(-β). The normalized tail tends to zero, giving the stated vector-state weak limit without an unbounded trace rearrangement. |
| `AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry` | unverifiable | The elementary rational basis values lie in cyclotomic fields and the symmetry conclusion matches Theorem 3.32. Repaired the upstream request to finite Galois identifications plus inverse limit; exact carrier/transition adapters remain open. |
| `AnalyticNumberTheory:AN.8/cubic-dual-simple-poles` | added | Exact dual meromorphic pole-order input read in LOWW Proposition 3.7(4); original continuation proof remains the named global analytic gap. |
| `AnalyticNumberTheory:AN.9/bc-relation-left-inverse` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-dilations` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-inverse-dilations` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-coprime` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-translation-zero` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-translation-add` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-transport` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |
| `AnalyticNumberTheory:AN.9/bc-relation-preimage-sum` | added | Declaration-sized extraction of one BC Proposition 18 relation, with rational generator rescaling and explicit finite Hecke-product prerequisites. Native signature is present; elaboration remains blocked by the missing prebuilt import. |

## Edit ledger

In addition to the top-level review, coverage/status, baseline receipts, gaps, requests and source-issue decisions, the following original node fields changed. The nine added nodes all carry `addedBy: REV-AnalyticNumberTheory--AN.8`.

- `AnalyticNumberTheory:AN.9/rational-presentation`: `prerequisites`.
- `AnalyticNumberTheory:AN.8/quadratic-double-series`: `sources`.
- `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`: `sources`.
- `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`: `sources`.
- `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`: `sources`.
- `AnalyticNumberTheory:AN.8/double-R1-convergence`: `sources`.
- `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`: `sources`.
- `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`: `prerequisites`, `sources`.
- `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero`: `sources`.
- `AnalyticNumberTheory:AN.8/tube-overlap-gluing`: `sources`.
- `AnalyticNumberTheory:AN.8/tube-hull-extension`: `sources`.
- `AnalyticNumberTheory:AN.8/double-series-continuation`: `sources`.
- `AnalyticNumberTheory:AN.8/pvs-local-zeta`: `statement`, `acceptance`, `sources`.
- `AnalyticNumberTheory:AN.8/cubic-shintani-series`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`: `sources`.
- `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`: `statement`, `proofSteps`, `acceptance`, `sources`, `api`, `tests`.
- `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`: `sources`.
- `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one`: `sources`.
- `AnalyticNumberTheory:AN.8/gamma-unit-at-one`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-zero-at-origin`: `prerequisites`, `sources`.
- `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`: `proofSteps`, `sources`.
- `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`: `sources`.
- `AnalyticNumberTheory:AN.8/cubic-reflected-bound`: `statement`, `proofSteps`, `acceptance`, `sources`.
- `AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity`: `sources`.
- `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`: `prerequisites`.
- `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`: `statement`, `proofSteps`, `acceptance`.
- `AnalyticNumberTheory:AN.9/spectral-regularity-zero`: `prerequisites`.
- `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`: `sources`.
- `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`: `sources`.
- `AnalyticNumberTheory:AN.9/identity-barnes-transform`: `sources`.
- `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`: `sources`.
- `AnalyticNumberTheory:AN.9/selberg-functional-equation`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-cstar-completion`: `prerequisites`.
- `AnalyticNumberTheory:AN.9/bc-completed-kms`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-normal-form-product`: `proofSteps`, `prerequisites`.
- `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`: `prerequisites`.
- `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-local-character-density`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-critical-ergodicity`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility`: `prerequisites`, `sources`.
- `AnalyticNumberTheory:AN.9/bc-eisenstein-division`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit`: `sources`.
- `AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry`: `sources`.

## Checks and handoff to the orchestrator

`python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory--AN.8.json` passed with 0 errors and 0 warnings after installing the review object and partial status. Independent review-completeness and graph checks passed: every original/added node has exactly one verdict, all additions have provenance, no dependency cycle remains, and no references to retired AN.1/AN.6 stages remain. `git diff --check` passed.

Independent finite rational calculations passed 64 mod8 character products, 16 character orthogonality pairs, all 256 entries of the reciprocity matrix identity A²=I, and six distinct affine iterates at (2,3). The reflected discriminant exponent and removed-zero-mode residue were separately reconciled with their input formulas. These checks support the finite conventions; they do not prove analytic convergence, source proof closure or Lean elaboration. The author's other numerical checks remain inherited receipts and were not claimed independently rerun.

Elaboration was attempted using `lean-check` with more than 20 GB available memory. It failed at the import of `TauCeti.NumberTheory.HeckeRing.Basic`: the shared prebuilt object was missing. Mathlib in that build matches its pin, but a complete Tau Ceti build at the recorded pin was unavailable. No language server or library build was started. The revised file remains unelaborated; the failed import does not diagnose its declaration syntax.

The reviewed reader document is outside this issue’s deliverables, so it was not edited. A revision job must synchronize the corrected reflected exponent, zero-mode subtraction and quotient convention into that document before any later acceptance. Allocate the lemma-level revision, exact local-PVS source acquisition and operator/measure interfaces; do not promote this packet on the strength of structural validation alone.
