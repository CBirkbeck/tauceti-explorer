# Determinant, units and SK₁: the real-circle contraction bridge

The determinant on K₁ has a section given by one-dimensional units, but its
kernel need not vanish. A concrete witness is the real circle ring

\[
A=\mathbb R[x,y]/(x^2+y^2-1),\qquad
M=\begin{pmatrix}x&-y\\y&x\end{pmatrix}.
\]

The relation gives det(M)=1. The target is that the stable class of M is
nontrivial in SK₁(A), and therefore that the canonical determinant on K₁(A) is
not injective. The proof evaluates the matrix on the unit circle. A trivial
stable class would give a based contraction at some finite matrix size. A
continuous retraction into the special orthogonal group would turn it into the
based contraction ruled out by the Spin double cover.

This part specifies that application step. The determinant, SK₁, stable range,
division-ring determinant, circle ring and Spin obstruction retain their
declarations in [the U.1 packet](../packets/KTheoryLowDegrees--U.1.json) and
[its reader](KTheoryLowDegrees--U.1.md). The six declarations here use those
outputs. The Cartan and Iwasawa decompositions belong to
`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups`, layer 9. This part
consumes its continuous retraction with the precise carrier and coordinate
conditions below.

## Carriers and conventions

Write I=[0,1] and let Circle be the unit circle in ℂ, with basepoint 1. All
matrices act on column vectors. For N≥2 put

\[
Q_N(v)=\sum_{i=0}^{N-1}v_i^2,\qquad
B_N(z)=\operatorname{diag}\left(
\begin{pmatrix}\operatorname{Re}z&-\operatorname{Im}z\\
\operatorname{Im}z&\operatorname{Re}z\end{pmatrix},I_{N-2}\right).
\]

The parent declaration `KTheoryLowDegrees:U.3/circle-evaluation-rotation`
identifies B_N with entrywise evaluation of the stabilized M. Its rotation is
positive: B₂(exp(iπ/2)) has rows (0,−1),(1,0). Weibel prints the inverse
rotation in Example III.1.5.4, printed p.185 / PDF p.193. Inverting a group
element preserves whether it is trivial, so the convention change preserves
the target.

SL_N(ℝ) means the existing subgroup represented as matrices of determinant
one. It has the subspace topology from the real matrix coordinate space.
SO(Q_N) means the existing group of Q_N-preserving linear equivalences with
determinant one, using the positive signature form `realCliffordForm N 0`.
The identity of each group is denoted by 1.

Let j_N:SO(Q_N)→GL_N(ℝ) be its faithful coordinate representation, and let
coord(g) be the matrix underlying j_N(g). Its jth column is g(e_j). The SO
topology is the topology induced by j_N. The pinned library proves j_N is a
topological embedding; this is the topology used by the parent covering-map
obstruction. The compact signature form agrees with the usual sum of squares.
These are baseline declarations, rather than new definitions of this part.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The matrix topology, subtype
constructor, continuous composition, quadratic-form membership and coordinate
map were checked in their source files at those commits. The reviewed U.3
library audit, AUDIT-29 in `data/library-coverage.json`, supplies finite
determinants and field transvection results, but does not supply stable K₁ or
SK₁. Their missing algebraic theory is already assigned to the parent packet.

## The LieGroups supplier contract

For every N≥2 the input is a continuous map

\[
r_N:SL_N(\mathbb R)\longrightarrow SO(Q_N)
\]

with the following two equations:

1. r_N(1)=1.
2. For a∈SL_N(ℝ) and g∈SO(Q_N), if coord(g) is the matrix underlying a,
   then r_N(a)=g.

The continuity uses the SL coordinate topology and the pinned SO topology
induced by j_N. The second equation fixes every native SO matrix, including
the stabilized circle rotation. Expressing the fixing equation by equality of
coordinate matrices avoids assuming an unnamed inclusion or an unproved
homeomorphism between two SO presentations. The identity equation follows
from the fixing equation at the identity and is included explicitly for the
boundary API.

The supplier is
`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.
That layer specifies the KAN multiplication as a diffeomorphism, with K the
orthogonal factor, A the positive diagonal factor and N the upper
unitriangular factor in the real special-linear case. Its inverse followed by
the K projection gives the required continuous map. The input g∈K has
decomposition (g,1,1), so uniqueness fixes it.

The classical source for these exact claims is Dave Witte Morris,
*Introduction to Arithmetic Groups*, version 1.0 of April 2015, §7.1:
Theorem 7.1.1 gives the positive-diagonal KAN decomposition; Exercise 1
addresses uniqueness; Exercise 3 gives analytic dependence of the factors;
Exercise 4 checks the determinant and orientation. The locators are printed
pp.152–154 / PDF pp.168–170. Analytic dependence implies the continuity used
here. The source uses an inverse orthogonal matrix during its Gram–Schmidt
proof; r_N uses the K factor in the final equation a=kau, so it fixes an
orthogonal input rather than sending it to its inverse.

A matrix-SO version of this supplier must also provide a public continuous
comparison into SO(Q_N) whose coordinate matrix is unchanged. The pinned
`RealSpecialOrthogonal` file uses such a comparison internally to establish
compactness, but its comparison maps and continuity lemmas are private.
They are not a public baseline equivalence. The request therefore includes
the native carrier and its topology. An algebraic factorization alone does
not establish continuity, and a nonunique KAK factor does not specify the
continuous projection required by the contract.

## Transfer of a matrix homotopy

The construction node is
`KTheoryLowDegrees:U.3/so-homotopy-transfer`, with proposed name
`TauCeti.KTheory.soHomotopyTransfer`. Its inputs are a continuous
r:SL_N(ℝ)→SO(Q_N) and a jointly continuous matrix-valued map
H:I×Circle→M_N(ℝ) satisfying det H(p)=1 at every p. No retraction equation is
needed just to construct the map. Define

\[
T_r(H)(p)=r\bigl(\langle H(p),\det H(p)=1\rangle\bigr).
\]

The expression in brackets is an element of the existing SL subtype. The
baseline continuity theorem for a subtype constructor makes the map into SL
jointly continuous. Bundled continuous composition with r then gives
T_r(H):I×Circle→SO(Q_N). This argument does not require H to preserve Q_N
at intermediate times. That distinction matters: an elementary path is a
path in SL, and its intermediate matrices usually are not orthogonal.

The basic API contains the following five statements. Four are used by the
obstruction proof and are also separate lemma nodes. Their names, statements
and dependencies are identical in the packet and the suggested file.

| Proposed declaration | Statement and use |
| --- | --- |
| `soHomotopyTransfer_apply` | At p, evaluation is r applied to the determinant-one subtype element with matrix H(p). The three boundary lemmas use this formula. |
| `soHomotopyTransfer_zero` | If r(1)=1 and H(0,z)=1 for every z, then T_r(H)(0,z)=1. This supplies the constant initial circle map. |
| `soHomotopyTransfer_one` | If r fixes native SO coordinates and coord(g)=H(1,z), then T_r(H)(1,z)=g. This supplies the final rotation. |
| `soHomotopyTransfer_basepoint` | If r(1)=1 and H(t,1)=1 for every t, then T_r(H)(t,1)=1. This preserves the fixed basepoint line. |
| `soHomotopyTransfer_congr` | Pointwise equal matrix maps give equal transferred continuous maps, independently of the membership proofs. This is the extensionality interface for replacing the displayed formula for H. |

The promoted lemma ids append `-apply`, `-zero`, `-one`, and `-basepoint`
to the construction id. Evaluation is the existing composition evaluation
formula. For the zero and basepoint lemmas, equality of underlying matrices
identifies the bundled SL element with its identity; r(1)=1 then finishes the
calculation. For the one lemma, the SL element has matrix H(1,z), so the
supplier's fixing equation applies to g. The determinant witnesses do not
affect these equalities because SL is a subtype.

Three unit tests distinguish the intended construction and carriers:

1. `soHomotopyTransfer_identity_test`: transferring the constant identity
   matrix map gives the constant identity in SO whenever r(1)=1. This checks
   the degenerate case and rejects a fixed nonidentity output.
2. `soHomotopyTransfer_quarter_turn_test`: at N=2, transfer the constant
   matrix with rows (0,−1),(1,0). For a native g with this coordinate matrix,
   the output is the constant g. The parent Spin-coordinate formula at
   θ=π/4 supplies g. This rejects a constant-identity construction and a
   transfer that inverts the rotation.
3. `soHomotopyTransfer_diagonal_nonexample_test`: transfer the constant
   determinant-one matrix diag(2,1/2). For every p its output coordinate
   matrix differs from diag(2,1/2), for any continuous r into native SO.
   The latter matrix sends e₀ to 2e₀, changing Q₂ from 1 to 4. This rejects
   treating SL itself as the SO output carrier.

The tests concern the construction rather than a particular Iwasawa formula.
They impose only the fixing conditions their statements use. No formula for
the retraction on a nonorthogonal matrix is assumed.

## The based contraction obstruction

The final new theorem node is
`KTheoryLowDegrees:U.3/circle-no-sl-contraction-via-retraction`, with name
`TauCeti.KTheory.circle_no_sl_contraction_via_retraction`. For N≥2 and a
retraction satisfying the supplier contract, there is no jointly continuous
H:I×Circle→M_N(ℝ) satisfying all four equations

\[
\det H(t,z)=1,\quad H(0,z)=1,\quad
H(1,z)=B_N(z),\quad H(t,1)=1.
\]

Suppose H existed. The transferred map T_r(H) is jointly continuous in the
precise native SO carrier. The zero and basepoint lemmas establish two of the
equations needed by the parent SO obstruction. For each z, choose an angle
φ with z=Circle.exp φ using the baseline surjectivity of the circle
exponential. Apply the parent `circle-spin-coordinates` at θ=φ/2 to obtain
an element g∈SO(Q_N) with coordinate matrix B_N(z). The one lemma gives
T_r(H)(1,z)=g, hence the required coordinate equation at the final time.

Only a pointwise angle is chosen. No continuous real-valued angle on Circle
is asserted. Continuity of the transferred map comes from the continuous
matrix homotopy and r, independently of these endpoint witnesses. Applying
`KTheoryLowDegrees:U.3/circle-no-so-contraction` now contradicts the three
boundary equations. The basepoint equation is essential because that parent
lemma uses a homotopy relative to the two endpoints of the once-around path.

The suggested signature presents B_N as a matrix-valued function B and takes
two exact parent outputs as hypotheses: native SO witnesses for B(exp(2θ)),
and the absence of a based SO contraction ending at B. They are concrete
mathematical statements. Instantiating them with `circle-spin-coordinates`
and `circle-no-so-contraction` yields the theorem above. This representation
avoids redeclaring the parent's unimplemented circle ring, stabilization and
K₁ interfaces in a second file.

To complete the existing target
`KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`, assume the stable class of M
were one and apply the parent `circle-trivial-class-based-contraction`.
Its finite N is existential and may exceed two. The new no-SL-contraction
theorem applies at that N and yields a contradiction. The determinant-one
calculation already places the class in SK₁. This proves nontriviality of
the class and noninjectivity of the determinant once the supplier contract is
discharged. The independent parent `circle-ring-dedekind` supplies the ring
property used by U.4. No computation SK₁(A)≅ℤ/2, stable fundamental-group
calculation, or abstract nonisomorphism K₁(A)≄Aˣ is part of this target.

## Imported U.3 targets and consumers

The parent packet contains 44 U.3 nodes. The follow-up packet records every
one by id in its imported-target inventory. The principal targets and their
interfaces are:

| Target family | Parent node ids, following `KTheoryLowDegrees:U.3/` |
| --- | --- |
| Determinant and its kernel | `stable-determinant`, `special-K1`, `K1-units-split`; the parent supplies the units section, naturality, and stable SL comparison. |
| Fields and semilocal rings | `SK1-field`, `SK1-semilocal`; the parent supplies elementary reduction, stable-range-one arguments and the local specialization. |
| Division rings | `dieudonne-determinant`, `K1-division-ring`; the parent supplies multiplicativity, kernel, block formulas, stabilization and exceptional finite-rank commutator behavior. |
| Circle evaluation and finite contraction | `circle-evaluation`, `circle-evaluation-rotation`, `circle-trivial-class-based-contraction`. |
| Native SO obstruction | `circle-coordinate-frame`, `circle-spin-coordinates`, `circle-spin-lift`, `circle-no-so-contraction`. |
| Circle counterexample and ring property | `SK1-real-circle-nonzero`, `circle-ring-dedekind`; the parent supplies the eight-declaration Dedekind chain. |

The determinant theories require U.2's stable K₁. The recorded outgoing
stage edges are U.3→U.4 and U.3→KU-k1classical. U.4 uses the determinant and
the circle counterexample with its independent Dedekind property; the
classical K₁ comparison uses the determinant and elementary theory. Neither
consumer creates another retraction or another Spin double cover.

The parent has already selected six U.3 planets: determinant on K₁, SK₁,
the units splitting, semilocal vanishing, the Dieudonné determinant and K₁
of a division ring. The application lemmas add no planet. Their detailed
nodes remain available under the existing stage.

## Acceptance and supplier boundary

Every new declaration uses the native SO carrier and the existing SL subtype.
The transfer preserves joint continuity, the entire initial circle map, the
final matrix at every circle point and the entire basepoint line. The theorem
applies at every N≥2; a rank-two retraction alone is insufficient because a
finite elementary witness may require further stabilization. The parent
Spin obstruction handles these ranks without a new computation of π₁.

The stage is planned and this application pass is complete. Its one remaining
input is the exact continuous retraction from LieGroups layer 9, including a
public native coordinate/topology comparison if the supplier uses matrix SO.
The packet records that input as one request and one gap. The construction
and its boundary lemmas already have closed prerequisite chains conditional
on their explicitly stated continuous-map inputs; the final theorem records
the supplier stage. The mathematical Iwasawa source has been read, but a
source statement is not a supplied library declaration or an atlas node.

## Sources

- Charles A. Weibel, [*The K-book: An Introduction to Algebraic K-theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
  author-hosted combined draft of 29 August 2013, Proposition III.1.5 and
  Examples III.1.5.3–III.1.5.4, printed pp.184–185 / PDF pp.192–193.
- Dave Witte Morris, [*Introduction to Arithmetic Groups*](https://deductivepress.ca/IntroArithGrps-FINAL.pdf),
  version 1.0 of April 2015, §7.1, Theorem 7.1.1 and Exercises 1–4,
  printed pp.152–154 / PDF pp.168–170.
- The pinned Mathlib and Tau Ceti source declarations listed in the packet's
  baseline inventory. Their statements determine the subtype, coordinate and
  topology interfaces.

Both public mathematical sources were accessed on 9 October 2026; their
SHA-256 values and the precise sections read are recorded in the packet.
The formulas and proof expansions here are stated in this document's own
words, with their imported declarations and source locators.
