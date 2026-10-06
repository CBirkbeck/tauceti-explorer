# HR.4 — Complete étale deformations and relative Habiro coefficients

This part supplies the object-deformation and coherent-comparison inputs to the
accepted HR.4 plan. Its endpoint is Wagner’s Theorem 2.9: for a perfectly
covered Λ-ring A and an **étale** A-algebra R, each finite relative Habiro algebra
H_{R/A,m} is static, has derived reduction qW_m(R/A) modulo q^m−1, and is the
unique marked complete deformation of that étale quotient. Its transition
maps reduce to q-Witt Frobenii. The inverse limit is static by Habiro detection.
The stipulation that R is étale is essential, including for the theorem’s
statement.

The twelve HR.4 nodes of [the accepted parent packet](../packets/HabiroRings.json)
remain imports with their definitions, APIs, tests and corrected source
statements. This supplement adds seven supporting nodes, twenty-four API items,
seven definition/construction tests and two planets. It is a completed
**target-level** planning pass: HR.4 is `planned`, with two recorded gaps and
four exact supplier requests. It is not closed and contains no implemented
claims. The [suggested file](../suggested/HabiroRings--HR.4.lean) checks ordinary
interfaces; its two enhanced targets are named mathematical omissions until
their actual supplier carriers are available.

## Conventions and ownership

Rings are commutative and unital; the zero ring is admitted. An étale algebra
means Mathlib’s formally étale, finitely presented algebra. It need not be a
finite module. Tensor products in ordinary deformation statements are ordinary
algebra tensor products. In enhanced statements, completion and reduction are
derived, and “static” means homotopy concentrated in degree zero. For an element
f, C/^L f denotes the underlying-module cofibre of multiplication by f with its
induced algebra structure. It must not be replaced by π₀(C)/fπ₀(C).

A is a torsion-free Λ-ring with commuting Adams operations ψ^n, ψ^1=id,
ψ^(ab)=ψ^aψ^b and ψ^p(x)≡x^p modulo p. Perfect covering means that its map to
its colimit perfection A_∞ is faithfully flat. These are the imported HR.1
conventions. The Frobenius on R used here is the linearized relative map on
p-completions over ψ^p; a global endomorphism of R lifting Frobenius is not
assumed. For m≥1 set B=A[q], f_m=q^m−1 and T_d=R⊗_{A,ψ^d}A. The ghost with
target T_d[q]/Φ_d(q) is indexed gh_{m/d}. Thus F_{m/d} goes from level m to
level d, and gh_{m/c}=gh_{d/c}F_{m/d} for c|d|m.

Accepted RS-10, as checked in its accepted second-round review, keeps HR.1 and
HR.4 as interim suppliers until the QWittVectors roadmap is installed
atomically. The draft QW roadmap has stage statements, but no packet. On
installation, QW.0 owns big Witt vectors, QW.1 the Λ/cofree comparison, QW.2
absolute degree-zero q-Witt theory, QW.3 relative degree-zero theory and QW.4
étale/ghost pushouts. HR.4 retains the finite Habiro construction and its
comparisons, reductions, staticity, transitions and naturality. This document
imports existing interim nodes rather than creating parallel QW nodes. The
current HR.4→HQ.4 and HQ.4→HQ.3 coefficient directions are preserved; the
stale red-team proposal to reverse those arrows is not the accepted ownership
rule. Positive-degree q-de Rham–Witt theory belongs to HQ.4.

## Imported coefficient and descent interfaces

The parent supplies the following exact interfaces. Each row refers to a node
with prefix `HabiroRings:HR.4/`; none is a new declaration in this supplement.

| Imported node | Interface consumed here |
| --- | --- |
| `truncated-big-witt-vectors` | W_m(R) on the truncation set of positive divisors of m, its Witt polynomials, Frobenius, Verschiebung and ordinary restriction. |
| `q-witt-vectors` | The initial absolute q-FV system and its quotient presentation, with ghost maps and qualified injectivity. |
| `there-is-no-restriction-map` | The obstruction to an ordinary-restriction analogue respecting the q-FV structure. |
| `the-lambda-ring-comparison-maps` | The maps s_m and c_m associated to the Λ/Witt section, including their ghost and F/V compatibilities. |
| `relative-q-witt-rings` | Relative q-FV initiality, the U_m quotient, relative ghosts, pair functoriality and Λ-base change. |
| `q-witt-vectors-of-etale-maps` | Étaleness and the Frobenius pushout for relative q-Witt vectors. |
| `ghost-maps-and-etale-base-change` | Relative ghost pushouts, in both ordinary and derived senses. |
| `an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift` | The nontriviality test for qW_m(R) versus R[q]/(q^m−1). |
| `the-finite-relative-habiro-rings` | E_d, the relative-Frobenius overlap maps, H_{R/A,m}, transitions and pair functoriality. |
| `the-etale-lift` | The corrected Theorem 2.9, including unique complete deformation and staticity. |
| `the-transitions-are-frobenius` | The quotient transition is F_{m/d}, with identity/composition and naturality. |
| `the-limit-of-the-finite-stages-is-static` | Habiro completeness and staticity of the divisor-indexed inverse limit. |

For clarity, the absolute quotient is W_m(R)[q] modulo the ideal generated by
(q^d−1)V_{m/d}(x) and
[d/e]_{q^e}V_{m/d}(x)−V_{m/e}F_{d/e}(x), for e|d|m and the corresponding Witt
inputs. Here [n]_u=1+u+⋯+u^(n−1). The Λ comparison c_m is a ring map to
A[q]/(f_m), has reduction ψ^d∘gh_{m/d} at Φ_d, carries F_{m/d} to projection,
and carries V_{m/d} to multiplication by [m/d]_{q^d}. The relative construction
is the quotient of
qW_m(R)⊗_{qW_m(A),c_m}A[q]/(f_m)
by the relations
V_{m/d}(xy)⊗1−V_{m/d}(x)⊗c_d(y),
with x∈qW_d(R), y∈qW_d(A). A lift of c_d(y) to level m can be used because the
Verschiebung term is annihilated by q^d−1. Its relative ghosts target
T_d[q]/Φ_d(q). In particular qW_m(A/A)=A[q]/(f_m), and qW_m(R/ℤ)=qW_m(R).

For an étale map R→R′, Proposition 2.48 gives an étale map on qW_m and
qW_m(R′/A)⊗_{qW_m(R/A),F_{m/d}}qW_d(R/A)≅qW_d(R′/A).
Lemma 2.50 gives W_m(R′)⊗_{W_m(R)}qW_m(R/A)≅qW_m(R′/A). Corollary 2.51
identifies the pushout along each ghost. Taking R=A in the source of that
pushout identifies the derived Φ_d quotient of qW_m(R/A) with T_d[q]/Φ_d.
These are existing target nodes, not a replacement proof of the ordinary
big-Witt étale theorem. Its Frobenius pushout, which Remark 2.49 derives from
external Witt-vector results and filtered finite-type descent, remains an
explicit QW.0 supplier obligation.

The accepted HR.1 follow-up supplies big-Witt coalgebras, their laws, the
Adams-to-Witt section, Wilkerson comparison and cofree adjunction. This accounts
for the parent’s Λ/Wilkerson gap by import. HR.3 supplies the actual coherent
completion diagram, finite localization contract, reconstruction inverse and
prime-edge mapping spaces. HR.2 supplies Habiro completeness, homotopy-group
completeness and cyclotomic detection. Their generic supplier gaps remain
inherited.

## Marked étale deformations

The node `marked-etale-deformation` packages, for B, I⊂B and a B/I-algebra D,
an étale B-algebra E and a specified B/I-algebra equivalence
ε:(B/I)⊗_B E≅D. Its carrier and structures are actual algebra data. Étaleness of
D follows by base change; it need not be an extra field of the package. For
another marked deformation (E′,ε′), reduction of g:E→E′ is
ε′∘((B/I)⊗g)∘ε⁻¹. Markings are retained throughout. When D is fixed, a
mark-preserving isomorphism reduces to the identity of D.

This definition is consumed by the initial lift W in Theorem 2.9, by changes
of presentation, and by finite Taylor/coefficient comparisons in HR.5 and
HR.6. Its API is designed around those uses and ordinary algebra operations.
The following names are in the namespace `TauCeti.Habiro.EtaleDeformation`.

| Name | Mathematical contract |
| --- | --- |
| `ofAlgebra` | Package E, its existing étale structure and ε. |
| `carrier_etale` | Expose the actual étale predicate of E. |
| `reduction_etale` | Transport base-change étaleness to D. |
| `transportMarking` | Compose ε with an equivalence D≅D′, retaining E. |
| `reduceMap` | Scalar extend a carrier map and conjugate by the markings. |
| `reduceMap_id` | The reduced identity is the identity. |
| `reduceMap_comp` | Reduction respects composition. |
| `unit` | E=B with the tensor-unit marking of B/I. |
| `split` | E=B×B with its canonical reduction marking. |
| `localisation` | E=B[1/a] with target (B/I)⊗_B E≅(B/I)[1/ā]. |

The three unit tests are `test_unit`, which computes the unit carrier even for
the zero ring; `test_split_swap`, which lifts the transposition of the split
algebra and checks that its reduction is the transposition and is not identity
when B/I is nonzero; and `test_localisation`, which uses ℤ[1/2] at I=0 and
asserts that its carrier is not a finite ℤ-module. The last test rejects the
common mistaken replacement of “étale” by “finite étale”. These are
mathematical example specifications, not proofs produced by elaboration.

The theorem `etale-quotient-lift` asserts that such an object exists for every
étale B/I-algebra, with **no nilpotence condition on I**. A lift of a map out of
an already given formally étale source is not this existence theorem. The
proof uses the pinned theorem identifying étale algebras with standard smooth
algebras of relative dimension zero. Choose a finite presentation with equal
numbers of variables and equations and invertible Jacobian determinant. Lift
the equations to B and let Δ be their lifted determinant. Adjoin a variable y
and relation yΔ−1. The enlarged square Jacobian determinant is Δ², a unit in
the resulting algebra. Its dimension-zero submersive presentation gives an
étale E. Modulo I, adjoining the inverse of the already invertible determinant
changes nothing and gives the marking. This is the object-lifting argument in
Stacks Tag 04D1, using the existing Mathlib presentation API rather than
planning a second Jacobian criterion.

Acceptance cases include I=0, localization at any lifted a, and lifting
𝔽₂[x]/(x²+x+1) from ℤ/(2) to ℤ[x]/(x²+x+1)[1/3]. The latter inverts the
polynomial’s discriminant −3. Existence does not imply that object lifts before
completion are unique.

The theorem `nilpotent-deformation-rigidity` states that if I is nilpotent,
reduction on maps between two marked étale deformations is bijective. Apply
formal smoothness to lift a map through IE′; this ideal is nilpotent. Formal
unramifiedness gives uniqueness. Lift an isomorphism and its inverse, and use
uniqueness to identify their composites with identities. Together with object
lifting this gives the nilpotent specialization of Stacks Tag 0ALI’s
category equivalence. It suffices for B/(f^n) and every finite overlap
thickening. The marking excludes the split swap from the identity fibre.
Removing nilpotence invalidates object rigidity: B=ℤ[t] and B[1/(1−t)] are
nonisomorphic étale lifts of ℤ at I=(t).

## Completion and maps

The construction `completed-etale-deformation` uses the existing completion
carrier:

W_L=CompletedEtaleLift(I,L)=lim_n E/I^nE.

Its completion/quotient API assumes I finitely generated. This is ordinary
completion; it does not introduce another generic completion theory. The
pinned `AdicCompletion.isAdicComplete`, evaluation-surjectivity and
kernel-of-evaluation statements give completeness and W_L/IW_L≅E/IE.
Compose this with ε to obtain the completed marking. The analogous
identification at every power gives W_L/I^nW_L≅E/I^nE, an étale B/I^n-algebra.
No noetherianity or finite-module hypothesis is required by this ordinary API.

The following names are in `TauCeti.Habiro.CompletedEtaleLift`.

| Name | Mathematical contract |
| --- | --- |
| `instCommRing`, `instAlgebra` | Reuse the completion ring and induced B-algebra structures. |
| `of` | The canonical B-algebra map E→W_L. |
| `complete` | Completeness for the extended ideal IW_L. |
| `reductionEquiv` | The fixed equivalence (B/I)⊗_B W_L≅D. |
| `reduction_of` | The completion unit reduces to ε. |
| `homEquiv` | For complete C, Hom_B(W_L,C)≅Hom_{B/I}(D,(B/I)⊗_B C). |
| `map` | The unique completed lift of a reduced algebra map. |
| `map_reduction` | Reduction of that map is the specified reduced map. |
| `map_id`, `map_comp` | The completed maps satisfy the functor laws. |
| `equivOfMarking` | The unique comparison between completions of two lifts of D. |
| `equivOfMarking_reduction` | That comparison intertwines the markings. |
| `equivOfMarking_trans` | Three selected lifts satisfy the comparison transitivity law. |

The API item `homEquiv` is promoted to the lemma
`completed-deformation-map-equivalence`, because later nodes use its universal
property. A reduced map into C/IC first lifts to E→C by the existing
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`. The existing
`Algebra.FormallyUnramified.ext_of_iInf` supplies uniqueness using separatedness.
These baseline declarations already provide complete-target map lifting and
rigidity. The additional lemma extends the map over W_L: reduce at every I^n,
use W_L/I^nW_L≅E/I^nE, assemble the compatible maps into C’s completion, and
identify that completion with C. Every B-algebra map preserves I-powers,
so continuity is automatic. Quotient-level uniqueness and separatedness give
uniqueness on W_L. Identity, composition and inverse laws follow through the
reduced bijection. In particular the two nonisomorphic lifts B and
B[1/(1−t)] have uniquely isomorphic t-completions with their fixed markings.

Four tests distinguish this construction: `test_zero_ideal` gives W_L≅D;
`test_nilpotent` identifies E with its eventually constant completion when I
is nilpotent; `test_split_swap` asserts that the completed lift of the reduced
swap is not identity when B/I is nonzero; `test_localisation_series` computes
the t-completion of ℤ[t][1/2] as ℤ[1/2][[t]]. The series ∑_n t^n/2^n belongs
to this completion. It has no common denominator bound, and hence does not
belong to ℤ[[t]][1/2]. This tests the order of localization and completion,
not merely the existence of a ring instance.

## Principal derived universality

The theorem `complete-principal-deformation-universality` takes f a
nonzerodivisor in B and D étale over B/(f). For any object lift L, W_L at I=(f)
is a static, derived f-complete E∞-B-algebra, f is regular on it, and its derived
quotient is D. For every derived f-complete E∞-B-algebra C with a fixed
identification C/^L f≃D, the space of marked equivalences W_L≃C is
contractible. This includes all higher homotopies. Its complete-base version
is over B̂_(f). The theorem claims neither flatness nor étaleness of W_L over
that completed base.

The proof separates staticity from uniqueness. E is flat over B because it is
étale, so f is regular on E. DD.1 supplies the regular principal comparison
between derived completion and the ordinary E/f^nE tower. The tower has static
terms and surjective transitions, so the Milnor sequence has no lim¹. The
completion is static. The compatible quotient description shows f is still
regular on W_L, and its ordinary reduction is therefore also its derived
reduction.

For C, successive-power cofibre triangles express C/^L f^n as extensions of
copies of C/^L f. They are static, and their maps on degree zero are
surjective. Derived completeness expresses C as their homotopy limit; the
Milnor sequence again implies staticity. The quotient long exact sequence
makes f regular on π₀C. DD.1’s regular comparison then makes this actual ring
ordinarily complete. Apply the preceding hom-set equivalence to construct the
marked W_L→π₀C comparison. Its reduction is an equivalence, so derived
Nakayama makes the map an equivalence. The fully faithful embedding of static
commutative B-algebras supplied by the enhanced foundations identifies their
mapping spaces with discrete hom-sets. The marked fibre consequently has
exactly one point and is contractible. Complete-base actions follow by the
completion universal property.

The surjectivity in this proof is for a **single f-power tower**. It does not
assert surjectivity of divisor-indexed Habiro transitions or general
completion t-exactness. As a non-example, C=B/(f) with zero f-action has
ordinary quotient C/fC=C, but its derived quotient also has π₁=C. It fails
the hypothesis unless C=0. Acceptance includes the localization-series
example, separate identity/swap marking fibres, and coherent independence
from the selected lift.

## The ghost diagram and Theorem 2.9

The lemma `cyclotomic-ghost-lift-coherence` supplies the comparison step of the
parent theorem. D=qW_m(R/A) is étale over B/(f_m) by the imported q-Witt étale
node. Lift it as an object and complete to W. Its derived Φ_d quotient is
T_d[q]/Φ_d by the imported ghost pushout. Both f_m and Φ_d are monic. The
principal theorem applied after the appropriate completion comparisons gives
marked equivalences α_d:W^∧_{Φ_d}≃E_d, where
E_d=(T_d[q])^∧_{Φ_d}.

For each prime p with pd|m, the two relative ghosts commute after reducing
modulo p with the relative Frobenius on R/p, using the Adams Frobenius
congruence. Étaleness makes that relative Frobenius an isomorphism. The
imported cyclotomic arithmetic identifies the radicals of (p,Φ_d) and
(p,Φ_pd). HR.1 supplies the linearized p-complete Frobenius over ψ^p and,
after twisting by ψ^d, the overlap equivalence
(E_pd)^∧_p≃(E_d)^∧_p.

To lift the comparison square, work through powers of the overlap ideal.
The chosen global object lift is étale, so nilpotent map rigidity gives a
unique lift at each finite level. Complete-target existence and rigidity
assemble it. For these overlaps DD.1 supplies the regular two-generator
quotient-tower comparison and radical-independence coherence: p is regular
because A is torsion-free and the twisted coefficient algebras are flat; the
cyclotomic polynomial remains monic after reduction modulo p. The static
embedding makes the marked map fibre contractible. Thus the construction
supplies a specified edge path with its higher coherences, rather than just
a commuting square of ordinary homotopy groups.

Use HR.3’s coherent completion diagram and reconstruction to obtain
W→H_{R/A,m}. The α_d identify it at every cyclotomic vertex, and HR.3’s finite
localization contract makes it an equivalence. This proves the parent
Theorem 2.9 with its corrected hypotheses and reduction marking. For m=6
the four prime edges are 1→2, 1→3, 2→6 and 3→6. HR.3’s height-one incidence
index has no extra object-level cycle equation. Its mapping-space theorem
retains the four edge paths and all their homotopies. Dropping those paths
would not prove the naturality of the comparison. For R=A the comparison is
B̂_(f_m); for m=1 it gives R[[q−1]] without edge data.

Tracing the quotient comparison through a transition gives the relative
ghost relation gh_{m/c}=gh_{d/c}F_{m/d}. The parent transition theorem’s
qualified injectivity argument identifies its quotient with F_{m/d}: the
relative q-Witt algebra is étale, hence flat over A[q]/(f_d), and the
cyclotomic product map of the torsion-free base is injective. Composition and
identity hold locally at every E_c and hence globally. Pair naturality uses
the naturality of relative Frobenius and the marked comparison fibres.
None of this supplies restriction maps on q-Witt vectors.

The global H_{R/A}=lim_m H_{R/A,m} can be indexed by the cofinal factorial
sequence. Habiro completeness is closed under limits. For fixed d, the
cofinal tail with d|m has constant derived Φ_d reduction T_d[q]/Φ_d,
compatibly with transitions. Underlying-module reduction is a finite cofibre;
in a stable category it commutes with limits. Therefore the global Φ_d
reduction is static for every d. HR.2’s detection theorem, applied in every
nonzero homotopy degree, proves that the global limit is static. This
argument refines the imported parent proof without requiring a general
completion functor to preserve arbitrary limits or requiring the divisor
transitions to be surjective.

The imported naive-quotient obstruction remains an acceptance test for the
whole layer: for an étale ℤ-algebra R and p|m with R→R̂_p injective, an
isomorphism qW_m(R)≅R[q]/(f_m) forces the completed Frobenius to descend to R.
It is not automatic for an étale R to have such a global lift. The injection
hypothesis is retained, and the theorem is not generalized here.

## Supplier closure and source corrections

There are four open requests. QW.0 must supply the ordinary big-Witt étale
and Frobenius-pushout theorem for arbitrary étale maps, including removal of
F-finiteness by filtered finite-type descent. DD.1 must supply the generic
completion/detection package and its regular principal and regular
(p,Φ_d) tower refinements. EnhancedDerivedSheaves E1 must supply static
embedding, mapping discreteness and the enhanced fibre/Milnor interfaces;
E5:abstract must supply actual commutative algebra objects, mapping spaces,
complete-base actions and compatibility with the completed section category.
The packet proposes these refinements in their existing foundational owners.
The future QW.2–QW.4 contracts are recorded under ownership, while current
prerequisites use the exact existing parent nodes.

The two gaps record those unwritten supplier refinements, inherited HR.3
foundations and the big-Witt input, and the absence of the actual Lean
coefficient/enhanced carriers. The parent’s three HR.4 gaps are therefore
accounted for individually: accepted HR.1 supplies Λ/Wilkerson; this graph
plans completed étale deformation with explicit generic prerequisites; the
big-Witt étale theorem remains open. The two new planets are “Marked étale
deformations” and “Completed étale deformations”; with the parent’s four,
the combined layer has six.

Source reading uses [Wagner’s q-Habiro v2](https://arxiv.org/pdf/2510.04782v2),
§2.1–2.2, printed pp.13–17, and [q-Witt v5](https://arxiv.org/pdf/2410.23078v5),
§2.6, printed pp.33–35, including the proofs. The object-lifting and nilpotent
invariance proofs are read in [Stacks 04D1](https://stacks.math.columbia.edu/tag/04D1)
and [Stacks 0ALI](https://stacks.math.columbia.edu/tag/0ALI). The older coefficient
sections are imported through the reviewed extraction rather than claimed as
newly read in this pass. Source versions and hashes are in the packet and
handoff.

Parent source issues E2, E3 and E12 remain imports: Theorem 2.9 requires R
étale, its staticity argument uses q^m−1, and F_{m/d} in Proposition 2.48
has target qW_d. This pass records three additional local findings, awaiting
independent confirmation. E15 corrects the q-Witt name and the Frobenius
module’s level in the proof of Lemma 2.50. E16 corrects the ordinary-Witt
name and the lower p-power truncation level in Remark 2.49’s square. E17
restricts Corollary 2.51’s ghost cokernel sum to proper divisors: including
d=m introduces V_1=id and would make the cokernel zero, already wrong at
m=1, R=A=ℤ. The author copy dated 14 January 2026 retains these expressions;
the arXiv history and author page list no correction. No review verdict is
self-assigned.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Nineteen cited Mathlib declarations
were read at that pin. The compiler checks the genuine ordinary carriers,
API and seven example signatures with proof placeholders. It does not type
or prove the enhanced mathematical comments, close supplier gaps, or certify
the source corrections.
