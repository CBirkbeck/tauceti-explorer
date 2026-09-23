# Breuil–Herzig–Hu–Morra–Schraen (2023): Gelfand–Kirillov dimension and mod p cohomology for GL₂, extraction and routing

Issue [#1241](https://github.com/CBirkbeck/tauceti-explorer/issues/1241). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. This is the third checkpoint:
  - cc-442dc5 wrote the first, with the main theorems and routes.
  - cc-d67081 wrote the second. It corrected the source label from v4 to v7 and added §§2.3–3.3.
  - Both earlier reports follow below as history.
- **The paper.** C. Breuil, F. Herzig, Y. Hu, S. Morra and B. Schraen, *Gelfand–Kirillov dimension and mod p cohomology for GL₂*, Invent. Math. 234 (2023), 1–128.
  - Read from arXiv v7 (SHA-256 8f06c68b…), which the authors mark as the final version. The Springer PDF returned HTML.
  - Numbering is v7's.
- **Items.** The result has **110 items: 0 library, 0 planned and 110 missing**. Every missing item is routed exactly once, and all 99 numbered statements of §§2–8 are items, together with the displayed definitions (45), (48) and (57).
- **Mistakes.** One is recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Sixty-eight new items for §§4–8.** Each uses v7 numbering and page.
- **§4 (9 items).** The unique Kisin module of Lemma 4.1.1, the bijection θ of Lemma 4.1.2, the presentations of Propositions 4.2.1 and 4.3.1, and Lemmas 4.2.3, 4.2.4 and 4.3.2, Corollary 4.2.6 and Proposition 4.3.3. The rings and ideals of Tables 1–5 are referenced but not transcribed.
- **§§5–7 (43 items).**
  - §5: Lazard theory and GK dimension.
  - §6: Iwahori and K-representations, D_{λ,ε}, the representations W and V_σ, and Iwahori multiplicity one.
  - §7: the Bockstein sequence, the lattice R and projectivity.
- **§8 (16 items).** Patching: Lemmas 8.1.2, 8.2.1, 8.2.2, 8.3.1, 8.3.2, 8.3.5, 8.3.6 and 8.3.8, Propositions 8.2.3, 8.2.6, 8.3.3 and 8.3.7, Corollaries 8.2.4 and 8.3.10, and Theorems 8.3.4, 8.3.11 and 8.4.3.

**Sharpened items.**
- `def-rings` now points to the §4 items.
- `patching` states the functor of §8.1 (62).
- `local-gk` states Theorem 6.4.7 exactly, and `gk-bound` states Corollary 5.3.5.
- `kisin-matrices` now has the display of Definition 3.1.1, transcribed from the page image.

**Finding E1 (misprint; affects nothing).** The introduction cites "Theorem 1.8 (Corollary 8.3.9)", but the body statement is Theorem 8.3.9, as the introduction itself later says. The `freeness` item's locator is corrected to match.

**Not done.**
- **Proofs.** The proofs of §§4–8 were read at statement level and skimmed, not audited line by line.
- **Library.** No library declaration was matched. The atlas has candidate layers, but none plans these statements exactly: completed group rings (PadicMeasuresIwasawaAlgebras:L1), dimension, depth and patching modules (DeformationAndDerivedPatchingAlgebra:R03.3, R03.5), and potentially semistable deformation spaces (LocalGaloisDeformationRings:R08.3).

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), arXiv:2009.03127v7 (final version), §1.3, Theorem 1.8, p. 5 (introduction), against Theorem 8.3.9, p. 101. *Printed:* Theorem 1.8 (Corollary 8.3.9). For j ∈ {−1, …, f − 1} the R∞-module M∞(L_j) is free of finite rank … *Correction:* Theorem 1.8 (Theorem 8.3.9).

The reasons and the places searched are in the JSON.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Breuil–Herzig–Hu–Morra–Schraen (2023): Gelfand–Kirillov dimension and mod p cohomology for GL₂, first extraction

Issue [#1241](https://github.com/CBirkbeck/tauceti-explorer/issues/1241). Status: **partial**. This is a first checkpoint, not a complete extraction; nothing is formalised.

- **Provenance.** Claude Code, session cc-442dc5, 23 September 2026.
- **The paper.** C. Breuil, F. Herzig, Y. Hu, S. Morra and B. Schraen, *Gelfand–Kirillov dimension and mod p cohomology for GL₂*, Invent. Math. 234 (2023), 1–128.
  - Read from arXiv v4 (112 pages, SHA-256 8f06c68b…), which the authors mark as the final version. The Springer PDF returned HTML here.
  - Numbering follows v4.

### What the paper proves

Let F be totally real with p > 2 unramified, and v an inert place with [F_v : Q_p] = f. Let r: G_F → GL₂(F) be modular and generic at v, with r|G_{F(ζ_p)} absolutely irreducible. The main theorem (Theorem 1.1 = Corollary 8.4.6) is that the r-part π of the mod p cohomology of Shimura curves at infinite level at v has Gelfand–Kirillov dimension f. The consequences are:
- Banach lifts of π (Corollary 8.4.4).
- Flatness of the dual of completed cohomology over a big Hecke algebra that is a complete intersection (Corollary 8.5.1).

The proof has three parts:
- **Local (§§5–7).** A criterion bounds the GK dimension by f (Corollary 5.3.5). It uses the explicit graded ring of the Iwasawa algebra of the pro-p Iwahori modulo the centre (§5.3). Multiplicity-one results for Iwahori and K₁-invariants (Proposition 6.4.6, Theorem 6.4.7) verify the criterion. Explicit lattices L_j in projective envelopes of Serre weights come from §7 (Corollary 7.3.4).
- **Galois (§§3–4).** Explicit tame potentially Barsotti–Tate deformation rings are computed for one and several tame types, through Kisin modules with descent data.
- **Global (§8).** Taylor–Wiles–Kisin patching makes M∞(L_j) free over its support (Corollary 8.3.9). This gives the K₁-structure of π (Theorem 8.4.2) and dim π = f (Theorem 8.4.1).

### Routes

- **ModpRepresentationsOfGL2OverLocalFields (new).**
  - This carries the local mod p representation theory of GL₂(K) for unramified K.
  - It reuses the id proposed by the Colmez–Dospinescu–Nizioł extraction, so the two papers feed one roadmap rather than duplicating it.
  - Imports: completed group algebras (PadicMeasuresIwasawaAlgebras) and smooth representations (SmoothRepresentationsOfLocalGroups).
- **Local Galois deformation rings and their components, Part II.** Tame potentially Barsotti–Tate deformation rings of generic representations.
- **Hilbert Modular Varieties And Shimura Curves, Part II.** Mod p cohomology at infinite level, patching and Gelfand–Kirillov dimension. Imports: DeformationAndDerivedPatchingAlgebra and GlobalGaloisDeformations.

### Items and status

- **Present.** Seventeen items, all missing: the ten introduction theorems with their body counterparts, and the key definitions and constructions (GK dimension, the graded Iwahori algebra, connectedness, genericity, Kisin modules with descent data, the patching functor).
- **Not yet items.** About ninety numbered lemmas, propositions and definitions in §§2–8; they are listed in the handoff.
- **Findings.** No `sourceIssues` are recorded yet, and the paper has not been read closely enough to assert that it has none.
- **Library evidence.** No Mathlib or Tau Ceti declarations have been checked, so every item is marked missing.

### Second checkpoint: the source version, and §§2.3–3.3

Claude Code, session `cc-d67081`, 23 September 2026. Continues the first extraction (`cc-442dc5`).
Base blobs: result `05852a05`, report `ed5cd5e3`, handoff `a9feab1d`.

#### The source is arXiv v7, not v4

The first extraction recorded the source as "arXiv v4 (final version, 112 pages)" with SHA-256
`8f06c68b…f99e7a` and the URL `https://arxiv.org/pdf/2009.03127v4`. The hash, the date and the page
count are those of **v7**; the URL serves a different document. Both were re-downloaded on
2026-09-23:

| version | date | pages | SHA-256 |
| --- | --- | --- | --- |
| v4 | 14 September 2021 | 107 | `98a9e688b7baa71350631656dd9eba3072e3ef1c68f17f56db5279dd1bfecc46` |
| v7 | 9 June 2023 | 112 | `8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a` |

The recorded hash matches v7 exactly, as do the "9 June 2023" date and the 112 pages, and v7 is the
one stamped "Final version, to appear in Inventiones Mathematicae". So the reading was of v7 and only
the label was wrong — but the label matters here, because v4 is a genuinely different 107-page
document whose numbering a reader following the recorded URL would get. The `source` block and all
seventeen inherited locators now say v7, and `source.version` records the discrepancy. Nothing else
about the inherited items changed.

#### Twenty-five items for §§2.3–3.3

The first item of the handoff's resume list is now done for §2 and §3. The new items are the
numbered statements of §§2.3–3.3, with exact statements rather than paraphrases:

- **§2.3, tame inertial types.** `tame-type-tau` (Definition 2.3.1, with (11) and (12)),
  `n-generic-type` (2.3.3), `n-generic-rhobar` (2.3.4), and `orientation`, which collects Remarks
  2.3.5–2.3.6 because §3 uses the orientation constantly and it is not a numbered statement.
- **§2.4, Serre weights.** `lambda-lattice` (the lattices Λ_W, Λ_R, Λ_W^μ, the map t_μ with (14) and
  the set Σ), `serre-weights-tame` (2.4.2: W(ρ̄) = {F(t_{μ−η}(sω)) : ω ∈ Σ}), `jh-factors-type`
  (2.4.3: the Jordan–Hölder factors of σ̄(τ)), `change-of-origin` (2.4.4) and `ext-adjacent-weights`
  (2.4.6: Ext¹ between Serre weights is F for adjacent weights and 0 otherwise).
- **§3.1, Kisin modules.** `kisin-matrices` (3.1.1), `kisin-shape` (3.1.4), `gauge-basis-exists`
  (3.1.5, with both conditions and the uniqueness group), `gauge-basis` (3.1.6),
  `monodromy-derivation` (3.1.7), `monodromy-condition` (3.1.8) and `monodromy-explicit` (3.1.9,
  with (16) and (17) and the N-generic leading-term form).
- **§3.2, tame representations.** `good-pair` (3.2.1), `good-deep` (3.2.3), `etale-module-w-D`
  (3.2.4), `tame-rep-w-D` (3.2.5), `unramified-twist-V` (3.2.6), `tame-classification` (3.2.7),
  `cyclotomic-free-hom` (3.2.8) and `isom-descent` (3.2.9).
- **§3.3.** `irreducibility-lemma` (3.3.1), the commutative-algebra lemma about x₁x₂ + ϖ^d f.

The displays of Definition 2.3.1, Propositions 2.4.2 and 2.4.3, Proposition 3.1.5 and Proposition
3.1.9 were checked on page images of pp. 14, 16, 19 and 21, because text extraction mangles this
paper's notation badly. One statement is deliberately incomplete: `kisin-matrices` describes the
renormalization of C_{M,β} into A_{M,β} without transcribing its display, and its note says so.

**Routing.** Twenty-two of the new items join the Local Galois deformation rings Part II route, whose
brief already names tame inertial types, genericity, Kisin modules with tame descent data, gauge
bases and the monodromy condition. Three — `lambda-lattice`, `change-of-origin` and
`ext-adjacent-weights` — join the new GL₂ roadmap instead, since they are statements about
GL₂(k)-representations and their extensions rather than about Galois representations. A reviewer may
prefer to move `serre-weights-tame` and `jh-factors-type` there too; they are kept with the types
because §4 uses them to compute the deformation rings. Nothing in the atlas plans this combinatorics:
`SerreWeightAndLevelOptimisation` R20.3 is the classical Edixhoven/Serre weight theorem for GL₂ over
**Q**, not the Buzzard–Diamond–Jarvis weight sets and alcove combinatorics for unramified K.

#### Boundaries of this checkpoint

§§4–8 were not read, and the inherited seventeen items were not re-verified against the source — only
their version label was corrected. No library declaration was checked, so every item is still
`missing`, and no `sourceIssues` are proposed: the sections read here are definitional and quote
their inputs, and nothing in them looked wrong. No Lean was written or compiled.
