# REV-K2SymbolsBrauer--T.1

**Verdict: needs_changes.** This is an independent review of the blueprint, not an assertion that the K-theory has been formalised. The corrected packet remains partial. In particular, a structurally valid packet is not thereby an accepted mathematical decomposition.

Reviewer: ChatGPT Pro, session `gpt-20260924-k2-83c7`, 2026-09-24. Issue: #438. The original author was Claude Code, session `cc-7b31c4`. The bot confirmed this reviewer's claim before work began.

## Reviewed versions and evidence

The original packet blob was `f42dc2832c5adf72bc65ba335588a9b1ec1d08aa`; the original suggested file was `c1238f5dca61125ee2bb8ccf7a76b72a91dc4f1a`; the original handoff was `c19a2499ef6422348c724672bb1d90674b9b0308`.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 23 original cited declarations were read with their surrounding hypotheses. The relevant records in `research/blueprint/audit/AUDIT-29.result.json` (blob `d8febd30065915d50c8c1844420f698dca75c088`) and its independent review `REV-AUDIT-29.md` were inspected. The audit's distinction between related infrastructure and an implemented target is important: a tensor algebra is not Milnor K-theory, a set colimit is not the stable elementary group, and an H2 carrier is not Hopf's formula.

The scoped atlas record and the campaign documents for K3BlochGroups, GeneralAlgebraicKTheory, KTheoryLowDegrees and StableHomotopyKTheory were read. Upstream density/API examples were taken from the algebraic-topology and induction/restriction documents. This review does not claim a new exhaustive search of all libraries or all atlas roadmaps.

The principal public source is Weibel's author-hosted [combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013. Both parsed text and page images were checked around III.5.1–5.5.1, III.5.10–5.11.1, III.6.1–6.1.3, III.7.1–7.3.1, IV.1.7.1, IV.1.10–1.10.1, IV.1.20, and Exercises IV.1.8–1.9 and IV.1.12(d). References below use the printed page numbers: the PDF page number is printed page plus eight. The inherited PDF hash was not recomputed; it must not be represented as newly verified.

## Blocking findings and corrections

### 1. The original Lean file did not encode its advertised theorems

The original contained theorem statements `True`, a universal-central-extension proposition whose body was a proof hole, a relation predicate whose body was a proof hole, a map `St -> St` in place of `St -> E`, a self-equivalence in place of `K2 -> H2(E,Z)`, and a Milnor-to-itself map in place of the Quillen comparison. There were no `example` declarations. A successful elaboration of such statements would not check the intended mathematics.

The replacement constructs the actual finite-rank relator set, its presented group and root generators. It states perfectness, lift rigidity and finite-rank splitting with real types. Its central-extension predicate includes surjectivity and kernel centrality; its universal predicate includes the unique commuting triangle. It also gives the actual commutator-lift star construction and the actual tensor-algebra Steinberg relation and ring quotient. It includes genuine test statements, including positive universal-property tests, so that an always-false predicate cannot pass by vacuity.

The stable matrix, homology, plus, homogeneous grading and Quillen interfaces that are not available in this file are explicitly omitted and remain obligations. They are not replaced by arbitrary carriers. The file is still partial and **has not been compiled**.

### 2. Finite rank: splitting is not a substitute for verifying the canonical map is central

The finite-rank node asserts that every central extension of `St_n(R)` splits for `n >= 5`, and then concludes that `St_n(R) -> E_n(R)` is universal. Its acceptance text simultaneously disclaims finite-rank centrality. Those contracts do not fit together: the recognition criterion applies to a **central** extension of the base group.

The source itself prints the unconditional consequence in III.5.5.1 (p.220). It is therefore **not a misquotation**, and this review does **not** claim to have disproved that theorem. What is missing from the packet is the centrality input at precisely its arbitrary-ring generality. The correction separates the splitting theorem from a conditional finite-rank universal-extension statement carrying that input. The unconditional source target is retained as a gap pending a suitable proof/source.

For the stable theorem there is a separate centre theorem. A second omitted step is the compatibility of the splittings pulled back to finite ranks. This is now exposed: `St_n` is perfect for `n >= 3` because each generator is a commutator through a third index; lifts from a perfect group into a central extension are unique; hence the finite-stage splittings agree and descend through the group colimit. No finite-stage embedding into the stable Steinberg group is assumed.

### 3. The Hopf test confuses two different kernels

In III.5.3.4–5.3.5 (p.219), a free presentation `G=F/S` gives the first kernel `S/[S,F]` and the Hopf kernel `(S intersect [F,F])/[S,F]`. The original acceptance test says both vanish when G is free.

Take `F=Z`, `S=F`, and `G=1`. The quotient G is free, but the first kernel is Z; only the Hopf kernel is zero. The corrected test makes this distinction explicit. The presentation-to-bar-homology comparison is also a real missing proof, not discharged by citing `groupHomology.H2`.

### 4. A square root of minus one does not make integral repeated symbols vanish

The test in `T.2/milnor-alternating` is false. In `F=C(t)`, the field contains a square root of -1, but the t-adic tame symbol sends `{t,t}` to -1, which is not the identity in `C^x`. Thus `{t,t}` is nonzero.

The correct integral identity is `{a,a}={a,-1}` and the result is 2-torsion, not necessarily zero. Characteristic two supplies a valid repeated-symbol vanishing test. Do not confuse this with a statement after reduction modulo two. This is a **packet error**, not an error in the cited graded-commutativity statement of III.7.1.

### 5. The arithmetic examples need their degree bounds

Unique divisibility over an algebraically closed field is used in degrees `n >= 2`, not all degrees. `K0^M(C)=Z`, and `K1^M(C)=C^x` contains roots of unity. The decomposition over R is for positive degree, not degree zero. The number-field and global-function-field assertions have `n >= 3`. These bounds are now explicit.

This corrects the packet's unconstrained formulation. It is not a claim that every abbreviated sentence of the book, removed from its degree context, is a newly discovered erroneous theorem. The five computations still need separate proof nodes, and the Bass–Tate and torsion-freeness arguments remain unverified leaves.

### 6. The rational-function splitting has a missing cancellation case

In III.6.1.2 (p.231), the equal-degree case of the printed leading-coefficient formula omits cancellation. With `f=(t+1)/t`, one has `lead(f)=1` but `lead(1-f)=-1`, not `1-lead(f)=0`.

The result is repairable: when the degrees are equal and `lead(f)=1`, the image Steinberg symbol vanishes because its first entry is 1, regardless of the nonzero leading coefficient of `1-f`. The other degree cases are unchanged. This is recorded as a source issue affecting **the proof**, not the split-injectivity conclusion.

The further claim that the kernel for an arbitrary field extension is torsion needs the filtered-colimit reduction and the finite-extension transfer identity. Those are not consequences of Matsumoto and the finite-field calculation alone.

### 7. Degree-three injectivity was attributed to a supplier that does not provide it

`K3BlochGroups:V.2` explicitly defines the decomposable part as an **image**, and warns against identifying that image with the Milnor source without proving injectivity. The original packet instead says V.2 proves injectivity for every field, and adds it as a dependency of the map that V.2 is supposed to consume.

The correction exports the degree-three product map to V.2 and leaves the image/cokernel there. It removes the invented injectivity claim and the backwards proof dependency. This review does not replace the unsupported universal injectivity assertion by an unsupported universal noninjectivity assertion.

The K-book's explicit noninjectivity example in Exercise IV.1.12(d), p.275, uses the fourfold negative symbol and is in **degree four**. It does not establish degree-three noninjectivity. For failure of surjectivity in degree three, `K3^M(F2)=0` versus `K3(F2)=Z/3` is a suitable test once the separate Quillen finite-field computation is supplied.

### 8. The real-place test uses the wrong rank invariant

The original graded-map test says a number field with a real place has positive Quillen K3 rank. The relevant rank is `r2`, not `r1`; the existence of a real place does not imply it. The packet no longer uses that test. The finite-field test above avoids this confusion and clearly records its separate computational input.

### 9. The main comparison references and owners were wrong

For `K2 -> pi2`, the relevant passages are **IV.1.7.1 and Exercise IV.1.8**, not IV.1.20, whose topic is K3/H3. For the graded product map, the relevant passages are **IV.1.10 and IV.1.10.1**, not just the definition of Milnor K-theory or Matsumoto's theorem. Products of unit classes must agree with the classical symbol to identify the actual degree-two map.

The corrected supplier boundaries are:

| Input | Supplier |
|---|---|
| Actual finite/stable GL and E, elementary identities and block calculus | `KTheoryLowDegrees:U.1` |
| Classical quotient K1 and its unit/map interface | `KTheoryLowDegrees:U.2` |
| Early plus model of the K-theory space | `GeneralAlgebraicKTheory:K.2:plus` |
| Classifying-space and bar-homology comparison | `StableHomotopyKTheory:H.1` |
| Plus, simply connected/cover comparison and the precise Hurewicz input | `StableHomotopyKTheory:H.3` |
| Products, unit-product/symbol comparison, transfer and colimit calculus | `GeneralAlgebraicKTheory:K.7` |

The late `K.2:low-degree-comparisons` stage and `K3BlochGroups:V.2` are consumers of the appropriate outputs, not substitute early suppliers. `HigherLocalFieldsAndHigherClassFieldTheory:HL.1` consumes Milnor theory; a request that it confirm ownership is not a mathematical prerequisite. Dennis–Stein symbols and higher tame symbols remain with their own T.6 and T.3 targets; stale summary text was not evidence that this packet had covered them.

## Per-node disposition

`Corrected` below means a statement, test, dependency or source-fit correction was made; it does not mean the node is now implemented or its entire proof decomposition accepted. `Unverifiable` identifies a remaining proof/source check, even where the theorem statement was found in the K-book.

| Original node suffix | Disposition and remaining issue |
|---|---|
| `T.1/steinberg-group-finite-rank` | Corrected: opposite roots are not an exhaustive commutator case; reverse coefficient order retained; actual relators in Lean. |
| `T.1/elementary-matrices-satisfy` | Corrected: target E_n and surjectivity; arbitrary-ring matrix gap distinguished from commutative pinned APIs. |
| `T.1/stabilisation` | Corrected: group-colimit structure/recursor and compatibility remain explicit, with no assumed finite-stage injectivity. |
| `T.1/k2-definition` | Corrected: actual canonical kernel and U.2 exact quotient; nontrivial test dependency retained. |
| `T.1/k2-is-centre` | Corrected: root-column and centre-of-E leaves exposed. Perfectness does not imply trivial centre. |
| `T.1/central-extension` | Corrected: reuse GroupExtension and its existing interfaces; retain trivial-action/section/universe qualifications for classification. |
| `T.1/universal-central-extension` | Corrected: actual initiality predicate and commuting triangle; genuine positive and negative tests. |
| `T.1/uce-perfect` | Corrected: lift rigidity extracted rather than hidden in a multi-result node. Further splitting of source/target perfectness remains possible. |
| `T.1/hopf-formula` | Corrected: false free-quotient test; presentation-to-bar comparison remains open. |
| `T.1/recognition-theorem` | Corrected: centrality, pullbacks, central-closedness and H1 comparison are not implicit. Still too bundled for final acceptance. |
| `T.1/steinberg-is-uce` | Corrected: stable compatibility now has named finite-perfectness, rigidity and splitting leaves. |
| `T.1/finite-rank-splitting` | Corrected: splitting theorem separated from unverified canonical-map centrality. Individual commutator lemmas still need extraction. |
| `T.1/finite-rank-caveat` | Corrected: a conditional mathematical theorem instead of a contradictory prose caveat; unconditional target remains a gap. |
| `T.1/k2-h2-elementary` | Corrected: actual H2(E,Z) target and notation bridge; Hopf dependency retained. |
| `T.1/k2-pi2` | Corrected: source locator and early suppliers, actual cover/Hurewicz comparison still required. |
| `T.2/star-product` | Corrected: independent lifts, commuting-pair bilinearity, and GL-conjugation input distinguished. |
| `T.2/steinberg-symbol` | Corrected: commuting units over a ring and three distinct coordinates; narrow diagonal APIs not overstated. |
| `T.2/steinberg-identity` | Corrected: general negative-unit relation separated from the proof assuming 1-r is a unit. |
| `T.2/symbol-consequences` | Corrected: repeated symbols are 2-torsion, not declared alternating. |
| `T.2/symbols-generate` | Unverifiable: source statement found; original proof and the noncommutative local/semilocal scope need resolution. The attribution explicitly mentions commutative semilocal rings. |
| `T.2/matsumoto` | Unverifiable: statement found; Milnor section 12 normal-form proof not obtained or decomposed. |
| `T.2/k2-finite-field` | Corrected: cyclicity and nonsquare counting need exact lemmas, not ZMod's definition. |
| `T.2/rational-function-field` | Corrected: cancellation case repaired; transfer/colimit leaves restored. |
| `T.2/milnor-k-theory` | Corrected: actual two-sided quotient and homogeneous-grading obligation, rather than a fake family of carriers. |
| `T.2/milnor-alternating` | Corrected: false square-root test replaced by an integral counterexample and characteristic-two test. |
| `T.2/milnor-examples` | Unverifiable: degree bounds corrected; arithmetic and torsion-freeness proofs and separate nodes remain required. |
| `T.2/graded-map` | Corrected: source, product supplier and map-level degree-two compatibility; false rank test removed. |
| `T.2/graded-map-degree-three` | Corrected: source/image/cokernel distinguished; invented injectivity dependency removed. |

Three extracted leaves are `T.1/central-lift-rigidity`, `T.1/finite-rank-perfect`, and `T.1/stable-splitting`. They are marked as additions by this review. They make a specific hidden step visible; they do not purport to complete all needed splitting.

## Baseline fit: all 23 original references

All names exist at the stated pins. The issue is often what they **do not** prove.

| Reference | Checked fit |
|---|---|
| `PresentedGroup` | Free-group quotient, generator and universal-property API; appropriate presentation substrate. |
| `Matrix.GeneralLinearGroup.transvection` | Commutative ring, finite decidable index set; not the asserted arbitrary-ring input. |
| `TauCeti.transvectionUnit` | Same commutative-ring restriction. |
| `TauCeti.commutatorElement_transvectionUnit` | Forward commutator formula with explicit distinct indices, over a commutative ring. |
| `commutatorElement` | Convention is xyx^-1y^-1, determining the reverse sign/order. |
| `Subgroup.center` | Centre definition; not a centrality theorem for a named extension. |
| `Group.IsPerfect` | Perfectness predicate/preservation; not the Recognition Theorem. |
| `GroupExtension` | Existing exact extension, Section, Splitting and Equiv interfaces should be reused. |
| `TauCeti.FactorSet.inl_range_le_center` | Requires the stated trivial action on a commutative kernel. |
| `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` | Has action, normalized-section and induced-action conditions; pinned universes are Type 0. |
| `groupHomology.H2` | Degree-two homology of a Rep; trivial integral coefficients must be supplied. No Hopf formula. |
| `groupHomology.H1` | Degree-one carrier; its definition alone does not prove the abelianization comparison. |
| `groupHomology` | Inhomogeneous-chain homology, valued in ModuleCat. |
| `HomotopyGroup` | Indexed homotopy group; Fin 2 supplies degree two. No Hurewicz or plus construction. |
| `TensorAlgebra` | Tensor algebra and algebra universal property; not the homogeneous Milnor quotient. |
| `Additive` | Type-tag definition in `TypeTags/Basic.lean`; use with the field's commutative unit group. |
| `RingQuot` | Ring-congruence closure includes multiplication on both sides, appropriate for the noncommutative tensor algebra. No automatic grading. |
| `Matrix.diag2_decompose` | Field, nonzero scalar, rank-two special linear group. |
| `Matrix.SpecialLinearGroup.diag2nUnit_decompose` | Root Matrix namespace, commutative ring, unit, finite decidable index set and distinct coordinates. |
| `Units` | Actual bundled two-sided units. |
| `DirectLimit` | Set-level colimit carrier. A group instance and group recursor must still be built or precisely imported. |
| `ZMod` | Modular-integer ring, not cyclicity of the unit group of an arbitrary finite field. |
| `NumberField.InfinitePlace.nrRealPlaces` | r1 for the Milnor computation; not the Quillen K3 rank formula. |

## Source issues and limits

The leading-coefficient cancellation is recorded in `sourceIssues`, with an explicit counterexample and a correction that preserves the theorem. The finite-rank issue is deliberately **not** declared a confirmed published error merely because the packet lacks the needed centrality proof. The false square-root, free-kernel and supplier assertions belong to the packet.

The author's [book page](https://sites.math.rutgers.edu/~weibel/Kbook.html) links an errata PDF. The linked `https://www.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf` returned 404; alternate access attempts failed. The separate author-hosted Chapter III was also checked and retains the finite-rank consequence. No claim is made that no correction exists or that the leading-coefficient observation is novel.

## Validation and handoff

The revised candidate was parsed as JSON and checked locally for unique IDs, an acyclic internal prerequisite graph, resolution against its declared baseline/supplier references, at least three correctly classified tests per definition/construction, source-excerpt length, and the per-stage planet limit. The candidate has 31 nodes, 54 API entries, 30 packet tests, 23 baseline declarations, six requests and 15 explicit gaps. These local checks are **not** a substitute for the repository validator with its atlas and pinned declaration index; the PR check result must be recorded in the handoff.

A comment-stripped inspection of the replacement Lean file found 20 `example` declarations, no `True` statements and no proposition defined by a bare proof hole. This is a structural check only. Neither `lean` nor `lake` was available, and no elaboration or proof checking was run. The original author's successful checker run is not attributed to this review.

Further work is explicit: finish the fine-grained proof decomposition, obtain the cited original proofs, resolve the finite-rank and semilocal source questions, match generic extension/homology ownership, and express the omitted signatures against actual supplier interfaces. Do not mark this packet closed, promote it as accepted, or infer implementation readiness from the current PR.
