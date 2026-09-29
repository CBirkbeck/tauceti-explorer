# Handoff: BP-AutomorphicGaloisRepresentations (second checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #685.

- Stages R19.1–R19.6, all partial. The checker reports no errors.
- RS-12 is still **needs_changes**, so the current structure is used.
- Checkpoint 1 was merged in #3857 (13 nodes). This checkpoint adds 5 nodes, for 18 nodes and 12 planets.

## New in this checkpoint

- `R19.6/hecke-algebra-representation-quaternionic` (planet): ρ_m: G_F → GL_2(T_ψ(U)_m) for a definite quaternion algebra over an even-degree totally real F (KW II §9.1).
  - Built from the eigenform representations over T_m ⊗ E and Carayol's descent.
  - Characterised by the Eichler–Shimura relation.
  - Its specialisations are the ρ_f, and the map R^ψ_S → T_m follows.
  - The level-11, p = 5 Eisenstein ideal is the non-example.
- `R19.4/quaternionic-sigma-place-local-form` (KW II Lemma 7.2): a fixed unramified γ_v with ρ_f|_{D_v} ≅ (χ_pγ_v ∗; 0 γ_v) for all eigenforms in the localisation, with γ_v² = ψ_v.
- `R19.5/hilbert-local-behaviour-at-p` (KW II Lemma 7.7 and Corollary 7.8, after Kisin and Saito):
  - crystalline of weight k when π_v is unramified, with the ordinary form;
  - potentially Barsotti–Tate at Γ_1(v) level;
  - Steinberg gives semistable, non-crystalline.
- `R19.2/wiles-ordinary-hilbert-representation` (planet): Wiles' representations of nearly ordinary Hilbert forms (Skinner–Wiles (3.2)).
- `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p`: Skinner–Wiles (3.3).

These answer GL2ModularityLifting R22.1's two requests (ρ_m with local conditions away from p and at p) and OrdinaryAutomorphicFormsAndModularityLifting's R19.2 and R19.4 requests. OAFML's Hida-family construction (3.4)–(3.5) stays their node `R21.3/hida-family-representation`.

## What remains

- **R19.1:** integral lattices of M_g (DFG §6.4); Deligne–Serre §8; Scholl's Kuga–Sato realisation (GH.0 request).
- **R19.2:** Carayol §§1–12 and the bad-reduction paper; Wiles 1988 [W2] (quoted through Skinner–Wiles).
- **R19.3:** Saito's proof of purity; the compatible-system carrier (R24.5).
- **R19.4:** Carayol's proof; the comparison of σ with Saito's σ̌_h.
- **R19.5:** the endpoint weight; Kisin's corollary (JAMS 2008), quoted through KW II.
- **R19.6:**
  - Carayol's descent (Contemp. Math. 165, not public), matched with Chenevier's Theorem B plus the IHG.1 residue-field descent;
  - Galois representations over Hecke algebras for the classical modular curve (F = Q), which the KW II §7 setting excludes because it needs [F : Q] even.

## Requests made in this checkpoint

GL2AutomorphicRepresentationsAndTransfer R17.3 (Jacquet–Langlands with local functoriality). The requests from checkpoint 1 are listed in the packet.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against the Mathlib 082e2d3 build, and `sorry` is its only warning.

Checkpoint 2 adds comments naming the objects the new theorem nodes need, and one acceptance example.

## Source issues

- E1: Deligne, Bourbaki 355, Proposition 3.15 (checkpoint 1).
- E2: KW II reference [53] gives math/0612077 as "Modular forms and p-adic Hodge theory". The preprint is "Hilbert modular forms and p-adic Hodge theory"; the given title is Saito's 1997 paper. It affects nothing.
- Note for PadicHodgeTheory/E50: the decomposition reviewer had already flagged its Weil–Deligne half, so its "known" field should say so.

## Sources

New in this checkpoint:

- Khare–Wintenberger II (authors' final version). Its SHA-256 matches the GL2ModularityLifting copy. The UCLA server's TLS chain is incomplete, so it was fetched without certificate verification and checked against that hash.
- Skinner–Wiles (Numdam), same file as OAFML's.
