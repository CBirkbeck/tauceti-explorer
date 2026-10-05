# Analytic number theory AN.8–AN.9

This part completes the target-planning pass for the several-variable and spectral/arithmetic noncommutative stages. It preserves the fifteen Bost–Connes checkpoint identifiers and adds the missing source chains. Both stages are **planned** under Protocol §0. They remain open at the specific source and supplier interfaces listed below. This document is the roadmap; the suggested Lean file is an uncompiled set of signatures, with explicit omissions where a full interface cannot yet be stated.

## Scope and conventions

AN.8 selects Blomer’s quadratic double Dirichlet series and binary-cubic prehomogeneous zeta integrals/Shintani series. The four twists, the deleted factor at2, square factors, sixteen-component ordering, convergence tubes and polar hyperplanes are fixed explicitly. The analytic coefficient and local-factor comparisons import ArithmeticStatistics’ orbit, discriminant and stabilizer objects. Igusa/motivic methods stay with LD.3; their specialization requires the source residue bounds. Multiple zeta values remain with PeriodsAndSpecialValues PS.9 and are not identified with this double series.

AN.9 selects a connected compact torsion-free hyperbolic surface, curvature−1, genus≥2, and the scalar positive Laplacian. AS.4/AS.6 and ALS.0 supply its geometry, spectrum and trace formula. Finite-volume quotients with cusps, scattering/continuous spectrum and orbifold elliptic corrections require their own proved comparisons and are outside this selected case. Small positive eigenvalues below1/4 produce real Selberg spectral parameters; a spectral symmetry does not establish Riemann RH.

The Bost–Connes branch distinguishes the left regular Hecke completion from the positive-integer Gibbs representations, the normalized arithmetic rational form from the Q-valued Hecke form, real completed dynamics from complex dynamics on the analytic core, algebraic boundary identities from completed bounded-strip KMS states, and ground states from KMS∞ limits. The type III₁ statement has its own ergodicity and ratio-set chain. A partition function equal toζ(β) alone does not classify KMS states.

## Source reading and baseline

The reviewed AN.8/AN.9 library audit and accepted RS-07 scope were read before planning. The pinned revisions are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was checked by reading its statement and parameters at the pin. Searches and this ledger provide planning evidence, not implementation evidence. The two upstream documents in the provenance ledger were read in full during this continuing session and their unchanged hashes rechecked.

### Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory

Jean-Benoît Bost and Alain Connes. Selecta Mathematica (N.S.) 1 (1995), no. 3, 411–457; author-hosted scan of the published article on Connes's site (no text layer, read on page images); journal page = PDF page + 410; accessed 2026-09-28

Source: [bost-connes-1995](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf). SHA-256: `376e00d06bef1be27769f0f1c186010a6e6ad354608c3a273b0b3ae6479c1815`.

Read sections:
- §4 'Presentation of the C*-algebra C_Q', pp. 430–433 (PDF pp. 20–23): the notations (α), (β), Proposition 18 and its proof, formulas (1)–(7), and the remark on the rational presentation.
- Fresh page-image reread 2026-10-05: pp.430–433, complete Proposition 18 proof and rational-form remark.

### Noncommutative Geometry, Quantum Fields and Motives

Alain Connes and Matilde Marcolli. AMS Colloquium Publications 55 (2008); author-hosted PDF on Marcolli's page; printed page = PDF page − 19; accessed 2026-09-28

Source: [connes-marcolli-2008](https://www.its.caltech.edu/~matilde/coll-55.pdf). SHA-256: `4154ad00fad638e06746f11cd476adb00d186d30cee11e9f531fd21c45aa71f7`.

Read sections:
- Chapter 3, §2.2 'The KMS condition' (pp. 445–447), and §4 '1-dimensional Q-lattices' from Proposition 3.23 through §4.6 'KMS states and class field theory' (pp. 457–476): the presentation, the time evolution (Lemma 3.24), the Hecke algebra (Proposition 3.25, (3.61)–(3.72)), the symmetries (3.73)–(3.77), Theorem 3.32 and (3.138)–(3.142).
- Fresh 2026-10-05 text read: Definitions 3.4–3.7 pp.445–448; Lemma 3.21 and Propositions 3.22–3.25 pp.454–461; §4.3–4.4 pp.461–470, including Lemmas 3.27–3.29 and Theorem 3.30 proof; Theorem 3.32 pp.474–476. No claim that source-cited operator-algebra or class-field-theory proofs were reread.

### Subconvexity for a double Dirichlet series

Valentin Blomer. Compositio Math.147 (2011),355–374; version of record downloaded 2026-10-05. Results outside the selected continuation/functional-equation target are not extracted.

Source: [blomer-2011](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf). SHA-256: `1a838544b93896f5af36120565cc64c94efe9c9d04e43d2a57b506c757f18521`.

Read sections:
- §2.1, (7)–(11), published p.358: complete character and conductor definitions; page image inspected.
- §3, Lemma 2 and its complete proof, (27)–(36), published pp.361–364; compared with arXiv v1 pp.6–9.

### Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem

Sergey Neshveyev. arXiv math/0002141v1. The inherited math/0012110 link was a blueprint citation error and points to an unrelated paper.

Source: [neshveyev-2000-correct](https://arxiv.org/pdf/math/0002141v1). SHA-256: `0bb0f82392b37e5827e5639ec11a54ce3a113d579b5383c60695785211060538`.

Read sections:
- All four pages, including Proposition, finite-prime projection formula, character proof, corollary and references.

### Von Neumann algebras arising from Bost–Connes type systems

Sergey Neshveyev. arXiv 0907.1456v1. Only the Q specialization of the number-field argument is used.

Source: [neshveyev-2009](https://arxiv.org/pdf/0907.1456v1). SHA-256: `6ca9d4a4e3f548b65964ac21dc8dcbb0316162fa4ec6d8306e3e4a59bac62e36`.

Read sections:
- Introduction; §1 ratio and asymptotic ratio sets; §2 Theorem 2.1, Lemma 2.3 and their complete proofs, pp.1–5. The GL2 argument is outside this target.

### The average size of 3-torsion in class groups of 2-extensions

Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood. Source route PAPER-LEMKEOLIVER-WANG-WOOD25/14, reviewed payload. Fresh arXiv text; published-version reading evidence stays with that accepted extraction. Do not promote this receipt to a reading of the published PDF.

Source: [loww-2025-analytic](https://arxiv.org/pdf/2110.07712). SHA-256: `fad655111b4d5864f54fbc1a94f3319ca57fb92c7adc6741bbec01d08732d935`.

Read sections:
- §3.2 in full: Shintani zeta definitions, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14. Original Wright/Datskovsky–Wright proofs cited there remain an explicit acquisition/decomposition gap.

### Determinants of Laplacians, heights and finiteness

Peter Sarnak. Author-hosted published scan, pp.601–622. Only the spectral definition and heat argument on p.603 are cited.

Source: [sarnak-1990](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf). SHA-256: `cf4ff5ea425c966c701b4a5d96046f54e2bba4049d05d7f69424a622c98a069e`.

Read sections:
- Page images pp.601–606; §1.1–1.5 on p.603 supplies the spectral series, heat Mellin transform, regularity at zero and determinant definition. Sections beyond the stated scope were not read.

### New points of view on the Selberg zeta function

Don Zagier. Author-hosted survey. Supplies conventions, not a proof-closure certificate for continuation.

Source: [zagier-selberg](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf). SHA-256: `b3d3194767e3844f80a857cc18bc5f3a420bfe352f988e91791769b59b316963`.

Read sections:
- §1 in full, pp.1–2, including spectral parameters and primitive-hyperbolic product. §2–3 statement context read, not used as complete proofs.

### Determinants of twisted Laplacians and the twisted Selberg zeta function

Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti. arXiv 2512.16681v2, 9 February 2026. The torsion-factor sign in v1 is already corrected in v2.

Source: [jss-2026](https://arxiv.org/pdf/2512.16681v2). SHA-256: `1f0f399fa1c247b8b4726cd1dcd904e75166f06bea76e2b581437b9d824b5c11`.

Read sections:
- Introduction; §6 Theorem 6.1 and complete proof pp.20–24 read first in v1 and collated with v2; §8.2–8.3 complete formulas and corollary proofs pp.27–28 read in v2. §5.14 normalization read. Earlier heat/transform lemmas remain explicitly requested/source gaps.

The Neshveyev link inherited from the checkpoint, math/0012110, was unrelated. The correct ergodicity proof is math/0002141. This is a correction to the blueprint citation, not an erratum in that paper. The complete original PVS and heat/Barnes supplier proofs still require the actions named in the gap ledger; reporting a theorem in a source does not close its original proof chain.

| Declaration | Module | Exact use |
|---|---|---|
| `mathlib:AddCircle` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | ℚ/ℤ as AddCircle (1 : ℚ), the index set of the e(γ). |
| `mathlib:Complex.cpow` | `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean` | Complex powers a^{iz}. |
| `mathlib:HeckeCoset` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Double cosets H₁\Δ/H₂. |
| `mathlib:HeckeCoset.mk` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The double coset of an element. |
| `mathlib:HeckeCosetModule` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The Hecke coset module underlying the Hecke ring. |
| `mathlib:HeckeRing` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The Hecke ring 𝕋 Δ H Z of finitely supported functions on double cosets. |
| `mathlib:HilbertBasis` | `Mathlib/Analysis/InnerProductSpace/l2Space.lean` | The orthonormal basis (ε_k) of ℓ². |
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

The retired FoundationsAndLibraryIntegration process stages are not used as suppliers. General analytic/operator interfaces whose exact pinned declarations remain unmatched are recorded as gaps with named consumers. Cyclotomic arithmetic is requested from the existing GlobalNumberFields layer, rather than re-planned here.

## AnalyticNumberTheory:AN.8

### The four real characters modulo eight

Node: `AnalyticNumberTheory:AN.8/characters-mod-eight`. Declaration: `TauCeti.SeveralVariableZeta.Characters8` (definition). Planet: Characters modulo eight.

Fix the row order ψ1,ψ−1,ψ2,ψ−2 and unit residues 1,3,5,7. Their value table is ((1,1,1,1),(1,−1,1,−1),(1,−1,−1,1),(1,1,−1,−1)); each is zero on even integers. They are genuine Dirichlet characters, with conductors 1,4,8,8 and parities 0,1,0,1. The two positive-sign descriptions and one conductor row printed on p.358 are corrected in E18–E19.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Verify multiplicativity on the four-element unit group modulo eight.
2. Extend by zero away from units.
3. Check primitive conductor and parity by restriction to levels 1,4,8.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.Characters8.value` (projection): Evaluate the above row at n mod8, with zero on even n.
- `TauCeti.SeveralVariableZeta.Characters8.mul` (relation): ψ(nm)=ψ(n)ψ(m).
- `TauCeti.SeveralVariableZeta.Characters8.unit_table` (characterisation): The four rows are exactly the displayed table; conductors and parities have the specified values.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.Characters8.test_one` (degenerate): Every row takes value 1 at 1.
- `TauCeti.SeveralVariableZeta.Characters8.test_signs` (computation): ψ2(3)=−1 and ψ−2(7)=−1.
- `TauCeti.SeveralVariableZeta.Characters8.test_orthogonality` (characterisation): For rows i,j, Ση ψi(η)ψj(η)=4 if i=j and 0 otherwise.

Prerequisites: `mathlib:DirichletCharacter`.

Source: blomer-2011, §2.1, (7)–(11), p.358.

Open proof/interface leaves: Native elaboration.

### The selected quadratic double Dirichlet series

Node: `AnalyticNumberTheory:AN.8/quadratic-double-series`. Declaration: `TauCeti.SeveralVariableZeta.DoubleSeries` (construction). Planet: Quadratic double Dirichlet series.

For odd d>0 put χd(n)=(d/n) on odd n, retaining square factors of d. Let L2(s,χdψ)=Σn positive odd χd(n)ψ(n)n^(−s), ζ2(s)=(1−2^(−s))ζ(s), and Z(s,w;ψ,ψ′)=ζ2(2s+2w−1)Σd positive odd L2(s,χdψ)ψ′(d)d^(−w). These are series on their stated convergence regions; their analytic continuations are separate functions. Row indices are (ψ,ψ′), with ψ′ varying fastest.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Build odd coefficient sequences with zero at0 and use the pinned LSeries convention.
2. Use the outer odd-d series only after absolute convergence is proved.
3. Keep the factor at2 deleted in both L2 and ζ2; continuation agrees on the convergence tube.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddZeta` (constructor): ζ2(s)=(1−2^(−s))ζ(s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddL` (constructor): The LSeries of the odd Jacobi-symbol coefficients χdψ.
- `TauCeti.SeveralVariableZeta.DoubleSeries.series` (constructor): The displayed double series.
- `TauCeti.SeveralVariableZeta.DoubleSeries.continued` (constructor): The meromorphic continuation selected by Lemma2; agree with series for Res,Rew>1.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_odd_zeta` (compatibility): For Res>1, ζ2(s)=Σn positive odd n^(−s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_imprimitive` (non-example): χ9(3)=0 although the squarefree-part character χ1(3)=1; square factors must not be erased.
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_first_coefficient` (computation): The d=1 coefficient is L2(s,ψ); the ζ2 correction remains outside the d sum.

Prerequisites: `AnalyticNumberTheory:AN.8/characters-mod-eight`; `mathlib:jacobiSym`; `mathlib:LSeries`; `mathlib:riemannZeta`.

Source: blomer-2011, Definition (2), p.355; §3 (29)–(31), pp.361–362.

Open proof/interface leaves: Native elaboration.

### The sixteen-component functional-equation matrices

Node: `AnalyticNumberTheory:AN.8/double-functional-system`. Declaration: `TauCeti.SeveralVariableZeta.FunctionalSystem` (construction). Planet: Double-series functional equations.

Let α(s,w)=(w,s), β(s,w)=(1−s,s+w−1/2). Set Hψ,η=ψ(η), H Hᵀ=4I. The reciprocity matrix has entry A(ψ,ψ′;ρ,ρ′)=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2)). For fixed ψ put qψ,η=8 for ψ2,ψ−2; q=1 for ψ1,η≡1mod4 or ψ−1,η≡3mod4, and q=4 otherwise. Let κψ=0,1,0,1; let eψ,η=0 if q≠1 and otherwise be +1 for η=1,7 and −1 for η=3,5. Define rψ,η(s)=(q/π)^(1/2−s) Γ((1−s+κ)/2)/Γ((s+κ)/2) × (1−e·2^(−s))/(1−e·2^(s−1)). Then B(s) is block diagonal with ψ-block H diag(rψ,η(s)) Hᵀ/4. Quotients here are meromorphic germs, with removable singularities filled when proved, rather than values obtained by dividing by zero.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Project the second twist coordinate to residue classes by Hᵀ/4.
2. Apply quadratic reciprocity to the odd double sum to compute A.
3. Apply the primitive quadratic L-functional equation, then restore the deleted Euler factor at2, to obtain the diagonal r factors and conjugate back.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap` (constructor): α is the displayed affine involution on C².
- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect` (constructor): β is the displayed affine involution on C².
- `TauCeti.SeveralVariableZeta.FunctionalSystem.A` (constructor): The finite reciprocity sum defining the 16×16 matrix.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.B` (constructor): The four Hadamard-conjugated diagonal blocks just specified.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_square` (characterisation): A²=I16.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_affine_order` (computation): α²=β²=id and (αβ)^6=id, with six minimal for the affine action.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_twist_two` (compatibility): The ψ2 block equals (π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2) times I4.

Prerequisites: `AnalyticNumberTheory:AN.8/characters-mod-eight`; `mathlib:Complex.Gamma`; `mathlib:Complex.cpow`.

Source: blomer-2011, §3 (31)–(35), pp.362–363; corrected conductor convention E19.

Open proof/interface leaves: Native elaboration.

### Absolute convergence in the initial double tube

Node: `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`. Declaration: `TauCeti.SeveralVariableZeta.odd_double_sum_absolute` (lemma).

For Res>1 and Rew>1 the odd n,d double sum is absolutely convergent, locally uniformly on compact sub-tubes; hence it may be summed in either order.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Bound both characters by1.
2. Dominate by ζ(Res)ζ(Rew); the correcting ζ2 factor has Re(2s+2w−1)>1.
3. Use compact positive margins for locally uniform domination.

Prerequisites: `AnalyticNumberTheory:AN.8/quadratic-double-series`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### Separating square factors of the discriminant index

Node: `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`. Declaration: `TauCeti.SeveralVariableZeta.squarefree_square_decomposition` (lemma).

Each odd d has a unique d=d0 d1² with d0 squarefree. In the initial tube, Z=ζ2(2s+2w−1)ζ2(2w)Σd0 odd squarefree L2(s,χd0ψ)ψ′(d0)/(d0^w L2(s+2w,χd0ψ)).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Factor d uniquely prime by prime.
2. Removing primes dividing d1 from the inner L-series gives the finite missing Euler factors.
3. Sum each geometric square-factor series absolutely to obtain the quotient in (29).

Prerequisites: `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### The first-moment input for the wider convergence tube

Node: `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`. Declaration: `TauCeti.SeveralVariableZeta.quadratic_mean_bound_import` (lemma).

For every fixed vertical strip needed in (29), use the uniform quadratic L-first-moment estimate of Blomer (16), together with its conductor/parity-correct functional equation, to bound the squarefree-d0 sum. Its full source proof is a gap, not a consequence of bounded coefficients.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Match (16) with the odd squarefree discriminants and the four twists.
2. Keep its ε-loss and vertical-parameter dependence.
3. Feed partial summation with the selected bound into the d0 series.

Prerequisites: `AnalyticNumberTheory:AN.8/quadratic-double-series`; `AnalyticNumberTheory:AN.2`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

Open proof/interface leaves: Quadratic first-moment proof.

### Locally uniform convergence in R1

Node: `AnalyticNumberTheory:AN.8/double-R1-convergence`. Declaration: `TauCeti.SeveralVariableZeta.double_R1_convergence` (lemma).

The pole-cleared squarefree expression is holomorphic on R1={Rew>1,Res+Rew>3/2}; its only possible polar line there is s=1, from the trivial inner twist.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the first-moment bound for Res≥1/2.
2. Apply the quadratic functional equation and its conductor growth for Res<1/2.
3. Sum on compact strict sub-tubes and separate the trivial-character pole.

Prerequisites: `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`; `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### The swap functional equation

Node: `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`. Declaration: `TauCeti.SeveralVariableZeta.reciprocity_swap_equation` (lemma).

The 16-vector continuation satisfies Z(s,w)=A Z(w,s) wherever defined meromorphically.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Interchange the absolutely convergent odd sums.
2. Expand the quadratic-reciprocity sign using the finite character table.
3. Use identity continuation from the nonempty overlap.

Prerequisites: `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`; `AnalyticNumberTheory:AN.8/double-functional-system`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### The reflection functional equation

Node: `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`. Declaration: `TauCeti.SeveralVariableZeta.quadratic_reflection_equation` (lemma).

The 16-vector continuation satisfies Z(s,w)=B(s)Z(1−s,s+w−1/2) as an equality of meromorphic germs.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Separate odd squarefree d0 and residue classes.
2. Use the primitive real-character functional equation and the deleted factor at2.
3. Observe that s+2w is invariant and that 2w and 2s+2w−1 are exchanged.

Prerequisites: `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`; `AnalyticNumberTheory:AN.8/double-functional-system`; `AnalyticNumberTheory:AN.1`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### The zero block that removes a false pole

Node: `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero`. Declaration: `TauCeti.SeveralVariableZeta.reflect_holomorphy_and_zero` (lemma).

After removing singularities, B(s) is holomorphic for Res<1, has polynomial vertical growth in bounded real strips, and its first four-dimensional block has B1(0)=0.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the gamma quotient with parity and the Euler factor ratio.
2. Cancel apparent denominators at their removable zeros.
3. At s=0 in the first block, the reciprocal gamma zero cancels the candidate transported pole.

Prerequisites: `AnalyticNumberTheory:AN.8/double-functional-system`; `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### Gluing the four continued tubes

Node: `AnalyticNumberTheory:AN.8/tube-overlap-gluing`. Declaration: `TauCeti.SeveralVariableZeta.tube_overlap_gluing` (lemma).

R2=α(R1)∪R1; R3=β(R2)∪R2; R4=α(R3)∪R3. The functional equations agree on their nonempty open overlaps and the gluing leaves possible poles only at s=1,w=1,s+w=3/2.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Check the explicit inequalities defining each tube, as on pp.363–364.
2. Use holomorphic uniqueness on the overlaps after multiplying by the three linear pole factors.
3. Use B1(0)=0 to remove the candidate s=0 hyperplane.

Prerequisites: `AnalyticNumberTheory:AN.8/double-R1-convergence`; `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`; `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`; `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### Filling the remaining real twelve-gon

Node: `AnalyticNumberTheory:AN.8/tube-hull-extension`. Declaration: `TauCeti.SeveralVariableZeta.tube_hull_extension` (lemma).

The pole-cleared continuation outside the bounded real twelve-gon extends holomorphically through it by the bounded tube-domain argument cited in Blomer from DGH03 Propositions4.6–4.7. The extension and its growth are a recorded several-complex-variable proof interface.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the exact twelve vertices listed on published p.364.
2. Multiply by ((s+10)(w+10))^(−C) on the annular real tube to obtain a bounded holomorphic function.
3. Apply the tube-hull extension with both real coordinates squared; E21 records the missing square in the final printed tube.

Prerequisites: `AnalyticNumberTheory:AN.8/tube-overlap-gluing`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

Open proof/interface leaves: Bounded tube-domain extension.

### Meromorphic continuation and the three polar hyperplanes

Node: `AnalyticNumberTheory:AN.8/double-series-continuation`. Declaration: `TauCeti.SeveralVariableZeta.double_series_continuation` (theorem). Planet: Double-series continuation.

For each pair of twists there is a continuation agreeing with the series in the initial tube such that (s−1)(w−1)(s+w−3/2)Z(s,w) is entire on C². In every bounded real strip it has polynomial growth in (1+|Ims|)(1+|Imw|). The two matrix functional equations hold as meromorphic identities; no scalar Euler product or multiple-zeta-value identification is asserted.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Remove the three candidate hyperplanes by multiplication.
2. Fill the tube hole using the preceding extension.
3. Recover the polynomial bound and use uniqueness to transport both equations.

Prerequisites: `AnalyticNumberTheory:AN.8/tube-hull-extension`; `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`; `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`.

Source: blomer-2011, §3, Lemma 2 and proof (27)–(36), pp.361–364.

### Binary-cubic local zeta integrals

Node: `AnalyticNumberTheory:AN.8/pvs-local-zeta`. Declaration: `TauCeti.SeveralVariableZeta.LocalIntegral` (construction). Planet: Prehomogeneous local zeta integral.

For a local field F, take V(F)=Sym³(F²) and its twisted GL2 action and discriminant P from ST.1. For a Schwartz–Bruhat test function Φ and fixed additive Haar measure dx, define the local integral over P(x)≠0 by ∫Φ(x)|P(x)|F^s dx on its proven integrability half-plane. For a nonarchimedean place with residue cardinal q and dx(O_F^4)=1, the shell density dk(U) is the measure of {x∈U:ord P(x)=k}; the resulting shell series is Σk≥0 dk(U)q^(−ks). Zero-discriminant mass is recorded separately.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Import the invariant/action and local field normalization rather than redefining them.
2. Restrict away from P=0 before forming complex powers.
3. Decompose an integral test function into disjoint measurable valuation shells and apply dominated summation.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.LocalIntegral.integral` (constructor): The displayed Haar integral on the nondegenerate locus.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shellDensity` (constructor): Haar measure of the kth discriminant-valuation shell.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shell_sum` (characterisation): For supported integral Φ with an absolutely integrable shell expansion, its integral equals the weighted shell sum.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.LocalIntegral.test_zero_test_function` (degenerate): The integral of Φ=0 is0.
- `TauCeti.SeveralVariableZeta.LocalIntegral.test_unit_support` (characterisation): When Φ is supported where |P|=1, the integral is ∫Φ dx, independently of s.
- `TauCeti.SeveralVariableZeta.LocalIntegral.test_linear_benchmark` (computation): For the one-variable linear invariant x on O_F, the normalized integral is (1−q^(−1))/(1−q^(−s−1)) for Res>−1; its shells have masses (1−q^(−1))q^(−k).

Prerequisites: `ArithmeticStatistics:ST.1`; `AutomorphicLFunctionsAndLocalFactors:AL.0`; `AdelicAlgebraicGroups:AA.2`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Binary-cubic local gamma and density tables; Native elaboration.

### Signature-refined cubic Shintani zeta functions

Node: `AnalyticNumberTheory:AN.8/cubic-shintani-series`. Declaration: `TauCeti.SeveralVariableZeta.CubicShintani` (construction). Planet: Cubic Shintani zeta function.

For a number field F and each archimedean cubic signature α, let ξF,α(s)=ΣR |Aut R|^(−1)|Disc R|^(−s), over isomorphism classes of locally free rank-three O_F-algebras with nonzero discriminant and signature α. Reducible rings and nonmaximal orders are retained. Define the dual series by the same weights on rings satisfying 3|tr(t) for every t. ST supplies the actual isomorphism classes, discriminants, trace and automorphism groups; AN.8 owns the analytic series.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Group the ST isomorphism classes by absolute discriminant norm, summing inverse stabilizer orders.
2. Preserve the archimedean signature and the trace-divisible dual subset.
3. Use absolute convergence only on Res>1 and distinguish the analytic continuation.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.CubicShintani.coefficient` (constructor): The coefficient at m is the sum of reciprocal automorphism orders for signature α and discriminant norm m.
- `TauCeti.SeveralVariableZeta.CubicShintani.series` (constructor): The weighted series ξF,α on Res>1.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual` (constructor): The trace-divisible subseries.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual_le` (relation): For real σ>1, 0≤ξhatF,α(σ)≤ξF,α(σ).

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.CubicShintani.test_split_weight` (computation): The contribution of O_F³ is weighted by1/6, not1.
- `TauCeti.SeveralVariableZeta.CubicShintani.test_zero_discriminant` (non-example): O_F[ε]/ε³ has zero discriminant and contributes no term.
- `TauCeti.SeveralVariableZeta.CubicShintani.test_dual_subseries` (compatibility): A ring violating 3|tr(t) is omitted by the dual selector, while its ordinary coefficient is unchanged.

Prerequisites: `ArithmeticStatistics:ST.0`; `ArithmeticStatistics:ST.1`; `AnalyticNumberTheory:AN.4`; `mathlib:LSeries`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: General O_F orbit-to-ring adapter; Native elaboration.

### The binary-cubic archimedean functional-equation matrix

Node: `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`. Declaration: `TauCeti.SeveralVariableZeta.ArchMatrix` (construction).

At a real place use row/column signatures F_v³ and F_v×C, with c11=c22=(1/2)sin(2πs), c12=(3/2)sin(πs), c21=(1/2)sin(πs). At a complex place the single coefficient is sin²(πs)sin(πs−π/6)sin(πs+π/6). Define cαβ(s) as the product over archimedean places. The degree is n=r1+2r2, not the number of places.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the real two-by-two table in Proposition3.7.
2. Use its complex scalar and tensor all archimedean local factors.
3. Track the cubic-signature order in each coordinate.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.ArchMatrix.realEntry` (constructor): The specified real two-by-two sine matrix.
- `TauCeti.SeveralVariableZeta.ArchMatrix.complexEntry` (constructor): The specified complex-place sine product.
- `TauCeti.SeveralVariableZeta.ArchMatrix.entry` (constructor): Product of the archimedean entries for signatures α,β.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.ArchMatrix.test_real_one` (computation): Each real entry vanishes at s=1.
- `TauCeti.SeveralVariableZeta.ArchMatrix.test_complex_order_two` (characterisation): The complex entry vanishes to order2 at s=1.
- `TauCeti.SeveralVariableZeta.ArchMatrix.test_tensor_degree` (compatibility): Every global entry vanishes to order at least r1+2r2 at s=1.

Prerequisites: `mathlib:Complex.cpow`; `AnalyticNumberTheory:AN.8/cubic-shintani-series`.

Source: loww-2025-analytic, §3.2, Proposition3.7(3), displayed sine coefficients, pp.12–13.

Open proof/interface leaves: Native elaboration.

### From arithmetic cubic orbits to analytic coefficients

Node: `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`. Declaration: `TauCeti.SeveralVariableZeta.cubic_orbit_to_coefficient` (comparison).

ST.1 Delone–Faddeev and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general O_F, nonprincipal locally free modules are included by the full adelic orbit interface.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the orbit bijection only over the base rings for which ST has proved it.
2. Match the inverse stabilizer factors and discriminants exactly.
3. Request the general-number-field adelic extension rather than treating all rank-three modules as free.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings`; `ArithmeticStatistics:ST.1/automorphisms-of-cubic-rings-are-stabilizers`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: General O_F orbit-to-ring adapter.

### Local density and coefficient conventions agree

Node: `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`. Declaration: `TauCeti.SeveralVariableZeta.local_density_coefficient_comparison` (comparison).

For a compact-open integral local condition U, the normalized binary-cubic Haar integral uses shell masses dk(U); its arithmetic coefficient condition is the ST-local orbit selector with the same discriminant valuation and inverse stabilizer convention. LD.3 specialization is invoked only for its proved residue-characteristic range; factors at2 and3 are kept separately.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Match the discriminant invariant before specializing motivic/local functions.
2. Use the measure dx(O_F^4)=1 to identify shell masses.
3. Record the orbit-dependent local normalizing constants and small-residue-characteristic cases as the next original-source leaves.

Prerequisites: `AnalyticNumberTheory:AN.8/pvs-local-zeta`; `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`; `LogicAndDefinabilityInNumberTheory:LD.3`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Binary-cubic local gamma and density tables.

### The selected adelic binary-cubic zeta integral

Node: `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`. Declaration: `TauCeti.SeveralVariableZeta.CubicAdelic` (construction).

With the ST binary-cubic representation and AA.2 quotient Haar measure, define Z(Φ,s)=∫GL2(F)\GL2(A_F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x) dg. Use the twisted action (g·f)(u,v)=det(g)^(−1)f((u,v)g), so Disc(g·f)=det(g)² Disc f. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted ξF,α times local zeta factors is a separate comparison and original-source gap.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Import the twisted action and discriminant covariance from ST.
2. Form the nondegenerate rational theta sum and the quotient integral with AA Haar conventions.
3. Prove convergence and orbit unfolding with exact local factors; those original-source leaves are recorded below.

Uses:
- `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SeveralVariableZeta.CubicAdelic.integral` (constructor): The quotient integral with |det g|^(2s) and the nonzero-discriminant theta sum.
- `TauCeti.SeveralVariableZeta.CubicAdelic.linear` (relation): Z(aΦ+bΨ,s)=aZ(Φ,s)+bZ(Ψ,s) when the summands are integrable.
- `TauCeti.SeveralVariableZeta.CubicAdelic.unfolding` (compatibility): Decompose by signatures and arithmetic orbit weights with the pinned local zeta factors.

Discriminating unit tests:
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_zero` (degenerate): Z(0,s)=0.
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_scaling` (compatibility): The discriminant character is det² for the chosen twisted action; this fixes the exponent2s.
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_singular_locus` (non-example): Degenerate binary cubics are excluded from the theta sum and return only as separately analyzed singular terms after Poisson.

Prerequisites: `AnalyticNumberTheory:AN.8/pvs-local-zeta`; `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`; `AutomorphicLFunctionsAndLocalFactors:AL.0`; `AdelicAlgebraicGroups:AA.2`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Global PVS unfolding and Poisson singular terms; Native carrier signatures; Native elaboration.

### Absolute convergence of cubic Shintani series

Node: `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`. Declaration: `TauCeti.SeveralVariableZeta.cubic_absolute_convergence` (lemma).

Every ξF,α(s) and dual series converges absolutely on Res>1.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the imported bounded-discriminant coefficient estimates.
2. Apply partial summation with a strict real-part margin.
3. Restrict the positive coefficients for the dual series.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### The cubic global matrix functional equation

Node: `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`. Declaration: `TauCeti.SeveralVariableZeta.cubic_global_functional_equation` (theorem).

Write n=[F:Q], D=|Disc F|. Then ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s). This is the exact global theorem of LOWW Proposition3.7(3), with the original Poisson/local source proof still a recorded gap.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the PVS Poisson and local Fourier interfaces, including singular terms.
2. Collect the explicit archimedean coefficients, gamma factors and discriminant normalization.
3. Identify the trace-divisible dual coefficients rather than replacing the dual series by the original.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`; `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`; `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`; `AnalyticNumberTheory:AN.4`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Original global analytic theorem.

### The two cubic poles and their residues

Node: `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`. Declaration: `TauCeti.SeveralVariableZeta.cubic_residues_and_entire_clearance` (theorem).

Let ρF=Res_s=1 ζF(s), rα the number of split real cubic factors, n=r1+2r2. Set AF=ζF(2)ρF/2^(r1+r2+1), BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n. ξF,α has at most simple poles1 and5/6, with residues AF(1+3^(−rα−r2)) and BF 3^(−rα/2). Its product with (s−1)(s−5/6) is entire of order1.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Separate the two singular-orbit contributions in the global zeta argument.
2. Match their normalizations with AF and BF in Proposition3.7.
3. Remove both possible simple poles and retain the order-one growth input from Wright.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`; `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `AnalyticNumberTheory:AN.4`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Original global analytic theorem.

### Archimedean coefficients vanish to degree order

Node: `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one`. Declaration: `TauCeti.SeveralVariableZeta.arch_entry_vanishing_at_one` (lemma).

Every cαβ(s) vanishes to order at least n=r1+2r2 at s=1; each real factor has order≥1 and each complex factor has order2.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Expand sin(πs) and sin(2πs) at1.
2. At a complex place only the squared sine vanishes; the shifted sine factors are nonzero.
3. Add orders under the finite product.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### The global prefactor is a unit at one

Node: `AnalyticNumberTheory:AN.8/gamma-unit-at-one`. Declaration: `TauCeti.SeveralVariableZeta.gamma_unit_at_one` (lemma).

The gamma/discriminant prefactor in the cubic functional equation is holomorphic and nonzero at s=1, since its gamma arguments are1,5/6 and7/6.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Check all three gamma arguments are positive at1.
2. Use gamma holomorphy and nonvanishing there.
3. Use positive-base exponential powers for the discriminant and3/π factors.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`; `mathlib:Complex.Gamma`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### The degree-dependent zero at the origin

Node: `AnalyticNumberTheory:AN.8/cubic-zero-at-origin`. Declaration: `TauCeti.SeveralVariableZeta.cubic_zero_at_origin` (theorem).

For n≥2, ξF,α(0)=0. More precisely the functional equation gives vanishing order at least n−1 at0, since each dual series has at most a simple pole at1.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Multiply the order-n archimedean zero by the possible order-one dual pole.
2. The global prefactor is a local unit at1.
3. Replace s by1−s; for n=1 no forced zero is claimed.

Prerequisites: `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one`; `AnalyticNumberTheory:AN.8/gamma-unit-at-one`; `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`; `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### Orders in a fixed étale cubic algebra

Node: `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`. Declaration: `TauCeti.SeveralVariableZeta.cubic_orders_generating_series` (theorem).

For an étale cubic F-algebra A, let an(A) count O_F-orders in O_A of relative index norm n. Then Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s) in a right half-plane. The exponent2s encodes discriminant multiplication by index².

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the local order enumeration supplied by Datskovsky–Wright Theorem6.2.
2. Multiply local factors in their common convergence domain.
3. Retain the index-squared exponent; converting to an index Dirichlet variable requires substituting s/2.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `ArithmeticStatistics:ST.1`; `AnalyticNumberTheory:AN.4`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

Open proof/interface leaves: Local order enumeration.

### The weighted cubic-coefficient bound

Node: `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`. Declaration: `TauCeti.SeveralVariableZeta.cubic_reducible_and_field_coefficient_bound` (lemma).

For every ε>0 and real σ>3/2, ξF,α(σ)≪[F:Q],σ,ε D^(1/2+ε)h2(F). Prove the separate split/quadratic-factor and cubic-field contributions using LOWW Lemma3.5 and the orders formula; the field-count input remains with ST.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Decompose cubic étale algebras into split, quadratic-factor and cubic-field types.
2. Use the appropriate discriminant/count bound for each.
3. Sum the order-index factor with σ>3/2 and retain h2(F).

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`; `AnalyticNumberTheory:AN.8/cubic-shintani-series`; `ArithmeticStatistics:ST.3`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### Reflected vertical bound from the matrix equation

Node: `AnalyticNumberTheory:AN.8/cubic-reflected-bound`. Declaration: `TauCeti.SeveralVariableZeta.cubic_reflected_bound` (lemma).

For σ<−1/2 and |t|≥1, the functional equation gives ξF,α(σ+it)≪ε,n,σ h2(F)D^(2−4σ+ε)(1+|t|)^(n(2−4σ)+ε), using the right-half-plane dual bound. Constants depend on the fixed real strip.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Bound the dual by the ordinary positive-coefficient series at1−σ>3/2.
2. Apply Stirling to the gamma factors and combine with sine growth.
3. Keep h2(F), D^(2−4σ) and the height power.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`; `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

### Pole-aware cubic convexity bound

Node: `AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity`. Declaration: `TauCeti.SeveralVariableZeta.cubic_pole_cleared_convexity` (theorem).

For −1/2≤σ≤3/2, |t|≥1 and ε>0, ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε). Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at s=1 and5/6; the accepted LOWW erratum route already records that restriction.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the positive-half-plane estimate at σ=3/2+ε and the reflected left estimate.
2. Clear (s−1)(s−5/6) before interpolation and divide only where bounded away from both poles.
3. Retain the same h2 factor on both edges.

Prerequisites: `AnalyticNumberTheory:AN.8/cubic-reflected-bound`; `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`; `AnalyticNumberTheory:AN.2`; `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`.

Source: loww-2025-analytic, §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

## AnalyticNumberTheory:AN.9

### The ax+b groups P⁺_ℚ and P⁺_ℤ inside GL₂(ℚ)

Node: `AnalyticNumberTheory:AN.9/ax-plus-b-pair`. Declaration: `TauCeti.BostConnes.axbRat` (construction).

Inside G = GL₂(ℚ) (Mathlib's Matrix.GeneralLinearGroup (Fin 2) ℚ), let axbRat = P⁺_ℚ be the subgroup of matrices [1 b; 0 a] with a, b ∈ ℚ and a > 0, and axbInt = P⁺_ℤ the subgroup of matrices [1 n; 0 1] with n ∈ ℤ. The (2,2) entry is a homomorphism axbRat →* ℚ_{>0} (written a(g)); translation b ↦ [1 b; 0 1] and dilation a ↦ [1 0; 0 a] are the two families of named elements. For g = [1 b; 0 a], conjugation gives g [1 n; 0 1] g⁻¹ = [1 n/a; 0 1], so g P⁺_ℤ g⁻¹ is the translation subgroup by (1/a)ℤ.

Hypotheses: None.

Proof or construction:
1. Closure: [1 b; 0 a]·[1 b′; 0 a′] = [1, b′ + b a′; 0, a a′], again with positive (2,2) entry, and the inverse of [1 b; 0 a] is [1, −b/a; 0, 1/a].
2. P⁺_ℤ ≤ P⁺_ℚ, and the (2,2) entry is multiplicative by the product formula.
3. Conjugation: [1 b; 0 a][1 n; 0 1] = [1, n + b; 0, a], and multiplying by [1, −b/a; 0, 1/a] gives [1, n/a; 0, 1].

Uses:
- `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`: The pair is a Hecke pair.
- `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`: Its Hecke ring is the Bost–Connes algebra.
- `AnalyticNumberTheory:AN.9/time-evolution`: The (2,2) entry a(g) defines the time evolution.
- `AnalyticNumberTheory:AN.9`: The whole Bost–Connes branch is built on this pair.

API:
- `TauCeti.BostConnes.axbRat` (constructor): P⁺_ℚ : Subgroup (GL (Fin 2) ℚ), the matrices [1 b; 0 a] with a > 0.
- `TauCeti.BostConnes.axbInt` (constructor): P⁺_ℤ : Subgroup (GL (Fin 2) ℚ), the matrices [1 n; 0 1] with n ∈ ℤ.
- `TauCeti.BostConnes.mem_axbRat_iff` (characterisation): g ∈ axbRat ↔ g 1 0 = 0 ∧ g 0 0 = 1 ∧ 0 < g 1 1.
- `TauCeti.BostConnes.axbInt_le_axbRat` (relation): axbInt ≤ axbRat.
- `TauCeti.BostConnes.diagEntry` (projection): The (2,2) entry as a homomorphism axbRat →* ℚˣ with positive values (diagEntry_pos), diagEntry (dilation a) = a and diagEntry (translation b) = 1.
- `TauCeti.BostConnes.translation` (constructor): translation b = [1 b; 0 1] ∈ axbRat, a homomorphism from Multiplicative ℚ.
- `TauCeti.BostConnes.dilation` (constructor): dilation a = [1 0; 0 a] ∈ axbRat for a > 0.
- `TauCeti.BostConnes.conj_translation` (relation): g · translation n · g⁻¹ = translation (n / diagEntry g).

Discriminating unit tests:
- `TauCeti.BostConnes.translation_half_mem_axbRat_not_mem_axbInt` (computation): translation (1/2) ∈ axbRat and translation (1/2) ∉ axbInt.
- `TauCeti.BostConnes.not_mem_axbRat_neg_diag` (non-example): The matrix [1 0; 0 −1] is invertible but not in axbRat: the positivity of a is part of the definition.
- `TauCeti.BostConnes.axbInt_not_normal` (non-example): axbInt is not a normal subgroup of axbRat (conjugate translation 1 by dilation 2).
- `TauCeti.BostConnes.diagEntry_mul_example` (computation): diagEntry ([1 1; 0 2] · [1 1/3; 0 3]) = 6.

Prerequisites: `mathlib:Matrix.GeneralLinearGroup`; `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero`; `mathlib:Subgroup.Normal`.

Source: connes-marcolli-2008, Ch. 3, §4.2, (3.61)–(3.65), p. 460; bost-connes-1995, §4, notations (α), (β), p. 431 (PDF p. 21).

Open proof/interface leaves: Native elaboration.

### (P⁺_ℚ, P⁺_ℤ) is a Hecke pair

Node: `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`. Declaration: `TauCeti.BostConnes.isHeckeTriple_axb` (theorem).

IsHeckeTriple (axbRat as a submonoid) axbInt axbInt: every g ∈ P⁺_ℚ commensurates P⁺_ℤ. Explicitly, for a(g) = n/m in lowest terms, P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ is the translation group by mℤ, of index m in P⁺_ℤ and index n in g P⁺_ℤ g⁻¹. Equivalently (Bost–Connes' condition), the orbits of P⁺_ℤ on P⁺_ℚ/P⁺_ℤ are finite.

Hypotheses: None.

Proof or construction:
1. By B.9/ax-plus-b-pair, g P⁺_ℤ g⁻¹ is translation by (m/n)ℤ, and ℤ ∩ (m/n)ℤ = mℤ because gcd(m, n) = 1.
2. The two indices are [ℤ : mℤ] = m and [(m/n)ℤ : mℤ] = n, both finite, so g lies in the commensurator of P⁺_ℤ.
3. IsHeckeTriple.of_diagonal applies with H = P⁺_ℤ ≤ P⁺_ℚ.

Prerequisites: `AnalyticNumberTheory:AN.9/ax-plus-b-pair`; `mathlib:IsHeckeTriple`; `mathlib:IsHeckeTriple.of_diagonal`; `mathlib:Subgroup.Commensurable`; `mathlib:Subgroup.relIndex`.

Source: connes-marcolli-2008, Ch. 3, §4.2, (3.62), p. 460.

### Double cosets of the ax+b pair and their degrees

Node: `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`. Declaration: `TauCeti.BostConnes.degree_heckeCoset_eq_den` (lemma).

For g = [1 b; 0 a] ∈ P⁺_ℚ with a = n/m in lowest terms, the double coset P⁺_ℤ g P⁺_ℤ consists of the [1 b′; 0 a] with b′ ≡ b mod (1/m)ℤ. Hence the (2,2) entry a(X) of a double coset X is well defined, and X ↦ (a(X), b mod (1/m)ℤ) is a bijection from P⁺_ℤ\P⁺_ℚ/P⁺_ℤ onto pairs (a, class of b in ℚ/(1/den a)ℤ). Its degree (Tau Ceti's HeckeCoset.degree, the number of left cosets hP⁺_ℤ in X) is L(X) = den a(X), and the degree of the inverse double coset is R(X) = num a(X), so L(X)/R(X) = a(X)⁻¹.

Hypotheses: None.

Proof or construction:
1. Left multiplication by [1 k; 0 1] sends [1 b; 0 a] to [1, b + ka; 0, a] and right multiplication by [1 j; 0 1] sends it to [1, b + j; 0, a]; so the double coset is b mod ℤ + aℤ = (1/m)ℤ, with a unchanged.
2. HeckeCoset.degree_eq_relIndex: the degree is the index of P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ in P⁺_ℤ, which is m by B.9/ax-plus-b-hecke-triple; the inverse double coset has (2,2) entry 1/a = m/n, so its degree is n.

Prerequisites: `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`; `tauceti:HeckeCoset.degree`; `tauceti:HeckeCoset.degree_eq_relIndex`; `mathlib:HeckeCoset`; `mathlib:HeckeCoset.mk`; `mathlib:Rat.num_div_den`.

Source: connes-marcolli-2008, Ch. 3, §4.2, (3.71)–(3.72), p. 461.

### The Bost–Connes Hecke algebra

Node: `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`. Declaration: `TauCeti.BostConnes.BCHecke` (definition). Planet: Bost–Connes Hecke algebra.

For a field K of characteristic zero, the Bost–Connes Hecke algebra is BCHecke K = 𝕋 P⁺_ℚ P⁺_ℤ K, Tau Ceti's Hecke ring of the Hecke pair of B.9/ax-plus-b-hecke-triple with coefficients in K: finitely supported K-valued functions on double cosets, with Shimura's convolution product. Its product is the Bost–Connes convolution (f₁ ∗ f₂)(g) = Σ_{g₁ ∈ Γ/Γ₀} f₁(g₁) f₂(g₁⁻¹g) (BC (1)), because Tau Ceti's multiplicity counts pairs of left-coset representatives. K = ℚ gives the rational Hecke algebra H_ℚ(Γ, Γ₀) of ℚ-valued functions, and K = ℂ gives BC's H. The named elements are x_n = [X_n] with X_n the class of dilation n, x′_n = [X_n⁻¹] the class of dilation (1/n), and e(γ) = [class of translation γ] for γ ∈ ℚ/ℤ. For K = ℂ the involution is f*(X) = conj f(X⁻¹), which sends x_n to x′_n and e(γ) to e(−γ).

Hypotheses: K a field of characteristic zero (for the involution, K = ℂ).

Proof or construction:
1. The ring structure is Tau Ceti's HeckeCosetModule.instRingHeckeRing for the Hecke triple of B.9/ax-plus-b-hecke-triple; the K-algebra structure is the coefficientwise scalar action.
2. Agreement with BC's convolution: for double cosets D₁ = Γ₀gΓ₀ = ⊔ σᵢgΓ₀ and D₂ = Γ₀hΓ₀ = ⊔ τⱼhΓ₀, (1_{D₁} ∗ 1_{D₂})(d) counts the i with d ∈ σᵢ g D₂, and for each such i exactly one j has dΓ₀ = σᵢ g τⱼ h Γ₀; this is Tau Ceti's multiplicity m(g, h; d).
3. e(γ) depends only on γ mod ℤ, since the class of translation b is b mod ℤ + 1·ℤ (B.9/double-cosets-and-degrees).
4. The involution: Γ is a group, so X ↦ X⁻¹ is an involution of the double cosets that reverses products (the multiplicity of (h⁻¹, g⁻¹; d⁻¹) equals that of (g, h; d), with degrees exchanged as in BC (2)); with complex conjugation of coefficients it is a conjugate-linear anti-automorphism.

Uses:
- `AnalyticNumberTheory:AN.9/rational-presentation`: Presented by the x_n, x′_n and e(γ).
- `AnalyticNumberTheory:AN.9/time-evolution`: The time evolution acts on it.
- `AnalyticNumberTheory:AN.9/regular-representation`: It acts on ℓ²(ℕ≥1).
- `AnalyticNumberTheory:AN.9/kms-states`: KMS states are states on it.
- `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`: Its ℚ-form carries the arithmetic of the ground states.

API:
- `TauCeti.BostConnes.BCHecke` (constructor): BCHecke K := HeckeRing axbRat.toSubmonoid axbInt K, with Ring and Algebra K instances.
- `TauCeti.BostConnes.BCHecke.x` (constructor): x n = single [X_n] for n : ℕ+, X_n the double coset of dilation n.
- `TauCeti.BostConnes.BCHecke.x'` (constructor): x' n = single [X_n⁻¹], the double coset of dilation (1/n).
- `TauCeti.BostConnes.BCHecke.e` (constructor): e : ℚ/ℤ → BCHecke K (AddCircle (1 : ℚ) as ℚ/ℤ), e γ = single [class of translation γ].
- `TauCeti.BostConnes.BCHecke.e_zero` (simp): e 0 = 1.
- `TauCeti.BostConnes.BCHecke.e_add` (relation): e (γ + δ) = e γ * e δ.
- `TauCeti.BostConnes.BCHecke.mul_eq_convolution` (compatibility): (f₁ * f₂) evaluated at the class of d is Σ over left cosets g₁Γ₀ of f₁(g₁) f₂(g₁⁻¹d): Tau Ceti's product is Bost–Connes' convolution (1).
- `TauCeti.BostConnes.BCHecke.star` (structure): For K = ℂ: a StarRing structure with (star f) X = conj (f X⁻¹), star (x n) = x' n, star (e γ) = e (−γ).
- `TauCeti.BostConnes.BCHecke.map` (functoriality): A field homomorphism φ:K→L induces a ring homomorphism on coefficients, compatible with x, x′ and e. If an algebra structure on L induced by φ is supplied it is a K-algebra homomorphism. The rational inclusion is injective.

Discriminating unit tests:
- `TauCeti.BostConnes.e_half_mul_self` (computation): e (1/2) * e (1/2) = 1 in BCHecke ℚ.
- `TauCeti.BostConnes.x'_mul_x_two` (computation): x' 2 * x 2 = 2 in BCHecke ℚ: the two left cosets of X₂⁻¹ both multiply into the identity coset.
- `TauCeti.BostConnes.x_mul_x'_two` (computation): x 2 * x' 2 = 1 + e (1/2) in BCHecke ℚ, so x 2 is not invertible.
- `TauCeti.BostConnes.not_commute_e_half_x_two` (non-example): e (1/2) * x 2 ≠ x 2 * e (1/2): the algebra is not commutative, unlike the GL₂ Hecke rings.
- `TauCeti.BostConnes.x_one` (degenerate): x 1 = 1 and x' 1 = 1.

Prerequisites: `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`; `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`; `mathlib:HeckeRing`; `mathlib:HeckeCosetModule`; `tauceti:HeckeCosetModule.instRingHeckeRing`; `tauceti:HeckeCosetModule.single`; `tauceti:HeckeCosetModule.mul_single_single`; `mathlib:AddCircle`.

Source: connes-marcolli-2008, Ch. 3, §4.2, (3.61)–(3.65), p. 460; bost-connes-1995, §4, proof of Proposition 18, formulas (1)–(2), p. 431 (PDF p. 21); bost-connes-1995, §4, notations (α), (β), p. 431 (PDF p. 21).

Open proof/interface leaves: Native elaboration.

### The presentation of the rational Bost–Connes algebra

Node: `AnalyticNumberTheory:AN.9/rational-presentation`. Declaration: `TauCeti.BostConnes.BCHecke.presentation` (theorem).

In BCHecke K the elements x_n, x′_n (n ∈ ℕ≥1) and e(γ) (γ ∈ ℚ/ℤ) satisfy: (a′) x′_n x_n = n; (b′) x_{nm} = x_n x_m and x′_{nm} = x′_n x′_m; (c′) x_n x′_m = x′_m x_n when gcd(n, m) = 1; (d′) e(0) = 1 and e(γ₁ + γ₂) = e(γ₁)e(γ₂); (e′) e(γ) x_n = x_n e(nγ); (f′) x_n e(γ) x′_n = Σ_{δ ∈ ℚ/ℤ, nδ = γ} e(δ). For coprime n, m and γ ∈ ℚ/ℤ, x_n e(γ) x′_m = [class of [1 γ/m; 0 n/m]], and these elements form a K-basis. Consequently the K-algebra with generators X_n, X′_n, E_γ and relations (a′)–(f′) maps isomorphically onto BCHecke K. Over ℂ, μ_n := n^{−1/2}x_n and μ*_n := n^{−1/2}x′_n satisfy Bost–Connes' relations (a)–(f) of Proposition 18 with μ*_n the adjoint of μ_n.

Hypotheses: K a field of characteristic zero.

Proof or construction:
1. Each relation is a computation of Tau Ceti multiplicities with the left-coset decompositions of B.9/double-cosets-and-degrees. For (a′): X_n⁻¹ = ⊔_{j<n} [1, j/n; 0, 1/n]P⁺_ℤ and each [1, j/n; 0, 1/n]·[1 0; 0 n] = [1 j; 0 1] ∈ P⁺_ℤ, so the identity coset has multiplicity n.
2. Basis: e(γ)·x′_m is supported on the single class of [1 γ/m; 0 1/m] with multiplicity one (the products [1 γ; 0 1][1, j/m; 0, 1/m] = [1, (γ + j)/m; 0, 1/m] meet the left coset of [1 γ/m; 0 1/m] only for j = 0), and left multiplication by x_n multiplies the (2,2) entry by n without changing the coset of b; so x_n e(γ) x′_m = [class of [1 γ/m; 0 n/m]].
3. The map (n, m, γ) ↦ class of [1 γ/m; 0 n/m], over coprime n, m and γ ∈ ℚ/ℤ, is a bijection onto the double cosets (B.9/double-cosets-and-degrees: a = n/m, and γ/m mod (1/m)ℤ determines γ mod ℤ), so these elements are a basis.
4. Presentation: in the abstract algebra, the relations rewrite every word as a combination of monomials X_n E_γ X′_m with gcd(n, m) = 1 (BC's argument on p. 433, rescaled); the images of these monomials are the basis above, so the surjection is injective.
5. Rescaling over ℂ: substituting x_n = n^{1/2}μ_n and x′_n = n^{1/2}μ*_n turns (a′)–(f′) into BC (a)–(f).

Prerequisites: `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`; `tauceti:HeckeCosetModule.single_mul_single`; `tauceti:HeckeCosetModule.mul_single_single`; `AnalyticNumberTheory:AN.9/bc-normal-form-product`; `AnalyticNumberTheory:AN.9/bc-normal-form-independent`.

Source: bost-connes-1995, §4, Proposition 18, p. 431 (PDF p. 21); bost-connes-1995, §4, proof of Proposition 18, formula (7), p. 433 (PDF p. 23); corrected as AnalyticNumberTheory/E14; connes-marcolli-2008, Ch. 3, §4, Proposition 3.23, p. 457.

### The two rational forms of the Bost–Connes algebra

Node: `AnalyticNumberTheory:AN.9/rational-forms-comparison`. Declaration: `TauCeti.BostConnes.sigma_neg_half_I_map_rationalForm` (comparison).

Inside BCHecke ℂ there are two ℚ-forms. (i) H_ℚ, the ℚ-valued functions (the image of BCHecke ℚ), spanned by the double cosets [X] = x_n e(γ) x′_m. (ii) Bost–Connes' rational algebra A_ℚ, the ℚ-span of the monomials t_{n,m,γ} = μ_n e(γ) μ*_m = (nm)^{−1/2}[X]; this is Connes–Marcolli's A_{1,ℚ}. They are different subsets (μ₂ = 2^{−1/2}x₂ ∉ H_ℚ), and the complexified time evolution at z = −i/2, σ_{−i/2}(f)(X) = a(X)^{1/2} f(X), is a ℂ-algebra automorphism of BCHecke ℂ carrying A_ℚ onto H_ℚ, with μ_n ↦ x_n and μ*_n ↦ x′_n/n. It is not a *-map. Statements about 'the rational subalgebra' are pinned to one of the two forms.

Hypotheses: None.

Proof or construction:
1. t_{n,m,γ} = (nm)^{−1/2}[X] with a(X) = n/m (B.9/rational-presentation), and σ_{−i/2} multiplies [X] by (n/m)^{1/2}; the product is m^{−1}[X], a rational multiple of a basis element, and every basis element arises. So σ_{−i/2}(A_ℚ) = H_ℚ.
2. σ_{−i/2} is multiplicative because a is multiplicative on the structure constants (B.9/time-evolution).

Prerequisites: `AnalyticNumberTheory:AN.9/rational-presentation`; `AnalyticNumberTheory:AN.9/time-evolution`.

Source: connes-marcolli-2008, Ch. 3, §4.2, Proposition 3.25, p. 461; bost-connes-1995, §4, after the proof of Proposition 18, p. 433 (PDF p. 23); bost-connes-1995, §4, notations (α), (β), p. 431 (PDF p. 21).

### The Bost–Connes time evolution

Node: `AnalyticNumberTheory:AN.9/time-evolution`. Declaration: `TauCeti.BostConnes.timeEvolution` (construction).

For z ∈ ℂ let σ_z : BCHecke ℂ → BCHecke ℂ be σ_z(f)(X) = a(X)^{iz} f(X), where a(X) ∈ ℚ_{>0} is the (2,2) entry of the double coset (B.9/double-cosets-and-degrees) and a^{iz} = exp(iz log a). Each σ_z is a ℂ-algebra automorphism, σ_0 = id and σ_{z+w} = σ_z σ_w; for real t, σ_t is a *-automorphism. On generators σ_z(x_n) = n^{iz}x_n, σ_z(x′_n) = n^{−iz}x′_n and σ_z(e(γ)) = e(γ). For real t this is Bost–Connes' σ_t(f)(γ) = (L(γ)/R(γ))^{−it} f(γ), because L(X)/R(X) = a(X)⁻¹.

Hypotheses: None.

Proof or construction:
1. a is well defined on double cosets and multiplicative on structure constants: m(g, h; d) ≠ 0 forces a(d) = a(g)a(h), since a is a homomorphism on P⁺_ℚ that is trivial on P⁺_ℤ.
2. Hence σ_z(f₁f₂) = σ_z(f₁)σ_z(f₂) on basis elements, σ_z is invertible with inverse σ_{−z}, and σ_{z+w} = σ_zσ_w.
3. For real t, a(X⁻¹) = a(X)⁻¹ and |a^{it}| = 1 give σ_t(f*) = σ_t(f)*.
4. L(X)/R(X) = den a / num a = a⁻¹ (B.9/double-cosets-and-degrees), so (L/R)^{−it} = a^{it}.

Uses:
- `AnalyticNumberTheory:AN.9/kms-states`: The KMS condition is taken with respect to σ at z = iβ.
- `AnalyticNumberTheory:AN.9/regular-representation`: Implemented by the Hamiltonian: π(σ_t f) = e^{itH}π(f)e^{−itH}.
- `AnalyticNumberTheory:AN.9/rational-forms-comparison`: σ_{−i/2} exchanges the two rational forms.
- `AnalyticNumberTheory:AN.9/symmetry-action`: Commutes with the symmetries.

API:
- `TauCeti.BostConnes.timeEvolution` (constructor): timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ, with (timeEvolution z f) X = (a X : ℂ)^(I * z) * f X.
- `TauCeti.BostConnes.timeEvolution_zero` (simp): timeEvolution 0 = AlgEquiv.refl.
- `TauCeti.BostConnes.timeEvolution_add` (relation): timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w).
- `TauCeti.BostConnes.timeEvolution_x` (simp): timeEvolution z (x n) = (n : ℂ)^(I * z) • x n.
- `TauCeti.BostConnes.timeEvolution_x'` (simp): timeEvolution z (x' n) = (n : ℂ)^(−(I * z)) • x' n.
- `TauCeti.BostConnes.timeEvolution_e` (simp): timeEvolution z (e γ) = e γ.
- `TauCeti.BostConnes.timeEvolution_star` (compatibility): For real t, timeEvolution t (star f) = star (timeEvolution t f).
- `TauCeti.BostConnes.timeEvolution_eq_LR` (characterisation): For real t, (timeEvolution t f) X = ((L X : ℂ) / R X)^(−(I * t)) * f X with L, R the degrees of X and X⁻¹ (Bost–Connes (3.71)).

Discriminating unit tests:
- `TauCeti.BostConnes.timeEvolution_x_two` (computation): timeEvolution t (x 2) = 2^(I t) • x 2.
- `TauCeti.BostConnes.timeEvolution_x_mul_x'` (computation): timeEvolution z (x 2 * x' 2) = x 2 * x' 2, as it must be since x 2 * x' 2 = 1 + e (1/2) has a = 1.
- `TauCeti.BostConnes.not_multiplicative_left_degree_only` (non-example): f ↦ (X ↦ L(X)^(it) f(X)) is not multiplicative: it fixes x 2 * x' 2 = 1 + e(1/2) (all L = 1) but multiplies x' 2 by 2^(it) and fixes x 2.
- `TauCeti.BostConnes.timeEvolution_neg_half_I` (compatibility): timeEvolution (−I/2) ((n : ℂ)^(−1/2) • x n) = x n: σ_{−i/2} takes BC's μ_n to x_n (B.9/rational-forms-comparison).

Prerequisites: `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`; `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `mathlib:Complex.cpow`.

Source: connes-marcolli-2008, Ch. 3, §4.1, Lemma 3.24, (3.60), p. 459; connes-marcolli-2008, Ch. 3, §4.2, (3.71)–(3.72), p. 461.

Open proof/interface leaves: Native elaboration.

### The representation on ℓ²(ℕ≥1) and its Hamiltonian

Node: `AnalyticNumberTheory:AN.9/regular-representation`. Declaration: `TauCeti.BostConnes.regularRep` (construction).

Let ℓ² = ℓ²(ℕ≥1) (Mathlib's lp (fun _ : ℕ+ ↦ ℂ) 2) with orthonormal basis (ε_k). For u ∈ Aut(ℚ/ℤ) ≅ Ẑ^× define π_u : BCHecke ℂ → B(ℓ²) by π_u(x_n)ε_k = n^{1/2}ε_{nk}, π_u(x′_n)ε_k = n^{1/2}ε_{k/n} if n | k and 0 otherwise, π_u(e(γ))ε_k = exp(2πi k·u(γ))ε_k. Then π_u is a unital *-representation by bounded operators, with π_u(μ_n)ε_k = ε_{nk} for BC's μ_n = n^{−1/2}x_n. The Hamiltonian H is the self-adjoint operator Hε_k = log(k)ε_k, and π_u(σ_t f) = e^{itH}π_u(f)e^{−itH} for real t.

Hypotheses: u ∈ Aut(ℚ/ℤ); H is unbounded, with domain the k with Σ log(k)²|c_k|² < ∞.

Proof or construction:
1. The operators are bounded: π_u(μ_n) is an isometry, π_u(μ*_n) its adjoint, and π_u(e(γ)) is diagonal unitary.
2. They satisfy (a′)–(f′) of B.9/rational-presentation. For (f′): π_u(x_n e(γ) x′_n)ε_k = n·[n | k]·exp(2πi (k/n)u(γ))ε_k, and Σ_{nδ=γ} exp(2πi k u(δ)) = n·[n | k]·exp(2πi (k/n)u(γ)) by summing the n-th roots of unity. So the presentation defines π_u as an algebra map.
3. Implementation: e^{itH}π_u(x_n)e^{−itH}ε_k = n^{1/2}k^{−it}(nk)^{it}ε_{nk} = n^{it}π_u(x_n)ε_k, matching σ_t(x_n) = n^{it}x_n; the e(γ) commute with H.

Uses:
- `AnalyticNumberTheory:AN.9/partition-function`: e^{−βH} gives the partition function ζ(β).
- `AnalyticNumberTheory:AN.9/gibbs-states`: The Gibbs states are traces in this representation.
- `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`: The ground states are vector states at ε₁.

API:
- `TauCeti.BostConnes.regularRep` (constructor): regularRep (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₐ[ℂ] (ℓ²(ℕ+) →L[ℂ] ℓ²(ℕ+)).
- `TauCeti.BostConnes.regularRep_x` (simp): regularRep u (x n) (single k 1) = (n : ℂ)^(1/2 : ℂ) • single (n * k) 1.
- `TauCeti.BostConnes.regularRep_e` (simp): regularRep u (e γ) (single k 1) = exp (2π I k u(γ)) • single k 1.
- `TauCeti.BostConnes.regularRep_star` (compatibility): regularRep u (star f) = (regularRep u f)† (adjoint).
- `TauCeti.BostConnes.hamiltonianExp` (constructor): hamiltonianExp β hβ = e^{−βH}, the bounded diagonal operator ε_k ↦ k^{−β} ε_k for β > 0; H itself is the unbounded self-adjoint diagonal operator ε_k ↦ log(k) ε_k.
- `TauCeti.BostConnes.regularRep_timeEvolution` (compatibility): π_u(σ_t f) = e^{itH} π_u(f) e^{−itH}, stated through matrix coefficients: ⟨ε_j, π_u(σ_t f) ε_k⟩ = (j/k)^{it} ⟨ε_j, π_u(f) ε_k⟩.

Discriminating unit tests:
- `TauCeti.BostConnes.regularRep_x_mul_x'_two` (computation): regularRep u (x 2 * x' 2) (single k 1) = (if 2 ∣ k then 2 else 0) • single k 1.
- `TauCeti.BostConnes.regularRep_one` (degenerate): regularRep u 1 = 1.
- `TauCeti.BostConnes.regularRep_mu_isometry` (compatibility): The operator 2^(−1/2) • regularRep u (x 2) is an isometry, BC's π(μ₂).
- `TauCeti.BostConnes.regularRep_x'_one_zero` (non-example): regularRep u (x' 2) (single 1 1) = 0: x′₂ is not injective in the representation, so it has no inverse.

Prerequisites: `AnalyticNumberTheory:AN.9/rational-presentation`; `AnalyticNumberTheory:AN.9/time-evolution`; `mathlib:lp`; `mathlib:HilbertBasis`; `mathlib:Real.log`; `mathlib:PNat`.

Source: connes-marcolli-2008, Ch. 3, §4.6, (3.140)–(3.141), p. 475.

Open proof/interface leaves: Native elaboration.

### The partition function is the Riemann zeta function

Node: `AnalyticNumberTheory:AN.9/partition-function`. Declaration: `TauCeti.BostConnes.tsum_hamiltonian_eq_riemannZeta` (theorem).

For β>1, the diagonal sum of e^(−βH) in the positive-integer basis is Σ k^(−β)=ζ(β). The positive scalar series diverges for β≤1. The state-classification theorem, rather than this scalar identity alone, establishes the phase transition at β=1.

Hypotheses: β ∈ ℝ; the trace is taken as the diagonal sum in the basis (ε_k).

Proof or construction:
1. e^{−βH}ε_k = k^{−β}ε_k, so the diagonal sum is Σ k^{−β}.
2. For β > 1 this is riemannZeta β (zeta_eq_tsum_one_div_nat_cpow); for β ≤ 1 the series diverges by comparison with the harmonic series.

Prerequisites: `AnalyticNumberTheory:AN.9/regular-representation`; `mathlib:riemannZeta`; `mathlib:zeta_eq_tsum_one_div_nat_cpow`.

Source: connes-marcolli-2008, Ch. 3, §4.6, (3.142), p. 476; connes-marcolli-2008, Ch. 3, §4.6, (3.140)–(3.141), p. 475.

### The Gibbs states φ_{β,u}

Node: `AnalyticNumberTheory:AN.9/gibbs-states`. Declaration: `TauCeti.BostConnes.gibbsState` (construction).

For real β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u}(f) = ζ(β)⁻¹ Σ_{k≥1} k^{−β}⟨ε_k, π_u(f)ε_k⟩ is a state on BCHecke ℂ: linear, φ_{β,u}(1) = 1 and φ_{β,u}(f*f) ≥ 0. On the basis, φ_{β,u}(x_n e(γ) x′_m) = 0 unless n = m, and φ_{β,u}(e(γ)) = ζ(β)⁻¹ Σ_k k^{−β} exp(2πi k u(γ)) = Li_β(exp(2πi u(γ)))/ζ(β), with Li_β(z) = Σ_{k≥1} z^k/k^β.

Hypotheses: β > 1; u ∈ Aut(ℚ/ℤ).

Proof or construction:
1. The series converges absolutely because |⟨ε_k, π_u(f)ε_k⟩| ≤ ‖π_u(f)‖ and Σ k^{−β} = ζ(β) < ∞ (B.9/partition-function).
2. Positivity: each ⟨ε_k, π_u(f*f)ε_k⟩ = ‖π_u(f)ε_k‖² ≥ 0.
3. Off-diagonal vanishing: π_u(x_n e(γ) x′_m) sends ε_k to a multiple of ε_{nk/m}, orthogonal to ε_k unless n = m.

Uses:
- `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`: They are KMS_β states.
- `AnalyticNumberTheory:AN.9/kms-classification`: They are the extremal KMS_β states for β > 1.
- `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`: Their limits as β → ∞ are the ground states.

API:
- `TauCeti.BostConnes.gibbsState` (constructor): gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₗ[ℂ] ℂ.
- `TauCeti.BostConnes.gibbsState_one` (simp): gibbsState β hβ u 1 = 1.
- `TauCeti.BostConnes.gibbsState_star_mul_self_nonneg` (other): 0 ≤ gibbsState β hβ u (star f * f) (a nonnegative real).
- `TauCeti.BostConnes.gibbsState_e` (characterisation): gibbsState β hβ u (e γ) = (Σ' k : ℕ+, exp (2π I k u(γ)) / k^β) / riemannZeta β.
- `TauCeti.BostConnes.gibbsState_basis_of_ne` (other): gibbsState β hβ u (x n * e γ * x' m) = 0 for n ≠ m.

Discriminating unit tests:
- `TauCeti.BostConnes.gibbsState_e_half` (computation): gibbsState β hβ u (e (1/2)) = 2^(1−β) − 1 for every u (u fixes 1/2).
- `TauCeti.BostConnes.gibbsState_x_mul_x'_two` (computation): gibbsState β hβ u (x 2 * x' 2) = 2^(1−β).
- `TauCeti.BostConnes.gibbsState_e_zero` (degenerate): gibbsState β hβ u (e 0) = 1.
- `TauCeti.BostConnes.gibbsState_x_two` (non-example): gibbsState β hβ u (x 2) = 0 while gibbsState β hβ u (x 2 * x' 2) = 2^(1−β) ≠ 0, so the state is not multiplicative.

Prerequisites: `AnalyticNumberTheory:AN.9/regular-representation`; `AnalyticNumberTheory:AN.9/partition-function`; `mathlib:riemannZeta`.

Source: connes-marcolli-2008, Ch. 3, §4.6, (3.135) and (3.139), p. 475.

Open proof/interface leaves: Native elaboration.

### KMS_β states on the Bost–Connes algebra

Node: `AnalyticNumberTheory:AN.9/kms-states`. Declaration: `TauCeti.BostConnes.IsKMS` (definition).

For β>0, IsKMS(β,φ) on the dense complex Hecke algebra means: φ is complex linear, φ(1)=1, φ(f* f) is a nonnegative real number for every f, and φ(f σ_(iβ)(g))=φ(gf) for all f,g. This is the algebraic boundary identity. Its equivalence with the bounded strip definition on the C*-completion requires the bounded-state extension and analytic-core lemmas below. Ground states satisfy the upper-half-plane boundedness condition; KMS∞ states are weak limits of KMS states as inverse temperature tends to infinity. These notions are distinct.

Hypotheses: β > 0.

Proof or construction:
1. A basis vector with dilation a≠1 is annihilated by the boundary identity with f=1 because a^(−β)≠1.
2. Time invariance follows coefficientwise, since the remaining dilation-one basis vectors are fixed.
3. For a bounded state on the completion, the analytic-core lemma proves the strip equivalence. Algebraic positivity alone is not silently identified with a completed state.

Uses:
- `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`: The Gibbs states satisfy it.
- `AnalyticNumberTheory:AN.9/kms-classification`: The classification describes all of them.
- `AnalyticNumberTheory:AN.9/symmetry-action`: The symmetries act on the KMS states.

API:
- `TauCeti.BostConnes.IsKMS` (constructor): IsKMS(β,φ) includes β>0, normalization, complex-order positivity and the displayed boundary identity on the dense Hecke algebra.
- `TauCeti.BostConnes.IsKMS.timeEvolution_invariant` (other): IsKMS β φ → φ (timeEvolution t f) = φ f for real t.
- `TauCeti.BostConnes.IsKMS.convex` (structure): KMS_β states form a convex set.
- `TauCeti.BostConnes.IsKMS.comp_symmetry` (functoriality): IsKMS β φ → IsKMS β (φ ∘ symmetry u).

Discriminating unit tests:
- `TauCeti.BostConnes.isKMS_gibbsState` (computation): IsKMS β (gibbsState β hβ u) for β > 1 (B.9/gibbs-states-are-kms).
- `TauCeti.BostConnes.isKMS_one_iff` (non-example): The state f ↦ f(identity coset) satisfies IsKMS β exactly when β = 1.
- `TauCeti.BostConnes.isKMS_sign` (non-example): The Gibbs state fails the identity with σ_{−iβ} in place of σ_{iβ}: at f = x′₂, g = x₂ the two sides are 2^{1+β} and 2^{1−β}.
- `TauCeti.BostConnes.isKMS_x_mul_x'_two` (computation): Every KMS_β state has φ(x 2 * x' 2) = 2^(1−β), hence φ(e (1/2)) = 2^(1−β) − 1.

Prerequisites: `AnalyticNumberTheory:AN.9/time-evolution`; `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `mathlib:Complex.cpow`.

Source: connes-marcolli-2008, Ch. 3, §2.2, Definition 3.6, p. 446.

Open proof/interface leaves: Native elaboration.

### The Gibbs states are KMS_β states

Node: `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`. Declaration: `TauCeti.BostConnes.isKMS_gibbsState` (theorem).

For β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u} is a KMS_β state.

Hypotheses: β > 1.

Proof or construction:
1. For a normal-form basis monomial each basis vector is sent to a scalar multiple of at most one other basis vector.
2. The Hamiltonian implements σ on these coefficients. The KMS boundary identity follows by changing the positive-integer summation index and retaining the factors n^(−β).
3. Bound each diagonal series by the operator norm times Σ k^(−β), and extend by linearity. No cyclic rearrangement with the unbounded operator e^(βH) is used.

Prerequisites: `AnalyticNumberTheory:AN.9/gibbs-states`; `AnalyticNumberTheory:AN.9/kms-states`; `AnalyticNumberTheory:AN.9/regular-representation`.

Source: connes-marcolli-2008, Ch. 3, §4.6, (3.135) and (3.139), p. 475; connes-marcolli-2008, Ch. 3, §2.2, Definition 3.6, p. 446.

### The Bost–Connes phase transition

Node: `AnalyticNumberTheory:AN.9/kms-classification`. Declaration: `TauCeti.BostConnes.kms_classification` (theorem). Planet: Bost–Connes phase transition.

For bounded states on the C*-completion and β>0, (1) If β ≤ 1 there is exactly one KMS_β state; on e(a/b) with gcd(a, b) = 1 it takes the value b^{−β} ∏_{p | b} (1 − p^{β−1})/(1 − p^{−1}). (2) If β > 1 the extremal completed KMS_β states are exactly the Gibbs states φ_{β,u}, u ∈ Ẑ^× = Aut(ℚ/ℤ), these are pairwise distinct, and every KMS_β state is a barycentre of them. (3) The symmetries of B.9/symmetry-action act freely and transitively on the extremal completed KMS_β states for β > 1.

Hypotheses: β > 0; states and KMS condition as in B.9/kms-states.

Proof or construction:
1. Restrict a completed KMS state to the commutative C(Ẑ) and use the KMS–scaling-measure correspondence.
2. For 0<β≤1 use the finite-prime projection, character-annihilation and ergodicity chain; for β>1 use the unit-orbit decomposition and barycentre chain.
3. Transport the measure classification back to states and apply the symmetry intertwining.

Prerequisites: `AnalyticNumberTheory:AN.9/kms-states`; `AnalyticNumberTheory:AN.9/gibbs-states`; `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`; `AnalyticNumberTheory:AN.9/symmetry-action`; `AnalyticNumberTheory:AN.9/bc-completed-kms`; `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`; `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`.

Source: connes-marcolli-2008, Ch. 3, §4.6, Theorem 3.32, pp. 474–475; connes-marcolli-2008, Ch. 3, §4.6, Theorem 3.32, p. 475.

### The symmetry group Ẑ^× = Aut(ℚ/ℤ)

Node: `AnalyticNumberTheory:AN.9/symmetry-action`. Declaration: `TauCeti.BostConnes.symmetry` (construction).

For v ∈ Aut(ℚ/ℤ) (≅ Ẑ^×) there is a unique K-algebra automorphism θ_v of BCHecke K with θ_v(x_n) = x_n, θ_v(x′_n) = x′_n and θ_v(e(γ)) = e(v(γ)); on the basis, θ_v[class of [1 γ/m; 0 n/m]] = [class of [1 v(γ)/m; 0 n/m]]. It commutes with the time evolution, θ_vθ_w = θ_{vw}, and for K = ℂ it is a *-automorphism with π_u ∘ θ_v = π_{uv}, so φ_{β,u} ∘ θ_v = φ_{β,uv}.

Hypotheses: v ∈ Aut(ℚ/ℤ).

Proof or construction:
1. The relations (a′)–(f′) are preserved: v is additive and commutes with multiplication by n on ℚ/ℤ, and permutes {δ : nδ = γ} onto {δ : nδ = v(γ)}. By the presentation (B.9/rational-presentation), θ_v is a well-defined algebra endomorphism with inverse θ_{v⁻¹}.
2. θ_v fixes a(X), so it commutes with σ_z; it preserves the involution because v(−γ) = −v(γ).
3. π_u(θ_v(e(γ)))ε_k = exp(2πik·u(v(γ)))ε_k.

Uses:
- `AnalyticNumberTheory:AN.9/kms-classification`: Acts freely and transitively on the low-temperature extremal states.
- `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`: Intertwines the Galois action on ground-state values.

API:
- `TauCeti.BostConnes.symmetry` (constructor): symmetry (v : AddAut (ℚ/ℤ)) : BCHecke K ≃ₐ[K] BCHecke K (AddAut is the additive twin of MulAut).
- `TauCeti.BostConnes.symmetry_e` (simp): symmetry v (e γ) = e (v γ).
- `TauCeti.BostConnes.symmetry_x` (simp): symmetry v (x n) = x n and symmetry v (x' n) = x' n.
- `TauCeti.BostConnes.symmetry_mul` (relation): symmetry (v * w) = (symmetry w).trans (symmetry v).
- `TauCeti.BostConnes.symmetry_timeEvolution` (compatibility): symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f).

Discriminating unit tests:
- `TauCeti.BostConnes.symmetry_neg_e` (computation): symmetry (−1) (e γ) = e (−γ).
- `TauCeti.BostConnes.symmetry_one` (degenerate): symmetry 1 = AlgEquiv.refl.
- `TauCeti.BostConnes.symmetry_gibbs` (compatibility): gibbsState β hβ u ∘ symmetry v = gibbsState β hβ (u * v).
- `TauCeti.BostConnes.no_symmetry_of_double` (non-example): Doubling on ℚ/ℤ is not bijective, and e γ ↦ e (2γ), x n ↦ x n is not an algebra map: it would send x 2 * x' 2 = 1 + e (1/2) both to itself and to 1 + e 1 = 2.

Prerequisites: `AnalyticNumberTheory:AN.9/rational-presentation`; `AnalyticNumberTheory:AN.9/time-evolution`; `AnalyticNumberTheory:AN.9/regular-representation`; `mathlib:AddCircle`; `mathlib:MulAut`.

Source: connes-marcolli-2008, Ch. 3, §4.3, (3.75), p. 461.

Open proof/interface leaves: Native elaboration.

### Cyclotomic values and Galois action on extremal KMS∞ states

Node: `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`. Declaration: `TauCeti.BostConnes.groundState_galois` (theorem).

For u ∈ Aut(ℚ/ℤ) the extremal KMS∞ vector state φ_{∞,u}(f) = ⟨ε₁, π_u(f)ε₁⟩ is the limit of φ_{β,u} as β → ∞. On the rational form H_ℚ (the ℚ-valued functions), φ_{∞,u}([X]) = exp(2πi u(γ)) if X is the class of translation γ and 0 otherwise; so φ_{∞,u}(H_ℚ) lies in the cyclotomic field ℚ(μ_∞) ⊂ ℂ. For every field automorphism τ of ℂ, τ ∘ φ_{∞,u} = φ_{∞,χ(τ)u} on H_ℚ, where χ(τ) ∈ Aut(ℚ/ℤ) is the automorphism with τ(exp(2πiγ)) = exp(2πi χ(τ)(γ)); that is, τ ∘ φ_{∞,u} = φ_{∞,u} ∘ θ_{χ(τ)}. This states the extremal KMS∞ result and does not classify all upper-half-plane ground states.

Hypotheses: u ∈ Aut(ℚ/ℤ); τ a ring automorphism of ℂ.

Proof or construction:
1. π_u(x_n e(γ) x′_m)ε₁ = 0 unless m = 1, and then it is a multiple of ε_n, orthogonal to ε₁ unless n = 1; so φ_{∞,u} kills every basis element except the classes of translations, where it is exp(2πi u(γ)).
2. Limit: φ_{β,u}(e(γ)) = ζ(β)⁻¹Σ k^{−β}exp(2πiku(γ)) → exp(2πiu(γ)) as β → ∞, since ζ(β) → 1 and the tail is O(2^{−β}).
3. τ permutes the roots of unity in ℂ, and the induced map on ℚ/ℤ ≅ μ_∞ is additive and bijective; this defines χ(τ) (the cyclotomic character). Then τ(exp(2πiu(γ))) = exp(2πi χ(τ)(u(γ))), and B.9/symmetry-action gives the intertwining.
4. Prove the KMS∞ limit on the completed state space and then restrict to either rational form; continuity of arbitrary complex field automorphisms is never assumed.

Prerequisites: `AnalyticNumberTheory:AN.9/regular-representation`; `AnalyticNumberTheory:AN.9/gibbs-states`; `AnalyticNumberTheory:AN.9/symmetry-action`; `AnalyticNumberTheory:AN.9/rational-forms-comparison`; `mathlib:IsCyclotomicExtension`; `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`; `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`.

Source: connes-marcolli-2008, Ch. 3, §4.6, Theorem 3.32, (3.136)–(3.137), p. 475.

### Positive-spectrum zeta and heat series

Node: `AnalyticNumberTheory:AN.9/spectral-zeta-series`. Declaration: `TauCeti.SpectralZeta.SpectralData` (construction). Planet: Spectral zeta function.

For a connected compact hyperbolic surface X=Γ\H with Γ torsion-free and cocompact, genus g≥2, use Δ=−y²(∂x²+∂y²). Import the discrete spectrum0=λ0<λ1≤… with multiplicities. Define ζΔ(s)=Σj≥1 λj^(−s) on Res>1 and H(t)=Σj≥0 exp(−tλj) for t>0. The analytic continuation of ζΔ is distinguished from the totalized infinite sum.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Import the compact quotient and positive scalar Laplacian.
2. Index the nonzero spectrum with multiplicities and omit the zero eigenvalue in ζΔ.
3. Use Weyl growth to justify the series on their stated domains.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SpectralZeta.SpectralData.series` (constructor): The positive-spectrum complex-power series.
- `TauCeti.SpectralZeta.SpectralData.heat` (constructor): Heat series including the single zero eigenvalue.
- `TauCeti.SpectralZeta.SpectralData.continued` (constructor): The meromorphic continuation agreeing with the positive series for Res>1.

Discriminating unit tests:
- `TauCeti.SpectralZeta.SpectralData.test_single_eigenvalue` (computation): For a finite spectrum consisting of λ>0, the series is λ^(−s).
- `TauCeti.SpectralZeta.SpectralData.test_zero_omitted` (non-example): The zero eigenvalue contributes1 to the heat series and contributes no term to ζΔ.
- `TauCeti.SpectralZeta.SpectralData.test_scaling` (compatibility): Replacing each positive λ by cλ for c>0 multiplies the convergent zeta series by c^(−s).

Prerequisites: `ArithmeticLocallySymmetricSpaces:ALS.0`; `AutomorphicSpectralTheory:AS.4`; `mathlib:Complex.cpow`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

Open proof/interface leaves: Native elaboration.

### The scalar Selberg primitive-geodesic product

Node: `AnalyticNumberTheory:AN.9/selberg-primitive-product`. Declaration: `TauCeti.SpectralZeta.Selberg` (construction). Planet: Selberg zeta function.

For the same compact torsion-free quotient, let PΓ be primitive hyperbolic conjugacy classes, with the orientation/conjugacy convention of Zagier(2). For each p let ℓp=log N(p)>0. Define ZΓ(s)=∏p∈PΓ ∏k≥0 (1−exp(−(s+k)ℓp)) for Res>1; its entire continuation is separate. Primitive conjugacy classes, their inverses and geometric unoriented geodesics are not interchanged without the multiplicity comparison.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Import primitive hyperbolic classes and their length normalization.
2. Use a geodesic-count growth bound to prove absolute local product convergence.
3. Define the continuation only after the trace-formula comparison.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SpectralZeta.Selberg.product` (constructor): The displayed double Euler product in Res>1.
- `TauCeti.SpectralZeta.Selberg.continued` (constructor): The entire continuation with the same product on Res>1.
- `TauCeti.SpectralZeta.Selberg.log_derivative` (characterisation): Z′/Z=Σp Σm≥1 ℓp exp(−msℓp)/(1−exp(−mℓp)) in Res>1.

Discriminating unit tests:
- `TauCeti.SpectralZeta.Selberg.test_primitive_repeat` (computation): One primitive class of lengthℓ contributes ∏k≥0(1−e^(−(s+k)ℓ)); its powers are counted by m in the logarithmic derivative.
- `TauCeti.SpectralZeta.Selberg.test_two_lengths` (compatibility): Disjoint primitive class lists multiply their products in the convergence domain.
- `TauCeti.SpectralZeta.Selberg.test_orientation` (non-example): Replacing the source class list by two copies squares the product; it changes the theorem unless its multiplicities are corrected.

Prerequisites: `AnalyticNumberTheory:AN.9/spectral-zeta-series`; `AutomorphicSpectralTheory:AS.6`; `ArithmeticLocallySymmetricSpaces:ALS.0`.

Source: zagier-selberg, §1, (1)–(2), pp.1–2.

Open proof/interface leaves: Native elaboration.

### The regularized scalar Laplace determinant

Node: `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`. Declaration: `TauCeti.SpectralZeta.RegularizedDet` (construction). Planet: Regularized determinant.

If the meromorphic continuation ζΔ is analytic at0, define det′Δ=exp(−ζ′Δ(0)). For real v>0 use all eigenvalues includingλ0 in ζΔ+v(z)=Σj≥0(λj+v)^(−z), continued to z=0, and det(Δ+v)=exp(−∂z ζΔ+v(0)). A prime removes zero modes. No ordinary divergent eigenvalue product is assigned a value.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Prove regularity at0 via the heat Mellin argument.
2. Take the complex derivative of that continuation and exponentiate its negative.
3. For the shifted determinant, use v>0 to keep all eigenvalues positive.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.SpectralZeta.RegularizedDet.ofZeta` (constructor): For the analytic continuation f at0, exp(−f′(0)).
- `TauCeti.SpectralZeta.RegularizedDet.shifted` (constructor): The determinant from the shifted spectral continuation.
- `TauCeti.SpectralZeta.RegularizedDet.scale` (compatibility): det′(cΔ)=c^(ζΔ(0))det′Δ for c>0.

Discriminating unit tests:
- `TauCeti.SpectralZeta.RegularizedDet.test_one_eigenvalue` (computation): A finite one-eigenvalue spectrum gives determinantλ.
- `TauCeti.SpectralZeta.RegularizedDet.test_empty_positive_spectrum` (degenerate): An empty positive spectrum gives1.
- `TauCeti.SpectralZeta.RegularizedDet.test_two_eigenvalues` (compatibility): A finite two-eigenvalue spectrum gives λ1λ2, including multiplicities.

Prerequisites: `AnalyticNumberTheory:AN.9/spectral-zeta-series`; `mathlib:mellin`; `mathlib:Complex.Gamma`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

Open proof/interface leaves: Native elaboration.

### The compact discrete-spectrum input

Node: `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`. Declaration: `TauCeti.SpectralZeta.compact_spectrum_and_weyl` (lemma).

AS.4 supplies a complete orthonormal scalar eigenbasis with finite multiplicities and Weyl counting N(Λ)~area(X)Λ/(4π). Connectedness gives the simple zero eigenvalue.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Specialize the compact Hilbert-sum decomposition.
2. Identify the scalar positive Laplacian and its kernel.
3. Use the supplied heat/Weyl asymptotics rather than treating compactness alone as a spectrum theorem.

Prerequisites: `AnalyticNumberTheory:AN.9/spectral-zeta-series`; `AutomorphicSpectralTheory:AS.4`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

Open proof/interface leaves: Heat and Laplace–Mellin source leaves.

### Heat Mellin identity

Node: `AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane`. Declaration: `TauCeti.SpectralZeta.heat_mellin_on_right_half_plane` (lemma).

For Res>1, ζΔ(s)=Γ(s)^(−1)∫0∞(H(t)−1)t^(s−1)dt.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use positive-spectrum Weyl bounds to dominate the small-t integral.
2. Use the positive spectral gap for exponential decay as t→∞.
3. Apply dominated interchange and the scalar gamma integral term by term.

Prerequisites: `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`; `AnalyticNumberTheory:AN.9/spectral-zeta-series`; `mathlib:mellin`; `mathlib:Complex.Gamma`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

### Subtracting small-time heat coefficients

Node: `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`. Declaration: `TauCeti.SpectralZeta.heat_small_time_subtraction` (lemma).

For any prescribed continuation range, subtract a finite heat asymptotic expansion H(t)~Σk≥0 ak t^(k−1) at0. Integrating each subtracted monomial on(0,1) gives ak/(s+k−1); the remainder integral is holomorphic in the extended half-plane.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Obtain uniform heat-remainder bounds from the heat-kernel supplier.
2. Split the Mellin integral at1.
3. Integrate the finite asymptotic polynomial and dominate the remainder locally.

Prerequisites: `AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane`; `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

Open proof/interface leaves: Heat and Laplace–Mellin source leaves.

### Spectral zeta is regular at zero

Node: `AnalyticNumberTheory:AN.9/spectral-regularity-zero`. Declaration: `TauCeti.SpectralZeta.spectral_regularity_zero` (theorem).

The positive spectral zeta continues meromorphically, and is analytic at0 because Γ(s)^(−1) has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Continue successively using finite heat subtractions.
2. Use Γ(s+1)=sΓ(s) and Γ(1)=1 at0.
3. Differentiate the resulting holomorphic expression, never the divergent original series.

Prerequisites: `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`; `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`.

Source: sarnak-1990, §1, (1.1)–(1.5), p.603.

### Logarithmic derivative of the primitive product

Node: `AnalyticNumberTheory:AN.9/selberg-log-product`. Declaration: `TauCeti.SpectralZeta.selberg_log_product` (lemma).

For Res>1, expand log(1−e^(−(s+k)ℓp)) and sum k geometrically. This gives Z′/Z=Σp,m≥1 ℓp e^(−msℓp)/(1−e^(−mℓp)), locally uniformly.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the geodesic-count bound with a strict real-part margin.
2. Justify derivative and summation interchanges.
3. Sum the k-series and preserve the primitive/power weights.

Prerequisites: `AnalyticNumberTheory:AN.9/selberg-primitive-product`; `AutomorphicSpectralTheory:AS.6`.

Source: zagier-selberg, §1, (1)–(2), pp.1–2.

### The compact scalar heat trace input

Node: `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`. Declaration: `TauCeti.SpectralZeta.scalar_heat_trace_formula` (lemma).

For t>0, H(t)=area(X)/(4π)∫R r tanh(πr)e^(−t(r²+1/4))dr +Σp,m≥1 ℓp/[2sinh(mℓp/2)] · e^(−t/4−(mℓp)²/(4t))/√(4πt). Class multiplicities agree with the primitive list fixed above. There are no cusp, elliptic or continuous-spectrum terms in this selected compact torsion-free case.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Supply the heat test function and its Fourier transform with exact constants.
2. Prove the trace formula accepts this noncompactly supported test function by approximation and convergence.
3. Match spectral, identity and primitive hyperbolic terms.

Prerequisites: `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`; `AnalyticNumberTheory:AN.9/selberg-primitive-product`; `AutomorphicSpectralTheory:AS.6`.

Source: jss-2026, Theorem 6.1 and proof; Corollaries 8.2.1 and 8.3.1–2, pp.20–24,27–28.

Open proof/interface leaves: Heat and Laplace–Mellin source leaves.

### Hyperbolic transform is the Selberg logarithm

Node: `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`. Declaration: `TauCeti.SpectralZeta.hyperbolic_laplace_mellin` (lemma).

For real s>1, the Laplace–Mellin transform of the hyperbolic heat contribution in the shifted determinant has derivative at Mellin exponent0 equal to−log ZΓ(s). This is the scalar specialization of JSS Proposition5.4; the exact integral proof remains a source-refinement gap.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use e^(−t(s−1/2)²) after factoring e^(−t/4) from the heat trace.
2. Evaluate the scalar Gaussian Laplace–Mellin integral term by term.
3. Use the absolute geodesic sum and the primitive product expansion.

Prerequisites: `AnalyticNumberTheory:AN.9/selberg-log-product`; `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`.

Source: jss-2026, Theorem 6.1 and proof; Corollaries 8.2.1 and 8.3.1–2, pp.20–24,27–28.

Open proof/interface leaves: Heat and Laplace–Mellin source leaves.

### Identity contribution and Barnes normalization

Node: `AnalyticNumberTheory:AN.9/identity-barnes-transform`. Declaration: `TauCeti.SpectralZeta.identity_barnes_transform` (lemma).

Let C=area(X)/(4π)=g−1. The scalar identity factor is I_g(s)=exp(2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)]), where G is the classical Barnes G-function normalized by G(1)=1, G(s+1)=Γ(s)G(s) and the source asymptotic expansion. The full normalization/asymptotic input is required; recurrence alone is insufficient.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Differentiate the identity Laplace–Mellin term in s and evaluate the contour integral as the digamma combination in JSS(6.5).
2. Use the normalized Barnes logarithmic derivative (source(2.8)).
3. Recover the integration constant from the large-real-s asymptotics, as in the final paragraph of the proof.

Prerequisites: `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`; `AnalyticNumberTheory:AN.7`.

Source: jss-2026, Theorem 6.1 and proof; Corollaries 8.2.1 and 8.3.1–2, pp.20–24,27–28.

Open proof/interface leaves: Barnes G normalization and asymptotics.

### The compact Selberg determinant comparison

Node: `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`. Declaration: `TauCeti.SpectralZeta.selberg_determinant_comparison` (comparison).

For the selected scalar compact surface, det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)]) for real s>1, extended by the proved analytic continuation. Thus det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1)). The sign is the corrected v2 sign; source v1(1.3) has the opposite Euler-characteristic sign.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Combine the hyperbolic and identity Laplace–Mellin derivatives.
2. Determine the additive logarithmic constant from the prescribed large-s expansion.
3. At s=1 remove the simple zero eigenvalue and use Γ(1)=G(2)=1.

Prerequisites: `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`; `AnalyticNumberTheory:AN.9/spectral-regularity-zero`; `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`; `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

Source: jss-2026, Theorem 6.1 and proof; Corollaries 8.2.1 and 8.3.1–2, pp.20–24,27–28.

### The compact Selberg functional equation

Node: `AnalyticNumberTheory:AN.9/selberg-functional-equation`. Declaration: `TauCeti.SpectralZeta.selberg_functional_equation` (theorem).

With D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)]), the continued scalar Selberg function satisfies ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s) as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real s>1 and avoids an unnormalized path integral.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. The shifted operator Δ+s(s−1) is unchanged by s↦1−s.
2. Use the determinant comparison on its domain and continue.
3. Multiply by the explicit identity factors to obtain a branch-consistent equation.

Prerequisites: `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`; `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

Source: jss-2026, Theorem 6.1 and proof; Corollaries 8.2.1 and 8.3.1–2, pp.20–24,27–28.

### Selberg zeros and scalar spectral parameters

Node: `AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison`. Declaration: `TauCeti.SpectralZeta.selberg_spectral_zero_comparison` (comparison).

The spectral zeros occur at both solutions of s(1−s)=λj, with multiplicities determined by the determinant comparison and the identity factor. For λj≥1/4 they lie on Res=1/2; for 0<λj<1/4 they are real in(0,1). The zero mode gives s=0,1. Identity-factor trivial zeros are separated before calling zeros spectral; no Riemann RH consequence follows.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the shifted determinant zeros with eigenvalue multiplicity.
2. Separate the explicit identity-factor zeros/poles.
3. Solve the quadratic relation and retain small positive eigenvalues.

Prerequisites: `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`; `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`; `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

Source: zagier-selberg, §1, (1)–(2), pp.1–2.

### The reduced Bost–Connes C*-algebra

Node: `AnalyticNumberTheory:AN.9/bc-cstar-completion`. Declaration: `TauCeti.BostConnes.Completed.algebra` (construction). Planet: Bost–Connes C*-algebra.

Let πleft be convolution on l²(P_Q⁺/P_Z⁺), using the paper’s right-coset convention and the Tau Hecke product comparison. Define C_Q as the operator-norm closure of πleft(BCHecke C) in bounded operators, a unital star subalgebra. This is distinct from an individual πu on l²(N+), which is not the left regular carrier.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Bound left convolution on each finite double-coset support using its finite degrees.
2. Prove it is a faithful star representation, matching the coset convention.
3. Use the existing star-subalgebra closure; norm/C*-completeness and the universal/reduced comparison are separate leaves.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.BostConnes.Completed.leftRegular` (constructor): Convolution on the l² right-coset carrier.
- `TauCeti.BostConnes.Completed.algebra` (constructor): The operator-norm closure of the left regular image.
- `TauCeti.BostConnes.Completed.embed` (coercion): The faithful dense star-algebra map from BCHecke C into C_Q.

Discriminating unit tests:
- `TauCeti.BostConnes.Completed.test_unit` (degenerate): The embedded unit is the identity operator.
- `TauCeti.BostConnes.Completed.test_isometry` (characterisation): The embedded μn satisfies μn*μn=1.
- `TauCeti.BostConnes.Completed.test_range_projection` (computation): The embedded μ2μ2*=(1+e(1/2))/2 is a proper projection, not1.

Prerequisites: `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `mathlib:StarSubalgebra.topologicalClosure`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

Open proof/interface leaves: C*-completion and analytic-core operator leaves; Native elaboration.

### Completed KMS states and the bounded strip condition

Node: `AnalyticNumberTheory:AN.9/bc-completed-kms`. Declaration: `TauCeti.BostConnes.CompletedKMS` (definition).

For β>0, a completed state is a bounded complex-linear functional φ on C_Q with φ(1)=1 and φ(a*a) a nonnegative real. It is KMSβ when, for all a,b, there is a bounded continuous F on0≤Imz≤β, holomorphic on the interior, with F(t)=φ(aσt(b)) and F(t+iβ)=φ(σt(b)a). Dynamics is a point-norm-continuous group of star automorphisms.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Extend real dynamics isometrically to the norm closure and prove point-norm continuity by dense finite supports.
2. Use the bounded strip definition with both boundary conditions.
3. Relate it to the algebraic identity only after the analytic-core extension lemma.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.BostConnes.CompletedKMS.state` (characterisation): Bounded linear functional, normalization and complex-order positivity.
- `TauCeti.BostConnes.CompletedKMS.isKMS` (constructor): The bounded closed-strip predicate just specified.
- `TauCeti.BostConnes.CompletedKMS.restrict` (compatibility): Restriction to the dense Hecke algebra satisfies IsKMS(β,φ).

Discriminating unit tests:
- `TauCeti.BostConnes.CompletedKMS.test_wrong_sign` (non-example): Using σ−iβ reverses the required boundary identity and fails for x′2,x2 in a Gibbs state.
- `TauCeti.BostConnes.CompletedKMS.test_temperature_one` (characterisation): The completed base-vector state restricts to a KMS state atβ=1.
- `TauCeti.BostConnes.CompletedKMS.test_scaling_projection` (computation): Every KMSβ state has φ(μnμn*)=n^(−β).

Prerequisites: `AnalyticNumberTheory:AN.9/bc-cstar-completion`; `AnalyticNumberTheory:AN.9/time-evolution`.

Source: connes-marcolli-2008, Ch.3, Definitions3.4–3.6, pp.445–447.

Open proof/interface leaves: Native elaboration.

### KMS∞ states and upper-half-plane ground states

Node: `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`. Declaration: `TauCeti.BostConnes.KMSInfinity` (definition).

Define KMS∞ states as weak limits of KMSβ states as β→∞. Equivalently in this separable unital system, for every finite set of observables, ε>0 and cutoff B there is a KMSβ state with β>B approximating those values within ε. Ground states instead require φ(aσz(b)) to extend bounded holomorphically to Imz>0, continuously on the boundary. KMS∞ states are ground states; the converse is not built into either definition.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the finite-observable weak topology on bounded states.
2. Use the upper-half-plane boundedness definition separately.
3. Prove the implication by compactness/normal-family limits rather than equating the definitions.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.BostConnes.KMSInfinity.isLimit` (constructor): The finite-observable weak-limit criterion as β tends to infinity.
- `TauCeti.BostConnes.KMSInfinity.isGround` (constructor): The bounded holomorphic upper-half-plane correlation condition.
- `TauCeti.BostConnes.KMSInfinity.limit_isGround` (relation): Every KMS∞ state is a ground state under the completed dynamics.

Discriminating unit tests:
- `TauCeti.BostConnes.KMSInfinity.test_gibbs_limit` (compatibility): The β→∞ limit of φβ,u is the ε1 vector state.
- `TauCeti.BostConnes.KMSInfinity.test_value_half` (computation): The extremal limit has value−1 on e(1/2).
- `TauCeti.BostConnes.KMSInfinity.test_different_notions` (non-example): The zero functional is neither a ground state nor a KMS∞ state: both require normalization. The ground-state predicate still has no finite-temperature-limit requirement.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-completed-kms`.

Source: connes-marcolli-2008, Ch.3, Definition3.7, p.447; Theorem3.32, pp.474–476.

Open proof/interface leaves: Native carrier signatures; Native elaboration.

### Normal-form multiplication and common-divisor reduction

Node: `AnalyticNumberTheory:AN.9/bc-normal-form-product`. Declaration: `TauCeti.BostConnes.bc_normal_form_product` (lemma).

The span of μn eγ μm* with gcd(n,m)=1 is star-closed and product-closed: first cancel q=gcd(m1,n2) using μm1* μn2=μn2/q μm1/q*, then move e terms across the shifts and use the finite preimage average to reduce any remaining gcd.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Prove the six generator relations from finite coset convolutions.
2. Use the displayed gcd cancellation and character-transport formulas of p.433.
3. Reduce a noncoprime outer pair with μq eγ μq*=q^(−1)Σqδ=γ eδ.

Prerequisites: `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

### The corrected double-coset basis is independent

Node: `AnalyticNumberTheory:AN.9/bc-normal-form-independent`. Declaration: `TauCeti.BostConnes.bc_normal_form_independent` (lemma).

For coprime n,m, the normal form μn eγ μm*=(nm)^(−1/2)[class(1,γ/m;0,n/m)]. The parameterγ modZ gives a bijection onto the double cosets of fixed n/m; hence these normal forms are linearly independent.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Compute eγ x′m using the paper convolution, obtaining upper entryγ/m.
2. Left multiply by xn and use uniqueness of the reduced positive rational n/m.
3. Use independence of the Tau Hecke finitely supported basis; retain E14.

Prerequisites: `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`; `AnalyticNumberTheory:AN.9/bc-normal-form-product`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

### Bounded faithful left convolution

Node: `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`. Declaration: `TauCeti.BostConnes.bc_convolution_norm_bound` (lemma).

Each finite-support Hecke element acts boundedly on the right-coset l² carrier by a finite sum of finite-degree correspondences; operator adjoint matches the Hecke involution and the action on the base vector detects each coefficient.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Prove the finite-degree row/column bounds on each basis operator.
2. Apply the l² bound and sum finitely many support terms.
3. Compute the adjoint and recover coefficients from the base vector.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-cstar-completion`; `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

Open proof/interface leaves: C*-completion and analytic-core operator leaves.

### Extending real dynamics to the C*-completion

Node: `AnalyticNumberTheory:AN.9/bc-real-dynamics-extension`. Declaration: `TauCeti.BostConnes.bc_real_dynamics_extension` (lemma).

The real σt are isometric star automorphisms in the left representation and extend to a point-norm-continuous automorphism group on C_Q. The complex σz is retained only on the entire dense Hecke algebra.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Implement real σt by diagonal unitaries from the dilation character.
2. Extend the norm-preserving map and inverse to the closure.
3. Approximate by finite Hecke sums to prove point-norm continuity.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-cstar-completion`; `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`; `AnalyticNumberTheory:AN.9/time-evolution`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

### Positive Hecke states extend boundedly

Node: `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`. Declaration: `TauCeti.BostConnes.bc_bounded_state_extension` (lemma).

A normalized positive functional on the presented Hecke star algebra has a GNS representation in which the μn are isometries and eγ are unitaries. The universal norm bound and universal=reduced comparison imply continuity and a unique positive extension to C_Q.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the generator relations in the GNS quadratic form to obtain the operator bounds.
2. Prove the universal/reduced equivalence using amenability of the ax+b group/full-corner description.
3. Extend by density with norm1; do not invoke mere algebraic positivity without this argument.

Prerequisites: `AnalyticNumberTheory:AN.9/rational-presentation`; `AnalyticNumberTheory:AN.9/bc-cstar-completion`.

Source: bost-connes-1995, §4, Proposition 18 and complete proof, pp.431–433.

Open proof/interface leaves: C*-completion and analytic-core operator leaves.

### The analytic core and the strip KMS condition

Node: `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`. Declaration: `TauCeti.BostConnes.bc_analytic_core_strip_equivalence` (lemma).

For a bounded completed state and β>0, the algebraic boundary identity on the entire Hecke core is equivalent to the completed bounded strip condition.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. The core has finite exponential time coefficients and explicit boundary values.
2. Use norm bounds and the three-lines/analytic-core argument to construct bounded strip functions.
3. Approximate arbitrary completed observables and pass to uniform boundary limits.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-completed-kms`; `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`; `AnalyticNumberTheory:AN.9/bc-real-dynamics-extension`; `AnalyticNumberTheory:AN.9/kms-states`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

Open proof/interface leaves: C*-completion and analytic-core operator leaves.

### The finite-adele scaling measure

Node: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`. Declaration: `TauCeti.BostConnes.ScalingMeasure` (construction).

For β>0, let μβ,p on Qp have μβ,p(Zp)=1 and density (1−p^(−β))/(1−p^(−1))·|x|p^(β−1) relative to additive Haar measure with vol(Zp)=1. Form the normalized restricted-product measure μβ on A_Q,f. It obeys μβ(q^(−1)E)=q^β μβ(E) for positive rational q. The local expression is interpreted almost everywhere away from0; it is not evaluated as0^negative at the point0.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Sum p-adic valuation shells to normalize the local measure.
2. Construct the product probability on Ẑ and extend consistently to rational dilates in finite adeles.
3. Verify the rational scaling law and uniqueness among the specified unit-invariant measures.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.BostConnes.ScalingMeasure.local` (constructor): The displayed p-adic density with normalized Haar measure.
- `TauCeti.BostConnes.ScalingMeasure.adelic` (constructor): The restricted-product measure with μβ(Ẑ)=1.
- `TauCeti.BostConnes.ScalingMeasure.scale` (relation): μβ(q^(−1)E)=q^β μβ(E).

Discriminating unit tests:
- `TauCeti.BostConnes.ScalingMeasure.test_beta_one` (compatibility): Atβ=1 the local measures and restricted product are additive Haar.
- `TauCeti.BostConnes.ScalingMeasure.test_valuation_shell` (computation): μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ) for k≥0.
- `TauCeti.BostConnes.ScalingMeasure.test_units_mass` (characterisation): μβ,p(Zp×)=1−p^(−β).

Prerequisites: `AnalyticNumberTheory:AN.9/bc-completed-kms`; `AdelicAlgebraicGroups:AA.2`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers; Native carrier signatures; Native elaboration.

### KMS states and scaling measures

Node: `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`. Declaration: `TauCeti.BostConnes.bc_kms_scaling_correspondence` (comparison).

Restriction to C(Ẑ) identifies completed KMSβ states with normalized measures on the finite adeles satisfying rational scaling. Off-diagonal dilation components vanish by invariance, and the KMS relation gives μ(nẐ)=n^(−β).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the character algebra C*(Q/Z)=C(Ẑ) and the state/measure correspondence.
2. Derive dilation scaling with μn,μn*.
3. Reconstruct the diagonal conditional-expectation state and verify the KMS identity; isotropy/null exceptional sets are retained in the proof interface.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-completed-kms`; `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`; `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers.

### Finite-prime orbit projection

Node: `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`. Declaration: `TauCeti.BostConnes.bc_finite_prime_projection` (lemma).

For a finite prime set A, NA is its generated multiplicative monoid and WA={x∈Ẑ:xp∈Zp× for p∈A}. On WA the projection to NA-invariant functions is PAf(x)=ζA(β)^(−1)Σn∈NA n^(−β)f(nx), extended along NA-orbits, where ζA(β)=∏p∈A(1−p^(−β))^(−1).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Decompose Ẑ into disjoint nWA for n∈NA up to the measure-zero zero-coordinate set.
2. Use μβ(nE)=n^(−β)μβ(E).
3. Check conditional expectation, invariant range and idempotence in L².

Prerequisites: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers.

### Local characters form a dense family

Node: `AnalyticNumberTheory:AN.9/bc-local-character-density`. Declaration: `TauCeti.BostConnes.bc_local_character_density` (lemma).

Functions depending on finitely many p-adic coordinates and valuation shells, with characters of local unit quotients, span a dense subspace of L²(Ẑ,μβ).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Approximate by finite-coordinate cylinder functions.
2. Decompose each coordinate into its countable valuation shells.
3. Use finite character orthogonality on the compact local unit quotients.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers.

### Nontrivial characters are annihilated in the critical interval

Node: `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection`. Declaration: `TauCeti.BostConnes.bc_nontrivial_character_projection` (lemma).

For0<β≤1 and a nontrivial local unit characterχ, the increasing-prime projections P_Aχ tend to0: their product coefficients contain factors (1−p^(−β))/(1−χ(p)p^(−β)), and divergence of the prime reciprocal sum in a suitable character sector forces the product to0.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Compute the geometric prime-power factors in the finite-prime average.
2. Choose a congruence sector where Reχ(p)<0.
3. Use the fixed-progression prime theorem to obtain divergence of Σp p^(−β), not merely infinitude of primes.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`; `AnalyticNumberTheory:AN.9/bc-local-character-density`; `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

### Ergodicity of positive rationals on finite adeles

Node: `AnalyticNumberTheory:AN.9/bc-critical-ergodicity`. Declaration: `TauCeti.BostConnes.bc_critical_ergodicity` (theorem).

For0<β≤1 the Q+× action on(A_Q,f,μβ) is ergodic: every invariant L² function on the compact integral slice is constant, and rational dilates cover the finite adeles.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. For the trivial character compute the projection constant.
2. For every nontrivial dense character use the zero projection limit.
3. Pass by L² density and the rational-dilate exhaustion.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection`; `AnalyticNumberTheory:AN.9/bc-local-character-density`; `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

### Uniqueness in the critical inverse-temperature interval

Node: `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`. Declaration: `TauCeti.BostConnes.bc_low_temperature_uniqueness` (theorem).

For0<β≤1 the completed Bost–Connes system has a unique KMSβ state. On e(a/b), with gcd(a,b)=1, its value is b^(−β)∏p|b(1−p^(β−1))/(1−p^(−1)).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the ergodic scaling measure to get an extremal factor state.
2. Average any extremal state over the compact unit symmetries and use the invariant-measure uniqueness/Choquet argument.
3. Compute the local Fourier coefficients by valuation shells.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-critical-ergodicity`; `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`; `AnalyticNumberTheory:AN.9/symmetry-action`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers.

### Unit-orbit decomposition above the critical temperature

Node: `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits`. Declaration: `TauCeti.BostConnes.bc_high_beta_unit_orbits` (lemma).

Forβ>1, the disjoint sets nẐ× cover a μβ-full subset ofẐ, and μβ(Ẑ×)=∏p(1−p^(−β))=ζ(β)^(−1). Every scaling measure is reconstructed from a probability measure onẐ× by the weighted orbit sums.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the convergent Euler product for the unit mass.
2. Apply the scaling law to disjoint n-unit orbits.
3. The weighted masses sum to1, proving full measure and the reconstruction.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`; `AnalyticNumberTheory:AN.9/partition-function`.

Source: neshveyev-2000-correct, Proposition and its proof, pp.2–3; corollary p.4.

### High-β extremal states and unique barycentres

Node: `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`. Declaration: `TauCeti.BostConnes.bc_high_beta_barycentres` (theorem).

Forβ>1 the KMS simplex is affinely identified with probability measures onẐ×; its extreme points are the Dirac-unit Gibbs states. The unit symmetries act freely transitively on those extreme points.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the KMS–scaling-measure affine correspondence.
2. Identify Dirac masses with the explicit Gibbs formula.
3. Use the probability-measure extreme-point theorem and transport unit multiplication.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits`; `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`; `AnalyticNumberTheory:AN.9/gibbs-states`; `AnalyticNumberTheory:AN.9/symmetry-action`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

Open proof/interface leaves: Measure, Fourier and state-simplex carriers.

### Prime pairs with prescribed ratio and divergent weights

Node: `AnalyticNumberTheory:AN.9/bc-prime-pair-ratio`. Declaration: `TauCeti.BostConnes.bc_prime_pair_ratio` (lemma).

For0<β≤1, λ>1 and ε>0 there are disjoint prime pairs(pn,qn) with |(qn/pn)^β−λ|<ε and Σn qn^(−β)=∞.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Choose multiplicative intervals(λ^(2m)x0,(1+δ)λ^(2m)x0] and their alternating partners, adjustingλ toλ^(1/β).
2. Use the prime number theorem to inject the smaller prime list into the partner list.
3. The interval cardinalities divided by the upper endpoint give a divergent harmonic-m sum; β≤1 retains divergence.

Prerequisites: `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`.

Source: neshveyev-2009, §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

### Valuation-tail cylinder ratios

Node: `AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio`. Declaration: `TauCeti.BostConnes.bc_valuation_tail_ratio` (lemma).

For the product of geometric valuation probabilities νβ,p(k)=(1−p^(−β))p^(−kβ), the cylinder change(0,1)↦(1,0) at a disjoint prime pair(p,q) has exact mass ratio(q/p)^β. The cylinder masses sum divergently over the prescribed prime pairs.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Multiply the two local probabilities.
2. Cancel the two(1−p^(−β)) normalizers in the ratio.
3. Use q^(−β)(1−p^(−β))(1−q^(−β)) and the prime-pair divergence.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`; `AnalyticNumberTheory:AN.9/bc-prime-pair-ratio`.

Source: neshveyev-2009, §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

### All positive numbers belong to the ratio set

Node: `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`. Declaration: `TauCeti.BostConnes.bc_full_positive_ratio_set` (lemma).

The valuation tail equivalence relation has allλ>0 in its ratio set: disjoint cylinder swaps give the asymptotic ratio criterion forλ>1, and inversion/closure give the remaining positiveλ.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the exact cylinder ratio and divergent mass.
2. Apply the inclusion of the nonzero asymptotic ratio set into the ratio set.
3. Use the closed multiplicative subgroup property.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio`.

Source: neshveyev-2009, §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

Open proof/interface leaves: Ratio-set and von Neumann factor interface.

### The critical KMS factors have type III₁

Node: `AnalyticNumberTheory:AN.9/bc-type-three-one`. Declaration: `TauCeti.BostConnes.bc_type_three_one` (theorem).

For0<β≤1 the GNS von Neumann algebra of the unique completed KMSβ state is a factor of type III₁. In particular this proves the requiredβ=1 type statement. Lift the valuation quotient ratio computation through the compact unit action and the full-corner crossed-product description.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use ergodicity for factoriality.
2. Lift the positive ratio set through the compact quotient, as required by Neshveyev Theorem2.1.
3. Use the nonsingular crossed-product/type classification and preserve type under a full corner.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`; `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`; `AnalyticNumberTheory:AN.9/bc-cstar-completion`.

Source: neshveyev-2009, §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

Open proof/interface leaves: Ratio-set and von Neumann factor interface.

### Trigonometric Eisenstein generators of the arithmetic algebra

Node: `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`. Declaration: `TauCeti.BostConnes.ArithmeticEisenstein` (construction).

For a∈Q/Z and N>0 with Na=0, define e1,a=Σ1≤k<N(k/N−1/2)e(ka) in the rational group algebra. The expression is independent of N. On an invertible one-dimensional Q-lattice it is(1/(2i))cot(πρ(a)) away fromρ(a)=0, and it is0 on that degenerate locus. Define P1(u)=u, Pk+1=(u²−1/4)P′k(u)/k and ek,a=Pk(e1,a). This includes the degenerate normalization Pk(0).

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Prove the finite root-of-unity Abel-summation identity of Lemma3.28.
2. Use the derivative recurrence for the normalized cotangent series.
3. Set the degenerate value equal toPk(0), as dictated by Lemma3.27.

Uses:
- `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests.

API:
- `TauCeti.BostConnes.ArithmeticEisenstein.first` (constructor): The finite rational Fourier sum for e1,a.
- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial` (constructor): Pk with the specified derivative recurrence for k≥1.
- `TauCeti.BostConnes.ArithmeticEisenstein.higher` (constructor): ek,a=Pk(e1,a), including the degenerate locus.
- `TauCeti.BostConnes.ArithmeticEisenstein.finite_sum` (characterisation): For any N>0 annihilating a, first a equals the displayed sum.

Discriminating unit tests:
- `TauCeti.BostConnes.ArithmeticEisenstein.test_zero` (degenerate): e1,0=0 and e2,0=−1/4.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_half` (computation): e1,1/2=0 since the only coefficient is1/2−1/2.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_third` (computation): e1,1/3=−e(1/3)/6+e(2/3)/6.

Prerequisites: `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`; `mathlib:Polynomial`; `mathlib:AddCircle`.

Source: connes-marcolli-2008, Ch.3, §4.4, Lemmas3.27–3.28, (3.91)–(3.101), pp.464–465.

Open proof/interface leaves: Native elaboration.

### Möbius divisibility identities

Node: `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility`. Declaration: `TauCeti.BostConnes.bc_eisenstein_mobius_divisibility` (lemma).

For fn(j)=Σd|j μ(d)(j/d)^n, the projection sum Σd|N fn(d)πd evaluates on a Q-lattice to m^n, where m is the order of its N-torsion kernel. Keep n=1 and n=1−k, including negative exponents.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Write divisibility projections as indicator functions of divisors of m.
2. Use finite Möbius inversion.
3. Retain rational negative powers when deriving the k-division relation.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`; `AnalyticNumberTheory:AN.6`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

### The Eisenstein division formula

Node: `AnalyticNumberTheory:AN.9/bc-eisenstein-division`. Declaration: `TauCeti.BostConnes.bc_eisenstein_division` (lemma).

For k≥1, ΣNa=0 ek,a=γk Σd|N[(2^k−2)f1(d)+N^k f1−k(d)]πd, with γk=(2πi)^(−k)Σy∈Z\{0} y^(−k) in the source normalization (symmetric principal value for k=1; absolute convergence for k>1). For odd k the vanishing is interpreted consistently. Both the arithmetic coefficients and the degenerate-value convention are fixed by the preceding identities.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Count the m-fold fibres of the N-torsion map.
2. Evaluate the nondegenerate trigonometric sum plus the degenerate correction.
3. Replace powers of m by the Möbius projection sums.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`; `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

### Recovering prime-power divisibility projections

Node: `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections`. Declaration: `TauCeti.BostConnes.bc_eisenstein_prime_projections` (lemma).

All projections πp^b belong to the Q-algebra generated by e1,a. For odd p, solve the k=2 division relation inductively in b. For p=2 the leading π2^b coefficient vanishes, so use the relation at N=2^(b+1) to recover π2^b; e.g. π2=3+2Σ4a=0 e2,a.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Compute the leading coefficient−p^(b−1)(2−3p+p²).
2. For p=2 retain the nonzero next projection coefficient at the doubled torsion level.
3. Use coprime products to recover allπN.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-eisenstein-division`; `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

### Recovering roots of unity from Eisenstein functions

Node: `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`. Declaration: `TauCeti.BostConnes.bc_eisenstein_roots_recovery` (lemma).

The rational algebra generated by e1,a contains every e(a). At each prime-power level use the projection1−πp, the power sums of z(j)=(1−πp)e1,j/N and Newton identities; resolve the primitive-root Cayley transform, then add the lower-level πp component inductively.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Use the division relation after multiplying by1−πp to compute the power sums.
2. Apply Newton identities to the finite polynomial with rootsz(j), including the source degree and zero-root multiplicity.
3. Invert the Cayley transform on the nondegenerate component and recover the lower level by induction.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections`; `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

Open proof/interface leaves: Arithmetic generation polynomial identities.

### The trigonometric arithmetic algebra equals the BC rational form

Node: `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`. Declaration: `TauCeti.BostConnes.bc_arithmetic_algebra_generation` (theorem).

The e1,a generate Q[Q/Z]. Together with μn,μn* they generate the arithmetic algebra A1,Q; complexification gives the dense complex algebra. This is BC’s normalized rational form and is compared to the Q-valued Hecke form only through σ−i/2, which is not a star map.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. The finite Fourier formula gives one inclusion.
2. The prime-projection and root-recovery lemmas give the other.
3. Adjoin the isometries and use normal forms for complexification.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`; `AnalyticNumberTheory:AN.9/rational-forms-comparison`; `AnalyticNumberTheory:AN.9/rational-presentation`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

Open proof/interface leaves: Arithmetic generation polynomial identities.

### The Gibbs limit and its uniform tail bound

Node: `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit`. Declaration: `TauCeti.BostConnes.bc_gibbs_tail_limit` (lemma).

For β→∞ the Gibbs states converge weakly to the ε1 vector state, uniformly on each fixed norm-bounded observable set: the difference is at most2||a||(ζ(β)−1)/ζ(β), which tends to0. This supplies completed KMS∞ states.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Separate k=1 from the Gibbs diagonal sum.
2. Bound every matrix coefficient by||a||.
3. Use ζ(β)−1→0 and the normalization difference.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`; `AnalyticNumberTheory:AN.9/gibbs-states`; `AnalyticNumberTheory:AN.9/regular-representation`; `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

### Arithmetic values and symmetry intertwining

Node: `AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry`. Declaration: `TauCeti.BostConnes.bc_arithmetic_values_and_symmetry` (theorem).

For an extremal KMS∞ vector state, e(a) evaluates to the corresponding root of unity and every reduced normal-form monomial with(n,m)≠(1,1) evaluates to0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.

Hypotheses: The carrier, domain and normalization hypotheses in the statement are part of the result.

Proof or construction:
1. Evaluate the normal form on ε1, retaining the coprime-index restriction.
2. Use the rational generation theorem and the cyclotomic root image.
3. Invoke the supplied cyclotomic/class-field character and verify the equality on the basis.

Prerequisites: `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit`; `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`; `AnalyticNumberTheory:AN.9/symmetry-action`; `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

Source: connes-marcolli-2008, Ch.3, §4, pp.454–476.

## Exact target and ownership ledger

**selected multiple Dirichlet series, tubes, matrix equations and singular hyperplanes** (AnalyticNumberTheory:AN.8): `AnalyticNumberTheory:AN.8/characters-mod-eight`, `AnalyticNumberTheory:AN.8/quadratic-double-series`, `AnalyticNumberTheory:AN.8/double-functional-system`, `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`, `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`, `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`, `AnalyticNumberTheory:AN.8/double-R1-convergence`, `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`, `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`, `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero`, `AnalyticNumberTheory:AN.8/tube-overlap-gluing`, `AnalyticNumberTheory:AN.8/tube-hull-extension`, `AnalyticNumberTheory:AN.8/double-series-continuation`.

**PVS integrals, local densities, arithmetic coefficient and local-factor comparisons, global functional equations** (AnalyticNumberTheory:AN.8): `AnalyticNumberTheory:AN.8/pvs-local-zeta`, `AnalyticNumberTheory:AN.8/cubic-shintani-series`, `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`, `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`, `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`, `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`, `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`, `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`, `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`, `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one`, `AnalyticNumberTheory:AN.8/gamma-unit-at-one`, `AnalyticNumberTheory:AN.8/cubic-zero-at-origin`, `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`, `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`, `AnalyticNumberTheory:AN.8/cubic-reflected-bound`, `AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity`.

**compact scalar spectral/Selberg zeta, determinant and trace-formula comparisons** (AnalyticNumberTheory:AN.9): `AnalyticNumberTheory:AN.9/spectral-zeta-series`, `AnalyticNumberTheory:AN.9/selberg-primitive-product`, `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`, `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`, `AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane`, `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`, `AnalyticNumberTheory:AN.9/spectral-regularity-zero`, `AnalyticNumberTheory:AN.9/selberg-log-product`, `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`, `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`, `AnalyticNumberTheory:AN.9/identity-barnes-transform`, `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`, `AnalyticNumberTheory:AN.9/selberg-functional-equation`, `AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison`.

**Bost–Connes algebra, completed dynamics, KMS states, type III1 and arithmetic symmetry** (AnalyticNumberTheory:AN.9): `AnalyticNumberTheory:AN.9/ax-plus-b-pair`, `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`, `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`, `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`, `AnalyticNumberTheory:AN.9/rational-presentation`, `AnalyticNumberTheory:AN.9/rational-forms-comparison`, `AnalyticNumberTheory:AN.9/time-evolution`, `AnalyticNumberTheory:AN.9/regular-representation`, `AnalyticNumberTheory:AN.9/partition-function`, `AnalyticNumberTheory:AN.9/gibbs-states`, `AnalyticNumberTheory:AN.9/kms-states`, `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`, `AnalyticNumberTheory:AN.9/kms-classification`, `AnalyticNumberTheory:AN.9/symmetry-action`, `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`, `AnalyticNumberTheory:AN.9/bc-cstar-completion`, `AnalyticNumberTheory:AN.9/bc-completed-kms`, `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`, `AnalyticNumberTheory:AN.9/bc-normal-form-product`, `AnalyticNumberTheory:AN.9/bc-normal-form-independent`, `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`, `AnalyticNumberTheory:AN.9/bc-real-dynamics-extension`, `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`, `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`, `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`, `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`, `AnalyticNumberTheory:AN.9/bc-local-character-density`, `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection`, `AnalyticNumberTheory:AN.9/bc-critical-ergodicity`, `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`, `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits`, `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`, `AnalyticNumberTheory:AN.9/bc-prime-pair-ratio`, `AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio`, `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`, `AnalyticNumberTheory:AN.9/bc-type-three-one`, `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`, `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility`, `AnalyticNumberTheory:AN.9/bc-eisenstein-division`, `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections`, `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`, `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`, `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit`, `AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry`.

Supplier requests:
- **AnalyticNumberTheory:AN.2**: Supply the exact quadratic first-moment estimate Blomer(16), with squarefree discriminants, four mod8 twists and vertical-strip uniformity; the current AN.0 packet does not certify this exact interface. Consumers: AnalyticNumberTheory:AN.8/quadratic-mean-bound-import.
- **AnalyticNumberTheory:AN.1**: Use the existing Dirichlet-character functional-equation chain with primitive conductor, parity and missing Euler factors; match its output to the four quadratic residue-class factors r in AN.8. Consumers: AnalyticNumberTheory:AN.8/quadratic-reflection-equation.
- **ArithmeticStatistics:ST.0**: Provide bounded-discriminant finiteness and inverse-automorphism-weighted coefficient sums for all locally free cubic O_F-algebras, retaining reducible and nonmaximal rings. Consumers: AnalyticNumberTheory:AN.8/cubic-shintani-series.
- **ArithmeticStatistics:ST.1**: Provide the binary-cubic twisted action, discriminant, local nondegenerate orbit types, trace-divisible dual lattice and adelic parametrization including nonprincipal locally free O_F-modules. Existing Delone–Faddeev nodes are used only in their proved base-ring scope. Consumers: AnalyticNumberTheory:AN.8/pvs-local-zeta, AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient.
- **LogicAndDefinabilityInNumberTheory:LD.3**: Supply specialization and rationality for the selected binary-cubic discriminant integral, with residue bounds, denominator powers and the actual dyadic/triadic exceptions. No general motivic transfer is asserted without its hypotheses. Consumers: AnalyticNumberTheory:AN.8/local-density-coefficient-comparison.
- **AutomorphicLFunctionsAndLocalFactors:AL.0**: Supply local/adelic Schwartz–Bruhat functions, the binary-cubic Fourier pairing and self-dual measures, Poisson summation with the singular-orbit correction, and locally uniform holomorphic parameter integrals. Consumers: AnalyticNumberTheory:AN.8/pvs-local-zeta, AnalyticNumberTheory:AN.8/cubic-adelic-zeta.
- **AdelicAlgebraicGroups:AA.2**: Supply GL2 adelic quotient measure and compatible local Haar factors for the twisted binary-cubic integral; also additive finite-adele measures for the Bost–Connes scaling construction. Consumers: AnalyticNumberTheory:AN.8/pvs-local-zeta, AnalyticNumberTheory:AN.8/cubic-adelic-zeta.
- **ArithmeticStatistics:ST.3**: Supply LOWW Lemma3.5 cubic-extension count over F, including h2(F) and uniform discriminant powers, for the AN.8 reducible/field coefficient estimate. Consumers: AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound.
- **AnalyticNumberTheory:AN.7**: Supply the normalized classical Barnes G-function, its logarithmic derivative and full large-real-s expansion as used in JSS(2.8)–(2.9). This is an extension request; the current AN.7 target pass covers Hurwitz/Lerch and does not yet provide Barnes G. Consumers: AnalyticNumberTheory:AN.9/identity-barnes-transform.
- **ArithmeticLocallySymmetricSpaces:ALS.0**: Supply the connected compact oriented hyperbolic surface Γ\H for a torsion-free cocompact Γ, curvature−1 and area4π(g−1), and the primitive conjugacy-class/length convention used in the scalar Selberg product. Consumers: AnalyticNumberTheory:AN.9/spectral-zeta-series, AnalyticNumberTheory:AN.9/selberg-primitive-product.
- **AutomorphicSpectralTheory:AS.4**: Supply the scalar positive self-adjoint Laplacian, complete discrete eigenbasis, finite multiplicities, simple zero mode, Weyl counting and uniform heat-kernel asymptotics on the selected compact surface. Consumers: AnalyticNumberTheory:AN.9/spectral-zeta-series, AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl, AnalyticNumberTheory:AN.9/heat-small-time-subtraction.
- **AutomorphicSpectralTheory:AS.6**: Supply the compact scalar heat trace formula, the Gaussian test-function extension and geodesic growth, with exactly the primitive-class convention and the identity/hyperbolic constants displayed here. Consumers: AnalyticNumberTheory:AN.9/selberg-primitive-product, AnalyticNumberTheory:AN.9/selberg-log-product, AnalyticNumberTheory:AN.9/scalar-heat-trace-formula.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic**: Supply the Q cyclotomic character and the explicit class-field identification Aut(Q/Z)=Ẑ×=Gal(Qcycl/Q), preserving the source Artin-map convention. The elementary basis-value formula does not require continuity of field automorphisms of C. Consumers: AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry.

## Remaining proof and interface leaves

### Quadratic first-moment proof

Read the complete source behind Blomer(16) and match the uniform first-moment estimate. The selected continuation proof cites it; this pass read its use, not the original large-sieve argument.

Consumers: `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`.

### Bounded tube-domain extension

Read DGH03 Propositions4.6–4.7 and match the shell-to-hull theorem. Mathlib AnalyticOnNhd on C² is a carrier, not the needed extension theorem.

Consumers: `AnalyticNumberTheory:AN.8/tube-hull-extension`.

### General O_F orbit-to-ring adapter

The current ST nodes supply the core orbit/stabilizer dictionary. The extension to nonprincipal locally free cubic modules and its trace-divisible dual lattice need the original Wright/Datskovsky–Wright source proof.

Consumers: `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`, `AnalyticNumberTheory:AN.8/cubic-shintani-series`.

### Binary-cubic local gamma and density tables

Acquire Datskovsky–Wright (1986), Theorems6.1–6.2 and local orbit integrals, and the original Sato–Shintani local functional-equation theorem. Pin self-dual Fourier measure, the s shift and every matrix entry including residue characteristics2 and3. This pass defines the integrals and shell interface, not these unread local proofs.

Consumers: `AnalyticNumberTheory:AN.8/pvs-local-zeta`, `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`.

### Global PVS unfolding and Poisson singular terms

The integral is source-scoped to the binary-cubic representation. Acquire the original Wright global zeta argument and match this action/exponent convention, dual pairing, singular orbit contributions, local products and quotient measure before asserting its full proof closure. LOWW Proposition3.7 reports the resulting analytic theorem but does not reprove this source chain.

Consumers: `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`.

### Original global analytic theorem

Acquire Wright (1985) Theorem4.1 and Datskovsky–Wright (1986) Theorems6.1–6.2, cited in LOWW. The full LOWW statement is read; its original continuation, residue and order-one proofs are not decomposed here.

Consumers: `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`, `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`.

### Local order enumeration

The generating formula is LOWW Lemma3.9, cited from DW86 Theorem6.2. Read its original local proof before refining the order-count Euler factors.

Consumers: `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`.

### Barnes G normalization and asymptotics

Acquire the primary Barnes-function proofs cited in JSS(2.8)–(2.9), match G(1)=1 and the logarithmic branches, and supply the determinant integration constant. The pinned gamma/Mellin declarations do not certify this interface.

Consumers: `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

### Heat and Laplace–Mellin source leaves

Read the complete original heat-kernel/Weyl and JSS Propositions5.4–5.5 proofs, then refine the remainder, trace-class and parameter-integral leaves. The selected JSS §6 proof is read and decomposed; it relies on those earlier/source results.

Consumers: `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`, `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`, `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`, `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`.

### C*-completion and analytic-core operator leaves

Match the exact pinned bounded-operator star/C*-instances and prove the finite-degree l² bound, GNS norm1 bound, universal=reduced amenability comparison and analytic-core strip extension. The packet gives their statements; source-cited general operator-algebra proofs require a pinned-library audit and explicit source refinement; the retired LI.2 stage supplies none.

Consumers: `AnalyticNumberTheory:AN.9/bc-cstar-completion`, `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`, `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`, `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`.

### Measure, Fourier and state-simplex carriers

Match the finite-adele restricted-product measure, compact-character density, Riesz state/measure map, conditional expectations and the KMS Choquet simplex theorem to pinned or requested declarations. Neshveyev 2000 is read in full; these named functional-analytic/arithmetic carrier interfaces remain open.

Consumers: `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`, `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`, `AnalyticNumberTheory:AN.9/bc-local-character-density`, `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`, `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`.

### Ratio-set and von Neumann factor interface

Neshveyev §1–2 is read, including prime-pair and cylinder proofs. Supply the precise nonsingular ratio-set definition, asymptotic-ratio inclusion, compact-quotient lifting, group-measure-space factor and full-corner type invariance. These general operator/measure foundations require an explicit pinned-library audit and source refinement; the retired LI.2 stage supplies none.

Consumers: `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`, `AnalyticNumberTheory:AN.9/bc-type-three-one`.

### Arithmetic generation polynomial identities

The complete Connes–Marcolli Theorem3.30 proof was read. Match the exact Newton/polynomial-root multiplicity declarations and the cotangent finite-sum interface to the pinned libraries; do not hide the prime2 projection step in an undifferentiated generation theorem.

Consumers: `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`, `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`.

### Native carrier signatures

The native file must leave the canonical adelic quotient/Fourier test-space and finite-adele measure carrier signatures out until their supplier adapters are supplied. Corresponding names, API and tests are listed in explicit omission blocks. No unconstrained Prop fields substitute for these conditions; concrete integral/series/scalar/state signatures are given where possible.

Consumers: `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`, `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`.

### Native elaboration

No complete pre-existing build at both pinned revisions is available. The suggested file is uncompiled. Its source-based signatures and finite mathematics checks are not elaboration evidence; match the bounded-operator, polynomial and quotient coercions in the exact build before implementation.

Consumers: `AnalyticNumberTheory:AN.9/ax-plus-b-pair`, `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`, `AnalyticNumberTheory:AN.9/time-evolution`, `AnalyticNumberTheory:AN.9/regular-representation`, `AnalyticNumberTheory:AN.9/gibbs-states`, `AnalyticNumberTheory:AN.9/kms-states`, `AnalyticNumberTheory:AN.9/symmetry-action`, `AnalyticNumberTheory:AN.8/characters-mod-eight`, `AnalyticNumberTheory:AN.8/quadratic-double-series`, `AnalyticNumberTheory:AN.8/double-functional-system`, `AnalyticNumberTheory:AN.8/pvs-local-zeta`, `AnalyticNumberTheory:AN.8/cubic-shintani-series`, `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`, `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`, `AnalyticNumberTheory:AN.9/spectral-zeta-series`, `AnalyticNumberTheory:AN.9/selberg-primitive-product`, `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`, `AnalyticNumberTheory:AN.9/bc-cstar-completion`, `AnalyticNumberTheory:AN.9/bc-completed-kms`, `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`, `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`, `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`.

## Source issues and version collation

### AnalyticNumberTheory/E14

misprint; §4, proof of Proposition 18, formula (7), p. 433 (PDF p. 23 of the author-hosted scan of the published article). Affects: the proof. Known correction: new.

Printed formulation: t_{n,m,γ} = (nm)^{−1/2} e_X, X = double class of [1 γ; 0 n/m].

Correction: X = double class of [1 γ/m; 0 n/m]. For m = 1 the printed formula is right.

Evidence: By the paper's own formulas (1), (3) and (4), (e(γ) ∗ e_{X_m⁻¹})(g) = e_{X_m⁻¹}([1 −γ; 0 1]g), and for g = [1 b; 0 a] the argument [1, b − γa; 0, a] lies in the double class of [1 0; 0 1/m] exactly when a = 1/m and b ∈ γ/m + (1/m)ℤ. So e(γ)μ*_m = m^{−1/2}e_X with X the class of [1 γ/m; 0 1/m], and left multiplication by μ_n multiplies the (2,2) entry by n. The double class of [1 b; 0 n/m] depends only on b mod (1/m)ℤ, so as printed t_{1,2,1/2} = t_{1,2,0} = μ*_2. But e(1/2)μ*_2 = μ*_2 is impossible: its adjoint μ_2 e(−1/2) = μ_2, multiplied on the left by μ*_2, gives e(−1/2) = 1 by relation (a). With the corrected entry, (n, m, γ) ↦ X is a bijection onto the double cosets, which is the linear independence the proof asserts next.

Correction searches: Springer's page for the article (Selecta Math. (N.S.) 1 (1995) 411–457): no erratum or correction listed; a web search for an erratum or corrigendum to the paper: none found; Connes–Marcolli, Chapter 3 §4, which does not reproduce formula (7).

### AnalyticNumberTheory/E18

misprint; §2.1, p.358; arXivv1 p.4. Affects: the proof. Known correction: new.

Printed formulation: ψ2(n)=1 iff n≡3 or5 mod8, and ψ−2(n)=1 iff n≡5 or7 mod8.

Correction: Replace both displayed values1 by−1 for those residue classes; use the character table in the packet.

Evidence: As printed each character takes−1 at1, contradicting multiplicativity and the unit normalization. The corrected rows are the quadratic characters of conductors8 with the stated parities.

Correction searches: Cambridge version-of-record page and published PDF, pp.358,361,364; no linked correction found.; arXiv0907.4867v1 and latest PDF compared: same hash, same slips.; Blomer author publication listing and exact-title erratum/corrigendum search: no correction found..

### AnalyticNumberTheory/E19

misprint; §2.1, (11), p.358; arXivv1 p.4. Affects: the proof. Known correction: new.

Printed formulation: δ₀=4d₀ if ψ=ψ₁,d≡1(4) or ψ=ψ₋₁,d≡3(4).

Correction: For4d0 use ψ=ψ1,d≡3mod4 or ψ=ψ−1,d≡1mod4.

Evidence: For odd squarefree d0, the primitive discriminant is d0 or4d0 according to the residue/parity; for d0=3 the untwisted character has conductor12, not3.

Correction searches: Cambridge version-of-record page and published PDF, pp.358,361,364; no linked correction found.; arXiv0907.4867v1 and latest PDF compared: same hash, same slips.; Blomer author publication listing and exact-title erratum/corrigendum search: no correction found..

### AnalyticNumberTheory/E20

misprint; Lemma2 growth statement, p.361; arXivv1 Lemma2. Affects: a stated result. Known correction: new.

Printed formulation: Polynomial growth is bounded by ((1+Ims)(1+Imw))^C2.

Correction: Use ((1+|Ims|)(1+|Imw|))^C2.

Evidence: The printed bound vanishes at Ims=−1 and can be negative or undefined at negative heights for a real exponent; it is not a symmetric vertical polynomial bound.

Correction searches: Cambridge version-of-record page and published PDF, pp.358,361,364; no linked correction found.; arXiv0907.4867v1 and latest PDF compared: same hash, same slips.; Blomer author publication listing and exact-title erratum/corrigendum search: no correction found..

### AnalyticNumberTheory/E21

misprint; Final tube in the proof of Lemma2, p.364. Affects: the proof. Known correction: new.

Printed formulation: The filled tube is {|Res|²+|Rew|<5}.

Correction: Use {|Res|²+|Rew|²<5}, matching the preceding annular tube.

Evidence: The tube-hull argument fills the disk bounded by4<|Res|²+|Rew|²<5; replacing only one square changes the domain. The central-hole continuation still follows using the corrected disk.

Correction searches: Cambridge version-of-record page and published PDF, pp.358,361,364; no linked correction found.; arXiv0907.4867v1 and latest PDF compared: same hash, same slips.; Blomer author publication listing and exact-title erratum/corrigendum search: no correction found..

### AnalyticNumberTheory/E22

misprint; arXiv2512.16681v1(1.3),(8.6), compared with(8.8); corrected in v2. Affects: a stated result. Known correction: arXiv2512.16681v2,9February2026, equations(1.3),(8.6).

Printed formulation: The leading torsion factor is +dim(Vρ)χ(X)(2ζ′(−1)−log√(2π)).

Correction: Use −dim(Vρ)χ(X)(2ζ′(−1)−log√(2π)).

Evidence: For a torsion-free genusg surface, χ(X)=2−2g=−area/(2π)=−2Cρ/dim(Vρ); the v1 expression therefore contradicts its own positive2Cρ formula(8.8). v2 inserts the missing minus sign.

Correction searches: arXiv latest PDF downloaded and source text collated withv1; v2 corrects the sign.; Exact-title correction search and arXiv record checked; finding is scoped to the preprint versions, not a published version..

The Blomer findings are against the downloaded version of record and independently compared with arXivv1. The JSS sign finding is against arXivv1 and records the already corrected v2; it makes no claim against a published version. The v2 normalization is used in the determinant nodes.

## Native signatures and coverage

No complete existing build at both pinned revisions was available; the file was not compiled. Tests are proposed mathematical obligations written as examples, not checked Lean proofs. Concrete prototypes cover the inherited Hecke core and new character, series, matrix, integral, Shintani coefficient, archimedean coefficient, spectral product, determinant, completed-state and Eisenstein carriers. Native omission blocks list all canonical interfaces and full theorem hypotheses still requiring supplier or source adapters; no placeholder proposition replaces an omitted condition.

**AnalyticNumberTheory:AN.8: planned.**
- Original PVS local/global gamma, density, residue and order-enumeration proofs, including2/3 and nonprincipal modules.
- Quadratic first-moment proof and bounded tube-hull extension; continuation matrices and singular hyperplanes are already target-planned.
- Native adelic quotient carrier adapters and elaboration.

**AnalyticNumberTheory:AN.9: planned.**
- Compact scalar heat/Weyl and Gaussian trace inputs; JSS earlier Laplace–Mellin leaves and Barnes normalization/asymptotics.
- C*-GNS/universal-reduced/analytic-core, state–measure simplex and ratio-set/full-corner supplier interfaces.
- Exact pinned cotangent/Newton and cyclotomic adapters; native elaboration.

## Finite convention checks

The nine groups of exact rational and finite numerical checks below passed on 2026-10-05. They test the source normalizations; they do not certify analytic convergence, omitted supplier interfaces or Lean elaboration.

- All residue products modulo8 and Hadamard orthogonality; E18 corrected signs.
- Exact rational16×16 A²=I; rows1 and3 agree with published(32).
- Involutions on25 rational points; αβ has exact order6 at(2,3).
- All256 evaluated block entries agree with published(33); B(s)B(1−s)=I at four complex points; max relative error8.82e-16.
- E14 half-coset separates afterγ/m; six local shell laws normalize with exact tails; six prime-pair ratios equal(q/p)^β.
- β=2,3 half-root Gibbs values and x2x′2 weights agree with the exact parity identities within the finite-tail bound2/20000.
- Exact finite Fourier sums at orders1,2,3; order6 presentation agrees at order3; degenerate P2(0)=−1/4.
- Complex-place second-order coefficient−π²/4; finite determinant2·3=6 and scaling exponentζ(0)=3.
- Genus2,3,5: corrected−χ=2(g−1)=2C; v1 plus sign disagrees with its own(8.8), as corrected inv2.
