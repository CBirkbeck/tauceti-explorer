# Independent review of AnalyticNumberTheory AN.8–AN.9, revision 2

**Verdict: accepted as a complete lemma-level planning pass.** Both stages remain `planned`, with thirteen explicit gaps and fifteen supplier requests. Neither stage is closed, source-decomposed or formalized. Every node has been checked; no unresolved contradiction remains in the proposed mathematics. The canonical interfaces and original proofs still required are stated precisely.

Job `REV-AnalyticNumberTheory--AN.8~2`, issue #6464. Reviewer: Codex, session `codex-Vr6rCx`, independent of the original author, first reviewer and revision author. Date: 2026-10-10. The review covers the packet, its whole suggested file, the first review and revision handoff, sources, pinned declarations, current upstream work and relevant suppliers. It does not modify the reader, which is outside this issue's deliverables.

The packet contains 240 nodes: 14 definitions, 33 constructions, 167 lemmas, 20 theorems and 6 comparisons. Verdicts are 216 verified and 24 corrected; none added or unverifiable. All 97 previously inherited IDs and all 143 revision additions are preserved. There are 170 API entries, 150 unit tests, twelve planets and 51 pinned baseline entries. All implementation statuses remain `unchecked`. The packet's `review.checked` gives a substantive verdict for each node, including conditional proof routes whose suppliers remain requests.

## Resolution of the first review

The previous review requested lemma-level refinement, precise operator/local/analytic contracts and usable native interfaces. The revision separates the affine subgroups and matrix maps, normal forms and representation comparisons; algebraic GNS bounds and the universal completion; bounded-strip KMS and measure reconstruction; finite-prime projection limits and compact averaging; ratio sets and factor/corner comparisons. The Eisenstein branch separates recurrence, Fourier evaluation, Möbius inversion, Newton coefficients, root exclusion and Cayley recovery. The quadratic branch separates primitive characters, pole-aware mean estimates, matrix identities, tube geometry and bounded extension. The cubic branch now follows Wright's convergence, unfolding, singular-stratum calculation and residues, and DW's five local factors and Fourier normalizations. The spectral branch separates heat subtraction, shifted holomorphy, the genus-one determinant and divisor pullback. Its exact geometric/Barnes inputs remain requests.

The three major mathematical corrections requested by the first review survive in packet, reader and prototype: the reflected cubic discriminant exponent is `5/2−4σ`, the positive spectral heat transform removes the simple zero as `H(t)−1` and contributes `−1/z` to subtraction, and the cubic theta integral descends to the right quotient with explicit inversion transport. The suggested file now elaborates; the previously missing prebuilt Hecke import is available. The local linear example now tests the actual p-adic integral. Completed KMS examples use the completed predicate, and a nontracial vector state under trivial M₂ dynamics separates ground states from KMS-infinity. The all-class-group arithmetic adapter, general operator theorems, local real/distribution original proofs, Bochner proof and geometric spectral inputs remain explicit gaps rather than presumed supplies.

## Corrections made in this review

The source-independent finite and normalization checks led to these changes:

- The low-beta uniqueness proof now uses compact-unit averaging, extremality of the canonical ergodic measure, orbit rigidity and the affine measure/KMS correspondence. It no longer cites a factor/Choquet route that its direct prerequisites did not supply. Both averaging and extremality are direct dependencies.
- Cotangent-series agreement is asserted for weight `k≥1`; `P₀=0` remains an algebraic convention and is not presented as a convergent weight-zero series.
- The mod-eight API now has the entire four-row table, matching its strengthened native theorem. Conductor and parity remain in separate primitive-character contracts.
- The bounded tube argument takes its supremum on the closed annulus `4≤x²+y²≤5`. The excluded polygon lies in the inner disk because its maximum squared vertex radius is `9/4`. Compactness is not attributed to the open annulus.
- The linear local benchmark uses normalized additive Haar on Qₚ, the Zₚ indicator and `Re(s)>−1`. Its integral is `(1−p⁻¹)/(1−p⁻ˢ⁻¹)`. DW's exponent is shifted by one relative to this convention. The previous Dirac-measure example did not test this integral.
- The cubic integral API exposes its supplied descended theta kernel, reindexing and inversion. Canonical arithmetic unfolding stays in its separate lemma, with an exact native omission until the actual quotient/orbit interfaces are supplied. All 170 listed APIs now name native declarations.
- Adelic unfolding explicitly depends on adelic absolute convergence. Arithmetic convergence for `Re(s)>1` uses adelic convergence, unfolding, all-class-group comparison and nonzero signature-isolating local factors. The coarse coefficient estimate alone only establishes `Re(s)>3/2` and cannot prove the stronger half-plane.
- In the triple-root contribution, `G/B` parametrizes lines; a further nonzero scalar sum parametrizes vectors. The Borel preserves a line and does not stabilize each nonzero cubic vector. The statement, argument and exact omission now reflect this distinction.
- The reflected cubic estimate has a direct AN.5 uniform-Stirling dependency. The Barnes request no longer incorrectly includes the unrelated archimedean cubic matrix node.
- Gibbs locators now refer to CM §4.6, (3.139)–(3.141), pp.474–475, and the strip predicate to Definition 3.6, p.446. Root-exclusion/Cayley locators now cover (3.113)–(3.117), pp.468–469. Wright's zero term is p.528, and triple/double-root arguments are pp.528–530/530–532.
- The scalar identity factor is supported by JSS (8.4), p.27 and its heat derivative, rather than the incompatible literal scalar specialization of (6.2). The preprint discrepancy is recorded as E24 below. The packet's existing single-Gamma formula is retained.

The full node edit ledger follows. No baseline citation was removed or changed mathematically; every one is independently confirmed with its limited scope. Review receipts, source version/access information, supplier-consumer bookkeeping, native inventory and validation receipts are also updated.

| Node ID suffix | Changed fields |
| --- | --- |
| `AN.9/bc-regular-shift-bounds` | `sources` |
| `AN.9/bc-gibbs-absolute-convergence` | `sources` |
| `AN.9/bc-completed-gibbs` | `sources` |
| `AN.9/bc-gibbs-strip-series` | `sources` |
| `AN.9/bc-low-temperature-uniqueness` | `prerequisites`, `proofSteps` |
| `AN.9/bc-high-beta-extremes` | `sources` |
| `AN.9/bc-kms-symmetry-transitive` | `sources` |
| `AN.9/bc-eisenstein-higher` | `sources`, `statement` |
| `AN.9/bc-eisenstein-cotangent-roots` | `sources` |
| `AN.9/bc-eisenstein-bezout-cayley` | `sources` |
| `AN.8/characters-mod-eight` | `api` |
| `AN.8/double-shell-normalizer` | `proofSteps` |
| `AN.8/pvs-local-zeta` | `sources`, `tests` |
| `AN.8/cubic-adelic-zeta` | `api` |
| `AN.8/cubic-adelic-unfolding` | `prerequisites` |
| `AN.8/cubic-absolute-convergence` | `prerequisites`, `proofSteps`, `sources` |
| `AN.8/cubic-zero-singular-term` | `sources` |
| `AN.8/cubic-triple-root-unfolding` | `proofSteps`, `sources`, `statement` |
| `AN.8/cubic-triple-root-residue` | `sources` |
| `AN.8/cubic-double-root-unfolding` | `sources` |
| `AN.8/cubic-reflected-bound` | `prerequisites` |
| `AN.9/identity-barnes-transform` | `proofSteps`, `sources` |
| `AN.9/selberg-identity-germ` | `sources` |
| `AN.9/selberg-functional-equation` | `sources` |

## Source checks and boundaries

Fourteen public source documents were independently downloaded and read at the selected statements and arguments below; JSS v1 was additionally compared. Each `sources[].independentReviewReceipt` records the opened URL, SHA-256 and date. The historical author's receipts remain attributed to that author. These are scope statements about evidence, not source summaries. Cited external proofs remain gaps.

| Source | Independently read mathematical evidence |
| --- | --- |
| [bost-connes-1995](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf) | §1, pp.411–416, and Proposition 18 with its full finite presentation/normal-form argument, pp.431–433; printed-page images checked. |
| [connes-marcolli-2008](https://www.its.caltech.edu/~matilde/coll-55.pdf) | Chapter 3 KMS definitions/proposition, pp.444–448; presentation and finite Fourier/Möbius/Newton recovery, pp.457–470, including Theorem 3.30 argument; Theorem 3.32 and Gibbs expressions, pp.474–476. Printed page equals PDF page minus 22. |
| [blomer-2011](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf) | Published §2.1, pp.358–359: characters, conductors and fourth-moment input; full Lemma 2 continuation proof, §3, pp.361–364, including reciprocal factors, overlap, tube shell and growth. Statements checked against the version of record. |
| [neshveyev-2000-correct](https://arxiv.org/pdf/math/0002141v1) | All four pages: finite-prime projection and character-density argument, scaling-measure classification and its corollary. General operator reconstruction is not silently inferred from this short application. |
| [neshveyev-2009](https://arxiv.org/pdf/0907.1456v1) | §§1–2, pp.1–5, including ratio-set definitions, Lemma 2.3 prime-pair argument and Theorem 2.1 proof in the Q specialization. General factor-classification proofs cited there remain external. |
| [loww-2025-analytic](https://arxiv.org/pdf/2110.07712) | §3.2, pp.11–14 of the hashed public preprint: Proposition 3.6 and 3.7, Lemmas 3.8–3.11 and their estimates. This is preprint evidence; version-of-record collation remains separate. |
| [sarnak-1990](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf) | Printed p.603: spectral definition, Mellin heat subtraction and zero regularity. Page-image/OCR comparison fixes the removed zero mode. |
| [zagier-selberg](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf) | §1, pp.1–2: primitive product and spectral-parameter conventions. This survey is not claimed to furnish the analytic proof closure. |
| [jss-2026](https://arxiv.org/pdf/2512.16681v2) | v2 §5, pp.13–19: heat/transform arguments; §6, pp.20–24: determinant comparison proof; §8, pp.26–28: scalar formulas; §2.5, p.9: Barnes derivative/asymptotic used. v1 (1.3) sign independently collated. Barnes/geometric external proofs remain requests. |
| [heath-brown-1995](https://ora.ox.ac.uk/objects/uuid:b188b365-d8d1-4267-8548-49f01e6cb6a7/files/m6af40476f1b860392271a2d8ecae593b) | Oxford author copy pp.1–4 and 31–36, corresponding to printed pp.235–238 and 265–270: theorem/corollary hypotheses and §10 fourth-moment argument through the critical-line endpoint. Publisher download returned HTTP 403; no publisher reading is claimed. |
| [dgh-2001](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf) | §4.3, pp.37–44: Proposition 4.6 extension contract and bounded extension via reciprocals, with annular continuation argument. Its cited Hörmander proof of Bochner is not supplied here. |
| [wright-1985](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf) | Lemmas 1.1–1.2, pp.510–511; Siegel/convergence argument, pp.515–517; unfolded, Poisson, smoothing and singular-orbit argument through final residues, pp.518–533. General reduction theory remains a supplier input. |
| [datskovsky-wright-1986](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf) | Local measure/pairing and five orbital-factor calculation, pp.37–45; real/complex Fourier comparison, pp.48–51; Theorem 6.2 and arithmetic/Euler comparison, pp.68–73. Igusa/Shintani distribution/real proofs and quantitative entire-order argument remain precise external gaps. |
| [laca-2000](https://arxiv.org/pdf/math/9911135) | §2.1.1, p.5, minimal dilation; §2.2.1, pp.6–8, covariance/full-corner proof; BC specialization, pp.8–10. The general amenable full/reduced theorem is not proved by this application. |

All seven inherited source findings were independently checked and confirmed: E14 (missing normal-form denominator), E18 (two character signs), E19 (conductor cases), E20 (absolute imaginary heights), E21 (squared tube coordinate), E22 (v1 constant sign, already corrected in v2) and E23 (nonzero second congruence case). Their current-job verdicts and bounded correction searches are recorded in the packet.

E24 is confined to the read JSS v2 preprint, (6.2), p.20 at `m=0`, compared with (8.4), p.27. The former gives two copies of `logΓ(s)` while the latter has one. Write `C=g−1`. Using the Barnes derivative (2.8), the scalar expression

`log I_g(s)=2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)]`

has derivative `−2C(2s−1)ψ(s)`, agreeing with the identity heat transform in (6.5)–(6.7). The literal scalar specialization of (6.2) instead adds `2Cψ(s)` and changes the pole order at zero. This independently confirms the scalar discrepancy without asserting a repaired general twisted formula. The arXiv record still identifies v2 as latest; its listed correction concerns signs. Exact-title/author and Gamma-coefficient correction searches found no further matching correction. This bounded search does not establish absence of an erratum.

## Pinned library and current upstream audit

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. All 51 declarations and their surrounding hypotheses were independently read from exact pinned Git objects. Their use in every citing node was checked. In particular, completed C*-GNS does not provide pre-completion algebraic generator bounds; a Hecke carrier does not prove finite normal-form independence; Newton identities need a finite variable set and evaluation into the commutative rational corner; `infinitePi` requires probability marginals; `LFunction_eq_LSeries` is confined to `Re(s)>1`; primitive/change-level functional equations do not themselves supply the quadratic Gauss-sum adapter.

| Declaration | Pinned source module | Confirmed scope |
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
| `mathlib:MulAut` | `Mathlib/Algebra/Group/End.lean` | Multiplicative automorphisms and the additive twin AddAut. The profinite topological identification of AddAut(Q/Z) is imported from ProfiniteArithmetic. |
| `mathlib:PNat` | `Mathlib/Data/PNat/Notation.lean` | The index set ℕ≥1. |
| `mathlib:Rat.num_div_den` | `Mathlib/Algebra/Ring/Rat.lean` | (a.num : Q)/(a.den : Q)=a, with positive natural denominator; use symmetry when decomposing a. |
| `mathlib:Real.log` | `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean` | The eigenvalues log k of the Hamiltonian. |
| `mathlib:Subgroup.Commensurable` | `Mathlib/GroupTheory/Commensurable.lean` | Commensurability of subgroups. |
| `mathlib:Subgroup.Normal` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Normality, for the test that P⁺_ℤ is not normal in P⁺_ℚ. |
| `mathlib:Subgroup.relIndex` | `Mathlib/GroupTheory/Index.lean` | H.relIndex K is the index of H∩K in K. The Hecke degree uses the conjugated subgroup as H and the left-coset subgroup as K. |
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
| `mathlib:Complex.exp` | `Mathlib/Analysis/Complex/Exponential.lean` | The complex exponential as the limit of its power series, used by cotangent and determinant normalizations. |
| `mathlib:jacobiSym.quadratic_reciprocity` | `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean` | For odd natural a,b, J(a\|b)=(−1)^(a/2·b/2)J(b\|a), including pairs that are not coprime. |
| `mathlib:MvPolynomial.mul_esymm_eq_sum` | `Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean` | Newton recurrence over any commutative ring with a finite variable set. Evaluate into the commutative rational corner and divide by positive k in Q. |
| `mathlib:PositiveLinearMap.GNS` | `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` | The completed GNS space for a positive functional on an already normed C*-algebra. It does not bound left multiplication for a merely algebraic Hecke core. |
| `mathlib:PositiveLinearMap.gnsStarAlgHom` | `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` | Unital star representation on the completed GNS Hilbert space under CStarAlgebra and StarOrderedRing hypotheses. |
| `mathlib:IsDedekindDomain.FiniteAdeleRing` | `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean` | Restricted product of adic completions relative to their integer subrings; supplies the actual finite-adèle ring, its topology and scalar algebra. |
| `mathlib:MeasureTheory.Measure.infinitePi` | `Mathlib/Probability/ProductMeasure.lean` | Product of probability measures; cylindrical masses and uniqueness are supplied by infinitePi_pi and eq_infinitePi. This is not a finite product only. |
| `mathlib:DirichletCharacter.LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | The meromorphic Dirichlet L-function; unlike LSeries, this is analytic continuation beyond the series region. |
| `mathlib:DirichletCharacter.LFunction_eq_LSeries` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | For Re s>1, the continued L-function agrees with the naive character Dirichlet series. |
| `mathlib:RingHom.toAlgebra'` | `Mathlib/Algebra/Algebra/Defs.lean` | A ring homomorphism into a possibly noncommutative semiring defines an algebra when all image elements commute with the target. Supplies the central rational scalar algebra on the complex Hecke core. |

The reviewed library audit does not classify AN.8 or AN.9 as built. Existing carriers and general implemented results are imported. The current read-only roadmap revision is `81207c7f16d5abf770f13a7d2bdcdb465c030787`, and current Tau Ceti revision is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The two nearby current roadmaps ArithmeticDirichletSeries and OperatorTheory were read in full. Relevant README and Suggested contracts of ProfiniteArithmetic, RestrictedProducts and GlobalNumberFields were read. These own the profinite/integral restricted-product carriers, finite adèle arithmetic and compatible finite cyclotomic Galois direction. GlobalNumberFields layer 10's README contract is imported as a roadmap plan; the finite Galois API is not asserted implemented by its current Suggested file. No global Artin theorem is assumed.

The current Tau Ceti character-space measure theorem provides existence of a finite inner regular measure for a positive functional on a unital commutative C*-algebra; uniqueness needs RMK. Current compactness of integral finite adèles retains its local compact-integer hypotheses. These two results postdate the historical pin and remain separate `upstreamImports`, with an explicit integration obligation. No current upstream work is replanned.

Supplier statements were read for AN.2, AN.4, AN.5, AN.7, ST.0–ST.3, AA.0/AA.2, AL.0, ALS.0 and AS.2/AS.4/AS.6. ST.1's accepted parametrization is PID/local and needs the precise nonprincipal-module extension. AN.2's PNT supplies the proposed rational prime input; it is not accepted library code and cannot replace the quadratic moment contract. AL.0's Fourier/Poisson framework needs the finite-dimensional binary-cubic specialization. AA.2's quotient-side/Haar conventions need inversion transport and the exact GL₂ majorants. AS.4's current modular spectral targets do not supply an arbitrary compact scalar surface, and AS.6's compactly supported tests need a Gaussian extension. AN.7's Hurwitz/Lerch scope needs the explicit Barnes extension. The fifteen requests state these missing contracts numerically or by exact carriers and hypotheses.

The Caraiani–Newton tier/bundle order was checked. The general real-character moment/large-sieve input is assigned downward to ST.2 rather than imported from a higher several-variable supplier. General crossed products, KMS completion and nonsingular factor theory belong to a proposed OperatorTheory Part II below this specialization; six exact extension contracts are recorded. These are ownership proposals for the orchestrator, not changes to an existing upstream roadmap.

## Native file, tests and closure limits

The full suggested file was read, including actual signatures and examples. All 47 definition/construction names and all 170 API names are actual declarations. All 150 test labels accompany actual Lean examples; there are at least three for each definition/construction. The namespace-aware inventory finds 355 named declarations and 105 exact leaf omissions. The omissions and narrower generic clauses are individually described in `nativeOmissions` and `nativeScope`. For example, canonical cubic orbit unfolding and canonical weak-topology homeomorphisms await supplied carriers; generic theta/integral or state values do not certify these comparisons. No unconstrained Prop field is accepted as a replacement for the missing mathematics.

The twelve planet names are preserved and identify central definitions, constructions and named theorems rather than locators. The two stages' target ledger realizes their stated branches, including cubic residues/growth, spectral determinant/divisor, phase transition, ratio-factor and arithmetic generation targets. Their unresolved original proofs, canonical adapters and general suppliers justify `planned` rather than `closed` coverage. The thirteen retained gaps are:

- Quadratic primitive-character and uniform-strip proof adapters.
- Bochner theorem: primary proof acquisition.
- Cubic rings on nonprincipal modules.
- Local distribution functional equations: external original proofs.
- GL2 measures, Siegel majorants and normalized Eisenstein input.
- Cubic entire order-one quantitative estimate.
- Normalized Haar and canonical adelic component adapters.
- OperatorTheory Part II: crossed products and bounded-state completion.
- OperatorTheory Part II: nonsingular factor classification.
- Compact scalar geometric spectral and Gaussian trace adapters.
- Barnes G original normalization and asymptotic proof.
- Canonical native interfaces and weak state topology.
- Current upstream identifiers absent from the historical declaration index.

## Validation and orchestrator follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory--AN.8.json` passes with zero errors and zero warnings. Review coverage is exactly 240 distinct node IDs and there are no unverified nodes. Source-issue/version validation and `git diff --check` pass. Independent exact arithmetic checks pass for the polynomial recurrence and 128 Eisenstein division identities (`1≤N≤16`, `1≤k≤8`), four-character orthogonality, symmetric involutive reciprocity matrix, six distinct affine iterates, polygon radius bound and cubic interpolation endpoint powers. These support conventions; they are not formal proofs or replacements for source/supplier closure.

`lean-check research/blueprint/suggested/AnalyticNumberTheory--AN.8.lean` succeeds with exactly 420 `sorry` warnings and no errors or other warnings. More than 20 GB memory was available; checks ran one at a time and no build, cache operation or language server was started. Shared Mathlib HEAD equals its pin. All three directly imported Tau Ceti source modules independently match pinned Git objects byte for byte, with hashes recorded in `leanValidation`; the shared Tau Ceti root has no Git metadata, so no runtime HEAD assertion is made. This validates unproved signatures and examples only.

The reader is outside the allowed edits. The handoff identifies the new synchronization required before package generation: Gibbs/Wright/Cayley locators, positive-weight cotangent agreement, full character-table API, compact annulus argument, Qₚ integral benchmark, separate canonical unfolding, adelic proof of arithmetic convergence, triple-root line/scalar distinction, direct Stirling dependency and JSS E24/scalar source support. The earlier major reflected-exponent, zero-mode, right-quotient and uniqueness corrections are already synchronized. The report and packet are the corrected review evidence.

For the orchestrator: route the six OperatorTheory Part II contracts and ST.2 downward moment ownership; reconcile current upstream import identifiers when packaging; retain all thirteen gaps and canonical-native limitations; synchronize the reader from this correction ledger. Original Bochner, Igusa/Shintani, Barnes and quantitative growth proof acquisition remains follow-up work. Acceptance here does not imply those sources have been acquired or those contracts implemented. This review is finished and needs no continuation of job #6464.
