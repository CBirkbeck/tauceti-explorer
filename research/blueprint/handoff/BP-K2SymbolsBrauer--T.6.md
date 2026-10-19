# BP-K2SymbolsBrauer--T.6 — handoff

Issue: #10817. Agent: Codex, session `codex-PVxIak` (GPT-6). Branch: `codex-PVxIak-k2-relative-tate`. The bot confirmed the claim at issue comment 6269015710. This is one target-level planning pass, submitted as **complete**, with both stages **planned** under PROTOCOL §0. It is not a checkpoint or a claim of mathematical gap-free closure. No implementation is claimed.

## Deliverables and checks

- `research/blueprint/packets/K2SymbolsBrauer--T.6.json`: 20 targets, 26 API items, 19 definition tests, six planets in each of T.6 and T.7, three precise proof gaps, and five import contracts for existing Tau Ceti roadmaps.
- `research/blueprint/readmes/K2SymbolsBrauer--T.6.md`: approximately 8,000 words, all statements, hypotheses, arguments, dependencies, API and tests in our own words, with source locators and versioned references.
- `research/blueprint/suggested/K2SymbolsBrauer--T.6.lean`: 186 lines. Only real-bodied light definitions and statements over existing pinned carriers. No data definitions use `sorry`. Heavy K₂, twist, Brauer and Chern carriers stay in the README.

Validation on 19 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.6.json`: zero errors, zero warnings.
- `python3 research/blueprint/intake.py check-files` on the four deliverable paths: zero problems.
- `check_errata.versions_checked` on the packet’s source findings: passed. The blueprint checker also checks the finding’s required fields.
- `lean-check` on the suggested file at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: **passed**, exit 0; only the expected declaration-uses-`sorry` warnings. Available memory before compilation was 83 GB. No language server or build was started; no compile remains running.

The local Lean checks caught and corrected a coefficient topology assumption. The final file elaborates with the native continuous Kummer/cup APIs. Finite arithmetic examples use the real `ZMod` carriers. Separate scratch computations eliminated the full integer Dennis–Stein relation matrices for ℤ/4, ℤ/8, ℤ/9 and ℤ/16; the durable proof for ℤ/4 and the uniform dyadic argument are in the reader. The finite experiments are not prerequisites or substitutes for a proof.

## Mathematical progress

The general D1–D3 relations are now supported by Stein–Dennis 1973 Proposition 1.1, pp.283–285. In particular D2 follows from H3 with increment c(1+ab), H5, H2 and cancellation of the two reversed unit symbols. This does not use a field presentation.

Van der Kallen 1977 Theorems 5.3, 6.2 and 7.1 and their chunk constructions supply the threefold-stable presentation argument, including its inverse and stabilization for ranks at least three. The local residue-field criterion isolates the cases not covered by this proof. The rank-two kernel is not silently identified with stable K₂.

The relative differential construction checks every guarded relation. Its square-zero kernel proof uses the abelian presentation of I⊗Ω, avoiding an assumed module structure on relative K₂. The dual-number comparison is proved when two is invertible. A rational square-zero extension with a two-dimensional ideal has a nonzero determinant detector in the differential kernel: even invertibility of two does not kill that kernel for an arbitrary square-zero pair.

The ℤ/4 detector is an explicit three-entry parity table and gives both bounds. The uniform dyadic proof is also supplied: reduce all Dennis–Stein generators to unit symbols, import the existing CA.1 generators −1 and 5, deduce exponent two, and kill {−1,5}=2D(−2,2). The unit identity {5,5}={5,−1} kills the remaining extra generator. Reduction to ℤ/4 detects {−1,−1}. This closes the old uniform-computation refinement, conditional only on the retained all-local presentation input.

The all-m cyclic-algebra comparison handles a proper Kummer field degree d<m by an idempotent corner and a matrix algebra of size m/d. The carry cocycle and two explicit coboundaries identify that corner with the contracted native Kummer cup. The current QFI generic crossed-product comparison is imported.

The local comparison is fixed by the character–Artin identity: for Artin-first/root-second H_m and native cup order (a,b), H_m(a,b)=ζ to the **negative** invariant coordinate. The ℚ₇ cubic example distinguishes this from a quadratic-only check. The invariant coordinate is [k/m]↦k, not multiplication by m in ℚ/ℤ.

The Chern comparison imports M.8’s construction and T.2’s product-normalized θ₂♮, obtaining c₂,₂(red θ₂♮x)=−h(x). The raw Hurewicz comparison has coefficient −ε. Integral K₁ products before reduction avoid asserting an unavailable finite-coefficient product at moduli two and four. The statement does not identify all K₂(F;ℤ/m) with K₂(F)/m.

## Three remaining proof inputs

1. **G1, all-local presentation:** prove generation and injectivity for nonfield local rings with residue 𝔽₂ or 𝔽₃. The 1975 van der Kallen–Maazen–Stienstra announcement and Weibel state it; van der Kallen 1977’s threefold-stable argument does not cover these residue sizes. The exact source to obtain is Maazen–Stienstra, *A presentation for K₂ of split radical pairs*, J. Pure Appl. Algebra 10 (1977), 271–294, DOI 10.1016/0022-4049(77)90007-X, together with the all-local references. The publisher denied access and no author proof copy was located. The dyadic result remains conditional on this presentation; its separate arithmetic proof is supplied.
2. **G2, relative π₂ comparison:** read Loday, *Cohomologie et groupe de Steinberg relatifs*, J. Algebra 54 (1978), 178–202, DOI 10.1016/0021-8693(78)90025-X, and Keune, *The relativization of K₂*, same volume pp.159–177, DOI 10.1016/0021-8693(78)90024-8. Construct the natural relative Steinberg-kernel/fibre comparison and identify the K₃(A/I) boundary, not just the absolute K₂ and relative K₁ maps. U.5 supplies only the latter. Levine §2.1 pp.289–290 recalls the assertion without its proof. Publisher access failed.
3. **G3, guarded relative presentation:** obtain and decompose Keune Theorem 15, with I⊆Jac(A), and D3 only when an input r, s or t lies in I. The split-radical announcement is insufficient for nonsplit pairs. Levine §2.1 p.290 records the precise statement; the original proof could not be read. The differential, square-zero and dual-number arguments explicitly depend on this input.

All source URLs, hashes, read sections and dates are in the packet. No inaccessible proof is represented as having been read. No book outside the maintainer’s clearance was used. Source PDFs and experiments were kept only in scratch and are not deliverables.

## Assembly and ownership instructions

The existing `K2SymbolsBrauer--T.3` packet contains six T.6 nodes and eight T.7 nodes. The new nodes use distinct ids and `refines`; they deepen those interfaces rather than introducing competing definitions. Merge their specifications and arguments at assembly:

| Earlier target | Continuation |
| --- | --- |
| T.6 Dennis–Stein symbol/relations | `modern-convention-calibration`, `general-relations-calculus` |
| T.6 local presentation | `threefold-stability`, `threefold-dennis-stein-presentation`, `local-presentation-completeness` |
| T.6 relative Steinberg group | `relative-homotopy-fibre-comparison` |
| T.6 relative presentation | `guarded-relative-presentation` |
| T.6 square-zero examples | `relative-differential`, `square-zero-differential-kernel`, `dual-number-differential-isom`, `zmod-four-symbol-detector`, `dyadic-nilpotent-computation` |
| T.7 symbol formula | `native-kummer-cup-comparison`, `arithmetic-tate-localization-adapters` |
| T.7 classical local symbol/Steinberg law | Redirect definitions and laws to the existing CA.1 nodes; use `normalized-local-invariant-comparison` |
| T.7 twists and Brauer symbol | `root-brauer-coefficient-adapter`, `cyclic-symbol-algebra`, `cyclic-algebra-cup-comparison` |
| T.7 local/global comparison | `normalized-local-invariant-comparison`, `global-brauer-reciprocity-adapter` |
| T.7 Chern agreement | `normalized-etale-chern-comparison` |

Correct the earlier conversion P(−r,s)⁻¹ to P(−r,s). The version-scoped source finding `K2SymbolsBrauer/E-T6-old-symbol-inverse` gives the explicit word check and the rational-function residue test. It concerns the hashed separate Weibel chapter; no allegation is made against an uncollated published edition. The author’s errata link returned 404; Morrow Remark 3.10 has the corrected change of argument.

The previous open supplier requests for twists, Tate local/global/S-integer comparisons, finite Chern classes and higher reciprocity now resolve to precise existing nodes in M.1/M.3/M.8 and CA.1. Preserve each supplier’s hypotheses and retained gaps. In particular M.3’s global theorem is number-field scoped, and the finite S-integer theorem is its own theorem, not inferred from an injective finite generic-point map. Preserve the Picard kernel and the residue sign ∂h=−κ∂ᵗᵃᵐᵉ.

CA.1’s `norm-residue-symbol-and-the-cohomological-symbol` records an existential scalar. The new T.7 normalization argument fixes it as −1 with the stated conventions; the common norm kernel alone cannot prove the scalar. This is noted for the maintainer without editing another job’s files.

The six planets in each layer replace the earlier planet sets as a whole. Keep the original relative Steinberg definition with the corrected comparison; do not add both old and new planets. No new layers or higher-tier suppliers are proposed.

The current read-only TauCetiRoadmap checkout was inspected at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including ClassFieldTheory and QuadraticFormInvariants and a search of the nine post-snapshot roadmaps. Current Tau Ceti was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing local-invariant and generic crossed-product implementations are imported; neither is claimed to be in the pinned baseline or replanned here. No command ran Lake in either read-only checkout.
