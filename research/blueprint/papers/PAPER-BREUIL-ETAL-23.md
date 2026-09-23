# Breuil–Herzig–Hu–Morra–Schraen (2023): Gelfand–Kirillov dimension and mod p cohomology for GL₂, first extraction

Issue [#1241](https://github.com/CBirkbeck/tauceti-explorer/issues/1241). Status: **partial**. This is a first checkpoint, not a complete extraction; nothing is formalised.

- **Provenance.** Claude Code, session cc-442dc5, 23 September 2026.
- **The paper.** C. Breuil, F. Herzig, Y. Hu, S. Morra and B. Schraen, *Gelfand–Kirillov dimension and mod p cohomology for GL₂*, Invent. Math. 234 (2023), 1–128.
  - Read from arXiv v4 (112 pages, SHA-256 8f06c68b…), which the authors mark as the final version. The Springer PDF returned HTML here.
  - Numbering follows v4.

## What the paper proves

Let F be totally real with p > 2 unramified, and v an inert place with [F_v : Q_p] = f. Let r: G_F → GL₂(F) be modular and generic at v, with r|G_{F(ζ_p)} absolutely irreducible. The main theorem (Theorem 1.1 = Corollary 8.4.6) is that the r-part π of the mod p cohomology of Shimura curves at infinite level at v has Gelfand–Kirillov dimension f. The consequences are:
- Banach lifts of π (Corollary 8.4.4).
- Flatness of the dual of completed cohomology over a big Hecke algebra that is a complete intersection (Corollary 8.5.1).

The proof has three parts:
- **Local (§§5–7).** A criterion bounds the GK dimension by f (Corollary 5.3.5). It uses the explicit graded ring of the Iwasawa algebra of the pro-p Iwahori modulo the centre (§5.3). Multiplicity-one results for Iwahori and K₁-invariants (Proposition 6.4.6, Theorem 6.4.7) verify the criterion. Explicit lattices L_j in projective envelopes of Serre weights come from §7 (Corollary 7.3.4).
- **Galois (§§3–4).** Explicit tame potentially Barsotti–Tate deformation rings are computed for one and several tame types, through Kisin modules with descent data.
- **Global (§8).** Taylor–Wiles–Kisin patching makes M∞(L_j) free over its support (Corollary 8.3.9). This gives the K₁-structure of π (Theorem 8.4.2) and dim π = f (Theorem 8.4.1).

## Routes

- **ModpRepresentationsOfGL2OverLocalFields (new).**
  - This carries the local mod p representation theory of GL₂(K) for unramified K.
  - It reuses the id proposed by the Colmez–Dospinescu–Nizioł extraction, so the two papers feed one roadmap rather than duplicating it.
  - Imports: completed group algebras (PadicMeasuresIwasawaAlgebras) and smooth representations (SmoothRepresentationsOfLocalGroups).
- **Local Galois deformation rings and their components, Part II.** Tame potentially Barsotti–Tate deformation rings of generic representations.
- **Hilbert Modular Varieties And Shimura Curves, Part II.** Mod p cohomology at infinite level, patching and Gelfand–Kirillov dimension. Imports: DeformationAndDerivedPatchingAlgebra and GlobalGaloisDeformations.

## Items and status

- **Present.** Seventeen items, all missing: the ten introduction theorems with their body counterparts, and the key definitions and constructions (GK dimension, the graded Iwahori algebra, connectedness, genericity, Kisin modules with descent data, the patching functor).
- **Not yet items.** About ninety numbered lemmas, propositions and definitions in §§2–8; they are listed in the handoff.
- **Findings.** No `sourceIssues` are recorded yet, and the paper has not been read closely enough to assert that it has none.
- **Library evidence.** No Mathlib or Tau Ceti declarations have been checked, so every item is marked missing.
