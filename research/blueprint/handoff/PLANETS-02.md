# PLANETS-02 handoff

Status: complete naming proposal for issue #882; ready for intake and independent review.
Agent: Codex — codex-a71f92.

## Completed

Read all 293 input entries and their 113 layer descriptions across 10 roadmaps. Read the complete upstream Chebotarev and Exchangeability roadmap documents. Decisions: **20 keep, 222 name, 51 drop**. Every input ID appears exactly once. This proposal does not apply names or hiding settings to the atlas.

Names preserve the distinction between Dirichlet and natural density, restriction and residue-degree Frobenius powers, finite reciprocity and the absolute local Artin map, and the genus bound rather than genus detection. Carathéodory correspondence remains restricted to Jordan domains. DG and A∞ objects are separated, including the transferred A∞ structure in the minimal-model module equivalence and the Koszul double-dual map rather than an unrestricted equivalence. Graphon convergence modes, the number-field scope of global minimality, pointed twists, and almost-everywhere uniqueness of directing measures remain explicit. The Cassels label retains the ℚ restriction. The Annulus conjecture keeps its source name with null kind; no conjecture is promoted to a theorem.

Dropped workflow, tests, scope warnings, dependency inventories and minor proof steps. Existing curated planets were included when checking name uniqueness and the maximum of six per layer. Source passages and atlas data are unchanged.

## Five renamed entries

- Raising the base field → **Frobenius residue-degree power law**.
- Plumbing trees/graphs and their lattices → **Némethi's lattice (co)homology**.
- A∞ algebras → **A∞ morphisms**.
- Over an imperfect field, p-th powering is semilinear rather than a K-algebra map, so → **Relative Frobenius**.
- Level-one modular quotient, in construction order → **Biholomorphism X(1) ≃ P¹**.

## Five dropped entries

- constant graphon: Acceptance examples for the core graphon API, not a separate landmark.
- Nearly every later layer silently uses this lane — the dual isogeny base-changes to Kˢᵉᵖ: Motivation and downstream-use bookkeeping for the cross-cutting lane.
- External integration contract: An external ownership and integration contract, not a result owned by this layer.
- ⚠ Tail vs invariant σ-algebra: A scope warning distinguishing tail and invariant σ-algebras, not a separate result.
- Layer 1's manifold-with-boundary, tubular neighbourhoods, and boundary-gluing; layer 4's: Cross-layer prerequisite inventory for the Dehn-surgery construction.

## Checks

- Whole-file checkpoints at 50, 100, 150, 200 and 250 decisions, followed by the complete file; JSON parsing, exact unique input ID coverage and retained-label length checks passed.
- `python3 scripts/merge_landmark_names.py research/expansion/naming/PLANETS-02.result.json --strict`, without `--apply`: 222 accepted names, 20 kept, 51 procedural, **0 rejected, 0 undecided**.
- Additional read-only checks: all 293 unique IDs, allowed decisions/kinds, exact unchanged keep labels, one-line drop reasons, 3–48-character retained labels, forbidden characters/punctuation, imperative/bookkeeping vocabulary, layer-title distinction, and distinct labels within each layer.
- Maximum six retained planets per layer, including existing curated entries.
- Checked intervening main-branch changes through `20d1ccf0963e10489900bedc72800993a1b84090`; the naming inputs, stage descriptions and curated names relevant to this job are unchanged from the inspected snapshot.
- Lean compilation: not applicable; naming-only job, no Lean file or formalisation claim.

## Remaining work

None within this naming job. Independent review and atlas integration remain with the programme. Submit only the result JSON and this handoff.
