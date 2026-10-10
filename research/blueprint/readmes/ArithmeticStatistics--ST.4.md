# Arithmetic statistics: Selmer sets, rank one and soluble plane cubics

This is the additive ST.4 plan for [issue 6356](https://github.com/CBirkbeck/tauceti-explorer/issues/6356). The [packet](../packets/ArithmeticStatistics--ST.4.json) completes a target-level planning pass for the three source routes in the accepted parent’s remaining list. ST.4 is **planned**, with six mathematical/interface gaps and eighteen supplier requests. Complete describes target coverage. Every implementation status is unchecked; no stage is closed and no theorem is claimed proved.

The [accepted parent](../packets/ArithmeticStatistics.json) and [parent reader](ArithmeticStatistics.md) continue to supply the elliptic two-Selmer average, its local masses and rank bounds. The [ST.1 part](ArithmeticStatistics--ST.1.md) supplies the pencil geometry and orbit dictionaries; the [ST.2 part](ArithmeticStatistics--ST.2.md) supplies the counts and prime tails. Their qualifications and open interfaces remain attached to those imports. This document adds the degree-one hyperelliptic Selmer-set average and its global consequences, the parity mechanism that supplies empty sets, simultaneous algebraic/analytic rank one, and a positive proportion of rationally soluble integral ternary cubics. The prerequisites form a dependency graph organized below by those mathematical constructions, rather than an account of the papers in source order.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap and library trees were also screened read-only at `070dc2becd74419e76303ede84b465ed4a69461f` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular the post-snapshot lattice, Galois, profinite, real-algebraic and restricted-product roadmaps are existing suppliers. The full JacobianChallenge and GlobalQuadraticForms reader documents informed the boundary and granularity checks; the relevant EllipticCurves, RepresentationTheory and AdelicAlgebraicGroups targets were checked for overlap. Generic Picard, descent, Néron, cohomology, representation and adelic constructions stay with their owners.

## Conventions and interfaces

A hyperelliptic model has a squarefree binary form f of degree n=2g+2, g≥1, and equation z²=f(x,y), interpreted in its smooth weighted projective model. It is counted by its n+1 integral coefficients, with H(f)=max_i|a_i|. These are equation models: there is no quotient by changes of binary coordinates or by scalar squares in the denominator. The affine Appendix A statements allow n=2g+1 as well, with n≥3. The coefficient of x² in that appendix is the coefficient with ascending affine index two. Distinguish this convention from descending binary coefficient indices. Singular forms and leading-coefficient-zero forms have negligible coefficient density where they are discarded; their exclusion must be justified by the fixed-degree discriminant locus, rather than by redefining the degree after specialization.

Write J=Pic⁰(C), J¹=Pic¹_{C/Q} and d for the actual rational divisor class of a hyperelliptic fibre, of degree two. A rational point of the relative Picard scheme need not initially be an actual rational line bundle or divisor. Everywhere existence of an actual local degree-one divisor, together with global Brauer reciprocity, removes that obstruction here. Local C-points imply local actual Div¹, while the reverse implication need not hold over a finite completion. An odd-degree global point supplies a rational odd-degree divisor and therefore actual local Div¹; it need not supply a local point of C at each completion. The distinction is used in the bounded-odd-degree conclusion.

Sel₂(J¹) is a set of locally soluble two-covers of the Picard torsor, not the vector space Sel₂(J). Its cardinal is zero when it is empty; when nonempty it is a torsor for the finite Sel₂(J) group. W[2] is the two-cover J¹→J²≅J furnished by the hyperelliptic degree-two class. The actual covering and its local Kummer comparison are imports. The new local-restriction definition uses those supplied maps; it does not manufacture a Selmer group out of an arbitrary finite vector space. The rational Pontryagin dual of Sel_(p∞) has dimension equal to Selmer corank. That corank includes divisible Sha contributions and is not presumed equal to Mordell–Weil rank. Sha^[p] below denotes the finite p-primary quotient of Sha by its maximal divisible subgroup, following Appendix A.6, rather than simply Sha[p]. Poonen–Stoll supplies the special parity comparison between their orders; it is not a rule for arbitrary finite abelian groups.

The stronger coefficient-sieve convention used in the core averages says that every excluded p-adic lift, beyond finitely many primes, reduces into a fixed codimension-at-least-two subscheme. BGW Definition 39 only restricts which residue classes are absent from the allowed p-adic closure. A residue class can contain both allowed and excluded lifts, so those formulations are different. The full locally C-soluble and locally actual-Div¹-soluble families satisfy the stronger convention by the local point criterion. So do admissible families outside finitely many places. The wider printed extension remains in G-large-saturation. Finite-prime constraints must have positive actual global density; separate positive projection measures alone do not exclude coupled CRT conditions.

For elliptic curves use the unique integral minimal short pair E_(A,B):y²=x³+Ax+B and H_BS=max(4|A|³,27B²). The rank-one sieve uses D=−39, p=5 and the 50-dimensional degree-five genus-one covering representation 5⊗∧²(5). It does not use the 40-dimensional quintic-ring representation 4⊗∧²(5). Its group is the determinant-kernel central quotient specified in ST.2’s quinary count. The five-Selmer average is six, and its nonidentity average is five. The accepted parent’s note naming the three-Selmer average for this proof requires correction during assembly.

For ternary cubics the ten coefficients are in the order x³,x²y,x²z,xy²,xyz,xz²,y³,y²z,yz²,z³. The final proportion uses the actual coefficient cube and denominator (2⌊T⌋+1)^10. A rational projective point is a nonzero rational triple where the cubic vanishes. For the invariant-height intermediate count use H_AB=max(|A|³,B²); scaling all coefficients by t scales H_AB by t^12. Ternary invariants must be converted from the ST.2 I,J normalization as specified below. A bounded comparison of two heights transfers positive lower proportions, while an exact average constant needs its exact normalization.

Every count has finite height sublevel sets before a natural cardinal is used. Pinned `Set.ncard` assigns zero to an infinite set; that default is not a way of counting an unbounded orbit family. Local Haar measures give the integral coefficient lattice mass one, while group measures come from one compatible invariant top differential at all places. Product-formula cancellation cannot mix independently chosen Haar normalizations. A claimed average bound means a limsup, and a positive proportion means a positive liminf. Neither wording asserts a limit exists. In the growing-genus theorem height goes to infinity separately for each genus before genus grows.

## Accepted parent targets retained

The following forty-two parent targets are imported unchanged, including their own source repairs and remaining obligations. They are neither re-planned nor re-prototyped in this additive file. Identifier suffixes have prefix `ArithmeticStatistics:ST.4/`.

| Imported suffix | Target |
| --- | --- |
| `rational-orbit-weight` | The orbit weights m(f) and m_p(f) |
| `locally-soluble-forms-attached-to-a-family` | The weighted sets S(F), S_p(F) and S_∞(F) of locally soluble binary quartic forms |
| `local-masses-of-a-family` | The Selmer-weighted local masses M_p(V, F), M_∞(V, F; X) and the archimedean mass M_∞(F; X) |
| `average-over-a-height-ordered-family` | Averages of arithmetic functions over a height-ordered family |
| `orbit-weight-as-a-stabilizer-sum` | The orbit weight as a sum of stabilizer ratios |
| `cartan-decomposition-of-pgl2-over-qp` | The Cartan decomposition of GL_2(Q_p) and PGL_2(Q_p) |
| `nonintegral-local-translates-force-square-discriminant` | A non-integral translate of an integral form forces p² | Δ |
| `class-number-one-for-pgl2-over-q` | PGL_2 over Q has class number one |
| `global-weight-is-product-of-local-weights` | Global weights are products of local weights (Proposition 3.6) |
| `count-of-squarefree-monic-polynomials-over-a-finite-field` | The number of squarefree monic polynomials over a finite field |
| `count-of-nonsingular-binary-quartic-forms-over-a-finite-field` | The number of binary quartic forms with nonzero discriminant over F_q |
| `nonsingular-binary-quartic-forms-over-finite-fields-are-soluble` | Every nonsingular binary quartic form over F_p (p odd) is soluble |
| `local-solubility-away-from-square-discriminant` | An insoluble form at an odd prime has discriminant divisible by p² |
| `local-weights-and-solubility-are-locally-constant` | The local weight m_p and Q_p-solubility are locally constant off Δ = 0 |
| `real-solubility-of-binary-quartic-forms` | Real solubility of binary quartic forms |
| `jacobian-of-the-orbit-map` | The Jacobian of the orbit map (PGL_2 × A², ω ∧ dI ∧ dJ) → (V, dv) is the constant −1/27 |
| `volume-of-pgl2-zp` | The volume of PGL_2(Z_p) for the measure |ω|_p |
| `p-adic-change-of-measure-for-binary-quartic-forms` | The p-adic change-of-measure formula for binary quartic forms (Proposition 3.7) |
| `weighted-p-adic-change-of-measure` | The change of measure weighted by 1/m_p (Corollary 3.8) |
| `local-mass-formula-for-locally-soluble-forms` | The local mass formula (Proposition 3.9) |
| `two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup` | #(G/2G) = |2|_p^{-1}·#G[2] for an abelian group with a finite-index subgroup isomorphic to Z_p |
| `local-two-descent-index` | The local 2-descent index (Lemma 3.20) |
| `archimedean-selmer-ratio-is-one-half` | The archimedean ratio #(E(R)/2E(R))/#E(R)[2] = 1/2 |
| `local-selmer-mass-ratios` | The local mass ratios (74) |
| `locally-soluble-set-is-cut-out-by-local-conditions` | S(F) is cut out by the local sets S_p(F) and S_∞(F) |
| `selmer-count-as-weighted-orbit-count` | Nonidentity 2-Selmer elements as a weighted count of integral orbits |
| `count-of-locally-soluble-orbits-in-a-large-family` | The weighted count of locally soluble orbits is a product of local densities |
| `bad-forms-have-square-discriminant` | Forms bad at an odd prime have discriminant divisible by p² (Proposition 3.18) |
| `count-of-real-soluble-integral-orbits` | The number of R-soluble integral orbits of bounded height |
| `lattice-points-of-bounded-invariant-height` | Lattice points (I, J) of bounded height in residue classes |
| `tail-estimate-for-square-divisors-of-the-discriminant` | Uniform tail estimate: curves whose discriminant is divisible by p² for some large p |
| `uniformity-estimate-for-elliptic-curves` | The number of curves with p² | Δ is O(X^{5/6}/p^{3/2}) (Proposition 3.16) |
| `count-of-curves-in-a-large-family` | The number of elliptic curves of bounded height in a large family (Theorem 3.17) |
| `selmer-average-as-product-of-local-masses` | The Selmer average as a product of local masses (Theorem 3.19) |
| `tamagawa-number-of-pgl2-is-two` | The Tamagawa number of PGL_2 over Q is 2 |
| `average-size-of-the-2-selmer-group-is-three` | Theorem 3.1: the average size of S_2(E) over a large family is 3 |
| `families-of-theorems-1-1-and-1-3-have-positive-local-masses` | All curves, individual congruence classes and semistable curves have positive local masses |
| `average-selmer-size-over-all-curves-and-congruence-families` | Theorems 1.1 and 1.3: average size 3 over all curves, congruence families and semistable curves |
| `two-selmer-rank-identity` | The 2-Selmer rank identity (2) |
| `rational-two-torsion-has-density-zero` | 0% of elliptic curves have rational 2-torsion |
| `rank-bound-from-the-selmer-average` | Corollary 1.2: average 2-Selmer rank and average rank at most 1.5 |
| `average-two-rank-of-sha-is-at-most-three-halves` | The average of r_2(Ш_E[2]) is at most 1.5 and the average of r_2(E(Q)[2]) is 0 |

The six parent planets are retained: Local masses of 2-coverings, Elliptic curves of bounded height in a large family, Selmer average as a product of local masses, Tamagawa number of PGL_2, Average size of the 2-Selmer group, Boundedness of the average rank. This part adds zero planets. Any replacement is a choice for the assembled layer as a whole.

## Target interfaces

Each new identifier has prefix `ArithmeticStatistics:ST.4/refinement-`; proposed declarations use namespace `ArithmeticSelmerRefinement`. A theorem’s hypotheses are part of its statement. The paths end in actual pinned declarations, imported nodes, precise requested stages or the named gaps. A requested supplier is not a proved prerequisite.

### Hyperelliptic averages

#### Admissible hyperelliptic congruence families

Target `refinement-admissibility`; proposed name `ArithmeticSelmerRefinement.IsAdmissible`.

For n=2g+2 with g≥1 and a congruence family F of integral binary forms, let L_p be its actual p-adic coefficient closure. The added admissibility predicate says that there is P such that, for every prime p>P, L_p contains every coefficient tuple a for which z²=Σ_i a_i x^(n−i)y^i has a Q_p-point with (x,y)≠(0,0). Smooth nonzero-discriminant models suffice: for closed L_p, point-bearing singular equations lie in their closure by point-preserving smooth perturbation. This predicate supplements the imported congruence-family definition; it does not assert positive density, local Div¹-solubility at small places or admissibility of an arbitrary collection of local sets.

**Construction or proof.** 1. Use ST.0 coefficient models and the actual local closures from ST.2. 2. At each sufficiently large prime impose inclusion of the point-bearing locus. Closedness permits smooth perturbation; changing finitely many local conditions preserves the predicate.

**Direct inputs.** `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `mathlib:PadicInt`.

**Uses that determine the API.** BGW Theorem 5 and Theorem A.2: The parity construction changes finitely many primes and uses local points to retain all four twists outside them.

**Planning API.**

- `ArithmeticSelmerRefinement.admissible_threshold` (characterisation): Admissibility is equivalent to a single integer threshold beyond which all local point-bearing tuples are allowed.
- `ArithmeticSelmerRefinement.admissible_mono` (functoriality): If L_p⊆M_p for every prime and L is admissible, M is admissible.
- `ArithmeticSelmerRefinement.admissible_finite_change` (compatibility): If L is admissible and L_p=M_p beyond a fixed threshold, M is admissible.
- `ArithmeticSelmerRefinement.admissible_of_local_points` (constructor): Containing the local point locus at every prime implies admissibility.

**Discriminating unit tests.** These same names label the examples in the suggested file.

- `ArithmeticSelmerRefinement.admissible_univ` (example): All local coefficient sets equal to the whole space satisfy the predicate.
- `ArithmeticSelmerRefinement.admissible_finite_exclusion` (degenerate): Taking the empty set for p≤P and the whole space for p>P passes the local threshold predicate. A family application must separately verify that its local inputs are actual closures; this test only checks finite-place insensitivity.
- `ArithmeticSelmerRefinement.admissible_empty_nonexample` (non-example): Taking every local coefficient set empty is not admissible: the form x^n+y^n has the point (1,0,1) at arbitrarily large primes.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Definition 43 p.34.

#### Degree-one torsors and odd-degree points

Target `refinement-degree-one-arithmetic-comparison`; proposed name `ArithmeticSelmerRefinement.degree_one_arithmetic_comparison`.

For a smooth hyperelliptic C/Q of genus g≥1 with a Q-rational degree-two hyperelliptic divisor class d represented by a divisor, and actual degree-one divisors over every completion, every rational Picard-scheme point descends to an actual line bundle/divisor. Thus J¹(Q)≠∅ iff C has a point over some finite odd-degree extension iff index(C)=1; otherwise index(C)=2. Here index is the positive generator of the degree subgroup of rational divisors, not the minimum degree of a closed point.

**Construction or proof.** 1. Apply the Picard/Brauer obstruction sequence and global-to-local injectivity of Br(Q); local actual Div¹ kills the obstruction. 2. Trace an odd-degree point, then subtract ((k−1)/2)d. Conversely an odd-degree rational divisor must involve an odd-degree closed point. The rational degree-two divisor forces the index to divide two.

**Direct inputs.** `JacobianChallengePartII:JC0/picard-torsors`, `JacobianChallengePartII:JC4/actual-to-relative-obstruction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Introduction pp.1–4, Theorems 1,2,12.

#### Generic nontrivial Weierstrass class

Target `refinement-generic-weierstrass-class`; proposed name `ArithmeticSelmerRefinement.generic_weierstrass_class`.

In the coefficient-height genus-g model family, after a density-zero exceptional set, W[2], the two-cover J¹→J²≅J, is nonzero in Sel₂(J) and J(Q)[2]=0. Both assertions also hold relatively inside every sieve-controlled congruence subfamily of positive lower density with locally soluble actual Div¹.

**Construction or proof.** 1. Identify W[2]-points with odd factorisations and nonzero rational two-torsion with even factorisations, including quadratically conjugate factors. 2. Hilbert irreducibility gives full symmetric Galois group away from a density-zero set. Restrict using positive-density denominator comparison.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `ArithmeticStatistics:ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density`.

**Acceptance.** For n=4, S4 has no invariant odd partition and no nontrivial even partition modulo complement; no claim is made about each exceptional polynomial.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Introduction p.2 and Theorem 5 proof pp.3–4.

#### Global weights for soluble pencils

Target `refinement-pencil-local-global-weight`; proposed name `ArithmeticSelmerRefinement.pencil_local_global_weight`.

For G=SL_(2g+2)/μ₂ acting on pairs of symmetric matrices, define w(v) as the reciprocal of the imported finite rational-orbit weight when v is locally soluble and its invariant belongs to F, and zero otherwise. The global weight is the product of its integral-local counterparts, is locally constant off the discriminant locus, and equals one at sufficiently large odd primes with p²∤Disc(f). The group is the central quotient as an algebraic group; rational points cannot be replaced by SL_n(Q)/{±1}.

**Construction or proof.** 1. Use the finite transporter/stabilizer formula already owned by the parent. 2. Patch local integral representatives using the exact class-number-one integral orbit statement for this quotient, requested from AA.4. Good-prime uniqueness comes from the ST.1 import.

**Direct inputs.** `ArithmeticStatistics:ST.4/rational-orbit-weight`, `ArithmeticStatistics:ST.4/orbit-weight-as-a-stabilizer-sum`, `ArithmeticStatistics:ST.1/refinement-good-prime-integral-pencils`, `AdelicAlgebraicGroups:AA.4`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §11 pp.31–32, (19) and cited weight factorisation.

#### Selmer sets as weighted rational pencil counts

Target `refinement-pencil-selmer-weighted-count`; proposed name `ArithmeticSelmerRefinement.pencil_selmer_weighted_count`.

For F with locally soluble actual Div¹ and coefficients in 16Z, the sum of #Sel₂(J¹_f) over H(f)<X is at most the sum of the weighted integral-orbit counts N_w over the real soluble components, plus o(X^(n+1)), after generic rational stabilizers are separated. The left side itself equals the unweighted rational locally soluble orbit count represented integrally. An individual rational class with integral representatives v_i satisfies Σ_i w(v_i)/#Stab_Z(v_i)=1/#Stab_Q(v). One may use Σ_i w(v_i)=1 only when the rational stabilizer is trivial.

**Construction or proof.** 1. Scale the invariant by 16, using κ=4 and z↦4z; transport the Selmer set through the curve isomorphism. 2. Apply the orbit bijection and the existing stabilizer sum. Bound stabilizers by 2^(2g); request the weighted exceptional-stabilizer estimate in the unbounded fundamental domain rather than using coefficient density zero alone.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight`, `ArithmeticStatistics:ST.4/orbit-weight-as-a-stabilizer-sum`, `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 40 pp.31–32, (18)–(20).

#### Local two-cover mass ratios

Target `refinement-hyperelliptic-local-mass-ratio`; proposed name `ArithmeticSelmerRefinement.hyperelliptic_local_mass_ratio`.

For an abelian variety J/Q_v of dimension g and a nonempty J-torsor T(Q_v), the finite torsor quotient T(Q_v)/2J(Q_v) has the same cardinality as J(Q_v)/2J(Q_v). For the hyperelliptic Jacobian this gives ρ_v=#(J¹(Q_v)/2J(Q_v))/#J[2](Q_v): ρ_∞=2^(−g), ρ_2=2^g and ρ_p=1 for odd p. Thus Π_vρ_v=1. The quotient numerator is not the number of rational points, and an empty local torsor is excluded.

**Construction or proof.** 1. Choose a torsor point only to identify the two finite quotients; show cardinal independence of that choice. 2. Use the p-adic finite-index Z_p^g subgroup calculation and compact real Lie-group multiplication-by-two index. Their exceptional factors cancel.

**Direct inputs.** `JacobianChallengePartII:JC0/picard-torsors`, `ArithmeticStatistics:ST.4/two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup`, `AdelicAlgebraicGroups:AA.2`, `HeightsRationalPointsAndObstructions:RP.1`.

**Acceptance.** At g=1 the real and 2-adic factors are 1/2 and 2; at g=2 they are 1/4 and 4. Do not reuse the elliptic formula with g fixed to one.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §11 p.32, local factors following (20).

#### Pencil orbit Jacobians and local integrals

Target `refinement-pencil-measure-comparison`; proposed name `ArithmeticSelmerRefinement.pencil_measure_comparison`.

Fix integral invariant top forms dτ on G and dμ on coefficient A^(n+1), with μ_∞ Euclidean and μ_p(Z_p^(n+1))=1. A single nonzero rational orbit-Jacobian constant 𝒥 satisfies c_(m,r)X^(n+1)=|𝒥|_∞τ_∞(G(Z)\G(R)) μ_∞({f∈I(m):H(f)<X})/#J[2](R), and ∫w_p(v)dv=|𝒥|_pτ_p(G(Z_p))μ_p(F_p)ρ_p. Sum over the soluble real orbit components r, whose count is #(J¹(R)/2J(R)). All factors use the same algebraic-group differential; independently normalized Haar volumes cannot be substituted.

**Construction or proof.** 1. Use the invariant-map Jacobian formula on the regular orbit locus and disintegrate the measure with stabilizers. 2. Integrate the reciprocal orbit weights so one rational local class has mass 1/#Stab. Sum real soluble components before applying the product formula.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio`, `ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight`, `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count`, `AdelicAlgebraicGroups:AA.2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §11 p.32, two displayed mass identities.

#### Tamagawa number of the even special-linear central quotient

Target `refinement-tamagawa-central-quotient`; proposed name `ArithmeticSelmerRefinement.tamagawa_central_quotient`.

For every even n≥4, the split Q-group G=SL_n/μ₂ has Tamagawa number two, for the adelic measure attached to an integral invariant top differential and the matching convergence convention. G(Q) is the group-scheme quotient’s rational points, not the naive quotient of SL_n(Q) by its rational centre. The rational Jacobian constant in the orbit integral changes no Tamagawa value.

**Construction or proof.** 1. Import the simply connected Tamagawa theorem and the central-isogeny volume formula from AdelicAlgebraicGroups, Part II. Compute the correction for the diagonal μ₂ kernel in even degree. 2. Check the global/local squareclass defect and the common differential normalization; the required general formula and its proof-source verification are gap G-tamagawa.

**Direct inputs.** `AdelicAlgebraicGroups:AA.2`.

**Acceptance.** Do not replace this value by τ(SL_n)=1 or by the parent’s distinct PGL₂ calculation.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 41 p.33, τ(G) in (21); accepted paper route item 48.

#### Weighted hyperelliptic numerator bound

Target `refinement-hyperelliptic-weighted-upper-bound`; proposed name `ArithmeticSelmerRefinement.hyperelliptic_weighted_upper_bound`.

Let n=2g+2, g≥1, and let F be a positive-mass sieve-controlled congruence family contained in the locally actual-Div¹-soluble locus, with all coefficients in 16Z. The Selmer numerator is at most 2 μ_∞({f:H(f)<X}) Π_p μ_p(F_p)+o_F(X^(n+1)). Real root strata are summed, and τ(SL_n/μ₂)=2 is the preceding central-quotient target, with an explicit general-formula supplier gap. This is an upper bound; the infinite-weight count supplies no matching lower bound.

**Construction or proof.** 1. Apply ST.2’s one-sided infinite-weight bound. Multiply the compatible local integrals and real components. 2. Cancel Π_v|𝒥|_v and Π_vρ_v using the product formula. Use the exact Tamagawa number of the central quotient, not that of simply connected SL_n.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-pencil-selmer-weighted-count`, `ArithmeticStatistics:ST.4/refinement-pencil-measure-comparison`, `ArithmeticStatistics:ST.2/refinement-pencil-infinite-weight-upper-bound`, `ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient`.

**Acceptance.** The numerator constant is two, with no extra identity class; the source’s 16^n divisibility is replaced by the sufficient 16Z condition.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 41 p.33, (21).

#### Average size of the degree-one two-Selmer set

Target `refinement-hyperelliptic-average-two`; proposed name `ArithmeticSelmerRefinement.hyperelliptic_average_two`.

For each g≥1, coefficient-height ordering of all smooth integral degree-(2g+2) binary models whose actual Div¹ is soluble over every completion has limsup average #Sel₂(J¹)≤2. The same holds in positive-mass congruence families for which excluded p-adic coefficients, at every sufficiently large p, reduce into a fixed codimension-at-least-two coefficient subscheme. In particular it holds for the full locally C-soluble and locally Div¹-soluble families and admissible positive-mass families restricted to local Div¹. Existence of an average equal to two is not asserted. The full printed reduction-only Definition 39 extension requires the saturation repair recorded as a gap.

**Construction or proof.** 1. Sieve the coefficient denominator with the uniform excluded-prime tail O(X^(n+1)/M)+O(X^n), obtaining c_FX^(n+1)+o with c_F>0. Local-solubility failure reduces to the scalar-square locus by Poonen–Stoll Lemma 15 and A.5(3). 2. Divide the numerator upper bound by the actual positive denominator. Remove the 16 scaling by the imported height and curve-isomorphism transport.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-hyperelliptic-weighted-upper-bound`, `ArithmeticStatistics:ST.2/refinement-large-coefficient-family-tail`, `ArithmeticStatistics:ST.4/average-over-a-height-ordered-family`, `ArithmeticStatistics:ST.0/constant-rescaling-of-a-height`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.2`, `ArithmeticStatistics:ST.4/refinement-odd-residue-field-models`, `HeightsRationalPointsAndObstructions:RP.1`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 6 p.3; Proposition 42 and proof pp.33–34.

#### Selmer sets with local effective-divisor restrictions

Target `refinement-restricted-selmer-set`; proposed name `ArithmeticSelmerRefinement.restrictedSelmerSet`.

Given a finite set S, places V, actual local targets Q_v, localisation maps loc_v:S→Q_v (or maps from a containing carrier), and local images I_v⊆Q_v, define restrictedSelmerSet={s∈S:∀v,loc_v(s)∈I_v}. For the order-k application S=Sel₂(J¹), k>0 odd, Q_v=J¹(Q_v)/2J(Q_v), and I_v is the image of effective degree-k divisors e under e−((k−1)/2)d. Use effective divisors over Q_v, including conjugate pairs, rather than only k-tuples of Q_v-points. The torsor-cover/local-orbit dictionary giving loc_v is imported from ST.1 and must be natural under local choices.

**Construction or proof.** 1. Intersect the pullbacks of the effective-divisor images with the finite Selmer set. 2. The construction is independent of the presentation of candidates. Translate torsor identifications and divisor images together; adding d proves the geometric order-k to order-(k+2) inclusion.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `JacobianChallengePartII:JC2/degree-abel-map`, `mathlib:Set.ncard`.

**Uses that determine the API.** BGW Theorem 7: Local effective-divisor images restrict the full two-Selmer set before the archimedean sieve. BGW Corollary 8: An effective global odd-degree divisor yields a member of the corresponding restricted set.

**Planning API.**

- `ArithmeticSelmerRefinement.restricted_mem` (characterisation): Membership requires membership in S and every local condition.
- `ArithmeticSelmerRefinement.restricted_subset` (relation): The restricted set is contained in S.
- `ArithmeticSelmerRefinement.restricted_finite` (structure): If S is finite, its restricted set is finite.
- `ArithmeticSelmerRefinement.restricted_mono` (functoriality): Enlarging every I_v enlarges the restricted set. Applying this to I_k⊆I_(k+2) gives the order inclusion.
- `ArithmeticSelmerRefinement.restricted_card_le` (compatibility): For finite S, the natural cardinal of its restriction is at most S.ncard.
- `ArithmeticSelmerRefinement.restricted_transport` (equivalence): For an equivalence e:A≃B, transporting S and precomposing loc with e⁻¹ transports the restricted set by e.

**Discriminating unit tests.** These same names label the examples in the suggested file.

- `ArithmeticSelmerRefinement.restricted_one_place` (example): For S=Fin 3, identity localisation at one place and image {0,2}, the restriction is {0,2}.
- `ArithmeticSelmerRefinement.restricted_all_places` (non-example): For two identity localisations with images {0,1} and {1,2}, the answer is {1}, not their union.
- `ArithmeticSelmerRefinement.restricted_no_places` (degenerate): With no places the restriction is S.
- `ArithmeticSelmerRefinement.restricted_empty_image` (degenerate): An empty image at one place makes the restriction empty.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Order-k definition p.3 and Theorem 7 proof pp.33–34.

#### Odd subsets of real components

Target `refinement-odd-component-bound`; proposed name `ArithmeticSelmerRefinement.oddComponentBound`.

Define S_m(k)=Σ_(0≤j≤k,j odd) binomial(m,j), with binomial(m,j)=0 for j>m; the empty sum is zero. For m≥1 the normalized component bound is S_m(k)/2^(m−1). This numerical construction records the image bound from degree-k real divisors; it is not asserted to equal the geometric image cardinal in every real model.

**Construction or proof.** 1. Count odd subsets of connected components. Each real point contributes its component mod two; a conjugate pair contributes zero. 2. Use finite binomial sums and the exponential denominator to obtain the stated API.

**Direct inputs.** `mathlib:Nat.choose`.

**Uses that determine the API.** BGW Theorem 7 proof p.34: Bounds the fraction of locally soluble real orbits coming from degree-k effective divisors; fixed k and growing m force the ratio to zero.

**Planning API.**

- `ArithmeticSelmerRefinement.component_bound_mono` (functoriality): S_m(k)≤S_m(l) for k≤l.
- `ArithmeticSelmerRefinement.component_bound_le` (relation): For m>0, S_m(k)≤2^(m−1).
- `ArithmeticSelmerRefinement.component_bound_saturated` (characterisation): For m>0 and k≥m, S_m(k)=2^(m−1).
- `ArithmeticSelmerRefinement.component_bound_strict` (relation): For m>0, k odd and k<m−1, S_m(k)<2^(m−1).
- `ArithmeticSelmerRefinement.component_bound_ratio_tendsto` (compatibility): For each fixed k, S_m(k)/2^(m−1) tends to zero as m→∞.

**Discriminating unit tests.** These same names label the examples in the suggested file.

- `ArithmeticSelmerRefinement.component_three_one` (example): S_3(1)=3, distinguishing the missing third-degree contribution.
- `ArithmeticSelmerRefinement.component_five_three` (example): S_5(3)=15, strictly smaller than 16.
- `ArithmeticSelmerRefinement.component_zero` (degenerate): S_m(0)=0 for every m.
- `ArithmeticSelmerRefinement.component_saturation` (example): S_3(9)=4: terms above m vanish and even terms stay excluded.
- `ArithmeticSelmerRefinement.component_single` (example): S_1(k)=1 for k>0.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 7 proof p.34, S_m(k) and (23).

#### Real Picard images of effective odd-degree divisors

Target `refinement-real-effective-divisor-image`; proposed name `ArithmeticSelmerRefinement.real_effective_divisor_image`.

Let C/R be a smooth genus-g hyperelliptic curve with 2m real branch points and m>0. Its m real components give #J(R)/2J(R)=2^(m−1). For k>0 odd, the image of actual effective degree-k R-divisors in J¹(R)/2J(R), after translation by ((k−1)/2)d, has cardinal at most S_m(k). Conjugate nonreal pairs have trivial class modulo 2J(R), and 2P−d∈2J(R) for real P. The m=0 cases require their own soluble real components and are only bounded by the full local quotient.

**Construction or proof.** 1. Compute the x−T descent value of a conjugate pair using a positive real norm at each real root. 2. Reduce effective divisors to parity subsets of the m components. Count the possible odd subsets, with no assumption that every image class is attained.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-restricted-selmer-set`, `ArithmeticStatistics:ST.4/refinement-odd-component-bound`, `JacobianChallengePartII:JC2/degree-abel-map`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 7 proof pp.33–34.

#### Strict average bound for fixed small odd degree

Target `refinement-order-k-strict-average`; proposed name `ArithmeticSelmerRefinement.order_k_strict_average`.

For k>0 odd and k<g, the limsup average cardinality of the order-k two-Selmer set over the full coefficient-height family of locally soluble genus-g hyperelliptic models is strictly below two. The same conclusion applies to positive-mass sieve-controlled finite-prime congruence subfamilies that retain positive measure of the fully split real stratum. No conclusion is made for a family whose real restrictions delete that stratum.

**Construction or proof.** 1. Sieve the numerator by the real effective-divisor image and by the remaining local images. 2. The fully split stratum has m=g+1 and positive Euclidean volume. There S_(g+1)(k)<2^g, giving a strictly smaller real mass in the compatible upper-bound calculation.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image`, `ArithmeticStatistics:ST.4/refinement-odd-component-bound`, `ArithmeticStatistics:ST.2/refinement-pencil-infinite-weight-upper-bound`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 7 pp.3,33–34.

#### Vanishing restricted Selmer averages as genus grows

Target `refinement-order-k-vanishing-average`; proposed name `ArithmeticSelmerRefinement.order_k_vanishing_average`.

For fixed k>0 odd, let A_(g,k) be the limsup coefficient-height average of the order-k two-Selmer set over either the full locally C-soluble or the full locally actual-Div¹-soluble genus-g model family. Then A_(g,k)→0 as g→∞. Height tends to infinity first, separately for each g. The statement is not a uniform joint estimate in height and genus and does not apply to arbitrary genus-dependent real subfamilies.

**Construction or proof.** 1. For a fixed component cutoff M, control the many-component real strata by sup_(m≥M) S_m(k)/2^(m−1). 2. Uniform independent coefficients on [−1,1] satisfy the fixed-few-root probability theorem; a finite sum over each bounded real-root count tends to zero. Handle zero-root/no-point strata and compare the locally soluble denominator with the full coefficient denominator, using a genus-uniform positive lower bound (e.g. the cited >75% local-solubility bound). 3. Take genus→∞, then M→∞. No log n/log log n endpoint estimate is needed.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image`, `ArithmeticStatistics:ST.4/refinement-odd-component-bound`, `ProbabilisticAndMetricNumberTheory:PM.1`, `ArithmeticStatistics:ST.0`.

**Acceptance.** Supply the genus-uniform local-solubility denominator comparison, not merely a different positive constant for each genus.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 7 and (23) p.34.

#### Absence of bounded odd-degree points in large genus

Target `refinement-small-odd-degree-points-disappear`; proposed name `ArithmeticSelmerRefinement.small_odd_degree_points_disappear`.

For every fixed positive integer m, the lower density, among all smooth genus-g coefficient-height hyperelliptic models, of curves with no point over any odd-degree extension of degree≤m tends to one as g→∞. Height tends to infinity first. All extensions are included, not only Galois extensions or rational points.

**Construction or proof.** 1. Choose the largest odd k≤m. Trace any point of smaller odd degree and add copies of the effective degree-two hyperelliptic fibre to reach k. 2. A global effective divisor gives a locally soluble cover in the restricted Selmer set. Markov’s inequality bounds the fraction with such a point by the average restricted cardinal; multiply by the locally soluble fraction, which is at most one. Curves not locally soluble already have no global point, but an odd-degree point need not give local C-points; use the locally actual-Div¹-soluble version of the average and its uniform denominator bound for this transfer.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-restricted-selmer-set`, `ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.0`.

**Acceptance.** Do not assume an odd-degree global point implies C(Q_v)≠∅. It gives actual Div¹(Q_v), which is the required family for the extended order-k argument.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Corollary 8 p.3.


### Parity and global consequences

#### Selmer parity from Brauer regulator constants

Target `refinement-selmer-regulator-parity`; proposed name `ArithmeticSelmerRefinement.selmer_regulator_parity`.

Let A/K be principally polarized, F/K finite Galois with group G, p prime, and Θ=Σ_i n_i H_i a Brauer relation (Σ_i n_i Ind_(H_i)^G 1=0). For each self-dual irreducible Q_p-representation ρ let m_ρ be its multiplicity in the rational Pontryagin dual X_p(A/F) of Sel_(p∞). Put S_Θ={ρ:ord_p C(Θ,ρ) odd}. Then Σ_(ρ∈S_Θ)m_ρ≡ord_p Π_i( c̃_(A/F^Hi)·#Sha_(A/F^Hi)^[p])^(n_i) mod 2. Here c̃=Π_(finite v)c_v|ω/ω_v^Néron|_v for a fixed global invariant top differential; Sha^[p] is the finite p-primary part of Sha modulo its maximal divisible subgroup. No finiteness of all Sha is assumed and the p=2 factor may not be dropped.

**Construction or proof.** 1. Import self-duality and the isogeny-quotient formula for Selmer duals; retain the finite Sha quotient from that formula. 2. Use regulator-constant multiplicativity on the self-dual decomposition. Non-self-dual dual pairs have square regulator constant. At odd p the finite Sha contribution is a square; at p=2 use the formula before removing the polarization obstruction.

**Direct inputs.** `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L1`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis. Sha^[p] means the finite p-primary quotient modulo divisibles, rather than Sha[p]; any parity comparison between their orders must use the Poonen–Stoll pairing theorem. The exponent n_i belongs on each factor in the Brauer product. The p=2 formula retains Sha when the polarization is not known to come from a rational divisor.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem A.7 pp.37–38.

#### Biquadratic parity with the finite Sha quotient

Target `refinement-biquadratic-parity-formula`; proposed name `ArithmeticSelmerRefinement.biquadratic_parity_formula`.

For every principally polarized A/K and biquadratic F=K(√α,√β), the sum of the four 2∞-Selmer coranks of A,A^α,A^β,A^(αβ) over K is congruent modulo two to ord₂[c̃_(K√α)c̃_(K√β)c̃_(K√αβ)/(c̃_F c̃_K²)] plus ord₂[#Sha^[2]_(K√α)#Sha^[2]_(K√β)#Sha^[2]_(K√αβ)/(#Sha^[2]_F (#Sha^[2]_K)²)]. All A subscripts in the local products refer to the same base-changed A. The coranks of twists come from the four character multiplicities, not from a presumed equality with Mordell–Weil ranks.

**Construction or proof.** 1. Use Θ={1}−H_α−H_β−H_(αβ)+2G. Each of the four one-dimensional characters has regulator constant square class two. 2. Identify each character multiplicity by quadratic descent. Reversing the quotient in the integer valuation leaves its parity unchanged.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Corollary A.8 pp.38–39.

#### Four-twist parity from a single split node

Target `refinement-four-twist-local-parity`; proposed name `ArithmeticSelmerRefinement.four_twist_local_parity`.

Let F=K(√α,√β) be biquadratic and let p₀ have a unique prime above it. Let C/K be a smooth curve with Jacobian J. Require C(K_p₀)≠∅ and split semistable reduction of J of toric rank one at p₀. At every other finite prime with a unique prime above it, require C(K_p)≠∅ and good reduction of J. The sum of the four 2∞-Selmer coranks is odd. If all four twists of C also have local points at every prime with a unique prime above it, the sum of the four finite 2-Selmer dimensions is odd. At other places decomposition groups are cyclic and their Brauer local products cancel.

**Construction or proof.** 1. Group modified Tamagawa and deficiency contributions by places of K. Use cyclic decomposition cancellation at places with more than one prime above them. 2. Actual local points kill deficiency; good reduction kills all remaining terms except p₀. The split toric-rank-one monodromy factor gives square class two there. 3. Compare finite Selmer dimension with 2∞ corank, rational two-torsion and the finite Sha quotient. The four twists have the same two-torsion and their deficiency contributions cancel under the additional point hypothesis.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-biquadratic-parity-formula`, `SelmerIwasawaCohomology:L1`, `NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`.

**Acceptance.** The extra four-twist local-point hypothesis is required for finite Selmer dimensions. Never say every odd prime splits completely in Q(i,√2).

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem A.3 p.36 and proof p.39.

#### A congruence family with both corank parities

Target `refinement-mod-eight-parity-family`; proposed name `ArithmeticSelmerRefinement.mod_eight_parity_family`.

For squarefree f(x)=Σ_(i=0)^n a_ix^i over Q, n≥3 and n∈{2g+1,2g+2}, suppose a₂≡1 mod8, a_(2g+1)≡4 mod8 and all other a_i≡0 mod8. Among the four curves y²=f,−f,2f,−2f, at least one Jacobian has even and at least one has odd 2∞-Selmer corank. This proposition alone is not a finite-2-Selmer parity assertion.

**Construction or proof.** 1. Substitute y=2Y+x and divide by four. The reduced equation Y²+xY=x^(2g+1) has one split node and a smooth point at infinity. 2. Use F=Q(i,√2). Its only finite prime with a unique prime above it is two; odd primes have cyclic decomposition groups. Apply the corank part of A.3.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-four-twist-local-parity`, `NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Proposition A.4 p.36.

#### Local models for good and split nodal reduction

Target `refinement-odd-residue-field-models`; proposed name `ArithmeticSelmerRefinement.odd_residue_field_models`.

Let K/Q_p be finite with p odd, residue field F_q, and let C:y²=f(x) be a smooth hyperelliptic curve with integral coefficients. (i) If f̄ is squarefree of degree n and has an F_q-root, J has good reduction and every quadratic twist of C has a K-point. (ii) If f̄=(x−a)²h, h squarefree of degree n−2, h(a) a nonzero square, and h has an F_q-root, J is split semistable of toric rank one and every quadratic twist has a K-point. (iii) If f̄ is not a scalar multiple of a square and q>4n², then C(K)≠∅. In (ii) the root of h is automatically different from a and simple. In (iii) the factorisation f̄=l h² does not require l,h coprime.

**Construction or proof.** 1. For (i),(ii), lift the simple residue root of f by Hensel; the point (b,0) survives all twists. Compute the split-node graph and Néron identity component. 2. For (iii), factor the odd-multiplicity squarefree part and use the finite-field curve point bound, excluding the finitely many roots and points at infinity, to get a smooth affine point. Hensel lifts it.

**Direct inputs.** `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`, `NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity`, `NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy`, `ArithmeticStatistics:ST.0`, `WeilConjectures:WC.5`.

**Acceptance.** A node with h(a) nonsquare is not split; a repeated root does not replace the simple root used for twist points.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Lemma A.5 p.37.

#### Positive densities of both Selmer corank parities

Target `refinement-full-family-corank-parities`; proposed name `ArithmeticSelmerRefinement.full_family_corank_parities`.

For every degree n≥3, in the full coefficient-height family of smooth hyperelliptic equations y²=f(x) of degree n over Q, both even and odd 2∞-Selmer corank occur with lower density at least 2^(−4n−4). Assuming finiteness of the Jacobians’ 2-primary Sha groups, the same bound holds for Mordell–Weil rank parity. Without that assumption this remains a Selmer-corank statement.

**Construction or proof.** 1. The prescribed coefficient residue class modulo eight, inside H<X/2, has density 8^(−n−1)2^(−n−1)=2^(−4n−4) relative to H<X. Its four twists stay in H<X. 2. The blocks are disjoint: their x² coefficients have residues 1,7,2,6 modulo eight, so each block determines its original member. Select one member of each parity. Singular equations have density zero. Sha finiteness identifies corank with Mordell–Weil rank only in the conditional clause.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-mod-eight-parity-family`, `ArithmeticStatistics:ST.0/coefficient-box`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem A.1 p.35 and Proposition A.4 p.36.

#### Both finite Selmer parities in admissible families

Target `refinement-admissible-family-selmer-parities`; proposed name `ArithmeticSelmerRefinement.admissible_family_selmer_parities`.

For each fixed genus and each positive-density admissible congruence family over Q with the coefficient-height convention, both even and odd finite 2-Selmer dimension, and both even and odd 2∞-Selmer corank, occur with positive lower density. The number-field form uses integral coefficient models over O_K, a fixed integral basis and coefficient-coordinate maximum height; its denominator, finite congruence density and twist-height comparison require the number-field supplier contract listed here. This is not claimed for every printed large family.

**Construction or proof.** 1. Put small residue fields and primes above two into a finite set Σ. Choose α,β square-close to one there, and prescribe a unique-prime split-node condition at p₀ outside Σ. 2. At the finitely many other unique-prime places impose good reduction with a simple root; outside these places avoid the scalar-square reduction locus of codimension≥2. CRT and the coefficient sieve give positive density. 3. All four twists remain in the family by admissibility. Apply both parts of A.3; fixed twist-height factors and finite multiplicity transfer positive density.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-admissibility`, `ArithmeticStatistics:ST.4/refinement-four-twist-local-parity`, `ArithmeticStatistics:ST.4/refinement-odd-residue-field-models`, `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem A.2 p.35 and proof p.37.

#### Positive proportion of empty degree-one Selmer sets

Target `refinement-positive-empty-selmer-set`; proposed name `ArithmeticSelmerRefinement.positive_empty_selmer_set`.

For every g≥1, in any positive-density admissible coefficient-height congruence family restricted to everywhere actual-Div¹-soluble models, a positive lower proportion have Sel₂(J¹)=∅. More precisely, if the even finite 2-Selmer-dimension subfamily has lower density δ>0, the empty-set subfamily has lower density at least δ/2 after the generic exceptions are removed.

**Construction or proof.** 1. Outside generic exceptions, a nonempty Sel₂(J¹) has size #Sel₂(J)≥2 and at least four on even-dimensional curves. 2. For height-truncated counts N,E,Z and total Selmer cardinal T, use T≥2N+2E−4Z−4B with B the exceptional count. Combine B/N→0 and limsup T/N≤2.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class`, `ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 5 p.3, introduction pp.3–4 and §12 p.34.

#### Positive proportion with no odd-degree point

Target `refinement-positive-index-two`; proposed name `ArithmeticSelmerRefinement.positive_index_two`.

For each g≥1, a positive lower proportion of locally C-soluble genus-g coefficient-height models over Q have no point over any finite odd-degree extension; equivalently J¹(Q)=∅ and index(C)=2. The same holds in the positive-density admissible families of the preceding target, with actual Div¹-solubility locally in place of local C-points.

**Construction or proof.** 1. A rational point of J¹ pulls multiplication-by-two on J back to a locally soluble two-cover, so an empty Selmer set forces J¹(Q) empty. 2. Apply the actual-divisor comparison and the index-divides-two argument.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-positive-empty-selmer-set`, `ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorems 1,2 pp.1–2 and Theorem 12 p.4.

#### Nontrivial two-torsion in Jacobian Sha

Target `refinement-positive-nontrivial-sha-two`; proposed name `ArithmeticSelmerRefinement.positive_nontrivial_sha_two`.

For a positive lower proportion in each family of the index-two target, Sha(J/Q)[2] is nontrivial. The image of W[2] is the nontrivial locally trivial J¹-torsor. No conjectural finiteness of Sha is used.

**Construction or proof.** 1. Use the cohomological Kummer exact sequence to map the two-cover class W[2] to [J¹]. 2. J¹ is everywhere locally trivial but has no rational point and is killed by two because the hyperelliptic degree-two class is rational.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-positive-index-two`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Corollary 3 p.2.

#### Degree-one torsor points are generically empty or infinite

Target `refinement-degree-one-points-empty-or-infinite`; proposed name `ArithmeticSelmerRefinement.degree_one_points_empty_or_infinite`.

For density one of locally actual-Div¹-soluble genus-g coefficient-height models, J¹(Q) is either empty or infinite. If it is nonempty, the nonzero W[2] lies in J(Q)/2J(Q), while J(Q)[2]=0; the finitely generated group J(Q) consequently has positive Mordell–Weil rank.

**Construction or proof.** 1. Use the generic two-torsion and W[2] statements and the Kummer kernel. 2. A finite group with no two-torsion has trivial quotient by two. Mordell–Weil therefore gives positive rank, and torsor translation gives infinitely many degree-one points.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class`, `ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison`, `HeightsRationalPointsAndObstructions:RP.1`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Remark 4 p.2.

#### Two-prime criterion with the dyadic hypotheses

Target `refinement-corrected-two-prime-criterion`; proposed name `ArithmeticSelmerRefinement.corrected_two_prime_criterion`.

Let g≥1 and F be a positive-density sieve-controlled congruence family of degree n=2g+2 models with locally soluble actual Div¹. Suppose odd distinct primes p,q are each quadratic nonresidues modulo the other. On a positive lower proportion of f, require f,pf,qf,pqf∈F, all four curves to have points over Q_p and Q_q, J_f split semistable of toric rank one at p and good at q. If two has a unique prime above it in Q(√p,√q), also require good reduction of J_f at two and Q₂-points on all four curves. Then a positive lower proportion of F have empty Sel₂(J¹), no odd-degree point and index two. The printed Theorem 44 omits the dyadic requirement; the unrestricted printed-family version remains subject to the coefficient-saturation gap.

**Construction or proof.** 1. In Q(√p,√q), the only possible unique-prime finite places are p,q,two. Apply A.3 with p₀=p and all its point/reduction hypotheses. 2. Twist-height bounds and finite fibres produce positive even Selmer proportion in F. Apply the empty-set counting argument.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-four-twist-local-parity`, `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class`, `ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison`.

**Acceptance.** For (p,q)=(5,3), two has a unique prime above it, so the added conditions are essential to this proof.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 44 pp.34–35, corrected with Theorem A.3 p.36.


### Rank one

#### Rank-one criterion over Q from a p-Selmer line

Target `refinement-rank-one-selmer-criterion`; proposed name `ArithmeticSelmerRefinement.rank_one_selmer_criterion`.

Let E/Q have squarefree conductor with at least two odd prime factors, p≥5 a prime of good ordinary reduction, and irreducible E[p]. If Sel_p(E)≅F_p and its restriction to E(Q_p)/pE(Q_p) is not contained in the image of E(Q_p)[p], then both algebraic and analytic rank of E are one. This is the statistical application of the exact Skinner converse, not an assumption of finite Sha or a use of its converse direction.

**Construction or proof.** 1. Use the finite-to-p∞ Kummer and local comparison in Lemma 8 to obtain a one-dimensional rational Selmer group with injective local restriction. 2. Apply Skinner’s Theorem C: for squarefree conductor with at least two odd factors, either one is nonsplit multiplicative or at least two are split multiplicative. The RankOneConverse owner is not registered; its missing export is gap G-converse.

**Direct inputs.** `SelmerIwasawaCohomology:L2`, `RankZeroOneBSD:BSD.0`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Bhargava–Skinner Theorem 3 pp.2–3 and proof pp.6–8.

#### Rank-one criterion for an imaginary quadratic twist

Target `refinement-twisted-rank-one-selmer-criterion`; proposed name `ArithmeticSelmerRefinement.twisted_rank_one_selmer_criterion`.

Let E/Q have squarefree conductor N with at least two odd prime factors, p≥5 good ordinary, and E[p] irreducible. Let K/Q be imaginary quadratic of odd discriminant D, with 2 and p split and gcd(D,N)=1. Require E[p] ramified at an odd prime q inert in K, Sel_p(E)=0, Sel_p(E^D)≅F_p, and restriction of Sel_p(E^D) not contained in the local p-torsion image. Then E^D has algebraic and analytic rank one. E^D itself need not have squarefree conductor.

**Construction or proof.** 1. Compare the Bloch–Kato Selmer group over K with the invariant and anti-invariant groups over Q; the E component vanishes and the twist component is a line with injective restriction. 2. Apply Skinner Theorem B to E over K and use L(E/K,s)=L(E,s)L(E^D,s). The converse input remains the registered gap; do not apply Theorem C to the ramified twist.

**Direct inputs.** `SelmerIwasawaCohomology:L2`, `RankZeroOneBSD:BSD.0/twist-l-series`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Bhargava–Skinner Theorem 4 p.3 and proof pp.7–8.

#### The Bhargava–Skinner sieve family

Target `refinement-rank-one-family`; proposed name `ArithmeticSelmerRefinement.RankOneFamily`.

RankOneFamily is the set of integral short pairs (A,B) with v₂(A)=3, v₂(B)=4, Δ₀=−4A³−27B²=256d, d positive odd squarefree, gcd(Δ₀,195)=1, Δ₀ a square modulo 39, 7|d, 864B a nonsquare in F_7, and #E_(A,B)(F_5) not congruent to one modulo five. These last two coefficient tests express nonsplit multiplicative reduction at seven and good ordinary reduction at five; #E(F_5)=1+# {(x,y)∈F_5²:y²=x³+Ax+B}. Via the imported unique minimal-short-pair convention this is the family F of elliptic-curve isomorphism classes. Use H=max(4|A|³,27B²) and the fixed quadratic discriminant D=−39.

**Construction or proof.** 1. Replace the local reduction conditions by their discriminant/c₆ and finite-field trace tests; the gcd and squarefree conditions make the models smooth and the seven-valuation exactly one. 2. Take the subset of the existing short-pair carrier, not a new quotient of arbitrary Weierstrass equations.

**Direct inputs.** `ArithmeticStatistics:ST.0/elliptic-curves-over-q-ordered-by-height`, `mathlib:ZMod`.

**Uses that determine the API.** Bhargava–Skinner §5: A positive-density family supplies ordinary local quotients and an irreducible ramified residual representation. Plane-cubic Theorem 2 proof: The rank-one proportion supplies nontrivial rational 3-descent classes.

**Planning API.**

- `ArithmeticSelmerRefinement.rankOne_delta` (projection): A pair in F has Δ₀=256d with d>0, odd and squarefree.
- `ArithmeticSelmerRefinement.rankOne_good_discriminant` (structure): A pair in F is nonsingular and gcd(Δ₀,195)=1.
- `ArithmeticSelmerRefinement.rankOne_ordinary_test` (characterisation): Its actual finite-field point count satisfies #E(F_5) mod5≠1.
- `ArithmeticSelmerRefinement.rankOne_twist_disjoint` (relation): For (A,B)∈F the raw −39 twist pair (39²A,(−39)³B) is not in F, since its discriminant is divisible by 39.
- `ArithmeticSelmerRefinement.rankOne_twist_height` (compatibility): For every raw short pair H(39²A,(−39)³B)=39⁶H(A,B). The family-properties theorem supplies that the twist pair is already minimal-short, so this equals isomorphism-class height.

**Discriminating unit tests.** These same names label the examples in the suggested file.

- `ArithmeticSelmerRefinement.rankOne_example` (example): (−136,16) belongs to F: d=39277=7·31·181, Δ₀ mod39=10=7² mod39, 864B mod7=6, and #E(F_5)=8.
- `ArithmeticSelmerRefinement.rankOne_wrong_seven` (non-example): (−136,−16) fails the nonsplit-seven test: 864B mod7=1 is a square, although Δ₀ and the two-adic valuations are unchanged.
- `ArithmeticSelmerRefinement.rankOne_wrong_sign` (non-example): (136,16) has negative d and is excluded.
- `ArithmeticSelmerRefinement.rankOne_wrong_two` (non-example): (−16,16) violates v₂(A)=3 and is excluded.
- `ArithmeticSelmerRefinement.rankOne_wrong_ordinary` (non-example): The pair (−1000,1136) satisfies the other coefficient conditions but has #E(F₅)=6, so it is excluded by the ordinary test.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), §2 pp.3–4 and §5 p.14.

#### Arithmetic and density properties of the sieve family

Target `refinement-rank-one-family-properties`; proposed name `ArithmeticSelmerRefinement.rank_one_family_properties`.

F has asymptotic count c_F X^(5/6)+o(X^(5/6)), c_F>0, in the minimal-short-pair height. Every E∈F is semistable of odd squarefree conductor d, with at least two odd factors; E[5] is irreducible and ramified at every factor of d. For D=−39, 2 and 5 split in Q(√D), seven is inert, and E,E^D have opposite root numbers. The twist short pair is minimal and H(E^D)=39⁶H(E); the original and twisted families are disjoint as isomorphism classes.

**Construction or proof.** 1. At two, transform the short equation to a good integral Weierstrass model. At odd bad primes the minimal discriminant valuation is one, so the conductor is d and mod-five inertia is nontrivial. 2. A reducible residual semistable ordinary representation would have semisimplification 1⊕ω; its Frobenius eigenvalues contradict nonsplit reduction at seven because 7≠−1 mod5. 3. Verify the quadratic characters and root-number formula. Squarefreeness with seven dividing d and d square mod39 excludes conductor seven alone. Apply the imported large-family denominator, with the local positivity witnessed explicitly.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-rank-one-family`, `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family`, `RankZeroOneBSD:BSD.0/twist-root-number`, `ArithmeticGaloisRepresentations:R01.6`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Lemma 14 and Lemma 15 pp.14–15; §2 pp.3–4; final proof p.17.

#### Stable local five-division orbit labels

Target `refinement-local-five-quotient-comparison`; proposed name `ArithmeticSelmerRefinement.local_five_quotient_comparison`.

For E/Q_5 of good ordinary reduction, a sufficiently small open coefficient disc W identifies the finite groups E′(Q_5)/5E′(Q_5) with E(Q_5)/5E(Q_5) and identifies their actual rational-five-torsion images. In the quinary covering representation the soluble G(Q_5)-orbits admit corresponding disjoint compact open integral labels over W. Under the covering-to-Kummer map these labels agree with the point-group identifications. A bijection of sets that fails to preserve the torsion image is insufficient.

**Construction or proof.** 1. Import the local point-group comparison (good reduction suffices for this application), using smooth reduction and closeness of torsion division-polynomial roots. 2. Separate compact stable integral orbit fibres and shrink the invariant disc using openness of the invariant map. Verify compatibility via nearby points on the covering. This requires the exact ST.1 quinary covering supplier contract, not just its invariant polynomials.

**Direct inputs.** `ArithmeticStatistics:ST.1`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Propositions 11–12 and Theorem 7 deduction pp.11–13.

#### Equidistribution of nonidentity five-Selmer elements

Target `refinement-five-selmer-local-equidistribution`; proposed name `ArithmeticSelmerRefinement.five_selmer_local_equidistribution`.

Let F be a large positive-density family of elliptic curves contained in a sufficiently small five-adic disc W as above, with the actual local group Q and its torsion image identified throughout W. For each q∈Q, the number of pairs (E,s), H(E)<X, s∈Sel₅(E)\{0}, res(s)=q, divided by #F_(H<X), tends to 5/#Q. More generally a subset I⊆Q gives average 5#I/#Q. This weights curves by the number of nonidentity elements; it does not say each individual Selmer group maps uniformly.

**Construction or proof.** 1. Restrict the acceptable quinary orbit weight to any compact open local orbit label. The stabilizer-weighted local mass is proportional to the number of labels. 2. Apply the same acceptable weighted count and prime-tail theorem to the restricted weights, divide by the positive curve denominator and use average #Sel₅=6, hence average nonidentity size five.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison`, `ArithmeticStatistics:ST.2/refinement-quinary-acceptable-count`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`, `ArithmeticStatistics:ST.5`.

**Acceptance.** For a singleton label the mean is 5/#Q, not 6/#Q; curves with Sel₅={0} contribute no elements.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Theorems 7,9 pp.4,10–11, proof pp.10–13.

#### Bounds for Selmer lines trapped in local torsion

Target `refinement-rank-one-torsion-image-bound`; proposed name `ArithmeticSelmerRefinement.rank_one_torsion_image_bound`.

Use F, D=−39, p=5, height cut H(E)<X, and write N_i for Selmer dimension i, N_even,N_odd for the parity counts, and B_1 for dimension-one curves whose entire restricted Selmer line lies in the local rational-torsion image. Superscript D counts the twists using the original E-height cutoff. Then B_1≤N/(p−1)−(N_even−N_0)−(p+1)(N_odd−N_1)+o(X^(5/6)), and B_1^D≤N/(p−1)−(N_odd−N_0^D)−(p+1)(N_even−N_1^D)+o(X^(5/6)). The formula applies here because #Q=p#E(Q_p)[p] and both local torsion images are transported correctly.

**Construction or proof.** 1. Partition the compact five-adic good-reduction parameter locus into finitely many comparison discs. Equidistribution gives N+o(X^(5/6)) nonidentity elements restricting into torsion. 2. The local quotient modulo the torsion image has size p. A finite F_p-space of dimension≥2 has at least p−1 nonzero kernel elements; dimension≥3 has at least p²−1. Dimension-one trapped lines contribute p−1. Divide the total inequality by p−1. 3. Repeat for the twisted family. Opposite root numbers and p-Selmer parity interchange N_even,N_odd.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution`, `ArithmeticStatistics:ST.4/refinement-rank-one-family-properties`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** The source proof’s odd-rank≥3 case requires Sel_p not isomorphic to F_p, not merely nonzero. At p=5 the trapped-line leading bound is N/4.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Lemma 16 pp.15–16.

#### At least half the sieve family satisfies a rank-one criterion

Target `refinement-rank-one-saturated-count`; proposed name `ArithmeticSelmerRefinement.rank_one_saturated_count`.

Let N_sat count E∈F_(H<X) satisfying the Q criterion and N_sat^D those satisfying the imaginary-twist criterion. These are disjoint subsets of the original F, because the first has odd finite five-Selmer dimension and the second has dimension zero. Then N_sat+N_sat^D≥(1−2/(p−1))N+o(X^(5/6)) with p=5, so their sum is at least N/2+o(X^(5/6)). This does not count every twist by its own height at this step.

**Construction or proof.** 1. Use N_sat=N_1−B_1 and N_sat^D≥N_1^D−B_1^D+N_0−N_even. 2. Insert both torsion-image bounds and cancel the even/odd and dimension-zero terms. Higher odd and even dimensions contribute nonnegative terms.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-rank-one-torsion-image-bound`, `ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion`, `ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion`, `ArithmeticStatistics:ST.4/refinement-rank-one-family-properties`.

**Acceptance.** Substituting p=3 gives zero; the proof must use p=5 rather than the 3-Selmer average.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Proposition 17 p.16.

#### Positive proportion with algebraic and analytic rank one

Target `refinement-positive-simultaneous-rank-one`; proposed name `ArithmeticSelmerRefinement.positive_simultaneous_rank_one`.

Among all Q-isomorphism classes of elliptic curves ordered by the unique minimal-short-pair height H=max(4|A|³,27B²), the lower density with rank_ZE(Q)=ord_(s=1)L(E,s)=1 is positive. If #F_(H<X)~c_F X^(5/6) and #E_(H<X)~c_E X^(5/6), the proof gives lower bound c_F/(2c_E·39^5). The lower limits of both average ranks are consequently positive; their limits are not asserted to exist.

**Construction or proof.** 1. The satisfied E and their successful D-twists have height below 39⁶X and are disjoint curve classes. The twist map is injective on the supplied class carrier. 2. Use the all-curve asymptotic c_E(39⁶X)^(5/6)=c_E39^5X^(5/6), then the saturated lower bound. Apply nonnegativity of rank for the average-rank consequences.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-rank-one-saturated-count`, `ArithmeticStatistics:ST.4/refinement-rank-one-family-properties`, `ArithmeticStatistics:ST.0/elliptic-curves-over-q-ordered-by-height`, `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Theorem 1 and Corollary 2 pp.1–2, final proof p.17; Skinner Theorem D p.332.


### Plane cubics

#### Many generic rational three-Selmer elements

Target `refinement-soluble-generic-three-selmer-elements`; proposed name `ArithmeticSelmerRefinement.soluble_generic_three_selmer_elements`.

Among height-ordered elliptic curves, the number of pairs (E,s) with s a nonidentity Kummer image in Sel₃(E), H(E)<X, is at least cX^(5/6) for some c>0. Each rank-one E supplies at least two such classes of exact order three; their associated smooth plane cubics have a rational projective point and no rational flex. The positive proportion relative to all nonidentity Sel₃ elements also follows from average #Sel₃=4.

**Construction or proof.** 1. Use E(Q)/3E(Q)↪Sel₃(E) and the finite-generation rank-one quotient. Both nonzero classes have exact order three even if rational three-torsion is present. 2. Apply the soluble ternary-cover orbit dictionary and global rational-point interpretation; divide by the Selmer average only when asserting an element proportion.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one`, `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.1`, `SelmerIwasawaCohomology:L2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131), Plane-cubic §1.2 pp.4–5 and Theorem 11 §3 p.8.

#### Integral ternary representatives of soluble descent classes

Target `refinement-plane-cubic-height-and-orbit-transfer`; proposed name `ArithmeticSelmerRefinement.plane_cubic_height_and_orbit_transfer`.

For integral ternary cubics use G=PGL₃ acting by (γ·f)(x)=det(γ)^(−1)f(xγ); scalar matrices act trivially. A(v),B(v) are normalized so the Jacobian is y²=x³+Ax+B and H_AB=max(|A|³,B²), homogeneous of degree twelve in v. Over Q, soluble rational G-orbits at fixed invariants correspond to E(Q)/3E(Q) and have stabilizer E(Q)[3]. Every everywhere locally soluble Sel₃ class at integral invariants admits an integral representative, and one can choose distinct G(Z)-orbits for distinct classes. Generic means nonsingular with no Q-flex. SL₃(Z)-orbits give the same integral action image; PGL₃(Q)-orbits must not be replaced by SL₃(Q)-orbits.

**Construction or proof.** 1. Request the exact ternary covering/classification/minimisation dictionary from ST.1; invariant polynomials alone do not provide it. 2. Transport the chosen invariants and measure normalization. With Fisher c₄,c₆, A=−c₄/48, B=−c₆/864, whereas the ST.2 counting normalization I=c₄/16,J=c₆/32 gives H_IJ=max(27|A|³,729B²/4). Thus 27H_AB≤H_IJ≤(729/4)H_AB. Also H_AB≤H_BS≤27H_AB. Bounded comparisons transfer positive lower counts, not exact average constants.

**Direct inputs.** `ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants`, `ArithmeticStatistics:ST.1/invariance-of-ternary-cubic-invariants`, `ArithmeticStatistics:ST.1`, `ArithmeticStatistics:ST.0/piecewise-rescaling-of-a-height`.

**Acceptance.** det^(−1) substitution preserves the invariants and kills scalar matrices; plain substitution is not the PGL₃ action.

**Source.** [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131), Plane-cubic Theorems 12–14 and Corollary 15 pp.8–10.

#### Globally soluble forms in a homogeneous fundamental region

Target `refinement-soluble-ternary-fundamental-count`; proposed name `ArithmeticSelmerRefinement.soluble_ternary_fundamental_count`.

For the integral ternary-cubic representation and H_AB invariant height, there is a finite-volume real fundamental multiset F₁, and F_t=tF₁ corresponds to H_AB<t^12. Generic integral points, with its stated orbit multiplicities, satisfy N_gen(F_t)=c₁t^10+o(t^10), c₁>0. At least c₃t^10+o(t^10) of them have a rational projective zero, c₃>0. The equality for total generic points and the lower soluble count use compatible measure and stabilizer conventions.

**Construction or proof.** 1. Use the homogeneous geometry-of-numbers fundamental region with the corrected invariant region. Import the ST.2 cusp and nongeneric estimates; make the normalization extension explicit. 2. Inject the nontrivial rational Selmer classes into integral generic orbits and use the rank-one lower count. Degree-twelve invariant height and X^(5/6) produce t^10, matching the coefficient dimension.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements`, `ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer`, `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count`, `ArithmeticStatistics:ST.2`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131), Theorem 16 and Theorem 2 proof pp.10–13.

#### Positive proportion of rationally soluble integral plane cubics

Target `refinement-positive-plane-cubic-solubility`; proposed name `ArithmeticSelmerRefinement.positive_plane_cubic_solubility`.

Let c run over all integral ten-tuples, the coefficients of x³,x²y,x²z,xy²,xyz,xz²,y³,y²z,yz²,z³. For the cube |c_i|≤T, let N_sol(T) count tuples whose homogeneous cubic has a nonzero rational zero. Then liminf_(T→∞) N_sol(T)/(2⌊T⌋+1)^10>0. Restricting the numerator and denominator to smooth plane cubics preserves this conclusion because the discriminant-zero coefficient locus has density zero. The denominator counts equation models without GL₃, scalar or isomorphism quotients.

**Construction or proof.** 1. Choose r so the bounded intersection F₁∩r[−1,1]^10 captures all but less than c₃/2 of the generic total mass. Use the total asymptotic minus the bounded-intersection lattice asymptotic to control the omitted cusp count. Volume smallness alone is insufficient. 2. At least (c₃/2)t^10 soluble integral generic forms remain inside rt[−1,1]^10. Put T=rt and divide by the actual ten-dimensional lattice-box count. 3. Remove singular forms only using their codimension-one lattice estimate; the all-form denominator and the smooth denominator are asymptotic.

**Direct inputs.** `ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count`, `ArithmeticStatistics:ST.0/coefficient-box`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`, `mathlib:Set.ncard`, `mathlib:Filter.limsup`.

**Acceptance.** Check all local places and the exact height denominator; retain every displayed hypothesis.

**Source.** [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131), Theorem 2 pp.1–2 and proof pp.11–13.

## Supplier contracts

The following requests identify the exact input and its consumers. They preserve ownership: missing general objects extend the supplier’s direction as Part II rather than becoming duplicate ST.4 definitions. Exact imported nodes used above are preferred to these stage requests wherever available.

### R1: `HeightsRationalPointsAndObstructions:RP.1`

General abelian-variety Mordell–Weil finite generation; finite Selmer sets of J¹ as actual two-cover torsors and their localisation into J¹(K_v)/2J(K_v), including the simply transitive Sel₂(J) action when nonempty. Supply the finite-index Z_p^g and compact-real-group two-division index formulas, and the coefficient-family failure-of-local-actual-Div¹ reduction criterion of Poonen–Stoll Lemma 15 (author copy p.16). Existing elliptic two-descent does not supply these ppav statements. This extends the descent direction as Part II if its present layer stops at elliptic curves.

**Consumers:** `refinement-hyperelliptic-local-mass-ratio`, `refinement-hyperelliptic-average-two`, `refinement-degree-one-points-empty-or-infinite`.

### R2: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Import current ClassFieldTheory Layer10 eq_zero_of_localInv_eq_zero: a global Brauer class whose finite and infinite local invariants all vanish is zero. Use the existing Layer5 cohomological/central-simple Brauer dictionary with the JC4 fppf obstruction, so everywhere actual Div¹ forces every rational Picard point to descend to a divisor. This is an existing upstream target, not a request to construct a second Brauer theory.

**Consumers:** `refinement-degree-one-arithmetic-comparison`.

### R3: `AdelicAlgebraicGroups:AA.2`

Use the existing Tamagawa-measure roadmap with the same invariant differential, local integral lattice volumes, global rational product formula and convergence factors. The additional general simply connected Tamagawa and central-isogeny correction theorems needed to evaluate τ(SL_n/μ₂) are an AdelicAlgebraicGroups, Part II request, not a claim that the present AA.2 layer already evaluates individual numbers. The ST.4 node owns the specifically routed even-SL central-quotient value. Also supply the precise common-measure orbit integration setup; the representation-specific Jacobian and stabilizer calculation is requested from ST.2.

**Consumers:** `refinement-hyperelliptic-local-mass-ratio`, `refinement-pencil-measure-comparison`, `refinement-tamagawa-central-quotient`.

### R4: `AdelicAlgebraicGroups:AA.4`

For the group scheme SL_n/μ₂ over Z, n even, supply G(Q)∩∏_pG(Z_p)=G(Z) and the bijection between global integral-transporter cosets and finite-support local transporter cosets needed to factor the reciprocal weight. This is a class-number-one statement for this central quotient, stronger than unnamed strong approximation for simply connected SL_n; verify the bad prime two and the group-scheme rational points.

**Consumers:** `refinement-pencil-local-global-weight`.

### R5: `InverseGaloisAndArithmeticFundamentalGroups:IG.2`

A quantitative coefficient-box specialization theorem making failure of full S_n Galois group density zero for each fixed degree n. Transfer relative to a positive-lower-density subfamily. Infinitely many Hilbert specializations alone do not give this density assertion. Combine it with the ST.1 odd/even factorization descriptions of W[2] and J[2].

**Consumers:** `refinement-generic-weierstrass-class`.

### R6: `ProbabilisticAndMetricNumberTheory:PM.1`

Dembo–Poonen–Shao–Zeitouni Theorem 1.2, author copy pp.2–3: for iid zero-mean, unit-variance coefficients with all moments, the probability of each fixed compatible count of real roots, all simple, is n^(−b+o(1)), b>0, hence tends to zero; finite unions do too. Apply to √3 times iid uniform [−1,1] coefficients, whose common rescaling preserves roots. For this continuous distribution, nonzero leading coefficient and nonvanishing discriminant hold almost surely, so the simple-root count equals the full real-root count almost surely. Only fixed counts are consumed. Do not claim the endpoint log n/log log n instead of the source’s o(log n/log log n) range.

**Consumers:** `refinement-order-k-vanishing-average`.

### R7: `SelmerIwasawaCohomology:L1`

Poonen–Stoll Theorem 8/Corollary 9 and Theorem 11/Corollary 12 (author copy §§6,8 pp.11–14): Cassels–Tate pairing on Sha modulo its maximal divisible subgroup, square-versus-twice-square order, and Jacobian deficiency parity. Deficiency is absence of an actual divisor of degree g−1 over the completion, not absence of a relative Picard-scheme point. Local points kill deficiency after any extension. Supply the parity comparison for the finite 2-primary quotient and its two-torsion; it is not a fact about arbitrary finite abelian groups.

**Consumers:** `refinement-selmer-regulator-parity`, `refinement-four-twist-local-parity`.

### R8: `SelmerIwasawaCohomology:L2`

General finite/p∞ Selmer groups and Sha, Kummer exact sequences, finite-generation and localisation interfaces for abelian varieties and their torsors. For the Dokchitser input supply the rational Pontryagin-dual representation X_p(A/F), its self-duality, the isogeny quotient formula retaining finite Sha and the finite-Selmer/corank/torsion/Sha parity identity. For rank one supply Bhargava–Skinner Lemma 8 and §§3.1–3.2 pp.5–7: the finite p-Selmer-line local nontorsion condition implies one-dimensional Bloch–Kato Selmer and injective restriction, plus quadratic invariant/anti-invariant decomposition and local p-division index #Q=p#E(Q_p)[p]. The elliptic p-Selmer root-number parity input of their Theorem 6 is needed without assuming Sha finite. Generic definitions already in EllipticCurves Layer 7 are imported there and only their required extensions belong here.

**Consumers:** `refinement-selmer-regulator-parity`, `refinement-biquadratic-parity-formula`, `refinement-positive-nontrivial-sha-two`, `refinement-rank-one-selmer-criterion`, `refinement-twisted-rank-one-selmer-criterion`, `refinement-rank-one-family-properties`, `refinement-local-five-quotient-comparison`, `refinement-rank-one-torsion-image-bound`, `refinement-soluble-generic-three-selmer-elements`.

### R9: `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`

RepresentationTheory, Part II: finite-group Brauer relations and regulator constants C(Θ,ρ)=∏_H det(|H|^−1〈,〉|ρ^H)^(n_H) in Q_p× modulo squares, with pairing/basis independence for a relation, additivity, self-dual decomposition and cyclic-decomposition cancellation. Use the existing induction/restriction functors. Required checks are the zero relation giving one, each of the four characters of C₂×C₂ giving square class two for {1}−ΣH+2G, and a non-self-dual pair having a square constant. The semistable regulator formula consumes a self-dual representation; retain the published erratum’s hypothesis.

**Consumers:** `refinement-selmer-regulator-parity`, `refinement-four-twist-local-parity`.

### R10: `NeronModelsAndSemistableAbelianVarieties:R11.3`

Modified Tamagawa factor c̃(A/L)=∏_(finite v)c_v|ω/ω_v^Néron|_v for one fixed global invariant exterior form, independent of permitted local choices and compatible with field extension. Supply cancellation of the differential correction for semistable A in the biquadratic Brauer product, and the split toric-rank-one monodromy computation giving square class two. This does not assert a Néron model commutes with every ramified base change. Tests for the extended definition must distinguish c̃ from c when the differential is nonminimal, give c̃=1 for good reduction with a minimal differential, and check multiplicativity of the Brauer product.

**Consumers:** `refinement-selmer-regulator-parity`, `refinement-four-twist-local-parity`.

### R11: `NeronModelsAndSemistableAbelianVarieties:R11.6`

For the exact Bhargava–Skinner short pairs, prove good integral reduction at two by their coordinate change; at seven identify nonsplit multiplicative reduction by −c₆=864B being a nonsquare. At five identify ordinary good reduction by #E(F₅)≢1 mod5. For D=−39 check minimality of the twisted short pair at three and thirteen, where the original has good reduction, and retain the exact height factor 39⁶.

**Consumers:** `refinement-rank-one-family-properties`.

### R12: `ArithmeticGaloisRepresentations:R01.6`

For semistable ordinary E/Q at p=5, identify residual inertia at each conductor prime of minimal discriminant valuation one, and show ramification there. In the reducible case the global semisimplification is 1⊕ω, using ordinary local type and unramified finite characters over Q. Then nonsplit multiplicative Frobenius at seven contradicts 7≠−1 mod5. This is the precise Tate-module/reduction export used in Bhargava–Skinner Lemma 14, not a request for an unrelated Serre-weight stage.

**Consumers:** `refinement-rank-one-family-properties`.

### R13: `RankZeroOneBSD:BSD.0`

Existing modularity, elliptic L-function and root-number conventions, their factorization over an imaginary quadratic field, and the quadratic twist sign formula for D=−39 with gcd(D,N)=1. The rank-one p-converse is a separate gap routed by PAPER-SKINNER-20; neither modularity nor the forward Gross–Zagier/Kolyvagin theorem supplies it.

**Consumers:** `refinement-rank-one-selmer-criterion`.

### R14: `WeilConjectures:WC.5`

The proved finite-field smooth projective curve bound #C(F_q)≥q+1−2g√q. Apply to the squarefree odd-multiplicity part l of f̄ and discard up to 2n+2 points over roots of f̄ or infinity. q>4n² supplies the needed positive remainder for n≥3. No coprimeness of l and the square part is needed.

**Consumers:** `refinement-odd-residue-field-models`.

### R15: `ArithmeticStatistics:ST.0`

Coefficient-height finite sublevel sets and finite-prime density/CRT for hyperelliptic models; for the number-field A.2 statement use a fixed integral basis of O_K and the maximum of all coefficient coordinates, with finite twist-height constants and finite fibres. Supply a genus-uniform positive lower proportion of locally C-soluble models, hence of locally actual-Div¹-soluble models, with exactly the BGW coefficient cube and all real strata. The cited >75% local-solubility result is not replaced by a genus-dependent positive constant. Also identify the scalar-square reduction locus as a fixed codimension-at-least-two subscheme for n≥3.

**Consumers:** `refinement-order-k-vanishing-average`, `refinement-small-odd-degree-points-disappear`, `refinement-odd-residue-field-models`, `refinement-admissible-family-selmer-parities`.

### R16: `ArithmeticStatistics:ST.1`

Extend the existing covering dictionary, without confusing ring representations: the degree-five genus-one representation is the 50-dimensional 5⊗∧²(5), with determinant-kernel central-quotient G from ST.2/refinement-quinary-finite-count. Supply invariant normalizations A,B, smooth Pfaffian degree-five covers, Sel₅(E)/local Kummer bijections, stabilizer E[5], integral minimization and compatibility of nearby local labels with point-group torsion images. The 40-dimensional quintic-ring representation does not supply this. For ternary cubics supply the twisted PGL₃ action, the orbit-to-three-cover dictionary, stabilizer E[3] and integral minimization in plane-cubic Theorems 12–14 pp.8–10. For order-k sets supply torsor-cover localisation naturality and effective-divisor maps including conjugate pairs. These are explicit refinements of the ST.1 ownership contract.

**Consumers:** `refinement-local-five-quotient-comparison`, `refinement-soluble-generic-three-selmer-elements`, `refinement-plane-cubic-height-and-orbit-transfer`.

### R17: `ArithmeticStatistics:ST.2`

Beyond the cited counts, supply the weighted negligible-rational-stabilizer estimate in the BGW unbounded fundamental regions from [BGW reference 1, Proposition 14], the same rational orbit-Jacobian at every place in BGW §11 pp.32–33, and bounded-intersection generic ternary lattice asymptotics plus the complement/cusp subtraction in the H_AB region. The latter extends the existing H_IJ normalization and includes stabilizer multiset multiplicities; positive volume alone does not control omitted lattice points. Preserve the strong excluded-lift saturation in refinement-large-coefficient-family-tail. Repair the wider printed Definition 39 separately, not by treating its reductions as whole p-adic complements.

**Consumers:** `refinement-hyperelliptic-average-two`, `refinement-admissible-family-selmer-parities`, `refinement-soluble-ternary-fundamental-count`.

### R18: `ArithmeticStatistics:ST.5`

Extend the parent’s finite-congruence average #Sel₅=6 to every positive-density large family in Bhargava–Skinner Theorem 5 p.4, including F, its −39 twists and finite five-adic discs. Supply the same stabilizer-weighted local orbit-mass formula for the refined acceptable weight so a singleton Q-label has average 5/#Q nonidentity elements. The existing average alone, and the three-Selmer average, do not imply this local equidistribution.

**Consumers:** `refinement-five-selmer-local-equidistribution`.

## Open obligations and source repairs

These obligations remain part of the complete planning pass. The stage is planned, not closed. Statements that require a repair keep that repair in their hypotheses; the full original generality is not certified by a restricted application.

### G-native: Native geometric suggested signatures

The pinned libraries do not provide the complete hyperelliptic Pic¹ two-cover Selmer-set/localisation carrier, the general Selmer dual representation and regulator constants, the rank-one analytic-rank/Bloch–Kato interfaces or the canonical orbit-counting measure objects. Exactly the 36 targets listed in suggestedInterfaces.omitted have mathematical statements but no executable theorem signatures. All four new definitions, their 20 API items and 17 tests, and the actual plane-cubic coefficient-box target are present in the compiling file. No substitute Prop fields or arbitrary count functions certify the missing conditions.

**Resolution:** Have the named supplier owners export the native carriers/maps, then replace every comment-only target in the suggested omission register with its exact signature. Preserve the stated hypotheses and do not make the target its own assumed field.

**Consumers:** `refinement-degree-one-arithmetic-comparison`, `refinement-generic-weierstrass-class`, `refinement-pencil-local-global-weight`, `refinement-pencil-selmer-weighted-count`, `refinement-hyperelliptic-local-mass-ratio`, `refinement-pencil-measure-comparison`, `refinement-tamagawa-central-quotient`, `refinement-hyperelliptic-weighted-upper-bound`, `refinement-hyperelliptic-average-two`, `refinement-real-effective-divisor-image`, `refinement-order-k-strict-average`, `refinement-order-k-vanishing-average`, `refinement-small-odd-degree-points-disappear`, `refinement-selmer-regulator-parity`, `refinement-biquadratic-parity-formula`, `refinement-four-twist-local-parity`, `refinement-mod-eight-parity-family`, `refinement-odd-residue-field-models`, `refinement-full-family-corank-parities`, `refinement-admissible-family-selmer-parities`, `refinement-positive-empty-selmer-set`, `refinement-positive-index-two`, `refinement-positive-nontrivial-sha-two`, `refinement-degree-one-points-empty-or-infinite`, `refinement-corrected-two-prime-criterion`, `refinement-rank-one-selmer-criterion`, `refinement-twisted-rank-one-selmer-criterion`, `refinement-rank-one-family-properties`, `refinement-local-five-quotient-comparison`, `refinement-five-selmer-local-equidistribution`, `refinement-rank-one-torsion-image-bound`, `refinement-rank-one-saturated-count`, `refinement-positive-simultaneous-rank-one`, `refinement-soluble-generic-three-selmer-elements`, `refinement-plane-cubic-height-and-orbit-transfer`, `refinement-soluble-ternary-fundamental-count`.

### G-large-saturation: Reduction-only largeness does not justify the printed tail

BGW Definition 39 controls reductions of the allowed p-adic closures. This does not itself place every excluded lift in a codimension-two reduction locus: a residue class can have both allowed and excluded lifts. Proposition 42’s proof uses the stronger excluded-lift property. The full locally C-soluble and locally actual-Div¹-soluble families satisfy the stronger property via the local point criterion; admissibility does too outside finitely many primes. The packet proves the core and explicitly stronger family route and leaves the full printed-family extension open.

**Resolution:** Supply a proof deriving the tail from precisely the printed Definition 39 or correct that definition by requiring p-adic saturation outside the codimension-two bad locus. Track the full-family extension separately from the valid applications.

**Consumers:** `refinement-hyperelliptic-average-two`, `refinement-corrected-two-prime-criterion`.

### G-converse: The routed rank-one converse has no registered export

PAPER-SKINNER-20 routes the converse to the unregistered RankOneConverse direction in DESIGN-SKINNER, but that roadmap/stage is not yet a registered prerequisite id. The exact consumed statements are Skinner Theorem C p.332 and the elliptic case of Theorem B p.331. For B: semistable E/Q, squarefree N, p≥5 good ordinary, irreducible E[p] ramified at an odd prime inert in imaginary K, odd discriminant D, 2 and p split, gcd(D,N)=1, and dim H¹_f(K,V_pE)=1 with injective restriction at the p-adic places imply both ranks over K are one and Sha(E/K) finite. The local nontorsion condition and Sel_p(E)=0 for the twist application are used to establish these Bloch–Kato hypotheses. The converse proof has not been read here beyond the source introduction; it belongs to that routed owner.

**Resolution:** Register the routed Part II and export these statements with all hypotheses. Replace this gap by those native node ids; do not silently apply the squarefree-Q criterion to E^D.

**Consumers:** `refinement-rank-one-selmer-criterion`, `refinement-twisted-rank-one-selmer-criterion`.

### G-tamagawa: General central-isogeny volume calculation is not supplied

The specific value τ(SL_n/μ₂)=2 is stated in BGW Theorem 41 and was routed to ST.4 as item 48. AA.2 supplies Tamagawa measures, while its current upstream roadmap excludes individual computations. A source proof of the general simply connected theorem and central-isogeny correction, with the adelic squareclass defect checked for μ₂, has not been established in this pass. Kottwitz’s publisher record (Annals 127 (1988), pp.629–646) was located, but the paper’s proof was not acquired/read. The statistical constant is therefore a planned node with this supplier/source obligation.

**Resolution:** AdelicAlgebraicGroups, Part II supplies and verifies the general theorem and common-measure conventions; ST.4 evaluates its correction for this split quotient.

**Consumers:** `refinement-tamagawa-central-quotient`, `refinement-hyperelliptic-weighted-upper-bound`.

### G-uniform-genus: Uniform denominator in the growing-genus limit

BGW’s fixed-root argument needs the locally soluble model denominator bounded below uniformly in genus. Its positive constant for a fixed g is insufficient. BGW introduction p.1 cites the >75% local-solubility calculation in [3] and [27], but the proof of that bound has not been read here and neither a checked ST.0 node nor a baseline declaration supplies it with the exact box measure. The locally actual-Div¹ family has at least that denominator. Fixed-few-root probability is requested from PM.1 with exact coefficient hypotheses.

**Resolution:** ST.0 verifies the cited local-density theorem with a single positive lower constant and the same real/finite-prime product convention, then supplies it to the two ordered-limit targets.

**Consumers:** `refinement-order-k-vanishing-average`, `refinement-small-odd-degree-points-disappear`.

### G-number-field: Number-field height/sieve transfer is not verified

Appendix A.2 states its admissible-family conclusion over arbitrary number fields, but the source’s brief height comparison is not a complete coefficient-box/sieve proof over O_K. The chosen fixed-basis coordinate height gives bounded twist maps; positive local congruence densities, codimension-two tail, admissibility outside the small-prime set and finite fibres still need the number-field version of ST.0/ST.2. The Q application and its finite2/corank distinctions have source proofs; the full number-field application is recorded with this explicit supplier contract.

**Resolution:** Provide the O_K coefficient box/CRT and codimension-two tail with constants depending on the fixed K,n and basis, and verify every twist remains in the actual reconstructed family.

**Consumers:** `refinement-admissible-family-selmer-parities`.

### Source findings

Every description below is in the worker’s own words. The accepted paper findings are cited as prior independently checked evidence; this worker has added no review verdict. New findings await this job’s independent review.

**ArithmeticStatistics/E-ST4-1** (misprint; affects nothing). BGW arXiv v2 Theorems 40–41 pp.31,33; published §§11–12 pp.482–485. The theorem hypotheses demand coefficient divisibility by 16^n. Use divisibility by 16, with κ=4 and the isomorphic equation scaled by κ². Divisibility by 16 gives 2^(4i)|f₀^(i−1)f_i for every i, exactly the integrality input; the proof and earlier κ=4 statement use it. Already confirmed as PAPER-BHARGAVA-GROSS-WANG-17/E4; the published author copy still has the stronger printed hypothesis.

**ArithmeticStatistics/E-ST4-2** (gap; affects a stated result). BGW arXiv v2 Theorem 44 pp.34–35; published p.486. The family criterion prescribes points and reduction at the two odd primes but leaves the dyadic place unrestricted. If two has a unique prime in Q(√p,√q), require good reduction at two and points on all four twists there. The only available parity argument is A.3, which requires those conditions at every unique-prime place. For (p,q)=(5,3), two is inert in Q(√5) and ramified in Q(√3), so it is such a place. Already confirmed as PAPER-BHARGAVA-GROSS-WANG-17/E3; no independent review verdict is added here.

**ArithmeticStatistics/E-ST4-3** (gap; affects the proof). BGW arXiv v2 Definition 39 p.31 and Proposition 42 proof p.33; published pp.482,485. The argument uses the stated reduction-only largeness condition as though it controlled all excluded p-adic lifts. Impose the excluded-lift codimension-two condition or supply an additional theorem deriving the tail under the original hypotheses. An allowed residue may have excluded higher-power lifts, so containment of missing reductions is logically weaker than containment of the entire complement. This identifies an unproved implication, not a counterexample to the core full-family average. Not resolved in the arXiv or targeted published text inspected; independent verification is required.

**ArithmeticStatistics/E-ST4-4** (misprint; affects nothing). BGW arXiv v2 Lemma A.5(3) proof p.37. The proof makes the odd-multiplicity squarefree part coprime to the remaining square part. Use f̄=l h² with l squarefree and nonscalar, allowing common roots, then exclude all roots of f̄. A factor occurring with multiplicity three lies in both l and h, so the asserted coprimeness fails. The finite-field bound still gives more than 2n+2 projective points for q>4n², enough after excluding all bad coordinates. No correction found in the source versions inspected; the nearby insufficient point-count inequality is already confirmed in PAPER-BHARGAVA-GROSS-WANG-17/E5.

**ArithmeticStatistics/E-ST4-5** (misprint; affects nothing). Bhargava–Skinner arXiv:1401.0233v1 Lemma 16 proof p.16. The odd-dimensional higher-rank counting case excludes only the zero Selmer group. Exclude the one-dimensional F_p group in this case; then odd dimension is at least three. A nonzero one-dimensional Selmer group has p−1 nonidentity elements, fewer than p²−1. An odd-dimensional group not isomorphic to F_p has dimension at least three and gives the stated kernel bound. The corrected exclusion is implicit in the displayed N_odd−N_1 term; no separate correction found.

**ArithmeticStatistics/E-ST4-6** (misprint; affects nothing). BGW arXiv v2 Theorem 7 proof p.34; Dembo–Poonen–Shao–Zeitouni author copy Theorem 1.2 pp.2–3. BGW describes the cited few-root theorem using the full log n/log log n threshold. For this application use only each fixed root count, or a finite bounded union; the cited theorem’s growing-count range is o(log n/log log n). The fixed-count decay is sufficient to split the real strata into at most M components and the exponentially suppressed remainder. No endpoint estimate is needed. The two inspected statements have different endpoint ranges; the packet uses their common fixed-count consequence.

## Suggested interfaces and acceptance

The [suggested Lean file](../suggested/ArithmeticStatistics--ST.4.lean) is a naming and signature aid; this reader is definitive. It contains concrete definitions of `IsAdmissible`, `restrictedSelmerSet`, `oddComponentBound` and `RankOneFamily`, with every API item and test above, plus the actual ten-coefficient positive-solubility target. Private coefficient evaluation adapters use the imported model conventions. They introduce no opaque arithmetic predicates. The remaining thirty-six target signatures are explicitly omitted until the supplier carriers and maps exist. Their names, mathematical statements and reason for omission appear both in the packet and in the file’s comment register. Filling that register is a specific remaining task, not an implicit claim that those targets were elaborated.

Acceptance checks must distinguish the torsor Selmer set from the group; use the actual degree-one divisor and Picard obstruction comparison; keep the 2-primary Sha correction; restrict the Q rank-one converse to the semistable original curve and use its K-version for the ramified twist; use five, rather than three, in the saturated count; and count ten coefficient coordinates in the final ternary denominator. The generic-to-box transfer subtracts a bounded-intersection lattice asymptotic from a total asymptotic. Merely choosing a bounded set of almost full volume does not control an unbounded cusp’s integral points.

The elementary family witness is (-136,16): d=39277=7·31·181, Δ₀ mod39=10=7² mod39, 864B mod7=6 is nonsquare, and #E(F₅)=8. Changing B to −16 changes the seven-reduction character and excludes the pair. The pair (−1000,1136) has d=15488893=7·2212699 and meets the other restrictions but has #E(F₅)=6, so the ordinary condition excludes it. This check also fixes the sign of the c₆ test. All seventeen definition tests are semantic signature checks with placeholder proofs, rather than claims of computed Lean proofs.

Packet validation and Lean elaboration are recorded in the handoff. A successful elaboration only verifies types and names; the placeholder proofs establish no arithmetic theorem. The independent review must verify the source issues, the supplier contracts and the exact normalization conversions before acceptance.

## Sources and read coverage

The packet pins SHA-256 fingerprints and versions. No source passage is copied into these deliverables. The source register distinguishes the main statistical proofs read here from supplier theorems whose proof belongs to another owner.

- [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Manjul Bhargava, Benedict Gross, Xiaoheng Wang; appendix by Tim and Vladimir Dokchitser. arXiv:1310.7692v2, 42 pages. Read coverage: Introduction pp.1–6; local/integral soluble orbit results §§9–10 pp.25–29; counting and main proofs §§11–12 pp.29–35; Appendix A pp.35–39.
- [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf), Manjul Bhargava, Benedict Gross, Xiaoheng Wang. JAMS 30 (2017), 451–493, author copy. Read coverage: Targeted collation of Definition 39 and Theorems 40–44, §§11–12 pp.482–486; not a complete reading of the published paper.
- [A positive proportion of elliptic curves over Q have rank one](https://arxiv.org/pdf/1401.0233), Manjul Bhargava, Christopher Skinner. arXiv:1401.0233v1, 19 pages. Read coverage: §§1–5 pp.1–17: criteria, exact family, local equidistribution, Lemma 16, Proposition 17 and height transfer.
- [A positive proportion of plane cubics fail the Hasse principle](https://arxiv.org/pdf/1402.1131), Manjul Bhargava. arXiv:1402.1131v1. Read coverage: Theorem 2 pp.1–2; overview pp.3–5; §3 Theorem 11 p.8; §4 Theorems 12–16 and coefficient-box transfer pp.8–13.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Christopher Skinner. Annals of Mathematics 191 (2020), 329–354. Read coverage: Introduction pp.329–334, especially Theorems B pp.331, C and D p.332; proof belongs to the routed RankOneConverse owner.
- [The Cassels–Tate pairing on polarized abelian varieties](https://math.mit.edu/~poonen/papers/sha.pdf), Bjorn Poonen, Michael Stoll. Author copy, 28 pages; Annals of Mathematics 150 (1999), 1109–1149. Read coverage: Divisors versus rational divisor classes §2 pp.3–4; Theorem 8 and Corollary 9 §6 pp.11–12; Theorem 11 and Corollary 12 §§7–8 pp.13–14; Lemma 15 §9 p.16.
- [Self-duality of Selmer groups](https://arxiv.org/pdf/0705.1899v2), Tim Dokchitser, Vladimir Dokchitser. arXiv:0705.1899v2, 11 pages. Read coverage: §1 pp.1–4, Theorems 1.1,1.5,1.6; §2 beginning pp.4–5: isogeny quotient and self-duality reduction. Remaining proof is a supplier input.
- [Regulator constants and the parity conjecture](https://arxiv.org/pdf/0709.2852), Tim Dokchitser, Vladimir Dokchitser. Public arXiv PDF, 49 pages; source numbering differs from the published version. Read coverage: §§2.i–2.ii pp.11–16: Brauer relations, Definition 2.13, Exercise 2.14, Lemmas 2.15–2.16, Theorem 2.17 and Corollary 2.18; targeted cyclic/local-function checks §§2.iii–2.iv pp.18–22; semistable formulas §3.v pp.39–40.
- [Random polynomials having few or no real zeros](https://math.mit.edu/~poonen/papers/fewzeros.pdf), Amir Dembo, Bjorn Poonen, Qi-Man Shao, Ofer Zeitouni. Author copy dated 29 May 2000; JAMS 15 (2002), 857–892. Read coverage: §1 pp.1–3: Theorems 1.1–1.2, coefficient hypotheses and fixed-root conclusion. The probability proof is requested from its owner.

Kottwitz’s [publisher record](https://annals.math.princeton.edu/1988/127-3/p05) identifies *Tamagawa numbers*, Annals 127 (1988), pp.629–646. Its proof was not acquired or read and is recorded as G-tamagawa, not as inspected source evidence. The regulator supplier must respect the [author’s published corrections](https://people.maths.bris.ac.uk/~matyd/) concerning self-duality; that is a supplier requirement, not an extension of the source’s theorem without its hypotheses.
