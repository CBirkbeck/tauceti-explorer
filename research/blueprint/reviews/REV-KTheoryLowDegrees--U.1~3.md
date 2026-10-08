# Independent review: REV-KTheoryLowDegrees--U.1~3

**Verdict: accepted as a complete bounded planning pass.** Reviewer: Codex, session `codex-9Lbyje`, 2026-10-08. Refs #7069. I did none of the three blueprint jobs being reviewed. Acceptance concerns the correctness and honest scope of this plan; it certifies no Lean implementation and closes no stage.

Read the preceding independent review and round-3 revision handoff, then independently checked every current node, its sources, hypotheses, proof route, direct prerequisites, API and tests. The packet’s `review.checked` is the full node-by-node ledger: **296 verified, 38 corrected, no added nodes, no unverifiable entries**. All 334 original IDs survive. The four formerly unverifiable entries now have verdicts on their explicitly conditional plans: their source statements and available arguments are checked, and their missing proof inputs remain named gaps. This is not a claim to have supplied those inputs.

## Inventory and stage scope

| Item | Checked inventory |
| --- | ---: |
| Nodes | 334 |
| Definitions / constructions | 23 / 48 |
| Lemmas / theorems | 172 / 69 |
| Comparisons / applications | 12 / 10 |
| API items / tests, all nodes | 502 / 293 |
| API items / tests, definitions and constructions | 498 / 285 |
| Pinned baseline declarations / modules | 484 / 221 |
| Planets | 44 |
| Source records / freshly downloaded PDFs | 12 / 10 |
| Independently confirmed source issues | 15 |
| Retained gaps / supplier requests | 9 / 8 |

The checker counts API and tests on definitions/constructions; the larger totals include the additional items on other node kinds. Every definition/construction has at least three tests. The 44 planets are mathematical objects or named theorems, with at most six on any stage.

| Stage | Nodes | Coverage status |
| --- | ---: | --- |
| Z.1 | 53 | source_decomposed |
| Z.2 | 30 | source_decomposed |
| U.1 | 27 | source_decomposed |
| U.2 | 22 | source_decomposed |
| U.3 | 44 | partial |
| U.4 | 113 | partial |
| U.5 | 31 | partial |
| U.6 | 14 | partial |

The four source-decomposed stages realize their narrowed targets. `complete` means this one pass is complete under PROTOCOL §0; it does not mean all eight stages are closed. No coverage status or implementation status was promoted. All implementation statuses remain `unchecked`.

## Corrections made in this review

Each row names an existing node; the reasons also appear in its ledger entry. No definition, carrier or theorem node was added.

| Corrected node | Change |
| --- | --- |
| `Z.1/free-summand-data` | Replace the quoted upstream contract by an authored description. |
| `Z.1/ring-k0` | Replace the quoted upstream contract by an authored description. |
| `Z.1/extend-scalars` | Replace quoted source/upstream prose with an authored contract. |
| `Z.1/extend-scalars-finite-projective` | Use the additive functor already constructed; preservation of products alone does not supply preservation of zero morphisms. |
| `Z.2/rank-localization` | Remove duplicate quantifier. Remove obsolete part label. |
| `Z.2/rank-fibre-decomposition` | Replace quoted source/upstream prose with an authored contract. |
| `Z.2/rank-connected` | Replace quoted source/upstream prose with an authored contract. |
| `U.2/automorphism-class-independence` | Correct the locator to the actual complement-existence step (a). |
| `U.3/division-ring-reduction` | Supply the omitted final-column clearing; the matrix was not yet diagonal. |
| `U.3/dieudonne-determinant` | State the native rank-zero convention explicitly. Use a row permutation rather than permutation conjugation. |
| `U.3/dieudonne-expansion-properties` | Account for nonadjacent pivot row shuffles instead of a uniform minus sign. Repair the zero-first-entry row case and use lower-rank elementary invariance. |
| `U.3/dieudonne-block-triangular` | Handle empty blocks before using positive-rank reduction. |
| `U.3/no-units-valued-determinant` | Separate the zero parameter from conjugation by a unit. |
| `U.4/mennicke-symbol` | Remove the obsolete claim to a verbatim transcription. |
| `U.4/q-equivalence-to-base-point` | Attribute only the first move of Lemma 2.2(a) to this split node. |
| `U.4/mennicke-symbol-residue-map` | Require a finite residue field for the finite-cyclic acceptance case. Narrow source attribution to the actual split clause. |
| `U.4/mennicke-symbol-residue-homomorphism` | Require a finite residue field for the finite-cyclic acceptance case. |
| `U.4/sk1-mennicke-symbol` | Give the lower conjugation in the direction yielding the claimed plus sign. |
| `U.4/dirichlet-theorem-arithmetic-type` | Explain compactness using the actual norm-one subgroup and the number-field norm quotient. Correct the published idèle normalization and exclude primes of b in prime selection. Use c=d with the corrected normalization; the printed c=ad gives wrong local conditions. |
| `U.5/relative-determinant` | Clarify that the relative vanishing use assumes containment in the Jacobson radical. |
| `U.5/relative-sequence-degree-one` | Retain the rank restriction in Stallings’ example. |
| `U.5/transfer-base-change` | Require the full inverse image S′=preimage(S) for arithmetic finite transfer. |
| `U.5/K0-action-on-K1` | Distinguish determinant equality from K₁ equality. Direct supplier/prerequisite: KTheoryLowDegrees:U.4/bass-milnor-serre |
| `U.5/projection-formula` | Require S′ to be exactly the primes above S for finite arithmetic transfer; arithmetic K₁ equality also uses determinant injectivity. Replace the nonexistent Corollary III.1.7.1(c) attribution by the printed composite and the explicitly derived tensor/restriction projection formula. |
| `U.6/pi1-plus-construction` | Direct supplier/prerequisite: StableHomotopyKTheory:H.1/classifying-space-of-group-is-KG1 Direct supplier/prerequisite: StableHomotopyKTheory:H.3/plus-fundamental-group Direct supplier/prerequisite: StableHomotopyKTheory:H.3/plus-is-acyclic Direct supplier/prerequisite: StableHomotopyKTheory:H.3/hspace-is-abelian Check and discharge the actual abelian-target restriction through the imported loop-space comparison. Use the group-specific π₁ theorem. Cite the actual fundamental-group and acyclicity suppliers. Avoid an unrestricted universal-property import and make the proof order explicit. |
| `U.6/pi1-plus-determinant` | Direct supplier/prerequisite: StableHomotopyKTheory:H.1/classifying-space-of-group-is-KG1 |
| `U.6/pi1-plus-transfer` | Direct supplier/prerequisite: GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q Direct supplier/prerequisite: StableHomotopyKTheory:H.3/hspace-is-abelian Verify the target hypothesis in the transfer factorization. |
| `U.6/relative-K1-homotopy-comparison` | Direct supplier/prerequisite: StableHomotopyKTheory:H.2/long-exact-sequence Cite the long-exact-sequence theorem separately from the fibre definition. |
| `U.4/type-l-normalized-generation` | Direct supplier/prerequisite: KTheoryLowDegrees:U.1/signed-transposition |
| `U.4/mennicke-symbol-smaller-ideal` | Require a finite residue field for the finite-cyclic acceptance case. Narrow source attribution to the actual split clause. |
| `U.4/mennicke-symbol-residue-function` | Require a finite residue field for the finite-cyclic acceptance case. Narrow source attribution to the actual split clause. |
| `U.4/mennicke-symbol-common-residue-image` | Require a finite residue field for the finite-cyclic acceptance case. Narrow source attribution to the actual split clause. |
| `U.4/mennicke-symbol-image-abelian` | Require a finite residue field for cyclicity. |
| `U.5/projection-formula-transfer-k0` | Specify finite-transfer hypotheses and justify arithmetic K₁ equality. Direct supplier/prerequisite: KTheoryLowDegrees:U.4/bass-milnor-serre |
| `U.5/transfer-base-change-composite` | Specify finite-transfer hypotheses and justify arithmetic K₁ equality. Direct supplier/prerequisite: KTheoryLowDegrees:U.4/bass-milnor-serre |
| `U.5/relative-SK1` | Clarify Jacobson containment rather than the unrelated radical-ideal predicate. |
| `U.5/relative-SK1-quotient` | Clarify Jacobson containment rather than the unrelated radical-ideal predicate. |
| `U.5/relative-K1-units-split` | Clarify Jacobson containment rather than the unrelated radical-ideal predicate. |

The determinant corrections preserve multiplication order over a division ring. After clearing the first n−1 columns, reduction has reached [[I,c],[0,μ]], rather than a diagonal matrix; left multiplication by eᵢₙ(−cᵢμ⁻¹) clears the remaining column. Moving a pivot into a block-triangular position permutes rows alone. Comparing nonadjacent recursive pivots requires the row-order factor (−1)^(i+j); the adjacent minus sign does not apply uniformly. Lower-rank signed swaps and elementary invariance justify the factor and the zero-first-entry row case. The existing empty determinant Δ₀=1 is now explicit, including empty blocks. The quaternion no-determinant argument treats the zero transvection parameter as identity before inverting any parameter. These details were checked against Dieudonné n°6–7, printed pp.32–38.

For residue symbols, an arbitrary Dedekind domain has abelian residue-unit images, but finite cyclicity needs a finite residue field. For example, ℂ[t] with the prime (t) has residue field ℂ. The arithmetic transfer tests require S′ to contain exactly all primes above S: additional inverted primes generally destroy finite projectivity over the base S-integer ring. For a rank-one ideal the general calculation is det([I]·[u])=u. Equality [I]·[u]=[u] in K₁ also needs determinant injectivity; the arithmetic examples now cite BMS directly. The projection formula is derived by the tensor/restriction identification and K-book III.1.6.1/III.1.7; it is not a nonexistent part (c) of Corollary III.1.7.1. These statements are distinguished from the false reverse push-pull already recorded as E113/E114.

The eight correction groups requested by round 2 are present and independently sound: the actual stable-idempotent carrier, restricted-baseline proof replacements, center/diagonal-unit argument, identity versus nonidentity transvections, all eight finite-S native hypotheses, the patching prerequisites, the direction of `Abelianization.equivOfComm`, and the corrected locator/test labels. The reader agrees with these corrections. The two transvection nodes and three basis/index citations added by that earlier review remain attributed to it; they are not additions by this review.

All reader statement, hypothesis, proof, use, API, test, acceptance, prerequisite and source fields were compared with the final packet. Baseline descriptions, stage notes, source findings and supplier boundaries were synchronized as well. Quoted source/upstream prose was replaced with authored descriptions in the affected contracts, requests, source findings and coverage note. Historical review records were preserved with their original dates and attribution. Lean annotations identify the corrected proof routes and the circle tests; no comment is used as evidence that a type checked.

## Baseline verification

Opened all 484 cited declarations in their 221 modules at **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and **Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. Read their statements together with enclosing variables and typeclasses; read adjoining definitions/proofs where the contract requires their conventions. Every entry now records this review’s exact-pin check. No citation was removed or added.

One description was too broad: `Ideal.finrank_fiber_eq_finrank`, `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean:392`, requires a **finite flat module over a commutative domain** and a prime ideal. It does not assert the fibre formula for arbitrary modules. Its description and reader entry now state the restriction. The citing finite-projective nodes satisfy it.

Checked the arbitrary-ring balanced scalar extension against the commutative-only native tensor interfaces; additive K₀ maps against the existing additive functor laws; finite-projective Morita restriction against submodule-order/compactness and projectivity preservation; and the split/exact square against the actual object-class map. Existing categorical K₀, module retracts, stalk rank, local flat freeness, commutative transvections and generic subgroup/topology infrastructure remain baseline imports. Their narrower scope does not silently replace a required general-ring or arithmetic theorem.

## Public source evidence

Fresh downloads of the ten public PDFs match their recorded SHA-256 hashes. `sourceVersions` records the URLs and date; the following is this review’s page-reading ledger, not a summary of those sources. PDF pages are physical, one-based pages. The packet gives each node’s precise theorem/section locator.

| Source | Passages actually read in this review |
| --- | --- |
| [Weibel’s 29 August 2013 author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | PDF pp.9–30, 71–89, 140, 187–217, 230–231, 268–276, 283, 336, 340–341, 355–356, 417–422, 510, 515; printed pages = PDF pages − 8. |
| [Bass 1964](https://www.numdam.org/item/10.1007/BF02684689.pdf) | PDF pp.5–18 and 28–33; printed pages = PDF pages + 3. |
| [Dieudonné 1943](https://www.numdam.org/item/10.24033/bsmf.1345.pdf) | PDF pp.2–16; printed pages = PDF pages + 25. |
| [Bass–Milnor–Serre 1967](https://www.numdam.org/item/10.1007/BF02684586.pdf) | PDF pp.8–63 and 72–73; printed pages = PDF pages + 57. Printed pp.84 and 111 also inspected as scan images. |
| [Milne ANT](https://www.jmilne.org/math/CourseNotes/ANT.pdf) | PDF pp.11–13, 37–38, 73, corresponding to printed pp.9–11, 35–36, 71. |
| [Conrad, Ideal factorization](https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf) | p.1, Example 1.3. |
| [Bhatt–Scholze](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf) | pp.18–20, 24–25, 55, 59, for the 21 routed determinant contracts. |
| [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | Remark 9.3, printed p.415 / PDF p.119. |
| [Serre’s SL₂ article](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf) | Printed pp.489–491, 498–499 / PDF pp.2–4, 11–12: introduction and §2.6 statements/deductions. |
| [Serre’s 1974 erratum](https://www.numdam.org/item/10.1007/BF02685884.pdf) | Complete article, printed pp.241–244 / PDF pp.2–5. |

The two additional source records are proof routes through the exact-pinned Lean declarations, not unread books. The SL₂ article’s full §2 proof, Moore classification and inaccessible `Corps locaux` propositions are not claimed as read. Their missing proof content remains explicit. No restricted-library book was used.

All E101–E114 have fresh `confirmed` verdicts naming this job. Checked each locator and its mathematical reason: canonical free-class normalization, total ideal intersection, punctuation, Whitehead numbering/reference, the finite-rank commutator exception, Bass’s spelling, arithmetic prime indexing and S-scope, boundary reference, swapped first entry, unrestricted root parameter, withdrawn norm-exponent calculation, and the two reverse-transfer counterexamples. K-book findings remain limited to the specified author draft. E112 is the already published correction in Serre’s 1974 erratum, not a new erratum claim.

### New source issue E115: BMS (A.10)

The printed proof on p.84 chooses an auxiliary idèle ā equal to a at primes dividing b and to 1 elsewhere, obtains t x̄ v=ā d, and sets c=ad. At a place away from b the equation instead yields d=t x̄ v, so c has an extra factor a. For F=ℚ, a=2, b=5 and S₀ empty, every selected prime p₀ other than (2),(5) gives ord₂(d)=0 and ord₂(c)=1, contradicting cA=p₀. This disproves the proof’s local identification, not the theorem.

The corrected proof chooses ā=a⁻¹ at primes dividing b and ā=1 elsewhere, uses the same equation t x̄ v=ā d, and takes **c=d**. At primes dividing b, c=a v; at the other places, c=t x̄ v. Thus it has the required congruence, prime ideal and prescribed local-coset properties. Prime selection also avoids the finite set of primes dividing b. The compactness step now explains why the number-field archimedean identity component makes the norm image of V all of ℝ₊, allowing compact norm-one classes to surject onto the discrete quotient.

The [independent public author scan](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5461805512086878285_Bass_Milnor_Serre.pdf), printed p.84 / PDF p.26, has the same normalization. The [Numdam primary record](https://www.numdam.org/item/PMIHES_1967__33__59_0/) links the A.23 correction; the full 1974 erratum does not correct A.10. Targeted public errata searches found no correction, but that search is not exhaustive: E115 deliberately records `known: unknown`.

## Closure, supplier contracts and ownership

Read all eight applicable reviewed library-audit entries and the accepted RS-18 contract. The narrowed categorical/ring K₀ ownership is respected. GrothendieckEulerForms owns the general split/exact carriers; GeneralAlgebraicKTheory owns plus/Q and the generic relative fibre; SchemeKTheoryOperations owns the DVR boundary and its positive uniformizer sign. The ring-specific Morita and localization examples here are adapters and consumers. The companion Z.3–Z.6 part owns graded lines, coherent perfect-complex determinants and the Witt-support determinant. The 21 routed Bhatt–Scholze contracts do not create another Picard groupoid or determinant theory. Nonaccepted supplier reviews remain recorded as such.

The actual H.1–H.3 supplier statements were read, rather than inferred from their titles. `nerve-and-classifying-space` defines the space; `classifying-space-of-group-is-KG1` supplies π₁BG=G. `plus-construction-by-cell-attachment` supplies the construction; `plus-fundamental-group` and `plus-is-acyclic` supply separate conclusions. The fibre definition does not supply the LES; `H.2/long-exact-sequence` is now a direct prerequisite. Most substantially, H.3’s universal property currently covers connected **abelian** CW targets. B(Aˣ) meets this directly. Naturality and transfer into BGL(A)⁺ first use the imported plus-equals-Q comparison and then `hspace-is-abelian` on the connected loop-space component. They do not import a universal property for arbitrary nonabelian targets or use this node’s naturality to prove that comparison. This is a planning dependency on the supplier contract, not a completed supplier proof.

Read the relevant CFT layers 5/12/13, Chebotarev layers 4/10, GlobalNumberFields layers 6/7 and LieGroups layer 9 contracts. All eight precise requests retain canonical direct stage edges on every listed consumer. CFT layer 5 supplies no general-degree Artin dictionary; its exponent-two neighbour cannot stand in for that dictionary. The cohomological power-symbol pairing, BMS/CA.1 transpose, admissible modulus, positive Frobenius orientation and power-subgroup topology remain distinct requirements. The existing CA.1 → T.7 → … → U.4 cycle is not disguised as an acyclic import.

The assigned red-team findings are correctly reflected in packet and reader:

- **RT-AREA-ktheory-1/9:** T.5 owns degree-two tame-kernel sequences/examples, N.6 the certificates, N.8 imports; U.6 owns classical K₁ examples and companion Z.6 the K₀(ℤ) example.
- **RT-AREA-ktheory-1/24:** finite S, ordinary-unit kernel and the valuation image’s finite class-group index give rank r₁+r₂+|S|−1. Chosen fundamental S-units give a separate noncanonical splitting.
- **RT-AREA-ktheory-1/25:** the arithmetic route uses the actual number-field suppliers. General-degree reciprocity and higher-unit formulas remain gaps. Finite central congruence kernel alone does not establish the CG localized-H¹ claim; coefficient/kernel and Hecke-localization conditions are retained.

All nine gap records remain: the real-circle retraction; degree-m reciprocity; higher units; relative-plus π₀/π₁ and boundary comparison; finite-level §10/§11 continuation; arithmetic completions; the infinite-unit-rank SL₂ case; the CG cohomology interface; and the local-symbol/topology package. They feed both existing conditional targets and unplanned targets, as specified in the packet. None is replaced by stable SK₁=0, unrestricted excision, an unsourced pairing or an abstract five-lemma argument.

The tests were assessed for wrong-convention detection: row versus column actions, zero-padding versus identity stabilization, zero rings/disconnected spectra, nonfree projectives, noncommutative coefficients, relative normal closures, scalar qA versus level ideals, boundary signs, asymmetric Related, and choice-dependent standard forms. An independent enumeration also recomputed GL₂/SL₂ elementary and commutator subgroups over 𝔽₂ and 𝔽₃: |GL₂(𝔽₂)|=6, its commutator has order 3, E₂ has order 6; |GL₂(𝔽₃)|=48, its commutator has order 24, SL₂’s commutator has order 8, and E₂ has order 24. These distinguish the perfectness and commutator exceptions.

## Validation and orchestrator action

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.1.json` reports **0 errors, 0 warnings**. Additional checks cover all 334 reader contracts and 484 descriptions, one current ledger entry per node, unchanged IDs/statuses, all 15 current finding reviews, retained gaps/requests, minimum test counts, planet caps and source hashes. `git diff --check` passes. Only the four issue deliverables and this job’s required handoff are changed.

Read the entire 9067-line input suggested file, including the mathematical statements after stripping comments. It is explicitly a nonexhaustive prototype; name annotations, abbreviated namespaces and `sorry` placeholders do not establish API implementation. Its actual signatures were checked against the contracts. All proof holes remain honest `sorry`s, with no axiom or fabricated True-valued replacement.

**The Lean file did not compile.** `lean-check` was attempted with 105 GB available and stopped at the first import: `TauCeti.CategoryTheory.Exact.Functor.olean` is missing. No declaration body was reached. Mathlib in the shared build matches the pin, but its Tau Ceti checkout does not; no existing complete exact-pinned build was found. No build, update, cache download or language server was started. Elaborating this prototype requires a pre-existing complete build at both exact pins.

No orchestrator clarification is needed to accept this bounded pass. Intake may process its accepted review and synchronized reader under the usual workflow. Future continuation should take only the precise open stages and supplier contracts already recorded; it must not duplicate their owners. This review is finished, rather than an unfinished reviewer checkpoint.
