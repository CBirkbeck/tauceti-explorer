# Topological mirror symmetry for Hitchin systems

This roadmap plans the comparison of stable SLn and PGLn Hitchin systems by integration along their abelian fibres. It follows Groechenig–Wyss–Ziegler’s arithmetic proof, with the geometric splitting construction of Hausel–Thaddeus and the fractional Hodge–Tate realization of Ito. The organising objects are character realizations, principal splitting torsors, abstract dual Hitchin systems, and stable fixed-determinant spectral torsors. Generic algebraic stacks, geometric mixed Hodge cohomology, local duality and orbifold integration keep their existing owners.

The principal target is the following. Let X/k be a smooth projective geometrically connected genus-g curve, let D⊗ω_X⁻¹ have strictly positive even degree or be trivial, let n≥1, and let d,e be prime to n. Choose L of degree d, choose a with ad≡e mod n, and put L′=L^a. Assume k contains μ_(n^(2g+1)). Over C, the E-polynomial of M_SL^L equals the gerbe-twisted stringy E-polynomial of M_PGL^e with twist α_PGL,L′^d. Over Fq with characteristic p>n, their ordinary and twisted stringy point counts agree. For D=ω, the Hodge-number target requires canonical Higgs-sector purity and the integral symplectic age shift. The arithmetic character refinement isolates the χγ-isotypic SL trace and the γ-sector of the mirror PGL inertia.

A point of the principal splitting torsor is weaker than a neutralization of the original μr-gerbe. The integration proof needs only the local splitting condition for its associated Gm-gerbe when both fibres have rational points. TMS.2 states that sufficient condition and proves its use. The source’s stronger μr condition is recorded separately with its Kummer obstruction. Likewise all-powers fibre trace equality gives a virtual Galois-character identity; the asserted actual representation isomorphism remains a stronger target with a precise proof gap.

This is a complete target-level pass: all 36 routed items have targets and all six stages are **planned**. No stage is mathematically closed. Twelve named gaps and the supplier requests below are part of the plan. Every implementation status is **unchecked**. Statements called targets specify what the formalisation must establish; proof outlines are not claims of implemented proofs. The full published genus range is retained, including a separate gate for the degree-zero elliptic case where the generic smooth spectral cover need not support stable objects.

Independent review on 19 October 2026 accepted this target-level pass after checking all 44 nodes, all nine pinned baseline declarations and all 29 published-source findings. The relative-splitting API below now distinguishes Gm line-bundle differences from μr-torsor differences with their power trivializations; a fifth check detects forgetting that data. All twelve gaps remain open. The [review report](../reviews/REV-DESIGN-TopologicalMirrorSymmetryForHitchinSystems.md) records the per-node and per-finding verdicts and the successful pinned Suggested elaboration.

## Conventions and library boundary

| Notation | Convention |
|---|---|
| M_SL^L | Stable trace-free D-Higgs objects with det E≃L, after μn-rigidification. |
| M_PGL^d | Quotient stack [M_SL^L/J_X[n]], distinct from its coarse quotient; d is a degree class modulo n. |
| Γ | J_X[n], of geometric rank n^(2g), constant after the specified finite étale base change. |
| L and Q | Line bundles on X; L is also the conventional Lefschetz symbol only inside K0 and fractional-realization formulas. Context always distinguishes them. |
| M in spectral formulas | det π_*O_Y = D^(−n(n−1)/2). |
| Cohomology | Compact supports, geometric Frobenius, one-dimensional χ-projectors; a star in a trace means an alternating sum. |
| Lefschetz/Tate | L^a corresponds to Qbarℓ(−a), with Frobenius eigenvalue q^a and Hodge bidegree (a,a). |
| Finite-field root system | Specified compatible roots for each q; no root-choice independence at arbitrary prime powers. |
| Age and weight | Age F uses tangent exponents in [0,1); w(γ)=dim M−F(γ⁻¹). The integral uses conjugate(fα). |
| Stack count | Sum over all rational torsor classes, weighted by 1/|Aut|. |
| ν and χγ | ν=δ(L Lν⁻¹), twisted geometric Frobenius ν⁻¹Fr, χγ(ν)=(ν,γ) for the normalized Weil pairing. |

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each declaration below was checked in its Lean source at those commits on 19 October 2026. The reviewed audit is `data/library-coverage.json`; its relevant supplier verdicts were read before design. A stale “missing” verdict does not override a declaration actually present at the pins.

| Existing declaration | What is already available |
|---|---|
| `tauceti:TauCeti.Hodge.MixedHodgeStructure` | Abstract integral/rational/complex mixed Hodge structures with weight and Hodge filtrations. This does not construct the mixed Hodge structure of a variety. |
| `tauceti:TauCeti.Hodge.tate_hodgeNumber` | The integral Tate structure Z(m) has its unique Hodge number at p=−m and weight −2m; checks the sign of L versus the negative Tate twist. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | Invertible sheaves as the full subcategory of locally free rank-one O_X-modules. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` | Isomorphism classes of invertible sheaves with the available commutative monoid. The pinned file does not supply all Picard inverses. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | The actual abelian-variety carrier over a field, not a relative abelian scheme or its dual. |
| `tauceti:CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` | For a finite commutative group with enough roots of unity, summing χ(σ)⁻¹χ(g) over all characters is |G| at g=σ and zero otherwise. Generic finite Fourier orthogonality is already available. |
| `mathlib:sum_hom_units_eq_zero` | A nontrivial multiplicative character of a finite group into a domain has sum zero. |
| `mathlib:AddMonoidAlgebra` | Finite formal sums with additive-monoid exponents and convolution; use rational bidegrees without inventing a polynomial carrier. |
| `mathlib:Matrix.trace` | Matrix trace is the sum of diagonal entries; used for the identity/Jordan-block regression test. |

The current upstream roadmap repository was inspected read-only at `0d144d044dacebca17b654695b6f1ad58f159b27`, with its current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The complete Completed/HodgeStructures and AlgebraicVectorBundles reader documents were read for style and ownership. The latter’s Suggested declaration inventory and the current library were checked as well. AlgebraicVectorBundles already owns tensor products, exterior powers, determinants and total spaces: TMS.3 imports that theory. The nine roadmaps newer than the atlas snapshot were checked for ownership. None of those upstream directories was built or modified.

The inspected reviewed supplier rows classify R09.4/R09.5 as partly built, A2/A3 as not built/partly built, R02.4, DWP.7 and R01.5 as not built. These are planning/audit verdicts, not implementation claims about the requested extensions. Fresh searches covered Higgs/Hitchin/stringy, gerbes/splittings, geometric realizations, finite characters, line bundles, abelian varieties and trace in the pinned and current libraries.

## Build order

| Layer | Purpose | Targets | Planets | Status |
|---|---|---:|---:|---|
| TMS.0 | Realizations and stringy invariants | 8 | 6 | planned |
| TMS.1 | Arithmetic gerbes and relative splittings | 5 | 4 | planned |
| TMS.2 | Abstract Hitchin duality | 8 | 6 | planned |
| TMS.3 | Stable Higgs moduli and spectral torsors | 10 | 5 | planned |
| TMS.4 | Degree independence and dual gerbes | 7 | 6 | planned |
| TMS.5 | Mirror symmetry and refined cohomology | 6 | 5 | planned |

The dependency order is realization and gerbe theory first, abstract integration second, stable spectral geometry third, then dual gerbes and applications. The main equality does not require the unitary comparison, the literal stronger μn-neutrality condition or the stronger actual Galois-isomorphism target. It does require the generic integration gates, arithmetic gerbe descent and the verified geometric certificate or separate low-genus calculation.

<a id="TMS0"></a>

## TMS.0 — Realizations and stringy invariants

Construct character E-realizations and stabilizer-weighted counts, finite-denominator Lefschetz powers with specified root systems, and untwisted/twisted stringy invariants. Prove equivariant Katz comparison, finite-denominator Tate-root existence, fractional comparison and the stringy comparison. Import geometric cohomology, equivariant blow-up presentations and transgression; their outstanding supplier contracts are explicit.

Layer inputs: `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, `CohomologyComparisons:CP.3`, `DeligneWeightsAndPurity:DWP.7`, `EtaleDualityAndPerverseSheaves:EDC.0`, `LogicAndDefinabilityInNumberTheory:LD.3`.

<a id="TMS0-character-realizations"></a>

### Character E-polynomials and weighted counts

Target `TMS.0/character-realizations` · construction · planet **Character E-polynomials**.

For a good action of a finite group G on a separated finite-type variety X and a one-dimensional character χ, define Eχ_G(X)=Σ_i,p,q (−1)^i dim Gr_F^p Gr_W^(p+q) H_c^i(X,C)^χ x^p y^q. Over Fq define the χ-count by alternating geometric-Frobenius traces on H_c^i(X,Qbarℓ)^χ. Its stack expression is Σ_[z] Tr(Fr_z,Lχ,z)/|Aut(z)| over [X/G](Fq). Fix the associated-local-system convention so that this formula selects the χ-eigenspace, rather than its inverse. Both realizations are additive for invariant closed/open decompositions; Eχ is generally only an additive map, not a ring homomorphism.

Hypotheses and interfaces:

- G is finite, every orbit lies in an affine open, and the action is over the base.
- χ:G→C× is one-dimensional; identify its roots of unity with coefficients in Qbarℓ, with ℓ different from the residue characteristic.
- Compact supports and the geometric mixed Hodge structure are essential for nonproper X.

Uses that determine the API:

- GWZ20 Theorems 2.15 and 2.18: Pass from point-count equalities to character Hodge coefficients.
- TMS.0/twisted-stringy-invariants and TMS.5/isotypic-mirror: Select transgression characters and the Weil-pairing eigenspace.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.characterE_add` | relation | For an invariant closed Z⊂X, Eχ(X)=Eχ(Z)+Eχ(X∖Z). |
| `TauCeti.HitchinMirror.characterCount_trace` | characterisation | The weighted quotient-stack sum equals the alternating trace on the χ-eigenspaces. |
| `TauCeti.HitchinMirror.characterE_trivialGroup` | compatibility | For G=1, identify the construction with the ordinary geometric compact-support mixed Hodge realization, whose values use TauCeti.Hodge.MixedHodgeStructure. |
| `TauCeti.HitchinMirror.characterE_point` | simp | Eχ(Spec C) is 1 for χ=1 and 0 otherwise. |
| `TauCeti.HitchinMirror.characterE_tensor` | compatibility | For abelian G over splitting coefficients, Eχ(X×Y)=Σ_ψ Eψ(X) E_(χψ⁻¹)(Y). |
| `TauCeti.HitchinMirror.characterCount_baseExtension` | functoriality | Over F_(q^m), replace geometric Frobenius by Fr^m on the same eigenspace. |

Definition checks:

- **characterCount_BC2** (computation): Over F3 the trivial-character count for a point with C2-action is 1/2+1/2=1, not 2.
- **characterCount_affineSign** (computation): For the sign action of C2 on A1/F3 the trivial-character weighted sum is 1/2+1/2+1+1=3, not 4.
- **characterE_signTensor** (non-example): For the sign representation of C2, its sign multiplicity is 1 but the sign multiplicity of its tensor square is 0; χ-projection cannot be declared multiplicative.
- **characterE_affineLine** (compatibility): For G=1, E(A1)=xy and #A1(Fq)=q, consistent with compact H_c²=Qℓ(−1), not with ordinary H⁰.

Construction or proof:

1. Import constructible compactly supported cohomology and the geometric mixed Hodge realization through G-MHS. Apply the finite-group idempotent |G|⁻¹Σ_g χ(g)⁻¹g.
2. Use exact sequences for invariant closed/open pairs. Apply the stack trace formula from G-ETII to identify the alternating trace with the groupoid-weighted sum, including nontrivial rational torsors.
3. The tensor-product rule convolves characters; taking a single χ coefficient therefore preserves addition, but does not in general preserve multiplication.

Check:

- For G=1 this is the compact Hodge–Deligne polynomial and ordinary point count.
- For nontrivial χ, the χ-count of a point with trivial action is zero.

Direct prerequisites: `EtaleDualityAndPerverseSheaves:EDC.0`, `LogicAndDefinabilityInNumberTheory:LD.3`, `tauceti:TauCeti.Hodge.MixedHodgeStructure`, `mathlib:sum_hom_units_eq_zero`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Definition 2.14, p.523; corrected denominator E23. The cohomological definition and its quotient-stack expression supply the realization; the weighted expression corrects the missing stabilizer denominator..

Routed extraction items: 13.

Open gates at this target: [G-MHS](#g-mhs), [G-ETII](#g-etii).

<a id="TMS0-fractional-lefschetz"></a>

### Fractional Lefschetz powers and root systems

Target `TMS.0/fractional-lefschetz` · definition · planet **Fractional Lefschetz powers**.

Use the equivariant scissor ring K0^G(Var/R) supplied by LD.3, retaining its distinction from further equivariant representation quotients. Adjoin coherent positive roots of L=[A1 with trivial G-action]; any expression in use has a finite common denominator N. For a fixed prime power q, a compatible root system is s_r∈C× for r≥1 with s_1=q and s_(rr′)^r=s_r′. Extend χ-realizations additively and linearly over the trivial-action Lefschetz powers: #^(s,χ)([X]L^(a/N))=#χ(X)s_N^a and Eχ([X]L^(a/N))=Eχ(X)(xy)^(a/N). Root choices remain part of the finite-field evaluation.

Hypotheses and interfaces:

- R has the finite-type hypotheses of the realization in use.
- Fractional bidegrees live in the finite-support rational-exponent algebra, available as AddMonoidAlgebra Z (Q×Q); only the necessary denominator subalgebra is used.
- Use a fixed system s for general prime powers. No root-choice independence is assumed there.

Uses that determine the API:

- GWZ20 Theorems 2.18–2.19: Encode rational sector ages while preserving the chosen finite-field root system.
- TMS.0/fractional-katz: Match L^a with the negative fractional Tate twist.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.compatibleRoots_one` | projection | A compatible system satisfies s_1=q. |
| `TauCeti.HitchinMirror.compatibleRoots_power` | relation | For positive r,r′, (s_(rr′))^r=s_r′. |
| `TauCeti.HitchinMirror.fractionalRealization_monomial` | simp | The evaluation of [X]L^(a/N) is #χ(X)s_N^a and Eχ(X)(xy)^(a/N). |
| `TauCeti.HitchinMirror.fractionalRealization_refine` | functoriality | Refining N to NN′ gives the same evaluation by the root relation. |
| `TauCeti.HitchinMirror.fractionalRealization_integer` | compatibility | The integer-exponent subalgebra agrees with the ordinary realization; its Tate sign agrees with TauCeti.Hodge.tate_hodgeNumber. |
| `TauCeti.HitchinMirror.fractionalRealization_primeTransport` | equivalence | For q=p prime to the character-value order, Galois transport fixing those values identifies the equality relations for compatible systems. |

Definition checks:

- **compatibleRoots_q4** (non-example): At q=4, the positive system has s_2=2 while the system exp((log 4+2πi)/r) has s_2=−2. L^(1/2)=2[pt] holds under the first evaluation and fails under the second.
- **fractionalL_refinement** (computation): Evaluating (L^(1/6))² and L^(1/3) agrees because s_6²=s_3.
- **fractionalL_unit** (degenerate): L^0 acts as 1 on every χ realization; for χ≠1 its value on the isolated trivial-action point is nevertheless 0.
- **fractionalL_tateSign** (compatibility): L has bidegree (1,1), whereas the existing Tate structure Z(1) has bidegree (−1,−1).

Construction or proof:

1. Import the actual equivariant Grothendieck ring and its realization descent from LD.3/G-Groth. Form the directed union of finite root adjunctions, with the transition L^(1/N)=(L^(1/NN′))^N′.
2. Extend the already additive χ map by the displayed scalar formula, using that trivial-character L acts by a Tate shift. Do not turn the χ coefficient map into a ring homomorphism.
3. For q=p prime not dividing the order of χ values, Eisenstein over the cyclotomic coefficient field and compactness transport two systems by an automorphism fixing those values. Apply this only at the prime-residue points used in comparison.

Check:

- Re-evaluating at a different root system requires an explicit transport argument.
- An integral power L^a has E=(xy)^a and count q^a, independently of s.

Direct prerequisites: [TMS.0/character-realizations](#TMS0-character-realizations), `LogicAndDefinabilityInNumberTheory:LD.3`, `mathlib:AddMonoidAlgebra`, `tauceti:TauCeti.Hodge.tate_hodgeNumber`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Definition 2.16, p.525; corrections E1 and E6. The root convention and formal Lefschetz powers give the comparison algebra; the published independence assertion needs the prime-field restriction..

Routed extraction items: 15.

Open gates at this target: [G-Groth](#g-groth).

<a id="TMS0-equivariant-katz"></a>

### Equivariant Katz comparison

Target `TMS.0/equivariant-katz` · theorem · planet **Equivariant Katz theorem**.

Let R⊂C be of finite type over Z, G finite and χ one-dimensional. For separated good G-schemes X,Y of finite type over R, equality of the corrected χ-counts after every map R→Fq implies Eχ_G(X_C)=Eχ_G(Y_C). The same statement holds for virtual scissor classes.

Hypotheses and interfaces:

- Fix an identification of the character-value fields in C and Qbarℓ.
- Counts include every finite extension of every allowed finite residue field. Shrinking and spreading are performed simultaneously on both sides.

Construction or proof:

1. Use the equivariant Bittner presentation requested from LD.3/G-Groth, not a nonequivariant compactification, to reduce virtual classes to smooth projective good G-varieties. Spread the finite list and all relations after shrinking R.
2. Use constancy of character Hodge numbers in smooth proper complex families to specialize to a number-field model in the relevant component; this adapter is requested from CP.3. Apply R01.5/frobenius-density and R01.1/brauer-nesbitt-traces to the resulting virtual lisse realizations.
3. Purity separates each integral cohomological degree for smooth proper summands; work in the Grothendieck group. The equivariant Hodge–Tate decomposition identifies the multiplicity at Tate degree −p with H^q(Ω^p), correcting E5.
4. Additivity returns the asserted equality for the original nonproper varieties. The required geometric MHS and equivariant blow-up interfaces remain explicit gates.

Check:

- For G=1 recover ordinary Katz comparison.
- The proof concludes equality of Hodge polynomials, not an actual isomorphism of nonsemisimple arithmetic representations.

Direct prerequisites: [TMS.0/character-realizations](#TMS0-character-realizations), `LogicAndDefinabilityInNumberTheory:LD.3`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `CohomologyComparisons:CP.3/hodge-tate-degeneration`, `CohomologyComparisons:CP.3`, `ArithmeticGaloisRepresentations:R01.5/frobenius-density`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `DeligneWeightsAndPurity:DWP.7`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Theorem 2.15 and proof, pp.523–524. The theorem compares character point counts and E-polynomials through equivariant blow-up reduction, purity, density and Hodge–Tate multiplicities.; [BITTNER04](https://arxiv.org/pdf/math/0111062v1), §7, Lemma 7.1, numbered p.18. The equivariant characteristic-zero blow-up presentation uses equivariant resolution and weak factorization, not an arbitrary chosen compactification..

Routed extraction items: 14.

Open gates at this target: [G-Groth](#g-groth), [G-MHS](#g-mhs), [G-HT](#g-ht).

<a id="TMS0-finite-tate-roots"></a>

### Finite-denominator Tate roots

Target `TMS.0/finite-tate-roots` · theorem.

For R⊂C of finite type and a finite denominator N, choose ℓ∤N. After shrinking Spec R[1/ℓ] and a finite étale cover R′ with a chosen complex embedding, the cyclotomic character has image in a log/exp neighborhood. The character exp((1/N)log χℓ) defines a lisse rank-one Qℓ(1/N) whose Nth tensor power is Qℓ(1); roots for divisors of N are compatible. With Qbarℓ coefficients one can choose compatible roots for all denominators, but only each fixed finite set is asserted to have a finite coefficient model.

Hypotheses and interfaces:

- The sheaves are on Spec R′[1/ℓ], not on all of Spec R.
- For the Qℓ formula N is prime to ℓ, or a specific finite convergence bound must be supplied.
- No fixed finite coefficient field is required to contain every ℓ-power root of the cyclotomic character.

Construction or proof:

1. Kill the finite torsion quotient of the cyclotomic image by finite étale base change and choose a sufficiently deep principal-unit subgroup.
2. For ℓ∤N, division by N preserves the log image and exp converges; tensor compatibility follows by multiplication of logarithms.
3. For the all-denominator Qbarℓ statement use compatible principal-unit roots of a generator of the procyclic cyclotomic image, with continuous Zℓ powers. This is an existence statement; the finite-denominator branch suffices for every fractional comparison.

Check:

- For N=1 obtain the cyclotomic Tate sheaf.
- A proposed Qℓ-valued system of all ℓ-power roots fails on an open cyclotomic image: sufficiently high powers cannot hit a fixed shallow principal unit.

Direct prerequisites: `CohomologyComparisons:CP.3`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Lemma 2.17, pp.525–526; correction E2. The finite-denominator construction repairs both coefficient and convergence domains of the published argument..

Routed extraction items: 16.

Open gates at this target: [G-HT](#g-ht).

<a id="TMS0-fractional-katz"></a>

### Katz comparison with fractional twists

Target `TMS.0/fractional-katz` · theorem · planet **Fractional Katz theorem**.

For R,G,χ as above and finite fractional-Lefschetz expressions X,Y in the equivariant scissor realization, suppose #^(s,χ)(X_Fq)=#^(s,χ)(Y_Fq) for every R→Fq, using a specified compatible system at each map. Then Eχ(X_C)=Eχ(Y_C) in the rational-bidegree algebra.

Hypotheses and interfaces:

- A single finite denominator N works for both expressions. Choose ℓ∤N and finite coefficient models after the permitted common cover.
- The comparison is in a Grothendieck group of representations; alternating signs remain attached to cohomological degrees.
- At q=p prime, p is also prime to the order of the character values when transporting root systems.

Construction or proof:

1. Reduce to finite virtual sums of smooth projective G-varieties times L^a by equivariant Bittner. Apply finite-tate-roots and identify L^a with Qbarℓ(−a), giving geometric Frobenius eigenvalue q^a.
2. Use the prime-field transport from fractional-lefschetz at density-one prime-residue places of the number-field specialization. It fixes the character-value field. Arbitrary prime powers retain their specified root choices.
3. Chebotarev and Brauer–Nesbitt compare virtual representation classes, including all weight pieces; do not discard alternating signs when rational shifts make weights overlap.
4. Apply the generalized fractional Hodge–Tate realization of Ito §5 to those classes. Its rational Cℓ(a)-period multiplicities and additivity are the requested G-HT adapter. It returns the shift h^(p−a,q−a), with the negative Tate twist, then yields equality of rational Hodge bidegrees.

Check:

- L^(1/2) shifts the E-bidegree by (1/2,1/2); its realization is Qbarℓ(−1/2).
- Keep X exponents a_i and Y exponents b_j separate; no conclusion about actual ungraded Galois representations follows.

Direct prerequisites: [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz), [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/finite-tate-roots](#TMS0-finite-tate-roots), `ArithmeticGaloisRepresentations:R01.5/frobenius-density`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `CohomologyComparisons:CP.3`, `DeligneWeightsAndPurity:DWP.7`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Theorem 2.18, pp.526–527; corrections E1, E2 and E6. The proof extends Katz comparison to rational age shifts with compatible roots and corrected negative Tate twists.; [ITO04](https://arxiv.org/pdf/math/0211378v3), §4, Lemma 4.3, pp.12–13; §5.1–5.3, pp.13–16. Fractional twists and the generalized Hodge–Tate realization on virtual representations explain the missing rational-period adapter..

Routed extraction items: 17.

Open gates at this target: [G-HT](#g-ht), [G-Groth](#g-groth), [G-MHS](#g-mhs).

<a id="TMS0-stringy-invariants"></a>

### Stringy E-polynomials and point counts

Target `TMS.0/stringy-invariants` · definition · planet **Stringy invariants**.

For a smooth tame finite quotient stack X=[Y/Γ], use its inertia decomposition ⨿_[γ][Y^γ/C(γ)] and the imported age F(γ,Z). Set E_st(X)=Σ_[γ],Z E([Z/C(γ)])(xy)^F(γ,Z), where the sector E uses C(γ)-invariants in compact cohomology. Over Fq containing the required roots, set #_st(X)=Σ_[z]∈IX(Fq) q^F(z)/|Aut(z)|, with positive real q^F. Allow Γ nonabelian here; the integration layers specialize to abelian Γ.

Hypotheses and interfaces:

- Y is smooth separated finite type; the finite group order is invertible, with the chosen roots of unity giving the sector labels.
- F uses tangent eigenvalues exp(2πic/r) with 0≤c<r. The alternative weight satisfies w(γ,Z)=dim X−F(γ⁻¹,Z).
- The quotient-stack presentation, inertia and age constructions are imports from R09 and G-ETII.

Uses that determine the API:

- GWZ20 Theorem 2.19: Realize each inertia sector by a fractional Lefschetz monomial.
- TMS.2/arithmetic-mirror and TMS.5/main-mirror: Compare the twisted orbifold invariant on the PGL side with the ordinary SL invariant.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.stringy_sum_sectors` | characterisation | The inertia decomposition evaluates the invariant by the displayed centralizer-invariant sector sum. |
| `TauCeti.HitchinMirror.stringy_scheme` | compatibility | For a smooth scheme, the invariant agrees with the ordinary compact Hodge/count realization. |
| `TauCeti.HitchinMirror.stringy_equivalence` | functoriality | An equivalence of smooth quotient stacks preserving tangent data identifies the invariants. |
| `TauCeti.HitchinMirror.stringy_root_reindex` | equivalence | Replacing a primitive generator by its kth power transports γ to γ^k and gives the same untwisted sector sum. |
| `TauCeti.HitchinMirror.stringy_disjointUnion` | relation | The invariant of a disjoint union is the sum of the invariants. |
| `TauCeti.HitchinMirror.stringy_identityAge` | simp | The identity sector has age zero. |

Definition checks:

- **stringy_point** (degenerate): The invariant of Spec C is 1 and of Spec Fq is 1.
- **stringy_BC2** (computation): Over a split field of characteristic different from 2, E_st(BC2)=2 and #_st(BC2)=2: each of the two age-zero inertia components has ordinary mass 1. This is different from the ordinary mass of BC2, which is 1.
- **stringy_signLine** (computation): For [A1/C2] with sign action, the stringy E-polynomial is xy+(xy)^(1/2); over odd Fq the stringy count is q+q^(1/2).
- **stringy_freeAction** (compatibility): For a free finite action on smooth Y, [Y/Γ] is the smooth quotient scheme and all nonidentity sectors are empty.

Construction or proof:

1. Apply the imported inertia and age to the character realization at the trivial centralizer character; sum its finitely many connected sectors with the rational diagonal shift.
2. Use weighted quotient-stack masses over finite fields, including rational torsors.
3. Prove invariance under presentation and simultaneous root-generator/sector reindexing from the imported inertia/age equivalences. Nontrivial tangent eigenvalues are essential, so this is not the invariant of the coarse space alone.

Check:

- For a smooth scheme X the inertia has only age-zero identity and the invariant is ordinary E(X) or #X(Fq).

Direct prerequisites: [TMS.0/character-realizations](#TMS0-character-realizations), [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz), `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.1, Definition 2.4 and Remark 2.5, pp.513–514. The sector sum defines both invariants and explains independence of presentation and primitive generator..

Routed extraction items: 7.

Open gates at this target: [G-ETII](#g-etii), [G-MHS](#g-mhs).

<a id="TMS0-twisted-stringy-invariants"></a>

### Gerbe-twisted stringy invariants

Target `TMS.0/twisted-stringy-invariants` · definition · planet **Twisted stringy invariants**.

For the same X, an étale μr-gerbe α and a fixed faithful embedding of μr into the coefficient field, import its transgression torsor Pα on IX. Define E_st(X,α)=Σ_Z E(Z,Pα|Z)(xy)^F(Z) by the specified character of the torsor total space, with centralizer invariants. Define #^α_st(X)=Σ_[z] q^F(z) Tr(Fr_z,Nα,z)/|Aut(z)|. All root embeddings, torsor-associated character conventions and age generators are transported together.

Hypotheses and interfaces:

- r is invertible and the finite-field roots required by the chosen sector presentation and μr-character are present.
- Use geometric Frobenius, positive q^age, and the associated line local system Nα selecting the same character as the complex realization.
- A μr-gerbe may be nonneutral even when its induced Gm-gerbe is neutral; transgression factors through that Gm-gerbe.
- Whenever transgression is identified through the Gm image, impose the actual admissibility root condition μ_(r|Γ|) for the chosen finite quotient presentation on the base, as in the requested corrected Lemma2.9; over C it is automatic.

Uses that determine the API:

- GWZ20 Corollary 5.29: Compare the sector trace with the complex conjugate of the Hasse-character integral.
- GWZ20 Theorems 6.11 and 7.21: The final mirror statement uses precisely these twisted coefficients.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.twistedStringy_zero` | simp | For the neutral gerbe, twisted and untwisted invariants coincide. |
| `TauCeti.HitchinMirror.twistedStringy_pullback` | functoriality | A stack equivalence and a band-preserving gerbe equivalence transport the invariant. |
| `TauCeti.HitchinMirror.twistedStringy_brauer` | compatibility | Gerbes with isomorphic induced Gm-gerbes have equivalent transgressed local systems, with the fixed character convention. |
| `TauCeti.HitchinMirror.twistedStringy_inverseSector` | relation | Pullback along inertia inversion identifies Nα on γ⁻¹ with the dual of Nα on γ. |
| `TauCeti.HitchinMirror.twistedStringy_identity` | simp | The transgression on the identity section is canonically trivial. |
| `TauCeti.HitchinMirror.twistedStringy_torsorRealization` | characterisation | The sector coefficient is the faithful-character part of compact cohomology of its μr-torsor total space, with centralizer invariants. |

Definition checks:

- **twistedStringy_neutral** (degenerate): On [A1/C2] with neutral gerbe, the value is xy+(xy)^(1/2), not just xy.
- **twistedStringy_schemeGerbe** (compatibility): A root gerbe on a smooth scheme has no additional inertia sectors in the base scheme; its twisted stringy invariant is the ordinary E-polynomial of that scheme.
- **twistedStringy_finiteTorsor** (computation): For a μr-torsor over Spec Fq on which geometric Frobenius acts by a∈μr, the associated faithful-character trace is the chosen character value of a, rather than the number of rational points of the torsor.
- **twistedStringy_inverse** (non-example): For r=3 and a primitive value ζ, inverse-sector traces are ζ and ζ⁻¹. They cannot be identified without dualizing or conjugating.

Construction or proof:

1. Import corrected action-groupoid descent and transgression from G-ETII, including the factorization through Gm-gerbes. Pull each sector torsor to its finite cover with Γ×μr-action.
2. Apply character-realizations to the torsor total space and append its age monomial. The stack trace formula supplies stabilizer denominators.
3. Use transgression pullback and inversion to prove functoriality, trivial-twist normalization and the inverse-sector/dual-local-system relation needed by the integral formula.

Check:

- For α=0 recover the untwisted invariants.
- On a smooth scheme the identity-sector transgression is trivial, so these stringy invariants are ordinary even for a nonneutral μr-gerbe.

Direct prerequisites: [TMS.0/stringy-invariants](#TMS0-stringy-invariants), [TMS.0/character-realizations](#TMS0-character-realizations), `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.4, Definitions 2.12–2.13, pp.521–522. The transgressed torsor supplies the sector coefficients for the twisted E-polynomial and weighted point count..

Routed extraction items: 12.

Open gates at this target: [G-ETII](#g-etii), [G-MHS](#g-mhs).

<a id="TMS0-stringy-comparison"></a>

### Stringy counts determine E-polynomials

Target `TMS.0/stringy-comparison` · theorem.

Let R⊂C be of finite type, X_i=[Y_i/Γ_i] smooth finite abelian quotients over R, and α_i μr-gerbes. If their twisted stringy counts agree after every R→Fq at good residue characteristics and with compatible specified root/character choices, then E_st((X_1)_C,α_1)=E_st((X_2)_C,α_2). A common shrinking and finite étale cover is allowed, retaining the chosen complex fibres.

Hypotheses and interfaces:

- The root and character choices over residue fields are transported to the same complex convention; enlarge R to contain the finite needed roots.
- All finite-field extensions remain in the hypothesis.

Construction or proof:

1. Put both presentations under Γ_1×Γ_2 and separate the finitely many connected inertia sectors. Realize transgression torsors as good Γ×μr-varieties.
2. Encode sector Z by its torsor total-space class times L^F(Z), using the faithful μr character and trivial centralizer character. The exponent is the age F, not the gerbe α.
3. Apply fractional-katz to the finite virtual difference; the compatible root/character conventions identify its E-realization with the required twisted stringy difference.

Check:

- For trivial groups and gerbes recover ordinary Katz comparison.
- The expression uses the same finite set of age denominators on the two sides after common refinement.

Direct prerequisites: [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants).

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §2.5, Theorem 2.19, pp.527–528; correction E7. The theorem expresses stringy invariants as character realizations of fractional Lefschetz classes and then applies Katz comparison..

Routed extraction items: 18.

Open gates at this target: [G-MHS](#g-mhs), [G-Groth](#g-groth), [G-HT](#g-ht), [G-ETII](#g-etii).

Layer acceptance requires all targets above and the following remaining obligations:

- G-ETII: Generic integration supplier and two proof repairs.
- G-Groth: Equivariant blow-up presentation.
- G-HT: Equivariant and fractional Hodge–Tate realization.
- G-MHS: Geometric mixed Hodge structures and local systems.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

<a id="TMS1"></a>

## TMS.1 — Arithmetic gerbes and relative splittings

Define arithmetic gerbes, the relative stack of splittings and its rigidification, and the principal Picτ-torsor. Prove the constant-Brauer-class criterion with the middle-exact Hochschild–Serre sequence, and compare principal splittings with unitary splittings over C. Keep Picτ, Pic0, a point of Split′, Brauer neutrality and μr-neutrality distinct.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A2`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

<a id="TMS1-arithmetic-gerbe"></a>

### Arithmetic gerbes

Target `TMS.1/arithmetic-gerbe` · definition · planet **Arithmetic gerbes**.

For f:U→V proper with geometrically connected fibres and a smooth commutative band B over V, a B-gerbe α on U is V-arithmetic when an étale covering {V_i→V} makes α|_(U×V V_i) neutral. For a field K this means geometric neutrality over K^s, with finite-presentation descent. Keep the band: arithmetic μr-neutrality is stronger than neutrality of its image in H²(U,Gm).

Hypotheses and interfaces:

- r is invertible when B=μr.
- Use the imported algebraic stack/gerbe formalism; assume f_*Gm=Gm universally whenever a Picard or Hochschild–Serre statement below needs it, in particular for smooth proper geometrically connected fibres.

Uses that determine the API:

- GWZ20 Lemmas 6.2 and 6.5: Make the relative splitting stack a torsor and identify its Brauer obstruction.
- GWZ20 Definition 6.9: Dual systems carry arithmetic gerbes on their regular torsor fibres.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.arithmeticGerbe_baseChange` | functoriality | An arithmetic gerbe remains arithmetic after arbitrary base change. |
| `TauCeti.HitchinMirror.arithmeticGerbe_neutral` | constructor | A chosen neutralization implies arithmeticity. |
| `TauCeti.HitchinMirror.arithmeticGerbe_field` | characterisation | For finite-presentation gerbes over a field, arithmeticity is equivalent to neutrality over the separable closure. |
| `TauCeti.HitchinMirror.arithmeticGerbe_bandMap` | compatibility | Extension along μr→Gm preserves arithmeticity; the converse requires the Kummer obstruction and is not asserted. |
| `TauCeti.HitchinMirror.arithmeticGerbe_equivalence` | equivalence | Band-preserving equivalences of relative gerbes preserve arithmeticity. |

Definition checks:

- **arithmeticGerbe_constant** (non-example): A nonsplit μ2-gerbe pulled back from R to Spec R is arithmetic, since it splits over C, but is not neutral over R.
- **arithmeticGerbe_rootLine** (non-example): On P1/C, the μ2-gerbe of square roots of O(1) has neutral induced Gm-gerbe but is not arithmetic as a μ2-gerbe: its class in Pic(P1)/2 is nonzero.
- **arithmeticGerbe_unitBand** (degenerate): For μ1 the unique gerbe is neutral and arithmetic.
- **arithmeticGerbe_trivialLine** (compatibility): The root gerbe of the existing trivial invertible sheaf has its canonical root and is arithmetic.

Construction or proof:

1. Define the local-neutrality property on the base étale site, using gerbes from R09.4.
2. Use the sheaf condition to transport along equivalences and base change; over a field descend a geometric neutralization to a finite separable extension.
3. Compare the μr and Gm images by extension of band, retaining the Kummer kernel Pic(U)/r.

Check:

- The neutral gerbe is arithmetic over any allowed base.
- This is a property of the relative gerbe and its band, not an assertion that a global section exists.

Direct prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `AlgebraicModuliForArithmeticGeometry:R09.4/h2-classification`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization`, `AlgebraicModuliForArithmeticGeometry:R09.4/change-band`, `AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor`, `AlgebraicModuliForArithmeticGeometry:R09.4/root-gerbe`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.1, Definition 6.1, p.565. Arithmeticity is local neutrality after a cover of the base, not just local neutrality on U itself..

Routed extraction items: 49.

<a id="TMS1-relative-splitting"></a>

### Relative stacks of splittings

Target `TMS.1/relative-splitting` · construction · planet **Relative splittings**.

For a V-arithmetic Gm-gerbe β on U, define the V-stack Split̃(U/V,β) by the groupoid of its neutralizations on U_T for T→V. Tensoring a neutralization by a line bundle gives an action of the relative Picard stack Pic̃(U/V), and this makes Split̃ a Pic̃-torsor. For a μr-gerbe α, use its μr-neutralizations and μr-rigidify to obtain Split_μr; it is a torsor under the rigidified relative μr-torsor sheaf, identified with Pic(U/V)[r] by the relative Kummer sequence.

Hypotheses and interfaces:

- f is proper, geometrically connected and cohomologically flat in degree zero in the chosen Picard representability interface.
- r is invertible and the appropriate gerbe is V-arithmetic.
- Rigidification is a sheaf construction; quotienting individual T-valued section sets is insufficient.

Uses that determine the API:

- GWZ20 Definition 6.4: Extend the Pic[r]-torsor to its Picτ principal component.
- TMS.4/Hausel–Thaddeus gerbe duality: Identify neutralizations of a universal-family obstruction on a spectral fibre.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.relativeSplit_tensor` | structure | Tensoring a Gm-neutralization by a line bundle defines the Picard-stack action with unit and associativity isomorphisms. For μr-neutralizations use the relative μr-torsor stack and retain the rth-power trivialization. |
| `TauCeti.HitchinMirror.relativeSplit_difference` | universal-property | For Gm-neutralizations, the action map Pic̃×Split̃→Split̃×Split̃ is an equivalence over V. For μr-neutralizations replace Pic̃ by the relative μr-torsor stack; after μr-rigidification its acting sheaf is Pic(U/V)[r]. |
| `TauCeti.HitchinMirror.relativeSplit_baseChange` | functoriality | Pullback identifies the splitting stack with the splitting stack of the pulled-back gerbe. |
| `TauCeti.HitchinMirror.relativeSplit_rigidification` | projection | The μr-rigidification map is a μr-gerbe and removes precisely the scalar μr automorphisms. |
| `TauCeti.HitchinMirror.relativeSplit_kummer` | compatibility | The rigidified relative μr-torsor group is Pic(U/V)[r], via the relative Kummer sequence, not Pic(U/V)/r. |
| `TauCeti.HitchinMirror.relativeSplit_neutralOrigin` | constructor | A chosen Gm-neutralization identifies its splitting stack with Pic̃. A chosen μr-neutralization identifies its splitting stack with the relative μr-torsor stack and its rigidification Split_μr with Pic[r]. |

Definition checks:

- **relativeSplit_neutralCurve** (compatibility): For the neutral μr-gerbe on a pointed smooth projective curve, the rigidified splitting sheaf is its relative Picard r-torsion, of order r^(2g) when r is invertible.
- **relativeSplit_point** (degenerate): For U=V and a base gerbe, the rigidified relative splitting sheaf is the terminal sheaf even if the base gerbe has no global neutralization.
- **relativeSplit_automorphisms** (non-example): Before rigidification a neutralization of a μr-gerbe has μr automorphisms; after rigidification these scalar automorphisms are trivial.
- **relativeSplit_lineComparison** (compatibility): For a neutral Gm-gerbe the difference between the trivialization and its tensor by an existing InvertibleSheaf L is exactly the class of L in the imported Picard group.
- **relativeSplit_kummerTrivialization** (non-example): Over Spec ℝ, the μ2-torsors t²=1 and t²=−1 are not isomorphic, although their associated line bundles are both trivial. They give different objects in the neutral μ2-gerbe splitting groupoid before rigidification; the relative rigidified sheaf for U=V is nevertheless terminal. Forgetting the square trivialization before forming the groupoid loses this distinction.

Construction or proof:

1. Use the imported Picard stack and gerbe maps. The sheaf of differences of any two neutralizations is a line bundle, or a μr-torsor with the band retained.
2. Arithmeticity makes the difference action locally nonempty, hence a torsor rather than just a pseudotorsor.
3. Apply R09.5/rigidification and its base-change theorem. On the base étale site, the Kummer map kills relative unit ambiguities and identifies the rigidified μr-torsor group with Pic[r].

Check:

- For Gm-neutralizations the difference is a line bundle; for μr-neutralizations it is a μr-torsor, equivalently a line bundle together with its rth-power trivialization. Retain the full difference groupoid before rigidification.

Direct prerequisites: [TMS.1/arithmetic-gerbe](#TMS1-arithmetic-gerbe), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`, `AlgebraicModuliForArithmeticGeometry:R09.4/h2-classification`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization`, `AlgebraicModuliForArithmeticGeometry:R09.4/change-band`, `AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.1, Lemma 6.2 and Definition 6.3, pp.565–566. The splitting groupoids carry the relative line-bundle action, and arithmeticity supplies local sections..

Routed extraction items: 49.

<a id="TMS1-principal-splitting"></a>

### The principal splitting torsor

Target `TMS.1/principal-splitting` · construction · planet **Principal splitting torsor**.

Let Picτ(U/V) be the inverse image in the relative Picard sheaf of the torsion subgroup of its geometric component group. For a V-arithmetic μr-gerbe α, define Split′(U/V,α)=Split_μr(U/V,α)×^(Pic(U/V)[r])Picτ(U/V). This is extension of structure group of a Pic[r]-torsor, not a chosen connected component of Split̃. Over an abelian-scheme torsor, identify Picτ=Pic0 with the dual abelian scheme.

Hypotheses and interfaces:

- Use the relative Picard representability and component-group interface imported from JacobianChallenge D and A2.
- The map Pic[r]→Picτ is the natural inclusion and r is invertible.
- Picτ=Pic0 is invoked only where proved; torsion in the Néron–Severi group can prevent it in general.

Uses that determine the API:

- GWZ20 Definition 6.9(c): The opposite Hitchin fibre is this torsor under the dual Prym.
- GWZ20 Lemma 6.7 and Theorem 7.18: Its class gives the local Tate character and the Hausel–Thaddeus duality.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.principalSplit_action` | structure | Picτ acts simply transitively on Split′ after an étale base cover. |
| `TauCeti.HitchinMirror.principalSplit_fromNeutralization` | constructor | A μr-neutralization maps canonically to a point of Split′. |
| `TauCeti.HitchinMirror.principalSplit_baseChange` | functoriality | The contracted product commutes with the allowed base changes. |
| `TauCeti.HitchinMirror.principalSplit_neutral` | simp | For the neutral gerbe with its chosen neutralization, Split′≃Picτ equivariantly. |
| `TauCeti.HitchinMirror.principalSplit_abelian` | compatibility | For a torsor under A, the acting group is A∨ through the normalized relative Picard/Poincaré comparison. |
| `TauCeti.HitchinMirror.principalSplit_cocycle` | characterisation | The torsor class is the image of the splitting Pic[r]-cocycle in H¹(V,Picτ). |

Definition checks:

- **principalSplit_constantBrauer** (non-example): For a nonsplit constant μ2-gerbe on X/R with X(R) nonempty, Split′≃Picτ has a point while the μ2-gerbe remains nonneutral.
- **principalSplit_genusOne** (computation): For the neutral μr-gerbe on an elliptic curve E with its origin, Split′ is E∨, not the finite group E[r].
- **principalSplit_point** (degenerate): For U=V=Spec K the relative Picard group is zero and Split′ is a point, independently of the constant gerbe class.
- **principalSplit_torsionComponents** (non-example): If the relative Picard component group has nonzero torsion, the construction retains those Picτ components; replacing it by Pic0 changes the contracted-product torsor.

Construction or proof:

1. Form the contracted product as the fppf sheaf quotient of pairs (s,L) under (s,L)·t=(s·t,t⁻¹L). Import quotient representability and descent.
2. The residual Picτ action is locally simply transitive; descent gives the principal torsor. Base change and band/gerbe equivalences act on both factors.
3. For an abelian torsor, translation and the normalized Poincaré comparison identify Picτ with the dual abelian scheme; no origin of the torsor is chosen.

Check:

- A μr-neutralization gives a point of Split′; the reverse implication is not part of the construction.

Direct prerequisites: [TMS.1/relative-splitting](#TMS1-relative-splitting), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.4/h2-classification`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization`, `AlgebraicModuliForArithmeticGeometry:R09.4/change-band`, `AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.1, Definition 6.4 and the paragraph following it, p.566. The principal splitting space is an extension from Pic[r] to Picτ, which can forget a constant gerbe obstruction..

Routed extraction items: 49.

<a id="TMS1-constant-brauer"></a>

### Principal splittings and constant Brauer classes

Target `TMS.1/constant-brauer` · theorem · planet **Constant-gerbe criterion**.

For smooth proper geometrically connected X/K with H⁰(X_Ks,Gm)=(Ks)× and arithmetic μr-gerbe α, a K-point of Split′ implies that the induced Gm-class β lies in im(Br(K)→Br(X)). Use the middle-exact Hochschild–Serre edge sequence Pic(X)→Pic(X_Ks)^GK→Br(K)→Br(X)_K→H¹(GK,Pic(X_Ks))→H³(GK,(Ks)×). No injectivity of Br(K) or surjectivity to H¹ is assumed. A K-point of X gives injectivity, and H³=0 suffices for the right surjectivity.

Hypotheses and interfaces:

- All Picard sheaves and Galois modules are the imported geometric ones.
- For more general proper X require explicitly the global-units hypothesis used by the edge sequence.
- The conclusion concerns β, not neutrality of α as a μr-gerbe.

Construction or proof:

1. The cocycle description of principal-splitting sends β to the image of its Picτ-torsor class in H¹(K,Pic). A rational point kills that class.
2. Apply the exact low-degree sequence in SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering (part3) with F=Gm, and the Picard identifications of SF.3/picard-brauer-sequence. Its exactness at Br(X)_K alone gives a constant Brauer class; no new geometric spectral sequence is needed.
3. Use pullback along a rational point only when present. The Kummer sequence explains why a possible Pic(X)/r residue prevents inferring μr-neutrality from β=0.

Check:

- For the real conic with no real point, the nonzero Hamilton Brauer class can map to zero, so the displayed sequence cannot begin with an unconditional injection.
- For a local field with good integral point, evaluation of a constant class reduces to Br(O_F)=0 in local-brauer-splitting.

Direct prerequisites: [TMS.1/principal-splitting](#TMS1-principal-splitting), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering`, `SchemeAndStackFoundations:SF.3/picard-brauer-sequence`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.1, equation (24) and Lemma 6.5, pp.565–566; correction E4. Only the middle-exact part of Hochschild–Serre is needed for the constant-class conclusion..

Routed extraction items: 50.

<a id="TMS1-unitary-splitting-comparison"></a>

### Unitary and arithmetic principal splittings

Target `TMS.1/unitary-splitting-comparison` · comparison.

For smooth projective U→V over C, an arithmetic μr-gerbe α, and Picτ(U/V)=Pic0(U/V), identify the analytic space of Split′ with the manifold of flat unitary splittings of the corresponding unitary gerbe. The isomorphism is equivariant for the rank-one unitary-line/Pic0 comparison and compatible with pullback; it does not select a neutralization.

Hypotheses and interfaces:

- Retain Picτ=Pic0 and the smooth projective complex hypotheses.
- The unitary gerbe and its flat splittings are imported from the rank-one extension requested of HodgeStructuresPartII H.1; that stage currently fixes a narrower determinant scope.

Construction or proof:

1. Apply the imported rank-one unitary-line/Pic0 equivalence to local neutralizations and their differences.
2. Both sides are obtained by extending the same Pic[r]-torsor of μr-neutralizations along Pic[r]→Pic0. Compare the descent cocycles, using arithmeticity.
3. The source only states the comparison as a remark; retain G-unitary until the analytic construction and family descent are supplied.

Check:

- For a neutral gerbe on an elliptic curve, both sides are its dual elliptic curve as real manifolds with their compatible complex structure.
- This comparison is not required by the arithmetic integration proof; it is required for the stated compatibility with the original formulation.

Direct prerequisites: [TMS.1/principal-splitting](#TMS1-principal-splitting), `HodgeStructuresPartII:H.1`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.1, Remark 6.6, p.567; HT03 §3, numbered pp.8–13. The remark identifies the principal contracted product with the unitary splitting convention used by Hausel–Thaddeus.; [HT03](https://arxiv.org/pdf/math/0205236v1), §3, Propositions 3.2 and 3.6, numbered pp.8–13. The proofs use the same extension of the finite splitting torsor by the dual Prym..

Routed extraction items: 51.

Open gates at this target: [G-unitary](#g-unitary).

Layer acceptance requires all targets above and the following remaining obligations:

- G-unitary: Family comparison with unitary principal splittings.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

<a id="TMS2"></a>

## TMS.2 — Abstract Hitchin duality

Specify abstract Hitchin systems and their duality data, including the codimension-two torsor locus and the local Brauer splitting condition used by integration. Construct compatible gauge forms; prove the twisted-count integral formula, equal fibre volumes, character cancellation, fibrewise arithmetic mirror symmetry and complex stringy mirror symmetry. Generic stack integration remains an import.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `ArithmeticGaloisDuality:R02.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `EtaleDualityAndPerverseSheaves:EDC.0`, `LogicAndDefinabilityInNumberTheory:LD.2`, [TMS.0](#TMS0), [TMS.1](#TMS1), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

<a id="TMS2-abstract-hitchin-system"></a>

### Abstract Hitchin systems

Target `TMS.2/abstract-hitchin-system` · definition · planet **Abstract Hitchin system**.

An abstract Hitchin system over noetherian R consists of smooth A/R, a smooth admissible finite abelian quotient stack M/R, π:M→A with proper coarse map, and a smooth commutative A-group P acting relatively. Choose dense open A♦⊂A with P♦ an abelian scheme and a dense open M′⊂M which is a P-torsor over its image in A, contains M♦ and has complement of codimension at least two. The torsor need not be surjective over A. Use equidimensional components when writing q^dim M.

Hypotheses and interfaces:

- Admissible means the precise tame generically free quotient and root hypotheses of the imported Definition 4.10, not arbitrary finite inertia.
- P is smooth along the zero section with locally free invariant differentials on the part used for gauge forms.
- Properness belongs to the coarse map; M′ is an algebraic space, with no residual stabilizers.

Uses that determine the API:

- GWZ20 §6.3: Transfer invariant relative top forms to the total space and integrate fibrewise.
- GWZ20 Proposition 7.12: Certify the SLn and PGLn examples after checking every open-locus and admissibility condition.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.abstractHitchin_regular` | projection | The restriction M♦ is a torsor under the abelian scheme P♦ over its image. |
| `TauCeti.HitchinMirror.abstractHitchin_coarseProper` | projection | The coarse-space map to A is proper. |
| `TauCeti.HitchinMirror.abstractHitchin_boundaryCodim` | projection | The complement of the specified torsor locus has codimension at least two. |
| `TauCeti.HitchinMirror.abstractHitchin_baseChange` | functoriality | Base change preserves the structure when smoothness, admissibility, density and the codimension bound are preserved; in particular use the verified flat base changes and field extensions, and recheck dense opens for a general nonflat base change. |
| `TauCeti.HitchinMirror.abstractHitchin_schemeLocus` | compatibility | On M′ the stack is the imported P-torsor algebraic space, with trivial inertia. |
| `TauCeti.HitchinMirror.abstractHitchin_invariantDifferentials` | compatibility | On M′, relative differential forms identify with pullbacks of the invariant forms on P, by the imported torsor differential theorem. |

Definition checks:

- **abstractHitchin_ellipticProduct** (computation): For an elliptic curve E over a field, M=P=E×A1 over A=A1 with M′=M and A♦=A is an abstract system.
- **abstractHitchin_rankZero** (degenerate): With trivial relative group and M=A smooth, the identity proper coarse morphism is a relative-dimension-zero system.
- **abstractHitchin_blowup** (non-example): Blowing up a point of a smooth surface abelian fibration produces an exceptional divisor in the complement of the old torsor locus. Its codimension one fails the stated bound, so the old locus cannot certify the new system.
- **abstractHitchin_notSurjective** (non-example): A torsor over an open image is allowed; existence of A♦ does not assert that every base fibre of M has a rational point.

Construction or proof:

1. Package the imported smooth stack, relative group action, dense opens and proper coarse morphism, with the stated geometric properties as proof obligations about those actual objects.
2. Use the torsor action to identify relative tangent bundles on M′ with the invariant tangent bundle of P.
3. Keep the codimension bound as a structural hypothesis: extension of a nowhere-zero top form and equality of orbifold/gauge measure use it.

Check:

- A smooth abelian scheme over A, viewed as its own torsor with no boundary, gives a system.

Direct prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/picard-stack-action`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.2, Definition 6.8, p.568; §6.3, Remark 6.14, p.571. The definition isolates the proper coarse fibration and its codimension-two torsor locus used by the measure argument..

Routed extraction items: 53.

Open gates at this target: [G-ETII](#g-etii).

<a id="TMS2-dual-hitchin-pair"></a>

### Dual Hitchin systems

Target `TMS.2/dual-hitchin-pair` · definition · planet **Dual Hitchin systems**.

Take two abstract systems over the same A, arithmetic admissible μr-gerbes α_i, an étale isogeny φ:P1→P2 over all A, and ψ:(P1♦)∨≃P2♦ with ψφ∨=φψ∨ under biduality. Its geometric kernel degree over A♦ is a unit. Require Picτ=P_i∨ on regular fibres and equivariant isomorphisms Split′(M_i♦/A♦,α_i)≃M_(i′)♦ as P_(i′)♦-torsors. The local hypothesis sufficient for all comparisons is: whenever both fibres over b∈A(O_F)∩A♦(F) have F-points, both induced Gm-gerbes are neutral. The paper’s condition that both μr-gerbes are neutral iff both fibres have points is a stronger additional predicate; it implies the sufficient hypothesis, and its extra μr-neutrality assertion remains G-Kummer.

Hypotheses and interfaces:

- The local-field condition quantifies over each R→O_F and the indicated integral base points; retain the admissible root and prime-to-characteristic hypotheses.
- Both systems have the same pure total dimension on the compared components, as supplied by their dual regular abelian fibres and common smooth base.
- The isogeny is étale on all A where gauge forms are pulled back; generic étaleness alone is insufficient.

Uses that determine the API:

- GWZ20 Lemma 6.16: Use the self-dual isogeny to equate local indices and fibre volumes.
- GWZ20 Theorem 6.17: The opposite splitting torsor class gives a nontrivial Tate character when the opposite fibre has no point; Brauer neutrality gives phase 1 when both have points.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.dualHitchin_oppositeSplit` | projection | Split′ of the ith regular fibre is a torsor under the opposite group and is equivariantly the opposite fibre. |
| `TauCeti.HitchinMirror.dualHitchin_selfDual` | projection | The square for φ, φ∨ and ψ commutes with the stated source/target identifications. |
| `TauCeti.HitchinMirror.dualHitchin_localBrauer` | projection | If both regular integral fibres have F-points then both induced Brauer classes vanish on those fibres. |
| `TauCeti.HitchinMirror.dualHitchin_swap` | equivalence | Swap the systems using the duality and the corresponding reversed self-dual isogeny when supplied; do not assume φ has an inverse. |
| `TauCeti.HitchinMirror.dualHitchin_baseChange` | functoriality | Pullback preserves the structure under the verified base changes of the abstract systems, with the local condition checked after composition R→R′→O_F. |
| `TauCeti.HitchinMirror.dualHitchin_strongCondition` | compatibility | The paper’s stronger μr splitting condition implies localBrauer by extension of band; the opposite splitting-torsor group is P_i′, not P_i. |

Definition checks:

- **dualHitchin_ellipticIdentity** (computation): For E self-dual by its principal polarization, two copies of E×A1 with φ=id and neutral gerbes form a dual pair with all torsors trivial.
- **dualHitchin_kernelUnit** (non-example): Multiplication by p on an elliptic scheme in characteristic p is not an allowed étale prime-to-characteristic isogeny.
- **dualHitchin_oppositeGroup** (compatibility): If P1 and P2 are dual but nonisomorphic presentations, Split′(M1,α1) carries the P2 action via ψ; an untransported P1 action has the wrong type.
- **dualHitchin_picardKummer** (non-example): For a rational degree-zero line not r-divisible over a field, its root μr-gerbe can have zero Brauer class while remaining nonneutral. The local Brauer condition cannot be rewritten as μr-neutrality without an additional argument.

Construction or proof:

1. Use the imported dual abelian-scheme functor and Poincaré biduality to type the self-duality square. The splitting torsor acts by the opposite Prym, correcting E10.
2. Form the local evaluation condition on the induced Brauer classes, because the imported transgression and fα factor through Gm-gerbes.
3. Record the relationship to the literal μr splitting condition of Definition 6.9(d): the proof of the integral theorem only uses the displayed forward implication for Brauer neutrality. Do not use a point of Split′ to claim a μr-neutralization.

Check:

- Every pair satisfying the literal Definition 6.9, with its μr-neutrality proved, satisfies this sufficient formulation.
- The main comparison theorems below are proved for the sufficient formulation; no converse between Brauer and μr neutrality is asserted.

Direct prerequisites: [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), [TMS.1/principal-splitting](#TMS1-principal-splitting), `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.2, Definition 6.9 and Remark 6.10, pp.568–569; corrected torsor group E10; proof of Theorem 6.17, p.573. The duality data supply the self-dual isogeny and the opposite splitting torsors. The local condition is stated at the Brauer strength actually used by the proof, with the stronger printed condition explicitly retained as a gate..

Routed extraction items: 54.

Open gates at this target: [G-ETII](#g-etii), [G-Kummer](#g-kummer).

<a id="TMS2-compatible-gauge-forms"></a>

### Compatible gauge forms

Target `TMS.2/compatible-gauge-forms` · construction.

Zariski locally on A choose a top form η generating Ω^top_(A/O_F) and a generator θ2 of the invariant relative top forms of P2/A. Set θ1=φ*θ2. Transfer θi to the torsor locus M_i′ and form ωi=π_i*η∧θi there. Extend uniquely across its codimension-at-least-two complement to a nowhere-vanishing top form on the smooth stack M_i. Its absolute-value measure on the generically free coarse locus is the imported orbifold measure. These local forms glue as measures; no global triviality of the canonical bundle on all of A is assumed.

Hypotheses and interfaces:

- The zero-section determinant line of the invariant relative differentials is trivialized on the chosen base neighborhood. A group scheme gives that line by pullback, not a global generator without shrinking.
- φ is étale over this neighborhood, so pullback preserves a generator integrally.
- Smoothness/normality and a codimension-two complement are required for invertible-sheaf Hartogs extension.

Uses that determine the API:

- GWZ20 Lemma 6.16: Fix the normalization θ1=φ*θ2 in the change-of-variables calculation.
- GWZ20 Theorems 6.12 and 6.17: Fubini integrates equal fibre characters against a common base gauge measure.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.gaugeForms_torsorRestriction` | characterisation | On M′ the form is π*η∧θ, under the canonical torsor differential map. |
| `TauCeti.HitchinMirror.gaugeForms_uniqueExtension` | universal-property | A top-form section with this restriction extends uniquely and remains a generator across a codimension-two complement in the smooth stack. |
| `TauCeti.HitchinMirror.gaugeForms_isogeny` | compatibility | On regular fibres θ1,b is exactly φ_b*θ2,b. |
| `TauCeti.HitchinMirror.gaugeForms_unitChange` | relation | Changing either chosen local generator by an integral unit leaves the induced p-adic measure unchanged. |
| `TauCeti.HitchinMirror.gaugeForms_orbifold` | compatibility | On M(O_F)^natural the absolute-value measure agrees with the imported μ_orb. |
| `TauCeti.HitchinMirror.gaugeForms_baseRestriction` | functoriality | Restriction to a smaller base neighborhood agrees with the same construction. |

Definition checks:

- **gaugeForms_product** (computation): For E×A1/O_F with invariant elliptic differential θ, ω=dt∧θ and fibre integration uses |θ|.
- **gaugeForms_unit** (compatibility): Replacing θ by uθ with u∈O_F× multiplies the analytic density by |u|=1.
- **gaugeForms_nonunit** (non-example): Replacing θ by πθ multiplies fibre volume by q⁻¹ and is not a change of integral generator.
- **gaugeForms_blowupBoundary** (non-example): A codimension-one exceptional boundary is not covered by the uniqueness-and-nonvanishing assertion; its canonical discrepancy changes the top form.

Construction or proof:

1. Import the invariant differential identification for a smooth group torsor from G-ETII, including independence of its trivialization.
2. Apply pullback and the determinant exact sequence for the smooth torsor map to construct the nowhere-zero form on M′.
3. Use the smooth-stack Hartogs interface requested of R09.4 to extend the section and its inverse trivialization across codimension two.
4. Use the imported orbifold/gauge comparison on the free locus. Changes of compatible integral generators multiply absolute values by units of norm one, giving the same measure.

Check:

- The exceptional divisor after blowing up a smooth point blocks the extension argument for the old torsor locus.
- For the product elliptic system, η=dt and a fixed invariant elliptic differential give the product measure.

Direct prerequisites: [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair), `LogicAndDefinabilityInNumberTheory:LD.2`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.3, pp.570–571, Lemma 6.13 and Remark 6.14. Compatible invariant top forms descend to torsors and extend across the small boundary to compute the orbifold measure..

Routed extraction items: 58.

Open gates at this target: [G-ETII](#g-etii).

<a id="TMS2-twisted-integral"></a>

### Twisted counts as local integrals

Target `TMS.2/twisted-integral` · theorem · planet **Twisted stringy integral**.

For an admissible smooth finite abelian quotient M/O_F of pure relative dimension m and an admissible μr-gerbe α, #^α_st(M_k)/q^m=∫_(M(O_F)^natural) conjugate(fα)dμ_orb, where fα(x)=exp(2πi inv(x*β)) for the induced Brauer gerbe β and the fixed normalized embeddings. Here M(O_F)^natural means coarse integral points whose generic point is in the free locus.

Hypotheses and interfaces:

- Use the precise root, tame and admissible-gerbe assumptions exported by G-ETII.
- The Hasse/transgression identification must include inherited source gates E15 and E16; no use of the published comparison bypasses those gates.

Construction or proof:

1. Apply the imported specialization-sector measure formula q^(−w)/|Aut| and the Hasse/transgression theorem to integrate each constant transgression phase.
2. Reindex γ by γ⁻¹. The age identity w(γ)=m−F(γ⁻¹) and dualization of the inertia local system produce complex conjugation of fα.
3. Sum all rational sector classes. The normalization is q^m, not the base dimension or a coarse unweighted count.

Check:

- For a smooth scheme with trivial gerbe, recover Weil’s volume formula #M(k)/q^m.
- For a primitive cube-root phase, omitting the conjugation gives its inverse and fails the fixed convention.

Direct prerequisites: [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants), `LogicAndDefinabilityInNumberTheory:LD.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §5.6, Corollary 5.29, p.564. The stringy count equals the conjugate gerbe-character integral after dimension normalization and inertia inversion..

Routed extraction items: 48.

Open gates at this target: [G-ETII](#g-etii).

<a id="TMS2-equal-fibre-volumes"></a>

### Equal volumes of dual regular fibres

Target `TMS.2/equal-fibre-volumes` · theorem · planet **Key volume lemma**.

For a dual pair and b∈A(O_F)∩A♦(F), if both regular fibres have F-points, then ∫_(M1,b(F))|θ1,b|=∫_(M2,b(F))|θ2,b|. The forms are exactly those of compatible-gauge-forms.

Hypotheses and interfaces:

- The fibres P_i,b are dual abelian varieties and the isogeny is self-dual of prime-to-residue-characteristic degree.
- The local index input is needed for F=k((t)) as well as characteristic-zero local fields. The existing R02.4 node only states characteristic zero; G-local records this extension.

Construction or proof:

1. Trivialize each torsor at an F-point; invariant forms make the integral independent of that point.
2. Change variables under φ: the integral on P1 is |ker φ(F)| times the integral on φ(P1(F)) with θ2. Translation invariance multiplies the latter by |P2(F)/φP1(F)| to give the full P2 volume.
3. Apply the self-dual isogeny index theorem, after its prime-to-characteristic equal-characteristic extension G-local, to identify these two finite factors.

Check:

- For φ=id on a self-dual elliptic product, both finite factors are 1.
- For φ=[n] on a principally polarized elliptic curve at n prime to p, the finite kernel and cokernel have the same order even when not every geometric n-torsion point is F-rational.

Direct prerequisites: [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), `ArithmeticGaloisDuality:R02.4/isogeny-dual-exact-sequence`, `LogicAndDefinabilityInNumberTheory:LD.2`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.3, Lemma 6.16, p.572. The key lemma converts the self-dual local index formula into equality of compatible fibre volumes..

Routed extraction items: 59.

Open gates at this target: [G-local](#g-local).

<a id="TMS2-local-mirror-integral"></a>

### Fibrewise gerbe-character integrals

Target `TMS.2/local-mirror-integral` · theorem.

For every b∈A(O_F)∩A♦(F) in a dual pair, ∫_(M1,b(F)) fα1|θ1,b|=∫_(M2,b(F)) fα2|θ2,b|, with the empty-domain integral equal to zero.

Hypotheses and interfaces:

- Use the sufficient local Brauer condition in dual-hitchin-pair and the imported Tate-character formula for arithmetic gerbes.
- Retain G-ETII and G-local, including the corrected μr-gerbe version of the Ext input.

Construction or proof:

1. If both point sets are empty, both integrals vanish.
2. If exactly one is nonempty, identify that torsor with its abelian group. By the imported Lemma 6.7 its phase is a constant root of unity times the Tate character of the nonzero opposite torsor class. Local Tate nondegeneracy makes the character nontrivial, and Haar translation gives integral zero.
3. If both are nonempty, the sufficient local condition makes both underlying Brauer gerbes neutral. Their evaluation functions are 1 by the imported factorization, and equal-fibre-volumes applies.
4. The symmetric one-empty case is identical with the roles exchanged. Conjugating the equality supplies the convention used in twisted-integral.

Check:

- A nontrivial character has integral zero even after multiplication by a constant root of unity.
- The both-nonempty case requires Brauer triviality, not just constancy with an unknown phase.

Direct prerequisites: [TMS.2/equal-fibre-volumes](#TMS2-equal-fibre-volumes), [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair), `ArithmeticGaloisDuality:R02.4/abelian-variety-local-duality`, `LogicAndDefinabilityInNumberTheory:LD.2`, `mathlib:sum_hom_units_eq_zero`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.3, Theorem 6.17, pp.573–574. The four cases reduce mirror integration either to Tate-character cancellation or to the key volume lemma..

Routed extraction items: 60.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local).

<a id="TMS2-arithmetic-mirror"></a>

### Fibrewise arithmetic mirror symmetry

Target `TMS.2/arithmetic-mirror` · theorem · planet **Arithmetic mirror symmetry**.

For a dual pair over finite k=Fq, the twisted stringy counts agree. More precisely, for every a∈A(k) and every finite extension k_m/k, the alternating geometric-Frobenius trace of the inertia-fibre compact cohomology with coefficients Nα1⊗Qbarℓ(−F1) equals that for Nα2⊗Qbarℓ(−F2), over a after base change to k_m. The rational age twist is made on each connected sector with a compatible finite denominator; it is not a fractional cohomological shift.

Hypotheses and interfaces:

- The proper coarse maps and finite inertia justify the required proper/compact fibre trace comparison from G-ETII.
- Both total dimensions agree. The finite extension inherits or enlarges the chosen roots consistently.

Construction or proof:

1. Base change the finite-field pair to O_F=k[[t]], so equal-characteristic local duality is genuinely necessary. Fix a residue base point a.
2. The stack trace formula and twisted-integral identify the normalized inertia-fibre trace with the integral over the reduction tube above a, with the required conjugate phase.
3. Use compatible-gauge-forms and Fubini. Remove the complement of A♦(F), which is a null set for the smooth base measure, then apply local-mirror-integral on every remaining fibre.
4. The common q^dim M normalization gives equality of the unnormalized traces. Repeat over every finite extension and sum over a for the global stringy count.

Check:

- The conclusion is an equality of alternating traces for all Frobenius powers. It does not itself separate individual cohomological degrees or detect extension classes.
- For the neutral elliptic product it reduces to the same ordinary count on both sides above each a.

Direct prerequisites: [TMS.2/twisted-integral](#TMS2-twisted-integral), [TMS.2/local-mirror-integral](#TMS2-local-mirror-integral), [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), `EtaleDualityAndPerverseSheaves:EDC.0`, `LogicAndDefinabilityInNumberTheory:LD.2`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.2, Theorem 6.12, pp.569–570; proof pp.574–575. The arithmetic theorem is fibrewise and follows by integration over residue tubes, with stack trace and Fubini..

Routed extraction items: 56.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local).

<a id="TMS2-abstract-mirror"></a>

### Complex mirror symmetry for abstract systems

Target `TMS.2/abstract-mirror` · theorem · planet **Abstract mirror symmetry**.

For a dual pair over a finite-type subalgebra R⊂C, E_st((M1)_C,α1)=E_st((M2)_C,α2), in the rational-bidegree realization with the fixed character conventions.

Hypotheses and interfaces:

- Spread all duality data, finite denominators, admissible roots and the sufficient local condition over a common model; perform only the allowed base changes preserving the system data.
- The proof uses the explicit supplier gates of stringy-comparison and arithmetic-mirror.

Construction or proof:

1. Apply arithmetic-mirror after each good finite-field specialization of the common model, including every finite extension.
2. Apply stringy-comparison to that equality of twisted counts.
3. The complex fibres are preserved by the chosen embeddings and the finite étale cover; translate the character conventions on inertia to the original complex sector sum.

Check:

- The theorem applies to the sufficient local Brauer formulation, hence in particular to every literal dual pair of Definition 6.9.
- No claim is made that this implication supplies the missing generic integration or Hodge realization interfaces.

Direct prerequisites: [TMS.0/stringy-comparison](#TMS0-stringy-comparison), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror).

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.2, Theorem 6.11, p.569; reduction p.570. The complex theorem follows from the arithmetic theorem through the stringy Katz comparison..

Routed extraction items: 55.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local), [G-MHS](#g-mhs), [G-Groth](#g-groth), [G-HT](#g-ht).

Layer acceptance requires all targets above and the following remaining obligations:

- G-ETII: Generic integration supplier and two proof repairs.
- G-Groth: Equivariant blow-up presentation.
- G-HT: Equivariant and fractional Hodge–Tate realization.
- G-Kummer: Literal μn-neutrality stronger than the supplied Brauer proof.
- G-MHS: Geometric mixed Hodge structures and local systems.
- G-local: Equal-characteristic local Tate duality.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

<a id="TMS3"></a>

## TMS.3 — Stable Higgs moduli and spectral torsors

Extend the imported Higgs and spectral carriers to the stated families and construct stable trace-free fixed-determinant SLn spaces and their PGLn quotients. Prove smoothness and properness with their base and characteristic hypotheses; establish determinant twisting, the corrected norm fibre, the PGL Prym and its duality, the regular torsor locus and the corrected torsor calculus. Check low genus separately before using the abstract-system certificate.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

<a id="TMS3-stable-fixed-determinant"></a>

### Stable trace-free fixed-determinant moduli

Target `TMS.3/stable-fixed-determinant` · construction · planet **Stable SLn Higgs moduli**.

For a smooth proper geometrically connected genus-g curve X/S over a noetherian base, a line bundle D, n≥1 invertible on S and L of degree d with gcd(n,d)=1, form the stable locus in the imported D-Higgs stack, impose Trθ=0 and an isomorphism det E≃L, and μn-rigidify its scalar stabilizers. Denote the resulting finite-type separated coarse algebraic space by M_SL^L; in the source’s projective-curve setting prove that it is a quasiprojective scheme. Stability means every proper nonzero θ-invariant saturated subbundle has smaller slope. The trace-free characteristic-coefficient map lands in A=⊕_(i=2)^n f_*D^i when these sheaves satisfy the stated locally-free/base-change interface.

Hypotheses and interfaces:

- The basic Higgs stack, characteristic polynomial and spectral carrier are imports from ET.2b, not new definitions here. Its existing node is over finite fields; the relative noetherian-family adapter is requested explicitly.
- For D=ω import the general stable GLn carrier and its stability from CB.7; extend those notions to this D-twist and fixed determinant, retaining their meaning.
- Fixed determinant with its isomorphism has μn scalar stabilizers; the unfixed-determinant stable stack has Gm stabilizers. Do not rigidify the former by Gm.
- Use projective curves or a verified relative polarization where the moduli construction needs one.

Uses that determine the API:

- GWZ20 Lemma 7.3 and Theorem 7.6: Identify the stable smooth space and the proper Hitchin map.
- GWZ20 §§7.2 and 7.4: Identify regular fibres by spectral line bundles and construct the universal-family obstruction gerbe.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.stableSL_toHiggs` | projection | The stable SL stack maps to the imported Higgs stack by forgetting the determinant isomorphism, and carries trace zero. |
| `TauCeti.HitchinMirror.stableSL_rigidification` | projection | The map from the stable fixed-determinant stack to M_SL^L is a μn-gerbe with the imported universal property of rigidification. |
| `TauCeti.HitchinMirror.stableSL_baseChange` | functoriality | The construction agrees with base change in the verified moduli/coarse-base-change setting, including the chosen field extensions and spread models. |
| `TauCeti.HitchinMirror.stableSL_hitchin` | data | The Hitchin map records characteristic coefficients a2,…,an, under the H⁰(D^i) base-change comparisons. |
| `TauCeti.HitchinMirror.stableSL_rankOne` | simp | For n=1 the fixed line and trace-zero condition leave a point over each base, with trivial automorphisms. |
| `TauCeti.HitchinMirror.stableSL_canonicalImport` | compatibility | When D=ω, the underlying stable object and its slope condition agree with CB.7/canonical-higgs and the forgetful map lands in CB.7/higgs-moduli. |

Definition checks:

- **stableSL_rankOne** (degenerate): For n=1, A is the zero vector space and M_SL^L is Spec k; θ must be zero.
- **stableSL_scalarStabilizer** (computation): For stable rank 2 in characteristic different from 2, scalars preserving det E≃L satisfy λ²=1; Gm would give the wrong stabilizer.
- **stableSL_semistableBoundary** (non-example): For a rank-2 degree-0 Higgs bundle (O⊕O,0), the summand O is invariant of equal slope, so the object is not stable.
- **stableSL_baseCurve** (compatibility): The existing InvertibleSheaf D and finite locally free E live on X_S, and θ:E→E⊗D is O_X-linear; placing E on S does not type this datum.

Construction or proof:

1. Extend the imported carrier by descent to the specified family bases, using current upstream AlgebraicVectorBundles for finite locally free sheaves, tensor products and determinants.
2. Use the existing slope/stability interface, with D replacing ω, and the imported bounded Quot/parameter-space machinery. The required stable-Higgs GIT/adequate-quotient interface is G-moduli; R09.1–2 alone do not assert this quotient.
3. Form the fixed-determinant and trace-zero fibre, then apply the existing rigidification and its base-change theorem. Establish finite type and separatedness; prove quasiprojectivity in the selected projective family setting.
4. Use characteristic coefficients rather than power traces, so no division by 2,…,n is hidden. Record the actual H⁰(D^i) base-change identification.

Check:

- Over an algebraically closed field a stable fixed-determinant object has exactly μn automorphisms before rigidification and none afterwards.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/hitchin-moduli-stack`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/canonical-higgs`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.1, Definition 7.1 and Remark 7.2, pp.575–576; corrected curve/base and stabilizer conventions. The source specializes Higgs moduli to trace-free fixed determinant; the plan imports the existing general carrier and isolates this relative stable construction..

Routed extraction items: 62.

Open gates at this target: [G-moduli](#g-moduli).

<a id="TMS3-smooth-stable-moduli"></a>

### Smoothness of stable fixed-determinant moduli

Target `TMS.3/smooth-stable-moduli` · theorem · planet **Smooth stable Higgs spaces**.

Under the preceding moduli hypotheses, suppose D⊗ω_X/S⁻¹ has positive degree on every geometric fibre or is trivial. Then M_SL^L is smooth over S. At a geometric point its deformation complex is End0(E)→End0(E)⊗D, δ(u)=θu−(u⊗1)θ, in degrees 0 and 1; H⁰ gives infinitesimal automorphisms, H¹ the tangent space and H² the obstruction. Stability and n invertible kill H⁰, and Serre duality and the D condition kill H². Its relative dimension on nonempty fibres is (n²−1)deg D.

Hypotheses and interfaces:

- The degree and base-change hypotheses are fibrewise and the moduli deformation interface is G-moduli.
- For D=ω the degree formula is 2(n²−1)(g−1); a negative value signals emptiness, not a negative-dimensional smooth scheme.
- When the residue characteristic divides n, scalar endomorphisms may have trace zero, so this argument is not applicable.

Construction or proof:

1. Use the imported deformation theory of Higgs pairs and the trace/determinant differential to obtain the End0 complex, with an explicit cohomological indexing convention.
2. A stable Higgs endomorphism is scalar. Since n is a unit its trace-zero part vanishes.
3. Serre duality identifies H² with trace-free Higgs maps E→E⊗ωD⁻¹. Negative degree gives vanishing by stability; for D=ω it reduces to the same trace-free endomorphism vanishing.
4. Apply the infinitesimal lifting criterion to the actual moduli stack and rigidification; use Riemann–Roch for the stated dimension and verify relative smoothness by the chosen finite-presentation criterion.

Check:

- For n=1 the complex is zero and the dimension is zero.
- In characteristic p dividing n, id_E∈End0(E) demonstrates why the n-unit hypothesis cannot be removed.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.1, Lemma 7.3 and proof, pp.576–577. The obstruction calculation proves smoothness; the plan pins the degree-0/1 complex to avoid shifted-index ambiguity..

Routed extraction items: 62.

Open gates at this target: [G-moduli](#g-moduli).

<a id="TMS3-pgl-quotient"></a>

### PGLn moduli as a finite quotient

Target `TMS.3/pgl-quotient` · construction · planet **PGLn quotient stack**.

Let Γ=J_X[n], finite étale of rank n^(2g) when n is invertible. Tensoring E by an n-torsion line defines its action on M_SL^L. Define the stable PGLn stack of degree class d mod n by M_PGL^d=[M_SL^L/Γ], and identify it with the intended geometric stable PGL moduli by étale-local lifts and descent. The quotient is independent of L after the corresponding determinant twists; its coarse quotient and the stack are kept distinct.

Hypotheses and interfaces:

- After a finite étale base change Γ may be made constant; arithmetic formulas explicitly use this choice.
- All n-torsion actions and quotients are sheaf/stack actions, including the determinant trivialization coherence before rigidification.
- This construction does not assert generic freeness until regular-hitchin-certificate verifies it.

Uses that determine the API:

- GWZ20 Proposition 7.12: Check admissibility and the regular PGL torsor locus.
- GWZ20 §7.4 and Theorem 7.21: Descend the Hausel–Thaddeus gerbe and compute its twisted stringy invariant.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.pglQuotient_atlas` | projection | The map M_SL^L→[M_SL^L/Γ] is the quotient atlas with its Γ-descent datum. |
| `TauCeti.HitchinMirror.pglQuotient_coarse` | projection | There is a coarse quotient morphism, distinct from the quotient atlas and the stack. |
| `TauCeti.HitchinMirror.pglQuotient_determinantClass` | equivalence | Changing the determinant by an nth power gives the same PGL degree component via tensoring. |
| `TauCeti.HitchinMirror.pglQuotient_baseChange` | functoriality | Pullback of Γ and its action commutes with the quotient-stack construction. |
| `TauCeti.HitchinMirror.pglQuotient_hitchin` | compatibility | The Γ-invariant SL Hitchin map descends to the PGL stack and its coarse space. |
| `TauCeti.HitchinMirror.pglQuotient_stabilizer` | characterisation | At a geometric point represented by E, inertia is {N∈J_X[n]:E⊗N≃E as Higgs bundles}. |

Definition checks:

- **pglQuotient_rankOne** (degenerate): For n=1, Γ is trivial and both SL1 and PGL1 spaces are a point.
- **pglQuotient_freeLocus** (compatibility): Where Γ acts freely, the quotient stack is the smooth algebraic-space quotient and has trivial inertia.
- **pglQuotient_ellipticFixedPoint** (non-example): If a geometric stable fixed-determinant space is a single point and Γ is nontrivial, the quotient is BΓ, not a point. This boundary is excluded from the generically free integration certificate until separately treated.
- **pglQuotient_genusTwoRankTwo** (computation): For n=2 and g=2 in odd characteristic, Γ has 2^4=16 geometric points; replacing it by μ2 gives the wrong quotient.

Construction or proof:

1. Use tensor functoriality of the existing Higgs carrier and det(E⊗N)=det(E)N^n to define Γ action on the rigidified space.
2. Use quotient-stack descent from R09.4. A local lift of a PGL bundle differs from another by tensoring a line bundle; normalize determinants using the n-power map and descend.
3. Construct the coarse quotient separately with the imported finite quotient interface. The residual fixed-point stabilizers remain in the PGL stack.

Check:

- The Γ action preserves the Hitchin map because tensoring a line preserves the characteristic polynomial.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.1, Definition 7.4 and Remark 7.5, p.577. The stable PGL stack is a quotient by Jacobian n-torsion; the quotient stack retains fixed-point inertia..

Routed extraction items: 63.

<a id="TMS3-proper-hitchin"></a>

### Properness of the stable Hitchin morphism

Target `TMS.3/proper-hitchin` · theorem.

For gcd(n,d)=1 in the smooth projective curve and D setting above, the stable GLn and fixed-determinant trace-free SLn Hitchin morphisms are proper; so is the PGL coarse Hitchin map. Properness is not asserted of the nonproper total Higgs space over the ground field.

Hypotheses and interfaces:

- Use the actual noetherian relative moduli construction, not just properness on the anisotropic locus.
- The source cites Nitsure for D-twisted semistable Higgs properness and Faltings for the relative setting; their proof interfaces remain G-moduli.
- In the canonical GLn case the precise existing CB.7/higgs-moduli statement is imported rather than planned again.

Construction or proof:

1. Import the semistable Hitchin properness theorem for the selected family bases through G-moduli. Coprimality identifies stable and semistable rank-degree classes.
2. The determinant and trace conditions form the closed relative fibre needed for properness of SL.
3. Apply finite quotient/coarse descent for the PGL map. Verify the valuative criterion after the necessary finite extension and descent, without inferring that the stable locus of an arbitrary proper map is proper.

Check:

- For n=1 the SL map is point→point, and GL1 is Pic^d(X)×H⁰(D)→H⁰(D), proper because Pic^d is proper.
- This does not turn the entire unbounded Higgs stack of ET.2b into a proper finite-type object.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.1, Theorem 7.6, p.577. The source asserts properness of the Hitchin maps via the semistable moduli theorem; the required proof-level input is explicitly requested..

Routed extraction items: 64.

Open gates at this target: [G-moduli](#g-moduli).

<a id="TMS3-determinant-twisting"></a>

### Determinant change and Γ-twists

Target `TMS.3/determinant-twisting` · theorem.

For N a line bundle, tensoring gives M_SL^L≃M_SL^(L N^n) over the Hitchin base. If L1,L2 have the same degree, the n-root sheaf T of L2 L1⁻¹ on the base is a Γ-torsor; contracting M_SL^L1 with T gives M_SL^L2, with the tensor action and descent conventions fixed. Over finite k use the Kummer identification J_X(k)/nJ_X(k)≃H¹(k,Γ), which needs Lang’s vanishing H¹(k,J_X)=0.

Hypotheses and interfaces:

- For a family the root object is an étale sheaf torsor, not an asserted global line bundle.
- For the arithmetic ν-labeling used in §7.5, set ν=δ(L1 L2⁻¹) as in the source, so its geometric Frobenius acts as ν⁻¹Fr. This is the inverse of the positive-root cocycle if that cocycle was used for T.

Construction or proof:

1. Tensor the Higgs bundle and its determinant isomorphism; the inverse is tensoring by N⁻¹.
2. Choose local nth roots of L2 L1⁻¹ in the relative Jacobian and compute their Γ transition cocycle. The same cocycle glues the tensor maps.
3. Over finite fields import the Kummer exact sequence and Lang vanishing. Record explicitly the inverse relabeling between the root torsor and the source’s arithmetic twist ν.

Check:

- If L2=L1N^n with N rational, the twist class is zero.
- Tensoring by a line changes degree by n deg N, so determinant degree modulo n is preserved.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.1, Lemma 7.7, pp.578–579; §7.5, pp.590–591. The tensor equivalence and n-root descent identify determinant changes with twists; the Frobenius labeling is pinned for Fourier inversion..

Routed extraction items: 65.

<a id="TMS3-spectral-norm-fibre"></a>

### Stable spectral fibres as norm preimages

Target `TMS.3/spectral-norm-fibre` · theorem · planet **Spectral norm fibre**.

On the regular locus with smooth connected spectral cover π:Y_a→X of degree n, set M=det(π_*O_Y). The spectral correspondence identifies the SL Hitchin fibre with P_a^L=Nm_π⁻¹(L M⁻¹), a torsor under P_a^0=ker(Nm:J_Y→J_X) when that kernel is connected. The norm is Nm(B)=det(π_*B)M⁻¹. The PGL fibre is the corresponding quotient by Γ. The determinant correction is L M⁻¹, never L M.

Hypotheses and interfaces:

- Use the imported spectral correspondence with a verified relative-base-change version, and the stable regular spectral locus.
- Smoothness of Y alone is not assumed to imply connectedness, stability or nonemptiness; these are established in regular-hitchin-certificate or remain G-lowgenus.
- For the monic spectral algebra, π_*O_Y=⊕_(j=0)^(n−1) D^(−j), so M=D^(−n(n−1)/2), independent of the Hitchin parameter.

Construction or proof:

1. Use the ET.2b spectral module equivalence and its relative extension requested in G-moduli. A spectral line B pushes forward to E with det E=Nm(B)M.
2. Solve det E=L to obtain the displayed inverse-M norm target; retain the determinant-isomorphism and rigidification comparisons between the spectral Picard stack and its fibre space.
3. Use the relative norm map on Jacobians from the A2 request, and identify its kernel action with the imported Picard action. Quotient by Γ for PGL.

Check:

- For n=1, M=O and Nm=id, so the fixed-L fibre is a point.
- For n=2, M=D⁻¹ and the norm target is L D; the opposite sign would give L D⁻¹.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/cameral-cover`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/picard-stack-action`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.2, Lemma 7.8, pp.579–580; corrected sign E12. The determinant definition of norm determines the corrected spectral fibre and the common determinant line M..

Routed extraction items: 66.

Open gates at this target: [G-moduli](#g-moduli), [G-lowgenus](#g-lowgenus).

<a id="TMS3-pgl-prym"></a>

### The PGLn Prym group

Target `TMS.3/pgl-prym` · construction · planet **PGLn Prym**.

For the spectral family and its norm-kernel group P_SL acting on the stable SL fibration, define P_PGL=P_SL/Γ using the pullback inclusion π*:J_X[n]→P_SL. On the smooth connected regular locus this identifies with J_Y/π*J_X. The map φ:P_SL→P_PGL has kernel Γ and is a finite étale isogeny when n is a unit and the pullback inclusion has been verified.

Hypotheses and interfaces:

- The global norm-Picard family over A, including singular spectral fibres, is an imported relative Picard-action interface; its extension is explicitly requested from ET.2b and A2.
- Check π* injectivity and connected norm kernel on the regular locus. For deg D>0, the negative-degree spectral summands give the required pullback injectivity; low-degree exceptions remain G-lowgenus.
- No general construction of abelian quotients or duals is duplicated: A3 supplies those on A♦.

Uses that determine the API:

- GWZ20 Proposition 7.10: Identify the dual of the SL Prym and the self-duality of the quotient isogeny.
- GWZ20 Proposition 7.20: Supply the globally étale isogeny in the dual pair.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.pglPrym_quotientMap` | projection | There is a quotient homomorphism P_SL→P_PGL with kernel π*J_X[n]. |
| `TauCeti.HitchinMirror.pglPrym_regularQuotient` | equivalence | Over A♦, P_PGL≃J_Y/π*J_X, equivariantly with the natural maps. |
| `TauCeti.HitchinMirror.pglPrym_baseChange` | functoriality | The quotient and its action agree with all verified base changes of the spectral family. |
| `TauCeti.HitchinMirror.pglPrym_hitchinAction` | structure | P_PGL acts on the PGL fibration, with identity and composition laws induced from the Picard action. |
| `TauCeti.HitchinMirror.pglPrym_isogeny` | compatibility | Over A♦ this is the A3 finite étale abelian-scheme quotient isogeny, not a quotient of groups of rational points. |
| `TauCeti.HitchinMirror.pglPrym_degree` | data | The kernel Γ has geometric rank n^(2g) where the pullback inclusion is faithful. |

Definition checks:

- **pglPrym_rankOne** (degenerate): For n=1 the SL norm kernel and PGL quotient are trivial.
- **pglPrym_rankTwoGenusTwo** (computation): For n=2,g=2 in odd characteristic and the connected regular spectral locus, the quotient kernel has order 16.
- **pglPrym_notPointwiseQuotient** (non-example): In general P_PGL(F) need not equal P_SL(F)/Γ(F); the connecting H¹(F,Γ) term cannot be dropped.
- **pglPrym_normPullback** (compatibility): Nm∘π*=[n] on J_X, with the imported Jacobian and its existing multiplication map.

Construction or proof:

1. Use the norm identity Nm(π*N)=N^n to map Γ into the SL norm kernel; prove injectivity under the selected spectral hypotheses.
2. Form the fppf quotient, importing finite quotient representability and A3 on regular abelian fibres.
3. The n-power map on J_X is fppf-surjective; use it to identify the quotient of the norm kernel by Γ with J_Y/π*J_X on A♦. Extend the specified group/action globally by the imported Picard-family construction, with its exact smoothness and étaleness obligations.

Check:

- On A♦ the relative dimensions of the two Pryms agree.

Direct prerequisites: [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/picard-stack-action`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.2, Definition 7.9, p.580; Proposition 7.10, pp.580–582. The quotient Prym group mediates the étale self-dual isogeny and acts on the PGL fibres..

Routed extraction items: 67.

Open gates at this target: [G-moduli](#g-moduli), [G-lowgenus](#g-lowgenus).

<a id="TMS3-prym-duality"></a>

### Duality of SLn and PGLn Pryms

Target `TMS.3/prym-duality` · theorem.

On A♦, the principal polarizations of the spectral and base Jacobians identify P_PGL with (P_SL)∨. Under this identification, φ:P_SL→P_PGL is self-dual. The comparison identifies the actual evaluation/Poincaré pairings and the kernel Weil pairing, not merely the dimensions of two abelian schemes.

Hypotheses and interfaces:

- The spectral norm is dual to pullback under the Jacobian principal polarizations, as requested precisely from A2.
- The regular connectedness and pullback-injectivity hypotheses of spectral-norm-fibre are retained.

Construction or proof:

1. Import normalized Poincaré biduality and duality of norm versus pullback from A2. Dualize the exact norm-kernel sequence.
2. The dual quotient J_Y/π*J_X identifies with P_SL∨; compare it with pgl-prym.
3. Track the induced maps from the principal polarization of J_Y to verify the self-duality square, using A3 dual isogenies and Cartier-dual kernels.

Check:

- The kernel pairing is the transported Jacobian n-torsion pairing; a dimension-only isomorphism would not suffice.

Direct prerequisites: [TMS.3/pgl-prym](#TMS3-pgl-prym), `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.2, Proposition 7.10 and proof, pp.580–582. The norm/pullback duality of Jacobians identifies the two Pryms and gives the self-dual isogeny needed in the volume lemma..

Routed extraction items: 67.

Open gates at this target: [G-lowgenus](#g-lowgenus).

<a id="TMS3-regular-hitchin-certificate"></a>

### Regular locus and abstract-system certificates

Target `TMS.3/regular-hitchin-certificate` · theorem.

Construct the specified regular open and torsor loci for the stable SLn and PGLn fibrations, prove smoothness of the relevant Picard group families, properness of the coarse maps, generic freeness/admissibility of the quotient, and codim(M∖M′)≥2, and thereby certify Definition 6.8. On the geometric range where smooth spectral curves are connected and the stable regular locus is nonempty, the source’s smooth-spectral locus supplies A♦. The theorem’s full genus range requires a separate verification; it is not silently reduced to g≥2.

Hypotheses and interfaces:

- Use the actual stable moduli and characteristic/root hypotheses established in this layer.
- The finite-field ET.2b anisotropic properness and δ-codimension theorem do not automatically give this noetherian-family stable certificate.
- For g=1,D=ω=O,n>1 a generic trace-free characteristic polynomial has distinct constant roots. Its global projectors split any Higgs bundle into eigenbundles; one has slope at least the total slope. Hence the stable generic fibre is empty. Smooth spectral therefore cannot be treated as automatically connected with nonempty stable fibres.

Construction or proof:

1. Use the relative spectral and Picard action interfaces to identify the regular group torsors; compare the selected opens with the source’s regular locus.
2. Prove the complement codimension and the quotient generic-freeness statement in the actual stable spaces, importing the needed Ngô regular-centralizer input through ET.2b rather than replanning it.
3. For deg D>0, verify spectral pullback injectivity by the decomposition π_*O_Y and the vanishing of sections of negative-degree line bundles. Check connectedness and dense regular fibres in the precise range used.
4. Retain G-lowgenus for the remaining low-degree/genus cases and for a primary-proof-level verification of the codimension certificate. Direct low-genus mirror calculations can replace the abstract certificate, but are not claimed here.

Check:

- The certificate includes the exact codimension-two bound needed to extend gauge forms.
- Test the elliptic canonical-twist generic polynomial before asserting nonempty smooth connected stable spectral fibres.

Direct prerequisites: [TMS.3/smooth-stable-moduli](#TMS3-smooth-stable-moduli), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.2, Propositions 7.11–7.12, p.582. The propositions assert the torsor and abstract-system properties; the full hypothesis audit and low-genus range remain explicit proof gates..

Routed extraction items: 68.

Open gates at this target: [G-lowgenus](#g-lowgenus), [G-moduli](#g-moduli).

<a id="TMS3-spectral-torsor-calculus"></a>

### Spectral torsor products, powers and periods

Target `TMS.3/spectral-torsor-calculus` · theorem.

With P_a^L=Nm⁻¹(L M⁻¹), contracted product gives P^L·P^L′≃P^(L L′ M⁻¹), and for every integer e, (P^L)^e≃P^(L^e M^(1−e)). Tensoring by π*Q gives P^L≃P^(L Q^n). The class of an SL spectral torsor is n-torsion, since the nth power norm target is realized by π*(L M⁻¹). For GL spectral Picard torsors, their period divides n when Pic¹(X)(F) contains an actual degree-one line bundle; its pullback has degree n.

Hypotheses and interfaces:

- All equalities are equivariant isomorphisms of torsors under the same regular Prym or Jacobian, not equalities of chosen points.
- For GL period arguments the degree-one line bundle is established over finite residue fields by Picard/Lang/Brauer inputs and lifted in the smooth Picard family before passing to F.
- Use integer powers in the commutative torsor group, including inverse torsors; the e=0 result is P^M, the norm-identity torsor.

Construction or proof:

1. Multiply norm targets using the norm homomorphism and solve again for the determinant label. This gives the inverse-M correction in the product formula.
2. Induct for nonnegative powers, use inverse torsors for negative powers, and compare pullback line bundles via Nm(π*Q)=Q^n.
3. Exhibit π*(L M⁻¹) in the nth contracted power to prove the SL period bound. For GL, exhibit the degree-n pullback line and use the degree torsor law.
4. Record M=D^(−n(n−1)/2) as a single line on X independent of a; the correction N is therefore uniform over all regular spectral parameters.

Check:

- At e=1 the determinant label is L; at e=0 it is M and the norm target is O.
- For n=2, (P^L)^2=P^(L²D), not P^(L²D⁻¹).
- A class t killed by n is zero iff et is zero whenever gcd(e,n)=1, by Bézout; coprimality with d alone would be irrelevant.

Direct prerequisites: [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.3, Lemmas 7.13–7.14, pp.582–583; correction E12. The corrected norm target determines the product, power, tensor-shift and n-torsion identities..

Routed extraction items: 69.

Open gates at this target: [G-lowgenus](#g-lowgenus).

Layer acceptance requires all targets above and the following remaining obligations:

- G-lowgenus: Full genus range of the published main theorem.
- G-moduli: Relative Higgs geometry and abstract-system certificate.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

<a id="TMS4"></a>

## TMS.4 — Degree independence and dual gerbes

Prove GLn and SLn coprime-degree count comparisons with corrected determinant signs, then Betti/Hodge degree independence using an explicit purity input. Construct the Hausel–Thaddeus gerbes, prove their arithmetic splitting-torsor duality and local Brauer triviality, and assemble the SLn/PGLn dual pair. The algebraic family version of the complex gerbe proof is a recorded gate.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9`, `EtaleDualityAndPerverseSheaves:EDC.0`, `LogicAndDefinabilityInNumberTheory:LD.2`, [TMS.1](#TMS1), [TMS.2](#TMS2), [TMS.3](#TMS3), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

<a id="TMS4-gl-degree-independence"></a>

### GLn coprime-degree point counts

Target `TMS.4/gl-degree-independence` · theorem · planet **GLn degree independence**.

Let X/Fq be smooth projective geometrically connected, Dω⁻¹ of positive even degree or trivial, n,d>0 coprime, p∤nd, μ_(n^(2g))⊂Fq, and e coprime to n and p. Then #M_GL^d(Fq)=#M_GL^e(Fq). This is the D-twisted comparison by local integration; the canonical GL carrier and the separate all-degree counting theorem of CB are imports.

Hypotheses and interfaces:

- All stable moduli and properness hypotheses from TMS.3 are retained.
- The generic spectral Picard torsor period bound uses an actual degree-one line bundle on X, available over finite fields and liftable over the chosen smooth Picard model.
- The source’s proof writes an irrelevant coprimality with d; the torsor-class argument uses gcd(d,n)=gcd(e,n)=1.

Construction or proof:

1. Lift the curve and finite list of line bundles to a complete unramified characteristic-zero discrete valuation ring with residue field Fq. Smoothness of the curve and H²=0 give the curve/Picard lifting interface requested in G-moduli.
2. On the regular spectral base the degree-d fibre is the dth power of the degree-one Jacobian torsor, whose class is killed by n. Bézout makes its triviality independent of d in the unit classes modulo n.
3. Choose common invariant relative forms and a base form, remove the measure-zero singular base, and integrate fibre volumes. Nonempty Jacobian torsors have the same translation-invariant volume; empty ones contribute zero.
4. Use Weil’s smooth-model formula and equal dimensions to return to point counts. G-lowgenus retains the omitted boundary cases of the regular-certificate argument.

Check:

- For n=1 the space is Pic^d(X)×H⁰(D); Pic^d is a Jacobian torsor with a finite-field point and all degrees have the same count.
- The period argument must use e prime to n, not e prime to d.

Direct prerequisites: [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), `LogicAndDefinabilityInNumberTheory:LD.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.3, Theorem 7.15 and proof, pp.583–584. The integration proof compares triviality of prime-to-n torsor powers, then applies Weil’s formula..

Routed extraction items: 70.

Open gates at this target: [G-moduli](#g-moduli), [G-lowgenus](#g-lowgenus).

<a id="TMS4-sl-degree-independence"></a>

### SLn coprime-degree point counts

Target `TMS.4/sl-degree-independence` · theorem · planet **SLn degree independence**.

Under the source’s assumptions p>n, gcd(n,d)=1, μ_(n^(2g))⊂Fq and Dω⁻¹ of positive even degree or trivial, there is a line bundle N of degree zero such that, for every integer e prime to n, #M_SL^L(Fq)=#M_SL^(L^e N^(e−1))(Fq). Set M=D^(−n(n−1)/2). Choose Q with n deg Q=deg M and take the corrected N=M⁻¹Q^n. The choices can be made over the residue curve and lifted uniformly before integration.

Hypotheses and interfaces:

- Even deg D makes deg M divisible by n; for D=ω, deg D=2g−2 is even.
- Existence of Q over a finite field follows from a Picard degree component having a rational point and Br(Fq)=0, not from the integer degree calculation alone.
- The line N is independent of the spectral parameter a.

Construction or proof:

1. Use the source’s lifting setup and spectral-torsor-calculus: an n-torsion class t is zero iff et=0 for gcd(e,n)=1.
2. The corrected eth power is P^(L^e M^(1−e)). Tensor by π*Q^(e−1) to replace that label by L^e(M⁻¹Q^n)^(e−1).
3. Integrate the resulting identical triviality indicators against the same invariant Prym volume and base form.
4. Apply Weil’s formula to the equal total volumes. The printed sign in N and in the torsor power is corrected throughout.

Check:

- For n=2,g=2,D=ω of degree 2, deg M=−2, choose deg Q=−1, and N=ω Q² has degree 0.
- At e=1 the right determinant is L, giving the identity comparison.

Direct prerequisites: [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), `LogicAndDefinabilityInNumberTheory:LD.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.3, Theorem 7.16 and proof, pp.584–585; correction E12. The degree-zero correcting line is M⁻¹Q^n, forced by the inverse-M norm convention..

Routed extraction items: 71.

Open gates at this target: [G-moduli](#g-moduli), [G-lowgenus](#g-lowgenus).

<a id="TMS4-hodge-degree-independence"></a>

### Betti and Hodge numbers in coprime degree

Target `TMS.4/hodge-degree-independence` · theorem · planet **Hodge degree independence**.

Over C with the same curve, D and coprimality hypotheses, the Betti numbers and the cohomologically graded Hodge numbers of M_GL^d and M_SL^L are independent of the coprime degree. Within a fixed degree, changing L is realized by tensoring an nth root over C. Across coprime degree classes, combine the arithmetic comparisons with purity; equality of E-polynomials alone is insufficient.

Hypotheses and interfaces:

- The compact-support geometric mixed Hodge realization and comparison are G-MHS.
- Import the canonical GL ℓ-adic purity node CB.9/higgs-purity. Its extension to D-twisted and fixed-determinant geometric Hodge cohomology is the explicit G-Higgs-purity contract, not an existing conclusion of that node.
- Purity must state weight k for H_c^k, so the coefficient with p+q=k determines the sign and the cohomological degree.

Construction or proof:

1. For two degrees d₁,d₂ prime to n choose e with ed₁≡d₂ mod n. Over C fix Q of degree deg M/n and N=M⁻¹Q^n. Choose a line of degree (d₂−ed₁)/n and an nth root in Pic0 so that the second determinant differs from L₁^eN^(e−1) by an actual nth power. Spread these fixed choices simultaneously. Apply the SL count comparison and determinant twisting after all good reductions; use the GL comparison for GL. Katz then gives equal E-polynomials. This does not presume determinant independence of finite-field counts.
2. Apply the requested smooth semiprojective Higgs purity theorem: the proper weighted Hitchin map supplies limits, the fixed loci are projective, and an actual Białynicki–Birula filtration with its affine-bundle shifts establishes geometric purity. Do not infer purity of an open variety merely from purity of a compactification.
3. Weight-degree separation recovers each compact Hodge number from its E coefficient. Use Poincaré duality for the smooth equidimensional moduli to pass to ordinary cohomology and Betti numbers.
4. Over C the n-power map on Pic0 is surjective, and tensoring removes determinant choices in a degree.

Check:

- The result concerns coprime degrees; it does not identify a noncoprime stable space with a coprime one.
- A mixed Hodge polynomial without degree-purity cannot by itself determine Betti numbers.

Direct prerequisites: [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence), [TMS.0/equivariant-katz](#TMS0-equivariant-katz), `CountingBundlesAndHallAlgebrasOfCurves:CB.9/higgs-purity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.3, Corollary 7.17, p.586; HT03 §6, numbered pp.17–18. The corollary gives the numerical cohomology comparison; the plan makes its needed purity and degree-separation input explicit..

Routed extraction items: 71.

Open gates at this target: [G-MHS](#g-mhs), [G-Higgs-purity](#g-higgs-purity), [G-lowgenus](#g-lowgenus).

<a id="TMS4-hausel-thaddeus-gerbes"></a>

### Hausel–Thaddeus gerbes

Target `TMS.4/hausel-thaddeus-gerbes` · construction · planet **Hausel–Thaddeus gerbes**.

The stable fixed-determinant Higgs stack over its μn-rigidified space defines a μn-gerbe α_SL,L, the obstruction to a universal fixed-determinant family. Construct a coherent Γ-equivariant structure and descend it to α_PGL,L on [M_SL^L/Γ]. For e prime to n choose a with ad≡e mod n and put L′=L^a; the PGL degree is e mod n. The comparison uses α_SL,L^e and α_PGL,L′^d.

Hypotheses and interfaces:

- n is invertible, Γ=J_X[n] is constant after the chosen finite étale base change, and μ_(n|Γ|)=μ_(n^(2g+1)) is constant.
- Equivariance is action-groupoid descent with pullback-twisted multiplication of the associated line torsors; an ordinary group extension with ignored base action is not a substitute.
- L′ need only have degree congruent to e modulo n; the quotient identifies the degree-class component.

Uses that determine the API:

- GWZ20 Theorem 7.18: Identify their principal splitting torsors with the opposite Hitchin fibres.
- GWZ20 Theorems 7.21 and 7.24: Twist the PGL invariant and the individual inertia-sector traces.

| Planned declaration | API role | Specification |
|---|---|---|
| `TauCeti.HitchinMirror.htGerbe_universalFamily` | characterisation | A neutralization over T is exactly a universal stable fixed-determinant family over X×T with the specified determinant data. |
| `TauCeti.HitchinMirror.htGerbe_band` | projection | The band is μn, acting by scalar automorphisms, compatibly with the existing rigidification. |
| `TauCeti.HitchinMirror.htGerbe_equivariant` | structure | For each Γ action arrow give a band-preserving gerbe isomorphism and coherent composition on the action groupoid. |
| `TauCeti.HitchinMirror.htGerbe_descent` | projection | Pullback of α_PGL,L along the quotient atlas is α_SL,L with its coherent Γ descent datum. |
| `TauCeti.HitchinMirror.htGerbe_baseChange` | functoriality | The gerbes, their powers and their descent data commute with the verified curve/moduli base changes. |
| `TauCeti.HitchinMirror.htGerbe_degreePower` | compatibility | If ad≡e mod n and L′=L^a, the gerbe powers on the two degree-class components are α_SL,L^e and α_PGL,L′^d, with no interchange of d and e. |

Definition checks:

- **htGerbe_rankOne** (degenerate): For n=1 the band and both gerbes are trivial.
- **htGerbe_neutralFamily** (compatibility): An actual universal family with its determinant trivialization produces a neutralization, rather than merely a rational point of a principal splitting torsor.
- **htGerbe_rootOrder** (computation): For n=2,g=2, |Γ|=16 and the admissibility root order n|Γ| is 32; μ2 alone does not meet this hypothesis.
- **htGerbe_actionDescent** (non-example): A nontrivial base action changes the line-torsor cocycle to L_γ⊗γ*L_δ→L_(γδ). Omitting γ* fails the action-groupoid coherence even if a pointwise central extension exists.

Construction or proof:

1. Use stable-fixed-determinant and the imported μn-rigidification theorem to obtain the gerbe and its universal-family interpretation.
2. Build tensor action and the scalar coherence on the gerbe. Use étale-local curve sections and normalized Poincaré lines to define the descent isomorphisms; prove their cocycle and independence of auxiliary choices. This arithmetic-family verification is G-HT-descent.
3. Apply the corrected descent/transgression interface from G-ETII to form the quotient gerbe. Take its indicated powers with the band fixed.

Check:

- The source’s arithmetic extension of the complex construction is not certified just by writing “the same proof”; its descent is an explicit gate.

Direct prerequisites: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, pp.586–587, preceding Theorem 7.18. The obstruction gerbes are descended from universal-family data and raised to the degree powers required for duality..

Routed extraction items: 72.

Open gates at this target: [G-HT-descent](#g-ht-descent), [G-ETII](#g-etii).

<a id="TMS4-ht-splitting-duality"></a>

### Duality of the gerbe splitting torsors

Target `TMS.4/ht-splitting-duality` · theorem · planet **Gerbe splitting duality**.

On the common connected regular spectral locus, the two powered gerbes are arithmetic and there are canonical equivariant identifications Split′((M_SL^L)♦/A♦,α_SL,L^e)≃(M_PGL^e)♦ and Split′((M_PGL^e)♦/A♦,α_PGL,L′^d)≃(M_SL^L)♦, under the opposite PGL and SL Prym actions respectively.

Hypotheses and interfaces:

- The integer choices and root/admissibility data are those of hausel-thaddeus-gerbes.
- The dual Prym and norm conventions are exactly TMS.3’s corrected ones.
- The complex HT03 propositions use unitary language. Their contracted-product proofs must be made algebraic and descended over the noetherian base; this is G-HT-descent.

Construction or proof:

1. On a smooth spectral fibre use a universal line normalized at a local section to identify the finite μn-neutralization torsor, then extend its action by the dual Prym.
2. Use the normalized Poincaré bundle and theorem of the cube to compare the two torsors and their degree powers, following HT03 Propositions 3.2 and 3.6. Verify the opposite action and tensor-product coherence.
3. Descend the local constructions, including changes of normalization section, and prove base-change compatibility over the arithmetic model; a topological isomorphism over C is not sufficient here.
4. Verify arithmetic μn-neutrality separately by an étale-local spectral universal family with its actual determinant normalization. A local section of Split′ alone does not imply μn-neutrality. Construct the displayed torsor identifications only after this verification; G-HT-descent includes that proof obligation.

Check:

- For n=1 both sides are points under trivial Pryms.
- Check each equivalence is equivariant under P_i′, rather than merely an isomorphism of underlying spaces.

Direct prerequisites: [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.1/principal-splitting](#TMS1-principal-splitting), `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Theorem 7.18, p.587; HT03 Propositions 3.2 and 3.6, numbered pp.8–13. The theorem gives opposite Prym torsors as principal splitting spaces; the cited proofs motivate the explicit arithmetic descent obligation.; [HT03](https://arxiv.org/pdf/math/0205236v1), §3, Propositions 3.2 and 3.6, numbered pp.8–13. The torsor constructions compare normalized universal bundles through Poincaré lines and their coherent tensor laws..

Routed extraction items: 73.

Open gates at this target: [G-HT-descent](#g-ht-descent), [G-lowgenus](#g-lowgenus).

<a id="TMS4-local-brauer-splitting"></a>

### Local Brauer splitting of the powered gerbes

Target `TMS.4/local-brauer-splitting` · theorem.

Over O_F with the prescribed roots, if the two regular fibres above b∈A(O_F)∩A♦(F) have F-points, both powered gerbes have neutral induced Gm-gerbes on those fibres. Consequently both Hasse-character functions are 1 there. This is the local condition actually needed by the integral proof. The source’s stronger μn-neutrality equivalence is retained separately as G-Kummer.

Hypotheses and interfaces:

- Use the smooth stable SL space, proper Hitchin map, and Brauer(O_F)=0 for a complete discrete valuation ring with finite residue field.
- For the PGL side construct an integral point as the image of an integral SL point in the appropriate degree, rather than assume every coarse stack point lifts integrally.

Construction or proof:

1. The opposite regular fibre point and ht-splitting-duality give a point of Split′. Apply constant-brauer to make the underlying Gm-gerbe a constant class along each fibre.
2. An SL F-point over an integral Hitchin parameter extends to O_F by properness. Evaluation of its gerbe gives a class in Br(O_F)=0; the constant Brauer class is therefore zero.
3. Use spectral-torsor-calculus and the prime-to-n degree powers to obtain an SL point of the degree needed for the PGL fibre. Extend it integrally and take its image in the PGL quotient to evaluate the other constant class.
4. Apply the imported factorization of transgression/Hasse evaluation through Gm-gerbes. Do not erase a possible Pic/r Kummer residue of the original μn-gerbe.

Check:

- A constant nonzero Brauer phase would make fα a nontrivial constant; Br(O_F)=0 is the step excluding it.
- The proof does not claim that Br=0 implies H²(μn)=0 on the entire positive-dimensional fibre.

Direct prerequisites: [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality), [TMS.1/constant-brauer](#TMS1-constant-brauer), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Lemma 7.19 and proof, p.587. The proof establishes the constant Brauer class and kills it by an integral point. The plan separates this valid consequence from the stronger band-neutrality wording..

Routed extraction items: 74.

Open gates at this target: [G-HT-descent](#g-ht-descent), [G-lowgenus](#g-lowgenus).

<a id="TMS4-sl-pgl-dual-pair"></a>

### The SLn/PGLn dual pair

Target `TMS.4/sl-pgl-dual-pair` · theorem · planet **SLn/PGLn dual pair**.

Combine the two stable Hitchin fibrations, their Prym groups, and α_SL,L^e and α_PGL,L′^d into a dual pair in the sufficient local-Brauer sense of TMS.2. The isogeny is P_SL→P_SL/Γ, its regular duality is the Prym Poincaré comparison, the principal splittings are the opposite fibres, and local Brauer neutrality holds when both have points. The full low-genus range and the literal μn-neutrality variant remain the recorded gates.

Hypotheses and interfaces:

- Use the common A♦ and every codimension/admissibility condition in regular-hitchin-certificate.
- n and the quotient kernel degree are units. Γ and μ_(n^(2g+1)) are constant on the chosen model.

Construction or proof:

1. Apply regular-hitchin-certificate for the abstract-system data, without replacing it by a generic properness assertion.
2. Use pgl-prym for the globally étale isogeny and prym-duality for the self-duality square.
3. Apply ht-splitting-duality and local-brauer-splitting. The root hypothesis n|Γ| makes the gerbes admissible through G-ETII.
4. Distinguish the sufficient pair that has been constructed from the extra literal μn-neutrality claim; the latter is not needed to deduce the main invariant equality.

Check:

- Each of the four duality conditions is linked to its actual supplying node.
- A non-generically-free low-genus quotient is not accepted as an admissible abstract system by this assembly alone.

Direct prerequisites: [TMS.3/regular-hitchin-certificate](#TMS3-regular-hitchin-certificate), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality), [TMS.4/local-brauer-splitting](#TMS4-local-brauer-splitting), [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair).

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Proposition 7.20, p.588. The proposition assembles all geometric and gerbe properties into the duality input of the abstract mirror theorem..

Routed extraction items: 74.

Open gates at this target: [G-lowgenus](#g-lowgenus), [G-HT-descent](#g-ht-descent), [G-ETII](#g-etii).

Layer acceptance requires all targets above and the following remaining obligations:

- G-ETII: Generic integration supplier and two proof repairs.
- G-HT-descent: Arithmetic descent of Hausel–Thaddeus gerbes.
- G-Higgs-purity: Higgs and twisted-sector purity with Hodge realization.
- G-MHS: Geometric mixed Hodge structures and local systems.
- G-lowgenus: Full genus range of the published main theorem.
- G-moduli: Relative Higgs geometry and abstract-system certificate.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

<a id="TMS5"></a>

## TMS.5 — Mirror symmetry and refined cohomology

Deduce the SLn/PGLn E-polynomial and finite-field equalities, the canonical-twist Hodge-number comparison, and the justified fibrewise virtual-character consequence. Keep the actual Galois-isomorphism claim as an unresolved target. Prove the determinant-sector variation formula and the character-isotypic refinement using the existing finite Fourier orthogonality and the normalized Weil pairing.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A3`, `ArithmeticGaloisDuality:R02.4`, `ArithmeticGaloisRepresentations:R01.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9`, `DeligneWeightsAndPurity:DWP.7`, `EtaleDualityAndPerverseSheaves:EDC.0`, [TMS.0](#TMS0), [TMS.2](#TMS2), [TMS.4](#TMS4), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

<a id="TMS5-main-mirror"></a>

### SLn/PGLn topological mirror symmetry

Target `TMS.5/main-mirror` · theorem · planet **Topological mirror symmetry**.

Let X/k be smooth projective geometrically connected of genus g, Dω⁻¹ have strictly positive even degree or be trivial, n≥1, gcd(n,d)=gcd(n,e)=1, L∈Pic^d(X), and μ_(n^(2g+1))⊂k. Choose L′=L^a with ad≡e mod n. Over C the target is E(M_SL^L;x,y)=E_st(M_PGL^e,α_PGL,L′^d;x,y). Over k=Fq of characteristic p>n the target is #M_SL^L(k)=#^α_st(M_PGL^e). The same root/gerbe conventions are used on both sides.

Hypotheses and interfaces:

- The full stated genus range is retained as a target. The abstract-system proof is established only once G-lowgenus verifies its geometric certificate or supplies separate low-genus calculations.
- All generic integration, realization and arithmetic gerbe descent gates in the supplying nodes remain visible.

Construction or proof:

1. Spread the complex data to finite-type R⊂C with n inverted and the required finite roots; make Γ constant by a finite étale cover preserving the chosen complex point.
2. Apply sl-pgl-dual-pair, then abstract-mirror or arithmetic-mirror. This uses the sufficient local Brauer version whose proof was supplied in TMS.2.
3. On the smooth SL scheme only the identity inertia sector remains; its age is zero and transgression is trivial, so the twisted stringy invariant there is the ordinary one.
4. For every low-genus/degree component where the abstract certificate is not verified, leave G-lowgenus open rather than silently changing the theorem’s hypotheses.

Check:

- At n=1 both moduli and both invariants are 1.
- For n=2,g=2,D=ω, use Γ of order 16 and the root order 32; the result specializes to the rank-two case independently checked by Hausel–Thaddeus.
- The finite-field version requires the stated roots and p>n; no unsupported small-characteristic extension is asserted.

Direct prerequisites: [TMS.4/sl-pgl-dual-pair](#TMS4-sl-pgl-dual-pair), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants).

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Theorem 7.21 and proof, p.588. The main theorem applies the abstract comparison to the dual SLn/PGLn data and simplifies the smooth SL side..

Routed extraction items: 75.

Open gates at this target: [G-lowgenus](#g-lowgenus), [G-HT-descent](#g-ht-descent), [G-ETII](#g-etii), [G-local](#g-local), [G-MHS](#g-mhs), [G-Groth](#g-groth), [G-HT](#g-ht).

<a id="TMS5-canonical-hodge-numbers"></a>

### Canonical-twist Hodge numbers

Target `TMS.5/canonical-hodge-numbers` · theorem · planet **Stringy Hodge-number comparison**.

For D=ω over C under the main theorem’s hypotheses, the compact stringy Hodge numbers of (M_PGL^e,α_PGL,L′^d) equal the compact Hodge numbers of M_SL^L. On an inertia component Z of age a, the stringy summand H_c^k(Z,Nα) has stringy degree k+2a and Hodge bidegree (p+a,q+a). Purity must identify its weight with k before this shift, so the shifted weight equals the stringy degree.

Hypotheses and interfaces:

- The finite-monodromy local-system MHS is constructed through the torsor total-space character projector in G-MHS.
- Use G-Higgs-purity for canonical fixed-determinant spaces and their finite-order fixed loci; the generic CB.9 GL assertion alone does not state this sector version.
- The result uses age-shifted rational indices; it does not assert equality of unshifted individual sector cohomologies.
- For D=ω the Γ-action preserves the holomorphic symplectic form. Its nontrivial tangent eigenvalues pair as ζ^b and ζ^(n−b), so every sector has integral age a=codim(Z)/2. The shift 2a is even and preserves the alternating sign.

Construction or proof:

1. Apply main-mirror for equality of E-polynomials.
2. Use the requested semiprojective purity statement on SL and on the finite-order fixed-locus torsor covers, with the character projector and finite quotient invariants. Track compact-support degrees.
3. Use symplectic eigenvalue pairing to prove a is integral. Purity gives weight k before the shift and weight k+2a afterwards. Since 2a is even, the sign (−1)^k agrees with (−1)^(k+2a); p+q=k+2a therefore separates the signs. Extract each Hodge number coefficientwise.

Check:

- For n=1 the only nonzero compact Hodge number is h_c^(0,0)=1.
- A mixed sector without purity cannot be read degree by degree from its alternating E-polynomial.
- A nonsymplectic sector of age 1/2 cannot use this parity argument; the canonical-twist hypothesis is essential to this proof.

Direct prerequisites: [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), `CountingBundlesAndHallAlgebrasOfCurves:CB.9/higgs-purity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Corollary 7.22 and proof, p.589; HT03 §6, numbered pp.17–18. The Hodge-number conclusion requires the stated purity of the canonical-twist and twisted-sector cohomology..

Routed extraction items: 76.

Open gates at this target: [G-Higgs-purity](#g-higgs-purity), [G-MHS](#g-mhs), [G-lowgenus](#g-lowgenus).

<a id="TMS5-fibre-virtual-characters"></a>

### The justified fibrewise virtual comparison

Target `TMS.5/fibre-virtual-characters` · theorem · planet **Fibrewise virtual characters**.

For every a∈A(Fq) in the main finite-field setting and every m≥1, the alternating trace of Fr^m on the SL Hitchin fibre equals that on the twisted PGL inertia fibre with the negative age Tate twists. Consequently their alternating classes agree in the Grothendieck group of finite-dimensional continuous Qbarℓ-representations of Gal(Fq), after a common finite coefficient extension for the finite set of fractional twists. This is a virtual equality; individual degrees and nonsplit extensions are not identified.

Hypotheses and interfaces:

- Use all extension-field identities of arithmetic-mirror, with the compatible mth Frobenius powers of the same finite-denominator Tate roots.
- The cohomological complexes have finite-dimensional bounded cohomology from proper coarse fibres and the imported tame-stack formalism.

Construction or proof:

1. Apply arithmetic-mirror to the SL/PGL pair above a over every finite extension.
2. Collect even and odd cohomology as virtual continuous representations with the fixed negative age twist. Traces of all Frobenius powers agree.
3. Use the characteristic-zero Brauer–Nesbitt recognition on semisimplifications of these virtual classes. No semisimplicity of the original arithmetic action is inferred.

Check:

- I2 and the unipotent Jordan block J2 have identical traces of every power but different fixed-space dimensions; the conclusion must not identify them as actual representations.
- An even and an odd copy of the same representation cancel virtually, so virtual equality alone does not separate degrees.

Direct prerequisites: [TMS.4/sl-pgl-dual-pair](#TMS4-sl-pgl-dual-pair), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §6.2, Theorem 6.12, p.569; §7.4, proof of Theorem 7.23, p.589, retained with correction E25. The valid consequence of the proof is the all-powers alternating trace identity and hence a virtual representation identity..

Routed extraction items: 76.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local), [G-lowgenus](#g-lowgenus).

<a id="TMS5-strong-fibre-isomorphism"></a>

### The stronger fibrewise Galois-isomorphism target

Target `TMS.5/strong-fibre-isomorphism` · comparison.

The source’s stronger target is an actual Gal(Fq)-equivariant isomorphism between the derived SL Hitchin-fibre cohomology and the twisted PGL inertia-fibre cohomology. It remains an unresolved target in this plan. The supplied argument proves fibre-virtual-characters; it does not prove degreewise semisimplification, arithmetic semisimplicity or an actual derived isomorphism.

Hypotheses and interfaces:

- A proof must supply justified cohomological degree separation and arithmetic semisimplicity for the relevant fibre representations, or an independent geometric isomorphism.
- Purity of a proper direct-image complex does not automatically make every singular fibre cohomology pure in its ordinary degree, and purity alone does not kill Frobenius Jordan blocks.

Construction or proof:

1. Retain the all-powers virtual comparison as the established input.
2. Audit any proposed degree separation at the actual singular fibres, rather than infer it from global smoothness of the total space.
3. Supply arithmetic semisimplicity with its proof, or a geometric correspondence giving the isomorphism. G-Galois records precisely this missing step; the source’s final sentence is not treated as a proof.

Check:

- The pure weight-zero continuous representations I2 and J2 have traces 2 for all Frobenius powers, while their fixed spaces have dimensions 2 and 1.
- Resolving the target must defeat both extension-class ambiguity and alternating-degree cancellation; a semisimple recognition theorem alone defeats neither without its hypotheses.

Direct prerequisites: [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters), `DeligneWeightsAndPurity:DWP.7`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `mathlib:Matrix.trace`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.4, Theorem 7.23 and proof, p.589; inherited correction E25. The published proof reaches the trace identity but does not supply the extra representation-theoretic information needed for its actual-isomorphism conclusion..

Routed extraction items: 76.

Open gates at this target: [G-Galois](#g-galois).

<a id="TMS5-sector-variation"></a>

### Determinant variation of inertia-sector traces

Target `TMS.5/sector-variation` · theorem · planet **Sector variation formula**.

Let ν label the determinant twist of the SL fibration by δ(L Lν⁻¹)∈Γ, so its geometric Frobenius is ν⁻¹Fr. Let Tγ(ν) be the twisted trace of the γ-inertia sector of the corresponding mirror PGL data, including the prescribed degree power of its gerbe and the age twist. With the Weil pairing convention χγ(ν)=(ν,γ), prove Tγ(ν)=(ν,γ)⁻¹Tγ(0).

Hypotheses and interfaces:

- k contains μ_(n^(2g+1)), Γ is constant and the genus/regular-locus gates of the preceding applications are retained.
- The local Tate calculation uses only the ordered mixed block between an unramified ν and the tame sector class. It does not use isotropy of the complementary block at even torsion.
- Tγ(ν) includes the transported gerbe and power-of-determinant choices; it is not an unlabelled comparison of fixed loci with unrelated gerbes.

Construction or proof:

1. Lift the finite list of determinant line bundles and compare the SL torsor classes by the unramified Γ class ν.
2. Use the self-dual isogeny exact sequence and its pairing adjunction to identify the ratio of local gerbe characters with the inverse local Tate pairing of ν and the connecting class of a PGL point.
3. Apply the imported specialization with the inverse tame-character generator convention to identify the ramified coordinate of that connecting class with γ. The mixed evaluation is then the normalized Jacobian Weil pairing (ν,γ).
4. Integrate on the fixed γ sector and use twisted-integral with its conjugation conventions consistently. This gives the displayed ratio; no vanishing of the ramified/ramified diagonal is needed.

Check:

- For n=3 and (ν,γ)=ζ3, the multiplier is ζ3⁻¹; the direct multiplier fails the fixed ν⁻¹Fr convention.
- For F=Q3 and the complementary C2 Kummer class of −3, the diagonal self-pairing can have invariant 1/2. The mixed formula must remain valid without asserting that this diagonal vanishes.

Direct prerequisites: [TMS.3/determinant-twisting](#TMS3-determinant-twisting), [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality), [TMS.2/twisted-integral](#TMS2-twisted-integral), `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `ArithmeticGaloisDuality:R02.4/isogeny-dual-exact-sequence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.5, Lemma 7.25, equations (32)–(35), pp.591–593. The local self-dual pairing and specialization compare the sector phases by the inverse Weil pairing; only the unramified/mixed block is used..

Routed extraction items: 78.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local), [G-lowgenus](#g-lowgenus).

<a id="TMS5-isotypic-mirror"></a>

### Character-isotypic mirror symmetry

Target `TMS.5/isotypic-mirror` · theorem · planet **Isotypic mirror symmetry**.

In the finite-field setting of the main theorem, with Γ constant, choose the primitive nth root and the Jacobian Weil pairing identifying γ∈Γ with χγ(ν)=(ν,γ). Then Tr(Fr,H_c^*(M_SL^L,Qbarℓ)^χγ)=Tr(Fr,H_c^*([(M_SL^L′)^γ/Γ],N_L′⊗Qbarℓ(−Fγ))). Traces are alternating, and the right side is the γ-sector of the PGL inertia with its degree-d powered Hausel–Thaddeus gerbe.

Hypotheses and interfaces:

- The star denotes the alternating compact-support realization, not a direct sum with forgotten signs.
- Use ℓ≠p splitting coefficients, the same faithful μn character and the ν⁻¹Fr convention.
- The theorem gives a character trace identity, not the actual-isomorphism claim left in strong-fibre-isomorphism.

Construction or proof:

1. Use determinant-twisting to enumerate all Γ twists of the SL space over k. The trace of a twist is Tr(ν⁻¹Fr,H_c^*(M_SL^L)).
2. Multiply by χγ(ν), sum over ν and divide by |Γ|. The existing pinned character orthogonality isolates the χγ eigenspace; no new generic Fourier theory is needed.
3. Apply main-mirror to each determinant twist and sector-variation to its mirror trace. The same character orthogonality isolates precisely the γ sector.
4. Cancel the common factor |Γ|. Keep every age twist, character inverse and stack automorphism weight from the supplying nodes.

Check:

- For Γ=1 recover the ordinary total trace equality.
- For C3 the ν⁻¹ action and multiplier χγ(ν), with division by 3, isolate χγ and not its inverse.
- For n=2,g=2 the Fourier normalization is 1/16, using all 16 characters.

Direct prerequisites: [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.5/sector-variation](#TMS5-sector-variation), [TMS.3/determinant-twisting](#TMS3-determinant-twisting), `tauceti:CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, `mathlib:sum_hom_units_eq_zero`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.

Sources: [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), §7.5, Theorem 7.24 and proof, pp.590–593, especially equations (30)–(32). Finite Fourier transforms of the determinant-twisted mirror equality isolate a single character and its matching inertia sector..

Routed extraction items: 77.

Open gates at this target: [G-ETII](#g-etii), [G-local](#g-local), [G-lowgenus](#g-lowgenus).

Layer acceptance requires all targets above and the following remaining obligations:

- G-ETII: Generic integration supplier and two proof repairs.
- G-Galois: Actual cohomological Galois isomorphism.
- G-Groth: Equivariant blow-up presentation.
- G-HT: Equivariant and fractional Hodge–Tate realization.
- G-HT-descent: Arithmetic descent of Hausel–Thaddeus gerbes.
- G-Higgs-purity: Higgs and twisted-sector purity with Hodge realization.
- G-MHS: Geometric mixed Hodge structures and local systems.
- G-local: Equal-characteristic local Tate duality.
- G-lowgenus: Full genus range of the published main theorem.
- Discharge imported supplier requests and independently review the corrected proof interfaces.

## Worked normalizations

These computations fix the conventions used across layers. They test formulas; they do not replace the geometric supplier proofs.

1. **Stack versus coarse count.** Over F3, BC2 has two rational torsors with two automorphisms apiece, so its ordinary mass is 1/2+1/2=1. For the sign action on A¹, each torsor twist has a zero orbit of stabilizer order2 and a nonzero orbit of stabilizer order1. The total mass is 1/2+1+1/2+1=3. Its inertia has an identity sector of mass3 and a nonidentity sector BC2 of age1/2, hence stringy count 3+√3. The analogous E-polynomial is xy+(xy)^(1/2).

2. **Root-choice counterexample.** For q=4, the systems exp(log(4)/r) and exp((log(4)+2πi)/r) are compatible, but their square roots are 2 and −2. The equality of L^(1/2) with two points depends on that choice. At prime q=p outside the character order, cyclotomic-fixing Galois transport is available; the number-field specialization uses those density-one primes.

3. **Rank one.** The trace-free rank-one Higgs field is zero, the chosen determinant fixes E=L, Γ is trivial, and both moduli have invariant1. The Hitchin base and Prym are points; every gerbe band here is μ1. This checks both final sides without using a positive-dimensional generic-fibre argument.

4. **Rank two in genus two with D=ω.** The spectral algebra has π_*O_Y=O_X⊕ω⁻¹, so M=ω⁻¹ has degree−2. A smooth connected spectral curve has genus5 and Prym dimension3; the SL Hitchin base also has dimension3, giving total dimension6. Γ has order16 and admissibility asks for μ32. Choosing Q of degree−1 makes N=M⁻¹Q²=ωQ² degree0. The norm target for determinant L is Lω, while the square of its torsor has determinant label L²ω. The inverse sign in either formula is detected here.

5. **Order-three Fourier orientation.** Write the perfect pairing of C3 with its dual as (ν,γ)=ζ^(νγ). Then (1/3)Σ_(ν=0,1,2) ζ^(νγ)ζ^(−νδ) is1 at δ=γ and0 otherwise. Replacing one inverse changes the selected label to −γ; order-two tests cannot detect that mistake. This is the existing generic Fourier theorem applied with the normalized Weil pairing, not a new Fourier construction.

6. **Trace does not imply an actual isomorphism.** On Qℓ², identity I and the matrix J with rows (1,1),(0,1) have Tr(I^m)=Tr(J^m)=2 for all m. They define continuous procyclic actions via the projection to Zℓ. Their eigenvalues have weight0, but I has a two-dimensional fixed space and J has the one-dimensional line of vectors (a,0). Their virtual classes agree; their actions are not isomorphic. This is a check on the inference used in the stronger target, not a counterexample to the specific Hitchin-fibre statement.

## Supplier ownership and exact requests

Requests below specify mathematical contracts and do not assert that their suppliers are implemented. Registered fine-grained nodes are direct prerequisites; a request for a stage describes the additional scope that its present node statements do not supply. Existing TauCetiRoadmap interfaces are imported without proposing changes to those roadmaps.

### AbelianSchemesAndArithmeticModuli:A2

Supply the checked normalized Poincaré duality comparison and its relative Picτ/Pic0 torsor functoriality. On a general smooth projective fibre retain Picτ rather than replacing it with Pic0; on an abelian torsor identify Picτ with the dual abelian scheme. The relative spectral norm kernel and family quotient must be represented with the stated flatness hypotheses.

Consumers: [TMS.1/relative-splitting](#TMS1-relative-splitting), [TMS.1/principal-splitting](#TMS1-principal-splitting), [TMS.1/unitary-splitting-comparison](#TMS1-unitary-splitting-comparison), [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair), [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes), [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality).

### AbelianSchemesAndArithmeticModuli:A3

Supply the checked dual-isogeny/Cartier-kernel, multiplication-degree and polarized Weil-pairing nodes, including base change and finite étaleness when n is a unit. Use rank Γ=n^(2g) and track the orientation of the pairing in the determinant-sector formula.

Consumers: [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), [TMS.3/determinant-twisting](#TMS3-determinant-twisting), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.5/sector-variation](#TMS5-sector-variation), [TMS.5/isotypic-mirror](#TMS5-isotypic-mirror).

### AlgebraicModuliForArithmeticGeometry:R09.1

Supply the relative algebraic stack of vector bundles and the relative Higgs mapping/parameter construction for smooth proper curves over the stated finite-type bases. Work over the current AlgebraicVectorBundles roadmap. This stage supplies parameter geometry; existence of a proper stable Higgs coarse space still needs the explicit G-moduli input.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant).

### AlgebraicModuliForArithmeticGeometry:R09.2

Supply finite tame quotient stacks, their coarse spaces, properness descent and the GIT/geometric-quotient adapter for the relative stable Higgs construction. If its present finite-quotient scope does not supply the stable GIT construction, keep G-moduli open and extend the moduli direction; do not identify a quotient stack with its coarse space.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/proper-hitchin](#TMS3-proper-hitchin).

### AlgebraicModuliForArithmeticGeometry:R09.4

Import algebraic gerbe/band/neutralization and Picard-stack carriers, native groupoid descent and smooth-stack Hartogs extension of top forms across codimension ≥2. The five generic gerbe nodes listed in prerequisites already own H² classification, neutralizations, band change, Isom torsors and root gerbes; none is redefined here. The relative mapping stack of fibrewise splittings must be algebraic and commute with the verified base changes.

Consumers: [TMS.0/stringy-invariants](#TMS0-stringy-invariants), [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants), [TMS.1/arithmetic-gerbe](#TMS1-arithmetic-gerbe), [TMS.1/relative-splitting](#TMS1-relative-splitting), [TMS.1/principal-splitting](#TMS1-principal-splitting), [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), [TMS.3/smooth-stable-moduli](#TMS3-smooth-stable-moduli), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.3/determinant-twisting](#TMS3-determinant-twisting), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes).

### AlgebraicModuliForArithmeticGeometry:R09.5

Import the checked rigidification and arbitrary-base-change nodes with their sheaf quotient of Isom objects and stackification universal property. Apply them to μr in the splitting stack and μn in the stable chosen-determinant stack; the latter cannot be rigidified by Gm.

Consumers: [TMS.1/arithmetic-gerbe](#TMS1-arithmetic-gerbe), [TMS.1/relative-splitting](#TMS1-relative-splitting), [TMS.1/principal-splitting](#TMS1-principal-splitting), [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes).

### AlgebraicModuliForArithmeticGeometry:R09.7

Supply characteristic-zero equivariant resolution and equivariant normal-crossing compactification for finite group actions. Equivariant weak factorization and the equivariant Bittner blow-up presentation are separate LD.3 obligations, not consequences asserted from resolution alone.

Consumers: [TMS.0/equivariant-katz](#TMS0-equivariant-katz).

### ArithmeticGaloisDuality:R02.4

Extend the checked local abelian-variety duality and isogeny-index nodes, whose present statements assume a characteristic-zero local field, to prime-to-p isogenies over F=k((t)). Supply the perfect A(F)×H¹(F,A∨) pairing, annihilator/index identities and the compatible μr-gerbe character interpretation for torsors. An unverified equal-characteristic version is not treated as an existing export.

Consumers: [TMS.2/equal-fibre-volumes](#TMS2-equal-fibre-volumes), [TMS.2/local-mirror-integral](#TMS2-local-mirror-integral), [TMS.5/sector-variation](#TMS5-sector-variation).

### ArithmeticGaloisRepresentations:R01.1

Import the checked characteristic-zero Brauer–Nesbitt trace criterion, applied to all Frobenius powers and only to semisimplified classes/virtual characters. It does not give Frobenius semisimplicity or separate degrees of arbitrary singular Hitchin fibres.

Consumers: [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters), [TMS.5/strong-fibre-isomorphism](#TMS5-strong-fibre-isomorphism).

### ArithmeticGaloisRepresentations:R01.5

Use the checked number-field Frobenius-density theorem after specializing the finite list of smooth projective equivariant families to O_K[1/N] in the connected component containing the original complex point. Density-one prime residue fields avoid the false root-choice independence at prime powers. No arbitrary finite-type-scheme Chebotarev extension is presumed.

Consumers: [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/fractional-katz](#TMS0-fractional-katz).

### CohomologyComparisons:CP.3

Extend the checked Hodge–Tate degeneration node to smooth proper schemes with finite group action over number fields, its χ-projectors and good-spread compatibility; supply local constancy of Hodge numbers on the chosen smooth connected complex base. For finitely many rational Tate exponents also supply Ito’s additive fractional Hodge–Tate multiplicity comparison, not an actual graded isomorphism inferred from traces.

Consumers: [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/finite-tate-roots](#TMS0-finite-tate-roots), [TMS.0/fractional-katz](#TMS0-fractional-katz).

### CountingBundlesAndHallAlgebrasOfCurves:CB.7

Import the checked GL stable Higgs and canonical Higgs moduli. The extension here is the relative general-D trace-free fixed-determinant family with chosen determinant isomorphism and μn-rigidification. Verify relative GIT/properness instead of treating generic carrier existence as that theorem.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence).

### CountingBundlesAndHallAlgebrasOfCurves:CB.9

Extend the checked canonical GL Higgs-purity target to the complex relative/general-D semiprojective purity used in degree independence and to the canonical fixed-SL spaces, finite-order fixed loci and finite torsor covers used by the stringy Hodge-number corollary. Supply its MHS and character-projector comparison; purity of a compactification does not imply purity of its open part.

Consumers: [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), [TMS.5/canonical-hodge-numbers](#TMS5-canonical-hodge-numbers).

### DeligneWeightsAndPurity:DWP.7

Supply purity of smooth proper cohomology, weight separation, and exact character-projector compatibility. Pure proper direct-image complexes do not automatically give pure ordinary-degree stalks or Frobenius semisimplicity. Canonical Higgs fixed-sector purity remains the CB.9 contract.

Consumers: [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.5/strong-fibre-isomorphism](#TMS5-strong-fibre-isomorphism).

### EndoscopicTransferAndUnitaryTraceComparison:ET.2b

Import the checked Higgs-stack, spectral/cameral-cover and Picard-action targets. Extend their finite-field endoscopic scope to the relative smooth-curve/general-D families used here, preserving the spectral module equivalence and pullback/norm identities. Generic stabilisation and orbifold integration remain in the separate coalesced Part II direction.

Consumers: [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.3/regular-hitchin-certificate](#TMS3-regular-hitchin-certificate).

### EtaleDualityAndPerverseSheaves:EDC.0

Supply compact-support cohomology and trace formalism for constructible finite-monodromy sheaves, proper base change and quotient-stack finite-group descent. Weighted rational-torsor counts must agree with cohomological traces, with the factor 1/|Aut|.

Consumers: [TMS.0/character-realizations](#TMS0-character-realizations), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters).

### HodgeStructuresPartII:H.1

Extend the checked Betti/de Rham/Dolbeault comparison direction to rank-one unitary local systems and all algebraically trivial line bundles on the smooth projective fibres, with the family-coherent Pic0 comparison needed for unitary principal splittings. The existing fixed torsion-determinant projective statement does not itself export this family equivalence.

Consumers: [TMS.1/unitary-splitting-comparison](#TMS1-unitary-splitting-comparison).

### LogicAndDefinabilityInNumberTheory:LD.2

Supply normalized local-field measure, Fubini and change of variables for invariant top forms, including F=k((t)) of positive characteristic for the constant-spread proof. Generic orbifold measure and gerbe specialization belong to the coalesced ET Part II supplier contract, not to this packet.

Consumers: [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), [TMS.2/twisted-integral](#TMS2-twisted-integral), [TMS.2/equal-fibre-volumes](#TMS2-equal-fibre-volumes), [TMS.2/local-mirror-integral](#TMS2-local-mirror-integral), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence).

### LogicAndDefinabilityInNumberTheory:LD.3

Supply the good-finite-G equivariant scissor Grothendieck group, its characteristic-zero smooth-projective blow-up presentation and additive realizations. Keep the further representation quotient distinct, and do not claim a fixed-character E-realization is multiplicative. Prove the required equivariant weak-factorization input.

Consumers: [TMS.0/character-realizations](#TMS0-character-realizations), [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz), [TMS.0/equivariant-katz](#TMS0-equivariant-katz).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

Import the existing roadmap’s line bundles, tensor/Picard operations and degree; use the current AlgebraicVectorBundles determinant theory for vector bundles.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Import curve coherent cohomology, Riemann–Roch and Serre duality, including the relative trace-free deformation calculation with n invertible.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/smooth-stable-moduli](#TMS3-smooth-stable-moduli).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change

Import relative coherent cohomology, perfectness and base change for the smooth proper curve families in the Higgs parameter and deformation arguments.

Consumers: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/smooth-stable-moduli](#TMS3-smooth-stable-moduli).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Import the actual relative Picard functor/Jacobian, its line-bundle obstruction, tensor maps, norm/pullback identities and the finite-field degree-one-line consequence after Lang and Br(k)=0. These are existing roadmap interfaces, not newly owned targets.

Consumers: [TMS.1/relative-splitting](#TMS1-relative-splitting), [TMS.1/principal-splitting](#TMS1-principal-splitting), [TMS.1/constant-brauer](#TMS1-constant-brauer), [TMS.3/pgl-quotient](#TMS3-pgl-quotient), [TMS.3/determinant-twisting](#TMS3-determinant-twisting), [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence), [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties

Import the existing abelian-variety/Jacobian framework used in spectral norm-kernel duality; the relative Prym certificate and A2 Poincaré comparison retain their separate hypotheses.

Consumers: [TMS.3/prym-duality](#TMS3-prym-duality).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Import the current ClassFieldTheory Layer5 local Hasse invariant, Br(O_F)=0 and local coefficient duality with the stated field scope. The equal-characteristic abelian-variety Tate extension is explicitly requested from R02.4 rather than assumed from this citation.

Consumers: [TMS.1/constant-brauer](#TMS1-constant-brauer), [TMS.2/twisted-integral](#TMS2-twisted-integral), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence), [TMS.4/local-brauer-splitting](#TMS4-local-brauer-splitting), [TMS.5/sector-variation](#TMS5-sector-variation).

### SchemeAndStackFoundations:SF.2

Import the checked hochschild-serre-galois-covering node, especially part3 for qcqs X over a field and any abelian étale sheaf. Applied to Gm with the explicit global-units hypothesis, it supplies the full middle-exact geometric HS sequence used by constant-brauer. This export already plans the geometric acyclicity/limits step, so no duplicate gap or local spectral-sequence target is introduced.

Consumers: [TMS.1/constant-brauer](#TMS1-constant-brauer).

### SchemeAndStackFoundations:SF.3

Import the checked picard-brauer-sequence node’s actual Picard/Galois identifications and the rational-line obstruction. Use the geometric HS continuation from SF.2; retain the distinction between full H²(Gm) and its Brauer torsion subgroup.

Consumers: [TMS.1/constant-brauer](#TMS1-constant-brauer).

### Unregistered extension contracts

**SC-ETII — EndoscopicTransferAndUnitaryTraceComparisonPartII.** The extraction proposes this coalesced Part II; no definition/packet/stage was found in the checked repository. This is an ownership proposal and open contract, not a registered export.

Generic admissible finite abelian quotient stacks, age and gerbe transgression with action-groupoid descent; normalized orbifold measure and specialisation; tame generator and unramified enlargement; stack trace formula; Hasse invariant versus inertia character under the actual μ_(r|Γ|) bound; invariant torsor forms. The generic/special-fibre comparison and μr root-bound repairs E15–E16 are explicit proof gates. The corrected μr Kummer/Tate character form of Lemma6.7 is required.

**SC-MHS — HodgeStructuresPartIII.** The existing HodgeStructuresPartII is occupied by the nonabelian Hodge comparison; EH.5/geometric-cohomology-weight-bridge already proposes a separate geometric mixed-Hodge owner. No registered Part III stages were found.

Geometric functorial compact-support mixed Hodge structures on complex varieties and finite-monodromy local systems, finite-group character projectors, strict exactness, Künneth, SNC descent, and comparison with the abstract pinned TauCeti.Hodge.MixedHodgeStructure. Construct a local-system MHS through its finite torsor cover.

**SC-bundles — TauCetiRoadmap/AlgebraicVectorBundles.** Existing current upstream roadmap; direct read-only import, absent from the older atlas snapshot.

Vector bundles, tensor/exterior powers, determinant and total spaces; use its actual declarations and their identifications rather than re-planning generic bundle theory.

The restructuring proposals preserve generic integration in the coalesced EndoscopicTransferAndUnitaryTraceComparison Part II, place geometric MHS in a separate HodgeStructures Part III, extend R02.4 to prime-to-p equal-characteristic local duality, and extend CB.9 to the purity contracts above. TMS.2 owns the sufficient local-Brauer duality notion and records the stronger original μn condition as a separate gate. These are proposals for maintainer review, not changes to other roadmap files.

## Explicit mathematical and supplier gaps

<a id="g-etii"></a>

### G-ETII — Generic integration supplier and two proof repairs

Register the coalesced ET Part II contract SC-ETII and discharge its generic integration/transgression exports. In particular compare generic splitting cocycles with special-fibre inertia (inherited E15) and prove the μr version with the admissibility bound μ_(r|Γ|), not the stronger μ_(e²) used in the cited proof (E16). Keep action-groupoid descent, tame-generator orientation, unramified enlargement, weighted stack counts and the corrected μr Kummer term throughout. These generic targets are imported here, not replanned.

Directly needed by: [TMS.0/character-realizations](#TMS0-character-realizations), [TMS.0/stringy-invariants](#TMS0-stringy-invariants), [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants), [TMS.0/stringy-comparison](#TMS0-stringy-comparison), [TMS.2/abstract-hitchin-system](#TMS2-abstract-hitchin-system), [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair), [TMS.2/compatible-gauge-forms](#TMS2-compatible-gauge-forms), [TMS.2/twisted-integral](#TMS2-twisted-integral), [TMS.2/local-mirror-integral](#TMS2-local-mirror-integral), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes), [TMS.4/sl-pgl-dual-pair](#TMS4-sl-pgl-dual-pair), [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters), [TMS.5/sector-variation](#TMS5-sector-variation), [TMS.5/isotypic-mirror](#TMS5-isotypic-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-mhs"></a>

### G-MHS — Geometric mixed Hodge structures and local systems

Register SC-MHS in the separate HodgeStructures Part III direction and construct geometric compact-support MHS with finite-group projectors, strictness, Künneth and SNC localization. The pinned abstract MHS carrier does not supply geometric cohomology. Finite-monodromy local-system MHS must descend from its torsor cover.

Directly needed by: [TMS.0/character-realizations](#TMS0-character-realizations), [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.0/stringy-invariants](#TMS0-stringy-invariants), [TMS.0/twisted-stringy-invariants](#TMS0-twisted-stringy-invariants), [TMS.0/stringy-comparison](#TMS0-stringy-comparison), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.5/canonical-hodge-numbers](#TMS5-canonical-hodge-numbers). Downstream targets inherit this obligation through their prerequisites.

<a id="g-groth"></a>

### G-Groth — Equivariant blow-up presentation

LD.3 must supply Bittner’s characteristic-zero equivariant presentation, using actual equivariant resolution/compactification and weak factorization. Specify good finite-group actions; distinguish the scissor Grothendieck ring from its further representation quotient. The fixed χ E-map is additive, with character convolution for products, so no false ring realization closes this input.

Directly needed by: [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz), [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.0/stringy-comparison](#TMS0-stringy-comparison), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.5/main-mirror](#TMS5-main-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-ht"></a>

### G-HT — Equivariant and fractional Hodge–Tate realization

Extend CP.3 as requested, including finite-group χ-projectors, number-field specialization in the chosen complex connected component, and Ito’s generalized fractional Hodge–Tate multiplicities. Finite-denominator Tate roots use ℓ prime to the common denominator on R′[1/ℓ]. Weight overlaps justify a virtual equality and additive period calculation, not a claimed actual graded isomorphism.

Directly needed by: [TMS.0/equivariant-katz](#TMS0-equivariant-katz), [TMS.0/finite-tate-roots](#TMS0-finite-tate-roots), [TMS.0/fractional-katz](#TMS0-fractional-katz), [TMS.0/stringy-comparison](#TMS0-stringy-comparison), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.5/main-mirror](#TMS5-main-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-unitary"></a>

### G-unitary — Family comparison with unitary principal splittings

Extend HodgeStructuresPartII:H.1 to the rank-one arbitrary-degree-zero and family-coherent comparison required by Remark6.6. A fibrewise correspondence on isomorphism classes alone does not identify the splitting torsor and its Picτ action in families.

Directly needed by: [TMS.1/unitary-splitting-comparison](#TMS1-unitary-splitting-comparison). Downstream targets inherit this obligation through their prerequisites.

<a id="g-local"></a>

### G-local — Equal-characteristic local Tate duality

The checked R02.4 abelian local-duality and isogeny-index node statements are characteristic zero. The finite-field arithmetic proof spreads to k[[t]] and therefore needs their prime-to-p equal-characteristic extensions, including μr-gerbe/torsor characters. Retain this missing export instead of quietly invoking a p-adic-only theorem.

Directly needed by: [TMS.2/equal-fibre-volumes](#TMS2-equal-fibre-volumes), [TMS.2/local-mirror-integral](#TMS2-local-mirror-integral), [TMS.2/arithmetic-mirror](#TMS2-arithmetic-mirror), [TMS.2/abstract-mirror](#TMS2-abstract-mirror), [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters), [TMS.5/sector-variation](#TMS5-sector-variation), [TMS.5/isotypic-mirror](#TMS5-isotypic-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-moduli"></a>

### G-moduli — Relative Higgs geometry and abstract-system certificate

Extend the ET.2b/CB.7 carriers to the stated relative general-D stable chosen-determinant families and prove relative properness by the actual Higgs-moduli existence/properness input. Mapping-stack algebraicity and finite quotient geometry alone do not prove it. Represent the spectral norm/Prym families and verify connectedness, generic freeness and the codimension-two locus; preserve the conditions after every used base change. Nitsure/Faltings proofs have not been checked directly in this run.

Directly needed by: [TMS.3/stable-fixed-determinant](#TMS3-stable-fixed-determinant), [TMS.3/smooth-stable-moduli](#TMS3-smooth-stable-moduli), [TMS.3/proper-hitchin](#TMS3-proper-hitchin), [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.3/regular-hitchin-certificate](#TMS3-regular-hitchin-certificate), [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence). Downstream targets inherit this obligation through their prerequisites.

<a id="g-lowgenus"></a>

### G-lowgenus — Full genus range of the published main theorem

For genus one with D=ω and n>1, distinct constant generic Higgs eigenvalues force a decomposition and prevent stability, so the blanket generic smooth-spectral stable-torsor and generic-free certificates cannot be assumed. Supply separate low-genus invariant calculations, or a corrected abstract-system certificate for the actual nonempty locus, as well as the genus-zero empty cases. This gate preserves the full published target; it does not assert that mirror symmetry fails.

Directly needed by: [TMS.3/spectral-norm-fibre](#TMS3-spectral-norm-fibre), [TMS.3/pgl-prym](#TMS3-pgl-prym), [TMS.3/prym-duality](#TMS3-prym-duality), [TMS.3/regular-hitchin-certificate](#TMS3-regular-hitchin-certificate), [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus), [TMS.4/gl-degree-independence](#TMS4-gl-degree-independence), [TMS.4/sl-degree-independence](#TMS4-sl-degree-independence), [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality), [TMS.4/local-brauer-splitting](#TMS4-local-brauer-splitting), [TMS.4/sl-pgl-dual-pair](#TMS4-sl-pgl-dual-pair), [TMS.5/main-mirror](#TMS5-main-mirror), [TMS.5/canonical-hodge-numbers](#TMS5-canonical-hodge-numbers), [TMS.5/fibre-virtual-characters](#TMS5-fibre-virtual-characters), [TMS.5/sector-variation](#TMS5-sector-variation), [TMS.5/isotypic-mirror](#TMS5-isotypic-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-ht-descent"></a>

### G-HT-descent — Arithmetic descent of Hausel–Thaddeus gerbes

HT03 Propositions3.2/3.6 prove the complex torsor comparison. Construct the algebraic μn-gerbes and their coherent Γ-action/descent over the chosen arithmetic model, and prove the tensor-power/determinant dependence L′=L^a, ad≡e mod n. Check arithmetic μn-neutrality and both opposite principal-splitting torsors with the normalized Poincaré pairing. Mutatis mutandis is not used as a formal proof.

Directly needed by: [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes), [TMS.4/ht-splitting-duality](#TMS4-ht-splitting-duality), [TMS.4/local-brauer-splitting](#TMS4-local-brauer-splitting), [TMS.4/sl-pgl-dual-pair](#TMS4-sl-pgl-dual-pair), [TMS.5/main-mirror](#TMS5-main-mirror). Downstream targets inherit this obligation through their prerequisites.

<a id="g-kummer"></a>

### G-Kummer — Literal μn-neutrality stronger than the supplied Brauer proof

The published Definition6.9(d)/Lemma7.19 are worded for splitting μn-gerbes, whereas Lemma6.5 and the displayed argument establish only triviality of their Gm images. A Pic/r obstruction can remain. The sufficient local-Brauer dual-pair definition in this packet proves the invariant comparison without that stronger assertion; any claim of the literal original condition needs a separate Kummer/Picard argument.

Directly needed by: [TMS.2/dual-hitchin-pair](#TMS2-dual-hitchin-pair). Downstream targets inherit this obligation through their prerequisites.

<a id="g-higgs-purity"></a>

### G-Higgs-purity — Higgs and twisted-sector purity with Hodge realization

CB.9 must extend canonical GL purity to fixed determinant, to the stated general-D semiprojective families for degree independence, and to finite-order canonical fixed loci and their finite torsor covers. Prove compatibility with compact-support MHS and character projectors. For the canonical corollary also verify the Γ-invariant symplectic structure and integral age codim/2 so the alternating sign survives its even degree shift.

Directly needed by: [TMS.4/hodge-degree-independence](#TMS4-hodge-degree-independence), [TMS.5/canonical-hodge-numbers](#TMS5-canonical-hodge-numbers). Downstream targets inherit this obligation through their prerequisites.

<a id="g-galois"></a>

### G-Galois — Actual cohomological Galois isomorphism

Theorem7.23’s stated abstract representation isomorphism needs arithmetic semisimplicity and a valid separation of cohomological degrees, or a geometric comparison. All Frobenius power traces prove only virtual-character equality. Pure complexes need not have pure ordinary-degree stalks, and I₂ versus a nontrivial unipotent Jordan block are equal-trace pure weight-zero continuous representations with different fixed-space dimensions. This is a proof gap, not a counterexample to these particular fibres.

Directly needed by: [TMS.5/strong-fibre-isomorphism](#TMS5-strong-fibre-isomorphism). Downstream targets inherit this obligation through their prerequisites.

## Source corrections and proof qualifications

All entries concern the published 2020 version at the checksum in the bibliography. The packet records each locator, correction, reason and search provenance. E1–E20 carry the extraction’s independent confirmed verdict only as inherited provenance; that is not a review of this packet. E21–E25 came through the confirmed red-team fixes and still await their independent source-issue verdict. E26–E29 are additional findings from this design pass and await independent review. No finding is presented as a counterexample to the final mirror theorem unless its reason actually proves that.

**E1 (error), §2.5, Definition 2.16(c), p. 525.** For a fixed character the fractional count-equality relation is asserted to be independent of the compatible roots at every q. Fix the root system for prime powers. For prime q=p outside the character order, use Galois transport fixing the character values; specialize to number fields and use density-one prime residue fields in the comparison. Reason: At q=4 the two compatible systems have square roots 2 and −2. L^(1/2) and two points agree only for the first choice.

**E2 (error), §2.5, Lemma 2.17 and its proof, pp. 525–526.** One finite étale base extension and fixed ℓ-adic coefficients are claimed to give Tate roots of every denominator via logarithm and exponential. Only finitely many denominators are needed. Choose ℓ prime to their common denominator and work on R′[1/ℓ] with a sufficiently deep cyclotomic image; all denominators require varying algebraic coefficients and a different construction. Reason: Dividing a fixed logarithm by arbitrarily large powers of ℓ leaves the exponential convergence domain; a fixed finite coefficient field cannot contain all such cyclotomic roots.

**E3 (error), §3.2, Lemma 3.12 (second assertion) and Corollary 3.13, p. 534.** The torsor-gerbe Ext comparison is expressed using r-torsion Brauer groups. Use arithmetic μr-gerbe classes H²(−,μr) modulo constant classes and retain H¹(F,A∨[r]), including its Kummer contribution. Reason: For the rational 2-torsion good-reduction elliptic example over Q5 in the extraction, the Brauer quotient has order4 but H¹(F,E[2]) has order16; Pic(E)/2 accounts for the discrepancy.

**E4 (error), §6.1, (24), p. 565.** The displayed geometric Hochschild–Serre sequence starts with an injection from Br(K) and ends in zero without the necessary assumptions. Use Pic(X)→Pic(X_Ks)^GK→Br(K)→Br(X)_K→H¹(K,Pic(X_Ks))→H³(K,Gm). A point supplies the left injection; vanishing H³ supplies the right surjection. Reason: The quaternion class over R dies on its pointless Severi–Brauer conic, so the unconditional initial injection is false. The constant-Brauer argument needs only middle exactness.

**E5 (misprint), §2.5, proof of Theorem 2.15, p. 524.** The Hodge–Tate multiplicity sentence repeats the differential index q. Recover H^q(X,Ω^p) in total degree p+q. Reason: The Hodge–Tate summand of weight p is indexed by Ω^p, independently of the cohomological index q.

**E6 (misprint), §2.5, proof of Theorem 2.18, pp. 526–527.** The fractional-realization proof uses the wrong sign of the Tate twist and interchanges several Y-side indices. Use the negative Tate twist −α for L^α, and use the Y exponents β_j and varieties Y_j consistently. Reason: H²_c(A¹)=Qℓ(−1), with geometric Frobenius eigenvalue q; the positive twist would give q⁻¹.

**E7 (misprint), §2.5, proof of Theorem 2.19, pp. 527–528.** The last motivic expression in the twisted stringy comparison uses the gerbe symbol as a Lefschetz exponent. Use each inertia component’s age F(γ) as its exponent. Reason: The preceding sector expression is weighted by age; a gerbe is not a rational exponent.

**E8 (misprint), §4.1, proof of Claim 4.2, p. 538.** A local construction of a 1-gauge form gives an r-fold tensor form instead. Take the ordinary top wedge of the coordinates, then tensor it r times when comparing its norm with the r-gauge form. Reason: The proposed object has the wrong tensor degree before the norm comparison.

**E9 (misprint), §1, Definition 1.2, p. 508.** The introductory duality display labels both principal-splitting torsors with the second gerbe. The torsor of splittings over the first system uses its first gerbe. Reason: A gerbe can only be split over the space on which it is defined; Theorem7.18 fixes the indexing.

**E10 (misprint), §6.2, Definition 6.9(c), p. 569.** The principal-splitting comparison is described as equivariant for P_i rather than the opposite group. Regard Split′(M_i,α_i) and M_i′ as P_i′-torsors via P_i∨≃P_i′. Reason: Splittings form a dual-P_i torsor, and the opposite Hitchin fibre is acted on by P_i′.

**E11 (misprint), §7.1, Definition 7.1(a), p. 575.** The Higgs-bundle definition places E on the parameter base rather than the curve. E is a vector bundle on X, or on X×_S T for a T-family. Reason: Both the O_X-linear Higgs map and its twist D live on the curve.

**E12 (misprint), §7.2, Lemma 7.8(a), p. 579; proof of Lemma 7.13, pp. 582–583; proof of Theorem 7.16, p. 585.** The spectral norm fibre and two subsequent proofs use the determinant correction with inconsistent signs. Set M=det π_*O_Y and P^L=Nm⁻¹(LM⁻¹). Thus P^L·P^L′=P^(LL′M⁻¹), (P^L)^e=P^(L^eM^(1−e)), and the degree-zero correction is N=M⁻¹Q^n. Reason: By definition Nm(B)=det π_*B·M⁻¹. Fixing det π_*B=L therefore forces the inverse M, not M.

**E13 (error), §5.1, Lemma 5.1 (a), (c), (d) and the proof of (b), pp. 548–549.** A tame abelian extension is assumed to have a ramified complement for any chosen uniformizer. Enlarge by an unramified extension of suitable degree, prove invariance of the model, and choose a splitting there; define the tame character by the residue of σ(π)/π. Reason: The cyclic quartic Q5 example has inertia C2 with no complement in C4; arbitrary uniformizers can also generate an unramified factor.

**E14 (error), §4.3, Construction 4.15, p. 543.** The specialization generator is obtained from reciprocity applied directly to the chosen root of unity. Use the tame character I≃μ_e and the element corresponding to ζ^(|Γ|/e). Reason: In Q5(√5), reciprocity of −1 is trivial, although the nontrivial inertia generator is required.

**E15 (gap), §5.4, proof of Theorem 5.20 and Claim 5.21, pp. 560–561.** A cocycle computed from a splitting over the generic field is identified directly with special-fibre inertia transgression. Compare that splitting with an integral unit-valued splitting, track their coboundary, and reduce the inertia action; fix the pullback/pushforward sign. This comparison remains an open generic supplier obligation. Reason: The relevant inertia fixed locus is on the special fibre, whereas the displayed splitting lies on a freely acted-on generic fibre.

**E16 (gap), §5.5, proof of Proposition 5.25, p. 562.** The Hasse/transgression theorem is used with the admissible μ_(r|Γ|) bound, although its cited proof assumes μ_(e²). Prove the μr-transgression version under the actual μ_(re) bound and verify generator and coefficient functoriality. This is an open supplier gate. Reason: With e=4,r=2 and residue field F9, μ8 is present but μ16 is absent, so admissibility does not give the cited stronger hypothesis.

**E17 (gap), §5.3, proof of Proposition 5.18, p. 558.** A surjection between Brauer groups is declared an isomorphism after computing only the source order. Compute the target order as well: Kummer gives |H²(BI,μ_e)|=e² and |Pic(BI)/e|=e, so its e-torsion Brauer group has order e. Reason: Surjectivity from a group of order e alone does not imply injectivity.

**E18 (error), §5.3, proof of Lemma 5.14, p. 555.** The Brauer–Severi dimension is off by one and a section criterion is asserted over arbitrary bases. A degree-r Azumaya algebra gives a P^(r−1)-bundle. A section implies splitting; the converse used in this proof is valid over a field or local base, not for every scheme. Reason: End(T_P²) is split but its projective bundle has no section; the required line subbundle or quotient would force an integral zero of a second-Chern polynomial with no such zero.

**E19 (misprint), §5.4, proof of Theorem 5.20, pp. 560–561.** The Hasse comparison reverses the Bockstein direction and mixes the degrees of its cochains. Use δ[ψ mod e]=[φ] when dψ=eφ; use the degree-two integral class φ for the invariant, the degree-one cocycle c for transgression, and the corrected exponential identity. Reason: For 0→Z→Z→Z/e→0 the boundary goes from H¹(Z/e) to H²(Z).

**E20 (misprint), §5.2, proof of Lemma 5.12, p. 554.** The classifying-inertia extension sequence drops a Galois-cohomology H¹ and changes the extension group symbol. Use extensions of I and the subgroup H¹(k,Hom(I,μ_e)); evaluate at Frobenius to identify that subgroup with Z/e in the constant cyclic setting. Reason: The preceding group-cohomology formula has an H¹ term, not just the coefficient Hom group.

**E21 (error), Published Invent.math.221(2020), Lemma2.7(a), pp516–517; proof of Lemma2.9 pp520–521.** Gerbe descent over an action is modeled by ordinary central extensions without retaining the base action. Use the action groupoid with pullback-twisted torsor multiplication and equivariant band. Ordinary central extensions require trivial base and band actions. Reason: A free C2 action on two points has vanishing equivariant H² for its permutation module, unlike the four classes predicted by independent ordinary extensions over the two points.

**E22 (error), Published Invent.math.221(2020), Lemma2.7(c), (4), pp516–517.** A geometric extension group is used in an arithmetic exact sequence without descent invariants or an obstruction. Restrict the split cyclic formula to constant finite étale coefficients and trivial actions; for a general band include invariant geometric classes and their descent obstruction. Reason: Over R with Γ=C3 and A=μ3, conjugation inverts the nonzero geometric extension classes, which therefore do not descend.

**E23 (error), Published Invent.math.221(2020), Definition2.14(b), p523.** The pointwise stack trace sum omits the reciprocal stabilizer order. Sum over all rational torsor classes with each trace divided by |Aut(x)|. Reason: BC2 over F3 has two torsors of automorphism order2 and mass1. The sign-action A¹ quotient has mass3, not4.

**E24 (error), Published Invent.math.221(2020), Lemma3.7, p531.** The complementary factor of the local pairing is claimed to be isotropic without extra hypotheses. Retain the proved unramified annihilator and mixed evaluation; a full second-factor block requires its diagonal correction or additional assumptions. Reason: For Q3 the complementary Kummer class −3 has nontrivial self-pairing, of invariant1/2. This leaves the mixed evaluation used for sector variation intact.

**E25 (gap), Published Invent.math.221(2020), Proof of Theorem7.23, p589.** Purity and point-count equality are used to assert an actual fibrewise representation isomorphism. Keep the all-powers trace and virtual-character consequence. Prove semisimplicity and degree separation, or a geometric comparison, before asserting the stronger isomorphism. Reason: I₂ and a unipotent Jordan block are pure weight0 with equal traces of all powers and different invariant dimensions; proper pure complexes also need not have pure ordinary-degree stalks.

**E26 (gap), Published §6.2 Definition6.9(d), p.569, and §7.4 Lemma7.19 proof, p.587.** The local condition asks for splitting the μn-gerbes, but the proof concludes by applying the constant-Brauer lemma and vanishing of Br(O_F). Use the sufficient forward condition that both fibre points imply neutrality of the induced Gm-gerbes; this is enough for the mirror integral. Proving the literal μn condition also requires vanishing of its Pic/n Kummer obstruction. Reason: The kernel of H²(X,μn)→Br(X)[n] is Pic(X)/n. A root gerbe of O(1) on P¹ has zero Brauer image but no μn-neutralization, so the logical passage is not automatic. This example checks the inference rather than refuting these special Higgs gerbes.

**E27 (misprint), Published §7.1 Remark7.2, p.576.** The rigidifying subgroup for the stable chosen-determinant stack is called Gm. Use μn when the determinant isomorphism is part of the object; Gm applies to the GL stable stack before fixing that isomorphism. Reason: A scalar λ preserves det(E)≃L exactly when λ^n=1, so Gm is not a subgroup of the fixed-determinant automorphism group.

**E28 (misprint), Published §7.1 Lemma7.3 proof, p.576.** The displayed deformation complex is placed in degrees −1,0 while its automorphisms, tangent and obstruction spaces are labeled H⁰,H¹,H². Place End⁰(E)→End⁰(E)⊗D in degrees0,1 for those labels, or shift every cohomology label when using degrees−1,0. Reason: A shift changes all hypercohomology indices by one; the written placement and the written deformation labels cannot both hold.

**E29 (gap), Published §7.2 Propositions7.11–7.12 and proofs, pp.580–582; application in Proposition7.20, p.588.** The generic smooth spectral torsor/admissibility argument is used in the full genus range without isolating the degree-zero elliptic case. Check the full abstract-system conditions on the actual nonempty stable locus and supply separate low-genus calculations where that argument does not apply. Keep the main theorem’s stated range as a target. Reason: For g=1,D=ω≃O,n>1, a trace-free Higgs field with distinct constant eigenvalues decomposes E by polynomial projectors; each summand is Higgs-invariant, so stability is impossible. Smoothness of this disconnected spectral cover alone cannot give a nonempty stable torsor or a generically free Γ action. This does not contradict the final invariant equality.

All 29 findings were independently confirmed at their published-PDF locators in REV-DESIGN-TopologicalMirrorSymmetryForHitchinSystems. Gap verdicts identify an unsupported inference; they do not assert that the geometric conclusion is false. The additional findings were also checked against the published PDF during design. A bounded correction search on 19 October 2026 opened the publisher article record and arXiv version history and searched the paper title with correction/erratum and the authors with mirror/erratum. It returned no correction for these points. This does not establish that no correction exists. The inherited entries retain their earlier search provenance in the packet; no author was contacted.

## Suggested forms and acceptance

The [Suggested file](../suggested/TopologicalMirrorSymmetryForHitchinSystems.lean) uses only carriers at the pins. Its real-bodied light definitions and its example signatures pin the numeric/algebraic conventions; it develops no geometric theory. Every geometric definition, full API, theorem and discriminating check remains specified above.

| Suggested form | Reader targets represented | Exact limit |
|---|---|---|
| `TauCeti.HitchinMirror.CompatibleRoots` | [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz) | The exact root-compatibility predicate on nonzero complex numbers indexed by positive naturals; finite refinement and q=4 checks. |
| `TauCeti.HitchinMirror.stabilizerWeightedSum` | [TMS.0/character-realizations](#TMS0-character-realizations) | Only the finite numerical weighted sum, with positive stabilizer orders. The geometric cohomology, local systems and stack trace formula are reader targets. |
| `TauCeti.HitchinMirror.determinantPowerLabel` | [TMS.3/spectral-torsor-calculus](#TMS3-spectral-torsor-calculus) | The group-theoretic determinant-label formula L^e M^(1−e), not a spectral Picard carrier. |
| `TauCeti.HitchinMirror.quotientKernelOrder and admissibilityRootOrder` | [TMS.3/pgl-quotient](#TMS3-pgl-quotient), [TMS.4/hausel-thaddeus-gerbes](#TMS4-hausel-thaddeus-gerbes) | Numerical normalization n^(2g) and n^(2g+1), not a quotient-stack construction. |
| `Existing TauCeti Tate/character orthogonality checks` | [TMS.0/fractional-lefschetz](#TMS0-fractional-lefschetz), [TMS.5/isotypic-mirror](#TMS5-isotypic-mirror) | Use actual pinned Hodge structures and the generic finite Fourier theorem without restating the latter. |
| `Matrix trace and fixed-vector regression examples` | [TMS.5/strong-fibre-isomorphism](#TMS5-strong-fibre-isomorphism) | Explicit 2×2 identity/Jordan matrices; equal power traces do not imply isomorphic actions. |

- TMS.0: Geometric cohomology/MHS, equivariant Grothendieck varieties, lisse sheaves, ages, inertia and transgression are not the pinned numerical carriers; the exact reader targets and G-MHS/G-Groth/G-HT/G-ETII contracts specify their construction.
- TMS.1, TMS.2: Relative gerbe/neutralization/Picard stacks, smooth group-scheme torsors, admissible quotient-stack measures and local Tate integration are supplier geometry, not statable through the small suggested definitions.
- TMS.3, TMS.4: The pinned library has vector bundles and an abelian-variety carrier, but not the stable Higgs, relative spectral Prym and arithmetic gerbe constructions in these targets. The reader is definitive for every missing definition and theorem.
- TMS.5: The full mirror and sector identities require those geometric carriers. Their actual hypotheses and open gates are written in the reader; only the existing Fourier input and explicit arithmetic/regression forms are suggested.

The formalisation acceptance conditions are the individual Checks, the definition tests, exact supplier contracts, consistent root/age/character conventions and closure of every named gap. In particular neither a point of Split′ nor equality of alternating traces can be promoted to its stronger target without the extra argument written above. Packet validation and the pinned Suggested elaboration are recorded in the handoff; they check the design artefacts and the small signatures, not the unimplemented geometric theorems.

## Sources and reading record

- **GWZ20.** Michael Groechenig; Dimitri Wyss; Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*. Inventiones mathematicae 221 (2020), 505–596; published version, DOI 10.1007/s00222-020-00957-8 [Public text](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf). Accessed 2026-10-19. SHA-256 `f2231145778b0a3fb57ce241ce0014fc4299f0de536d3e19daf4206d146c3e07`.

  Read: Definitions 2.2–2.4, pp.512–514; Definitions 2.12–2.16 and Theorems 2.15, 2.18–2.19, pp.521–528; Corollary 5.29, p.564; §6, pp.565–575; §7, pp.575–594, including the proofs and torsor normalizations; §5.4–5.5, Claim5.21/Proposition5.25 and the generic-to-special comparison, pp.560–563; read to retain the inherited E15/E16 gates.

- **HT03.** Tamás Hausel; Michael Thaddeus, *Mirror symmetry, Langlands duality, and the Hitchin system*. arXiv math/0205236v1, 23 May 2002; published Invent. Math.153 (2003),197–229. Locators below use numbered preprint pages. [Public text](https://arxiv.org/pdf/math/0205236v1). Accessed 2026-10-19. SHA-256 `aac3a1aad8513b1fc867b2d2619263e06cbfce3505b1418cc8f3c2283cb42d69`.

  Read: §3, numbered pp.8–13, especially Propositions 3.2 and 3.6 and their proofs; §6, numbered pp.17–18, including Theorems 6.1–6.4.

- **ITO04.** Tetsushi Ito, *Stringy Hodge numbers and p-adic Hodge theory*. arXiv math/0211378v3, 31 July 2003; published Compos. Math.140 (2004),1499–1517. Locators use numbered preprint pages. [Public text](https://arxiv.org/pdf/math/0211378v3). Accessed 2026-10-19. SHA-256 `a6c29d80b7d7321f8baa49298ff30c496a86661ac84e64fff735c683336a3a0b`.

  Read: §4, Remark 4.2 and Lemma 4.3, pp.12–13; §5.1–5.3, Proposition 5.1, Definitions 5.2–5.3, Remark 5.4 and Example 5.5, pp.13–16.

- **BITTNER04.** Franziska Bittner, *The universal Euler characteristic for varieties of characteristic zero*. arXiv math/0111062v1, 6 November 2001; published Compos. Math.140 (2004),1011–1032. Locator uses numbered preprint page. [Public text](https://arxiv.org/pdf/math/0111062v1). Accessed 2026-10-19. SHA-256 `484d2c3586977503dc6f1b43fca158af059cd0f9c5322731d0ebae6d643e160c`.

  Read: §7, Lemma 7.1, numbered p.18, including the equivariant blow-up presentation and proof; distinction between the scissor ring and its further representation quotient.

The source locators above are theorem/definition/section and page locators, not reproduced passages. HT03, Ito and Bittner locators use their explicitly named preprint versions and numbered preprint pages. The versioned HT03, Ito and Bittner URLs identify the exact preprint files read in this run. Generic Nitsure/Faltings moduli properness and Ngô regular-centralizer/codimension proofs were not checked directly: G-moduli and G-lowgenus retain those obligations, and the packet does not claim primary-proof closure for them.

The routed-item ledger in the packet maps each of the 36 extraction IDs to its target node or nodes. The stronger Theorem7.23 target is included with its gap, so an unresolved theorem is never lost by replacing it with the weaker justified consequence.
