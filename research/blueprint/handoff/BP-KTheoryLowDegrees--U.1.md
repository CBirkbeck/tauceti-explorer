# Handoff: BP-KTheoryLowDegrees--U.1 (issue #764)

Author: **Codex — codex-7e92bd**, 26 September 2026. Claim comment 5849435741 won, confirmed by bot comment 5849436638. This is a **partial checkpoint** continuing the merged 189-node packet from PR #2958. It retains the earlier cc-38367a, gpt-20260926-c4e7b2 and codex-hjdg0j work. It is not an independent review of all inherited mathematics.

## What is closed in this continuation

The Milnor patching / K₀ Mayer–Vietoris source gap is closed by **17 new nodes**: sixteen Z.1 patching declarations and U.5’s canonical ideal boundary. The other 187 inherited node objects are unchanged. The existing double-ring node adds its comparison with Mathlib’s pullback, and the existing degree-zero exactness node now consumes the explicit boundary and three exactness results.

The proof works over arbitrary associative unital rings, including the zero ring. For φ:S→C surjective and arbitrary ψ:T→C, it uses the existing Mathlib pullback B. It constructs actual compatible-pair submodules, change of charts and direct sums; lifts the elementary matrix diag(a,a⁻¹) through φ; constructs compatible complements even when the initial free sizes differ; proves finite projectivity and both canonical base-change maps; and recovers a projective from its charts by a retract argument. Surjectivity of GL_n(S)→GL_n(C) is never assumed.

The boundary is [FreePatch(a)]−n[B], with left-module row convention φ(x)=ψ(y)a. Its kernel is the sum of the two K₁ images. Separate nodes prove exactness at K₀(B) and at K₀(S)×K₀(T), with explicit common free stabilizations. The ideal sequence specializes to the double square, transports along (pr,add), and corestricts to ker K₀(pr). Its three exactness positions use this named map. No surjectivity of the final K₀ map is asserted.

The nonzero test uses ℤ×_{𝔽₅}ℤ: the boundary of scalar 2 is nonzero of order two, while scalar −1 has boundary zero. The test’s additional existing integer and finite-field K₁ inputs are recorded separately from the construction’s prerequisites.

## Inventory and validation

The packet has **206 nodes**: 16 definitions, 36 constructions, 77 lemmas, 59 theorems, 8 comparisons, 10 applications; **421 API items**, **219 unit-test specifications**, **44 planets**, and **387 baseline declarations**. Four gaps and eight supplier requests remain; no whole stage is claimed closed. All implementation statuses remain unchecked.

- The unmodified blueprint checker with the pinned declaration index reports **0 errors and 0 warnings**. Exact-file intake accepts the four authorized deliverables.
- The full suggested file compiles with **Lean 4.34.0-rc2**, **703 warnings**, all “declaration uses sorry”, and **0 errors**. This is elaboration of proposed signatures, not implementation.
- Before the final run, **49 imported Tau Ceti modules** were freshly built from f790474 in the worker’s own build area. **8482 reached Mathlib source files** were byte-compared with 082e2d3 before using the matching cached objects. Hash evidence is retained in scratch; no local build paths or book files enter the repository.
- The explicit internal graph has **601 edges** and is acyclic. The inherited cross-roadmap cycle gaps remain; no whole-atlas acyclicity claim is made.
- New/changed packet and document statements, API names and test specifications agree. All old identifiers remain. The ten source findings, eight requests, 383 old baseline records and four unrelated gap objects are unchanged.
- Fresh guards immediately before publication matched all 17 captured input blobs and all four existing outputs at main `274eceab7992728058af0cbf4f0bf8c87351171d`. The issue body and bot-confirmed claim were unchanged.

## Reading and ownership

Freshly read: the reviewed AUDIT-29 rows for all eight scoped stages; accepted RS-18; the owner document; touching atlas edges and both touching link files; GrothendieckEulerForms and JacobianChallenge as upstream models. The accepted title and first prerequisite are now explicit in this part’s document. General categorical K₀ is imported, not re-planned. Milnor patching extends the explicit ring/projective work of Z.1 and is proposed in `restructure`; its finite matrix inputs are U.1’s independent Whitehead identity and elementary coefficient lifting. No other current packet plans Milnor patching.

Fresh mathematical source: [Weibel’s author-hosted K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), combined draft dated 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`: I.2.6–2.7 (PDF pp.21–22), Exercises I.2.8–2.9 (p.24), Exercise II.1.4 (p.75), II.2.8–2.9 (pp.84–85), and Exercise II.2.3 (p.86). The exercises’ arguments are expanded explicitly. The general exchange formula of I.2.9(i) is unnecessary; its free case is proved directly by block multiplication. No new source error is alleged and no claim is made to have checked these pages in the published edition.

The actual pinned pullback declarations, finite-generation/projectivity splitting inputs, row-vector linear map and quotient-surjectivity statement were read. Their line ranges and source hashes are recorded in `continuationAudit.pinReads`. The former Morita audit is preserved in `previousContinuationAudits`. Historical evidence for other inherited nodes remains historical; their mathematical claims were not all reread or independently certified here.

## Remaining work

Continue one of the four precise gaps below. Preserve the closed Morita-preservation and Milnor source decompositions, all current identifiers, and the companion Z.3 packet. Z.1’s separate finite-dimensional Morita comparison request remains open. U.5 remains partial because the relative homotopy comparison depends on U.6’s unresolved K₂ inputs.

### Topological inputs for SK₁ of the real circle ring

U.3/SK1-real-circle-nonzero follows K-book Example III.1.5.4: it needs Proposition III.1.5 (for a commutative Banach algebra R, E_n(R) is the path component of 1 in SL_n(R), using a continuous factorisation of matrices near 1 into n² + 5n − 6 elementary matrices and Ex. I.1.10), Example III.1.5.3 (SK₁(C(X, ℝ)) = [X, SO]) and the homotopy groups π₁(SO_2) ≅ ℤ, π₁(SO_n) ≅ ℤ/2 (n ≥ 3) with π₁(SO_2) → π₁(SO) onto. Mathlib and Tau Ceti have neither the Banach-algebra statement nor these fundamental groups. The algebraic route (Mennicke symbols, K-book Ex. III.1.10, where SK₁ ≅ ℤ/2 is stated) is an exercise without proof in the sources read. The statement SK₁ ≠ 1 is used only as a non-example (tests of U.3/special-K1, U.3/stable-determinant, U.3/stable-special-linear-group and U.1/elementary-subgroup).

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`.

### The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21))

U.4's arithmetic Mennicke argument (BMS Theorem 3.5) uses (A.16) (a, b / 𝔭)_m = (a/𝔭)_m^{ord_𝔭 b} for a a unit at 𝔭 ∤ m, the product formula ∏_𝔭 (a, b / 𝔭)_m = 1 (Artin–Tate XII Theorem 13) and its consequence (A.21) (b/a)_m = ∏_{𝔭∤a}(a, b / 𝔭)_m. ClassicalArithmeticCompletion CA.1 plans exactly these (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law), but those nodes cite K2SymbolsBrauer:T.7 for the norm-residue symbol, and T.7 lies downstream of U.4 (CA.1 ← T.7 ← T.3:localization-comparison ← T.2:graded-map ← K3BlochGroups:V.2 ← ArithmeticKTheory:N.5 ← U.4), so U.4 cannot import them without a stage cycle; Tau Ceti ClassFieldTheory lists 'explicit power-reciprocity laws beyond quadratic reciprocity' as outside its scope. BMS's orientation of the symbol is the transpose of CA.1's. Resolution proposed in restructure.

Needed by: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18))

The totally imaginary case of BMS Theorem 3.5 (Case 3, through Lemma 3.4(a)) needs (A.17): for k/ℚ_p finite containing μ_{p^n}, with e = ord_𝔭(p), (U_𝔭(h), U_𝔭 / 𝔭)_{p^n} = (U_𝔭(h+1), k^× / 𝔭)_{p^n} = μ_{p^{n−j}}, j = [h/e − 1/(p−1)]_{[0,n]}. BMS prove it (pp. 87–88) from Serre, Corps locaux, Ch. XIV Prop. 6 (p. 237) and Ch. XV Prop. 9 (p. 219), which are not freely available and were not read; no roadmap of the atlas plans the statement. Needed only for S = ∅ and F totally complex, where U.4 uses j = 0 (the pairing U_𝔭(h) × U_𝔭 → μ_{p^n} is onto).

Needed by: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15)

The source gives only a hint ('Use Ex. III.2.7 to show that π₁K(R → R/I) is isomorphic to the group K₁(R, I)'). Completing the five-lemma argument needs π₂BGL⁺ = K₂ (K2SymbolsBrauer T.1:plus) and the classical relative K₂-sequence (K2SymbolsBrauer T.6), which the helper places downstream of U.6 because K2SymbolsBrauer:T.1/k2-definition cites GeneralAlgebraicKTheory:K.2, whose combined stage requires K.2:low-degree-comparisons ← U.6. GeneralAlgebraicKTheory's decomposition node K.5/relative-K-theory-and-excision-boundary asserts the identification with the same exercise as its only source. See restructure.

Needed by: `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`.

The eight requests remain GrothendieckEulerForms layer 4; ClassFieldTheory layers 5, 12 and 13; Chebotarev layers 4 and 10; and GlobalNumberFields layers 6 and 7. Their exact contracts and consumers are in the packet. H.3’s plus-construction universal-property obstruction-theory boundary also remains unread in the inherited route.

Keep K₀ on left modules, K₁ automorphism classes on right modules with column vectors, finite sets of finite places for S, and the positive DVR normalization ∂(uniformizer)=1. S.3 owns the localization boundary; K.5 owns the relative homotopy fibre; this packet supplies the explicit classical comparisons. Do not break a coarse stage cycle by dropping a needed mathematical hypothesis.

Only the packet, document, suggested Lean file and this handoff are submitted. No git commands were used.
