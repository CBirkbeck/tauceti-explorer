# Handoff: BP-KTheoryLowDegrees--Z.3 (issue #765)

## Current continuation: 2026-09-26

Agent: ChatGPT (GPT-6 Astra Pro), session `gpt6-20260926-a73f2c`.
This continues Codex's checkpoint #2772 and Claude Code's checkpoint #2922
(session `cc-38267a`), rather than replacing their packet.

**Status: partial mathematical-integration checkpoint.** This submission changes
only this handoff. It supplies a construction with proof for locally constant
line-bundle powers, a primary-source match and explicit proof for the exterior
filtration, and a determinant-of-tensor-products proof reduced to an actual
pinned Mathlib theorem. These address two recorded gap entries, but the packet,
roadmap document and suggested signatures have not yet been updated with them.
Do not mark those gap entries closed or promote this job from this handoff alone.
The Serre representation-theory gap is untouched.

### Preserved inputs and earlier results

The input packet is blob `1113cb5a6a3087419c6c634568adff1888896620` at
main snapshot `48b238fab80dd362d3ca931ede2442cb19cc4917`. The previous handoff is
blob `9995ce9d21a7960c8e1c39863436dd9ea5480164`, available without relying on
moving main at:

<https://github.com/CBirkbeck/tauceti-explorer/blob/48b238fab80dd362d3ca931ede2442cb19cc4917/research/blueprint/handoff/BP-KTheoryLowDegrees--Z.3.md>

That handoff remains the detailed record of the earlier authors' work, sources,
requests and compilation. In particular, its claims of 172 nodes, 314 baseline
declarations and successful compilation are **earlier-author reports**, not
freshly reproduced results of this continuation.

The existing packet and suggested file are preserved without modification:

- Reported nodes: 12 applications, 8 comparisons, 24 constructions,
  12 definitions, 86 lemmas and 30 theorems; stage counts Z.3 91, Z.4 36,
  Z.5 31 and Z.6 14.
- Reported API/tests/planets: 260 / 157 / 18; 19 source issues.
- Earlier coverage: Z.3 and Z.5 partial; Z.4 and Z.6 source-decomposed.
- Earlier Lean report: 5,311 lines, compilation at the pins with 507
  proof-placeholder warnings. This continuation did not compile Lean.
- All earlier node ids, ownership proposals, source-issue records and consumer
  requests remain in the unchanged packet. In particular, do not duplicate
  the abstract lambda-ring algebra in SchemeKTheoryOperations S.6 or the
  elliptic specialization in Z.5.

RS-18's accepted result was read: reviewer
`independent-review-REV-RS-18`, acceptance date 2026-09-23. The intended title is
*Grothendieck groups, Cartan maps, and Euler forms, Part II: explicit ring and
curve K₀ and stable-matrix K₁*, extending GrothendieckEulerForms. Its Z.5
narrowing is respected below: these are general vector-bundle constructions,
not a second elliptic K₀ theorem. The reviewed library-coverage entry for Z.5
is `not built` (AUDIT-29); this does not license rebuilding its existing
category, line-bundle class or linear-algebra prerequisites.

## 1. Integration map

The following prefix is suppressed in this table: `KTheoryLowDegrees:`.

| Existing node or gap | New material here | Required integration |
| --- | --- | --- |
| `Z.5/exterior-power-extension-filtration` | Section 2; Stacks 0FIC explicitly supplies the filtration in its proof | Add the locator and the intrinsic filtration/quotient proof. |
| `Z.3/exterior-extension-filtration`, `Z.3/exterior-extension-graded` | The affine/module specialization of Section 2 | Reuse the module exterior-power API; do not duplicate the sheaf construction. |
| `Z.5/determinant-bundle-tensor`, `Z.3/determinant-tensor` | Section 3, with `Matrix.det_kronecker` at the required pin | Replace the exercise-only proof boundary by the basis-change and gluing argument; preserve the original exercise as target attribution. |
| Gap: Locally constant tensor powers of line bundles | Section 4, including infinite-image exponents | Introduce the scheme-level construction and action, then cite them explicitly. |
| `Z.5/rank-determinant-surjective` | Section 5 identifies the target with the existing trivial square-zero extension | Replace the unexplained action and duplicate ring construction; preserve the other prerequisites. |
| Gap: Exercise-level lemmas without a source proof | Sections 2–3 | Close only after the proofs, declarations, sources and signatures are integrated and checked. |

Nothing here establishes that the complete Z.5 dependency graph is closed.
In particular, the general Picard-group supplier and the proposed stage split
still need the reconciliation described in Section 8.

## 2. Exterior filtration: a source match and an explicit proof

**Source.** Stacks Project, Lemma 45.13.1, tag **0FIC**, proof, read
2026-09-26: <https://stacks.math.columbia.edu/tag/0FIC>.
The proof explicitly uses a filtration of the r-th exterior power of a short
exact sequence, with graded pieces the tensor products of exterior powers of
its subobject and quotient. This is a primary-source match for the missing
Weibel I.5.4 exercise input, not a claim that the tag contains all the
implementation details below. The following is an explicit expansion of the
construction and its independence from local splittings.

**Statement.** Let X be a scheme and

    0 -> A -> B -> C -> 0

an exact sequence of finite locally free O_X-modules. For each integer r >= 0
there is a canonical decreasing filtration of the vector bundle exterior^r B,
with

    F^0 = exterior^r B,  F^(r+1) = 0,
    F^p / F^(p+1) ≅ exterior^p A ⊗ exterior^(r-p) C

for 0 <= p <= r. Every F^p and every displayed quotient is finite locally
free. The construction is natural in maps of short exact sequences and
commutes with arbitrary scheme pullback. There is no assumption that the
original sequence splits globally, that X is quasi-compact, or that the base
contains the rational numbers.

### 2.1 Intrinsic definition

Write i : A -> B for the injection. For 0 <= p <= r define F^p to be the
image sheaf of

    exterior^p A ⊗ exterior^(r-p) B -> exterior^r B,

where the map applies exterior^p i to the first factor and then wedges.
Set F^(r+1) = 0. Thus F^0 is the entire exterior power, including when r=0.
A local wedge containing p+1 factors from A also contains p such factors, so
F^(p+1) is contained in F^p. This defines the filtration before choosing any
splitting. An implementation using an increasing filtration should explicitly
translate indices; it must not silently reverse the graded pieces.

### 2.2 Local normal form and local freeness

The short exact sequence splits locally: on a sufficiently small open where C
is finite free, lift each member of a finite basis of C through the epimorphism
of sheaves. Shrink the open for the finitely many lifts and extend them linearly.
The resulting map C -> B is a section. Refine further so that A is also free.
On this open write B = A ⊕ C. The exterior direct-sum decomposition gives

    exterior^r B ≅ ⊕_(j=0)^r exterior^j A ⊗ exterior^(r-j) C.

Under this isomorphism the image defining F^p is precisely the sum of the
summands with j >= p. One inclusion follows by counting the A factors in a
wedge. Conversely, each pure basis wedge with j >= p A factors is obtained by
putting p of those factors in the first factor of the defining map and the
remaining factors in the second. Such wedges span the summand, proving the
other inclusion. This reasoning also covers zero-rank bundles and exterior
powers above the rank: the corresponding basis sets are empty.

Consequently F^p is locally a direct summand, its quotient by F^(p+1) is the
j=p summand, and both are finite locally free. In particular, these are short
exact sequences in the actual vector-bundle exact category, not just in the
ambient category of arbitrary sheaves.

### 2.3 Canonical graded map and independence of lifts

There is a local map from exterior^p A ⊗ exterior^(r-p) C to F^p/F^(p+1):
wedge the A factors with any local lifts to B of the C factors. Changing a
single lift by a section of A changes the wedge by a term containing at least
p+1 A factors. Such a term is in F^(p+1). Repeated replacement proves
independence of all lifts. Multilinearity and alternation descend for the same
reason, so this gives a well-defined map through the exterior powers.

These locally defined maps agree on overlaps because their formula is
independent of the lifts. Therefore they glue to a global map. In every local
splitting from Section 2.2 it is the identity on the j=p summand, hence is an
isomorphism. This supplies a **specified compatible isomorphism** on overlaps;
it does not use the false principle that isomorphism classes can always be
glued merely because they agree locally.

### 2.4 Naturality and pullback

A morphism of short exact sequences takes each wedge defining F^p to the
corresponding wedge in the target, and the quotient formula takes lifts to
lifts. This proves naturality. For a morphism Y -> X, the pulled-back sequence
is again exact because it is locally split. Pullback preserves the finite
exterior-power and tensor constructions; in a local split form it preserves
the direct summands just identified. Hence the natural comparison identifies
the pulled-back F^p with F^p of the pulled-back sequence. This argument does
not assume that arbitrary pullback is exact on all O_X-modules or preserves
all image sheaves.

### 2.5 Consequence and acceptance checks

Successive short exact sequences of the filtration give

    [exterior^r B] = sum_(p=0)^r [exterior^p A] [exterior^(r-p) C]

in K₀(Vect X), the identity needed for the pre-lambda construction. No special
lambda-ring identity, highest-weight theorem or splitting principle is used.
This therefore does not solve the separate Serre gap by circular reasoning.

Mathematical acceptance checks to encode:

1. r=0: F^0=O_X, F^1=0 and the unique graded piece is O_X.
2. A=O_X and C=O_X^2, r=2: the graded ranks for p=0,1,2 are 1,2,0,
   so the ranks of F^0,F^1,F^2 are 3,2,0. This detects reversed indexing.
3. The sequence over k[t] with injection multiplication by t and quotient
   k[t]/(t) is not an admissible input: its quotient is not locally free.
   Pullback to t=0 destroys injectivity. A test must not weaken the quotient
   hypothesis while keeping the arbitrary-pullback conclusion.

## 3. Determinant of a tensor product: the missing coordinate calculation

**Pinned primary-source input.** Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, file
`Mathlib/LinearAlgebra/Matrix/Kronecker.lean`, theorem
`Matrix.det_kronecker`, was read. Its actual assumptions are finite decidable
index types and a commutative coefficient ring; its conclusion is

    det(A ⊗kronecker B) = det(A)^card(n) * det(B)^card(m).

It applies to arbitrary square matrices, not just invertible matrices, and
requires neither a field nor characteristic zero. This must be a baseline
citation, not a newly planned determinant-polynomial lemma.

<https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Kronecker.lean>

**Statement.** If E and F are finite locally free sheaves of constant ranks
m and n, respectively, there is an isomorphism

    det(E ⊗ F) ≅ det(E)^(⊗ n) ⊗ det(F)^(⊗ m),

natural in bundle isomorphisms and compatible with arbitrary scheme pullback.
With locally constant ranks the same formula uses the powers in Section 4.

**Proof.** On an open where E and F have ordered bases e_1,...,e_m and
f_1,...,f_n, order the tensor basis lexicographically in (i,j), with i first.
Map its top wedge to

    (e_1 ∧ ... ∧ e_m)^(⊗ n) ⊗ (f_1 ∧ ... ∧ f_n)^(⊗ m).

Both sides are rank-one free modules, so this specifies an isomorphism there.
Upon changing the E basis by A and the F basis by B, the top wedge on the left
is multiplied by det(A ⊗kronecker B); the displayed generator on the right is
multiplied by det(A)^n det(B)^m. The pinned theorem makes these factors equal.
Thus the local isomorphisms agree on overlaps and glue. This is the precise
basis-change check concealed by an unqualified statement that the local
formula is canonical.

Applying a bundle isomorphism transports ordered bases and the same formula,
which proves naturality. After arbitrary base change the bases, matrices and
wedge maps base change, and the formula is unchanged, proving pullback
compatibility. If m=0 or n=0, use the empty top wedge and the tensor unit;
the same formula gives the unit isomorphism. For varying ranks first use the
pairwise disjoint clopen sets where the pair of ranks is (m,n), and then glue
these already constructed isomorphisms. No boundedness of the rank functions
is needed for this sheaf-level assertion.

This is a supplied proof of the exercise-level statement, not a claim to have
found a separately published proof of Weibel Ex. II.8.5. The source attribution
to that exercise can remain. The proof inputs now have explicit locations:
the existing determinant/exterior/tensor constructions, the pinned matrix
identity and sheaf-morphism gluing from Stacks 00AK.

Acceptance checks:

1. E=0: both sides are the trivial line bundle, even for nonzero F.
2. Swapping two E basis vectors when rank(F)=3 multiplies both displayed
   generators by -1. Dropping the sign or transposing the exponents fails.
3. Over Z/4, take A=(3) and B=((1,1),(0,3)). Both determinants in the identity
   reduce to 3. The argument must work over this nonreduced coefficient ring.
4. For line bundles L,M, applying the formula to E=L⊕O and F=M⊕O gives
   L^(⊗2)⊗M^(⊗2), matching the explicit four line-bundle summands of E⊗F.

## 4. Locally constant powers, without a finite-image assumption

### 4.1 Construction on actual line bundles

Let X be a scheme, L an invertible O_X-module, and a : X -> Z a locally
constant function. Write U_n = a^(-1)({n}). These subsets are open because a
is locally constant, and closed because their complements are unions of the
other fibres. They are a pairwise disjoint open cover of X, including possibly
empty members; a need not have finite image.

For each n take the ordinary integer tensor power of L restricted to U_n.
Here exponent 0 is O_(U_n), positive exponents are tensor powers, and negative
exponents are positive powers of the dual. This is Stacks Definition 17.25.6,
tag **01CU**, together with the explicit negative-power explanation and
canonical power isomorphisms in Section 17.25, read 2026-09-26:

<https://stacks.math.columbia.edu/tag/01CU>
<https://stacks.math.columbia.edu/tag/01CR>

An explicit glued sheaf P_a(L) is given, for each open V of X, by

    P_a(L)(V) = product_(n in Z) (L|_(U_n))^(⊗n)(V ∩ U_n).

The O_X(V)-action uses restriction to V∩U_n in each coordinate; restrictions
are coordinatewise. For any open covering of V, compatible sections glue
uniquely in each coordinate by the sheaf axiom on U_n. The resulting family
of coordinates is a section of the displayed product, proving the sheaf
condition. This is the disjoint-cover specialization of the O-module gluing
construction in Stacks Lemma 6.33.3, tag **00AM**, read 2026-09-26:

<https://stacks.math.columbia.edu/tag/00AM>

For V contained in U_n, every other intersection is empty. Its module of
sections has one element, so projection onto the n coordinate is an
isomorphism. These projections identify

    P_a(L)|_(U_n) ≅ (L|_(U_n))^(⊗ n).

In particular P_a(L) is locally free of rank one, hence is an invertible
sheaf. This is a product formula for the **sections of a glued sheaf**, not
an infinite tensor product of sheaves. It neither assumes finite image of a
nor requires an infinite direct sum of modules to be finite projective.

### 4.2 Isomorphism invariance and the exact uniqueness principle

An isomorphism L -> M induces an isomorphism on each integer tensor power and
therefore on P_a(L) -> P_a(M). For negative powers, the covariant map on duals
is the dual of the inverse isomorphism. Arbitrary noninvertible maps L -> M
are not assigned negative tensor powers by this prescription.

Restriction of line-bundle classes to a **disjoint** open cover is injective:
if two line bundles have the same class on each member, choose an isomorphism
there; all overlaps are empty, so these isomorphisms and their inverses glue
to a global isomorphism. This is exactly the uniqueness statement used below.
There is no claim that Pic is a sheaf of isomorphism classes on arbitrary
open covers. Locally isomorphic line bundles need not be globally isomorphic.

This also proves that P_a(L), with the displayed restriction identifications,
is determined up to the required isomorphism and is independent of the chosen
representative of the line-bundle class. At the implementation level use the
existing class quotient; do not introduce a second Picard quotient.

### 4.3 The action on Pic(X)

Let R_X be the ring of locally constant integer-valued functions on X, with
pointwise operations. On the additively written Picard group define

    a • [L] = [P_a(L)].

The following equalities of classes establish the module structure:

    0 • [L] = 0;             1 • [L] = [L];
    a • 0 = 0;
    (a+b) • [L] = a • [L] + b • [L];
    a • ([L]+[M]) = a • [L] + a • [M];
    (ab) • [L] = a • (b • [L]).

For the two-function identities restrict to the disjoint open partition where
a=m and b=n. The assertions become the integer power identities in Pic on
that open, including negative integers. For the tensor-product identity use
the partition where a=m. The injectivity statement of Section 4.2 then gives
the global equalities. Zero and unit are proved on the same partitions.
These are all module axioms; the construction therefore gives an R_X-module
structure on the existing additive Picard group. It is not just a function
with the right ranks at individual points.

### 4.4 Pullback, restriction and affine comparison

For a scheme morphism f : Y -> X, the inverse images f^(-1)(U_n) form the
fibre partition of a∘f. Pullback of a finite locally free line bundle commutes
with its dual and finite tensor powers. Therefore on each member there is the
ordinary power isomorphism

    f^* P_a(L) ≅ P_(a∘f)(f^* L).

These isomorphisms glue because the members are disjoint. This proves the
pullback comparison without the false additional claim that pullback must
commute with arbitrary infinite products. Restriction to an open subscheme is
its special case. The pullback map on Pic is semilinear for the ring map
R_X -> R_Y, a -> a∘f, not an R_X-linear map until the target scalar structure
has explicitly been restricted along that map.

For X=Spec A, quasi-compactness implies that a has finite image. Its fibre
partition is the finite idempotent decomposition of A used by the existing
`Z.3/pic-locally-constant-power`. On each factor both constructions are the
same ordinary integer power of the associated invertible module. The affine
module/sheaf equivalence and disjoint-cover uniqueness identify the two
classes. This is a comparison with the ring construction, not a replacement
of it. The finite-image argument belongs only to this affine comparison,
not to the definition on general X.

### 4.5 API and discriminating tests to integrate

Proposed object-level construction id:
`KTheoryLowDegrees:Z.5/line-bundle-locally-constant-power`.
Its API must expose restriction to a fibre, representative-isomorphism
invariance, powers 0/1/-1, addition and multiplication of exponents, tensor
compatibility, and pullback. Proposed class-level construction id:
`KTheoryLowDegrees:Z.5/pic-locally-constant-module`.
Its API consists of the six module identities above and the affine and
semilinear-pullback comparisons. These are proposed ids, **not reservations
or existing packet nodes**; check the current index before assigning them.
Nonroutine comparison proofs should be separate declaration nodes rather
than fields containing an assumed whole theorem.

Tests for the object-level construction:

1. Constant exponents 0, 1 and -1 give O_X, L and the dual of L, respectively.
2. On X=P^1_k disjoint-union P^1_k, take L=(O(1),O(2)) and a=(2,-1).
   The result is (O(2),O(-2)). A single global exponent gives the wrong answer.
3. On the disjoint union of P^1_k indexed by nonnegative integers n, let L be
   O(1) on each member and a=n there. The result is O(n) on the n-th member
   and is still rank one everywhere. A finite-image or boundedness condition
   would incorrectly reject this input.
4. On the empty scheme the construction is the unique line-bundle class.

Tests for the class-level construction:

1. On connected P^1_k with [L]=[O(1)], constants 2 and -3 satisfy
   (2+(-3))•[L]=[O(-1)], not [O(5)]. This checks integer signs.
2. On the two-component example, multiplication of exponent functions must
   be componentwise, and pulling back along either component inclusion must
   give that component's ordinary integer action.
3. On an affine scheme compare with the exact class returned by
   `Z.3/pic-locally-constant-power`, not only with its rank. The zero ring
   gives the empty affine case and must not require a nontriviality assumption.

These are mathematical specifications for tests. They have not been inserted
as Lean examples or counted among the existing 157 packet tests.

## 5. Rank–determinant target: reuse the existing square-zero extension

After Section 4 supplies the R_X-module structure, the desired target is the
trivial square-zero extension of R_X by the additive group Pic(X). The pinned
file `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` was read at
`082e2d37e8b0463410cdb532e111cd43d5a66174` (blob
`ba76f7b04ecf154170ced7e3cfa80b3162c7ba51`). It already defines
`TrivSqZeroExt` and the instance `TrivSqZeroExt.commRing`.

<https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/TrivSqZeroExt/Basic.lean>

Use the same action for the opposite ring; it is central since R_X is
commutative. The pinned instance explicitly requires the left action, the
opposite-ring action and `IsCentralScalar`. Its coordinate multiplication is

    (a,l)(b,m) = (ab, a•m + b•l).

In multiplicative Pic notation this is exactly

    (a,L)(b,M) = (ab, M^a ⊗ L^b),

with unit (1,O_X). Thus constructing a second bespoke commutative ring and
reproving associativity/distributivity is unnecessary. A comparison or alias
for the consumer's displayed pair is enough. The Pic summand is square-zero;
Pic multiplication is the additive operation in that summand, not the ring
multiplication of a product ring.

Given the other prerequisites already recorded for
`Z.5/rank-determinant-surjective`, Section 3 proves multiplicativity on pairs
of vector-bundle classes. The tensor pairing and the displayed target product
are biadditive, so the existing ExactK0 extensionality argument extends it to
virtual classes. This describes the repaired proof boundary; this continuation
has not independently audited all those other prerequisites.

Required target checks: (1,O_X) is the unit; (0,L)(0,M)=(0,O_X); and two
line-bundle classes (1,L),(1,M) multiply to (1,L⊗M). The incorrect product-ring
structure fails the middle check.

## 6. Pinned-carrier caution: the general Picard request remains real

At Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti/AlgebraicGeometry/LineBundle/Class.lean` (blob
`9f9f0933fd8d668dd9b74b160729a187d3e4d6d5`) was read. It defines
`TauCeti.AlgebraicGeometry.LineBundleClass` as the skeleton of invertible
sheaves. The following actual declarations suffice for the class-level
compatibility part:

- `TauCeti.AlgebraicGeometry.LineBundleClass.mk`;
- `TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`;
- `TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct`;
- `TauCeti.AlgebraicGeometry.LineBundleClass.mk_trivial`.

The file supplies a **commutative monoid**, not a general commutative group;
it explicitly leaves inverses to the dual construction. Do not interpret its
name or introductory reference to Pic as evidence that the general dual/group
interface is already implemented.

<https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Class.lean>

The earlier suggested file's carrier, units of this monoid, must be related to
all actual line bundles using the dual/evaluation input requested from
JacobianChallenge layer A. The mathematical existence of that dual is supported
by Stacks 01CR, but does not make a missing pinned Lean declaration appear.
Keep the supplier request; do not introduce another Picard group or count its
general construction as new Z.5 work. These were targeted checks, not a fresh
314-entry library audit or an exhaustive search proving absence everywhere.

## 7. Checks performed and not performed

Executed finite algebra regressions in Python/SymPy, with deterministic random
seed 20260926:

- 160 integer Kronecker determinant identities: m,n from 0 through 3, ten
  matrix pairs per size, entries from -3 through 3; zero-dimensional matrices
  use determinant 1.
- 225 exterior-filtration rank identities: subobject and quotient ranks 0
  through 4, exterior degree 0 through 8, with out-of-range binomial
  coefficients defined to be zero.
- The Z/4 example and the rank-three sign example from Section 3: both passed.

These 387 checks are sanity tests of finite algebra, not proofs of the sheaf
statements, not Lean tests and not a replacement for the blueprint validator.
Their small reproducible specifications are given here so the continuation can
translate the discriminating cases into the suggested file without trusting
a numerical experiment as a theorem.

Read the relevant current packet statements and gap/coverage records, the
previous handoff, the accepted RS-18 decision, the atlas extract, the reviewed
Z.5 audit verdict, Stacks 0FIC/00AK/00AM/01CR/01CU, and the pinned files named
above. No new claim is made about Weibel's errata, the 19 existing source
issues, Serre's classification proof, SGA 6 or the Schur-functor papers.

`check_blueprint.py`: **not run in this continuation**; packet JSON unchanged.
Lean: **not compiled in this continuation**; suggested file unchanged.
Added/changed packet nodes: **0**. Added packet API items/tests/planets: **0**.
New source-issue records and new supplier requests: **0**. No existing gap has
been administratively closed. Only the handoff is updated, and no production,
atlas, queue, roadmap or other job's files are changed.

The large packet is readable through the connected GitHub blob endpoint and
response-resource reader, but the available content-replacement writer was
not used to reconstruct a large JSON file from excerpts. This preserves all
prior work while recording the mathematical progress and its exact next edits.

## 8. Exact next integration and remaining work

1. Read this supplement together with the input packet; independently check
   Sections 2–6. Add the new 0FIC locator to the existing filtration nodes and
   the actual `Matrix.det_kronecker` declaration to baseline unless it is
   already present. Integrate the intrinsic filtration and basis-change
   proofs rather than relying on a bare exercise citation.
2. Plan the scheme locally constant-power construction on the existing sheaf
   carrier, its invariant class map and R_X-module action. Split the nonroutine
   affine and pullback comparisons into declaration-sized nodes. Supply API,
   at least three discriminating tests for each construction, uses, source
   locators and matching suggested signatures. Do not invent a finite-image
   hypothesis on an arbitrary scheme.
3. Use `TrivSqZeroExt` with both central scalar actions for the rank–determinant
   target. Keep `Z.3/pic-locally-constant-power` as the affine supplier and
   prove the comparison. Update all consumers named in Section 1.
4. Resolve the actual line-bundle dual/class-group interface through the
   existing JacobianChallenge layer A request; keep its distinction from the
   already available monoid and from the units carrier. The AlgebraicCurves
   layer-12 request remains restricted to its projective function-field
   dictionary, not a theorem about arbitrary arithmetic curves.
5. Only after those changes, revise the two gap entries, coverage notes,
   readme and suggested file together; run the packet/index validator and
   compile at the actual pins. The current checkpoint does not authorize
   changing either stage to closed.
6. The Serre gap remains: highest-weight classification over Q and F_p and
   Serre's decomposition homomorphism theorem for integral representation
   rings must be decomposed. The characteristic-zero supplier request is to
   RepresentationTheory/ClassicalGroups layers 3–4; positive-characteristic
   and integral-form inputs still lack a closed supplier. Nothing in the
   exterior filtration proof establishes special lambda identities by itself.
7. Preserve and adjudicate the existing structural proposal splitting Z.5 into
   vector-bundle foundations and regular curves. Its purpose is to avoid
   SchemeKTheoryOperations S.2/S.6/S.7 depending on undefined bundle K₀
   interfaces while simultaneously being prerequisites of the full Z.5.
8. The earlier source-issue E4 `known` field is still disputed in the prior
   handoff: do not turn its unconfirmed errata claim into a verified fact.
   Preserve the other 19 source-issue records and all previously recorded
   requests to GrothendieckEulerForms, AlgebraicCurves, JacobianChallenge and
   AlgebraicModuliForArithmeticGeometry, together with the consumer interfaces
   for ArithmeticKTheory, ClassicalArithmeticCompletion, SchemeKTheoryOperations
   and EllipticKTheory.

The detailed earlier source bibliography, decomposition counts, node-replacement
lists, compilation method and remaining historical observations are preserved
at the immutable previous-handoff link near the beginning of this file. This
checkpoint is ready for continuation, not a declaration that issue #765 is done.
