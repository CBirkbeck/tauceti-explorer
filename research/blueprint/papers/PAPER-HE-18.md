# He: Newton cocenters, integral convolution and compatible Lang lifting

**Partial checkpoint.** Codex `codex-c83e7a`, issue #1406, continuing
[PR1761](https://github.com/CBirkbeck/tauceti-explorer/pull/1761) by `codex-a71f92`
and [PR1932](https://github.com/CBirkbeck/tauceti-explorer/pull/1932) by `codex-7e92bd`.
This is a mathematical extraction and routing plan. No Lean implementation or
independent-review verdict is claimed.

The result has 123 items: 7 library, 16 planned
and 100 missing. The seven ownership routes and every previous item ID
are preserved. All 41 definitions/constructions have named API outlines
(124 contracts), use records and 123 mathematical tests. The ten existing
source findings remain provisional.

This continuation supplies the integral Haar/convolution proof previously left
at G3: compact-open index volumes, arbitrary-module finite integrals, convolution
support and associativity, coefficient base change, and cofinal pro-p local units.
It proves unimodularity from Iwahori–Bruhat generators and the twisted commutator
comparison without a twist-stable subgroup basis. It also reads the correct
rational-character apartment construction and proves compatible inverse-limit
Lang lifting using an existing Mathlib theorem. The actual connected intersection
models, shifted root counts and general HN14 transfer remain open.

## Sources and reading boundaries

Primary: Xuhua He, [Cocenters of p-adic groups, I: Newton decomposition](https://doi.org/10.1017/fmp.2018.1),
Forum of Mathematics, Pi6(2018), e2,1–27. This continuation read all27 published
pages, including proofs and references, on2026-09-22. Current PDF SHA256:
`ff209fcfa35803cafab4c2634f1b951a72efea3528fbd095fb1282f4f66b6ac9`. Cambridge retrieval footers change downloaded bytes;
previous hashes and the exact previous deliverable blobs remain in the JSON.

The [arXiv history](https://arxiv.org/abs/1610.04791) still lists v3 of8March2018
as the final revision. Earlier targeted arXiv comparisons are preserved with their
original attribution; this continuation does not claim a fresh full arXiv reading.
Fresh searches covered the title with erratum/correction, the arXiv identifier,
the Cambridge article and the author's selected-publications page. No correction
was located in this bounded search. No author was contacted.

Fresh supporting reads:

- [Richarz16](https://www.numdam.org/item/10.24033/bsmf.2708.pdf), all8 article
  pages117–124(PDF3–10), including every proof and references.
- [Tits79](https://gkorpal.github.io/files/Tits1979.pdf), printed29–34 and50–53:
  rational-character apartment, affine root filtrations and stabilizer product charts.
- [Bruhat–Tits II](https://www.numdam.org/item/10.1007/BF02700560.pdf), printed
 345–346 and354–359:5.1.20 and5.2.1–14 opening, including the connected parahoric
  and double-Tits-system statements. This is selected reading, not all180 article pages.
- [Muller01](https://ypfmde.github.io/Papers/lang.pdf), all2 pages of the short
  Lang-surjectivity proof, including its explicit orbit-theoretic dependencies.

The supporting hashes are in `source.continuationC83e7a.supportingProvenance`.
Casselman1995 pp16–17,27 were read in reconnaissance but do not supply a proof of
unimodularity; the new argument below does. HN14 was downloaded for comparison,
but its previous selected reading is not reattributed to this continuation.
Original Lang56 could not be downloaded through the local fetch; Muller is the
actual new proof source. Its general orbit/dimension inputs are tracked as G9.

A visual check of primary p13 confirmed that the first intersection is printed
nonempty. The extracted text lost its slash. This was rejected as an OCR lead;
it is not an additional source issue.

## Scope, conventions and what the paper contributes

F is a nonarchimedean local field with finite residue field of characteristic p,
G the F-points of a connected reductive group, I an Iwahori and P=Iprime its
pro-p radical. R is a commutative Z[1/p]-algebra. Coefficients are discrete.
The twisted action is

    T_x f(g) = omega(x) f(x^-1 g theta(x)).

The character has open kernel. The paper assumes theta has finite order on the
apartment and Iwahori–Weyl group, not necessarily on all of G. A cocenter is a
module quotient by commutator relations, not an algebra quotient. Level cocenters
are images in the ambient cocenter. Newton test modules form direct sums;
distribution duals form products. Rigid means central Newton vector, not zero.

The paper's principal constructions are the clopen Newton partition of G,
direct-sum decompositions of tests and cocenter, congruence-level minimal-cell
generators, the field-valued Howe bound, and a rigid cocenter presentation by
parahoric cosets with overlap relations. Its affine-Coxeter and local group
prerequisites are exposed separately in the inventory. The printed arbitrary-ring
distribution bound, finite-minima assertion under central twists, distribution
direct sums and forward overlap graphs need the corrections retained below.

## Integral convolution: an explicit foundational proof

Let G be any Hausdorff locally profinite group with a compact open pro-p subgroup
P. For compact open K define

    v(K) = [K : K intersect P] / [P : K intersect P] in Z[1/p].

The denominator is a p-power. To integrate a compact-open set U, choose a compact
open subgroup L contained in P that right-stabilizes U. Write U as a finite
disjoint union of left cosets xL. Assign each coset the value v(L). If M is a
smaller common level, each L-coset splits into [L:M] M-cosets and
v(L)=[L:M]v(M). Two descriptions have a common refinement. This proves
well-definedness, finite additivity, left invariance and uniqueness with v(P)=1.
The same counting gives the displayed formula for every K. If K itself is pro-p,
both indices in that formula are p-powers, so v(K) is a unit in every R.

For a discrete R-module M, a compact test f has finite image and admits a common
right level L contained in P. Define

    integral f = v_R(L) sum_(xL in supp(f)/L) f(x).

The sum is finite. The same refinement argument proves independence and R-linearity.
It also proves naturality in M and finite Fubini on G times G. No real-valued
Bochner integral or countable sum with arbitrary coefficients is presumed.

To get right invariance in the local reductive application, use the extended
Iwahori–Bruhat datum. Its modular homomorphism delta is positive. It is1 on I
because right translation by an I-element preserves the positive-finite-measure
set I. A lift n_s of an affine simple reflection has n_s squared in I, so
positivity and delta(n_s) squared=1 force delta(n_s)=1. Every length-zero lift
normalizes I, giving delta=1 on it too. Bruhat decomposition expresses all of G
using these lifts and I. Thus delta is identically1. This proof uses the actual
local Tits datum; it does not require a split cocharacter presentation or a
continuity theorem for the modular character.

If alpha preserves I, pullback by alpha takes the rational normalized volume to
c times that volume. Evaluate on I to get c=1 **in the rational coefficient
ring**, where v(I) is nonzero. Then base-change to R. Never cancel v_R(I): for
Q3× with P=1+3Z3 and R=F2 it is zero. Inversion and right invariance follow
from unimodularity, first for the rational volume and then over R.

Define convolution by the finite integral of f(x)h(x^-1g). Its support lies in
the compact product supp(f)supp(h). A left level of f and a right level of h are
levels for the convolution. Associativity follows by expanding the finite double
integral, substituting y=xz and interchanging the finite sums. Coefficient base
change follows at a common coset level from a finite characteristic-function
basis, or from the filtered colimit of the free modules on G/U. It needs no
flatness hypothesis on R.

For pro-p U, e_U=v_R(U)^-1 1_U is idempotent. It is a left unit on left-U-fixed
tests and a right unit on right-U-fixed tests. A finite family has a common
such two-sided local unit. These constructions belong to the existing SR.1.
The original Vigneras citation remains bibliographic context; the chosen proof
now supplies its needed integral operations directly.

## Twisted commutators without twist-stable levels

Assume G unimodular and theta preserves volume. Put

    tau(f)(g) = omega(theta^-1(g))^-1 f(theta^-1(g)).

This is a convolution automorphism with inverse
h maps to (x maps to omega(x)h(theta(x))). On an indicator on which omega is
constant it gives precisely the printed omega(X)^-1 1_(theta(X)). Finite
partitions therefore identify the printed relation span with the span of all
f*h-h*tau(f).

Write L_xh(g)=h(x^-1g). Expanding convolution and substituting
 y=g theta(x)^-1 gives

    f*h - h*tau(f)
      = integral_x f(x) [L_xh - T_(x^-1)(L_xh)] dmu(x).

In fact T_(x^-1)(L_xh)(g)=omega(x)^-1 h(g theta(x)^-1). The integrand is
locally constant as a family in the discrete module of compact tests: translation
of a compact test has open stabilizers, theta is continuous and omega has open
kernel. Multiplication by f makes it compactly supported in x. The module-valued
integral is consequently a finite combination of action relations.

For the reverse inclusion choose pro-p U contained in ker(omega), a left
stabilizer of f and theta^-1 of a right stabilizer of f. Thus
 e_U*f=f and f*e_(theta(U))=f. There is **no** assumption theta(U)=U.
Using Dirac symbols only as notation for left/right translation multipliers, set

    a = delta_x*e_U,       a(g)=v(U)^-1 1_(xU)(g),
    b = f*delta_(theta(x)^-1),  b(g)=f(g theta(x)).

Both a and b are actual compact test functions; a Dirac mass on a nondiscrete
G has not been added to the test algebra. Now

    tau(a) = omega(x)^-1 delta_(theta(x))*e_(theta(U)),
    a*b = omega(x)^-1 T_xf,
    b*tau(a) = omega(x)^-1 f.

Hence omega(x)(a*b-b*tau(a))=T_xf-f. This proves the comparison in both
directions. The finite-order assumption on theta is unnecessary for this
foundational theorem. The local parahoric-coset version uses
alpha=Ad(taubar)theta after right-translating P taubar to P; it has the same
proof and never requires invertibility of v_R(P).

## Actual affine data and compatible Lang lifting

Tits constructs the apartment using V=X_*(A) tensor R and rational characters
of the actual minimal Levi Z=Z_G(A). Their restrictions form a finite-index
sublattice of X^*(A). The translation homomorphism is characterized by

    chi(v(z)) = -ord_F(chi(z)).

Its image is a full lattice between the two dual character lattices. This makes
sense for Z containing division-algebra factors; it is not the cocharacter group
of a presumed torus Z. Richarz identifies the affine-action kernel in N(F) as
the maximal compact subgroup Z_c of Z(F). Thus the actual Wtilde=N(F)/Z0
has finite affine kernel Z_c/Z0. The extension N(F)/Z_c by W0 need not be split.
Keep the Tits negative-valuation sign when comparing an algebraic cocharacter
at a uniformizer with an affine translation label.

For an affine map phi(v)=Lv+c with L of finite order d, its dth power is
translation by lambda=sum_(i=0)^(d-1)L^i c. Define its Newton displacement
as lambda/d. Passing to a common multiple proves independence of d, and affine
conjugation with linear part M sends this vector to M(lambda/d). This works
on the full apartment, including central directions, with no faithful-action
or split-extension assumption. It supplies the correct interface for C2/N19;
it does not by itself transport every HN14 standard-triple theorem to it.

For the Lang step, reuse the existing Kisin–Zhou R14 supplier. Muller proves
surjectivity on a connected linear algebraic group over a finite field using a
closed twisted orbit and a finite twisted stabilizer. His closed-orbit and
orbit-dimension facts remain explicit general algebraic-group inputs (G9).
For ordinary Frobenius F, every nonempty fiber

    S_a = {z : z^-1 F(z)=a}

is a left H(F_q)-torsor: for two solutions h,z, the element h z^-1 is F-fixed.
It is finite since the rational points of an affine finite-type scheme inject
into a finite power of F_q by evaluation on algebra generators.

Now let J be an inverse limit of connected smooth affine finite-type groups
H_j over F_q, with transition homomorphisms defined over F_q. For a compatible
target a=(a_j), the solution fibers S_(a_j) are finite and nonempty and form
an inverse system. The pinned Mathlib theorem
`nonempty_sections_of_finite_inverse_system` supplies a compatible solution.
It does not require the transition maps on these fibers to be surjective.
This avoids silently choosing incompatible finite-level solutions.

Finally, for sigma-stable J contained in H, a fixed right coset xJ gives
 a=x^-1 sigma(x) in J. If z^-1 sigma(z)=a, then x z^-1 is sigma-fixed.
Thus H^sigma/J^sigma maps bijectively to (H/J)^sigma. Normality of J is
unnecessary. The remaining geometric obligation in Lemma15 is to produce the
actual connected quotient models for Ibreve_n intersect g Ibreve_n g^-1 and
identify the intersection with their inverse limit.

Merely being pro-p is insufficient: take H=Z/p^2 additively,
sigma(x)=(1+p)x and J=pZ/p^2. All quotient cosets are fixed, while
H^sigma=J maps only to the zero coset. This strengthens the evidence for the
existing E5 gap without making a new independent-review claim.

## Library audit and ownership

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
TauCeti f790474821cf4256814db967cb154e7af3d0c369. All seven positive item
credits were reopened at these pins. The three new narrow credits are the
positive modular homomorphism, inner-regular Haar uniqueness, and nonempty
finite inverse systems. They are not an implementation of the integral Hecke
algebra or of local reductive groups. In particular the modular-character file
explicitly lacks a continuity theorem; the proof above does not use one.

The reviewed AA.0,AA.1,AF.0 audit entries were reread. No SR,RG2 or RootSystems
entry is present under those keys in the current reviewed aggregate. Missing
entries are not negative audits. SR.1 and all RG2 stage descriptions were reread;
upstream algebraic-group embedding, dimension and component scopes were checked.
The generic Lang input already appears at PAPER-KISIN-ZHOU-25/R14. The existing
Newton-cocenter and root candidate IDs are retained; generic affine-Hecke cocenters
and parahoric centers remain with their separate existing candidate.

## Retained source findings and previous mathematical repairs

The arguments in this section are retained from the two earlier checkpoints.
The new source readings and strengthened interfaces above are cumulative.


All ten findings are unreviewed. There is no self-confirmation object. “New” in the structured field means that no correction was located in the listed searches, not a claim of priority or an exhaustive negative bibliographic result.

The correction search inspected the Cambridge publication and Volume 6 contents, arXiv history and selected v3 passages, the author's HKU selected-publications page, and targeted title/erratum/correction searches. No author was contacted.

### E1: finite order is not finite twisted Ω-orbits

Take G=F× and θ(g)=g⁻¹. Then W̃=Ω=Z, Wa is trivial and the length function is identically zero. The twist on the apartment and W̃ has order two and preserves the Iwahori O_F×. Twisted conjugation by an element of valuation k sends valuation m to m+2k. The arithmetic invariants are κ=m modulo 2 and Newton vector zero.

Consequently a single θ-conjugacy class meets infinitely many Wa-cosets, every member is minimal, and each defined X_ν is the union of all even or all odd valuation cosets. It is not compact: its continuous image in the discrete valuation group is infinite. This contradicts §2.1(a), the first assertion of Corollary 9 and the use of this X_ν as a compact subset in §5.2.

It does **not** contradict a Newton partition, finite fibres on conjugacy classes, or the existence of some different compact fundamental subset. In this example there are just two twisted valuation classes. It also does not disprove field-valued Howe finiteness for the general twist.

The guarded finite-minima theorem requires finite fibres of Ω→Ω_θ, equivalently the appropriate cosets of (1−θ)Ω to be finite. Ordinary θ=id is covered. Section 5 now supplies the different compact core and same-level generation argument needed for central twists, conditional on the stated Ω-normalizer and standard-triple producers. The finite ordinary θ-saturation used in Theorem 23's proof has the same problem: θ-stability is not stability under full twisted Ω-conjugation.

### E2: test functions use direct sums, distributions use products

For ordinary F× with ω=1, Haar integration is a valid invariant functional and is nonzero on every valuation shell. Each input function is compactly supported and hence meets only finitely many shells; no convergence of an infinite sum is involved. The family of restrictions of the functional nevertheless has infinite support.

Thus the dual of the Newton direct sum is a product, and Theorem 22 also needs a product over all standard pairs. For a torus the standard pairs already range over every integer valuation. Local compatibility imposes equations but does not impose finite support. The finite rigid/nonrigid two-factor decomposition is unaffected.

### E3: an explicit arbitrary-ring counterexample

Let V be the direct sum of countably many copies of F3, with basis e_0,e_1,…, and put R=F3⊕V with square-zero multiplication
$$
(a,v)(b,w)=(ab,aw+bv).
$$
Set t=(0,e_0). Then 2 is invertible in R, Ann(t)=0⊕V and 1+t has order three. On G=Q2× take θ=id and ω(g)=(1+t) raised to the 2-adic valuation of g. The kernel is open: it is the union of the valuation shells divisible by three. This is within the paper's stated coefficient and character hypotheses.

Let I=Z2×, which is pro-2, and normalize its Haar volume to one. For b∈Ann(t) define
$$
j_b(f)=b\int_I f.
$$
Because G is abelian, T_x acts on test functions by the scalar ω(x). Every ω(x)−1 is a multiple of t, so j_b is invariant. It is supported on the compact open I and j_b(1_I)=b.

Now fix any of the positive levels I_n⊆I. Evaluation at 1_I maps the restricted invariant-distribution module supported on I onto Ann(t). Indeed invariance under 2 forces t j(1_I)=0, and the preceding j_b realizes every element of the annihilator. No assumption that I_1=I is used.

The R-action on V factors through F3. An R-submodule generated by finitely many vectors is therefore finite-dimensional over F3, while V is not. Hence the restricted distribution module is not finitely generated, since it has V as a quotient. This refutes Theorem 20 in its printed arbitrary-ring scope, even for θ=id. “Finite dimensional” in Theorem 18 has no vector-space meaning for arbitrary R; interpreting it as finite generation is also contradicted.

The valid general-ring conclusion of the printed generator count is about the **cocenter component**. Over a field its dual has the same finite dimension. The Ω-normalized construction in Section 5 supplies the field-valued restriction bound without the finite-minima guard, once the local level producers are established. It is unnecessary to assert surjectivity of a restriction map on arbitrary R-duals.

Finite models V=F3^d, d=1,…,6, were checked only as diagnostics. Their dimensions alone cannot disprove an existential finite-generation statement; the infinite direct-sum argument above is the actual obstruction.

### E4: the overlap graph needs inverse transport

With θ=id and ω=1, take the upper Iwahori I of GL2(Q_p), x=diag(p,1), and U=I∩xIx⁻¹. The element u with rows (1,0) and (p,1) lies in U: it is in I, and x⁻¹ux has lower-left entry p². But xux⁻¹ has lower-left entry 1, so is outside I.

Therefore T_x1_U is not supported in I. The printed pair (f,−T_xf) need not lie in its declared second summand. The corrected pair is (f,−T_(x⁻¹)f). This also fixes the ω weight and the functional compatibility equation simultaneously. The publication's page image confirms the forward exponent; this is not an OCR issue. Exact matrix computations for p=2,3,5,7 agree with the general calculation.

### E5–E8: local models, dual separation and affine scope

Lemma 15's “pro-p, thus lift a Frobenius-fixed coset” needs a Lang argument for the actual connected intersection models. An abstract pro-p group does not imply the needed H¹ vanishing. The root-depth quotient comparison in Lemma 16 must also respect Frobenius; an abstract bijection with an affine space does not determine the number of rational points. Richarz's unshifted rank-one proof was read, but it does not automatically provide all the depth-shift and inverse-limit details.

Theorem 23's proof separates relations by R-valued duals while R is arbitrary. For R=Z[1/p] and a prime ℓ≠p, Hom_R(R/ℓR,R)=0 although the module is nonzero. Finite generation is not finite-dimensional vector-space duality. The replacement proof below avoids that passage and the finite Ω truncation entirely.

In Theorem 3's power-growth argument, the fixed conjugator has Bruhat index z∈W̃, but the displayed bound puts it in a length ball of Wa. This can miss its whole Ω-coset. A nonzero translation can also be central and have length zero, as t^(1,1) in GL2 shows. Section 5 replaces this passage by finite endpoint subwords and a full affine-vector comparison. It retains Ω factors and handles central directions directly. A separate equal-central-average lemma is no longer needed; the actual full-apartment producer remains G1.

Finally, Z_G(A) over an arbitrary local F need not be a torus. For GL_m(D) with a noncommutative central division algebra D, it is a product of D× groups. Haines–Rapoport Proposition 13 works over a strictly henselian field with a torus centralizer and inertia coinvariants. It does not directly supply the cocharacter formula printed in He18 §1.1 for all F. The actual quotient N_G(A)(F)/Z0 and Richarz's comparison are retained; the general translation adapter is a named gap, not a fictitious library theorem.

### E9–E10: twists, indices and finite sums

The decreasing-cell condition is swθ(s)<w, with s in the **affine** simple set. The rotated convolution factors in Lemma 17 retain θ(g1). A standard pair gives the automorphism Ad(τ)θ of W_P, not automatically Ad(τ) alone.

The contracted-product action uses the next factor g2 in its second entry, and the final right index is i_k. The fixed-coset expression is at level I_n. In §5.3, distributions supported on finitely many strata lie in a finite **sum**, not generally their set-theoretic union; change of level is by restriction image between different functional domains.

These are recorded as source issues even when the intended local correction is clear. None is silently converted into an untwisted theorem.

## Retained conditional repairs for Newton separation and central twists

These arguments are derived repairs, not quotations from the paper or independent review verdicts. They use the stated standard-triple and local Bruhat/filtration producers. They do not establish the outstanding BT, Lang or actual Iwahori–Weyl source interfaces merely by assuming them.

### Finite minimal representatives modulo Ω transport

Assume `W̃=Wa⋊Ω`, with Ω abelian and `(Wa,S̃)` a Coxeter system with finite S̃. Assume θ preserves these factors, length and simple reflections, and retain the invariant map π and standard-triple theorem in their validated scope. For ν in the image of π choose `τ0∈Ω` lifting its coinvariant κ. The standard-triple theorem bounds the length of every minimal element in the fibre by

`Bν = ℓ(xν) + max_{K⊆S̃, W_K finite} max_{u∈W_K} ℓ(u)`.

The straight length `ℓ(xν)` depends on the Newton vector. There are finitely many K and each finite W_K has a longest length, so Bν is finite. In a fixed Wa-coset there are at most finitely many words of length at most Bν. Consequently

`S(ν,τ0) = {w∈W̃_min : π(w)=ν, prΩ(w)=τ0}`

is finite. Given any minimal w with π(w)=ν, write `prΩ(w)−τ0=(1−θ)η`. Then

`w′=η⁻¹wθ(η)`

has projection τ0. Its length equals that of w because both Ω factors have length zero. It is in the same twisted conjugacy class and therefore remains minimal with the same π. Thus every minimal element is Ω-twisted-conjugate to one of this **finite** set. This proves C17 and removes the finite-minima guard from C12's finiteness of conjugacy-class fibres. It does not make the entire minimal-element set finite.

Choose lifts of Ω in the normalizer that normalize I. The finite union `Y(ν,τ0)=⋃_{w∈S(ν,τ0)} IẇI` is compact open and has the same twisted saturation as X_ν. This is the replacement compact core N20. For the inverted torus it is just one valuation shell of the chosen parity; the original X_ν is still an infinite union.

For level compatibility, the actual barycentric filtration must additionally prove that these lifts and their θ-images normalize I_n. Then `T_(h⁻¹)` maps `H_R(G,I_n)_w` isomorphically to `H_R(G,I_n)_(η⁻¹wθ(η))`: it transports support by `U↦h⁻¹Uθ(h)`, preserves both level invariances and has inverse T_h. The coefficient ω(h⁻¹) is a unit. Proposition 1 identifies the two images in the ambient cocenter. This is L18; its filtration producer is explicitly assigned to A3/G2.

Theorem 11's minimal-cell generators can therefore be replaced at the **same level** by the finite set S(ν,τ0). Lemma 16 supplies rank `[I:I_n]` for each cell's level test module: the cell has `q^ℓ̆(w)[I:I_n]` right I_n-cosets and every I_n-double coset in it has `q^ℓ̆(w)` right cosets. Hence the ν-component is generated by `Nν[I:I_n]` elements, where `Nν=#S(ν,τ0)` is independent of n. Over a field the restriction image of invariant distributions has dimension at most this number. A compact X meets finitely many Newton strata; choose a common sufficiently deep I_n inside K and restrict the resulting finite sum to H_R(G,K). This supplies the central-twist part of F2–F4 without the former finite-minima guard. The local cardinality and Lang producers still require G2/G6. The arbitrary-ring distribution assertion remains false by E3.

### Finite endpoints in the Newton power argument

Write `C_w=IẇI`. For fixed finite sets A,B of extended Weyl elements, simple-cell multiplication gives finite sets A′,B′ independent of w with

`(⋃a∈A C_a) C_w (⋃b∈B C_b) ⊆ ⋃a′∈A′,b′∈B′ C_(a′ w b′)`.

Here is a direct construction. Write `a=s1⋯sr τ` and `b=τ′t1⋯tk`, with τ,τ′ in Ω. The Ω cells normalize I and multiply the middle label exactly to `τ w τ′`. Iterate the left and right rank-one upper bounds, keeping that middle label intact. A′ consists of `qτ` for subwords q of the first word; B′ consists of `τ′q′` for subwords of the second. Their Ω factors are never discarded. Take finite unions for all a,b. This is N18.

The abstract laws already exist at the Tau Ceti pin: `TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple`, its right-handed version, and `exists_sublist_of_mem_prod_bruhatCell`. N21 records exact reuse. The local extended-group adapter is still required; a theorem about the abstract Tits-system Weyl group is not automatically a theorem about every Ω component.

Suppose two standard-triple cells have twisted-conjugate elements by a fixed g in C_z. Choose a common power n0, divisible by θ's order on W̃, so the straight factors have translation vectors λ1,λ2. N6 bounds the finite-parabolic errors in every n0m-fold twisted power. Although θ need not have finite order on G, `θ^(n0m)(g)` remains in the same fixed cell C_z. Move the second finite-parabolic error to the other side by inversion. N18 and disjointness of Bruhat cells give finite endpoint sets A′,B′ and

`t^(mλ2) = a_m t^(mλ1) b_m`

for every positive m, with a_m,b_m in those fixed finite sets.

Pass to the **full** real affine apartment, retaining central directions; faithfulness is unnecessary. One endpoint pair occurs for two distinct positive integers m,n. Write its affine maps as `a(v)=Lv+c`, `b(v)=Mv+d`. Comparing linear and translation parts gives `LM=1` and

`m(λ2−Lλ1)=c+Ld=n(λ2−Lλ1)`.

Subtracting forces `λ2=Lλ1`. The linear part L lies in W0, so distinct dominant Newton vectors are impossible. This is N19 and the revised N7. It needs neither a false length bound inside Wa nor positivity of root length on central translations. G5 is now supplied relative to the actual affine and local Bruhat producers; G1/G4 still carry their source obligations.

## Retained direct repair of the rigid presentation

The following argument is a proposed mathematical repair, not a claim that the printed proof already supplies it or that it has been independently verified. It applies over every R once the rigid cover and local commutator comparison have been established.

Write X=G^rig and U_i=P_iτ̇_i for standard pairs. Each U_i is compact open and stable under twisted conjugation by P_i. By Proposition 21, the sets g·_θU_i form an open cover of X.

First, compact test functions have a finite clopen refinement property. The nonzero support of a locally constant function with discrete coefficients is closed as well as open; when compactly supported it is compact open. Cover it by compact open subsets subordinate to finitely many chosen charts and disjointify them by successive differences. For two refinements, intersections give a common refinement. No finite-index assumption on all charts is needed.

It follows that C_c(X,R) has the usual compact-test cosheaf presentation: the direct sum over the chart test modules surjects, and its kernel is generated by differences of zero extensions of tests on pairwise overlaps. To see the kernel statement without invoking a sheaf theorem, take a finite relation and refine all its supports simultaneously. On each refined piece its coefficients sum to zero. Express this finite relation as differences against one chosen chart containing that piece, then sum over the pieces.

Let Q be the direct sum of H_i=C_c(U_i,R), modulo:

1. the local relations f−T_pf for p∈P_i;
2. the corrected overlap pairs (f,−T_(x⁻¹)f) for chosen double-coset representatives x.

The local relations equal the local convolution commutators by Proposition 1's argument on the parahoric coset. Identify Pτ̇ with P by right translation and use Ad(τ̇)θ as the automorphism of P. The new H22/H23 argument uses asymmetric small pro-p levels and needs no stable-level assertion; never divide by μ(P) without proving it invertible.

Relations for **every** g∈G follow from those for the chosen x. If g=p x q, and f is supported on U_i∩g·_θU_j, first replace f by T_(p⁻¹)f using its local P_i relation. This lies on the x-overlap. Apply the x graph, then remove the local q transport in H_j. The resulting second component is
$$
T_{q^{-1}}T_{x^{-1}}T_{p^{-1}}f=T_{g^{-1}}f.
$$
The group law for T includes every character factor, so no missing ω normalization is concealed in this reduction.

For a test f supported on g·_θU_i, assign its class in Q by
$$
f\longmapsto [T_{g^{-1}}f]_i.
$$
The all-g overlap relation just proved shows that this assignment agrees for two charts containing the same test. The compact-test cosheaf presentation therefore glues these assignments to an R-linear map C_c(X,R)→Q. It is invariant under the global G-action: on a chart, transporting first by h and then back by hg is the same as transporting back by g. The generic coinvariant universal property gives a map from the rigid coinvariants to Q.

Conversely, zero extension followed by the global cocenter projection gives Q→H̄_R^rig. Its local and overlap generators vanish by invariance. The two composites are the identity on the chart generators and therefore everywhere. The identification of rigid coinvariants with the rigid image in the global cocenter uses the clopen rigid/nonrigid split.

This proves the corrected presentation from the explicitly stated cover, local relation comparison, finite refinements and double-coset descent. It uses neither an R-dual separation theorem, nor Howe finiteness, nor a finite θ-saturation of Ω labels.

For the distribution theorem, apply Hom_R(−,A) to this presentation for an arbitrary R-module A. The dual of its direct-sum domain is a product. Local relations impose P_i-invariance; graph relations impose
$$
j_i(f)=j_j(T_{x^{-1}}f).
$$
Setting A=R yields the corrected Theorem 22. Equivalently, one can glue these functionals directly on finite clopen partitions. Using arbitrary A explains why this method does not lose information in the square-zero or torsion examples.


## The seven ownership routes

### ReductiveGroupsPartII

Route: source. The existing local reductive-group layers own the rational topology, valued roots, parahoric filtration and Bruhat comparisons. This paper supplies the precise additional adapters in those scopes, not a second building or local-root roadmap.

Existing stages: `ReductiveGroupsPartII:RG2.0`.

### ReductiveGroupsPartII

Route: source. The existing local reductive-group layers own the rational topology, valued roots, parahoric filtration and Bruhat comparisons. This paper supplies the precise additional adapters in those scopes, not a second building or local-root roadmap.

Existing stages: `ReductiveGroupsPartII:RG2.1`.

### ReductiveGroupsPartII

Route: source. The existing local reductive-group layers own the rational topology, valued roots, parahoric filtration and Bruhat comparisons. This paper supplies the precise additional adapters in those scopes, not a second building or local-root roadmap. Reuse Kisin–Zhou R14 for generic Lang surjectivity. Compatible Lang solutions follow from finite solution torsors and the pinned inverse-system theorem; actual connected intersection models and Frobenius-compatible root-depth comparisons remain explicit obligations.

Existing stages: `ReductiveGroupsPartII:RG2.3`.

### ReductiveGroupsPartII

Route: source. The existing local reductive-group layers own the rational topology, valued roots, parahoric filtration and Bruhat comparisons. This paper supplies the precise additional adapters in those scopes, not a second building or local-root roadmap.

Existing stages: `ReductiveGroupsPartII:RG2.4`.

### SmoothRepresentationsOfLocalGroups

Route: source. The existing SR.1 owns integral compactly supported Hecke functions, convolution and level/corner comparisons. Import Mathlib's existing function carrier. Add the finite clopen refinement and compact-test cosheaf API in this foundational test-function layer; the Newton and invariant-distribution extension consumes it. The continuation supplies the finite-index volume, module-valued finite integration, convolution support/associativity, coefficient base change and cofinal pro-p local-unit proofs. Normalize in Z[1/p] before base change; a compact Iwahori volume can vanish in R.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.1`.

### RootSystemsPartIIDominanceAndDemazure

Route: part-ii. Reuse the RootSystemsPartIIDominanceAndDemazure candidate from PAPER-HE-21 and PAPER-KISIN-PAPPAS-ZHOU-26. Its existing RedMin lane is the supplier; add the straight-class, finite-parabolic and central-kernel scope here instead of duplicating affine Coxeter theory in Newton harmonic analysis.

Continue the candidate RootSystemsPartIIDominanceAndDemazure already routed by PAPER-HE-21 and reused by PAPER-KISIN-PAPPAS-ZHOU-26; do not mint another root-system roadmap. Begin with Root systems, Weyl groups, and the Cartan–Killing classification (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), importing its root data, chambers, affine Coxeter/length and parabolic APIs. Preserve the existing Demazure and dominant-subtraction targets and the consolidation of the Kisin–Zhou RootSystemsDominancePartII alias. Add κ in Ω/(1−θ)Ω, Newton vectors by powers, twisted reduction, straight elements, Newton affine axes and standard triples. Decompose HN14's gradient-descent and partial-conjugation inputs; prove RedMin (He18 Theorem4), straight-class classification (Theorem6), and standard-triple reduction (Theorem7), with a verified adapter from the actual local Iwahori–Weyl datum supplied by ReductiveGroupsPartII. Keep the finite-minima assertion guarded, but prove C17: normalize Ω by twisted length-zero conjugation into a fixed Ω-coset, where the uniform length bound gives a finite set. Deduce finite conjugacy-class fibres without that guard. Supply N19’s elementary finite affine-error separation, including central translations; the split-torus inversion counterexample must be a regression test, not excluded silently. Supply the finite-parabolic minimality and central-Newton/parahoric containment needed for Proposition21 while retaining central translations and torsion kernels. Keep group-theoretic Ω and the reduced apartment action separate. Test ordinary/inverted G_m, GL2 central length-zero translations, rank-one reflection nonstraightness, affine s0 and empty/infinite parabolics. The output feeds SmoothRepresentationsPartIINewtonCocenters; no distribution algebra, generic affine-Hecke carrier or local building is rebuilt here. Continuation c83e7a: use the actual full-apartment affine action imported from RG2.1. Newton displacement is the average of an affine power with finite-order linear part; no splitting of N/Z_c or faithful action is required. Preserve the finite kernel and Tits valuation-sign dictionary, and finish the HN14 transfer separately.

### SmoothRepresentationsPartIINewtonCocenters

Route: part-ii. SR.1 plans test-function convolution but no current layer states Newton decomposition, congruence cocenter generators, Howe finiteness or the rigid graph presentation. These form a distinct continuation. The existing SmoothRepresentationsPartIIParahoricCenters candidate owns Bernstein/parahoric centers and HE21's generic affine-Hecke branch, not this full locally constant p-adic group cocenter.

Start after Smooth representations of local groups (SmoothRepresentationsOfLocalGroups), with SR.1 as the first prerequisite supplying the integral C_c Hecke algebra, pro-p Haar normalization, level/corner comparisons and compact-test cosheaf API. Import Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII RG2.0–RG2.4) for actual rational groups, parahorics, Frobenius/valued-root descent and congruence double-coset counts, and RootSystemsPartIIDominanceAndDemazure for twisted RedMin, straight classes and standard triples. Do not re-plan the generic Iwahori presentation, cocenter/class-polynomial branch already routed to SmoothRepresentationsPartIIParahoricCenters by HE21, or BunGAndNewtonStrata's Frobenius geometry. Define weighted θ-conjugation, its commutator submodule and cocenter using Mathlib Representation.Coinvariants; prove Proposition1. Define actual G(F) Newton strata and prove Theorems3 and10: the clopen partition and direct sums of compact tests and their cocenter. Use N18/N19’s finite outside-cell and affine-action proof for Newton separation; retain the actual full-apartment producer G1. At barycentric depth n≥1 with ω(I_(n−1))=1 prove both parts of Theorem11 and Corollary12 using Proposition13/Lemma17; level cocenters are IMAGES in the ambient quotient. Use C17 to choose N_ν finite Ω-normalized representatives, N20 for their compact core and L18 for same-level transport. Prove the primal N_ν[I:I_n] generator bound and field-valued Howe finite-dimensionality without the finite-minima guard; verify the barycentric Ω-normalizer producer in A3/G2; arbitrary-ring distribution finite generation is false and is replaced by its explicit square-zero counterexample. Define central-Newton rigid support, standard pairs and the Proposition21 cover. The final corrected Theorem22 is a compatible PRODUCT of local distributions. The corrected Theorem23 kernel is generated by local commutators and inverse-transport overlap graphs (f,−T_(x⁻¹)f); prove it directly using finite clopen partitions and coinvariant universality for arbitrary target modules, not unfaithful R-duals. Retain every E1–E10 finding for independent review and close G1–G8 before declaring proof closure. Definition APIs must include quotient lifts, support/transport, representative independence and level functoriality. Unit tests include finite S3 twists, ordinary/inverted tori, nonunit compact volumes, square-zero coefficient rings and the GL2 graph-direction counterexample. A future design may separate foundational coinvariants, Newton decomposition, congruence reduction, Howe and rigid presentation into successive layers. This paper job provides no Lean implementation or signatures file. Continuation c83e7a: import the explicit arbitrary-ring finite-sum Hecke proof from SR.1. Use tau(f)(g)=omega(theta^-1g)^-1 f(theta^-1g); H22/H23 identify commutators and action relations without a theta-stable subgroup basis. The local rigid presentation imports this comparison and retains inverse graph transport. Do not duplicate the generic integral algebra.

## Complete item inventory

Names below are planning interfaces unless explicitly credited to a pinned declaration.
Each prerequisite is an import or another item, not an assertion of implementation.

### PAPER-HE-18/A1 — Local reductive apartment data

definition; **planned**. Locator: §1.1 p.6.

For F and G as in the local convention choose A, its affine apartment, an alcove and I. The relative Weyl group is N_G(A)(F)/Z_G(A)(F). Retain the actual minimal Levi Z_G(A), which need not be a torus.

Existing stage: `ReductiveGroupsPartII:RG2.1`.

Prerequisites: `ReductiveGroupsPartII:RG2.1`.

- Import algebraic reductive groups and valued relative roots; do not use cocharacters of a nontorus centralizer as if they formed a torus lattice.

Use: PAPER-HE-18/A2; §1.1 p.6; Richarz16 §1.1 — Supplies Local reductive apartment data to Actual Iwahori–Weyl quotient.

Use: PAPER-HE-18/A3; §4.2 p.15; §4.3 pp.16–18 — Supplies Local reductive apartment data to Barycentric congruence filtration.

Use: PAPER-HE-18/A4; §1.3 p.7 — Supplies Local reductive apartment data to Admissible twisting datum.

Use: PAPER-HE-18/H3; §1.2 pp.6–7 — Supplies Local reductive apartment data to Integral normalized Haar integration.

Use: PAPER-HE-18/N10; §3.2 p.14 — Supplies Local reductive apartment data to Admissible subsets of a locally profinite group.

Use: PAPER-HE-18/L3; §4.3 p.16; Richarz16 §§1.1–1.4 — Supplies Local reductive apartment data to Unramified completion and fixed local data.

Use: PAPER-HE-18/R1; §6.1 p.21 — Supplies Local reductive apartment data to Newton centralizer Levi.

Use: PAPER-HE-18/A7; §1.1 p.6, citing BT Proposition5.2.12; Richarz16 §1.1 — Supplies Local reductive apartment data to Local double Tits system.

API:

- `He18.relativeWeyl` (data): Expose the normalizer quotient and its faithful action on the relative root space.
- `He18.alcoveIwahori` (compatibility): Identify the chosen alcove fixer with its parahoric group-scheme O_F-points.
- `He18.changeAlcove` (functoriality): Conjugation transports apartment/alcove/Iwahori data and their normalizers.

Tests (specified, not Lean-executed):

- For diagonal A in split GL2, W0 has two elements interchanging the two coordinates.
- For G=G_m, W0=1 and there are no affine root walls.
- For G=GL_m(D) with D a noncommutative central division algebra, the centralizer of a maximal split torus is a product of D×, not a torus.

### PAPER-HE-18/A2 — Actual Iwahori–Weyl quotient

definition; **planned**. Locator: §1.1 p.6; Richarz16 §1.1.

Let Z0 be the parahoric subgroup of Z_G(A)(F), W̃=N_G(A)(F)/Z0, Wa the affine Coxeter subgroup and Ω the alcove stabilizer. Use W̃=Wa⋊Ω with Bruhat order/length. Translation lattice and apartment action must be compared with this quotient; the printed cocharacter formula is not an assumed definition.

Existing stage: `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `PAPER-HE-18/A1`, `ReductiveGroupsPartII:RG2.4`.

- Use Richarz's Kottwitz kernel and double-Tits construction; record the general-group translation adapter as G1.

Use: PAPER-HE-18/A3; §4.2 p.15; §4.3 pp.16–18 — Supplies Actual Iwahori–Weyl quotient to Barycentric congruence filtration.

Use: PAPER-HE-18/A4; §1.3 p.7 — Supplies Actual Iwahori–Weyl quotient to Admissible twisting datum.

Use: PAPER-HE-18/C1; §2.1 p.9 — Supplies Actual Iwahori–Weyl quotient to Twisted Kottwitz class.

Use: PAPER-HE-18/C2; §2.1 p.9; HN14 §1.1 — Supplies Actual Iwahori–Weyl quotient to Newton vector by a twisted power.

Use: PAPER-HE-18/C4; §2.3 p.10 — Supplies Actual Iwahori–Weyl quotient to Length-nonincreasing twisted reduction.

Use: PAPER-HE-18/C6; §2.5 p.11 — Supplies Actual Iwahori–Weyl quotient to Straight twisted elements.

Use: PAPER-HE-18/N1; §2.2 pp.9–10 — Supplies Actual Iwahori–Weyl quotient to Newton strata of the local group.

Use: PAPER-HE-18/N2; §2.4 p.10 — Supplies Actual Iwahori–Weyl quotient to Length-sensitive simple Bruhat multiplication.

Use: PAPER-HE-18/L2; §4.2 p.15 — Supplies Actual Iwahori–Weyl quotient to Iwahori-cell level functions.

Use: PAPER-HE-18/L3; §4.3 p.16; Richarz16 §§1.1–1.4 — Supplies Actual Iwahori–Weyl quotient to Unramified completion and fixed local data.

Use: PAPER-HE-18/R4; §6.2 p.22 — Supplies Actual Iwahori–Weyl quotient to Standard parahoric pair.

Use: PAPER-HE-18/R5; Proposition21 first half p.22 — Supplies Actual Iwahori–Weyl quotient to Minimal finite-parabolic elements are globally minimal.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Actual Iwahori–Weyl quotient to Double-coset descent of overlap relations.

Use: PAPER-HE-18/A5; §1.1 p.6; §2.5 p.11; Richarz16 Theorem1.4 — Supplies Actual Iwahori–Weyl quotient to Local Iwahori–Bruhat decomposition.

Use: PAPER-HE-18/N18; Derived from He18 §2.4 and the pinned abstract simple-cell laws; replacement for §2.6 p.13 bounded-multiplier step — Supplies Actual Iwahori–Weyl quotient to Finite Bruhat multipliers with the middle cell retained.

API:

- `He18.iwahoriWeylProjection` (projection): N_G(A)(F) maps onto W̃ with kernel Z0.
- `He18.affineOmega` (equivalence): Every w has a unique factorization aτ with a∈Wa, τ∈Ω; ℓ(aτ)=ℓ(a).
- `He18.bruhatRepresentative` (compatibility): Changing a lift ẇ by Z0 does not change IẇI.

Tests (specified, not Lean-executed):

- The quotient F×/O_F× is Z by valuation.
- In split GL2 the central translation t^(1,1) is nonidentity but has Coxeter length zero.
- The identity quotient class represents the double coset I.

Open gaps: PAPER-HE-18/G1.

### PAPER-HE-18/A3 — Barycentric congruence filtration

construction; **planned**. Locator: §4.2 p.15; §4.3 pp.16–18.

For the fixed alcove barycenter let I_n be the integer-depth Moy–Prasad filtration, with I_0=I in the paper's convention and positive levels compact open pro-p. The filtration is normal in I, θ-stable, descending and cofinal among identity neighborhoods; record root-depth and toral coordinates rather than an unspecified congruence subgroup. Required Ω compatibility: every chosen length-zero normalizer representative, and its θ-image, normalizes I_n; for a nonfaithful or enlarged apartment specify how the barycentric filtration is transported. Use the barycenter in the reduced apartment and the separate toral depth filtration. Central translations need not fix any point of the enlarged apartment; their filtration compatibility must be proved from the toral and root coordinates.

Existing stage: `ReductiveGroupsPartII:RG2.3`.

Prerequisites: `PAPER-HE-18/A1`, `PAPER-HE-18/A2`, `ReductiveGroupsPartII:RG2.3`.

- Build from valued root filtrations and the alcove's rational depth data; source closure needs BT and Moy–Prasad inputs G2.

Use: PAPER-HE-18/H2; §1.2 p.7; §3.2 p.14; §4.2 p.15 — Supplies Barycentric congruence filtration to Uniform compact level for a test function.

Use: PAPER-HE-18/H3; §1.2 pp.6–7 — Supplies Barycentric congruence filtration to Integral normalized Haar integration.

Use: PAPER-HE-18/H11; Proposition1 pp.8–9 — Supplies Barycentric congruence filtration to Commutators equal coinvariant relations.

Use: PAPER-HE-18/L1; §4.2 p.15 — Supplies Barycentric congruence filtration to Congruence-level image in the ambient cocenter.

Use: PAPER-HE-18/L3; §4.3 p.16; Richarz16 §§1.1–1.4 — Supplies Barycentric congruence filtration to Unramified completion and fixed local data.

Use: PAPER-HE-18/L5; Lemma16 proof pp.17–18; Tits79 §3.1 — Supplies Barycentric congruence filtration to Ordered root-factorization at shifted depth.

Use: PAPER-HE-18/L8; Lemma16 pp.17–18; Theorem20 proof p.21 — Supplies Barycentric congruence filtration to Congruence double-coset cardinality.

Use: PAPER-HE-18/L11; Lemma17 proof p.19 — Supplies Barycentric congruence filtration to Simple-cell containment at adjacent depths.

Use: PAPER-HE-18/F4; Corrected Theorem18 and §5.3 pp.20–21 — Supplies Barycentric congruence filtration to Field-valued Howe finiteness via a fixed Ω representative.

Use: PAPER-HE-18/L18; Derived from He18 §1.3, Proposition1, and the Ω-normalization used at the start of Lemma16 p.17 — Supplies Barycentric congruence filtration to Length-zero twisted transport preserves a level cell.

API:

- `He18.congruenceInclusion` (functoriality): For m≥n, I_m⊆I_n; induced Hecke inclusions reverse the level order.
- `He18.thetaStable` (structure): θ(I_n)=I_n and conjugation by I preserves I_n.
- `He18.smallLevel` (characterisation): Every compact open K and open ker ω contain I_n, respectively I_(n−1), for some sufficiently large n.
- `He18.levelOmegaNormalizer` (compatibility): Chosen representatives of Ω and their θ-images normalize every I_n; supply this from the actual barycentric filtration.

Tests (specified, not Lean-executed):

- For G_m at positive integer depth n, the root-free filtration has toral condition v(u−1)≥n.
- For Q_p× the groups 1+p^n Z_p and 1+p^(n+1) Z_p need not agree.
- For i∈I, iI_ni⁻¹=I_n.

Open gaps: PAPER-HE-18/G2.

### PAPER-HE-18/A4 — Admissible twisting datum

definition; **missing**. Locator: §1.3 p.7.

Use θ and ω with exactly the twisting convention. Finite order is required on V and W̃, not necessarily as an automorphism of all G; open kernel is required for ω. No θ-invariance condition on ω is silently added.

Prerequisites: `PAPER-HE-18/A1`, `PAPER-HE-18/A2`.

- Package the stated hypotheses and transport them to the stable level system.

Use: PAPER-HE-18/H9; §1.3 p.7 — Supplies Admissible twisting datum to Weighted twisted-conjugation representation.

Use: PAPER-HE-18/H10; §1.3 p.7 — Supplies Admissible twisting datum to Twisted commutator submodule.

Use: PAPER-HE-18/C1; §2.1 p.9 — Supplies Admissible twisting datum to Twisted Kottwitz class.

Use: PAPER-HE-18/C2; §2.1 p.9; HN14 §1.1 — Supplies Admissible twisting datum to Newton vector by a twisted power.

Use: PAPER-HE-18/C4; §2.3 p.10 — Supplies Admissible twisting datum to Length-nonincreasing twisted reduction.

Use: PAPER-HE-18/C6; §2.5 p.11 — Supplies Admissible twisting datum to Straight twisted elements.

Use: PAPER-HE-18/N4; §2.4(2) p.10 — Supplies Admissible twisting datum to Decreasing reduction splits saturated cells.

Use: PAPER-HE-18/F5; Source-derived test of Theorems18/20; E3 — Supplies Admissible twisting datum to Square-zero coefficient counterexample datum.

Use: PAPER-HE-18/R4; §6.2 p.22 — Supplies Admissible twisting datum to Standard parahoric pair.

API:

- `He18.thetaWeyl` (projection): θ induces a length-preserving automorphism of W̃ and acts on Ω.
- `He18.characterKernel` (data): ker ω is an open normal subgroup; ω is constant on its cosets.
- `He18.twistTrivial` (constructor): θ=id and ω=1 give ordinary conjugation.

Tests (specified, not Lean-executed):

- θ=id,ω=1 satisfies every twisting hypothesis.
- On G_m, θ(g)=g⁻¹ induces m↦−m on W̃=Z, of order two.
- An abstract character without open kernel is not an admissible datum merely because its values are units.

### PAPER-HE-18/H1 — Compactly supported test-function carrier

definition; **library**. Locator: §1.2 p.7; pinned CompactlySupported.lean and LocallyConstant/Basic.lean.

For a topological space X and a discrete commutative ring R, use Mathlib's CompactlySupportedContinuousMap X R. By IsLocallyConstant.iff_continuous it is exactly the compactly supported locally constant R-valued functions. Its existing pointwise ring structure is not Hecke convolution.

Pinned declarations: `mathlib:CompactlySupportedContinuousMap`, `mathlib:CompactlySupportedContinuousMap.ext`, `mathlib:IsLocallyConstant.iff_continuous`.

Prerequisites: `mathlib:CompactlySupportedContinuousMap`, `mathlib:CompactlySupportedContinuousMap.ext`, `mathlib:IsLocallyConstant.iff_continuous`.

- Exact reuse of the carrier and continuous/discrete equivalence; no new competing C_c type.

Use: PAPER-HE-18/H2; §1.2 p.7; §3.2 p.14; §4.2 p.15 — Supplies Compactly supported test-function carrier to Uniform compact level for a test function.

Use: PAPER-HE-18/H3; §1.2 pp.6–7 — Supplies Compactly supported test-function carrier to Integral normalized Haar integration.

Use: PAPER-HE-18/H4; §1.2 pp.6–7; §1.3 p.7 — Supplies Compactly supported test-function carrier to Finite-sum Hecke convolution and scalar extension.

Use: PAPER-HE-18/H9; §1.3 p.7 — Supplies Compactly supported test-function carrier to Weighted twisted-conjugation representation.

Use: PAPER-HE-18/N11; §3.2 p.14 — Supplies Compactly supported test-function carrier to Compact-open right stabilizer and admissibility.

Use: PAPER-HE-18/N12; §3.1 p.14 — Supplies Compactly supported test-function carrier to Test functions supported in a Newton stratum.

Use: PAPER-HE-18/R8; §6.3 p.23 — Supplies Compactly supported test-function carrier to Local parahoric-coset test module.

Use: PAPER-HE-18/R12; Source-derived expansion of Theorem22 sheaf step pp.23–24 — Supplies Compactly supported test-function carrier to Finite clopen refinement of a compact support.

Use: PAPER-HE-18/R13; Source-derived repair of §§6.3–6.4 — Supplies Compactly supported test-function carrier to Compact-test cosheaf presentation.

API:

- `He18.testFunctionExt` (extensionality): Pointwise equality implies equality, using CompactlySupportedContinuousMap.ext.
- `He18.testFunctionSupport` (data): Every element has compact topological support.
- `He18.discreteLocallyConstant` (compatibility): For discrete R, membership in the continuous carrier implies local constancy, and conversely.

Tests (specified, not Lean-executed):

- For a two-point discrete X, evaluation identifies the carrier with R×R.
- The zero function has empty support.
- The constant function 1 on infinite discrete Z is not compactly supported when R is nontrivial.

### PAPER-HE-18/H2 — Uniform compact level for a test function

theorem; **missing**. Locator: §1.2 p.7; §3.2 p.14; §4.2 p.15.

For G locally profinite and f∈C_c(G,R_discrete), some compact open subgroup K makes f both left and right K-invariant. For the local reductive G, some I_n also has this property.

Prerequisites: `PAPER-HE-18/A3`, `PAPER-HE-18/H1`.

- Cover compact support by finitely many constant neighborhoods, choose subgroup neighborhoods with stable support, and intersect; apply separately on the left and right. Tau's compact-ambient stabilizer theorem alone does not cover noncompact G.

Use: PAPER-HE-18/H3; §1.2 pp.6–7 — Supplies Uniform compact level for a test function to Integral normalized Haar integration.

Use: PAPER-HE-18/H4; §1.2 pp.6–7; §1.3 p.7 — Supplies Uniform compact level for a test function to Finite-sum Hecke convolution and scalar extension.

Use: PAPER-HE-18/H6; §1.2 p.7 — Supplies Uniform compact level for a test function to Double-coset basis at compact level.

Use: PAPER-HE-18/L16; Corollary12 p.16 — Supplies Uniform compact level for a test function to Global Iwahori–Matsumoto-type generators.

### PAPER-HE-18/H3 — Integral normalized Haar integration

construction; **planned**. Locator: §1.2 pp.6–7.

Construct a finitely additive Z[1/p]-valued compact-open volume and integration on H_Z[1/p], with μ(I')=1 and μ(K)=[K:K∩I']/[I':K∩I']. Extend scalars to R. Reductive G is unimodular; θ preserves this normalization. Only pro-p compact open subgroups are automatically assigned unit volumes in R.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/A1`, `PAPER-HE-18/A3`, `PAPER-HE-18/H14`, `PAPER-HE-18/H15`, `PAPER-HE-18/H16`, `PAPER-HE-18/H24`, `PAPER-HE-18/N22`.

- Assemble the explicit finite-index and finite-sum constructions H14–H16, the Iwahori-generator unimodularity proof N22 and normalization invariance H24. This chosen proof no longer depends on an unread Vigneras integral-Haar theorem.

Use: PAPER-HE-18/H4; §1.2 pp.6–7; §1.3 p.7 — Supplies Integral normalized Haar integration to Finite-sum Hecke convolution and scalar extension.

Use: PAPER-HE-18/H11; Proposition1 pp.8–9 — Supplies Integral normalized Haar integration to Commutators equal coinvariant relations.

Use: PAPER-HE-18/F5; Source-derived test of Theorems18/20; E3 — Supplies Integral normalized Haar integration to Square-zero coefficient counterexample datum.

Use: PAPER-HE-18/R10; Theorem23 setup p.24 and proof p.25 — Supplies Integral normalized Haar integration to Local commutators equal local action relations.

API:

- `He18.compactOpenVolume` (simp): The displayed index ratio computes the volume of K.
- `He18.haarFiniteSum` (characterisation): For disjoint compact-open pieces U_i and constants r_i, integrate Σr_i1_Ui as Σr_iμ(U_i).
- `He18.haarBaseChange` (functoriality): A homomorphism R→S commutes with finite-sum integration.

Tests (specified, not Lean-executed):

- μ(I')=1.
- If K⊆I' has index p^a, μ(K)=p^(−a).
- For G=Q3× and R=F2, I'=1+3Z3 has volume 1 but μ(Z3×)=2=0; normalization by the latter is unavailable.

Open gaps: PAPER-HE-18/G3.

### PAPER-HE-18/H4 — Finite-sum Hecke convolution and scalar extension

construction; **planned**. Locator: §1.2 pp.6–7; §1.3 p.7.

On H_R=C_c(G,R_discrete) define (f*f')(g)=∫f(x)f'(x⁻¹g)dμ(x), using H3 finite sums. Obtain an associative R-bilinear product and identify H_Z[1/p]⊗R with H_R, compatibly with convolution. This is a separate algebra structure from pointwise multiplication.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H3`, `PAPER-HE-18/H17`, `PAPER-HE-18/H18`, `PAPER-HE-18/H19`.

- Use H17 for support and local constancy, H18 for associativity, and H19 for coefficient base change. These are arbitrary-ring finite-sum proofs, not a Bochner-integral substitution.

Use: PAPER-HE-18/H5; §1.2 p.7; §4.1 p.15 — Supplies Finite-sum Hecke convolution and scalar extension to Level Hecke submodule.

Use: PAPER-HE-18/H10; §1.3 p.7 — Supplies Finite-sum Hecke convolution and scalar extension to Twisted commutator submodule.

Use: PAPER-HE-18/H11; Proposition1 pp.8–9 — Supplies Finite-sum Hecke convolution and scalar extension to Commutators equal coinvariant relations.

Use: PAPER-HE-18/L10; Proposition13 p.16; proof §4.4 p.18 — Supplies Finite-sum Hecke convolution and scalar extension to Length-additive congruence convolution.

API:

- `He18.convolutionEvaluate` (simp): Evaluate on characteristic functions by finite counting of the multiplication fibre with its normalized volumes.
- `He18.convolutionAssociative` (structure): (f*g)*h=f*(g*h); addition and R-scaling distribute.
- `He18.scalarExtension` (equivalence): The natural map H_Z[1/p]⊗R→C_c(G,R_discrete) is an R-linear algebra equivalence for convolution.

Tests (specified, not Lean-executed):

- 1_K*1_K=μ(K)1_K for compact open K.
- When μ(K) is a unit, e_K=μ(K)⁻¹1_K is an idempotent.
- If μ(K)≠1, the convolution square of 1_K differs from its pointwise square.

Open gaps: PAPER-HE-18/G3.

### PAPER-HE-18/H5 — Level Hecke submodule

definition; **planned**. Locator: §1.2 p.7; §4.1 p.15.

For compact open K let H_R(G,K) be the submodule of H_R of K-bi-invariant functions. For K'⊆K there is an inclusion H_R(G,K)→H_R(G,K'). It is a convolution subalgebra; a unit e_K is asserted only when μ(K) is invertible.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H4`, `SmoothRepresentationsOfLocalGroups:SR.1`.

- Use H2 and double cosets, not a new unconstrained coefficient-function carrier.

Use: PAPER-HE-18/H6; §1.2 p.7 — Supplies Level Hecke submodule to Double-coset basis at compact level.

Use: PAPER-HE-18/L1; §4.2 p.15 — Supplies Level Hecke submodule to Congruence-level image in the ambient cocenter.

Use: PAPER-HE-18/L2; §4.2 p.15 — Supplies Level Hecke submodule to Iwahori-cell level functions.

Use: PAPER-HE-18/F1; §5.1 p.20 — Supplies Level Hecke submodule to Distributions supported on a twisted saturation.

API:

- `He18.levelMembership` (characterisation): f belongs exactly when f(k_1gk_2)=f(g) for k_1,k_2∈K.
- `He18.levelInclusion` (functoriality): Inclusions for K''⊆K'⊆K compose and agree with the ambient function.
- `He18.levelCorner` (compatibility): If μ(K) is a unit, H_R(G,K)=e_K H_R e_K.

Tests (specified, not Lean-executed):

- 1_K belongs to H_R(G,K).
- K'⊆K implies every K-bi-invariant f is K'-bi-invariant.
- For Q3× with F2 coefficients, μ(Z3×)=0, so e_(Z3×) is not defined by division.

### PAPER-HE-18/H6 — Double-coset basis at compact level

theorem; **missing**. Locator: §1.2 p.7.

For compact open K, H_R(G,K) is a free R-module with basis {1_KgK : KgK∈K\G/K}; each function uses finitely many double cosets. No assertion that this basis is a cocenter basis is made.

Prerequisites: `PAPER-HE-18/H5`, `PAPER-HE-18/H2`.

- The double-coset quotient is discrete, compact support maps to a finite subset, and disjoint supports give linear independence. Reuse Tau's coset/decomposition carrier.

Use: PAPER-HE-18/F2; Theorem20 proof p.21, valid primal conclusion — Supplies Double-coset basis at compact level to Finite generation from Ω-normalized level cells.

### PAPER-HE-18/H7 — Generic representation coinvariants

definition; **library**. Locator: Pinned RepresentationTheory/Coinvariants.lean, definitions ker and Coinvariants.

For a commutative ring R, monoid L and R-linear representation ρ on M, use Representation.Coinvariants ρ=M/span_R{ρ(l)m−m}. This generic library carrier is already present; the Hecke representation is H9.

Pinned declarations: `mathlib:Representation.Coinvariants`, `mathlib:Representation.Coinvariants.ker`, `mathlib:Representation.Coinvariants.mk`.

Prerequisites: `mathlib:Representation.Coinvariants`, `mathlib:Representation.Coinvariants.ker`, `mathlib:Representation.Coinvariants.mk`.

- Exact baseline reuse, including the sign-insensitive generated submodule.

Use: PAPER-HE-18/H8; Pinned RepresentationTheory/Coinvariants.lean, lift and hom_ext — Supplies Generic representation coinvariants to Coinvariant universal map.

Use: PAPER-HE-18/H12; §1.4 pp.8–9 — Supplies Generic representation coinvariants to Twisted cocenter.

API:

- `He18.coinvariantMk` (projection): Representation.Coinvariants.mk sends m to its quotient class and is surjective.
- `He18.coinvariantRelation` (simp): The classes of ρ(l)m and m agree.
- `He18.coinvariantLift` (universal-property): An R-linear map annihilating ρ(l)m−m factors uniquely through the quotient.

Tests (specified, not Lean-executed):

- The coinvariants of the trivial representation on M are canonically M.
- For C2 acting as −1 on Z, the coinvariants are Z/2Z.
- For that C2-action, invariants in Z are zero while coinvariants are nonzero.

### PAPER-HE-18/H8 — Coinvariant universal map

theorem; **library**. Locator: Pinned RepresentationTheory/Coinvariants.lean, lift and hom_ext.

Every R-linear u:M→N satisfying u(ρ(l)m)=u(m) factors uniquely through Representation.Coinvariants.mk. Use the pinned lift, lift_comp_mk and hom_ext statements; the target N is any R-module, not only R.

Pinned declarations: `mathlib:Representation.Coinvariants.lift`, `mathlib:Representation.Coinvariants.lift_comp_mk`, `mathlib:Representation.Coinvariants.hom_ext`.

Prerequisites: `PAPER-HE-18/H7`, `mathlib:Representation.Coinvariants.lift`, `mathlib:Representation.Coinvariants.lift_comp_mk`, `mathlib:Representation.Coinvariants.hom_ext`.

- Exact library quotient universal property.

Use: PAPER-HE-18/H12; §1.4 pp.8–9 — Supplies Coinvariant universal map to Twisted cocenter.

Use: PAPER-HE-18/R9; §6.3 p.23; universal repair of §6.4 — Supplies Coinvariant universal map to Local invariant distributions.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Coinvariant universal map to Rigid cocenter generators and relations.

### PAPER-HE-18/H9 — Weighted twisted-conjugation representation

construction; **missing**. Locator: §1.3 p.7.

For A4 define T_x f(g)=ω(x)f(x⁻¹gθ(x)) on H_R. This gives an R-linear G-representation with T_xT_y=T_(xy), T_1=id, inverse T_(x⁻¹), and support x supp(f)θ(x)⁻¹.

Prerequisites: `PAPER-HE-18/A4`, `PAPER-HE-18/H1`.

- Precompose by the twisted-conjugation homeomorphism and multiply by a unit; compute the group law exactly.

Use: PAPER-HE-18/H11; Proposition1 pp.8–9 — Supplies Weighted twisted-conjugation representation to Commutators equal coinvariant relations.

Use: PAPER-HE-18/N15; Theorem10(2) proof p.15 — Supplies Weighted twisted-conjugation representation to Commutator relations split by Newton component.

Use: PAPER-HE-18/F6; Source-derived counterexample; E3 — Supplies Weighted twisted-conjugation representation to Failure of arbitrary-ring Howe finite generation.

Use: PAPER-HE-18/R8; §6.3 p.23 — Supplies Weighted twisted-conjugation representation to Local parahoric-coset test module.

Use: PAPER-HE-18/R11; Corrected §6.4 p.24; E4 — Supplies Weighted twisted-conjugation representation to Inverse-transport overlap graph.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Weighted twisted-conjugation representation to Double-coset descent of overlap relations.

Use: PAPER-HE-18/R18; Source-derived counterexample to §6.4; E4 — Supplies Weighted twisted-conjugation representation to Concrete failure of forward overlap transport.

Use: PAPER-HE-18/L18; Derived from He18 §1.3, Proposition1, and the Ω-normalization used at the start of Lemma16 p.17 — Supplies Weighted twisted-conjugation representation to Length-zero twisted transport preserves a level cell.

API:

- `He18.twistedTranslateEval` (simp): (T_xf)(g)=ω(x)f(x⁻¹gθ(x)).
- `He18.twistedTranslateSupport` (compatibility): The support is the twisted translate of supp(f), since ω(x) is a unit.
- `He18.twistedTranslateComp` (functoriality): T_x∘T_y=T_(xy), with inverse T_(x⁻¹).

Tests (specified, not Lean-executed):

- θ=id,ω=1 gives pullback along ordinary conjugation.
- If G is abelian and θ=id, T_xf=ω(x)f.
- T_(x⁻¹)(T_xf)=f, including both character weights.

### PAPER-HE-18/H10 — Twisted commutator submodule

definition; **missing**. Locator: §1.3 p.7.

Let C_(θ,ω) be the R-span in H_R of 1_X*1_Y−ω(X)⁻¹1_Y*1_(θ(X)), where X,Y are compact open and ω is constant on X. This is a submodule, not declared a two-sided ideal.

Prerequisites: `PAPER-HE-18/H4`, `PAPER-HE-18/A4`.

- Use compact-open characteristic functions; ω(X) is a well-defined unit for nonempty X, and ignore empty generators.

Use: PAPER-HE-18/H11; Proposition1 pp.8–9 — Supplies Twisted commutator submodule to Commutators equal coinvariant relations.

Use: PAPER-HE-18/L12; Lemma17(1) pp.18–19 — Supplies Twisted commutator submodule to Equal-length cell reduction in the cocenter.

Use: PAPER-HE-18/L13; Lemma17(2) pp.18–19 — Supplies Twisted commutator submodule to Decreasing cell reduction in the cocenter.

API:

- `He18.commutatorGenerator` (constructor): Each displayed compact-open commutator belongs to C_(θ,ω).
- `He18.commutatorSpan` (characterisation): C_(θ,ω) is the least submodule containing these generators.
- `He18.commutatorRefinement` (compatibility): Refining X or Y into disjoint compact opens with constant ω preserves the generated relation.

Tests (specified, not Lean-executed):

- The formula reduces to 1_X*1_Y−1_Y*1_X.
- For an abelian G with θ=id,ω=1, C_(θ,ω)=0.
- For a finite group and X={a},Y={b}, the generator is δ_ab−ω(a)⁻¹δ_(bθ(a)); replacing the inverse changes the prescribed relation.

### PAPER-HE-18/H11 — Commutators equal coinvariant relations

theorem; **missing**. Locator: Proposition1 pp.8–9.

For the local datum, C_(theta,omega)=span_R{f-T_xf}. More generally this holds for any unimodular locally profinite group with cofinal compact open pro-p subgroups, p invertible in R, a volume-preserving continuous theta and smooth unit character omega. No theta-stable cofinal subgroup basis or finite order of theta on G is needed for this comparison.

Prerequisites: `PAPER-HE-18/H10`, `PAPER-HE-18/H21`, `PAPER-HE-18/H22`, `PAPER-HE-18/H23`.

- H21 identifies the printed compact-open generators with general f*h-h*tau(f), by finite partitions on which omega is constant.
- H22 proves one inclusion by an actual finite module-valued integral; H23 proves the reverse inclusion using asymmetric local units.

Use: PAPER-HE-18/H12; §1.4 pp.8–9 — Supplies Commutators equal coinvariant relations to Twisted cocenter.

Use: PAPER-HE-18/N15; Theorem10(2) proof p.15 — Supplies Commutators equal coinvariant relations to Commutator relations split by Newton component.

Use: PAPER-HE-18/R10; Theorem23 setup p.24 and proof p.25 — Supplies Commutators equal coinvariant relations to Local commutators equal local action relations.

Use: PAPER-HE-18/L18; Derived from He18 §1.3, Proposition1, and the Ω-normalization used at the start of Lemma16 p.17 — Supplies Commutators equal coinvariant relations to Length-zero twisted transport preserves a level cell.

Open gaps: PAPER-HE-18/G3.

### PAPER-HE-18/H12 — Twisted cocenter

definition; **missing**. Locator: §1.4 pp.8–9.

Define H̄_R=H_R/C_(θ,ω). Via H11 it is canonically Representation.Coinvariants of H9. It is an R-module; no multiplication on this quotient is asserted.

Prerequisites: `PAPER-HE-18/H7`, `PAPER-HE-18/H8`, `PAPER-HE-18/H11`.

- Implement as the existing generic coinvariant carrier with a named Hecke comparison, rather than a second quotient theory.

Use: PAPER-HE-18/H13; §1.4 pp.8–9 — Supplies Twisted cocenter to Invariant distributions.

Use: PAPER-HE-18/N14; §3.1 p.14 — Supplies Twisted cocenter to Newton component of the cocenter.

Use: PAPER-HE-18/L1; §4.2 p.15 — Supplies Twisted cocenter to Congruence-level image in the ambient cocenter.

Use: PAPER-HE-18/L2; §4.2 p.15 — Supplies Twisted cocenter to Iwahori-cell level functions.

API:

- `He18.cocenterProjection` (projection): q:H_R→H̄_R is surjective with kernel C_(θ,ω).
- `He18.cocenterCoinvariants` (equivalence): H11 identifies H̄_R with the library's coinvariants of H9.
- `He18.cocenterLift` (universal-property): Every invariant R-linear test-function map to any R-module factors uniquely through q.

Tests (specified, not Lean-executed):

- For abelian G with θ=id,ω=1, q is an isomorphism of R-modules.
- For abelian G and θ=id, H̄_R=H_R/Σ_x(ω(x)−1)H_R.
- In the rational group algebra of S3, δ_(12) is not central, but its nonzero class is a valid cocenter element; centrality is not membership in the quotient.

### PAPER-HE-18/H13 — Invariant distributions

definition; **missing**. Locator: §1.4 pp.8–9.

Let J(G)=Hom_R(H̄_R,R), equivalently R-linear maps j:H_R→R with j(T_xf)=j(f). No topology on this dual and no finite-support condition on the family of component restrictions is imposed.

Prerequisites: `PAPER-HE-18/H12`.

- Use the quotient universal property; the contragredient action is (xj)(f)=j(T_(x⁻¹)f).

Use: PAPER-HE-18/N17; Corrected §5.2 p.20; source issue E2 — Supplies Invariant distributions to Product decomposition of invariant distributions.

Use: PAPER-HE-18/F1; §5.1 p.20 — Supplies Invariant distributions to Distributions supported on a twisted saturation.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Invariant distributions to Rigid support and rigid cocenter.

API:

- `He18.distributionEvaluate` (data): Evaluate j on a compactly supported test function, R-linearly.
- `He18.invariantDistribution` (characterisation): A linear functional factors through H̄_R exactly when it kills f−T_xf.
- `He18.distributionTransport` (functoriality): Dual transport uses x⁻¹; (xj)(f)=j(T_(x⁻¹)f).

Tests (specified, not Lean-executed):

- The zero functional is invariant for every twist.
- For θ=id,ω=1 on F×, Haar integration is nonzero on every valuation coset.
- That Haar distribution has infinitely many nonzero valuation-component restrictions, despite every input function having finite support in valuation.

### PAPER-HE-18/C1 — Twisted Kottwitz class

definition; **missing**. Locator: §2.1 p.9.

For W̃=Wa⋊Ω with Ω abelian, define Ω_θ=Ω/(1−θ)Ω and κ(w) as the image of w in Ω_θ. Distinguish coinvariant classes from finite ordinary θ-orbits.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A4`.

- Project to Ω and then take the abelian coinvariant quotient.

Use: PAPER-HE-18/C3; §2.1 p.9 — Supplies Twisted Kottwitz class to Newton invariance and arithmetic classifier.

Use: PAPER-HE-18/C10; Corrected §2.1(a) p.9; source issue E1 — Supplies Twisted Kottwitz class to Finite Ω-cosets under an explicit guard.

Use: PAPER-HE-18/C17; Source-derived correction of He18 §2.1(a), Corollary9 pp.9–12; HN14 Theorem3.4 supplies the guarded standard-triple input — Supplies Twisted Kottwitz class to Finite minimal representatives after Ω transport.

API:

- `He18.kottwitzProject` (projection): κ is the composite W̃→Ω→Ω_θ.
- `He18.kottwitzTwisted` (compatibility): κ(xwθ(x)⁻¹)=κ(w).
- `He18.kottwitzOrdinary` (simp): For θ=id, Ω_θ=Ω.

Tests (specified, not Lean-executed):

- For W̃=Z, θ=−1, κ(m) is m modulo 2.
- κ(1)=0 in additive notation.
- The twisted orbit of 0 under Ω=Z with θ=−1 is 2Z, not the ordinary θ-orbit {0}.

### PAPER-HE-18/C2 — Newton vector by a twisted power

definition; **missing**. Locator: §2.1 p.9; HN14 §1.1.

On the actual full affine apartment use phi=w theta and C18: choose a positive power killing its linear part, take its translation displacement lambda and set nu_w=lambda/d. Take the dominant W0 representative. In a valid split translation presentation this recovers the source formula; no such splitting or faithfulness is needed for the definition. The Tits negative-valuation convention is fixed in A8, and algebraic cocharacters evaluated at a uniformizer must be compared with this displacement convention.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A4`, `PAPER-HE-18/A8`, `PAPER-HE-18/A9`, `PAPER-HE-18/C18`.

- Use the actual rational-character apartment A8/A9 and the affine averaging theorem C18. The HN14 transfer of its reduced datum to the actual group is still G4.

Use: PAPER-HE-18/C3; §2.1 p.9 — Supplies Newton vector by a twisted power to Newton invariance and arithmetic classifier.

Use: PAPER-HE-18/C13; HN14 §§1.1,2.1–2.2 — Supplies Newton vector by a twisted power to Newton affine axis.

Use: PAPER-HE-18/N7; §2.6 pp.12–13, corrected proof target — Supplies Newton vector by a twisted power to Separation of distinct Newton power growth.

Use: PAPER-HE-18/R1; §6.1 p.21 — Supplies Newton vector by a twisted power to Newton centralizer Levi.

Use: PAPER-HE-18/N19; Source-derived elementary affine argument replacing He18 §2.6 p.13 final inequality — Supplies Newton vector by a twisted power to Finite affine errors separate distinct translation slopes.

API:

- `He18.newtonPower` (characterisation): If the affine action of (w theta)^n is translation by lambda, then n nu_w=lambda in the full apartment vector space.
- `He18.dominantNewton` (data): ν̄_w is the unique dominant vector in W0ν_w.
- `He18.newtonTranslation` (simp): For θ=id, ν_(t^λ)=λ.

Tests (specified, not Lean-executed):

- For G_m and theta=id, a translation of displacement m has nu=m. Under the Tits negative-valuation convention a uniformizer has displacement -1.
- For G_m, θ=−1, (mθ)^2=0 and ν_m=0.
- The central translation (1,1) for GL2 has Newton vector (1,1), not zero despite length zero.

Open gaps: PAPER-HE-18/G1.

### PAPER-HE-18/C3 — Newton invariance and arithmetic classifier

theorem; **missing**. Locator: §2.1 p.9.

Under C2's affine datum, ν̄_(xwθ(x)⁻¹)=ν̄_w and π=(κ,ν̄) descends to θ-conjugacy classes. Non-dominant Newton vectors transform by the linear part of x, not generally by equality.

Prerequisites: `PAPER-HE-18/C1`, `PAPER-HE-18/C2`.

- Take common powers and compare translation parts under affine conjugation; pass to the dominant representative.

Use: PAPER-HE-18/C7; Theorem6 p.11; HN14 Theorem3.3 — Supplies Newton invariance and arithmetic classifier to Straight-class arithmetic classification.

Use: PAPER-HE-18/N1; §2.2 pp.9–10 — Supplies Newton invariance and arithmetic classifier to Newton strata of the local group.

Use: PAPER-HE-18/R5; Proposition21 first half p.22 — Supplies Newton invariance and arithmetic classifier to Minimal finite-parabolic elements are globally minimal.

Use: PAPER-HE-18/C17; Source-derived correction of He18 §2.1(a), Corollary9 pp.9–12; HN14 Theorem3.4 supplies the guarded standard-triple input — Supplies Newton invariance and arithmetic classifier to Finite minimal representatives after Ω transport.

### PAPER-HE-18/C4 — Length-nonincreasing twisted reduction

definition; **missing**. Locator: §2.3 p.10.

Write w→_θ w' for a finite chain of moves u↦suθ(s) with s an affine simple reflection and nonincreasing Coxeter length; w≈_θ w' means reachability in both directions. Let W̃_min be the elements minimal in their full θ-conjugacy class.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A4`.

- Use reflexive-transitive closure; do not use only finite simple reflections.

Use: PAPER-HE-18/C5; Theorem4 p.10; HN14 Theorem2.9 — Supplies Length-nonincreasing twisted reduction to Affine twisted RedMin.

Use: PAPER-HE-18/C8; Theorem7 and Remark8 p.11 — Supplies Length-nonincreasing twisted reduction to Standard affine reduction triple.

Use: PAPER-HE-18/C14; HN14 Proposition2.4, §§2.1–2.2 — Supplies Length-nonincreasing twisted reduction to Gradient descent to an axis alcove.

Use: PAPER-HE-18/C15; HN14 §2.4 Theorem2.5 and Proposition2.7 — Supplies Length-nonincreasing twisted reduction to Finite-parabolic partial conjugation reduction.

Use: PAPER-HE-18/N1; §2.2 pp.9–10 — Supplies Length-nonincreasing twisted reduction to Newton strata of the local group.

Use: PAPER-HE-18/N3; §2.4(1) p.10 — Supplies Length-nonincreasing twisted reduction to Equal-length reduction preserves saturated cells.

Use: PAPER-HE-18/R5; Proposition21 first half p.22 — Supplies Length-nonincreasing twisted reduction to Minimal finite-parabolic elements are globally minimal.

API:

- `He18.reductionStep` (constructor): A simple twisted conjugation of nonincreasing length gives a reduction.
- `He18.reductionTrans` (functoriality): Reduction is reflexive and transitive; ≈_θ is the induced equal-length equivalence.
- `He18.minimalLength` (characterisation): w∈W̃_min exactly when ℓ(w)≤ℓ(xwθ(x)⁻¹) for every x.

Tests (specified, not Lean-executed):

- w→_θw.
- A move with ℓ(swθ(s))>ℓ(w) is not a permitted elementary reduction.
- The affine wall reflection s0 is permitted even when it is not a finite simple root reflection.

### PAPER-HE-18/C5 — Affine twisted RedMin

theorem; **missing**. Locator: Theorem4 p.10; HN14 Theorem2.9.

For an extended affine Weyl datum in the He–Nie scope, every w admits w0∈W̃_min with w→_θw0. Transport to the actual local Iwahori–Weyl group requires G1; the finite diagram-action proof must not discard central translation data.

Prerequisites: `PAPER-HE-18/C4`, `PAPER-HE-18/C14`, `PAPER-HE-18/C15`, `PAPER-HE-18/C16`.

- HN14 uses gradient descent to an alcove meeting the Newton affine axis, partial conjugation and induction on finite parabolic factors. Its omitted HN finite-group details remain G4.

Use: PAPER-HE-18/C7; Theorem6 p.11; HN14 Theorem3.3 — Supplies Affine twisted RedMin to Straight-class arithmetic classification.

Use: PAPER-HE-18/C9; Theorem7 and Remark8 p.11; HN14 Proposition2.7 — Supplies Affine twisted RedMin to Reduction to a standard triple.

Use: PAPER-HE-18/C12; Corollary9 second assertion p.12 — Supplies Affine twisted RedMin to Finite conjugacy-class fibres without the finite-minima guard.

Use: PAPER-HE-18/N5; Proposition5 pp.10–11 — Supplies Affine twisted RedMin to Compact sets meet finitely many Newton strata.

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Affine twisted RedMin to Minimal-cell generators at each level.

Use: PAPER-HE-18/R6; Proposition21 second half p.23; HN14 Corollary2.8 — Supplies Affine twisted RedMin to Central-Newton minimal elements lie in a standard pair.

Open gaps: PAPER-HE-18/G1, PAPER-HE-18/G4.

### PAPER-HE-18/C6 — Straight twisted elements

definition; **missing**. Locator: §2.5 p.11.

An element w is θ-straight if ℓ((wθ)^k)=kℓ(w) for every positive integer k, with ℓ(θ)=0. A θ-conjugacy class is straight if it contains such an element.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A4`.

- Use the affine extension's length; retain the distinction between straightness and merely minimal length.

Use: PAPER-HE-18/C7; Theorem6 p.11; HN14 Theorem3.3 — Supplies Straight twisted elements to Straight-class arithmetic classification.

Use: PAPER-HE-18/C8; Theorem7 and Remark8 p.11 — Supplies Straight twisted elements to Standard affine reduction triple.

API:

- `He18.straightPowers` (characterisation): The equality holds for all positive powers, not just k=1.
- `He18.straightTranslation` (example): A translation is straight in the ordinary affine Weyl setting.
- `He18.straightClass` (data): A class is straight by an exhibited straight representative.

Tests (specified, not Lean-executed):

- 1 is straight for θ=id.
- If s is simple, ℓ(s)=1 and ℓ(s²)=0, so s is not straight.
- Every central translation of length zero is straight.

### PAPER-HE-18/C7 — Straight-class arithmetic classification

theorem; **missing**. Locator: Theorem6 p.11; HN14 Theorem3.3.

For the affine datum of C5, π gives a bijection from θ-straight conjugacy classes to Im π. Within a straight class, the straight elements are exactly the minimal-length elements.

Prerequisites: `PAPER-HE-18/C3`, `PAPER-HE-18/C5`, `PAPER-HE-18/C6`.

- Use HN14's straight-class construction and uniqueness, preserving the actual translation lattice. The source's reduction to coroot-span/finite Ω needs a central-kernel adapter G1.

Use: PAPER-HE-18/C9; Theorem7 and Remark8 p.11; HN14 Proposition2.7 — Supplies Straight-class arithmetic classification to Reduction to a standard triple.

Use: PAPER-HE-18/C11; Corrected Corollary9 first assertion p.12 — Supplies Straight-class arithmetic classification to Finite minimal elements in a guarded Newton fibre.

Use: PAPER-HE-18/C17; Source-derived correction of He18 §2.1(a), Corollary9 pp.9–12; HN14 Theorem3.4 supplies the guarded standard-triple input — Supplies Straight-class arithmetic classification to Finite minimal representatives after Ω transport.

Open gaps: PAPER-HE-18/G1, PAPER-HE-18/G4.

### PAPER-HE-18/C8 — Standard affine reduction triple

definition; **missing**. Locator: Theorem7 and Remark8 p.11.

A standard triple consists of a θ-straight x, K⊆S̃ with W_K finite, x minimal in W_K\W̃, Ad(x)θ(K)=K, and u∈W_K. It is associated to w when w→_θux and π(x)=π(w).

Prerequisites: `PAPER-HE-18/C4`, `PAPER-HE-18/C6`.

- Carry the finite-parabolic hypothesis explicitly; it is what bounds errors in powers.

Use: PAPER-HE-18/C9; Theorem7 and Remark8 p.11; HN14 Proposition2.7 — Supplies Standard affine reduction triple to Reduction to a standard triple.

Use: PAPER-HE-18/N6; §2.6 equation(a) pp.12–13 — Supplies Standard affine reduction triple to Bounded finite-parabolic error in twisted powers.

Use: PAPER-HE-18/R5; Proposition21 first half p.22 — Supplies Standard affine reduction triple to Minimal finite-parabolic elements are globally minimal.

Use: PAPER-HE-18/R6; Proposition21 second half p.23; HN14 Corollary2.8 — Supplies Standard affine reduction triple to Central-Newton minimal elements lie in a standard pair.

API:

- `He18.tripleStraightPart` (projection): Return x together with straightness and its arithmetic class.
- `He18.tripleFinitePart` (data): Return K,u and finiteness of W_K.
- `He18.tripleReduction` (compatibility): An associated triple certifies a reduction w→_θux.

Tests (specified, not Lean-executed):

- For K=∅, W_K={1}, so u=1.
- A K with Ad(x)θ(K)≠K does not define a standard triple.
- Taking all affine simple reflections in an irreducible affine group fails the finiteness condition.

### PAPER-HE-18/C9 — Reduction to a standard triple

theorem; **missing**. Locator: Theorem7 and Remark8 p.11; HN14 Proposition2.7.

For every w in C5's scope there is an associated standard triple. If w is minimal then w≈_θux. Consequently minimal cells can be replaced, after twisted saturation, by cells of finite-parabolic times straight elements.

Prerequisites: `PAPER-HE-18/C5`, `PAPER-HE-18/C7`, `PAPER-HE-18/C8`, `PAPER-HE-18/C16`.

- Use the Newton-axis alcove construction and finite parabolic component of HN14; same length upgrades reduction to ≈.

Use: PAPER-HE-18/C11; Corrected Corollary9 first assertion p.12 — Supplies Reduction to a standard triple to Finite minimal elements in a guarded Newton fibre.

Use: PAPER-HE-18/N8; Theorem3 p.10; proof §2.6 pp.12–13 — Supplies Reduction to a standard triple to Newton partition of G.

Use: PAPER-HE-18/L17; §4.6 p.19 — Supplies Reduction to a standard triple to Standard-triple support representatives.

Use: PAPER-HE-18/C17; Source-derived correction of He18 §2.1(a), Corollary9 pp.9–12; HN14 Theorem3.4 supplies the guarded standard-triple input — Supplies Reduction to a standard triple to Finite minimal representatives after Ω transport.

Open gaps: PAPER-HE-18/G4.

### PAPER-HE-18/C10 — Finite Ω-cosets under an explicit guard

theorem; **missing**. Locator: Corrected §2.1(a) p.9; source issue E1.

If the fibre of Ω→Ω_θ over κ is finite, then all w with κ(w)=κ belong to finitely many Wa-cosets. Finite order of θ alone does not imply this hypothesis.

Prerequisites: `PAPER-HE-18/C1`.

- Use the preimage fibre itself; it is a coset of (1−θ)Ω. No inference from ordinary θ-orbits is made.

Use: PAPER-HE-18/C11; Corrected Corollary9 first assertion p.12 — Supplies Finite Ω-cosets under an explicit guard to Finite minimal elements in a guarded Newton fibre.

### PAPER-HE-18/C11 — Finite minimal elements in a guarded Newton fibre

theorem; **missing**. Locator: Corrected Corollary9 first assertion p.12.

Assume the finite-minima guard and C9. For ν∈Im π there are finitely many w∈W̃_min with π(w)=ν: their lengths are at most ℓ(x)+max{ℓ(u):u∈W_K,K⊆S̃,W_K finite} for a straight x of class ν.

Prerequisites: `PAPER-HE-18/C7`, `PAPER-HE-18/C9`, `PAPER-HE-18/C10`.

- The straight length depends only on ν; finite S̃ bounds the finite-parabolic part. A length ball in each fixed Wa-coset is finite.

### PAPER-HE-18/C12 — Finite conjugacy-class fibres without the finite-minima guard

theorem; **missing**. Locator: Corollary9 second assertion p.12.

Under C17 and existence of minimal representatives (C5), every fibre of π on θ-conjugacy classes is finite. The finite set S(ν,τ0) surjects onto the class fibre, even when the full minimal-element set is infinite.

Prerequisites: `PAPER-HE-18/C5`, `PAPER-HE-18/C17`.

- Choose a minimal representative of each class, then Ω-normalize it by C17. This gives a surjection from the finite representative set onto the fibre.

### PAPER-HE-18/C13 — Newton affine axis

definition; **missing**. Locator: HN14 §§1.1,2.1–2.2.

For an affine isometry wθ of the reduced root space, define V_(wθ)={v:(wθ)(v)=v+ν_w}. HN14 uses an invariant inner product and orthogonal projection to this nonempty affine subspace; the central complement is retained separately.

Prerequisites: `PAPER-HE-18/C2`.

- Define the equalizer affine subspace and construct a point by finite averaging after subtracting the Newton translation.

Use: PAPER-HE-18/C14; HN14 Proposition2.4, §§2.1–2.2 — Supplies Newton affine axis to Gradient descent to an axis alcove.

Use: PAPER-HE-18/C15; HN14 §2.4 Theorem2.5 and Proposition2.7 — Supplies Newton affine axis to Finite-parabolic partial conjugation reduction.

Use: PAPER-HE-18/C16; HN14 Proposition2.7 and Lemma2.6 — Supplies Newton affine axis to Axis-alcove parabolic factorization.

API:

- `He18.axisMembership` (characterisation): v lies on the axis exactly when (wθ)v−v=ν_w.
- `He18.axisProjection` (constructor): Orthogonal projection fixes the axis pointwise and is unique.
- `He18.axisAffineConjugacy` (compatibility): Affine conjugation transports the axis and Newton vector together.

Tests (specified, not Lean-executed):

- For t^λ the axis is all V.
- For reflection v↦−v on R, the axis is {0}.
- Passing to the coroot span alone forgets the central component of a GL2 translation; it is not the full Newton datum.

### PAPER-HE-18/C14 — Gradient descent to an axis alcove

theorem; **missing**. Locator: HN14 Proposition2.4, §§2.1–2.2.

In HN14's reduced affine reflection arrangement, from any alcove there is a chain of length-nonincreasing conjugations ending at an alcove whose closure meets a suitable regular point of V_(wθ).

Prerequisites: `PAPER-HE-18/C13`, `PAPER-HE-18/C4`.

- Follow the gradient flow of squared displacement to the orthogonal projection and track crossed walls. HN14 explicitly omits details by citing its finite-Weyl predecessor; these details are G4, not routine automation.

Use: PAPER-HE-18/C5; Theorem4 p.10; HN14 Theorem2.9 — Supplies Gradient descent to an axis alcove to Affine twisted RedMin.

Open gaps: PAPER-HE-18/G4.

### PAPER-HE-18/C15 — Finite-parabolic partial conjugation reduction

theorem; **missing**. Locator: HN14 §2.4 Theorem2.5 and Proposition2.7.

Let J be a subset of the simple reflections with W_J finite, and O a W_J-conjugation orbit in the extended Coxeter group. There is z∈^J W̃ such that every y∈O reduces to uz for some u∈W_I(J,z), where I(J,z) is the largest subset K⊆J with z(K)=K. For θ-twisted conjugation apply this to the component W̃θ in the semidirect extension.

Prerequisites: `PAPER-HE-18/C4`, `PAPER-HE-18/C13`.

- Decompose the source's partial-conjugation theorem from He2007 and finite-Weyl RedMin before claiming C5 proof closure; the precise import is G4.

Use: PAPER-HE-18/C5; Theorem4 p.10; HN14 Theorem2.9 — Supplies Finite-parabolic partial conjugation reduction to Affine twisted RedMin.

Open gaps: PAPER-HE-18/G4.

### PAPER-HE-18/C16 — Axis-alcove parabolic factorization

theorem; **missing**. Locator: HN14 Proposition2.7 and Lemma2.6.

For w̃ in the affine extension, a w̃-stable affine subspace K⊆V_w̃ and an alcove A whose closure contains a regular point of K, write w̃_A=u x with u∈W_I(K,A), x minimal on both sides for that parabolic, x(I(K,A))=I(K,A), ℓ(u)=#H_K(A,w̃A), and ℓ(x)=〈ν̄_w̃,2ρ〉.

Prerequisites: `PAPER-HE-18/C13`.

- Split off the finite hyperplanes containing K. Count the remaining hyperplane crossings along the line v+nν; use finite-parabolic normalization to compare powers. Root-length input from upstream; the elementary hyperplane proof is read.

Use: PAPER-HE-18/C5; Theorem4 p.10; HN14 Theorem2.9 — Supplies Axis-alcove parabolic factorization to Affine twisted RedMin.

Use: PAPER-HE-18/C9; Theorem7 and Remark8 p.11; HN14 Proposition2.7 — Supplies Axis-alcove parabolic factorization to Reduction to a standard triple.

Use: PAPER-HE-18/R6; Proposition21 second half p.23; HN14 Corollary2.8 — Supplies Axis-alcove parabolic factorization to Central-Newton minimal elements lie in a standard pair.

Open gaps: PAPER-HE-18/G4.

### PAPER-HE-18/N1 — Newton strata of the local group

definition; **missing**. Locator: §2.2 pp.9–10.

For ν=(κ,v)∈Ω_θ×V_+, let X_ν=⋃_{w∈W̃_min,π(w)=ν} IẇI and G(ν)=G·_θX_ν. X_ν is compact only when the minimal-index set is finite; it is not built into the definition. Empty fibres give empty strata.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/C3`, `PAPER-HE-18/C4`.

- Take actual double cosets then twisted-conjugacy saturation. These are subsets of G(F), not Frobenius strata of Bun_G.

Use: PAPER-HE-18/N5; Proposition5 pp.10–11 — Supplies Newton strata of the local group to Compact sets meet finitely many Newton strata.

Use: PAPER-HE-18/N9; §3.2 p.14 — Supplies Newton strata of the local group to Newton strata are clopen.

Use: PAPER-HE-18/N15; Theorem10(2) proof p.15 — Supplies Newton strata of the local group to Commutator relations split by Newton component.

Use: PAPER-HE-18/N20; Source-derived replacement of the compact-core claims in He18 Introduction and §5.2 — Supplies Newton strata of the local group to Compact Newton core in one Ω coset.

API:

- `He18.newtonStratumMem` (characterisation): g∈G(ν) iff it is θ-conjugate to an element of some minimal cell of invariant ν.
- `He18.newtonCellInclusion` (constructor): A minimal cell with π(w)=ν is contained in G(ν).
- `He18.newtonStratumStable` (structure): Each G(ν) is stable under all θ-conjugations.

Tests (specified, not Lean-executed):

- If ν∉Im π, then G(ν)=∅.
- For θ=id on G_m, valuation m is exactly the Newton stratum with κ=m,ν=m.
- For G_m with inversion, X_(parity,0) contains infinitely many valuation cosets and is not compact.

### PAPER-HE-18/N2 — Length-sensitive simple Bruhat multiplication

theorem; **missing**. Locator: §2.4 p.10.

For s∈S̃, IṡI·IẇI=IṡẇI when ℓ(sw)=ℓ(w)+1, and equals the disjoint union IṡẇI⊔IẇI when ℓ(sw)=ℓ(w)−1; the analogous right formula holds. This sharp branch classification exceeds the pinned abstract Tits either/or theorem alone.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A5`.

- Import the local double Tits system and exchange/length; specialize the abstract product theorem and determine the branch.

Use: PAPER-HE-18/N3; §2.4(1) p.10 — Supplies Length-sensitive simple Bruhat multiplication to Equal-length reduction preserves saturated cells.

Use: PAPER-HE-18/N4; §2.4(2) p.10 — Supplies Length-sensitive simple Bruhat multiplication to Decreasing reduction splits saturated cells.

Use: PAPER-HE-18/N6; §2.6 equation(a) pp.12–13 — Supplies Length-sensitive simple Bruhat multiplication to Bounded finite-parabolic error in twisted powers.

Use: PAPER-HE-18/L7; Lemma16 proof p.17 — Supplies Length-sensitive simple Bruhat multiplication to Reduced-word contracted multiplication at level.

Use: PAPER-HE-18/L10; Proposition13 p.16; proof §4.4 p.18 — Supplies Length-sensitive simple Bruhat multiplication to Length-additive congruence convolution.

Use: PAPER-HE-18/L13; Lemma17(2) pp.18–19 — Supplies Length-sensitive simple Bruhat multiplication to Decreasing cell reduction in the cocenter.

### PAPER-HE-18/N3 — Equal-length reduction preserves saturated cells

theorem; **missing**. Locator: §2.4(1) p.10.

If w≈_θw', then G·_θIẇI=G·_θIẇ'I.

Prerequisites: `PAPER-HE-18/C4`, `PAPER-HE-18/N2`.

- For a simple equal-length step rotate factors under θ-conjugation; iterate the chain.

Use: PAPER-HE-18/N5; Proposition5 pp.10–11 — Supplies Equal-length reduction preserves saturated cells to Compact sets meet finitely many Newton strata.

Use: PAPER-HE-18/N8; Theorem3 p.10; proof §2.6 pp.12–13 — Supplies Equal-length reduction preserves saturated cells to Newton partition of G.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Equal-length reduction preserves saturated cells to Rigid standard-pair covering.

### PAPER-HE-18/N4 — Decreasing reduction splits saturated cells

theorem; **missing**. Locator: §2.4(2) p.10.

If s∈S̃ and ℓ(swθ(s))<ℓ(w), then G·_θIẇI=(G·_θIṡẇI)∪(G·_θIṡẇθ(ṡ)I). The condition contains θ(s), correcting the printed sws.

Prerequisites: `PAPER-HE-18/A4`, `PAPER-HE-18/N2`.

- Use the two Bruhat branches after twisting the right simple factor; the union need not be disjoint after saturation.

Use: PAPER-HE-18/N5; Proposition5 pp.10–11 — Supplies Decreasing reduction splits saturated cells to Compact sets meet finitely many Newton strata.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Decreasing reduction splits saturated cells to Rigid standard-pair covering.

### PAPER-HE-18/N5 — Compact sets meet finitely many Newton strata

theorem; **missing**. Locator: Proposition5 pp.10–11.

Every compact X⊆G is contained in a finite union of the subsets G(ν); after partition is proved, this says it meets finitely many nonempty strata.

Prerequisites: `PAPER-HE-18/C5`, `PAPER-HE-18/N1`, `PAPER-HE-18/N3`, `PAPER-HE-18/N4`, `PAPER-HE-18/A5`.

- A compact set meets finitely many open I-double cosets. Induct on length of each cell using RedMin and the two decreasing branches. This proof does not use finite X_ν.

Use: PAPER-HE-18/N8; Theorem3 p.10; proof §2.6 pp.12–13 — Supplies Compact sets meet finitely many Newton strata to Newton partition of G.

Use: PAPER-HE-18/N13; Theorem10(1) and proof pp.14–15; §4.1 — Supplies Compact sets meet finitely many Newton strata to Newton direct sum of test functions.

Use: PAPER-HE-18/F4; Corrected Theorem18 and §5.3 pp.20–21 — Supplies Compact sets meet finitely many Newton strata to Field-valued Howe finiteness via a fixed Ω representative.

### PAPER-HE-18/N6 — Bounded finite-parabolic error in twisted powers

theorem; **missing**. Locator: §2.6 equation(a) pp.12–13.

For a standard triple (x,K,u), each n-fold twisted product of the cell Iu̇ẋI is contained in (Iẋθ(ẋ)…θ^(n−1)(ẋ)I)⋅⋃_{a∈W_K}IȧI, and also in the corresponding product with that finite union on the left.

Prerequisites: `PAPER-HE-18/C8`, `PAPER-HE-18/N2`.

- Straightness makes the x factors length-additive; Ad(x)θ normalizes W_K. Move finite factors across and induct.

Use: PAPER-HE-18/N7; §2.6 pp.12–13, corrected proof target — Supplies Bounded finite-parabolic error in twisted powers to Separation of distinct Newton power growth.

### PAPER-HE-18/N7 — Separation of distinct Newton power growth

theorem; **missing**. Locator: §2.6 pp.12–13, corrected proof target.

For standard-triple cells with distinct dominant Newton vectors, no fixed g∈G θ-conjugates an element of one to the other. Assume the validated full-apartment action C2, finite-order θ on W̃, N6 and the local simple-cell adapters in N18. The proof handles Ω-cosets and central translations directly.

Prerequisites: `PAPER-HE-18/C2`, `PAPER-HE-18/N6`, `PAPER-HE-18/N18`, `PAPER-HE-18/N19`.

- Choose n0 divisible by the order of θ on W̃, with (xiθ)^n0 acting as translation λi. If hi are conjugate by fixed g∈IżI, their n0m-fold twisted products remain conjugate by g and θ^(n0m)(g). The latter stays in IżI; θ need not have finite order on G itself.
- Use N6 to bound the parabolic errors by the fixed finite groups WK1 and WK2. Move the second finite-parabolic error to the other side, using inversion. All outside cells then range over fixed finite sets independent of m.
- N18 gives finite endpoint sets A,B and an equality t^(mλ2)=a_m t^(mλ1)b_m of Bruhat labels for every m; disjointness of Bruhat cells is used here. Apply their full affine actions.
- N19 forces λ2 into the W0-orbit of λ1, contrary to distinct dominant Newton vectors. No inference that z∈Wa, nor positivity of length on central translations, is used.

Use: PAPER-HE-18/N8; Theorem3 p.10; proof §2.6 pp.12–13 — Supplies Separation of distinct Newton power growth to Newton partition of G.

Open gaps: PAPER-HE-18/G1.

### PAPER-HE-18/N8 — Newton partition of G

theorem; **missing**. Locator: Theorem3 p.10; proof §2.6 pp.12–13.

For the local/twisting setup, G is the disjoint union of G(ν) over Ω_θ×V_+. The separation argument is supplied in N7/N18/N19, relative to the actual affine/local Bruhat and standard-triple producers still covered by G1/G4. The torus counterexample to finite minima does not contradict this partition.

Prerequisites: `PAPER-HE-18/N5`, `PAPER-HE-18/C9`, `PAPER-HE-18/N3`, `PAPER-HE-18/N7`.

- N5 supplies coverage. Distinct κ cannot intersect; reduce equal κ to standard triples, then apply N7.

Use: PAPER-HE-18/N9; §3.2 p.14 — Supplies Newton partition of G to Newton strata are clopen.

Use: PAPER-HE-18/N13; Theorem10(1) and proof pp.14–15; §4.1 — Supplies Newton partition of G to Newton direct sum of test functions.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Newton partition of G to Rigid support and rigid cocenter.

Open gaps: PAPER-HE-18/G1, PAPER-HE-18/G4.

### PAPER-HE-18/N9 — Newton strata are clopen

theorem; **missing**. Locator: §3.2 p.14.

Under N8, every G(ν) is open as a union of translates of open I-cells; its complement is the union of all other open strata, hence is open.

Prerequisites: `PAPER-HE-18/N1`, `PAPER-HE-18/N8`.

- Use only the partition and open cells; no compactness of X_ν is needed.

Use: PAPER-HE-18/N12; §3.1 p.14 — Supplies Newton strata are clopen to Test functions supported in a Newton stratum.

### PAPER-HE-18/N10 — Admissible subsets of a locally profinite group

definition; **missing**. Locator: §3.2 p.14.

A subset Y⊆G is admissible if for every compact open C⊆G there is a compact open subgroup K with (Y∩C)K=Y∩C. The K may depend on C; Y need not be globally right-invariant under one fixed subgroup.

Prerequisites: `PAPER-HE-18/A1`.

- Use the paper's subset notion, not admissible representation theory.

Use: PAPER-HE-18/N11; §3.2 p.14 — Supplies Admissible subsets of a locally profinite group to Compact-open right stabilizer and admissibility.

API:

- `He18.admissibleSlice` (data): For each compact-open C return a compact-open right stabilizer of Y∩C.
- `He18.emptyAdmissible` (example): The empty subset satisfies the condition for any K.
- `He18.clopenAdmissible` (compatibility): N11 supplies the condition for a clopen Y.

Tests (specified, not Lean-executed):

- Y=∅ is admissible.
- Y=G is admissible because each compact open C has an open right stabilizer.
- In Q_p×, Y=⋃_(m≥1) p^m(1+p^m Z_p) is clopen and admissible, but no single open subgroup K has YK=Y: choose m deeper than a principal-unit subgroup contained in K.

### PAPER-HE-18/N11 — Compact-open right stabilizer and admissibility

theorem; **missing**. Locator: §3.2 p.14.

Every compact open U in a locally profinite group has a compact open subgroup K with UK=U. Therefore every clopen subset is admissible. The pinned compact-ambient theorem applies to compact subgroups only; this finite-cover proof also covers U in noncompact G.

Prerequisites: `PAPER-HE-18/H1`, `PAPER-HE-18/N10`.

- Choose for each u∈U a compact open K_u with uK_u⊆U; take a finite subcover and intersect the finitely many K_u. Then each chosen coset is stable under their intersection.

Use: PAPER-HE-18/R12; Source-derived expansion of Theorem22 sheaf step pp.23–24 — Supplies Compact-open right stabilizer and admissibility to Finite clopen refinement of a compact support.

### PAPER-HE-18/N12 — Test functions supported in a Newton stratum

definition; **missing**. Locator: §3.1 p.14.

Let H_R(ν)={f∈H_R:supp(f)⊆G(ν)}. Using clopenness, restriction followed by zero extension gives a projection p_ν:H_R→H_R(ν). These are R-submodules; convolution need not preserve an individual component.

Prerequisites: `PAPER-HE-18/H1`, `PAPER-HE-18/N9`.

- Use indicator restriction on a clopen set and compact support.

Use: PAPER-HE-18/N13; Theorem10(1) and proof pp.14–15; §4.1 — Supplies Test functions supported in a Newton stratum to Newton direct sum of test functions.

Use: PAPER-HE-18/N14; §3.1 p.14 — Supplies Test functions supported in a Newton stratum to Newton component of the cocenter.

Use: PAPER-HE-18/L1; §4.2 p.15 — Supplies Test functions supported in a Newton stratum to Congruence-level image in the ambient cocenter.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Test functions supported in a Newton stratum to Rigid support and rigid cocenter.

API:

- `He18.newtonProjection` (projection): p_νf agrees with f on G(ν) and is zero elsewhere.
- `He18.newtonProjectionIdempotent` (simp): p_νp_ν=p_ν and p_νp_μ=0 for ν≠μ.
- `He18.newtonSupportMembership` (characterisation): f lies in H_R(ν) exactly when p_νf=f.

Tests (specified, not Lean-executed):

- If supp(f)∩G(ν)=∅ then p_νf=0.
- On ordinary G_m, projection of 1_(π^mO×) to valuation n is itself for n=m and zero otherwise.
- On G_m a function supported at valuation 1 convolved with itself is supported at valuation 2, not at 1.

### PAPER-HE-18/N13 — Newton direct sum of test functions

theorem; **missing**. Locator: Theorem10(1) and proof pp.14–15; §4.1.

H_R is canonically the algebraic direct sum ⊕_νH_R(ν) as an R-module. Each f has only finitely many nonzero projections. This is not a statement that H_R(G,K) splits at every arbitrary fixed K.

Prerequisites: `PAPER-HE-18/N5`, `PAPER-HE-18/N8`, `PAPER-HE-18/N12`.

- Compact support gives finite strata; clopen zero extensions are test functions; disjoint supports give uniqueness.

Use: PAPER-HE-18/N15; Theorem10(2) proof p.15 — Supplies Newton direct sum of test functions to Commutator relations split by Newton component.

Use: PAPER-HE-18/N16; Theorem10(2) pp.14–15 — Supplies Newton direct sum of test functions to Newton direct sum of the cocenter.

### PAPER-HE-18/N14 — Newton component of the cocenter

definition; **missing**. Locator: §3.1 p.14.

Let H̄_R(ν) be the image of H_R(ν) under q:H_R→H̄_R. Use an image submodule, not an algebra quotient and not the intrinsic cocenter of a chosen level algebra.

Prerequisites: `PAPER-HE-18/H12`, `PAPER-HE-18/N12`.

- Take the image of the restricted linear quotient map.

Use: PAPER-HE-18/N16; Theorem10(2) pp.14–15 — Supplies Newton component of the cocenter to Newton direct sum of the cocenter.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Newton component of the cocenter to Rigid support and rigid cocenter.

API:

- `He18.newtonCocenterMap` (projection): H_R(ν) surjects onto H̄_R(ν).
- `He18.newtonCocenterInclusion` (data): H̄_R(ν) includes in the ambient cocenter.
- `He18.newtonCocenterRelations` (characterisation): The restricted kernel is C_(θ,ω)∩H_R(ν).

Tests (specified, not Lean-executed):

- ν∉Im π implies H̄_R(ν)=0.
- On an ordinary torus, H̄_R(ν)=H_R(ν).
- The image definition does not assert that a level-algebra intrinsic cocenter embeds in the ambient cocenter.

### PAPER-HE-18/N15 — Commutator relations split by Newton component

theorem; **missing**. Locator: Theorem10(2) proof p.15.

C_(θ,ω)=⊕_ν(C_(θ,ω)∩H_R(ν)) inside H_R. In particular projection of a relation to any Newton component is again a relation.

Prerequisites: `PAPER-HE-18/H11`, `PAPER-HE-18/H9`, `PAPER-HE-18/N1`, `PAPER-HE-18/N13`.

- Decompose f finitely, note T_x preserves each stratum, and write f−T_xf as the sum of its component relations.

Use: PAPER-HE-18/N16; Theorem10(2) pp.14–15 — Supplies Commutator relations split by Newton component to Newton direct sum of the cocenter.

### PAPER-HE-18/N16 — Newton direct sum of the cocenter

theorem; **missing**. Locator: Theorem10(2) pp.14–15.

The canonical map ⊕_νH̄_R(ν)→H̄_R is an R-linear isomorphism.

Prerequisites: `PAPER-HE-18/N13`, `PAPER-HE-18/N14`, `PAPER-HE-18/N15`.

- Quotient the componentwise direct sum of modules by the componentwise relation submodule.

Use: PAPER-HE-18/N17; Corrected §5.2 p.20; source issue E2 — Supplies Newton direct sum of the cocenter to Product decomposition of invariant distributions.

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Newton direct sum of the cocenter to Minimal-cell generators at each level.

Use: PAPER-HE-18/L15; Theorem11(1) p.15; §4.5 p.19 — Supplies Newton direct sum of the cocenter to Newton direct sum of the level image.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Newton direct sum of the cocenter to Rigid support and rigid cocenter.

Use: PAPER-HE-18/R3; §6.1 pp.21–22 — Supplies Newton direct sum of the cocenter to Rigid/nonrigid two-summand decomposition.

### PAPER-HE-18/N17 — Product decomposition of invariant distributions

theorem; **missing**. Locator: Corrected §5.2 p.20; source issue E2.

Restriction induces J(G)≅∏_νHom_R(H̄_R(ν),R), not an infinite direct sum. Conversely an arbitrary family defines j(f) by the finite sum over the nonzero Newton components of f.

Prerequisites: `PAPER-HE-18/H13`, `PAPER-HE-18/N16`.

- Apply the universal property of an algebraic direct sum; finite support is a property of each input, not of its dual family.

Use: PAPER-HE-18/F3; Corrected Theorem20 pp.20–21 — Supplies Product decomposition of invariant distributions to Field-valued Newton distribution bound.

Use: PAPER-HE-18/F4; Corrected Theorem18 and §5.3 pp.20–21 — Supplies Product decomposition of invariant distributions to Field-valued Howe finiteness via a fixed Ω representative.

Use: PAPER-HE-18/R3; §6.1 pp.21–22 — Supplies Product decomposition of invariant distributions to Rigid/nonrigid two-summand decomposition.

### PAPER-HE-18/L1 — Congruence-level image in the ambient cocenter

definition; **missing**. Locator: §4.2 p.15.

For n≥1 define H̄_R(G,I_n)=q(H_R(G,I_n)); define H̄_R(G,I_n;ν)=q(H_R(G,I_n)∩H_R(ν)). These are image submodules of H̄_R. Do not replace them by the intrinsic twisted cocenter of H_R(G,I_n).

Prerequisites: `PAPER-HE-18/A3`, `PAPER-HE-18/H5`, `PAPER-HE-18/H12`, `PAPER-HE-18/N12`.

- Take images under the ambient quotient. The introduction's shorthand is resolved by the explicit body definition.

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Congruence-level image in the ambient cocenter to Minimal-cell generators at each level.

Use: PAPER-HE-18/L15; Theorem11(1) p.15; §4.5 p.19 — Supplies Congruence-level image in the ambient cocenter to Newton direct sum of the level image.

API:

- `He18.levelImageMap` (projection): Restrict q to the level submodule and corestrict to its image.
- `He18.levelImageMonotone` (functoriality): For m≥n, H̄_R(G,I_n)⊆H̄_R(G,I_m).
- `He18.levelImageKernel` (characterisation): The kernel is H_R(G,I_n)∩C_(θ,ω), not assumed equal to its intrinsic commutator span.

Tests (specified, not Lean-executed):

- For an ordinary abelian torus, the map from a level Hecke module into H̄_R is injective.
- The zero function maps to zero at every level.
- For G=Q2×,R=F3,θ=id,ω(g)=(−1)^v2(g), the nonzero level function 1_(Z2×) has zero ambient cocenter class because T_2 acts by −1 and 2 is invertible.

### PAPER-HE-18/L2 — Iwahori-cell level functions

definition; **missing**. Locator: §4.2 p.15.

For w∈W̃ let H_w={f∈H_R:supp(f)⊆IẇI}, H_R(G,I_n)_w=H_R(G,I_n)∩H_w, and H̄_R(G,I_n)_w its ambient cocenter image. The cell support is independent of the chosen lift.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/H5`, `PAPER-HE-18/H12`.

- Cells are compact open, and I_n⊆I ensures their indicators preserve the level.

Use: PAPER-HE-18/L12; Lemma17(1) pp.18–19 — Supplies Iwahori-cell level functions to Equal-length cell reduction in the cocenter.

Use: PAPER-HE-18/L13; Lemma17(2) pp.18–19 — Supplies Iwahori-cell level functions to Decreasing cell reduction in the cocenter.

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Iwahori-cell level functions to Minimal-cell generators at each level.

Use: PAPER-HE-18/L18; Derived from He18 §1.3, Proposition1, and the Ω-normalization used at the start of Lemma16 p.17 — Supplies Iwahori-cell level functions to Length-zero twisted transport preserves a level cell.

API:

- `He18.cellMembership` (characterisation): Membership is level bi-invariance together with support contained in IẇI.
- `He18.cellImage` (projection): q restricts to a surjection onto H̄_R(G,I_n)_w.
- `He18.cellLevelBasis` (compatibility): The H6 basis restricts to those I_n-double cosets lying in IẇI.

Tests (specified, not Lean-executed):

- For w=1, H_w consists of all test functions supported in I.
- Multiplying ẇ by Z0 does not change H_w.
- If w≠w', a test function supported in both cells is zero.

### PAPER-HE-18/L3 — Unramified completion and fixed local data

construction; **missing**. Locator: §4.3 p.16; Richarz16 §§1.1–1.4.

Let F̆ be the completion of the maximal unramified extension, with residue k̄ and Frobenius σ, so G=G(F̆)^σ. Choose a maximal F̆-split torus over F containing A; compare apartments, compatible Iwahori/parahoric levels and W̃≅(W̃̆)^σ. Define ℓ̆ using the residue-split affine Weyl group.

Prerequisites: `PAPER-HE-18/A1`, `PAPER-HE-18/A2`, `PAPER-HE-18/A3`.

- Reuse the already routed HE21 completion adapter and Richarz's descent comparison, not a second local field construction. The facet/Iwahori compatibility and root models are G2.

Use: PAPER-HE-18/L4; Lemma15 pp.16–17 — Supplies Unramified completion and fixed local data to Frobenius fixed-coset lifting.

Use: PAPER-HE-18/L5; Lemma16 proof pp.17–18; Tits79 §3.1 — Supplies Unramified completion and fixed local data to Ordered root-factorization at shifted depth.

Use: PAPER-HE-18/L8; Lemma16 pp.17–18; Theorem20 proof p.21 — Supplies Unramified completion and fixed local data to Congruence double-coset cardinality.

Use: PAPER-HE-18/L9; §4.3 p.16; Richarz16 Proposition1.11/Sublemma1.12 — Supplies Unramified completion and fixed local data to Length additivity after unramified base change.

API:

- `He18.frobeniusFixedPoints` (compatibility): Recover G(F) and compatible I_n as σ-fixed points.
- `He18.weylFixedPoints` (equivalence): Compare W̃ with the σ-fixed subgroup of W̃̆.
- `He18.lengthTransfer` (data): Record both ℓ and ℓ̆ and their distinct domains.

Tests (specified, not Lean-executed):

- For F=F_q((t)), F̆=k̄((t)) with coefficient q-power Frobenius fixing t.
- For split groups, the two affine root arrangements identify and ℓ̆=ℓ.
- In a nonsplit rank-one example, a relative simple reflection can have ℓ̆(s)>1; q^ℓ(s) is not a justified substitute for q^ℓ̆(s).

Open gaps: PAPER-HE-18/G2.

### PAPER-HE-18/L4 — Frobenius fixed-coset lifting

theorem; **missing**. Locator: Lemma15 pp.16–17.

For g∈G and n≥1, the natural map I_n/(I_n∩gI_ng⁻¹)→(Ĭ_n/(Ĭ_n∩gĬ_ng⁻¹))^σ is bijective. Surjectivity requires a Lang theorem for the actual connected pro-unipotent intersection models, not merely an abstract assertion that a group is pro-p.

Prerequisites: `PAPER-HE-18/L3`, `PAPER-HE-18/L21`, `PAPER-HE-18/L22`.

- Construct the actual intersection J=Ibreve_n∩g Ibreve_n g^-1 as an inverse limit of Frobenius-equivariant connected smooth affine finite-type quotients (G6).
- Then L21 supplies compatible Lang solutions, and L22 gives the claimed fixed-coset bijection. No assertion that an arbitrary pro-p group has this property is used.

Use: PAPER-HE-18/L6; Lemma16 proof p.18; Richarz16 Proposition1.11 — Supplies Frobenius fixed-coset lifting to Frobenius-compatible rank-one level quotient count.

Use: PAPER-HE-18/L7; Lemma16 proof p.17 — Supplies Frobenius fixed-coset lifting to Reduced-word contracted multiplication at level.

Open gaps: PAPER-HE-18/G6.

### PAPER-HE-18/L5 — Ordered root-factorization at shifted depth

theorem; **missing**. Locator: Lemma16 proof pp.17–18; Tits79 §3.1.

Over F̆, for a relative simple reflection s, choose affine roots α_a,β_a for nondivisible roots a so ordered products of X_(α_a) and X_(β_a), with the parahoric torus factor T0, parametrize Ĭ and Ĭ∩ṡĬṡ⁻¹. At integer depth n replace root indices by α_a+n,β_a+n and T0 by T_n.

Prerequisites: `PAPER-HE-18/L3`, `PAPER-HE-18/A3`.

- Construct the valued-root product parametrizations and the intersection filtration, including multipliable roots. The precise index shifts depend on the actual root valuation sets; source input G2 is not replaced by split Chevalley coordinates.

Use: PAPER-HE-18/L6; Lemma16 proof p.18; Richarz16 Proposition1.11 — Supplies Ordered root-factorization at shifted depth to Frobenius-compatible rank-one level quotient count.

Use: PAPER-HE-18/L7; Lemma16 proof p.17 — Supplies Ordered root-factorization at shifted depth to Reduced-word contracted multiplication at level.

Use: PAPER-HE-18/L11; Lemma17 proof p.19 — Supplies Ordered root-factorization at shifted depth to Simple-cell containment at adjacent depths.

Open gaps: PAPER-HE-18/G2.

### PAPER-HE-18/L6 — Frobenius-compatible rank-one level quotient count

theorem; **missing**. Locator: Lemma16 proof p.18; Richarz16 Proposition1.11.

For relative simple s and n≥1, #(I_nṡI_n/I_n)=q^ℓ̆(s). Establish the fixed-point count by a σ-compatible comparison of the shifted root quotient with the unshifted rank-one unipotent cell, of k-dimension ℓ̆(s).

Prerequisites: `PAPER-HE-18/L4`, `PAPER-HE-18/L5`.

- Richarz supplies the unshifted finite reductive quotient/Lang count. The shift comparison must preserve σ, not merely give an abstract set bijection; this missing verification is G6.

Use: PAPER-HE-18/L8; Lemma16 pp.17–18; Theorem20 proof p.21 — Supplies Frobenius-compatible rank-one level quotient count to Congruence double-coset cardinality.

Open gaps: PAPER-HE-18/G6.

### PAPER-HE-18/L7 — Reduced-word contracted multiplication at level

theorem; **missing**. Locator: Lemma16 proof p.17.

For a reduced expression w=s1…sr and g0=ṡ1…ṡr, multiplication identifies I_nṡ1I_n ×^(I_n)…×^(I_n) I_nṡrI_n /I_n with I_ng0I_n/I_n, compatibly with Frobenius before descent.

Prerequisites: `PAPER-HE-18/N2`, `PAPER-HE-18/L4`, `PAPER-HE-18/L5`.

- Use the disjoint inversion-root factorization for a reduced expression; at depth n prove the ordered-product map is bijective rather than infer it from the level-zero Tits statement. This is a separate G6 obligation.

Use: PAPER-HE-18/L8; Lemma16 pp.17–18; Theorem20 proof p.21 — Supplies Reduced-word contracted multiplication at level to Congruence double-coset cardinality.

Open gaps: PAPER-HE-18/G6.

### PAPER-HE-18/L8 — Congruence double-coset cardinality

theorem; **missing**. Locator: Lemma16 pp.17–18; Theorem20 proof p.21.

For n≥1, w∈W̃ and any g∈IẇI, #(I_ngI_n/I_n)=q^ℓ̆(w). In particular the entire cell IẇI contains exactly [I:I_n] I_n-double cosets.

Prerequisites: `PAPER-HE-18/A3`, `PAPER-HE-18/L6`, `PAPER-HE-18/L7`, `PAPER-HE-18/L3`.

- Remove the Ω factor using its normalization of I_n, reduce g to a chosen lift by normality, multiply the rank-one counts, then divide #(IẇI/I_n) by the common size. Normalization by Ω is part of G2.

Use: PAPER-HE-18/L10; Proposition13 p.16; proof §4.4 p.18 — Supplies Congruence double-coset cardinality to Length-additive congruence convolution.

Use: PAPER-HE-18/F2; Theorem20 proof p.21, valid primal conclusion — Supplies Congruence double-coset cardinality to Finite generation from Ω-normalized level cells.

Open gaps: PAPER-HE-18/G6.

### PAPER-HE-18/L9 — Length additivity after unramified base change

theorem; **missing**. Locator: §4.3 p.16; Richarz16 Proposition1.11/Sublemma1.12.

If ℓ(ww')=ℓ(w)+ℓ(w') in W̃, then ℓ̆(ww')=ℓ̆(w)+ℓ̆(w').

Prerequisites: `PAPER-HE-18/L3`.

- Use the residue-split inversion-root sets associated to relative reduced expressions and their disjoint unions; Richarz's full argument was read.

Use: PAPER-HE-18/L10; Proposition13 p.16; proof §4.4 p.18 — Supplies Length additivity after unramified base change to Length-additive congruence convolution.

### PAPER-HE-18/L10 — Length-additive congruence convolution

theorem; **missing**. Locator: Proposition13 p.16; proof §4.4 p.18.

For n≥1, ℓ(ww')=ℓ(w)+ℓ(w'), g∈IẇI and g'∈Iẇ'I, one has 1_(I_ngI_n)*1_(I_ng'I_n)=μ(I_n)1_(I_ngg'I_n).

Prerequisites: `PAPER-HE-18/H4`, `PAPER-HE-18/L8`, `PAPER-HE-18/L9`, `PAPER-HE-18/N2`.

- The contracted product contains the target double-coset quotient in its image. Equal finite cardinalities force bijectivity and no further image cosets; finite-sum convolution then gives coefficient μ(I_n).

Use: PAPER-HE-18/L12; Lemma17(1) pp.18–19 — Supplies Length-additive congruence convolution to Equal-length cell reduction in the cocenter.

Use: PAPER-HE-18/L13; Lemma17(2) pp.18–19 — Supplies Length-additive congruence convolution to Decreasing cell reduction in the cocenter.

Open gaps: PAPER-HE-18/G6.

### PAPER-HE-18/L11 — Simple-cell containment at adjacent depths

theorem; **missing**. Locator: Lemma17 proof p.19.

For n≥1 and g1∈IṡI with s∈S̃, I_ng1I_n⊆g1I_(n−1). Hence ω is constant on this double coset whenever ω(I_(n−1))=1.

Prerequisites: `PAPER-HE-18/A3`, `PAPER-HE-18/L5`.

- Prove g1⁻¹I_ng1⊆I_(n−1) using the root-depth shifts at an affine wall and normality under I; do not infer it from arbitrary compact-open normality. This is included in G2.

Use: PAPER-HE-18/L12; Lemma17(1) pp.18–19 — Supplies Simple-cell containment at adjacent depths to Equal-length cell reduction in the cocenter.

Use: PAPER-HE-18/L13; Lemma17(2) pp.18–19 — Supplies Simple-cell containment at adjacent depths to Decreasing cell reduction in the cocenter.

Open gaps: PAPER-HE-18/G2.

### PAPER-HE-18/L12 — Equal-length cell reduction in the cocenter

theorem; **missing**. Locator: Lemma17(1) pp.18–19.

If n≥1, ω(I_(n−1))=1, s∈S̃ and ℓ(swθ(s))=ℓ(w), then H̄_R(G,I_n)_w=H̄_R(G,I_n)_(swθ(s)).

Prerequisites: `PAPER-HE-18/L2`, `PAPER-HE-18/L10`, `PAPER-HE-18/L11`, `PAPER-HE-18/H10`.

- If swθ(s)=w the equality is tautological. Otherwise the Coxeter exchange/length alternatives let one orient the step with sw<w. Factor g=g1g2 in simple and sw cells, apply L10, rotate modulo the twisted commutator using θ(g1), and reverse the argument for equality. Retain θ in the source's last products.

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Equal-length cell reduction in the cocenter to Minimal-cell generators at each level.

Use: PAPER-HE-18/L17; §4.6 p.19 — Supplies Equal-length cell reduction in the cocenter to Standard-triple support representatives.

### PAPER-HE-18/L13 — Decreasing cell reduction in the cocenter

theorem; **missing**. Locator: Lemma17(2) pp.18–19.

If n≥1, ω(I_(n−1))=1 and swθ(s)<w, then H̄_R(G,I_n)_w⊆H̄_R(G,I_n)_(swθ(s))+H̄_R(G,I_n)_(sw).

Prerequisites: `PAPER-HE-18/L2`, `PAPER-HE-18/L10`, `PAPER-HE-18/L11`, `PAPER-HE-18/N2`, `PAPER-HE-18/H10`.

- Use the same twisted rotation as L12 and the two-term simple-cell support formula; both target lengths are smaller than ℓ(w).

Use: PAPER-HE-18/L14; Theorem11(2) p.15; §4.5 p.19 — Supplies Decreasing cell reduction in the cocenter to Minimal-cell generators at each level.

### PAPER-HE-18/L14 — Minimal-cell generators at each level

theorem; **missing**. Locator: Theorem11(2) p.15; §4.5 p.19.

For n≥1 with ω(I_(n−1))=1, H̄_R(G,I_n;ν)=Σ_{w∈W̃_min,π(w)=ν} H̄_R(G,I_n)_w.

Prerequisites: `PAPER-HE-18/C5`, `PAPER-HE-18/L1`, `PAPER-HE-18/L2`, `PAPER-HE-18/L12`, `PAPER-HE-18/L13`, `PAPER-HE-18/N16`.

- Induct on length using RedMin and the two decreasing branches, first obtaining all minimal cells. Project using the ambient Newton direct sum to isolate ν. No finiteness of the full minimal-index set is needed here.

Use: PAPER-HE-18/L15; Theorem11(1) p.15; §4.5 p.19 — Supplies Minimal-cell generators at each level to Newton direct sum of the level image.

Use: PAPER-HE-18/L16; Corollary12 p.16 — Supplies Minimal-cell generators at each level to Global Iwahori–Matsumoto-type generators.

Use: PAPER-HE-18/L17; §4.6 p.19 — Supplies Minimal-cell generators at each level to Standard-triple support representatives.

Use: PAPER-HE-18/F2; Theorem20 proof p.21, valid primal conclusion — Supplies Minimal-cell generators at each level to Finite generation from Ω-normalized level cells.

### PAPER-HE-18/L15 — Newton direct sum of the level image

theorem; **missing**. Locator: Theorem11(1) p.15; §4.5 p.19.

For n≥1 with ω(I_(n−1))=1, H̄_R(G,I_n)=⊕_νH̄_R(G,I_n;ν). This is a decomposition of the ambient image even though the level algebra itself need not split by strata.

Prerequisites: `PAPER-HE-18/L14`, `PAPER-HE-18/L1`, `PAPER-HE-18/N16`.

- Minimal cell generators lie entirely in their Newton components, giving the sum; ambient directness gives uniqueness.

Use: PAPER-HE-18/F3; Corrected Theorem20 pp.20–21 — Supplies Newton direct sum of the level image to Field-valued Newton distribution bound.

### PAPER-HE-18/L16 — Global Iwahori–Matsumoto-type generators

theorem; **missing**. Locator: Corollary12 p.16.

For every ν, H̄_R(ν)=Σ_{w∈W̃_min,π(w)=ν}q(H_w). Equivalently every class has a finite representative sum in minimal cells; the sum need not be free or a basis.

Prerequisites: `PAPER-HE-18/H2`, `PAPER-HE-18/L14`.

- Choose a sufficiently deep level for any representative and ω, then apply L14.

### PAPER-HE-18/L17 — Standard-triple support representatives

theorem; **missing**. Locator: §4.6 p.19.

Under L14's hypotheses every element of H̄_R(G,I_n;ν) has a representative at the same level supported in the union of Iu̇ẋI over standard triples with ux minimal and π(x)=ν.

Prerequisites: `PAPER-HE-18/C9`, `PAPER-HE-18/L12`, `PAPER-HE-18/L14`.

- Replace each minimal-cell summand by its equal-length standard-triple image; only finitely many summands occur for a fixed element.

### PAPER-HE-18/F1 — Distributions supported on a twisted saturation

definition; **missing**. Locator: §5.1 p.20.

For a distribution j define its support as the complement of the union of open U⊆G on whose compactly supported test functions j vanishes. For compact X let J(G·_θX) consist of invariant j with this closed support contained in G·_θX. Restriction to H_R(G,K) means the image of the restriction map, not all functionals on that level or an assumed surjective dual map.

Prerequisites: `PAPER-HE-18/H13`, `PAPER-HE-18/H5`.

- Use the usual local definition of distribution support; merely vanishing on tests disjoint from Y only forces support into closure(Y), so is not substituted when Y is not closed. For clopen Y the two conditions agree.

Use: PAPER-HE-18/F3; Corrected Theorem20 pp.20–21 — Supplies Distributions supported on a twisted saturation to Field-valued Newton distribution bound.

Use: PAPER-HE-18/F6; Source-derived counterexample; E3 — Supplies Distributions supported on a twisted saturation to Failure of arbitrary-ring Howe finite generation.

API:

- `He18.supportedDistribution` (characterisation): For clopen Y, support(j)⊆Y iff j vanishes on every test supported in G\Y; for arbitrary Y use the closed support definition.
- `He18.restrictionImage` (projection): Map j to its functional on H_R(G,K), retaining the image submodule.
- `He18.supportMonotone` (functoriality): If Y⊆Y', distributions supported on Y are supported on Y'.

Tests (specified, not Lean-executed):

- A distribution supported on ∅ is zero.
- Integration over O_F× is supported on O_F× for ordinary G_m.
- Over a general ring, restriction of Hom_R(M,R) to a submodule N is not automatically all Hom_R(N,R); for N=2Z⊆Z the functional 2↦1 does not extend.

### PAPER-HE-18/F2 — Finite generation from Ω-normalized level cells

theorem; **missing**. Locator: Theorem20 proof p.21, valid primal conclusion.

Assume C17, L18 and the level generator/cardinality theorems L14/L8. For n≥1 with ω(I_(n−1))=1 let N_ν=#S(ν,τ0). Then H̄_R(G,I_n;ν) is generated by at most N_ν[I:I_n] elements over every commutative Z[1/p]-algebra R, without the finite-minima guard.

Prerequisites: `PAPER-HE-18/C17`, `PAPER-HE-18/L18`, `PAPER-HE-18/H6`, `PAPER-HE-18/L8`, `PAPER-HE-18/L14`.

- L14 supplies all minimal cells. C17 and L18 replace each by its image at the same level in the finite set S(ν,τ0).
- By L8 and H6 each chosen cell contributes a free module of rank [I:I_n]; take their finite direct sum and its surjection. N_ν does not depend on n.
- This is a primal cocenter bound. It does not imply finite generation of its R-dual or of a submodule of that dual over arbitrary R.

Use: PAPER-HE-18/F3; Corrected Theorem20 pp.20–21 — Supplies Finite generation from Ω-normalized level cells to Field-valued Newton distribution bound.

Open gaps: PAPER-HE-18/G2, PAPER-HE-18/G6.

### PAPER-HE-18/F3 — Field-valued Newton distribution bound

theorem; **missing**. Locator: Corrected Theorem20 pp.20–21.

In F2's scope additionally let R be a field of characteristic ≠p. The restriction image of J(G(ν)) on H_R(G,I_n) has dimension at most N_ν[I:I_n].

Prerequisites: `PAPER-HE-18/F1`, `PAPER-HE-18/F2`, `PAPER-HE-18/L15`, `PAPER-HE-18/N17`.

- The restricted functional factors through the finite-dimensional ν-component; its image is a vector subspace of that component's dual, whose dimension is bounded by the number of generators. No arbitrary-ring submodule-finiteness argument is used.

Use: PAPER-HE-18/F4; Corrected Theorem18 and §5.3 pp.20–21 — Supplies Field-valued Newton distribution bound to Field-valued Howe finiteness via a fixed Ω representative.

Open gaps: PAPER-HE-18/G2, PAPER-HE-18/G6.

### PAPER-HE-18/F4 — Field-valued Howe finiteness via a fixed Ω representative

theorem; **missing**. Locator: Corrected Theorem18 and §5.3 pp.20–21.

Assume the validated local producers for N5, F3 and L18. For a field R of characteristic ≠p, compact X⊆G, and compact open K, the restriction image of J(G·_θX) on H_R(G,K) is finite-dimensional for the paper’s finite-order apartment/Iwahori–Weyl twists; no finite-minima guard is required.

Prerequisites: `PAPER-HE-18/N5`, `PAPER-HE-18/F3`, `PAPER-HE-18/A3`, `PAPER-HE-18/N17`.

- N5 gives finitely many strata meeting X. Choose n with I_n⊆K and ω(I_(n−1))=1.
- Each Newton restriction image is finite-dimensional by F2/F3 with its Ω-normalized representatives. Distributions supported in the finite union form a finite sum.
- Restrict the resulting finite-dimensional space from H_R(G,I_n) to H_R(G,K). This repairs the additional central-twist argument; local group and level producers retain G1/G2/G4/G6.

Open gaps: PAPER-HE-18/G1, PAPER-HE-18/G2, PAPER-HE-18/G6.

### PAPER-HE-18/F5 — Square-zero coefficient counterexample datum

construction; **missing**. Locator: Source-derived test of Theorems18/20; E3.

Let V=⊕_{m∈N}F3 e_m, R=TrivSqZeroExt F3 V, t=(0,e_0), G=Q2×, θ=id and ω(g)=(1+t)^(v_2(g)). Here 2 is invertible in R, Ann_R(t)=0⊕V, (1+t)^3=1, and ker ω has valuations divisible by 3, hence is open.

Prerequisites: `PAPER-HE-18/A4`, `PAPER-HE-18/H3`.

- Reuse the pinned square-zero extension multiplication (a,v)(b,w)=(ab,aw+bv), not a new ring theory. The infinite direct sum is essential.

Use: PAPER-HE-18/F6; Source-derived counterexample; E3 — Supplies Square-zero coefficient counterexample datum to Failure of arbitrary-ring Howe finite generation.

API:

- `He18.squareZeroCharacter` (constructor): The valuation followed by powers of the unit 1+t defines an open-kernel character.
- `He18.annihilatorComputation` (characterisation): Multiplying (a,v) by t gives (0,ae_0), so the annihilator is exactly 0⊕V.
- `He18.counterexampleIntegration` (constructor): For b∈0⊕V define j_b(f)=b∫_(Z2×)f dμ with μ(Z2×)=1.

Tests (specified, not Lean-executed):

- (1+t)^3=1 and 1+t≠1.
- t(a,v)=0 iff a=0.
- Replacing V by F3^d produces a finitely generated annihilator; a finite enumeration alone does not refute an existential finite-generation statement.

### PAPER-HE-18/F6 — Failure of arbitrary-ring Howe finite generation

theorem; **missing**. Locator: Source-derived counterexample; E3.

For F5 and X=I=Z2×, every sufficiently deep n (indeed any I_n⊆I) gives a restriction image J(I)|_(H_R(G,I_n)) that surjects onto Ann(t)=V by evaluation at 1_I. It is therefore not finitely generated. This refutes Theorem20 over its printed arbitrary R, and any finite-generation reading of Theorem18 in that scope.

Prerequisites: `PAPER-HE-18/F5`, `PAPER-HE-18/F1`, `PAPER-HE-18/H9`.

- Invariance under 2 gives t j(1_I)=0. Conversely each b∈Ann(t) yields the invariant distribution j_b from F5, supported on I and with j_b(1_I)=b. A quotient of a finitely generated module is finitely generated, while V is not.

Open gaps: PAPER-HE-18/G8.

### PAPER-HE-18/R1 — Newton centralizer Levi

definition; **missing**. Locator: §6.1 p.21.

For ν=(κ,v), let M_ν be the F-Levi subgroup centralizing v, with rational points generated by Z_G(A)(F) and root subgroups U_a(F) for roots satisfying 〈v,a〉=0. M_ν=G precisely when v is central, i.e. annihilates every relative root.

Prerequisites: `PAPER-HE-18/A1`, `PAPER-HE-18/C2`.

- Import the reductive-group Levi/relative-root theory; preserve the rational apartment pairing.

Use: PAPER-HE-18/R2; §6.1 pp.21–22 — Supplies Newton centralizer Levi to Rigid support and rigid cocenter.

API:

- `He18.newtonLeviRoots` (characterisation): The relative roots of M_ν are exactly those vanishing on v.
- `He18.centralNewton` (characterisation): M_ν=G iff all relative root pairings with v vanish.
- `He18.dominantLevi` (compatibility): For dominant v the Levi is the standard Levi corresponding to zero simple-root pairings.

Tests (specified, not Lean-executed):

- For G_m, M_ν=G for every ν.
- For split GL2 and v=(a,a), M_ν=GL2.
- For split GL2 and v=(a,b) with a≠b, M_ν is the diagonal torus.

### PAPER-HE-18/R2 — Rigid support and rigid cocenter

definition; **missing**. Locator: §6.1 pp.21–22.

Let G^rig be the union of Newton strata with central v and G^nrig its complementary union. Define H_R^rig,H_R^nrig by support, H̄_R^rig,H̄_R^nrig as their ambient quotient images, and J(G)^rig,J(G)^nrig as their dual supported summands.

Prerequisites: `PAPER-HE-18/R1`, `PAPER-HE-18/N8`, `PAPER-HE-18/N12`, `PAPER-HE-18/N14`, `PAPER-HE-18/H13`, `PAPER-HE-18/N16`.

- Both unions are clopen. Define by support and image before invoking the decomposition.

Use: PAPER-HE-18/R3; §6.1 pp.21–22 — Supplies Rigid support and rigid cocenter to Rigid/nonrigid two-summand decomposition.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Rigid support and rigid cocenter to Rigid standard-pair covering.

API:

- `He18.rigidMembership` (characterisation): g is rigid iff its Newton vector is central.
- `He18.rigidProjection` (projection): Cut off a test function on the clopen rigid subset.
- `He18.rigidImage` (compatibility): The rigid cocenter is the direct sum of the central-Newton component images, by N16.

Tests (specified, not Lean-executed):

- For a torus G^rig=G, even at nonzero valuations.
- The identity lies in the rigid part.
- The translation diag(π,1) in GL2 has noncentral Newton vector (1,0) and is not rigid.

### PAPER-HE-18/R3 — Rigid/nonrigid two-summand decomposition

theorem; **missing**. Locator: §6.1 pp.21–22.

H̄_R=H̄_R^rig⊕H̄_R^nrig and J(G)=J(G)^rig⊕J(G)^nrig. The second equality is a finite two-factor split and remains a direct sum; it does not justify an infinite direct sum of Newton distribution spaces.

Prerequisites: `PAPER-HE-18/R2`, `PAPER-HE-18/N16`, `PAPER-HE-18/N17`.

- Group the Newton components by centrality; dualize the two summands.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Rigid/nonrigid two-summand decomposition to Rigid cocenter generators and relations.

### PAPER-HE-18/R4 — Standard parahoric pair

definition; **missing**. Locator: §6.2 p.22.

A standard pair (P,τ) consists of a parahoric P containing I and τ∈Ω with τ̇θ(P)τ̇⁻¹=P. Its finite Weyl group W_P is normalized by Ad(τ)θ, not necessarily by Ad(τ) alone. Let StP be all such pairs; it may be infinite through Ω.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A4`.

- Use the RG2 parahoric carrier and lift-normalization compatibility; standard parahorics are finite in number but their Ω-labels need not be.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Standard parahoric pair to Rigid standard-pair covering.

Use: PAPER-HE-18/R8; §6.3 p.23 — Supplies Standard parahoric pair to Local parahoric-coset test module.

Use: PAPER-HE-18/R10; Theorem23 setup p.24 and proof p.25 — Supplies Standard parahoric pair to Local commutators equal local action relations.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Standard parahoric pair to Double-coset descent of overlap relations.

API:

- `He18.standardPairStability` (data): Pτ̇ is stable under θ-conjugation by P.
- `He18.standardPairWeylTwist` (compatibility): Ad(τ)θ induces a length-preserving automorphism of W_P.
- `He18.standardPairLift` (functoriality): Changing τ̇ by an allowed Iwahori element gives canonically the same coset and transported pair data.

Tests (specified, not Lean-executed):

- For ordinary G_m, StP has one pair for every integer τ.
- If θ(P)=P, then (P,1) is standard.
- Finite many standard parahorics does not imply finite StP when Ω=Z.

### PAPER-HE-18/R5 — Minimal finite-parabolic elements are globally minimal

theorem; **missing**. Locator: Proposition21 first half p.22.

Let K⊆S̃ have W_K finite and τ∈Ω with Ad(τ)θ(K)=K. If w∈W_K is minimal in its Ad(τ)θ-twisted W_K-conjugacy class, then wτ is minimal in its full θ-conjugacy class in W̃ and π(wτ)=π(τ). The local parahoric specialization uses K for P.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/C3`, `PAPER-HE-18/C4`, `PAPER-HE-18/C8`.

- Write any conjugator x=x1x2 with x1 minimal for W̃/W_P and x2∈W_P. Apply the length lower bound in the source, using Ad(τ)θ stabilization. Finite parabolic powers leave the same Newton vector.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Minimal finite-parabolic elements are globally minimal to Rigid standard-pair covering.

### PAPER-HE-18/R6 — Central-Newton minimal elements lie in a standard pair

theorem; **missing**. Locator: Proposition21 second half p.23; HN14 Corollary2.8.

If w∈W̃_min has central Newton vector, then w∈W_Kτ for some K⊆S̃ with W_K finite and τ∈Ω satisfying Ad(τ)θ(K)=K. The local standard-pair conclusion is a specialization via the parahoric corresponding to K. Transport from HN14 Corollary2.8 must retain central translations and any affine-action kernel.

Prerequisites: `PAPER-HE-18/C5`, `PAPER-HE-18/C8`, `PAPER-HE-18/C16`.

- Project the affine action to the semisimple root space, where central Newton becomes zero, apply the finite-parabolic theorem, and lift the normalizing length-zero factor. The exact central/torsion lift is G1/G4.

Use: PAPER-HE-18/R7; Proposition21 pp.22–23 — Supplies Central-Newton minimal elements lie in a standard pair to Rigid standard-pair covering.

Open gaps: PAPER-HE-18/G1, PAPER-HE-18/G4.

### PAPER-HE-18/R7 — Rigid standard-pair covering

theorem; **missing**. Locator: Proposition21 pp.22–23.

G^rig=⋃_(P,τ)∈StP G·_θ(Pτ̇). Each coset Pτ̇ is compact open and lies in G(π(τ)).

Prerequisites: `PAPER-HE-18/R2`, `PAPER-HE-18/R4`, `PAPER-HE-18/R5`, `PAPER-HE-18/R6`, `PAPER-HE-18/N3`, `PAPER-HE-18/N4`.

- Reduce within finite W_P for one inclusion and use R6 on minimal representatives for the other. No finite set of Ω labels is asserted.

Use: PAPER-HE-18/R15; Corrected Theorem22 pp.23–24; source-derived universal strengthening — Supplies Rigid standard-pair covering to Rigid invariant-distribution gluing.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Rigid standard-pair covering to Rigid cocenter generators and relations.

### PAPER-HE-18/R8 — Local parahoric-coset test module

definition; **missing**. Locator: §6.3 p.23.

For a standard pair i=(P,τ), let U_i=Pτ̇ and H_i=C_c(U_i,R_discrete), identified by zero extension with functions in H_R supported on U_i. The weighted θ-conjugation action of P preserves H_i.

Prerequisites: `PAPER-HE-18/R4`, `PAPER-HE-18/H1`, `PAPER-HE-18/H9`.

- Use the compact-open subspace and zero extension; import its compactly supported continuous carrier.

Use: PAPER-HE-18/R9; §6.3 p.23; universal repair of §6.4 — Supplies Local parahoric-coset test module to Local invariant distributions.

Use: PAPER-HE-18/R10; Theorem23 setup p.24 and proof p.25 — Supplies Local parahoric-coset test module to Local commutators equal local action relations.

Use: PAPER-HE-18/R11; Corrected §6.4 p.24; E4 — Supplies Local parahoric-coset test module to Inverse-transport overlap graph.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Local parahoric-coset test module to Double-coset descent of overlap relations.

API:

- `He18.localZeroExtension` (coercion): Extend a function on U_i by zero outside U_i.
- `He18.localRestriction` (equivalence): Restriction inverts zero extension on the ambient support submodule.
- `He18.localWeightedAction` (structure): T_p preserves H_i for p∈P.

Tests (specified, not Lean-executed):

- For P=O_F×,τ=m, U_i=π^mO_F×.
- The zero extension vanishes at every point outside U_i.
- For τ=1, H_i is the test module supported on P.

### PAPER-HE-18/R9 — Local invariant distributions

definition; **missing**. Locator: §6.3 p.23; universal repair of §6.4.

For i=(P,τ), let J_i be the R-linear maps H_i→R invariant under T_p for p∈P. For the universal gluing proof also use maps H_i→A for any R-module A with the same invariance condition.

Prerequisites: `PAPER-HE-18/R8`, `PAPER-HE-18/H8`.

- Use coinvariants for the local P-representation; the A-valued extension avoids assuming Hom_R(−,R) is faithful.

Use: PAPER-HE-18/R14; Corrected Theorem22 p.23 — Supplies Local invariant distributions to Compatible product of local distributions.

API:

- `He18.localInvariant` (characterisation): j_i(T_pf)=j_i(f) for all p∈P.
- `He18.localQuotientDual` (equivalence): J_i=Hom_R((H_i)_P,R).
- `He18.localTargetMap` (functoriality): An R-linear A→B sends invariant A-valued functionals to invariant B-valued ones.

Tests (specified, not Lean-executed):

- The zero functional is P-invariant.
- Restriction of j∈J(G) to H_i is in J_i.
- Hom_Z(Z/2Z,Z)=0 does not imply Z/2Z=0, so using only R-valued duals cannot prove a general-module presentation.

### PAPER-HE-18/R10 — Local commutators equal local action relations

theorem; **missing**. Locator: Theorem23 setup p.24 and proof p.25.

For i=(P,τ), the span [H_R(P),H_R(Pτ̇)]_(θ,ω) equals span_R{f−T_pf:p∈P,f∈H_i}. In particular (H_i)_P is its quotient.

Prerequisites: `PAPER-HE-18/R8`, `PAPER-HE-18/H11`, `PAPER-HE-18/H3`, `PAPER-HE-18/R4`.

- Identify P taubar with P by right translation and use alpha=Ad(taubar)theta. Since alpha(P)=P, Haar volume on compact P is preserved.
- Apply H22/H23 on P with sufficiently small pro-p U⊂ker(omega) and the required left/right stabilizers; U need not be alpha-stable. Under the right-translation identification the local weighted action has exactly alpha and omega|P.
- Track the ambient restricted Haar normalization; all denominators are pro-p volumes, never v_R(P).

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Local commutators equal local action relations to Rigid cocenter generators and relations.

### PAPER-HE-18/R11 — Inverse-transport overlap graph

definition; **missing**. Locator: Corrected §6.4 p.24; E4.

For i=(P,τ),j=(Q,γ) and a chosen representative x of P\G/Q, let U_ijx=U_i∩xU_jθ(x)⁻¹. The overlap graph is the image of C_c(U_ijx,R) under f↦(f,−T_(x⁻¹)f) in H_i⊕H_j. The inverse is essential for the second support.

Prerequisites: `PAPER-HE-18/R8`, `PAPER-HE-18/H9`.

- Use zero extensions and the support formula; x⁻¹U_ijxθ(x) is contained in U_j.

Use: PAPER-HE-18/R14; Corrected Theorem22 p.23 — Supplies Inverse-transport overlap graph to Compatible product of local distributions.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Inverse-transport overlap graph to Rigid cocenter generators and relations.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Inverse-transport overlap graph to Double-coset descent of overlap relations.

Use: PAPER-HE-18/R18; Source-derived counterexample to §6.4; E4 — Supplies Inverse-transport overlap graph to Concrete failure of forward overlap transport.

API:

- `He18.overlapGraphMap` (constructor): Map each test f on the overlap to its two supported components.
- `He18.overlapInverseSupport` (compatibility): T_(x⁻¹)f is supported on U_j∩x⁻¹U_iθ(x).
- `He18.overlapGraphKernel` (relation): q(f)−q(T_(x⁻¹)f)=0.

Tests (specified, not Lean-executed):

- An empty overlap yields the zero graph.
- For i=j,x=1, a graph pair is (f,−f).
- For upper Iwahori I in GL2 and x=diag(p,1), T_x need not send tests on I∩xIx⁻¹ into H(I), whereas T_(x⁻¹) does.

### PAPER-HE-18/R12 — Finite clopen refinement of a compact support

theorem; **missing**. Locator: Source-derived expansion of Theorem22 sheaf step pp.23–24.

Let X be locally profinite and {U_a} an open cover. Every compactly supported locally constant f on X admits a finite decomposition f=Σ f_b with disjoint compact-open supports, each contained in some U_a. Any two such decompositions admit a common finite clopen refinement.

Prerequisites: `PAPER-HE-18/H1`, `PAPER-HE-18/N11`.

- The support of f is compact open for discrete coefficients. Choose compact-open neighborhoods subordinate to the cover, extract finitely many, then disjointify by finite Boolean differences; refine two partitions by intersections.

Use: PAPER-HE-18/R13; Source-derived repair of §§6.3–6.4 — Supplies Finite clopen refinement of a compact support to Compact-test cosheaf presentation.

### PAPER-HE-18/R13 — Compact-test cosheaf presentation

theorem; **missing**. Locator: Source-derived repair of §§6.3–6.4.

For a cover of a locally profinite X by compact open subsets U_a, the sum of zero-extension maps ⊕_a C_c(U_a,R)→C_c(X,R) is surjective and its kernel is generated by (f,−f) from C_c(U_a∩U_b,R). No finiteness of the whole cover is required.

Prerequisites: `PAPER-HE-18/R12`, `PAPER-HE-18/H1`.

- Surjectivity follows from a finite subordinate partition. For a finite relation, refine all supports simultaneously and on each common piece use that its coefficients sum to zero; express it as differences against one chosen chart.

Use: PAPER-HE-18/R15; Corrected Theorem22 pp.23–24; source-derived universal strengthening — Supplies Compact-test cosheaf presentation to Rigid invariant-distribution gluing.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Compact-test cosheaf presentation to Rigid cocenter generators and relations.

Open gaps: PAPER-HE-18/G8.

### PAPER-HE-18/R14 — Compatible product of local distributions

definition; **missing**. Locator: Corrected Theorem22 p.23.

Let J_comp(A) be the submodule of ∏_(i∈StP) Hom_R((H_i)_P,A) satisfying j_i(f)=j_j(T_(x⁻¹)f) for every overlap test f∈C_c(U_i∩xU_jθ(x)⁻¹,R) and every chosen double-coset representative x. The ambient indexing object is a product, not a direct sum.

Prerequisites: `PAPER-HE-18/R9`, `PAPER-HE-18/R11`.

- The equations are exactly annihilation of the corrected graph relations; this fixes the direction and character weight together.

Use: PAPER-HE-18/R15; Corrected Theorem22 pp.23–24; source-derived universal strengthening — Supplies Compatible product of local distributions to Rigid invariant-distribution gluing.

API:

- `He18.compatibleFamily` (constructor): A family of invariant functionals satisfying all overlap equations is an element.
- `He18.compatibleEvaluate` (projection): Project to any standard pair's local functional.
- `He18.compatibleTarget` (functoriality): Postcomposition by an R-linear A→B preserves all compatibility equations.

Tests (specified, not Lean-executed):

- For an ordinary torus, arbitrary local distributions on all valuation cosets form a compatible family.
- The all-zero family is compatible.
- The family of normalized Haar distributions on every torus valuation coset is compatible but is not finitely supported.

### PAPER-HE-18/R15 — Rigid invariant-distribution gluing

theorem; **missing**. Locator: Corrected Theorem22 pp.23–24; source-derived universal strengthening.

Restriction gives an R-linear isomorphism J(G)^rig≅J_comp(R), with the product target of R14. More generally invariant A-valued test functionals on G^rig correspond naturally to J_comp(A) for every R-module A.

Prerequisites: `PAPER-HE-18/R7`, `PAPER-HE-18/R13`, `PAPER-HE-18/R14`, `PAPER-HE-18/R17`.

- Cover G^rig by all twisted translates of U_i. Transport a local functional back to a chart; R17 makes it choice-independent on overlaps. Glue on finite clopen partitions. This proof never exchanges the dual with an infinite direct sum incorrectly.

Open gaps: PAPER-HE-18/G8.

### PAPER-HE-18/R16 — Rigid cocenter generators and relations

theorem; **missing**. Locator: Corrected Theorem23 pp.24–26.

The map ⊕_(i∈StP)H_i→H̄_R^rig is surjective and its kernel is generated by the local commutator submodules and the inverse-transport graphs R11. This corrected general-ring presentation is a proposed source repair, with the explicit direct proof detailed in the report and subject to independent review.

Prerequisites: `PAPER-HE-18/R7`, `PAPER-HE-18/R10`, `PAPER-HE-18/R11`, `PAPER-HE-18/R13`, `PAPER-HE-18/R17`, `PAPER-HE-18/H8`, `PAPER-HE-18/R3`.

- Let Q be the indicated quotient. For a test on xU_i assign its transported class [T_(x⁻¹)f] in Q. R17 and graph relations make these assignments agree on overlaps. R13 glues to C_c(G^rig,R)→Q, invariant under G. Descend by H8 and check both composites on chart generators. Avoid R-dual separation, finite Ω saturation and Howe.

Open gaps: PAPER-HE-18/G8.

### PAPER-HE-18/R17 — Double-coset descent of overlap relations

theorem; **missing**. Locator: Theorem22 proof p.24; direct repair of Theorem23.

For standard pairs i=(P,τ),j=(Q,γ), write any g∈G as p x q with p∈P,q∈Q and x a chosen P\G/Q representative. Modulo local P/Q action relations, the overlap relation f∼T_(g⁻¹)f follows from the x-overlap relation. The analogous equality holds for invariant A-valued functionals.

Prerequisites: `PAPER-HE-18/R4`, `PAPER-HE-18/R8`, `PAPER-HE-18/R11`, `PAPER-HE-18/H9`, `PAPER-HE-18/A2`, `PAPER-HE-18/A6`.

- For f on U_i∩gU_jθ(g)⁻¹, first transport by p⁻¹; its support lies in U_i∩xU_jθ(x)⁻¹. Apply the x graph, then transport by q⁻¹. T_(g⁻¹)=T_(q⁻¹)T_(x⁻¹)T_(p⁻¹), so all ω factors match.

Use: PAPER-HE-18/R15; Corrected Theorem22 pp.23–24; source-derived universal strengthening — Supplies Double-coset descent of overlap relations to Rigid invariant-distribution gluing.

Use: PAPER-HE-18/R16; Corrected Theorem23 pp.24–26 — Supplies Double-coset descent of overlap relations to Rigid cocenter generators and relations.

### PAPER-HE-18/R18 — Concrete failure of forward overlap transport

theorem; **missing**. Locator: Source-derived counterexample to §6.4; E4.

Take θ=id,ω=1, upper Iwahori I⊂GL2(Q_p), x=diag(p,1), U=I∩xIx⁻¹ and u=[[1,0],[p,1]]. Then u∈U but xux⁻¹=[[1,0],[1,1]]∉I. Thus T_x1_U is not in H(I), so the printed graph (f,−T_xf) need not even have the stated codomain.

Prerequisites: `PAPER-HE-18/H9`, `PAPER-HE-18/R11`.

- Check x⁻¹ux has lower-left p², so u∈xIx⁻¹; conjugating forward gives a lower-left unit and violates the Iwahori condition.

Open gaps: PAPER-HE-18/G8.

### PAPER-HE-18/A5 — Local Iwahori–Bruhat decomposition

theorem; **planned**. Locator: §1.1 p.6; §2.5 p.11; Richarz16 Theorem1.4.

For the local reductive datum, the map W̃→I\G/I sending w to IẇI is a bijection. G is the disjoint union of these compact open double cosets.

Existing stage: `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A7`, `ReductiveGroupsPartII:RG2.4`.

- Specialize the double Tits system and Ω extension; construction of that local Tits datum remains in the RG2 source frontier.

Use: PAPER-HE-18/N2; §2.4 p.10 — Supplies Local Iwahori–Bruhat decomposition to Length-sensitive simple Bruhat multiplication.

Use: PAPER-HE-18/N5; Proposition5 pp.10–11 — Supplies Local Iwahori–Bruhat decomposition to Compact sets meet finitely many Newton strata.

Use: PAPER-HE-18/A6; Theorem22 proof p.24; Richarz16 Theorem1.4 — Supplies Local Iwahori–Bruhat decomposition to Parahoric double-coset representatives.

Use: PAPER-HE-18/N18; Derived from He18 §2.4 and the pinned abstract simple-cell laws; replacement for §2.6 p.13 bounded-multiplier step — Supplies Local Iwahori–Bruhat decomposition to Finite Bruhat multipliers with the middle cell retained.

Use: PAPER-HE-18/N20; Source-derived replacement of the compact-core claims in He18 Introduction and §5.2 — Supplies Local Iwahori–Bruhat decomposition to Compact Newton core in one Ω coset.

### PAPER-HE-18/A6 — Parahoric double-coset representatives

theorem; **planned**. Locator: Theorem22 proof p.24; Richarz16 Theorem1.4.

For standard parahorics P,Q with finite Weyl groups W_P,W_Q, P\G/Q is canonically W_P\W̃/W_Q, represented by the minimal-length double-coset representatives ^P W̃^Q. Thus every g=p ẋ q for some such representative.

Existing stage: `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `PAPER-HE-18/A5`, `ReductiveGroupsPartII:RG2.4`.

- Combine Iwahori–Bruhat with the parahoric unions and finite-parabolic minimal representatives; do not assume every g itself normalizes A.

Use: PAPER-HE-18/R17; Theorem22 proof p.24; direct repair of Theorem23 — Supplies Parahoric double-coset representatives to Double-coset descent of overlap relations.

### PAPER-HE-18/A7 — Local double Tits system

construction; **planned**. Locator: §1.1 p.6, citing BT Proposition5.2.12; Richarz16 §1.1.

Let G0 be generated by parahoric subgroups and N0=G0∩N_G(A)(F). The quadruple (G0,I,N0,S̃) is a double Tits system with affine Weyl group Wa; adjoining the length-zero alcove stabilizer yields the local extended Bruhat datum.

Existing stage: `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `PAPER-HE-18/A1`, `ReductiveGroupsPartII:RG2.4`.

- Import the existing abstract TauCeti TitsSystem and construct only its reductive-local instance from the building. BT source detail is G2.

Use: PAPER-HE-18/A5; §1.1 p.6; §2.5 p.11; Richarz16 Theorem1.4 — Supplies Local double Tits system to Local Iwahori–Bruhat decomposition.

Use: PAPER-HE-18/N18; Derived from He18 §2.4 and the pinned abstract simple-cell laws; replacement for §2.6 p.13 bounded-multiplier step — Supplies Local double Tits system to Finite Bruhat multipliers with the middle cell retained.

API:

- `He18.localTitsInstance` (constructor): Construct the Tits-system data on G0 from I and N0.
- `He18.localWeylComparison` (equivalence): Identify its Weyl group with the affine subgroup Wa of A2.
- `He18.omegaExtension` (compatibility): Ω normalizes the based Tits data and gives W̃=Wa⋊Ω.

Tests (specified, not Lean-executed):

- For split SL2 the affine simple system has two wall reflections.
- For a torus the affine Coxeter part is trivial.
- For G_m the full Iwahori–Weyl group Z is not the trivial affine Coxeter group.

Open gaps: PAPER-HE-18/G2.

### PAPER-HE-18/C17 — Finite minimal representatives after Ω transport

theorem; **missing**. Locator: Source-derived correction of He18 §2.1(a), Corollary9 pp.9–12; HN14 Theorem3.4 supplies the guarded standard-triple input.

Assume W̃=Wa⋊Ω, Ω abelian, (Wa,S̃) a Coxeter system with finite S̃, θ preserving the factors and S̃, π invariant under θ-conjugacy, and C7/C9 with straight length determined by the Newton vector. For ν in Im π and any τ0∈Ω lifting κ(ν), the set S(ν,τ0)={w∈W̃_min:π(w)=ν, prΩ(w)=τ0} is finite, and every minimal w in that fibre is θ-conjugate by an element of Ω to a member of S(ν,τ0). No finite-fibre hypothesis on Ω→Ω_θ is required.

Prerequisites: `PAPER-HE-18/C1`, `PAPER-HE-18/C3`, `PAPER-HE-18/C7`, `PAPER-HE-18/C9`.

- C9 bounds every such minimal length by Bν=ℓ(xν)+max_K max_{u∈W_K}ℓ(u), where K ranges over the finitely many subsets with finite W_K. Straight length is fixed by ν.
- In one Wa-coset the length ball of radius Bν is finite: enumerate the finitely many words in S̃ of length at most Bν.
- Write prΩ(w)−τ0=(1−θ)η. The element w′=η⁻¹wθ(η) has Ω projection τ0, the same length and the same π. Length is preserved because left and right multiplication by Ω have length zero. Being conjugate, w′ is still minimal.

Use: PAPER-HE-18/C12; Corollary9 second assertion p.12 — Supplies Finite minimal representatives after Ω transport to Finite conjugacy-class fibres without the finite-minima guard.

Use: PAPER-HE-18/F2; Theorem20 proof p.21, valid primal conclusion — Supplies Finite minimal representatives after Ω transport to Finite generation from Ω-normalized level cells.

Use: PAPER-HE-18/N20; Source-derived replacement of the compact-core claims in He18 Introduction and §5.2 — Supplies Finite minimal representatives after Ω transport to Compact Newton core in one Ω coset.

### PAPER-HE-18/N21 — Abstract simple-cell multiplication and subword upper bound

theorem; **library**. Locator: TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean:220–225 and Subword.lean:64–111 at f790474.

For a TauCeti.TitsSystem G and simple s, cell(s)cell(w) is either cell(sw) or cell(sw)∪cell(w); the analogous right law holds. A product of simple cells is contained in cells indexed by products of sublists of the simple word. These are exact abstract statements at the pin; no local G(F) or extended-Ω instance is implicit.

Pinned declarations: `tauceti:TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple`, `tauceti:TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple_right`, `tauceti:TauCeti.TitsSystem.exists_sublist_of_mem_prod_bruhatCell`.

Prerequisites: `tauceti:TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple`, `tauceti:TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple_right`, `tauceti:TauCeti.TitsSystem.exists_sublist_of_mem_prod_bruhatCell`.

- Read the exact statements and their proofs. Their upper-bound form is sufficient; a length-sensitive branch classifier is unnecessary for the next lemma.

Use: PAPER-HE-18/N18; Derived from He18 §2.4 and the pinned abstract simple-cell laws; replacement for §2.6 p.13 bounded-multiplier step — Supplies Abstract simple-cell multiplication and subword upper bound to Finite Bruhat multipliers with the middle cell retained.

### PAPER-HE-18/N18 — Finite Bruhat multipliers with the middle cell retained

theorem; **missing**. Locator: Derived from He18 §2.4 and the pinned abstract simple-cell laws; replacement for §2.6 p.13 bounded-multiplier step.

Assume an extended Iwahori–Bruhat datum W̃=Wa⋊Ω, representatives of Ω normalizing I, and the local adapters of the two simple-cell upper bounds in N21. For finite A,B⊂W̃ there are finite A′,B′⊂W̃, independent of w, such that (⋃a∈A IȧI)(IẇI)(⋃b∈B IḃI)⊆⋃a′∈A′,b′∈B′ Iȧ′ẇḃ′I for every w. The candidate endpoints retain their actual Ω factors.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A5`, `PAPER-HE-18/A7`, `PAPER-HE-18/N21`.

- Choose words a=s1⋯srτ and b=τ′t1⋯tk. Representatives of τ and τ′ normalize I, so multiply the middle label exactly to τwτ′.
- Iterate the left and right simple-cell upper bounds while always retaining this middle label. Endpoint candidates are qτ and τ′q′, for subwords q of s1⋯sr and q′ of t1⋯tk.
- Take the finite union of these endpoint sets over A and B. At most 2^r and 2^k candidates per pair are needed. The argument never deletes or expands w.

Use: PAPER-HE-18/N7; §2.6 pp.12–13, corrected proof target — Supplies Finite Bruhat multipliers with the middle cell retained to Separation of distinct Newton power growth.

### PAPER-HE-18/N19 — Finite affine errors separate distinct translation slopes

theorem; **missing**. Locator: Source-derived elementary affine argument replacing He18 §2.6 p.13 final inequality.

Let V be a real vector space, W0 a finite linear group, and A,B finite sets of affine maps with linear parts in W0. If, for infinitely many positive integers m, there are a∈A,b∈B with t^(mλ2)=a t^(mλ1)b as affine maps, then λ2 lies in the W0-orbit of λ1. This includes central directions and does not require the affine action to be faithful.

Prerequisites: `PAPER-HE-18/C2`.

- One pair a,b occurs for two distinct m,n by finite pigeonhole. Write a(v)=Lv+c and b(v)=Mv+d.
- The linear parts satisfy LM=1; comparing translations gives m(λ2−Lλ1)=c+Ld and n(λ2−Lλ1)=c+Ld.
- Subtract and use characteristic zero to obtain λ2=Lλ1. No root-length lower bound or separate central-average lemma is needed.

Use: PAPER-HE-18/N7; §2.6 pp.12–13, corrected proof target — Supplies Finite affine errors separate distinct translation slopes to Separation of distinct Newton power growth.

### PAPER-HE-18/L18 — Length-zero twisted transport preserves a level cell

theorem; **missing**. Locator: Derived from He18 §1.3, Proposition1, and the Ω-normalization used at the start of Lemma16 p.17.

Let η∈Ω and choose its representative h∈N_G(A)(F). Assume h and θ(h) normalize both I and I_n. Then T_(h⁻¹) gives an R-linear isomorphism H_R(G,I_n)_w→H_R(G,I_n)_(η⁻¹wθ(η)). The two submodules have the same image in the ambient twisted cocenter. Retain ω(h⁻¹) as an invertible coefficient.

Prerequisites: `PAPER-HE-18/A3`, `PAPER-HE-18/H9`, `PAPER-HE-18/H11`, `PAPER-HE-18/L2`.

- The support map is U↦h⁻¹Uθ(h), taking IẇI exactly to I(η⁻¹wθ(η))I.
- Both endpoint normalizers preserve left/right I_n invariance; inverse transport is T_h.
- H11 identifies f and T_(h⁻¹)f in the cocenter. Barycentric Ω-normalizer compatibility is required from A3/G2, not inferred from a bare permutation of labels.

Use: PAPER-HE-18/F2; Theorem20 proof p.21, valid primal conclusion — Supplies Length-zero twisted transport preserves a level cell to Finite generation from Ω-normalized level cells.

### PAPER-HE-18/N20 — Compact Newton core in one Ω coset

construction; **missing**. Locator: Source-derived replacement of the compact-core claims in He18 Introduction and §5.2.

Under C17 and representatives of Ω normalizing I, choose τ0 over κ(ν) and set Y(ν,τ0)=⋃w∈S(ν,τ0) IẇI. It is compact open and G·_θY(ν,τ0)=G(ν). It is empty for an empty fibre. This is a replacement core, not a claim that the paper’s original X_ν is compact.

Prerequisites: `PAPER-HE-18/C17`, `PAPER-HE-18/N1`, `PAPER-HE-18/A5`.

- C17 makes the index set finite, and each I-double coset is compact open.
- For each minimal w use η⁻¹wθ(η)∈S(ν,τ0); transport by a lift of η maps its cell to the chosen core. Hence its saturation contains X_ν.
- The reverse inclusion follows from Y⊆X_ν; different choices of τ0 have the same saturation.

Use: PAPER-HE-18/F2; finite representative set interpretation — Interprets the normalized minimal-cell generators as tests supported on one compact Newton core.

API:

- `He18.coreCompactOpen` (property): Y(ν,τ0) is compact open by a finite union of compact I-double cosets.
- `He18.coreSaturation` (compatibility): Its θ-saturation is exactly G(ν), independently of τ0 and of representatives in N_G(A)(F).
- `He18.coreLevelGeneration` (consumer): Using L18 and L14, its I_n-biinvariant tests generate the ambient level ν-component.

Tests (specified, not Lean-executed):

- For F× with inversion and parity κ, τ0=0 or 1 gives Y=uniformizer^τ0 O_F×, although X_ν has infinitely many valuation shells.
- For θ=id on F×, τ0=m gives Y=X_ν=uniformizer^m O_F×.
- An empty arithmetic fibre gives empty Y and zero test module.

### PAPER-HE-18/B1 — Existing positive modular character

theorem; **library**. Locator: Mathlib/MeasureTheory/Group/ModularCharacter.lean:102–150.

For a locally compact topological group, the modular character is a multiplicative map to nonnegative reals, is strictly positive, and scales right translates of any inner-regular left Haar measure. Its convention is mu(A g^-1)/mu(A). The pinned file does not prove continuity.

Pinned declarations: `mathlib:MeasureTheory.Measure.modularCharacter`, `mathlib:MeasureTheory.Measure.modularCharacterFun_pos`, `mathlib:MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`.

### PAPER-HE-18/B2 — Existing inner-regular Haar uniqueness

theorem; **library**. Locator: Mathlib/MeasureTheory/Measure/Haar/Unique.lean:889–898.

For a locally compact topological group with its Borel measurable structure, if mu is Haar and muprime is left invariant and finite on compact sets, both inner regular, then muprime=haarScalarFactor(muprime,mu) smul mu. This is an ENNReal-valued measure theorem, not an arbitrary-ring integration construction.

Pinned declarations: `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_innerRegular`.

### PAPER-HE-18/B3 — Existing finite inverse-system nonemptiness

theorem; **library**. Locator: Mathlib/CategoryTheory/CofilteredSystem.lean:111–113.

For any directed preorder J and a functor F:J^op→Type with every F(j) finite and nonempty, F has a compatible section. No transition-surjectivity hypothesis is required.

Pinned declarations: `mathlib:nonempty_sections_of_finite_inverse_system`.

### PAPER-HE-18/H14 — Normalized integral compact-open volume

construction; **planned**. Locator: Section1.2 pp6–7; continuation finite-index construction.

Let G be Hausdorff locally profinite and P a compact open pro-p subgroup. Define a left-invariant finitely additive volume on compact open subsets with values in Z[1/p], normalized by v(P)=1. For compact open K, v(K)=[K:K∩P]/[P:K∩P]. For compact-open U express U as a finite disjoint union of left cosets xL for a common open L⊂P and sum v(L).

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H1`, `PAPER-HE-18/H2`.

- Compact open subsets have a common right stabilizer; intersect it with P. Compactness makes the left-coset partition finite.
- If M⊂L⊂P are open, [P:M]=[P:L][L:M]; thus refining any coset preserves its volume. Two partitions have a common refinement.

Use: PAPER-HE-18/H16 — Integrate arbitrary discrete-module test functions by finite coset sums.

Use: PAPER-HE-18/H4 — Use the same normalized coefficients in convolution.

API:

- `He18.integralVolume_normalize` (simp): v(P)=1 and v(empty)=0.
- `He18.integralVolume_compactSubgroup` (characterisation): For compact open K, v(K)=[K:K∩P]/[P:K∩P].
- `He18.integralVolume_leftTranslate` (compatibility): For g∈G and compact open U, v(gU)=v(U).

Tests (specified, not Lean-executed):

- For G=Q_p additively and P=Z_p, v(p^n Z_p)=p^-n for n≥0.
- A partition of P into p cosets of an index-p subgroup sums to1.
- For G=Q3×, P=1+3Z3 and R=F2, v_R(Z3×)=2=0; its volume cannot be inverted.

### PAPER-HE-18/H15 — Index refinement and uniqueness of normalized volume

theorem; **planned**. Locator: Continuation proof of Section1.2 construction.

The H14 volume is well-defined and finitely additive. It is the unique left-invariant compact-open volume valued in a Z[1/p]-module after specifying v(P). Every compact open pro-p subgroup has volume a power of p, hence a unit after any Z[1/p]-algebra base change.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H14`.

- Any two coset partitions refine to their common subgroup intersection, which is open in P. Apply index multiplicativity.
- For arbitrary compact open K, count its left cosets of K∩P and compare the partition of P. If K is pro-p both indices are powers of p.
- Every compact open U has such a finite coset partition, so normalization and left invariance force its value.

### PAPER-HE-18/N22 — Unimodularity from extended Iwahori generators

theorem; **missing**. Locator: Continuation proof; BT84 5.2.12 and Richarz16 pp118–120 supply the local datum.

Suppose G has a compact open I, an Iwahori–Bruhat decomposition with extended Weyl group Wa⋊Omega, simple lifts n_s with n_s²∈I, and lifts of Omega normalizing I. Then G is unimodular. In particular the local reductive datum A2/A5/A7 has this property.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A5`, `PAPER-HE-18/A7`, `PAPER-HE-18/B1`.

- The positive modular homomorphism is1 on I: right translation by an element of I preserves I, which has positive finite Haar measure.
- For each simple lift, delta(n_s)^2=delta(n_s²)=1, hence positivity gives delta(n_s)=1.
- An Omega lift normalizes I; conjugation preserves its measure and left invariance therefore gives delta=1 on the lift.
- Every Bruhat representative is a product of the simple and Omega lifts modulo I. Hence delta=1 on all G. No continuity theorem for the modular character is used.

### PAPER-HE-18/H24 — Normalization preserved by an Iwahori-stabilizing automorphism

theorem; **planned**. Locator: Continuation finite-index and Haar comparison.

If alpha is a continuous group automorphism preserving a compact open I, the normalized rational volume is alpha-invariant. This holds even when the image of v(I) is zero in R. For a unimodular G the volume is also right-translation and inversion invariant.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H15`, `PAPER-HE-18/B2`, `PAPER-HE-18/N22`.

- The pullback volume U↦v(alpha(U)) is left invariant. By H15 it is c times v, with c in positive rationals; evaluate on I to get c=1 since v(I)>0 in Q.
- Only after this rational identity is proved apply Z[1/p]→R. No cancellation of v_R(I) is made.
- Unimodularity identifies right and left Haar values; inversion converts left to right. Alternatively verify these identities on the same finite coset partitions.

### PAPER-HE-18/H16 — Finite-sum integration with arbitrary module coefficients

construction; **planned**. Locator: Continuation construction for Sections1.2–1.3.

For any Z[1/p]-algebra R and R-module M with the discrete topology, define integral:C_c(G,M)→M by integral f=v_R(U) sum_(xU in supp(f)/U) f(x), where U⊂P is a common right-invariance subgroup. This is independent of representatives and U and is R-linear.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H14`, `PAPER-HE-18/H15`, `PAPER-HE-18/H2`.

- A compactly supported locally constant function has finite image and compact-open nonzero support. Its common right level gives the displayed finite sum.
- Refinement repeats each summand [U:V] times and replaces v(U) by [U:V]v(V); distributivity proves independence over any M.

Use: PAPER-HE-18/H18 — Finite Fubini proves associativity without real or complex coefficient assumptions.

Use: PAPER-HE-18/H22 — Integrate a compactly supported locally constant H_R-valued family of coinvariant relations.

API:

- `He18.testIntegral_indicator` (simp): Integral of 1_U times m is v_R(U) smul m.
- `He18.testIntegral_add` (structure): Integration is R-linear and commutes with R-linear maps M→N.
- `He18.testIntegral_fubini` (compatibility): A compactly supported locally constant function on G×G has equal iterated finite integrals.

Tests (specified, not Lean-executed):

- Integral of zero is zero over any module, including a torsion module.
- For an index-p partition the sum of the p indicator integrals equals the integral of the parent indicator.
- An infinite sum of disjoint valuation-shell indicators on F× is not a compact test function; this integral does not define it.

### PAPER-HE-18/H17 — Convolution has compact support and finite levels

theorem; **planned**. Locator: Section1.2 construction; continuation proof.

For f,h∈C_c(G,R), convolution from H16 is locally constant with support contained in supp(f)supp(h). If f is left U-invariant and h is right V-invariant, then f*h has the same left U and right V invariance.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H16`, `PAPER-HE-18/H2`.

- If no x in supp(f) has x^-1g in supp(h), every integrand vanishes. The product of the two compact supports is compact.
- For u∈U use the substitution x=u y and left invariance of volume to show (f*h)(u g)=(f*h)(g). Right V-invariance follows inside h.

### PAPER-HE-18/H18 — Associativity of integral convolution

theorem; **planned**. Locator: Continuation proof of H4.

The finite-sum convolution is associative and R-bilinear on C_c(G,R). No compact-open volume other than a pro-p level is inverted.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H16`, `PAPER-HE-18/H17`.

- For fixed g, expand ((f*h)*k)(g) as a finite double integral f(x)h(x^-1y)k(y^-1g).
- The integrand has compact support in (x,y). Set y=x z, using only left invariance, then interchange finite sums to obtain (f*(h*k))(g).

### PAPER-HE-18/H19 — Coefficient base change for compact test functions

theorem; **missing**. Locator: Continuation proof of Section1.3 scalar extension.

For B=Z[1/p] and any commutative B-algebra R, C_c(G,B) tensor_B R→C_c(G,R), f tensor r↦(g↦f(g)r), is an isomorphism of modules and respects convolution. No flatness of R is required.

Prerequisites: `PAPER-HE-18/H2`, `PAPER-HE-18/H16`, `PAPER-HE-18/H18`.

- At each compact open right level U, the test module is the direct sum of copies of B indexed by G/U, with finite support, and after tensoring gives the analogous R-module.
- The ambient test module is the filtered colimit of these levels; tensor commutes with this colimit. Equivalently refine any finite tensor relation to one common coset basis and compare coefficients.
- Both convolution formulas use only the same B-valued finite volumes and finite sums, so the isomorphism respects multiplication.

### PAPER-HE-18/H20 — Cofinal pro-p local units

theorem; **planned**. Locator: Section1.2–1.3 input; continuation proof.

For a compact open pro-p U put e_U=v_R(U)^-1 1_U. Then e_U*e_U=e_U. Left-U-invariant f satisfies e_U*f=f; right-U-invariant f satisfies f*e_U=f. Every finite family of compact tests admits a common two-sided unit e_U.

Existing stage: `SmoothRepresentationsOfLocalGroups:SR.1`.

Prerequisites: `PAPER-HE-18/H15`, `PAPER-HE-18/H16`, `PAPER-HE-18/H17`.

- The integral defining e_U*f averages a constant left-U-invariant function over U, so the normalization cancels the unit v_R(U).
- For f*e_U the integration domain is gU; f is constant there by right invariance.
- Intersect the finitely many left and right stabilizers with P to obtain a common compact open pro-p U.

### PAPER-HE-18/H21 — Convolution twist automorphism

construction; **missing**. Locator: Continuation reformulation of Section1.3.

For unimodular G, a measure-preserving continuous automorphism theta and a character omega:G→R× with open kernel, define tau(f)(g)=omega(theta^-1(g))^-1 f(theta^-1(g)). This is an R-linear convolution-algebra automorphism. It need not have finite order, and omega need not be theta-invariant.

Prerequisites: `PAPER-HE-18/H4`, `PAPER-HE-18/H24`, `PAPER-HE-18/A4`.

- The inverse is h↦(x↦omega(x)h(theta(x))). Both maps preserve compact support and local constancy.
- In the convolution identity substitute x=theta(y); multiplicativity of omega combines the two scalar factors.

Use: PAPER-HE-18/H10 — Identify the printed generator span with all f*h-h*tau(f).

Use: PAPER-HE-18/H22 — Use the exact inverse character in the change-of-variables identity.

API:

- `He18.convolutionTwist_indicator` (simp): If omega is constant on compact open X, tau(1_X)=omega(X)^-1 1_(theta(X)).
- `He18.convolutionTwist_mul` (compatibility): tau(f*h)=tau(f)*tau(h).
- `He18.convolutionTwist_inverse` (equivalence): The inverse sends h to x↦omega(x)h(theta(x)).

Tests (specified, not Lean-executed):

- For theta=id and omega=1, tau=id.
- For an abelian finite group with nontrivial omega, tau(delta_x)=omega(x)^-1 delta_x.
- No equality omega(theta(x))=omega(x) is used; the inverse character is evaluated at theta^-1(g).

### PAPER-HE-18/H22 — Every twisted convolution commutator is a finite action relation

theorem; **missing**. Locator: Continuation direct proof of Proposition1, first inclusion.

Under H21, f*h-h*tau(f)=integral_x f(x)[L_xh-T_(x^-1)(L_xh)]dmu(x), with L_xh(g)=h(x^-1g). Consequently every twisted commutator belongs to the span of v-T_xv.

Prerequisites: `PAPER-HE-18/H16`, `PAPER-HE-18/H21`, `PAPER-HE-18/H9`.

- Expand h*tau(f) and substitute y=g theta(x)^-1, using inversion, right translation and theta invariance of volume. Its integrand becomes f(x)omega(x)^-1 h(g theta(x)^-1).
- Compute T_(x^-1)(L_xh)(g)=omega(x)^-1 h(g theta(x)^-1).
- The parameter family is locally constant into the discrete test module: the left and right translation actions on compact tests have open stabilizers, theta is continuous and omega has open kernel. Multiplication by f makes the family compactly supported in x. H16 therefore expresses the integral as a finite R-linear combination of action relations.

### PAPER-HE-18/H23 — Action relations from asymmetric local units

theorem; **missing**. Locator: Continuation direct proof of Proposition1, reverse inclusion.

Under H21, for f and x choose compact open pro-p U⊂ker(omega) with f left U-invariant and right theta(U)-invariant. Put a=delta_x*e_U and b=f*delta_(theta(x)^-1), where these denote actual translated compact functions, not Dirac test functions on a nondiscrete group. Then omega(x)(a*b-b*tau(a))=T_xf-f.

Prerequisites: `PAPER-HE-18/H20`, `PAPER-HE-18/H21`, `PAPER-HE-18/H9`.

- Choose U inside P∩ker(omega)∩leftStabilizer(f)∩theta^-1(rightStabilizer(f)); these are identity neighborhoods. There is no requirement theta(U)=U.
- Explicitly a(g)=v(U)^-1 1_(xU)(g), b(g)=f(g theta(x)), and tau(a)=omega(x)^-1 delta_(theta(x))*e_(theta(U)).
- Use e_U*f=f and f*e_(theta(U))=f to compute a*b=omega(x)^-1 T_xf and b*tau(a)=omega(x)^-1 f.

### PAPER-HE-18/A8 — Rational-character translation lattice of the actual minimal Levi

construction; **missing**. Locator: Tits79 Sections1.2–1.3, printed p32; Richarz16 Section1.1 p118.

For Z=Z_G(A), use V=X_*(A) tensor R and the finite-index restriction X_F^*(Z)⊂X^*(A). Define v:Z(F)→V by chi(v(z))=-ord_F(chi(z)) for rational characters chi of Z. Its image Lambda is a full lattice. The quotient N(F)/Z_c, Z_c=ker(v), acts affinely on A and is an extension of W0 by Lambda; no splitting is asserted.

Prerequisites: `PAPER-HE-18/A1`.

- Use the actual rational-character pairing, which remains meaningful when Z is not a torus. Tits gives the bounds Hom(X^*(A),Gamma)⊂Lambda⊂Hom(X_F^*(Z),Gamma).
- The finite-index lattice bounds give the full-rank lattice. Tits extends the normalizer action to an affine space, retaining the split-central factor.

Use: PAPER-HE-18/A9 — Compare the actual Iwahori–Weyl group with its possibly nonfaithful affine action.

Use: PAPER-HE-18/C2 — Define Newton displacement without a false split translation formula.

API:

- `He18.localTranslation_character` (characterisation): chi(v(z))=-ord_F(chi(z)); the sign is fixed by this identity.
- `He18.localTranslation_mul` (structure): v(z zprime)=v(z)+v(zprime).
- `He18.localTranslation_lattice` (data): Lambda lies between the two rational-character dual lattices of finite index.

Tests (specified, not Lean-executed):

- For G=G_m, v(varpi)=-1 in the Tits coordinate.
- For G=GL_m(D), Z contains D× factors; use rational characters such as reduced norms, not cocharacters of a supposed torus Z.
- For ramified restriction-of-scalars tori, the two bounding lattices can differ; equality with the naive split cocharacter lattice is not assumed.

### PAPER-HE-18/A9 — Finite kernel of the actual affine action

theorem; **missing**. Locator: Richarz16 Section1.1 p118; Tits79 Sections1.2–1.3.

For local F, the action Wtilde=N(F)/Z0→Aff(A) has kernel Z_c/Z0, a finite group: Richarz identifies Z_c as the unique maximal compact subgroup of Z(F), and Z0 is its open compact parahoric subgroup. The image has translation lattice Lambda and finite linear quotient W0.

Prerequisites: `PAPER-HE-18/A2`, `PAPER-HE-18/A8`.

- The normalizer action kernel is Z_c and contains Z0, so its induced kernel is Z_c/Z0.
- A compact group modulo an open subgroup is finite. The normalizer quotient by Z(F) is W0, giving the finite linear quotient. This proof does not require a splitting of N(F)/Z_c.

### PAPER-HE-18/C18 — Newton displacement for a possibly nonfaithful affine action

theorem; **missing**. Locator: Continuation replacement interface for Section2.1.

Let phi(v)=L v+c be an affine automorphism with L of finite order d. Then phi^d is translation by lambda=sum_(i=0)^(d-1)L^i c and nu=lambda/d. This vector is independent of the annihilating power d. Affine conjugation by a map with linear part M sends nu to M nu. Finite kernels in the acting group do not affect this construction; central directions are retained.

Prerequisites: `PAPER-HE-18/A8`, `PAPER-HE-18/A9`, `PAPER-HE-18/A4`.

- Iterate the affine map to obtain the geometric sum. For every multiple kd the displacement is k lambda, so division by kd gives nu. Compare arbitrary annihilating powers through their least common multiple.
- Conjugation takes a translation by lambda to one by M lambda. Apply this to the dth power.
- For w theta, the linear parts lie in the finite group generated by W0 and the finite-order theta action. The average applies on the full apartment without requiring (w theta)^d to be a chosen translation in Wtilde itself.

### PAPER-HE-18/L19 — Imported finite-field Lang surjectivity

theorem; **missing**. Locator: Muller01 complete pp1–2; Lang56 theorem as cited there.

For a smooth connected affine algebraic group H over F_q, z↦z^-1 Frob_q(z) is surjective on H(overline(F_q)). Reuse the same generic supplier identified in PAPER-KISIN-ZHOU-25/R14; this is an additional proof source, not a second Lang owner.

Prerequisites: `ReductiveGroupsPartII:RG2.3`.

- Muller uses the twisted right action g:x↦g^-1 x F(g). A closed orbit exists for an affine algebraic-group action.
- For a point x choose m with F^m standard and fixing x. The product x F(x)...F^(m-1)(x) has finite order r because its matrix entries lie in a finite field. Thus (Ad(x)F)^(mr)=F^(mr), so the twisted stabilizer is finite.
- The orbit dimension formula gives full dimension. A connected algebraic group is irreducible, hence the closed full-dimensional orbit is the whole group. The algebraic orbit/dimension prerequisites remain explicitly imported source obligations.

Open gaps: PAPER-HE-18/G9.

### PAPER-HE-18/L20 — Finite Lang solution torsors

theorem; **missing**. Locator: Continuation elementary Lang-fiber computation.

For an affine algebraic group H/F_q of finite type and a∈H(overline(F_q)), if S_a={z:z^-1F(z)=a} is nonempty then it is a left H(F_q)-torsor. In particular S_a is finite. Connectedness is needed for L19 nonemptiness, not for this fiber identity.

Prerequisites: `PAPER-HE-18/L23`.

- If h,z are solutions then F(h z^-1)=h a (z a)^-1=h z^-1. Conversely left multiplying a solution by an F-fixed element yields a solution.
- A finite-type scheme over a finite field has finitely many rational points; thus the torsor is finite.

### PAPER-HE-18/L21 — Compatible Lang solutions in inverse limits

theorem; **missing**. Locator: Continuation finite-solution-set proof for Lemma15.

Let (H_j) be an inverse system indexed by a nonempty directed preorder of smooth connected affine groups of finite type over F_q with transition homomorphisms over F_q. For J=lim H_j(overline(F_q)), the Lang map z↦z^-1F(z) is surjective. Neither surjectivity of the transition maps on solution sets nor connected transition kernels is an additional hypothesis.

Prerequisites: `PAPER-HE-18/L19`, `PAPER-HE-18/L20`, `PAPER-HE-18/B3`.

- For a compatible target a=(a_j), form S_j={z_j:z_j^-1F(z_j)=a_j}. L19 and L20 make every S_j nonempty and finite.
- Transition homomorphisms commute with Frobenius and take each S_j to the earlier solution set; they need not be surjective.
- Apply the pinned finite inverse-system theorem to obtain a compatible solution. The identification of the actual parahoric intersection with such a system is a separate G6 producer.

### PAPER-HE-18/L22 — Fixed cosets from a surjective subgroup Lang map

theorem; **missing**. Locator: Continuation group-theoretic proof of Lemma15 interface.

For a group H with automorphism sigma and sigma-stable subgroup J, if z↦z^-1sigma(z) is surjective on J, then H^sigma/J^sigma→(H/J)^sigma is bijective. Normality of J is not assumed.

Prerequisites: `PAPER-HE-18/L21`.

- Injectivity follows directly from equality of right J-cosets of fixed representatives.
- For a fixed coset xJ let a=x^-1sigma(x)∈J. Choose z∈J with z^-1sigma(z)=a. Then sigma(x z^-1)=x a (z a)^-1=x z^-1, so the same coset has a fixed representative.

### PAPER-HE-18/L23 — Finite rational points of an affine finite-type scheme

theorem; **missing**. Locator: Continuation elementary input to finite Lang fibers.

For an affine scheme X of finite type over F_q, X(F_q) is finite. If its coordinate algebra is generated by n elements, evaluation on those generators injects X(F_q) into F_q^n, so its cardinality is at most q^n.

- An F_q-algebra homomorphism from the coordinate algebra to F_q is determined by its values on the chosen finite generating set.
- The finite product F_q^n is finite; relations only cut out a subset.

## Validation and remaining work

- Twisted convolution automorphism and integral identity: **2160 cases PASS**. All S3 basis pairs, six inner twists, trivial/sign characters, five pro-p normalization/coefficient pairs; includes p=3,R=F2 with volume(G)=0.
- Asymmetric local-unit commutator formula: **108 cases PASS**. S3 with U=<12> and theta=Ad(123), so theta(U) differs from U; all translating x,y and F3,F5,F7.
- Abstract pro-p fixed-coset obstruction: **5 cases PASS**. Z/p^2, sigma=1+p, J=pZ/p^2: all quotient cosets fixed but fixed points map only to zero.
- Lang fibers are left fixed-group torsors: **14 cases PASS**. Every nonempty Lang fiber of each S3 inner automorphism; no false surjectivity assertion for abstract finite groups.
- Compatible additive Lang equations: **150 cases PASS**. Truncated coefficient towers of lengths1..4 with targets in F2/F3 and solutions in F4/F27; projection compatibility checked, finite-field Lang surjectivity is not asserted.

These fresh exact diagnostics test formulas and hypotheses; they do not prove the
general source statements. Previous diagnostics remain historical evidence and
are not claimed rerun. The paper checker, authorized-path intake, IDs, ownership,
API/test references, input hashes and prerequisite graph are checked before
submission. No Lean deliverable was requested or compiled.

- **PAPER-HE-18/G1 — Actual local Iwahori–Weyl/translation and central-kernel comparison:** Tits79 Section1.2 and Richarz16 now give the actual rational-character lattice, compact affine kernel and full-apartment action (A8/A9). C18 defines Newton displacement without a splitting. Finish declaration-level construction from BT and transfer of HN14 reduced/finite-action statements to the actual extended datum; no cocharacters of a nontorus minimal Levi are assumed.
- **PAPER-HE-18/G2 — Bruhat–Tits and congruence model source closure:** The main paper and Richarz cite BT II 5.1.20/5.2.7/5.2.12 and Tits79 §§1.2,3.1. Those long foundational sources were not read fully here. Supply precise root-filtration product bijections, θ/Ω stability, nonreduced root shifts and g1⁻¹I_ng1⊆I_(n−1), at integer barycentric depths.
- **PAPER-HE-18/G3 — Integral Haar/convolution foundations:** The integral-volume, finite-sum convolution, base-change, local-unit and twisted-commutator arguments are now supplied explicitly in H14–H24; N22 supplies reductive unimodularity from the actual extended Iwahori datum. This removes Vigneras I§2 as a necessary dependency of the chosen proof. Remaining: implement the SR.1 adapters and close the actual local Iwahori producers already tracked in G1/G2; no standalone integral-Haar proof gap remains.
- **PAPER-HE-18/G4 — He–Nie finite-parabolic and affine geometric proof frontier:** The author-final HN14 introduction and §§1–3.4 were read including proofs. Proposition2.4 omits details via He–Nie's finite-Weyl paper; Theorem2.5 cites He's partial-conjugation results. Read and decompose those inputs, verify the hyperplane/axis steps and the transfer back from finite-order reduced action. This is not discharged by reading an obsolete arXiv theorem number.
- **PAPER-HE-18/G5 — Newton separation: conditional proof supplied:** N18/N19 now give the complete finite-multiplier/affine comparison argument. The standalone G5 step is resolved relative to the explicit actual-group producers; full extraction closure still requires C2/A5/A7 from G1 and the standard-triple source chain. Do not resume with a separate equal-central-average lemma.
- **PAPER-HE-18/G6 — Lang lifting and Frobenius-equivariant congruence counting:** L19–L22 now give finite-type Lang, finite solution torsors, compatible inverse-limit solutions using the pinned finite-system theorem, and the exact fixed-coset argument. Remaining: construct the actual connected Frobenius-equivariant intersection quotients, prove completeness/identification with their inverse limit, the depth-shift comparison and the level contracted-product bijection. Reading Tits/BT product charts does not itself close these producers.
- **PAPER-HE-18/G7 — General central twist: finite-core argument supplied:** C17 Ω-normalizes all minimal representatives into a finite fixed coset. L18 supplies the exact same-level transport, yielding N20/F2/F3/F4. This removes the finite-minima guard from class finiteness and the field-valued Howe argument. The Ω-normalizer/barycentric producer is explicitly assigned to A3/G2, and cardinalities remain G6. Arbitrary-ring dual finite generation is still false.
- **PAPER-HE-18/G8 — Independent checking of proposed source repairs:** The direct cosheaf/coinvariant proof and the symbolic counterexamples are written in full in the report; finite diagnostics are not Lean proofs or independent verification. All sourceIssues await a different worker's review. No reviewer object or self-confirmed verdict is supplied.
- **PAPER-HE-18/G9 — Finite-type Lang proof suppliers:** Muller01 is fully read, but its closed-orbit existence and orbit-dimension formula (Humphreys8.3 and4.1), geometric irreducibility of a connected smooth group, and faithful linear embedding remain explicit algebraic-group supplier obligations. Reuse the upstream ReductiveGroups embedding, dimension and component layers and the existing Kisin–Zhou R14 Lang owner; do not infer completed Lean proofs from the short proof source.

The next worker should continue with actual BT/congruence models and the HN14
transfer, preserving the explicit integral and inverse-limit proofs supplied here.
Independent source-error review belongs to the separate review job.
