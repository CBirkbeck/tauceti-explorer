# LLHLM23 continuation: affinoid topology and regular-map suppliers

Codex — codex-c83e7a, issue #1254, 23 September 2026. Claim comment5803076014 was confirmed by bot comment5803078481. Status **partial**: **652 items (120 library, 34 planned, 498 missing), 24 routes, 61 unreviewed source findings**. This pass adds44 items, preserves all608 inherited item IDs and all53 inherited findings, and changes11 inherited item objects. The current census supersedes earlier counts below. No Lean file was required or compiled; these are source-based proof plans, not new formalizations or independent review.

The full212-page main-paper reading remains attributed to the prior extraction. This pass freshly read the bounded published main-paper pages78–80 and the supplementary sources specified below. Earlier computational diagnostics remain historical and were not rerun.

## Strict-affinoid topology and completed products

L102–L109 import the pinned general closed-submodule theorem, finite-module topology completeness/Hausdorffness/strictness, the Tate open-mapping theorem, quotient norms, and the existing completed restricted-series carrier. Z81 compares its weight-one topology with the Gauss norm; it does not introduce a replacement Tate-algebra carrier. Z80 imports the existing upstream Noetherianity target. A discrete-topology strong-Noetherian instance cannot prove the valued-field theorem.

Z82 gives closed ideals in a Tate algebra, Z83 the complete quotient Banach topology, and Z105 closed ideals in its affinoid quotients. These include the zero quotient. The quotient norm uses arbitrarily close lifts; no norm-minimizing representative is claimed from the general Mathlib result.

For automatic continuity, Z84 proves finite-dimensionality of A/m^r through its graded pieces, without a coefficient-field section. Z85 proves joint separation by all maximal-ideal jets using Krull separation and the pinned localization detector L110. In Z86 the maps into these jets are continuous after factoring through a finite-dimensional Hausdorff quotient. Their closed kernels identify the graph; the open-mapping theorem gives continuity of its inverse first projection. Z87 then proves presentation independence and compatibility of successive quotients. Residue fields alone would not detect nilpotents.

Z88 identifies integral restricted series with the completion of O[X] at every finite quotient (O/π^r)[X]. Z89 identifies the kernel for a finite-type quotient with the actual extended ideal, using completion exactness and L112. Z90 uses a single coefficient denominator bound to identify the localized restricted series with K⟨X⟩; it does not commute an arbitrary localization with an inverse limit. Z91 computes the completed tensor product at every finite level, including the empty family O. Z55 now names these compatible factor maps and topologies, and Z56 uses the existing pinned tensor-injectivity input.

## Regularity and ownership corrections

The inherited Z77 absence claim was wrong: L12 already cites the pinned going-down height equality. Reading that declaration and the prime-localization dimension equality identifies the required local formula. Z77 is now a retained library alias of L12 and is removed from the missing route.

Z57 requires descent of a **regular ring map**, which includes flatness and geometrically regular fibres after finite field extension. Descent of regularity of the target ring alone is insufficient. Z93 supplies the map argument; Z94 compares completions of flat local maps with identical closed fibres via their finite graded quotients; Z95 gives the local criterion. Z25 already owns completion Noetherianity and is reused. Z78 now descends flatness of a syzygy in a resolution that started over the source ring. It does not pretend that a free resolution of the target residue field descends.

The owner search also found existing work: Z96 imports the same upstream ModularCurves §4D completion-regularity atom as Z23/Z28. Z100/Z101 import the R03.3 depth/projective-dimension node of DeformationAndDerivedPatchingAlgebra; Z103/Z104 are its parameter-system refinements. L119 records the already available projective-dimension formula for regular-sequence quotients. The projective-dimension and regular-sequence carriers are not missing.

The analytic suppliers reuse upstream AdicSpaces Layer0 and AdicSpacesPartII R0/F0. Generic ring and formal-fibre adapters retain the existing SchemeAndStackFoundations route. No new route or roadmap is introduced. Only foundational atoms are imported from upstream ModularCurves; the analytic proof does not depend on its modular application layers.

## Source findings and reading scope

All findings remain **unreviewed**. E54–E59 concern the author-hosted April2008 Münster Bosch notes and Conrad AWS notes: a generator index, a polynomial coefficient label, the missing nonzero-affinoid boundary for normalization/maximum attainment, the quotient by both relation ideals, an omitted initial coefficient, and a maximum-principle step whose product can contain zero factors. Each record gives the precise correction, a local reason or counterexample, downstream impact, and the bounded novelty search. The Bosch notes have not been equated with the2014 Springer printing, nor Conrad's author PDF with an independently checked AMS printing.

E60 concerns the characteristic-zero proof in Stacks07PV: a nonzero-prime formal fibre is not canonically a localization of the completed polynomial ring. With R=k[[t]], q=(t,x), r=(x), the completion is k[[t,x]] but the fibre k((t)) kills x. Z99 repairs this after inverting R minus zero: the nonzero-prime fibre is the quotient by a separable irreducible polynomial g, the extended d/dx sends g to g′, and the derivation criterion applies. This is a correction to a proof step, not a counterexample to G-ring stability. E61 changes the completion prime in the C-display of07PR from r (a prime of B) to q (the defined prime of C). Both current tag histories and comments were checked; no matching correction was identified in that bounded search.

Fresh supplementary reading: Bosch PDF10–12,17–27,30–33 (not28–29), with images11,24,27,30; Conrad PDF13,30,32 with image13. Their URLs, SHA-256 hashes and scope are in `source.continuationReadings`. All21 listed Stacks statements and complete **outer** proofs were read. The deeper depth/syzygy/projective-dimension suppliers of00O7/00OC, characteristic-p derivation/p-basis input of07PR, formal-smoothness input of07PU and full Cohen-structure reduction are not thereby audited recursively.

## Remaining work and validation

The analytic branch now has explicit maps and proof steps, but the paper is not closed. The named homological suppliers, finite-separable regularity base change, characteristic-p formal fibres, the other paper proof-leaf queues, item-level library audits and uniform integral Appendix B certificates remain open. Rational generic CAS computations do not prove all allowed characteristics and specializations.

Checks: paper validator and three-file intake pass; 652 unique IDs; all608 inherited IDs, sourceData and53 findings preserved; all164 definitions/constructions retain uses, APIs and at least three tests; every missing item occurs in exactly one route; all planned and route stages resolve; the577-edge internal graph is acyclic. Thirty freshly inspected library files match their exact pinned tree blobs. Atlas inputs were refreshed with no changes to the original tracked inputs, and the five owner READMEs were added to publication guards. No Lean compilation was performed.

## Added item index

| Items | Contribution |
| --- | --- |
| L102–L109 | General topological-module, open-mapping, quotient-norm and restricted-series imports |
| L110–L114 | Localization detection, finite-dimensional continuity, finite-module completion and finite-type imports |
| L115–L119 | Faithfully flat descent, regular polynomials, Noetherian descent and quotient projective dimension |
| Z80–Z87, Z105 | Tate/affinoid topology, finite jets, automatic continuity and presentation independence |
| Z88–Z91 | Integral restricted series, completed quotients, common denominators and completed tensors |
| Z92–Z99 | Local/ring-map regularity descent, completions, derivations and the corrected characteristic-zero fibre |
| Z100–Z104 | Existing homological suppliers and parameter-system quotient/sequence refinements |

## Attributed earlier report

The following text is retained as historical evidence, with its original attribution and contemporaneous counts. Current status and corrections are above.

# LLHLM23 continuation: split-place genericity and Hilbert–Samuel suppliers

Codex — codex-7e92bd, issue #1254, 23 September 2026. The bot confirmed claim comment5802518636 in comment5802521177. The extraction remains **partial**: **604 items (101 library,25 planned,478 missing),24 routes,53 unreviewed source findings**. All580 inherited item IDs and their sourceData are preserved. All164 definitions/constructions have use sites, an API and at least three typed tests. This is a source-based mathematical plan; no Lean file was requested or compiled and no new formalization or independent review is claimed.

This pass adds24 items: fifteen pinned imports L87–L101 and nine Hilbert–Samuel suppliers Z67–Z75. It changes seven inherited items, A70–A73 and Z64–Z66. The previous reports below remain as attributed history; their counts and the corresponding open genericity/Hilbert–Samuel statements are superseded here.

## Split-place genericity

A73 now states the actual hypotheses needed by the argument. LLHLM §9.1 fixes a CM extension F/F+, degree [F+:Q]>1, a unitary group compact at infinity, and an F-splitting G_F≅GL_n. Labesse’s comparison consequently supplies an actual intertwiner at a split finite place, including a ramified split place or a place over the coefficient prime. A general inner-form transfer would not by itself be such an intertwiner.

The Galois realization initially identifies the **semisimplification** of R⊗Kbar with the direct sum of the normalized positive-rank Speh constituents. A50 first makes R⊗Kbar irreducible using its absolutely irreducible residual lattice. Only then can one identify R with its semisimplification and invoke A62’s actual direct-sum argument. Positive ranks force exactly one summand, hence one block of length one; the algebraic normalization exponent in A79 is then zero.

The rest of A73 explicitly follows that same cuspidal representation: A70 gives a detecting global functional, A71/A107 select a detecting pure tensor at the chosen finite place, the split-place intertwiner transports it to sigma_v, and A72 keeps the functional unchanged under a determinant twist because the unipotent subgroup has determinant one. An abstract coefficient-field isomorphism transports **both the representation and its character**. The equivariance equation and nonvanishing survive algebraically; no continuity of the field isomorphism, archimedean globalization, finite-field descent or p-adic Hodge assertion follows.

While this claim was active, PR2495 was opened by cc-7b31c4 and became unmergeable. Its head `0d1387e3ce089383e0a74e0cd0961b19ed58d883` changes precisely A71/A72/A73 relative to the common580-item base. This pass compares those changes, preserves A71’s frozen-vector proof and A72’s identity-on-the-carrier proof with their added tests and original attribution, retains the A107 dependency, and strengthens A73 as above. The test about an abstract bijection has been narrowed: such a bijection preserves nonvanishing, although it does not identify the very same chosen functional. No other worker’s branch is modified.

## A bounded supplementary-source correction

E53 records the unqualified dimension assertion in Cogdell’s author-hosted Fields notes, printed32/PDF36, remark(ii). It cannot hold for every irreducible admissible representation: for the trivial representation of GL₂(R), the root Lie algebra acts by zero, whereas a nontrivial Whittaker character has nonzero derivative. Its Whittaker functional equation therefore forces the functional to vanish. The dimension is zero rather than2.

The record concerns that general reading of the **author notes**, not the unmatched published book or LLHLM’s own statement. It does not rule out a theorem with suitable generic/principal-series hypotheses. The author page and targeted errata searches yielded no identified correction; E53 remains unreviewed. A70 and the preserved A71 now justify their continuity boundary directly and no longer rely on a universal dimension formula. Their existence proofs do not need any dimension formula.

## The Hilbert–Samuel dependency chain

The pinned `Polynomial.hilbertPoly` computes eventual coefficients of a rational series p(T)/(1−T)^e, but its file explicitly leaves Hilbert polynomials of finite graded modules as future work. It does not already prove Hilbert–Serre or Hilbert–Samuel. L87 imports exactly the existing formula and uniqueness. The coefficient field used here is Q, receiving integral module lengths; the local ring and its residue field may have positive characteristic.

L88–L101 additionally import exact-sequence length additivity, surjective scalar restriction, vector-space length, Artin–Rees, the Noetherian dimension-zero criterion, minimal primes and prime avoidance, polynomial Noetherianity, homogeneous-piece finiteness, ideal-power generation, stars-and-bars, and finite-length/Artinian-module facts. Each actual declaration and its ambient hypotheses was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369` has a word-filtration associated graded; its increasing filtration is a different carrier from the descending ideal filtration needed here.

The new source nodes separate the remaining work:

| Item | Exact contribution |
| --- | --- |
| Z67 | gr_I(M) over gr_I(R), using quotient scalars R/I and no coefficient-ring section; finite homogeneous generator map, API and four tests |
| Z68 | Rational Hilbert series for finite graded modules over an Artinian coefficient ring, by induction on variables with the shifted kernel term |
| Z69 | Eventual cumulative Hilbert–Samuel polynomial, finite lengths and positivity |
| Z70 | The finite-colength squeeze with its correct index shift, preserving the positive-degree leading term |
| Z71 | Artin–Rees exact-sequence degree comparison, including a lower-degree defect and the finite-length-kernel case |
| Z72 | Independence of degree from the ideal of definition, without equality of multiplicities |
| Z73 | The parameter-number growth bound, with the empty-generator case separate |
| Z74 | Degree zero exactly when a nonzero finite module has finite length |
| Z75 | The finite free monomial basis and its rank, including the zero-variable boundary |

Z68’s proof uses the exact degreewise sequence for multiplication by the final variable x. If K=ker(x) has its unshifted grading and C=N/xN, the generating-series identity is

`(1−T) H_N(T) = H_C(T) − T H_K(T)`.

The T on the kernel term is essential. For N=k[T]/T^q, it gives numerator1−T^q. After this identity has produced a rational series, L87 supplies the eventual polynomial. The finite-length specialization here is sufficient for R/I; R09.1 keeps ownership of the wider Noetherian and coherent-sheaf versions.

Z71 also keeps a necessary defect. For the exact sequence given by multiplication by t on k[[t]], the two free modules both have cumulative polynomial n+1, and the residue-field quotient has polynomial1. Their defect is−1, of smaller degree. Exact additivity of the three Hilbert–Samuel polynomials would be false. Artin–Rees supplies the shifted intersection filtration from which the actual degree statement follows.

Z64 now assembles a complete mathematical proof of degree=dimension. It first inducts on the polynomial degree and a prime chain, passes to a domain quotient, and uses injective multiplication by a nonzero element to lower the degree. It then constructs at most dim(R) parameters by avoiding finitely many minimal primes, applies the monomial growth bound, and changes back to the maximal ideal. Degree zero and zero modules are handled explicitly. Taking a finite difference proves the graded-piece degree statement; at dimension zero the graded pieces eventually vanish. Z65 imports the monomial-rank and length suppliers, while Z66 specializes the single construction Z67.

## Shared ownership and remaining work

The full R09.1 description includes Hilbert polynomials in the Noetherian setting. Its reviewed AUDIT-01 entry specifically identifies Hilbert–Serre for finite graded modules as the missing part. **New source route24** therefore sends planned Z68/Z75 to `AlgebraicModuliForArithmeticGeometry:R09.1`. Route7 sends only the seven new local adapters to `SchemeAndStackFoundations:SF.4`. The cross-owner requests name their exact statements and consumers. The atlas and its sole current packet contain no finer supplying node. No new roadmap or duplicate Hilbert-polynomial owner is proposed.

This closes the previously unnamed Hilbert–Samuel premises at the mathematical-proof-plan level. The extraction is still partial because regular-map descent, finite-type G-ring stability/formal fibers, the flat local dimension formula, affinoid presentation topology, remaining bundled source results and proof leaves, full item-by-item ownership/declaration audit, and the uniform Appendix B certificates still need work. The global Fourier/Haar/globalization/Flath suppliers are named imports at A104–A107; this continuation does not implement their owners’ theorems.

## Evidence and validation

The already attributed full main-paper reading is retained. Fresh bounded reads covered the hash-matched published PDF180–181 and196–198; Labesse PDF1–2 and42–44; and Cogdell Fields PDF35–37. The Labesse PDF hash is `c85a0fde13266e3ed6c76d34330b4c51023376f8fe25406da0370fa47c5a45d2`; the Fields-notes hash is `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`. The Fields PDF page offset is4.

The statements and full relevant proofs of Stacks tags00K0,00K1,00K3,00K6,00K8,00KB,00KC,00KI,00KQ,00NO,00JZ,00JD, example00K2 and full section00K4 were read. The result stores dated URLs and SHA-256 hashes for all14 captured pages. The proof of Z68 is the stated kernel/cokernel specialization, rather than an assertion that Mathlib implements the full source theorem.

The mathematical regression checks passed:480 independently enumerated homogeneous hypersurface-quotient counts,480 cumulative counts,30 degree/leading-coefficient checks,1078 finite-colength inequalities,80 nonzero bilinear functional cases and4 character transports. Additional checks cover a nonprincipal Artinian quotient of length4, the shifted kernel for14 nilpotent examples, and the nonzero exact-sequence defect. These finite checks catch convention and indexing errors; they are not proofs of the general statements.

The paper checker and intake file checks pass. The604-item dependency graph is acyclic; all478 missing items are routed exactly once; all25 planned items and24 route stages resolve. All164 definitions/constructions retain uses, API and three or more typed tests. Baseline source trees are clean at the required pins. Only the result, report and handoff are submitted.

---

The prior report follows with its original worker attributions. Its current-status counters are historical.


# LLHLM23 continuation: residual recognition and coefficient topology

Codex — codex-hjdg0j, issue #1254, 23 September 2026. Claim5801479550 was confirmed by bot comment5801482105, and the whole issue was reread. Base main: `713360d7f9daf3804fda79874399973194dc9f19`.

**Partial:576 items (86 library,23 planned,467 missing),21 routes,52 unreviewed source findings.** All565 inherited IDs and their source data are preserved. All163 definitions/constructions retain their uses, APIs and at least three typed tests. This continuation adds A98–A103 and L82–L86, and updates A46–A49/A77. The historical report below retains its original attribution; its census and open residual/topology statements are superseded here.

The new proof chain has three parts. A98–A99 prove polynomial recognition in arbitrary characteristic using a finite-dimensional image algebra, cancellation of common simple factors, and repeated division of remaining multiplicities by p. A100–A101 apply existing Chebotarev to both places above good split primes and upgrade a simple residual semisimplification to the actual representation. A102–A103 supply finite-module topology and closedness of the integral trace ring. No formal implementation or independent review is claimed.

## Recognition in positive characteristic

A98 applies existing Mathlib radical annihilation and Artin–Wedderburn to the image of the group algebra on a finite sum of pairwise inequivalent simple representations. The group itself may be infinite. A matrix unit in a single block has trace1 on its simple module and0 on the others. This proves independence in every characteristic. Using a central idempotent instead would give the dimension, which may vanish modulo p. The pinned Tau Ceti character-pairing theorem requires a finite group of invertible order and does not supply this modular argument.

A99 reuses the existing IHG.1 reconstruction target. After cancelling common composition factors, equal traces force all remaining multiplicities to be divisible by p. The characteristic polynomials are then pth powers; injectivity of Frobenius on k[T] gives equality for the modules with multiplicities divided by p. Induction on dimension finishes. Only the trace identity is extended linearly to the group algebra. The proof does not assume that characteristic polynomials are linear in the group element, or that a chosen generating set spans that algebra.

A101 reuses AGR R01.5. A representation with a simple semisimplification already has composition length one. Thus absolute irreducibility on one side recovers an actual residual isomorphism, as required before A47's polarized alignment. The finitely many entries of an intertwiner over the algebraic closure of a finite field descend to a finite extension. This recognition works in characteristic2; the later polarized square-root step retains its separate p>2 hypothesis. A77's mistaken reference to A50 as residual recognition is corrected: A50 lifts irreducibility to characteristic zero.

## The split-prime and topology hypotheses

For A100, a basic open coset in G_F is tested in a finite extension L/F+ normal over the quadratic base. Chebotarev supplies the class of an element in Gal(L/F), so the base prime splits in F. Choose a prime of L whose Frobenius equals the desired element and contract it to one of the two places w of F. The residue degree is1, so the tower formula introduces no power. This proves density of the G_F-conjugacy saturation with arbitrary finite exceptions removed.

Both split places matter. In S3, the conjugacy class of a 3-cycle splits into two distinct classes in A3. A single arbitrarily chosen place above every split base prime can select only one of them. A100 therefore neither discards the second place nor asserts density of individual chosen representatives without conjugation. It imports existing Chebotarev Layer10; no new density theorem is planned.

A102 identifies the pi-adic topology of a finite O-module M with the quotient topology of every finite presentation O^r→M, using q(pi^a O^r)=pi^a M. It works for torsion modules. Pinned Krull separation and finite-module completion give separation and completeness; the pinned compact-DVR criterion gives compactness. For a nonzero finite local O-algebra T, the maximal ideal of T/pi T is nilpotent by finite-length stabilization and Nakayama. Hence for some d≥1,

```
m^(da) ⊂ pi^a T ⊂ m^a  (a≥0).
```

A103 proves that an injective O-algebra map from finite T into a Hausdorff topological O-algebra is continuous: compose with O^r→T and express it as a finite linear combination. Compactness then makes it a closed embedding. This supplies the exact closed trace-ring hypothesis of A49 and the intrinsic-versus-subspace topology for A46/A48. General coefficient topology stays with DeformationAndDerivedPatchingAlgebra:R03.1; the integral trace-ring application stays with IHG.2.

## Reading scope and source finding

Fresh reading covers [CHT's author manuscript](https://virtualmath1.stanford.edu/~rltaylor/twugfin.pdf), PDF107–108, and [Wiese's Galois Representations](https://math.uni.lu/~wiese/notes/GalRep.pdf), version13 February2012, printed/PDF34–37. PDF37 was also read as an image. Hashes and the exact bounded scope are recorded in JSON. The inherited complete main-paper reading is preserved with its earlier attribution. Wiese's arbitrary-field scalar-extension proof is not certified by this continuation; A98–A99 give the algebraically closed version actually consumed.

E52 records a false generator-only variant in Wiese Remark2.4.7(iv). Over C, put G=C2*C2 and

```
rho_a(s) = diag(1,−1),
rho_a(t) = [[a,1],[1−a²,−a]],  a=0,2.
```

Both generators are involutions with the same eigenvalues. Both representations are irreducible because neither coordinate axis is invariant under t. Every power of each generator has the same trace in both representations, while the traces of st are0 and4. Thus even semisimple recognition cannot use only powers of the chosen generators. The current author PDF, notes index, course page and targeted correction searches yielded no dedicated correction. This is an unreviewed finding about the supplementary source; it does not contradict the all-element Brauer–Nesbitt theorem used here. All51 inherited findings remain unchanged.

## Validation and remaining work

Paper checker and intake pass. All565 inherited IDs preserved among576 unique items;407 internal prerequisite edges are acyclic; supplier stages resolve; all467 missing items have exactly one route;163 definition/construction APIs and typed tests remain complete;51 inherited findings and sourceData unchanged; exact three-file archive scope; all three deliverables unchanged on refreshed main.

Exact diagnostics check E52,91 semisimple C2 representations in characteristic3 (55 trace collisions but distinct characteristic-polynomial classes), the nonsemisimple C3 boundary, S3/A3 class splitting, and finite dual-number/congruence-ring topology boundaries at p=2,3,5. These are finite diagnostics, not proofs of the infinite or topological theorems. Six Mathlib files were byte-verified against the full pinned commit. No Lean file was requested, produced or compiled.

Remaining work starts with compact additive-character duality/Fourier uniqueness, compatible quotient Haar/Fubini, smooth-globalization continuity and finite-place Flath factorization for A66–A73. Analytic regularity, approximation/tensor adapters, other proof leaves, the fine item audit/shared ownership and uniform Appendix B specialization certificates remain explicit gaps. This continuation does not certify the whole extraction as complete.

## New supplier statements and proof plans

### L82. Compactness of finite modules and finitely generated submodules

Let R be a compact commutative semiring and M a topological R-module with continuous addition and scalar multiplication. Every finitely generated R-submodule N⊂M is compact. In particular a module-finite M is compact. If M is Hausdorff, such N is closed. These statements do not require M to be free or torsionfree.

Source: Mathlib/Topology/Algebra/Module/Compact.lean:24; Mathlib/Topology/Algebra/Module/Compact.lean:40 at 082e2d37e8b0463410cdb532e111cd43d5a66174 Status: library.

Pinned imports: `mathlib:Submodule.isCompact_of_fg`, `mathlib:Module.Finite.compactSpace`.

### L83. Compactness criterion for a rank-one valuation ring

For a field K with a rank-one valuation, its valuation ring O is compact if and only if O is complete, is a discrete valuation ring, and has finite residue field. Use the valuation topology, not an arbitrary topology on the underlying ring.

Source: Mathlib/Topology/Algebra/Valued/LocallyCompact.lean:315 at 082e2d37e8b0463410cdb532e111cd43d5a66174 Status: library.

Pinned imports: `mathlib:Valued.integer.compactSpace_iff_completeSpace_and_isDiscreteValuationRing_and_finite_residueField`.

### L84. Finite-dimensional split semisimple algebras are products of matrices

A finite-dimensional semisimple algebra B over an algebraically closed field k is k-algebra isomorphic to a finite product of matrix algebras M_(d_i)(k), with every d_i nonzero. No characteristic-zero or group-order invertibility hypothesis is present.

Source: Mathlib/RingTheory/SimpleModule/IsAlgClosed.lean:33 at 082e2d37e8b0463410cdb532e111cd43d5a66174 Status: library.

Pinned imports: `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`.

### L85. Radical annihilation and Artinian semisimplicity

The Jacobson radical of an arbitrary ring B annihilates every semisimple B-module. For an Artinian ring B, B is semisimple if and only if its Jacobson radical is zero. Thus the finite-dimensional image algebra acting faithfully on a semisimple module is semisimple.

Source: Mathlib/RingTheory/Jacobson/Semiprimary.lean:44; Mathlib/RingTheory/Artinian/Module.lean:650 at 082e2d37e8b0463410cdb532e111cd43d5a66174 Status: library.

Pinned imports: `mathlib:IsSemisimpleModule.jacobson_le_annihilator`, `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson`.

### L86. Compact-to-Hausdorff embeddings and quotient maps

A continuous injective map from a compact space to a Hausdorff space is a closed embedding. A continuous surjective map between such spaces is a quotient map. These results retain the given topologies.

Source: Mathlib/Topology/Separation/Hausdorff.lean:677; Mathlib/Topology/Separation/Hausdorff.lean:683 at 082e2d37e8b0463410cdb532e111cd43d5a66174 Status: library.

Pinned imports: `mathlib:Continuous.isClosedEmbedding`, `mathlib:Topology.IsQuotientMap.of_surjective_continuous`.

### A98. Independence of simple characters for an arbitrary group

Let k be algebraically closed, G any group, and S_1,…,S_r pairwise nonisomorphic nonzero finite-dimensional simple k[G]-modules. Their k-valued trace characters on G are k-linearly independent, in every characteristic. G need not be finite.

Source: Wiese, Galois Representations (13 February 2012), Theorem2.4.4 and Remark2.4.2(i), printed/PDF34–35; explicit arbitrary-group image-algebra specialization. Status: missing.

1. Let V be the direct sum of the S_i and B the image of k[G] in End_k(V). This is finite-dimensional, acts faithfully, and V is semisimple over B because B-invariant and G-invariant subspaces agree. L85 makes B semisimple.
2. Apply L84. The simple B-modules are the column modules of its matrix blocks. Distinct S_i occupy different blocks. For a chosen i, take a matrix unit E_11 in its block and zero in all other blocks, and lift this element to k[G]. Its trace on S_i is 1 and on every other S_j is 0.
3. A linear relation among characters on G extends linearly to k[G], since group elements span that algebra. Evaluating at these lifted matrix units kills each coefficient. This uses trace 1 on E_11, not trace dim(S_i) on the central idempotent, which may vanish in characteristic p.

Planning tests:

- A98.modular_dimension (non-example): In characteristic p, the identity of M_p(k) has trace0 while E_11 has trace1; central idempotents alone cannot perform this separation.
- A98.infinite_group (compatibility): The argument applies to the infinite cyclic group with distinct one-dimensional characters; no finite-group orthogonality or division by |G| is used.
- A98.repeated_simple (non-example): Two copies of the same simple module have the same character; pairwise nonisomorphism is required.

### A99. Brauer–Nesbitt by cancellation and division of multiplicities

Let k be algebraically closed, G any group, and V,W finite-dimensional k[G]-modules. If det(T−g|V)=det(T−g|W) for every g∈G, then V and W have isomorphic semisimplifications. If both are semisimple they are isomorphic. This holds in every characteristic and imposes no bound on dimension.

Source: Wiese Theorem2.4.6, printed/PDF36, cancellation and p-divisibility proof, and Remark2.4.7(iii), PDF37; algebraically closed group version. Do not use the generator-only assertion in Remark2.4.7(iv); E52. Status: planned.

Existing owner: IntegralHeckeAndGaloisDeterminants:IHG.1.

1. Pass to composition factors: a basis adapted to a composition series makes every operator block upper triangular, so its characteristic polynomial is the product of the factor polynomials. Cancel common simple summands using that k[T] is an integral domain. The remaining semisimple modules have disjoint simple supports and equal characteristic polynomials at every g.
2. Equal characteristic polynomials give equal traces. A98 shows that the multiplicity of each remaining simple factor is zero as an element of k. In characteristic zero the multiplicities are zero integers, finishing the proof.
3. In characteristic p>0 every remaining multiplicity is divisible by p. Write V=V_1^(⊕p), W=W_1^(⊕p). Their characteristic polynomials satisfy P_(V_1,g)^p=P_(W_1,g)^p for every g. In k[T], (P−Q)^p=0 implies P=Q, so the smaller modules again satisfy the same hypothesis.
4. Use strong induction on the common dimension after cancellation: division by p strictly decreases every positive dimension. Hence the disjoint remainders are zero. At no point is equality of characteristic polynomials extended by linearity from G to its group algebra; only equality of traces is extended. Only semisimplification is recovered.

Planning tests:

- A99.trace_loss (non-example): For G=C2 in characteristic3, 1^(⊕3) and sign^(⊕3) both have identically zero trace, but at the nontrivial element their polynomials are T^3−1 and T^3+1. Trace equality is insufficient.
- A99.extension_loss (non-example): For G=C_p in characteristic p, a nontrivial two-dimensional unipotent Jordan block and the two-dimensional trivial action have identical characteristic polynomials at every element; their semisimplifications agree but the representations need not.
- A99.zero_rank (degenerate): The zero-dimensional representation has polynomial1 at the identity. Equality forces the other dimension to be zero.
- A99.generators_do_not_span (non-example): E52 gives two irreducible representations of C2*C2 with identical polynomials for all powers of each chosen generator but different trace on their product. All group elements, or a spanning subset of the image of the group algebra, are required.

### A100. Frobenius classes above split primes are conjugacy-dense

Let F/F+ be a quadratic extension of number fields, S a finite set of finite places of F+, and G_F⊂G_(F+) the absolute Galois groups in a common closure. Let C contain Frobenius lifts for both places w of F above every v∉S that splits in F, with each lift taken using a decomposition group. The G_F-conjugacy saturation of C is dense in G_F. In a quotient unramified outside S one may use Frobenius classes directly. Both arithmetic and geometric conventions work after simultaneous inversion.

Source: CHT Proposition3.4.4 proof, author PDF107–108, split-prime polynomial input; explicit application of existing Chebotarev Layer10 and the residue-degree-one tower law. Status: missing.

1. To hit a basic open coset gU in G_F, shrink the open normal subgroup U of G_F to U∩cUc^(−1), for a lift c of the nontrivial quadratic automorphism. It is normal in G_(F+): c² lies in G_F. Let L be its fixed field. Then L/F+ is finite Galois and contains F.
2. Apply the existing Chebotarev infinitude theorem to the conjugacy class of the image of g in Gal(L/F+), excluding S and the finitely many primes ramified in L. Its restriction to F is trivial, so the resulting base prime v splits in F.
3. Choose a prime of L above v whose Frobenius is exactly the selected image of g, using conjugation of primes above v. Its contraction w to F is one of the two split places. Because f(w/v)=1, the Frobenius in L/F equals the Frobenius in L/F+, with no additional power. A representative from C for this w is G_F-conjugate to it modulo U; every Frobenius lift has the same image because L is unramified at v.
4. Thus the G_F-conjugacy saturation meets gU. This does not assert that arbitrarily selected individual representatives themselves form a dense set. Inversion carries the arithmetic statement to the geometric one, and exclusion of any further finite set is built into Chebotarev infinitude.

Planning tests:

- A100.two_split_places (non-example): In the finite quotient S3 with index-two subgroup A3, the S3 class of a 3-cycle contains g and g^(−1), but these are different A3 classes. One arbitrarily chosen place over every split base prime can select only one class; retaining both places avoids the loss.
- A100.inert_places (non-example): Frobenius of a base prime inert in F restricts nontrivially to Gal(F/F+); it cannot replace the kernel-class argument.
- A100.orientation (compatibility): In A3 the two nonidentity classes are interchanged by inversion. Geometric Frobenius requires inverting the class as well as the cyclotomic convention.

### A101. Residual recognition gives an actual isomorphism when one side is absolutely irreducible

Let F/F+ and S be as in A100. Let rho_1,rho_2:G_F→GL_n(kbar) be continuous with kbar an algebraic closure of a finite field carrying the discrete topology, unramified above every split v∉S. If their characteristic polynomials agree at both w above each such v, their semisimplifications over kbar are isomorphic. If rho_1 is absolutely irreducible, rho_2 itself is isomorphic to rho_1. If both are originally over finite coefficient fields, the conjugating matrix is defined over a common finite extension; no descent to a smaller field is asserted.

Source: CHT Proposition3.4.4, author PDF107–108, implicit residual recognition before Lemma2.1.4; Wiese Corollary2.4.8 PDF37 and the explicit absolutely irreducible upgrade. Status: planned.

Existing owner: ArithmeticGaloisRepresentations:R01.5.

1. For each coefficient, its equality set is closed, since the representations are continuous and the coefficient field is Hausdorff discrete. It is conjugation invariant and contains C. A100 therefore extends equality to every element of G_F.
2. Apply A99 over kbar. If one semisimplification is the single simple module rho_1, the other module has composition length one, so it is already simple and isomorphic, without a separate semisimplicity assumption on the chosen lattice reduction.
3. An intertwining matrix has finitely many entries algebraic over the common finite field; they generate a finite extension. Its determinant is nonzero there. In A47 this produces the actual residual GL_n isomorphism before the polarized square-class alignment; p>2 is needed by that later polarized step, not by this recognition argument.

Planning tests:

- A101.unipotent_boundary (non-example): A reducible semisimplification cannot upgrade to an isomorphism of original modules: the C_p Jordan-block example in A99 remains a counterexample.
- A101.rank_one (degenerate): For n=1 characteristic polynomial equality gives equality of the characters on the dense Frobenius set and then on all of G_F.
- A101.no_small_prime_exclusion (compatibility): The recognition step remains valid in characteristic2; only the later polarized square-root statements retain their p>2 hypothesis.

### A102. Finite modules over complete coefficient DVRs have the expected topology

Let O be a complete DVR with finite residue field and uniformizer pi, equipped with its valuation topology. For every finite O-module M, the pi-adic topology is Hausdorff, compact and complete and equals the quotient topology for every O-linear surjection O^r→M. Every O-linear map between finite such modules is continuous. If T is a nonzero finite local O-algebra with maximal ideal m, its pi-adic and m-adic topologies coincide, so T is a complete Noetherian local ring. T and M may have O-torsion.

Source: CHT Proposition3.4.4 author PDF108 and A46/A48 coefficient-ring topology; explicit finite-module adapter to pinned L03/L07/L83. Status: missing.

1. Choose finite generators and q:O^r→M. For every a≥0, q(pi^a O^r)=pi^a M. These submodules are neighborhood bases and q is surjective, continuous and open for the pi-adic topology, proving precisely the quotient-topology assertion.
2. L03 gives separation because M is finite over the Noetherian local ring O. L07 identifies its completion with O-hat tensor_O M=M; thus completeness is inherited from O. L83 makes O compact, so M is compact as a continuous image of O^r. An O-linear f maps pi^a M into pi^a N, proving continuity directly; no unverified module-topology instance is needed.
3. T is Noetherian because it is finite over O. The element pi is not a unit in a nonzero finite O-algebra: otherwise pi T=T and Nakayama over O gives T=0. Hence pi∈m. The finite-dimensional local k-algebra T/pi T is Artinian. The descending powers of its maximal ideal stabilize, and Nakayama for that stabilized finite module forces it to vanish. Thus m^d⊂pi T for some d≥1.
4. Taking a-th powers yields m^(da)⊂pi^a T⊂m^a for every a≥0. The two topologies therefore coincide. This also applies to the common-residue ring A46 and to T in A48. Finite residue is used for compactness, not for the displayed cofinality inclusions or finite-module completeness.

Planning tests:

- A102.torsion (computation): M=O/(pi^2) has the finite discrete topology and is complete; freeness is unnecessary.
- A102.dual_numbers (computation): For T=O[e]/(e^2), m=(pi,e) and m^2⊂pi T; in general m^a is not equal to pi^a T.
- A102.infinite_residue (non-example): For O=C[[t]], O is complete and separated but not compact: its continuous residue quotient is the infinite discrete field C. Compactness requires the finite residue hypothesis.
- A102.embedding_not_open (non-example): The diagonal O→O×O is a closed embedding but not an open map. The quotient-map assertion above is for surjections.

### A103. Finite integral Hecke algebras are closed in their coefficient products

Let O be as in A102 and T a finite O-algebra with its pi-adic topology. Let A be a Hausdorff topological O-algebra with continuous addition and scalar multiplication, and j:T→A an injective O-algebra map. Then j is continuous and a closed embedding. Equivalently, a finite O-subalgebra of such A is closed. If A is the finite coefficient product or the common-residue subring in A46, its intrinsic coefficient topology agrees with the induced topology.

Source: CHT Proposition3.4.4 author PDF108, closed integral trace-ring step; explicit finite-O coefficient adapter. Status: missing.

1. Write T as a quotient of O^r using finite generators t_i. The composite O^r→A is (a_i)↦sum a_i j(t_i), hence continuous by finite sums and scalar continuity. A102 identifies the topology on T with the quotient topology, so j is continuous.
2. A102 makes T compact. L86 applied to j gives the closed embedding. Alternatively view j(T) as a finitely generated O-submodule of A and apply L82, then compact sets are closed in a Hausdorff space.
3. For A46, the finite O-module congruence subring has its pi-adic topology and the injective coordinate map into the Hausdorff product. This argument identifies that topology with the subspace topology. Combining A102 with its explicit unit criterion gives the m-adic topology required by A45/A48.

Planning tests:

- A103.proper_congruence_ring (computation): T={(x,y)∈O²:x≡y mod pi} is closed in O² and has the induced topology, although it is not the full product.
- A103.hausdorff_required (non-example): The injective identity from compact O with its valuation topology to the same ring with indiscrete topology is continuous but is not an embedding; the target Hausdorff hypothesis matters.
- A103.finite_generation_required (non-example): The prime subring Z⊂Z_p is dense and proper, so an arbitrary subring need not be closed. It is not a finite Z_p-submodule.

## Reproducible finite diagnostics

```python
import itertools,json
import sympy as s
from pathlib import Path
T=s.symbols('T');ans={}
# Source finding E52: exact irreducible pair, all generator powers follow from involutivity.
S=s.diag(1,-1); mats=[s.Matrix([[a,1],[1-a*a,-a]])for a in [0,2]]
for B in mats:
 assert B*B==s.eye(2) and B.charpoly(T).as_expr()==T*T-1
 assert B[0,1]!=0 and B[1,0]!=0
assert [(S*B).trace()for B in mats]==[0,4]
ans['E52']='PASS: two irreducible C2*C2 representations; both generators involutions; product traces0/4'
# Exhaust all semisimple C2 multiplicities over F3 through dimension12.
cases=0;collisions=0
for n in range(13):
 polys={};traces={}
 for a in range(n+1):
  b=n-a;poly=tuple(s.Poly((T-1)**a*(T+1)**b,T,modulus=3).all_coeffs())
  assert poly not in polys;polys[poly]=(a,b)
  tr=(n%3,(a-b)%3)
  collisions+=tr in traces;traces[tr]=(a,b);cases+=1
ans['C2_modular_recognition']={'representations':cases,'distinct_polynomial_classes':cases,'trace_collisions':collisions}
assert s.Poly((T-1)**3,T,modulus=3)!=s.Poly((T+1)**3,T,modulus=3)
# Nonsemisimple boundary: nontrivial C3 Jordan representation vs trivial2.
J=s.Matrix([[1,1],[0,1]])
for a in range(3):assert s.Poly((J**a).charpoly(T).as_expr(),T,modulus=3)==s.Poly((T-1)**2,T,modulus=3)
assert J!=s.eye(2)
ans['nonsemisimple_boundary']='PASS: equal polynomials for every C3 element, unequal actions'
# Normal-subgroup conjugacy loss in S3.
group=list(itertools.permutations(range(3)))
def mul(g,h):return tuple(g[h[i]]for i in range(3))
def inv(g):return tuple(g.index(i)for i in range(3))
def cl(g,G):return {mul(mul(h,g),inv(h))for h in G}
e=(0,1,2);g=(1,2,0);a3=[e,g,mul(g,g)]
assert len(cl(g,group))==2 and len(cl(g,a3))==1
assert cl(g,group)=={g,inv(g)}
ans['split_place_classes']='PASS: one S3 class contains two distinct A3 classes'
# Finite-quotient topology diagnostics: nilpotent dual numbers and proper congruence subrings.
count=0
for prime in [2,3,5]:
 q=prime**3;elts=list(itertools.product(range(q),repeat=2))
 m=[a for a in elts if a[0]%prime==0]
 for x in m:
  for y in m:
   z=(x[0]*y[0]%q,(x[0]*y[1]+x[1]*y[0])%q)
   assert z[0]%prime==0 and z[1]%prime==0;count+=1
 assert (0,1)in m and 1%prime!=0
 ring=[a for a in elts if (a[0]-a[1])%prime==0]
 assert (1,0)not in ring
 for x in ring[:30]:
  for y in ring[:30]:
   z=(x[0]*y[0]%q,x[1]*y[1]%q);assert z in ring
ans['finite_topology_boundaries']={'dual_number_products_checked':count,'prime_cases':[2,3,5],'status':'PASS; finite diagnostics only, not a proof of compactness'}
print(json.dumps(ans,indent=2))
```

---

## Historical report from the preceding continuation

The following report retains its attribution. Its census and open residual/topology obligations are historical.

# LLHLM23 continuation: integral polarizations and trace descent

Codex — codex-7e92bd, issue #1254, 23 September 2026. Claim5800991144 was confirmed by the bot. Input: merged main `f33e882562816872c8815d93b9e8fc3a6b499a83`.

**Partial:565 items (81 library,21 planned,463 missing),21 routes,51 unreviewed source findings.** All163 definitions/constructions have uses, API outlines and at least three typed tests. This continuation adds A86–A97 and L77–L81 and refines A38–A44. It supplies proof plans and exact library imports; no new Lean implementation or independent review is claimed. The earlier report below is retained as history; its census and unresolved lattice/descent statements are superseded here.

## A single explicit ramified self-dual lattice

A86 imports the compact-image stable-lattice target already owned by ArithmeticGaloisRepresentations:R01.1. Compactness bounds all translates of a basis lattice; their span is finite over the DVR. The multiplier is a unit because its valuation has compact subgroup image in Z.

A87 uses Mathlib's existing `LinearMap.BilinForm.dualSubmodule`, with no duplicate carrier. Write `P=L*`. The polarization identity and a unit multiplier make P stable. The asymmetry identity `B(x,T y)=c B(y,x)`, with `T L=L` and c a unit, identifies the two opposite-form duals. This is what gives `P*=L`; a general nonsymmetric bilinear form does not have same-form double duality on every lattice. L80 records the actual pinned opposite-form theorems.

A88 replaces the compressed maximality step by an exponent argument. Choose a maximal stable integral lattice between an initial integral L₀ and L₀*. The interval has finite length. Let m be least with `π^m P⊂L`. If m≥2, then

```
N = L + π^(m−1) P
```

is a strictly larger stable integral lattice: the cross terms are integral, and `π^m B(P,P)⊂O` while `2m−2≥m`. Thus `πP⊂L`. No semisimplicity supplier or allegation of a source error is needed.

A89 imports the existing LocalFieldsRamification Layer3 Eisenstein and power-basis valuation targets. For `Π²=π`, the coefficient extension has `O′=O⊕ΠO`. The two summands in `a+Πb` have different valuation parity, so integrality is equivalent to a,b∈O. This includes residue characteristic two.

A90 constructs

```
M = L ⊕ ΠP = O′L + ΠO′P  ⊂  V⊗K K′.
```

It is an O′-module because `Π(a+Πb)=πb+Πa` and `πP⊂L⊂P`. For `x=a+Πb∈M*`, testing against L gives a,b∈P; testing against ΠP gives a∈L and πb∈L. The latter follows from b∈P. Hence `M*=M`. Its API records membership, the uniformizer action, stability, duality and transport by equivariant isometries. Tests include a nontrivial rank-one defect, the already-unimodular case, Q₂(√2), and failure without `πP⊂L`.

A38 now applies this construction. If Δ has index two, a basis of M makes both action and pairing integral and unimodular. If Δ=Γ, there is no nonidentity-coset pairing; an ordinary stable lattice and unit multiplier suffice. The locator is corrected to author PDF11–12, including the actual lattice proof on PDF12.

## Continuous trace descent with the prescribed congruence

The pinned Tau Ceti Burnside theorem L78 applies to **arbitrary monoids**, not just finite groups. A91 descends its algebraically closed field statement to an absolutely irreducible representation over any field by matrix rank and minors. A92 lifts a residual family of n² group matrices to a basis over a local ring: its coordinate determinant is a unit. Commutation with this basis is commutation with every matrix unit, proving A39's scalar-centralizer claim without an inverse-limit argument.

L79 is Mathlib's full-matrix trace separation theorem. It remains valid when the residue characteristic divides n; no assertion about the trace-zero subspace is made. A42's dual-number argument now explicitly imports A91 and L79 before applying the existing inner-derivation atom A41.

For A43, A95 builds the finite free S-algebra spanned by the chosen group matrices inside M_n(R). The trace Gram matrix is invertible over S. Its inverse expresses every group matrix, and every product of basis matrices, with coefficients in S. If the representation is S-valued modulo I and `J=I∩S`, the same coordinates prove

```
A∩M_n(I) = JA,           A/JA ≃ M_n(S/J).
```

No flatness of S→R is assumed.

A93 supplies a compatible idempotent lift in a finite free complete S-algebra. For a lift a of an idempotent, iterate `a↦3a²−2a³`. With `q=a²−a`, the change is `−(2a−1)q` and the new error is `q²(4a²−4a−3)`. These polynomial identities apply in a noncommutative algebra because the iterates are polynomials in one element. Existing adic completeness L27 gives a coordinatewise limit; Krull separation L03 on the appropriate quotient keeps the required congruence. There is no assumption that 2 is invertible.

A94 lifts E₁₁ through A93 and uses the column module Ae. This is a finite projective direct summand, hence free by pinned L81. Lifting the prescribed column basis gives an algebra isomorphism `A≃M_n(S)` agreeing with the given one modulo J. A96 makes the resulting automorphism over R strictly inner. If `f_ij=φ(E_ij)`, take `v=f_11 e₁` and use `f_i1 v` as the columns of g. Then `g≡1 mod I` and `φ(X)=gXg⁻¹`. This constructs the required conjugator in `1+M_n(I)`. A40 uses the same local-matrix argument after lifting its residue conjugator.

A97 separately proves the topology comparison used for continuity. For descending ideals J_a of a complete Noetherian local S with zero intersection, their images in each finite-length `S/m_S^b` stabilize. The stable images have surjective transition maps. A nonzero stable residue could therefore be lifted compatibly and, by completeness and closedness of each J_a, would give a nonzero element of their intersection. Thus the stable image is zero. Applying this to `J_a=S∩m_R^a` proves cofinality with powers of m_S. This works for infinite residue fields. The general coefficient-ring lemma belongs to DeformationAndDerivedPatchingAlgebra:R03.1, and A43 imports it.

Finally A44's principal-unit square root imports L77, `IsAdicComplete.henselianRing` and `HenselianRing.is_henselian`, at `X²−α` and residue root1. The residue derivative2 is a unit. Uniqueness follows because the sum of two roots in `1+m` is a unit. No p=2 square-root claim is added.

## Ownership and pinned evidence

| Items | Classification and common owner |
| --- | --- |
| A86 | Planned invariant-lattice import, ArithmeticGaloisRepresentations:R01.1 |
| A87,A88,A90 | Additional equivariant polarized-lattice suppliers, ArithmeticGaloisRepresentations:G7/R01.1 |
| A89 | Planned Eisenstein and integral-basis import, existing LocalFieldsRamification Layer3 |
| A91–A96 | Additional finite trace-algebra and matrix-coordinate suppliers, IntegralHeckeAndGaloisDeterminants:IHG.1 |
| A97 | Additional cofinality supplier, DeformationAndDerivedPatchingAlgebra:R03.1 |
| L77–L81 | Existing Hensel, Burnside, trace, bilinear-dual and local-free-module results |

No roadmap or route is added. The completed IntegralLattices roadmap's symmetric Z-lattices do not supply the twisted DVR equivariance statement; its existing generic Mathlib dual carrier is nevertheless reused. IntegralIwasawaTheory and ArithmeticLocallySymmetricSpaces consume stable lattices. ALLEN23/128 and CG18's trace-uniqueness item already use IHG.1; CG20's symplectic refinement retains its AGR route. The local matrix-algebra proof does not use field-only Skolem–Noether over a nonfield coefficient ring.

The fresh atlas snapshot is `b237fd029c342c29bfe3c114d47a7190d4762c87`,631 files, including58 packet/decomposition/reserved-ID inputs. Read reviewed AUDIT-31 rows R01.1/G7, AUDIT-04 LocalFieldsRamification Layer3 and AUDIT-17 R03.1; IHG.1/IHG.2 have no direct reviewed rows in the coverage map, so their actual descriptions and pinned sources were checked. Twelve declaration excerpts across seven files were byte-verified at full library pins. Exact URLs, hypotheses and hashes are in `libraryAudit.codex7e92bdSupplierContinuation`.

Fresh source reading: [CHT author manuscript](https://virtualmath1.stanford.edu/~rltaylor/twugfin.pdf), PDF10–16, SHA256 `622e51ed167c35a05cdd002f867f6ba0d116da40f35386571c17a7b2fb60d7a2`. Author pagination is kept distinct from journal pagination. The full212-page published LLHLM reading is inherited from this session's earlier extraction, not newly claimed here. All51 source findings and all sourceData remain unchanged and unreviewed.

## Validation and remaining work

The paper checker passes. There are565 unique IDs,387 acyclic item prerequisite edges, and every missing item is routed exactly once. All163 definition/construction interfaces retain typed tests. The542 prior items outside the six specified refinements are unchanged.

Exact diagnostics passed: two symbolic idempotent identities;3,310 noncommutative finite-ring idempotent lifts;722 strict-inner examples;15 full trace-pairing checks, including p dividing n;1,681 valuation-parity cases; and nonsymmetric duality identities. These check formulas and boundaries, not the general infinite-ring/local-field theorems. No Lean file was required or compiled.

This is a checkpoint on the integral-lattice/descent supplier chain. The remaining paper-wide obligations are still explicit gaps: residual characteristic-polynomial recognition and split-prime Chebotarev, finite-O module topology, A66–A73's global analytic suppliers, the analytic-regularity and approximation/tensor queues, proof-only leaves and external inputs, fine shared-owner reconciliation, and uniform Appendix B integral-parameter certificates. The generic rational Appendix B diagnostics are not uniform specialization proofs. The handoff identifies the next supplier; status remains partial.

---

## Historical report from the preceding continuation

The following report retains its original attribution. Its census is historical, and the new lattice/descent supplier work above supersedes those open obligations.

# LLHLM23 continuation: normalized Speh factors and inertia power ranks

Codex — codex-c83e7a, issue #1254, 23 September 2026. Claim5800141924 was confirmed by5800144728. This continues the533-item packet at `4e834a2a07b662187378eaea20045dbcacaba0bf`.

**Partial:545 items (74 library,19 planned,452 missing),21 routes,51 unreviewed source findings.** All159 definitions/constructions have individual uses, API outlines and at least three typed tests. This is an extraction and proof plan; no Lean implementation or independent review is claimed.

## Corrected Speh/Galois realization

The former A78 formula used half-integral cyclotomic powers without constructing global characters, and omitted the change from rank-m to rank-n local Langlands normalization. The correction is in the extraction; it is not a new error allegation against LLHLM.

Write the rank-n weak transfer as an isobaric sum of discrete Speh representations `Delta_i=Speh(pi_i,b_i)`, with unitary cuspidal `pi_i` of rank `m_i` and `n=sum_i m_i b_i`. Set

```
t_i = (m_i + b_i - n - 1)/2,
Pi_i = pi_i |det|_F^(t_i),
R_i = r_(p,iota)(Pi_i).
```

**A79 establishes algebraicity before applying an existence theorem.** The rank-n infinitesimal character has distinct coordinates in `Z+(n-1)/2`. In each Speh segment the top shift is `(b_i-1)/2`, so the raw cuspidal coordinates lie in `Z+(n-b_i)/2`. Adding `t_i` puts them in `Z+(m_i-1)/2`; they remain distinct. Ordering and subtracting rho gives a dominant integral weight of GL_(m_i). Uniqueness of the conjugate self-dual discrete Speh support gives `pi_i^c=pi_i^dual`. The pair `(Pi_i,chi_i)` is polarized for

```
chi_i = |.|_(F+)^(2t_i) delta_(F/F+)^(m_i).
```

Here `2t_i` is integral, delta becomes trivial after composition with the norm, and `chi_i,v(-1)=(-1)^(m_i)` at every real place. The automorphic positive-real half-norm is defined; this construction does not require a cyclotomic half-character.

**A80 imports the polarized cuspidal existence theorem from AG2.2.** It applies to the now-proved regular algebraic pair, including when Pi_i is nonunitary. Its polarization gives `R_i^c=R_i^dual epsilon^(b_i-n)`.

**A81 and corrected A78 give the exact integer twists.** Both sources normalize Artin reciprocity using geometric Frobenius. Thus `epsilon(Frob_w)=q_w^(-1)`. The exponent identity

```
(b_i-1)/2-j+(1-n)/2 = t_i+(1-m_i)/2-j
```

gives, at good split primes,

```
det(1-r(Frob_w)X) = product_(i,j) det(1-q_w^j R_i(Frob_w)X),
r^ss = direct_sum_(i,j=0,...,b_i-1) R_i tensor epsilon^(-j).
```

For `n=2,m_1=1,b_1=2,pi_1=1`, the result is `1 direct_sum epsilon^(-1)`, with polynomial `(1-X)(1-q_w X)`. The old formula with symmetric square-root powers does not give this rank-normalized answer. The polarization pairs index j with `b_i-1-j`, consistently with the rank-n multiplier.

**A77 supplies uniqueness with the correct topology and group scope.** Add Hausdorffness of the coefficient field. Continuous traces equal on a conjugacy-dense set are equal everywhere, using pinned `Continuous.ext_on`. For arbitrary groups, apply character recognition to the finite-dimensional image algebra acting on the direct sum of the two semisimple representations. Its semisimple quotient is a product of matrix algebras over the algebraically closed field; traces on matrix units recover multiplicities in characteristic zero. The pinned finite-group character theorem is not applied to an infinite Galois group.

Every summand in A78 has positive rank. Residual absolute irreducibility, via A50, therefore leaves a single block with `b=1,m=n,t=0`, as required by A62. A73's finite-place genericity consequence and A74–A76's coefficient/type and Hecke-image interfaces can consume this input. Their named analytic and arithmetic suppliers still require closure.

## Monodromy comparison without a Clifford-orbit assumption

BLGGT compares partitions within an irreducible Weil class modulo unramified twist; LLHLM Definition2.5.3 uses nilpotent partitions on the **whole inertia-isotypic subspaces**. The distinction from multiplicity spaces contributes a factor `dim theta`.

For each Weil class sigma choose a representative `s_sigma`, and put `c_(theta,sigma)=dim Hom_I(theta,s_sigma|I)`. All representatives in the class have identical inertia restrictions. The new special-block adapter A82 gives

```
rank(N^a on the theta-multiplicity space)
  = sum_sigma c_(theta,sigma) sum_j max(m_j(rho,sigma)-a,0).
```

Multiply by `dim theta` for the whole isotypic subspace. The coefficients are nonnegative. Dominance in every Weil class therefore implies each inertia rank inequality by summing, even when distinct Weil classes have overlapping inertia supports. This closes A54's comparison without requiring Clifford orbit classification or a multiplicity-one restriction theorem.

A83 constructs nilpotent Jordan chains over any field by making V the existing `Module.AEval' N` polynomial module. It is finite and killed by a power of X. The pinned PID prime-power decomposition gives summands `k[X]/(X^d)`; discard exponent-zero summands and use the existing monic quotient power basis. The residual work is the explicit specialization and scalar restriction, rather than another general PID theorem. A84 computes the power ranks `r_a=sum_i max(d_i-a,0)` and recovers exact block multiplicities by `r_(d-1)-2r_d+r_(d+1)`.

For a decreasing partition lambda, A58 proves the order comparison using

```
R_a = max_i (S_i-i*a),       S_i = min_(a>=0) (i*a+R_a),
S_i = sum_(j<=i) lambda_j,   R_a = sum_j max(lambda_j-a,0).
```

At i=0 choose a at least the largest part; zero-dimensional spaces use the empty partition. Equality at a=0 supplies the common dimension. This gives both directions of the dominance/rank criterion and explains why multiplying by positive `dim theta` preserves and reflects it.

## Library and ownership decisions

| Items | Decision and owner |
| --- | --- |
| A79, A81 | Missing application adapters in existing AutomorphicGaloisRepresentationsPartII AG2.2 |
| A80 | Planned import from AG2.2, the polarized cuspidal existence theorem |
| A82 | Missing restriction/rank adapter in the existing AutomorphicGaloisRepresentationsPartII route |
| A83, A84 | Missing nilpotent specialization/rank adapters beside N57/A58 in the existing SmoothRepresentationsPartII proposal |
| L69–L71 | Existing Mathlib PID decomposition, polynomial action and monic quotient basis |
| L72–L74 | Existing Mathlib Maschke, Schur and isotypic decomposition suppliers |

No route is added. Generic representation/system operations retain ArithmeticGaloisRepresentations and PotentialModularityAndCompatibleSystems:R24.5:operations ownership. DWP.0's spectral examples do not become a second nilpotent-conjugacy carrier. The exact pinned declarations and hypotheses were opened, and12 cited files were byte-verified against their pinned blob identities. Searches covered both pinned library trees, the current atlas and proposed roadmaps, and all53 packet/decomposition/reserved-ID records. The reviewed AG2.2/AG2.7 audit rows were checked. Nearby rank-two Hecke normalization and the Faltings–Deligne finite-test-set theorem do not already state these particular adapters.

## Source readings and findings

The fresh LLHLM file has SHA256 `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`. This continuation read published PDF28,49–50,180–181,196–198; the earlier extraction's remaining readings retain their original attribution. This is not a claim to have freshly reread all212 pages in this pass.

The new bounded supporting readings are BLGGT2014 §2.1, published PDF35–39; EGH Lemma7.1.6 and Theorem7.2.1, author PDF55–56; Labesse Corollary5.3 and its proof, PDF42–44; Mœglin–Waldspurger's introduction, PDF2–4; and BLGGT l=p II, author PDF3,5–6 and published PDF4,6–7. URLs and hashes are in `source.continuationReadings`.

The four additional findings remain **unreviewed**:

- E48: BLGGT2014 p536 calls the pair `(pi,chi)` but uses mu in its following parity sentence. Read chi there; the next independent definition of polarizability may still use mu.
- E49: BLGGT l=p II's Weil-character twist uses a determinant with the wrong domain. Pull the K× character back through inverse Artin reciprocity, or state an unramified Weil character directly. This persists in published p169–170.
- E50: the same source's p169 uses n for the fixed rank m in the extreme-regularity set and coefficient representation, and lower-case pi for Pi in the Hodge–Tate display. These are notation slips with fixed surrounding domains.
- E51: the author copy says GL_(mr) for a special representation formed from s rank-m blocks. The journal already corrects it to GL_(ms), p167; the finding records that known correction.

The relevant page images and published text were checked. The author pages, arXiv version histories and journal records were searched for corrections; findings do not acquire independent-review verdicts here. All47 previous source issues and all Appendix B source data are retained unchanged.

## Validation and remaining work

The paper checker passes. Structural checks give545 unique IDs,159 literal definition interfaces,352 acyclic internal edges and exactly one route for each of452 missing items. Existing item changes are confined to A54,A58,A62,A77,A78; the other original statements/statuses are retained. Exact regressions check2,918 rank transforms,2,918 inverse prefix transforms,12,648 dominance pairs,3,264 isotypic rank cases,2,646 block-recovery formulas and2,427 Speh normalization cases. These finite calculations test the formulas; they are not proofs of the automorphic theorems or Lean elaboration.

The12 recorded gaps remain the work queue. Their descriptions now distinguish the completed normalization, coefficient and monodromy interfaces from still-open analytic/descent suppliers, fine ownership, compound statement splitting, and uniform Appendix B certificates. The withdrawn White source is not used to replace Labesse: LLHLM9.1 supplies Labesse's degree and compactness hypotheses. The stronger external EGH setting is not silently asserted.

The following earlier reports retain the history and extensive inventories. Their numerical censuses and claims that the exact Speh normalization is unresolved are historical; this section and the current JSON supersede them. The incorrect final half-cyclotomic formula from the preceding checkpoint has been replaced by the derivation above.

---

# LLHLM23 continuation: the σ(λ,τ)^* coefficient dictionary and the projected Hecke image

Claude Code, session cc-442dc5, issue #1254, 23 September 2026. This continues merged #2411 at `586740d6`, under claim 5799565155.

**Partial: 531 items (68 library, 18 planned, 445 missing), 21 routes, 47 unreviewed source findings.** All 157 definitions and constructions keep their uses, API and typed tests. No Lean file is required or compiled. This is a source-based plan, not a formalization or an independent review.

## What this checkpoint supplies

The handoff's second resume point asked for:
- the σ(λ,τ)^* coefficient/type dictionary;
- the actual reduced, finite flat projected Hecke image.

Both hypotheses of A65 were open. They are now separate items, conditional only on the automorphic inputs that A62 and A73 still need.

1. **A74: the coefficient dictionary.** Let W be a G(O_p)-stable lattice in ⊗_v σ(λ_v,τ_v)^*∘ι_v, where σ(λ,τ) = V(λ) ⊗ σ(τ) (§6.2). Take the level U = G(O_p)U^p.
   - **The source.** The proof of CHT Proposition 3.3.2 moves only the *algebraic* factor of the coefficient to the infinite places. It keeps the smooth factor (there ρ_v at S(B)) at its finite place.
   - **The isomorphism.** Applied with the smooth factor σ(τ)^* at p, it gives
     S(U,W) ⊗_ι ℂ ≅ ⊕_π m(π) (π^{∞,p})^{U^p} ⊗ Hom_{G(O_p)}(σ(τ), π_p),
     summed over automorphic π with π_∞ ≅ V(λ)_{ι,∞}.
   - **Semisimplicity.** The isomorphism is Hecke-equivariant, and the characteristic-zero Hecke module is semisimple (CHT Corollary 3.3.3).
   - **Relation to EGH.** EGH Lemma 7.1.6 is the case without the smooth factor.
   - **What is not claimed.** The Hodge normalization is left to A55 and E33.
2. **A75: the projected Hecke image.** T_i^pr on H_i = pr(S(U_i(Q),W)_{m_Q}) is a nonzero, reduced, local O-algebra, finite and free over O. This follows from three facts:
   - S(U_i(Q),W) is O-free, because the level is sufficiently small.
   - pr commutes with the Hecke algebra (PDF197–198), so H_i ⊗ K is a Hecke-stable subspace.
   - CHT's remark in §3.4 (PDF104): "TT(X) is finite and free as an O-module. Also by Corollary 3.3.3 we see that it is reduced."

   Reducedness is a characteristic-zero statement; T ⊗ k need not be reduced.
3. **A76: characteristic-zero points.** Every O-algebra map T_i^pr → Q̄_p is the eigensystem of a π as in A74, with σ(τ) occurring at G(O_p) level. With A55, and the A59/A62/A73 inputs, every field factor of A63 lands on R^{λ_v+η, ≤τ_v}. That discharges A65's point hypothesis, conditionally.

The graph stays acyclic: A30 already consumes A65, so A75 and A76 are not prerequisites of A65; A65's note records that they discharge its hypotheses.

**Routes (no new route).**
- A74 joins the AutomorphicFormsOnReductiveGroups source route, which gains stage AF.5 (algebraic modular forms on compact-at-infinity groups).
- A75 joins IntegralHeckeAndGaloisDeterminants IHG.2 (finite Hecke image algebras).
- A76 joins the CompletedCohomology Part II route, beside A55 and A65.

## Two new source findings

- **E47** (error, a stated result). Theorem A.4.1 (PDF194–197) allows any U_p ≤ G(O_p), with W a lattice in the U_p-module ⊗σ(λ_v,τ_v)^*. But its typed local conditions at p need K-type occurrence at G(O_p) level.
  - For tame τ_v, σ(τ_v) is inflated from GL_n(k_v). So for U_p inside the kernel of reduction, W is a sum of copies of an algebraic lattice as a U_p-module.
  - Then S(U,W) contains unramified-at-p forms, whose crystalline Galois representations are not of type ≤ τ_v for a nontrivial tame τ_v.
  - The appendix itself applies the theorem at level G(O_p)U_1(Q_m)^{S_p} (§A.6, PDF201), so nothing downstream changes. The fix is the hypothesis U_p = ∏ G(O_{F_v^+}).
- **E46** (misprint, §7.2, PDF142). K^{[0,h],τ} is described as "the pullback of ε_τ along X^{λ,τ} → Φ-Mod^{ét,n}_K". Both the display and the next sentence make it the pullback along X^{[0,h],τ}; λ is introduced only in the next sentence. This was found in an earlier, unsubmitted pass of this session and re-read at the source for this checkpoint.

All 47 findings still await independent review.

## Sources

- **LLHLM23**, published PDF194–201, freshly read (§§A.4–A.6, including the typed application on PDF201), and PDF142.
- **CHT**, Publ. Math. IHES 108 (2008), from [numdam](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), SHA256 `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c`:
  - §3.3, PDF95–103: Lemma 3.3.1, Proposition 3.3.2 with its full proof, Corollary 3.3.3;
  - §3.4, PDF103–106, through Proposition 3.4.2 and the statement of 3.4.4.
- **EGH**, [author PDF](https://math.uchicago.edu/~emerton/pdffiles/egh.pdf), SHA256 `1a5f6d23149f530603d961e239ef9990bd02e9aca912a6e4483978da6f2689b0`: §§7.1–7.2, PDF52–56.

## Checks and remaining work

**Checks.**
- The paper checker passes.
- 531 unique item IDs; every missing item is routed exactly once. The 15 routed planned items are inherited.
- The internal prerequisite graph has 322 edges and is acyclic, with no dangling references.
- 157/157 literal definition interfaces.
- All 528 prior statements and statuses, the 45 prior findings and the source data are byte-identical. Only A65's note changed.
- No finite diagnostics were added, because A74–A76 are adapters of cited statements.

**Resume with:**
- the exact Speh algebraic/Galois twists and Frobenius-polynomial isomorphism assumed by A62;
- the twelve inherited closure gaps.

The coefficient dictionary and the Hecke-image hypotheses of A65 should not be reopened. Their remaining dependence is only on A62 and A73.

Earlier report follows unchanged.

---

# LLHLM23 continuation: Whittaker injectivity and finite-place genericity

Codex — codex-a71f92, issue #1254, 23 September 2026. Continues merged #2401
at `6c2ba657ff3f12cbb83c8ec7877e11a44d3c99ee`; claim5799093170 confirmed by5799096201.

**Partial: 528 items (68 library,18 planned,442 missing),21 routes,45 unreviewed
source findings; all157 definitions/constructions have individual uses/API/typed
tests.** No Lean file is required or compiled. This is a source-based plan, not
a formalization or an independent review.

## The implication actually supplied

The preceding checkpoint left the generic-local consequence of cuspidal base
change unexplained. A66–A73 now give that implication without assuming a local
uniqueness theorem. They do **not** establish the exact Speh/Galois realization
that A62 still needs in order to prove cuspidality.

For a number field F, fix a nontrivial unitary character psi of A_F/F. On the
upper unitriangular group N_n use psi_N(u)=psi(sum_i u_(i,i+1)), and set

W_phi(g) = integral over N_n(F)\\N_n(A_F) of phi(u g) psi_N(u)^(-1) du.

The quotient has its invariant probability measure, compatible with successive
additive quotient measures. It is generally a homogeneous space, not a quotient
group. A66 constructs the transform on smooth automorphic globalizations.
Compactness gives convergence; right translation gives
W_(R(h)phi)(g)=W_phi(g h), while unipotent left equivariance is
W_phi(u g)=psi_N(u)W_phi(g). The inverse in the integrand matters.

The injectivity proof is a useful weakening of the full Fourier expansion:
it requires only compact Fourier uniqueness, not absolute uniform convergence
or rearrangement of the final multiple infinite series.

1. **A67: last-column detection.** Write P_n=GL_(n-1) semidirect Y_n with
   Y_n=A_F^(n-1), and define C_x f using the row frequency x.
   The zero coefficient vanishes by cuspidality. If e=(0,...,0,1), then
   C_(e gamma)f(p)=C_e f(diag(gamma,1)p) for rational gamma.
   Rational change of variables preserves global volume by the product formula.
   Every nonzero row is e gamma, with stabilizer the row-mirabolic P_(n-1).
   Hence vanishing of these coefficients implies f(p)=0 by Fourier uniqueness.
   The frequency set is not projective space.
2. **A68: induction preserves cuspidality.** For fixed p, the function
   p'↦C_e f(diag(p',1)p) is a cuspidal function on P_(n-1).
   For the smaller maximal parabolic a+(n-1-a), the first a last-column
   coordinates combine with its radical into the GL_n radical for a+(n-a).
   The character is trivial on these coordinates. Integrate this zero constant
   term first, then the remaining column coordinates. Compact Fubini and
   transitivity of constant terms finish the check. The corresponding smaller
   Whittaker integral is W_f(diag(p',1)p).
3. **A69: injectivity.** Induct from P_1={1}. If W_f vanishes, A68 and the
   induction hypothesis force every C_e f to vanish; A67 gives f=0.
   Restrict each right translate of a GL_n cusp form to P_n to recover its
   value at every g. This is precisely the consequence needed below.
4. **A70: global nonvanishing.** For nonzero phi, choose g with W_phi(g)≠0.
   Then Lambda(R(g)phi)=W_phi(g)≠0, where Lambda(phi)=W_phi(1).
   Individual vectors can lie in ker Lambda; this is not a claim that every
   nonzero phi has nonzero value at the identity.
5. **A71: freeze a detecting factor.** At a finite place v import the actual
   one-place factorization V_Pi=V_(Pi_v) tensor V^v from AF.2.
   A nonzero linear functional cannot vanish on all pure tensors. Choose
   x tensor w detecting it and set lambda_v(y)=Lambda(y tensor w).
   Local unipotent equivariance is inherited because only the first factor
   moves. The frozen vector must be chosen: an arbitrary reference vector can
   give the zero functional. This argument proves finite-place existence,
   not the factorization of Lambda into an Euler product or its uniqueness.
6. **A72: normalization twists.** A determinant character is trivial on N_n,
   so it does not change the Whittaker Hom space. This includes the
   |det|^((1-n)/2) twist. It does not calculate the corresponding cyclotomic
   character on the Galois side.
7. **A73: the LLHLM consumer.** Once A62's Galois realization excludes every
   nontrivial Speh decomposition, its single cuspidal base change is globally
   and finitely locally generic. Labesse's split-place comparison transports
   this to the compact-unitary constituent, including at split places over p.
   A chosen abstract coefficient-field isomorphism transports the algebraic
   smooth Hom statement; it is not a topological field isomorphism.

A30 gains A73 as a prerequisite and a proof qualification. Every one of the
519 old item statements and statuses is unchanged; no other old item changes.
The 44 old findings and all AppendixB source data are unchanged.

## Owners and library reuse

The general global construction and mirabolic lemmas go to
AutomorphicFormsOnReductiveGroups AF.3, with the tensor restriction adapter in
AF.2. The determinant-twist identity refines the local Whittaker API in
SmoothRepresentationsOfLocalGroups SR.5, whose complex comparison is explicitly
consumed by AutomorphicLFunctionsAndLocalFactors AL.3. These add two source
routes, not two new roadmaps. The consumer-specific A73 joins the existing AG2
source route.

AF.3's present text does not already state the GL_n global genericity theorem:
the new items are marked missing and routed as source refinements in its
existing cusp-form direction. No genericity theorem for arbitrary reductive
groups is being imposed. No exact integral co-Whittaker or coefficient-
characteristic-p assertion is imported from Helm by a change of notation.

Freshly read reviewed audit rows: AUDIT-13 AF.0/AF.2/AF.3 and AUDIT-14
AL.0/AL.3. There is no direct reviewed SR.5 row; AL.3's accepted audit explicitly
finds the local Whittaker machinery absent. Complete pinned-tree searches for
Whittaker, mirabolic and restricted tensor products found no relevant theorem.
The current AF/SR/AL campaign documents were read in full, as were the relevant
atlas contracts and AG2.2/5/6/7. No finer AF/SR/AL packet or promoted decomposition
exists in this snapshot.

L68 imports only `TensorProduct.ext'` from Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`,
`Mathlib/LinearAlgebra/TensorProduct/Basic.lean:133`.
Its proof, scalar context, `curry/curry_apply`, and the `Defs.lean`
`induction_on`, `mk/mk_apply` and pure-tensor spanning statements were read.
Both files were byte-verified against the exact remote pin. Algebraic
extensionality is not Flath's theorem and is not an assertion about completed
archimedean tensor products.

Still-open supplier boundaries are explicit: AL.0's compact additive character
duality/completeness, AA.2/AF.3's quotient Haar measures and Fubini, AF.1's smooth
globalization continuity, and AF.2's actual one-finite-place factorization.
The mirabolic proof is now decomposed, but these owners are not claimed fully
formalized or closed by this checkpoint.

## Sources and already-corrected supplier typo

Fresh main-paper reading: LLHLM23 published PDF196–198 and EGH7.2.1 PDF55–56.
The full LLHLM read remains attributed to codex-7e92bd.

- [Cogdell, PCMI notes](https://people.math.osu.edu/cogdell.1/pcmi-www.pdf),
  Lecture1 printed5–11/PDF9–15, including the entire mirabolic induction.
  SHA256 `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a`.
  Printed11 was also rendered. The local-uniqueness sketch was inspected but
  is not used as a proof-closure certificate.
- [Cogdell, Fields Institute notes](https://people.math.osu.edu/cogdell.1/fields-www.pdf),
  Lecture4 printed29–33/PDF33–37, including Corollary4.1.2.
  SHA256 `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`.
- [Earlier ICTP notes](https://people.math.osu.edu/cogdell.1/ictp-www.pdf):
  only the matching functional display was compared.
  SHA256 `fea0876a14364c8195fb8740ed0042e2ed9f09fc640fe10d9cf986a9b170aa2e`.

**E45** records an already-corrected typo in the prerequisite notes, not a new
LLHLM error. PCMI printed11 writes Lambda(phi)=W_phi(e) but retains phi(n g)
in its integral. Evaluation at e requires phi(n); the g-dependent integral is
W_phi(g)=Lambda(R(g)phi). The Fields notes printed33 already give phi(n).
The older ICTP display has the same stray g. The author page and the versions
above were checked, and no novelty is claimed. All45 findings still await
the independent review; the later corrected formula is evidence, not this
worker's review verdict.

## Checks and exact finite diagnostics

The scratch standard-library diagnostic checks:

- 134003 upper-unitriangular GL3 products and adjacent-root character sums;
- 111216 row-frequency/change-of-variable cases over F3,F5,F7, with the
  correct mirabolic stabilizer;
- 1680 enlarged-radical normalization cases in ranks3–6;
- 15 finite Fourier inversions and15 right-translation sign checks, using
  integer arithmetic modulo the cyclotomic polynomial, not floating-point
  roots of unity;
- 719 nonzero bilinear tables detecting a pure tensor, plus the negative test
  showing a badly chosen frozen vector gives zero.

These are finite regression diagnostics, not proofs of the adelic results.
They do not prove cuspidality, local p-adic Hodge types or Flath's theorem.

The paper checker passes; all41 existing paper/queue/intake unit tests pass.
Structural checks give528 unique items,314 acyclic internal prerequisite
edges, exactly one route per missing item, and157/157 literal definition
interfaces. All519 prior statements/statuses,44 prior findings and sourceData
are preserved. Three-file intake is checked again before publication.

Resume with exact Speh algebraic/Galois twists and the Frobenius-polynomial/
semisimple-uniqueness isomorphism; the sigma(lambda,tau)^* coefficient/type
dictionary; and the actual reduced/finite-flat projected Hecke image. A65's
conditional integral-quotient step and A73's conditional generic-local step
must not be confused with their unproved automorphic inputs. The twelve
inherited closure gaps remain.

Publication refresh: fresh main `475a4ea5374551cf5f10d0b7b94739b10c78d1eb`
matches all three original deliverable blobs and all521 guarded content,
roadmap, atlas, reviewed-audit, protocol and checker inputs. The payload and
checks were replayed on that snapshot; only the three authorized files are
submitted.

Earlier report follows unchanged; its old counters and wholly-unexplained
generic-local step are superseded above.

---

# LLHLM23 continuation: integral deformation-quotient factorization

Codex — codex-a71f92, issue #1254, 23 September 2026. Continues merged #2394
at `58abf5c053e07211aeee4b30a4536518de24d187`; claim5798773987 confirmed by5798776543.

**Partial: 519 items (67 library,18 planned,434 missing),19 routes,44 unchanged
unreviewed source findings. All156 definitions/constructions retain individual
uses/API/at least three typed tests.** This pass isolates a conditional algebraic
step, not the remaining automorphic base-change or type-occurrence proofs.

## What changed

A63 proves joint faithfulness of the characteristic-zero field factors of a
finite flat reduced O-Hecke algebra. A64 uses this to detect whether a
coefficient map kills a quotient ideal, retaining continuity and locality.
A65 applies the result to the corrected local Hodge/monodromy-bounded quotient
in AppendixA.4, conditional on the actual classical constituents satisfying the
required types. It uses the **projected** auxiliary Hecke image, not the full
unprojected algebra, and retains the Hodge shift lambda+eta.

The generic algebra was already in Mathlib: L62–L67 import finite-Artinian
algebra, the reduced-Artinian product decomposition, localization reducedness
and injectivity, ideal quotient maps and the open quotient-map topology.
These are supplier atoms, not new Artinian-ring or quotient implementations.

The existing P02 API contained an unsupported converse: it identified every
point of the closure of an exact monodromy stratum with a point of that exact
stratum. The published definition at PDF126 expressly takes the Zariski
closure. Its corrected API only uses the forward implication; exact
characterizations require their own theorem. The minimal/crystalline and
full potentially semistable cases retain Remark6.1.1's specific Kisin input.
This corrects the **extraction**, not the paper: no new source finding is added.

For orientation, N_t=t E12 has rank one off t=0 and rank zero at t=0, so the
closure of a rank stratum can include smaller rank. This is only a
matrix-stratum test of the invalid general inference. It is **not** a constructed
family of fixed-Hodge potentially semistable Galois representations or a proof
that a particular Kisin component contains a particular crystalline point.

## Proof and hypotheses

Let T be nonzero, commutative, finite flat and reduced over O, the integers of a
finite extension E/Qp. Flatness makes T→T[1/varpi] injective. The generic algebra
is finite dimensional over E and reduced, hence Artinian and a finite product
of finite extensions E_i/E. Its coordinate maps x_i jointly detect zero in T.
T need not itself be the product of the corresponding integral rings.

For f:R→T and I an ideal of R, if every x_i∘f kills I, then every f(a), a∈I,
has all coordinates zero and is zero. The existing quotient universal property
gives the unique map R/I→T. The converse is immediate. With quotient topology,
continuity descends; locality descends from a local f and a proper local ideal.
The quotient maximal-ideal topology agrees because powers map to powers.

For A65, a constituent of exact type tau_i dominated by tau lies in its own
closure, hence in the closed dominated union. Its map kills that union's ideal.
Testing every field factor and applying A64 yields the integral factorization.
An identity such as the fixed determinant or multiplier is inherited from f;
the factorization does not construct a new polarization.

Counterexamples explain the assumptions:

- O[epsilon]/epsilon² is finite flat, but all field points miss epsilon.
- O×k is finite reduced, but characteristic-zero points miss the vertical
  element (0,1), which is killed by varpi.
- The local reduced finite-free congruence order
  T={(a,b) in O² : a=b mod varpi} embeds into E² but is not O².
  Its first coordinate misses (0,varpi); both factors must be tested.

Neither finite flatness nor reducedness supplies the automorphic types
themselves. A55's normalized type/monodromy comparison and the still-open
constituent and dual-coefficient dictionary remain separate obligations.

## Sources, owners and pinned reuse

Fresh reading: published LLHLM PDF124–128 and193–198; rendered PDF126 inspected.
The existing author-hosted published PDF was rehashed:
`e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`,
[Le–Le Hung–Levin–Morra, published PDF](https://math.rice.edu/~bl70/LocModels.pdf).
Earlier complete-paper reading remains attributed to codex-7e92bd.

The [Artinian decomposition](https://stacks.math.columbia.edu/tag/00JB),
[nilpotent radical](https://stacks.math.columbia.edu/tag/00J8) and
[reduced-ring field embedding](https://stacks.math.columbia.edu/tag/00EW)
statements and proofs were read. The adapter applies these elementary facts to
the existing integral-Hecke setup; no additional full trace-formula/Kisin-paper
audit is claimed.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, actual statements and
variable contexts were read:

| Item | Path and declaration |
|---|---|
| L62 | RingTheory/Artinian/Module.lean:403, IsArtinianRing.of_finite |
| L63 | Same file:519,633,638; finite maximal spectrum, IsArtinianRing.equivPi and equivPi_apply |
| L64 | RingTheory/LocalProperties/Reduced.lean:28, isReduced_localizationPreserves |
| L65 | RingTheory/Localization/Defs.lean:941, IsLocalization.injective |
| L66 | RingTheory/Ideal/Quotient/Operations.lean:471,491, Ideal.Quotient.liftₐ/liftₐ_comp; ring version in Quotient/Defs.lean:144 |
| L67 | Topology/Algebra/Ring/Ideal.lean:80, QuotientRing.isOpenQuotientMap_mk |

Paths in the table are under Mathlib/. Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` was also searched for an already
packaged finite-Hecke/type-factorization adapter. None was found in the scoped
searches. The missing classifications apply to the consumer-specific assembly,
not to its generic algebra ingredients.

The current IHG0–6 and LocalGaloisDeformationRings L7/R08.1/R08.3 contracts were
read. There is no direct reviewed IHG or local-deformation row in
data/library-coverage.json; the reviewed R03.1 row was read and no claim of a
nonexistent reviewed L7 audit is made. A63/A64 refine the existing IHG.1/IHG.2
source route; A65 joins the existing all-rank patching Part II. No new route or
duplicate roadmap is introduced.

## Validation and remaining work

All510 inherited item statements and statuses, all44 sourceIssues and AppendixB
sourceData are unchanged. P02 changes its API/note and adds a typed cautionary
test; A30 gains A65 and the associated proof qualification. The nineteen route
identities remain unchanged. There are519 unique item IDs and exactly one route
per missing item; the recorded300-edge prerequisite graph is acyclic.

Checks: paper checker passes;41 tests pass (9 paper,3 queue,29 intake);
the three-file intake check passes. Exact standard-library diagnostics give
32836 congruence-order operation checks,122 unit checks,121 dual-number products,
68 rank-drop matrix cases and1834 joint-coordinate checks. These finite tests
are not formal proofs or characteristic-zero density certificates.
No Lean deliverable is required or compiled.

This closes the **conditional point-to-integral algebra step** at proof-plan
level. It does not close the twelve inherited gap records: exact Speh/Galois
twists and Frobenius comparisons, global genericity, dual coefficient/type
occurrence, actual reducedness/flatness of the Hecke image in the consumer,
supplier/proof closure, semantic API splitting, analytic regularity,
cross-owner reconciliation and uniform AppendixB certificates remain.


Publication refresh: fresh main `0d9a9e0fda317432de1abbc59db4fca0f3fffac7` preserves all three baseline deliverable blobs and all310 guarded content/roadmap/atlas/audit/protocol/checker inputs. The six cited Mathlib source files were byte-verified against the exact remote pin. The same three-file payload and checks were replayed on that fresh snapshot.

The historical report follows. Its old P02 exact-point API interpretation and
old numeric censuses are superseded by this header and the repaired JSON.

---

# LLHLM23 continuation: itemwise definition interfaces

Codex — codex-7e92bd, issue #1254, 23 September 2026. Continues merged #2362.

The extraction remains **partial**. All **156 definitions and constructions** now have individual use sites, an API outline and at least three typed mathematical tests. This pass covers the49 previously incomplete interfaces and adds **289 API entries and155 typed tests**. It preserves all510 item statements and statuses (61 library,18 planned,431 missing), all19 routes, all44 unreviewed source findings and the AppendixB data. No new source finding or implementation is claimed.

The current literal coverage is156/156. This is a structural milestone, not a closure verdict: the twelve recorded gaps still include exact global automorphic/Galois comparisons, supplier and proof decomposition, analytic regularity, ownership reconciliation and uniform AppendixB certificates. The definition/API gap now concerns semantic decomposition and promotion of prerequisite lemmas rather than missing fields. All historical lower counts below are superseded by this census.

The49 interfaces divide into14 from Section4 (local models and affine flags),17 from Section5 (Kisin modules and etale Frobenius modules),12 from Section7 (monodromy and representation stacks), and Q01,Q02,Q07,Z02,L05,Z15. Z15's six existing API entries are retained; it gains four typed tests alongside its earlier untyped acceptance tests.

The substantive distinctions are recorded at the consuming interfaces: left quotient and matrix multiplication order; schematic intersection versus flat closure; common-base products and geometric irreducibility; gauge opens versus fixed shape; the cyclic Frobenius target index; linearized Frobenius invertibility; presentation-dependent parameters; true versus truncated monodromy; flat versus arbitrary base change of its ideal; formal reduction versus underlying algebraic reduction; and the shifted torus action on representation-stack quotients. Tameness alone is not treated as semisimplicity. The AppendixB normalization is constructed by adjoining a fraction as a finite algebra, which still has fibres where that fraction cannot be evaluated by division.

Fresh source reading: published PDF80–125,131–158,201–204, with rendered PDF88,93,95 inspected; Boixeda Alvarez v3 PDF8–12; eight pinned Lean files. The published PDF hash remains `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`. The bounded reading and supplier hashes are in `source.continuationReadings`. The prior full-paper reading is retained; no new complete supplier-paper read is claimed.

Pinned reuse and ownership: the reviewed GS0 loop-geometry row and current L7/L8 and GS0 owner contracts were read. L7 has no direct reviewed-coverage row; AUDIT-33's current L7 result is an unreviewed lead. Existing module Grassmannians, transvections/root subgroup maps, scheme-image/ideal-sheaf operations, DVR-flatness carriers and continuous power-series evaluation are reused. They do not identify integral Iwahori charts with finite module Grassmannians or divisor/v-sheaf loop geometry. The19 route identities and Part II boundaries are unchanged.

Validation: the paper checker,41 existing paper/queue/intake tests, preservation/routing/census checks and the recorded prerequisite-DAG check pass. Exact symbolic and finite diagnostics check root-loop and derivative identities, noncommuting translation, genericity under common shifts, three twisted-action compositions, two mixed-characteristic negative-pole examples, corrected path inverses/conjugation in ranks2–5, and all seven normalization equations at a nonreduced origin fibre. These are mathematical diagnostics, not Lean proofs or uniform normalization certificates. No Lean file is required or compiled for this paper deliverable.

Publication inputs were checked against main `ef6fc31a0065e286fb75edff573ebca74776ebf7`: allthree original deliverables remained unchanged; seventeen of eighteen guarded inputs matched the local reading exactly, and the changed AUDIT-33 was refreshed and its L7 row reread.

## New and completed interfaces

### M01: Pappas–Zhu GLn Iwahori local model

Source: §4.1, PDF80–81.

- Use — LLHLM23 Definitions4.1.2–4.1.3 (M04/M05): Supply the bounded ambient scheme in which the flat closure and differential intersection are formed.
- Use — LLHLM23 Corollary4.2.6 (M11): Supply the reduced admissible-cell special fibre before imposing differential equations.

- `IwahoriLocalModel.mk` (constructor): For the source coefficient DVR O and dominant GL_n cocharacter lambda, specialize t=-p, form the generic Schubert variety through (v+p)^lambda, and take its schematic closure in the bounded universal Grassmannian. Reuse scheme-theoretic image/ideal-sheaf carriers on bounded ambient schemes; do not duplicate their general construction.
- `IwahoriLocalModel.generic_fiber` (equivalence): After base change to E=Frac(O), recover the usual GL_n Schubert variety S_E(lambda), with the same chosen representative (v+p)^lambda and left-positive-loop convention.
- `IwahoriLocalModel.special_fiber` (equivalence): Identify the special fibre with the reduced closed union of affine Schubert cells indexed by Adm-dual(lambda), using Pappas–Zhu9.3/coherence. This is the ambient model, not a reducedness assertion for differential intersections.
- `IwahoriLocalModel.inclusion_of_le` (functoriality): Dominance lambda_prime<=lambda with equal central class induces the corresponding closed immersion of bounded local models; identity and composition agree with the ambient inclusions.
- `IwahoriLocalModel.closure_ideal` (characterisation): On an affine chart Spec A of a bounded ambient model, if J_E defines the selected generic subvariety, the closure ideal is the inverse image of J_E in A[1/varpi]. Identify the resulting chart with the restriction of the global schematic closure.
- `IwahoriLocalModel.flat_base_change` (compatibility): For a flat extension of coefficient DVRs preserving the chosen data, prove the closure comparison by exactness of flat tensoring and contraction of the generic ideal. Do not infer this comparison for reduction modulo varpi.

- Test `IwahoriLocalModel.central_cocharacter` (degenerate): For lambda=(c,...,c), the generic Schubert variety is a point and its model is the section (v+p)^c I over O; its special fibre has one central affine-Weyl label.
- Test `IwahoriLocalModel.rank_one` (computation): For n=1 and any integer c, the model is Spec O at the lattice (v+p)^c; no positive-root coordinates appear.
- Test `IwahoriLocalModel.central_class_boundary` (non-example): In GL_2, (1,1) is below (2,0) in the same central class, but (1,0) is not: unequal total cocharacter sums must not be accepted as a dominance inclusion.

### M02: Mixed-characteristic differential locus

Source: Equation(4.1), PDF81.

- Use — LLHLM23 Proposition4.1.1 and Definition4.1.3 (M03/M05): Restrict the same descended differential condition to a generic Schubert cell and to the full bounded model.
- Use — LLHLM23 Proposition4.3.1 (M19): Compare its reduction with the zero-parameter locus under right translation.

- `MixedDifferentialLocus.expression` (data): For a in O^n and a Noetherian O-algebra R, set L_a(A)=v(dA/dv)A^(-1)+A Diag(a) A^(-1), in the source localized completed loop ring. Require (v+p)L_a(A) in L+M_O(R), rather than in an unrestricted matrix ring.
- `MixedDifferentialLocus.left_change` (relation): For h in L+G_O(R), L_a(hA)=v h_prime h^(-1)+h L_a(A)h^(-1). Prove this preserves the prescribed pole/upper-triangular-mod-v condition, including the derivative term.
- `MixedDifferentialLocus.quotient` (constructor): Descend the invariant closed subfunctor to the left quotient L+G_O\LG_O using the existing sheaf quotient and the universal differential locus; identify the resulting closed immersion in Gr_G,O.
- `MixedDifferentialLocus.specialize_universal` (compatibility): Identify this locus with the fibre of the universal construction U15 at (t,a)=(-p,a), retaining the coefficient-algebra category.
- `MixedDifferentialLocus.map` (functoriality): Under a coefficient-algebra map R→S, send A and the equation coefficientwise to S; prove derivative and matrix-operation compatibility with the source completion/localization maps and identity/composition laws.
- `MixedDifferentialLocus.residue` (simp): Modulo varpi, p=0 and the condition becomes v A_prime A^(-1)+A Diag(a_bar)A^(-1) in v^(-1) Lie I_F, with the prescribed upper-triangular residue condition.

- Test `MixedDifferentialLocus.identity_matrix` (computation): A=I satisfies the condition because (v+p)Diag(a) lies in L+M_O.
- Test `MixedDifferentialLocus.rank_one_power` (computation): For n=1 and A=(v+p)^c, (v+p)L_a(A)=c v+(v+p)a; this checks the v numerator and the sign t=-p.
- Test `MixedDifferentialLocus.left_gauge_derivative` (non-example): At p=0 take h=I+v E_21 and a=0. Then v h_prime h^(-1)=v E_21 is nonzero and belongs to Lie I; a change-of-representative formula omitting this term is false.

### M04: Flat monodromy local model

Source: Definition4.1.2, PDF82.

- Use — LLHLM23 Proposition4.1.5 and equation(4.2) (M06): Embed every fixed-Hodge closure into the common naive bound before taking the finite union.
- Use — LLHLM23 Remark4.6.3(2): Distinguish the eventual flat-model component theorem from the naive-model component theorem.

- `FlatMonodromyModel.mk` (constructor): For dominant lambda and a in O^n, take the schematic closure of S_E^open(lambda) intersect Gr_nabla_a inside M(<=lambda), with its canonical closed immersion.
- `FlatMonodromyModel.generic_flag` (equivalence): Its generic fibre is the closed differential stratum of Proposition4.1.1, canonically (P_lambda\GL_n)_E. Retain the source parabolic convention: alpha entries vanish when <lambda,alpha_coroot><0.
- `FlatMonodromyModel.saturation` (characterisation): On a chart with ambient algebra A and a finitely generated ideal I defining the generic equations after localization, the closure ideal is I:varpi^infinity. Equivalently it is the contraction of I A[1/varpi].
- `FlatMonodromyModel.flat_projective` (structure): The saturated quotient is varpi-torsion-free and hence flat over the coefficient DVR; the global closed model is projective. Export relative dimension dim(P_lambda\GL_n), without replacing lambda by a regular weight.
- `FlatMonodromyModel.minimal_closed` (universal-property): Every closed subscheme of M(<=lambda) whose generic fibre contains the selected generic differential stratum contains this schematic closure.
- `FlatMonodromyModel.into_naive` (compatibility): The differential condition is closed, so the flat closure factors through Mnv(<=lambda,nabla_a). This factorization is not an isomorphism without additional proof.

- Test `FlatMonodromyModel.central_dimension_zero` (degenerate): For lambda=(c,...,c), P_lambda=GL_n and the generic differential stratum and its flat closure are the distinguished point/section of relative dimension zero.
- Test `FlatMonodromyModel.GL2_regular_dimension` (computation): For GL_2 and lambda_1>lambda_2, the parabolic quotient has dimension one; for lambda_1=lambda_2 it has dimension zero.
- Test `FlatMonodromyModel.saturation_removes_vertical_torsion` (non-example): In O[x], the generic equation varpi*x=0 contracts to (x), not (varpi*x). The naive quotient O[x]/(varpi*x) has a special-fibre line, whereas its generic-fibre closure is Spec O. This is a test of the closure operation, not a claim that this toy scheme is a particular LLHLM local model.

### M05: Naive mixed-characteristic local model

Source: Definition4.1.3, PDF82.

- Use — LLHLM23 Theorem4.2.4 and Corollary4.2.6 (M09/M11): Impose the explicit differential equation on each admissible Schubert cell and identify top-dimensional reduced components.
- Use — LLHLM23 Proposition4.3.1 (M19): Embed the translated special-fibre intersection in the common zero-parameter flag.

- `NaiveMonodromyModel.intersection` (constructor): Define the closed fibre product M(<=lambda)×_(Gr_G,O)Gr_nabla_a, retaining the full scheme structure and its two projections.
- `NaiveMonodromyModel.chart_ideal` (characterisation): In a common affine chart, its ideal is the sum of the ambient bounded-model ideal and the differential-equation ideal. Do not saturate or radicalize this sum as part of the definition.
- `NaiveMonodromyModel.point_criterion` (characterisation): For a Noetherian O-algebra R, a point consists of a bounded-model point whose image satisfies equation(4.1) after the required fpqc local representation; equality is equality in the common quotient.
- `NaiveMonodromyModel.specialization_universal` (equivalence): Use the flatness of the global Schubert variety from Richarz Theorem1.5 as cited in Remark4.1.4 to identify this model with specialization of U21. Equality of generic fibres alone does not establish the integral comparison.
- `NaiveMonodromyModel.generic_disjoint_union` (equivalence): Use M07 to identify the generic fibre with the reduced disjoint union of (P_lambda_prime\GL_n)_E over dominant lambda_prime<=lambda. This is not the special-fibre decomposition.
- `NaiveMonodromyModel.base_change_intersection` (functoriality): Base change commutes with this closed fibre product and its projections. A comparison with a newly defined schematic closure after the same base change is an additional assertion.

- Test `NaiveMonodromyModel.closed_intersection_ideals` (computation): On Spec O[x,y], intersecting V(x) and V(y) gives ideal (x,y); using the ideal intersection (xy) would instead describe their scheme-theoretic union.
- Test `NaiveMonodromyModel.generic_equality_not_integral` (non-example): O[x]/(varpi*x) and O[x]/(x) have the same generic fibre but different special fibres. Do not deduce flatness of a naive model from M07.
- Test `NaiveMonodromyModel.nilpotents_retained` (non-example): A closed intersection can have coordinate ring F[x]/(x^2). The definition retains x as a nonzero nilpotent; passing to F is a separate reduction operation.

### M06: Union of flat Hodge-stratum closures

Source: Equation(4.2), Proposition4.1.5, PDF82.

- Use — LLHLM23 Proposition4.1.6 (M07): Supply the flat model with the same generic fibre as the naive differential model.
- Use — LLHLM23 Sections4.4–4.5 (M27/M28): Pull back its special fibre to the torus torsor and form products over the common coefficient base.

- `FlatHodgeUnion.finite_index` (data): Use the finite set of dominant cocharacters lambda_prime<=lambda in the fixed central class; record its finiteness before forming the union.
- `FlatHodgeUnion.mk` (constructor): Form the scheme-theoretic union of the closed submodels M(lambda_prime,nabla_a) inside the naive model; on a chart its ideal is the intersection of the finitely many defining ideals.
- `FlatHodgeUnion.closed_universal` (universal-property): Each stratum closure maps by a closed immersion to the union, and a closed subscheme contains the union exactly when it contains every stratum closure.
- `FlatHodgeUnion.flat` (instance): On affine charts, embed A/(intersection I_i) in the finite product of the torsion-free O-modules A/I_i. Deduce torsion-freeness and then DVR-flatness; do not confuse union with a disjoint coproduct over O.
- `FlatHodgeUnion.generic_fiber` (equivalence): After inverting varpi, finite ideal intersections commute with localization and the union equals the generic naive model of M07, with its reduced disjoint flag strata.
- `FlatHodgeUnion.projective` (structure): The union is a closed subscheme of the projective bounded model and is projective over O; preserve the common ambient immersion under changes of the finite indexing set.

- Test `FlatHodgeUnion.one_stratum` (degenerate): If lambda is central, only that dominant weight occurs in its dominance interval, so the union is M(lambda,nabla_a).
- Test `FlatHodgeUnion.two_generic_strata` (computation): For GL_2, the dominant weights <=(2,0) are (2,0) and (1,1); the generic union is P^1_E disjoint union Spec E.
- Test `FlatHodgeUnion.flat_union_nonreduced_special` (non-example): In O[x], the two flat sections (x) and (x-varpi) have scheme-theoretic union x(x-varpi)=0. It is O-flat, but its special fibre is x^2=0. Thus flat union and reduced generic fibre do not imply reduced special fibre.

### M08: Residue tuple genericity

Source: Definition4.2.2, PDF83.

- Use — LLHLM23 Theorem4.2.4 proof, equation(4.6) (M09): Make the triangular coefficient scalars invertible when the tuple is defined over the residue field.
- Use — LLHLM23 Proposition4.3.4 (M21): Transfer the integral affine-Weyl genericity bound to the residue tuple used in cell coordinates.

- `ResidueTupleGenericity.iff_differences` (characterisation): For a in R^n over an F-algebra and positive integer m, genericity means a_i-a_j is unequal to the image of every integer c with -m<=c<=m for every i!=j.
- `ResidueTupleGenericity.monotone_bound` (relation): If 1<=m_prime<=m and a is m-generic, then it is m_prime-generic.
- `ResidueTupleGenericity.perm_common_shift` (compatibility): Permuting all coordinates or adding a common b in R to them preserves and reflects m-genericity.
- `ResidueTupleGenericity.injective_map` (functoriality): An injective F-algebra map preserves and reflects genericity; for any F-algebra map, genericity of the image implies genericity of the original tuple. Arbitrary maps need not preserve the non-equality condition.
- `ResidueTupleGenericity.field_scalar_units` (relation): If a lies in F^n, every avoided scalar a_i-a_j-c is a nonzero field element, hence a unit; its image remains a unit in every F-algebra. This is the stable open condition used for solving cell equations.
- `ResidueTupleGenericity.translation_comparison` (compatibility): For an integral nu with t_nu m-generic in Definition2.1.10(2), prove its residue tuple is m-generic as in Remark4.2.3. Retain the source affine-Weyl convention rather than substituting eta-shifted weight depth.

- Test `ResidueTupleGenericity.boundary_F7` (computation): Over F_7 and m=1, (0,3) is generic, whereas (0,1) fails because the difference 1 is forbidden.
- Test `ResidueTupleGenericity.rank_one_vacuous` (degenerate): With one coordinate there are no pairs i!=j, so the condition is vacuous for every positive m.
- Test `ResidueTupleGenericity.specialization_failure` (non-example): Over F_p[t], (t,0) avoids every constant c and is m-generic for every m, but evaluation t↦0 makes the coordinates equal. Nonzero differences over a general algebra must not be treated as units.
- Test `ResidueTupleGenericity.unit_locus` (compatibility): For a generic tuple already in F^n, extending scalars to F[epsilon]/(epsilon^2) preserves every relevant inverse even though the target algebra is nonreduced.

### M12: Affine root subgroup charts

Source: §4.2, Lemmas4.2.7–8, PDF84–85.

- Use — LLHLM23 Proposition4.2.10 and Corollary4.2.12 (M14): Translate Iwahori/negative-loop membership into a finite range of allowed exponents.
- Use — LLHLM23 Proof of Theorem4.2.4 (M09): Use explicit off-diagonal coordinates and root-height triangularity in the differential equation.

- `AffineRootChart.parameter` (constructor): For alpha=e_i-e_k with i!=k and m an integer, send c in R to I+c v^m E_ik in GL_n(R((v))). Reuse Matrix.transvection and its group laws, or TauCeti.GeneralLinear.rootSubgroupPoints evaluated on the Laurent-ring parameter; construct only the affine-loop adapter.
- `AffineRootChart.add_inverse` (structure): For the same alpha,m, x(c)x(d)=x(c+d), x(0)=I and x(c)^(-1)=x(-c); export these as equalities in the common loop carrier.
- `AffineRootChart.coefficient_ext` (extensionality): The (i,k),v^m coefficient recovers c, so equality of these root-loop points is equality of their parameters.
- `AffineRootChart.map` (functoriality): An F-algebra map acts coefficientwise and commutes with the root parameterization, with identity and composition laws.
- `AffineRootChart.conjugation` (compatibility): For w=s t_nu and z=w^*, use the source Weyl embedding to prove z^(-1)U_(-alpha,m)z=U_(-s(alpha),m+<nu,alpha_coroot>), including the scalar-parameter map induced by the chosen permutation matrices.
- `AffineRootChart.membership_bounds` (characterisation): For x in the base alcove, U_(-alpha,m) lies in z^(-1)I z exactly when <w(x),alpha_coroot><m, and in z^(-1)L--G z exactly when m< <w(x),alpha_coroot>. Preserve the strict inequalities and root sign.

- Test `AffineRootChart.identity_parameter` (degenerate): c=0 gives I for every exponent, including negative exponents; this point is not excluded by an exact-degree condition.
- Test `AffineRootChart.GL2_translation` (computation): For z=diag(v,1), z^(-1)(I+c v^m E_21)z=I+c v^(m+1)E_21, checking the positive exponent shift for alpha=e_1-e_2.
- Test `AffineRootChart.root_addition` (computation): In GL_2, (I+c v^m E_12)(I+d v^m E_12)=I+(c+d)v^m E_12 because E_12^2=0, over rings with nilpotents as well as fields.

### M13: Unipotent affine-cell subgroup and support

Source: Definitions4.2.9,4.2.14, PDF85.

- Use — LLHLM23 Proposition4.2.13 (M15): Parametrize the Schubert cell by zN_z with the correct left quotient.
- Use — LLHLM23 Corollaries4.2.15–16 and Theorem4.2.4 (M16/M17/M09): Count root supports and order the differential equations triangularly.

- `AffineCellSubgroup.mk` (constructor): Define N_z=z^(-1)L--G_F z intersect I_F as a subgroup functor of the common loop group.
- `AffineCellSubgroup.support` (data): Its finite-root support is the set of alpha for which U_(alpha,m) is contained for some integer m; this is a subgroup-family condition, not whether one chosen point has a nonzero coordinate.
- `AffineCellSubgroup.root_membership` (characterisation): For z=w^*, U_(-alpha,m) is contained exactly when <x,alpha_coroot><m< <w(x),alpha_coroot>, independent of the choice of x inside A0.
- `AffineCellSubgroup.polynomial_coordinates` (equivalence): Write the (-alpha)-entry as v^(delta_alpha_positive) f_alpha with degree at most floor(<w(x),alpha_coroot>)-ceil(<x,alpha_coroot>), and f_alpha=0 for a negative bound. Retain zero and lower-degree polynomials (E13).
- `AffineCellSubgroup.cell_map` (equivalence): The map N_z→I_F\LGL_n sending N to the left coset of zN is an isomorphism onto S_F^open(z), as in M15; it is not the map N↦Nz.
- `AffineCellSubgroup.support_count` (relation): Use M16 to characterize -alpha in the support by floor(<w(x),alpha_coroot>)>=ceil(<x,alpha_coroot>), and compute its cardinality by the critical-strip formula. This counts free differential parameters, not the total affine-cell dimension.

- Test `AffineCellSubgroup.identity_cell` (degenerate): For z=e, N_z is trivial and its support is empty; the Schubert cell is a point.
- Test `AffineCellSubgroup.GL2_simple_reflection` (computation): For the GL_2 permutation matrix z=s, N_s consists of I+c E_12 and has one support root and a one-dimensional cell.
- Test `AffineCellSubgroup.GL2_translation` (computation): For z=diag(v,1), N_z consists of I+c v E_21. The coefficient polynomial has bound zero and includes c=0; it need not have exact degree zero.
- Test `AffineCellSubgroup.support_not_pointwise` (non-example): The identity point lies in every N_z and has every off-diagonal coordinate zero, but N_s in the preceding example still has nonempty support.

### M18: Common zero-parameter differential affine flag

Source: Equation(4.7), PDF88.

- Use — LLHLM23 Proposition4.3.1 (M19): Provide a common ambient space for translating differential local models with different residue parameters.
- Use — LLHLM23 Definition4.3.2 and equation(4.9) (M20/M24): Take differential cell closures and compare their intrinsic labels inside one carrier.

- `ZeroDifferentialFlag.mk` (constructor): Take the fpqc sheafification of the left-coset presheaf I_F(R)\LGL_n(R) satisfying v A_prime A^(-1) in v^(-1)Lie I_F(R); identify it with the zero-parameter fibre of the universal differential locus.
- `ZeroDifferentialFlag.representative_invariance` (relation): For h in I_F, expand v(hA)_prime(hA)^(-1)=v h_prime h^(-1)+h(v A_prime A^(-1))h^(-1) and prove that the condition is unchanged.
- `ZeroDifferentialFlag.closed_inclusion` (structure): Export its closed immersion in the affine flag ind-scheme and the compatibility of this immersion with fpqc descent and coefficient maps.
- `ZeroDifferentialFlag.weyl_points` (example): Every chosen affine-Weyl monomial representative z satisfies the condition: v z_prime z^(-1) is a constant diagonal matrix after the permutation conjugation, and lies in v^(-1)Lie I.
- `ZeroDifferentialFlag.right_translation_comparison` (compatibility): For z=s^(-1)t_mu and a_bar=s^(-1)(mu) modulo p, right multiplication A↦Az identifies the translated a-differential intersection with the zero-differential intersection. It is not an assertion that arbitrary right translation preserves the zero-parameter locus.
- `ZeroDifferentialFlag.translation_derivative` (simp): Use v(Az)_prime(Az)^(-1)=v A_prime A^(-1)+A Diag(s^(-1)(mu))A^(-1), with the right-translation order fixed.

- Test `ZeroDifferentialFlag.constant_matrix` (computation): A constant invertible matrix has derivative zero and satisfies the zero-parameter condition.
- Test `ZeroDifferentialFlag.monomial_point` (computation): For z=diag(v^mu_i), v z_prime z^(-1)=Diag(mu), checking the affine-Weyl fixed-point inclusion in characteristic p.
- Test `ZeroDifferentialFlag.frobenius_poles` (non-example): In characteristic p, A=I+c v^(-p)E_12 has derivative zero and lies in the zero-differential flag. The common ambient locus has no uniform pole bound; do not replace it by one bounded local model.

### M20: Translated differential cells and their closures

Source: Definition4.3.2, PDF88–89.

- Use — LLHLM23 Propositions4.3.5–6 (M22/M23): Compare closures after eliminating the second dominant factor and changing the finite Weyl representative.
- Use — LLHLM23 Theorem4.3.9 (M25): Identify the correctly ordered translation with the intrinsic alcove-pair component.

- `TranslatedDifferentialCell.open_cell` (constructor): For w1,w2 in Wtilde-plus and s in Wtilde, define the translated locally closed cell S_F^open((w2^(-1)w0w1)^*)s^* inside the affine flag, using the chosen star and embedding conventions.
- `TranslatedDifferentialCell.differential_intersection` (constructor): Intersect that locally closed cell with Fl_nabla0 as a scheme fibre product before taking any closure.
- `TranslatedDifferentialCell.closure` (constructor): Take the closure of this differential intersection inside Fl_nabla0. In the genericity range the intersection is an affine space, so its schematic closure is reduced and irreducible; retain the distinction from intersecting the closure of the full Schubert cell.
- `TranslatedDifferentialCell.dense_open` (structure): Under M21 hypotheses, the differential cell is a dense open affine space of dimension d in its own irreducible closure; record the immersion and the common ambient map.
- `TranslatedDifferentialCell.remove_second_factor` (compatibility): Under M22 smallness and genericity hypotheses, identify S_nabla0(w1,w2,s) with S_nabla0(w1,e,s w2^(-1)), preserving the displayed multiplication order.
- `TranslatedDifferentialCell.finite_weyl_invariance` (relation): For w1 in Wtilde1-plus and (n-1)-generic s, M23 identifies the closure at s with the closure at s w^(-1) for w in the finite Weyl group. It does not identify all open cells.

- Test `TranslatedDifferentialCell.second_factor_identity` (degenerate): For w2=e, the open Schubert label is (w0w1)^* and the right translator is s^*; removing the second factor changes nothing.
- Test `TranslatedDifferentialCell.order_countercheck` (non-example): As affine transformations of Z^2, take s(x1,x2)=(7+x2,x1) and w2(x)=x+(1,0). Then s w2^(-1)(0)=(7,-1), whereas w2^(-1)s(0)=(6,0). The two expressions in E14 cannot be interchanged.
- Test `TranslatedDifferentialCell.closure_intersection_warning` (non-example): In A^2, let U be the punctured x-axis and C the y-axis. Closure(U intersect C) is empty, but closure(U) intersect C is the origin. This tests the order of operations; the source-specific strictness remains Remark4.3.3(2), not an identification with this toy example.

### M24: Intrinsic component indexed by an alcove pair

Source: Equation(4.9), PDF91.

- Use — LLHLM23 Theorems4.3.9–10 (M25/M26): Identify translated top components independently of the chosen local-model Hodge bound.
- Use — LLHLM23 Definition4.6.1 and Proposition4.7.2 (M29/M32): Attach a component to a compatible Serre weight and enumerate its obvious fixed points.

- `IntrinsicAlcoveComponent.mk` (constructor): For w1 in Wtilde1-plus and (n-1)-generic translation t_omega, choose s with s(0)=omega and take S_nabla0(w1,e,s). The domain includes both the alcove and genericity conditions.
- `IntrinsicAlcoveComponent.choice_independent` (extensionality): If s(0)=s_prime(0)=omega, express s_prime=s w^(-1) for a finite Weyl element and apply M23 to identify the closed subvarieties in Fl_nabla0.
- `IntrinsicAlcoveComponent.central_relation` (relation): For nu in X0(T), the pairs (w1,omega) and (t_nu w1,omega-nu) define the same closed subvariety, with the induced equality of ambient immersions.
- `IntrinsicAlcoveComponent.geometry` (structure): Export a dense open A^d_F, geometric irreducibility and dimension d of the resulting reduced closed variety, proving the field-extension comparison from this affine chart before using product irreducibility.
- `IntrinsicAlcoveComponent.translated_identification` (compatibility): Under M25 hypotheses, identify S_nabla0(w1,w2,s) with C_(w1,s w2^(-1)(0)); preserve E14’s corrected order.
- `IntrinsicAlcoveComponent.obvious_fixed_points` (example): For each finite Weyl w, the chosen affine-Weyl point (t_omega w w1)^* belongs to C_(w1,omega), as in M32. Completeness of this list is not asserted.

- Test `IntrinsicAlcoveComponent.finite_representative_change` (compatibility): Replacing the chosen s by s u^(-1), for a finite Weyl u, leaves s(0)=omega and the component unchanged even when the corresponding open charts differ.
- Test `IntrinsicAlcoveComponent.central_shift` (computation): In GL_2, shifting w1 by the central translation t_(1,1) and omega by -(1,1) leaves C unchanged; the two operations must be paired.
- Test `IntrinsicAlcoveComponent.GL2_dimension_fixed_points` (computation): For w1=e and omega=(3,0) at p=11, the genericity bound n-1=1 holds, d=1, and both t_omega and (t_omega s)^* give the distinct obvious fixed points after applying the indicated star convention.

### M27: Torus torsors over the special-fibre flag

Source: §4.4, PDF93.

- Use — LLHLM23 Proposition4.5.1 (M28): Supply the vertical maps in the Cartesian square of product local-model translations.
- Use — LLHLM23 Section4.4 component lift: Lift C_(w,omega) to an irreducible variety of dimension d+n without positing a global integral torsor.

- `FlagTorusTorsor.mk` (constructor): Let I1 be the subgroup of I whose reduction modulo v is upper unipotent. Sheafify I1\LGL_n and map to I\LGL_n; identify I/I1 with the split diagonal torus Tdual.
- `FlagTorusTorsor.fiber_action` (structure): The torsor action is left multiplication by I/I1: D acts on [A]_(I1) by [DA]_(I1). Prove normality of I1 in I, representative independence and the torsor isomorphism Tdual×Fl_tilde ≅ Fl_tilde×_Fl Fl_tilde. Distinguish this action from right diagonal translation on the base flag.
- `FlagTorusTorsor.pullback` (functoriality): For a closed subspace Y of the special-fibre flag, define its lift as Y×_Fl Fl_tilde. Pullback preserves the torsor comparison and commutes with identity/composition of maps of Y.
- `FlagTorusTorsor.smooth_dimension` (structure): The projection is a smooth Tdual-torsor of relative dimension n. For the geometrically integral component C with dense A^d chart, prove its lift is irreducible of dimension d+n via the smooth locally trivial torsor; this does not apply to an arbitrary disconnected Y.
- `FlagTorusTorsor.right_translation` (compatibility): Right translation A↦Az on both quotients commutes with the left torsor action. Apply M19 to obtain the Cartesian square(4.10), including the restricted differential loci.
- `FlagTorusTorsor.scope_special_fiber` (data): Only the special-fibre torsors are defined here. Import the later chartwise O-torsors where needed; do not assert that section4.4 constructs a global integral lift.

- Test `FlagTorusTorsor.identity_fiber` (computation): The fibre over the identity I-coset is I1\I≅Tdual, with the usual free transitive left diagonal action.
- Test `FlagTorusTorsor.left_right_actions_differ` (non-example): At the identity base flag, right diagonal translation fixes the base point, while left diagonal multiplication on its torsor fibre is free. They are different actions and must not be identified.
- Test `FlagTorusTorsor.rank_two_dimension` (computation): For a GL_2 intrinsic component d=1, its torsor lift has dimension 1+2=3, not one.
- Test `FlagTorusTorsor.translate_action_commutes` (compatibility): For diagonal D, loop A and chosen z, (DA)z=D(Az), so the lifted right-translation square respects the left torsor action without commuting D past z.

### M28: Product models, components and torsor comparison

Source: §4.5, Proposition4.5.1, PDF94–95.

- Use — LLHLM23 Theorem4.6.2 (M30): Assemble factorwise component labels into the product component indexed by a Serre weight.
- Use — LLHLM23 Section4.5, equation(4.11): Compare all components and their torsor lifts in one product differential flag.

- `ProductMonodromyModel.mk` (constructor): For a finite indexing set J, take the products of all bounded/flat/naive local models over the same coefficient DVR O, and products of their special fibres over F.
- `ProductMonodromyModel.projections_reindex` (functoriality): Export projections and coherent reindexing under bijections of J, with identity/composition and the induced reindexing of lambda,a,w,omega and the product torus.
- `ProductMonodromyModel.fiber_comparison` (compatibility): Generic and special fibre commute with these finite fibre products. The coefficient base is shared; these are not products over Z and not unrelated completed tensor products.
- `ProductMonodromyModel.component_product` (structure): Define C_(w,omega)=product_j C_(w_j,omega_j), prove geometric irreducibility from the factorwise dense affine charts, and obtain dimension |J|d; the torus lift has dimension |J|(d+n). Irreducibility of arbitrary F-varieties alone is insufficient for this product conclusion.
- `ProductMonodromyModel.cartesian_translation` (compatibility): For z_j=s_j^(-1)t_(mu_j) and a_j congruent s_j^(-1)(mu_j) modulo varpi in every factor, construct Proposition4.5.1’s Cartesian square. The horizontal maps are closed immersions and the vertical maps smooth Tdual^J-torsors.
- `ProductMonodromyModel.admissible_product` (data): Identify Adm(lambda) and Admreg(lambda) with the factorwise products, retaining regularity and genericity hypotheses factor by factor rather than only after summing dimensions.

- Test `ProductMonodromyModel.singleton` (degenerate): For a singleton J, the models, diagrams and dimension formulas agree with the corresponding one-factor construction.
- Test `ProductMonodromyModel.empty_product` (degenerate): For an abstract empty finite J, the product over O is Spec O, its special fibre is Spec F, the product torus is trivial and both relative dimensions are zero.
- Test `ProductMonodromyModel.two_GL2_factors` (computation): For two GL_2 factors, d_J=2 and the lifted component has dimension 2+2*2=6; the product torus has rank four.
- Test `ProductMonodromyModel.irreducibility_field_boundary` (non-example): Spec C is irreducible over R but Spec(C tensor_R C) is a disjoint union of two points. The product argument must use the geometric irreducibility supplied by the affine-space charts.

### M29: Component labelled by a Serre weight and central lift

Source: Definition4.6.1, PDF95.

- Use — LLHLM23 Theorem4.6.2 (M30): Label top-dimensional naive-model components by the actual Jordan–Hölder Serre weights under a sufficient genericity bound.
- Use — LLHLM23 Theorem4.7.6 (M35–M37): Compare obvious and predicted Serre weights with membership of the inertial-parameter fixed point in C_sigma^zeta.

- `SerreWeightComponent.domain` (data): Input an (n-1)-deep Serre weight sigma and an algebraic central lift zeta for which a zeta-compatible lowest-alcove presentation exists. Retain compatibility as input, rather than assuming every arbitrary central lift is admissible.
- `SerreWeightComponent.mk` (constructor): Choose a representative (w1,omega) of that compatible lowest-alcove presentation and set C_sigma^zeta=C_(w1,omega), using the component construction already made in M24/M28.
- `SerreWeightComponent.representative_independent` (extensionality): Use uniqueness of the compatible lowest-alcove presentation modulo X0(T)^J and M24’s central relation to prove equality for any two representatives.
- `SerreWeightComponent.product_formula` (compatibility): For the factorwise presentation, C_sigma^zeta=product_j C_(w_(1,j),omega_j), as in equation(4.12), with all products over the common residue field.
- `SerreWeightComponent.dimension_torsor` (structure): Export the reduced geometrically irreducible closed subvariety of dimension d_J and its previously defined Tdual^J-torsor lift of dimension d_J+n|J|.
- `SerreWeightComponent.generic_label_domain` (relation): When using M30, require a bound that actually makes every constituent (n-1)-deep; use the retained E15 repair max{2n,h_lambda+n-1}. The printed max{2n,h_lambda} is not sufficient to define every proposed label.
- `SerreWeightComponent.fixed_point_interface` (compatibility): Under M35–M37 hypotheses, obvious weight membership implies the parameter point lies on C; lying on C implies predicted weight membership; the reverse implication needs the polynomial nonvanishing hypothesis. Do not identify all three assertions without that extra condition.

- Test `SerreWeightComponent.central_equivalent_presentations` (compatibility): Replacing each (w_(1,j),omega_j) by (t_(nu_j)w_(1,j),omega_j-nu_j) with nu_j central preserves the component and product formula.
- Test `SerreWeightComponent.depth_boundary_E15` (non-example): In the retained GL_2/F_19 example R_s(7,0), lambda=(6,0), the constituent det^6 is not 1-deep. Under the printed bound its symbol C_(det^6)^zeta is outside this definition’s domain; no default empty component is inserted.
- Test `SerreWeightComponent.singleton_dimension` (computation): For a compatible 1-deep GL_2 weight with one embedding, the component dimension is one and its torus-lift dimension is three.
- Test `SerreWeightComponent.central_lift_is_data` (non-example): A Serre weight without a specified compatible algebraic central lift does not determine the particular closed subvariety C_sigma^zeta in the common affine flag under this definition.

### K01: Tame descent coefficient rings

Source: §5.1, PDF99–100.

- Use — LLHLM23 Definitions5.1.1–5.1.4 (K03–K06): Supply the coefficient rings, cyclic embedding indices, Frobenius and descent actions.
- Use — LLHLM23 Section5.4 (K25/K26): Supply the coefficient maps for inverting the Kisin parameter and taking descent invariants.

- `TameDescentCoefficients.mk` (constructor): From the fixed 1-generic presentation (s,mu), set r=ord(s_0...s_(f-1)), f_prime=fr and e_prime=p^f_prime-1. Choose the stated unramified extension and pi_prime with pi_prime^e_prime=-p; construct S_Lprime,R=(W(k_prime) tensor R)[[u_prime]] for the source p-adically complete coefficient algebras.
- `TameDescentCoefficients.frobenius` (structure): Define phi by Witt Frobenius on W(k_prime), the identity on R and u_prime↦u_prime^p. Prove continuity and compatibility with the coefficient embedding; do not replace its action on R by absolute Frobenius.
- `TameDescentCoefficients.descent_action` (structure): Gamma_prime scales u_prime by the fundamental character and the chosen unramified generator acts on W(k_prime), fixes u_prime and acts trivially on R. Verify the semidirect-product relation and commutation with phi.
- `TameDescentCoefficients.invariants` (equivalence): Identify the full Gamma-invariant ring with (W(k) tensor R)[[v]], v=u_prime^e_prime, and carry the Eisenstein factor to E(v)=v+p. Keep the full Gamma invariants distinct from Gamma_prime invariants.
- `TameDescentCoefficients.embedding_components` (equivalence): For sigma_jprime=sigma_0prime Frob^(-jprime), decompose the coefficient algebra by J_prime=Z/f_prime. Restriction to k is jprime↦jprime mod f, and phi sends the jprime-1 component to the jprime component.
- `TameDescentCoefficients.coefficient_map` (functoriality): A continuous coefficient-algebra map induces a map of these completed power-series rings commuting with phi, descent and the embedding projections. Establish identity and composition before base changing modules.

- Test `TameDescentCoefficients.rank_one_extension` (degenerate): For r=1 the unramified extension is trivial, J_prime=J and e_prime=p^f-1; there is still generally nontrivial tame ramification.
- Test `TameDescentCoefficients.Frobenius_fixes_coefficients` (non-example): For R=F_p[t], the formal coefficient rule is phi(t)=t whereas absolute Frobenius sends t to t^p. This distinguishes the rule before any completion hypotheses needed for the module category.
- Test `TameDescentCoefficients.cyclic_target` (computation): For f_prime=3, the source of partial Frobenius at target jprime=0 is component 2, not component 1.

### K02: Integral Iwahori and its pro-unipotent subgroup

Source: §5.1, PDF100–101.

- Use — LLHLM23 Proposition5.1.8 (K08): Identify permissible eigenbasis changes after the orientation conjugation.
- Use — LLHLM23 Sections5.2–5.3 (K14/K18/K20): Supply the full basis group, its pro-unipotent subgroup and the residual torus action.

- `IntegralIwahori.subgroup` (constructor): Define I(R) as the inverse image of the upper-triangular Borel under GL_n(R[[v]])→GL_n(R); define I1 using the upper-unitriangular subgroup, with diagonal entries 1 modulo v.
- `IntegralIwahori.diagonal_quotient` (equivalence): The diagonal entries modulo v give a surjective homomorphism I→Tdual with kernel I1. Constant diagonal matrices split it, giving I=Tdual semidirect I1 and a unique factorization after fixing the order.
- `IntegralIwahori.map` (functoriality): Coefficient maps preserve both subgroups and commute with diagonal reduction, the torus section and factorization.
- `IntegralIwahori.shifted_series` (equivalence): For p-adically complete Noetherian R in the source category, construct the continuous substitution isomorphism R[[v+p]]≅R[[v]]. Explain convergence of every coefficient sum; identify I with L+G_O on this domain.
- `IntegralIwahori.localized_shift` (compatibility): For p-nilpotent R, the shifted and unshifted Laurent rings identify because v+p=v(1+p/v) has a finite geometric-series inverse. This argument does not give the same Laurent-ring comparison over arbitrary O-algebras.
- `IntegralIwahori.Lie_kernel` (characterisation): The Lie algebra of I1 has strictly upper-triangular reduction modulo v. In particular, its constant diagonal coefficients vanish; retain this constraint in the infinitesimal gauge calculation K19.

- Test `IntegralIwahori.unipotent_not_identity` (non-example): I+E_12 lies in I1 for n=2 although its reduction is not the identity. I1 is larger than the kernel of reduction modulo v.
- Test `IntegralIwahori.diagonal_excluded` (non-example): A constant diag(a,1) with a a unit different from 1 belongs to I but not I1.
- Test `IntegralIwahori.nilpotent_shift` (computation): Over Z/125, (v+5)^(-1)=v^(-1)-5v^(-2)+25v^(-3); multiplying by v+5 gives 1. The negative terms must be retained.

### K03: Breuil–Kisin module of bounded height

Source: Definition5.1.1, PDF101.

- Use — LLHLM23 Definition5.1.2 (K04): Add tame descent without changing the bounded-height Frobenius condition.
- Use — LLHLM23 Propositions5.1.8 and5.5.9 (K08/K43): Express height in oriented matrices and preserve it under semisimplification.

- `HeightBoundedKisinModule.mk` (constructor): A datum is a finite projective constant-rank-n S_Lprime,R-module and an injective S-linear map Phi:phi* M→M whose cokernel is annihilated by E(v)^h, with h>=0.
- `HeightBoundedKisinModule.linearization` (equivalence): Relate Phi to a phi-semilinear map on M using the tensor-product universal property. Preserve the distinction between injectivity of Phi and surjectivity of the underlying semilinear map.
- `HeightBoundedKisinModule.height_factorization` (characterisation): The height condition is equivalent to existence of Psi:M→phi* M with Phi Psi=E^h and Psi Phi=E^h; use injectivity of Phi for the second identity and uniqueness.
- `HeightBoundedKisinModule.partial_Frobenius` (data): Decompose Phi into maps phi* M^(jprime-1)→M^(jprime), with the superscript naming the target. Direct sum of these partial maps reconstructs Phi.
- `HeightBoundedKisinModule.matrix_height` (characterisation): After choosing local free bases, the raw matrix C has integral entries and E^h C^(-1) has integral entries in the localization by E; prove equivalence with the module height condition under the source E-regularity hypotheses.
- `HeightBoundedKisinModule.base_change` (functoriality): Construct completed coefficient base change, including finite projectivity and the height factorization. Prove injectivity after base change using E-regularity in the target source ring, rather than asserting that arbitrary tensoring preserves injections.

- Test `HeightBoundedKisinModule.height_zero` (degenerate): For h=0, Psi is an inverse to Phi: the linearized Frobenius is an isomorphism.
- Test `HeightBoundedKisinModule.rank_one_height` (computation): In a free rank-one component with Phi multiplication by E^c, the height bound holds exactly when 0<=c<=h, in an E-regular power-series ring with E a nonunit.
- Test `HeightBoundedKisinModule.wrong_partial_index` (non-example): On three cyclic embedding components, a matrix at target 0 acts on phi* M^2; using M^1 fails the coefficient idempotent compatibility.

### K04: Tame descent type on Breuil–Kisin modules

Source: Definition5.1.3 and Remark5.1.4, PDF101–102.

- Use — LLHLM23 Definitions5.1.3–5.1.4 (K05/K06): Choose character eigenbases and descend the oriented matrices to J.
- Use — LLHLM23 Proposition5.2.1 and Section5.4 (K15/K26): Present the stack by basis changes and descend its associated etale module.

- `KisinDescentType.mk` (constructor): Add a semilinear Gamma-action commuting with Phi and require M^(jprime)/u_prime M^(jprime)≅tau_dual tensor R as a Gamma_prime-representation, for every jprime.
- `KisinDescentType.unramified_cocycle` (equivalence): Starting with Gamma_prime descent, extending to Gamma is equivalent to an isomorphism iota_M:(sigma^f)*M→M satisfying the order-r cocycle and the specified conjugation relation with Gamma_prime.
- `KisinDescentType.equivariant_morphism` (data): A morphism is S-linear and commutes with both linearized Frobenius and every descent operator. These conditions are preserved by identity, composition and coefficient base change.
- `KisinDescentType.type_locality` (compatibility): The prescribed type is a local isomorphism condition on the character eigensummands of M/u_prime M. Use the invertibility of |Gamma_prime| to construct projectors; do not infer global free eigenbases from finite projectivity.
- `KisinDescentType.forget` (functoriality): Forget descent to K03 and retain its height bound. Keep the type condition on the mod-u_prime fibres, not on arbitrary choices of raw Frobenius matrices.
- `KisinDescentType.formal_stack` (structure): Package descent of objects and isomorphisms and import the formal algebraicity theorem from CEGS/Caraiani–Levin with its coefficient hypotheses. The type is tau_dual because the later Galois functor is contravariant.

- Test `KisinDescentType.trivial_unramified_cocycle` (degenerate): When r=1, the unramified cocycle forces the corresponding descent identification to be the identity after the canonical coefficient identification.
- Test `KisinDescentType.dual_character` (computation): For rank one of tame type chi, the eigenline in M/u_prime M carries chi^(-1), not chi.
- Test `KisinDescentType.cocycle_required` (non-example): For a cyclic descent group of order 2 acting trivially on coefficients, a chosen scalar identification c with c^2!=1 does not extend to descent data.

### K05: Eigenbasis with descent compatibility

Source: Definition5.1.6, PDF102.

- Use — LLHLM23 Definition5.1.4 and Proposition5.1.8 (K06/K08): Define oriented matrices and their change-of-basis rule.
- Use — LLHLM23 Proposition5.2.7 (K19): Refine an eigenbasis to a gauge basis under the genericity and completeness assumptions.

- `DescentEigenbasis.mk` (constructor): Choose an ordered basis beta^(jprime) in each embedding summand, whose ith vector has character chi_i^(-1), relative to the fixed lowest-alcove presentation.
- `DescentEigenbasis.unramified_compatibility` (relation): Require compatibility with iota_M with the source permutation s_tau. It is compatibility of the corresponding unordered bases with a specified reordering, not equality of their ordered lists.
- `DescentEigenbasis.local_existence` (relation): After the allowed Zariski localization of the coefficient base, lift the character basis modulo u_prime to an eigenbasis using tame projectors and the source lifting theorem.
- `DescentEigenbasis.transition` (characterisation): Given beta_2 D=beta_1, characterize D by the descent characters and unramified compatibility. Orientation conjugation turns D into a J-periodic tuple in I; the inverse conjugation reconstructs D.
- `DescentEigenbasis.basis_torsor` (structure): On a locus with an eigenbasis, changes form a torsor for I^J under the established transition equivalence. State the action order using beta_2 D=beta_1.
- `DescentEigenbasis.coefficient_map` (functoriality): Base change sends every basis vector and its character relation to the corresponding eigenbasis and preserves the unramified permutation.

- Test `DescentEigenbasis.rank_one_scaling` (computation): Scaling a rank-one eigenbasis by a coefficient unit preserves its character, with the cyclic descent compatibility imposed on the full tuple.
- Test `DescentEigenbasis.permuted_order` (non-example): If s_tau is the transposition of two distinct character lines, the unramified map exchanges their positions. Requiring the ordered tuple to be fixed rejects a valid eigenbasis.
- Test `DescentEigenbasis.basis_not_automatic` (non-example): A finite projective module need not be globally free. The constructor requires a basis or a local trivialization; the module structure alone is insufficient.

### K06: Oriented partial Frobenius matrices

Source: Equations(5.1)–(5.4), PDF102–103.

- Use — LLHLM23 Proposition5.1.8 and Definition5.1.9 (K08/K09): Compute basis changes and define shape.
- Use — LLHLM23 Proposition5.4.2 (K28): Convert the normalized Kisin matrix into the etale Frobenius matrix by right multiplication.

- `OrientedKisinMatrix.orientation_data` (constructor): Define alpha_prime_(j+kf)=s_tau^(-k)alpha_j, a_prime^(jprime)=sum_(i=0)^(fprime-1) p^i alpha_prime_(-jprime+i), and sor_prime_(j+kf)=s_tau^(k+1)s_(f-1)^(-1)...s_(j+1)^(-1). Keep this order and the empty product convention.
- `OrientedKisinMatrix.normalize` (data): For the raw target-indexed partial Frobenius matrix C^(jprime), set A^(jprime)=Ad((sor_prime)^(-1) diag(u_prime^(-a_prime)))(C^(jprime)). Construct the descent-invariant entries in the v-loop ring.
- `OrientedKisinMatrix.periodicity_height` (characterisation): Prove A depends only on jprime modulo f, belongs to L+M, and E^h A^(-1) belongs to L+M. The latter two conditions are equivalent to the height condition for the reconstructed eigenbasis object.
- `OrientedKisinMatrix.basis_change` (relation): If beta_2 D=beta_1 and I_j=Ad((sor_prime)^(-1)u_prime^(-a_prime))(D^(jprime)), then A_beta2^j=I_j A_beta1^j Ad(z_tau,j)(phi(I_(j-1)))^(-1), where z_tau,j=s_j^(-1)v^(mu_j+eta_j).
- `OrientedKisinMatrix.reconstruct` (equivalence): For a J-periodic tuple satisfying the two Iwahori matrix bounds, reverse the orientation conjugation and equip the free modules with the specified character and unramified descent data. Prove the two constructions inverse up to the basis-preserving isomorphism used in K15.
- `OrientedKisinMatrix.etale_matrix` (compatibility): In the descended invariant basis, the etale partial Frobenius matrix is A_beta^j z_tau,j. The factor occurs on the right; this is not generally z_tau,j A_beta^j.

- Test `OrientedKisinMatrix.identity_basis_change` (degenerate): I_j=1 in every component fixes A_j.
- Test `OrientedKisinMatrix.noncommuting_etale_factor` (computation): For A=I+cE_12 and z=diag(v,1), A z has upper-right entry c whereas z A has upper-right entry vc.
- Test `OrientedKisinMatrix.constant_cyclic_change` (computation): In rank one with constants d_j, phi fixes d_j, and A_beta2^j=d_j A_beta1^j d_(j-1)^(-1). For one embedding this scalar action is trivial.

### K09: Shape of a residual Kisin module

Source: Definition5.1.9, PDF105.

- Use — LLHLM23 Definition5.2.6 (K18): Place every shape-z field point in the z-gauge open.
- Use — LLHLM23 Corollary5.3.5 and Definition5.5.5 (K24/K39): Relate shape to Hodge admissibility and transfer it to residual Galois representations.

- `ResidualKisinShape.double_coset` (constructor): Over a field Fprime/F, define shape z by A_beta^j∈I(Fprime) z_j I(Fprime) for all j, relative to the fixed type presentation.
- `ResidualKisinShape.unique` (extensionality): Use the affine Bruhat decomposition to prove uniqueness of z; assemble componentwise uniqueness for the J-tuple.
- `ResidualKisinShape.basis_independent` (compatibility): Apply K08 and the stated Iwahori containment of the Frobenius-conjugated transition factor to prove independence of beta.
- `ResidualKisinShape.field_extension` (functoriality): Prove shape is preserved by field extension using the base-change-compatible Schubert-cell decomposition, not a general ring-point double-coset classification.
- `ResidualKisinShape.gauge_open` (relation): A shape-z point belongs to the z-gauge open; the converse asserts more than open membership and must not be exported.
- `ResidualKisinShape.admissible_bound` (compatibility): Under K24, membership in Y^<=lambda,tau is equivalent to shape in Adm-dual(lambda). Retain the source hypotheses needed to use the local-model diagram.

- Test `ResidualKisinShape.rank_one_valuation` (computation): For n=1 at p=0, A=v^c u with u a power-series unit has shape c; multiplying by I on either side leaves c unchanged.
- Test `ResidualKisinShape.valuation_boundary` (non-example): v^c and v^(c+1) have different rank-one shapes over a field.
- Test `ResidualKisinShape.field_domain` (non-example): Over F[epsilon]/(epsilon^2), do not define a unique Weyl label merely by reusing the field-point double-coset constructor; families require the chart/stratification interfaces.

### K13: Height-bounded loop spaces

Source: §5.2, equation(5.5), PDF106–107.

- Use — LLHLM23 Proposition5.2.1 (K15): Present bounded-height Kisin modules by the Frobenius-twisted quotient.
- Use — LLHLM23 Proposition5.4.6 (K33): Supply the ordinary residual bounded flags used after translation.

- `HeightBoundedLoops.mixed_bounds` (constructor): For a<=b, impose (v+p)^(-a)g∈L+M_O and (v+p)^b g^(-1)∈L+M_O; quotient on the left by L+G_O to define Gr^[a,b].
- `HeightBoundedLoops.residual_bounds` (constructor): Separately impose v^(-a)A and v^b A^(-1) in Mat_n(R[[v]]) and quotient on the left by I to define Fl^[a,b]. No upper-triangular-mod-v condition is part of these two ordinary matrix bounds.
- `HeightBoundedLoops.central_shift` (equivalence): Multiplication by the central scalar (v+p)^m shifts mixed bounds [a,b] to [a+m,b+m]; v^m gives the corresponding residual equivalence.
- `HeightBoundedLoops.relax_bounds` (functoriality): If a_prime<=a and b<=b_prime, inclusion of bounds induces a closed inclusion of the corresponding bounded quotients, compatible with composition.
- `HeightBoundedLoops.finite_type_closed` (structure): Import/prove the finite-type closed bounded affine-flag construction for Fl^[a,b], retaining its immersion in the ambient affine flag.
- `HeightBoundedLoops.special_fiber_comparison` (relation): Reduction gives a natural subspace Gr^[a,b]_F inside Fl^[a,b], in general strictly smaller. Establish the comparison through the Iwahori matrix bounds rather than declaring the two definitions equal.

- Test `HeightBoundedLoops.rank_one_interval` (computation): For A=v^c over a field, both bounded conditions hold precisely when a<=c<=b.
- Test `HeightBoundedLoops.central_shift_test` (compatibility): A rank-one exponent c in [a,b] becomes c+m in [a+m,b+m].
- Test `HeightBoundedLoops.Iwahori_strictness` (non-example): For n=2 and [a,b]=[0,0], the constant permutation matrix exchanging the two coordinates satisfies the ordinary bounds but is not upper triangular modulo v. Its left-I coset is not in the mixed special-fibre bound.

### K14: Twisted conjugation actions

Source: §5.2, PDF107.

- Use — LLHLM23 Proposition5.2.1 and Lemma5.2.2 (K15/K16): Form the quotient stack and solve the residual straightening equation.
- Use — LLHLM23 Theorem5.3.1 and Warning5.3.2 (K20): Distinguish the torus actions in the two chart quotients and the obstruction to gluing over O.

- `TwistedKisinAction.Frobenius_action` (constructor): For z_j=s_j^(-1)v^(mu_j+eta_j), define (I star_phi A)_j=I_j A_j Ad(z_j)(phi(I_(j-1)))^(-1). Retain the cyclic predecessor index.
- `TwistedKisinAction.ordinary_action` (constructor): Define star by the same formula with phi omitted. Prove the respective domain is preserved using the source genericity and height estimates when those are required.
- `TwistedKisinAction.action_laws` (structure): Prove 1 star A=A and I star (J star A)=(IJ) star A componentwise, for each action, by the homomorphism property of phi and Ad(z).
- `TwistedKisinAction.torus_agreement` (relation): On constant diagonal tuples, phi acts identically, so star_phi and star agree. This equality does not identify either action with ordinary left translation on the chart.
- `TwistedKisinAction.straightening_equation` (compatibility): In the residual generic domain, solving X=I A Ad(z)(phi(I_prev))^(-1) A^(-1) is equivalent to I=X A Ad(z)(phi(I_prev)) A^(-1). Use the contraction theorem K16 with the retained E17 correction.
- `TwistedKisinAction.mixed_gluing_boundary` (relation): Preserve Warning5.3.2: the quotient change that straightens the residual action need not take values in I1 over a mixed-characteristic thickening. Do not glue the integral local-model diagrams merely from the residual comparison.

- Test `TwistedKisinAction.one_component_rank_one_torus` (degenerate): For |J|=1 and n=1, constant torus twisted conjugation is trivial, whereas left multiplication by the same scalar generally is not.
- Test `TwistedKisinAction.Frobenius_not_ordinary` (non-example): Over F_p[[v]], phi(1+v)=1+v^p, so the full power-series group actions are not identified by their agreement on constants.
- Test `TwistedKisinAction.negative_poles_in_thickening` (computation): For p=11 in R=Z/11^5, v^3/(v+11)=v^2-11v+121-1331v^(-1)+14641v^(-2). Thus 1-v^3/(v+11) has negative Laurent coefficients, unlike its reduction modulo 11. This tests the pole mechanism of Warning5.3.2, without asserting a separately chosen type presentation.

### K18: Gauge opens and gauge bases

Source: Definitions5.2.4,5.2.6, PDF109–110.

- Use — LLHLM23 Proposition5.2.7 (K19): Produce gauge bases, with torus ambiguity, on the formal open.
- Use — LLHLM23 Theorems5.3.1/5.3.3 and Definition5.5.6 (K20/K22/K40): Compare chart geometry with the local model and define semisimple Kisin points.

- `KisinGaugeChart.residual_open` (constructor): Use the U(z)T chart and the residual quotient presentation to define Y_F^[0,h],tau(z) as an open substack.
- `KisinGaugeChart.formal_open` (equivalence): Lift this open uniquely to the p-adic formal stack through the identification of its underlying topological space with that of its special fibre.
- `KisinGaugeChart.gauge_basis` (data): A z-gauge basis is an eigenbasis with A_beta^j∈Tdual(R)U(z_j)(R) for every j. Keep the torus factor on the specified side.
- `KisinGaugeChart.existence` (relation): For the source complete Noetherian coefficient algebras and (h+1)-deep mu, prove that an object in this open admits gauge bases Zariski locally, using K19 and its corrected infinitesimal calculation.
- `KisinGaugeChart.uniqueness` (structure): Under the same hypotheses, gauge eigenbases form the stated Tdual^J torsor. The uniqueness assertion concerns eigenbases satisfying gauge, not arbitrary bases of the underlying module.
- `KisinGaugeChart.shape_implication` (relation): Over a field, shape z implies membership in the z-gauge open. Distinguish this open neighbourhood from the locally closed fixed-shape stratum.

- Test `KisinGaugeChart.fixed_point_in_chart` (computation): The distinguished monomial point z belongs to its own chart and has shape z.
- Test `KisinGaugeChart.infinitesimal_diagonal` (non-example): A nonzero constant diagonal infinitesimal matrix belongs to Lie I but not Lie I1; it cannot be used as an I1 gauge correction in K19.
- Test `KisinGaugeChart.open_not_stratum` (non-example): A proof of open membership after deformation supplies gauge, not constancy of the Schubert-cell label; fixed shape requires a separate locally closed condition.

### K21: Bounded Hodge-type Kisin substack

Source: §5.3, PDF114.

- Use — LLHLM23 Theorem5.3.3 and Corollary5.3.5 (K22/K24): Pull back bounded local models and characterize the possible residual shapes.
- Use — LLHLM23 Proposition5.5.9 (K43): Preserve the closed Hodge bound under the semisimplification family.

- `BoundedHodgeKisinStack.domain` (data): Use an effective dominant tuple lambda with each entry in [0,h]; record the ambient height h and the fixed descent type tau.
- `BoundedHodgeKisinStack.flat_reduced_closure` (constructor): Construct the O-flat formal closed substack with reduced versal rings and the prescribed finite-DVR point condition. Generic point data alone is not a substitute for the flat/reduced construction.
- `BoundedHodgeKisinStack.DVR_point_criterion` (characterisation): For a finite extension Eprime/E with integers Oprime, an Oprime-point belongs exactly when its Hodge type is <=lambda in the source partial order.
- `BoundedHodgeKisinStack.elementary_divisors` (equivalence): Identify this criterion with A_beta^j in the generic Schubert closure S_E(lambda_j) by the graded chi-isotypic pieces of M/E(v)M. Preserve the (v+p)-adic parameter and the target embedding convention.
- `BoundedHodgeKisinStack.chart_pullback` (compatibility): Under K22, pull back to U(z,<=lambda) in the gauge diagram; prove equality of the integral closed subspaces using the stated flatness, reducedness and DVR-point detection hypotheses.
- `BoundedHodgeKisinStack.bound_inclusion` (functoriality): A dominant lambda_prime<=lambda with the same central class induces inclusion of the Hodge-bounded substacks inside the common height stack, compatible with the local-model inclusion.

- Test `BoundedHodgeKisinStack.rank_one_exact_weight` (computation): For a rank-one partial matrix (v+p)^c times a unit, the Hodge weight is c. For lambda=c, its finite-DVR point has the required type.
- Test `BoundedHodgeKisinStack.wrong_central_class` (non-example): For rank one, distinct weights do not become ordered merely as integers: the dominance order within a fixed central class is equality.
- Test `BoundedHodgeKisinStack.generic_points_insufficient` (non-example): The closed subschemes of Spec O[x] given by (x) and (varpi*x) have equal generic fibres but different integral structures. The latter is not O-flat; the flatness condition in the constructor cannot be omitted.

### K25: Etale Frobenius modules with descent

Source: §5.4.1, PDF116.

- Use — LLHLM23 Propositions5.4.1–5.4.3 (K27–K29): Receive the proper forgetful map and the generic closed-immersion theorem.
- Use — LLHLM23 Section5.5 (K35): Apply the field-of-norms antiequivalence after forgetting the Kisin lattice.

- `EtaleFrobeniusModule.coefficient_ring` (constructor): Form O_E,K as the p-adic completion of W(k)[[v]][1/v], and O_E,Lprime using u_prime. For a source coefficient algebra R use the completed tensor product with R.
- `EtaleFrobeniusModule.mk` (constructor): A rank-n object is finite projective over the completed coefficient ring with a phi-semilinear operator whose linearization phi* D→D is an isomorphism.
- `EtaleFrobeniusModule.descent_version` (data): On the Lprime ring add semilinear Gamma descent commuting with phi; define morphisms by compatibility with both structures.
- `EtaleFrobeniusModule.matrix_criterion` (characterisation): On a free local chart the linearization is represented by an invertible matrix. This requires invertibility of that matrix, not bijectivity of the coefficient-ring Frobenius.
- `EtaleFrobeniusModule.base_change` (functoriality): Completed coefficient extension preserves finite projectivity and the inverse of the linearized Frobenius; establish identity and composition with the completion comparison maps.
- `EtaleFrobeniusModule.fppf_stack` (structure): Establish effective fppf descent for objects and isomorphisms and form the formal stack over Spf O, importing the source algebraicity inputs separately.

- Test `EtaleFrobeniusModule.rank_one_unit` (computation): A free rank-one object whose linearized Frobenius matrix is a coefficient-ring unit is etale.
- Test `EtaleFrobeniusModule.semilinear_not_surjective` (non-example): On F_p((v)), phi(v)=v^p is not surjective, but the rank-one module with basis e and phi(e)=e has linearization matrix 1 and is etale.
- Test `EtaleFrobeniusModule.zero_matrix` (non-example): In positive rank the zero Frobenius matrix does not define an etale object because its linearization is not an isomorphism.

### K26: Forget the Kisin lattice and descend

Source: §5.4.1, PDF116.

- Use — LLHLM23 Propositions5.4.1–5.4.3 (K27–K29): Prove properness, compute the invariant Frobenius matrices and obtain a generic closed immersion.
- Use — LLHLM23 Definition5.5.5 (K39): Use uniqueness of a generic Kisin lift to define representation shape.

- `ForgetKisinLattice.invert_complete` (constructor): From a Kisin module, invert u_prime and extend to the p-adically completed etale coefficient ring. Show E becomes a unit there and hence the bounded-height Frobenius linearization becomes an isomorphism.
- `ForgetKisinLattice.descent_invariants` (constructor): Take Gamma invariants of the resulting etale module to obtain epsilon_tau(M) over the K coefficient ring.
- `ForgetKisinLattice.descent_equivalence` (equivalence): Identify etale Lprime-modules with descent and etale K-modules by invariants and scalar extension, including the two natural inverse isomorphisms.
- `ForgetKisinLattice.presentation_independent` (compatibility): The descended object is independent of the lowest-alcove presentation and eigenbasis; compare presentations through the intrinsic module functor rather than equating their coordinate matrices.
- `ForgetKisinLattice.matrix_formula` (simp): In the invariant basis of K28, the partial matrix is A_beta^j s_j^(-1)v^(mu_j+eta_j), with the cyclic Frobenius convention and this right-factor order.
- `ForgetKisinLattice.geometry_hypotheses` (relation): Export properness using K27 and closed immersion using K29 only with its genericity assumptions. Do not make full faithfulness part of the unconditional forgetful construction.

- Test `ForgetKisinLattice.E_unit` (computation): After inverting v and completing p-adically, E=v+p=v(1+p/v) has inverse v^(-1) sum_(m>=0)(-p/v)^m. Convergence uses the p-adic topology.
- Test `ForgetKisinLattice.basis_invariance` (compatibility): A change of Kisin eigenbasis changes A z by the usual cyclic Frobenius basis-change formula, so the associated etale object is isomorphic.
- Test `ForgetKisinLattice.lattice_not_remembered` (non-example): The construction forgets the embedded power-series lattice. Uniqueness of such a lattice cannot be inferred from the definition of the etale object; it requires K29 and its hypotheses.

### K32: Translated bounded flags and shifted torus action

Source: §5.4.2, PDF120.

- Use — LLHLM23 Proposition5.4.6 (K33): Embed the shifted torus quotient into the residual etale stack.
- Use — LLHLM23 Proposition5.4.7 (K34): Compare different tame types inside a common translated bound.

- `TranslatedBoundedFlags.mk` (constructor): For integers a<=b and a tuple z, form the product over j of I1\(L^[a,b]GL_n)z_j inside the lifted affine flag. This uses I1, not I.
- `TranslatedBoundedFlags.parameter_domain` (data): For the etale embedding theorem require z=sigma^(-1)t_(nu+eta) with nu (b-a+1)-deep. Record this numerical margin alongside the bound.
- `TranslatedBoundedFlags.Frobenius_map` (constructor): Send a tuple represented by A_j z_j to the etale object with those partial Frobenius matrices. Prove independence of I1 representatives by the residual straightening theorem.
- `TranslatedBoundedFlags.shifted_torus_action` (structure): On B_j=A_j z_j the constant tuple D acts by B_j↦D_j B_j D_(j-1)^(-1). Verify identity/composition and descend the etale map through this action.
- `TranslatedBoundedFlags.monomorphism` (relation): Apply K33 to the shifted torus quotient under its depth hypotheses; retain this as a theorem about the quotient, not injectivity of all tuples of matrices.
- `TranslatedBoundedFlags.type_comparison` (compatibility): For K34 establish the actual inclusion Gr^[0,h]_F w_star(tau) in this translated bound before comparing images. A common ambient name or the existence of two presentations does not supply the inclusion.

- Test `TranslatedBoundedFlags.cyclic_scalar_action` (computation): For n=1 and two embeddings, (b_0,b_1) maps to (d_0 b_0/d_1,d_1 b_1/d_0); their product is invariant.
- Test `TranslatedBoundedFlags.one_embedding_action` (degenerate): For one embedding the action is conjugation D B D^(-1); in rank one it is trivial.
- Test `TranslatedBoundedFlags.translation_vs_shifted_action` (non-example): With two embeddings, changing d_0 but not d_1 changes both partial matrices. Acting by left multiplication on the first matrix alone is a different action.

### K37: Genericity of a residual Galois representation

Source: Definition5.5.1, PDF122.

- Use — LLHLM23 Proposition5.5.2 and Corollary5.5.10 (K38/K44): Classify generic semisimple representations and transfer genericity with a height loss.
- Use — LLHLM23 Proposition5.5.7 (K41): Use compatible tame presentations to compare semisimple representation and Kisin shapes.

- `ResidualGaloisGenericity.mk` (constructor): Define m-genericity through the tame inertial type of rho^ss. Keep the original representation rho as data, without identifying it with rho^ss.
- `ResidualGaloisGenericity.semisimplification_invariant` (characterisation): Representations with isomorphic semisimplifications have the same genericity; rho is m-generic iff rho^ss is m-generic.
- `ResidualGaloisGenericity.monotone` (relation): For 0<=m_prime<=m, m-genericity implies m_prime-genericity with the same type convention.
- `ResidualGaloisGenericity.tame_presentation` (data): For tame rho, a lowest-alcove presentation is a presentation of its inertial restriction; form w(rho)=t_(mu+eta)s and w_star(rho)=s^(-1)t_(mu+eta). This does not encode unramified extension data.
- `ResidualGaloisGenericity.semisimplicity_hypotheses` (relation): Use K45–K47 to deduce semisimplicity for a tame generic representation only with the distinct-inertial-character hypotheses. Retain E19: tameness alone does not imply semisimplicity.
- `ResidualGaloisGenericity.height_loss` (compatibility): Under K44, an m-generic tau with m>=h+1 yields an (m-h)-generic semisimplified Galois representation from a height-h object; do not export an unchanged m bound.

- Test `ResidualGaloisGenericity.unramified_Jordan` (non-example): A two-dimensional unramified representation with Frobenius a nontrivial unipotent Jordan block is tame but not semisimple. Its repeated trivial inertial characters exclude the generic distinct-character hypothesis.
- Test `ResidualGaloisGenericity.same_semisimplification` (compatibility): A representation and its semisimplification return the same value of the genericity predicate, even when they are not isomorphic.
- Test `ResidualGaloisGenericity.loss_boundary` (computation): For m=h+1 the guaranteed output depth is 1. Replacing it by h+1 overstates the theorem when h>0.

### K39: Shape of a residual representation relative to a type

Source: Definition5.5.4, PDF123.

- Use — LLHLM23 Proposition5.5.7 and Corollary5.5.8 (K41/K42): Relate the shape of a semisimple representation to admissibility and potentially crystalline nonemptiness.

- `RepresentationShape.domain` (data): The input is a residual representation rho and a witness M in Y^[0,h],tau(F) with Tdd_star(M)≅rho restricted to G_Kinfinity, under the standing (h+1)-generic type assumption.
- `RepresentationShape.mk` (constructor): Assign the shape of the witnessed Kisin module, relative to the specified lowest-alcove presentation of tau.
- `RepresentationShape.witness_independent` (extensionality): Use the generic monomorphism/closed-immersion theorem for epsilon and the field-of-norms equivalence to identify any two witnessed lifts; their shapes agree.
- `RepresentationShape.isomorphism_invariant` (compatibility): An isomorphism of the restricted Galois representation transports the witness and preserves shape.
- `RepresentationShape.field_extension` (functoriality): Base extend the witness and use K09 to preserve shape under a residue-field extension.
- `RepresentationShape.no_default` (relation): Outside the essential image there is no representation shape under this definition. A later theorem producing a lift supplies required data, not a default Weyl element.

- Test `RepresentationShape.two_witnesses` (compatibility): For two generic lifts of the same restricted representation, the construction produces one label by the uniqueness theorem.
- Test `RepresentationShape.missing_lift` (non-example): A bare residual representation and a tame type do not form a valid input unless a Kisin-lift existence witness is supplied.
- Test `RepresentationShape.presentation_parameter` (non-example): Changing the lowest-alcove presentation of tau requires the corresponding coordinate comparison; equality of raw Weyl labels is not part of presentation-free Galois isomorphism invariance.

### K40: Semisimple Kisin module

Source: Definition5.5.5 and Remark5.5.6, PDF123.

- Use — LLHLM23 Proposition5.5.7 (K41): Characterize semisimple Galois representations of the prescribed relative shape.
- Use — LLHLM23 Proposition5.5.9 (K43): Construct the semisimplification degeneration while preserving closed height/Hodge bounds.

- `SemisimpleKisinPoint.chart_definition` (constructor): Over a finite residue-field extension, a shape-z Kisin module is semisimple when its ordinary-chart image in the z-gauge diagram is the torus-fixed point z.
- `SemisimpleKisinPoint.matrix_criterion` (equivalence): Equivalently, there exists an eigenbasis with A_beta^j∈Tdual(Fprime) z_j for every j. Preserve the scalar torus factors as unramified data.
- `SemisimpleKisinPoint.gauge_independent` (compatibility): Under the gauge-basis uniqueness theorem, changing a gauge eigenbasis preserves the fixed-point criterion, so it depends only on the Kisin object.
- `SemisimpleKisinPoint.field_extension` (functoriality): Base extension preserves the matrix criterion and its fixed-point interpretation.
- `SemisimpleKisinPoint.relative_position` (compatibility): For the compatible semisimple presentations of K41, the shape is z=w_star(rho) w_star(tau)^(-1); the Hodge criterion uses w_star(tau)^(-1)w_star(rho) in Adm(lambda). Keep these two orders distinct.
- `SemisimpleKisinPoint.degeneration` (relation): Use K43 to construct the cocharacter degeneration to the semisimple object, proving the generic-family identity as a scheme identity before using closedness. A finite list of Fprime-rational nonzero parameters is not a Zariski-density argument.

- Test `SemisimpleKisinPoint.rank_one` (degenerate): A rank-one shape-c residual object admits A=u v^c with u a unit; the source gauge theorem reduces the gauge representative to a constant torus multiple of v^c, giving the fixed-point criterion under its hypotheses.
- Test `SemisimpleKisinPoint.torus_factor_retained` (non-example): Two rank-one etale matrices a v^c and b v^c with a!=b need not define the same unramified representation. The semisimple criterion must not discard the torus factors.
- Test `SemisimpleKisinPoint.finite_points_not_dense` (non-example): Over F_q the polynomial x^(q-1)-1 vanishes on every element of F_q^× but is not the zero regular function on G_m. A degeneration identity needs the family over the coordinate ring, not only its rational points.

### G01: Rigid coefficient rings and analytic derivation

Source: §7.1 PDF132–133.

- Use — LLHLM23 Propositions7.1.3–7.1.6 (G04–G07): Construct the convergent monodromy matrix, evaluate its derivatives and descend the integral ideal.
- Use — LLHLM23 Proposition7.1.10 (G11/G42–G44): Bound the analytic error terms after evaluation at v=-p.

- `RigidKisinCoefficients.mk` (constructor): For p-adically complete, topologically finite type, O-flat R, form O_R^rig=lim_m R[[u_prime,u_prime^m/p]][1/p] with the source transition maps. Use its injection into R[1/p][[u_prime]] as a comparison, not as equality.
- `RigidKisinCoefficients.analytic_product` (data): Construct L=product_(i>=0) phi^i(E(u_prime)/p) by convergence on each closed subdisc; prove L=(E/p)phi(L) and L(0)=1.
- `RigidKisinCoefficients.derivation` (structure): Define N_nabla=-u_prime L d/du_prime on the analytic ring. Prove coefficient linearity, Leibniz and compatibility with restriction to subdiscs.
- `RigidKisinCoefficients.evaluation` (constructor): For m>=0, construct the map to R[1/p][u_prime]/phi^m(E) by analytic convergence. Prove agreement with polynomial evaluation and with the relevant finite coefficient maps.
- `RigidKisinCoefficients.embedding_product` (equivalence): Decompose the W(k_prime)-coefficient variant into the J_prime product of O_R^rig, with phi cyclically moving embedding components and N_nabla componentwise.
- `RigidKisinCoefficients.locality` (compatibility): Use the source sheafiness theorem to glue analytic functions and the module M^rig over Zariski opens of Spf R. Keep the topological finite-type and flatness domain throughout.

- Test `RigidKisinCoefficients.constant_derivative` (degenerate): N_nabla(r)=0 for coefficient constants r; N_nabla(u_prime)=-u_prime L.
- Test `RigidKisinCoefficients.product_relation_at_zero` (computation): E(0)=p, so every finite product has constant coefficient 1 and the convergent product does too.
- Test `RigidKisinCoefficients.formal_evaluation_impossible` (non-example): In E[[u_prime]], E(u_prime) has nonzero constant coefficient p and is a unit. No E-algebra map from this entire formal-series ring to the nonzero ring E[u_prime]/E(u_prime) can send u_prime to its residue class. This rules out extending root evaluation indiscriminately to arbitrary formal series.

### G03: True monodromy condition

Source: Definition7.1.2 PDF132.

- Use — LLHLM23 Proposition7.1.4 (G05): Replace lattice preservation by analytic derivative equations.
- Use — LLHLM23 Proposition7.2.12 (G24): Identify the true monodromy substack with potentially crystalline representations under genericity.

- `TrueMonodromyCondition.predicate` (constructor): For a finite flat O-algebra and a Kisin module, require N_Mrig(M^rig)⊆M^rig, where the unique derivation is initially defined on M^rig[1/L].
- `TrueMonodromyCondition.intrinsic` (compatibility): Transport the preservation condition across an isomorphism of Kisin objects, using uniqueness of N and the induced rigid-lattice isomorphism.
- `TrueMonodromyCondition.matrix_criterion` (characterisation): In an eigenbasis, preservation means the entries of the N matrix lie in the analytic ring; the basis-change formula includes its derivative term.
- `TrueMonodromyCondition.jet_criterion` (equivalence): For h>=2, use G05: the derivatives of L^(h-1)N of orders 0 through h-2 vanish at E=0. For h<=1 use the stronger integrality bound of G04 directly; do not invent negative-order derivatives.
- `TrueMonodromyCondition.Galois_comparison` (equivalence): By G02, true monodromy is equivalent to the attached rational G_Kinfinity representation extending to a potentially crystalline G_K representation of the prescribed type and height range. Integral lattice stability is a further step in G25.
- `TrueMonodromyCondition.truncation_boundary` (relation): Relate this condition to the finite ideal G09 only through the precision theorem G11. Their defining ideals are not declared equal.

- Test `TrueMonodromyCondition.constant_Frobenius` (computation): If all raw Frobenius matrices are constant and invertible, the recurrence starts and remains zero; the operator with matrix zero preserves the rigid lattice.
- Test `TrueMonodromyCondition.height_one` (degenerate): For h=1, G04 places N directly in Mat(O^rig), so lattice preservation holds and the derivative-index set is empty.
- Test `TrueMonodromyCondition.finite_precision_not_equality` (non-example): The abstract inclusion I_1⊆(I_infinity,p^N) does not imply I_1⊆I_infinity: in O, take I_infinity=0 and I_1=(p^N). This tests the logic of using the truncation theorem, not an asserted Kisin counterexample.

### G07: Integral true monodromy ideal

Source: Proposition7.1.6 PDF135–136.

- Use — LLHLM23 Proposition7.1.10 (G11): Use O-flatness to descend an integral p-adic error equality from the generic fibre.
- Use — LLHLM23 Section7.2 (G17/G24): Glue the true-monodromy closed formal substack and identify its points.

- `IntegralMonodromyIdeal.local_contraction` (constructor): On a flat trivializing chart, contract the generic analytic derivative ideal from R[1/p] to R. Equivalently take its p-saturated defining ideal in the integral chart.
- `IntegralMonodromyIdeal.flat_quotient` (structure): Prove R/I is p-torsion-free and hence O-flat; its generic fibre is the closed derivative-equation locus.
- `IntegralMonodromyIdeal.unique_gluing` (universal-property): The generic locus and O-flatness determine the ideal uniquely. Use that uniqueness and flat local trivializations to glue it without choosing a global eigenbasis.
- `IntegralMonodromyIdeal.flat_base_change` (compatibility): For flat R→S between the source p-adically complete, topologically finite type O-flat algebras, prove I_M S=I_(M_S).
- `IntegralMonodromyIdeal.general_map` (functoriality): For an arbitrary map within the same domain, retain only I_M S⊆I_(M_S). Consequently, vanishing of I_(M_S) forces the image of I_M to vanish. The inclusion alone does not prove the converse and no equality is asserted.
- `IntegralMonodromyIdeal.zero_criterion` (characterisation): I_M=0 iff the source family factors through the flat true-monodromy locus; on a trivializing chart this is vanishing of the generic equations together with the flat closure construction.

- Test `IntegralMonodromyIdeal.saturation_test` (computation): In O[x], contraction of the generic ideal generated by p*x is (x); its quotient is O-flat.
- Test `IntegralMonodromyIdeal.nonflat_comparison_strict` (non-example): In R=O[x], I=(x) is saturated. Under R→S=O sending x↦p, I S=(p), whose saturation is S since its generic ideal is the unit ideal. Thus saturation can strictly enlarge after a nonflat map even when both coefficient algebras are O-flat.
- Test `IntegralMonodromyIdeal.zero_ideal` (degenerate): If the generic derivative ideal is zero and R is O-flat, its contraction is zero.

### G08: Monodromy leading term and error series

Source: Equations7.5–7.8 PDF136–139.

- Use — LLHLM23 Definition7.1.8 and Remark7.1.9 (G09/G10): Extract the finite differential equations and compare their parameter with Section4.
- Use — LLHLM23 Proposition7.1.10 and G42–G44: Estimate the discarded tail with the correct exponent and lower-triangular precision loss.

- `MonodromyLeadingTerm.leading_polynomial` (constructor): Set D_j=Diag((sor_prime,j)^(-1)a_prime,j) and P_N(A_j)=(-e_prime v A_j_prime-[D_j,A_j])(v+p)^h A_j^(-1). Prove it lies in L+M, using the height bound.
- `MonodromyLeadingTerm.initial_error` (simp): Set Z_(0,j)=-P_N(A_j). The derivative of the orientation conjugation is the commutator term, with the displayed minus sign in P_N.
- `MonodromyLeadingTerm.recurrence` (data): For i>=1 set Z_(i,j)=p^(1-h) A_j Ad(s_j^(-1)v^(mu_j+eta_j))(phi(Z_(i-1,j-1)))(v+p)^h A_j^(-1); retain the cyclic predecessor.
- `MonodromyLeadingTerm.series_identity` (relation): Use G42 to identify p^h Ad((sor_prime)^(-1)u_prime^(-a_prime))(L^(h-1)N_infinity) with -phi(L)^h P_N(A_j)+sum_(i>=1)phi^(i+1)(L)^h Z_(i,j), in the analytic localization.
- `MonodromyLeadingTerm.exponent_bound` (relation): For m-deep data, use Z_(i,j) in p^(-i(h-1))v^(1+m(p^i-1)/(p-1)) Mat(R[[v+p]]). The initial 1 occurs once, not once per term of the geometric sum.
- `MonodromyLeadingTerm.precision_interface` (compatibility): For h>=2 and m>=2h-3, G43/G44 turn the series bound into the common derivative precision m-2h+3. Include the extra one-power loss for dividing lower-triangular entries by v.

- Test `MonodromyLeadingTerm.diagonal_monomial` (computation): If A is diagonal with ith entry (v+p)^c_i, then its commutator with D vanishes and P_N has ith entry -e_prime*c_i*v*(v+p)^(h-1).
- Test `MonodromyLeadingTerm.exponent_i2` (non-example): For p=5,m=3,i=2, the exponent is 1+3(1+5)=19, not (3+1)(1+5)=24.
- Test `MonodromyLeadingTerm.precision_boundary` (computation): At m=2h-3 the common precision is zero, so the ideal containment modulo p^0 is vacuous; obtaining a nontrivial mod-p comparison requires a strictly larger margin.

### G12: Emerton–Gee representation stack

Source: §7.2 PDF140–141.

- Use — LLHLM23 Theorem7.2.2 (G15): Receive the potentially crystalline formal closed substacks and versal deformation rings.
- Use — LLHLM23 Section7.4 (G32): Label components of the underlying reduced algebraic stack by Serre weights.

- `EmertonGeeStack.import_stack` (constructor): Import the Noetherian formal algebraic stack X_n of rank-n projective etale (phi,Gamma)-modules from Emerton–Gee, with its coefficient field and continuity conventions.
- `EmertonGeeStack.local_representation_equivalence` (equivalence): On complete local Noetherian O-algebras with finite residue field, identify its groupoid with continuous G_K actions on rank-n projective modules, including equivariant isomorphisms.
- `EmertonGeeStack.restriction` (functoriality): Use the canonical map X_n→Phi-Mod_et,K whose local representation interpretation is restriction G_K→G_Kinfinity. Do not declare it a monomorphism before the genericity theorem G23.
- `EmertonGeeStack.product_fields` (constructor): For a finite etale Z_p-algebra with fraction algebra product_v F_v^+, form the product of the corresponding stacks over Spf O.
- `EmertonGeeStack.underlying_reduced` (data): Construct the underlying reduced algebraic stack X_n,red using an ideal of definition, keeping it distinct from the associated reduced formal stack of G14.
- `EmertonGeeStack.supplier_corrections` (compatibility): For component classification use the Emerton–Gee author-errata replacement induction retained in E28; for the crystalline-stack citations use the corrected reference [22] in E32.

- Test `EmertonGeeStack.singleton_product` (degenerate): With one field factor, the product stack identifies with the original X_n.
- Test `EmertonGeeStack.automorphisms_retained` (non-example): A rank-one representation over a field has scalar automorphisms. Replacing its groupoid by the set of isomorphism classes loses data and does not define the same stack.
- Test `EmertonGeeStack.restriction_domain` (non-example): The local representation equivalence stated here has complete local Noetherian rings with finite residue field as its domain; it must not be invoked on an arbitrary test algebra without the additional comparison theorem.

### G13: Potentially crystalline formal substacks

Source: §7.2 PDF141.

- Use — LLHLM23 Theorem7.2.2 and Proposition7.2.3 (G15/G18): Supply flat closed loci, versal rings and the generic Kisin comparison.
- Use — LLHLM23 Theorem7.3.2 (G28): Restrict to the union of regular Hodge types before the local-model isomorphism.

- `PotentiallyCrystallineStack.fixed_type` (constructor): For dominant lambda and inertial type tau import the unique O-flat closed formal substack X^(lambda,tau), with the finite-flat coefficient point condition stated by Emerton–Gee.
- `PotentiallyCrystallineStack.point_criterion` (characterisation): A point over a finite flat O-algebra belongs iff its rational representation is potentially crystalline with Hodge weights lambda and inertial type tau. Nilpotent coefficient algebras remain in the test category.
- `PotentiallyCrystallineStack.Hodge_convention` (compatibility): Translate LLHLM weights to Emerton–Gee weights by lambda↦-w0(lambda); the LLHLM cyclotomic character has weight +1 and D_pst has the stated covariant type tau.
- `PotentiallyCrystallineStack.height_union` (constructor): Form X^([0,h],tau) as the finite scheme-theoretic union over dominant tuples with coordinates in [0,h]. In a chart use the intersection of defining ideals.
- `PotentiallyCrystallineStack.dominance_union` (constructor): Form X^(<=lambda,tau) as the finite scheme-theoretic union over dominant lambda_prime<=lambda; retain the fixed central-class requirement.
- `PotentiallyCrystallineStack.inclusions` (functoriality): Transport inclusions of the finite indexing sets to closed immersions of their unions, preserving their common ambient X_n and the source flat/reduced conclusions.

- Test `PotentiallyCrystallineStack.cyclotomic_sign` (computation): For rank one lambda=1 corresponds to Emerton–Gee weight -1. For GL_2 lambda=(2,0), the translated dominant tuple is (0,-2).
- Test `PotentiallyCrystallineStack.height_zero` (degenerate): The height interval [0,0] contains only the all-zero dominant tuple in every embedding, so the union is that fixed-Hodge-type locus.
- Test `PotentiallyCrystallineStack.union_not_reduction` (non-example): The two flat sections x=0 and x=varpi have integral union x(x-varpi)=0; its special fibre retains x^2=0. Scheme-theoretic union is not the operation of taking a reduced union.

### G14: Analytically unramified formal stack

Source: §7.2 PDF141; Warning7.2.1.

- Use — LLHLM23 Lemma7.2.6 (G20): Use reduced charts and finite-flat/DVR point tests to detect isomorphisms.
- Use — LLHLM23 Proposition7.2.12 (G24): Insert the associated reduced formal substack in the true-monodromy comparison.

- `AnalyticallyUnramifiedFormalStack.predicate` (constructor): For a topologically finite type p-adic formal algebraic stack over Spf O, require every smooth affine chart Spf A to have reduced A.
- `AnalyticallyUnramifiedFormalStack.versal_criterion` (equivalence): Use the cited formal-stack theorem to identify this property with reduced finite-type versal rings, including the residual Jacobson and Noetherian hypotheses.
- `AnalyticallyUnramifiedFormalStack.reduced_formal_substack` (constructor): Construct the maximal analytically unramified closed formal substack Z_prime→Z; on each smooth chart its pullback is Spf(A_red).
- `AnalyticallyUnramifiedFormalStack.smooth_pullback` (compatibility): Prove this chartwise reduction is compatible with the smooth transition morphisms so that the local closed substacks descend.
- `AnalyticallyUnramifiedFormalStack.underlying_algebraic_comparison` (data): For an ideal of definition I in A, the underlying reduced algebraic stack has chart Spec((A/I)_red), whereas the associated reduced formal chart is Spf(A_red). Keep both maps into Z.
- `AnalyticallyUnramifiedFormalStack.point_detection_hypotheses` (relation): Use G20 with its exact alternatives: finite-flat essential surjectivity plus analytically unramified target, or a closed immersion plus DVR-point surjectivity and analytically unramified target, or a closed immersion plus finite-flat surjectivity. O-flatness remains required.

- Test `AnalyticallyUnramifiedFormalStack.DVR_two_reductions` (non-example): For A=O a complete DVR, Spf(A_red)=Spf O but Spec((A/(varpi))_red)=Spec F; these are different objects.
- Test `AnalyticallyUnramifiedFormalStack.nilpotent_chart` (computation): For A=O[epsilon]/epsilon^2 with the p-adic topology, its associated reduced formal scheme is Spf O.
- Test `AnalyticallyUnramifiedFormalStack.already_reduced` (degenerate): If every smooth chart ring is reduced, the associated reduced formal substack map is an isomorphism.

### G17: Fiber products and monodromy substacks

Source: §7.2 PDF142–143.

- Use — LLHLM23 Proposition7.2.3 (G18): Organize the Cartesian diagrams and mark the exceptional rectangle.
- Use — LLHLM23 Theorem7.3.2 (G28): Pull back true-monodromy equations to formal gauge charts.

- `KisinMonodromyFiberProduct.fiber_product` (constructor): Define K^(?,tau)=X^(?,tau)×_(Phi-Mod_et,K)Y^(?,tau) for the indicated height/Hodge bounds. An object includes a representation, a Kisin object and an isomorphism of their etale images.
- `KisinMonodromyFiberProduct.projections` (universal-property): Construct the two projections and their comparison 2-isomorphism, with the universal property of the stack fiber product, including morphisms of triples.
- `KisinMonodromyFiberProduct.true_monodromy_substack` (constructor): Glue the O-flat closed substack of Y cut out by G07; on a source flat formal chart its factorization condition is I_(M,nabla infinity)=0.
- `KisinMonodromyFiberProduct.bounded_variant` (constructor): Construct the corresponding flat monodromy closed substack inside Y^(<=lambda,tau) using its own flat-closure ideal, not an assumed arbitrary base change of the unbounded ideal.
- `KisinMonodromyFiberProduct.comparison_isomorphisms` (relation): Under h>=1 and (h+2)-generic tau, use G18/G21/G24 for the indicated isomorphisms between K, X and the true-monodromy substacks.
- `KisinMonodromyFiberProduct.Cartesian_boundary` (compatibility): Retain Remark7.2.4: the top-right Hodge-bound/monodromy rectangle is known Cartesian after inverting p, but its integral Cartesian property is not supplied by closure. Export only the solid Cartesian squares actually proved.

- Test `KisinMonodromyFiberProduct.object_requires_comparison` (non-example): An unrelated Galois representation and Kisin module are not a point of K merely because their ranks agree; an isomorphism of etale images is part of the datum.
- Test `KisinMonodromyFiberProduct.identity_base_change` (degenerate): The fiber product with the identity map of the etale stack recovers the other factor, with its groupoid structure.
- Test `KisinMonodromyFiberProduct.closure_base_change_boundary` (non-example): In O[x], the flat section x=0 pulled back along x↦varpi gives O/(varpi), while closing the empty generic pullback gives the empty scheme. This shows why a generic Cartesian square need not identify integral flat closures.

### G22: Cyclotomic-free residual representation

Source: Definition7.2.9 PDF146.

- Use — LLHLM23 Lemma7.2.10 (G23 prerequisites): Compare invariants, equivariant Hom spaces and stable submodules after restriction to G_Kinfinity.
- Use — LLHLM23 Proposition7.2.11 and Lemma7.2.13 (G23/G25): Deduce generic full faithfulness and integral lattice stability.

- `CyclotomicFreeRepresentation.mk` (constructor): A witness consists of an unramified extension M/K of degree prime to p on which rho^ss is a sum of characters, and H^0(G_M,rho^ss tensor epsilon^(-1))=0.
- `CyclotomicFreeRepresentation.character_criterion` (equivalence): Given the splitting witness, the invariant condition means no character constituent equals the restricted cyclotomic character. This tests rho itself, not automatically all pairwise ratios.
- `CyclotomicFreeRepresentation.semisimplification` (compatibility): The property depends only on rho^ss by definition; an isomorphism of semisimplifications transports a witness.
- `CyclotomicFreeRepresentation.direct_summand` (relation): A representation whose semisimplification is a direct summand of a finite direct sum of a witnessed rho is cyclotomic free using the same M.
- `CyclotomicFreeRepresentation.generic_adjoint` (relation): Use G23/Lemma7.2.10(2): if rho^ss on inertia is 2-generic, then ad(rho) is cyclotomic free. This is the separate bridge needed to control Hom spaces.
- `CyclotomicFreeRepresentation.restriction_Hom` (compatibility): Under the source common-semisimplification hypothesis and cyclotomic freeness of its adjoint, restriction identifies the indicated finite-length equivariant Hom groups; apply it to submodule inclusions only through the proved stability lemma.

- Test `CyclotomicFreeRepresentation.cyclotomic_character_fails` (non-example): For rho=epsilon modulo p, rho tensor epsilon^(-1) is trivial on every extension, so its H^0 is nonzero and no witness exists.
- Test `CyclotomicFreeRepresentation.trivial_character_p_odd` (computation): For K unramified over Q_p and p>2, the residual cyclotomic character is nontrivial on inertia. The trivial rank-one representation is cyclotomic free with M=K.
- Test `CyclotomicFreeRepresentation.adjoint_ratios` (computation): For a split representation with characters chi_1,chi_2, its adjoint has constituents 1,1,chi_1/chi_2,chi_2/chi_1. The cyclotomic-free test for the adjoint checks these ratios, unlike the test for the original representation.

### G26: Presentation-dependent local-model parameter

Source: §7.3; Lemma7.3.1 PDF149–150.

- Use — LLHLM23 Lemma7.3.1 and Theorem7.3.2 (G28): Specialize the universal differential equations and the genericity polynomial.
- Use — LLHLM23 Theorem7.4.2 (G34): Translate local-model components to the residual representation stack.

- `LocalModelTypeParameter.mk` (constructor): From the fixed presentation and K06 data set a_(tau,jprime)=(sor_prime,jprime)^(-1)(a_prime^(jprime))/(1-p^fprime), as a tuple in O^n.
- `LocalModelTypeParameter.denominator_unit` (structure): Since 1-p^fprime reduces to 1 modulo varpi, it is a unit in O; this makes the parameter integral.
- `LocalModelTypeParameter.monodromy_sign` (compatibility): With eprime=p^fprime-1, identify this parameter with -(sor_prime)^(-1)a_prime/eprime used in G10. This checks the sign in the differential local-model comparison.
- `LocalModelTypeParameter.residue` (simp): For j in J, use Lemma7.3.1 to obtain a_(tau,j) mod varpi=s_j^(-1)(mu_j+eta_j) mod varpi.
- `LocalModelTypeParameter.coefficient_extension` (functoriality): Base extending the coefficient DVR carries this tuple and its inverse denominator to the tuple for the same presentation over the extension.
- `LocalModelTypeParameter.presentation_dependence` (relation): Store the lowest-alcove presentation with the parameter. Changing presentations requires its explicit transformation law; equality of tame types alone does not assert equality of these integral tuples.

- Test `LocalModelTypeParameter.one_embedding_identity_orientation` (computation): If fprime=1 and s=1, then a_tau=(mu+eta)/(1-p), reducing to mu+eta modulo p.
- Test `LocalModelTypeParameter.sign_test` (computation): For p=5,fprime=1 and oriented a_prime=3, the parameter is -3/4, which is 3 modulo 5; +3/4 would give the wrong residue.
- Test `LocalModelTypeParameter.central_shift_integral` (compatibility): In the preceding single-embedding setting, shifting the presentation numerator by (p-1)c changes a_tau by -c. Congruent tame character data therefore need not give identical integral parameters.

### G27: Regular-weight unions and framed charts

Source: §7.3 PDF150–151.

- Use — LLHLM23 Theorem7.3.2 (G28): Compare the maximal-dimensional flat union to the corresponding regular potentially crystalline formal charts.
- Use — LLHLM23 Theorem7.4.2 (G34): Compare underlying reduced components for regular Hodge types.

- `RegularHodgeUnion.regular_index` (data): Take the finite set of dominant lambda_prime<=lambda that are regular in every embedding, with the common central class and the standing effective bounds.
- `RegularHodgeUnion.model_union` (constructor): Form the scheme-theoretic union of M_J(lambda_prime,nabla a_tau) over this set, with ideal intersections in a common bounded ambient model.
- `RegularHodgeUnion.maximal_dimension` (characterisation): Characterize it as the maximal O-flat closed part of the flat Hodge union that is equidimensional of total dimension 1+|J|n(n-1)/2, using the flag dimensions of the generic strata.
- `RegularHodgeUnion.chart_and_torsor` (constructor): Intersect with each affine chart U(z,<=lambda), then pull back to its trivial Tdual^J torsor. The torus lift adds |J|n to the total dimension.
- `RegularHodgeUnion.crystalline_union` (constructor): Form X_reg^(<=lambda,tau) as the scheme-theoretic union of X^(lambda_prime,tau) over the same regular index set; define the remaining objects of (7.13) by its specified solid Cartesian squares.
- `RegularHodgeUnion.formal_comparison` (compatibility): Complete the indicated algebraic charts p-adically before comparing with true-monodromy formal charts. The Elkik-produced dotted map is noncanonical; Warning7.3.3 does not assert commutativity of the full triangle in the ambient chart.

- Test `RegularHodgeUnion.GL2_regular_selection` (computation): For one embedding and lambda=(2,0), the dominant interval consists of (2,0) and (1,1). Only (2,0) is regular, so the regular union omits the central generic point stratum.
- Test `RegularHodgeUnion.dimension_with_torus` (computation): For n=2 and |J|=1, the regular model has total dimension 2 over Spec O, and its torus lift has total dimension 4; their special fibres have dimensions 1 and 3.
- Test `RegularHodgeUnion.formal_not_algebraic` (non-example): The infinite true-monodromy equations define a formal chart on complete test rings. A point of an algebraic naive chart does not by itself define an evaluation of those infinite series.

### G32: Serre-labelled Emerton–Gee components

Source: §7.4 PDF155–156.

- Use — LLHLM23 Theorem7.4.2 and Remark7.4.3 (G34): Identify sufficiently generic components with the shifted torus quotients of local-model components.
- Use — LLHLM23 Section8: Use component membership for weight and Breuil–Mezard assertions.

- `SerreLabelledGaloisComponent.EG_label` (constructor): Import the Emerton–Gee Serre-weight labelling of irreducible components of X_n,red, with the author-errata proof replacement E28.
- `SerreLabelledGaloisComponent.relabel` (data): Define C_sigma=X_EG,n,red^(sigma_dual tensor det^(n-1)). For multiple local fields use products over the common residue field with the corresponding tuple of labels.
- `SerreLabelledGaloisComponent.deep_dense_locus` (characterisation): For 1-deep sigma=F(kappa), identify the dense maximally nonsplit upper-triangular locus with unique G_K-stable complete flag and diagonal inertia chi_i=product_j omega_j^((kappa_j+eta_j)_i).
- `SerreLabelledGaloisComponent.closure` (universal-property): C_sigma is the reduced closure of the prescribed dense locus, using the corrected EG construction; extend assertions on that locus only by an appropriate closedness/density argument.
- `SerreLabelledGaloisComponent.boundary_rule` (data): Outside the deep range retain the original EG extension-class condition: in the cyclotomic-ratio boundary the p-1 weight difference is tied to the exact cyclotomic character equality and a tres-ramifiee extension, while the other boundary uses difference zero.
- `SerreLabelledGaloisComponent.local_model_quotient` (compatibility): Under Theorem7.4.2 and a compatible algebraic central lift zeta, identify C_sigma with the quotient of the lifted local-model component C_sigma^zeta by the shifted Tdual^J conjugation action. Do not confuse this with the ordinary left torus torsor used for affine flags.

- Test `SerreLabelledGaloisComponent.rank_one_relabel` (computation): For n=1, det^(n-1)=1, so C_sigma uses the dual-character EG label; the relabelling is not the identity on all characters.
- Test `SerreLabelledGaloisComponent.GL2_inertia_shift` (computation): For one embedding and kappa=(a,b), the deep-locus diagonal inertia exponents are (a+1,b), since eta=(1,0).
- Test `SerreLabelledGaloisComponent.split_not_dense_locus` (non-example): A direct sum of two distinct characters has at least two stable complete flags. It fails the maximally nonsplit dense-locus condition, although it may lie in the closure; the dense locus and the component are different sets.

### Q01: Explicit rank-three monodromy chart

Source: AppendixB PDF201–202.

- Use — LLHLM23 PropositionB.0.1 (Q03–Q06): Eliminate six matrix coefficients over the explicit genericity locus and compute special-fibre primes and the Jacobian ideal.
- Use — LLHLM23 PropositionB.0.2 (Q08–Q10): Base change at t=-p and compare with the explicit partial normalization.

- `RankThreeMonodromyChart.matrix` (constructor): For n=3, lambda=(3,1,0), z=(23)t_(2,1,1), define A with rows ((v-t)^2+d11(v-t)+c11, v*c12, c13), (v*(d21(v-t)+c21), c22, (v-t)+c23), (v*(d31(v-t)+c31), v, (v-t)*d33+c33).
- `RankThreeMonodromyChart.determinant_bound` (characterisation): Impose equality det(A)=-(v-t)^4 as a polynomial identity, hence coefficient equations, in the determinant-bounded chart.
- `RankThreeMonodromyChart.Schubert_bound` (constructor): Impose the lambda minor-divisibility conditions in v-t and then take the underlying reduced subscheme as in the source Schubert construction. Keep this reduction separate from the later scheme-theoretic special fibre.
- `RankThreeMonodromyChart.central_parameter` (equivalence): Use the central-shift invariance of the differential condition to write the parameter tuple as (a,b,0); this normalization applies to the monodromy parameter, not to an arbitrary change of Hodge type.
- `RankThreeMonodromyChart.monodromy_closure` (constructor): Define the flat monodromy chart by intersecting the universal flat model with this open chart, over the coefficient locus V when using PropositionB.0.1.
- `RankThreeMonodromyChart.elimination_interface` (compatibility): Identify the chart over V with the three-equation algebra recorded in sourceData.appendixB.chartEquations through the source elimination of c11,d11,c21,c23,c31,c33. Preserve its required t-torsion-freeness and the invertibility of P.

- Test `RankThreeMonodromyChart.distinguished_special_point` (computation): At t=0 and all twelve variable coefficients zero, A has rows (v^2,0,0),(0,0,v),(0,v,0); its determinant is -v^4 and it is the chosen monomial point z.
- Test `RankThreeMonodromyChart.determinant_sign` (non-example): The permutation (23) has sign -1. Imposing +(v-t)^4 rejects the distinguished special point in characteristic different from 2.
- Test `RankThreeMonodromyChart.zero_coefficients_not_generic_section` (non-example): With all twelve coefficients zero at general t, det(A)=-v(v-t)^3, not -(v-t)^4. The special-fibre fixed point does not define the constant-coefficient generic section.

### Q02: Explicit open genericity locus

Source: AppendixB PDF202.

- Use — LLHLM23 PropositionsB.0.1–B.0.2 (Q03–Q10): Make the elimination denominators and the normalization leading coefficient units before specializing.

- `ExplicitGenericityOpen.polynomial` (data): Set P=7!*b*(b-1)*(a-1)*(a-2)*(a-b)*(a-b-1)*(a-b-2) in Z[a,b], with every factor and its multiplicity as printed.
- `ExplicitGenericityOpen.localization` (constructor): Define V=Spec Z[a,b,1/P] and its open immersion into A^2_Z by the localization universal property.
- `ExplicitGenericityOpen.points` (characterisation): A ring map Z[a,b,1/P]→R is a pair (a_R,b_R) for which P(a_R,b_R) is a unit. Over a general ring nonzero is insufficient.
- `ExplicitGenericityOpen.factor_units` (simp): Invertibility of P is equivalent to invertibility of every displayed factor, including 7!, in the commutative target ring.
- `ExplicitGenericityOpen.DVR_specialization` (characterisation): For a coefficient DVR, the pair lies in V exactly when P has nonzero residue. In mixed characteristic this requires residue characteristic p>7 and avoidance of each displayed hyperplane modulo p.
- `ExplicitGenericityOpen.base_change` (functoriality): Every coefficient map preserving the chosen pair transports its unit witnesses, giving the canonical base change of all chart algebras over V.

- Test `ExplicitGenericityOpen.F11_point` (computation): Over F_11, (a,b)=(5,2) belongs to V: 7!,2,1,4,3,3,2,1 are all nonzero.
- Test `ExplicitGenericityOpen.small_prime_excluded` (non-example): There are no F_7-points of V because 7!=0; checking only the linear factors misses this exclusion.
- Test `ExplicitGenericityOpen.nonzero_not_unit` (non-example): At integer values (a,b)=(5,2), P is nonzero in Z but not a unit. This pair does not define a Z-point of V.

### Q07: Partial normalization by an explicit fraction

Source: AppendixB PDF203–204.

- Use — LLHLM23 PropositionB.0.2 (Q08–Q10): Obtain the normalization after t=-p specialization and compute component splitting in Table1.

- `ExplicitPartialNormalization.fraction_subalgebra` (constructor): Over V and the integral chart algebra R of Q03, let W=-t*d21/c22 in Frac(R), and form the R-subalgebra generated by W. Require the proved domain and nonzero-denominator hypotheses.
- `ExplicitPartialNormalization.presentation` (equivalence): Compare this subalgebra with the seven-equation quotient recorded in sourceData.appendixB.partialNormalizationEquations. Proving equality includes ruling out extra c22-torsion in the presented algebra; the rational substitution alone proves only one direction.
- `ExplicitPartialNormalization.integrality` (relation): The sixth displayed equation is quadratic in W with leading coefficient (a-1)(b-1)(a-b), a unit on V. Divide by that unit to obtain a monic relation and deduce finiteness of the generated subalgebra over R.
- `ExplicitPartialNormalization.birational` (equivalence): After inverting c22, the first relation uniquely gives W=-t*d21/c22 and the map is an isomorphism. Together with the subalgebra realization this identifies fraction fields.
- `ExplicitPartialNormalization.normalization_after_specialization` (compatibility): Use PropositionB.0.2 for O-points (t,a,b)=(-p,a,b) in X×V to conclude O-flatness and normality of the specialized algebra. Do not extend this normality claim to coefficient points outside V.
- `ExplicitPartialNormalization.special_fiber_components` (data): Use the complete Table1 primary/component data already transcribed to describe preimages of the seven special-fibre components, retaining all splitting branches and their equations.

- Test `ExplicitPartialNormalization.denominator_open` (computation): On c22 invertible, the first relation eliminates W and the inverse map is the rational formula -t*d21/c22.
- Test `ExplicitPartialNormalization.origin_fiber_nonreduced` (non-example): Over F_11 at (a,b)=(5,2), set t=c12=c13=d21=c22=d31=d33=0. The seven relations reduce to W^2=0 up to a unit, so the fibre of the finite map is F_11[W]/(W^2), not a single reduced point.
- Test `ExplicitPartialNormalization.boundary_not_fraction_evaluation` (non-example): At c22=0 the subalgebra morphism still has a fibre, but evaluating the rational expression by division is undefined. The finite-algebra presentation is required there.

### Z02: Explicit affine Springer component matrix and inverse

Source: Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 AppendixB.2–B.5, PDF8–17; corrected E29–E31..

- Use — LLHLM23 LLHLM23 Section4.3, using Boixeda Alvarez AppendixB.2–B.5: Provide explicit affine opens and the nonvanishing minors used to place Weyl fixed points in component closures.

- `AffineSpringerPathMatrix.exponents` (constructor): For w in the Type A fundamental box and i<j, choose a^w_ji as the least integer k for which w^(-1)(e_i-e_j)+k*delta is a positive affine root; retain the source positivity convention.
- `AffineSpringerPathMatrix.path_matrix` (constructor): Use diagonal entries 1 and, for j>i, sum over increasing paths i=i1<...<ik=j of the product over l of (s_il-s_i(l+1))/(s_il-s_ik), times t^(sum_l a^w_i(l+1),il) times the corresponding A variables. Distinct eigenvalues over the field make denominators units.
- `AffineSpringerPathMatrix.inverse` (equivalence): Use path coefficients (-1)^(k-1) product_l (s_il-s_i(l+1))/(s_i1-s_i(l+1)) for the inverse. Verify both products are identity by the unitriangular recursion, retaining the E30 correction of s_1 to the path-start eigenvalue.
- `AffineSpringerPathMatrix.conjugated_entries` (simp): Prove the strict lower entry of M^(-1)*t*s*M is t^(a^w_ji+1) A_ji (s_j-s_i); higher-path contributions cancel. The diagonal entries are t*s_i.
- `AffineSpringerPathMatrix.affine_open` (relation): Use the exponent condition and conjugated-entry formula for affine Springer membership; then prove the parameter map identifies an affine open of the selected component. The matrix identity alone does not establish openness or the component dimension.
- `AffineSpringerPathMatrix.fixed_point_minors` (compatibility): Translate intersection with the attracting chart into nonsingularity of the source finite minors, using zero lattice intersection (E29). Keep the degree-maximization and Vandermonde argument as further proof obligations; when expanding its final matrix use the last-column cofactor (E31).

- Test `AffineSpringerPathMatrix.two_by_two` (computation): For n=2 the only strict lower entry is x=t^a A21, so M=I+xE21 and M^(-1)=I-xE21; the conjugated lower entry is t*x*(s2-s1).
- Test `AffineSpringerPathMatrix.path_start_not_one` (non-example): For the path 2<3, the inverse coefficient must be -1. The printed expression -(s2-s3)/(s1-s3) generally fails, while the corrected denominator s2-s3 gives -1.
- Test `AffineSpringerPathMatrix.three_step_inverse` (computation): For the path 1<2<3, put r=(s1-s2)/(s1-s3), so M31 contains r*x32*x21. The inverse coefficient on x32*x21 is 1-r=(s2-s3)/(s1-s3), agreeing with the corrected path formula.
- Test `AffineSpringerPathMatrix.regular_semisimple_boundary` (non-example): If s1=s3, the length-three path coefficient has a zero denominator and the constructor is outside its domain; no limiting matrix is supplied by this formula.

### L05: Continuous evaluation of multivariate power series

Source: Mathlib/RingTheory/MvPowerSeries/Evaluation.lean:228,262,281.

- Use — LLHLM23 Z15–Z22 and complete-local product adapters: Evaluate power-series presentations at topologically nilpotent coordinates while retaining all completeness hypotheses.
- Use — LLHLM23 Analytic/completion supplier interfaces: Distinguish existing continuous formal evaluation from the additional rigid analytic root-evaluation construction G01.

- `ContinuousPowerSeriesEvaluation.hasEval` (data): Reuse MvPowerSeries.HasEval: each coordinate is topologically nilpotent and the coordinate family tends to zero along the cofinite filter. For finite variables only the latter condition becomes vacuous.
- `ContinuousPowerSeriesEvaluation.eval` (constructor): Reuse MvPowerSeries.eval₂Hom for a continuous coefficient homomorphism and a HasEval family, with the pinned uniform, complete, Hausdorff, topological-ring and linear-topology assumptions. No new evaluation carrier is planned.
- `ContinuousPowerSeriesEvaluation.constants_variables` (simp): Use the existing eval₂_C and eval₂_X formulas, together with coe_eval₂Hom, to compute constants and coordinate variables.
- `ContinuousPowerSeriesEvaluation.continuity` (structure): Reuse continuous_eval₂ and uniformContinuous_eval₂ on the same hypothesis domain.
- `ContinuousPowerSeriesEvaluation.unique` (extensionality): Reuse eval₂_unique: any continuous map agreeing with polynomial evaluation equals eval₂. The comparison map need not be assumed a ring homomorphism for this uniqueness statement.
- `ContinuousPowerSeriesEvaluation.compose` (functoriality): Reuse comp_eval₂ and HasEval.map for a continuous homomorphism to a target satisfying the same complete Hausdorff linearly topologized conditions.

- Test `ContinuousPowerSeriesEvaluation.zero_coordinates` (degenerate): Using HasEval.zero, evaluation at all-zero coordinates gives the coefficient homomorphism applied to the constant coefficient.
- Test `ContinuousPowerSeriesEvaluation.p_adic_geometric_series` (computation): In the p-adic topology on Z_p, the coordinate p satisfies HasEval for one variable and evaluation of sum_(m>=0)X^m is (1-p)^(-1).
- Test `ContinuousPowerSeriesEvaluation.unit_coordinate_invalid` (non-example): The coordinate 1 is not topologically nilpotent in a nonzero Hausdorff p-adic ring such as Z_p, so the same geometric series cannot be evaluated there through eval₂Hom.
- Test `ContinuousPowerSeriesEvaluation.infinite_family_condition` (non-example): For infinitely many variables over Z_p, taking every coordinate equal to p makes each coordinate topologically nilpotent but does not make the family tend to zero along the cofinite filter; HasEval fails.

### Z15: Saturated jets at a DVR-valued point

Source: KWII Proposition2.2(ii), author PDF9; explicit proof refinement for LLHLM23 Theorem3.7.1, published PDF79.

- Use — Z12 via Z17–Z22: These finite free quotients separate the integral completed tensor before passage to the formal generic-point product.

- `SaturatedPointJet.ideal` (constructor): Form q^n and contract along R→R[1/π]; identify membership with some π-power multiple in P^n.
- `SaturatedPointJet.transition` (functoriality): For m≤n construct Q_n→Q_m from J_n⊂J_m; prove identity and composition, compatibility of augmentations to O, and J_1=P.
- `SaturatedPointJet.torsionFree` (characterisation): Multiplication by π on Q_n is injective, by saturation; combine with DVR factorization for torsionfreeness.
- `SaturatedPointJet.map` (functoriality): A local O-algebra map commuting with the chosen retractions carries J_n into J_n and induces a compatible map of quotient systems. No arbitrary base-change equality is asserted.
- `SaturatedPointJet.genericFiber` (compatibility): Construct the canonical Q_n⊗_O K ≅ A/q^n, compatible in n; see Z18.
- `SaturatedPointJet.free` (data): Under the given Noetherian hypotheses Q_n is finite free over O by Z17; do not choose bases functorially.

- Test `SaturatedPointJet.power_series` (computation): For R=O[[x]] and xi(x)=0, J_n=(x^n) and Q_n is free on 1,x,...,x^(n-1). The transition Q_(n+1)→Q_n kills x^n.
- Test `SaturatedPointJet.saturation_strict` (non-example): For R=O[[x,y]]/(pi*y-x^2), P=(x,y), y belongs to J_2 because pi*y=x^2, but y is not in P^2. Saturation cannot be omitted.
- Test `SaturatedPointJet.torsion_boundary` (non-example): For R=O[[x]]/(pi*x) and xi(x)=0, every J_n=(x). The quotient system does not separate x; separation requires the extra hypotheses of Z20–Z22.
- Test `SaturatedPointJet.first_jet` (degenerate): J_1=P since R/P=O is pi-torsion-free, so Q_1≅O with its specified augmentation.

## Earlier extraction and continuation history

The earlier report follows intact; its numerical API censuses are historical.

---

# LLHLM23 universal-geometry API continuation — Codex, codex-a71f92

23 September 2026. Refs #1254. Continues merged #2350 at `4d0a3730ad392ed277d4ca56c9881340d1f6806e`.

Partial: **510 items (61 library,18 planned,431 missing),19 unchanged routes,44 unreviewed source findings.** The literal definition-API census is **107/156**, leaving49 unfinished interfaces. This pass supplies98 API entries and49 typed tests for all16 definitions/constructions in §3. It does not supply Lean implementations or finish the paper extraction.

## Scope and preservation

The refined entries are U01,U02,U03,U04,U06,U08,U10,U13,U15,U17,U18,U21,U25,U26,U27,U39. Each now has its own consumer records, named API entries with permitted roles, and at least three typed tests.

All510 item identities, kinds, locators, statuses and routes are retained. Only U27's existing statement changes, to qualify equivariance and repair the displayed inverse powers. All42 inherited source findings and all AppendixB data remain unchanged. E43 and E44 are additional findings awaiting independent review, not verified errata. The prior report and handoff are retained below as historical checkpoints; their older counts are not the current census.

| Entries | Interface checked | Tests that reject plausible wrong definitions |
| --- | --- | --- |
| U01,U02 | Tuple group scheme; shifted positive/full loops | Regular versus invertible parameter; lower constant entries; v versus v-t |
| U03,U04,U06 | Left fpqc quotient; negative loops; square-zero kernels | Determinant/height; negative lower constants; different upper/lower Lie cutoffs |
| U08,U10,U13 | Restricted Artinian lifting; chart matrices; special sections | Multiple dual-number lifts; empty nonpivot ranges; order of permutation and translation |
| U15,U17,U18 | Differential locus; Schubert orbit; naive intersection | v h' versus h'; non-minuscule orbit dimension; intersection versus union |
| U21,U25,U26 | Closure; parameter specialization; unibranchness | Saturation; vertical torsion; nilpotent and nodal local rings |
| U27,U39 | Torus chart action; common-base products | Correct weights and twisted equivariance; empty product; one shared v |

Uses are drawn from the explicit §3 consumers, the already recorded §5.2 matrix interface, and the existing owner briefs. Nontrivial supplied facts reuse the existing U05/U07/U09/U11/U12/U14/U16/U19/U23/U28/U30/U31 theorem entries instead of silently claiming that API prose proves them.

## E43: distinguish the two torus actions

The action just before Lemma3.4.6 sends the Grassmannian class of A to the class of A(r⁻¹v)D. The displayed chart formula instead gives the class of A(r⁻¹v)r^nu D: its left diagonal factor lies in the positive loop group and disappears in the left quotient.

Thus the precise comparison uses the torus automorphism
`theta_nu(D,r)=(r^nu D,r)`.
It is an automorphism, with inverse `(D,r)↦(r^-nu D,r)`. The inclusion of the chart is equivariant after precomposing the target action by this automorphism.

A concrete counterexample to untwisted equivariance is over Q at t=0:
`w=1,nu=(1,0),h=1,A=[[v,v^-1],[0,1]],D=I,r=2`.
The chart conditions hold: A v^-nu is lower-unipotent at infinity (in fact identity there), and v/(v-t)=1. The determinant is v and the height bound is1.

The original target action gives
`B=[[v/2,2/v],[0,1]]`,
while the chart action gives
`C=[[v,2/v],[0,1]]`.
Their possible left multiplier is
`CB^-1=[[2,-2/v],[0,1]]`,
which is not in the positive loop group. Therefore the two left quotient points differ. Applying theta_nu gives C exactly.

This is an error in the stated equivariance relative to the preceding action, not a counterexample to the main unibranchness theorem. The repaired action still preserves the relevant loci: right diagonal multiplication commutes with Diag(a), rotation commutes with v d/dv, and positive-left invariance is U16. Schubert loci are stable under the original torus. Thus precomposition preserves the needed stability. The actual chart action and the corrected E8 contracting weights do not change.

## E44: inverse powers in the preservation calculation

Both final right-hand sides in Lemma3.4.6's proof need exponent -nu:
`r^nu(v-rt)^-nu=(r^-1v-t)^-nu`.
For t=0,r=2,nu=1, the left side is2/v, not v/2. This repairs the two displayed equalities and the use of the chart conditions; it is separate from E43 and the previously recorded E8 sign issue.

Both findings were checked against rendered published PDF71 and Morra's author-preprint p.51. Exact-title/lemma correction searches and Levin's publication page located no correction. The arXiv record still lists v2 (15 June2022); this was a metadata check, not a full version comparison. Springer timed out, so its correction listing was not inspected. “New” means no correction located in the successful searches, not a claim of priority.

## Library and ownership discipline

Read the reviewed AUDIT-01 coverage for SchemeAndStackFoundations SF.0,SF.1,SF.4 and the current LocalGaloisDeformationRings L7 contract. General schemes, fibre products, topology and ring-level lifting theory are not replanned. In particular the pinned Mathlib file `Mathlib/RingTheory/Etale/Basic.lean` was opened through its formal-etale definition, square-zero lifting equivalence, composition and base-change results. U08 reuses `Algebra.FormallyEtale.comp_bijective` and `Algebra.FormallyEtale.iff_comp_bijective`; it retains the missing comparison to the paper's restricted functor-level property.

The current route boundaries stay unchanged: underlying Iwahori/Schubert/loop geometry belongs to the existing GeometricSatakeLocalModelsPartII proposal; differential conditions and local-model comparisons belong to LocalGaloisDeformationRingsPartIIMonodromyModels; the scheme-level lifting/normalization adapters use SchemeAndStackFoundations. No new roadmap is proposed.

Targeted full-tree searches in both pinned libraries did not identify the specialized universal-loop or unibranch carriers. This is not an exhaustive absence proof; the inherited item statuses are unchanged. The new API names are proposed names, not citations to existing declarations.

## Reading provenance

Freshly read published PDF55–80, covering §§3.1–3.7, including proofs and the product argument. Inspected the image of PDF71. The inherited complete main-paper read remains attributed to codex-7e92bd.

- Published author-hosted source: [LLHLM23](https://math.rice.edu/~bl70/LocModels.pdf), SHA256 `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`, rehashed23 September2026.
- [Morra author preprint](https://www.math.univ-paris13.fr/~morra/MLM.pdf), SHA256 `8cb1a1dd2eb23404ee9a99b5f0c2632cd1b6f1b879069a6080ff652f8f4f4d6d`, fetched23 September2026; only pp.51–52 read for this comparison.
- [Stacks06DT](https://stacks.math.columbia.edu/tag/06DT) definition/branch discussion and [Stacks0C2E](https://stacks.math.columbia.edu/tag/0C2E) statement/proof checked. Reduced excellence is retained in the completed-domain comparison.
- [Stacks02HY](https://stacks.math.columbia.edu/tag/02HY) statement/proof checked. It supplies a smoothness criterion; uniqueness/unramifiedness is also needed for the etale upgrade.

## Validation and remaining work

The paper checker passes. The paper, queue and intake unit suites pass41 tests. A separate preservation audit verifies all510 unique IDs, exactly one route for each missing item, all19 unchanged routes, the42 unchanged inherited findings, the107/156 literal API census and the acyclic288-edge internal dependency graph.

Exact standard-library Fraction/Laurent-matrix diagnostics check238440 coordinate weights,6372 fixed-section cases,9 compositions, E43's nonpositive coset defect and27 E44 inverse-power identities. The coefficient-weight check ranges over n=2,3,4, all permutations, all nu in {-1,0,1}^n, h=0,1,2,3, mu=(n-1,...,0), N=n, and every allowed coefficient. The weight
`N(nu_j-[i>j]-k)+mu_(w(j))-mu_i`
is zero at pivots and strictly positive elsewhere. Fixed-section checks use the same n,w,nu, diagonal D=(2,...,n+1), and r=2,3,5. These finite diagnostics are regression checks, not proofs of the source's geometric theorems.

Still unfinished:14 M interfaces,17 K interfaces,12 G interfaces, Q01,Q02,Q07,Z02,L05,Z15. The inherited global base-change/Galois-twist and genericity bridges, source/proof closure, analytic inputs, multipart extraction and AppendixB certificates also remain open. The literal API census does not certify all prerequisite lemmas or mathematical completeness.

No Lean file is required for this extraction and no Lean compilation was run. E43/E44 need a different worker's verification.

Publication refresh: fresh main `2eae58ee83bfd53d4515306eb8bde282fda5a175` matched all309 guarded inputs and allthree original deliverables byte-for-byte. The three-file patch was replayed there and the checker,41 tests and intake validation passed again.

Earlier report preserved below:

---

# LLHLM23 base-change continuation — Codex, codex-a71f92

23 September 2026. Refs #1254. Continues the reconciled #2317/#2318 checkpoint, not either pre-merge branch.

Partial: **510 items (61 library, 18 planned, 431 missing), 19 routes, 42 unchanged unreviewed findings.** Of 156 definitions/constructions, 91 have literal itemwise uses/API and at least three typed tests; 65 remain. No Lean file is required or compiled, and no implementation or independent review is claimed.

## What this continuation establishes

A59–A62 separate four inputs previously hidden in A30's global supplier boundary:

| Item | Contract | Existing owner |
| --- | --- | --- |
| A59 | Compact-unitary base change, discrete constituents and comparison at split places, with the actual degree restriction | EndoscopicTransferAndUnitaryTraceComparison ET.7a, using ET.4 |
| A60 | Discrete Speh quotient with the symmetric normalized exponent string; consumer-derived API and four typed tests | ET.7a |
| A61 | Number-field discrete GL spectrum classified by these quotients, including genuinely residual blocks | ET.7a |
| A62 | Given the actual compatible Galois direct-sum isomorphism, absolute residual irreducibility forces one block of length one | AutomorphicGaloisRepresentationsPartII AG2.2/AG2.7, importing A50 |

The first three share one new source route to the existing endoscopic roadmap; A62 extends the existing AG2 source route. No new roadmap or alternate automorphic/Galois carrier is proposed. The old eighteen route identities and every missing item's unique route are preserved. A30 alone receives additional prerequisites and a qualified proof-outline continuation; no previous item's statement, status, API or tests changed.

## Source result versus missing comparison

Labesse's Corollary 5.3 gives a discrete base-change decomposition with local comparison at split/unramified places. Compact infinity supplies its sign condition. Its standing restriction [F+:Q]>1 is available: LLHLM Section 9.1 explicitly excludes F+=Q. Discrete summands must not silently be called cuspidal. The stronger nonsplit-place conclusion of Labesse5.9 assumes cuspidality and the stated quasi-split condition; it is not needed to manufacture a split-place comparison. [Labesse author preprint, pp.1–2,42–44,49–50](https://www.imj-prg.fr/fa/bpFiles/Labesse2.pdf)

A60/A61 preserve the residual alternative: the normalized exponents are (b−1)/2, (b−3)/2, ..., (1−b)/2, and the representation is the irreducible **quotient**. The rank-one/b=2 local example is the character of GL2, not Steinberg; this prevents confusing a residual Speh quotient with the other constituent's nonzero monodromy. The classification is a named existing ET.7a proof target, not a fresh proof of the entire spectral theorem. [Mœglin–Waldspurger, printed605–607](https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf)

A62 is an explicit elementary adapter, conditional on the missing Galois realization. By A50, the stable lattice's absolutely irreducible residual representation makes its characteristic-zero representation absolutely irreducible. In an equivariant direct sum with at least two nonzero summands, any one summand is a proper invariant subspace. Therefore the sum of the positive block lengths is one. This rules out both multiple isobaric constituents and a single residual block of length greater than one. Repeated characters cause no exception.

The premise matters: a rank equation or an automorphic decomposition alone is not a Galois-equivariant isomorphism. Still required are the algebraic normalization of each cuspidal factor, the exact character/cyclotomic twists in its Galois representation, Frobenius-polynomial comparison and semisimple uniqueness. The global Whittaker-to-local-genericity step, sigma(lambda,tau)^* coefficient/type dictionary, and integral deformation-quotient point criterion also remain open. A55's monodromy inequality must not be upgraded to equality using EGH's semisimplified coefficient-prime comparison.

## White version warning, not a new erratum verdict

The author-hosted EGH proof of Theorem7.2.1 cites White Theorem6.1 and Remark6.3. White's June2011 IHES PDF lacks that remark; arXiv v7 contains it, while v8 is an author withdrawal dated2012-12-07 citing an error in the main proof. Neither historical copy is treated as an unqualified proof certificate here. [EGH, p.56](https://math.uchicago.edu/~emerton/pdffiles/egh.pdf), [White version history and withdrawal](https://arxiv.org/abs/1106.1127)

I have not located the precise faulty White argument or audited subsequent repairs. The withdrawal does not by itself show that White6.3, EGH7.2.1 or LLHLM's theorem is false. Accordingly this is recorded in source provenance and the explicit source-version gap, not appended as a newly confirmed sourceIssue. All forty-two inherited findings remain verbatim, unreviewed.

## Reading and library scope

Fresh targeted main-paper reading: published LLHLM PDF49–53,180–182,188–190,196–198. The inherited full main-paper reading remains attributed to codex-7e92bd.

Fresh suppliers:

- EGH PDF51–56 and Section4.1.1 coefficient convention.
- Labesse author-preprint selected passages on pp.1–3,41–44,48–50, including the full Corollary5.3 proof and Theorem5.9 proof. Image p.43 checked. This is not a published-pagination equivalence claim or a full trace-formula audit.
- Mœglin–Waldspurger printed605–607/PDF2–4, including the introduction theorem and normalized induction convention; image printed605 checked. The rest of the seventy-page proof is not claimed read.
- White v7 Section6 through the displayed spectral-decomposition argument, the earlier IHES Proposition2.1/6.1/6.2 comparison, and the arXiv withdrawal metadata, solely to qualify the citation chain.

The source URLs, retrieval dates and SHA-256 values are in source.continuationReadings. New PDF hashes:

| Source | SHA-256 |
| --- | --- |
| Labesse53-page author preprint | `c85a0fde13266e3ed6c76d34330b4c51023376f8fe25406da0370fa47c5a45d2` |
| Mœglin–Waldspurger published scan | `a46e3549d05d2cd39f396ef326840f4484f3935ff3daa17e6339091962de9e94` |
| White v7, withdrawn work | `348488c5c066038b2425117bb946243767fe62171791c4786f80381dbef36710` |
| White earlier IHES copy | `f7513bf17a48535ea73a7a776e5d198e3a75a79767de7865912c8534ec97fa89` |

The EGH bytes match the earlier recorded `1a5f6d23149f530603d961e239ef9990bd02e9aca912a6e4483978da6f2689b0`. LLHLM uses the already fetched published PDF with hash `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`.

Read the relevant reviewed AG2 coverage entries, ET.4/6/7a and AG2.0/1a/2/5/6/7 stage contracts, and alternative AF/SR/GL2-form ownership candidates. Exact-family keyword searches across both pinned Lean trees found no corresponding base-change/Speh implementation; the only Whittaker hit was the analyst's name in a bibliography. This narrow search is not an exhaustive absence theorem. All four new items are **planned** because the specific existing layers explicitly own them. No new library declaration is asserted. Existing ET.7a supplies the automorphic branch without IG/Igusa concentration.

## Validation and reproducibility

Base snapshot: `eb1e3cd2954d8c15df51f330604a9c9c490d8fc0`.

Guarded original deliverables:

- Result: `4cdff1507f305fea2d5155f8d888810c5b3a593109be0b67a220a99dbce2cb3f`.
- Report: `1c87f6d9402a8115a4aa4dd636fccce94cf70a806fe8ae1bddc2ee8ea5e1ffc6`.
- Handoff: `c43d3316b09652b40efbfb73a4d3df2d2ccd32d7c24ec9f8ecb874ead2e8e7ec`.

The paper checker passes. Unit suites test_check_paper, test_papers_queue and test_intake pass: 9 + 3 + 29 = 41 tests. The separate standard-library audit checks all item IDs, one route per missing item, all 506 old statements/statuses/APIs/tests, every original finding, all AppendixB data and ownership reconciliation. The only changed old item is A30's prerequisites/proofOutline. The recorded internal dependency graph has 288 edges and is acyclic.

Fresh finite diagnostics check 4,339 positive-dimension block configurations of total rank at most12: four single-summand cases and 4,335 proper-summand controls. Twelve symmetric rational exponent strings and eighty-four uniform-twist checks pass. They test the rank/exponent arithmetic, not automorphic or Galois theorems. Core diagnostic:

```python
from fractions import Fraction
from itertools import product
for r in range(1, 5):
    for pairs in product(list(product(range(1, 5), repeat=2)), repeat=r):
        n = sum(m*b for m, b in pairs)
        if n > 12:
            continue
        if sum(b for m, b in pairs) == 1:
            assert r == 1 and pairs[0][1] == 1 and n == pairs[0][0]
        else:
            assert 0 < pairs[0][0] < n
for b in range(1, 13):
    e = [Fraction(b-1, 2)-j for j in range(b)]
    assert sum(e) == 0 and e == [-x for x in reversed(e)]
    assert all(e[j]-e[j+1] == 1 for j in range(b-1))
    for t in range(-3, 4):
        shifted = [x+t for x in e]
        assert sum(shifted) == b*t
        assert all(shifted[j]-shifted[j+1] == 1 for j in range(b-1))
```

The final intake check passes: 3 files, 0 problems. Fresh main `f9d7f937e0a52bd35d154725f40bf76094f73abc` retained all three original deliverables and all 309 guarded inputs (atlas, reviewed coverage, binding instructions, content Markdown and existing roadmap/packet JSON) byte-for-byte. The three-file patch was replayed and retested on that base. No Lean elaboration was attempted.

## Resume

Start with the exact Speh-factor algebraic/Galois twist realization into AG2.2, then complete the local genericity, dual-coefficient/type occurrence and integral point criterion. Do not repeat the Labesse/Mœglin–Waldspurger statement search or infer it from the withdrawn White source. Retain every other inherited gap and the sixty-five remaining definition APIs. The following earlier reports are preserved verbatim as history.

---

# LLHLM23 continuation — Claude Code, cc-442dc5, 23 September 2026

This is a **partial checkpoint**, continuing PR #2301. It is now merged with the concurrent codex-7e92bd checkpoint #2317. It keeps that checkpoint's 506 items (61 library, 14 planned, 431 missing), 18 routes and 40 unreviewed source findings unchanged, and adds two new unreviewed findings, E41 and E42. No statement, status, route, inherited finding or ID was altered, and no Lean file was written or compiled.

## Merge with #2317 (same issue, concurrent)

#2317 (codex-7e92bd) ran on the same issue at the same time and was merged first; its handoff records how the claims crossed. Main was merged into this branch, and the two sets of changes were combined as follows:
- **#2317 is kept unchanged.** Its 26 new items, routes and findings are kept, and so are its own itemwise interfaces for A06 and N57. They replace the ones this continuation had written for those two entries.
- **A06 gains one test.** The only addition to #2317's A06 is the non-example test `PolarizedGroup.adjoint_j`, which goes with E42.
- **Findings renumbered.** #2317 took the IDs E39 and E40, so this continuation's findings are now E41 (Lemma 8.4.9 notation; E39 in the earlier commits of this PR) and E42 (the adjoint representation of G_n).
- **Census.** After the merge it stands at **90 of 155** definitions and constructions, with **65 remaining**.

## Fourth pass (same session): Appendix A deformation and patching definitions

A fourth pass read published PDF188–201 (Appendix A.1–A.5) afresh. It supplied itemwise interfaces for thirteen entries (its A06 interface gave way to #2317's in the merge):
- **Deformation theory.** A05 (liftings, strict equivalence and det), A07 (Definition A.3.1, local deformation problems), A08 (fixed-determinant quotients and their O-flat quotients), A09 (global G_n-deformation data and type S), A10 (T-framed deformations, R^loc_{S,T} → R_S^T and the frame isomorphism) and A11 (relative tangent spaces and the Selmer cone C_{S,T}, with E22 and E23).
- **Taylor–Wiles data.** A13 (the ψ_v ⊕ s_v condition), A15 (Δ_Q, O[Δ_Q] → R_{S_Q} and augmentation descent) and A16 (the block parahorics p_v, p_{v,1} and U_0(Q)/U_1(Q) ≅ Δ_Q).
- **Patching.** A19 (the projected finite modules M_{m,K_p,r}, their framed versions and O_∞, S_∞), A20 (the ultrafilter module M_∞ and (A.4)), A22 (R_∞ with the corrected g of E24, and the lift S_∞ → R_∞) and A23 (the exact covariant functor M_∞(−), its augmentation quotients and the nonvanishing criterion of Lemma A.1.1(1)).

The `uses` entries point to the Appendix A theorems that consume each object (A01, A12, A14, A17, A18, A21, A24, A26, A27, A29, A33) and, for the patching data, to the §6 interfaces P03 and P04.

**Hand-checked cases behind the tests:**
- Ad(j) on Lie G_n and the j-stable line spanned by (½I, 1) for p > 2;
- j(j(g,a)j)j = (g,a), and the case n = 1;
- GL₁ liftings to F[ε], and the failure of Hom(m/m², F) for A = O (E22);
- the Iwahori case n = 2, d_v = 1, where p_v/p_{v,1} ≅ k_v^×(p) through the lower-right entry;
- k_v^×(p) ≅ Z/p^N when Nv − 1 = p^N·u with p ∤ u;
- O ⊗_R ∏_m O/ϖ^r ≅ O/ϖ^r for the ultrafilter;
- g = q − [F⁺:Q] for n = 2.

**A new finding, E42 (error, unreviewed; affects nothing).** §A.3.3 defines ad r̄ as the representation "obtained by the projection Lie G_n ↠ gl_n" after writing Lie G_n ≅ gl_n × gl_1. Differentiating j(g,a)j = (a·ᵗg⁻¹, a) gives Ad(j)(X, b) = (b·I − ᵗX, b). So Ad(j)(0, b) = (b·I, b), and the kernel of the coordinate projection is not j-stable. The intended representation is the summand ker(dν) = gl_n × 0, on which j acts by X ↦ −ᵗX. For p > 2 this equals the quotient along the stable line spanned by (½I, 1). The cited sources [16] and [78] use this representation, so no result changes. The same sentence appears in arXiv 2007.05398v2.

**Census.** After the merge it stands at **90 of 155**; **65 remain**. They are 16 U entries (§3), 14 M (§4), 17 K (§5) and 12 G (§7), with Q01, Q02, Q07, Z02, L05 and Z15.

## Third pass (same session): §8 Breuil–Mézard definitions

A third pass read published PDF162–180 (§8) afresh. It supplied itemwise interfaces for seventeen entries:
- **Cycles and types.** B01 (stack cycles and the representation Grothendieck group) and B02 (extremal types and Z_{λ,τ}).
- **The two conjectures.** B03 and B06, recorded as conjectural interfaces, not theorems.
- **Systems and pullbacks.** B04 (Breuil–Mézard systems), B05 (versal pullback) and B07 (module cycles).
- **The §8.3 framework.** B09 (component-meeting test sets), B12 (irrelevant weights), B13 (covering, disjointness and relative genericity) and B14 (relative systems and S_P).
- **Constructions.** B18 (truncation idempotents), B19 (the systems S_{Λ,t}, S̃_{Λ,t}, S̃_{Λ,t,elim} and P_ss), B22 (generic weights) and B27 (shifted polynomials).
- **Defect.** B34 (defect) and B36 (the recursion, with the E21 exclusion).

**Hand-checked cases behind the tests:**
- the GL₁ component count p^f − 1;
- a module cycle on F[[x,y]]/(xy);
- the lattice points of Conv((1,0)) for n = 2;
- ℓ(t_η) = 4 for GL₃, with defect 0 exactly on the 6 obvious weights;
- the GL₁ Breuil–Mézard system;
- the extremality of GL₃ Jordan types.

**A new finding, E41 (misprint, unreviewed; E39 before the merge).** Lemma 8.4.9 writes S_{Λ,τ} three times for the system S_{Λ,t} defined in §8.4, and X^{λ,τ} for X^{λ+η,τ}. This was checked on the page image of PDF173.

**Census.** Before the merge it stood at **73 of 152**, with **79 remaining**.

## Second pass (same session): §6 and §9 definitions

A second pass read published PDF125–131 (§6) and PDF180–186 (§9) afresh (same hash). It supplied itemwise `uses`, `api` and typed tests for sixteen more entries.
- **The §6 patching data.**
  - P01, the framed lifting ring, and P02, the type quotients R^{λ,τ} and R^{λ,⪯τ}.
  - P03, the patched ring R∞ with its η-shifted type quotients.
  - P04–P08: the weak, minimal, potentially diagonalizable, detectable and S-minimal patching functors.
- **The §9 global setting.**
  - V01, definite unitary groups, and V02, S(U,W).
  - V03, Hecke algebras and r_m, and V04, modular weights.
  - V05, geometric and BM weights, and V06, the conjectural interfaces.
  - V08, the genericity polynomial, and V10, the component primes p_σ(ρ̄).

**Hand-checked cases behind the tests:**
- GL₁ lifting rings over Q_p for p odd: O[[X,Y]] framed, and O[[X]] with the type fixed.
- The completed-tensor dimension formula dim R∞(λ,τ) = dim R^{λ+η,τ} + dim R^p − 1.
- The GL₂ Hecke polynomial 1 − T^{(1)}X + N(w)T^{(2)}X².
- The double-coset decomposition of S(U,W).
- The dual of Sym^r⊗det^a.
- P_m = (−1)^m m! for n = 1.

**Census.** Before the merge it stood at **56 of 152**, with **96 remaining**.

## What this continuation does

It closes the §2 part of the definition-API gap. The thirty §2 definitions and constructions that had no itemwise interface now each have:
- recorded `uses`, pointing to the items and passages that consume them;
- an `api` outline in the protocol's roles;
- at least three typed unit tests.

The thirty entries are N01–N06, N11, N14–N17, N22–N24, N27–N29, N32, N33, N35, N43, N45, N49–N51, N56, N57, N62, N65 and N66; N57's interface later gave way to #2317's. Before the merge the literal census counted **40 of 152** definitions and constructions with itemwise uses, API and three typed tests.

## How the interfaces were derived

- **The source.** The same author-hosted published PDF was re-downloaded; its SHA-256 matches. PDF24–53 (§1.8 notation and all of §2) were read in the text layer, and PDF34 and PDF42 as page images.
- **Where the uses came from.** Each use was found by searching the whole text layer (PDF54–212) for the notion and reading the passage that consumes it. Examples:
  - AP(λ) labels the top components of the naive special fibre (PDF92).
  - Adm(λ+η) is the condition of Corollary 5.5.8 (PDF123, 130).
  - P-genericity is the hypothesis of Theorem 7.3.2(2) and Theorem 9.1.6 (PDF151, 184).
  - Covering is used through Remark 4.7.4(2), §8.6 and Lemma A.2.1 (PDF98, 179, 189).
- **API items.** They serve these uses or the standard needs of the object:
  - the defining characterisation, with its convention made explicit (right translation for genericity, the η-shift for depth, t_{ω−η}w̃₁ for the central lift per E2, and the E/F shift of Remark 2.4.2);
  - W-invariance, stability and mixing results such as Proposition 2.1.12;
  - the bijections the paper proves (Corollary 2.1.7, Propositions 2.3.7 and 2.6.2, Lemmas 2.2.4, 2.3.2 and 2.4.4).
- **Anti-multiplicativity of the star.** For (−)*, the API records that it is a group isomorphism onto the opposite group, as E1 requires.

## Tests, and the small cases behind them

The tests are chosen so that a plausible wrong definition fails one of them. The small cases were checked by hand:

- **Admissible sets for GL₂.**
  - Adm((1,0)) = {t_{(1,0)}, t_{(0,1)}, t_{(1,0)}s} has 3 elements, and its regular part has 2.
  - Adm((2,0)) has 5 elements, 4 of them regular. This matches the four generic constituents of R̄⊗Std, which is how AP((1,0)+η) gets 4 elements.
  - Ω = ⟨t_{(1,0)}s⟩, with (t_{(1,0)}s)² = t_{(1,1)}. W̃₁⁺ = Ω for GL₂, so covering between 3-deep GL₂ weights is equality.
- **Star, depth and genericity.**
  - (t_{(1,0)}s)* = s t_{(1,0)}, whereas t_{(1,0)}*·s* = t_{(1,0)}s; so the star is not multiplicative.
  - At p = 7, λ = (3,0) is 2-deep but not 3-deep, and P₁(λ) = −8 is a unit mod 7.
  - λ = (−1,0) shows that depth is measured after the η-shift.
- **Dot action and Herzig's involution.**
  - s·(1,0) = (−1,2), and s·0 = (−1,1) ≠ 0.
  - For GL₂ with η = (1,0): R(Sym^r⊗det^b) = Sym^{p−2−r}⊗det^{r+b+1−p}, and R² is the twist by det^{−p}.
- **Herzig sets.** By Proposition 2.6.2, |W?| = |W_obv| = 2 for GL₂. For GL₃, |W?| = 9 (3 lower-alcove pairs and 6 upper-alcove pairs) and |W_obv| = 6.
- **Tame types.**
  - τ(s,(a,b)) = ω₂^{a+pb} ⊕ ω₂^{b+pa} for the transposition, consistent with the explicit characters of (2.12).
  - The E-compatible and F-compatible central classes of the same GL₂ presentation differ by η|_Z = 1.
  - The class of w̃(ρ̄,τ) in W̃/W_a is always (λ+η)|_Z, so it is never 1 for GL_n with n ≥ 2 and λ = 0.

These are hand computations recorded as planning contracts, not machine certificates.

## Validation and resume point

- **Checks.** `check_paper.py` and the three-file intake pass after each pass. After each pass, a structural comparison with the previous commit confirmed two things. The only items that changed were the ones listed for that pass. They changed only in `uses`, `api` and `tests`.
- **Other changes.** Only these top-level parts were extended:
  - `source.continuationReadings`;
  - `summary`;
  - `gaps` (the `definition-api` entry);
  - `validation` (the `claudeCc442dc5Continuation` entry, with a subkey for each later pass);
  - `sourceIssues`, where E41 and E42 were appended.

  Inherited findings, routes and Appendix B data are unchanged.
- **Merge check.** Against merged main, the only changes are the 75 items listed in the passes (in `uses`, `api` and `tests` only), the added A06 test, the two appended findings and the extended top-level entries.
- **Vocabulary.** Every API role and test kind is in the protocol vocabulary, and every `uses` reference to an item resolves.

Resume with the handoff's list, with item 4 narrowed to the 65 remaining entries listed above. The §7 entries (G) are a natural next batch, because G04 and G09 already have itemwise interfaces to follow.

## Earlier checkpoint reports (historical, preserved)

The concurrent codex-7e92bd report from #2317 and the older reports follow unchanged.

# LLHLM23 global-descent continuation — Codex, codex-7e92bd

This partial checkpoint continues PR #2301 with **506 items (61 library, 14 planned, 431 missing), 18 routes and 40 unreviewed source findings**. All 480 inherited item statements, all 38 inherited findings and the Appendix B data are preserved. No Lean file was required or compiled; none of the mathematics is claimed formalized.

A34–A58/L61 separate the integral and local compatibility suppliers of Appendix A. The primary references are [CHT §2.1 and Proposition 3.4.4](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), the published [Bellaïche–Chenevier sign theorem](https://doi.org/10.1112/S0010437X11005264), and [BLGGT's coefficient-prime comparison](https://virtualmath1.stanford.edu/~rltaylor/lg2.pdf). The exact hypotheses, locators, reading boundaries and hashes are in the JSON.

## Integral descent and the sign

The descent construction keeps three distinct steps. A37–A38 put each polarized constituent over an integral coefficient ring after a permitted finite extension. A39–A45 descend its matrices from a larger complete local ring using absolute residual irreducibility and traces. A46–A49 assemble the constituents over a common-residue ring and descend to the reduced finite flat local Hecke algebra. The fixed multiplier is explicitly valued in the smaller ring. No theorem asserting multiplier descent from traces alone is used.

A46 is not the unrestricted product of the coefficient rings: their residues must come from one specified element of the Hecke residue field. This also means that a coordinate projection need not be surjective when that coefficient ring has a larger residue field. Its itemwise tests check that boundary. The Hecke trace argument uses closedness and density of the conjugacy saturation of split Frobenius classes; it does not assume a chosen set of Frobenius representatives is itself dense.

A34–A36 keep the pairing and its sign in the actual representation carrier. Conjugate self-duality supplies an extension to G_n but does not choose an arbitrary value for the multiplier on complex conjugation. A51 imports the positive automorphic pairing sign; A52 then computes ν(c)=−1 and ξ=ε^(1−n)δ^n. The published sign theorem is used: the old arXiv v1 still described the automorphic construction as expected. Its eigenvariety proof is not claimed fully read or decomposed in this continuation.

The small-extension descent adapter A42 retains absolute irreducibility. Its matrix-algebra derivation formula A41 divides by neither n nor n!, including when the residue characteristic divides n. The complete-local recursion and the self-dual-lattice argument still have leaf-level proof obligations listed in `global-descent-supplier-atoms`.

## At-p comparison and the remaining automorphic interface

EGH7.2.1(iv) forgets monodromy. A53 instead imports BLGGT's bound without Shin regularity, and A54 spells out the passage from Weil-block partitions to inertia-isotypic nilpotent partitions. With type occurrence N58, transitivity gives A55. No equality of monodromy is inferred from equality of semisimplifications. The existing stronger Caraiani coefficient-prime supplier was inspected, but this checkpoint uses only the bound needed here.

A50 proves that an integral representation with absolutely irreducible reduction is absolutely irreducible in characteristic zero. This does **not** by itself identify an arbitrary compact-unitary constituent with a RACSDC cuspidal GL_n system or prove local genericity. The White/Labesse strong base-change decomposition, its twists, and that cuspidality/genericity passage remain required inputs to A30/A55. Likewise the dual coefficient/type-occurrence dictionary and integral local-deformation point criterion remain explicit. The corrected projector restriction from A30–A33/E38 is preserved.

## Shared ownership and APIs

The actual polarized group A06 and polarized adequacy A26 now use **ArithmeticGaloisRepresentations G7**, which GlobalGaloisDeformations G7 already imports. IntegralHeckeAndGaloisDeterminants IHG.1/IHG.2 owns trace reconstruction and the finite Hecke image; AutomorphicGaloisRepresentationsPartII AG2.2/AG2.5/AG2.6 owns automorphic sign and local compatibility. Three source routes to those existing owners are added; every previous route identity remains. No new roadmap is proposed. The existing AG2.6 coefficient-prime node is reused at its recorded scope, while the finer comparison adapter is an additional source obligation.

A06, A34, A35, A46 and N57 have consumer-derived APIs and three or more typed tests. The literal itemwise census is now **15 of 155** definitions/constructions; the other **140** still require refinement. The earlier grouped plans are retained but do not count as complete individual APIs.

A57 and A58 promote the transitivity and power-rank API facts used by A55 and A54. L61 imports the existing Tau Ceti partition dominance order at its full pin; the inertia and nilpotent-operator adapters remain separate.

## Two adjacent-source corrections

E39 records the scalar conjugation in CHT2.1.12. If A=αB and α=β², conjugation by β⁻¹I removes α; the printed βI instead multiplies by another β². The example over F5[ε]/(ε²) in the JSON checks the direction and repairs the proof without changing the theorem. The author version has the same display. This finding awaits independent review.

E40 records the passage to a Galois closure in the sign paper's Lemma3.5 proof. Linear disjointness need not survive that passage: K=Q(i), K′=K(cuberoot(2)), M=K(ζ3) gives a cubic/quadratic example. A56 gives the repaired proof directly from the restriction surjection G_K′→Gal(M/K). The theorem needs no Galois hypothesis on K′. This too awaits independent review.

## Validation and reading limits

The structural check verifies unique IDs, one route per missing item and an acyclic **282-edge** internal graph. It preserves the original statements and Appendix B data. Paper and three-file intake validators and whitespace checks are run. No repository implementation changed; this checkpoint's mathematical diagnostics do not replace source proofs.

The finite diagnostics pass: 3,141 matrix-derivation identities on basis elements (including characteristics dividing n), 26 scalar inverse calculations, 596 principal-unit roots in finite p-adic approximations, 3,582 partition/rank comparisons, 6,876 direct-sum dominance comparisons, 495 common-residue tuples and two sign examples. The characteristic-two square-root obstruction is a separate negative control. General analytic, Galois and complete-ring statements are not certified by these tests.

Fresh readings: LLHLM23 PDF189–190,196–198; CHT published PDF7–16,104–108; EGH PDF51–56; BLGGT l=p II PDF1–12, including the two main proof arguments; Bellaïche–Chenevier published PDF2–9,15–17; Caraiani PDF1–5 only. The original 212-page full reading and all earlier diagnostics retain their original attribution. No full reading of CHT, EGH, the sign paper or Caraiani is claimed here. The relevant published pages for both new corrections were also checked visually.

The following diagnostic code is reproducible with Python and SymPy; it is kept here because scratch files are not deliverables.

```python
from itertools import product
import json
from pathlib import Path
checks={}
def mat(n,fn):return tuple(tuple(fn(i,j) for j in range(n)) for i in range(n))
def add(A,B,p):return mat(len(A),lambda i,j:(A[i][j]+B[i][j])%p)
def sub(A,B,p):return mat(len(A),lambda i,j:(A[i][j]-B[i][j])%p)
def mul(A,B,p):return mat(len(A),lambda i,j:sum(A[i][k]*B[k][j] for k in range(len(A)))%p)
def tr(A,p):return sum(A[i][i] for i in range(len(A)))%p
c=0
for p in [2,3,5]:
 for n in [1,2,3]:
  E=[[mat(n,lambda a,b:int((a,b)==(i,j))) for j in range(n)] for i in range(n)]
  Z=mat(n,lambda i,j:0)
  # Exhaustive small matrices, plus spanning matrix units for rank 3.
  mats=[mat(n,lambda i,j:a[i*n+j]) for a in product(range(p),repeat=n*n)] if n<3 else [E[i][j] for i in range(n) for j in range(n)]
  for C in mats:
   d=lambda X:sub(mul(C,X,p),mul(X,C,p),p)
   A=Z
   for j in range(n):A=add(A,mul(d(E[j][0]),E[0][j],p),p)
   for row in E:
    for X in row:assert d(X)==sub(mul(A,X,p),mul(X,A,p),p);c+=1
   for row in E:
    for X in row:assert tr(d(X),p)==0
checks['matrix_derivation_basis_identities']=c
# Dual number scalar correction, including a control at characteristic 2.
c=0
for p in [3,5,7,11]:
 for a in range(p):
  b=a*pow(2,-1,p)%p
  assert (2*b)%p==a
  # beta^-2 * alpha has epsilon coefficient 0; beta^2 * alpha has 2a.
  assert (-2*b+a)%p==0
  if a:assert (2*b+a)%p!=0
  c+=1
checks['scalar_inverse_corrections']=c
assert all((2*b)%2!=1 for b in range(2));checks['dyadic_square_root_obstruction']=1
# Principal roots in finite p-adic approximations: uniqueness among 1 mod p.
c=0
for p in [3,5,7]:
 for e in [1,2,3,4]:
  q=p**e;roots={}
  for b in range(1,q,p):roots.setdefault(b*b%q,[]).append(b)
  for a in range(1,q,p):assert len(roots.get(a,[]))==1;c+=1
checks['principal_unit_roots']=c
# Rank characterization of nilpotent dominance and direct-sum stability.
def parts(n,hi=None):
 if n==0:yield ();return
 for k in range(min(n,n if hi is None else hi),1-1,-1):
  for tail in parts(n-k,k):yield (k,)+tail
def rank(a,k):return sum(max(x-k,0) for x in a)
def dom(a,b):return all(sum(a[:i])<=sum(b[:i]) for i in range(1,max(len(a),len(b))+1))
c=s=0
for n in range(1,11):
 for a in parts(n):
  for b in parts(n):
   assert dom(a,b)==all(rank(a,k)<=rank(b,k) for k in range(1,n+1));c+=1
   if dom(a,b):
    for extra in [(),(1,),(2,1),(3,2,1)]:
     assert dom(tuple(sorted(a+extra,reverse=True)),tuple(sorted(b+extra,reverse=True)));s+=1
assert not dom((4,1,1),(3,3)) and not dom((3,3),(4,1,1))
checks['partition_rank_comparisons']=c;checks['direct_sum_dominance']=s
# Common-residue products at finite level: exclude arbitrary product idempotents.
c=0
for p in [3,5,7]:
 q=p*p
 A=[(x,y) for x in range(q) for y in range(q) if (x-y)%p==0]
 assert (1,0) not in A
 for x,y in A:
  if x%p:
   assert (pow(x,-1,q)-pow(y,-1,q))%p==0
  assert bool(x%p)==bool(y%p);c+=1
checks['common_residue_tuples']=c
# Exact SL2/normalizer polarization-sign examples over Q via SymPy.
import sympy as sp
J=sp.Matrix([[0,-1],[1,0]]);X=sp.Matrix([[0,1],[1,0]])
for g in [sp.diag(2,3),sp.Matrix([[0,2],[3,0]])]:
 gc=g/g.det();perp=gc.inv().T
 assert perp==J*g*J.inv()
 chi=1 if g[0,1]==0 else -1
 assert perp==chi*X*g*X.inv()
checks['normalizer_two_signs']=2
print(json.dumps(checks,indent=2));Path(__file__).with_suffix('.json').write_text(json.dumps(checks,indent=2)+'\n')
```

---

The previous report follows as historical evidence. Its counts and remaining-work list are superseded by this continuation and the current handoff.

# LLHLM23 continuation — Codex, codex-c83e7a, 23 September 2026

This is a **partial checkpoint** with 480 items (60 library, 8 planned, 412 missing), 15 unchanged route identities and 38 unreviewed source findings. It builds on the 456-item checkpoint from PR #2272, preserving the original full-paper reading attribution and existing route identities. No Lean implementation or independent review is claimed.

## Generic tame representations

Items K45–K48 supply the missing tame-to-semisimple bridge with the actual genericity assumptions. In the fundamental-character formula, the difference of two exponents is a sum of signed base-p digits. One-deepness gives nonzero digits of absolute value at most p−2. The sum is nonzero modulo p, while its absolute value is strictly less than p^d−1; the two characters therefore differ. This proof works in all ranks and is insensitive to central shifts.

For a tame residual representation with distinct inertia characters, Frobenius permutes the one-dimensional character spaces. Each orbit sum is simple: inertia projectors force an invariant subspace to be a sum of character lines, and Frobenius transitivity then forces the whole orbit. This argument does not require Frobenius to be semisimple and does not divide by an orbit length. Corollary 5.5.10 transfers (h+1)-genericity of a lifting type to 1-genericity of the residual representation; the resulting semisimplicity justifies the step in Corollary 5.5.8. The dependency chain uses Proposition 5.5.9 and Corollary 5.5.10 before Corollary 5.5.8, so it does not reason in a circle.

E19 remains an error in the unrestricted assertion: an unramified unipotent representation is tame without being semisimple. The new argument repairs the generic tame applications, not that unqualified equivalence.

## Appendix A hypotheses and levels

A14 now states the full prime-selection hypotheses checked against Thorne Proposition 4.4; A25 separately records the partially framed generator count. The local tangent-dimension equation is required at v in S minus T. The hypothesis is the polarized G_n version of adequacy (A26), with its adjoint cohomology vanishings and generalized-eigenspace trace witnesses; it is not replaced by enormous image or by an unpolarized determinant count. A27 records the dual-Selmer trace-kernel mechanism. For T=S the count is q−[F+:Q]n(n−1)/2.

A17, A28 and A29 distinguish original, auxiliary parahoric and diamond levels. They retain the corrected Hodge shift and monodromy dominance from E33–E34. Only the third level permits the scalar inertia character at Q. The source prints G_(F+,S) for its domain, despite giving a deformation datum with S∪Q immediately below; E36 records the correction to G_(F+,S∪Q), together with the same omitted union in the earlier definition of S_Q. The preceding two levels remain unramified at Q.

## Exact monodromy estimates

G38–G44 decompose the proof behind the family recurrence. G39 records the full increment bound, including u′-order p^i and denominator p^(1+(h−1)(i+1)). G40 distinguishes convergence in formal series from membership in every analytic chart. G41 retains the increasing order of left matrix factors and decreasing order of right factors in the Frobenius expansion. In G42 the exponent is **1+m(p^i−1)/(p−1)**; it must not be replaced by (m+1)(p^i−1)/(p−1).

For h≥2 and m≥2h−3, the tail valuations are bounded below by m+2−h and increase to infinity. Euler differentiation preserves the v-power bound. G44 then accounts separately for the loss from ordinary derivatives and the additional loss in dividing lower-triangular entries by v. This yields the integral bound m−2h+3 only after using O-flatness of the quotient by the true monodromy ideal. A zero exponent gives a tautological containment, not equality of ideals.

E37 records the missing j−1 embedding index in the uniqueness proof. Equation (7.3) and the recurrence already have the correct index. Simultaneous u′-divisibility across the cyclic tuple proves uniqueness with that correction.

## Projector correction discovered in the source audit

A30–A33 record the exact restriction that Thorne uses: first pass to the Hecke image on the auxiliary projector module, then assert unramified or selected scalar-inertia local conditions. Proposition 5.12 makes this image algebra an explicit hypothesis, and the proof of Theorem 6.8 constructs it before the deformation-ring map. The unrestricted full-Hecke statement in LLHLM23 Theorem A.4.1 is therefore not supplied by that reference. E38 records the missing justification and the corrected projected interface, without claiming a global counterexample.

The original-level comparison is the operator `pr` applied after inclusion. Its image need not be the raw included spherical line, and the displayed polynomial operator need not itself be idempotent. The spectral image is a direct summand, which is what the diamond freeness argument needs. Invariants use the inclusion map; coinvariants use trace. No division by the p-power order of the diamond group is permitted.

The CHT/EGH check supports this boundary: CHT Proposition3.4.4(8) also requires a selected generalized-eigenspace Y and concludes over its image algebra T(Y); its patching proof selects H_1,Q first. EGH Theorem7.2.1 supplies constituent representations and local compatibility, with only semisimplified compatibility at p. Exact integral descent, multiplier sign and monodromy suppliers remain named gaps. These references were read in the bounded passages recorded in the JSON, not in full.

## Regularity and shared ownership

Z63–Z66 expand the regular-local-domain proof through the maximal-ideal associated graded algebra. The generator map from the polynomial algebra is surjective. Any nonzero homogeneous relation lowers the growth of graded pieces, contradicting the Hilbert–Samuel dimension formula. Dimension zero is handled separately: the maximal ideal is generated by the empty tuple and is zero. Krull separation then supplies finite orders for nonzero elements, and nonzero initial forms show their product is nonzero. No additive map from the local ring to its associated graded ring is asserted.

The pinned Mathlib regular-local criterion and Krull separation are reused. The Hilbert–Samuel supplier chain remains explicit: reading the outer Stacks proofs does not establish every supporting atom. Z66 now has six API entries and four typed tests, including mixed characteristic, where a coefficient-field section need not exist. The source passages are [00NO](https://stacks.math.columbia.edu/tag/00NO), [00NP](https://stacks.math.columbia.edu/tag/00NP), [00KQ](https://stacks.math.columbia.edu/tag/00KQ), [00K3](https://stacks.math.columbia.edu/tag/00K3) and [00IP](https://stacks.math.columbia.edu/tag/00IP); retrieval hashes are in the JSON.

The current 593-item LLHLM20 extraction shares both existing candidate IDs with this paper. The ownership record keeps the all-rank common foundation before GL3 lattice applications and the exact weak-functor construction before domain-dependent minimality and detectability. Fine-grained supplier/request closure remains required. The refreshed input snapshot is `2d9f4680c097b558c3684dec993a71f78e7913ee` (758 guarded blobs). The intervening Liu/Venkatesh changes concern specialized level raising and derived Hecke actions and do not replace this classical projector interface.

## Evidence and diagnostics

The freshly downloaded 212-page published PDF has the same SHA-256 as the prior source record. The new readings are attributed in `source.continuationReadings`; no new complete reading of all 212 pages is asserted. The relevant passages were compared with arXiv v2, and dense monodromy formulas and Appendix A statements were checked on rendered published pages. Thorne's arXiv v1 supplies the exact polarized adequacy definition and prime-selection proof. Its Hodge convention is not silently imported into LLHLM23's opposite convention.

Independent finite diagnostics passed: 5,152 distinct-character configurations, 27,300 signed-digit separations, five zero-generic collision controls, all five projective lines in the F4 two-dimensional tame orbit example, 16 Frobenius-relation vectors, and 1,750 monodromy-tail parameter sets. The F4 example is simple even though its Frobenius swap is nonsemisimple in characteristic two. These calculations check formulas and hypotheses; they do not prove the analytic or Galois theorems.

The final structural pass checks all 480 items, exactly one route per missing item, all 456 inherited IDs, all 35 inherited finding IDs and the acyclic 240-edge recorded internal dependency graph. Appendix B source data is unchanged. Paper and three-file intake validation are run for this checkpoint. The literal itemwise API census finds 10 of 152 definitions/constructions with uses, API and at least three correctly typed tests; the other 142 have not met that complete itemwise form, even where inherited grouped plans exist. Source suppliers, remaining multipart statements and integral Appendix B certificates also still require work. The original checkpoint report below remains historical evidence rather than a claim that its missing work has disappeared.

The fresh finite diagnostics are reproducible with Python’s standard library:

```python
from itertools import permutations,combinations,product
from math import lcm
checks={}
# All-rank digit-separation examples, with cyclic permutations and nonconstant embeddings.
c=0
for p in [5,7,11,13]:
 for n in range(2,5):
  rows=[tuple(reversed(a)) for a in combinations(range(p-1),n) if all(a[j+1]-a[j]>=2 for j in range(n-1))]
  for row in rows:
   for perm in permutations(range(n)):
    cur=list(range(n));r=0
    while True:
     r+=1;cur=[perm[a] for a in cur]
     if cur==list(range(n)):break
    exponents=[]
    for i in range(n):
     a=i;v=0
     for j in range(r):v+=p**j*row[a];a=perm[a]
     exponents.append(v%(p**r-1))
    assert len(set(exponents))==n;c+=1
checks['distinct_character_configurations']=c
c=0
for p in [3,5,7,11,13]:
 for d in range(1,7):
  for ds in product([-(p-2),-1,1,p-2],repeat=d):
   v=sum(a*p**j for j,a in enumerate(ds));assert v%(p**d-1)!=0;c+=1
checks['signed_digit_separations']=c
# Boundary control: 0-deep endpoint collision.
for p in [3,5,7,11,13]:assert (p-1)%(p-1)==0
checks['zero_generic_collision_controls']=5
# F4 = F2[a]/(a^2+a+1): tame inertia diag(a,a^2), Frobenius swaps lines.
def mul(a,b):
 r=0
 for i in range(2):
  if (b>>i)&1:r^=a<<i
 if r&4:r^=7
 return r
vectors=list(product(range(4),repeat=2));nz=[v for v in vectors if v!=(0,0)]
def scale(a,v):return tuple(mul(a,x) for x in v)
def inert(v):return (mul(2,v[0]),mul(3,v[1]))
def frob(v):return (v[1],v[0])
lines={frozenset(scale(a,v) for a in range(4)) for v in nz};assert len(lines)==5
assert all(not(all(inert(v) in L for v in L) and all(frob(v) in L for v in L)) for L in lines)
for v in vectors:
 assert frob(inert(frob(v)))==inert(inert(v))
 # Frobenius is nonidentity with square identity in characteristic2, hence not semisimple.
 assert frob(frob(v))==v
assert frob((1,0))!=(1,0)
checks['f4_tame_orbit_lines']=len(lines);checks['f4_frobenius_relation_vectors']=len(vectors)
# Tail bounds used by G43, and derivative-loss endpoint G44.
c=0
for p in [3,5,7,11,13,17,19]:
 for h in range(2,12):
  for m in range(2*h-3,35):
   vals=[1+m*(p**i-1)//(p-1)-i*(h-1) for i in range(1,9)]
   assert vals[0]==m+2-h and all(a<=b for a,b in zip(vals,vals[1:]));c+=1
   for t in range(h-1):assert m-(h-1)-t>=m-2*h+3
checks['monodromy_tail_parameter_sets']=c
import json
print(json.dumps(checks,indent=2));open('paper-lllm-23/finite-diagnostics-results.json','w').write(json.dumps(checks,indent=2)+'\n')
```

---

# Local models for Galois deformation rings: affinoid product suppliers

Codex — codex-7e92bd, issue #1254, 23 September 2026. This continuation of merged #2259 has **456 items: 60 library, 8 planned, 388 missing, with 15 unchanged route identities and 35 unchanged, unreviewed source findings**. It adds eleven pinned imports L50–L60 and eighteen source/planning items Z45–Z62. All 427 inherited IDs remain; Z08, Z10, Z13 and Z14 have more precise statements, and Z09 has explicit supplier edges. The definition/construction census is now 150 (84 definitions, 66 constructions). Z08 and the new construction Z52 have itemwise APIs and typed tests; this does not close the other API deficits.

The extraction is **partial**. The main paper's full reading was already completed by this session. This continuation reads the bounded analytic suppliers needed in the final paragraph of Theorem 3.7.1, published PDF79–80; it does not claim that the remaining representation-theory sources, regularity suppliers or all paper-wide interfaces are finished. No Lean file was required or compiled, no adapter is claimed implemented, and no independent review of E1–E35 is supplied.

## Exact scope and sources

The analytic convention is now explicit: a complete **nontrivially valued** nonarchimedean field and **strict** affinoid algebras, presented as quotients of unit-radius Tate algebras. This includes the fraction field of every complete DVR used here, including imperfect equal-characteristic fields. Neither arbitrary Berkovich radii nor trivially valued analytic categories are silently included. Finite field extensions may be inseparable.

The source proofs inspected were:

- [Bosch, *Lectures on Formal and Rigid Geometry*, Münster notes](https://www.uni-muenster.de/IVV5WS/WebHop/user/weckerm/heft378.pdf), PDF12–17 and24, printed10–15 and22: §1.2 Lemma7, Theorem8, Corollaries9–11 and §1.4 Proposition2. SHA-256 `7cb79d83e0d78e8919aa4b7c29fbd6f88d3041344f62a1c38a3088ab113cb1e4`.
- [Conrad, *Several approaches to non-archimedean geometry*](https://math.stanford.edu/~conrad/papers/aws.pdf), PDF1,4–6,13,20,30–32: field conventions, Theorems1.1.5/1.2.6, Exercise2.2.3 and Example2.4.5, Exercises3.3.1/3.3.8 and the formal generic-fiber comparison. These exercises specify constructions; the concrete proofs used here are written below. SHA-256 `5add29094b74385746c4d977290b2308d02cbe8aa6f085e6a99724f6939e309b`.
- [BLGGT, *Potential automorphy and change of weight*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf), LemmaA.1.1, PDF96/printed596, reread after the earlier AppendixA.1 reading. SHA-256 `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`.
- Stacks [04KV](https://stacks.math.columbia.edu/tag/04KV) and the preceding descent proof in [0361](https://stacks.math.columbia.edu/tag/0361), [0AH2](https://stacks.math.columbia.edu/tag/0AH2), [07PX](https://stacks.math.columbia.edu/tag/07PX) and the finite-type stability reduction in [07GG](https://stacks.math.columbia.edu/tag/07GG), [031E](https://stacks.math.columbia.edu/tag/031E), and [00NP](https://stacks.math.columbia.edu/tag/00NP). The outer arguments were read; their deeper regularity suppliers remain named gaps.

The reviewed AUDIT-01 SF.0/SF.4 rows and AUDIT-17 R03.1 row were read, together with AdicSpacesPartII R0/F0/R1/R2 and the upstream AdicSpaces Layer0 description. There is no direct AdicSpacesPartII R0/F0 row in the current library-coverage map; the reviewed overlap rows therefore guide ownership, followed by fresh declaration reads. The R03.1 audit's historical negative claim about Noetherian completion is not itself treated as a theorem. The prior continuation's completion audit remains in force.

AdicSpacesPartII R0/F0 owns the analytic tensor, finite scalar/fiber comparisons and formal generic model. SchemeAndStackFoundations SF.0 owns the algebraic pointed-connectedness argument; SF.4 supplies the completion/regularity facts. Upstream AdicSpaces Layer0.5 already plans Weierstrass division, imported as planned Z49. Its restricted-series carrier is reused throughout. No new roadmap or second tensor/series carrier is proposed. The separate complete-local coefficient-category tensor Z24 remains with R03.1, and the previous ModularCurves §4D ownership is unchanged.

## Pinned suppliers

The following declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Thirteen inspected source files were byte-compared with the corresponding full-pin raw GitHub files; hashes, URLs and searches are recorded in `libraryAudit.analyticContinuation`.

| Item | Pinned declaration | Exact contribution |
| --- | --- | --- |
| L50 | `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective` | Invariant vectors equal the image of an invariant map whose scalar extension is surjective; no dimension bound on the representation. |
| L51 | `IsPurelyInseparable.pow_mem` | A power with exponent a power of the exponential characteristic is scalar. |
| L52 | `separableClosure.isPurelyInseparable` | An algebraic extension is purely inseparable above its relative separable closure. |
| L53 | `TauCeti.connectedSpace_primeSpectrum_of_injective` | Connectedness descends along an injective ring map. |
| L54 | `TauCeti.Huber.restrictedMvPowerSeriesBaseChangeEquiv` | Restricted series commute with finite-module base change over a complete Noetherian Tate ring, with the specified module topology. |
| L55 | `Module.Flat.instTensorProduct` | Tensor products of flat modules are flat. |
| L56 | `Module.Flat.trans` | Flatness in a compatible tower is transitive. |
| L57 | `Module.Flat.isSMulRegular_of_isRegular` | A regular scalar acts injectively on a flat module. |
| L58 | `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` | Connected locally Noetherian schemes with domain stalks are irreducible. |
| L59 | `TauCeti.Huber.iterateRingEquiv`, `continuous_iterateRingEquiv`, `continuous_iterateRingEquiv_symm` | Iteration of completed restricted series, including both continuous directions. |
| L60 | `Algebra.Smooth.baseChange` | Smoothness of ordinary algebraic base change. |

The current geometric-connectedness file supplies the scheme predicate and its stability, but not the pointed-connectedness theorem used here. The Tate strong-Noetherian predicate and some quotient/iteration results are present; its field case is not a license to call the whole strict-affinoid Nullstellensatz or product package implemented. L54 is a linear equivalence for finite modules: the algebra, quotient and topology identifications in Z53 still need an adapter. L58 does not prove that regular local rings are domains; that is the separate Z62 source input.

## Rational points and connectedness

The old Z10 statement was correct but stronger than necessary in its hypotheses. Normality is unnecessary. Z45–Z47 give a proof for every connected commutative K-algebra A with a retraction ε:A→K, before any analytic structure is considered.

For a finite Galois L/K, write D=L⊗_K A and let G act on L. L50 applied to a↦1⊗a identifies D^G with A: its scalar extension is the identity on L⊗A. If e²=e, the extended retraction sends e to 0 or 1. Replace e by 1−e to arrange ε_L(e)=1. Then

```text
N(e) = ∏_(σ∈G) σ(e)
```

is an invariant idempotent and has value 1 under the retraction. Connectedness of A forces N(e)=1. The identity automorphism is a factor, so eN(e)=N(e), whence e=1. This works even when the characteristic divides |G|; there is no averaging by that integer. Nontriviality comes from the retraction.

For a purely inseparable L/K, an idempotent in A⊗L uses finitely many coefficients of L. Choose one common exponent q^n taking them all into K. Frobenius and idempotence show e=e^(q^n) lies in the image of A. Scalar extension is injective and reflects idempotence, so it introduces no new idempotents. This argument even allows an infinite purely inseparable extension; the consumer needs only finite ones.

For arbitrary finite L/K, take its relative separable subfield E, use a finite Galois closure of E/K and L53 to descend connectedness to A⊗E, then apply the purely inseparable step to L/E. Z10 combines this algebraic result with the finite ordinary/completed comparison Z53.

The API tests now include a nonnormal positive example K[ε]/ε², the disconnected K×K, and a nontrivial finite separable field extension without a K-retraction. A point only over an extension field does not satisfy the theorem's rational-point hypothesis.

## Nullstellensatz and the two rational fibers

Z48 makes a nonzero restricted series distinguished by a triangular coordinate change. After dividing by a maximal-norm coefficient, its reduction is a polynomial. A sufficiently large base-t encoding separates all monomial exponents; the largest becomes the unique top power of the final variable. The substitutions with plus and minus signs are inverse contractions and hence isometries.

Z49 imports the existing Weierstrass division target. Normalize the distinguished coefficient, divide by the degree-s polynomial truncation, and iterate errors bounded by a fixed θ<1. One can take θ strictly positive even when the higher-degree tail is zero; approximate the input series to the corresponding precision. The quotient and remainder corrections converge. Reduction gives uniqueness and the norm identity. Thus T_n/(g) is finite free over T_(n−1), with the expected monomial basis. Induction on the kernel gives Z50, a finite injection T_d→A; it need not use the original coordinates.

Apply this to A/m. Since it is a field integral over T_d, T_d is a field, forcing d=0. This proves Z51 without using a dimension formula. A nonempty clopen is an idempotent factor and has a maximal ideal. Finitely many such residue fields embed in one finite compositum, including in the inseparable case, so their points can be made rational simultaneously.

Z52 is the already-planned completed tensor, presented as

```text
(K⟨X⟩/I) ⊗̂_K (K⟨Y⟩/J) = K⟨X,Y⟩/(I,J).
```

It has nine API entries and five typed tests in the JSON. Quotients use closed ideals with the Banach quotient topology. A finite K-basis of L identifies L-valued restricted coefficient families with finitely many K-valued ones. Passing to the affinoid quotients gives Z53 and the product comparison after finite extension. No claim about infinite analytic extension is needed.

For a K-rational maximal ideal m⊂A, quotienting Z52 gives Z54:

```text
(A ⊗̂_K B)/m = B,       (A ⊗̂_K B)/(m,n) = K
```

when n also comes from a rational point of B. The ideals displayed mean their extensions into the product. Their closedness is why these are actual quotient kernels.

To prove Z14, first make any proposed disconnected finite scalar extension a product over that extension by Z53. Choose a rational point in each clopen after a further common finite extension by Z51. Project the **first** point to A and the **second** to B. The first fiber is connected Spec B, contains the first point and lies in its clopen. The second fiber is connected Spec A and lies in the other clopen. Their simultaneous fiber is Spec K, contradicting disjointness. Keeping the two selected projections distinct is essential to this argument.

An ordinary tensor cannot replace the completed tensor: Σ_(n≥0) p^n x^n y^n lies in Q_p⟨x,y⟩. Its coefficient matrix has arbitrarily large nonzero diagonal minors, while a finite sum of separated tensors has finite matrix rank. The new API records this as a non-example.

## Integral completion and the regularity boundary

Use the actual finite-type chart models B_i over the complete DVR O and set P=⊗_O B_i. For finite polynomial presentations, exactness of completion identifies the π-adic completions with restricted-series quotients. Applying the presentations to all variables at once gives Z55. A restricted K-series has coefficients bounded below in valuation, so one common power of π clears their denominators. This identifies the localized restricted-series presentation with the affinoid one. It does **not** assert that localization commutes with arbitrary inverse limits.

If the B_i are flat, P is flat and Noetherian. Its π-adic completion C is P-flat by inherited L11, hence O-flat by L56. Multiplication by π is injective by L57, giving C↪C[1/π]. This is Z56. It avoids assuming that an ordinary tensor of completed rings is Noetherian.

The regularity of C[1/π] is a separate proof. The source's algebraic chart generic fibers are smooth by U23, so their algebraic product P[1/π] is smooth and regular. Z58 supplies the G-ring property of finite-type algebras over O; Z57 makes the completion map regular, and Z59 transfers regularity after inverting π. Together with Z55 this proves the required regularity of the analytic product, as recorded in Z60.

The **outer argument is now explicit**, but the entire supplier tree is not closed. Remaining exact audits include finite-type stability of G-rings and its characteristic-p formal fibers, faithful-flat descent for regular maps, completion Noetherianity in that proof, the flat local dimension formula, smooth-over-field regularity and the regular-local associated-graded polynomial theorem. The source proofs of 0AH2, 031E and 00NP were read; their deeper cited inputs must not be described as already audited. Z57 also does not assert that the completion of an arbitrary G-ring is a G-ring.

Z62 derives the domain property of a regular local ring by multiplying initial forms in its polynomial associated graded ring, using Krull separation to give every nonzero element finite order. It does not posit a ring embedding into the associated graded. Z61 then uses the pinned domain-stalk irreducibility theorem and reducedness to obtain the connected regular ring's domain property. Hence Z13 follows from connectedness (Z10/Z14), comparison (Z55), regularity (Z60/Z61) and integral injectivity (Z56).

Both qualifications matter. K×K is regular but disconnected. Dual numbers are connected but nonreduced. If K is an imperfect complete field of characteristic p and a∉K^p, L=K(u), u^p=a, is a regular field but L⊗_K L=L[δ]/δ^p is not regular. This is why regularity of arbitrary factors does not replace the actual smooth generic chart input.

## Validation and resume point

The fresh finite diagnostics enumerate 1,364 elements of F₄[ε]/ε^n for 1≤n≤5, recognize 62 invariant vectors under coefficientwise Galois conjugation and check the idempotent norm argument on all ten idempotents. The separable field F₄⊗_(F₂)F₄ has four idempotents, and F₄[δ]/δ² models the nilpotent algebra shape occurring after a purely inseparable self-tensor. Twelve exact diagonal determinant witnesses check the ordinary-tensor boundary; 6,561 finite polynomial evaluations check the two rational-fiber evaluations commute. These finite algebra examples do not certify analytic convergence, comparison theorems, G-ring results or Lean proofs. The code below uses only the Python standard library.

Fresh repository checks: `scripts/check_paper.py` on the extraction; `research/blueprint/intake.py check-files` on the three authorized deliverables; `git diff --check`; the paper/source-issue/intake/queue unit tests; and structural preservation, unique routing, typed-test and acyclic-dependency checks. Older Newton, smooth-locus and AppendixB experiments are inherited, not claimed rerun.

Resume with the named analytic regularity/topology suppliers above, then Z24's coefficient-category presentation/topology adapters and the exact remaining Jantzen/Herzig/Deligne–Lusztig, inertial K-type, Kisin monodromy and CHT/Thorne inputs. Finish the multipart census, monodromy/AppendixA hypotheses, itemwise APIs and at least three typed tests for every definition/construction, and integral AppendixB certificates. Keep status partial until these obligations are actually settled. E1–E35 still require independent completed review.

```python
"""Finite algebra diagnostics; these do not prove analytic comparison theorems."""
from itertools import product
import json

def fm(a,b):
    r=0
    while b:
        if b&1: r^=a
        b>>=1; a<<=1
        if a&4: a^=7  # F4=F2[t]/(t²+t+1)
    return r
def mul(a,b):
    c=[0]*len(a)
    for i,x in enumerate(a):
        for j,y in enumerate(b[:len(a)-i]): c[i+j]^=fm(x,y)
    return tuple(c)
def sigma(a): return tuple(fm(x,x) for x in a)
count=fixed=idem=0
for n in range(1,6):
    z=(0,)*n; one=(1,)+(0,)*(n-1)
    for a in product(range(4),repeat=n):
        count+=1
        invariant=sigma(a)==a
        assert invariant==all(x in (0,1) for x in a)
        fixed+=invariant
        if mul(a,a)!=a: continue
        idem+=1
        assert a in (z,one)
        e=a if a[0]==1 else tuple(x^y for x,y in zip(one,a))
        norm=mul(e,sigma(e))
        assert norm==one and mul(e,norm)==norm and e==one

# A connected finite separable field without a K-point splits.
# F4 ⊗ F2 F4 = F4[t]/(t²+t+1); an element is (a,b).
def extmul(x,y):
    a,b=x; c,d=y; bd=fm(b,d)
    return (fm(a,c)^bd, fm(a,d)^fm(b,c)^bd)
split_idem=[x for x in product(range(4),repeat=2) if extmul(x,x)==x]
assert len(split_idem)==4
assert [x for x in range(2) if (fm(x,x)^x^1)==0]==[]

# The inseparable tensor F4[δ]/δ² has nilpotents but no new idempotents.
dual_idem=[x for x in product(range(4),repeat=2) if mul(x,x)==x]
assert dual_idem==[(0,0),(1,0)] and mul((0,1),(0,1))==(0,0)

# Finite diagonal blocks of Σ 3^n x^n y^n have full rank, witnessed by determinant.
for n in range(1,13):
    diagonal=[3**i for i in range(n)]
    determinant=1
    for x in diagonal: determinant*=x
    assert determinant==3**(n*(n-1)//2) and determinant!=0

# Rational-fiber quotient kernel in a polynomial model, exact finite coefficient test.
# For every polynomial with 6 coefficients in F3, evaluating x=a then y=b equals
# evaluation at (a,b); this is the algebraic compatibility underlying the analytic API.
evaluations=0
for coeff in product(range(3),repeat=6):
    for a,b in product(range(3),repeat=2):
        direct=sum(coeff[i*3+j]*a**i*b**j for i in range(2) for j in range(3))%3
        first=[sum(coeff[i*3+j]*a**i for i in range(2))%3 for j in range(3)]
        assert direct==sum(first[j]*b**j for j in range(3))%3
        evaluations+=1
print(json.dumps(dict(galois_elements=count,invariant_vectors=fixed,idempotents=idem,
    split_field_idempotents=len(split_idem),inseparable_shape_idempotents=len(dual_idem),
    diagonal_rank_witnesses=12,rational_fiber_evaluations=evaluations,
    limitation='Finite algebra examples only; no analytic topology, G-ring theorem or formal proof certified.'),indent=2))
```

## Earlier checkpoint report (historical, preserved)

# Local models for Galois deformation rings: the uniform Jacobian power witness

Codex — codex-a71f92, issue #1254, 23 September 2026. Partial continuation of merged #2248: **427 items (49 library, 6 planned, 372 missing), 15 routes, 149 definitions/constructions (84 plus 65), and 35 unchanged, unreviewed source findings.** All 406 inherited statements are preserved. This checkpoint adds sixteen pinned imports L34–L49 and five proof adapters Z40–Z44; it refines only the inherited Z03/Z07 item objects. No Lean deliverable or compilation, formalization, or independent review is claimed.

The particular smooth-locus/radical supplier gap left by #2248 is now decomposed. This does not complete the paper extraction, the remaining analytic proof inputs, or the itemwise API census.

## Source boundaries and ownership

Freshly read [LLHLM23, Proposition 3.3.9](https://math.rice.edu/~bl70/LocModels.pdf), published PDF68–69, and [Elkik §0.2](https://numdam.org/item/10.24033/asens.1258.pdf), printed554–556/PDF3–5, including the standing Noetherian convention. The PDFs have SHA-256 respectively:

- LLHLM23: e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd.
- Elkik: 74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5.

The complete main-paper reading remains attributed to codex-7e92bd. This bounded continuation does not claim a new full reading. Elkik states his construction under a Noetherian convention. The finite-presentation argument below works over an arbitrary commutative coefficient ring and is supplied here explicitly; that greater generality is not falsely quoted as Elkik's statement.

The auxiliary public proofs read are [Stacks 031I](https://stacks.math.columbia.edu/tag/031I) (the split conormal criterion), [00TA](https://stacks.math.columbia.edu/tag/00TA) (local basis selection leading to standard smoothness), and [00T8](https://stacks.math.columbia.edu/tag/00T8) (adjoining an inverse to a minor). The missing adapter is not general smoothness theory: the pinned library already contains that. It is the precise connection to the fixed generators and conductor-weighted ideal in this application.

The full SchemeAndStackFoundations roadmap and its reviewed AUDIT-01 SF.0/SF.4 rows were read. All five missing adapters use the existing SF.4 route, and all fifteen route identities are unchanged. Searches of the packets, candidate roadmaps and integrated decompositions found related Elkik/Gabber–Ramero uses in PerfectoidSpaces and AdicEtaleGeometry. Those are finite-etale equivalence consumers with open proof inputs, not an already completed fixed-presentation Jacobian helper. This checkpoint does not duplicate or claim to prove those equivalences. The earlier ModularCurves §4D completion supplier is untouched.

Both pinned trees were searched for Elkik, Jacobian ideals, conductor/minor terminology and matrix suppliers. The actual positive declaration statements and their hypotheses were read. Fifteen cited Mathlib files were byte-compared against their raw GitHub contents at 082e2d37e8b0463410cdb532e111cd43d5a66174; their hashes and exact URLs are in libraryAudit.smoothLocusContinuation. No whole package is marked built merely from a name search.

## Already implemented suppliers

| Item | Exact pinned declaration | Use |
| --- | --- | --- |
| L34 | `Algebra.Extension.formallySmooth_iff_split_injection` | Formal smoothness as a split conormal injection. |
| L35 | `Module.exists_basis_of_span_of_flat` | A spanning family of a finitely presented flat local module contains a basis. |
| L36 | `Submodule.le_of_le_smul_of_le_jacobson_bot` | Nakayama removes the conormal-square error. |
| L37 | `IsLocalization.algebraMap_mem_map_algebraMap_iff` | Clear one ideal-membership denominator in a localization. |
| L38 | `Algebra.SubmersivePresentation.isStandardSmooth` | A finite submersive presentation is standard smooth. |
| L39 | `Algebra.basicOpen_subset_smoothLocus_iff_smooth` | Smoothness on a basic open. |
| L40 | `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff` | Containment of zero loci is containment in a radical. |
| L41 | `Ideal.mem_radical_iff` | Radical membership is membership of some natural power. |
| L42 | `Algebra.FormallySmooth.of_isLocalization` | Localizations are formally smooth. |
| L43 | `Matrix.isUnit_det_of_left_inverse` | A square matrix with a left inverse has unit determinant. |
| L44 | `KaehlerDifferential.mvPolynomialBasis_repr_apply` | Polynomial differential coordinates are partial derivatives. |
| L45 | `KaehlerDifferential.isLocalizedModule_map` | Differentials localize with the algebra. |
| L46 | `Module.Projective.of_split` | A retract of a projective module is projective. |
| L47 | `Module.finitePresentation_of_projective` | Finite projective modules are finitely presented. |
| L48 | `Algebra.Smooth.of_isLocalization_Away` | Localization at one element is smooth. |
| L49 | `Algebra.Smooth.comp` | Smooth ring maps compose. |

L38 also records, without inventing a declaration name, the existing anonymous standard-smooth-to-smooth instance in Smooth/StandardSmoothCotangent.lean:343. The distinctions matter: IsSmoothAt is formal smoothness of the prime localization; L35 needs finite presentation of the module, not just finite generation; prime localizations need not be finitely presented as algebras. L46/L47 and L42 explicitly discharge those respective requirements.

## Fixed-presentation adapters

Throughout, the variables and original list of equations are finite, P=A[X_1,…,X_N], J=(f_1,…,f_q), B=P/J, and H is the full Z03 ideal. Empty minors have determinant one and contribute Ann(J).

### Z40: Finite local generation yields a global conductor witness

Let P be a commutative ring, Q a prime, F⊂J ideals with J generated by f_1,…,f_q. If F P_Q=J P_Q, there is k∉Q with kJ⊂F.

Suppliers: L37.

1. For each generator f_i, L37 gives s_i∉Q such that s_i f_i∈F. Set k=∏_i s_i. The prime complement is multiplicatively closed, so k∉Q.

2. For each i, k f_i is a multiple of s_i f_i and belongs to F. Finite linear combinations prove kJ⊂F. If q=0, take the empty product k=1.

3. No finite generation of F, conductor ideals, or the coefficient ring is assumed; finite generation of J is the indispensable finite-denominator step.

Acceptance checks:

- For P=k[X], J=(X), F=(X(X−1)), Q=(X), k=X−1 works although F≠J globally.
- If J=0, k=1 works. Do not replace equality after localization by global ideal equality.


### Z41: Smoothness selects original equations and a Jacobian minor

Let A be a commutative ring, P=A[X_1,…,X_N], J=(f_1,…,f_q), B=P/J, p∈Spec B and Q its inverse-image prime in P. If B is smooth at p, there are subsets α⊂{1,…,q}, β⊂{1,…,N} of equal size such that J P_Q=F_α P_Q and δ=det(∂_(β_j) f_(α_i)) does not belong to Q.

Suppliers: L34, L35, L36, L42, L43, L44, L45, L46, L47.

1. The map P_Q→B_p is surjective with kernel J P_Q. By L42 the ambient localized polynomial algebra is formally smooth over A, and smoothness at p means that B_p is formally smooth. L34 splits the conormal injection C=(J P_Q)/(J P_Q)^2→B_p^N. L44/L45 identify its coordinates with the localized fixed partial derivatives.

2. C is generated by the classes of the original f_i. L46 makes it projective as a summand of B_p^N; L47 makes it finitely presented. Apply L35 over the local ring B_p to select a basis from those classes. Basis injectivity gives distinct original equation indices, defining α; its finite cardinal c is at most N.

3. With this basis, the conormal map is the transpose of the c×N selected-row Jacobian D and has a left inverse. Transpose the splitting to see that D:B_p^N→B_p^c is surjective. Its N columns span the finite free local module B_p^c. L35 selects a basis from these columns; basis cardinality gives exactly c distinct indices β. The corresponding square minor has an inverse basis matrix, so L43 makes its determinant a unit in B_p. Therefore the original δ is outside Q.

4. The conormal spanning equality implies J P_Q=F_α P_Q+(J P_Q)^2. The ideal J P_Q is finite and lies in the maximal ideal of P_Q. Apply L36 to remove its square, obtaining J P_Q=F_α P_Q.

5. This also treats c=0: the conormal module is zero, Nakayama gives J P_Q=0, and the empty minor is 1. Only J is finitely generated; A is not assumed Noetherian.

Acceptance checks:

- Duplicated equations (X,X) require a one-row subset; the full two-row minor in one variable is zero.
- For B=F_p[X]/(X^p), Ω_(B/F_p) is free but the conormal map is not injective. Freeness of Ω alone cannot replace smoothness.
- The original generator list is retained throughout; a standard-smooth neighborhood in some unrelated presentation does not itself give the required conductor witness.


### Z42: A conductor-weighted minor gives a standard-smooth open

In Z03 let α,β have equal size, δ the corresponding minor and k∈(F_α:J). Put h=kδ. Then B[1/h] is a standard-smooth A-algebra and hence smooth; the case of the zero localization is allowed.

Suppliers: Z03, L38, L24.

1. Since h is inverted, both k and δ become units. The conductor identity kJ⊂F_α gives J P[1/h]=F_α P[1/h]. Thus B[1/h]≅A[X_1,…,X_N,U]/(f_α,U h−1).

2. Use the selected variable columns β and the additional U column. The Jacobian block matrix has top-right block zero, upper-left block D_(α,β), and bottom-right entry h. Its determinant is δ h, which is a unit in the quotient because h=kδ is a unit.

3. Reindex these distinct columns to obtain a finite SubmersivePresentation; apply L38 and the imported standard-smooth-to-smooth instance. This is the explicit inverse-coordinate argument of Stacks 00T8, with h=kδ rather than just δ.

4. For α empty, kJ=0 and δ=1. The quotient after inverting k is the polynomial algebra localized at k, presented using U k−1 with derivative k in the U column. No nonempty-minor exception is needed.

Acceptance checks:

- A single derivative cannot certify smoothness unless the selected equations generate the localized ideal; k records precisely that condition.
- The empty minor recovers the polynomial zero-ideal case. An identically zero h defines the empty open and causes no contradiction.


### Z43: The full Elkik ideal defines exactly the nonsmooth locus

For the finite polynomial presentation and full ideal H of Z03 over any commutative A, a prime p of B=P/J is a smooth point over A if and only if the image of H is not contained in p. Equivalently the smooth locus is Spec B minus V(H B).

Suppliers: Z03, Z40, Z41, Z42, L39.

1. At a smooth prime apply Z41, then Z40, to get α,β, δ∉Q and k∉Q with kJ⊂F_α. The product kδ lies in H and outside Q. Hence H B is not contained in p.

2. Conversely, if H is not contained in Q, not every generating conductor-weighted minor kδ can belong to Q: otherwise their finite sums and multiples would put all H in Q. Choose one outside Q. Z42 makes its basic open smooth and this open contains p.

3. Only the full sum H gives equality. For any selected H_B⊂H, its basic-open union is contained in the smooth locus, but its vanishing locus may strictly contain the nonsmooth locus.

Acceptance checks:

- For J=0, H=1 and every prime is smooth, including a non-Noetherian coefficient ring.
- For J=(2) over Z, the full H=0 and no prime of B=F_2[X] is smooth over Z, although the new presentation after base change to F_2 is polynomial and smooth.
- A smaller ideal (p)⊂H=1 for the presentation Z_p[X]/(X) does not define the nonsmooth locus.


### Z44: Generic smoothness gives one universal power identity

For a finite presentation B=P/J over a commutative ring S, v∈S, and the full H of Z03, if B[1/v] is smooth over S[1/v], then there is r≥0 with v^r∈H+J in P. In particular there are h∈H and polynomial coefficients b_i with v^r=h+Σ_i b_i f_i. The choice is made before any coefficient base change.

Suppliers: Z43, L39, L40, L41, L48, L49.

1. L48 makes S[1/v] smooth over S. Compose with the given S[1/v]-smooth structure on B[1/v] using L49. This explicit change of base-ring viewpoint is needed before applying the S-relative L39.

2. L39 gives D(v)⊂smoothLocus_S(B). Z43 then yields V(H B)⊂V(v) in Spec B. Under prime correspondence for B=P/J, this is V(H+J)⊂V(v) in Spec P.

3. Use L40 with K=(v) to get v∈radical(H+J); L41 provides one natural exponent r. Unfold membership in the ideal sum and the finitely generated ideal J to record v^r=h+Σ_i b_i f_i.

4. No Noetherianity, finite generation of H, algebraic-closure hypothesis, or nonzerodivisor condition on v enters this step. The finite identity, not a choice made separately on each fiber, is transported by Z39/Z07.

Acceptance checks:

- If H+J=1, r=0 is allowed. If v is nilpotent and the generic fiber is empty, a sufficiently large positive exponent still works.
- The family S=k[t], J=(t^e X) has H=(t^e), so its least exponent is e. Uniformity means fixed presentation, not a single bound for all presentations.
- The power identity only implies t^r∈H_B(a)+(t^m) at an approximate zero; Z07 still needs completeness and m>r to remove the error term.

## Evaluation and the quantified uniformity in Z07

The polynomial identity is chosen on the universal chart, not on each test ring:

$$v^r=h+\sum_i b_i f_i,\qquad h\in H.$$

After S→A, v↦t, take H_B to be the coefficient image of that full universal H. Z39 supplies admissibility, only an inclusion in the new full ideal. If the equations vanish at a modulo t^m, evaluation gives

$$t^r=h(a)+t^m b,\qquad h(a)=t^r(1-t^{m-r}b).$$

For m>r in a complete separated (t)-adic ring, L29 puts (t) in its Jacobson radical and L30 makes the parenthesis a unit. Multiplying by its inverse proves t^r∈H_B(a). No cancellation of t^r is involved here; this step does not need t-torsionfreeness or Noetherianity of the test ring. Torsionfreeness is used later in the Newton correction Z33. Combining with Z06 gives the fixed choice N=2r+1 and congruence precision m−r.

These are three distinct claims: existence of one universal polynomial certificate; admissibility after coefficient base change; and removal of the higher-order evaluated error. Equality of Jacobian ideals after arbitrary base change is still false. A smaller admissible ideal cannot replace the full H in the generic-smoothness-to-power step without a separate power-membership hypothesis.

Z03 now has nine typed tests, including a nontrivial conductor denominator, purely inseparable differentials, and the strict threshold m>r. For the latter, S=Z[1/2,t] and f=X²−t² have full H=(2X) and t²=(X/2)(2X)−f. At t=3 and a=0 in the complete ring Z/81Z, the error is divisible by t² but t² is nonzero and H(a)=0. Thus m=r=2 does not justify removing the error. This is a boundary check of the evaluation step, which does not assume t regular.

## Validation and reproducible finite diagnostics

The new Python diagnostics use only the standard library. They check 16,418 two-equation univariate presentations over F_2,F_3,F_5 and 3,400 rational points; three nontrivial conductor identities; 793 rectangular rank/minor comparisons; 1,322 evaluated power witnesses over finite complete rings; six inseparability/strict-threshold controls; and twelve minimal-exponent families. In the univariate principal ideal domain, J=(g), the singleton-row conductor is (f_i/g), so the program computes H independently from the derivative of g used for the smoothness comparison. Rational-point enumeration is not a test of every closed or generic point, and these finite checks do not prove the general theorem. The twelve exponent cases are simple monomial regressions, not a symbolic ideal computation.

The structural check preserves all 406 inherited statements, all 35 source findings and all fifteen route identities. Only Z03/Z07 are refined among the inherited item objects. Every missing item is routed once; the recorded internal dependency graph is acyclic. No new definition or construction is introduced. The global itemwise API/construction deficits remain explicit; passing a validator does not remove them.

Final validator and repository-test results are recorded in the current handoff and validation.smoothLocusContinuation. Earlier CAS/SymPy computations remain historical evidence and were not rerun.

```python
"""Finite diagnostics only, not a proof of the general smooth-locus theorem."""
from itertools import product
from math import gcd
import json

def trim(f, p):
    f = [a % p for a in f]
    while f and f[-1] == 0:
        f.pop()
    return tuple(f)

def divrem(f, g, p):
    assert g
    f = list(trim(f, p))
    out = [0] * max(0, len(f) - len(g) + 1)
    while f and len(f) >= len(g):
        j = len(f) - len(g)
        c = f[-1] * pow(g[-1], -1, p) % p
        out[j] = c
        for i, b in enumerate(g):
            f[i+j] = (f[i+j] - c*b) % p
        f = list(trim(f, p))
    return trim(out, p), tuple(f)

def pgcd(f, g, p):
    while g:
        f, g = g, divrem(f, g, p)[1]
    return trim([a * pow(f[-1], -1, p) for a in f], p) if f else ()

def deriv(f, p):
    return trim([i*f[i] for i in range(1, len(f))], p)

def mul(f, g, p):
    if not f or not g:
        return ()
    out = [0] * (len(f) + len(g) - 1)
    for i, a in enumerate(f):
        for j, b in enumerate(g):
            out[i+j] += a*b
    return trim(out, p)

def ev(f, a, p):
    out = 0
    for c in reversed(f):
        out = (out*a + c) % p
    return out

counts = dict(presentations=0, rationalPoints=0, nontrivialConductor=0,
              evaluatedPowerWitnesses=0, boundaryControls=0,
              minimalUniversalExponents=0, rectangularMinorChecks=0)
for p in (2, 3, 5):
    polys = [trim(f, p) for f in product(range(p), repeat=3)]
    for f1, f2 in product(polys, repeat=2):
        g = pgcd(f1, f2, p)
        # In F_p[X], J=(g). For a singleton row,
        # (f_i:J)=(f_i/g) if J != 0. Empty rows contribute Ann(J).
        H = (1,) if not g else ()
        if g:
            for f in (f1, f2):
                k, rem = divrem(f, g, p)
                assert not rem
                H = pgcd(H, mul(k, deriv(f, p), p), p)
        counts["presentations"] += 1
        for a in range(p):
            if ev(g, a, p):
                continue
            expected_smooth = not g or ev(deriv(g, p), a, p) != 0
            assert (ev(H, a, p) != 0) == expected_smooth
            counts["rationalPoints"] += 1
    # A nontrivial conductor is necessary to use f1=X(X-1) locally.
    f1, f2, k = trim((0, -1, 1), p), (0, 0, 1), trim((-1, 1), p)
    assert mul(k, f2, p) == mul((0, 1), f1, p)
    assert ev(mul(k, deriv(f1, p), p), 0, p) != 0
    counts["nontrivialConductor"] += 1
    # Purely inseparable example: the conormal differential is zero.
    assert deriv((0,)*p+(1,), p) == ()
    counts["boundaryControls"] += 1

# Split-map selection: a 2x3 matrix has rank 2 iff a 2x2 minor is nonzero.
# Independent rank computation is Gaussian elimination over F_p.
def rank(rows, p):
    rows = [list(r) for r in rows]
    r = 0
    for c in range(len(rows[0])):
        pivot = next((i for i in range(r, len(rows)) if rows[i][c] % p), None)
        if pivot is None:
            continue
        rows[r], rows[pivot] = rows[pivot], rows[r]
        scale = pow(rows[r][c] % p, -1, p)
        rows[r] = [(x*scale) % p for x in rows[r]]
        for i in range(len(rows)):
            if i != r:
                factor = rows[i][c]
                rows[i] = [(x-factor*y) % p for x, y in zip(rows[i], rows[r])]
        r += 1
        if r == len(rows):
            break
    return r

for p in (2, 3):
    for values in product(range(p), repeat=6):
        rows = (values[:3], values[3:])
        minors = [rows[0][i]*rows[1][j]-rows[0][j]*rows[1][i]
                  for i, j in ((0, 1), (0, 2), (1, 2))]
        assert (rank(rows, p) == 2) == any(x % p for x in minors)
        counts["rectangularMinorChecks"] += 1

# The universal full-H certificate for f=X^2-t^2 is
# t^2 = (X/2)(2X) - f. Test only m>r=2, in complete finite rings.
for p in (3, 5, 7):
    for length in (4, 5):
        modulus = p**length
        for m in range(3, length):
            for a in range(modulus):
                if (a*a-p*p) % p**m:
                    continue
                b = (p*p-a*a) // p**m
                unit = (1-p**(m-2)*b) % modulus
                assert gcd(unit, modulus) == 1
                assert (p*p*unit-a*a) % modulus == 0
                assert p*p % gcd(2*a, modulus) == 0
                counts["evaluatedPowerWitnesses"] += 1
    # Boundary m=r=2: a=0 is approximate but H(a)=0 and t^2!=0.
    assert (-p*p) % p**2 == 0
    assert p*p % p**4 != 0
    counts["boundaryControls"] += 1

# For J=(t^e X), H+J=(t^e); powers t^r belong exactly for r>=e.
# Check the monomial exponent criterion without treating this finite test as a proof.
for e in range(1, 13):
    admissible = [r for r in range(25) if r >= e]
    assert min(admissible) == e
    counts["minimalUniversalExponents"] += 1

print(json.dumps(counts, sort_keys=True))
```

## Earlier checkpoint report (historical, preserved)

# Local models for Galois deformation rings: quantitative Newton lifting

Codex — codex-hjdg0j, issue #1254, 23 September 2026. **Partial checkpoint:** 406 items, comprising 33 library imports, 6 planned items and 367 missing items; 15 routes; 149 definitions/constructions; 35 unchanged, unreviewed source findings. All 386 inherited item statements are retained. This continuation adds ten library atoms and ten proof adapters, and repairs the itemwise API/tests of Z03. No Lean file was required or compiled, and no formalization or independent review is claimed.

The finite correction and its convergence are now decomposed at the level needed to support Z06. In a complete, separated, parameter-torsionfree ring, an error modulo t^m and a Jacobian-ideal witness t^r produce an exact solution agreeing modulo t^(m−r), provided m>2r. The proof uses a finite polynomial calculation followed by congruence limits. It does not require Noetherianity of the test ring. Z05 retains the original Noetherian statement with an arbitrary auxiliary ideal; this continuation does not extend that statement to arbitrary non-Noetherian ideals.

## Source and ownership checks

Freshly reread [LLHLM23, Proposition 3.3.9](https://math.rice.edu/~bl70/LocModels.pdf), published PDF68–69, and [Elkik, §0.2 and Lemma 1](https://numdam.org/item/10.24033/asens.1258.pdf), printed555–558/PDF4–7, including the whole finite adjugate calculation. Elkik's standing Noetherian convention on printed554 was read in the previous continuation. The downloaded PDF hashes are unchanged:

- LLHLM23: `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`.
- Elkik: `74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5`.

The full 212-page LLHLM23 reading remains attributed to the inherited worker. This bounded continuation does not claim another full-paper read. The auxiliary statements below make explicit arguments in and around Elkik's proof; they are not falsely presented as separately numbered theorems of Elkik.

The full SchemeAndStackFoundations roadmap and its reviewed AUDIT-01 SF.4 row were read. SF.4 remains the sole owner of the general quantitative lifting additions. The existing upstream AdicSpaces completeness conventions and ModularCurves §4D completion interface were checked; their contents are not replanned. All fifteen route identities are preserved.

The exact pinned declaration statements and hypotheses for L24–L33 were read. In particular, the reviewed audit correctly points to `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`. Its hypothesis is formal smoothness over the whole base; smoothness only after inverting t does not supply that hypothesis. The quantitative correction is therefore still needed. Tau Ceti's principal-unit root theorem was also read: it assumes an invertible root degree and does not solve these general polynomial systems. The JSON records the library file hashes and exact pinned public links.

## Existing library atoms

| Item | Pinned Mathlib declaration | Role in the proof |
| --- | --- | --- |
| L24 | `MvPolynomial.pderiv_mul` | Differentiate conductor relations. |
| L25 | `MvPolynomial.pderiv_monomial` | Identify first-order monomial coefficients without factorial denominators. |
| L26 | `Matrix.mul_adjugate` | Multiply a selected minor by its adjugate, without inverting its determinant. |
| L27 | `IsPrecomplete.prec` | Produce coordinatewise limits with explicit congruences. |
| L28 | `IsHausdorff.haus` | Turn vanishing modulo every ideal power into equality. |
| L29 | `IsAdicComplete.le_jacobson_bot` | Put the adic ideal in the Jacobson radical. |
| L30 | `Ideal.isUnit_of_sub_one_mem_jacobson_bot` | Invert the unit that corrects a perturbed witness. |
| L31 | `MvPolynomial.pderiv_map` | Transport Jacobian entries under coefficient maps. |
| L32 | `IsAdic.isAdicComplete_iff` | Translate complete separated adic topology to IsAdicComplete. |
| L33 | `IsLeftRegular.pow` | Cancel the chosen power of a regular parameter. |

## Declaration-sized proof adapters

All rings in the following polynomial calculations are commutative. The tuples have finitely many coordinates. Matrix rows index equations and columns index variables. The selected minor uses equally many distinct rows and columns; its determinant need not be invertible.

### Z30: First-order polynomial expansion modulo the square of an ideal

Let A be a commutative ring, L an ideal, f∈A[X_1,…,X_N], a∈A^N and y∈L^N. Then f(a−y)−f(a)+Σ_i (∂_i f)(a)y_i belongs to L². In particular, y∈(t^s A)^N gives a remainder in t^(2s)A. There is no division by factorials.

Prerequisites: L24, L25.

1. Prove the assertion by polynomial induction. Constants and variables have zero remainder; it is additive in f.
2. For a product fg, multiply the two first-order expansions. Every discarded product contains at least two coordinates of y or a previous L² remainder; all discarded terms lie in L². L24 identifies the linear coefficient. Alternatively expand each monomial using L25.
3. For L=(t^s), L²=(t^(2s)) by multiplying generators. This holds over rings with zero divisors and in characteristic two.

Acceptance checks: For f=X², the remainder is y² even in characteristic two, when the first derivative vanishes. For f=XY and y=(u,v), the remainder is uv. Linear polynomials have zero remainder.

### Z31: Differentiated conductor relations

Let f=(f_1,…,f_q) over a commutative ring A, choose a subset α of p equations, and suppose k f_l=Σ_i c_li f_{α_i} as polynomial identities for all l. Put D_li=∂_i f_l and D_α for its selected rows. The entries of kD−C D_α belong to J=(f_1,…,f_q). Thus if all f_l(a)∈L, then k(a)D(a)−C(a)D_α(a) has entries in L.

Prerequisites: L24.

1. Differentiate each conductor identity: k∂_j f_l−Σ_i c_li∂_j f_{α_i}=Σ_i(∂_j c_li)f_{α_i}−(∂_j k)f_l.
2. Evaluate this exact polynomial identity at a. Each term on the right lies in L. For selected rows choose c_li=k times the corresponding Kronecker delta, so the same formula applies to every row.

Acceptance checks: The derivatives of k and C cannot be deleted as polynomial identities; they disappear only modulo the equation ideal. For f=(X²,X³), α=(X³), k=X and C=(1,X), the first-row discrepancy is −X².

### Z32: Conductor-weighted minor gives a Jacobian image modulo squared error

In Z31, choose p distinct columns β and put M=D_{α,β}(a), δ=det M. Suppose f_l(a)∈L for every l. Define z supported on β by z_β=k(a) adj(M) f_α(a), with all other coordinates zero. Then z∈L^N and k(a)δ f(a)−D(a)z∈(L²)^q. For p=0 use det(0×0)=1, kJ=0 and z=0; the same conclusion holds.

Prerequisites: Z31, L26.

1. All coordinates of z lie in L because f_α(a) does. Multiply the discrepancy in Z31 by the vector supported on β with entries adj(M)f_α(a); both factors lie entrywise in L, so the error lies in L².
2. Use M adj(M)=δ·1 to obtain D(a)z≡δ C(a)f_α(a) modulo L².
3. The undifferentiated conductor identities give C(a)f_α(a)=k(a)f(a) exactly. This proves the claimed congruence, including all unselected equation rows.
4. In the empty-row case the conductor annihilates every equation and no matrix calculation is needed.

Acceptance checks: No determinant is inverted. Singular matrices and p=0 are allowed. With f=(X²,X³), α=(X³), k=X, β=(X), z=a^4 and k(a)δ f(a)−D(a)z=(a^5,0). This lies in (a²,a³)². Omitting the factor k from z fails this identity.

### Z33: Jacobian power witness yields a linear correction with controlled precision

Let A be a commutative ring in which multiplication by t is injective. With J,H_B as in Z03, suppose J(a)⊂t^m A, t^r∈H_B(a) and m≥r. Then there exists y∈(t^(m−r)A)^N such that f(a)−D(a)y∈(t^(2m−r)A)^q.

Prerequisites: Z03, Z32, L33.

1. Because H_B⊂H and membership in an ideal sum/product has finite witnesses, write t^r as a finite A-linear combination of evaluated conductor-weighted minors. Apply Z32 with L=(t^m) to each summand and add: t^r f(a)−D(a)z∈(t^(2m)A)^q with z∈(t^m A)^N.
2. Write z_i=t^m b_i and set y_i=t^(m−r)b_i. Then z=t^r y. For each equation write t^r(f_l(a)−(Dy)_l)=t^(2m)c_l.
3. Since 2m≥r, the right side equals t^r t^(2m−r)c_l. Cancel t^r using L33. No completion, Noetherianity, or invertibility of a minor enters this step.

Acceptance checks: For f=t^r X−t^m at a=0 the correction y=−t^(m−r) solves the equation exactly. Cancellation is invalid with t-torsion: in Z/8Z, 2·4=0 although 4≠0.

### Z34: Polynomial evaluation preserves congruences of tuples

For a commutative ring A, an ideal L and a,b∈A^N with b_i−a_i∈L for all i, every polynomial f satisfies f(b)−f(a)∈L. Hence for any polynomial ideal H, H(a)+L=H(b)+L, where H(a) is its image ideal under evaluation.

Prerequisites: Z30.

1. Apply Z30 with y=a−b; each linear term lies in L and the remainder lies in L²⊂L.
2. Every element of H(a) is the evaluation of a single member of H, since evaluation A[X]→A is surjective on constants: lift coefficients in any finite ideal expression. The congruence gives both inclusions after adding L.

Acceptance checks: For f=X² and b=a+u with u∈L the difference 2au+u² lies in L, including characteristic two. Congruence modulo L asserts equality after adding L, not equality of the evaluated ideals themselves.

### Z35: Persistence of an evaluated ideal power witness

Let A be a commutative (t)-adically complete and separated ring, H⊂A[X_1,…,X_N] any ideal, t^r∈H(a), and b−a∈(t^s A)^N with s>r. Then t^r∈H(b). No torsionfreeness or finite generation of H is needed.

Prerequisites: Z34, L29, L30.

1. Lift the evaluated-ideal membership to h∈H with h(a)=t^r. Z34 gives h(b)=t^r+t^s c=t^r(1+t^(s−r)c).
2. The factor u=1+t^(s−r)c has u−1∈(t), because s−r≥1. L29 and L30 show it is a unit. Multiplication by u inverse gives t^r∈H(b).
3. The strict inequality is essential; no cancellation of t^r is used in the argument.

Acceptance checks: Over Z_p, H=(X), a=p^r and b=0 satisfy b−a∈p^r Z_p but p^r∉H(b); equality s=r is insufficient. For r=0 any change in tA preserves a unit ideal witness.

### Z36: A Newton sequence with a persistent witness and explicit error orders

Under the hypotheses of Z06 with initial tuple a_0 and m_0>2r, there exists a sequence a_j with m_j=2r+2^j(m_0−2r), f(a_j)∈(t^m_j A)^q, t^r∈H_B(a_j), and a_(j+1)−a_j∈(t^(m_j−r)A)^N for every j. No canonical choice or uniqueness of this sequence is asserted.

Prerequisites: Z04, Z35.

1. Given a_j, use Z04 to choose y_j and put a_(j+1)=a_j−y_j. The next residual order is 2m_j−2r.
2. Since m_j−r>r, Z35 preserves the witness. Induction therefore applies at every stage.
3. Solve the recurrence by m_j−2r=2^j(m_0−2r). With c=m_0−2r≥1, the correction orders e_j=r+2^j c are strictly increasing and satisfy e_j≥j. These inequalities supply the input to Z37.

Acceptance checks: At the minimum threshold m_0=2r+1, the orders are m_j=2r+2^j and e_j=r+2^j. The theorem gives existence, not a functorial Newton operator for a presentation with several possible witnesses.

### Z37: Adic limits retain the full tail precision

Let A be a commutative ring with IsAdicComplete I A. Let e_j be a strictly increasing sequence of natural numbers, and let a_j∈A^N satisfy a_(j+1)−a_j∈(I^e_j)^N. There is a unique a_∞ such that a_∞−a_j∈(I^e_j)^N for every j.

Prerequisites: L27, L28.

1. For k≥j, telescoping the finite sum of increments gives a_k−a_j∈(I^e_j)^N. Strict increase implies e_j≥j, so this is a sequence to which L27 applies coordinatewise, giving a candidate limit modulo I^j.
2. Fix j and take k≥max(j,e_j). The candidate limit differs from a_k by an element of I^k⊂I^e_j; combine with the telescoping congruence to recover the stronger I^e_j precision.
3. Any two such limits differ by an element of every I^n: choose j≥n and use e_j≥j. L28 gives equality. This proves the congruences without requiring closure of arbitrary ideals.

Acceptance checks: For a_j=Σ_(i<j) t^(2^i) in A=k[[t]], e_j=2^j, the limit has exactly the claimed tail congruences. Uniqueness here is for the limit of a chosen sequence; it is not uniqueness of the solution of f=0.

### Z38: Polynomial equations vanish at a cofinal congruence limit

Let A be a commutative ring with IsHausdorff I A, e_j a strictly increasing sequence, and a_j,a_∞∈A^N with a_∞−a_j∈(I^e_j)^N. If f_l(a_j)∈I^m_j for all l,j and m_j≥e_j, then every f_l(a_∞)=0.

Prerequisites: Z34, L28.

1. Z34 implies f_l(a_∞)−f_l(a_j)∈I^e_j. The residual hypothesis and m_j≥e_j put f_l(a_∞) itself in I^e_j.
2. Strict increase gives e_j≥j, hence membership in I^n for every n. Apply L28 to each polynomial value.
3. For Z36, I=(t), e_j=m_j−r, and m_j≥e_j. Z37 supplies exactly the required limit congruences.

Acceptance checks: When I=0, the congruence sequence is constant after the first positive order and the assertion reduces to f(a)=0. Separatedness is essential: for I=A on a nonzero ring, every residual lies in every I^n but need not vanish.

### Z39: Admissible Elkik ideals survive coefficient base change

For a map A→A′ of commutative rings, fix f_1,…,f_q∈A[X_1,…,X_N] and their coefficient images f′. If H_B⊂Σ_α ((f_α):J)Δ_α, then the ideal generated by its image in A′[X] is contained in Σ_α ((f′_α):J′)Δ′_α. This is an inclusion, with no flatness assumption.

Prerequisites: Z03, L31.

1. Map each finite conductor identity k f_l=Σ c_li f_{α_i}; it proves that the image of k is in the new conductor. This does not give the reverse inclusion.
2. L31 identifies the images of Jacobian entries. The determinant is a finite signed sum of products, so each minor maps to the corresponding new minor.
3. Map the ideal sum/products and combine the inclusions. Empty minors map to 1 and annihilator conductors still map into annihilator conductors.

Acceptance checks: For A=Z, J=(2)⊂Z[X], H=Ann(2)+(∂2)=(0). After base change to F_2, J′=0 and H′=(1), whereas the image of H is zero. Equality fails even for this one-equation presentation.

## Composition at the original consumers

Z04 first uses Z33 to obtain the linear residual modulo t^(2m−r), then Z30 to control the quadratic error modulo t^(2m−2r). Z06 uses the sequence Z36, the full tail precision of Z37, and the exact vanishing criterion Z38. This gives the initial congruence modulo t^(m−r) directly. Uniqueness of a limit of a chosen sequence does not assert uniqueness of a solution of the original polynomial equations.

Z07 applies Z39 before evaluating the universal Jacobian witness. After evaluation it has t^r=h+t^m b; L29–L30 show that 1−t^(m−r)b is a unit when m>r. The exponent r is chosen on the fixed universal presentation, before the test ring. Combining with Z06 gives the uniform N=2r+1 used by U24. The separate smooth-locus/Jacobian criterion needed to produce the original universal identity remains a source-decomposition obligation; the definition Z03 alone is not a proof of that criterion.

The strict threshold is tested by A=Z_3, f=X²−18 and a=3. Here f(a)=−9 and f′(a)=6 supply m=2 and r=1, but there is no root: division of a hypothetical root by 3 would give a square equal to 2 modulo 3. This is a counterexample to weakening the lifting threshold, not a new error in the paper. The finite diagnostic additionally finds no root modulo 27.

## Z03: presentation-dependent ideal API and tests

The empty subset contributes Ann(J), because its determinant is 1 and its equation ideal is zero. This makes H the unit ideal for the zero presentation. An admissible H_B is any subideal of H; it need not itself have a selected minor generating set. Finite membership in H supplies the correction witnesses.

The consumer record now includes U24/G28, Z32/Z33 and Z35/Z39/Z07. The eight API entries cover construction, coefficient base change, evaluation, the full smooth locus, the universal power witness, empty minors, finite witness expressions and perturbation of an evaluated witness. Consumed base-change and perturbation APIs are promoted to Z39 and Z35. Six typed tests are stored on Z03:

- **degenerate — ElkikPresentation.zeroIdeal:** For the presentation A[X_1,…,X_N]/(0), the empty-row contribution is (1), so H=(1), including N=0.
- **computation — ElkikPresentation.hypersurface:** For J=(f), H=Ann(f)+(∂_1 f,…,∂_N f). Over a domain with nonzero f this is the gradient ideal; the annihilator contribution is retained over general rings.
- **non-example — ElkikPresentation.duplicateEquation:** Over Z[X], the presentation (X,X) has H=(1): either singleton row has derivative 1 and conductor (1). The two-row minor ideal is zero, so using only the full-row Jacobian gives a wrong result.
- **non-example — ElkikPresentation.baseChangeStrict:** For J=(2) in Z[X], H=(0); after base change to F_2, the new H=(1), while the image of the old H remains zero. Only base-change inclusion is asserted.
- **compatibility — ElkikPresentation.productRule:** Jacobian entries are evaluations of Mathlib MvPolynomial.pderiv; the entry for f=X_1 X_2 is (X_2,X_1), and coefficient base change commutes with each entry.
- **non-example — ElkikPresentation.smallerWitness:** In Z_p[X] with J=(X), the full H=(1) but the permitted H_B=(p) is not the full smooth-locus ideal. At a=0, p∈H_B(a) whereas 1∉H_B(a).

These itemwise repairs do not silently certify the other inherited definitions and constructions. In particular, the 26 grouped APIs still do not cover all 65 constructions; Z24 has its earlier itemwise API/tests, while the other construction deficits remain.

## Validation and limits

The paper checker, three-file intake checker and whitespace check pass. Structural assertions preserve all 386 previous item statements, all 35 findings, every old route membership and the fifteen route identities. Every missing item has exactly one route. The internal dependency graph has 100 edges and is acyclic. Z03 has three consumer records, eight API entries and six typed tests.

Fresh checks with SymPy 1.14.0 and exact integer/Fraction arithmetic passed:

- 11,200 Taylor remainder cases over residue rings, including characteristic two and zero divisors;
- exact symbolic conductor/adjugate identities and 225 integral specializations of a four-equation system with a nonconstant conductor and a 2×2 minor;
- 48 Newton steps with nonunit derivatives and their predicted correction/residual orders;
- 672 precision-recurrence steps and 1,680 principal-unit witness perturbations;
- three boundary controls for the strict threshold, nonsquares and forbidden cancellation with parameter torsion.

These computations detect errors in formulas and hypotheses. They are not proofs of completeness of an infinite ring, the general Newton theorem, or implementation in Lean. Earlier appendix CAS, tensor and completion diagnostics remain attributed historical evidence and were not rerun. No repository code changed, so the prior worker's 48-test repository run was not repeated.

The diagnostic core below is executable with Python and SymPy 1.14.0. It contains no source files or local filesystem paths.

```python

from fractions import Fraction
from itertools import product
from math import gcd
import sympy as s
# First-order remainder in general small commutative residue rings, including zero divisors.
taylor=0
for mod,gen in [(4,2),(6,2),(8,2),(8,4),(9,3),(12,2),(12,3)]:
 sq=gcd(mod,gen*gen)
 for i,j in product(range(5),repeat=2):
  for a,b0 in product(range(4),repeat=2):
   for u,v in [(0,gen),(gen,0),(gen,gen),(2*gen,gen)]:
    value=lambda x,y:x**i*y**j
    dx=(i*a**(i-1)*b0**j) if i else 0
    dy=(j*a**i*b0**(j-1)) if j else 0
    remainder=value(a-u,b0-v)-value(a,b0)+dx*u+dy*v
    assert remainder%sq==0
    taylor+=1
# Nontrivial conductor and a 2x2 adjugate, computed over Z[X,Y].
x,y=s.symbols('x y');h=1+x;g=s.Matrix([x+y*y,y+x*x]);f=s.Matrix([h*g[0],h*g[1],g[0],g[1]])
D=f.jacobian([x,y]);M=D[:2,:];C=s.Matrix([[h,0],[0,h],[1,0],[0,1]])
assert s.simplify(h*f-C*f[:2,:])==s.zeros(4,1)
err=h*D-C*M
for l in range(4):
 for j,v in enumerate([x,y]):
  expected=sum(s.diff(C[l,i],v)*f[i] for i in range(2))-s.diff(h,v)*f[l]
  assert s.expand(err[l,j]-expected)==0
zv=h*M.adjugate()*f[:2,:]
assert s.simplify(M*M.adjugate()-M.det()*s.eye(2))==s.zeros(2)
res=h*M.det()*f-D*zv
# Explicit exact errors in the two unselected rows: derivative of the conductor matters.
assert s.expand(res[2]-g[0]*(M.adjugate()*f[:2,:])[0])==0
assert s.expand(res[3]-g[1]*(M.adjugate()*f[:2,:])[0])==0
weighted=0
for a,b0 in product(range(-7,8),repeat=2):
 vals=[int(v.subs({x:a,y:b0})) for v in f];L=0
 for v in vals:L=gcd(L,v)
 zs=[int(v.subs({x:a,y:b0})) for v in zv]
 rs=[int(v.subs({x:a,y:b0})) for v in res]
 if L:
  assert all(v%L==0 for v in zs)
  assert all(v%(L*L)==0 for v in rs)
 else:assert not any(zs+rs)
 weighted+=1
# One-step quantitative corrections with genuinely nonunit derivatives over Q, p-adic integral values.
def valuation(v,p0):
 if not v:return 10**9
 v=Fraction(v);n=0
 a,b0=abs(v.numerator),v.denominator
 while a%p0==0:a//=p0;n+=1
 while b0%p0==0:b0//=p0;n-=1
 return n
newton=0
for p0 in [3,5,7]:
 for r in range(1,5):
  for c in range(1,5):
   m=2*r+c
   # a=p^r, f=X²−(a²+p^m), f'(a)=2a has valuation r.
   a=Fraction(p0**r);constant=a*a+p0**m
   correction=(a*a-constant)/(2*a)
   b0=a-correction
   assert valuation(correction,p0)==m-r
   assert valuation(b0*b0-constant,p0)>=2*m-2*r
   assert valuation(2*b0,p0)==r
   newton+=1
recurrence=0
for r in range(8):
 for c in range(1,8):
  m=2*r+c
  for j in range(12):
   assert m==2*r+2**j*c
   assert m-r>r and m-r>=j
   nxt=2*m-2*r;assert nxt>m
   m=nxt;recurrence+=1
# Witness changes are a power times a principal unit at every strict depth.
witness=0
for p0 in [2,3,5,7]:
 for r in range(5):
  for depth in range(r+1,r+5):
   for c in range(-10,11):
    u=1+p0**(depth-r)*c
    assert gcd(u,p0)==1
    assert p0**r+p0**depth*c==p0**r*u
    witness+=1
assert (3*3-18)%9==0 and gcd(2*3,9)==3
assert all((a*a-18)%27 for a in range(27)) # no Z_3 root
assert 2*4%8==0 and 4%8!=0 # cancellation would fail
assert all((a*a)%3!=2 for a in range(3))
counts=dict(taylorResidueRingChecks=taylor,weightedAdjugateSpecializations=weighted,nonunitNewtonSteps=newton,precisionRecurrences=recurrence,principalUnitWitnesses=witness,boundaryControls=3)
print(counts)
```

## Where to resume

1. Complete the smooth-locus/radical power-witness interface at Z03/Z07, importing an exact pinned smooth/Jacobian criterion wherever available. The Newton correction and congruence-limit arguments are now explicit; do not reopen them as opaque "Taylor/convergence" gaps.
2. Close the analytic inputs in Z10/Z13/Z14: finite Galois component descent, inseparable base change, the affinoid Nullstellensatz, rational fibers, flat formal models, and the smoothness hypotheses giving regularity of the generic product. Ordinary and completed tensor products remain distinct.
3. Finish the coefficient-category presentation Z24 and the exact topology/ideal comparisons of the earlier completion work. Preserve the upstream ModularCurves §4D ownership of Z23/Z28.
4. Continue the external-source and multipart census, itemwise definition/construction APIs and typed tests, the monodromy and Appendix A interfaces, and the integral Appendix B certificates. E1–E35 await a finished independent review job; no new review verdict is introduced here.

The packet remains partial for these substantive gaps. The retained earlier reports below contain the rest of the extraction and its evidence; their numerical checkpoint counts describe their respective earlier states.

---

## Retained completion and source reports

# LLHLM23 — completion and regular-coordinate supplier audit

Codex — codex-a71f92 · 2026-09-23 · issue #1254 · continuation of merged PR #2231.
Input main `35102abc3936182011a7e1e521dde160c2f50a75`. **Partial checkpoint**, no independent review or Lean compilation.

## Outcome

The complete-local tensor argument now has exact pinned suppliers for its local-completion and coordinate-ring steps. This adds **16 library atoms (L08–L23)** and **five theorem adapters (Z25–Z29)**. Z28 and the existing Z23 import the already-planned **ModularCurves §4D** preservation of dimension/regularity under completion. They are not duplicated in R03.1.

Current inventory: **386 items: 23 library, 6 planned, 357 missing**; 15 unchanged route identities; 149 definitions/constructions (84 definitions, 65 constructions); all 35 source findings unchanged. All 365 inherited item IDs and mathematical statements are retained. Z19/Z23/Z24 have refined prerequisites/notes/proofs, and Z23's ownership classification changes with explicit evidence. No finding is independently verified here. The 26 inherited API groups cover 84 definitions but omit the 65 constructions. The touched Z24 now has three consumers, six API entries and six typed tests; the other 64 constructions still require an explicit coverage audit. Grouped/untyped definition tests also remain an itemwise-closure gap.

## Fresh reading and provenance

Downloaded the [published LLHLM23 PDF](https://math.rice.edu/~bl70/LocModels.pdf) and [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) again, matching SHA-256 `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd` and `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4`. Freshly read LLHLM PDF78–81 and KWII PDF8–10. The earlier full-paper reading belongs to codex-7e92bd and is not claimed afresh.

Read the statements and full proofs at Stacks [0316](https://stacks.math.columbia.edu/tag/0316), [05GH](https://stacks.math.columbia.edu/tag/05GH), [031C](https://stacks.math.columbia.edu/tag/031C), [0315](https://stacks.math.columbia.edu/tag/0315), [00MA](https://stacks.math.columbia.edu/tag/00MA), [00MB](https://stacks.math.columbia.edu/tag/00MB), [07NV](https://stacks.math.columbia.edu/tag/07NV), [07NY](https://stacks.math.columbia.edu/tag/07NY), and [0C0S](https://stacks.math.columbia.edu/tag/0C0S). The direct proof of 0316 leaves its power-series surjectivity details implicit; Z25 records those details using the actual library's variable-adic completeness and residue-surjectivity theorem.

Read the full DeformationAndDerivedPatchingAlgebra and LocalGaloisDeformationRings roadmap documents; read ModularCurves §4D and its exact atlas stage. Read reviewed AUDIT-17 R03.1/R03.3 and AUDIT-12 ModularCurves4D. These explicitly identify the ownership overlap. The required import is the **pure local-algebra atom**, before the modular-curve applications, not a whole-roadmap arrow. General adic Noetherianity and the coefficient-preserving coordinate/tensor adapters remain R03.1 foundations.

Thirteen relevant Mathlib files were byte-compared with raw GitHub at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the file hashes and URLs are in `libraryAudit.completionAtomContinuation`. Both pinned libraries were searched. A strongly-Noetherian Huber completion theorem is not substituted for arbitrary ideal-adic completion. The LocalRing.lean introductory description is not evidence for a missing Noetherianity theorem; the actual exported declarations were inspected.

## Proof architecture

For any ideal I in Noetherian R, choose generators a_i and evaluate S=R[[X_i]] at their images in B=Rhat. The variable ideal J maps to IB. Constants already surject onto B/IB. S is J-adically complete by an existing instance, B is IB-adically separated, and the existing `surjective_of_mk_map_comp_surjective` proves that S→B is onto. Since S is Noetherian, so is B. This is not circular: the finite-variable power-series Noetherianity theorem is already implemented without assuming completion Noetherianity.

Now specialize to a local ring. Completion is local, preserves residue fields and preserves the minimal number of generators of the maximal ideal. These are exact existing Mathlib results. The existing flatness and going-down height formula, after Noetherianity has been supplied on **both** sides, give equality of dimensions because the closed fiber is a field. The existing regular-local predicate is equality of that generator count with dimension. This yields the upstream regularity-preservation/reflection target and preserves the given coefficient-field map.

For a complete regular local K-algebra with a specified coefficient field, use Nakayama on the finite module **m**, not on the ring, to make cotangent-basis lifts generate m. Evaluation is then surjective without any regularity assumption. For injectivity, the source K[[X_1,…,X_d]] has dimension d: its maximal ideal is generated by the variables (coefficient grouping), giving the upper bound; the existing one-variable dimension lower bound iterates through `finSuccEquiv). Any nonzero kernel element is a non-zero-divisor in that domain, so the existing dimension-drop theorem contradicts the target's dimension d. The inverse is continuous because the isomorphism identifies maximal ideals and every power.

The finite-variable coefficient grouping is explicit: a series with no terms of degree below n is a **finite sum** of degree-n monomials times series. For each higher monomial choose a degree-n divisor and group by it; there are finitely many divisors. No infinite sum is treated as ideal membership.

These arguments do not identify an ordinary tensor of power-series rings with a Noetherian ring, commute localization with inverse limits, imply affinoid regularity, or eliminate the coefficient-category presentation obligation Z24.

## New items

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L08 — The maximal ideal of a local completion

Status: library. For a Noetherian local ring R, its maximal-ideal completion is local and its maximal ideal is the extension of m_R.



Actual declaration and standing hypotheses read. Locality is the preceding instance; this does not establish Noetherianity of the completion.

Locator: Mathlib/RingTheory/AdicCompletion/LocalRing.lean:95 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L09 — Residue-field invariance under completion

Status: library. For Noetherian local R, the residue-field map induced by R→Rhat is bijective.



Actual declaration and standing hypotheses read. Preserves the specified coefficient-field map in Z23.

Locator: Mathlib/RingTheory/AdicCompletion/LocalRing.lean:151 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L10 — Embedding dimension is unchanged by completion

Status: library. For Noetherian local R, spanFinrank of the maximal ideal of Rhat equals spanFinrank of m_R.



Actual declaration and standing hypotheses read. The proof constructs the cotangent comparison; cite the exported rank equality, not a fabricated named cotangent equivalence.

Locator: Mathlib/RingTheory/AdicCompletion/LocalRing.lean:156 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L11 — Adic completion is flat

Status: library. For a Noetherian commutative ring R and any ideal I, AdicCompletion I R is flat as an R-module.



Actual declaration and standing hypotheses read. No Noetherianity of the completed ring is concluded by flatness.

Locator: Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:379 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L12 — Prime-height formula for a going-down map

Status: library. Let R,S be Noetherian commutative rings, S an R-algebra satisfying going-down, p a prime of R and P a prime of S lying over p. Then ht(P)=ht(p)+ht(P mod pS).



Actual declaration and standing hypotheses read. Flatness supplies Algebra.HasGoingDown.of_flat at Mathlib/RingTheory/Ideal/GoingDown.lean:154 (read). Both rings must be Noetherian; this cannot prove Noetherianity of completion.

Locator: Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:462 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L13 — Finite-variable power series over a Noetherian ring are Noetherian

Status: library. For finite sigma and Noetherian commutative R, MvPowerSeries sigma R is Noetherian.



Actual declaration and standing hypotheses read. The proof uses finSuccEquiv and the one-variable theorem; no completion-Noetherianity assumption.

Locator: Mathlib/RingTheory/MvPowerSeries/Equiv.lean:225 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L14 — Variable-adic completeness of finite-variable power series

Status: library. For finite sigma and any commutative R, R[[X_sigma]] is complete and separated for the ideal generated by its variables.



Actual declaration and standing hypotheses read. The directly applicable anonymous instance at lines213–222 was read; no invented instance name. Its proof transports completeness along the named equivalence from Equiv.lean:344.

Locator: Mathlib/RingTheory/AdicCompletion/Completeness.lean:213 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L15 — Surjectivity from a residue quotient

Status: library. For a ring homomorphism f:A→B and ideal J⊆A, if A is J-adically precomplete, B is J.map(f)-adically separated, and A→B/J.map(f) is surjective, then f is surjective.



Actual declaration and standing hypotheses read. There is no finiteness or Noetherianity hypothesis. Identify the mapped ideal before applying it.

Locator: Mathlib/RingTheory/AdicCompletion/Functoriality.lean:458 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L16 — A non-zero-divisor kernel lowers dimension

Status: library. If f:R→S is surjective and its kernel contains a non-zero-divisor r, then dim(S)+1≤dim(R).



Actual declaration and standing hypotheses read. For a power-series domain over a field, any nonzero kernel element qualifies. The +1 argument uses the finite dimension supplied by Z27.

Locator: Mathlib/RingTheory/KrullDimension/NonZeroDivisors.lean:60 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L17 — One extra formal variable raises dimension at least one

Status: library. For any commutative ring R, dim(R)+1≤dim(R[[X]]).



Actual declaration and standing hypotheses read. Only a lower bound. Iteration uses MvPowerSeries.finSuccEquiv at Equiv.lean:170; no upper-bound theorem is claimed.

Locator: Mathlib/RingTheory/KrullDimension/NonZeroDivisors.lean:118 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L18 — Local dimension is bounded by generators of the maximal ideal

Status: library. For a Noetherian local ring R, ringKrullDim R≤spanFinrank(m_R).



Actual declaration and standing hypotheses read. Combines with an explicit finite-variable maximal-ideal calculation in Z26.

Locator: Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:490 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L19 — The existing regular-local-ring criterion

Status: library. For Noetherian local R, IsRegularLocalRing R iff spanFinrank(m_R)=ringKrullDim R; equivalently the residue-field dimension of m_R/m_R² equals dim R.



Actual declaration and standing hypotheses read. Reuse this predicate. The class includes Noetherianity; an equality of dimensions alone does not discharge that instance.

Locator: Mathlib/RingTheory/RegularLocalRing/Defs.lean:57 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L20 — Power-series units are detected by the constant term

Status: library. A multivariate power series over a ring is a unit iff its constant coefficient is a unit.



Actual declaration and standing hypotheses read. The following instance gives locality over a local coefficient ring. Over a field the nonunits are exactly zero-constant series.

Locator: Mathlib/RingTheory/MvPowerSeries/Inverse.lean:138 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L21 — Surjective images of Noetherian rings are Noetherian

Status: library. For a surjective ring homomorphism A→B from a Noetherian ring, B is Noetherian.



Actual declaration and standing hypotheses read. Used only after constructing actual surjectivity of the power-series evaluation.

Locator: Mathlib/RingTheory/Noetherian/Basic.lean:344 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L22 — Finite-ideal completion and its first quotient

Status: library. For finitely generated I⊆R, Rhat is complete for I Rhat and the surjection evalOne:Rhat→R/I has kernel I Rhat.



Actual declaration and standing hypotheses read. The kernel lemma is at line198; evalOne surjectivity is Algebra.lean:193. Completeness for the mapped ideal uses LocalRing.lean:isAdicComplete_self. These are available without claiming completion Noetherianity.

Locator: Mathlib/RingTheory/AdicCompletion/Completeness.lean:184 at mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/L23 — Finite-module Nakayama span criterion

Status: library. For a finite module M over a local ring R and a submodule N, the image of N in M/m_R M is the whole quotient iff N=M.



Apply to M=m_R, not M=R, to turn lifts of a cotangent basis into generators of m_R.

Locator: Mathlib/RingTheory/LocalRing/Module.lean:72 at 082e2d37e8b0463410cdb532e111cd43d5a66174.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z25 — Noetherianity of adic completion via a power-series quotient

Status: missing. For any ideal I of a Noetherian commutative ring R, the I-adic completion Rhat is Noetherian.

1. Choose finitely many generators a_i of I and set S=R[[X_1,…,X_t]], J=(X_i), B=Rhat and Ihat=I B. L22 gives Ihat-completeness and B/Ihat≅R/I.
2. Equip R with the discrete topology and B with the Ihat-adic topology. The coefficient map is continuous, and each a_i is topologically nilpotent because a_i^n∈Ihat^n. The finite family satisfies the cofinite-filter condition automatically. L05 constructs f:S→B with X_i↦a_i.
3. The image ideal J.map(f) is Ihat, since the chosen a_i generate I. The map S→B/Ihat is surjective already on constant series R by L22.
4. L14 makes S J-adically complete, and L22 makes B J.map(f)-adically separated. Apply L15 to obtain surjectivity of f.
5. S is Noetherian by L13, so B is Noetherian by L21. This proof does not assume B is Noetherian and does not use Noetherianity of an ordinary tensor of power-series rings.

Codex — codex-a71f92. Mathematical proof and exact library contracts supplied; no Lean implementation or independent review claimed. Reuse existing R03.1 infrastructure.

Locator: Stacks 0316 direct proof; its omitted surjectivity details supplied using pinned L14/L15/L22.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z26 — Finite-variable ideal powers by coefficient vanishing

Status: missing. For finite sigma, a commutative ring R, S=R[[X_sigma]], J=(X_i), and n≥0, J^n is exactly the set of series whose coefficients of every monomial of total degree <n vanish.

1. Every monomial in a product of n variables has degree at least n, so J^n has the stated coefficient vanishing.
2. For each exponent alpha of total degree at least n choose a degree-n divisor beta≤alpha. There are only finitely many such beta because sigma is finite.
3. Group the coefficients of a given series by that chosen divisor to write it as a finite sum Σ_(|beta|=n) X^beta F_beta. Each summand belongs to J^n.
4. For n=0 the assertion is all of S; for empty sigma and n>0 it is the zero ideal. The proof uses finite sums of whole series, not an invalid infinite ideal sum.

Codex — codex-a71f92. Mathematical proof and exact library contracts supplied; no Lean implementation or independent review claimed. Reuse existing R03.1 infrastructure.

Locator: Worker-supplied supplier decomposition for KWII Proposition2.2(ii), LLHLM23 PDF79; source comparisons recorded in continuation report.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z27 — Dimension of finite-variable formal power series over a field

Status: missing. For a field K and a finite index set sigma of cardinality d, ringKrullDim(K[[X_sigma]])=d.

1. The source is Noetherian by L13 and local by the power-series local-ring instance following L20.
2. By L20 its maximal ideal consists of zero-constant series. Z26 for n=1 says this is generated by the d variables. L18 gives dimension at most d.
3. Iterate L17 through the actual equivalences MvPowerSeries.finSuccEquiv and reindexing; begin with dim K=0. This gives dimension at least d.
4. The empty-index case is K. This argument proves the multivariable upper bound; the pinned one-variable lower bound alone does not assert equality.

Codex — codex-a71f92. Mathematical proof and exact library contracts supplied; no Lean implementation or independent review claimed. Reuse existing R03.1 infrastructure.

Locator: Worker-supplied supplier decomposition for KWII Proposition2.2(ii), LLHLM23 PDF79; source comparisons recorded in continuation report.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z28 — Dimension is unchanged by local completion

Status: planned. For a Noetherian local ring R with maximal ideal m, dim(Rhat)=dim(R) for its m-adic completion.

1. Z25 first makes Rhat Noetherian. L08 makes it local with maximal ideal mRhat and makes the coefficient map local.
2. L11 and Algebra.HasGoingDown.of_flat supply going-down. The two maximal ideals lie over one another.
3. Apply L12 to these maximal ideals. Since m maps to the whole maximal ideal, its image in Rhat/mRhat is zero, a prime of the residue field of height zero.
4. Use maximal-ideal height equals local-ring dimension on both sides. No finite-type assumption on R→Rhat is introduced.

Import the existing upstream preservation-of-dimension target, not a parallel R03.1 target. L12 identifies the exact available generic formula; the Noetherian prerequisite is Z25. The upstream local-commutative-algebra atom precedes all modular-curve application layers.

Locator: Stacks 07NV (alternative dimension-formula proof); existing ModularCurves §4D target.

### PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z29 — Generator evaluation surjects with a specified coefficient field

Status: missing. Let B be a complete separated local K-algebra, K a field, such that K→B/m is an isomorphism. If b_1,…,b_r generate m as an ideal, then the continuous K-algebra evaluation K[[X_1,…,X_r]]→B, X_i↦b_i, is surjective.

1. Give K the discrete topology and B its m-adic topology; each b_i is topologically nilpotent, and the finite family meets HasEval. Use L05.
2. The image of the variable ideal J under evaluation is exactly m by the generating hypothesis.
3. Modulo m the coefficient map already surjects. The source is J-adically complete by L14 and the target is m-adically separated.
4. Apply L15. No regularity or dimension equality is used here; those are separately required for injectivity in Z19.

Codex — codex-a71f92. Mathematical proof and exact library contracts supplied; no Lean implementation or independent review claimed. Reuse existing R03.1 infrastructure.

Locator: Worker-supplied supplier decomposition for KWII Proposition2.2(ii), LLHLM23 PDF79; source comparisons recorded in continuation report.


## Z24 consumer-derived API and tests

- PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z20: Extend the factor jet maps to the complete tensor and identify the quotient kernel.
- PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z12: Construct the tensor of the coefficient retractions C→O, ensuring C is nonzero.
- PAPER-LE-LEHUNG-LEVIN-ETAL-23/U43: Model the completed local ring of a finite product of pointed local models.

- `CompleteLocalTensor.factorMap` (projection): Provide continuous local O-algebra maps R_i→C, commuting with the specified residue-field identifications.
- `CompleteLocalTensor.homEquiv` (universal property): For a complete Noetherian local O-algebra A with the specified residue field, continuous local O-algebra maps C→A correspond to families of such maps R_i→A; prove evaluation on each factor and uniqueness.
- `CompleteLocalTensor.presentation` (characterisation): Given finite continuous presentations R_i=O[[X_i]]/I_i, identify C with O[[all X_i]]/(images of I_i); prove independence of the presentations via homEquiv.
- `CompleteLocalTensor.quotient` (compatibility): For closed ideals J_i in the factors, compare C/(sum J_i C) with the completed tensor of R_i/J_i using quotient maps; Z20 separately identifies its finite-free jet target with an ordinary tensor.
- `CompleteLocalTensor.augmentation` (consumer): A family of continuous local O-algebra retractions R_i→O induces C→O whose composite with O→C is identity; do not assume every coefficient algebra has such a retraction.
- `CompleteLocalTensor.reindex` (compatibility): Reindexing and regrouping finite factors give canonical continuous O-algebra equivalences determined by all factor maps; the empty tensor is O.

- `CompleteLocalTensor.empty` (degenerate): The empty family has C=O and its induced retraction is identity.
- `CompleteLocalTensor.powerSeries` (computation): O[[x]] completed-tensor_O O[[y]] is O[[x,y]], carrying the factor variables to their named coordinates.
- `CompleteLocalTensor.nonreduced` (non-example): For factors O[[x]]/(x²) and O[[y]]/(y²), C=O[[x,y]]/(x²,y²) is Noetherian complete local but not reduced or a domain.
- `CompleteLocalTensor.torsion` (non-example): O[[x]]/(πx) is an allowed coefficient algebra; tensoring with O leaves its nonzero π-torsion. The construction alone does not imply O-flatness.
- `CompleteLocalTensor.finiteJets` (compatibility): For factors O[[x]]/(x^n) and O[[y]]/(y^n), the completed tensor equals the ordinary finite free tensor and has basis x^a y^b for a,b<n.
- `CompleteLocalTensor.associativity` (compatibility): For three power-series factors, both parenthesizations identify with O[[x,y,z]], and the induced maps agree on O and each variable.

## Submission checks

Paper validator and three-file intake pass. All 48 repository tests pass. Structural checks confirm unique IDs, 73 recorded dependency edges with no internal cycle, one route per missing item, preserved route identities, all 365 old mathematical statements and all 35 source findings unchanged. Only Z19/Z23/Z24 have intentionally refined item metadata. Publication input `aaad07d20878d1959d96e154df283a54b61eb6f5`; protocol, audit, owner documents and previous deliverables unchanged. No Lean file is authorized or compiled.

## Diagnostics and remaining work

Python standard-library diagnostics passed: **9,290 monomial-divisor checks**, **48 Hilbert-function counts**, **1,103 invertible finite-jet coordinate maps**, and **211 singular controls**. These finite calculations are regression checks, not proofs of infinite-dimensional completion or formal Lean verification. The earlier SymPy/CAS programs are preserved but not executed in this continuation.

```python
from itertools import product
from math import comb
import json

counts={"monomial_divisors":0,"hilbert_counts":0,"coordinate_maps":0,"singular_controls":0}
def monomials(d,n):
    return [a for a in product(range(n),repeat=d) if sum(a)<n]
def mul(f,g,mons,n,p):
    out={}
    for a,x in f.items():
        for b,y in g.items():
            c=tuple(i+j for i,j in zip(a,b))
            if sum(c)<n: out[c]=(out.get(c,0)+x*y)%p
    return {a:c for a,c in out.items() if c}
def power(f,k,mons,n,p):
    out={(0,)*len(mons[0]):1}
    for _ in range(k): out=mul(out,f,mons,n,p)
    return out
def rank(matrix,p):
    M=[row[:] for row in matrix]; r=0
    for j in range(len(M[0])):
        k=next((i for i in range(r,len(M)) if M[i][j]%p),None)
        if k is None: continue
        M[r],M[k]=M[k],M[r]
        z=pow(M[r][j]%p,-1,p); M[r]=[x*z%p for x in M[r]]
        for i in range(len(M)):
            if i!=r:
                z=M[i][j]%p; M[i]=[(x-z*y)%p for x,y in zip(M[i],M[r])]
        r+=1
        if r==len(M):break
    return r
for d in range(6):
    for n in range(1,9):
        mons=monomials(d,n)
        assert len(mons)==comb(n+d-1,d)
        counts["hilbert_counts"]+=1
        # Every monomial through total degree n+2 has the required chosen degree-n divisor.
        for a in monomials(d,n+3):
            if sum(a)<n:continue
            rem=n; b=[]
            for x in a:
                t=min(x,rem); b.append(t); rem-=t
            assert rem==0 and sum(b)==n and all(x<=y for x,y in zip(b,a))
            counts["monomial_divisors"]+=1
for p in (2,3,5):
    for n in range(2,6):
        mons=monomials(1,n)
        for coeffs in product(range(p),repeat=n-1):
            f={(i+1,):a for i,a in enumerate(coeffs) if a}
            images=[power(f,k,mons,n,p) for k in range(n)]
            matrix=[[col.get(a,0) for col in images] for a in mons]
            r=rank(matrix,p)
            assert (r==n)==(coeffs[0]!=0)
            if coeffs[0]:counts["coordinate_maps"]+=1
            else:counts["singular_controls"]+=1
# All invertible linear parts and all quadratic corrections on F2[x,y]/(x,y)^3.
p=2;n=3;mons=monomials(2,n)
linear=[(1,0),(0,1)];quad=[a for a in mons if sum(a)==2]
for A in product(range(p),repeat=4):
    if (A[0]*A[3]-A[1]*A[2])%p==0:continue
    for Q in product(range(p),repeat=6):
        images_vars=[]
        for i in range(2):
            f={linear[j]:A[2*i+j] for j in range(2) if A[2*i+j]}
            f.update({a:Q[3*i+j] for j,a in enumerate(quad) if Q[3*i+j]})
            images_vars.append(f)
        images=[]
        for a in mons:
            f={(0,0):1}
            for i,k in enumerate(a): f=mul(f,power(images_vars[i],k,mons,n,p),mons,n,p)
            images.append(f)
        assert rank([[col.get(a,0) for col in images] for a in mons],p)==len(mons)
        counts["coordinate_maps"]+=1
print(json.dumps(counts,sort_keys=True))
```

The exact supplier graph for this bounded completion/coordinate step is now explicit; implementation still requires the adic-topology and ideal-identification adapters and formal elaboration. Z24's coefficient-category presentation and universal property are not implemented merely by listing their suppliers. Continue next with Z06's Taylor/adjugate/convergence suppliers or Z10/Z13/Z14's analytic Galois descent, rational fibers and flat formal models. Retain the original remaining-source queue, all 35 unreviewed findings, and the itemwise definition API/typed-test gap.

The previous report follows verbatim. Its counts, fresh-reading claims and computation results refer to its own authors/checkpoints.

---

# LLHLM23: local models, generic Breuil–Mézard and Serre weights

**Partial extraction checkpoint, issue #1254.** Codex — codex-7e92bd continues the codex-hjdg0j checkpoint. The result contains 365 inventory entries (7 library, 4 planned, 354 missing), 15 routes, 26 API/test groups referencing all 84 inventoried definitions, and 35 unchanged source findings. Reading coverage and inventory routing are not proof-input closure: the explicit gaps below prevent a `complete` verdict. No Lean implementation or independent verification of the findings is claimed.

The machine-readable companion is [PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json](PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json). Its `items` contain the mathematical statements and locators; `sourceData.appendixB` preserves the computational equations and every normalization-table row. IDs N/U/M/K/P/G/B/V/A/Q follow the main-paper sections; Z denotes an explicitly extracted external input. L denotes an exact pinned-library theorem. E1–E35 are source findings, a separate namespace.

## What the paper establishes

For unramified local fields and sufficiently generic tame inertial types, the paper compares potentially crystalline deformation geometry to explicit differential local models. The comparison is sensitive to Hodge bounds, the coefficient field's ramification index, completion and the choice of inertial presentation. The models are flat closures of characteristic-zero flag varieties inside an affine Grassmannian; they differ from the naive differential intersections.

Theorem 7.3.2 has two levels. A numerical depth bound gives a noncanonical closed immersion of completed charts. A further nonzero integral polynomial in the inertial parameters gives the regular-chart isomorphism and **domain-or-zero versal rings at semisimple residual points**. Warning 7.3.3 prevents treating this as a canonical globally glued diagram over the integers. Appendix B exhibits a dense branching locus, so arbitrary residual points must not inherit the domain conclusion.

Theorem 7.4.2 identifies reduced crystalline component support with the Serre weights in the reduction of the corresponding algebraic/tame type. Its strong bound is `max{2(h+1), 4n+h}` for regular Hodge weights in `[0,h]`. Component membership implies Herzig-predicted membership under the specified numerical bound; the converse additionally uses the fixed-point polynomials. Obvious weights have a separate implication that does not need those polynomials.

Sections 8–9 assemble these facts with patching. Generic geometric and versal Breuil–Mézard cycles are effective and canonical with their specified support and semisimple pullbacks. For a finite set of dominant weights containing zero, stronger shifted polynomial genericity gives the small-weight equations, including virtual tame Weil–Deligne types. The virtual coefficients may be negative. These BM equations extend to sufficiently generic semisimplifications of wild representations; this does not extend the domain theorem to wild points. Arbitrary finite type sets do not by themselves give uniqueness of every BM cycle.

The global Serre theorem assumes the definite-unitary CM setting, `F+ != Q`, split and unramified p-adic places, `p` not dividing `2n`, residual automorphy, adequacy over `F(zeta_p)`, and tame polynomial-generic local parameters. Appendix A permits arbitrary away-from-p level. The modularity-lifting theorem also retains polarization, semisimple residual p-adic restrictions, the adjoint fixed-field condition and an appropriate residual automorphic lift. Its change-of-weight relaxation comes afterwards.

## Sources and reading boundaries

The primary source is the [author-hosted Springer PDF](https://math.rice.edu/~bl70/LocModels.pdf), *Inventiones mathematicae* 231 (2023), 1277–1488, DOI `10.1007/s00222-022-01163-4`. Downloaded 23 September 2026, it has 212 PDF pages and SHA-256 `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`. The inherited codex-7e92bd checkpoint records reading all pages, proofs and the bibliography; extracted-text trouble spots were inspected as images, including the rotated Table 1. Locators use PDF pages rather than an invented offset to journal pagination.

[arXiv v2](https://arxiv.org/abs/2007.05398v2), dated 15 June 2022, has SHA-256 `3cdae0b192d3ba8d75391fbd2bf40264e23c9d9c69d536ad30b50dddda0d61af`. Only selected PDF pages 24, 28, 35, 38 and 69, with incidental pages 96 and 115, were compared. The corresponding errors persist there; this is not a claim to have read the entire preprint twice. The author's paper listing showed no correction link for this article. The publisher page timed out twice, so its corrections listing was not inspected. `known: new` means no correction was located in the recorded searches, not a claim of priority.

External primary material actually inspected:

- [Weight elimination in Serre-type conjectures](https://math.rice.edu/~bl70/WEpaper.pdf), published PDF pages 8, 37, 67–68: the correct opposition anti-homomorphism and the exact formal-smoothness/obvious-weight-propagation statements. SHA-256 `dbf6f1d12f7ea47e2f4185e5d4e17b4ee3dfbd789022ee9168da2a265fec5a15`.
- [Shapes and shadows](https://math.rice.edu/~bl70/Shadows.pdf), PDF pages 23–24: the earlier fields-of-norms formula corrected explicitly by LLHLM23. SHA-256 `0437985ba4ccc24dfe9ee3cd2feb47e56a4c5e5964169f9092bc96882b868ef0`.
- [Emerton–Gee v4](https://arxiv.org/abs/1908.07185v4), PDF pages 126–129, 163–164 and 181; all nine pages of the [authors' errata](https://www.ma.imperial.ac.uk/~tsg/Index_files/moduli-errata.pdf). The respective hashes are `4eba204b702b18f939d781fb118c06183badc51a216c94b0e607d98c58044005` and `fe9687ddfc4ddc11ee7436b6da1a80630dae8d59e4bb80e0a3cfbf27355bfe0c`. The corrected exhaustion argument, coefficient-field assumption and unramified-character conventions are part of the import contract.
- [Boixeda Alvarez v3](https://arxiv.org/abs/1910.04780v3), all 17 pages as text and pages 8–9 as images, SHA-256 `170a547678f7676744bafc1f2cfddc8898bf05379b99ab0c28ba880c1cfcc7ad`. The Type A characteristic-zero fixed-point theorem is extracted as Z01. Dense matrix formulas and its auxiliary inputs still need a complete transcription/proof audit; three clear proof-display slips are recorded as E29–E31.

The prerequisite list distinguishes inspected inputs from the unread queue. Elkik, BLGGT and Khare–Wintenberger II now have the precise reading records and extracted adapters below. Primary bibliographic pages were also checked for Deligne–Lusztig, Caraiani–Levin, Pyvovarov and CEGGPS; that does not establish reading their proofs.

## Library and ownership audit

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Broad searches of both pinned Lean trees are preserved in `libraryAudit.searches`. The advanced Deligne–Lusztig, Serre-weight, Kisin, Emerton–Gee, inertial-type, affine-flag and Elkik packages were not found by these searches. The positive Deligne–Lusztig text hit was a GL2 nonsplit-torus file, not the representation construction. Tau Ceti's Young-symmetrizer Weyl module assumes a Q-algebra; it does not supply the integral/mod-p module used here.

Existing finite Coxeter, root-system, dimension and coefficient-ring atoms remain reusable. The two newly extracted atomic items L01/L02 are marked library only after reading their declarations; no advanced package is marked built from a name match. The complete item-by-item declaration/adapter audit remains open. Broad negative searches alone do not show every constituent lemma is absent.

The relevant reviewed rows of AUDIT17 (deformation/patching algebra), AUDIT13 (classical algebraic modular forms) and AUDIT21 (Satake geometry) were inspected. The audit file had no rows for LocalGaloisDeformationRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory or PotentialAutomorphyInfrastructure at the audited snapshot; no reviewed negative verdict is invented for them. The corresponding current roadmap descriptions were read directly.

Ownership was refreshed at atlas commit `384cf15`, including LLHLM20 checkpoint PR #2197. Existing candidate IDs are reused even when they have not become accepted stage records. Such items remain `missing`, not falsely `planned` in a nonexistent accepted layer.

The important boundaries are:

- Integral PZ and universal-loop geometry stays with `GeometricSatakeLocalModelsPartII`; differential equations and true-monodromy comparisons go to `LocalGaloisDeformationRingsPartIIMonodromyModels`.
- Existing `LocalGaloisDeformationRings:L7` supplies bounded-height lattice moduli, tame descent/gauges and fixed-type deformation rings. The new comparison does not duplicate the unrestricted-ring normality candidate or the rank-two potentially Barsotti–Tate candidate.
- Affine orders and admissible pairs reuse `RootSystemsPartIIDominanceAndDemazure`. Finite reductive modular theory reuses the newly proposed `ModularRepresentationsOfFiniteReductiveGroups`; PA.1 and `ReductiveGroupsIntegralRepresentationsPartII` supply shared integral rational-module foundations that must be reconciled once.
- The Emerton–Gee foundation is shared with `WeightZeroCrystallineLiftingRings`. Its weight-zero endpoint is not a prerequisite of the common stack/component stages.
- Exact patching functors and Appendix A use the existing all-rank CEGGPS candidate. General patching algebra and global polarized deformation data remain in their established roadmaps.
- `GenericGL3SerreWeightsAndLattices` is reused for the common all-rank BM/Serre foundation while retaining its specialized GL3 lattice endpoint. Its legacy ID does not imply that the common foundation is restricted to rank three. The proposed widening needs final ownership/dependency review.
- The final lifting theorem reuses `PolarizedAutomorphyLifting`.

Whole-roadmap arrows would hide a cycle. The required **phase order** is finite-group/tame Kisin foundations; weak potentially diagonalizable patching and its local nonvanishing criterion; generic monodromy comparison and domains; minimal rank-one BM; arbitrary-level weak patching construction and its separate detectability proof; global Serre weights; change-of-weight modularity lifting. Appendix A's detectability uses the domain theorem, whereas the early weak patching existence used to prove that theorem does not. GL3 integral-lattice conclusions must not be used to construct their own initial patching functor.

## Continuation: approximation and the two tensor products

Codex — codex-hjdg0j freshly read the published LLHLM23 PDF pages 68–69 and 78–81, concentrating on Proposition 3.3.9, the end of Theorem 3.7.1 and Lemma 3.7.2. This is a bounded continuation of the earlier full-paper reading. The following original proofs were read, including their standing conventions:

| Source | Actual reading | SHA-256 of downloaded PDF |
| --- | --- | --- |
| [Elkik (1973)](https://numdam.org/item/10.24033/asens.1258.pdf) | PDF3–7, printed554–558: §0.1–0.2, Lemma1 and its complete proof; printed556 also rendered | 74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5 |
| [BLGGT](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | PDF95–98, printed595–598: affinoid conventions, LemmaA.1.1 and completion examples | c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b |
| [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | PDF4–6 conventions and PDF8–10, including Proposition2.2 and its full proof | 53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4 |

Elkik's original setting is Noetherian. Its presentation-dependent ideal is the sum of conductor-weighted Jacobian minors, not simply the full-row Jacobian of an arbitrary redundant presentation. Z03 gives this definition, base-change inclusion, evaluation, smooth-locus and uniform-witness APIs. Z04 isolates the finite adjugate/Taylor calculation. Z05 keeps the original arbitrary-ideal statement with bounded parameter torsion and n > max(2h,h+k).

U24 needs complete parameter-torsionfree test rings that need not be Noetherian. Z06 therefore extracts only the I=A specialization: the algebraic correction uses cancellation instead of the Noetherian torsion cutoff. If the residual vanishes modulo t^m and the evaluated Jacobian ideal contains t^r, the correction lies in t^(m-r), and the new residual vanishes modulo t^(2m-2r). For m>2r, the witness persists by a unit adjustment and the recurrence has the exact solution m_j=2r+2^j(m_0-2r). Completeness and separatedness give the exact solution. No arbitrary-ideal non-Noetherian version is asserted.

Z07 chooses the full universal Jacobian ideal as the base-change witness H_B and chooses r from the fixed Noetherian universal presentation: smoothness after inverting v gives v^r in the sum of the equation and Jacobian ideals. Evaluating at an approximate zero and absorbing the equation error into a unit gives the required t^r witness. Thus N=2r+1 works uniformly in the test ring. The linear equation t^r X=t^m shows why agreement modulo t^m would be an incorrect strengthening.

Theorem 3.7.1 uses two different completions. Z11 records KWII in its original finite-p-adic-field scope. Z12 extracts its **domain conclusion** over a general complete DVR: at each rational generic point, the regular local completion is a power series ring over the fraction field. Saturated powers J_n=P^n R[1/π]∩R have zero intersection; Chevalley's theorem makes them cofinal toward the maximal-ideal topology. Their quotients are finite free over the DVR. The completed tensor embeds, through these quotients and their generic jets, into the joint power series ring. This requires retractions to the coefficient DVR. The ramified quadratic example in the tests shows failure without them. Generic regularity of an arbitrary tensor over an imperfect field is not included in this extracted conclusion.

Z08–Z10 and Z14 instead treat the completed **affinoid** tensor product. BLGGT defines geometric connectedness by finite field extensions and assumes a finite extension of Q_l. Its product proof uses two rational fibers in allegedly disjoint open-and-closed pieces; their common product point contradicts disjointness. Z14 records the same proof over a complete nonarchimedean field, with the exact Nullstellensatz, finite scalar-extension and rational-fiber comparisons still requiring supplier closure. Z10 supplies the connected normal algebra with a rational point used by LLHLM23: finite Galois extension acts transitively on components, whereas the rational point fixes a component; inseparable extensions are handled by universal homeomorphisms. Z13 combines connectedness with the product's independently established regularity and the flat formal models' torsionfreeness. Smoothness of the original generic charts must be retained when checking that regularity.

The existing AdicSpacesPartII:R0 and F0 own these analytic product/completion interfaces; DeformationAndDerivedPatchingAlgebra:R03.1 owns the complete local coefficient tensors. SchemeAndStackFoundations:SF.4 receives the approximation lemmas. The upstream AdicSpaces carrier is imported. No competing roadmap is added.

At the pinned Tau Ceti commit, the actual declarations TauCeti.connectedSpace_primeSpectrum_iff_idempotent_eq_zero_or_one and TauCeti.geometricallyConnected_tensorProduct were read in full, alongside Mathlib's scheme-level definition. L01 supplies the idempotent criterion in U42. L02 concerns the ordinary algebraic tensor and does not discharge the completed affinoid theorem or the finite-extension convention comparison. The further complete-local continuation below decomposes Chevalley and the formal tensor-jet comparisons. Normality, regular-structure atom auditing and affinoid fiber suppliers remain explicit gaps.

Exact Fraction/integer checks passed for 576 precision-recurrence steps, 210 scalar Newton corrections, 175 examples of precision loss, and five tensor zero-divisor identities. They check the stated bounds and counterexample; they do not prove the general approximation or tensor theorems. The reproducible code is included below.

## Complete-local tensor continuation: saturated point jets

Codex — codex-7e92bd continues the 350-item checkpoint with Z15–Z24 and L03–L07. This pass freshly read the published LLHLM23 PDF79–80 and [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), PDF4–6 and8–10; the latter download has the same SHA-256 recorded above. The additional Stacks readings were the statements and proofs at [0C0S](https://stacks.math.columbia.edu/tag/0C0S), [07NY](https://stacks.math.columbia.edu/tag/07NY), [00MA](https://stacks.math.columbia.edu/tag/00MA), [0315](https://stacks.math.columbia.edu/tag/0315) and [00KW](https://stacks.math.columbia.edu/tag/00KW). The Chevalley argument below is an explicit reconstruction. KWII's cited Zariski–Samuel book was not separately read.

The revised Z12 proves the **domain conclusion** directly over a complete DVR O. Its proof dependencies now point to the actual general-DVR lemmas, rather than the narrower finite-p-adic-field theorem Z11. No finiteness or perfection of the residue field enters this argument. The affinoid tensor in Z13–Z14 remains a separate open interface.

Write π for the uniformizer, K for its fraction field, and take complete Noetherian local O-algebras R_i with residue field k_O and O-algebra retractions ξ_i. For the domain theorem each R_i is a domain and the local ring at the induced K-point of R_i[1/π] is regular. Set

\[
 P_i=\ker\xi_i,\quad A_i=R_i[1/\pi],\quad q_i=P_iA_i,
 \qquad J_{i,n}=q_i^n\cap R_i,\quad Q_{i,n}=R_i/J_{i,n}.
\]

These are saturated point jets (Z15). The saturation is essential: ordinary quotients by P_i^n can have π-torsion. The API records contraction membership, descending transition maps, augmentation, functoriality for maps preserving ξ, finite freeness and the canonical generic-fiber comparison. It does not assert arbitrary base-change equality of saturated ideals or a functorial choice of bases.

**Separation and cofinality (Z16).** For a finite module M over a complete Noetherian local ring (R,m), let N_n decrease with zero intersection. In M/m^qM the images of N_n stabilize because this module has finite length. Call their stable value V_q. Reduction V_(q+1)→V_q is surjective: choose a common stage at which the images at both levels have stabilized. Starting with any v∈V_q, choose successive lifts in these stable images. Completeness of M gives an element x. For every fixed n and every r, x∈N_n+m^rM. Krull separation for M/N_n therefore puts x in every N_n, so x=0. Thus V_q=0 and some N_n⊂m^qM. This uses finite length, not a finite underlying set.

In the present application, R_i injects into (A_i)_(q_i) because it is a domain, and that local ring injects into its completion by Krull separation. Consequently ∩_nJ_(i,n)=0. Chevalley then gives the required containment J_(i,n)⊂m_i^q. This conclusion is sufficient; it does not say J_(i,n) is open for the maximal-ideal topology. For example, (x^n)⊂O[[x]] contains no power of π.

**Finite free integral quotients (Z17–Z18).** The graded pieces P_i^j/P_i^(j+1) are finite modules over R_i/P_i=O, using monomials in a finite set of generators of P_i. Hence R_i/P_i^n and its quotient Q_(i,n) are finite over O. Saturation removes π-torsion, so each Q_(i,n) is finite free. Its augmentation ideal has nth power zero; its maximal ideal is generated by π and that augmentation ideal. The inclusions

\[
 \mathfrak m_{Q}^{q+n-1}\subseteq\pi^qQ\subseteq\mathfrak m_Q^q
\]

identify the two topologies and show completeness. Localization and contraction give Q_(i,n)⊗_O K≅A_i/q_i^n. This finite-dimensional K-algebra is local with nilpotent maximal ideal and residue K; inverting elements outside q_i therefore leaves it unchanged. It is precisely the nth jet of (A_i)_(q_i), not an unidentified quotient of a global generic fiber.

**The kernel of each tensor-jet map (Z20).** Let C be the existing complete-local tensor construction Z24 and let h≥1 be the number of factors. Define H_n=Σ_iJ_(i,n)C and D_n=⊗_O Q_(i,n). The tensor D_n is finite free. Its augmentation ideal N satisfies N^(h(n−1)+1)=0, so

\[
 \mathfrak m_D^{q+h(n-1)}\subseteq\pi^qD_n\subseteq\mathfrak m_D^q.
\]

It is therefore a complete local O-algebra. The factor maps extend to C→D_n. Conversely they induce D_n→C/H_n. Completeness of the Noetherian quotient C/H_n and the tensor universal property show these maps are inverse. Thus the kernel is exactly H_n. An alternative proof uses exactness of completion in the Noetherian power-series presentation of C. It must not assume that the ordinary tensor of two formal power-series algebras is Noetherian.

Each D_n injects into D_n⊗_O K. If an element of C maps to zero in every generic jet, it belongs to every H_n. For any q, choose n with J_(i,n)⊂m_i^q for all i; then H_n⊂m_C^q. Separatedness of C forces that element to vanish. This constructs the injection of Z22.

**The generic target (Z19, Z21, Z23).** Completion of a Noetherian regular local ring preserves its dimension and cotangent space, hence regularity. At our rational point, K is already a specified coefficient field. Choose regular parameters once for each point completion. The coefficient-preserving power-series theorem [0C0S](https://stacks.math.columbia.edu/tag/0C0S) identifies it with K[[X_i]]: successive approximation gives surjectivity, and a nonzero kernel would lower the dimension. These fixed choices identify the entire system of generic jets, not just unrelated individual levels.

The nth tensor jet is now K[all X]/Σ_i(X_i)^n. If m denotes the ideal of all variables, then

\[
 m^{h(n-1)+1}\subseteq\sum_i(X_i)^n\subseteq m^n.
\]

The inverse limit is consequently the formal power-series ring in all the variables, which is a domain. The injection of Z22 and the induced retraction C→O prove Z12. The empty family gives C=O separately. The map into the generic formal ring is an algebraic injection; it is not claimed continuous from the maximal-ideal topology of C to the parameter-adic topology with discrete coefficient field K.

One must also avoid interchanging localization with this inverse limit. Already O[[X]][1/π] is a proper subring of K[[X]]: the series Σ_nπ^(−n)X^n has unbounded denominators. The argument constructs a map to lim_n(D_n⊗K); it needs neither surjectivity nor equality with (lim_nD_n)⊗K.

A concrete acceptance model is R=O[[x,y]]/(πy−x²), with its origin retraction. Using the basis 1,x over O[[y]] embeds it in K[[X]] by x↦X, y↦X²/π. The two parity classes of powers of X prove injectivity. Its generic point completion is K[[X]]. The saturated jet Q_n has the O-basis

\[
 \{y^j:2j<n\}\;\cup\;\{xy^j:2j+1<n\},
\]

of rank n. In particular y∈J_2 but y∉P², and the class of y in R/P² is nonzero π-torsion. This detects exactly the unsaturated-quotient mistake. The contrasting ring O[[x]]/(πx) has x in every J_n; it checks the role of the domain hypothesis in separation.

The reviewed AUDIT-17 row and the existing R03.1/R03.3/R03.6 layer descriptions were read before assigning ownership. All new missing complete-local results go to **DeformationAndDerivedPatchingAlgebra:R03.1**; Z24 imports the construction that layer already plans. Its foundational regular-completion/coordinate lemmas must precede the domain application, without a dependency on later arithmetic patching. The general topological tensor carrier is shared with AdicSpacesPartII:R0 under matching hypotheses.

| New library item | Actual declaration at Mathlib 082e2d3 | Role here |
| --- | --- | --- |
| L03 | `IsHausdorff.of_isLocalRing` | Point-local injectivity and closed submodules |
| L04 | `Module.basisOfFiniteTypeTorsionFree'` | Finite free saturated jets over a DVR |
| L05 | `MvPowerSeries.eval₂Hom`, `continuous_eval₂`, `eval₂_unique` | Continuous power-series maps with their actual topology hypotheses |
| L06 | `AdicCompletion.map_exact`, `map_injective`, `map_surjective` | Finite-module exactness over a Noetherian presentation ring |
| L07 | `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` | Completeness of finite modules over a complete Noetherian ring |

The six inspected source files, including the regular-local definition, were byte-compared with raw GitHub at the full pin; paths, hashes and public links are in `libraryAudit.completeLocalContinuation`. Searches of both pinned trees did not supply the whole Chevalley/saturated-jet/regular-coordinate package. This is a bounded audit, not a global absence certificate.

The complete-local proof is now decomposed, but implementation closure is still partial: exact baseline or supplier declarations for Noetherian completion, dimension and cotangent comparison, and power-series dimension remain to audit in Z19/Z23/Z24. The Taylor/adjugate/convergence supplier work for Z06 and the analytic descent/fiber/completion work for Z10/Z13/Z14 remain open. No finding E1–E35 was changed or independently reviewed.

## Computational checks and their limits

Exact integer/Fraction regressions checked 2,500 opposition product pairs and the central-character, missing tensor-factor, contraction, tame-unipotent and genericity counterexamples. The later component theorem's bound was checked against the repaired earlier bound on 2,431 regular Hodge tuples in ranks 2–5 with maximum weight at most 10. These tests support the recorded repairs; they are not Lean proofs.

For Appendix B, SymPy 1.14.0 over `Q(a,b)` verified:

1. Every listed special-fibre component ideal annihilates the three chart equations.
2. Ten table ideals annihilate all seven normalization relations; the double-cover row retains the inherited quadratic equation in W, as it should for an ideal in the normalization quotient.
3. All seven normalization relations vanish after substituting `W=-t*d21/c22` in the chart's fraction field.
4. `t^3` lies in the Jacobian ideal in the chart quotient.

These calculations do not certify minimality/primality, scheme multiplicities or all specializations over `Z[a,b,1/P]`. The localized integer certificates and the exceptional Groebner cases remain explicit obligations. In particular, a computation over `Q(a,b)` may invert additional parameter polynomials.

Several short, reproducible mathematical regressions are worth preserving:

- E2/E3: for GL2/F7 with eta=(1,0), the lowest-alcove Serre presentation `(1,(3,0))` has central exponent 2; residual inertia with mu=(2,0) has determinant exponent 3. This fixes the omitted eta and the residual sign independently.
- E4: for GL2/F11, lambda=(1,1), type translation `(5,0)` and residual translation `(7,1)`, the prescribed admissible pair exists but central exponents 5 and 7 forbid the printed untensored intersection. Tensoring by W(lambda) restores exponent 7.
- E15: for GL2/F19, lambda=(6,0) and `R_s(7,0)` with s the transposition, the printed 6-generic bound permits the constituent `F(6,6)`. It is not 1-deep, so its component is outside Definition 4.6.1's domain. The safe bound is `max(2n,h_lambda+n-1)`. In Theorem 7.4.2, `h_lambda <= h`, and `max(2n,h_lambda+n−1) <= max(2(h+1),4n+h)`, so the stated later bound covers the repair directly.
- E19: an unramified Frobenius matrix `[[1,1],[0,1]]` over F5 is tame and nonsplit. Generic multiplicity-free inertia needs a separate argument before the semisimple proof applies.
- E25: p=11, a=3, b=8 lies on the allowed localized parameter locus. The actual exceptional coefficient `(a-b)(a-1)-1` is zero; the printed alternative is 6.
- E26: p=101 and mu=(90,30,0) give shifted positive-root differences 61,31,92. The weight is 5-deep but not 10-deep, although the printed raw cyclic polynomial is nonzero. This refutes that sufficient-polynomial assertion, not the comparison theorem itself under explicit 10-depth.

## Remaining work

This is a checkpoint because the extraction cannot yet support the protocol's no-gap completion standard. In particular, a routed inventory is not a substitute for exact imported theorem statements. Continue with the structured `gaps` and the handoff: finish primary inputs, split bundled results, complete the atom audit and phase dependencies, and refine the grouped APIs into declaration-level plans. The general conjectures in §8 and §9 must remain labelled conjectural.

The remaining uniform CAS certificates are also mathematical proof obligations, not evidence that the source statements are false. Do not silently turn an unverified computation into a new source error.

## Proposed routes

### 1. RootSystemsPartIIDominanceAndDemazure

Reuse the affine combinatorics candidate already proposed by HE18, HE21, KPZ26 and Zhu17. The finite-root and Coxeter infrastructure at the pins does not supply the extended affine, central-coset, upper-arrow and admissible-pair package.

Reuse RootSystemsPartIIDominanceAndDemazure, preserving its existing HE18/HE21/KPZ/Zhu obligations. Add the extended affine group with central directions, eta-shifted p-dot action, length, Bruhat and upper-arrow orders, regular alcoves, admissibility, reduced products and admissible pairs of LLHLM23 §2.1. Prove the equivalent criteria of Proposition2.1.6 with lambda+eta in both translation bounds, and Corollary2.1.7 modulo X0; supply the reversed restricted-factor version. Opposition is an order equivalence and an anti-homomorphism, not a homomorphism for the same target multiplication. Derive numerical and polynomial genericity transport with the actual loss under small factors. Import finite root data and Coxeter length/order from Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems); do not duplicate their implementation. Export the affine combinatorics to the modular representation and local-model owners. Test rank one, GL2 central translations, an explicit noncommuting star product and empty nonregular admissible subsets. Suggested file: TauCeti/RepresentationTheory/RootSystems/Affine/AdmissiblePairs.lean. Planets: Admissible pairs; Alcove depth; Affine opposition.

Items: N02, N03, N04, N05, N06, N07, N08, N09, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N24, N26, M10.

### 2. PotentialAutomorphyInfrastructure

Integral Weyl/dual Weyl modules and the relevant linkage machinery already lie in PA.1. The finite reductive modular owner imports this coefficient-module interface and reconciles it with ReductiveGroupsIntegralRepresentationsPartII; characteristic-zero Young symmetrizers are insufficient.

Layers: `PotentialAutomorphyInfrastructure:PA.1`.

Items: N22.

### 3. ModularRepresentationsOfFiniteReductiveGroups

Reuse the LLHLM20 candidate merged in PR2197. Add the all-rank generic finite-group combinatorics without building a second finite reductive representation roadmap.

Reuse ModularRepresentationsOfFiniteReductiveGroups from PAPER-LE-LEHUNG-LEVIN-ETAL-20. Retain its GL3 lattice/Ext obligations, but put the present all-rank common foundation before those specialized consumers. Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), RootSystemsPartIIDominanceAndDemazure, and integral Weyl modules from PotentialAutomorphyInfrastructure PA.1, coordinating the common rational-module carrier with ReductiveGroupsIntegralRepresentationsPartII. Build good Deligne–Lusztig pairs, sign-normalized characteristic-zero representations, reduction in the Grothendieck group, restricted Serre weights, compatible central lifts, lowest-alcove presentations, outer weights and covering. Prove LLHLM23 Propositions2.3.7–2.3.12 and2.6.2–2.6.6 under their explicit numerical bounds. Correct Proposition2.6.4 to retain tensor W(lambda). The Herzig recipe imports tame inertia/type realization from LocalGaloisDeformationRings and SmoothRepresentationsPartII; it must not assume any global Serre conjecture. Distinguish constituent sets from multiplicities and covering from an arbitrary linkage relation. Test determinant twists in GL2/F11, quotienting by (p-pi)X0, the p19 constituent-depth counterexample and the covering length/equality criterion. Suggested file: TauCeti/RepresentationTheory/FiniteReductive/GenericSerreWeights.lean. Planets: Lowest-alcove presentations; Deligne–Lusztig constituents; Herzig weights; Serre-weight covering.

Items: N01, N23, N25, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71.

### 4. SmoothRepresentationsPartII

Reuse the existing smooth representation Part II; it already receives depth-zero Deligne–Lusztig types from Newton–Thorne and local type theory from Fintzen/Bushnell–Henniart. These are local K-types, not the modular finite-group reduction theorem.

Extend the existing SmoothRepresentationsPartII proposal. Construct Weil–Deligne inertial parameters with their Weil extension and nilpotent operator, the componentwise dominance order on inertia-isotypic Jordan partitions, and the sigma(tau) of LLHLM23 Theorem2.5.4. Split occurrence-implies-dominance, exact-type multiplicity one, and the converse for generic representations; maximal monodromy is required for the final multiplicity-one converse. Prove Proposition2.5.5 for a simultaneous compatible choice of types, using Bushnell–Kutzko, Schneider–Zink and Pyvovarov. Import Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.0–SR.2), classical LLC from EndoscopicTransferAndUnitaryTraceComparison ET.6, and Deligne–Lusztig representations from ModularRepresentationsOfFiniteReductiveGroups. Construct the virtual Shotton type when needed by the BM consumer; it may have negative Grothendieck coefficients. Test zero versus maximal monodromy and GL2 principal-series versus Steinberg. Suggested file: TauCeti/RepresentationTheory/Smooth/InertialTypes.lean. Planets: Inertial type; Monodromy dominance; Type multiplicity one.

Items: N56, N57, N58, N59, N60, N61.

### 5. LocalGaloisDeformationRings

L7 owns arbitrary-rank bounded-height Frobenius lattice moduli and their maps to fixed Hodge/inertial-type deformation rings. Add these explicit tame-descent, gauge and residual local-model source obligations there; reserve the true-monodromy polynomial comparison and generic domain theorem for the distinct Part II below. Ordinary lifts use the existing local ordinary infrastructure.

Layers: `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.3`.

Items: N49, N50, N51, N52, N53, N54, N55, K01, K02, K03, K04, K05, K06, K07, K08, K09, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20, K21, K22, K23, K24, K25, K26, K27, K28, K29, K30, K31, K32, K33, K34, K35, K36, K37, K38, K39, K40, K41, K42, K43, K44, P01, P02, P14.

### 6. GeometricSatakeLocalModelsPartII

Reuse the KP18/KPZ26/Kisin–Zhou integral local-model proposal for the underlying universal loop spaces, Schubert varieties and coordinates. Differential equations and Galois comparison are not part of this base-geometry route.

Reuse GeometricSatakeLocalModelsPartII and its integral Pappas–Zhu base geometry. Add LLHLM23 universal GLn Iwahori over Spec Z[v], completed positive/full/negative loop functors, fpqc Grassmannian, determinant/height bounds, affine-element charts, square-zero Lie splitting and the explicit finite-type chart equations. Retain the functorial Noetherian/completeness assumptions and distinguish sheaf quotients from quotients of R-points. Prove formal etaleness, bounded open immersions, global Schubert orbit projections and the reduced admissible special fibre of the underlying PZ model. These import the affine Weyl owner and ReductiveGroupsPartII parahoric group schemes; no differential local model is automatically reduced. In Proposition3.2.8 allow empty nonpivot coefficient ranges, correcting the printed all-entry nonemptiness assertion. Test n=2, z=1, h=0: the identity matrix exists despite empty off-diagonal ranges. Suggested file: TauCeti/Geometry/LocalModels/UniversalIwahoriCharts.lean. Planets: Universal Iwahori; Negative-loop chart; Pappas–Zhu local model.

Items: U01, U02, U03, U04, U05, U06, U07, U09, U10, U11, U12, U13, U14, U17, M01, M12, M13, M14, M15, M16, M17.

### 7. SchemeAndStackFoundations

Reuse the general deformation/birational, descent and cycle owners for Artinian point criteria, normalization, contraction, generic spreading, Elkik approximation and generic-point-length cycles. The source is a set of precise additional obligations, not a claim that the broad roadmap has already decomposed their proofs.

Layers: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`.

Items: U08, U24, U26, U29, U32, U33, U34, U35, U36, U37, U38, G14, G19, G20, B07, Z03, Z04, Z05, Z06, Z07.

### 8. DeformationAndDerivedPatchingAlgebra

Complete local coefficient tensors, depth, support and patching algebra are shared infrastructure. U43 now imports the original KWII theorem and its domain-only complete-DVR adapter, Z11–Z12. The affinoid completed product has its own AdicSpacesPartII route. Exact supplier contracts remain open.

Layers: `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:R03.6`.

Items: U42, U43, P03, Z11, Z12.

### 9. WeightZeroCrystallineLiftingRings

Reuse the Emerton–Gee foundational portion already required by the weight-zero lifting candidate; do not introduce a second representation stack or component labelling.

Reuse WeightZeroCrystallineLiftingRings from PAPER-BOXER-CALEGARI-GEE-ETAL-25. Its common initial stages own the Noetherian formal stack of etale (phi,Gamma)-modules, algebraic reduced stack, crystalline and potentially crystalline closed formal substacks, versal framed deformation rings, component dimensions and Serre-weight labelling. LLHLM23 consumes those stages before any weight-zero generic-reducedness or automorphy endpoint, so no dependency cycle is introduced. Use Emerton–Gee arXiv:1908.07185v4 with the current author errata: E contains K, universal unramified Frobenius coefficient has prescribed norm, boundary characters require unramified twists, and Theorem5.5.12 uses the replacement induction. Theorem6.5.1 gives component dimension [K:Qp]n(n-1)/2; regular Hodge stacks have total dimension one plus that. Translate the dual/det^(n-1) Serre labels and the opposite Hodge sign used by LLHLM23. Import SchemeAndStackFoundations, FiniteFlatGroupsAndIntegralPadicHodgeTheory and LocalGaloisDeformationRings L7. Suggested file: TauCeti/NumberTheory/Galois/EmertonGee/Components.lean. Planets: Galois representation stack; Serre-labelled component; Crystalline versal ring.

Items: G12, G13, G15, G16, G32.

### 10. CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity

Reuse the CEGGPS all-rank patching candidate. The extra source obligation is the exact weak/detectable/minimal functor interface and arbitrary away-from-p-level construction, not another abstract patching roadmap.

Reuse CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity and its CEGGPS construction. Add LLHLM23 Definition6.2.1 as distinct interfaces: nonzero exact weak functor with maximal Cohen–Macaulay type evaluations, weak minimal rank at most one, potentially diagonalizable, detectable on obvious weights, and minimal rank exactly one for a specified type set. Prove Propositions6.2.3–6.2.9 before using generic domain geometry to upgrade weak minimality. Add AppendixA construction for arbitrary away-from-p level: polarized deformation data, adequate auxiliary primes, diamond groups, projectors, ultrafilter modules, exact Pontryagin-dual functor and the support theorem. Keep g=q-[F+:Q]n(n-1)/2. Import GlobalGaloisDeformations G7, DeformationAndDerivedPatchingAlgebra R03.1/R03.3/R03.5/R03.6, PotentialAutomorphyInfrastructure PA.4 and CompletedCohomologyPartII CC.1–CC.3/CC.8. Share these pre-lattice functor stages with GenericGL3SerreWeightsAndLattices. Exactness and MCM do not imply rank one; minimality and detectability remain explicit. Suggested file: TauCeti/NumberTheory/Automorphy/PatchingFunctors.lean. Planets: Weak patching functor; Detectability; Arbitrary-level patching.

Items: P04, P05, P06, P07, P08, P09, P10, P11, P12, P13, P15, P16, A01, A02, A03, A04, A16, A17, A18, A19, A20, A21, A22, A23, A24.

### 11. GlobalGaloisDeformations

The polarized group, local conditions, Selmer tangent complex, framed global ring and adequate Taylor–Wiles primes are already the direction of G7 and the specified deformation layers. This source adds the exact fixed-multiplier tangent and generator formulas, with corrections E22–E24.

Layers: `GlobalGaloisDeformations:R04.1`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:G7`.

Items: A05, A06, A07, A08, A09, A10, A11, A12, A13, A14, A15.

### 12. PolarizedAutomorphyLifting

Reuse the polarized definite-unitary automorphy-lifting candidate from Boxer–Calegari–Gee, Fakhruddin–Khare–Patrikis and Newton–Thorne. Add the polynomial-generic domain specialization, rather than creating another automorphy endpoint.

Reuse PolarizedAutomorphyLifting. Add LLHLM23 Theorem9.2.1 with every standing CM, split-at-p and unramified-at-p assumption: a finitely ramified polarized lift r, regular potentially crystalline local type (lambda+eta,tau), polynomial-generic tame tau, semisimple residual restrictions at p, adequate residual image over F(zeta_p), zeta_p not in the adjoint fixed field, and a residual RACSDC automorphic lift with matching weight and K-types. The conclusion is automorphy of r with the specified weight and type. The genericity polynomial depends on the weight bounds and coefficient ramification, not on p. Import LocalGaloisDeformationRingsPartIIMonodromyModels for domain-or-zero versal rings at semisimple points and the all-rank CEGGPS patching candidate for support. Prove Remark9.2.2 only after the generic Serre-weight theorem supplies change of weight; do not make that weaker initial-weight hypothesis part of the first theorem. Preserve existing Thorne/BLGGT targets and normalization adapters. Suggested file: TauCeti/NumberTheory/Automorphy/GenericLocalDomains.lean. Planets: Generic local domain; Polarized modularity lifting.

Items: V12, V13.

### 13. GenericGL3SerreWeightsAndLattices

Reuse and broaden the pre-lattice common stages of the LLHLM20 candidate to the all-rank generic Breuil–Mezard/Serre theory. Keep its specialized GL3 integral-lattice endpoint separate; the legacy candidate id does not restrict the shared foundation to rank three.

Reuse GenericGL3SerreWeightsAndLattices from LLHLM20, broadening its common pre-lattice foundation to LLHLM23 §§8–9 in arbitrary rank; retain its rank-three lattice conclusions with their own stronger hypotheses. Import finite-group constituents and covering from ModularRepresentationsOfFiniteReductiveGroups, representation stack components from WeightZeroCrystallineLiftingRings, local monodromy comparisons from LocalGaloisDeformationRingsPartIIMonodromyModels, generic-point-length cycles from SchemeAndStackFoundations SF.5, and the exact weak/minimal functors from the existing all-rank CEGGPS patching candidate. Build geometric and versal BM interfaces, component-meeting testing sets, irrelevant weights, relative spanning systems, truncation idempotents, rational inversion and effectivity descent. Theorem8.3.5 needs rank-one minimal patching and component-meeting points. Theorem8.4.10 gives canonical supported generic cycles via semisimple pullbacks; polynomial-type equations alone have uniqueness only in the stronger Proposition8.6.5 range. Corollary8.5.2 allows wild residual representations with sufficiently generic semisimplification, and virtual tame WD types with signed coefficients; it does not extend the tame domain theorem. For finite Lambda containing zero retain all shifted polynomial and depth bounds. Prove the unit leading coefficient, triangular integral basis and the corrected defect recursion excluding the target weight. Finally prove Theorem9.1.6 for automorphic residual definite-unitary data, F+ not Q, p not dividing 2n, split unramified p-places, adequate image over F(zeta_p), and tame polynomial-generic local parameters, allowing arbitrary away-from-p level. Separate general conjectures from these proved cases. Order common patching and generic BM before GL3 lattice consumers to avoid a globalization/lattice cycle. Suggested files: TauCeti/NumberTheory/Galois/GenericBreuilMezard.lean and TauCeti/NumberTheory/Automorphy/GenericSerreWeights.lean. Planets: Breuil–Mézard cycle; Minimal patching; Generic Serre weights; Defect recursion.

Items: B01, B02, B03, B04, B05, B06, B08, B09, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31, B32, B33, B34, B35, B36, B37, V01, V02, V03, V04, V05, V06, V07, V08, V09, V10, V11.

### 14. LocalGaloisDeformationRingsPartIIMonodromyModels

L7 supplies bounded-height lattices and fixed-type rings; the new theorem family is the comparison with differential local models, their generic unibranchness, component geometry and true-monodromy approximation. This differs from the existing unrestricted-ring normality and rank-two Barsotti–Tate candidates.

Build on LocalGaloisDeformationRings L7, importing its bounded-height Kisin stacks, tame descent, gauge bases and fixed-type lifting rings. Import integral PZ/loop geometry from GeometricSatakeLocalModelsPartII, affine admissibility from RootSystemsPartIIDominanceAndDemazure, modular finite-group theory from ModularRepresentationsOfFiniteReductiveGroups, scheme normalization/Elkik lemmas from SchemeAndStackFoundations, completed-tensor algebra from DeformationAndDerivedPatchingAlgebra and the common Emerton–Gee foundation from WeightZeroCrystallineLiftingRings. Construct the universal differential locus, naive intersections and flat closures separately. Prove flag generic fibres, contracting chart actions, spreading of normality and product unibranchness with the ramification-index bound; give the Type A affine Springer fixed-point input its own source-bound leaf. Develop residual differential cells, intrinsic C_(w,omega), Serre labels and torus lifts with all genericity bounds, including the corrected Theorem4.6.2 bound max(2n,h_lambda+n-1). Construct analytic monodromy, the convergent recurrence, true flat-closure ideal and basis-dependent truncated ideal; prove the precision containment before Elkik comparison. The exact endpoint is Theorem7.3.2 for regular lambda_j in [0,h]^n and unramified local fields: numerical N_sing gives a noncanonical closed immersion, and a nonzero integral polynomial depending on the Hodge set and coefficient ramification gives the completed regular chart isomorphism and domain-or-zero versal rings at semisimple residual points. Do not claim global canonical gluing or wild-point domains. Prove Theorem7.4.2 component support under max{2(h+1),4n+h}-depth and Proposition7.4.7 with its separate fixed-point polynomial hypothesis. Include the rank-three AppendixB chart, localized equations, normalization and dense branching locus as concrete tests; uniform CAS identities need certificates. Suggested files: TauCeti/NumberTheory/Galois/LocalModels/Differential.lean, Monodromy.lean and GenericComparison.lean. Planets: Differential local model; True monodromy; Generic local-model comparison; Serre-labelled component; Rank-three normalization.

Items: U15, U16, U18, U19, U20, U21, U22, U23, U25, U27, U28, U30, U31, U39, U40, U41, M02, M03, M04, M05, M06, M07, M08, M09, M11, M18, M19, M20, M21, M22, M23, M24, M25, M26, M27, M28, M29, M30, M31, M32, M33, M34, M35, M36, M37, G01, G02, G03, G04, G05, G06, G07, G08, G09, G10, G11, G17, G18, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30, G31, G33, G34, G35, G36, G37, Q01, Q02, Q03, Q04, Q05, Q06, Q07, Q08, Q09, Q10, Q11, Q12, Z01, Z02.

### 15. AdicSpacesPartII

The affinoid completed-tensor, rational-fiber and regular-product interfaces belong to the existing analytic product owner. They differ from complete local coefficient tensors in R03.1. Import the upstream AdicSpaces carrier; add the precise missing product statements, preserving finite-extension geometric connectedness and the regularity supplied by smooth generic charts.

Layers: AdicSpacesPartII:R0, AdicSpacesPartII:F0.

Items: Z08, Z09, Z10, Z13, Z14.

## Recorded source findings

These findings await independent review. Their full locator, quotation/formula, correction, evidence, scope and correction-search record are in `sourceIssues`. An existing correct formulation is distinguished from an erratum of the present paper.

### E1 — misprint (a stated result)

Published PDF33, following Definition 2.1.9; arXiv v2 PDF24

Printed: `"isomorphism" of partially ordered groups, with (t_nu w)^*=w^-1 t_nu.`

Use an order-preserving anti-isomorphism; equivalently a group isomorphism into the opposite group, with (xy)^*=y^*x^*.

For GL2, s=(12), nu=(1,0), (t_nu s)^*=t_(0,1)s whereas (t_nu)^*s^*=t_(1,0)s. Exact integer semidirect-product computation verifies the reversed-product law on 2500 pairs. The cited 2019 source explicitly calls the map an antihomomorphism and proves order preservation.

Known correction: Correct formulation already in Le–Le Hung–Levin, Weight elimination in Serre-type conjectures, Definition2.1.2 and Lemma2.1.3, published PDF8/printed2440, https://math.rice.edu/~bl70/WEpaper.pdf

### E2 — misprint (a stated result)

Published PDF38, Lemma2.2.4; arXiv v2 PDF28

Printed: `w1 t_omega modulo W_a.`

Use the coset of t_(omega-eta) w1, as prescribed by (2.7); the missing eta shift is essential.

GL2 over F7, w1=1, omega=(3,0) yields F(omega-eta)=F(2,0), of central exponent2 modulo6. The printed coset gives3. The earlier formula (2.7) gives2.

Known correction: new

### E3 — misprint (a stated result)

Published PDF47 Remark2.4.2, residual determinant formula; PDF48 Lemma2.4.4 residual paragraph; arXiv v2 PDF35

Printed: `(zeta-eta|_Z) composed with baromega_1.`

In the residual compatibility formula use zeta+eta|_Z. Keep the different E-valued and F-valued compatibility definitions themselves.

For GL2/F7, s=1, mu=(2,0), eta=(1,0), the 1-generic residual type has inertia diag(baromega_1^3,1). Its determinant exponent is3; zeta=2, so the printed minus gives1.

Known correction: new

### E4 — error (a stated result)

Published PDF53 Proposition2.6.4; arXiv v2 PDF38

Printed: `W?(rhobar) intersect JH(barsigma(tau)).`

The left side must be W?(rhobar) intersect JH(barsigma(tau) tensor W(lambda)). Keep the right-hand presentation criterion.

GL2/F11, eta=(1,0), lambda=(1,1), w(tau)=t_(5,0), w(rhobar)=t_(7,1), w=w1=1, w2=w_h t_(-1,-1), omega=(7,1). Both presentations are2-generic and lambda-compatible, and the right-side equalities and arrow relations hold. The printed left side is empty by central characters7 versus5 modulo10; tensoring by det changes5 to7. The proof and both subsequent corollaries use precisely that tensor.

Known correction: new

### E5 — misprint (the proof)

Published PDF53 Corollary2.6.5 proof; arXiv v2 PDF38

Printed: `w=w2.`

The equality forced in this step is w=w1; w2=t_(-w0 lambda) w_h w.

The witnesses in E4 have w=w1=1 but w2=t_(-1,-2)s, which is not1. The corrected equality gives the obvious-weight criterion needed for the conclusion.

Known correction: new

### E6 — misprint (the proof)

Published PDF32 Proposition2.1.6 proof, first paragraph

Printed: `w2^-1 w0 w1 <= t_(barw1^-1 eta).`

Replace eta on this symmetric upper bound by lambda+eta.

The statement contains both lambda+eta bounds. The preceding nonsymmetric bound has lambda+eta, and applying the stated symmetric argument cannot discard lambda.

Known correction: new

### E7 — error (a stated result)

Published PDF60, sentence after Proposition3.2.8

Printed: `h+nu_j-[i>j]-[i<w(j)] >= 0 for all i,j as a necessary nonemptiness condition.`

Allow empty nonpivot coefficient ranges. Require only each pivot to occur: h+nu_j-[w(j)>j]>=0 for all j; these also give the distinguished point at t=0.

For n=2,w=1,nu=0,h=0, A=I satisfies the chart equations and determinant condition. Both off-diagonal coefficient ranges are empty and their upper bounds are-1. The printed necessary condition rejects this existing chart.

Known correction: new

### E8 — misprint (the proof)

Published PDF72 Lemma3.4.7 proof, coordinate expansion

Printed: `N(nu_j-[i>j]-k)+mu_i-mu_w(j).`

For the displayed one-parameter subgroup the coefficient weight is N(nu_j-[i>j]-k)+mu_w(j)-mu_i. Reverse both mu signs in the expansion and ensuing discussion.

Substitute the chosen D=Ad(w^-1)(r^mu) into Lemma3.4.6: the left diagonal factor is r^-mu_i and the right factor is r^mu_w(j). For n2,w1,nu0,mu(1,0),N2, i2,j1,k-1 the actual weight is+1, while the printed weight is-1. Corrected weights contract every nonpivot coordinate.

Known correction: new

### E9 — error (a stated result)

Published PDF70 Remark3.4.3(2)

Printed: `Y Noetherian and excellent: unibranch at y iff completed local ring is a domain.`

Require the local ring to be reduced, or apply the domain assertion to the completion of its reduction. For excellent local rings the branch-count result alone does not supply reducedness.

The excellent ring k[epsilon]/epsilon^2 is unibranch by Definition3.4.2 but is already complete and is not a domain. The intended local models here are integral/reduced. Stacks Tag0C2E, Lemma15.110.8, read on2026-09-23, preserves branch counts rather than eliminating nilpotents.

Known correction: new

### E10 — gap (the proof)

Published PDF76 Proposition3.5.2 proof, lifting to U3

Printed: `Spec R -> U3 is obtained from completeness of R.`

First pass, if necessary, to a finite unramified faithfully flat complete DVR extension giving a residue-field point of the étale cover, then use the henselian lifting property and descend flatness/normality.

The finite étale cover Z3[x]/(x^2+1) of Spec Z3 has no Z3-point, since x^2+1 has no zero modulo3. Completeness does not create the missing residue-field point. This is a proof gap, not a counterexample to the proposition.

Known correction: new

### E11 — misprint (the proof)

Published PDF74 Lemma3.5.8, statement and proof opening

Printed: `f:Spec R -> U; M_R=M times_(X times S,f) (X times U).`

Use f:Spec R -> X times U and M_R=M times_(X times S) Spec R. In the proof, shrink the parameter base S to obtain geometric normality of its fibers, as in Lemma3.5.7.

U is an étale S-scheme and does not carry the required chosen value of v from X. The printed fiber product is not over Spec R and therefore cannot have the asserted property of the DVR specialization.

Known correction: new

### E12 — misprint (the proof)

Published PDF61 Lemma3.3.1 proof

Printed: `h(v g' g^-1+g D g^-1); dh/dv in L^+M.`

Append h^-1 to the displayed conjugated summand and use v dh/dv in L^+M for the integral derivative term.

Leibniz gives v(hg)'(hg)^-1=v h'h^-1+Ad(h)(v g'g^-1). For h=I+v E21, h'=E21 is not in the lower-v-divisible Iwahori Lie module, but v h' is.

Known correction: new

### E13 — misprint (a stated result)

Published PDF85 Corollary4.2.12

Printed: `degree d_{alpha,w}.`

The coefficient polynomial has degree at most d_{alpha,w}, with the stated zero convention for negative bounds.

The identity element gives the zero coefficient polynomial even for a nonnegative bound, and a nonleading coordinate may vanish. The preceding paragraph already introduces degree bounds.

Known correction: new

### E14 — misprint (the proof)

Published PDF92 Theorem4.3.9 proof, first identification of C

Printed: `C_(w1,w2^-1 s(0)).`

Use C_(w1,s w2^-1(0)), matching the statement and final displayed identity.

Proposition4.3.5 moves the right translation to s w2^-1, in that order; affine translations and Weyl factors do not commute. The first identification reverses their order.

Known correction: new

### E15 — error (a stated result)

Published PDF95–96 Theorem4.6.2; arXiv v2 PDF69

Printed: `max{2n,h_lambda}-generic.`

A sufficient repaired hypothesis is max{2n,h_lambda+n-1}-generic. This both makes all component labels (n-1)-deep and meets Theorem4.3.10.

GL2/F19, eta=(1,0), lambda=(6,0), R=R_s(7,0) with s=(12) has a6-generic presentation mu=(6,0), satisfying the printed bound. The admissible pair w1=1,w2=w_h t_(-5,0) maps to omega=(7,6) and sigma=F(6,6)=det^6, which is not1-deep, so C_sigma^zeta is outside Definition4.6.1. For Theorem7.4.2, every regular Hodge tuple in[0,h] has h_lambda<=h, and max{2n,h_lambda+n-1}<=max{2(h+1),4n+h}. The later theorem's stated stronger bound therefore covers this repair directly.

Known correction: new

### E16 — error (a stated result)

Published PDF105 Lemma5.1.10(c)

Printed: `Y upper triangular modulo v implies Ad(s_j^-1 v^(mu_j+eta_j))(Y) in v^(m+1) Mat_n(R[[v]]).`

Require Y strictly upper triangular modulo v, and apply the adjoint operator to phi(Y). This is the Lie(I_1) analogue of part(a), the version used in Proposition5.2.7.

Y=I satisfies the printed hypothesis and is fixed by conjugation, contradicting the conclusion for m>=0. Strictness alone is insufficient: Y=v E21 can lose valuation under conjugation. Frobenius changes v to v^p, supplying the missing valuation bound.

Known correction: new

### E17 — misprint (the proof)

Published PDF109 Lemma5.2.2 uniqueness proof

Printed: `I_j=A1_j Ad(z_j)(phi(I_(j-1))^-1) A1_j^-1.`

Remove the inverse on phi(I_(j-1)) in this rearranged fixed-point equation and in the subsequent equalities.

PDF108 defines X_j=I_j A1_j Ad(z_j)(phi(I_(j-1))^-1) A1_j^-1. With X=1, solving for I_j gives A1_j Ad(z_j)(phi(I_(j-1))) A1_j^-1. The same contraction proves uniqueness after the repair.

Known correction: new

### E18 — misprint (the proof)

Published PDF112 Proposition5.2.7 proof, description of Lie I1(J)

Printed: `"unipotent upper triangular" modulo v.`

Use strictly upper triangular (nilpotent upper triangular) reduction, including zero diagonal.

A Lie module is an additive module containing zero; a matrix with diagonal ones cannot specify its elements. Linearizing the defining I1 congruence gives strictly upper triangular matrices, agreeing with corrected Lemma5.1.10(c).

Known correction: new

### E19 — error (a stated result)

Published PDF122 opening of §5.5

Printed: `rhobar tame, i.e. rhobar=rhobar^ss.`

Semisimple residual representations are tame; the converse is false in general. Retain explicit semisimplicity where used, or prove the additional generic multiplicity-free inertia condition makes a tame representation semisimple.

The unramified two-dimensional representation with Frobenius [[1,1],[0,1]] over F_p has trivial inertia, hence is tame, but is not semisimple. Later domain statements are proved at semisimple points; generic tame applications need the elementary distinct-inertia-character argument.

Known correction: new

### E20 — misprint (the proof)

Published PDF130 Lemma6.2.8 proof

Printed: `Hodge–Tate weights "increase along the diagonal".`

Under this paper's convention HT(epsilon)=+1, the displayed diagonal characters have weights n-i, hence decrease. Translate the sign when invoking Berger's convention.

The finite-order Teichmüller factors have Hodge–Tate weight0 and chi_i contains epsilon^(n-i). For n2 the successive weights are1,0. The actual lifted characters and conclusion need no reversal.

Known correction: new

### E21 — misprint (the proof)

Published PDF179 equation(8.3)

Printed: `sum_{kappa in W?(rho) intersect JH(barsigma(tau))} [barsigma(tau):kappa] Z_kappa(rho)^gen.`

Exclude kappa=sigma from this subtracted sum.

Exactness gives Z_tau=sum_kappa m_kappa Z_kappa. Isolating m_sigma Z_sigma subtracts only the other terms. As printed the right side is zero and also still depends on the unknown target, defeating the defect induction.

Known correction: new

### E22 — error (a stated result)

Published PDF192 §A.3.3, reduced tangent definition

Printed: `Hom_O(m_A/m_A^2,F) = Hom_C_O(A,F[epsilon]/epsilon^2).`

The relative tangent is Hom_F(m_A/(m_A^2+varpi A),F), or the equivalent relative derivation space.

Take A=O: the printed Hom is one-dimensional because m/m^2 is one-dimensional over F, whereas there is only one O-algebra map O->F[epsilon]/epsilon^2. The base uniformizer must be killed. PropositionA.3.2 already uses an appropriate relative base-ideal quotient.

Known correction: new

### E23 — misprint (a stated result)

Published PDF192 §A.3.3, local lifting tangent identification

Printed: `D^square_rhobar(F[epsilon]/epsilon^2) = C^1(G_L,ad rhobar).`

Use continuous 1-cocycles, Z^1, for framed first-order liftings. For the unrestricted G_n lifting functor the coefficient module is Lie(G_n); ad rhobar on gl_n is the fixed-multiplier version.

Writing a lift as (1+epsilon c(g))rhobar(g), multiplicativity is exactly c(gh)=c(g)+g c(h), not an arbitrary cochain. The following displayed cochain complex uses C^i in its ordinary cochain sense. The distinction between the gl_n adjoint and full Lie(G_n)=gl_n direct-sum gl_1 is stated at the top of the page.

Known correction: new

### E24 — misprint (the proof)

Published PDF199 §A.5, definition of g

Printed: `g=q-[F:Q]n(n-1)/2.`

For T=S use g=q-[F+:Q]n(n-1)/2, as in PropositionA.3.3.

The sum of local degrees [F_v+:Q_p] over p-adic places of F+ is [F+:Q], whereas [F:Q]=2[F+:Q] for the CM extension. The printed number removes twice the required local term, so the cited presentation bound does not justify the claimed surjections. Restoring F+ restores the ensuing balanced-dimension count.

Known correction: new

### E25 — misprint (the proof)

Published PDF205 AppendixB, exception after the Groebner-basis list

Printed: `(a-b)((a-1)-1)=0.`

The exceptional coefficient vanishes when (a-b)(a-1)-1=0.

The coefficient in the eighth displayed polynomial is b((a-b)(a-1)-1), and b is a unit on V. Over F11 take a=3,b=8: every factor defining V is nonzero, the actual coefficient vanishes because (a-b)(a-1)=1, whereas the printed exceptional expression equals6 and is nonzero.

Known correction: new

### E26 — gap (a stated result)

Published PDF208 CorollaryB.0.5, claimed sufficient polynomial

Printed: `P(X,Y,Z)=product_{m=0}^{10}(X-Y-m)(Y-Z-m)(Z-X-m) for the parameter mu.`

State the verified conclusion with the explicit 10-depth hypothesis. To encode that hypothesis by raw-weight polynomial nonvanishing, evaluate a wall-avoidance polynomial at mu+eta, or shift its arguments by eta. The displayed unshifted polynomial does not imply the required depth.

Definition2.1.10(4) evaluates polynomial genericity on the raw tuple. At p101, mu=(90,30,0) has mu+eta=(92,31,0), so all positive differences lie strictly between5 and96 and the presentation is5-generic, but the highest difference92 violates10-depth. The cyclic differences of raw mu are60,30,11 modulo101, making every displayed factor nonzero. This shows a gap in the claimed sufficient polynomial, not a counterexample to the local comparison with the explicit10-depth hypothesis.

Known correction: new

### E27 — misprint (a stated result)

Cited [59], Shapes and shadows (2018), published PDF23–24 §2.3; corrected in LLHLM23 PDF121 §5.5

Printed: `V*(M)=Hom_phi(M,O_E^un,K).`

For finite projective coefficient families use the coefficient-compatible completed base change and then R-linear dual of Frobenius invariants as in LLHLM23 §5.5. The target and completion must retain R.

The 2018 formula lacks the coefficient algebra and completion in its target; it cannot give the claimed rank-n R-representation functor for arbitrary complete local coefficients as written. The current paper explicitly flags that formula as inaccurate and supplies its corrected family version.

Known correction: LLHLM23 §5.5, published PDF121, https://math.rice.edu/~bl70/LocModels.pdf

### E28 — gap (the proof)

Cited input [22], Emerton–Gee, arXiv:1908.07185v4 Theorem5.5.12, PDF163–167; author errata PDF2–9. Used by LLHLM23 §7.4 PDF155–156.

Printed: `"if we produce closed algebraic substacks" whose points "exhaust" those of X_d,red (start of the original proof).`

Use the authors' replacement induction in the current errata. It proves exhaustion, refines the maximally nonsplit locus and its extension-class conditions, and keeps any forward invocation of Theorem6.5.1 in smaller rank. Also impose the corrected coefficient-field and unramified-character conventions on the stack input.

The authors explicitly state that the original constructions were not shown to cover all residual points; the errata supplies a complete replacement proof and explains how to avoid circular dependence on Theorem6.5.1. This affects the proof imported for the Serre-labelled components, not a counterexample to that theorem.

Known correction: Emerton–Gee, Moduli stacks of (phi,Gamma)-modules: errata, https://www.ma.imperial.ac.uk/~tsg/Index_files/moduli-errata.pdf (all nine pages read 2026-09-23).

### E29 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3, AppendixB.3 PDF9, displayed intersection criterion (PDF image inspected).

Printed: `The displayed lattice intersection is required to be nonzero: "!=0".`

Require the intersection to be zero. Nonemptiness refers to the intersection of the component chart with the attracting open Uy; its lattice transversality condition is a zero vector-space intersection.

LemmaB.1 PDF7 defines the attracting open by zero intersections; PDF11 explicitly describes the required lattice intersection as trivial and the corresponding determinant as nonsingular. The display in PDF9 reverses that condition.

Known correction: The intended zero-intersection criterion is already explicit in the same preprint, LemmaB.1 PDF7 and AppendixB.3 PDF11; no separate correction located.

### E30 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3, LemmaB.2 PDF8, formula for c-prime (PDF image inspected).

Printed: `Denominator of each factor is s_1-s_(i_(l+1)).`

Use s_(i_1)-s_(i_(l+1)); the first eigenvalue index is the start of the increasing path, not the constant1.

For a length-two path i_1=2,i_2=3, the matrix has coefficient1 at A32, so its inverse must have coefficient-1. The printed coefficient is -(s2-s3)/(s1-s3), unequal for distinct s1,s2,s3, while the corrected formula gives-1. The longer-path corrected formula follows the standard unitriangular inverse recursion; that recursion remains a proof leaf of the imported matrix construction.

Known correction: new

### E31 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 AppendixB.5, PDF16–17.

Printed: `The first sentence of PDF17 removes the "first row and the first column".`

Remove the first row and the last column from the displayed matrix on PDF16, up to the cofactor sign; alternatively explicitly permute the final column to the first position before expansion.

The first row of the preceding matrix is (0,...,0,1). Laplace expansion therefore uses its last column. The following displayed smaller matrix is the one obtained from that last-column cofactor. This is a proof-display indexing slip, not a failure of determinant nonvanishing.

Known correction: The following reduced matrix in the same PDF17 already uses the intended cofactor; no separate correction located.

### E32 — misprint (the proof)

Published PDF142, proof of Theorem7.2.2; bibliography PDF210.

Printed: `[23, Theorem4.8.12], [23, Proposition4.8.10], [23, Theorem4.8.14].`

Replace [23] by [22] in these three references.

The paragraph introduces properties established in[22]. The cited numbered results were read in Emerton–Gee arXiv:1908.07185v4 PDF126–129 and give exactly the asserted crystalline-stack construction, versal rings and dimension. Reference[23] is the different 2014 geometric BM paper.

Known correction: Correct source is Emerton–Gee, Moduli stacks of etale(phi,Gamma)-modules and the existence of crystalline lifts, arXiv:1908.07185v4, PDF126–129.

### E33 — misprint (a stated result)

Published PDF195 definition of D_rho^(lambda,tau), used in TheoremA.4.1 PDF196–197; compare§6.1.1 PDF126 and§6.2 PDF127.

Printed: `The local condition for coefficient highest weight lambda is defined using R_rho^(lambda,tau).`

Use Hodge weight lambda+eta. Independently, for a general WD type use the monodromy-dominated quotient as in E34, so the condition is D_rho^(lambda+eta,<=tau).

§6.1.1 explicitly makes the superscript the Hodge type. §6.2 defines sigma(lambda,tau)=V(lambda) tensor sigma(tau) and the associated patched ring using R^(lambda+eta,<=tau). TheoremA.4.1 uses a lattice in the dual of precisely that coefficient type. Already trivial algebraic weight in rank2 corresponds to Hodge weights(1,0), not(0,0). The correction is needed for AppendixA to verify its claimed weak patching axioms.

Known correction: new

### E34 — error (a stated result)

Published PDF195 local deformation condition, TheoremA.4.1 PDF196–197; compare Theorem2.5.4 PDF50.

Printed: `The local condition uses the exact WD type quotient R_rho^(lambda,tau) for an arbitrary Weil–Deligne inertial type tau.`

Use the quotient with WD monodromy <=tau, and the Hodge shift in E33: R_rho^(lambda+eta,<=tau). It coincides with exact type when tau has zero monodromy; equality for arbitrary tau is not implied by occurrence of sigma(tau).

Theorem2.5.4(1) only gives rec(pi)|I<=tau. Its generic converse permits strict inequality: a generic unramified principal series has zero monodromy yet contains sigma(tau_max) for the maximal monodromy type with the same scalar inertia. Thus a K-type cannot impose the printed exact type. The weaker support condition is exactly the one in Definition6.2.1 and the conclusion used in the proof of LemmaA.1.1.

Known correction: new

### E35 — misprint (adjacent source; no mathematical change)

[Elkik (1973)](https://numdam.org/item/10.24033/asens.1258.pdf), printed556/PDF5, last paragraph of the Lemma1 proof: “on peut déduire de (5)” should refer to identity **(4)**. The source has just announced the conductor-weighted Jacobian correction (4), and combines it over the expression for the power of the parameter. Display (5), on the following page, instead gives the conductor relations used to establish that correction. The original rendered page was checked. The Numdam record and an erratum/correction search found no correction of this reference. This is a proposed finding awaiting independent review, not a claim of priority.

## Reproducing the arithmetic regressions

The following uses only Python's standard library.

```python
"""Exact small arithmetic checks for LLHLM23 source corrections; no Lean claim."""
from fractions import Fraction
from itertools import permutations

identity = ((0, 0), (0, 1))

def action(p, v):
    # A permutation acts by permuting basis vectors, hence inverse on coordinates.
    out = [0] * len(p)
    for i, j in enumerate(p):
        out[j] = v[i]
    return tuple(out)

def mul(g, h):
    a, p = g
    b, q = h
    pb = action(p, b)
    return tuple(x+y for x,y in zip(a,pb)), tuple(p[q[i]] for i in range(len(p)))

def inv(g):
    a, p = g
    q = tuple(p.index(i) for i in range(len(p)))
    return action(q, tuple(-x for x in a)), q

def apply(g, x):
    a,p = g
    return tuple(b+c for b,c in zip(a,action(p,x)))

def star(g):
    a,p = g
    q = tuple(p.index(i) for i in range(len(p)))
    return action(q,a),q

trans = lambda a: (tuple(a), (0,1))
s = ((0,0),(1,0))
a = trans((1,0))
assert star(mul(a,s)) != mul(star(a),star(s))
samples=[((i,j),p) for i in range(-2,3) for j in range(-2,3) for p in permutations(range(2))]
assert all(star(mul(g,h)) == mul(star(h),star(g)) for g in samples for h in samples)
print('E1: 2500 reversed-product checks; explicit ordinary-product counterexample passed')

eta=(1,0)
omega=(3,0)
assert (sum(omega)-sum(eta)) % 6 == 2
assert sum(omega) % 6 == 3
print('E2: F7 central exponents are 2 (correct) and 3 (printed)')

mu=(2,0)
assert (sum(mu)+sum(eta)) % 6 == 3
assert (sum(mu)-sum(eta)) % 6 == 1
assert 1 < (mu[0]+eta[0])-(mu[1]+eta[1]) < 7-1
print('E3: 1-generic F7 inertia determinant has exponent 3, not 1')

lam=(1,1)
tau=trans((5,0))
rho=trans((7,1))
wh=mul(s,trans((-1,0)))
w=identity
w1=identity
w2=mul(wh,trans((-1,-1)))
assert apply(w2,(Fraction(1,2),0))[0]-apply(w2,(Fraction(1,2),0))[1] == Fraction(1,2)
assert mul(mul(trans(lam),inv(wh)),w2) == w
assert apply(mul(rho,inv(w1)),(0,0)) == apply(mul(tau,inv(w2)),(0,0)) == (7,1)
assert mul(inv(tau),rho) == trans((2,1))
assert all(2 < abs(v[0]-v[1]) < 11-2 for v in [(5,0),(7,1)])
assert sum((6,1)) == sum(lam)+sum((5,0))
assert (sum((7,1))-sum(eta))%10 == 7
assert sum((5,0))%10 == 5
assert (sum((5,0))+sum(lam))%10 == 7
assert w == w1 and w != w2
print('E4–E5: genericity, compatibility, affine witnesses, central-character mismatch and corrected index passed')

# Identity chart, nu=0,h=0. Nonpivot intervals are empty, while pivot coefficients are1.
for i in range(2):
    for j in range(2):
        upper = -int(i>j)-int(i<j)
        if i==j:
            assert upper == 0
        else:
            assert upper == -1
print('E7: identity chart exists with empty off-diagonal coefficient ranges; printed all-entry bound fails')

# Special-fibre lower-left coordinate in the identity chart.
mu=(1,0)
N=2
i,j,k=1,0,-1
correct=N*(0-int(i>j)-k)+mu[j]-mu[i]
printed=N*(0-int(i>j)-k)+mu[i]-mu[j]
assert correct==1 and printed==-1
print('E8: actual contraction weight +1; printed expansion weight -1')

# Etale residue extension F9/F3 has no F3-point.
assert all((x*x+1)%3 != 0 for x in range(3))
print('E10: completeness does not lift an etale cover without a residue-field point')

# Theorem4.6.2's printed bound does not ensure Definition4.6.1's domain.
p=19
lam=(6,0)
lambda_minus_eta=(5,0)
mu=(6,0)
nu=(7,0)
bound=max(2*2,lam[0]-lam[1])
assert bound==6 and bound < nu[0]-nu[1] < p-bound
wR=mul(trans(nu),s)
w1=identity
w2=mul(wh,trans((-5,0)))
assert mul(mul(trans(lambda_minus_eta),inv(wh)),w2)==w1
assert apply(w2,(Fraction(1,2),0))[0]-apply(w2,(Fraction(1,2),0))[1] > 0
omega=apply(mul(wR,inv(w2)),(0,0))
assert omega==(7,6)
highest_weight=tuple(x-y for x,y in zip(omega,eta))
assert highest_weight==(6,6)
assert not (1 < omega[0]-omega[1] < p-1)
print('Theorem4.6.2: p19, lambda(6,0), 6-generic R gives F(6,6), which is not1-deep')

# Lemma5.1.10(c): Frobenius is needed even after imposing the Lie(I1) hypothesis.
p,m,d=11,2,5
assert m < d < p-m
assert 1-d < m+1
assert p-d >= m+1
print('E16: lower entry v has valuation -4 after conjugation, but phi(v) has valuation6')

# Nontrivial unramified unipotent Frobenius is tame and not semisimple.
p=5
assert 1 % p != 0 and p % p == 0
# (I+E12)^k=I+k E12 and its minimal polynomial is (X-1)^2.
print('E19: a nontrivial unipotent Frobenius of order5 gives a continuous tame counterexample')

# Appendix B's unit locus and actual exceptional coefficient.
p,a,b=11,3,8
unit_factors=[b,b-1,a-1,a-2,a-b,a-b-1,a-b-2]
assert all(x%p for x in unit_factors)
assert (b*((a-b)*(a-1)-1))%p==0
assert ((a-b)*((a-1)-1))%p==6
print('E25: p11,a3,b8 lies on V and distinguishes the two exceptional loci')

# Raw polynomial genericity in Corollary B.0.5 misses the eta shift.
p=101
mu=(90,30,0)
eta3=(2,1,0)
shifted=tuple(x+y for x,y in zip(mu,eta3))
diffs=[shifted[i]-shifted[j] for i in range(3) for j in range(i+1,3)]
assert all(5 < d < p-5 for d in diffs)
assert not all(10 < d < p-10 for d in diffs)
cyclic=[(mu[i]-mu[(i+1)%3])%p for i in range(3)]
assert cyclic==[60,30,11]
assert all((d-k)%p for d in cyclic for k in range(11))
print('E26: p101,mu(90,30,0) passes the printed polynomial and5-depth, but fails10-depth')

# The repaired bound in E15 is covered by Theorem7.4.2's stronger hypotheses.
from itertools import combinations
checked=0
for n in range(2,6):
    for h in range(n-1,11):
        for asc in combinations(range(h+1),n):
            lam=tuple(reversed(asc))
            alg=tuple(lam[i]-(n-1-i) for i in range(n))
            assert list(alg)==sorted(alg,reverse=True)
            h_alg=max(alg)-min(alg)
            assert h_alg+n-1<=h
            assert max(2*n,max(lam)-min(lam)+n-1)<=max(2*(h+1),4*n+h)
            assert max(2*n,h_alg+n-1)<=max(2*(h+1),4*n+h)
            checked+=1
print('E15 scope:',checked,'regular Hodge tuples verify the downstream bound calculation')
```

## Reproducing the Appendix B generic checks

Run with SymPy 1.14.0 from the repository root. This checks the rational generic parameter field only, as explained above.

```python
import sympy as s,json,pathlib,itertools,time
d=json.loads(pathlib.Path('research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json').read_text())['sourceData']['appendixB']
a,beta,t,W=s.symbols('a b t W'); vs=s.symbols('c12 c13 d21 c22 d31 d33'); env={str(x):x for x in [a,beta,t,W,*vs]}; parse=lambda x:s.sympify(x,locals=env)
f=list(map(parse,d['chartEquations']));g=list(map(parse,d['partialNormalizationEquations']))
K=s.QQ.frac_field(a,beta)
for i,ideal in enumerate(d['specialFiberMinimalPrimes']):
 G=s.groebner(list(map(parse,ideal)),*vs,domain=K)
 assert all(G.reduce(x.subs(t,0))[1]==0 for x in f),i
print('7 component ideals contain all three special-fiber equations over Q(a,b)',flush=True)
for i,fibres in enumerate(d['normalizationFiberComponents']):
 for j,ideal in enumerate(fibres):
  G=s.groebner(list(map(parse,ideal)),W,*vs,domain=K)
  remainders=[k for k,x in enumerate(g) if G.reduce(x.subs(t,0))[1]!=0]
  assert remainders == ([5] if (i,j)==(3,0) else []),(i,j,remainders)
print('Table1: ten ambient ideals kill all seven equations; the double-cover row retains exactly its quadratic W relation, over Q(a,b)',flush=True)
# Rational substitution verifies all normalization equations in Frac(R).
G=s.groebner(f,t,*vs,domain=K)
for i,x in enumerate(g):
 q=s.cancel(x.subs(W,-t*env['d21']/env['c22']))
 assert G.reduce(s.fraction(q)[0])[1]==0,i
print('7 normalization relations vanish after W=-t*d21/c22 in Frac(R), over Q(a,b)',flush=True)
J=s.Matrix(f).jacobian(vs)
minors=[s.expand(J[:,list(cols)].det()) for cols in itertools.combinations(range(6),3)]
G=s.groebner(f+minors,t,*vs,domain=K)
assert G.reduce(t**3)[1]==0
print('t^3 lies in the Jacobian ideal in the chart quotient over Q(a,b)',flush=True)
print('These checks do not prove minimality, primality, multiplicities, localized integral ideal membership or all specializations.',flush=True)
```

## Inventory index

Statements and hypotheses are in the JSON. This index is a navigation aid, not a completeness certificate.

| ID | Mathematical item | Source locator |
|---|---|---|
| N01 | Coefficient, root and Frobenius conventions | §1.8.1–2, PDF24–28 |
| N02 | Extended affine Weyl datum | §1.8.1, PDF25–26; §2.1.1 |
| N03 | Length, Bruhat and upper-arrow orders | §2.1.1, PDF29–30 |
| N04 | Reduced products of affine elements | Definition2.1.1, PDF30 |
| N05 | Admissible set | Definition2.1.2, PDF30 |
| N06 | Regular alcoves and regular admissible elements | Definition2.1.3, PDF30 |
| N07 | Opposed dominant factors are reduced | Lemma2.1.4, PDF31 |
| N08 | Regular affine-element factorization | Proposition2.1.5, PDF31 |
| N09 | Converse regularity | Proposition2.1.5, PDF31 |
| N10 | Admissibility and upper-arrow criterion | Proposition2.1.6, PDF31–32 |
| N11 | Admissible pairs | Equation(2.2), PDF32 |
| N12 | Admissible-pair parametrization | Corollary2.1.7, PDF32–33 |
| N13 | Reversed restricted-factor parametrization | Remark2.1.8, PDF33 |
| N14 | Dual affine opposition map | Definition2.1.9 and following assertion, PDF33 |
| N15 | Alcove depth | Definition2.1.10, PDF33 |
| N16 | Affine genericity and smallness | Definition2.1.10, PDF33 |
| N17 | Polynomial genericity | Definition2.1.10(4), PDF34 |
| N18 | Genericity and smallness transport | Proposition2.1.12(1), PDF34 |
| N19 | Smallness under products | Proposition2.1.12(2), PDF34 |
| N20 | Smallness under inversion and opposition | Proposition2.1.12(3), PDF34 |
| N21 | Loss of genericity under a small factor | Proposition2.1.12(4), PDF34 |
| N22 | Integral highest-weight and virtual Weyl modules | §2.2, equation(2.3), PDF34–35 |
| N23 | Serre weights and restricted highest weights | §2.2, PDF35 |
| N24 | Shifted p-alcoves and dot action | §2.2, PDF35 |
| N25 | Constituent depth bound | Lemma2.2.1, PDF35–37 |
| N26 | Dominant translate remains in a Weyl polytope | Lemma2.2.2, PDF36 |
| N27 | Algebraic and finite central characters | §2.2, PDF37 |
| N28 | Lowest-alcove presentation of a Serre weight | Equation(2.5), PDF37 |
| N29 | Compatibility of Serre-weight presentations | Equations(2.6)–(2.7), PDF38 |
| N30 | Central character of a lowest-alcove presentation | Lemma2.2.3, PDF38 |
| N31 | Presentations classified by central lifts | Lemma2.2.4, PDF38, corrected E2 |
| N32 | Deligne–Lusztig representations | §2.3, PDF38–39 |
| N33 | Generic Deligne–Lusztig presentation | Definition2.3.1, PDF39 |
| N34 | Generic Deligne–Lusztig irreducibility | §2.3 after Definition2.3.1, PDF39 |
| N35 | Central compatibility of Deligne–Lusztig presentations | §2.3, PDF39 |
| N36 | Deligne–Lusztig presentations and central lifts | Lemma2.3.2, PDF39 |
| N37 | A bounded presentation for every Deligne–Lusztig representation | Lemma2.3.3, PDF40 |
| N38 | Deep constituents force generic types | Lemma2.3.4, PDF40 |
| N39 | Jantzen constituent criterion | Proposition2.3.6, PDF41 |
| N40 | Admissible-pair parametrization of tensor constituents | Proposition2.3.7, PDF41–42 |
| N41 | Depth and central compatibility of tensor constituents | Proposition2.3.7, PDF41–42 |
| N42 | Constituents by translated Bruhat intervals | Proposition2.3.8, PDF42 |
| N43 | Outer constituents | §2.3.1, PDF42 |
| N44 | Outer constituent controls upper-arrow inequalities | Lemma2.3.9, PDF42–43 |
| N45 | Covering relation on Serre weights | Definition2.3.10, PDF43 |
| N46 | Covering criterion by alcove inequalities | Proposition2.3.12(1)–(2), PDF43–45 |
| N47 | Covering criterion by intervals | Proposition2.3.12(1),(3), PDF43–45 |
| N48 | Covering criterion by algebraic modules | Proposition2.3.12(1),(4), PDF43–45 |
| N49 | Tame inertial L-parameters from Weyl data | §2.4, PDF45–46 |
| N50 | Explicit tame inertia characters for GLn | Example2.4.1, equation(2.12), PDF45–46 |
| N51 | Lowest-alcove presentations and the E/F central shift | §2.4, PDF46–47 |
| N52 | Regular and generic tame types | Definition2.4.3, PDF47–48 |
| N53 | Characteristic-zero types and determinant lifts | Lemma2.4.4, first part, PDF48 |
| N54 | Residual types and determinant lifts | Lemma2.4.4, second part, PDF48, corrected E3 |
| N55 | Changing a diagonal tame presentation | Proposition2.4.5, PDF48 |
| N56 | Weil–Deligne inertial parameter | Definition2.5.1, PDF48–49 |
| N57 | Monodromy dominance on inertial types | Definition2.5.3 and preceding paragraph, PDF49–50 |
| N58 | Occurrence of an inertial type bounds monodromy | Theorem2.5.4(1), PDF50 |
| N59 | Exact inertial type has multiplicity one | Theorem2.5.4(2), PDF50 |
| N60 | Generic representations and dominated monodromy | Theorem2.5.4(3), PDF50 |
| N61 | Tame types are constituents of Deligne–Lusztig representations | Proposition2.5.5, PDF50–51 |
| N62 | Herzig involution and predicted weights | Definition2.6.1 and preceding paragraph, PDF52 |
| N63 | Parametrization of Herzig weights | Proposition2.6.2, PDF52 |
| N64 | Depth and compatibility of Herzig weights | Proposition2.6.2, PDF52 |
| N65 | Obvious Serre weights | Definition2.6.3, PDF52 |
| N66 | Relative position of residual and lifted types | §2.6.1, PDF52–53 |
| N67 | Breuil–Mézard weight-intersection criterion | Proposition2.6.4, PDF53, corrected E4 |
| N68 | Affine factorization of equal weight parameters | Proposition2.6.4, last assertion, PDF53 |
| N69 | Extremal intersection is a single obvious weight | Corollary2.6.5, PDF53 |
| N70 | Admissibility produces an obvious common weight | Proposition2.6.6, PDF53–54 |
| N71 | Herzig weights lie in one auxiliary tensor type | Lemma2.6.7, PDF54 |
| U01 | Universal Iwahori group scheme | §3.1, PDF55 |
| U02 | Universal positive and full loop groups | §3.1, PDF55–56 |
| U03 | Universal affine Grassmannian and bounded pieces | §3.1, PDF56 |
| U04 | Negative loop subgroup | Definition3.2.1, PDF56–57 |
| U05 | Unique positive-negative factorization | Lemma3.2.2, PDF57 |
| U06 | Square-zero loop Lie modules | §3.2 before Lemma3.2.3, PDF57–58 |
| U07 | Positive-negative Lie splitting | Lemma3.2.3, PDF58 |
| U08 | Artinian formal etaleness at a point | Definition3.2.4 and Remark3.2.5, PDF58 |
| U09 | Formal etaleness of loop factorization | Lemma3.2.6, PDF58–59 |
| U10 | Affine-element chart functor | Before Lemma3.2.7, PDF59 |
| U11 | Chart torsor and formal etaleness | Lemma3.2.7, PDF60 |
| U12 | Explicit bounded chart equations | Proposition3.2.8, PDF60 |
| U13 | Distinguished chart section | Definition3.2.9, PDF61 |
| U14 | Bounded charts are open | Corollary3.2.10, PDF61 |
| U15 | Universal differential condition | Equation(3.1), PDF61–62 |
| U16 | Descent of the differential condition | Lemma3.3.1, PDF61 |
| U17 | Global Schubert variety and orbit projection | §3.3, PDF62–63 |
| U18 | Naive universal local model | Definition3.3.3, PDF63 |
| U19 | Open differential stratum is a flag variety | Proposition3.3.4, PDF63–65 |
| U20 | Reduced generic universal decomposition | Corollary3.3.5, PDF65 |
| U21 | Universal local model as a closure | Definition3.3.6, PDF65 |
| U22 | Torus fixed points of global Schubert varieties | Lemma3.3.7, PDF66 |
| U23 | Generic universal naive model is smooth | Proposition3.3.8, PDF66–68 |
| U24 | Elkik lifting for a fixed chart presentation | Proposition3.3.9, PDF68–69 |
| U25 | Equal-characteristic closure model | §3.4, PDF69 |
| U26 | Unibranch points and normalization | Definition3.4.2 and Remark3.4.3, PDF69–70 |
| U27 | Extended torus and chart action | §3.4; Lemma3.4.6, PDF70–71 |
| U28 | Contracting chart action | Lemma3.4.7, PDF71–72 |
| U29 | Contraction gives a unibranch vertex | Lemma3.4.8, PDF72 |
| U30 | Equal-characteristic unibranchness after power base change | Proposition3.4.4, PDF70,73 |
| U31 | Normalization fibres in a flat family | Corollary3.4.5, PDF70 |
| U32 | Flatness across a principal divisor | Lemma3.5.4, PDF74 |
| U33 | Generic flatness of a closure family | Lemma3.5.5 and Remark3.5.6, PDF74 |
| U34 | Geometrically S1 special fibres after shrinking | Lemma3.5.7, PDF74 |
| U35 | Codimension-one regularity under uniformizer specialization | Lemma3.5.8, PDF74–75 |
| U36 | Normality spreads to generic DVR specializations | Proposition3.5.2, PDF73–76 |
| U37 | Quasi-finite horizontal subscheme through a section | Proposition3.6.1, PDF76 |
| U38 | Uniform bounded-extension lift of a section | Corollary3.6.2, PDF76–77 |
| U39 | Product universal local model | §3.7, PDF77 |
| U40 | Uniform unibranchness for product specializations | Theorem3.7.1, PDF77–80 |
| U41 | Integral adic chart domain for product models | Theorem3.7.1, last assertion, PDF77–80 |
| U42 | Normalization connectivity controls adic completion | Lemma3.7.2, PDF80 |
| U43 | Completed local product of chart rings is a domain | Theorem3.7.1 proof, PDF79–80; [10] LemmaA.1.1 and [54] Proposition2.2 |
| M01 | Pappas–Zhu GLn Iwahori local model | §4.1, PDF80–81 |
| M02 | Mixed-characteristic differential locus | Equation(4.1), PDF81 |
| M03 | Generic differential stratum is a smooth flag variety | Proposition4.1.1, PDF81–82 |
| M04 | Flat monodromy local model | Definition4.1.2, PDF82 |
| M05 | Naive mixed-characteristic local model | Definition4.1.3, PDF82 |
| M06 | Union of flat Hodge-stratum closures | Equation(4.2), Proposition4.1.5, PDF82 |
| M07 | Flat union and naive model have the same generic fibre | Proposition4.1.6, PDF82–83 |
| M08 | Residue tuple genericity | Definition4.2.2, PDF83 |
| M09 | Differential affine-cell dimension | Theorem4.2.4, PDF83–87 |
| M10 | Smallness of admissible elements | Lemma4.2.5, PDF83 |
| M11 | Top components of the naive special fibre | Corollary4.2.6, PDF84 |
| M12 | Affine root subgroup charts | §4.2, Lemmas4.2.7–8, PDF84–85 |
| M13 | Unipotent affine-cell subgroup and support | Definitions4.2.9,4.2.14, PDF85 |
| M14 | Polynomial coordinates for the cell subgroup | Proposition4.2.10; Corollary4.2.12, PDF85 |
| M15 | Unipotent subgroup parametrizes the Schubert cell | Proposition4.2.13, PDF85 |
| M16 | Support criterion and count | Corollary4.2.15, PDF85–86 |
| M17 | Triangular cell subgroup | Corollary4.2.16, PDF86 |
| M18 | Common zero-parameter differential affine flag | Equation(4.7), PDF88 |
| M19 | Translate differential models to the common flag | Proposition4.3.1, PDF88 |
| M20 | Translated differential cells and their closures | Definition4.3.2, PDF88–89 |
| M21 | Dimension of a translated differential cell | Proposition4.3.4, PDF89 |
| M22 | Remove the second dominant factor | Proposition4.3.5, PDF89–90 |
| M23 | Finite Weyl invariance of differential closures | Proposition4.3.6, PDF90–91 |
| M24 | Intrinsic component indexed by an alcove pair | Equation(4.9), PDF91 |
| M25 | Identify translated closures intrinsically | Theorem4.3.9, PDF92 |
| M26 | Admissible pairs label translated top components | Theorem4.3.10, PDF92 |
| M27 | Torus torsors over the special-fibre flag | §4.4, PDF93 |
| M28 | Product models, components and torsor comparison | §4.5, Proposition4.5.1, PDF94–95 |
| M29 | Component labelled by a Serre weight and central lift | Definition4.6.1, PDF95 |
| M30 | Representation-theoretic component labelling with repaired bound | Theorem4.6.2, PDF95–96 |
| M31 | Fixed points detected by the negative-loop chart | Lemma4.7.1, PDF97 |
| M32 | Obvious fixed points of an intrinsic component | Proposition4.7.2, PDF97 |
| M33 | Polynomial-generic fixed-point saturation | Proposition4.7.3, PDF97–98 |
| M34 | Intrinsic component is unibranch at fixed points | Proposition4.7.5, PDF99 |
| M35 | Obvious weight gives a fixed point | Theorem4.7.6(1), PDF99 |
| M36 | Fixed point implies a predicted weight | Theorem4.7.6(2), PDF99 |
| M37 | Predicted weight gives a fixed point under polynomial genericity | Theorem4.7.6(3), PDF99 |
| K01 | Tame descent coefficient rings | §5.1, PDF99–100 |
| K02 | Integral Iwahori and its pro-unipotent subgroup | §5.1, PDF100–101 |
| K03 | Breuil–Kisin module of bounded height | Definition5.1.1, PDF101 |
| K04 | Tame descent type on Breuil–Kisin modules | Definition5.1.3 and Remark5.1.4, PDF101–102 |
| K05 | Eigenbasis with descent compatibility | Definition5.1.6, PDF102 |
| K06 | Oriented partial Frobenius matrices | Equations(5.1)–(5.4), PDF102–103 |
| K07 | Compatibility with earlier embedding conventions | Remark5.1.7, PDF103–104 |
| K08 | Change of eigenbasis is twisted Frobenius conjugation | Proposition5.1.8, PDF104–105 |
| K09 | Shape of a residual Kisin module | Definition5.1.9, PDF105 |
| K10 | Frobenius contraction on I1 | Lemma5.1.10(a), PDF105 |
| K11 | Higher congruence contraction | Lemma5.1.10(b),(d), PDF105 |
| K12 | Lie I1 Frobenius contraction, corrected | Lemma5.1.10(c), PDF105 |
| K13 | Height-bounded loop spaces | §5.2, equation(5.5), PDF106–107 |
| K14 | Twisted conjugation actions | §5.2, PDF107 |
| K15 | Quotient presentation of the Kisin stack | Proposition5.2.1, PDF107 |
| K16 | Residual straightening of I1 conjugation | Lemma5.2.2, PDF107–109 |
| K17 | Residual Kisin stack as a torus quotient | Corollary5.2.3, PDF109 |
| K18 | Gauge opens and gauge bases | Definitions5.2.4,5.2.6, PDF109–110 |
| K19 | Existence and uniqueness of gauge bases | Proposition5.2.7, PDF110–112 |
| K20 | Local model diagram for bounded-height Kisin modules | Theorem5.3.1, PDF113 |
| K21 | Bounded Hodge-type Kisin substack | §5.3, PDF114 |
| K22 | Pappas–Zhu local model diagram with Hodge bound | Theorem5.3.3, PDF115 |
| K23 | Nonempty Kisin charts are admissible | Corollary5.3.4, PDF115 |
| K24 | Hodge-bound membership detected by shape | Corollary5.3.5, PDF115 |
| K25 | Etale Frobenius modules with descent | §5.4.1, PDF116 |
| K26 | Forget the Kisin lattice and descend | §5.4.1, PDF116 |
| K27 | Properness of the lattice-forgetting map | Proposition5.4.1, PDF116 |
| K28 | Etale Frobenius matrix attached to an eigenbasis | Proposition5.4.2, PDF117 |
| K29 | Generic triviality of Kisin fibres as a closed immersion | Proposition5.4.3, PDF117–119 |
| K30 | Pole elimination for etale isomorphisms | Lemma5.4.4, PDF118 |
| K31 | Pole elimination for infinitesimal isomorphisms | Lemma5.4.5, PDF118 |
| K32 | Translated bounded flags and shifted torus action | §5.4.2, PDF120 |
| K33 | Bounded flag quotient embeds in the etale stack | Proposition5.4.6, PDF120 |
| K34 | Compatibility diagram for different local models | Proposition5.4.7, PDF120–121 |
| K35 | Fields-of-norms anti-equivalence | §5.5, PDF121 |
| K36 | Restriction of tame representations and semisimplification | §5.5, PDF121–122 |
| K37 | Genericity of a residual Galois representation | Definition5.5.1, PDF122 |
| K38 | Semisimple representations from torus-fixed Frobenius matrices | Proposition5.5.2, PDF122 |
| K39 | Shape of a residual representation relative to a type | Definition5.5.4, PDF123 |
| K40 | Semisimple Kisin module | Definition5.5.5 and Remark5.5.6, PDF123 |
| K41 | Semisimple Kisin modules and admissible type position | Proposition5.5.7, PDF123 |
| K42 | A nonzero tame deformation ring forces admissibility | Corollary5.5.8, PDF123–124 |
| K43 | Semisimplification preserves a Kisin height and Hodge bound | Proposition5.5.9, PDF124–125 |
| K44 | Residual genericity loses at most the height | Corollary5.5.10, PDF125 |
| P01 | Framed local lifting ring | §6.1, PDF125–126 |
| P02 | Type and Hodge-type deformation quotients | §6.1.1, PDF125–126 |
| P03 | Patched local base rings | §6.2, PDF126–127 |
| P04 | Weak patching functor | Definition6.2.1(1)–(2), PDF127 |
| P05 | Weak minimal patching functor | Definition6.2.1(I), PDF127 |
| P06 | Potentially diagonalizable patching functor | Definition6.2.1(II), PDF127 |
| P07 | Detectable patching functor | Definition6.2.1(III), PDF127 |
| P08 | Minimal patching functor for a set of types | Definition6.2.1(IV), PDF127 |
| P09 | Weight elimination for weak patching functors | Proposition6.2.3, PDF128 |
| P10 | Existence of potentially diagonalizable weak patching | Proposition6.2.4(1), PDF128–129 |
| P11 | Existence of weak minimal potentially diagonalizable patching | Proposition6.2.4(2), PDF128–129 |
| P12 | Detectability for semisimple generic representations | Proposition6.2.6, PDF129 |
| P13 | Patched nonvanishing and admissibility criterion | Proposition6.2.7, PDF129–130 |
| P14 | Ordinary upper-triangular lifting | Lemma6.2.8, PDF130–131 |
| P15 | Ordinary weights detected by potentially diagonalizable patching | Proposition6.2.9, first assertion, PDF131 |
| P16 | Ordinary constituent forces a nonzero lifting ring | Proposition6.2.9, last assertion, PDF131 |
| G01 | Rigid coefficient rings and analytic derivation | §7.1 PDF132–133 |
| G02 | Kisin monodromy operator on a lattice | Theorem7.1.1 PDF132 |
| G03 | True monodromy condition | Definition7.1.2 PDF132 |
| G04 | Family monodromy recurrence | Proposition7.1.3(1),(2) PDF133–134 |
| G05 | Finite derivative criterion for monodromy | Proposition7.1.4 PDF134–135 |
| G06 | Closed generic monodromy locus | Corollary7.1.5 PDF135 |
| G07 | Integral true monodromy ideal | Proposition7.1.6 PDF135–136 |
| G08 | Monodromy leading term and error series | Equations7.5–7.8 PDF136–139 |
| G09 | Truncated monodromy ideal | Definition7.1.8 PDF137 |
| G10 | Truncated differential local-model equation | Remark7.1.9 PDF137 |
| G11 | Integral precision of the leading monodromy equations | Proposition7.1.10 PDF138–140; application PDF152 |
| G12 | Emerton–Gee representation stack | §7.2 PDF140–141 |
| G13 | Potentially crystalline formal substacks | §7.2 PDF141 |
| G14 | Analytically unramified formal stack | §7.2 PDF141; Warning7.2.1 |
| G15 | Geometry and versal rings of crystalline stacks | Theorem7.2.2(1)–(3) PDF142 |
| G16 | Dimension of a crystalline stack | Theorem7.2.2(4) PDF142 |
| G17 | Fiber products and monodromy substacks | §7.2 PDF142–143 |
| G18 | Kisin/crystalline stack comparison | Proposition7.2.3 PDF143 |
| G19 | Artinian points detect scheme isomorphisms | Lemma7.2.5 PDF144 |
| G20 | Finite-flat points detect formal-stack isomorphisms | Lemma7.2.6 PDF144–145 |
| G21 | Existence and uniqueness of Kisin lattices in families | Proposition7.2.7; Remark7.2.8 PDF145 |
| G22 | Cyclotomic-free residual representation | Definition7.2.9 PDF146 |
| G23 | Restriction full faithfulness under cyclotomic freeness | Lemma7.2.10(1)–(4) PDF146 |
| G24 | Restriction monomorphism for crystalline families | Proposition7.2.11 PDF146–147 |
| G25 | Monodromy produces the integral Galois representation | Proposition7.2.12; Lemma7.2.13 PDF147–149 |
| G26 | Presentation-dependent local-model parameter | §7.3; Lemma7.3.1 PDF149–150 |
| G27 | Regular-weight unions and framed charts | §7.3 PDF150–151 |
| G28 | Approximate equations give a noncanonical closed immersion | Theorem7.3.2(1) PDF151–155 |
| G29 | Polynomial-generic regular local-model isomorphism | Theorem7.3.2(2), first conclusion PDF151–155 |
| G30 | Domain versal rings at semisimple points | Theorem7.3.2(2), second conclusion PDF151–155 |
| G31 | Nonempty crystalline shape charts | Lemma7.3.5 PDF152 |
| G32 | Serre-labelled Emerton–Gee components | §7.4 PDF155–156 |
| G33 | Special-fiber factorization through the naive local model | Proposition7.4.1 PDF157 |
| G34 | Generic crystalline component support | Theorem7.4.2(1); Remark7.4.3(4),(5); Corollary7.4.5 PDF157–161 |
| G35 | Component local-model diagram | Theorem7.4.2(2); Remark7.4.3 PDF158–161 |
| G36 | Dense triangular locus in Springer components | Lemma7.4.6 PDF159–161 |
| G37 | Component membership and predicted weights | Proposition7.4.7(1)–(3) PDF162 |
| B01 | Global top-dimensional stack cycles | §8.1 PDF162–163 |
| B02 | Extremal types and crystalline/semistable cycles | §8.1 PDF163 |
| B03 | Geometric Breuil–Mézard conjectural interface | Conjecture8.1.1 PDF163 |
| B04 | Breuil–Mézard system | §8.1; Remark8.1.3 PDF163–164 |
| B05 | Versal cycle pullback | §8.1 PDF164–165 |
| B06 | Versal Breuil–Mézard conjectural interface | Conjecture8.1.5; Remark8.1.6 PDF165 |
| B07 | Cycle of a finite module | §8.1.1 PDF165 |
| B08 | Geometric equations imply versal equations | Proposition8.2.1 PDF165 |
| B09 | Component-meeting testing set | §8.2 PDF166 |
| B10 | Cycle detection by versal pullbacks | Lemma8.2.2 PDF166 |
| B11 | Descent and uniqueness of candidate cycles | Proposition8.2.3; Remark8.2.4 PDF166–167 |
| B12 | Irrelevant weights | Definition8.3.1; Remark8.3.2 PDF167 |
| B13 | Covering, disjointness and relative genericity for type sets | Definition8.3.3 first part PDF167–168 |
| B14 | Relative Breuil–Mézard system and good subsystem | Definition8.3.3 second part PDF168 |
| B15 | Minimal patching gives versal cycles | Theorem8.3.5(1) PDF168–169 |
| B16 | Truncated inversion gives effective geometric cycles | Theorem8.3.5(2) PDF168–171 |
| B17 | Patching independence and comparison to conjectural cycles | Theorem8.3.5(3),(4) PDF168–171 |
| B18 | Component truncation idempotents | Proof8.3.5; Lemmas8.3.6–8.3.7 PDF169–171 |
| B19 | Generic crystalline type systems | §8.4 PDF171 |
| B20 | Weight elimination makes the enlarged system span | Lemmas8.4.2,8.4.4 PDF172 |
| B21 | Abstract covering reduces to combinatorial covering | Lemma8.4.5 PDF172 |
| B22 | Generic Serre weights for BM | Definition8.4.6; Remark8.4.7 PDF172 |
| B23 | Generic weights and semisimple points meet the axioms | Lemmas8.4.8–8.4.9 PDF172–173 |
| B24 | Minimal patching for tame generic residual representations | Theorem8.4.10(1) PDF173–174 |
| B25 | Generic geometric BM cycles and support | Theorem8.4.10(2) PDF173–174 |
| B26 | Canonicity of generic BM cycles | Theorem8.4.10(3),(4) PDF173–174 |
| B27 | Shifted polynomial genericity | Equation8.1 PDF174 |
| B28 | Polynomial-generic geometric BM | Lemma8.4.11; Corollary8.4.12 PDF174–175 |
| B29 | Product compatibility of BM cycles | Remark8.4.14 PDF175 |
| B30 | Admissibility transports polynomial genericity | Lemma8.5.1 PDF175 |
| B31 | Generic small-weight versal BM for all tame WD types | Corollary8.5.2 PDF176 |
| B32 | Unit leading coefficient of a generic BM cycle | Proposition8.6.1 PDF177 |
| B33 | Generic BM cycles form an integral basis | Proposition8.6.2 PDF177 |
| B34 | Defect of a predicted weight | §8.6.1 PDF177 |
| B35 | Unique maximal defect in a type intersection | Proposition8.6.3 PDF178 |
| B36 | Recursive BM coefficient computation | Equation8.3; Remark8.6.4 PDF178–179 |
| B37 | Very-generic uniqueness from polynomial-type equations | Proposition8.6.5; Remark8.6.6 PDF179–180 |
| V01 | Definite unitary global setting | §9.1 PDF180–181 |
| V02 | Algebraic automorphic forms with coefficients | Equation9.2 PDF181 |
| V03 | Hecke algebra and attached polarized Galois representation | §9.1 PDF181–182 |
| V04 | Modular Serre weight and generic modular weights | Definition9.1.1 PDF182–183 |
| V05 | Geometric and BM Serre weights | Definition9.1.2; Remark9.1.3 PDF183 |
| V06 | Global weight conjectures | Conjectures9.1.4–9.1.5 PDF183 |
| V07 | Polynomial-generic weight part of Serre's conjecture for U(n) | Theorem9.1.6 PDF183–184 |
| V08 | Genericity polynomial and global examples | Remarks9.1.7–9.1.8 PDF184 |
| V09 | Geometric weights equal predicted weights generically | Lemma9.1.9 PDF184 |
| V10 | Primes of pulled-back Serre components | §9.1 PDF185 |
| V11 | Support of any weak detectable patching functor | Lemma9.1.10 PDF185–186 |
| V12 | Modularity lifting from polynomial-generic local domains | Theorem9.2.1 PDF186–187 |
| V13 | Change-of-weight relaxation of modularity lifting | Remark9.2.2 PDF187 |
| A01 | Arbitrary-level patching functor realizing modular weights | LemmaA.1.1(1) PDF188; proof PDF200–201 |
| A02 | Detectability of the global patching functor | LemmaA.1.1(2) PDF188; proof PDF201 |
| A03 | Annihilator containment forces covering | LemmaA.2.1 PDF188 |
| A04 | Upper-alcove obvious weights occur for weak patching | PropositionA.2.2 PDF188–189 |
| A05 | Liftings, strict equivalence and abelianized determinant | §A.3 PDF189 |
| A06 | Polarized group G_n and multiplier | §A.3 PDF189 |
| A07 | Local deformation problem | DefinitionA.3.1 PDF190 |
| A08 | Fixed-determinant local deformation quotients | §A.3.1 PDF190 |
| A09 | Polarized global deformation data | §A.3.2 PDF190–191 |
| A10 | Partially framed global deformation rings | §A.3.2 PDF191 |
| A11 | Relative tangent and Selmer complexes | §A.3.3 PDF192 |
| A12 | Relative framed tangent comparison | PropositionA.3.2 PDF192 |
| A13 | Taylor–Wiles local deformation condition | §A.3.4 PDF192–193 |
| A14 | Adequate Taylor–Wiles prime supply and generator bound | PropositionA.3.3 PDF193 |
| A15 | Diamond group and augmentation descent | §A.3.4 PDF193–194 |
| A16 | Auxiliary parahoric levels | §A.4 PDF195–196 |
| A17 | Local-global compatibility at auxiliary levels | TheoremA.4.1 PDF196–197 |
| A18 | Taylor–Wiles projectors and free diamond modules | §A.4 PDF197–198 |
| A19 | Finite patching modules and coefficient power series | §A.5 PDF198–199 |
| A20 | Ultrafilter patched module | §A.5 PDF199 |
| A21 | Projectivity and regular sequence of the patched module | §A.5 PDF199 |
| A22 | Patched deformation ring and its actions | §A.5 PDF199–200 |
| A23 | Exact covariant patching functor | §A.5 PDF200 |
| A24 | Support and maximal Cohen–Macaulay properties | ProofLemmaA.1.1 PDF200–201 |
| Q01 | Explicit rank-three monodromy chart | AppendixB PDF201–202 |
| Q02 | Explicit open genericity locus | AppendixB PDF202 |
| Q03 | Three equations for the explicit chart | PropositionB.0.1(1) PDF202 |
| Q04 | Seven special-fiber components | PropositionB.0.1(2) PDF203 |
| Q05 | Complete intersection and flatness of the explicit chart | PropositionB.0.1(3) PDF203 |
| Q06 | Effective Elkik Jacobian bound | PropositionB.0.1(4) PDF203 |
| Q07 | Partial normalization by an explicit fraction | AppendixB PDF203–204 |
| Q08 | Normal O-flat specialization | PropositionB.0.2(1),(2) PDF204–206 |
| Q09 | Normalization fibers of all seven components | PropositionB.0.2(3); Table1 PDF207 |
| Q10 | Unibranch fixed point and a dense branching locus | CorollaryB.0.4 PDF206,208 |
| Q11 | Explicit depth-ten local comparison in one chart | CorollaryB.0.5 PDF208–209 |
| Q12 | Product extension of the numerical example | RemarkB.0.6 PDF209 |
| Z01 | Type A equivalued affine Springer fixed points | Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 Theorem3.1, PDF5; definitions PDF1–4; used in LLHLM23 Proposition4.7.3. |
| Z02 | Explicit affine Springer component matrix and inverse | Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 AppendixB.2–B.5, PDF8–17; corrected E29–E31. |

## Continuation inventory and reproducible precision checks

| ID | Item | Source |
| --- | --- | --- |
| Z03 | Elkik's presentation-dependent Jacobian ideal | Elkik (1973), §0.2, printed p. 555/PDF4; LLHLM23 Proposition3.3.9 proof PDF69 |
| Z04 | Newton correction with an Elkik minor witness | Elkik Lemma1 proof, printed pp. 556–558/PDF5–7, specialized to I=A and no t-torsion |
| Z05 | Elkik approximation with bounded torsion | Elkik Lemma1, printed pp. 555–558/PDF4–7 |
| Z06 | Torsionfree complete approximation without a Noetherian test ring | Proof extracted from Elkik Lemma1 with I=A; used in LLHLM23 Proposition3.3.9 |
| Z07 | A fixed smooth generic presentation gives a uniform exponent | LLHLM23 Proposition3.3.9 proof, PDF69; Elkik §0.2 |
| Z08 | Geometric connectedness in the affinoid finite-extension sense | BLGGT AppendixA.1, printed pp. 595–596/PDF95–96 |
| Z09 | BLGGT geometric connectedness of an affinoid product | BLGGT LemmaA.1.1, printed p. 596/PDF96; standing field convention p. 595 |
| Z10 | A normal connected affinoid with a rational point is geometrically connected | Implicit input before BLGGT LemmaA.1.1 is applied in LLHLM23 Theorem3.7.1, PDF79–80 |
| Z11 | Khare–Wintenberger completed tensor theorem in its original scope | Khare–Wintenberger II Proposition2.2(ii), author PDF9; conventions PDF4–6 |
| Z12 | Domain part over an arbitrary complete DVR | LLHLM23 Theorem3.7.1, PDF79, general-DVR adaptation of KWII Proposition2.2 |
| Z13 | The chart's completed affinoid product is a domain | LLHLM23 Theorem3.7.1 final paragraph, PDF79–80 |
| Z14 | Affinoid product connectedness over complete nonarchimedean fields | General-field adaptation of BLGGT LemmaA.1.1 used in LLHLM23 Theorem3.7.1, PDF79–80 |
| L01 | Connected prime spectra via idempotents | Pinned Tau Ceti TauCeti/RingTheory/Idempotents/Connected/Spectrum.lean |
| L02 | Geometric connectedness of the ordinary algebraic tensor product | Pinned Tau Ceti TauCeti/AlgebraicGeometry/Geometrically/Connected.lean |

~~~python
from fractions import Fraction


def vp(x, p):
    x = Fraction(x)
    if x == 0:
        return float('inf')
    def v(n):
        n = abs(n)
        k = 0
        while n % p == 0:
            n //= p
            k += 1
        return k
    return v(x.numerator) - v(x.denominator)


recurrences = 0
for r in range(8):
    for excess in range(1, 10):
        m0 = 2*r + excess
        m = m0
        for j in range(8):
            assert m == 2*r + 2**j * (m0 - 2*r)
            assert 2*m - 2*r > m
            m = 2*m - 2*r
            recurrences += 1

newton = 0
for p in [3, 5, 7, 11, 13]:
    for r in range(6):
        for excess in range(1, 8):
            m = 2*r + excess
            root = Fraction(p**r)
            a = root + p**(m-r)
            residual = a*a - root*root
            assert vp(residual, p) == m
            assert vp(2*a, p) == r
            y = residual / (2*a)
            assert vp(y, p) == m-r
            corrected = (a-y)**2 - root*root
            assert vp(corrected, p) == 2*m-2*r
            newton += 1

linear = 0
for p in [3, 5, 7, 11, 13]:
    for r in range(1, 6):
        for excess in range(1, 8):
            m = 2*r + excess
            x = p**(m-r)
            assert p**r*x == p**m
            assert vp(x, p) == m-r < m
            linear += 1


def mul(a, b, p):
    # Free O-basis 1,s,y,sy of O[s,y]/(s^2-p,y^2-p).
    out = [0]*4
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            si, yi = i % 2, i // 2
            sj, yj = j % 2, j // 2
            se, ye = si+sj, yi+yj
            out[se % 2 + 2*(ye % 2)] += ai*bj*p**(se//2+ye//2)
    return out


tensor = 0
for p in [3, 5, 7, 11, 13]:
    minus, plus = [0,-1,1,0], [0,1,1,0]
    assert any(minus) and any(plus)
    assert mul(minus, plus, p) == [0,0,0,0]
    tensor += 1

print(f'{recurrences} precision steps; {newton} Newton corrections; '
      f'{linear} precision-loss examples; {tensor} tensor zero-divisor checks')
~~~

## Complete-local continuation inventory and checks

| ID | Item | Status |
| --- | --- | --- |
| L03 | Krull separation for finite local modules | library |
| L04 | Finite torsionfree modules over a PID are free | library |
| L05 | Continuous evaluation of multivariate power series | library |
| L06 | Exactness of completion on finite modules | library |
| L07 | Finite-module completion as scalar extension | library |
| Z15 | Saturated jets at a DVR-valued point | missing |
| Z16 | Chevalley cofinality for complete local modules | missing |
| Z17 | Saturated point jets are finite free | missing |
| Z18 | Generic jets equal the rational local jets | missing |
| Z23 | Regularity survives completion at a rational point | missing |
| Z19 | Power-series coordinates with a specified coefficient field | missing |
| Z24 | Complete local tensor product and presentation | planned |
| Z20 | Integral tensor jets are exact quotients | missing |
| Z21 | The inverse limit of generic box jets | missing |
| Z22 | The integral completed tensor embeds in generic point jets | missing |

Paper/intake validators, exact ID and source-finding preservation, one route per missing item, definition API coverage and DAG checks. Fresh SymPy/integer/Fraction diagnostics: 8 symbolic saturation ideals, 1 unsaturated-torsion control, 2600 generic jet products, 24336 transition products, 24336 associativity triples, 5624 box-filtration monomials, 144 adic-topology bounds and 48 denominator controls. Code reproduced in report. These diagnostics do not prove the general theorem; previous appendix CAS/precision checks inherited, not rerun. No Lean file compiled.

Run the following with Python and SymPy 1.14.0. The symbolic calculation takes place over Q[π,x,y] and checks finite-jet formulas; the written proof supplies the general DVR statement.

```python
from itertools import product
from fractions import Fraction
from collections import Counter
import sympy as S
counts=Counter()
p,x,y,z=S.symbols('p x y z')
f=p*y-x*x
for n in range(1,9):
    generators=[x**a*y**(n-a) for a in range(n+1)]
    sat=S.groebner([f,*generators,1-z*p],z,p,x,y,order='lex')
    eliminated=[g.as_expr() for g in sat.polys if not g.as_expr().has(z)]
    expected=[f,y**((n+1)//2),x*y**(n//2)]
    E=S.groebner(expected,p,x,y,order='lex')
    G=S.groebner(eliminated,p,x,y,order='lex')
    assert all(E.reduce(g)[1]==0 for g in eliminated)
    assert all(G.reduce(g)[1]==0 for g in expected)
    counts['symbolic_saturation_ideals']+=1
G=S.groebner([f,x*x,x*y,y*y],p,x,y)
assert G.reduce(y)[1]!=0 and G.reduce(p*y)[1]==0
counts['unsaturated_torsion_controls']+=1
# m_w = x^(w mod 2)*y^(w//2); m_i*m_j=p^carry*m_(i+j).
for prime in (2,3,5,7):
 for n in range(1,13):
    def mul(a,b):
        ca,i=a; cb,j=b
        return (0,0) if not ca or not cb or i+j>=n else (ca*cb*prime**((i%2)*(j%2)),i+j)
    def generic(a):
        c,i=a
        return (Fraction(c,prime**(i//2)),i) if c else (Fraction(0),0)
    for i,j in product(range(n),repeat=2):
        a,b=(1,i),(1,j); c=mul(a,b)
        if i+j<n:
            assert generic(c)==(generic(a)[0]*generic(b)[0],i+j)
        else:assert c==(0,0)
        counts['generic_jet_products']+=1
        for m in range(1,n+1):
            trunc=lambda a:(0,0) if a[1]>=m else a
            lhs=trunc(c)
            rhs=mul(trunc(a),trunc(b));rhs=trunc(rhs)
            assert lhs==rhs
            counts['transition_products']+=1
    for i,j,k in product(range(n),repeat=3):
        assert mul(mul((1,i),(1,j)),(1,k))==mul((1,i),mul((1,j),(1,k)))
        counts['associativity_triples']+=1
# Box versus total degree, including the sharp boundary counterexample.
for h in range(1,5):
 for n in range(1,7):
    threshold=h*(n-1)+1
    for exps in product(range(n+1),repeat=h):
        box=any(a>=n for a in exps)
        assert not sum(exps)>=threshold or box
        assert not box or sum(exps)>=n
        counts['box_filtration_monomials']+=1
    assert sum([n-1]*h)==threshold-1 and not any(a>=n for a in [n-1]*h)
    for q in range(1,7):
        # Every nonzero term in (p,N)^(q+threshold-1) has N exponent<threshold.
        degree=q+threshold-1
        for nexp in range(threshold):assert degree-nexp>=q
        counts['adic_topology_bounds']+=1
# Localization of the inverse limit does not allow unbounded denominators.
for prime in (2,3,5,7):
 for bound in range(12):
    assert (Fraction(prime**bound,prime**(bound+1))).denominator==prime
    counts['denominator_controls']+=1
print(dict(counts))
```


## Compact-image supplier continuation (cc-fb70e5)

This pass closes the two proof suppliers that **A37** — "if `Γ` is profinite and `r : Γ → G_n(Q̄_p)` is
continuous, its image lies in `G_n(K)` for a finite `K/Q_p`" — had been carrying as named obligations, and
which the `global-descent-supplier-atoms` gap listed first.

**L75 — Baire, in the form the argument uses.** Mathlib's
`nonempty_interior_of_iUnion_of_closed` (`Topology/Baire/Lemmas.lean:257`) says that in a nonempty Baire
space, if countably many *closed* sets cover the space then one of them has nonempty interior; the instance
`BaireSpace.of_t2Space_locallyCompactSpace` (`Topology/Baire/LocallyCompactRegular.lean:23`) supplies the
Baire hypothesis for a compact Hausdorff space, which is what the image of a profinite group is. Both were
read in the source at pinned `082e2d3`.

**A85 — countability of the finite extensions.** Fix `Q̄_p`. Every finite `K ⊂ Q̄_p` is separable
(characteristic 0), so `K = Q_p(x)` with `x` of degree `n = [K : Q_p]`. Since `Q` is dense in `Q_p`, take a
monic `g ∈ Q[X]` of degree `n` with coefficients close to those of the minimal polynomial of `x`; root
continuity gives a root `y` of `g` closer to `x` than any other conjugate of `x`, and **Krasner's lemma**
then puts `x ∈ Q_p(y)`, so `K = Q_p(y)` by degrees. The roots in `Q̄_p` of polynomials over `Q` form a
countable union of finite sets, so there are countably many such `K`. Finiteness in each degree is true but
is not needed: A37 needs only a countable closed cover.

**L76 — Krasner's lemma, pinned.** `IsKrasner.krasner` (`Analysis/Normed/Field/Krasner.lean:63`), with the
class at `:56` and the instance `IsKrasner.of_completeSpace` at `:117` which supplies the hypothesis for a
complete nontrivially normed ultrametric `K` and an algebraic normed `K`-algebra. The statement recorded in
the item is the pinned one, including the splitting hypothesis on the minimal polynomial.

A37 now lists A85 and L75 as prerequisites, and its proof outline names them instead of the two open
suppliers. The gap's first obligation is struck and replaced by a sentence saying what closed it.

## Global analytic suppliers for the Whittaker chain (cc-d67081)

The handoff's first resume item asked for the global analytic suppliers that A66–A73 had been
consuming without an explicit chain: compact additive-character duality and Fourier uniqueness,
compatible quotient Haar measure and Fubini, smooth-globalization continuity, and the
finite-place Flath factorization. Route 20's own reason already *named* two of these — "Import
AL.0 Fourier uniqueness, AA.2 quotient measures" — without there being items to point at. Four
items now supply them, and each goes to a layer whose own description already promises the
general theorem, so all four are source additions and none needs new ground.

**A104 — characters of `F\A` and Fourier uniqueness.** Owner `AutomorphicLFunctionsAndLocalFactors:AL.0`,
which already builds self-duality of the local additive groups, the restricted tensor-product
adelic space, Fourier inversion and adelic Poisson summation. The specialisation the Whittaker
theory needs is that `γ ↦ ψ_γ` identifies `F` with the dual of the **compact** group `F\A`, so a
continuous function on it with all Fourier coefficients zero vanishes — and the same over the
successive additive quotients of the unipotent filtration, which is the form A67 and A68 consume
when they peel one row at a time. This is Cogdell's "by standard duality theory the additive
characters of the compact group `k\A` are isomorphic to `k`" (PCMI notes, printed 6). Only the
uniqueness half is asked for; pointwise convergence of the Fourier series is not claimed, and the
continuity hypothesis is recorded as load-bearing, since an `L¹` function with vanishing
coefficients vanishes only almost everywhere.

**A105 — compatible invariant probability measures.** Owner `AdelicAlgebraicGroups:AA.2`, whose
description already undertakes to "construct invariant quotient measures by Weil's integral
formula and prove their independence of measurable fundamental-domain choices". A105 specialises
that to unipotent radicals, where the quotient is compact so the invariant measure normalises to
a probability measure, and records that the normalisations along a filtration with abelian
successive quotients agree — which is exactly what licenses the iterated integration of A67 and
A68 and the phrase "compatible with the successive additive quotients" that A66 had been
asserting. The unimodularity hypothesis is kept explicit: for the Borel of `GL₂` there is no
invariant quotient measure at all, so the item records what the hypothesis is doing.

**A106 — continuity on the smooth globalization.** Owner `AutomorphicFormsOnReductiveGroups:AF.1`,
added to route 20's stage list, since AF.1 is where the smooth moderate-growth Fréchet
globalization is constructed and is explicit that "these analytic globalization proofs are
targets, not an assumed black box". A106 records only that the Whittaker integral is *continuous*
for that topology: the integrand is bounded on a compact domain by one of the defining seminorms,
so `|W_ψ(φ)(g)|` is controlled by a seminorm of `φ`. This is what makes A70's "nonzero continuous
functional" meaningful, and it is why A70 is stated on the smooth globalization rather than on the
`K_∞`-finite Harish–Chandra module — a functional on the latter need not extend continuously.

**A107 — one-place abstract factorization.** Owner `AutomorphicFormsOnReductiveGroups:AF.2`, which
already owns restricted tensor-product factorization and uniqueness of almost-everywhere spherical
vectors. A107 is the single-place grouping `V_Π ≅ V_{Π_v} ⊗_C V^v` that A71 consumes, obtained by
splitting the restricted tensor product at one finite place and absorbing the archimedean factor
into `V^v` — which is why `V^v` is asked only to carry a smooth action and no topology.

The item carries Cogdell's own caveat verbatim, because A71 depends on it: the decomposition **is
abstract** and "does not give a factorization of automorphic forms into a product of functions on
the local groups `G(k_v)`". A71 chooses a `w ∈ V^v` to detect a given global functional, which is
legitimate for an abstract tensor decomposition; a factorization of forms into local functions is
not available and is not claimed anywhere in this chain.

### Sources read for this continuation

Bounded supplier reads only; the inherited main-paper reading stands and is not restated.

- Cogdell, *L-functions and Converse Theorems for GL_n*, author-hosted PCMI notes (2002), SHA-256
  `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a`, read 23 September 2026:
  Lecture 1, printed 5–6 (PDF 9–10), the Fourier expansion and the duality statement. Printed page
  = PDF page − 4. *Note for later workers: this PDF's text layer drops the letter `c` throughout
  ("Le ture", "multipli ity"), so quotations from it must be read against the page image or
  reconstructed with care.*
- Cogdell, *Lectures on L-functions, Converse Theorems, and Functoriality for GL_n*, Fields
  Institute notes (2003), SHA-256
  `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`, read 23 September 2026:
  Theorem 3.2 and Corollary 3.2.1 with the abstractness caveat, printed 23–24 (PDF 27); the smooth
  Fréchet topologies on `(A^∞)^L`, printed 24 (PDF 27); Theorem 3.4, printed 24–25 (PDF 28).
  Printed page = PDF page − 3. This PDF's text layer is clean.

No new findings were recorded: nothing in the supplier passages contradicts what the items assert,
and the 52 inherited findings are unchanged.

## The mirabolic induction, proved against the source (cc-d67081, second pass)

The previous pass supplied A66–A73's analytic inputs (A104–A107) but left its own first resume
item open: **A67 and A68 carried no `proofSteps` at all.** They stated the Piatetski-Shapiro–
Shalika peeling and its inductive step as planning adapters. Both now carry a step-by-step proof
read against Cogdell's proof of Theorem 1.1, together with three typed tests each. No item was
added or removed and no route changed; only those two items differ.

**A67 — one round of peeling.** Five steps. Restriction of a cusp form to `P_n(A)` keeping left
`P_n(F)`-invariance and the constant-term vanishing; Fourier expansion along `Y_n ≅ F^{n-1}`
using **A104** on the compact quotient `Y_n(F)\Y_n(A) = (F\A)^{n-1}` with Cogdell's pairing
`⟨x,y⟩ = Σ x_i y_i`, integrated against **A105**'s probability measure; the vanishing of the zero
coefficient, which is the *only* place cuspidality enters, `Y_n` being a standard unipotent
subgroup of `GL_n` inside `P_n`; the two-orbit decomposition of `F^{n-1}` under `GL_{n-1}(F)`
with the change of variable giving `C_{eγ}f(p) = C_e f(diag(γ,1)p)` and the indexing by
`P_{n-1}(F)\GL_{n-1}(F)`; and the conclusion, where **A104's uniqueness half** is what turns
"every coefficient vanishes at `p`" into `f(p) = 0`. That last implication is what A69 consumes.

**A68 — the inductive step.** Four steps. The equivariance `C_e f(yp) = ψ(y_{n-1})C_e f(p)` for
`y ∈ Y_n(A)`, which gives left `Y_n(F)`-invariance precisely because `ψ` is trivial on `F`; left
`P_{n-1}(F)`-invariance of `f'_p`, from A67's equivariance and the fact that `P_{n-1}` fixes `e`;
the descent of cuspidality, with the `n = 2` base where `P_1 = {1}` and there is nothing to
check, which is where Cogdell says "This then begins our induction"; and the Whittaker identity
`W_{f'_p}(p') = W_f(diag(p',1)p)`, obtained by unfolding `N_n = N_{n-1} ⋉ Y_n`.

**Where A105 is load-bearing.** The unfolding in A68's last step turns one integral over
`N_n(F)\N_n(A)` into an iterated integral over `N_{n-1}(F)\N_{n-1}(A)` and `Y_n(F)\Y_n(A)`. If
those three invariant measures were normalised independently, the two sides would differ by a
constant and the identity as stated would be false. A105's compatibility is exactly what
removes that constant, and the test `A68.measure_compatibility_used` records it as a
non-example so a later builder cannot quietly weaken A105 to "an invariant measure exists".

### Source read for this pass

Cogdell, *L-functions and Converse Theorems for GL_n*, PCMI notes (2002), SHA-256
`09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a`: the proof of Theorem 1.1,
printed 7–9 (PDF 11–13), read in full — the restriction to `P_n`, the Fourier expansion along
`Y_n`, the orbit decomposition, the `n = 2` base, and the unfolding computation ending
`W_{φ'_{δp}}(δ') = W_φ(δ'δp)`. Printed page = PDF page − 4. The warning recorded last pass
stands and was needed here: this PDF's text layer drops the letter `c` throughout, so the
quotations in the items were reconstructed with that in mind.

No new findings: Cogdell's argument is as the items now describe it, and the 52 inherited
findings are unchanged.

## Whittaker chain: A69 and A70 proved (cc-fb70e5)

The previous handoff named A69 and A70 as the frontier of the global Whittaker chain: A67 and A68 had
step-by-step proofs and A104–A107 supplied the analytic inputs, leaving the injectivity statement and the
existence of the functional as outlines. Both now carry proofs, in the same style and against the same
source.

**A69 — the Whittaker transform is injective on cusp forms.** Seven steps. The base case `n = 1` is the
identity map. The induction runs on mirabolic functions: A68's identity exhibits `W_{f'_p}` as a
restriction of `W_f`, and A68's descent makes `f'_p` cuspidal on the smaller mirabolic, so the induction
hypothesis gives `C_e f(diag(p',1)p) = 0`, hence `C_e f ≡ 0`. A67's two-orbit decomposition turns that into
the vanishing of *every* Fourier coefficient (the `0`-orbit term is where cuspidality enters), and A104's
uniqueness half — `γ ↦ ψ_γ` identifies `F^{n−1}` with the character group of the compact `(F\A)^{n−1}` —
gives `f = 0`. The cusp-form case follows by applying the mirabolic case to each right translate. Cogdell
states the consequence in one sentence (Fields notes, printed 31): "since we can recover `φ` from `W_φ`
through its Fourier expansion we are guaranteed that `W_φ ≠ 0` for all `φ ≠ 0`".

**A70 — a nonzero cuspidal representation has a nonzero Whittaker functional.** Five steps: the integral
converges over the compact `N_n(F)\N_n(A)` with A105's probability measure and is continuous by A106;
equivariance is the defining identity at `g = 1`; nonvanishing comes from A69 through the translation
`Λ(Π(g)φ) = W_φ(g)`; and the fourth step records *why the continuous functional is the right object* — at
an archimedean place the algebraic Whittaker functionals on the K-finite vectors have dimension `n!`, of
which only one extends continuously (Cogdell, printed 32, remark (ii)). That is now also a `non-example`
test on A70. The fifth step fixes the scope: no uniqueness is claimed here, and genericity of the local
components (Cogdell's Corollary 4.1.2) is reached through A71, not asserted.

**Locators verified.** Both items' inherited Cogdell locators are correct: PDF page 35 is printed page 31,
PDF 36 is printed 32, and PDF 37 is printed 33, carrying Corollary 4.1.2 and the displayed
`Λ(φ) = W_φ(e) = ∫_{N(k)\N(A)} φ(n)ψ^{−1}(n) dn`.

## A71, the finite-place functional (cc-d67081, third pass)

With A69 and A70 proved by the previous checkpoint, A71 was the last step of the Whittaker
chain still carrying no proof. It now has five steps, read against Cogdell's Fields notes
printed 33, where Corollaries 4.1.1–4.1.3 sit. Nothing else changed: 580 items, 23 routes,
52 findings, and only A71 differs.

The argument is short, and the item's own warning — "the frozen `w` must be chosen to detect
`Λ`; an arbitrary reference tensor need not work" — is what the first step is about. Since `Λ`
is nonzero and elementary tensors span `V_{Π_v} ⊗_C V^v`, there are `x_0` and `w` with
`Λ(x_0 ⊗ w) ≠ 0`; that `w` is frozen. For a general `w` the functional `x ↦ Λ(x ⊗ w)` can be
identically zero, which is why the choice cannot be made arbitrarily. Setting
`λ_v(x) = Λ(x ⊗ w)` then gives a nonzero linear functional, and the equivariance is immediate
from the one hypothesis A107 supplies — that `N_n(F_v)` acts only on the first factor — together
with `ψ_N|_{N_n(F_v)} = ψ_v`. A nonzero `ψ_v`-equivariant functional on an irreducible admissible
representation is a Whittaker functional, so `Π_v` is generic.

**What the item deliberately does not claim.** Cogdell's Corollary 4.1.1 gives *global*
uniqueness and his Corollary 4.1.3 factorises `W_φ` as `∏_v W_{ξ_v}(g_v)` for decomposable `φ`.
The latter needs the normalisation stated just above those corollaries: a family `{Λ_v}` is
*suitable* only when `Λ_v(ξ_v^0) = 1` for the distinguished `K_v`-fixed vectors giving the
restricted tensor product. A71 asserts existence of a nonzero local functional at **one** place
and neither the product formula nor that normalisation, so it needs neither — and the fifth step
records this, with Cogdell's own caveat on the same page as the reason to keep the distinction:

> Note once again that the cusp form `φ(g)` itself does not factor. The `G(k)`-invariance mixes
> the various places together. Only `W_φ` factors for decomposable `φ`.

That is the same caveat A107 carries, and the two now agree in terms.

### Source read for this pass

Cogdell, *Lectures on L-functions, Converse Theorems, and Functoriality for GL_n*, Fields
Institute notes (2003), SHA-256 `2c5ec050…18a7`: printed 33 (PDF 36) — the suitable-family
normalisation, Corollary 4.1.1 (Global Uniqueness), Corollary 4.1.2 (genericity of `π` and each
`π_v`), Corollary 4.1.3 (Factorization of Whittaker Functions) and the caveat following it.
Printed page = PDF page − 3; this PDF's text layer is clean.

No new findings.

### Continuation, 23 September 2026 (Claude Code, `cc-7b31c4`): the Z57–Z59 supplier obligations are named

Three items in the analytic-regularity chain ended their own proofs by saying that a step rested on
something the extraction had not named. `Z57` called "the regular-map criterion and this faithful-flat
descent … explicit remaining supplier obligations, not baseline results"; `Z58` left its
characteristic-`p` formal-fibre and Cohen-structure inputs "an explicitly recorded source/declaration
audit gap"; `Z59` said "the flat local dimension formula and maximal-ideal generator comparison need
their exact supplier audit". This pass turns all of that into items, and the three proofs now point
at them.

**Z76 — regular ring maps.** Flat, with Noetherian and *geometrically* regular fibres, plus stability
under finite type base change (Stacks **07BZ**, Definition 15.42.1; **07C1**, Lemma 15.42.3). Its
second step records the distinction that matters downstream: over an imperfect residue field
geometric regularity is strictly stronger than regularity of the fibre, which is exactly why the
characteristic-`p` case cannot be settled fibrewise.

**Z77 — the dimension formula.** `dim(S_q) = dim(R_p) + dim(S_q/pS_q)` for a Noetherian ring map
satisfying going down (Stacks **00ON**, Lemma 10.112.7; the flat case of going down is **00HS**). The
statement is for going down rather than flatness, because that is the hypothesis the proof uses; only
the `≥` half needs it.

**Z78 — faithfully flat descent.** Noetherianity (Stacks **033E**) and regularity (Stacks **07NG**)
pass from the *target* to the *source*. The statement says so explicitly, because this is easy to
confuse with ascent — which is `Z59`, under a fibre hypothesis — and `Z57` needs the descent
direction, to carry regularity back from the maximal-ideal completion to the localised `I`-adic one.

**Z79 — G-rings.** The definition (Stacks **07GH**) and stability under essentially finite type maps
(Stacks **07PV**, Proposition 15.51.10). The characteristic-`p` content `Z58` flagged is carried in
`Z79`'s second step rather than silently closed.

**Checked against the pins before adding.** None of the four is in Mathlib or Tau Ceti at
`082e2d3`/`f790474`: there is no G-ring or geometric-regularity API, no flat local dimension formula,
and no faithfully-flat descent of ring regularity — `RingTheory.Sequence.IsRegular.of_faithfullyFlat_of_isBaseChange`
is about regular *sequences*. What is there, and already pinned, is the regular-local-ring criterion
(`L19`) and the generator bound (`L18`), and `Z59` now cites `L18` by name for the step that needs it.

All four go to route 7, `SchemeAndStackFoundations` SF.0/SF.1/SF.4/SF.5, which their own `note`
fields name as the owner and where `Z57`–`Z59` already sit. No new route and no new roadmap; 608
items, 478 internal prerequisite edges, still acyclic.


## Attributed handoff from the preceding continuation

# LLHLM23 — current handoff

Claude Code — cc-7b31c4, issue #1254, 23 September 2026. Continues codex-7e92bd's pass. Status **partial**.

Census: **608 items (101 library, 25 planned, 482 missing), 24 routes, 53 unreviewed findings.** Last IDs: **A107, Z79, L101, E53.** Four items added (Z76–Z79), three modified (Z57–Z59), no item removed; `source`, `sourceData` and `sourceIssues` are byte-identical to the inherited file.

## Completed this pass (cc-7b31c4)

**The three named supplier obligations of Z57–Z59 are closed as items.** Each of those three proofs ended by saying, in its own words, that a step rested on something the extraction had not yet named — the regular-map criterion and faithful-flat descent for Z57, finite-type stability of G-rings for Z58, the flat local dimension formula and the maximal-ideal generator comparison for Z59. All four are now items with their Stacks statements read at the tags, and the three proofs point at them instead of at an open obligation.

- **Z76** — regular ring maps: flat with Noetherian geometrically regular fibres, and stability under finite type base change. Stacks **07BZ** (Definition 15.42.1) and **07C1** (Lemma 15.42.3). Its second step records what actually matters downstream: geometric regularity is strictly stronger than fibre regularity over an imperfect residue field, which is why the characteristic-`p` case cannot be done fibrewise.
- **Z77** — the dimension formula `dim(S_q) = dim(R_p) + dim(S_q/pS_q)` for a going-down (e.g. flat) map of Noetherian rings. Stacks **00ON** (Lemma 10.112.7), with the flat case of going down at **00HS**. The statement is deliberately for going down rather than flatness, since that is the hypothesis the proof uses.
- **Z78** — faithfully flat **descent**: Noetherianity (Stacks **033E**, Lemma 10.164.1) and regularity (Stacks **07NG**, Lemma 10.164.4) pass from the target to the source. Its statement says explicitly that this is not ascent, which is Z59 under a fibre hypothesis — the two are easy to conflate and Z57 needs the descent direction.
- **Z79** — G-rings: the definition (Stacks **07GH**, Definition 15.51.1) and stability under essentially finite type maps (Stacks **07PV**, Proposition 15.51.10). The characteristic-`p` formal-fibre and Cohen-structure content that Z58 flagged is carried in Z79's second step rather than silently closed.

**Checked against the pinned libraries before adding.** None of these four is in Mathlib or Tau Ceti at the pins: there is no G-ring or geometric-regularity API, no flat local dimension formula, and no faithfully-flat descent of regularity (`RingTheory.Sequence.IsRegular.of_faithfullyFlat_of_isBaseChange` is about regular sequences, not regular rings). What *is* there, and is already pinned by the extraction, is the regular-local-ring criterion (L19: `isRegularLocalRing_iff`, `IsRegularLocalRing.iff_finrank_cotangentSpace`) and the generator bound (L18); Z59 now cites L18 by name for the step it needs.

**Routing.** All four go to route 7, `SchemeAndStackFoundations` SF.0/SF.1/SF.4/SF.5, which is where Z57–Z59 already sit and which their own `note` fields name as the owner. No new route, no new roadmap.

## Resume in order

1. **Finish `analytic-regularity-suppliers`.** The Z57–Z59 branch is now closed at the level of naming; what remains in this queue is the affinoid closed-ideal and presentation-topology adapters that Z60's chain still leans on, and Z56's flatness inputs. Check the pinned library and the shared owner before adding atoms, as before.
2. Continue the other existing gap queues: approximation/tensor carrier maps, remaining source proof leaves and bundled conclusions, item-level declaration audit, and fine-grained shared-owner reconciliation. A104–A107 are the named Fourier/Haar/globalization/Flath suppliers and A73 assembles them; preserve A78–A103. The withdrawn White preprint is not a substitute for valid Labesse inputs.
3. **The proof-leaf backlog is the largest single queue and is worth a census before it is worked.** A count over the current file gives **355 theorem items with no `proofSteps`**, of which **287 have no `proofOutline` either**; by prefix they are L 97, A 66, N 40, K 31, G 30, U 25, M 23, B 20, Q 9, P 8, V 5, Z 1. The L block is mostly library-pinned statements where a proof step is not the right deliverable, so the real frontier is the A, N, K and G blocks. Whoever takes this should say which block they are working and keep the same one-item-at-a-time discipline; a pass that adds outlines everywhere and proofs nowhere would be worse than none.
4. Appendix B still needs uniform integral-parameter certificates, exceptional denominator loci, minimal primes and specialized Gröbner cases. Existing rational generic calculations do not establish every allowed characteristic or specialization.
5. The 53 findings remain **unreviewed**; no `kind:review` job for this paper has run. Do not treat any of them as confirmed.

## Evidence and checks

The full 212-page main read remains attributed to the earlier extraction and is not restated. This pass read only the Stacks statements for the four new items, at the tags cited and on 23 September 2026: 07BZ, 07C1, 00ON, 033E, 07NG, 07GH and 07PV, each fetched from stacks.math.columbia.edu and transcribed from the statement environment. The pinned-library search that established the four are absent was run against the same declaration index the lane uses for Mathlib 082e2d3 and Tau Ceti f790474.

Verified this pass: 608 unique IDs with four added (Z76–Z79) and none lost; **only Z57, Z58 and Z59 modified** among the inherited items; `source`, `sourceData` and `sourceIssues` byte-identical to the inherited file; 478 internal prerequisite edges, all resolving and **acyclic**; all 482 missing items carry exactly one route, with no double-routing and no routed id that is not an item; all 25 planned items and all 24 route stages resolve; all 164 definitions and constructions retain their APIs and tests; `check_paper.py` and `intake.py check-files` both pass. Three deliverables touched: the result, the report and this handoff.

## Continuation — Appendix B proof steps (cc-fb70e5, 23 September 2026)

This pass closed the **Appendix B (Q) cluster**: `proofSteps` for Q03, Q04, Q05, Q06, Q08, Q09, Q10, Q11 and
Q12, with prerequisite edges for eight of them. Nothing else changed — the census stays at 652 items, 24
routes and 61 unreviewed findings, all inherited ids, `sourceData` and findings preserved. The theorem-like
proof backlog falls from 191 to 182 and now contains no Q items. `LocModels.pdf` re-verified against the
recorded `e5647879…`; PDF 202–209 read fresh (Propositions B.0.1, B.0.2, Corollaries B.0.4, B.0.5, Remark
B.0.6). Table 1 (PDF 207) was not re-read, so Q09 still rests on the earlier rotated-image transcription.

**The finding that matters for the blueprint: Appendix B's harder steps are Macaulay 2 computations with no
printed certificate, and they are load-bearing rather than decorative.**

- **Q06.** Proposition B.0.1(4) — that the ideal `H` of 3×3 minors of the relative Jacobian contains `t³` —
  is justified in the paper by one sentence: "The last item follows from by a computation in Macaulay 2."
  The resulting exponent `r = 3` is consumed both by Proposition 3.3.9 and by Corollary B.0.5's depth bound
  (`m − 6 + 3 > 6`, giving `m ≥ 10`). So an uncertified exponent does not stay local: it propagates into the
  depth-ten hypothesis and into the polynomial `P(X,Y,Z) = ∏_{m=0}^{10}(X−Y−m)(Y−Z−m)(Z−X−m)` printed in
  Theorem 7.3.2's statement. The obligation recorded on Q06 is an explicit `t³ = Σ hᵢmᵢ` over
  `Z[t,a,b][1/P]`, uniform in `(a,b)`, together with the exceptional denominator locus.
- **Q08.** Normality of the partial normalization after specialization is proved by *"running Buchberger's
  algorithm"* on the image of the ideal in `F[W,c₁₂,c₁₃,d₂₁,c₂₂,d₃₁,d₃₃]` — that is, with `(a,b)` specialized
  into a field. That certifies one fibre, not the family. The obligation recorded is a comprehensive
  (parametric) Gröbner system over `Z[a,b][1/P]` with its denominator locus, or a direct check of Serre's R1
  and S2.
- **Q09.** Proposition B.0.2(3)'s decomposition is "a direct computation in Macaulay 2", presented as Table 1.
  Q10 consumes exactly one row of it set-theoretically, so the blast radius of an error in a row is that
  component's unibranch analysis alone — worth recording, because it bounds what the re-derivation must
  secure first.

The rest of Appendix B is genuine mathematics and is written out as such: the monodromy elimination of six
chart coefficients, which uses **both** t-torsion-freeness and invertibility of `P(a,b)` (Q03); the seven
minimal primes of `Spec R/t` and, what is actually consumed downstream, their codimension-three count (Q04);
Stacks **Tag 00R4** turning that count into a complete intersection, regularity of `t`, and the density of
`Spec R[1/t]` in `Spec R` that upgrades Q03's closed immersion to an equality (Q05); the contradiction
argument deriving `O`-flatness from topological flatness and reducedness of the special fibre (Q08); the
identification of `π⁻¹(C) → C` with an irreducible quadric double cover of `𝔸³_F`, generically finite étale
of degree two, whence a Zariski-dense locus that is not geometrically unibranch on the component
`(c₂₂,c₁₃,c₁₂)` (Q10); and the deduction `m ≥ 10` together with the non-`λ′`-admissibility of `z̃` that gives
`X^{λ,τ}(z̃) ≅ U(z̃,λ,∇)` (Q11). Q12 records that the product extension to general `J` and general unramified
`K/ℚ_p` turns on products preserving reducedness, and is **not** a general preservation theorem for
unibranchness.

Two scope cautions are written into the steps because they are easy to lose: Q04's seven ideals are minimal
primes only, with no multiplicity and no reducedness claim about the original special fibre (reducedness
appears only after normalization, in Q08); and Q10's second half refutes a blanket unibranch expectation on
the special fibre while leaving `z̃` itself unibranch by its first half.

## Continuation — §6 and §9 proof steps, and the library citations (cc-7b31c4, 23 September 2026)

This pass closed **two whole clusters**: `P` (§6, patching functors) and `V` (§9, the global Serre-weight
and modularity-lifting applications). `proofSteps` were written for **P09–P16** and **V07, V09, V11, V12,
V13**, with prerequisite edges on eight of them. Nothing else in the census changed: 652 items, 24 routes,
61 unreviewed findings, all inherited ids, `sourceData` and findings preserved. The missing-theorem proof
backlog falls from **241 to 228** and now contains no `P`, `Q` or `V` item; what remains is
`A` 58, `N` 40, `K` 31, `G` 30, `U` 25, `M` 23, `B` 20, `Z` 1. `LocModels.pdf` was re-fetched and its hash
re-verified against the recorded `e5647879…`; PDF 127–131 and 183–187 were read fresh for this pass.

**Two things about §6 and §9 are worth carrying into the blueprint, because they are easy to lose.**

- **The two hypotheses of Proposition 6.2.3 are genuinely alternative, and are proved differently.** The
  `(6n−2)`-generic case runs one place at a time through an arithmetic cohomology functor; the
  `(2n−1)`-deep plus `4n`-generic case builds a type `τ(w, ŵ_h·λ+η)` and argues by absence of a
  potentially crystalline lift. Collapsing the two thresholds to the weaker one is not licensed. P09 records
  both routes separately.
- **§9's two main statements are one- and two-line deferrals, and the steps say so.** Theorem 9.1.6 is
  "follows from Lemmas 9.1.10 and A.1.1" — so V07 carries both lemmas as owned obligations and records the
  genericity polynomial explicitly, as the product of `P_{6n−2}`, `P_{2η,e}`, `P_{η₀η,e}` and the `Q` of
  Lemma 9.1.9 named in Remark 9.1.7(1). Theorem 9.2.1 is "follows from Theorem 7.3.2 from standard base
  change and Taylor–Wiles patching arguments" — so V12 spells out the chain a blueprint must own (solvable
  base change, the patched module for the definite unitary group of §9.1, the support argument that consumes
  the domain property of Theorem 7.3.2, and the descent), and keeps Remark 9.2.2(2)'s own admission that the
  inexplicit `P_{λ+η,e}` makes the theorem impractical to apply. V13 records that the change-of-weight
  relaxation is paid for by enlarging that polynomial, and names which factors are added.

Lemma 9.1.10 (V11) is where the real work of §9.1 sits, and its steps keep the structure the proof has: an
easy inclusion from Proposition 6.2.3, a **defect-lowering claim** proved with a strictly defect-lowering
type, and a hard inclusion combining four separate inputs — maximal Cohen–Macaulayness of `M_∞(σ°(τ))` over
`R_∞(τ)`, the domain property of `R^τ_ρ̄` from Theorem 7.3.2(2), nonvanishing from Proposition 6.2.7, and the
component description of Theorem 7.4.2(1). The scope caution written into V11 is that the lemma assumes only
**weak and detectable**: no minimality, no rank-one hypothesis; the minimal functor appears only as an
auxiliary object inside the last step.

### Library citations, corrected and flagged

The extraction carried no `libraryPins`; they are now recorded (Mathlib `082e2d3`, Tau Ceti `f790474`). Of the
**162** cited declarations, six did not resolve at those commits. Three were name changes and are **corrected
in place**:

| was | is | file |
|---|---|---|
| `mathlib:BaireSpace.of_t2Space_locallyCompactSpace` | `mathlib:IsGδ.baireSpace_of_t2Space_locallyCompactSpace` | `Mathlib/Topology/Baire/LocallyCompactRegular.lean:62` |
| `mathlib:IsLocalRing.linearCombination_bijective_of_flat` | `mathlib:Module.IsLocalRing.linearCombination_bijective_of_flat` | `Mathlib/RingTheory/LocalRing/Module.lean:294` |
| `mathlib:IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat` | `mathlib:Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:634` |

The other three were first flagged as unverified because the declaration index does not list them. **That
flag was wrong and has been withdrawn (23 September 2026): all three resolve in the pinned Mathlib source,
and the item notes now say where.**

- `mathlib:HenselianRing.is_henselian` (item `L77`) is the field of `class HenselianRing (R) [CommRing R]
  (I : Ideal R) : Prop` at `Mathlib/RingTheory/Henselian.lean:94–96`, and
  `mathlib:IsAdicComplete.henselianRing` is `instance (priority := 100) IsAdicComplete.henselianRing` at
  `Mathlib/RingTheory/Henselian.lean:170`.
- `mathlib:Module.Flat.instTensorProduct` (item `L55`) is the autogenerated name of the anonymous
  `instance {S} … [Flat S M] [Flat R N] : Flat S (M ⊗[R] N)` at `Mathlib/RingTheory/Flat/Basic.lean:232`;
  Mathlib refers to it by that name in the docstring at `Mathlib/RingTheory/Flat/Stability.lean:91`.

So all 162 citations resolve, 159 as written and three after the renamings above. The index misses class
projections, anonymous instances, and every declaration written as `instance (priority := …) Name`, of which
Mathlib has **1033** at this pin; a citation of any of those must be checked in the source, never rejected on
the index alone.

### Resume in order

1. **`N` (§2, 40 items)** and **`U` (§3, 25)** — the conventions and the Iwahori/Breuil–Kisin groundwork that
   everything downstream cites; closing them first makes the later clusters cheaper.
2. **`K` (§5, 31)** and **`M` (§4, 23)** — the local model theory, whose Corollary 5.5.8 and Theorem 5.3.1/5.3.3
   are consumed by P13 and by §7.
3. **`G` (§7, 30)** and **`B` (§8, 20)** — monodromy, potentially crystalline stacks and the global cycles.
4. **`A` (Appendix A, 58)** last: it is the largest, and Lemma A.1.1 is the one piece of it that §9 already
   depends on through V07, so its steps should be written with V07's obligations in hand.
5. The **61 findings still carry no verdicts**; they are the review job's business, not this one's.
