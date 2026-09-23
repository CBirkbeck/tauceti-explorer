# Cai–Friedberg–Kaplan (2024): doubling constructions and global functoriality, extraction and routing

Issue [#1085](https://github.com/CBirkbeck/tauceti-explorer/issues/1085). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the same session's first partial checkpoint, whose report follows below as history.
- **The paper.** Y. Cai, S. Friedberg and E. Kaplan, *Doubling constructions: Global functoriality for non-generic cuspidal representations*, with an appendix by E. Kaplan, Ann. of Math. 200 (2024), 893–966.
  - Read in full from arXiv v5 (SHA-256 dd49d944…). The arXiv comment marks v5 as the version to be published in the Annals.
  - Crossref lists no correction.
- **Items.** The result has **46 items: 0 library, 2 planned and 44 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** One is recorded under `sourceIssues`.

## What the paper proves

Let G be a split symplectic, special orthogonal or general spin group over a number field. The main theorem (Theorem 0.1) is that every irreducible cuspidal automorphic representation of G(A) has a weak functorial transfer to GL_N(A). Genericity is not assumed, and the proof is independent of the trace formula.

The proof runs through the Converse Theorem (Theorem 2.1, [CKPSS01]):
- **Local (§3).** The doubling γ-, L- and ε-factors come from [CFK22] (Theorems 3.5–3.10). The main local result, Theorem 3.12, says the poles of L(s, π × τ) in Re(s) ≥ 1/2 are attained by doubling integrals. It is proved by reducing the doubling integral to the GL_c × GL_k integrals of Kaplan's appendix (Theorem A.11).
- **Global (§4).** The doubling Eisenstein series is holomorphic in Re(s) ≥ 0 away from twisted self-duality (Theorem 4.1). Its proof uses only Mœglin–Waldspurger and a square-integrability argument, not Arthur's classification. It follows that the twisted L-functions are entire (Theorem 4.8).
- **Conclusion.** The Converse Theorem then gives the transfer (§4.4). Two consequences follow: weak transfers are coarse transfers at every place (Theorem 4.10), and local coarse transfers exist (Corollary 4.11).

## This continuation (cc-442dc5)

**Correction to the first checkpoint.** It described G as "symplectic or quasi-split orthogonal", following the introduction's account of Arthur's setting. The theorem is for **split** Sp, SO and GSpin groups (§1).

**Items.**
- Every numbered statement is now an item: 34 theorems, lemmas, propositions, corollaries and definitions, together with the constructions they use.
- Two foundational inputs are marked planned: the Rankin–Selberg factors (AutomorphicLFunctionsAndLocalFactors:AL.3) and the Satake parametrization (SmoothRepresentationsOfLocalGroups:SR.4).

**Finding E1 (gap; affects the proof).**
- **The mismatch.** Propositions 3.17 and 3.19 and Corollary 3.21 allow any π ∈ Irr_rel(G). Their proofs apply Lemma 3.16 and Theorem A.11 to χ_π τ, and those results are stated for unitary representations.
- **When it matters.** For GSpin_c, χ_π need not be unitary.
- **The repair.** Twisting by |·|^r reduces to a unitary χ_π.
- **Main results.** Unaffected: the only use, Theorem 3.12, assumes χ_π unitary.

**Route.** All missing items form one Part II, "Automorphic L-functions and local factors, Part II: the generalized doubling method and functorial transfer for classical groups". It imports AL.3, SR.4 and the parabolic-induction layers.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- The whole paper, proofs included, was read.

## Mistakes found (`sourceIssues`)

- **E1** (gap; affects the proof), arXiv:1802.02637v5, Propositions 3.17 and 3.19 and Corollary 3.21 (§3.6), pp.24–31. *Printed:* Proposition 3.17: 'Let σ ∈ Irr(GL_l), τ ∈ Irr_gen,u(GL_k) …'; Proposition 3.19 and Corollary 3.21: 'Suppose that π ∈ Irr_rel(G) and τ ∈ Irr_gen,u(GL_k)'. The proof of Proposition 3.17 applies Lemma 3.16 'for the (k, c) model χ_π W_ψ(ρ_c(τ)) = W_ψ(ρ_c(χ_π τ))' and Theorems A.6 and A.11 to χ_π τ. *Correction:* Either assume χ_π unitary (π ∈ Irr_rel,a.u.(G), as in Theorem 3.12), or reduce to that case: write χ_π = |·|^r χ_0 with r real and χ_0 unitary. Then W_ψ(ρ_c(χ_π τ)) = |det|^r W_ψ(ρ_c(χ_0 τ)), the factor |det a|^r pulls out of Z^2 because r_z is unipotent, and L(s, σ^∨ × χ_π τ) = L(s + r, σ^∨ × χ_0 τ).

The reasons and the places searched are in the JSON.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Cai–Friedberg–Kaplan (2024): doubling constructions and global functoriality, first extraction

Issue [#1085](https://github.com/CBirkbeck/tauceti-explorer/issues/1085). Status: **partial**. Nothing is formalised.

- **Provenance.** Claude Code, session cc-442dc5, 23 September 2026.
- **The paper.** Y. Cai, S. Friedberg and E. Kaplan, *Doubling constructions: Global functoriality for non-generic cuspidal representations*, Ann. of Math. 200 (2024), no. 3.
  - Read from arXiv v5 (60 pages, SHA-256 dd49d944…). The Annals text was not fetched.

### What the paper proves

Every irreducible cuspidal automorphic representation of a symplectic or quasi-split orthogonal group G over a number field has a weak functorial transfer to GL_N (Theorem 0.1). Genericity is not assumed.

The proof applies the converse theorem of Cogdell–Kim–Piatetski-Shapiro–Shahidi (Theorem 2.1). The twisted L-functions it needs are controlled by the generalized doubling method:
- Local γ-factors: their characterization, unramified compatibility, holomorphy and stability (Theorems 3.5–3.10).
- The doubling Eisenstein series (Theorem 4.1).
- The functional equation and entireness (Theorems 4.6–4.8).

As consequences, the transfer is a coarse transfer at every place (Theorem 4.10), and local coarse transfers exist (Corollary 4.11).

### Routes

All thirteen items are missing. They form one Part II of AutomorphicLFunctionsAndLocalFactors: the generalized doubling method and functorial transfer for classical groups.

### Status

- **Not yet items.** The remaining lemmas, propositions and corollaries of §3 and §4 (listed in the handoff).
- **Findings.** No `sourceIssues` are asserted, because the proofs have not been read.
- **Library evidence.** Not checked.
