# Handoff: REV-AutomorphicGaloisRepresentations~2

Agent: Claude (Claude Code), session `claude-5vBTNi`, issue #7029, 8 October 2026. This is the complete review of revision round 2, not a checkpoint. Verdict: **accepted** at target level. The report is `research/blueprint/reviews/REV-AutomorphicGaloisRepresentations~2.md`.

## State of the files

- Packet: 66 nodes (21 verified, 45 corrected, none added), 90 API items, 66 tests, 27 planets, 13 baseline declarations (all confirmed), 26 sources, 51 requests, 12 gaps, 6 source issues (E1–E4 confirmed, E5 and E6 new). The review object names this job; the earlier review is under `reviewHistory`.
- Reader and suggested file agree with the packet field by field. The suggested file elaborates at the pinned Mathlib, with placeholder warnings only.
- `check_blueprint.py` reports no error and no warning.

## What a later round should know

- **Conventions.** ρ_{π,λ} has geometric Frobenius polynomial X² − t_vX + q_vs_v. Carayol and Saito: ρ ⊗ χ^{−1}. Skinner–Wiles: σ_λ(π)^∨ = ρ ⊗ ε_ℓ (arithmetic class field theory, their §2.1). Khare–Wintenberger and Colmez–Dospinescu–Nizioł: ρ^∨. Diamond–Flach–Guo's M_g is the conjugate form's realisation; the roadmap's M_g is its twist by M_{ψ^{−1}}.
- **Carayol's Theorem (A)** depends on the irreducibility node; the global object and the dictionary depend on Theorem (B) only. Do not restore the dependency on Theorem (A), which would close a loop.
- **Picard–Lefschetz at special places.** The statement requested from LPV.7 is that the monodromy logarithm maps onto the kernel of pull-back from H¹ of the special fibre to H¹ of its normalisation (Carayol 11.4). The earlier text had this kernel the wrong way round.
- **Scholl projector node.** Do not give it R34.5 as a prerequisite: `R34.5/kuga-sato-projector-weight-comparison` depends on it.
- **Hecke characters.** Their λ-adic characters come from `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, the converse for Hodge–Tate characters from `PotentialModularityAndCompatibleSystems:R24.5/character-system`. R01.1 is no longer asked for either; its request keeps stable lattices, Brauer–Nesbitt, Čebotarev uniqueness, Dirichlet characters and the cyclotomic character.
- **Source issue E6** (Khare–Wintenberger II, Lemma 7.2): the case N(v) ≡ −1 mod p with split unramified residual restriction is excluded by hypothesis and recorded as a gap. Whether both signs occur in one localisation is open.

## Left open, by design

- Six stage-level links are skipped by the atlas build (GH.0 → R19.1, R20.2 → R19.3, R20.6 → R19.5, R20.6 → R19.6, R21.3 → R19.2, R21.3 → R19.5). The restructure entry proposing a sub-layer R19.3b addresses only the loops inside the roadmap.
- Not read, and recorded as gaps or requests: Taylor 1989 and 1995, Saito 1997, Kisin 2003, Wintenberger, Blasius–Rogawski, Wiles 1988, Carayol §§7–9, the published text of Khare–Wintenberger II.
- Other queue jobs (fixes and fix reviews for the red-team areas langlands-2 and padic-2) list this packet among their outputs and may need merging with this version.
