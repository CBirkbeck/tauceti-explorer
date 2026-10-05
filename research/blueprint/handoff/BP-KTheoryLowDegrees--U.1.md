# BP-KTheoryLowDegrees--U.1 — Morita comparison and congruence source boundaries

Codex — codex-xyXwzy. Refs #764. [Claim 5995504026](https://github.com/CBirkbeck/tauceti-explorer/issues/764#issuecomment-5995504026) was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/764#issuecomment-5995506472); the complete issue was reread after confirmation. This is a partial continuation of checkpoint PR #3189, not an independent review or a formalization.

## Delivered

Six new declarations preserve all 222 inherited IDs and 217 complete inherited node objects. ring-k0-morita’s finite-dimensional acceptance and use now point to the native comparison. Four U.4 nodes update historical SK₁-only scope annotations: sk1-generated-by-mennicke-symbols, power-reduction-totally-imaginary, arithmetic-mennicke-symbols-trivial and bass-milnor-serre. Their mathematical statements, proof steps and prerequisites are unchanged; the annotations now locate the newly required stronger congruence targets as gaps. All 450 inherited baseline records, source findings, restructuring proposals and planets survive. The four earlier gaps survive. Eight earlier requests survive; the resolved Morita request is retained under resolvedRequests with its resolution.

Z.1/morita-split-exact-square equates the two actual additive equivalences from RingK0 A to ExactK0 of finite projectives over B. Native finite-projective exact structures are split. The restricted equivalence and inverse are additive, so native isConflationExact_split supplies both exactness proofs, and map_comp_fromSplit supplies naturality. Native mapEquiv_of and hom_ext fix the upstream finite-dimensional normalization on every object class. No second categorical K₀ or finite-dimensional Morita construction, or unpublished upstream theorem name, is assumed. Z.1 is now source_decomposed; implementation and independent acceptance are not claimed.

Five U.4 lemmas give the elementary-containment step of the newly routed congruence theorem:

1. normal-sl-root-membership transports coefficient membership between ordered roots using signed elementary permutations and normality in SL.
2. normal-sl-root-level constructs the common coefficient ideal; a third root and the commutator identity supply ideal multiplication.
3. finite-index-root-level-nonzero injects the coefficient ring into the finite quotient if the ideal were zero, giving nonzero level for an infinite ring.
4. root-level-contains-relative-elementary transports the existing U.5 closure of E-conjugates from GL to SL, using native toGL, injectivity and closure induction.
5. finite-index-elementary-cofinality applies these to the native finite-index normal core of any H≤SL_n(R).

The last theorem requires R infinite and n≥3. It does not assert finite index of all elementary levels over arbitrary R, or principal congruence containment. No replacement elementary group or congruence-completion carrier is introduced. Root transport is a separate lemma. Two typed tests check the integer principal-level criterion and the finite-field bottom-subgroup control; two further tests check the Morita matrix square and actual object classes.

## Newly routed sources and precise remaining work

The packet's routedSourceContinuation and the reader inventory **all 21** Bhatt–Scholze items named by the issue, with their exact existing owner IDs. Graded/Picard/perfect/Witt determinants are already in KTheoryLowDegrees--Z.3; local K₀, SK₁ and plus-loop inputs remain here. Generic Picard groupoids remain SF.1, spectra/truncation H.5:spectra, and group completion/agreed K models H.4 and K.4:construction. The companion also retains its JacobianChallenge ordinary-Picard normalization request. Its review currently says needs_changes; this inventory does not accept or re-review it. Do not make U.3 depend on local-det-equivalence, which consumes U.3. ring-spectrum-det already has a determinant-on-loops π₁ API: resolve the coherent model comparison instead of defining another determinant. The signed braiding and the obstruction to forgetting grade as a symmetric monoidal/spectrum map are retained.

CG Remark 9.3 uses CSP for its **latter two** cases: GL₂ over a CM quartic and GL₃/ℚ. It does not assert finite congruence kernel for SL₂ over an imaginary quadratic field with no finite places inverted. The inherited U.4 sentence excluding relative Mennicke universality and C_I is superseded: the newly routed source requires them.

Four new gaps describe unplanned U.4 targets. Their neededBy lists are empty because the target declarations have not yet been added; stageIds and unplannedTarget locate the work without making it a fictitious dependency of the elementary-containment lemmas:

- BMS Theorem 4.1(c), finite-rank relative Mennicke universality, and Corollary 4.3's finite arithmetic defect with r(I) and compatible transition maps. The inherited abstract universal Mennicke group and stable SK₁ symbol do not supply this. Resume at Kubota §6 and the extension §§8–10, then the arithmetic calculation.
- Arithmetic/congruence completions, kernel as lim_I C_I and BMS Theorem 14.1's central kernel: μ(F) for totally complex F with S empty, trivial otherwise. Import generic profinite completion/limits from their topology owners. The independent finite-index result for every nonzero elementary level is also needed before elementary cofinality identifies the completion.
- Serre §2.6 Theorem 2 for SL₂ at infinite unit rank. Translate his S (including infinite places) to this packet's finite-place S: r₁+r₂+|S|≥2. A CM quartic satisfies it. Serre's E_I is a normal closure in SL₂(A), whose identification with the inherited relative group is not automatic. The §2 arguments and Moore relative-cover classification remain to be read/decomposed. Do not duplicate the separately routed SL₂(ℤ[1/p]) case in ModularCurvesPartII R14.4.
- The precise SL-to-GL lattice and Hecke-cohomology contract used by CG for localized H¹ vanishing. Finite kernel alone does not make every mod-p character factor through congruence completion when p divides its order; state coprimality or prove its non-Eisenstein localization vanishes separately. General Hecke/local-system cohomology stays with its consumer owner.

The inherited gaps still concern the LieGroups SL-to-SO retraction, degree-m Hilbert/power-reciprocity cycle and symbol orientation, higher-unit Hilbert symbols in the totally imaginary case, and the relative-K₁ homotopy-fibre comparison with its preceding K₂ term. U.6 retains the H.3 plus-universal-property proof boundary and now records the coherent graded determinant-loop comparison. No stage is closed; the pass remains partial.

## Read scope and provenance

Read all binding worker/protocol/style documents, eight reviewed AUDIT-29 rows, accepted RS-18 ownership, the owner roadmap and atlas stages/edges, and all touching link entries. Complete upstream style reads were GrothendieckEulerForms and Multiquadratic. Read the inherited packet inventory, coverage/gaps/requests, relevant Morita and relative-elementary contracts, and companion determinant contracts. Unchanged inherited Milnor, arithmetic and Spin evidence was not independently re-audited in full.

Fresh primary-source reads on 5 October 2026 are recorded with URLs, SHA256 and versions in sources/sourceVersions, and in the reader:

- [Bass–Milnor–Serre (1967)](https://www.numdam.org/item/10.1007/BF02684586.pdf): §4 Theorem 4.1/Corollary 4.3, pp.94–96; §7 Theorem 7.5(e), pp.105–106; §14 Theorem 14.1 and proof, pp.129–130. Hash matches the inherited public scan. The root argument is a worker deduction, not claimed printed verbatim by BMS.
- [Calegari–Geraghty (2018)](https://www.math.uchicago.edu/~fcale/papers/CG.pdf): Remark 9.3, printed p.415, physical p.119. Hash matches the extracted published version.
- [Bhatt–Scholze, author copy](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf): Construction 5.1/Proposition 5.3/Remark 5.4, pp.18–19; Theorem 5.7 and proof, p.20; Lemma 6.11 and both determinant arguments, pp.24–25; Example 12.2/Proposition 12.3, p.55; Corollary 12.17/Proposition 12.18, p.59.
- [Serre (1970), author-hosted published scan](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf): Introduction/§1.1–1.4, pp.489–491, and §2.6 Theorems 1–2/Corollaries 1–3, pp.498–499. The preceding §2 proof and Moore source were not read in full. OCR changes ≥ into >; the prose explicitly says at least two places.

No new source error is asserted. All ten inherited source findings and versions are retained. Twenty-one native statements were freshly read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; seventeen are new baseline records. Exact Git blobs and shared source bytes were verified. Generic naturality, split exactness, normal cores and SL transvections are reused. Searches found no pinned common-root/finite-index elementary-cofinality theorem on these carriers.

## Validation and counts

228 nodes: 16 definitions, 38 constructions, 94 lemmas, 61 theorems, 9 comparisons, 10 applications. There are 437 API items, 234 packet tests, 244 typed examples, 44 planets, 467 baseline citations, 10 inherited source findings, 8 gaps and 8 requests. The checker counts 433 API items and 226 tests on definitions/constructions; the totals above also include lemma/theorem/comparison items.

The indexed packet checker has zero errors and warnings. Inherited preservation, the 21-item inventory, new reader contracts and typed test names, and reserved-ID checks pass. The internal graph is acyclic: 649 internal edges, 1380 total prerequisites. New proof dependencies are native baseline statements or existing/new nodes; the unplanned congruence targets are separate gaps. There are 1740 exact integer signed-conjugation checks in dimensions 3,4,5 with coefficients −3,0,2. These check coordinate signs and do not constitute formal proofs.

The suggested file **did not elaborate**. The prescribed lean-check stopped at import loading because the shared build lacks TauCeti/CategoryTheory/Exact/Functor.olean, before any declaration was checked. A read-only LEAN_PATH attempt with an existing cache did not change the result. Memory was sufficient. No library build/update/cache download, language server, repository clone/copy or auxiliary Lake project was started. The predecessor's successful Lean check remains historical. The next worker needs the shared baseline object files supplied before rerunning lean-check.

Final publication comparison against origin/main 6417f4eae40e972d6bb80ea2b3e5e6a4be553524 found no changes to the binding instructions, this job's four files, reviewed audit, RS-18, reserved IDs, companion packet or routed extractions. Only the four authorized deliverables change.

## Confirmed findings and resume

RT-AREA-ktheory-1/9: ownership is preserved. U.6 owns K₁(ℤ), the companion owns degree-zero computations, and K₂/tame-kernel calculations remain T.5. RT-AREA-ktheory-1/24: the inherited S-unit-rank decomposition, finite-index valuation image and chosen fundamental S-units remain intact. RT-AREA-ktheory-1/25: precise ClassFieldTheory/Chebotarev requests, prime-choice node and CA.1 reciprocity boundary remain intact. The full congruence target boundary is now explicit; stable SK₁ vanishing is not used as a replacement for CSP. The reciprocity cycle and orientation remain unresolved.

Resume at the new U.4 finite-rank relative Mennicke universality gap. Preserve left-module K₀, right-module/column K₁, finite-place S, positive DVR boundary, canonical carriers and all source corrections. Use the exact owner IDs in routedSourceContinuation. Continue the partial pass at the stated proof contracts; keep source citations and detailed lemma-level proof closure distinct.
