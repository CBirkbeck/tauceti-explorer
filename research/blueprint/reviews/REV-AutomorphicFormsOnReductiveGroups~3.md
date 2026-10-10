# Independent review: Automorphic forms on reductive groups, revision 3

**Completed review; verdict: needs_changes.** Job `REV-AutomorphicFormsOnReductiveGroups~3`, issue #7952; Codex session `codex-XcTF50`, 10 October 2026. This session authored none of the three blueprint rounds. This is a finished review, not a checkpoint. The packet, reader and suggested file have been corrected in place within this job’s scope.

The revision resolves the previous review’s 256 missing names and imports actual pinned Tau Ceti modules. One substantive correspondence defect remains: **AF.4/bhr-large-weight promises three conclusions, while its named native theorem states only part (ii)**. Parts (i) and (iii) have no faithful statements. Name availability and successful elaboration do not establish the advertised multi-part contract. The report therefore cannot accept this packet.

The separately recorded original-proof and supplier gaps do not by themselves reject this completed target-level pass. All seven stages remain planned, none closed, and every implementation remains unchecked. No atlas or upstream file is promoted or edited.

## Scope and counts

| Item | Result |
|---|---|
| Nodes | 100: 26 definitions, 25 constructions, 49 theorems |
| Review ledger | 80 verified, 19 corrected, 1 unverifiable full contract |
| Changed node records | 20, including the still incomplete BHR contract |
| Added/deleted nodes | 0 / 0; identifiers preserved |
| API / specified test contracts | 311 / 209; one prime-Hecke comparison added |
| Compiler name inventory | 360 distinct normalized main/API names, all present |
| Suggested examples | All 209 contracts have example coverage; shared examples cover some related tests; 23 named tests also receive explicit anonymous examples |
| Planets | 30, at most six in each stage |
| Pinned baseline | 57 declaration statements checked; one defining module corrected |
| Requests / gaps | 43 / 23; exact missing exports remain explicit |
| Sources / source findings | 35 / 19; eighteen findings confirmed, E8 rejected |
| Coverage | Seven planned stages, zero closed; packet status complete denotes the planning pass |
| Structural check | Zero errors and zero warnings |
| Lean check | Successful pinned-library elaboration; only admitted-proof warnings (see validation below) |

All 100 node statements, hypotheses, proof routes, prerequisites, APIs, tests and acceptance clauses were inspected. The packet’s full per-node ledger records the mathematical convention or scope checked, rather than a generic assurance. Sources were checked at the cited passages, with sections and printed pages preserved. This is not a claim to have read every original proof cited by a secondary source.

## Required correction

`TauCeti.Automorphic.GSp4.coherent_classification_largeWeight` quantifies a positive threshold for negative Pilloni compact weight, and concludes the two-limit classification from nonzero degree-zero or degree-one coherent cohomology. It faithfully represents part (ii).

It does not state either of these other promised targets:

1. Part (i): the BHR regularity criterion implying essential temperedness for an actual square-integrable automorphic representation. Specify the infinitesimal-character parameter, root hyperplanes, the quantified distance threshold and arithmetic/coefficient assumptions. The existing prose “far enough” is not a typed regularity condition. The current prerequisites do not turn that unspecified condition into a definition.
2. Part (iii): the general lowest-weight conclusion from H⁰ and the three-case nonvanishing/one-dimensionality classification with the required essential-temperedness and coefficient conditions. Existing GSp₄ contributing-degree calculations for supplied discrete/limit models do not classify an arbitrary irreducible representation with nonzero coherent cohomology.

BCGP21 §3.10, proof of Theorem 3.10.1, arXiv v3 p.73, explicitly supplies the secondary statement and distinguishes its essential-temperedness argument from the subsequent H⁰ argument without regularity assumptions. Pilloni Theorem 15.2.2.1(2), p.108, supplies part (ii). The original BHR and lowest-weight proof sources remain unread gaps. A faithful specification of the missing arithmetic/regularity conditions needs that mathematical refinement; an arbitrary `Prop` field, a conditional theorem assuming its own conclusion, or another model-existence equivalence would not correct it.

The node’s `nativeSignatureScope`, the AF.4 remaining list and the existing BHR gap now expose this defect. Preserve the three legitimate targets and supply their native statements. Do not shrink the target to part (ii) simply to make the correspondence count pass.

## Corrections made directly

| Region | Correction and evidence |
|---|---|
| Real points and baseline | `lieMap` is declared in `TauCeti/Geometry/Lie/Functor.lean`, not `Tangent/LieEquiv.lean`; its finite-dimensional real-model assumptions are retained. The separate tangent equivalence remains correctly cited in its own module. |
| Real orbit maps | Scope now agrees with the native finite-dimensional algebraic comodule action; no arbitrary singular target is asserted smooth. |
| Current upstream ownership | DifferentialGeometry Layers 0–1 supply the actual form carriers; AF owns the invariant subcomplex/comparison. RealAlgebraicGeometry Layer 6’s finite connected-cell CAD supplies component finiteness after the real-point embedding. Neither general theory is replanned. |
| Admissibility API | Replaced the vacuous `finrank < infinity` wording by finite-dimensional compact multiplicity spaces, matching the native predicate. |
| Weil group and LLC | Removed unrelated Gan–Ichino §6.1 p.22 attribution. Knapp §3, pp.401–403, supplies W_R; Theorems 2 and 5, pp.403 and 406, supply the real/complex GL_n correspondences. |
| Langlands classification | Added Knapp Theorem 1, pp.400–401, as the inspected real GL_n special case; it is not represented as a general-group proof. |
| Smooth automorphic topology | Removed an unsupported global LF/SLF assertion. The full carrier has its function-subspace topology and a union of fixed-level/type/central-ideal pieces; globalization consumes fixed-type finiteness. |
| Global Hecke module | Added the direct archimedean Hecke-algebra prerequisite used by its stated equivalence and projector argument. |
| Cusp decay | Franke §2.1, Theorem 5 and its explicit consequence are on printed pp.200–201, not p.202. |
| Cuspidal Hilbert order | Density now consumes discrete spectrum. Discreteness no longer consumes density. The independent corrected-kernel/compactness and elliptic-regularity obligations are explicit; decay of one function does not prove compactness of an operator. |
| Cuspidal spectrum prototype | Added pairwise orthogonality for inequivalent representation summands to the finite-multiplicity and dense-span statement. |
| SL₂ source locators | Zhang §13.3 spans pp.64–65; the Fourier/generation argument is not confined to p.64. |
| Maass normalization | Corrected classical T_p to p^(−1/2) times raw adelic R_p for compact volume one. Added `toAdelic_hecke`, using the actual `GL2.arithmeticForms` equivalence and local double-coset integral. |
| Algebraic weights | Chenevier–Taïbi’s coefficient definition is §1.4 p.8, not §1.3. Algebraic integration/isogeny constraints remain an RG Part II obligation. |
| Vogan–Zuckerman | General fundamental Cartan is b=t+a; the inducing parameter restricts to t for the lowest K-type. The full-character and compact-centre Hermitian specializations are distinguished. Vogan–Zuckerman §5, pp.73–75 and Proposition 6.19 p.84 were inspected. |
| BHR hypothesis | Restored essential temperedness to the three-case degree classification in BCGP21 p.73; retained the separately stated H⁰ lowest-weight assertion without a large-regularity assumption. The native defect described above remains. |
| Rationality source | Replaced BCG25 p.1 as a definition source by Harder–Raghuram §2.3.4, pp.14–15. BCG25 Remark 1.2, pp.3–4, is only cohomological context for the Clozel node. |
| Torsion source | Scholze’s introduction §6/Conjecture I.2 p.6 concerns torsion Betti eigensystems; the p.82 coherent/Satake passage does not supply the claimed definition. |
| Supplier status | AA, ALS, AS and SR.0 now have accepted packets; ShimuraData and SR.4 need changes and RG2 has no acceptance verdict. Updated stale availability claims while retaining requests for absent exact exports. |
| Class sets | AA’s ordinary class-number theorem has no discrete-centre hypothesis. The central-quotient set is a quotient of that finite set. Effective stabilizer finiteness and coefficient descent are still separate obligations. |
| Reader and tests | Synchronized all 20 changed node blocks, source findings, gaps, provenance and supplier status. Retained named test lemmas and supplied 23 matching anonymous examples. |

No baseline entry was removed, no new baseline declaration invented, and no helper node was added. The 57 checked entries include surrounding parameters at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Imported Tau Ceti source modules used by the shared build were compared with the pin. Existing low-degree cochains, semisimple highest-weight theory, compact averaging, tensor foundations and classical modular forms are consumed within their actual scope.

## Source findings

Every finding has this review’s independent `confirmed` or `rejected` verdict in the packet. Several previous allegations needed narrower scope even where a genuine mistake remains.

| Finding | Verdict and scope |
|---|---|
| E1 | Confirmed: compact-basis Casimir is k(k−2)/4; k=2 gives zero. |
| E2 | Confirmed: spherical invariant dimension is at most one, and can be zero. |
| E3 | Confirmed: specifying the holomorphic noncompact roots does not select a compact positive root. |
| E4 | Confirmed only for the extra chamber index in CG §5.3 p.21. Reject the previous allegations against the ambient rank-three torus and §2.0.1 back-reference. |
| E5 | Confirmed: Pilloni’s later chamber inequalities are empty; the compact wall must be excluded. |
| E6 | Confirmed: Pilloni p.108’s negative λ₁ requires −λ₁≥R, as its later specialization shows. |
| E7 | Confirmed: ρ need not satisfy the compact character-lattice parity condition; the rational character space is required. |
| E8 | Rejected: the alleged equal-length genus-two representatives do not exist. Retain the full parameterized uniqueness statement. |
| E9 | Confirmed: the coefficient lattice must involve the tensor product over the other p-adic places. |
| E10 | Confirmed within Goldring–Koskivirta Theorem 10.1.2/Remark 10.1.3’s published full-GL₂ obstruction. Removed the unsupported additional degree explanation. |
| E11 | Confirmed: naive forward matrix norm fails to control singular escape; inverse-dual/inverse-determinant enlargement is needed. |
| E12 | Confirmed only for Getz’s subsequent pure-vector description. Its displayed colimit on p.35 is already the correct linear construction. |
| E13 | Confirmed narrowly for the proof’s direct-sum submodule test in Proposition 7.9; removed the unsupported allegation against arbitrary complements in Lemma 7.10. |
| E14 | Confirmed for a missing irreducibility assumption in the proof and the separate §3.4 p.18 overstatement. Theorem 7.11(2)’s statement already assumes irreducibility. |
| E15 | Confirmed for labeling the Siegel-Levi longest element as the full longest element, in CG §2.0.1 p.7. |
| E16 | Confirmed: the compact projector requires dimension times the dual character, divided by compact volume. |
| E17 | Confirmed: the compact rotation generator needs the Cayley-transformed compact basis. The author’s book errata corroborates this different-edition correction; the uncleared book was not read. |
| E18 | Confirmed: direct-sum epsilon factors multiply epsilon factors, not L-factors. |
| E19 | Added and confirmed: Borel–Jacquet §1.1, printed p.189, uses a reciprocal dimension prefactor for its compact-type projector. Schur orthogonality requires dimension for probability Haar measure; a self-dual two-dimensional SU₂ type otherwise receives one quarter of the identity. AF’s existing projector is already correctly normalized. |

For E19, public searches and the IAS page for Langlands’ separate supplement yielded no correction to this formula. The AMS volume-endmatter request returned HTTP 403 and was not read. No claim of novelty is made. The source locator, mathematical countercheck and correction-search limits are recorded in the packet; no source passage is quoted.

All 35 source records retain public publication/author URLs and version information. Public PDF hashes were checked against the recorded versions where a hash is supplied. Goldring–Koskivirta’s published theorem labels were also checked; its arXiv copy is not silently given the publisher edition’s provenance. Borel–Jacquet §§1.1–4.8, pp.189–198 and Flath pp.179–182 were read in the maintainer-cleared Corvallis volume in place. No private file, page image, source passage or extracted source text was copied anywhere. The public author version of Langlands’ supplement was inspected independently. The original Harish-Chandra, general Langlands/discrete-series, BHR, Clozel and other unread proof interiors remain identified gaps.

## Previous review and red-team obligations

| Obligation | Result |
|---|---|
| Revision-2 §13 missing names | All previously absent names now resolve in the compiler inventory. The BHR multi-part mismatch demonstrates why this is not sufficient by itself. |
| Normalized induction | Compact-picture equivalence is now topological and does not assume its own desired bijectivity; nested induction and globalization interfaces are present. |
| Relative/coefficient interfaces | Relative Ext, pair restriction, cup products, differentiated invariant-form maps and split-central Hodge balancing have actual carriers/laws; construction proofs remain gaps. |
| Arithmetic/classification interfaces | Native real points, integrated GL₂/O₂ series, constant-term automorphic/transitivity laws, global lattice families, adelic dictionaries and transport maps replace the missing interfaces. |
| Pinned Tau Ceti compilation | Individual Tau Ceti imports are available in this shared build, unlike the preceding reviewer’s build. This run checks those imported types at the pin. |
| RT-AREA-automorphic-1/2 | AF.1 remains the sole real-classification owner. AL imports it and owns factor bridges. Knapp’s real/complex statements and W_R sources are corrected; the proposed split is not promoted. |
| RT-AREA-automorphic-1/25 | Contragredient Wigner coefficient, balanced Borel–Wallach quotient, unitary Vogan–Zuckerman data and Harris component correction are retained. |
| RT-AREA-automorphic-1/26 | Almost-everywhere hyperspecial existence requires global reductive spreading out. RG2’s local tame realization is not this export. Dimension is ≤1, not automatically 1. |
| RT-AREA-automorphic-1/29 | AF.1a owns all compatible/relative/absolute cochains; AF.1 consumes them. Countability is distinguished from local finiteness. |
| RT-AREA-automorphic-1/30 | Local weight inputs precede the ALS/AS comparison and rationality suffix. Proposed prefix splits remain unapplied; external stage acyclicity is not asserted. |
| RT-AREA-automorphic-1/31 | Gross rational and level-action carriers, continuous p-adic actions, full stabilizers, semigroup Hecke action and conditional base change are retained. Central class sets and effective stabilizers have distinct finiteness arguments. |

The reviewed library audit for all seven AF stages was checked against these ownership boundaries. Current upstream DifferentialGeometry, IntegralLattices and RealAlgebraicGeometry were also read where relevant: AF neither replans general manifold forms nor CAD, and its p-adic stable coefficient lattices do not duplicate the quadratic integer-lattice roadmap. Current GlobalNumberFields algebraic Hecke characters and ReductiveGroups adjoint Kostant stability are already owned inputs; their application does not prove more general coefficient integration or lattice stability.

## Validation and orchestrator action

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json` reports zero errors and zero warnings. A separate dependency traversal checks all 100 internal nodes without a cycle. Every one of the 51 definitions/constructions has at least three discriminating tests. All 360 distinct main/API names have compiler checks; named-test and shared-example coverage is checked separately, not counted as proofs.

`lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean` exits zero in the shared build at both pins, with 1796 `declaration uses sorry` warnings and no other warnings or errors. The final run includes the prime-Hecke comparison, orthogonality and anonymous example additions. The unmodified input also elaborated successfully. Memory availability exceeded 20 GB before each run; checks ran sequentially, with no language server, Lake build/update/cache command or background process left running. Elaboration verifies proposed types and imports, not any admitted mathematical theorem.

The orchestrator needs a mathematical correction of AF.4/bhr-large-weight’s missing native parts, preserving this review’s normalization/source/prerequisite corrections and full ledger. Packaging must also reconcile the existing prefix proposals and post-snapshot upstream stage registry, especially DifferentialGeometry and RealAlgebraicGeometry. Exact unanswered supplier requests remain with their current owners. This review does not request closure of every source-proof gap, source purchases, a second local build or another job in this process.
