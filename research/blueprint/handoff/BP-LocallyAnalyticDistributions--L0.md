# BP-LocallyAnalyticDistributions--L0 — handoff

Job: blueprint follow-up for stage `LocallyAnalyticDistributions:L0` (Banach spaces of locally analytic functions),
issue #9290. Worker: Claude (Opus 5.5), session claude-6BAjPW, 2026-10-13.

## Deliverables

- `research/blueprint/packets/LocallyAnalyticDistributions--L0.json`: part `L0`, scope `LocallyAnalyticDistributions:L0`,
  status `complete`, 31 nodes (7 definitions, 8 constructions, 9 theorems, 4 lemmas, 3 comparisons), 152 API items,
  59 unit tests, 2 planets, 27 baseline declarations (Mathlib only), 1 gap, 0 requests, 3 source issues (E101–E103).
  `scripts/check_blueprint.py` with `TAUCETI_BASELINE` set to the pinned index: 0 errors, 0 warnings.
- `research/blueprint/readmes/LocallyAnalyticDistributions--L0.md`: the layer document, about 23,500 words. The
  introduction, targets table, conventions, dependencies, layer acceptance tests and source corrections are written by
  hand; each declaration's entry is rendered from the packet, so the two agree.
- `research/blueprint/suggested/LocallyAnalyticDistributions--L0.lean`: Mathlib-only, 540 lines. **It compiles:**
  `lean-check` in the shared build (Mathlib 082e2d3, Tau Ceti f790474) exits 0, and its only warnings are 24
  "declaration uses sorry". It has real-bodied light definitions (`IsOKSubmodule`, `IsNALocallyConvex`,
  `IsSphericallyComplete`, `IsDiscretelyValued`, `IsCompactoid`, `IsNACompactMap`, `restrictedBall`, `gaussNormBall`),
  the end theorems statable at the pins and examples; no data is defined by `sorry`. Its closing comment lists, by node,
  every other packet API and test name (README targets: their carriers are not at the pins).

## Coverage

L0 is `planned`. With the predecessor's eighteen L0 nodes (cited by id, not repeated), every target the stage states
is a node whose prerequisite chains end in Mathlib, in this roadmap's L0 nodes or in the one recorded gap. The packet's
`continuation` field maps each predecessor node to the new nodes that refine it, for the assembly; a simulated assembly
(adding those ids to the predecessor prerequisites) has no cycle. The one `remaining` item is the gap below.

## The three items the predecessor left open

1. *Native nonarchimedean locally convex stage/limit/strong-dual interface, compact-type reflexive duality, product
   completed inductive tensor theorem.* §0.A (`nonarchimedean-locally-convex-spaces`, `locally-convex-limits`,
   `bounded-sets-strong-dual`, `spherically-complete-fields`, `nonarchimedean-hahn-banach`), §0.B tensor nodes
   (`projective-tensor-product`, `inductive-tensor-product`, `c0-completed-tensor`), §0.C (`compactoid-compact-maps`,
   `compact-type-spaces` (planet), `nuclear-spaces`, `compact-type-nuclear-duality`, `compact-type-tensor-products`)
   and §0.D (`locally-analytic-product`, `locally-analytic-dual-nuclear`). Mathlib's `PolynormableSpace` admits
   non-ultrametric seminorms and is strictly weaker (test: ℓ¹ over ℚ_p); Mathlib's strong topology on `V →L[K] W`
   is the bounded-convergence one and is used as is. The completed inductive tensor theorem for compact type is
   Emerton Lemma 1.1.30 and Propositions 1.1.31–1.1.32 (ι = π for semi-complete LB-spaces), so no blanket LF claim
   and no extension of Kohlhaase's strict-LF statement is needed.
2. *Left-heart strict-sequence comparison and the CN three-space inputs.* `strict-morphisms-quasi-abelian`,
   `strict-derived-category-left-heart`, `left-heart-classical-extensions` (Schneiders §1.2; Mathlib's
   `Topology.IsStrictMap`, `HomotopyCategory`, localisation, `TStructure`); countable orthonormal bases
   (`banach-c0-models`, NFA 10.1/10.4), controlled quotient lifts (`banach-open-mapping-lifts`, Mathlib's
   `exists_preimage_norm_le`), split Banach extensions (`banach-complemented-subspaces`, NFA 10.5), separated
   Ext¹-vanishing (`finite-rank-strict-splitting`, CGN Lemma 2.5), nuclear Fréchet extension (`nuclear-three-space`).
   CN cite Dierolf–Roelcke Proposition 3.8 for the last; that paper is about real and complex spaces, so a lattice
   proof is given (E101). The compact-type extension theorem (CN A.4) is reduced in `compact-type-extension-duality`
   to two inputs CN use without proof (E102): these are the gap.
3. *Finite-manifold charts, multivariate substitution bounds, chart-realisation signatures.* §0.D:
   `restricted-power-series-ball` (on Mathlib's `MvPowerSeries.IsRestricted` and `gaussNorm`),
   `multivariate-substitution-bound`, `relatively-compact-restriction`, `analytic-manifold-atlases` (compared with
   Mathlib's `ChartedSpace`/`IsManifold` at ω), `chart-index-banach-stages`, `locally-analytic-function-space` (planet;
   atlas independence and the compact-type presentation), `locally-analytic-pullback`.

## Gap (what remains)

*Strict duality for extensions of spaces of compact type.* For a strict extension 0 → W1 → W → W2 → 0 of spaces of
compact type over a spherically complete K: (H1) strictness of the strong dual sequence and (H2) continuity of
W → (W′_b)′_b. With them `compact-type-extension-duality` proves CN Proposition A.4. Nothing in the roadmap, and no other
packet, consumes `L0/compact-type-three-space`, so the gap blocks no other target. A follow-up should look for a
published proof (Komatsu-type results on DFS spaces, Perez-Garcia–Schikhof, or a direct bounded-set lifting argument),
or restrict the theorem to cases that are proved (split extensions, finite-dimensional W1).

## Source issues (all new, all in Colmez–Nizioł Appendix A, scoped to the author PDF and arXiv:2108.12785v4)

- **E101** (gap, proof of Proposition A.4, p. 59): nuclearity of the dual middle term is justified by Dierolf–Roelcke
  Proposition 3.8 (real/complex scalars, proof by Pietsch summability). The nonarchimedean statement holds by the lattice
  proof of `nuclear-three-space`.
- **E102** (gap, same proof): the passage to stereotype duals asserts exactness in LH(C_K) (strictness), and the final
  five-lemma step needs W → W** continuous; neither is justified.
- **E103** (gap, Remark A.2, p. 58): splitting of Banach extensions over a spherically complete K is asserted without
  proof; Schneider NFA 10.5 proves it for discretely valued K or a quotient of countable type, which covers this roadmap.

None is in the errata register or in another packet's `sourceIssues`. The Duke version of record was not read.

## Requests, moves and tiers

No requests. One notion moves down: the nonarchimedean Hahn–Banach theorem (`L0/nonarchimedean-hahn-banach`) replaces
the predecessor's upward citation of PadicDifferentialEquationsAndRigidCohomology `RD.5/nonarchimedean-hahn-banach`
(listed in CaraianiNewton.md as this roadmap's one move-down). That roadmap's RD.5 can import this node. The packet's
`continuation.assemblyNote` asks the assembly to make the replacement in `L0/banach-splitting` and to restate the
splitting with NFA 10.5's hypotheses. Tau Ceti: TauCetiRoadmap GrothendieckEulerForms (Layer 0) plans Quillen exact
structures; `strict-morphisms-quasi-abelian` notes that strictly exact sequences give one and cites it (no prerequisite,
no re-planning). The current TauCetiRoadmap checkout and Tau Ceti library (a91d3aaf) were searched: neither has
nonarchimedean locally convex spaces, spherical completeness, compactoids, compact type, nuclearity or a nonarchimedean
Hahn–Banach theorem (Tau Ceti's Hahn–Banach uses are real/complex).

## Planets and structure

Planets added to L0: "Spaces of compact type", "Locally analytic functions on a manifold"; with the predecessor's four,
L0 has six. `restructure` proposes two atlas sub-layers (L0a nonarchimedean functional analysis; L0b locally analytic
functions and distributions) with node lists, and records that the pending shared Part II on quasi-abelian functional
analysis (BCGP25/CDN20 route) should import L0a rather than plan it again.

## Sources

Read (URLs, hashes and sections in the packet): Schneider, *Nonarchimedean Functional Analysis* (author notes; printed
page = PDF page − 9); Schneider–Teitelbaum arXiv:math/9912073v1 §§1–2; Colmez–Nizioł CN5.pdf Appendix A and
arXiv:2108.12785v4 Appendix A; Colmez–Gilles–Nizioł arXiv:2308.07712v2 §2.1; Colmez–Dospinescu–Nizioł
arXiv:1801.06686v2 §2.1; Schneiders, Mém. SMF 76 (Numdam) §§1.1–1.2; Emerton arXiv:math/0405137v1 §§1.1, 2.1; Colmez,
*Fonctions d'une variable p-adique* §§I.1, I.4; Dierolf–Roelcke, Collect. Math. 32 (1981), DML-E scan read as page
images (pp. 27–31). Cleared library: Schneider, *p-Adic Lie Groups* §§5–8, 10, 12 (cited by statement and page; no text
copied). Not read: the Duke version of CN; Perez-Garcia–Schikhof and Gruson–van der Put (not freely available).

## Checks run

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, only `sorry` warnings.
- A script confirmed that every packet API and test name occurs in the Lean file (as a declaration, a back-quoted
  docstring name, or the closing list) and in the reader.
- A simulated assembly (predecessor + this packet + `continuation` refinements) has no prerequisite cycle.
- An independent mechanical cross-check (a Sonnet subagent) of baseline statements, locators, numerical tests and names:
  it read all 27 baseline declarations, 78 source entries and the numbered statements in the proof steps, and recomputed about 40 numerical claims. It found 25 discrepancies, all checked against the sources and applied: five baseline `provides` sentences made precise (for example, Mathlib's `TStructure` needs a pretriangulated category); several locators (Schneiders Prop. 1.1.7 on p. 11, NFA Remark 19.1 on p. 128, Emerton citations moved to Definition 1.1.16 and Theorem 1.1.17, PLG Lemma 7.1, Proposition 8.7 and Corollary 8.8 described correctly); one false test clause ((1, 1, …) is in ℓ^∞); unit-test counts; API entries for the Lean helper theorems; the missing prerequisite `L0/frechet-three-space` of `nuclear-three-space`; and a circular citation in a proof step of `locally-analytic-function-space`. No numerical test was false apart from the ℓ^∞ clause.

## For the reviewer

Worker derivations that need the closest checks:
- the lattice proof of `nuclear-three-space`;
- the double-dual step (b) of `compact-type-extension-duality` (open mapping for LF-spaces, ST99 1.2(i));
- cofinality of product indices and the stage isometry in `locally-analytic-product`;
- compactoid ⇔ totally bounded over locally compact K (`compactoid-compact-maps`);
- the three source issues, especially E101 (the Dierolf–Roelcke scan, printed p. 30) and E103 (dense-value c₀ example).
