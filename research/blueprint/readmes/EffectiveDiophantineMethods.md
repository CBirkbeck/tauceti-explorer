# Effective Diophantine methods

This roadmap turns arithmetic existence results and numerical estimates into finite arguments that determine rational or integral points. The first checkpoint develops the finite algebraic part of the Mordell–Weil sieve in ED.5. It specifies admissible quotient classes, proves that every globally compatible element survives, and gives a finite lifting procedure that computes the same set as direct enumeration. Its main optimization has an exact criterion: a local test can be omitted during refinement when the image subgroup at that place has not changed. The packet also isolates the subgroup-index condition that permits a finite-index Mordell–Weil subgroup to cover a selected sieve quotient.

The checkpoint is partial. It has twenty proposed declarations, two of which introduce constructions, with nine API items and nine unit tests. Every implementation status is unchecked. None of the seven stages is closed. In particular, a theorem about an arbitrary group and a family of homomorphisms does not construct a Jacobian, an Abel–Jacobi embedding, reduction on its points, or an algorithm for enumerating those points. Those geometric and computational tasks are recorded below as concrete remaining work. The supplied signatures use native library objects and state only mathematics that can already be expressed with them.

## Purpose and ownership

The endpoint is a certificate that the supplied list contains every point under the stated hypotheses. A computation that finds some points, a heuristic expected number of survivors, or an analytic upper bound whose constants have not been evaluated with proved errors does not meet this endpoint. A successful sieve can prove non-existence or eliminate unlisted points, but each conclusion requires a chain of compatibility and coverage results connecting the finite computation to the arithmetic objects.

The accepted RS-03 restructuring fixes the division of work. CN.0 owns general exact arithmetic carriers. ED.0 owns the adapters for Diophantine isolating discs, valuations and the required precision conventions. GN.5 supplies general certified LLL; ED.1 turns lattice information into bounded exclusion and complete searches. DT.3 owns logarithmic-form lower bounds and DT.4 the relevant equation bounds. CN.4 supplies certified evaluation of analytic quantities. ED.2 combines these inputs with the lattice results and certifies exhaustive residual enumeration. No second logarithm-bound theorem or general LLL implementation is planned here.

RP.1 supplies the Mordell–Weil and descent inputs for ED.3. In the elliptic case the protected Tau Ceti EllipticCurves Layers 6 and 7 remain the suppliers of the existing Mordell–Weil and Selmer theory. ED.3 must certify its new local-image, index and saturation procedures. The protected elliptic Layer 4 supplies reduction on elliptic-curve points; the genus-one case is not reconstructed under ED.5. ColemanIntegration L0/L1 supplies local primitives and Coleman integration, while NC.4 supplies the depth-one comparison used in ED.4. NC.5 owns quadratic Chabauty theory. ED.6 owns the explicit algorithms and examples using that theory, and CN.5 owns the general certificate schemas and reproducibility infrastructure.

The reviewed library audit says that the arithmetic algorithms required here are not built at the pinned baseline. This does not mean their algebraic infrastructure is absent. Finite abelian groups, quotient groups, finite sets, group homomorphisms and basic finite-index facts are available. This checkpoint imports them directly. The audit and its red-team review also distinguish a group law on elliptic points over a finite field from a certified decomposition of that finite group into cyclic factors. The former does not supply the latter algorithm.

Strassmann's theorem requires a specific ownership resolution. The verifier of RT-AUDIT-09/7 confirmed an overlap with the draft MordellLawrenceVenkatesh roadmap, but directed that draft to import a single owner rather than duplicate the result. It did not establish the unpromoted draft as the supplier for ED.4. This checkpoint does not develop Strassmann and does not turn that draft into a prerequisite. The continuation must inspect the current ownership resolution and use the chosen declaration once.

## Arithmetic meaning of the finite sieve

For a smooth projective curve C over ℚ, the usual geometric setting starts with its Jacobian J and a rational divisor class of degree one defining an embedding into J. A rational point on C then determines an element of J(ℚ). At selected good primes, reduction gives local points and a homomorphism from the Mordell–Weil group into the corresponding finite Jacobian group. Each local curve image gives a finite set of allowed values. The reduction homomorphism and the curve map must form an actual commuting square, and the local set must contain every reduction of a rational point.

There are two logically separate finite approximations. First, a local target may be replaced by the image of the known global homomorphism, intersecting the allowed local set with that image. This matters for estimates and for initialization: a nonempty local set outside the attainable image gives no possible global value. Second, a subgroup L of finite index in the global group produces the finite quotient Γ/L. A map φᵢ:Γ→Gᵢ then descends into Gᵢ/φᵢ(L). The local quotient is forced by the image of L; it cannot be chosen independently without another compatibility proof.

The set A_S(L) contains precisely the classes in Γ/L whose images lie in the allowed local images at all selected indices. A single global element satisfying every local condition determines a member of this finite set. Consequently an empty set is an obstruction. The reverse implication fails: a quotient class can pass every test because each local condition has a different representative inside that class. The sieve therefore gives necessary conditions for global compatibility. It does not turn a nonempty residue set into a global point.

The simplest counterexample already occurs in Γ=ℤ/2. Use two identity maps to ℤ/2, with allowed sets {0} and {1}, and take L=Γ. Every target quotient is trivial, so the unique coarse class survives. There is no element of Γ that is simultaneously zero and one. This example is a permanent test of the distinction between a surviving quotient class and a solution.

For sound non-existence, exact local images can be replaced by proved supersets. Larger allowed sets produce a larger candidate set. If even that enlarged set is empty, the true local data cannot support a global point. An unproved subset is dangerous in the other direction: it can discard the reduction of a genuine rational point. This asymmetry is made explicit in the local-overapproximations lemma.

## Conventions and native objects

Groups are written additively and may contain torsion. Γ need not be torsion-free, and the abstract finite-step theorems do not require a chosen decomposition into free and torsion factors. For each selected index i, φᵢ is an additive homomorphism and Xᵢ is a finite set in its target Gᵢ. The source application has finite Gᵢ and surjective φᵢ after restricting to the attainable image. The algebraic results below need neither assumption: finiteness of the relevant global quotient and finiteness of Xᵢ suffice. This slightly wider formulation is justified by the explicit proofs, not attributed to an unstated theorem of the source.

The notation q_L denotes the native quotient homomorphism Γ→Γ/L. The notation G_{L,i} means Gᵢ/φᵢ(L), q_{L,i} its quotient map, and φ_{L,i} the induced homomorphism Γ/L→G_{L,i}. These are names for existing library constructions, not new carriers. The containment L⊆φᵢ⁻¹(φᵢ(L)) is the existing image/preimage fact needed to construct the induced map. Normality is automatic for these subgroups of abelian groups.

A finite enumeration of Γ/L is part of the input to a finite step. Native finite-generation results prove that Γ/NΓ is finite for N≠0, but do not themselves compute representatives, cyclic coordinates or a membership algorithm for a subgroup presented by generators. The mathematical signatures use classical decidability to state finite filters and finite images. The implementation must replace those decisions with certified finite presentations and verified arithmetic. Merely making the signatures elaborate does not establish an executable sieve.

Local sets are not required to contain zero, to be closed under addition or to be stable under negation. In particular {1,3} in ℤ/4 is a valid allowed set. Its role is to describe a curve image, which is usually not a subgroup. Replacing it by its generated subgroup would change the sieve. Finite images remove duplicates, and all cardinalities refer to sets of distinct classes.

## Refinement and the lifting algorithm

Take K≤L. The canonical projection π:Γ/K→Γ/L maps every fine survivor to a coarse survivor. To compute the fine candidates, start with the already certified coarse set B=A_S(L). For each a∈B, supply a representative σ(a) in Γ/K and verify π(σ(a))=a. The fibre over a is then the translate σ(a)+ker π. Enumerate that kernel, translate it, and apply the fine local tests. The union over B is the desired fine set.

This description gives both directions of correctness. Any element produced by the loop has a checked coarse image and passes its fine tests. Conversely, for a fine class b whose projection belongs to B, the element b−σ(π(b)) lies in the kernel. The inner loop therefore visits b. This second direction is essential: verifying that every output is admissible is insufficient when the purpose is to prove that no unlisted points remain.

Representative choices need not be canonical. Two choices that satisfy the section equations on B produce identical sets. Their values outside B are irrelevant. A wrong representative, however, can move the computation to a different fibre; the unit tests include an explicit example on ℤ/4. The section equation is a mathematical precondition of correctness, not a convention that an implementation may silently assume.

For a selected index i, suppose φᵢ(K)=φᵢ(L). The fine and coarse tests are then equivalent. After checking coarse admissibility, the new step can omit that index entirely. If T⊆S contains every index whose image subgroup changes, it is enough to test the indices in T. No assertion of probabilistic independence enters this argument. A small expected contribution or an unchanged numerical cardinality is not the same as equality of the image subgroups and does not justify omission.

The deterministic size bound for a step is |B| times the size of ker π. It remains valid with torsion and even for proposed representatives that fail their section equations, though those representatives do not give a correct sieve. The bound does not assert that the output has this size, and it does not replace the source's heuristic survivor estimates with a theorem. A sequence of finite, specified steps terminates. Choosing primes or increasing a modulus until a contradiction appears is a different procedure, whose eventual success is not proved here.

## Preparing valid subgroup steps

Suppose D is the desired endpoint subgroup and D≤L is the current subgroup. The test at φ can refine L to L∩φ⁻¹(φ(D)). This preserves D and strictly decreases L if φ(L) is not contained in φ(D). In the source's setting D=NΓ and φ is surjective, so φ(D)=NG. The relevant kernel is therefore the kernel of the composite Γ→G→G/NG.

The distinction matters in the printed PrepareLift algorithm. Taking the kernel of the original map Γ→G can give a subgroup that fails to contain D. With reduction ℤ→ℤ/4, current L=ℤ and target D=2ℤ, that original kernel is 4ℤ. One cannot then use a descending-chain lifting formula to move from 4ℤ back to 2ℤ. The corrected quotient-target kernel is 2ℤ. The authors' implementation already makes this target quotient before taking its kernels. Source issue E1 records the literal printed discrepancy against the version of record and identifies the existing implementation correction.

The two prepared-step lemmas are deliberately stated for arbitrary D. They isolate the containment and progress facts an implementation must check, without requiring a particular greedy strategy. A chain of strict refinements containing D cannot continue indefinitely when Γ/D is finite. A complete source decomposition must still specify the finite presentation algorithms, the strategy for choosing the next subgroup, and the endpoint handoff. Those tasks are not supplied by a name for an intersection.

## What a finite-index subgroup permits

Let H be a known subgroup of Γ. If its index d is coprime to the sieve modulus N, and NΓ⊆L, then every class of Γ/L has a representative in H. Bézout gives integers u,v with du+Nv=1. For g∈Γ, the element h=u(dg) lies in H because dg lies in H. Its difference from g is a multiple of Ng, so the two elements have the same class modulo L.

This argument explains the precise role of a saturation or index certificate. It does not say that H is the full Mordell–Weil group. It also does not identify all local values of Γ with the values of H before taking the appropriate quotient. In particular, a height search among elements of H can miss elements of Γ unless additional coverage has been proved. The source distinguishes the use of a subgroup for a sieve obstruction from the stronger information needed for complete height enumeration.

The pair H=2ℤ, L=3ℤ covers every residue modulo three. The pair H=2ℤ, L=2ℤ misses the odd residue, and its index is not coprime to the modulus. These small cases detect an unsafe inference from finite index alone. The theorem uses the native natural index; it also handles the trivial quotient when N=1, including the convention that an infinite index is represented by zero.

## Declared results, API and tests

Every entry below is a planned declaration. Its proof outline names the non-routine facts used, and the packet contains the corresponding dependency edges. Definition and construction APIs are derived from the lifting algorithm, the finite obstruction, and the combination with a uniqueness result. The supplied tests target plausible wrong choices of local sets, quotients and representatives.

### Admissible quotient classes

Identifier: EffectiveDiophantineMethods:ED.5/admissible-classes. Proposed name: TauCeti.MordellWeilSieve.admissibleClasses.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Define A_S(L)={a∈Γ/L : φ_{L,i}(a)∈q_{L,i}(Xᵢ) for every i∈S}. This is the filter of the finite enumeration of Γ/L by these conditions. Xᵢ is a set of allowed local values, not a subgroup. The construction quotients the local group by the image φᵢ(L), not by L itself.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Use native subgroup image to form φᵢ(L); Subgroup.le_comap_map gives the containment needed for the native induced quotient map, through its additive companion.
2. Form each allowed image with Finset.image. Filter Finset.univ by the finite conjunction of local membership tests. Classical decidability in the suggested signatures specifies the mathematics; certified finite presentations must supply executable comparisons in an implementation.
3. No new finite-group carrier, quotient-group construction or general certificate schema is introduced.

API:

- **TauCeti.MordellWeilSieve.admissibleClasses_eq_filter** (characterisation): The construction equals the finite filter of Γ/L by all specified local quotient tests.
- **TauCeti.MordellWeilSieve.mem_admissibleClasses** (characterisation): a belongs precisely when every φ_{L,i}(a) belongs to q_{L,i}(Xᵢ); promoted to membership.
- **TauCeti.MordellWeilSieve.mk_mem_admissibleClasses** (compatibility): q_L(g) belongs precisely when for every selected i there is x∈Xᵢ with φᵢ(g)−x∈φᵢ(L); promoted to representative-congruences.
- **TauCeti.MordellWeilSieve.admissibleClasses_empty** (simp): A_∅(L) is the entire finite quotient.
- **TauCeti.MordellWeilSieve.admissibleClasses_congr** (extensionality): Replacing Xᵢ by an equal set at every selected index leaves A_S(L) unchanged; unselected indices do not matter.

Unit tests:

- **admissibleClasses_empty_index** (degenerate): For arbitrary L, maps and local sets, A_∅(L)=Γ/L.
- **admissibleClasses_empty_local** (degenerate): For the singleton index set and any φ:Γ→ℤ/4, X=∅ implies A(L)=∅.
- **admissibleClasses_mod_four** (computation): For Γ=G=ℤ/4, φ=id, L=0 and X={1,3}, A(L)={q₀(1),q₀(3)}.
- **admissibleClasses_non_surjective** (non-example): For Γ=ℤ/2, G=ℤ/4, φ=0, L=Γ and X={1}, A(L)=∅ although X is nonempty.
- **admissibleClasses_top_nonempty** (computation): For Γ=G=ℤ/4, φ=id, L=Γ and X={1}, A(L)={0}.

Acceptance:

- Empty S retains every quotient class.
- An empty Xᵢ at a selected index rejects all classes.
- The torsion group ℤ/4 and the allowed set {1,3} retain both odd classes.

Dependencies: mathlib:Subgroup.map, mathlib:Subgroup.le_comap_map, mathlib:QuotientGroup.map, mathlib:QuotientGroup.mk', mathlib:Finset.image, mathlib:Finset.filter, mathlib:Finset.univ.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Membership in the finite sieve

Identifier: EffectiveDiophantineMethods:ED.5/membership. Proposed name: TauCeti.MordellWeilSieve.mem_admissibleClasses.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). For a∈Γ/L, a∈A_S(L) if and only if every selected local quotient test holds.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Use the defining finite filter and Finset.mem_filter. Finset.mem_univ discharges the ambient enumeration condition.
2. Keep the membership tests in Gᵢ/φᵢ(L), including possible torsion. No density estimate or independence assumption is used.

Acceptance:

- With one selected index, membership is exactly that single local test.

Dependencies: EffectiveDiophantineMethods:ED.5/admissible-classes, mathlib:Finset.mem_filter, mathlib:Finset.mem_univ.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Congruences for a representative

Identifier: EffectiveDiophantineMethods:ED.5/representative-congruences. Proposed name: TauCeti.MordellWeilSieve.mk_mem_admissibleClasses.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). For g∈Γ, q_L(g)∈A_S(L) if and only if for every i∈S there exists x∈Xᵢ such that φᵢ(g)−x∈φᵢ(L). The witnesses x may differ between indices.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Apply membership and the additive companion of QuotientGroup.map_mk' to evaluate each induced map.
2. Use Finset.mem_image to choose x. QuotientGroup.eq_iff_div_mem, in its additive form, converts equality of quotient classes into subgroup membership of the difference.
3. The source finite image lemma returns the equality in the reverse direction; reverse it before applying the difference criterion, or use closure of the subgroup under negation.

Acceptance:

- Replacing g by g+ℓ for ℓ∈L does not change admissibility.
- For L=0, the congruence becomes equality with a value in Xᵢ.

Dependencies: EffectiveDiophantineMethods:ED.5/membership, mathlib:QuotientGroup.map_mk', mathlib:QuotientGroup.eq_iff_div_mem, mathlib:Finset.mem_image.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Adding local constraints

Identifier: EffectiveDiophantineMethods:ED.5/constraint-monotonicity. Proposed name: TauCeti.MordellWeilSieve.admissibleClasses_antitone.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If S⊆T then A_T(L)⊆A_S(L). The maps, subgroup and allowed sets are fixed.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Expand membership on both sides and restrict the conjunction indexed by T to its subset S.

Acceptance:

- Adding a vacuous local test leaves the set unchanged; adding an incompatible test can make it empty.

Dependencies: EffectiveDiophantineMethods:ED.5/membership.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Sound local overapproximations

Identifier: EffectiveDiophantineMethods:ED.5/local-overapproximations. Proposed name: TauCeti.MordellWeilSieve.admissibleClasses_mono.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If Xᵢ⊆Yᵢ for each i∈S, then A_S(L;X)⊆A_S(L;Y). Consequently emptiness computed using supersets of the true local images remains a sound obstruction.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Use membership to inspect a surviving class. Each witness in the finite image of Xᵢ is also a witness in the image of Yᵢ.
2. Do not use the converse: making a local set smaller without a coverage proof can discard genuine solutions.

Acceptance:

- Replacing {1} by {1,3} for the identity map on ℤ/4 can add a survivor; it cannot remove one.

Dependencies: EffectiveDiophantineMethods:ED.5/membership, mathlib:Finset.mem_image.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Global elements survive

Identifier: EffectiveDiophantineMethods:ED.5/global-soundness. Proposed name: TauCeti.MordellWeilSieve.mk_mem_of_local_mem.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If g∈Γ satisfies φᵢ(g)∈Xᵢ for every i∈S, then q_L(g)∈A_S(L).

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Apply representative-congruences. At index i choose x=φᵢ(g), which lies in Xᵢ by hypothesis; the difference is zero, in every subgroup.

Acceptance:

- For an empty index set every g survives.
- A known globally compatible element prevents the candidate set from being empty.

Dependencies: EffectiveDiophantineMethods:ED.5/representative-congruences.

Source: Bruin–Stoll, Definition 3.1, published p.277. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### An empty sieve obstructs global compatibility

Identifier: EffectiveDiophantineMethods:ED.5/empty-sieve-obstruction. Proposed name: TauCeti.MordellWeilSieve.no_global_element_of_empty.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If A_S(L)=∅, no g∈Γ has φᵢ(g)∈Xᵢ at every selected index. Nonemptiness of A_S(L) does not assert the existence of such a g.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Assume a globally compatible g exists. Global-soundness puts q_L(g) in A_S(L), contradicting its emptiness.

Acceptance:

- The singleton local empty set is an immediate obstruction.
- For Γ=G=ℤ/2, φ=id, L=Γ and two selected indices with X₀={0}, X₁={1}, A_S(L)={0} but no globally compatible element exists.

Dependencies: EffectiveDiophantineMethods:ED.5/global-soundness.

Source: Bruin–Stoll, §3.3, published p.280, stopping criterion. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Initialization at the whole subgroup

Identifier: EffectiveDiophantineMethods:ED.5/top-initialization. Proposed name: TauCeti.MordellWeilSieve.admissibleClasses_top.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). At L=Γ, suppose for each i∈S there is x∈Xᵢ∩im(φᵢ). Then A_S(Γ)={0}. For the source’s surjective maps this is precisely the requirement that every selected Xᵢ be nonempty.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Γ/Γ is a singleton by the native quotient criterion. To show its zero class survives, use representative-congruences with g=0.
2. The chosen x lies in im(φᵢ)=φᵢ(Γ), so −x belongs to the same subgroup. Every selected local test holds.
3. An initial implementation must check empty or unattainable local data; the formula {0} is not valid for arbitrary non-surjective maps and nonempty Xᵢ.

Acceptance:

- For the zero map ℤ/2→ℤ/4 and X={1}, the hypothesis fails and the initial candidate set is empty.
- With S empty the condition is vacuous and the unique class survives.

Dependencies: EffectiveDiophantineMethods:ED.5/representative-congruences, mathlib:QuotientGroup.subsingleton_iff, mathlib:Subgroup.mem_map.

Source: Bruin–Stoll, §3.3, published p.278, initialization; §3.2, p.277, surjectivity convention. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Projection of surviving classes

Identifier: EffectiveDiophantineMethods:ED.5/quotient-refinement. Proposed name: TauCeti.MordellWeilSieve.refinement_mem.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let K≤L and let π:Γ/K→Γ/L be the native map induced by the identity. If b∈A_S(K), then π(b)∈A_S(L). Both quotients have finite enumerations.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Choose g with q_K(g)=b using the native surjectivity of q_K.
2. Representative-congruences supplies, at each index, x∈Xᵢ with φᵢ(g)−x∈φᵢ(K). Subgroup.map_mono sends this membership into φᵢ(L).
3. Reassemble representative-congruences at L and evaluate π(q_K(g))=q_L(g).

Acceptance:

- If the coarse sieve is empty then every finer sieve is empty.
- The projection of the fine sieve can be a proper subset of the coarse sieve.

Dependencies: EffectiveDiophantineMethods:ED.5/representative-congruences, mathlib:QuotientGroup.mk'_surjective, mathlib:QuotientGroup.map_mk', mathlib:Subgroup.map_mono.

Source: Bruin–Stoll, §3.3, published pp.278–279, nested subgroups. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Finite coset lifting and filtering

Identifier: EffectiveDiophantineMethods:ED.5/coset-lift. Proposed name: TauCeti.MordellWeilSieve.refineClasses.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let K≤L, π:Γ/K→Γ/L be the canonical projection, B⊆Γ/L finite, and σ:Γ/L→Γ/K any choice of proposed lifts. Define refineClasses(S,K,L,σ,B) as the union, over a∈B, of {σ(a)+z : z∈ker π}, followed by the local filter defining A_S(K). The kernel is enumerated inside the finite quotient Γ/K. Correctness requires π(σ(a))=a for a∈B; the function is defined even if that check fails.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Build π with the existing induced quotient map. Enumerate its kernel by filtering the finite fine quotient for π(z)=0.
2. For each a∈B, translate the kernel enumeration by σ(a), using Finset.image; take Finset.biUnion over B.
3. Filter the resulting set by membership in A_S(K). All loops are finite for the supplied enumerations. The specification imposes no claim about the cost of computing them.

API:

- **TauCeti.MordellWeilSieve.refineClasses_eq_biUnion** (characterisation): The result is the finite union of translated kernel enumerations, filtered by the fine local conditions.
- **TauCeti.MordellWeilSieve.mem_refineClasses** (characterisation): If σ lifts every a∈B correctly, b belongs exactly when π(b)∈B and b∈A_S(K); promoted to lift-membership.
- **TauCeti.MordellWeilSieve.refineClasses_empty** (simp): An empty coarse input produces the empty fine result, without a section assumption.
- **TauCeti.MordellWeilSieve.refineClasses_section_independent** (extensionality): Two sections correct on B produce the same result; their values outside B do not matter.

Unit tests:

- **refineClasses_empty_input** (degenerate): For all data, refineClasses applied to B=∅ is ∅.
- **refineClasses_identity** (compatibility): For K=L and σ=id, refineClasses(S,L,L,id,B)=B∩A_S(L).
- **refineClasses_all_lifts** (characterisation): With no local tests and a section correct on B, the result is the whole inverse image π⁻¹(B), enumerated in Γ/K.
- **refineClasses_wrong_section** (non-example): Take Γ=ℤ/4, K=L=0, B={q₀(0)}, no tests, and constant σ=q₀(1). The result is {q₀(1)}, not B. This σ fails the section condition.

Acceptance:

- With B empty the result is empty.
- When K=L and σ=id, the result is B∩A_S(L).
- A wrong section can move a candidate to the wrong fibre, so its verification is essential.

Dependencies: EffectiveDiophantineMethods:ED.5/admissible-classes, mathlib:QuotientGroup.map, mathlib:Finset.univ, mathlib:Finset.filter, mathlib:Finset.image, mathlib:Finset.biUnion.

Source: Bruin–Stoll, §3.3, published p.279, Lift; author implementation LiftInformation, lines 2563–2600. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Exact membership after lifting

Identifier: EffectiveDiophantineMethods:ED.5/lift-membership. Proposed name: TauCeti.MordellWeilSieve.mem_refineClasses.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). In the coset-lift setup, assume π(σ(a))=a for every a∈B. Then b belongs to refineClasses(S,K,L,σ,B) if and only if π(b)∈B and b∈A_S(K).

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Expand finite union, image and filter membership. A witness b=σ(a)+z with π(z)=0 has π(b)=a by the checked section equation and additivity.
2. Conversely take a=π(b), which belongs to B by hypothesis. Set z=b−σ(a). Additivity and the section equation give π(z)=0, while σ(a)+z=b by commutativity.
3. Carry the fine local test through both directions. This proves completeness of the kernel enumeration as well as soundness of every retained element.

Acceptance:

- The section equation is needed only on B.
- Every fine lift is recovered even when Γ has torsion.

Dependencies: EffectiveDiophantineMethods:ED.5/coset-lift, mathlib:Finset.mem_biUnion, mathlib:Finset.mem_image, mathlib:Finset.mem_filter.

Source: Bruin–Stoll, §3.3, published p.279, the two inner loops of Lift. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Correctness of a full lifting step

Identifier: EffectiveDiophantineMethods:ED.5/lift-correctness. Proposed name: TauCeti.MordellWeilSieve.refineClasses_correct.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). For K≤L and a section σ correct on A_S(L), refineClasses(S,K,L,σ,A_S(L))=A_S(K). Both quotients are finite.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Use lift-membership with B=A_S(L). Membership is fine admissibility together with coarse admissibility of the projection.
2. Quotient-refinement supplies the coarse condition for every fine survivor. The converse follows directly from the fine filter.

Acceptance:

- Any finite descending chain with checked inclusions and checked sections computes the same endpoint set as the direct finite filter.
- Empty coarse input stays empty at every step.

Dependencies: EffectiveDiophantineMethods:ED.5/lift-membership, EffectiveDiophantineMethods:ED.5/quotient-refinement.

Source: Bruin–Stoll, §3.3, published p.279, Lift. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### A local condition unchanged by refinement

Identifier: EffectiveDiophantineMethods:ED.5/unchanged-local-image. Proposed name: TauCeti.MordellWeilSieve.unchanged_local_condition.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let K≤L, fix i and suppose φᵢ(K)=φᵢ(L). For every b∈Γ/K, the i-th fine local test at b is equivalent to the i-th coarse test at π(b). No surjectivity of φᵢ is needed.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Choose a representative g of b. Evaluate both quotient maps on g.
2. Use the finite-image criterion and additive quotient equality to express both tests as existence of x∈Xᵢ with φᵢ(g)−x in the corresponding image subgroup.
3. Rewrite using φᵢ(K)=φᵢ(L). This equality, rather than a heuristic estimate that the test is weak, justifies omitting it.

Acceptance:

- K=L gives identical tests.
- For Γ=G=ℤ/4, φ=id, K=0, L=2Γ and X={0}, the images differ: the fine class 2 fails while its coarse projection passes.

Dependencies: mathlib:QuotientGroup.mk'_surjective, mathlib:QuotientGroup.map_mk', mathlib:QuotientGroup.eq_iff_div_mem, mathlib:Finset.mem_image.

Source: Bruin–Stoll, §3.3, published p.279, definition of Iⱼ. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Correctness with only changed tests

Identifier: EffectiveDiophantineMethods:ED.5/relevant-tests. Proposed name: TauCeti.MordellWeilSieve.refineClasses_relevant.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let T⊆S, K≤L, and suppose φᵢ(K)=φᵢ(L) for every i∈S∖T. If σ is correct on A_S(L), then refineClasses(T,K,L,σ,A_S(L))=A_S(K). Thus all tests whose image subgroups are unchanged can be omitted.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Lift-membership says the left side consists exactly of fine classes projecting to A_S(L) and satisfying the tests in T.
2. For each omitted index, unchanged-local-image transfers its coarse test to the fine class. Combine these tests with those in T to obtain all of S.
3. Conversely a fine S-survivor projects to a coarse S-survivor by quotient-refinement and satisfies the T-tests by constraint-monotonicity.

Acceptance:

- Taking T=S recovers the full lifting theorem.
- Taking T=∅ is valid only when every selected image subgroup is unchanged.
- The ℤ/4 example in unchanged-local-image prevents omission of a genuinely changed test.

Dependencies: EffectiveDiophantineMethods:ED.5/lift-membership, EffectiveDiophantineMethods:ED.5/unchanged-local-image, EffectiveDiophantineMethods:ED.5/quotient-refinement, EffectiveDiophantineMethods:ED.5/constraint-monotonicity, EffectiveDiophantineMethods:ED.5/membership.

Source: Bruin–Stoll, §3.3, published p.279, Iⱼ and Lift. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### A deterministic bound for a lifting step

Identifier: EffectiveDiophantineMethods:ED.5/lift-cardinality. Proposed name: TauCeti.MordellWeilSieve.card_refineClasses_le.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). For any proposed lifts σ, the number of classes returned by refineClasses(S,K,L,σ,B) is at most |B|·|ker π|, with the kernel enumerated in Γ/K. This bound requires no section equation.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Each translated kernel image has at most |ker π| elements by Finset.card_image_le.
2. Use Finset.card_biUnion_le_card_mul to bound the union over B. Finset.card_filter_le bounds the final local filter.
3. The bound counts a finite step only. It does not prove a heuristic estimate for survivor density, a q^r formula ignoring torsion, or termination of an unbounded search over primes.

Acceptance:

- For no tests and a correct section on B, the translated fibres are disjoint and the bound is attained.
- In a torsion group the kernel cardinality is used as it stands.

Dependencies: EffectiveDiophantineMethods:ED.5/coset-lift, mathlib:Finset.card_image_le, mathlib:Finset.card_biUnion_le_card_mul, mathlib:Finset.card_filter_le.

Source: Bruin–Stoll, §3.3, published pp.279–280, complexity of the lifting step. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### The target survives a prepared step

Identifier: EffectiveDiophantineMethods:ED.5/prepared-step-target. Proposed name: TauCeti.MordellWeilSieve.target_le_preparedStep.

Let D≤L be subgroups of an abelian group Γ and φ:Γ→A an additive homomorphism. For the native subgroup L′=L∩φ⁻¹(φ(D)), one has D≤L′. The containment L′≤L is part of the native intersection operation.

Hypotheses: Γ and A are abelian groups, D and L are native additive subgroups, D≤L, and φ is an additive homomorphism.

Proof or construction:

1. An element of D is in L by the supplied inclusion. Its φ-image is in φ(D) by Subgroup.le_comap_map, in additive form.
2. These two memberships give membership in the intersection. For D=NΓ and surjective φ, φ(D)=NA, so L′ uses the kernel of Γ→A/NA.
3. Using ker(φ:Γ→A) instead can make L′ smaller than D. Source issue E1 records this distinction and the authors’ implementation that already uses the quotient target.

Acceptance:

- For Γ=ℤ, A=ℤ/4, φ reduction, D=2ℤ and L=ℤ, the corrected step gives 2ℤ and contains D; the original kernel is 4ℤ and does not.

Dependencies: mathlib:Subgroup.map, mathlib:Subgroup.comap, mathlib:Subgroup.le_comap_map.

Source: Bruin–Stoll, §3.3, published p.279, PrepareLift; author LiftInformation, lines 2480–2493. Containment invariant for the corrected quotient-target interpretation; the published shorthand and its correction are recorded under E1.

### Strict progress of a prepared step

Identifier: EffectiveDiophantineMethods:ED.5/prepared-step-progress. Proposed name: TauCeti.MordellWeilSieve.preparedStep_lt.

Let D,L≤Γ and φ:Γ→A. If φ(L) is not contained in φ(D), then L∩φ⁻¹(φ(D)) is a proper subgroup of L.

Hypotheses: Γ and A are abelian groups and φ is an additive homomorphism; D,L are additive subgroups.

Proof or construction:

1. The intersection is contained in L. If equality held, every element of L would map into φ(D), forcing φ(L)≤φ(D) by Subgroup.mem_map.
2. Equivalently choose a witness in φ(L)∖φ(D), lift it to an element of L and see that it is excluded from the intersection.
3. Together with prepared-step-target this allows only strict intermediate refinements containing D. When Γ/D is finite, a sequence of such strict refinements has finite length; a strategy selecting and enumerating those subgroups is still to be specified.

Acceptance:

- In the reduction ℤ→ℤ/4 with D=2ℤ and L=ℤ, progress is strict.
- If φ(L)=φ(D), the hypothesis fails and this test supplies no strict step.

Dependencies: mathlib:Subgroup.comap, mathlib:Subgroup.mem_map.

Source: Bruin–Stoll, §3.3, published p.279, PrepareLift. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### A subgroup covers a coprime sieve quotient

Identifier: EffectiveDiophantineMethods:ED.5/subgroup-covers-quotient. Proposed name: TauCeti.MordellWeilSieve.subgroup_covers_quotient.

Let H,L≤Γ for an abelian group Γ, let N be a natural number, assume NΓ⊆L and gcd([Γ:H],N)=1, with the native natural index. Then H→Γ/L, h↦q_L(h), is surjective. The usual application has [Γ:H] finite and N>0. The statement also includes the harmless N=1 boundary even if the native index is zero.

Hypotheses: Γ is an abelian group; H,L are additive subgroups; NΓ⊆L; gcd(H.index,N)=1.

Proof or construction:

1. Set d=[Γ:H]. The additive companion of Subgroup.pow_index_mem gives d·g∈H for every g.
2. By Nat.gcd_eq_gcd_ab and coprimality choose integers u,v with d u+N v=1. Put h=u·(d·g), an element of H.
3. The difference g−h equals v·(N·g), which lies in L. Native quotient equality therefore gives q_L(h)=q_L(g). Surjectivity of q_L completes the proof.
4. This establishes coverage of the sieve quotient only. It does not certify H=Γ, its index, saturation, or the image of H under a finer local map.

Acceptance:

- H=2ℤ and L=3ℤ cover all three residue classes.
- H=2ℤ and L=2ℤ do not cover ℤ/2; the coprimality assumption fails.
- For N=1 the quotient is trivial.

Dependencies: mathlib:Subgroup.pow_index_mem, mathlib:Nat.gcd_eq_gcd_ab, mathlib:QuotientGroup.eq_iff_div_mem, mathlib:QuotientGroup.mk'_surjective.

Source: Bruin–Stoll, §1, published pp.272–273, finite-index subgroup qualification. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Applying the obstruction to commuting maps

Identifier: EffectiveDiophantineMethods:ED.5/certified-map-obstruction. Proposed name: TauCeti.MordellWeilSieve.isEmpty_of_commuting_maps.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let P be an existing type, j:P→Γ a map, and rᵢ:P→Gᵢ maps with φᵢ(j(p))=rᵢ(p) and rᵢ(p)∈Xᵢ for every p and every i∈S. If A_S(L)=∅ then P is empty. Neither injectivity of j nor surjectivity of φᵢ is needed.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Any p gives a global element j(p). Commutativity and local containment show that it satisfies all local constraints.
2. Apply empty-sieve-obstruction. This argument consumes actual maps and equalities on their values.
3. To instantiate P=C(ℚ), the curve-point type, Abel–Jacobi map, reduction maps, local enumeration and commutative squares must first be constructed. This node provides none of those geometric inputs.

Acceptance:

- A certified local superset can be used through local-overapproximations.
- An arbitrary type P with the displayed maps is a legitimate test case; calling it a curve is not part of the theorem.

Dependencies: EffectiveDiophantineMethods:ED.5/empty-sieve-obstruction.

Source: Bruin–Stoll, §2, published pp.273–274, commutative diagrams; §3.3, p.280. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

### Completeness from unique residue fibres

Identifier: EffectiveDiophantineMethods:ED.5/known-points-completeness. Proposed name: TauCeti.MordellWeilSieve.mem_known_of_unique_fibres.

Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let P be an existing type with j:P→Γ and W⊆P finite. Assume every j(p) satisfies all local constraints; every a∈A_S(L) equals q_L(j(w)) for some w∈W; and q_L∘j is injective. Then every p∈P belongs to W.

Hypotheses: Γ is an abelian group; S is a finite set of local indices; each Gᵢ is an abelian group; φᵢ:Γ→Gᵢ is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. L is an additive subgroup and Γ/L has a specified finite enumeration. Surjectivity of φᵢ, finite generation of Γ and finiteness of Gᵢ are not required for these statements; the source application provides them.

Proof or construction:

1. Global-soundness puts the residue of j(p) in A_S(L). The coverage hypothesis provides w∈W with the same residue.
2. Injectivity of q_L∘j identifies p with w. Transfer membership in W along this equality.
3. In geometric applications injectivity requires a Chabauty residue-disc uniqueness theorem or a height separation bound. A finite sieve by itself supplies no such injectivity, and many curves do not satisfy it for a given modulus.

Acceptance:

- The conclusion can fail without the uniqueness hypothesis even if all quotient classes are represented by known points.
- A singleton quotient can establish completeness only when the relevant point set has at most one element.

Dependencies: EffectiveDiophantineMethods:ED.5/global-soundness.

Source: Bruin–Stoll, §1, published p.273, at most one rational point in each coset. Declaration-sized consequence of the displayed finite sieve, with the native quotient conventions fixed in this packet. The detailed argument here is part of the blueprint.

## Stage coverage and continuation

The finite component above has dependencies ending in the pinned baseline. That statement concerns the listed algebraic declarations only. It is not closure of ED.5 or of the roadmap. No external roadmap stage is used as an undeclared assumption inside these nodes, so this checkpoint has no cross-roadmap requests. The geometric and analytic connections below must receive exact requests or imported node identifiers when their consuming declarations are constructed.

### EffectiveDiophantineMethods:ED.0 — not_read

- Import CN.0 exact carriers; specify the Diophantine valuation and isolating-disc interfaces. Construct the required precision propagation against native p-adic approximations. No algorithm for these targets is decomposed here.

### EffectiveDiophantineMethods:ED.1 — not_read

- Import GN.5 certified LLL and construct Diophantine short/closest-vector exclusion with explicit bounds and exhaustive enumeration. Native norm bounds alone are not a computational certificate.

### EffectiveDiophantineMethods:ED.2 — not_read

- Read the de Weger and Tzanakis–de Weger sources completely; import DT.3 lower bounds, DT.4 equation-specific bounds, CN.4 certified analytic evaluation and ED.1 exclusion. Decompose the actual finite residual searches and their completeness proofs.

### EffectiveDiophantineMethods:ED.3 — not_read

- RP.1 and the protected elliptic L6/L7 stages supply Mordell–Weil/descent. Certify the finite algorithms establishing the actual index and the saturation primes required by subgroup-covers-quotient. No such certificate is provided by the algebraic coverage lemma.

### EffectiveDiophantineMethods:ED.4 — not_read

- Import ColemanIntegration L0/L1 primitives and NC.4 depth-one comparison. Decompose annihilating differentials, every residue disc including exceptional ones, numerical precision, Strassmann/Newton bounds and rational-point uniqueness. RT-AUDIT-09/7 and its verifier require a single owner for Strassmann; the verifier does not authorize treating the unpromoted LV draft as an established supplier.

### EffectiveDiophantineMethods:ED.5 — partial

- Construct the higher-genus Jacobian point group, Abel–Jacobi embedding from a rational degree-one divisor class, reductions and finite local images, with actual commuting squares. Import elliptic reduction from the protected EllipticCurves Layer 4. Supply executable presentations/enumerations of Γ/L and all local groups; native finiteness is insufficient. The generic P-map application theorem does not fill this gap.
- The source is only partly read. Finish published §4.2 through §8 and the references needed by its claims; decompose expected-size heuristics distinctly from proved bounds, the choice of primes and modulus, finite chain construction, torsion-aware presentations, bad/deep local information, genus-two arithmetic and the worked examples. Record all errors found. Preserve the corrected target-containing subgroup invariant. The finite-step theorems do not establish eventual success of an unbounded sieve search.
- Construct the exact height/Coleman uniqueness and candidate-coverage inputs used by known-points-completeness; import the certified ED.2/ED.4 outputs. Cover integral and hyperelliptic point computations with their actual covering maps and an exhaustive residual list. The index-coprimality lemma concerns a quotient only, not full height enumeration in the Mordell–Weil group.

### EffectiveDiophantineMethods:ED.6 — not_read

- Fresh source decomposition is still required for all 28 ED.6 routed items of PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19: /2–/8, /39, /49–/53, /59–/61, /64–/65, /77, /82, /85–/92. This includes the Hodge filtration algorithm, Frobenius matrices and transport, height evaluation, precision/Newton bounds, three chart calculations and the final seven-point statement. Import NC.5 theory and CN.5 general certificate schemas. Recheck the extraction’s E1–E8 against the published text and current reviewed status before using those statements; in particular do not use retracted Lemma 4.7. The registered 2021 modular-curve sequel and its cited inputs also need full reading.

## Sources and reading scope

The source register is a reading ledger, not a claim that the full roadmap has been extracted. The original campaign references to de Weger, Tzanakis–de Weger and the modular-curve sequel remain requirements for continuation. Their proofs have not been read for this checkpoint.

**Nils Bruin and Michael Stoll, The Mordell–Weil sieve: proving non-existence of rational points on curves.** LMS Journal of Computation and Mathematics 13 (2010), 272–306; version of record, doi:10.1112/S1461157009000187. [Source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/29EFF630FD2859F8C79DFD48E1A33926/S1461157009000187a.pdf/the-mordell-weil-sieve-proving-non-existence-of-rational-points-on-curves.pdf). Accessed 2026-09-27; SHA-256 1db66f2e15bf5ca53843ed15dfd511aa6eb960b84d979b1dcb82a7dbd93c7408.

- Published pp.272–280 (physical PDF pages 1–9): §§1–3 in full and §4.1. This is not a complete reading of the paper.
- Author copy dated 20 May 2009, pp.1–15, read for comparison and scope: §§1–3, §§4.1–4.2, beginning of §4.3. Published numbering governs the nodes.
- Author code MWSieve-new.m, LiftInformation lines 2471–2615, read only for subgroup preparation and lifting; not executed or fully audited.

**Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk, Explicit Chabauty–Kim for the split Cartan modular curve of level 13.** Annals of Mathematics 189 (2019), 885–944, doi:10.4007/annals.2019.189.3.6. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf). Accessed 2026-09-27; SHA-256 e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8.

- Published pp.885–887 only: abstract, contents, start of introduction and §1.1.
- The existing extraction’s ED.6 route and all 28 routed items were read as a continuation register; they are not a fresh reading or verification of their source passages. No ED.6 theorem is claimed decomposed here.

The ED.6 route of PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 was read in full, including all twenty-eight routed items. It supplies a precise worklist, not proofs for this packet. The published paper was freshly read only through p.887. The retained route includes algorithmic Hodge data, Frobenius and transport, local-height computation, certified precision, rank inputs and all three chart calculations for X_s(13). The seven-point result is not represented by a speculative theorem on an unspecified curve. The existing extraction’s eight source findings must be reconciled with the reviewed record when that work resumes.

### Source issue E1

Published §3.3, p.279, PrepareLift: the definition of Λ, with φᵢ as defined in §3.2, p.277.

The printed formula is Λ = {Lⱼ₋₁ ∩ ker(φᵢ) : i ∈ I′}.

At target D=NₖΓ use Lⱼ₋₁∩φᵢ⁻¹(φᵢ(D)); with the source’s surjective maps this is Lⱼ₋₁∩φᵢ⁻¹(NₖGᵢ). Equivalently, first replace Gᵢ by Gᵢ/NₖGᵢ and φᵢ by its composite into that quotient, then take its kernel. The required invariant is D≤Lⱼ≤Lⱼ₋₁.

Let Γ=ℤ, G=ℤ/4, φ reduction, Nₖ₋₁=1, qₖ=2 and Nₖ=2. The selected exponent test holds. The displayed original kernel produces L₁=4ℤ, which fails to contain D=2ℤ. The final assignment Lₜ=2ℤ then makes an ascending step, so the quotient Lₜ₋₁/Lₜ in Lift is not defined. The quotient-target kernel is 2ℤ and preserves the invariant. This is a defect of the literal printed notation, not a claim that the authors’ implementation has this bug.

Existing correction: The authors’ MWSieve-new.m already performs the target quotient before taking Kernel(h): LiftInformation lines 2480–2493. URL https://www.mathe2.uni-bayreuth.de/stoll/magma/MWSieve-new.m; SHA-256 2e4b0cc03da645fdb3bcb554893a7dd736b97cae6b7ec1583942b12b0c31bd7f.

Correction search:

- Publisher article page and version-of-record PDF, DOI 10.1112/S1461157009000187, accessed 2026-09-27; no separate corrigendum found on the article page.
- arXiv 0906.1934 version history checked: v1 and v2 dated 10 June and 30 November 2009; no subsequent version listed. The v2 PDF was not read.
- Michael Stoll’s publications page AG31 and Magma directory, accessed 2026-09-27; the author-copy formula agrees with the published kernel notation, while the downloaded implementation already uses the quotient target.

## Pinned baseline and validation

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every cited statement was read in the pinned source tree and its source blob verified. The suggested file imports individual Mathlib modules; this component needs no Tau Ceti implementation imports. Multiplicative quotient and subgroup declarations listed in the index generate their additive companions through the library’s translation mechanism; those companions are used in the checked signatures. They are existing declarations, not newly planned additive copies.

The blueprint checker reports no errors. Its warning about Finset.mem_filter comes from the declaration index recording an extra namespace component; the pinned source and a direct Lean check establish the actual name. The signature file elaborates with its expected placeholder warnings only. Mathematical regression checks and proof probes are recorded in the handoff. These checks assess this checkpoint; they do not prove the proposed library implementation or the unresolved geometric applications.
