# Handoff: BP-KTheoryLowDegrees--Z.3 (issue #765)

## Current checkpoint — Codex — codex-7e92bd, 26 September 2026

Claim comment 5849651451 was confirmed by bot comment 5849652340; the complete
issue was reread after confirmation. The initial snapshot is
`274eceab7992728058af0cbf4f0bf8c87351171d`. Only the three named deliverables and
this handoff are published. No git commands were used.

**Partial checkpoint.** Nine new nodes integrate the finite-free resolution
comparison in Serre Proposition 4, with its exact hypotheses. All 176 inherited
ids remain; 175 inherited node records and all 19 source-issue records are
unchanged. Only the old Serre theorem node gains the new proof inputs. The
other changes are the source-reading boundary, supplier scope, documentation,
and continuation metadata. No stage is closed and no implementation is claimed.

### What is now decomposed

- The existing finite-comodule carrier gains its underlying-module exact
  structure and essential-smallness argument. Its finite-free full subcategory
  uses the pinned extension-closed exact-structure API. Both groups are the
  actual `ExactK0`, not new presentations or split representation rings.
- A finite-free cover comes from the cofree pullback and the pinned finite
  subcomodule lemma. Its kernel is finite torsion-free over a PID, hence free.
- Two resolutions are compared through the fibre product of their covers.
  Additivity uses one cover of the middle object and its two kernels, without
  a horseshoe argument or any claim of projectivity as a comodule.
- The Euler homomorphism and the inclusion are inverse additive maps. The
  comparison is only additive for a coalgebra; no multiplication is assumed.
- A separate comparison identifies the finite-free carrier with the existing
  GL representation-group carrier, so no second representation ring is planned.

The exact-category constructions assume a **flat** coalgebra over a PID; the
cover, resolution and resulting equivalence assume a **free** coalgebra. This
is deliberate: the pinned finite-hull theorem requires `Module.Free`. The Lean
exact-structure signature explicitly retains the PID and flatness binders.
Neither elaboration nor flatness supplies a missing freeness instance.

### What remains

The packet still has **two gaps and six requests**. The Serre gap is smaller
but comprises several concrete unfinished inputs:

1. Establish freeness of the GL coordinate coalgebra, as in Serre p. 51,
   Remark 1, or implement the general flat/noetherian finite-hull argument from
   §1.5 and weaken the cover theorem with that proof. The determinant
   localization is a route to flatness; it does not by itself prove freeness.
2. Integrate §§2.4–2.7: the generic-fibre exact sequence, stable lattices,
   the Euler reduction maps, vanishing of residue inclusions after surjectivity
   of decomposition maps, and the generic-fibre isomorphism. The retained
   supplement below describes these proofs. None is certified by Proposition 4.
3. Integrate formal-character compatibility in §3.7, then supply the field
   highest-weight classification and descent for ℚ and every 𝔽_p. The complex
   ClassicalGroups request supplies only its stated complex comparison.
   ReductiveGroupsPartII currently covers local structure/arithmetic models,
   not these missing theorems. The packet proposes an additional foundational
   stage there; it does not invent a valid supplier stage or edit that owner.
4. Resolve the unchanged general Picard duality/pullback request. Keep the
   three exact JacobianChallenge stage ids in unresolvedPrerequisites until
   the validator stops misclassifying upstream stage ids as baseline names.

Do not use SchemeKTheoryOperations S.5 as a backward splitting-principle input
to Z.3. Preserve RS-18, the Z.5 foundational/curve split, and the elliptic
origin convention. Do not substitute finite-point or Lie-algebra characters
for formal integral torus characters.

### Verification and sources

The final inventory is **185 nodes** (32 theorems, 90 lemmas, 29 constructions,
12 definitions, 12 applications, 10 comparisons), **290 API items, 173 test
specifications, 18 planets, and 332 baseline declarations**. The nine new node
signatures, 23 API items and 12 tests agree with the packet and reader.

The full suggested file compiled with Lean **4.34.0-rc2**, **0 errors** and
**562 warnings, all uses of `sorry`**. All **212** imported Tau Ceti modules
were freshly built from `f790474821cf4256814db967cb154e7af3d0c369`; all **8,483**
reached Mathlib source files were byte-matched against
`082e2d37e8b0463410cdb532e111cd43d5a66174` before using their cached objects.
No library source or other worker's build directory was changed. This is
signature elaboration, not formal proof.

The internal node graph is acyclic (540 edges). This check does not
certify the inherited atlas-wide dependency graph. The unmodified blueprint checker with the pinned declaration index reports
0 errors and 0 warnings; the four-file intake reports 0 problems.

Serre, *Groupes de Grothendieck des schémas en groupes réductifs déployés*,
IHÉS 34 (1968), pp. 37–52, was read in the
[NUMDAM published scan](https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf),
SHA-256 `09bb5044332281b29d02116a0582e41d17651b929584e76e442d8135d39e60e2`.
The complete §§1–3 proof text was inspected; printed pp. 41–42 were also
visually checked. The two-kernel additivity proof explicitly expands Serre's
short additivity assertion. Source excerpts and earlier source-error records
are retained; no new source-error finding is alleged.

Fresh library reads include finite comodules, flat-coalgebra kernels and
inverse images, quotients, cofree maps, the free-coalgebra finite-hull theorem,
PID torsion-free freeness, and exact K₀ functoriality. The existing categorical
`resolutionEquiv` has hypothesis `P ≤ E.isProjective`; this does not cover
underlying-base-free comodules. Broad catalogue searches found the existing
SchemeKTheoryOperations representation-ring consumer, which remains governed
by the inherited ownership transfer to Z.3. Search of public Mathlib PR and
Zulip results found no additional matching interface; this is not an absence
claim. Full GrothendieckEulerForms and JacobianChallenge documents, the four
reviewed AUDIT-29 rows, accepted RS-18, and the relevant ReductiveGroups,
ClassicalGroups and ReductiveGroupsPartII scopes were read. There is no fresh
audit claim for all 319 inherited baseline records.

Fresh publication guards matched all 19 captured input blobs and all
four existing outputs at main `8772d3b7affda45bc1cad8d1880e78a2c06ebe99`. The issue body
and bot-confirmed claim were unchanged.

## Historical handoff and retained source supplement

The following is preserved as historical input. Its earlier inventory,
compilation counts, reading boundaries, and requests to integrate Proposition 4
are superseded by this checkpoint. The generic/residue-fibre and character
arguments remain useful continuation material.

# Handoff: BP-KTheoryLowDegrees--Z.3 (issue #765)

## Current checkpoint — Codex, 26 September 2026

Agent/session: **Codex — codex-a71f92**. Claim comment **5849220880**;
the bot confirmed that exact comment in **5849222017**. The whole issue was
read before claiming and reread after confirmation. Input commit:
`b9421f8cd375f00c9cdb2ecf898e21dad5125bdc`. Branch:
`codex-a71f92-k0-clopen-powers`. Only the three named deliverables and this
handoff are submitted. No application, library, queue or other packet changed.

**Status: partial, with integrated packet/document/signature changes.** All
172 inherited node IDs are preserved. Six existing nodes are updated and four
are added. The previous exterior/determinant/clopen-power supplement is now
integrated; the integral-comodule supplement retained below is still a
continuation input, not a completed proof decomposition. No stage is closed.

### What this checkpoint establishes

- The exterior filtration uses the intrinsic image for indices at most the
  degree and an explicit terminal zero. Its proof now gives the local split
  model, both image inclusions, independence of lifts, compatible graded maps,
  finite local freeness of the filtration terms, naturality and pullback.
  Stacks 0FIC supplies the exterior-filtration argument used in the lambda
  sum formula; the local details are expanded here.
- The suggested sheaf-filtration signature had omitted all vector-bundle
  hypotheses. Those are now present, as is finite local freeness of the
  filtration terms. The sequence Z --2--> Z --> Z/2 explains why arbitrary
  sheaves cannot replace vector bundles. This was a prototype error, not a
  newly alleged mistake in Weibel.
- Tensor determinants use the lexicographic basis with the first factor's
  index first. The proof names the pinned `Matrix.det_kronecker` and glues
  compatible **isomorphisms**, not locally equal Picard classes. Sign,
  rank-zero and Z/4 tests exclude diagonalisation or characteristic-zero
  shortcuts. The two former exercise-level proof gaps are discharged by
  these expanded arguments, not by claiming Weibel printed their solutions.
- Four new Z.5 nodes give `pic-disjoint-cover-ext`,
  `pic-locally-constant-module`, `pic-locally-constant-pullback`, and
  `pic-locally-constant-affine`. Disjointness is essential: Picard classes do
  not form a sheaf on arbitrary overlapping covers. The powers use the
  product-of-sections construction on clopen exponent fibres, including
  negative and infinite-image exponents. No infinite tensor product,
  globally finite projective module, or finite-image assumption is used on
  a general scheme. Quasi-compactness enters only in the affine comparison.
- The rank–determinant target reuses `TrivSqZeroExt` and its central-bimodule
  commutative-ring instance. The suggested theorem is now a surjective ring
  homomorphism with the actual rank and determinant coordinates on **every**
  scheme; it is no longer restricted to connected schemes.

### Exact open boundary and validator limitation

The packet has **two gaps and six requests**. One gap remains Serre's
highest-weight/classification and integral-comparison input in its existing
packet form. The other makes the general Picard supplier boundary explicit:
JacobianChallenge A owns duals, ordinary integer powers and Picard pullback
preserving unit, tensor, dual, identity and composition. The pinned
`LineBundleClass` is a commutative monoid only. Its unit group is the actual
prototype carrier; it does not certify the missing supplier mathematics.
The locally constant scalar action is the additional construction owned here.

The current validator tests its `BASE_REF` expression before atlas stage IDs.
It therefore misclassifies
`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`
as a Lean declaration. This was reproduced against both the input and fresh
main. Changing that script is outside this job's allowed paths. The three
direct new consumers retain the exact stage in `unresolvedPrerequisites`,
as well as in their gap, source discussion and the existing supplier request.
This is an explicit partial-packet boundary, **not** a baseline claim or a
closed dependency graph. Restore those three edges to `prerequisites` once
the validator distinguishes upstream stages; the focused combined-graph
check already includes them. No fake declaration or alternate owner was
introduced to obtain a green validator result.

### Fresh verification

- Official packet/index check: **0 errors, 0 warnings**. Totals: **176 nodes**
  (30 theorems, 88 lemmas, 25 constructions, 12 definitions, 12 applications,
  9 comparisons), **267 API items, 161 unit tests, 18 planets, 319 baseline
  declarations**. Five baseline records are new; the relevant inherited
  determinant, sheaf, Picard-class and square-zero declarations were reread.
  This is not a fresh audit of every inherited baseline claim.
- Four-file intake check: **0 problems**. The 19 existing source-issue
  records are byte-for-byte identical as JSON data; source-issue and
  source-version validators pass. No new source-error finding is asserted.
- Suggested file: **compiled successfully**, Lean 4.34.0-rc2, with **527
  placeholder-proof warnings and no other diagnostics**. The Mathlib cache
  was used only after checking all **8,482** imported source files against
  pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. All **209** required Tau Ceti
  modules were freshly compiled from source at
  `f790474821cf4256814db967cb154e7af3d0c369` into isolated scratch output.
  No library cache was modified. Successful elaboration is not a proof of
  the planned statements; every implementation status remains unchecked.
- The combined atlas/decomposition/packet graph has **6,832 declaration
  IDs and 41,897 edges** in this snapshot. No cycle touches the six updated
  or four new nodes, including their unresolved supplier edges. Unrelated
  graph components and all inherited transitive prerequisites are not
  certified by this focused test.
- Exact finite regressions: **10,724** Kronecker-determinant checks over F2,
  F3, Z/4 and Z/6; the sign and nilpotent-ring examples; **700** basis-wedge
  filtration-rank checks; **81** signed three-component module/pullback
  tests and a 101-component prefix of the unbounded-exponent family.
  Finite computations are checks, not proofs for arbitrary schemes or
  infinite covers.

### Sources and ownership

WORKERS, both protocols and UPSTREAM_GUIDE were read. The complete nearby
upstream GrothendieckEulerForms and ClassicalGroups documents, all four
reviewed coverage records, the accepted RS-18 scope and relevant link entries
were read. Catalogue and pinned-source searches found no existing general
locally constant Picard-power construction to duplicate. Existing rank,
determinant, affine comparison and ring-power node IDs are reused.

Fresh primary-source reading: Stacks 0FIC; 00AK, Lemmas 6.33.1–6.33.4;
00AM; and 01CR, especially ordinary powers and duality in 17.25.2–17.25.6.
Their downloaded online texts are separately versioned and hashed in the
packet with access date 2026-09-26. Weibel's author-hosted **29 August 2013
draft**, not asserted to be the printed AMS text, was reread at PDF pages
68, 153–154 and 165 (I Ex. 5.4, II Thm. 8.1/Def. 8.1.1, II Ex. 8.5);
SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
The new constructions and expanded local calculations are distinguished
from the shorter statements in those sources.

### Resume here

1. Integrate the retained integral-comodule proof below into declaration-sized
   nodes, the reader and signatures; verify each finite/free/flat and exact
   category interface. The packet still records Serre §2 at statement level.
2. Establish or request the highest-weight classification over Q and F_p;
   the complex ClassicalGroups theorem is not a substitute. Preserve formal
   integral characters rather than characters of finite rational points.
3. Resolve the general Picard interface with its existing owner; keep the
   exact stage-edge encoding limitation visible until it is fixed.
4. Preserve the Z.5 foundational-vector-bundle/regular-curve split proposal
   and all RS-18 boundaries. Do not import downstream scheme operations into
   early ring K₀, or rebuild EllipticKTheory's origin-dependent theorem.
5. Review inherited source issues and every outstanding request before any
   stage or packet closure claim. Run the full validations and pinned Lean
   compilation after changes.

## Retained earlier checkpoint — 26 September 2026

The remainder is the previous worker's source-proof supplement, preserved
verbatim as historical input. Its statements that the three main deliverables
are unchanged and that the geometric supplement awaits integration describe
that earlier checkpoint, not the current one above.

Agent: ChatGPT Pro (GPT-6 Astra Pro), session `gpt-6f2c91`.
Branch: `gpt-6f2c91/k0-z3-proof-integration`.
Claim comment: 5848446213; bot confirmation: 5848447116. The issue was re-read after confirmation and before submission.

**Status: partial source-proof checkpoint; handoff only.** This continuation supplies the integral-coefficient argument behind `Z.3/serre-representation-ring-theorem`, rather than leaving Serre §2 as a statement-level citation. It also gives a finite dominance-interval proof for the GL case and concrete tests that distinguish algebraic-group comodules, representations of their rational points, ordinary traces and integral formal characters.

The packet, reader document and suggested Lean file are **unchanged**. No packet node, API item, unit-test record, planet, source-issue record, supplier request or coverage status is added or closed by this submission. The proofs and tests below still require integration into all three deliverables. The highest-weight classification over Q and F_p remains an open input. This checkpoint neither completes Z.3 nor supersedes the previous worker's pending integration.

### Preserve the preceding proof supplement

The branch started at commit `e3007b863057586df912d850ad6253c4b03eb009`. Its previous handoff, blob `bcb823352a5de35858fccaaf563124a2ce6baef8`, remains available immutably at:

<https://github.com/CBirkbeck/tauceti-explorer/blob/e3007b863057586df912d850ad6253c4b03eb009/research/blueprint/handoff/BP-KTheoryLowDegrees--Z.3.md>

That document contains the full proofs for the exterior filtration, determinant of a tensor product, and locally constant line-bundle powers, including signed and infinite-image exponents. **Those proofs still have to be integrated.** In particular, preserve its instructions for `Z.5/exterior-power-extension-filtration`, `Z.3/exterior-extension-filtration`, `Z.3/exterior-extension-graded`, `Z.5/determinant-bundle-tensor`, `Z.3/determinant-tensor` and `Z.5/rank-determinant-surjective`, and its warning that the relevant exercise-level gaps are not yet closed.

The unchanged input packet is blob `1113cb5a6a3087419c6c634568adff1888896620`. The reader document at this branch is blob `3edb140b51c43be94025e70d1ed99e9401c685c9`. Earlier reports of 172 nodes, 314 baseline declarations, 260 API items, 157 unit tests, 18 planets, 19 source issues and successful compilation with proof placeholders belong to the earlier authors. They are not new validation or compilation results of this continuation. Earlier coverage has Z.3 and Z.5 partial and Z.4 and Z.6 source-decomposed; none is promoted here.

RS-18's accepted ownership is unchanged. The material below is an input to the existing integral representation-ring route, not a second lambda-ring development, a replacement elliptic K₀ theorem, or an import of the downstream flag-bundle splitting principle.

## 1. Precise target and the two Grothendieck groups

The existing nodes concerned are:

- `KTheoryLowDegrees:Z.3/representation-ring-of-gl`;
- `KTheoryLowDegrees:Z.3/serre-representation-ring-theorem`;
- `KTheoryLowDegrees:Z.3/ring-k0-special`.

Work first with a flat coalgebra C over Z. Use the existing **right** comodule convention `rho : E -> E tensor_Z C`; the source uses left comodules, related by the tensor symmetry. Let E(C) be the abelian category of comodules whose underlying Z-modules are finitely generated. Let F(C) be its exact subcategory of comodules whose underlying Z-modules are finite free. Exact sequences in F(C) are inherited from E(C).

Write G_Z(C) for the exact Grothendieck group of E(C), and R_Z(C) for the exact Grothendieck group of F(C). The category F(C) is not being given the split exact structure of representations. Its sequences split as Z-module sequences, but need not split equivariantly. In particular, an object of F(C) need not be projective **as a comodule**.

For a field k obtained from Z by extension or reduction, write G_k(C_k) for the exact Grothendieck group of finite-dimensional C_k-comodules. For C=Z[G], with G a finite product of general linear group schemes, these are the representation groups in the existing Serre node. The eventual target is the injective integral formal-character map with image the Weyl-invariant Laurent character ring.

The coalgebra/category, exact-K₀, tensor, base-change and quotient constructions must use their existing owners. The following is a proof of their required comparisons, not a replacement category whose fields assume the answer.

## 2. Finite free covers and the exact-K₀ comparison

### Finite comodule hull: flatness is the actual general hypothesis

For a finitely generated Z-submodule M of a C-comodule E, choose a finitely generated submodule H of E such that rho(M) is contained in H tensor C: expand the images of a finite generating set of M into finitely many pure tensors.

Set F equal to the inverse image of H tensor C under rho. Flatness of C identifies the relevant tensor submodules and makes tensoring by C preserve this inverse image. The counit gives F contained in H. Coassociativity gives rho(F) contained in F tensor C: apply the inverse-image identity to rho tensor id_C and use that (id_E tensor Delta)rho(F) lies in H tensor C tensor C. Thus F is a subcomodule. Since Z is Noetherian and F is a submodule of the finite module H, F is finite; by construction it contains M.

This gives the finite-hull statement used below without asserting that a flat Z-module is free. The pinned finite-subcomodule theorem has a different, stronger coalgebra hypothesis; see section 7.

### A two-term resolution by underlying finite free comodules

For E in E(C), choose an ordinary finite free Z-module L and a surjection L -> E of underlying modules. The coaction embeds E into its cofree comodule E tensor C, split by the counit on underlying modules. Pull back the surjection L tensor C -> E tensor C along this embedding.

The pullback F maps onto E. Choose finitely many preimages of generators of E and take their finite comodule hull P_0 inside F. Then P_0 -> E is onto. The module P_0 embeds in L tensor C, which is torsion-free because C is flat. Hence P_0 is a finite torsion-free Z-module and is free. Its kernel P_1 is also finite and torsion-free, hence free. We have constructed an exact sequence

    0 -> P_1 -> P_0 -> E -> 0

in comodules, with P_0 and P_1 in F(C). Neither the original map L -> E nor an equivariant splitting of the final sequence has been assumed.

### Independence and additivity of the Euler class

Define beta(E) = [P_0] - [P_1] in R_Z(C).

For two such covers P_0 -> E and Q_0 -> E, use the fibre product B=P_0 times_E Q_0. It is finite free as an underlying Z-module. The exact sequences

    0 -> P_1 -> B -> Q_0 -> 0,
    0 -> Q_1 -> B -> P_0 -> 0

show that the two Euler classes agree.

There is also a direct additivity proof that needs **no comodule-projective lifting or horseshoe lemma**. Given `0 -> E' -> E -> E'' -> 0`, choose one finite free comodule cover P -> E. Put K=ker(P -> E) and Q=ker(P -> E''). Both are finite free. Then

    0 -> K -> Q -> E' -> 0,
    0 -> Q -> P -> E'' -> 0

are resolutions of the required kind. Consequently

    beta(E') + beta(E'')
      = ([Q]-[K]) + ([P]-[Q])
      = [P]-[K] = beta(E).

Thus beta descends to G_Z(C). It is inverse to the map R_Z(C) -> G_Z(C) induced by inclusion: on a free object use its length-zero resolution; on an arbitrary object use its displayed two-term resolution. This is the precise comparison needed before defining reduction on torsion classes.

**Acceptance boundaries.** The zero comodule has Euler class zero; a free comodule has its own class; the trivial comodule F_p has Euler expression [Z]-[Z] from multiplication by p. A proposed proof that requires every finite free comodule to be projective in E(C) fails this construction's hypothesis check.

## 3. Generic lattices, torsion classes and decomposition

### The generic-fibre quotient

Let i:G_Z(C) -> G_Q(C_Q) be extension of scalars. For every prime p, let j_p:G_Fp(C_Fp) -> G_Z(C) be the map that regards a residue comodule as a Z-comodule annihilated by p.

A finite-dimensional C_Q-comodule V is also a C-comodule via `V tensor_Q C_Q = V tensor_Z C`. Apply the finite-hull lemma to the Z-span of a Q-basis. This produces a stable finite free lattice L whose rational span is V.

Two stable lattices L and L' are commensurable. Their intersection is again a stable lattice, and their quotients by it are finite torsion comodules. The class of any finite torsion comodule lies in the subgroup generated by the images of the j_p: use its finitely many primary parts, then the filtration by powers of p. The subquotients are annihilated by p and are actual C_Fp-comodules.

It follows that the class of a lattice modulo these torsion classes is independent of the lattice. It is additive on a short exact sequence of rational comodules: start with one lattice in the middle term, intersect it with the subobject and take its image in the quotient. This constructs an inverse to the map induced by i. Therefore

    direct_sum_p G_Fp(C_Fp) --sum j_p--> G_Z(C)
        --i--> G_Q(C_Q) -> 0

is exact. Only finitely many primes enter the decomposition of any one torsion object.

### Reduction is an Euler operation, not tensoring an arbitrary torsion module

Reduction modulo p is an exact functor on F(C), because every inherited exact sequence has a free underlying quotient and hence stays exact after tensoring. Via the comparison in section 2, it defines

    q_p([E]) = [P_0/pP_0] - [P_1/pP_1].

For arbitrary E this is **not** [E tensor F_p]. For example, q_p of the class of the trivial comodule F_p is zero, although F_p tensor F_p is the one-dimensional trivial residue representation and has nonzero dimension class.

To descend q_p to the generic-fibre quotient, prove q_p j_l=0 for every pair of primes p,l. Write a comodule killed by l as P/Q with P,Q finite free. Then lP is contained in Q. If p differs from l, Q/pQ -> P/pP is an isomorphism: multiplication by p is invertible on P/Q, giving both its kernel and cokernel zero.

For p=l there is instead the exact four-term sequence

    0 -> pP/pQ -> Q/pQ -> P/pP -> P/Q -> 0.

Multiplication by p identifies P/Q with pP/pQ, since P is torsion-free. Its two end classes therefore cancel in the alternating sum, giving [Q/pQ]=[P/pP]. This proves q_p j_l=0 in all cases.

The quotient property of i now gives a **unique** map

    d_p:G_Q(C_Q) -> G_Fp(C_Fp),  q_p = d_p composed with i.

For a stable lattice L in V, it satisfies d_p[V]=[L/pL]. Lattice independence is a theorem obtained from the quotient construction, not an extra choice convention.

### Why the integral comparison needs surjectivity of d_p

For a lattice L,

    j_p d_p[V] = [L/pL] = [L] - [pL] = 0.

The last equality uses the equivariant isomorphism `p:L -> pL`. It does **not** say that multiplication by p is an isomorphism from L to L.

If each d_p is surjective, then each j_p is zero. The exact generic-fibre sequence consequently makes i an isomorphism. The proof below obtains this surjectivity from formal characters and the field classification input. It does not assert it for an arbitrary coalgebra.

## 4. Formal characters and the remaining highest-weight input

Take C=Z[G], where G is a finite product of GL_N group schemes, with its actual split diagonal torus T. A finite free representation lattice L restricts to a finite direct sum of weight modules L_mu. Each weight module is a direct summand of a finite free Z-module, so is itself finite free.

Define the formal character with integer coefficients by

    ch(L) = sum_mu rank_Z(L_mu) e^mu.

On extension to Q or reduction to F_p, the weights and their integer multiplicities agree. This gives the correctly typed compatibility

    ch_Fp composed with d_p = ch_Q

in the same integral character group ring Z[X(T)]. This is not equality of ordinary F_p-valued trace functions on G(F_p).

Assume the field theorem that the formal character maps over Q and every F_p are isomorphisms onto Z[X(T)]^W. Then the displayed compatibility makes every d_p an isomorphism. Section 3 makes i an isomorphism; section 2 identifies the free-lattice representation group with G_Z(C). The desired integral formal-character theorem follows.

The field theorem still requires the actual highest-weight classification of finite-dimensional **algebraic-group** representations over those fields, together with its descent and highest-weight multiplicity statements. A theorem about semisimple Lie algebras in characteristic zero, or about finite abstract groups, does not supply it. The existing gap must remain until this input and the relevant owner interfaces are established. The new proof only isolates and develops the integral part formerly covered by the §2 citation.

### Finite lower intervals for GL weights

Here is an explicit finiteness argument for the triangular-character step. For one GL_n block with n>1, write dominant weights as decreasing integer tuples. Suppose mu is below lambda in dominance order: their total sums agree and every proper prefix sum of mu is at most the corresponding prefix sum of lambda.

The first prefix inequality gives mu_1 <= lambda_1. Subtracting the last proper prefix inequality from equality of totals gives mu_n >= lambda_n. Since mu is decreasing, every coordinate of mu lies in the finite integer interval [lambda_n,lambda_1]. Thus the dominant lower interval below lambda is finite. For n=1 equality of totals gives equality of weights; for n=0 the weight set has one element. For a finite product of GL groups, apply the argument in each block.

Consequently, if the simple characters have leading orbit sum of coefficient one and only lower dominant terms, one can invert that triangular system over Z by induction on a **finite** lower interval. This proves spanning; independence follows by choosing a maximal weight in any finite relation. No division by the Weyl-group order is used. Equivalently, a common determinant twist moves the interval to partitions with fixed nonnegative total.

This argument does not construct the simple representations or prove their highest-weight classification. It supplies only the combinatorial finiteness step once those hypotheses are available.

## 5. Tests that reject the wrong representation carrier

These tests belong with the formal-character and exact-category definitions when the proof is integrated. They are mathematical acceptance cases, not newly added packet tests or Lean declarations.

### Integer points and Lie algebras lose information

The algebraic characters of G_m over Z with weights 0 and 2 have distinct formal characters 1 and z^2, but both are trivial on G_m(Z)={1,-1}. Thus replacing Z[G]-comodules with representations of the group of integer points loses the information needed by the theorem.

Over F_p, weights 0 and p-1 agree on every F_p-point of G_m, but are distinct algebraic characters. Weights 0 and p have the same differential representation of its Lie algebra, but different formal characters. Neither rational-point evaluation nor differentiation is a faithful replacement for the algebraic-group category in the positive-characteristic input.

### Ordinary trace is not an integral formal character

Over F_p, the direct sum of p trivial representations and the zero representation have the same F_p-valued ordinary trace function. Their integral formal characters are p and 0. A pointwise trace-injectivity theorem cannot be applied here merely by calling its output a character.

### A sequence that splits on finite points but not algebraically

Let V be the standard two-dimensional representation of GL_2 over F_2, with basis x,y. In Sym^2 V, the span W of x^2,y^2 is the Frobenius twist V^(1). The quotient with basis the image of xy is the determinant representation. Hence

    0 -> V^(1) -> Sym^2 V -> det -> 0

is an exact sequence of algebraic representations.

Use the column convention `g x = a x+c y`, `g y=b x+d y`. On the ordered basis x^2,xy,y^2 the action is

    [ a^2   ab       b^2 ]
    [  0    ad+bc     0  ]
    [ c^2   cd       d^2 ].

An equivariant section of the quotient would send its basis to `alpha*x^2 + xy + beta*y^2`. Equivariance for the **formal** diagonal torus forces alpha=beta=0, by comparison of the three distinct monomial weights. But the upper unipotent element with `x -> x`, `y -> x+y` sends xy to x^2+xy. No algebraic equivariant section exists.

In contrast, x^2+xy+y^2 is fixed by all six elements of the finite group GL_2(F_2), and maps to the nonzero quotient vector. The restricted sequence **does split** as a representation of that finite point group. This is a particularly strong carrier regression: a point-group implementation can pass the underlying linear-algebra tests and still assert the wrong algebraic splitting result.

The exact Grothendieck relation [Sym^2 V]=[V^(1)]+[det] must be available. Do not justify it by an algebraic direct-sum decomposition. Nor should a decomposition-group isomorphism be described as identifying the simple representations one by one across characteristics.

## 6. Executed finite and symbolic checks

A local Python check was run in this continuation. It enumerated all 2x2 matrices over F_2 with determinant one, built the displayed Sym^2 matrices, and verified preservation of W, the determinant quotient, and the finite-point fixed vector. The torus comparison used exponent-indexed polynomial dictionaries, **not** evaluation at the sole F_2 torus point. It also tested the character aliases for p=2,3,5,7,11 and finite dominance intervals.

Observed output:

    GL2(F2): 6 matrices; stable Frobenius subspace and determinant quotient checked
    Finite-point splitting vector (1,1,1): fixed by all 6 matrices
    Formal-torus-compatible sections: 1; unipotent-compatible among them: 0
    Character alias tests: integral units and 5 prime fields checked
    Dominance interval bounds: 103 comparable pairs checked for n=1,2,3

The dominance enumeration used decreasing lambda-tuples with entries from -2 through 2, decreasing candidate mu-tuples with entries from -3 through 3, equality of totals and the prefix inequalities. It checked the finite-box conclusion on the 103 comparable pairs. The proof for all weights is section 4, not an extrapolation from this enumeration.

The essential F_2 test is reproducible with only Python's standard library:

```python
from itertools import product

def action(g):
    a, b, c, d = g
    return ((a*a % 2, a*b % 2, b*b % 2),
            (0, (a*d+b*c) % 2, 0),
            (c*c % 2, c*d % 2, d*d % 2))

def apply(A, v):
    return tuple(sum(a*x for a, x in zip(row, v)) % 2 for row in A)

G = [g for g in product(range(2), repeat=4)
     if (g[0]*g[3]-g[1]*g[2]) % 2 == 1]
assert len(G) == 6
for g in G:
    A = action(g)
    assert apply(A, (1,0,0))[1] == 0
    assert apply(A, (0,0,1))[1] == 0
    assert A[1][1] == 1
    assert apply(A, (1,1,1)) == (1,1,1)
assert apply(action((1,1,0,1)), (0,1,0)) == (1,1,0)
```

These are mathematical regression computations. They are not Lean compilation, a proof of highest-weight classification, or validation of the unchanged geometric signatures.

## 7. Library checks and exact reuse boundaries

Pins are unchanged:

- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`;
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Three Tau Ceti files were opened at that exact pin and their relevant statements and proofs read. These are new checked leads for integration; no baseline entries were added to the packet in this handoff-only change.

**Finite subcomodules.** `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean`, blob `c1b3100536435871eb13cb3c27cc81c0f3e6651f`, lines 1-310. The theorem `TauCeti.Subcomodule.exists_finite_subcomodule_mem` assumes `Module.Free R C`; its proof uses coalgebra-basis coefficients of the coaction, coassociativity and the counit. The same file already has `exists_finite_subcomodule_of_setFinite` and `exists_finite_subcomodule_of_fg`, under that same freeness hypothesis, and versions deducing these consequences from the elementwise hypothesis. Reuse these consequences rather than rebuilding directed finite hulls.

The distinction between free C and flat C must remain explicit. For an actual GL coordinate coalgebra, a separately proved freeness theorem would let one use this pinned result directly. Serre's big-cell argument is a source lead for that interface. Without it, use the flat-Noetherian argument of section 2 and route the missing generalization to the existing comodule owner. **Flatness alone is not a `Module.Free` instance.**

**The existing representation ring is split.** `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, blob `af618a02dede90fbb70450a9524294f70bf2bc3b`, lines 1-140. `TauCeti.repRing k G` abbreviates `SplitK0 (FDRep k G)` for a field and a monoid. Its character homomorphism has target the functions `G -> k`. This is useful existing infrastructure, but neither its exact structure nor its character codomain is the one required above. Do not define a new general Grothendieck group to avoid this distinction: instantiate the existing exact-K₀ infrastructure on the correct finite-free comodule exact category.

**The existing character-injectivity theorem has finite/characteristic-zero hypotheses.** `TauCeti/RepresentationTheory/RepresentationRing/Injective.lean`, blob `91cf3d7484c58a154b03d7630cb1283af60fc78b`. The full statement and proof of `TauCeti.repRingCharacter_injective` were read. In addition to a field and group, it requires `Finite G` and `CharZero k`. Its proof writes a split-K₀ class as a difference of representations and uses equality of ordinary characters to obtain an isomorphism. The actual statement does not require algebraic closedness. It does not supply the algebraic-group, integral, or positive-characteristic theorem.

Default-branch searches for highest-weight and comodule results were discovery only. They do not establish absence at the pins or justify importing characteristic-zero Lie-algebra statements as positive-characteristic algebraic-group classification.

## 8. Primary source access and attribution

The primary source for the reduction route is Jean-Pierre Serre, *Groupes de Grothendieck des schémas en groupes réductifs déployés*, Publications mathématiques de l'IHÉS 34 (1968), pp. 37-52, published NUMDAM scan:

<https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf>

This is the published article, not a different seminar pagination. The existing packet identifies it as `Serre.1968`. Its recorded source hash was **not independently rechecked**: no local byte copy was obtained here.

Read the parsed statements and proofs in §1.3-1.5, §2.2-2.7, and the character comparison in §3.6-3.7. The pertinent locators are the finite-hull result in §1.5; finite projective covers in §2.2; the exact-K₀ comparison in §2.3; the lattice quotient in §2.4; Euler reduction and its torsion cancellation in §2.5; and the principal-base comparison in §2.7. The arguments in sections 2-3 above specialize the base to Z and make the additivity and p-torsion calculations explicit. They do not claim that the source proves the missing highest-weight classification.

Rendered printed pp. 50 and 51 (PDF indices 14 and 15) were inspected, including the triangular-character argument and the two character/decomposition diagrams. Requests to render printed pp. 42-45 (indices 6-9) failed, including renewed attempts at indices 6 and 8; those proof passages were read from the parsed text and their algebra reconstructed above. No successful visual check of those failed pages is claimed. The exact four-term sequence in section 3 has its own algebraic verification and is not trusted merely to an OCR formula.

The typed character comparison written above follows the domains and codomains of the maps. No new source-error or novelty claim is made in this checkpoint. The packet's existing 19 source-issue records, their independent-review needs and the earlier authors' source-version evidence are unchanged; no author was contacted and no fresh errata audit is claimed.

## 9. Exact integration and validation boundary

The next integration should refine the proof of `Z.3/serre-representation-ring-theorem`, preserving that node's id and target. Suitable separate proof obligations are the finite free comodule resolution, Euler comparison and its additivity, the stable-lattice quotient, Euler reduction annihilating residue inclusions, decomposition-map naturality, the integral comparison, and finite dominance intervals. These are a worklist, **not already added node ids**. Reuse the owner's generic comodule and exact-K₀ results wherever they suffice.

For each introduced definition, put its actual carrier, universal property, coefficient/base-change API and at least three tests into the packet, reader and suggested file together. Sections 3 and 5 give essential negative tests: naïve reduction of F_p; the image rather than endomorphism interpretation of p:L -> pL; rational-point versus algebraic splitting; and ordinary trace versus integer weight multiplicity. Do not replace missing carriers by propositions that store the desired isomorphism.

The characteristic-zero supplier request to `RepresentationTheory/ClassicalGroups` layers 3-4 is not automatically sufficient for group-scheme representations over Q. Check its algebraic-group and descent scope. The positive-characteristic classification, and the appropriate exact comodule/base-change interfaces, still require verified supplier contracts. There is no new accepted owner request in this handoff. The abstract lambda algebra remains with its current owner; using the downstream projective-bundle splitting principle would reintroduce the recorded circular dependency.

Resume the previous handoff's exterior/determinant/line-power integration as well. Closing the integral proof paragraph alone does not close either of its two pending gaps or all of Z.5. Preserve the existing stage splits and elliptic specialization ownership.

**Checks in this continuation:** the finite/symbolic Python regressions in section 6 ran successfully. No local `scripts/check_blueprint.py`, global dependency-cycle check or pinned Lean compilation was run. The suggested file was not edited or compiled. The exact new-head Swarm submission result will be recorded in the pull-request conversation after it is observed; a handoff-only intake pass must not be described as a new full-packet or Lean check. All inherited implementation statuses remain unchanged and unchecked.

**Continuation boundary:** integrate this source proof and the prior immutable proof supplement into the three main deliverables, verify the free/flat coalgebra and exact-category interfaces, establish or route the remaining highest-weight classification at the required field scope, then validate and compile at the pins. No stage may be promoted solely from either handoff.
