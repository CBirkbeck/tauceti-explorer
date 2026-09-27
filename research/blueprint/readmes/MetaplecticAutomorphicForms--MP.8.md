# MP.8 — Genus-two Fourier indices and the BFH theta expansion

This partial blueprint supplies the integral arithmetic inside the theta expansion
of genus-two Jacobi forms in Bump, Friedberg and Hoffstein,
[Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf),
Inventiones mathematicae 102 (1990), 543–618, DOI
[10.1007/BF01233440](https://link.springer.com/article/10.1007/BF01233440).
It gives two constructions, five lemmas and two theorems. Their dependency graph
ends in checked Mathlib declarations and elementary integer algebra. The complete
MP.8 target remains open: the actual double cover, Jacobi forms, analytic theta
expansion, genuine Eisenstein kernels and their continuation still require the
specific work described below. No analytic object is represented by an opaque
placeholder in this component.

The source passage is Proposition 2.2, particularly equations (2.9) and (2.10).
An elliptic translation changes a Fourier index (T,R), where T is half-integral
symmetric and R is an integral vector. The transformation preserves a symmetric
matrix and the residue class of R. Conversely, equality of those invariants gives
exactly one translation parameter. This arithmetic permits the analytic Fourier
coefficients, once their translation invariance has been proved, to be indexed
by a discriminant matrix and a residue class in the theta expansion.

The published scan was read at printed pages 543–557 and 613–618, including all
of §§1–2 and §9. The intervening pages 558–612 are unread. The beginning of §3
and the end of §8 are therefore boundary passages, not verified substitutes for
the intervening analysis. This is a bounded component, not a source-complete
extraction of the paper or a completed proof plan for its nonvanishing theorem.
The separate BFH paper in Annals of Mathematics 131 (1990), 53–127, has a different
title and was not read for this component.

## Native objects and conventions

Let V=Z² with basis e₀,e₁, and use column vectors. For R,x∈V write
R·x=R₀x₀+R₁x₁. A Fourier datum is the ordinary pair p=(Q,R), with Q a native
Z-valued quadratic form on V and R∈V. Mathlib already provides this type as
`QuadraticForm`, the scalar-valued specialization of `QuadraticMap`.
There is no new Fourier-index structure, positivity predicate or matrix-parity
wrapper. Native equality of forms is equality of all their values.

To relate this convention to the source, write

\[
Q(x)=A x_0^2+B x_0x_1+C x_1^2,
\qquad
T=\begin{pmatrix}A&B/2\\B/2&C\end{pmatrix}.
\]

Here A,B,C are integers, T is a rational symmetric matrix with integral diagonal
and half-integral off-diagonal entries, and Q(x)=xᵀTx. The native ordered-basis
expansion gives A=Q(e₀), C=Q(e₁), and
B=Q(e₀+e₁)−Q(e₀)−Q(e₁). This remains valid without making 2 invertible in Z.
`QuadraticMap.toBilin` supplies an upper-triangular bilinear representative whose
quadratic map is Q. A symmetric representative over Q divides the mixed
coefficient by 2; confusing that representative with the triangular integral
one would double the mixed term. The operational component stays in integral
quadratic forms. A reusable formal interface to the source's half-integral matrix
Fourier extraction remains part of the analytic completion work.

In particular, the integral form x₀x₁ is allowed. Its symmetric matrix has
entries 1/2 away from the diagonal, so a definition requiring an integral
symmetric matrix T would discard legitimate Fourier indices. No positive
semidefiniteness or cusp-support restriction is imposed on the raw data. Those
are statements about actual forms and their Fourier coefficients, not conditions
on the underlying index type.

Let a,c be integers. The two constructions are defined for all such a,c; the
classification results require only a≠0. In the source application N and m are
positive, N divides m and 4m divides N². The paper also chooses N divisible by 8,
by the original level M, and by the primes needed for its local conditions.
Set a=m/N. For the two cusp normalizations j=0,1, set c=N^(1−j), meaning c=N
when j=0 and c=1 when j=1. These are integer choices; the suggested signatures
use a and c directly instead of introducing division or negative powers on Z.

The source translation vector is λ∈N^(−j)Z². Put ℓ=N^jλ∈Z². Equation (2.9)
then becomes

\[
R'=R-2a\ell,\qquad
T'=T-\frac c2(R\ell^{\mathsf T}+\ell R^{\mathsf T})
       +ac\ell\ell^{\mathsf T}.
\]

Evaluating this identity on x gives the integral quadratic-form transformation

\[
Q'(x)=Q(x)+c\bigl(a(\ell\cdot x)^2-(R\cdot x)(\ell\cdot x)\bigr).
\]

The factor c is essential. It changes at the second cusp even though the residue
modulus 2a is unchanged. The arithmetic proofs make no use of 4m dividing N²;
that condition enters the source's analytic transformation and congruence
properties. Consequently it is not inserted into this component's generic
statements.

Define the discriminant **quadratic form**

\[
\Delta_{a,c}(Q,R)(x)=4aQ(x)-c(R\cdot x)^2.
\]

The term discriminant here denotes the whole quadratic form, not its determinant
and not the scalar discriminant B²−4AC of a binary polynomial. Its symmetric
matrix is 4aT−cRRᵀ, which has integral entries. The matrix used in BFH (2.10) is

\[
U=4mT-N^{2-j}RR^{\mathsf T}=N\,\operatorname{matrix}(\Delta_{a,c}(Q,R)).
\]

The factor N must be retained when converting to the Fourier exponential
tr(UZ)/(4mN^j) in (2.5). Discriminant equality is independent of this nonzero
scale, but an actual coefficient formula or exponential is not.

## The arithmetic declaration graph

The proposed namespace is `TauCeti.Jacobi.GenusTwo`, in the proposed module
`TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`. Write S for `fourierShift`
and Δ for `fourierDiscriminant`. Every statement below uses the native pair
(Q,R), the fixed rank-two lattice and the conventions just given. The proof
steps use the constructions directly. The convenience API items are not hidden
unlisted proof dependencies.

### Integral genus-two Fourier-index shift

`MetaplecticAutomorphicForms:MP.8/fourier-shift` — `TauCeti.Jacobi.GenusTwo.fourierShift`

For ℓ∈V and p=(Q,R), S_{a,c,ℓ}(p)=(Q′,R′), where R′=R−2aℓ and Q′(x)=Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)). This is a pair of a native integral quadratic form and an integral vector, for all integers a,c. Construct the new form using products of the native linear functionals x↦ℓ·x and x↦R·x, addition and integer scalar multiplication.

Proof or construction:

1. Use dotProductBilin to obtain the two linear forms. Use QuadraticMap.linMulLin twice to obtain their square and product; combine them with Q using the existing Z-module operations on quadratic maps.
2. Pair that quadratic form with R−2aℓ. No half-integer division occurs in the native type. The BFH matrix expression follows by evaluating the associated polynomial: its symmetric cross term has coefficient −c/2.

Dependencies: `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`.

Its uses are:

- **BFH Proposition 2.2, (2.9)–(2.10).** Express the elliptic-translation orbit of the Fourier index in integral coordinates.
- **BFH (2.5)–(2.6), pp.552–554.** Move an integral vector R to a prescribed lift ν of its residue class when defining C_j(g;U,ν). The analytic equality of coefficients is a separate obligation.
- **RankZeroOneBSD:BSD.2, through MetaplecticAutomorphicForms:MP.8.** Supply the indexing arithmetic used before actual genus-two Fourier coefficients enter the twist-series comparison; no nonvanishing is deduced from it.

The API is:

- `TauCeti.Jacobi.GenusTwo.fourierShift_fst_apply` (compatibility): For x∈V, the first projection evaluates to Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)); this is an equality in Z with the native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierShift_snd` (projection): The vector projection is R−2aℓ.
- `TauCeti.Jacobi.GenusTwo.fourierShift_zero` (simp): S_{a,c,0}(p)=p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_add` (functoriality): S_{a,c,ℓ+k}(p)=S_{a,c,k}(S_{a,c,ℓ}(p)) for all ℓ,k,p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_neg` (relation): S_{a,c,−ℓ}(S_{a,c,ℓ}(p))=p, including a=0 and c=0.

Definition tests:

- `TauCeti.Jacobi.GenusTwo.fourierShift_zero_data` (computation): For a=1,c=8, p=(0,0) and ℓ=e₀, the output is (8x₀²,−2e₀), with x₀² the native coordinate quadratic form.
- `TauCeti.Jacobi.GenusTwo.fourierShift_other_cusp` (compatibility): For a=1,c=1 and the same zero data and shift, the output is (x₀²,−2e₀). This detects using c=N at both cusps.
- `TauCeti.Jacobi.GenusTwo.fourierShift_mixed_term` (computation): For a=c=1, Q=x₀x₁, R=e₀ and ℓ=e₁, the output is (x₁²,e₀−2e₁). Here Q has symmetric matrix off-diagonal entries 1/2, not 1.

Acceptance:

- The output remains integral for odd mixed coefficients and arbitrary c.
- Changing from j=0 to j=1 changes c from N to 1; it does not change the modulus 2a.
- For c=0 the quadratic part is fixed, but the vector still changes by −2aℓ.

Source: BFH, (2.9), printed p.552; lattice parameter in the proof on p.553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Discriminant quadratic form of a Fourier index

`MetaplecticAutomorphicForms:MP.8/fourier-discriminant` — `TauCeti.Jacobi.GenusTwo.fourierDiscriminant`

Define Δ_{a,c}(Q,R)=4aQ−c(R·−)² as a native integral quadratic form on V. The invariant is the entire quadratic form, not its determinant. Under BFH a=m/N, c=N^(1−j), its symmetric matrix is 4aT−cRRᵀ; multiplying that matrix by N gives exactly U=4mT−N^(2−j)RRᵀ in (2.10).

Proof or construction:

1. Construct (R·−) with dotProductBilin and its square with QuadraticMap.linMulLin; combine with Q by the native quadratic-map module operations.
2. The BFH relation U=N·matrix(Δ) is an algebraic substitution. Native integral quadratic forms are represented by half-integral symmetric matrices, by the ordered-basis expansion; the particular Δ matrix has integral entries.

Dependencies: `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`, `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`.

Its uses are:

- **BFH (2.10), printed p.553.** Classify exactly the integral translation orbits together with the vector residue class.
- **BFH Proposition 2.2, (2.5)–(2.6).** Index theta-expansion coefficients by U and ν without losing the level factor N.
- **BFH Corollary 2.8 and RankZeroOneBSD:BSD.2.** Provide the matrix-valued indexing convention before specialized scalar discriminants and twist coefficients are extracted.

The API is:

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_apply` (compatibility): Δ_{a,c}(Q,R)(x)=4aQ(x)−c(R·x)² as an equality in Z under native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero` (simp): Δ_{a,c}(0,0)=0 for all integers a,c.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_vector` (compatibility): Δ_{a,c}(Q,0)=4a·Q in the native Z-module of quadratic forms.

Definition tests:

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_mixed` (computation): For a=c=1,Q=x₀x₁,R=0 and x=e₀+e₁, Δ(Q,R)(x)=4.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_negative` (non-example): For a=1,c=8,Q=0,R=e₀, Δ(Q,R)(e₀)=−8; positive definiteness is not part of the index type.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_index` (degenerate): At a=0,c=1, Δ(x₀²,0)=Δ(0,0); this boundary case is excluded from orbit classification by a≠0.

Acceptance:

- The factor is 4a, not 2a; it retains mixed coefficients of a half-integral symmetric index.
- Δ is allowed to be zero, degenerate or negative on nonzero vectors.
- For N≠0, equality of the BFH matrices U is equivalent to equality of the corresponding Δ forms, by cancellation and quadratic-form extensionality.

Source: BFH, (2.6), p.552, and (2.10), p.553. The source uses the integral symmetric matrix U. The native quadratic-form invariant is U/N, with the level factor kept explicit; the definitions are identified through the polynomial Q(x)=xᵀTx.

### Discriminant invariance under an integral shift

`MetaplecticAutomorphicForms:MP.8/discriminant-shift` — `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_shift`

For every a,c∈Z, ℓ∈V and p, Δ_{a,c}(S_{a,c,ℓ}(p))=Δ_{a,c}(p).

Proof or construction:

1. Unfold the two constructions and evaluate on x using native product-linear-form evaluation. Set r=R·x and t=ℓ·x.
2. Expand 4a[Q(x)+c(at²−rt)]−c(r−2at)². The cross and square terms cancel, leaving 4aQ(x)−cr². Use QuadraticMap.ext to conclude.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `mathlib:QuadraticMap.linMulLin_apply`, `mathlib:QuadraticMap.ext`.

Acceptance:

- The identity holds at a=0, c=0 and negative a,c; no cancellation by a is used.
- For p=(0,0),a=1,c=8,ℓ=e₀ the shifted data (8x₀²,−2e₀) still have zero discriminant.
- Changing only the sign of the cross term in the shift destroys the cancellation.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Residue invariance of the vector index

`MetaplecticAutomorphicForms:MP.8/residue-shift` — `TauCeti.Jacobi.GenusTwo.fourierShift_modEq`

For all a,c∈Z, p, ℓ and i∈{0,1}, the vector coordinate of S_{a,c,ℓ}(p) is congruent to R_i modulo 2a.

Proof or construction:

1. Unfold the vector projection. The difference R_i−(R_i−2aℓ_i)=2aℓ_i is divisible by 2a.
2. Apply Int.modEq_iff_dvd. This argument also works at a=0, when congruence modulo zero means equality.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `mathlib:Int.ModEq`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- At a=2, shifting R by any ℓ changes each coordinate by a multiple of 4.
- At a=0 every vector index stays unchanged.
- The modulus is 2m/N at both cusps, rather than 2m.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Recovery from a discriminant and fixed vector

`MetaplecticAutomorphicForms:MP.8/recover-quadratic` — `TauCeti.Jacobi.GenusTwo.eq_of_fourierDiscriminant_eq`

Assume a≠0. If p=(Q,R) and q=(Q′,R′) satisfy R=R′ and Δ_{a,c}(p)=Δ_{a,c}(q), then p=q.

Proof or construction:

1. Evaluate the discriminant equality at arbitrary x with QuadraticMap.congr_fun and substitute R=R′. Cancel the identical square term by integer addition.
2. This leaves 4aQ(x)=4aQ′(x). Since 4a≠0 in Z, apply mul_left_cancel₀.
3. Use QuadraticMap.ext and equality of the vector components to conclude equality of pairs.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `mathlib:QuadraticMap.congr_fun`, `mathlib:QuadraticMap.ext`, `mathlib:mul_left_cancel₀`.

Acceptance:

- At a=0, p=(0,0) and q=(x₀²,0) have equal discriminants and vectors but are different pairs.
- No condition on c is needed, including c=0.
- Equality of determinants of Δ is not enough: when R=0,a=1, Q=x₀² and Q′=x₁² have equal zero determinants but are different forms.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Uniqueness of the integral shift parameter

`MetaplecticAutomorphicForms:MP.8/shift-parameter-injective` — `TauCeti.Jacobi.GenusTwo.fourierShift_injective`

Assume a≠0. For a fixed p, the map ℓ↦S_{a,c,ℓ}(p) is injective.

Proof or construction:

1. Equality of shifted pairs implies equality of vector projections. Cancel R coordinatewise to obtain 2aℓ_i=2ak_i.
2. Since 2a≠0, use mul_left_cancel₀ in each coordinate and function extensionality. The quadratic component is not needed.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `mathlib:mul_left_cancel₀`.

Acceptance:

- For p=(0,0),a=0 all shifts give p, showing why nonzero a is required.
- The result includes c=0, when only the vector part detects the shift.
- For a=1, vector −2e₀ can be reached from 0 only by ℓ=e₀.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Classification of genus-two Fourier-index orbits

`MetaplecticAutomorphicForms:MP.8/orbit-classification` — `TauCeti.Jacobi.GenusTwo.exists_fourierShift_iff`

Assume a≠0. For p=(Q,R) and q=(Q′,R′), there exists ℓ∈V with S_{a,c,ℓ}(p)=q if and only if Δ_{a,c}(p)=Δ_{a,c}(q) and R_i≡R′_i modulo 2a for both coordinates.

Proof or construction:

1. Forward: discriminant-shift and residue-shift give the two invariants, after replacing the shifted pair by q and reversing equalities/congruences as needed.
2. Reverse: use Int.modEq_iff_dvd to choose t_i with R′_i−R_i=2at_i and put ℓ_i=−t_i. Then the shifted pair p₁ has vector R′.
3. Discriminant-shift and the assumed equality give Δ(p₁)=Δ(q). Apply recover-quadratic to p₁ and q. No analytic Fourier expansion, division in Z, or representative selection beyond the two divisibility witnesses is needed.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/discriminant-shift`, `MetaplecticAutomorphicForms:MP.8/residue-shift`, `MetaplecticAutomorphicForms:MP.8/recover-quadratic`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- Equal residues alone fail for p=(0,0),q=(x₀²,0),a=c=1.
- Equal discriminants alone fail for p=(0,e₀),q=(0,−e₀),a=2,c=1: their vector residues modulo 4 differ.
- At a=0,c=1, the distinct pairs (0,0) and (x₀²,0) satisfy both invariant conditions but are not shift-equivalent.
- Substituting the two BFH cusp scalings gives exactly (2.10) with U=N·matrix(Δ).

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Unique Fourier index with a prescribed residue lift

`MetaplecticAutomorphicForms:MP.8/unique-residue-lift` — `TauCeti.Jacobi.GenusTwo.existsUnique_fourierRepresentative`

Assume a≠0. Given p=(Q,R) and ν∈V with ν_i≡R_i modulo 2a, there exists exactly one integral quadratic form Q_ν such that Δ_{a,c}(Q_ν,ν)=Δ_{a,c}(p).

Proof or construction:

1. Use Int.modEq_iff_dvd to choose ℓ with R−2aℓ=ν. Take Q_ν to be the quadratic component of S_{a,c,ℓ}(p).
2. Discriminant-shift proves the required equality. For two candidates, recover-quadratic applies because both vector components equal ν; their quadratic components are equal.
3. The theorem prescribes an arbitrary lift ν. It neither selects a canonical residue representative nor asserts that every arbitrary pair (Δ,ν) is represented by an integral Fourier index.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/discriminant-shift`, `MetaplecticAutomorphicForms:MP.8/recover-quadratic`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- For p=(0,0),a=1,c=8 and ν=−2e₀, the unique form is 8x₀².
- For ν=R the unique form is Q.
- At a=0 the pair p=(0,0),ν=0 admits every integral quadratic form and uniqueness fails.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Coefficient equality from shift invariance

`MetaplecticAutomorphicForms:MP.8/coefficient-invariants` — `TauCeti.Jacobi.GenusTwo.coefficient_eq_of_fourierInvariants`

Assume a≠0. Let A be any type and B a function from the native Fourier data pairs to A. Assume explicitly B(S_{a,c,ℓ}(p))=B(p) for every ℓ,p. If p and q have equal discriminant forms and coordinatewise congruent vector indices modulo 2a, then B(p)=B(q).

Proof or construction:

1. Use orbit-classification to choose ℓ with S_{a,c,ℓ}(p)=q.
2. Substitute that equality into the assumed shift-invariance identity. Symmetry gives B(p)=B(q). The codomain needs no linear, topological or analytic structure.

Dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/orbit-classification`.

Acceptance:

- A constant function satisfies the premise for every codomain with a chosen value.
- Taking B(p)=R₀ violates shift invariance at a≠0 and cannot be used as an actual invariant coefficient.
- This lemma does not establish BFH (2.9) for the analytic coefficient B_j: that premise requires its holomorphy and contour-translation argument.

Source: BFH, Proposition 2.2 proof, (2.9)–(2.10) and the paragraph defining C_j, pp.552–553. Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

## Proof checks and use of the API

The discriminant calculation is a polynomial identity. Put r=R·x and t=ℓ·x.
Then the additional terms from 4aQ′ are 4a²ct²−4acrt, while expanding
−c(r−2at)² adds −cr²+4acrt−4a²ct². The cross terms and square terms cancel.
This check detects both a sign error in the translation and an incorrect factor
2 in the discriminant. The zero and negative values of a,c also satisfy it.

The composition API follows from the same elementary expansion. Applying ℓ and
then k changes the vector to R−2a(ℓ+k). In the quadratic component the second
step uses R−2aℓ, so it contributes the cross term 2ac(ℓ·x)(k·x) required by
(ℓ+k)·x squared. Thus the order in the displayed composition law is explicit.
Putting k=−ℓ gives the inverse law, and ℓ=0 gives the identity law. This is the
translation action on index data; it does not construct the Heisenberg group or
its central character.

For the reverse orbit implication, congruence produces integral witnesses:
R′_i−R_i=2at_i. Taking ℓ_i=−t_i fixes the sign in the shift. No division in Z
is used. Once R′ is fixed, the common discriminant gives 4aQ′=4aQ″ at every
vector. The nonzero factor 4a can be cancelled in Z, and native extensionality
finishes. This is why nonzero a, rather than positivity or invertibility in Z,
is the correct hypothesis.

The six definition tests occur as examples in the suggested file, together with
four additional acceptance examples: the identity at a=−1,c=0; equal residues
without equal discriminants; failure of classification at a=0; and equal
discriminants with different residues modulo 4. Their statements elaborate
against the pinned libraries. They have proof placeholders and establish no
formal implementation. The two constructions themselves use native operations
in their signatures and bodies; the file does not define dummy analytic objects.

A chosen ν represents a residue class but is not a canonical choice of one.
The unique-representative theorem assumes an original integral datum p and a
congruent ν. It must not be read as asserting that every arbitrary pair of a
quadratic form Δ and a vector ν comes from an integral Fourier index. Solving
Q=(Δ+c(ν·−)²)/(4a) without the existence input can produce nonintegral
coefficients. Nor does uniqueness of Q remove the need to prove analytic
coefficient invariance when replacing R by ν.

## The analytic interface and ownership

In BFH, φ₀ is a genus-two Jacobi modular form and φ₁ is its transform by J.
The source writes Z=X+iY in the Siegel upper half-space H₂, W∈C², and uses
the exponential e(z)=exp(2πiz). Its theta series of positive integer index a is

\[
\theta^a_\nu(Z,W)=\sum_{R\equiv\nu\ (2a)}
  e\left(\frac{Z[R]}{4a}+R^{\mathsf T}W\right).
\]

The arguments appearing in the two theta expansions are
(N^(1−2j)Z_g,N^(1−j)W). Its theta coefficients E_j are indexed by the finite
vector residues ν modulo 2a, and their Fourier expansion uses the symmetric
matrices U above. The actual B_j coefficients are defined by the normalized
integral (2.3), over the real symmetric-matrix torus and the real vector torus.
A plan for that definition must pin its Haar measure and the factor N^(−3j).

Equation (2.9) is not solely an algebraic consequence of relabeling a series.
The proof changes W by a complex quantity involving Z_gλ; it invokes holomorphy
in W to justify moving the integration path. Normal convergence, Fourier
extraction and periodicity must be established before making this step. The
last lemma in this component explicitly assumes the resulting shift invariance
of B. It proves the algebraic consequence needed to make C_j(g;U,ν) independent
of the chosen representative. It does not discharge that analytic premise.

Proposition 2.1 gives Gaussian orthogonality of the theta functions on the
complex torus; BFH omits the proof and points to Eichler–Zagier Theorem 5.3.
The proof of Proposition 2.2 also needs Poisson transformation, justified sum
regrouping and independence of theta components. Its square root of −det(Z)
is normalized to be positive when Z is purely imaginary. Propositions 2.3–2.7
then add upper and lower unipotent and GL₂ transformation properties, including
finite-character orthogonality and the level congruences. These are exact
continuation obligations, not consequences of the finite index calculation.

The reviewed AUDIT-15 MP.8 entry was read before planning. Mathlib's
`Matrix.symplecticGroup` exists, with its AJAᵀ convention, and
`SemidirectProduct` already provides the generic construction from a specified
action homomorphism. Neither supplies the positive-similitude group, the BFH
double cover, or the required Heisenberg action. MP.0 owns the underlying
Heisenberg group, its symplectic action, polarizations and Haar normalization.
MP.7 owns the rank-one metaplectic comparison and kernels. MP.8 must build the
actual genus-two extension and prove all compatibility maps it uses. In
particular, the symplectic matrix convention must be compared with BFH's
transposed convention rather than silently identified.

The existing QSeriesPartitionsAndMockModularForms packet already plans the
QM.1 rank-one Jacobi form, its Fourier coefficient, coefficient-discriminant
invariance, theta decomposition and Weil transformation. Those five nodes were
read with their hypotheses, proof steps, prerequisites and sources. They concern
H×C and the scalar discriminant 4mn−r². The four requests to the metaplectic
roadmap in that packet name MP.7. This component concerns H₂×C² and a symmetric
matrix invariant. It does not create replacements for the rank-one nodes.
The rescope proposal makes this ownership distinction explicit while retaining
the MP.8 export to QM.1 for the genuine genus-two comparison; it introduces no
reverse dependency cycle.

All eighteen baseline declarations were checked in the pinned source trees:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The source files behind the 1,791
Mathlib imports reached by the suggested file were verified against the pin and
the local compiled-cache source bytes. No Tau Ceti import is needed for the
finite arithmetic component. Searches covered both libraries; no claim that an
object is absent rests only on the reviewed audit or on a guessed name.

The two external requests concern completion of MP.8 itself:

- **`AutomorphicSpectralTheory:AS.1`.** Supply precisely stated convergence, locally uniform differentiated-growth bounds and constant-term decomposition for the normalized linear-group induced families, including the positive chamber and measures. MP.8 must construct its genuine genus-two sections and prove a cover-specific reduction before using any such estimate. This request does not claim that the linear-group Eisenstein theorem already applies to the BFH double cover.
- **`AutomorphicSpectralTheory:AS.2`.** Supply the meromorphic operator identities for standard linear-group intertwining integrals, their source/target induced spaces, normalizing factors and singular hyperplanes. MP.8 owns the proof adapting them to the actual GSp4 double cover, the genuine K-types, and every Fourier-coefficient/residue interchange. The abstract continuation theorem is not itself that adaptation.

These requests are not dependencies of the nine arithmetic declarations. MP.8
must prove the adaptation to its actual cover before using those supplier
results. A theorem for a linear reductive group does not automatically apply to
a genuine representation of the metaplectic cover.

RankZeroOneBSD:BSD.2 consumes the completed MP.8 coefficient and continuation
results. It owns the unfolding into the quadratic-twist series, the final
residue/nonvanishing argument and the simultaneous local-condition selection.
Reading BFH §9 confirms the role of m=N·rad(N), separation of the two signs by
K-types, and exclusion of only finitely many fundamental discriminants. The
arithmetic component here makes no nonvanishing claim and supplies no assertion
about a density of twists.

## Source corrections

The following findings refer to the published scan, not to an uncollated
preprint. The publisher article page and Friedberg's publication list were
checked, and searches for a correction addressing these passages found none.
Each finding remains subject to independent review; the search does not prove
that it is new.

- **MetaplecticAutomorphicForms/E-MP8-1 — misprint, Published Invent. Math.102(1990), §1, p.545, final sentence.** Printed: m | N. Correction: Read N | m; retain 4m | N². Then a=m/N is a positive integer. Check: The source §2, p.551, sets the positive integer N₀=m/N. More decisively, §9 p.614 explicitly repeats N | m and chooses m=N·rad(N). For N=8 this gives m=16 and 4m=N², but 16 does not divide 8. The proposed algebra uses the corrected convention. Effect: the proof.

- **MetaplecticAutomorphicForms/E-MP8-2 — error, Published Invent. Math.102(1990), §1, p.548, paragraph defining K.** Printed: K is the stabilizer of iE. Correction: K=GSp⁺(4,R)∩O(4) is the stabilizer in Sp(4,R). In GSp⁺(4,R), the stabilizer is R_{>0}·K, with the positive scalar matrices included. Check: Take g=2I₄. Then gᵀJg=4J, so g∈GSp⁺, and (2iE)(2E)⁻¹=iE; but gᵀg=4I₄, so g is not in O(4) or K. For the full corrected description, normalize a positive-similitude stabilizer by μ(g)^(−1/2) and use its symplectic stabilizer equations. Equation (1.14) already treats central scalars separately. Effect: a stated result.

- **MetaplecticAutomorphicForms/E-MP8-3 — misprint, Published Invent. Math.102(1990), §1, p.550, (1.21) and the completion immediately before (1.22).** Printed: f(−1/(Nτ))=ε(−1)^(k/2)(√N τ)^k f(τ); Λ(s,f)=(2π)^(−s)Γ(s)N^(s/2)L(s,f). Correction: For the original normalized newform f of level M, replace N by M in its Fricke equation and its completed L-function. Keep the level N in the separately defined transform f̂(τ)=τ^(−k)f(−1/(Nτ)) on p.547. Check: The introduction p.543 uses M, and the twisted completion (1.24) on p.551 uses D²M. If one sets Λ_N=(N/M)^(s/2)Λ_M, the functional equation gains the factor (N/M)^(s−k/2). As a direct Fricke check, the weight12 level1 discriminant form at N=8 satisfies Δ(−1/(8τ))=(8τ)^12Δ(8τ); the printed formula would instead require 8^6τ^12Δ(τ), contradicted by the leading powers of q as Im(τ)→∞. This is a normalization slip, not a counterexample to the paper’s main nonvanishing theorem. Effect: the proof.

The level distinction also governs the analytic seed. The original f is a
normalized newform at level M, regarded at a suitable larger level N. The
function used for the Eisenstein construction is the separately defined Fricke
transform f̂(τ)=τ^(−k)f(−1/(Nτ)). Replacing N by M everywhere would therefore
introduce another error; the correction applies to the original newform's own
Fricke eigenrelation and completed L-function.

The stabilizer distinction likewise matters when declaring induced sections.
A positive scalar matrix acts trivially on H₂ while its similitude factor need
not be one. BFH's equation (1.14) separately prescribes behavior under central
scalars and K. A corrected blueprint must retain that central condition, with
the actual character specified, instead of treating K alone as the stabilizer
in the full positive-similitude group.

## Exact work required for stage closure

1. Group and analytic objects in BFH §1, pp.545–551: use the native symplectic group and generic semidirect product, import the Heisenberg data from MP.0, and construct the actual positive-similitude GSp4 group, action on H₂, double cover, compatible Jacobi action, arithmetic subgroup and adelic realization. Resolve the stabilizer and level misprints recorded here. Specify slash-operator branch, central character, K-type, section I_s and the original newform versus its Fricke transform. Every new definition needs its API and three tests.

2. Theta and Fourier analysis in BFH §2, pp.551–557: construct genus-two theta series, prove normal convergence, Gaussian orthogonality (Proposition 2.1, whose proof is omitted in BFH and referred to Eichler–Zagier Theorem 5.3), Fourier extraction (2.2)–(2.3), and the holomorphic contour translation establishing (2.9). Then instantiate coefficient-invariants for B_j, establish the half-integral matrix/native quadratic-form dictionary as a reusable interface, prove Proposition 2.2 including the S-transform/branch and infinite-sum regrouping, and split Propositions 2.3, 2.5, 2.6, 2.7 and Corollaries 2.4, 2.8. Rank-one Jacobi forms and their already planned coefficient/theta results remain QM.1; no reverse MP.8 dependency on that consumer is introduced.

3. Cover-specific analysis: physical pp.17–71, printed558–612, are unread. Read and decompose the remainder of §3 and §§4–8 line by line: actual Whittaker kernels and K-types, local test functions, Eisenstein/Fourier coefficient expansions, initial convergence, constant terms, intertwining operators, meromorphic continuation, functional equations, singular hyperplanes and justified coefficient/residue interchanges. The beginning of §3 at p.557 and the end of §8 at pp.613–614 are read boundaries, not evidence that their intervening proofs are closed. Adapt AS.1–2 estimates to the double cover with explicit comparison theorems.

4. Complete source coverage: the campaign references Weil (1964), Kudla (1996), BFH/Friedberg–Hoffstein routes, and BFH cites Eichler–Zagier and Ziegler for Jacobi foundations. Obtain and read the passages required for the exact objects and proofs, resolving ownership against MP.0–7 and QM.1. The distinct BFH Annals131(1990),53–127 paper has not been read in this job and must not be confused with the Inventiones paper. No source-complete claim is made.

5. BSD.2 export: state and prove the precise genus-two coefficient, local-factor, continuation and permissible-interchange outputs consumed by the twist-series comparison. BFH §9, pp.614–617, has been read to confirm m=N·rad(N), separation by K-types, the two-variable pole argument and infinitude of fundamental discriminants; the final twist residue, positivity/nonvanishing and simultaneous local-condition selection belong to RankZeroOneBSD:BSD.2 and are not nodes of MP.8. Reading the final argument does not supply its unread §3–8 premises.

The packet is partial, with three explicit gaps and two open external requests. Its planets are **Fourier-index discriminant**, **Fourier-index orbit classification**, and **Fourier indices with fixed residue**. They mark the central construction and two indexing theorems. No source locator, proof check or gap is presented as a planet.
