# Independent package review: explicit K₂

Reviewer: Codex (GPT-6), session `codex-jZqbCR`, job `REV-PKG-K2SymbolsBrauer~adv`, issue #11228, 2026-10-19. The reviewed package was written by Claude, session `claude-DmMdvr`, in commit `6aa66593b` (PR #11146); this reviewer did not write it. Verdict: **needs_changes**, after the corrections below. This report is also the handoff; no separate handoff path is authorized by the issue.

The review covers all fourteen layers, their 199 numbered subsections, the API assertions and extra named targets within them, and all 240 nodes in the fourteen input packets. The packets were read and checked without modification. A successful Lean elaboration establishes well-typed signatures, not the mathematical truth of admitted theorems. The outstanding problems concern proof closure and supplier order, rather than compilation.

## Corrections applied

- Removed repeated planning of extension classification by H², the first-homology/abelianisation equivalence and its naturality, and the central-extension-to-trivial-action constructor. The boundaries name the actual suppliers. Kept the converse trivial-action-to-centrality criterion and the perfectness criterion, which add conclusions. Corrected the extension-classification namespace and specified normalized sections and the fixed induced action.
- Added a nonsurjective constant-map negative control for central extensions, with a proved Lean example. Distinguished the formal presentation in small ranks from its structural theorems and from Milnor's auxiliary integer group in rank two.
- Changed integral Milnor-symbol terminology from alternation to the permutation-sign rule. Kept the nonzero real diagonal and the characteristic-two specialization. Made the convention for negative Milnor degrees explicit.
- Required all three indices of a finite-rank symbol to be distinct in Lean, including the previously missing `j ≠ k`. Required the two entries of the associative-ring Dennis–Stein word to commute.
- Corrected the older/modern Dennis–Stein translation to `D(r,s)=P(−r,s)`, with no extra inversion. The older pair `(−1,−2)` over ℚ gives the trivial symbol, whereas the modern pair gives `{−1,−1}`. Added the ℚ(t) residue witness distinguishing a symbol from its inverse. Morrow's preprint Remark 3.10 omits the inverse on the last torus factor: the elementary image at `a=b=1` is `diag(4,1/4)`, so it cannot be the kernel word as printed. The README uses the corrected word and cites the primary Dennis–Stein proof.
- Replaced ambiguous uses of “radical ideal” by `I⊆Jac(A)`. In particular, a square-zero ideal is contained in the Jacobson radical; it need not be a radical ideal. Stated the relative D2 guard as `r∈I` or both `s,t∈I`; kept the stronger source-required D3 input guard. The existing differential negative control shows why mere eligibility of the three output pairs is insufficient.
- Kept the raw Hopf/Hurewicz comparison distinct from its product normalization. Corrected the degree-two localization and Chern comparisons to use `θ₂♮`; their raw forms retain `ε`. A normalization does not compute the missing sign or prove equality of the two product models.
- Read the original Bass–Tate arithmetic argument and added proof outlines for both high-degree computations. Moved these to §§10.32–10.33, after the norms their proofs use, with explicit supplier dependencies. Read Dennis–Stein's semilocal generation proof, including the small-residue reduction; retained all commutative semilocal rings, including residue fields 𝔽₂ and 𝔽₃. Removed the unsupported extension of this unit-symbol claim to division rings.
- Corrected locators for the universal-extension definition, VI.4.3.2 and VI.5.2.1 of the K-book, the specialization exercise, Matsumoto's Corollary 5.11, and Milne's local Artin proposition. Corrected internal specialization and valuation-support references. Added accessible primary-source links.
- Put the Lean layers in README order, tightened declaration documentation to its actual signature, and expanded the closing list of definitions and milestones whose constructions remain README targets. No heavy carrier was replaced with admitted data or a weaker surrogate.

## Remaining work and where to resume

1. **Fixed product model and numerical torus sign, §8.1.** Compare GeneralAlgebraicKTheory §7.4's biexact product with Loday's plus-construction product in degree `(1,1)`, then calculate `ε` against the specific Hopf/Hurewicz map `β` of §4.1. Loday §§2.1–2.2 explains its own construction and inverse-commutator convention; it does not establish the supplier comparison. This blocks unconditional map-level product, localization and raw Chern identifications. Preserve the general commutative-ring target and the ℚ₇ cubic sign witness.
2. **Integral all-degree complete norm–residue square, §10.26.** Obtain and decompose Gille–Szamuely Proposition 7.4.1, or supply a complete integral proof. Weibel III.7.6.3 covers the normal prime-degree input. Stacks supplies the valuation/lattice substrate, not higher Milnor norms. Suslin introduces quotient-by-torsion groups on p.594; Lemma 2.1 and Theorem 2.6 then use that convention. Cancellation there cannot prove the retained integral theorem. Keep arbitrary finite extensions and inseparable residue extensions; the downstream integral reciprocity argument depends on this gap.
3. **Arbitrary-ring monomial and integer word arguments, §§6.12, 6.14, 12.7–12.8.** Milnor's seven-case root-conjugation proof, Theorem 9.11 and the rank-two base/termination argument of Lemmas 10.6–10.7 were not obtained from a cleared copy. The README marks these gaps. Steinberg's field presentation and Dennis–Stein's semilocal generation do not cover ℤ. The integer upper bound, and computations using it, remain dependent on these proofs.
4. **All-local Dennis–Stein presentation, §13.6.** Supply the full presentation proof for nonfield local rings with residue 𝔽₂ or 𝔽₃. The 1975 announcement §2.4 states the result; van der Kallen 1977 supplies the threefold-stable case. Maazen–Stienstra's split-pair paper is a source to obtain, but a proof restricted to split pairs alone would not cover every local ring. Do not drop the small-residue cases.
5. **Relative classical/plus-fibre comparison, §13.8.** Read Keune 1978 and Loday 1978 and decompose the natural identification with `π₂ fib(K(A)→K(A/I))`, including the `K₃(A/I)` connecting map. Levine §2.1 states the comparison rather than proving it. Absolute kernel computations or degree-one comparisons do not identify this relative group.
6. **Guarded relative presentation, §13.9.** Obtain Keune Theorem 15's generation and full-kernel proof for every `I⊆Jac(A)`. Levine p.290 records the guarded statement. Dennis–Stein 1973 uses an older relative-kernel convention; the 1975 split-pair announcement does not close the arbitrary-pair target. Differential and square-zero consequences remain conditional on the correct presentation and, when claimed for the homotopy fibre, item 5.
7. **Upstream supplier order.** GeneralAlgebraicKTheory, StableHomotopyKTheory, KTheoryLowDegrees and MotivicEtaleKTheory are companion atlas packages, absent from current upstream main. K2SymbolsBrauer has no assigned place or approved bundle in the inspected Caraiani–Newton order. In particular, Layer 7 supplies Matsumoto to M.3 while Layer 14 consumes M.3. The maintainer must approve a bundle or arrange the supplying layers before this package can go upstream. The review changes no registration or other roadmap's files.

These are the reasons for `needs_changes`; the review job itself is complete. No theorem of Tate's thesis is introduced. Arithmetic Tate comparison theorems remain with MotivicEtaleKTheory, and Hilbert reciprocity remains with its arithmetic suppliers.

## Inputs, current-library comparison and ownership

The form was checked against the PadicMeasuresIwasawaAlgebras exemplar and current AlgebraicCurves and QuadraticFormInvariants roadmaps. The reviewed library audit is `data/library-coverage.json`, AUDIT-29 (review `REV-AUDIT-29`, 2026-09-17). Its partial inputs were checked against actual declarations, rather than treated as complete K₂ constructions.

The current upstream checkout inspected was commit `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was `a91d3aaf`, with current Mathlib `6b7abb`. Both were read only. Searches covered `TauCetiRoadmap` and `Completed`, including the nine roadmaps newer than the atlas snapshot. Searches used central kernels, perfectness, bar homology, tensor/Steinberg quotients, residues, finite-valuation norms, cyclic classes and Chern objects, as well as names. No stable Steinberg group, Milnor K-group or tame-symbol implementation was found in the current libraries. Ordinary Chern classes in AlgebraicVectorBundles do not supply the finite étale K-theory Chern map.

| Existing object | Package action |
| --- | --- |
| Mathlib `groupHomology.H1AddEquivOfIsTrivial`, tensor specialization to ℤ | Deleted the re-planned equivalence; retained vanishing iff perfectness in §1.7. |
| Current Tau Ceti `RepresentationTheory/Homological/GroupHomology/Functoriality:TauCeti.groupHomology.H1AddEquivOfIsTrivial_map` | Deleted the re-planned naturality theorem; cited it at the boundary. |
| Pinned Tau Ceti `GroupTheory/GroupExtension/Cohomology:FactorSet.exists_cohomologyClass_eq` and `GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` | Deleted repeated H² classification; cited existence and equivalence with fixed action and normalized sections. |
| Pinned Tau Ceti `GroupExtension.conjAct_eq_one_of_le_center` and `InducesAction.of_le_center` | Deleted the repeated forward constructor; retained the converse criterion. |
| Mathlib noncommutative `DirectLimit` group instance | Imported the carrier and operations; retained only the Steinberg-tower and finite-witness specialization. The old packet's claim that only a Type quotient exists is obsolete. |
| AlgebraicCurves Layers 2, 5, 9, 12; EllipticCurves Layer 2 | Kept place/curve and completion dictionaries as imports. The new residue theorem gives general-curve reciprocity and only its elliptic specialization. |
| ClassFieldTheory `Local/CyclicClass`, especially `kummerCup_eq_neg_infl_cyclicClass`; QuadraticFormInvariants 6C/6E | Imported the cyclic and quadratic symbol machinery. The arithmetic Artin/invariant comparison with the specified variable order remains §14.8. |
| ClassicalArithmeticCompletion §§1.14, 1.25, 1.52 | Imported the norm-residue pairing and higher Hilbert product law; retained factorization through K₂ and the sign dictionary. |

No target already present upstream is retained as a “removed” stub. No ownership is silently assigned to an unregistered LocalFieldsRamification Part II: the missing arbitrary-residue finite-extension contracts are named locally in §§10.15–10.18, alongside existing AlgebraicCurves completion imports. No files of a supplier or packet were changed.

### Packet coverage

The table identifies every input packet. Node counts include overlapping predecessor and continuation targets; they are not 240 distinct new Lean declarations.

| Packet suffix after `K2SymbolsBrauer--` | Nodes | README coverage |
| --- | ---: | --- |
| T.1-2 | 8 | §§1.9–1.16, 1.28–1.29 |
| T.1-classical | 2 | Layers 2–3 |
| T.1-plus | 4 | Layers 1 and 4; exact plus/Hurewicz contracts |
| T.1 | 66 | Layers 1–8 and retained supporting field computations |
| T.2-graded-map | 2 | Layer 8; product-model gap preserved |
| T.2-symbols | 15 | Layers 5–7, including finite-field presentation |
| T.2 | 27 | Layers 5–8 and §§10.32–10.33; ordinary coordinate refinements owned explicitly |
| T.3-2 | 4 | Layers 10–11, Dedekind and comparison contracts |
| T.3-localization-comparison | 3 | §§9.16, 11.3–11.8 |
| T.3-symbols | 2 | Layer 9, native tensor and classical tame symbols |
| T.3 | 68 | Layers 9–14 and the monomial/integer prerequisites |
| T.4 | 12 | Layer 10, including arbitrary-residue finite extensions; arithmetic computations follow norms |
| T.5 | 7 | Layer 12 |
| T.6 | 20 | Layer 13 |

### Declarations read at the pins

Mathlib `082e2d37e8` and Tau Ceti `f790474` were used for elaboration. Current-only availability is identified separately above.

| Supplier declaration | Hypotheses/interface checked |
| --- | --- |
| Mathlib `RepresentationTheory/Homological/GroupHomology/LowDegree:H1AddEquivOfIsTrivial` | Trivial coefficient action; target is abelianisation tensored with coefficients. |
| Mathlib `Algebra/Colimit/DirectLimit`, group instance and `lift` | Directed system of groups and compatible homomorphisms; commutativity is not required. |
| Tau Ceti `GroupTheory/GroupExtension/FactorSetOfSection:conjAct_eq_one_of_le_center` | Centrality of the actual kernel inclusion, rather than an unrelated chosen action. |
| Same module, `InducesAction.of_le_center` | Central kernel and trivial ambient action. |
| Tau Ceti `GroupTheory/GroupExtension/Cohomology:FactorSet.exists_cohomologyClass_eq` | Every class for the specified action is represented. |
| Same module, `GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` | Both induced actions and both normalized sections are hypotheses. |
| Tau Ceti `RingTheory/Valuation/Discrete/Order:Valuation.ord_mul` | Nonzero multiplicands; units supply nonvanishing. |
| Same module, `exists_eq_zpow_mul_unit_of_surjective` | Nontrivial value group, normalized surjective valuation and chosen uniformizer; field element nonzero. |
| Tau Ceti `FieldTheory/FunctionField/Divisor/Principal:Divisor.principal` | A specified `IsFunctionField` witness and a unit of the function field. |
| Tau Ceti `FieldTheory/FunctionField/Divisor/Eval:Divisor.eval_eq_prod_normResidue` | Function is a unit at divisor support; finite residue fields over constants follow from the function-field hypothesis. |
| Tau Ceti `FieldTheory/GaloisCohomology/Kummer:kummerMap` and `kummerMap_eq_kummerCocycleClass` | `IsUnit (m : F)`; cocycle is the ratio `gα/α`, with a specified m-th root. |
| Tau Ceti `RepresentationTheory/Homological/ContCohomology/Cup/Product:explicitCup11` | Equivariant continuous biadditive coefficient pairing, cup cochain `μ(a(g),g•b(h))`. |

## Sources and locator audit

All source text is treated as mathematical data. No source passages or files were copied into the repository, and no section-by-section source digest is included. Milnor 1971 and Gille–Szamuely were not available as cleared full copies; no unofficial copy was used. The five-page author preview of Gille–Szamuely contains no Chapter 7 proof.

The following sample was drawn before corrections using seed 11228. Unavailable sampled locators were kept in the audit, not replaced by more convenient ones.

| Sample | Locator and package location | Finding |
| ---: | --- | --- |
| 1 | §6.19, Weibel III.5.10.5, p.226 | Semilocal claim confirmed through Dennis–Stein Theorem 2.7; division-ring extension removed. |
| 2 | §7.10, Weibel III.6.1.1, p.231 | Correct; primary finite-field presentation checked separately in Steinberg. |
| 3 | §7.3, Matsumoto Theorem 6.3, Lemmas 6.5–6.6, pp.34–40 | Correct lifted-monomial source. |
| 4 | §1.26, Weibel III.5.4, p.220 | Correct recognition criterion; perfectness is essential. |
| 5 | §8.4, Weibel VI.5.2.1 | Printed p.488; corrected the page. |
| 6 | §12.8, Milnor Lemma 10.7, pp.90–92, Lemma 9.1, p.71 | Full source unavailable; explicit gap retained. |
| 7 | §6.12, Milnor Lemmas 9.2–9.5, pp.71–73 | Full source unavailable; explicit gap retained. |
| 8 | §1.18, Weibel III.5.3.2, p.219 | Correct source for perfectness and rigidity. |
| 9 | §10.26, Weibel III.7.6.3, p.249; Stacks 02MJ/032W/09EM | These inputs do not prove the full integral theorem; marked gap. |
| 10 | §5.9, Weibel III.6.2.1 and III.7.2(c), pp.232,245 | Real sign detects the integral diagonal. |
| 11 | §1.17, Weibel III.5.3.1 | Printed p.219, not p.218. |
| 12 | §10.25, Weibel III.7.6.1 and Exercise III.7.7, pp.249,257 | Base-change input checked; Artinian length must remain. |
| 13 | §10.21, Exercise III.7.9/III.7.6.4, pp.258,250; Stacks 04GH | Correct conditional constant-extension route; finite normalization matters. |
| 14 | §7.12, Matsumoto Corollary 5.11; Steinberg Theorem 9 | Corollary starts p.30 and continues p.31; finite-field theorem is printed p.72. |
| 15 | §7.13, Weibel III.6.1/7.1; Matsumoto §9, p.50 | Correct functoriality locators. |

The inherited unverified proofs were also followed, independently of that sample:

| Input uncertainty | Sources inspected and disposition |
| --- | --- |
| Finite-field presentation and infinite-field completeness | Steinberg §6, Lemmas 37,39–40 and Theorem 9, pp.68–72; Matsumoto §§5–6, especially Theorem 6.3 and Lemmas 6.5–6.6. Target-level decomposition is retained, including small fields and stable witnesses. |
| Semilocal generation and the symbol relations | Dennis–Stein Proposition 1.1 and Theorem 2.7, pp.283–285,292–293. Added the small-residue reduction and direct convention translation. |
| Bass–Tate arithmetic computations | Bass–Tate II, Theorem 2.1(3), pp.396–402, with §§1,3–5, pp.393–427. Added the arithmetic outline; no assumption that sign-surjectivity proves the complementary vanishing. |
| Fresh-root centrality, finite splitting, stable witnesses | Weibel III.5.2.1, III.5.5.1 and Exercises III.5.2–5.3, pp.217,220,228; explicit row/column and normalized-lift targets retained. Generic group colimit already exists. |
| H² classification | Read pinned fixed-action classification directly; duplicate deleted and boundary repaired. |
| Universal negative symbol and field sign identities | Weibel V.6.1.3 and III.5.10, III.6.1; field proof remains distinct from general-ring localization. |
| Homogeneous quotient, algebraically closed and real computations | Weibel III.7.1–7.2, III.6.4.1 and Exercise III.7.3, pp.245–246,235,257; degree restrictions and integral diagonal retained. |
| Plus-cover/Hurewicz interfaces | Weibel IV.1.7–1.7.1, pp.264–265; companion package interfaces checked and separated from the product comparison. Supplier-order issue remains. |
| Product model | Loday §§2.1–2.2, pp.335–338; still missing the fixed biexact comparison and numerical sign. |
| Complete DVR substrate | Stacks 02MJ,04GH,032W,09EM; Gille–Szamuely full text unavailable. No separable-residue restriction inserted. |
| Integral higher reciprocity | Weibel III.7.5.1/7.6 and Suslin §§1–2, pp.590–597. Suslin's torsion quotient is explicitly distinguished; item 2 remains. |
| Arbitrary-ring monomial and integer arguments | Restricted Milnor source unavailable; marked §§6.12,6.14,12.7–12.8 rather than claiming proof closure. |
| Threefold-stable versus all-local presentation | van der Kallen 1977 §§5–7, pp.487–507, and 1975 announcement §§2.4,2.6, p.935. Threefold case sourced; small-residue nonfields remain open. |
| Relative presentation and fibre comparison | Levine §2.1, pp.289–290; Keune/Loday/Maazen–Stienstra publisher access failed. Statement-level evidence does not close their proofs. |
| Dual numbers | van der Kallen 1971, theorem/corollary/examples p.1204 and proof pp.1205–1207, including the final detecting extension. Two invertible is essential. |
| Artin/cup and global symbol normalization | Milne III Proposition 3.6 and §4, pp.109–114; V Example 5.4, p.179; VII Theorem 8.1, p.221. Opposite variable order gives the minus sign. |
| Chern multiplication | Soulé Proposition 2.2.2.3 and proof, pp.42–44. Added the prime-power product calculation and coefficient reduction; the Bockstein quotient is excluded from the conclusion. |

### Public-source provenance

Sources were accessed on 2026-10-19. Hashes identify downloaded PDFs, not claimed editions of unavailable books. Only the relevant proofs were read; this is not a claim to have read entire proceedings or books.

| Source | Public location and version | SHA-256 |
| --- | --- | --- |
| Weibel, K-book | [Author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), 2013; printed pages eight below PDF page numbers | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Bass–Tate and Dennis–Stein | [LNM 342 proceedings, author's archive](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), 1973 | `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55` |
| Löh | [Author notes](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf), 2019 | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` |
| Matsumoto | [NUMDAM](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf), 1969 | `4ac51e1290e2ab3c633d5a55378eb078f88d824bb3d28aac3585fce0595db5ca` |
| Steinberg | [University-hosted Yale notes](https://www.math.utah.edu/~ptrapa/math-library/steinberg/steinberg-yale-notes.pdf), 1967 | `5943b5571ab9815c45eaba206bcb35ed8b3efb3a7c3c45404ea9a9bbce7dbb50` |
| Loday | [NUMDAM](https://www.numdam.org/item/ASENS_1976_4_9_3_309_0.pdf), 1976 | `e1b3377fc93ba9b41456b8ace9e7d50d80e930e74dd92b6d23bd3f7bde78264e` |
| van der Kallen | [NUMDAM](https://www.numdam.org/item/ASENS_1977_4_10_4_473_0.pdf), 1977 | `f35dddad269e86f55ea5102fe4be09b6b06d65e8d00d5e2012752f291bf84a6d` |
| van der Kallen–Maazen–Stienstra | [Author archive](https://webspace.science.uu.nl/~kalle101/maazenStK.pdf), 1975 | `e49902aa8f4fe4edb2abb84a00e93d571207b9439f6782a59f5dd3e55e4d506b` |
| van der Kallen, dual numbers | [Author archive](https://webspace.science.uu.nl/~kalle101/K2nd1971Gallica.pdf), 1971 | `85319a782d4ace7bcc4f7f337526e6c498877d6d23f265781a701106f5b63224` |
| Levine | [NUMDAM](https://www.numdam.org/item/ASENS_1989_4_22_2_255_0.pdf), 1989 | `820e5603a23645cefa4a13c3310d62bd9edee248a96b033b7ff55b6398b7a4b5` |
| Soulé | [Author thesis](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), 1978 | `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7` |
| Morrow | [Author preprint](https://arxiv.org/pdf/1205.0860), 15 pages | `033e8c96a7df5806d8b59b2c55d89a08e336871a553add7467d2c6c8990cf185` |
| Gille–Szamuely preview | [Author preview](https://pagine.dm.unipi.it/tamas/2ndedpreview.pdf), five pages; insufficient for Chapter 7 | `bc1153891c3caa705810c70fe99bf5b4e4994539b5ee30864520deb0c77b3d35` |

Milne's [Class Field Theory v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Suslin's [1980 translated paper](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=1759&what=fullteng), and Stacks tags [02MJ](https://stacks.math.columbia.edu/tag/02MJ), [04GH](https://stacks.math.columbia.edu/tag/04GH), [032W](https://stacks.math.columbia.edu/tag/032W), [09EM](https://stacks.math.columbia.edu/tag/09EM) were read through public page/PDF access; no local-byte hash is asserted for browser-only sources.

## Lean/README signature cross-check

Every kept declaration was checked against its `variable` block. The following cross-checks exceed the required ten. Missing heavy constructions remain in the README and closing comment; their numerical/sign witnesses are not falsely reported as proved Lean examples.

| Lean declaration(s) | README | Check/result |
| --- | --- | --- |
| `IsCentralExtension`, `IsUniversalCentralExtension` | §§1.1,1.17 | Surjective, central actual kernel; universality over the source universe. |
| `IsSuperperfect`, `.isPerfect` | §§1.7–1.8 | Both H₁ and H₂, trivial ℤ coefficients, groups in `Type`. |
| `IsUniversalCentralExtension.isPerfect` | §1.18 | Universality concerns the same `p`; no free conclusion parameter. |
| `exists_isUniversalCentralExtension` | §1.22 | Perfect target hypothesis retained. |
| `recognition_theorem` | §1.27 | Both centrality of `p` and perfectness of the target are present. |
| `IsUniversalCentralExtension.nonempty_kerEquiv` | §1.23 | Actual kernel of `p`, additive type tag, H₂ of the same target. |
| `StGen`, `steinbergRels`, `Steinberg.x_add` | §2.1 | Distinct indices in generator; opposite roots have no imposed commutator relation. |
| `Steinberg.commutator_chain`, `.commutator_reverse` | §§2.1–2.2 | Associative rings; reverse product is `−sr`, with all three indices distinct. |
| `Steinberg.exists_toGL` | §2.3 | Prescribed images in GL. The separately planned onto-elementary result is not asserted by this signature. |
| `Steinberg.isPerfect`, `.centralExtension_splits` | §§2.4,3.2 | Rank bounds 3 and 5 respectively; no finite-rank kernel centrality inferred. |
| `IsSteinbergPairing` | §5.1 | Additive abelian target, complementary field-valued units; constant-one negative control proved. |
| `milnorRel`, `MilnorK`, `.ofUnit`, `.symbol` | §§5.4–5.6 | Real tensor-quotient bodies; ordered product, not exterior quotient. |
| `MilnorK.symbol_perm`, `.symbol_eq_zero_of_finite` | §§5.10,5.12 | Permutation sign; vanishing requires length≥2, excludes empty and one-entry symbols. |
| `Steinberg.w`, `.hDiag`, `.finiteRankSymbol` | §§6.2–6.4,6.13 | Weyl signs; all three indices pairwise distinct after correction. |
| `.finiteRankSymbol_mul_left`, `.finiteRankSymbol_one_sub` | §§6.7,6.13 | Commutative ring, n≥3; complementary values are a hypothesis. |
| `tameUnit` and its three theorem targets | §§9.2–9.4 | Arguments are units; valuation is normalized/surjective where needed. Both argument orders have proved examples. |
| `weil_reciprocity_of_disjoint` | §10.31 | Actual function-field principal divisors, disjoint supports and library evaluation. |
| `Steinberg.dennisStein` | §13.1 | Actual unit `u`, equation `u=1−rs`, commuting entries; light word only, no pretend relative carrier. |

## Verification

- `lean-check` on the package Suggested.lean: **exit 0**, 23 warnings, all exactly declarations using `sorry`; no other warnings or errors. The final file has 445 lines. Proved examples contain no admissions.
- `python3 scripts/check_blueprint.py` on each of the fourteen input packets: **all exit 0, zero errors, zero warnings**. These checks do not close the mathematical gaps listed above.
- Every subsection introducing an API still has at least three discriminating Checks. Tests for small fields, diagonal two-torsion, noncommuting coefficients, nilpotents and signs were retained. Definitions not representable in the compact Lean shape remain fully specified in the README.
- `python3 research/blueprint/intake.py check-files` on all five authorized deliverables: **5 files, 0 problems**. `git diff --check` passes. Only the package README, Suggested.lean, review.json and this report change; metadata.toml retains `topic = "math.KT"`.

No suspicious instructions were encountered in the untrusted source material or other authors' issue/PR text. No fetched code was executed, no source files were copied into the repository, and no supplier checkout was built or modified.

## Adversarial pass table

Each row covers every mathematical assertion and named API in that numbered subsection, including its additional bold-titled targets. “Retained” means the stated hypotheses passed the instance/sign check; it does not mean the theorem has been formalized. A gap marker refers to the numbered remaining-work list above. Small-rank, zero and characteristic-two cases are used where defined; `q=1` is tested as a modulus, since there is no field of cardinality one. Compactness is not a hypothesis of the discrete group constructions; the arithmetic local-field statements retain their own local-field hypotheses.

### Layer 1

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §1.1: Central extensions and their morphisms | Identity and constant map to C₂: only the former is onto. | Added the nonsurjective negative control and proved Lean example. |
| §1.2: Pulling a central extension back along a homomorphism | Pull back C₄→C₂ along 1→C₂: kernel is C₂, not C₄. | Retained with the stated hypotheses. |
| §1.3: Composite of central extensions with perfect middle term | D₈→C₂²→C₂: composite kernel contains a noncentral reflection. | Retained the perfect-middle hypothesis. |
| §1.4: Rigidity over a central quotient | Perfect source versus C₂: the latter has two lifts into C₂×C₂. | Retained with the stated hypotheses. |
| §1.5: The central extension from relators | N=1 gives identity; ℤ→ℤ/m has kernel mℤ, not zero. | Retained with the stated hypotheses. |
| §1.6: Restricting the relator extension to commutators | Free(a,b)→ℤ²: the commutator class survives in the Heisenberg quotient. | Retained with the stated hypotheses. |
| §1.7: Perfectness through first homology | C₂ gives H₁=C₂; A₅ gives H₁=0. | Removed duplicate equivalence/naturality, kept the vanishing criterion. |
| §1.8: Superperfect groups | 1 is superperfect; ℤ fails H₁ and A₅ fails H₂. | Retained with the stated hypotheses. |
| §1.9: Integral homology of a free group vanishes above degree one | Free rank zero and one give H₂=0; rank two gives H₁=ℤ². | Retained with the stated hypotheses. |
| §1.10: The kernel complex of a surjective group map | q=id gives zero complex; 1→C₂ fails degree-one surjectivity. | Retained with the stated hypotheses. |
| §1.11: First homology of the quotient bar kernel | S₃→C₂ gives N/[E,N]=0 although N_ab=C₃. | Retained with the stated hypotheses. |
| §1.12: The integral five-term sequence of a group quotient | C₄→C₂ and the 𝔽₃ Heisenberg cycle: positive transgression is 2. | Retained with the stated hypotheses. |
| §1.13: Naturality of the integral quotient five-term sequence | Identity and composite quotient squares preserve the same connecting-map sign. | Retained with the stated hypotheses. |
| §1.14: Hopf's four-term exact sequence | Free rank one modulo mℤ: middle inclusion is mℤ→ℤ, H₂(C_m)=0. | Retained with the stated hypotheses. |
| §1.15: The Hopf formula and the two extensions attached to a presentation | Free(a,b)→ℤ: relation module nonzero but Hopf kernel zero. | Retained with the stated hypotheses. |
| §1.16: Naturality of Hopf's formula | Lifts b↦b and b↦b² differ on the relation module, agree on Hopf kernel. | Retained with the stated hypotheses. |
| §1.17: Universal central extensions | Identity of 1 is universal; identity of C₂ has two maps to a split extension. | Corrected the source page to 219. |
| §1.18: A universal central extension forces perfectness, and rigidity of maps out of a perfect extension | A nonperfect target cannot have a universal extension; A₅ identity is insufficient. | Retained with the stated hypotheses. |
| §1.19: Central extensions of a universal central extension split | Source 1 splits every central extension; C₄→C₂ excludes merely central sources. | Retained with the stated hypotheses. |
| §1.20: Split central extensions force vanishing Schur multiplier | Push out the A₅ Schur cover by C₂→ℚ/ℤ: evaluation remains nonzero. | Retained with the stated hypotheses. |
| §1.21: The Hopf extension of a perfect group is perfect | Trivial quotient gives perfect trivial commutator quotient; ℤ² quotient fails. | Retained with the stated hypotheses. |
| §1.22: Every perfect group has a universal central extension | Free presentation of 1 yields 1; nonperfect G is excluded. | Retained with the stated hypotheses. |
| §1.23: The kernel of a universal central extension is the second homology | G=1 gives zero kernel and H₂; G=ℤ² is outside the hypotheses. | Retained with the stated hypotheses. |
| §1.24: The source of a universal central extension is superperfect | A₅ identity has perfect source but nonzero H₂; universality is essential. | Retained with the stated hypotheses. |
| §1.25: A superperfect group is its own universal central extension | C₂ has H₂=0 but fails; A₅ has H₁=0 but fails. | Retained with the stated hypotheses. |
| §1.26: A perfect central extension whose central extensions split is universal | Nontrivial free source splits extensions but is not perfect, hence not universal. | Retained with the stated hypotheses. |
| §1.27: The Recognition Theorem | Trivial group satisfies all three clauses; a bare perfect source does not suffice. | Retained with the stated hypotheses. |
| §1.28: Lifting homomorphisms to universal central extensions | Lift of identity is identity; lift of zero map is zero; ring maps preserve roots. | Retained with the stated hypotheses. |
| §1.29: Naturality of the kernel of the universal central extension | Identity on G acts identically on H₂ independently of free presentation. | Retained with the stated hypotheses. |

### Layer 2

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §2.1: The Steinberg group of a ring in finite rank | Ranks 0/1 have no generators; raw rank 2 is not the integer S₂. | Distinguished the auxiliary small-rank presentation from structural claims. |
| §2.2: The elementary matrices satisfy the Steinberg relations | Matrix units give rs forward, −sr reverse; opposite roots have no such relator. | Retained with the stated hypotheses. |
| §2.3: The Steinberg map onto the elementary subgroup | Zero ring gives trivial image; rank 2 still has the prescribed GL images. | Tightened Lean documentation to the actual GL-image statement. |
| §2.4: Perfectness of the Steinberg group | For n=3 a third index expresses each root as a commutator; n=2 excluded. | Retained with the stated hypotheses. |
| §2.5: Stabilisation and the stable Steinberg group | Identity and zero-ring towers; equality requires a finite witness, not injective transitions. | Retained with the stated hypotheses. |
| §2.6: Perfectness of the stable Steinberg group | Stable roots have a fresh third index even when represented in a smaller rank. | Retained with the stated hypotheses. |
| §2.7: A faithful column root subgroup | Column parameter zero maps to 1; elementary matrix entries detect nonzero parameters. | Retained with the stated hypotheses. |
| §2.8: A faithful row root subgroup | Row parameter zero maps to 1; reverse chaining retains the order −sr. | Retained with the stated hypotheses. |
| §2.9: Classical K_2 of a ring | Zero ring gives trivial kernel; a ring map carries actual kernel into actual kernel. | Retained with the stated hypotheses. |
| §2.10: The classical low-degree exact sequence | At GL the kernel is the elementary subgroup, not all determinant-one matrices by definition. | Retained with the stated hypotheses. |
| §2.11: Steinberg's theorem: K_2 is the centre of the Steinberg group | Fresh row and column force an image-central matrix to be scalar, then identity stably. | Retained with the stated hypotheses. |
| §2.12: Conditional centrality in finite rank | Ranks 3/4 are not inferred central from rank≥5 splitting; injectivity is separate. | Retained with the stated hypotheses. |

### Layer 3

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §3.1: Normalized lifts of Steinberg generators | Two lifts differ centrally; a fresh-index commutator is unchanged by either choice. | Retained with the stated hypotheses. |
| §3.2: Every central extension of the finite-rank Steinberg group splits, for n at least five | n=5 supplies spare indices; n=3 does not satisfy the stated splitting bound. | Retained with the stated hypotheses. |
| §3.3: The Steinberg group is the universal central extension of the elementary group | Stable finite witnesses glue unique splittings; zero ring gives identity of 1. | Retained with the stated hypotheses. |
| §3.4: K_2 is the second homology of the elementary group | Zero ring gives both groups zero; arbitrary ring maps preserve the kernel identification. | Retained with the stated hypotheses. |

### Layer 4

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §4.1: K_2 is the second homotopy group of the K-theory space | Trivial ring gives trivial π₂; the cover and inverse Hurewicz directions are fixed. | Retained with the stated hypotheses. |
| §4.2: The normalised classical-to-plus comparison | Identity model retains the extension connecting map, rather than any group isomorphism. | Retained with the stated hypotheses. |
| §4.3: Naturality of the normalised comparison | Identity and composite ring maps commute with the chosen comparison. | Retained with the stated hypotheses. |
| §4.4: Independence of the plus model | Two plus models are compared over BGL; arbitrary π₂ automorphisms are disallowed. | Retained with the stated hypotheses. |
| §4.5: The comparison with the projective-module K-space | Field and nonfield ring use the same projective-module supplier, without a field-only replacement. | Retained with the stated hypotheses. |

### Layer 5

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §5.1: Bilinear Steinberg pairings | Constant zero satisfies the pairing laws; constant one to ℤ fails at (1,1,1). | Retained with the stated hypotheses. |
| §5.2: Universal degree-two symbol presentation | Tensor class of complementary units is zero; over ℝ the diagonal is nonzero. | Retained with the stated hypotheses. |
| §5.3: Integral symbol identities | {a,−a}=0 and 2{a,a}=0; these do not imply every diagonal vanishes. | Retained with the stated hypotheses. |
| §5.4: Milnor K-theory of a field | Empty symbol is 1 in degree zero; negative homogeneous degrees are zero. | Made the negative-degree convention explicit. |
| §5.5: Homogeneity of the two-sided Steinberg ideal | Relations have degree two; multiplying left/right preserves homogeneous degree. | Retained with the stated hypotheses. |
| §5.6: Milnor quotient grading and symbol API | Empty and one-entry symbols survive; consecutive complementary entries vanish. | Retained with the stated hypotheses. |
| §5.7: Degree two equals the tensor-square presentation | Degree-two tensor symbol matches the ordered two-entry Milnor product. | Retained with the stated hypotheses. |
| §5.8: Functorial maps on the Milnor presentation | Identity/composite field maps preserve symbols; no arbitrary ring restriction is asserted. | Retained with the stated hypotheses. |
| §5.9: A real symbol detecting the integral diagonal | Real pair (−1,−1) maps to 1 in ℤ/2; positive entries map to zero. | Retained with the stated hypotheses. |
| §5.10: Skew-symmetry of Milnor symbols | Transposition multiplies by −1; over ℝ repeated −1 entries need not vanish. | Replaced alternation terminology by the permutation-sign rule. |
| §5.11: Finite-field tensor-square vanishing | 𝔽₂ has trivial units; 𝔽₃/𝔽₄ require the complementary-unit relations. | Retained with the stated hypotheses. |
| §5.12: Milnor K-theory of finite fields | Lengths 0 and 1 are excluded from finite-field higher-symbol vanishing. | Retained with the stated hypotheses. |
| §5.13: Divisibility and torsion in tensor quotients | Tensor of divisible group with a bounded-torsion group is zero; degree zero excluded. | Retained with the stated hypotheses. |
| §5.14: Root factorization divides the homogeneous relation modules | Root factorization includes all roots and relation summands, not only a divided symbol. | Retained with the stated hypotheses. |
| §5.15: The positive-entry subgroup over the real field | Positive real units yield divisible part; negative diagonal detects the complementary ℤ/2. | Retained with the stated hypotheses. |

### Layer 6

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §6.1: The star product of commuting matrices | Commuting matrix images give lift-independent central commutators; noncommuting ones excluded. | Retained with the stated hypotheses. |
| §6.2: Weyl lift words | u=1 and u=−1 give the stated 2×2 Weyl blocks with lower entry −u⁻¹. | Retained with the stated hypotheses. |
| §6.3: Diagonal lift words | Multiply the Weyl block by w(−1): diagonal is (u,u⁻¹), not its inverse. | Retained with the stated hypotheses. |
| §6.4: The Steinberg symbol | Two overlapping diagonal lifts commute downstairs; over ℝ their commutator detects (−1,−1). | Retained with the stated hypotheses. |
| §6.5: Field Weyl and diagonal lift calculus | Complementary units exclude u=0 and 1; special Weyl branches avoid dividing by zero. | Retained with the stated hypotheses. |
| §6.6: Diagonal commutator equals the toral defect | Three distinct indices realize the positive-overlap symbol, with reverse commutator inverted. | Retained with the stated hypotheses. |
| §6.7: The Steinberg identity | At a=1/2 over ℚ the complementary symbol is trivial; endpoints excluded. | Retained with the stated hypotheses. |
| §6.8: The symbol of a unit and its negative | {a,−a}=1 multiplicatively, including a=−1; not the additive identity convention. | Retained with the stated hypotheses. |
| §6.9: Skew-symmetry, and the correct value of the symbol of a unit with itself | Real diagonal is nontrivial 2-torsion; in characteristic two −1=1. | Retained with the stated hypotheses. |
| §6.10: The explicit classical symbol is a pairing | Swapping arguments inverts; product in each unit argument multiplies the symbol. | Retained with the stated hypotheses. |
| §6.11: The monomial subgroup W_n(A) of the Steinberg group and its kernel C_n(A) | For zero ring all words collapse; for ℤ only ±1 are diagonal parameters. | Retained with the stated hypotheses. |
| §6.12: Conjugation by the monomial subgroup permutes the root generators (Milnor 9.2–9.5) | Conjugate each root position, including shared and opposite indices. | Gap 3: arbitrary-ring seven-case proof not obtained. |
| §6.13: The finite-rank Steinberg symbol {u, v}_n in C_n(A) | Distinct triples require j≠k; repeated indices are not admissible data. | Added the missing inequality to definition and both Lean statements. |
| §6.14: Steinberg's theorem: the monomial kernel C_n(A) is generated by symbols (Milnor 9.11) | Symbols have elementary image 1; this alone does not prove generation of C_n. | Gap 3: full arbitrary-ring monomial-kernel proof required. |
| §6.15: The upper unipotent subgroup T_n(A) maps isomorphically onto U_n(A) (Milnor 9.14) | Upper triangular entries distinguish the unipotent word; n=3 is allowed. | Retained with the stated hypotheses. |
| §6.16: For a field, St_n(F) = T·W·T (Milnor 9.15) | Bruhat reduction uses a field; ℤ is not silently covered by inverses of pivots. | Retained with the stated hypotheses. |
| §6.17: For a field, the whole Steinberg kernel is monomial and generated by symbols (Milnor 9.12) | Field kernel generation uses Bruhat, not finite-rank universal centrality. | Retained with the stated hypotheses. |
| §6.18: Lifted Bruhat reduction and complete toral relations | Rank-one exceptional branches retain nonzero conditions; normal form supplies injectivity. | Retained with the stated hypotheses. |
| §6.19: Symbols generate the stable field kernel | Commutative semilocal small-residue factors 𝔽₂/𝔽₃ retained. | Added Dennis–Stein proof outline; removed unsupported division-ring extension. |

### Layer 7

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §7.1: Torus extension carrying a prescribed symbol | Zero pairing gives split torus; real diagonal pairing gives a nontrivial central defect. | Retained with the stated hypotheses. |
| §7.2: Extended Weyl square-subgroup presentation | Simple Weyl fourth power detects c(−1,−1); imposing order four would lose it. | Retained with the stated hypotheses. |
| §7.3: Lifted monomial extension | Characteristic two makes −1=1; adjacent-root Cartan entry gives positive exponent one. | Retained with the stated hypotheses. |
| §7.4: Matsumoto’s permutation construction | Coefficient translation by a≠0 moves the identity fiber; t=0 has a separate Weyl branch. | Retained with the stated hypotheses. |
| §7.5: Rank-one and rank-two action relations | uv=1 is checked without (1−uv)⁻¹; rs and −sr follow the ordered roots. | Retained with the stated hypotheses. |
| §7.6: Exact central extension realizing the pairing | A=0 recovers SL_n; real coefficient translation remains nontrivial in the kernel. | Retained with the stated hypotheses. |
| §7.7: Steinberg root lifts of the detecting extension | Infinite-field choice is unavailable over 𝔽₂/𝔽₃/𝔽₄; root relations are derived. | Retained with the stated hypotheses. |
| §7.8: Zero-symbol splitting for finite type-A central extensions | Zero toral cocycle splits; a nonzero real pairing excludes dropping that hypothesis. | Retained with the stated hypotheses. |
| §7.9: Faithful symbols over infinite fields | Stable triviality has a finite witness; no global injectivity of transition maps is assumed. | Retained with the stated hypotheses. |
| §7.10: Finite-field classical kernel vanishing | 𝔽₂, 𝔽₃ and 𝔽₄ give stable K₂=0, without a small-rank UCE claim. | Retained with the stated hypotheses. |
| §7.11: The chosen Milnor-to-classical comparison map | ℚ complementary symbol maps to zero; real (−1,−1) has a nonzero detector. | Retained with the stated hypotheses. |
| §7.12: Matsumoto’s isomorphism for the chosen symbol map | Finite fields and infinite fields use separate injectivity arguments; inverse fixes symbols. | Corrected Matsumoto's Corollary 5.11 starting page. |
| §7.13: Naturality of the field presentation | Identity/composite field maps commute; arbitrary extension injectivity is not asserted. | Retained with the stated hypotheses. |
| §7.14: K_2 of a field is a direct summand of K_2 of a rational function field, and the torsion kernel | Constant rational functions retract identically; equal leading terms require cancellation branch. | Retained with the stated hypotheses. |
| §7.15: Torsion in field-extension restriction kernels | Algebraic closure may kill real 2-torsion; purely transcendental extension has split injection. | Retained with the stated hypotheses. |

### Layer 8

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §8.1: The product of two unit classes is the Steinberg symbol | ℚ(t), (2,t): tame residue 2, reversed product 1/2; finite fields cannot detect sign. | Gap 1: product-model comparison and numerical ε remain. |
| §8.2: The graded map from Milnor to Quillen K-theory | Degree zero sends 1 to [F]; degree one fixes units; degree three need not be onto. | Degree-two product identification remains conditional on gap 1. |
| §8.3: Degree-two identification with the classical Matsumoto map | Actual generator map is θ₂♮∘Matsumoto, not arbitrary isomorphism. | Preserved ε for raw θ₂; gap 1. |
| §8.4: The degree-three component | Finite-field source is zero; ℚ maps ℤ/2 into ℤ/48 without surjectivity. | Corrected locators; consumes the product construction. |

### Layer 9

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §9.1: The unit part relative to a uniformizer | ℚ at 5: 2,10,2/5 all have unit part 2; changing parameter to 10 changes it. | Retained with the stated hypotheses. |
| §9.2: The tame symbol of a discrete valuation | {u,π} has residue ū; {π,u} has ū⁻¹; diagonal gives −1. | Added proved Lean tests for both argument orders. |
| §9.3: Independence from the uniformiser | Replace π by επ: the unit-part correction cancels in the full tame expression. | Retained with the stated hypotheses. |
| §9.4: The tame symbol is bilinear and satisfies the Steinberg relation | For f+g=1, valuation signs split cases; residue is 1, not necessarily field unit 1. | Retained with the stated hypotheses. |
| §9.5: The tame symbol as a homomorphism out of K₂ | Real/rational diagonal and complementary pairs pass through the actual symbol quotient. | Retained with the stated hypotheses. |
| §9.6: Characterization of the normalized tame symbol | Uniformizer normalization and unit-unit triviality determine the pairing; reversal fails. | Retained with the stated hypotheses. |
| §9.7: Behaviour under a valued field embedding: the ramification formula | Ramified embedding e=2 squares a residue; unramified embedding has exponent one. | Retained with the stated hypotheses. |
| §9.8: The tame symbol through unit parts | f=πᵃu,g=πᵇw gives (−1)ᵃᵇ ūᵇw̄⁻ᵃ, including negative exponents. | Retained with the stated hypotheses. |
| §9.9: Serre's algebra L(k) with the indeterminate Π | Π²=Π{−1} retains the characteristic-two specialization; exterior Π would be wrong. | Retained with the stated hypotheses. |
| §9.10: Serre's map kills the Steinberg elements | Complementary residues require separate positive/negative valuation branches, including equal orders. | Retained with the stated hypotheses. |
| §9.11: Higher tame symbols and specialisation maps | Degree zero has zero boundary; degree one is valuation; negative target degree is zero. | Retained with the stated hypotheses. |
| §9.12: The kernel of Serre's map | Unit symbols generate the residue-zero kernel; no assumption that all units have zero specialization. | Retained with the stated hypotheses. |
| §9.13: Finite support of the residues | Constants have no finite residues; a polynomial symbol has only finitely many irreducible supports. | Retained with the stated hypotheses. |
| §9.14: The product formula for the higher residue | Degree-one factors give the sign in the residue product; diagonal term contains {−1}. | Retained with the stated hypotheses. |
| §9.15: The residue is independent of the uniformiser; the specialisation is not | λ_π{π}=0, while λ_(επ){π}=−{ε̄}; residue stays fixed. | Retained with the stated hypotheses. |
| §9.16: Residue convention dictionary | Weibel first-residue convention reverses the two-entry tame order; q_(−π)=λ_π. | Corrected the specialization exercise locator. |
| §9.17: Rigidity for a complete discretely valued field | Complete equal/mixed-characteristic fields retain the prime-to-residue-characteristic modulus condition. | Retained with the stated hypotheses. |
| §9.18: Ramification and the higher residue | Ramification e acts in every degree; n=0 has zero residue and n=1 is e·ord. | Retained with the stated hypotheses. |

### Layer 10

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §10.1: Leading coefficients split K^M_n(F) off K^M_n F(t) (Example III.7.3.2) | Leading coefficient fixes constants; equal-degree cancellation does not create a false Steinberg pair. | Retained with the stated hypotheses. |
| §10.2: Degree reduction for symbols of polynomials (Exercise III.6.2, corrected) | Degree reduction handles equal-degree polynomials before inverting a zero difference. | Retained with the stated hypotheses. |
| §10.3: The section h_π on the degree filtration (Lemma III.7.4.1) | Degree-zero and constant polynomials do not define finite monic prime residues. | Retained with the stated hypotheses. |
| §10.4: The graded pieces of the degree filtration (Lemma III.7.4.2) | Residue at the chosen degree-d prime is identity; other degree-d components vanish. | Retained with the stated hypotheses. |
| §10.5: The Bass–Tate (Milnor) exact sequence for a rational function field | n=0 gives zero residue targets; n=1 is the principal divisor sequence on the line. | Retained with the stated hypotheses. |
| §10.6: The Milnor transfer of a simple extension (Definition III.7.5) | Linear polynomial extension has the identity norm; infinity fixes the transfer sign. | Retained with the stated hypotheses. |
| §10.7: The simple transfer in degree one is the field norm (Exercise III.7.5) | Purely inseparable field norm retains its degree, rather than a separable conjugate product. | Retained with the stated hypotheses. |
| §10.8: The projection formula for the transfer | One factor from the base can be moved outside the norm; coefficient order is retained. | Retained with the stated hypotheses. |
| §10.9: Restriction followed by transfer is multiplication by the degree | Extension degree 1 gives identity; restriction–norm composite is multiplication by degree. | Retained with the stated hypotheses. |
| §10.10: Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3) | For (t,a) at 0/∞ the two factors are reciprocal, so total product is 1. | Retained with the stated hypotheses. |
| §10.11: Passing to a prime-to-p closure (Kato's key trick) | Prime-to-p closure has extension degrees prime to p; p-primary cancellation is justified there. | Retained with the stated hypotheses. |
| §10.12: Base change of the simple transfer (Exercise III.7.7) | Repeated inseparable factors carry Artinian length, not one term per geometric point. | Retained with the stated hypotheses. |
| §10.13: Generation by symbols with one entry outside the base (Exercise III.7.6) | Prime-degree generation places only one entry outside the base; degree 1 is tautological. | Retained with the stated hypotheses. |
| §10.14: Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2) | Normal prime degree includes the characteristic-p case; no division by the residue characteristic. | Retained with the stated hypotheses. |
| §10.15: The normalized extension of a complete discrete valuation to a finite extension | Degree 1 yields the original normalized valuation; ramification rescales integral orders. | Retained with the stated hypotheses. |
| §10.16: The integral closure in a finite extension is a finite free complete DVR | Equal-characteristic k[[π]] and mixed-characteristic complete DVRs use finite normalization. | Retained with the stated hypotheses. |
| §10.17: Norms of a finite extension: valuation and residue | Unramified degree f and totally ramified degree e distinguish the valuation factor f from e. | Retained with the stated hypotheses. |
| §10.18: Separable base change and residue component lengths | Inseparable residue components keep their lengths; separable extension does not force separable residue. | Retained with the stated hypotheses. |
| §10.19: The four residue cases on a symbol with base-field entries | Unit-only symbols have zero residue; one uniformizer fixes the e/f coefficients. | Retained with the stated hypotheses. |
| §10.20: Residues commute with the transfer over a complete field (Corollary III.7.6.3) | Degree one is norm valuation; normal prime-degree higher square remains separate from general case. | Retained with the stated hypotheses. |
| §10.21: The norm-residue formula for a constant extension of prime degree (Exercise III.7.9) | Constant extension, including inseparable residue, cannot discard repeated components. | Retained with the stated hypotheses. |
| §10.22: Kato's commuting square (Proposition III.7.6.4) | Degree-one extension square is identity; field generators change only after the commuting-square proof. | Retained with the stated hypotheses. |
| §10.23: Splitting-field comparison of arbitrary transfer towers | Two towers in a common splitting field compare equal; equality is not defined into the input. | Retained with the stated hypotheses. |
| §10.24: Milnor norms of finite extensions and Kato's transitivity theorem | Simple degree-one norm is identity; tower composition gives degree multiplication. | Retained with the stated hypotheses. |
| §10.25: General finite-transfer base change with Artinian lengths | Purely inseparable base change has one component with nontrivial Artinian length. | Retained with the stated hypotheses. |
| §10.26: The all-degree norm–residue square for a complete discretely valued field | Arbitrary finite complete extension includes inseparable residue and integral torsion classes. | Gap 2: quotient-by-torsion source does not prove the integral target. |
| §10.27: The norm–residue formula for Milnor norms of a finite extension | Trivial extension gives identity; noncomplete valuations require the completion sum. | Depends on gap 2; no separable-residue weakening. |
| §10.28: Closed points of the regular proper model against places: the AlgebraicCurves dictionary and tame symbols | Closed point degree contributes residue-field norm; elliptic curves use the same general dictionary. | Retained with the stated hypotheses. |
| §10.29: Suslin's reciprocity law: Weil reciprocity in every degree for a proper curve over any field | Rational curve reduces to 0/∞ cancellation; positive genus retains the same integral statement. | Gap 2 propagates; corrected the Suslin torsion-quotient attribution. |
| §10.30: Weil reciprocity for the tame symbol on a proper regular curve | Diagonal tame factor at a common zero retains −1; disjoint-support shortcut is insufficient. | Retained with the stated hypotheses. |
| §10.31: Disjoint supports: f(div g) = g(div f), and EllipticCurves Layer 2's Weil reciprocity | Disjoint divisors give f(div g)=g(div f); common support is excluded from evaluation. | Retained with the stated hypotheses. |
| §10.32: Bass-Tate calculation for number fields | Number field in degree 3: real signs survive, imaginary fields give zero. | Added the primary Bass–Tate arithmetic proof outline. |
| §10.33: Bass-Tate vanishing over positive-characteristic global fields | Finite fields and transcendence-degree-one characteristic-p fields have no high-degree symbols. | Added the arithmetic and finite-subfield reduction outline. |

### Layer 11

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §11.1: Identification with the boundary of the localisation sequence | DVR boundary on {u,π} is ū in the product normalization; reversed symbol gives inverse. | Retained with the stated hypotheses. |
| §11.2: The localisation theorem for K₂ of a Dedekind domain: the boundary is the tame symbol at each prime | A field has no height-one primes; a Dedekind ring's direct sum has finite support. | Replaced raw θ₂ by θ₂♮ in the degree-two square. |
| §11.3: The product map intertwines higher residues with the signed localization boundary | n=1 compares valuation to K₀ residue; n=2 retains the signed boundary convention. | Retained with the stated hypotheses. |
| §11.4: Package the finite-support family as a total Milnor residue homomorphism | n=0 has zero residue targets; constants give zero finite-support family. | Retained with the stated hypotheses. |
| §11.5: Compare unit-part specialization with the two Quillen product specializations | Two unit-part specializations differ by multiplication with [−1] times the residue. | Retained with the stated hypotheses. |
| §11.6: Quillen transfers and the localisation boundary: the norm–residue square | Unramified and ramified finite extensions distinguish residue transfer from ramification restriction. | Retained with the stated hypotheses. |
| §11.7: Layer 10's Milnor norm is Quillen's transfer on K₂ | Degree-one extension gives identity; actual transfer equality requires product compatibility. | Conditional on gap 1, without choosing an abstract equivalence. |
| §11.8: The degree-two residue comparison square | ℚ(t), (2,t) gives 2 at zero; raw θ₂ introduces ε. | Repaired the normalized comparison and preserved the raw sign. |

### Layer 12

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §12.1: The unramified subgroup of K_2 of a field | No valuations gives the whole K₂; adding one valuation intersects another actual kernel. | Retained with the stated hypotheses. |
| §12.2: The tame-kernel sequence of the S-integers: residues at the primes outside S | S empty gives ordinary integers; inverting a prime removes its residue condition. | Retained with the stated hypotheses. |
| §12.3: The tame-kernel exact sequence for the ring of integers | For ℤ, finite-field K₂ vanishes and the boundary runs over all finite primes. | Retained with the stated hypotheses. |
| §12.4: The relative sequence comparing K₂(O_F) with K₂(O_{F,S}): residues at the primes in S | S empty gives identity inclusion; residue indices are precisely the primes inverted. | Retained with the stated hypotheses. |
| §12.5: The real sign symbol (Example III.6.2.1) | Over ℝ, (−1,−1) maps to −1 multiplicatively; positive factor maps to 1. | Retained with the stated hypotheses. |
| §12.6: Finite-rank integer word models for Silvester’s induction | The integer rank-two model has extra relations; raw St₂ is not substituted. | Retained with the stated hypotheses. |
| §12.7: Silvester’s monotone integer word lemma | Word length zero is terminal; integer parameters of both signs need monotone reduction. | Gap 3: the full word lemma and termination proof remain. |
| §12.8: The integer Steinberg kernel is contained in the monomial subgroup | Rank-two base cannot be inferred from a field Bruhat factorization. | Gap 3: Milnor/Silvester base and induction not obtained. |
| §12.9: The upper generation bound for K₂ of the integers | Only integer units ±1 generate the proposed bound; this assumes the word reduction. | Bound remains conditional on gap 3. |
| §12.10: K_2 of the integers is cyclic of order two, generated by {−1, −1} | Real sign detects the nonzero square-class generator; upper bound alone does not show order two. | Computation retains the same unresolved upper-bound dependency. |
| §12.11: K_2 of the rationals (Application III.6.5.1) | At p=3, {−1,3} has residue −1; real sign splits the extra ℤ/2 summand. | Uses the conditional integer computation. |

### Layer 13

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §13.1: Dennis-Stein symbols | r=0 or s=0 gives identity; at r=s=1 the modern expression is ineligible. | Added commuting-entry hypothesis; corrected old/modern translation and Morrow word. |
| §13.2: The Dennis-Stein relations (D1)–(D3) | Over ℚ, modern (−1,−2) is {−1,−1}; old P(−1,−2) is trivial. | Removed the spurious inversion; retained the ℚ(t) inverse detector. |
| §13.3: Threefold stability | 𝔽₂ and 𝔽₃ are not threefold stable; semilocal residue sizes ≥4 satisfy it. | Retained with the stated hypotheses. |
| §13.4: Presentation of K_2 of a field or a commutative local ring by Dennis-Stein symbols | Fields of sizes 2/3 still have zero K₂; statement includes nonfield local rings. | Nonfield small-residue proof remains gap 4. |
| §13.5: Dennis–Stein presentation for threefold stable rings | Threefold stability gives units in the three simultaneous positions; rank-two result is not rank-three. | Retained with the stated hypotheses. |
| §13.6: The local Dennis–Stein presentation, including residue fields 𝔽₂ and 𝔽₃ | ℤ/4 has residue 𝔽₂ and a nonzero symbol; field-only proof is inadequate. | Gap 4: full local generation/kernel proof required. |
| §13.7: The relative Steinberg group and relative K_2 of an ideal | I=0 gives zero relative group; I=A has trivial quotient; actual double-ring kernel retained. | Retained with the stated hypotheses. |
| §13.8: Relative Steinberg K₂ and the homotopy fibre | I=0 has contractible fibre; the K₃(A/I) connecting map cannot be dropped. | Gap 5: no absolute-kernel substitute for the fibre comparison. |
| §13.9: Presentation of relative K₂ for an ideal in the Jacobson radical | I⊆Jac(A) and the relative D2 input guard are both essential. | Repaired Jacobson/guard language; gap 6 remains. |
| §13.10: The relative differential symbol | Dual-number differential r·ds can be nonzero; indiscriminate D3 would force it to zero. | Kept the stricter D3 guard and named the target group. |
| §13.11: The square-zero kernel of the differential | I²=0 implies I⊆Jac(A), even though I need not be a radical ideal. | Corrected terminology; no identification of the kernel with zero. |
| §13.12: Square-zero ideals: the simplified relations and the source's test values | Square-zero inputs reduce the guarded relations; division by two is unavailable in ℤ/4. | Simplifications remain conditional on the relative presentation. |
| §13.13: Relative K₂ of dual numbers with two invertible | With 2 invertible the dual-number group is Ω¹; ℤ gives an extra ℤ/2 obstruction. | Primary tangent-module proof read; fibre comparison still consumes gap 5. |
| §13.14: A detector for K₂ of ℤ/4 | For ℤ/4, ⟨2,2⟩ is detected nontrivially, despite zero ordinary differential. | Retained with the stated hypotheses. |
| §13.15: The uniform dyadic nilpotent example | For ℤ/2ʳ, r≥2 gives the dyadic class; r=1 is the field and excluded. | Retained with the stated hypotheses. |

### Layer 14

| Statement(s) | Instances and computation | Result/change |
| --- | --- | --- |
| §14.1: The symbol formula, read in the Kummer map and cup product | m=1 gives zero target; characteristic dividing m is excluded; (a,1−a) cups to zero. | Retained with the stated hypotheses. |
| §14.2: Trivialising a twist by a primitive root, and the change-of-root rule | Changing ζ to ζᵘ scales the contraction by u⁻¹, not u; m=1 is trivial. | Retained with the stated hypotheses. |
| §14.3: The Brauer-valued symbol attached to a primitive root | Primitive-root contraction sends tensor powers to the specified Brauer class; sign is not arbitrary. | Retained with the stated hypotheses. |
| §14.4: The cyclic symbol algebra | Generators X,Y satisfy YX=ζXY; reversing them gives the inverse Brauer class. | Retained with the stated hypotheses. |
| §14.5: Cyclic algebras represent the Brauer symbol | At m=2, (−1,−1) over ℝ gives Hamilton quaternions; the m=4 proper-degree corner is still dimension 16. | Retained with the stated hypotheses. |
| §14.6: The norm residue symbol as a symbol on K₂ of a local field | Unramified local extension and a uniformizer pin the arithmetic-Frobenius direction. | Retained with the stated hypotheses. |
| §14.7: The Hilbert symbol as a Steinberg symbol | Over ℚ, conic values at (3,−1),(7,−1),(21,−1) are all −1, violating bilinearity; real zero inputs fail the strict-negative criterion. | Retained the local-field and nonzero-input hypotheses. |
| §14.8: The norm residue symbol against the local invariant of the Kummer cup product | Over ℚ₇, ζ₃ reducing to 2 gives cup invariant 1/3 for (3,7), while the Artin symbol is ζ₃⁻¹. | Kept the Artin comparison beyond the current cyclic-class identity. |
| §14.9: Global reciprocity for symbols in K₂ of a number field | For ℚ, the quadratic (−1,−1) factors at 2 and ∞ multiply to 1. | Retained with the stated hypotheses. |
| §14.10: Tate comparisons through the actual localization maps | The actual localization maps carry the comparison; an abstract group isomorphism is insufficient. | Retained with the stated hypotheses. |
| §14.11: Compatibility of the Galois symbol with the degree-two Chern class | Degree-(1,1) Chern product has coefficient −1; m=1 is zero; raw θ₂ has −ε. | Corrected θ₂♮ and raw sign; gap 1 still controls product normalization. |
