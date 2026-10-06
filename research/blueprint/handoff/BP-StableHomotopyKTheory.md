# Handoff: BP-StableHomotopyKTheory

Issue #999. Worker **Claude — claude-mib2G7**, 6 October 2026. Branch
`claude-mib2G7-BP-StableHomotopyKTheory`. One job; no second claim.

## Status and counts

The packet is **complete** at lemma-level granularity: every stage in scope is
`planned` and none is `closed` (each keeps recorded gaps). Every
`implementationStatus` is `unchecked`.

| Stage | Status | Nodes |
| --- | --- | --- |
| StableHomotopyKTheory:H.1 | planned | 25 |
| StableHomotopyKTheory:H.2 | planned | 32 |
| StableHomotopyKTheory:H.3 | planned | 29 |
| StableHomotopyKTheory:H.4 | planned | 26 |
| StableHomotopyKTheory:H.5 | planned | 0 (parent of the two sub-layers) |
| StableHomotopyKTheory:H.5:spectra | planned | 31 |
| StableHomotopyKTheory:H.5:S-delooping | planned | 3 |
| StableHomotopyKTheory:H.6 | planned | 24 |

**170 nodes**: 24 definitions, 34 constructions, 48 lemmas, 59 theorems,
3 comparisons, 2 applications. 305 API items, 236 unit tests, 36 planets (at
most six per layer), 49 checked baseline declarations, **24 gaps,
16 requests, 7 source issues**, 2 restructure proposals and 3 upstream notes.
The budget was about 300 nodes. The issue says to stop refining once every
stage is planned, so refinement stopped there. The `remaining` lists name what a
follow-up would refine.

## Mathematical choices

- **Binding scope.** RS-33 (accepted) governs the title and the narrowings of
  H.1–H.4, H.5:spectra, H.5:S-delooping and H.6. H.1–H.3 cite rather than
  re-plan what Mathlib and Tau Ceti already have: the nerve, realisation,
  `HomotopyGroup`, `HSpace`, `TauCeti.LocalCoefficientSystem`,
  `TauCeti.IsEilenbergMacLaneSpaceOne` and group homology. They request Tau
  Ceti AlgebraicTopology stages 1–6 and 8 and UniversalCovers stages 2 and 4.
  The H.2 request includes the Kan versus topological homotopy-group comparison
  (AT stage 8). The H.3 request includes Hurewicz (AT stage 8) and the Serre
  spectral sequence (AT stage 5).
- **Spectrum model.** H.5:spectra uses symmetric spectra of simplicial sets
  (Schwede v3.0; Hovey–Shipley–Smith). It covers naive and true homotopy
  groups, semistability, and the stable homotopy category as the localisation
  at stable equivalences (pretriangulated and triangulated, checked against
  EnhancedDerivedSheaves:E0). It also covers the derived smash product, ring
  spectra and operadic algebras, Eilenberg–Mac Lane spectra of groups and of
  chain complexes, `HR` as a ring, `[Σ^∞_+X, Σ^nHA] ≅ H^n(X; A)`, and Postnikov
  sections with connective covers.
- **H.5** is a parent star with no nodes of its own (restructure proposal 2).
- **H.5:S-delooping** only assembles the K-theory symmetric spectrum and its
  functoriality from GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum
  (requested). It has no pairing clause (RT-AREA-ktheory-1/4).

## Red-team findings

- **1/4**: H.5:S-delooping keeps the assembly only
  (`H.5:S-delooping/k-theory-symmetric-spectrum`,
  `/iterated-S-construction-omega-spectrum`,
  `/k-theory-spectrum-functoriality`). Additivity, the relative S.-fibration and
  the deloopings are requested from K.4:construction, and K.7 owns the
  pairing. The GeneralAlgebraicKTheory text change is outside this job's files.
  It is stated in the request.
- **1/5**: H.3 owns the H-space and obstruction-theory material:
  - (i) `H.3/hspace-is-abelian`.
  - (ii) `H.3/abelian-space`, `/eilenberg-maclane-space`,
    `/cohomology-representability`, `/postnikov-principal-fibrations`
    (Hatcher 4.69), `/obstruction-lifting` (4.72), `/abelian-extension-corollary`
    (4.73) and `/abelian-homology-whitehead` (4.74).
  - (iii) `/hspace-homology-whitehead` (Weibel IV Ex. 1.3),
    `/plus-construction-universal-property` (Thm 1.5(2); abelian targets proved,
    general targets a gap) and `/plus-hspace-recognition` (Thm 1.8,
    Rem. 1.8.1).
  - (iv) `/rational-hurewicz-hspace`. Its Milnor–Moore primitives step is a gap.

  The edges H.3 → H.4 and H.3 → BorelRegulators:R.3 are in restructure
  proposal 1. The clause "π₁ acts trivially on the homotopy fibre of an H-map"
  has no node of its own. The chosen route through Hatcher 4.74 gets the trivial
  action on `π_n(Y, X)` from the obstruction-theoretic retraction and needs no
  H-map hypothesis. A consumer that needs the fibre statement should request it.
- **1/15**: `H.2/levelwise-fibration-realisation` states the theorem with
  degreewise homotopy fibre sequences, connected bases (or the
  Bousfield–Friedlander conditions) and good/proper simplicial spaces. Its proof
  sources are a gap. The edge H.2 → K.4:construction is in proposal 1.
- **1/16**: covered by `H.5:spectra/eilenberg-maclane-of-chain-complex`,
  `/eilenberg-maclane-ring`, `/eilenberg-maclane-cohomology` and
  `/postnikov-sections` (test `connectiveCover_KU_ku`).
- **1/22**: `H.1/nerve-and-classifying-space` cites `CategoryTheory.nerve`,
  `nerveMap`, `nerveFunctor` and `SSet.toTop`. The local-coefficient nodes cite
  `TauCeti.LocalCoefficientSystem`. The Serre gap is restated as "Serre spectral
  sequence with twisted total-space coefficients": AT5 supplies constant
  coefficients, and the node routes both directions through the universal
  cover.
- **1/23**: H.6 owns `H.6/exact-couple`, `/filtered-spectrum-spectral-sequence`
  and the two convergence nodes. The edge H.6 → SchemeKTheoryOperations:S.4 is
  in proposal 1. Upstream note 1 asks AT stage 4 to instantiate the generic
  exact couple.
- **1/30**: `H.3/plus-pi2-universal-central-extension` cites
  `K2SymbolsBrauer:T.1/recognition-theorem` and `T.1:classical/uce-kernel-h2`
  (requested). The edge T.1:classical → H.3 is in proposal 1.
- **2/29**: `H.6/burklund-moore-multiplicative` states Burklund's
  Theorems 1.1–1.5. The proof is a gap. The edge H.6 → RefinedTraceMethods:RT.5
  is in proposal 1.

## Integrated decomposition ids

All 25 node ids of `data/decompositions/StableHomotopyKTheory.json` are kept.
Bundled statements were split, and these keep only part of their old content:

- `H.1/natural-transformations-adjoints-contractibility` is now the
  natural-transformation homotopy only. Adjunctions moved to
  `H.1/adjunction-homotopy-equivalence`, and initial/terminal objects to
  `H.1/contractible-of-initial-or-terminal`.
- `H.1/filtered-colimits-of-categories` is split, with
  `/filtered-colimit-homotopy-equivalence`, `/filtered-category-contractible`
  and `/filtered-colimit-homology`.
- `H.1/coverings-fundamental-group-local-coefficients` is split, with
  `/fundamental-groupoid-localization`, `/maximal-tree-presentation` and
  `/local-systems-as-functors`.
- `H.3/acyclic-spaces-and-maps` is now acyclic spaces only. The rest is in
  `H.3/acyclic-map` and `H.3/plus-construction-predicate`.
- `H.4/cofinality-projective-modules` is now Weibel IV Cor. 4.11.1. The theorem
  is `H.4/cofinality-theorem`.
- `H.5:spectra/omega-spectra-and-eilenberg-maclane` is now Ω-spectra and
  connectivity. EM spectra are `H.5:spectra/eilenberg-maclane-spectrum`.

Consumers citing an old id for the moved part should switch to the new id.

## Sources

Read in this run, at the locators the packet records:

- Weibel K-book IV §§1–4, §7 and §8, with V.1.7;
- Hatcher AT §§4.1–4.3 and 4.A as cited;
- Hatcher SSAT ch. 1 (Serre classes, Theorem 1.24);
- Schwede *Symmetric spectra* v3.0, ch. I–II as cited and ch. III statements;
- Hovey–Shipley–Smith (statements);
- Nikolaus–Scholze Lemma B.7 and Appendix C;
- Bhatt–Scholze Appendix §12;
- Calmès et al. Corollary 2.3.19–Remark 2.3.20 and §3.2;
- Burklund (Theorems 1.1–1.5), Lurie HA §1.2.2, Kahn §1.4 and Shipley §§1–2.

URLs, SHA-256s and the exact read sections are in the packet. Quillen 1973 and
Carlsson's Handbook chapter keep the locators verified by the decomposition's
review and were not re-fetched.

Not read (recorded as gaps where nodes depend on them): Boardman
(conditional convergence), Dold–Lashof, Segal 1974, Bousfield–Friedlander,
Waldhausen 1978, Berrick, CCMT, Thomason 1979, Patel, Milnor–Moore,
Araki–Toda, Reedy/Hirschhorn, Bass p. 355 and Schlichting §10. A file fetched
as "Waldhausen" turned out to be his 1967 paper on 3-manifolds and was not
used.

**Maintainer-added sources:**

- **Calmès et al.**
  - items 420–423 → `H.4/hermitian-group-completion-integers`;
  - 436 → `H.4/simplicial-ring-topological-realisation`;
  - 342 (Remark 2.3.20) → `H.3/serre-class-theorem` and
    `H.4/cofinal-sequence-plus-comparison`.

  Item 342's Charney stability and arithmetic-group finiteness steps are not in
  these stages; they stay with the finite-generation consumer.
- **Bhatt–Scholze**
  - H.1: `H.1/groupoid-nerve-one-type`;
  - H.4: `/symmetric-monoidal-groupoid-core`, `/gamma-space`,
    `/coherent-subset-construction`, `/segal-delooping-theorem`,
    `/group-completion-adjunction` and `/picard-groupoid-grouplike`;
  - H.5:spectra: `/connective-spectra-via-deloopings`,
    `/grouplike-einfty-connective-spectra` and `/picard-one-truncated-spectra`.
- **Nikolaus–Scholze**
  - 157–160 → `H.2/realisation-preserves-finite-limits`, `/gluing-lemma`,
    `/levelwise-equivalence-theorem` and `/bousfield-kan-homotopy-colimit`;
  - 153 (Lemma B.7) → `H.2/realisation-is-homotopy-colimit`, added in this
    run. Its Reedy-model-structure input is a gap.

**Source issues** (seven):

- E1: a Bhatt–Scholze p. 55 misprint ("n − 1 morphisms"). New.
- E2: Weibel IV 2.9 gives `K₁(ℂ; ℤ_ℓ)` as `ℤ_ℓ`; it is 0. New.
- E3: the Nikolaus–Scholze C.4 index. Already known as E18 of the extraction.
- E4: Weibel V.1.7 proof, B and C exchanged in the levelwise fibrations.
  Already known as GeneralAlgebraicKTheory/E-relative-S-proof-roles.
- E5: Weibel IV p. 18 (and the proof of 2.7), `H̃_m(P^m(ℤ/ℓ))` for
  `H̃_{m−1}`. New.
- E6: Weibel IV Exercise 1.1, "the canonical map S³ → X⁺" for the Poincaré
  sphere. It has degree 120 on H₃; only some homotopy equivalence S³ ≃ X⁺
  exists. New.
- E7: Weibel IV Proposition 2.7, `q₁` for `q₂`. Already known as
  K3BlochGroups/E-V4-5.

E5 and E6 affect stated results, and the packet uses the corrected forms.

## Checks

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- A name check: every API item and unit test of the packet appears in the
  suggested file under its packet name. Every node id appears in a docstring
  or signature comment.
- Banned words: none of "optional", "deferred", "later" or `sorry` in the
  packet or document.
- **The suggested file compiled with `lean-check`** (exit 0). The only warnings
  are `declaration uses 'sorry'`. That is Mathlib 082e2d37e8 in the shared
  build; `free -g` showed 99 GB available. The shared
  build compiles only the adic-space part of Tau Ceti, so the file imports
  Mathlib only. The four Tau Ceti declarations it needs appear in a `Stub`
  section as stand-ins of the same shape, to be replaced by the Tau Ceti
  imports. No Tau Ceti elaboration is claimed.
- 113 statements that need infrastructure absent at both pins are
  signature comments with the reason, not placeholder propositions. Examples
  are functoriality of `π_n` on based maps, smash products of maps,
  `lim¹` and spectra-level homotopy colimits.
- Before submission, two read-only review passes were made: Lean signatures
  against the packet, and the packet's mathematics against the sources. Every
  finding was checked against the sources and then fixed. The PR description
  lists the fixes. They include:
  - the sign in `(f ∧ f′)_*(y·y′)` (Schwede II (4.12): `(−1)^{m′n}`);
  - the V.1.7 levelwise fibre sequence;
  - S/3 not being homotopy associative;
  - the ℚ_p/ℤ_p colimit maps;
  - the Moore-space homology degree;
  - several counterexamples and tests (proper simplicial spaces, the degree-0
    connecting map, `B(C^op)` for groups, filtered-spectrum completeness);
  - in Lean: the empty-space case of weak equivalences, missing hypotheses
    (contractible-base fibres, levelwise fibration basepoints, CW, `NeZero`),
    the shift sign of `H(C⟦1⟧) ≃ ΣHC`, morphisms of symmetric spectra
    (equivariance and compatibility with σ), ring-spectrum laws, the E∞
    freeness condition, the π₀ conditions of group completions, ℤ × ℤ-indexed
    spectral sequences, and additive equivalences in place of bare ones.

No language server, project build, dependency update or cache download was
started.

## What a follow-up does

1. **Close gaps**, starting with the most-used:
   - the levelwise fibration lemma (Bousfield–Friedlander App. B or
     Goerss–Jardine IV.4);
   - the Reedy structure and Hirschhorn 18.7.4;
   - the gluing lemma (Boardman–Vogt 4.8);
   - the Kan–Quillen model structure;
   - Moore's theorem for simplicial abelian groups (also upstream note 3);
   - the plus-construction universal property for non-abelian targets
     (Berrick §5);
   - Milnor–Moore primitives.

   Each gap records its next action.
2. **Unplanned consumer requests**, recorded in `remaining`:
   - Kahn's cellular-functor results (ArithmeticKTheory:N.3) stay with that
     consumer;
   - the Eilenberg–Moore spectral sequence (KTheoryFiniteLocalFields:L.1) is not
     in H.6's stage text;
   - cosimplicial homotopy limits with the Bousfield–Kan spectral sequence and
     Thomason's convergence criteria (SchemeKTheoryOperations:S.4), and
     presheaves of spectra, need a stage decision. Either H.5:spectra or H.6
     takes them by RS, or S.4 plans them.
3. **Supplier contracts.** When the suppliers answer the 16 requests, replace the
   requested-stage prerequisites by their node ids. Re-run the name check and
   `lean-check` after replacing `Stub` by Tau Ceti imports in a build with Tau
   Ceti at the pin.
