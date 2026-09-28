# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

This checkpoint plans R07.1 and leaves it partial. R07.2–R07.6 are not yet read.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, status `partial`:
  - 16 nodes: 3 definitions, 2 constructions, 5 lemmas and 6 theorems;
  - 24 API items, 23 unit tests, 6 planets;
  - 8 baseline declarations and 4 requests;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned declaration index, and the intake file checks report 0 problems.
- **Roadmap document** `research/blueprint/readmes/FiniteFlatGroupsAndIntegralPadicHodgeTheory.md`.
- **Suggested Lean file** `research/blueprint/suggested/FiniteFlatGroupsAndIntegralPadicHodgeTheory.lean`.

The plan follows the accepted restructuring RS-02. It makes this roadmap an extension of Tau Ceti's ModularCurves roadmap and narrows R07.1: ModularCurves 0B, 0C, 0E and 7E PD-2 (with PD-1, PD-4 and PD-5 for tests) are requested, never re-planned. 7E schedules no Oort–Tate classification, so that classification is planned here.

## R07.1 (partial)

p-divisible groups:

- **p-divisible-group:** arbitrary height, on Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat`. Tests: μ_{p^∞}, ℚ_p/ℤ_p, height 0, the constant non-example, E[p^∞], the ordinary nonsplit lift and the supersingular tower.
- **p-divisible-level-exactness:** the levels are the torsion, and multiplication by p is finite locally free and surjective.
- **p-divisible-cartier-dual:** duality and biduality, using Tau Ceti's Cartier duality and its base change.
- **p-divisible-tate-module:** T_p(G) is free of rank h, with a continuous Galois action and the pairing into ℤ_p(1).
- **p-divisible-connected-etale:** the tower-level sequence over a henselian base. It is not claimed to split over R: the Serre–Tate test shows it does not in general. Extensions of a connected group by an étale one do split (Stix Proposition 40(4)); this answers SmallRamification's request (d).

Closures and models:

- **schematic-closure-of-generic-subgroups:** over a Dedekind base, since Raynaud's argument needs only that torsion-free modules are flat.
- **simple-finite-flat-groups:** Deligne's theorem, and simple objects are killed by a prime with a simple generic Galois module. This answers SmallRamification's request (a).
- **finite-flat-prolongations:** the lattice of models, with the distinct-models tests μ_p ≠ ℤ/pℤ over ℤ_p[ζ_p] and over ℤ₂.
- **raynaud-uniqueness:** Theorem 3.3.3 and Corollary 3.3.6: uniqueness, full faithfulness, flat kernel and cokernel, and Ext injectivity. It requires e < p − 1.
- **raynaud-boundary-case:** Proposition 3.3.2 3°. At e = p − 1 there are at most two models, one étale and one multiplicative, which is the dyadic guard.

F-vector schemes:

- **f-vector-scheme:** Raynaud's condition (**) over his ring D.
- **raynaud-classification:** Theorem 1.4.1 and Corollaries 1.5.1–1.5.2 (0 ≤ n_i ≤ e).
- **raynaud-simple-objects:** Proposition 3.2.1 and Corollary 3.3.7.
- **raynaud-tame-inertia:** Theorems 3.4.1 and 3.4.3 and Corollary 3.4.4.

Groups of prime order:

- **oort-tate-classification:** Theorem 2, and Stix Theorem 60 for the local form and duality.
- **oort-tate-over-number-rings:** Oort–Tate Lemma 4 (gluing for order p), Theorem 3 (idele class characters with 0 ≤ n_𝔭 ≤ v_𝔭(p)) and the Artin–Mazur corollary over ℤ. This answers SmallRamification's request (b).

## Mathematical corrections made while planning

These are corrections to my own drafts, recorded so that a reviewer can check them:

- Over ℤ_p there are p − 1 étale and p − 1 multiplicative groups of order p, the unramified twists, because ℤ_p^×/(ℤ_p^×)^{p−1} ≅ 𝔽_p^×. Only over W(𝔽̄_p) do just ℤ/pℤ and μ_p remain.
- Raynaud's Corollary 1.5.2 needs a strictly henselian base that is a D-scheme. The r-tuple tests are therefore stated over W(𝔽̄_p), not ℤ_p.
- Over ℤ[1/2] at p = 3, Oort–Tate Theorem 3 gives exactly eight groups of order 3.

## Source notes

Excerpts were checked against the Numdam OCR text of Raynaud and Oort–Tate and the text layer of Stix's notes. Script letters (𝒢, 𝓛, …) are restored where the OCR garbles them. In Raynaud's Theorem 1.4.1 the maps are c_i : 𝓛_{i+1} → 𝓛_i^{⊗p} and d_i : 𝓛_i^{⊗p} → 𝓛_{i+1}, with d_i ∘ c_i = w·id, read from the OCR of display (22).

No mistakes were found in the published sources, so there are no sourceIssues.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## Sources

- Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. SMF 102 (1974). Numdam; journal page = PDF page + 239.
- Oort–Tate, *Group schemes of prime order*, Ann. Sci. ÉNS 3 (1970). Numdam.
- Stix, *A course on finite flat group schemes and p-divisible groups* (2012), author-hosted notes.

Also consulted but not cited: Pink's ETH notes on finite group schemes, Conrad's 1999 finite flat notes, Buzzard's notes, and Yoshida (arXiv:0905.1171). Yoshida characterises Fontaine's bound through Fontaine's property (P_m), which matters for R07.6.

## What a continuation could do

- **Finish R07.1:**
  - Tate's generic-fibre theorem for p-divisible groups and Raynaud's Proposition 2.3.1;
  - SmallRamification's requests (c)/(g), the general gluing equivalence and Hom–Ext¹ sequence over ℤ[1/N] (Schoof 2003, Proposition 2.4). This checkpoint has only the order-p case;
  - SmallRamification's request (e), étale groups as π₁-modules;
  - SmallRamification's request (f), the Katz–Mazur groups G_ε and the twisted constant schemes V(ρ);
  - from the Faltings roadmap, the dimension of the connected part and the finite part of a quasi-finite separated flat group over a henselian valuation ring.
- **R07.2–R07.6:** RS-02 fixes their scope. R07.2 owns the Dieudonné crystal and the consolidated Grothendieck–Messing theorem, and R07.6 imports it. R07.6 must plan Fontaine's ramification bound. Fontaine's 1985 paper is behind a login; Yoshida reduces the bound to Fontaine's property (P_m), but a public proof of the (P_m) step for finite flat group schemes has not been found yet.
