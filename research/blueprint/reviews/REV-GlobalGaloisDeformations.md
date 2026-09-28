# REV-GlobalGaloisDeformations: independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #420; claim comment 5878673415, confirmed by the bot). Date: 2026-09-28.

The blueprint under review, BP-GlobalGaloisDeformations, was written by another session, Claude Code cc-39fac3. It went in over seven checkpoints, PRs #3804–#3825, and covers stages R04.1–R04.6, G7 and G8.

**Verdict: accepted after corrections.** All 65 nodes were checked:

| Stage | Nodes |
| --- | --- |
| R04.1 | 11 |
| R04.2 | 9 |
| R04.3 | 8 |
| R04.4 | 12 |
| R04.5 | 8 |
| R04.6 | 6 |
| G7 | 7 |
| G8 | 4 |

- 8 nodes were corrected, 57 verified, and none added.
- One mathematical error was found. It was inherited from Gee's notes and is corrected in three R04.3 nodes (below). The source mistake is recorded as the new source issue E3.
- Source issues E1 and E2 are confirmed.
- One missing supplier, LocalGaloisDeformationRings L7, is added as a request.

## What was checked

- **Sources.**
  - All 8 sources were downloaded from the cited URLs, and every sha256 reproduces the packet's.
    - The sources are: Gee's modularity lifting notes, arXiv v2; Kisin's lecture notes; Chenevier; the KW II ESI preprint and the final version; BLGGT; ACC+ arXiv v2; and CHT08 (Numdam).
    - The UCLA host of KW II fails TLS verification here. It was fetched without verification, and the hash matches.
  - All 113 excerpts were compared with the extracted text word by word, in order, on the page where they occur.
    - 88 match at ≥ 0.9.
    - The other 25 were read against the page. All are faithful: the differences are pdftotext losses of □, hats, and sub- and superscripts.
  - The found pages agree with the locators. In the KW II ESI preprint the printed page is the PDF page − 1; in ACC+ they are equal.
  - One excerpt, ACC+ Proposition 6.2.24 in `G8/variable-determinant-presentation`, was cut off mid-formula and is now complete.
- **Baseline.**
  - All 16 declarations exist at the cited modules in the pinned declaration index.
  - Tau Ceti's `ContCohomology.Z1`, `B1` and `H1` were read at the pin (`RepresentationTheory/Homological/ContCohomology/LowDegree.lean`). Their continuous-cocycle convention, d¹f(g, h) = g·f(h) − f(gh) + f(g), is the one `R04.1/tangent-spaces` uses.
  - The Mathlib citations (GL_n, det, map, ProfiniteGrp, ContinuousMonoidHom, MvPowerSeries, FormallySmooth, IsAdicComplete, IsArtinianRing, IsLocalRing, IsPGroup, Module.Free, MonoidHom.ker) are the standard carriers and are used as stated.
- **Closure.** All 65 statements and proof sketches were read against their prerequisites. The following arguments were re-derived:
  - the numerical identities:
    - KW II's relative dimensions, 3|S|;
    - the patching count h + j − d = |Q| + |S| − 1;
    - the dyadic identity (h);
    - Gee's dim R_∞ = dim J_∞ = 4#T + r;
    - the CHT and ACC+ variable counts;
  - the Carayol induction;
  - the Schur centraliser induction;
  - the truncation valuation estimate;
  - the ℚ(i) counterexample to dyadic square roots;
  - the freeness argument for non-solvable image;
  - the determinant-torsor isomorphism (x, λ) ↦ (λ⁻¹x, λ);
  - the inertia-rigid dimension count;
  - the enormous-image claim for H ⊇ SL₂(𝔽_p), p ≥ 7.
- **Cross-roadmap references.** Every stage and node reference resolves in the atlas or in another packet on origin/main, and each supplier's text was read.
  - The Tau Ceti anchors resolve: Chebotarev Layer 10, ClassFieldTheory Layer 12 and ModularCurves 0C.
  - The claim that Grunwald–Wang lives in InverseGalois IG.4 is correct. Tau Ceti's ClassFieldTheory explicitly excludes it, and IG.4's packet lists it.
- **Library audit.** `data/library-coverage.json` records overlaps with ArithmeticGaloisDuality R02.3, R02.6 and D8, and with DeformationAndDerivedPatchingAlgebra R03.2. In each case the packet imports the owner's result, as RS-08 prescribes, and does not plan it again:
  - R02.3 finiteness, in `R04.2/phi-p-global`;
  - R02.6 inequalities and dual-Selmer inputs, in R04.3, R04.5 and G7;
  - D8/D7, in G7;
  - R03.2 representability and the relation-count algebra.
- **Checker.** `check_blueprint.py --index` against the pinned index reports 0 errors and 0 warnings.
  - This holds with the other packets taken from origin/main. The shared checkout on this machine is behind origin/main for LocalGaloisDeformationRings, so its working tree reports 7 unresolved `R08.x/…` node references. The unmodified packet reports the same 7 there.
  - The intake file checks report 0 problems.
- **Lean.**
  - The suggested file matches the packet, and every unproved declaration is marked honestly.
  - G7 and G8 had no Lean forms, so signature sketches for them (and for the corrected R04.3 count) are added in the file's comment block.
  - The file was not compiled: no build at the pinned commits exists on this machine.

## The main correction: the relative tangent dimension in R04.3

`R04.3/relative-tangent-space` stated Gee's formula (p. 18):

dim H¹_{S,T}(ad⁰ρ̄) = #T − Σ_{v|∞} h⁰(ad⁰) + Σ_{v∈S∖T}(dim L(D_v) − h⁰(ad⁰)) + h¹_{S,T}(ad⁰(1)) − h⁰(ad⁰(1)).

For T ≠ ∅ the constant must be #T − 1. The chain of reasoning:

1. Gee's complex has C⁰_{S,T} = C⁰(G, ad ρ̄), and its differential sends φ to (∂φ, (φ|_{G_v})_{v∈T}).
2. A scalar φ that restricts to 0 at a framed place is 0, so H⁰_{S,T} = 0 when T ≠ ∅.
3. Gee writes H⁰_{S,T} = 𝔽 (p. 17). With h¹ = χ + h⁰ + h² − h³ and χ_{S,T} = −1 + #T − …, that gives #T instead of #T − 1.

Three independent checks confirm the corrected value:

- Gee's own later counts use #T − 1. Proposition 5.10 gives #T − 1 − [F : ℚ] + r generators, and Proposition 3.24(3) follows exactly from #T − 1.
- ACC+ Proposition 6.2.24 and CHT08 Lemma 2.3.4 both have H⁰_{S,T} = 0 for T ≠ ∅.
- This packet was internally inconsistent:
  - `R04.5/taylor-wiles-generator-count` and `G8/variable-determinant-presentation` already used the correct value;
  - `R04.3/relative-tangent-space`, and the acceptance line of `R04.3/local-to-global-presentation`, used the printed one.

Corrected nodes:

- **`R04.3/relative-tangent-space`.**
  - The statement now reads "#T − 1 − …" for T ≠ ∅, with the T = ∅ case stated separately.
  - Hypotheses: p > 2, and S and T consist of finite places with T ⊇ {v | p}.
  - Proof steps 2–3 give the H⁰ computation and the Euler characteristic.
  - A new acceptance line checks the formula against Gee's Proposition 5.10.
- **`R04.3/local-to-global-presentation`.** The acceptance bound is now g − r(J) ≥ #T − 1 − ….
- **`R04.3/global-dimension-lower-bound`.**
  - Gee's conventions are added as a hypothesis: p > 2, S finite, T = S, and the infinite places entering only through Σ_{v|∞} h⁰.
  - Step 3 now carries out the count. It yields exactly the stated bound, which is Gee's Proposition 3.24(3), and that bound was already correct.

## Other corrections

- **`R04.3/global-framed-ring`, step 3.** The framing torsor is Γ̂_n(A)^T modulo the *diagonal scalars* 1 + 𝔪_A, the stabiliser of an absolutely irreducible lift. It has relative dimension n²#T − 1. The node had said "modulo the diagonal".
- **`R04.6/trace-subring-universal-representation`, step 1.** The step named the torsor group as (GL₂)₁ × ∏_v(GL₂)₁/Ĝ_m. KW II Proposition 4.1, the node's own statement and its count 4|S| − 1 all use (∏_{v∈S}(GL₂)₁)/Ĝ_m, which the step now uses.
- **`G8/variable-determinant-presentation`.** The ACC+ excerpt now includes the whole formula of Proposition 6.2.24 (pp. 144–145).
- **`R04.1/change-of-coefficients`.** A non-example used ℓ for the residue characteristic; it is now p.
- **`G7/polarized-presentation`.**
  - RS-08 names LocalGaloisDeformationRings L7 as G7's supplier of rank-n ordinary, height and Fontaine–Laffaille local conditions. CHT Corollary 2.3.6, in this node's acceptance, uses exactly those.
  - L7 is added as a prerequisite, as a hypothesis and as a request (need: the local problems with their L_v, dim L_v, liftability and Krull dimensions). It was the only RS-08 supplier the packet did not cite.

## Source issues

- **E1 (Kisin, Lecture 1, (1.2), p. 1): confirmed.**
  - The sentence says Hom(G, 𝔽_p), for G alone, where Φ_p quantifies over all finite-index subgroups.
  - The counterexample (∏_ℕ ℤ/p) ⋊ ℤ/2, with p odd, is right: the commutators a^{−2} generate ∏ ℤ/p.
- **E2 (KW II final version, §2.1, p. 6): confirmed.** "Surjectivity of Sp_C(A) → Sp_B(A)" should be injectivity. It is injectivity at 𝔽[ε] that makes the cotangent map surjective.
- **E3 (Gee, arXiv v2 §3.23, pp. 17–18): added and confirmed.** This is the H⁰_{S,T} error above.
  - The published version (*Essential Number Theory* 1 (2022)) has the same sentence and formula, and no errata page was found.
  - The kind is `error`, affecting the proof: the numbered results 3.24(3) and 5.10 are correct.
  - It is also logged in the maintainer's local list of published errata.

## Baseline citations removed or fixed

None; all 16 are confirmed.

## Nodes added

None. The missing supplier was added as a request, not a node.

## Questions for the orchestrator

1. **The shared checkout is stale for this check.** The checkout on this machine is behind origin/main (LocalGaloisDeformationRings), so `check_blueprint.py` run there reports unresolved cross-packet nodes. They resolve on main. Should reviewers be told to check against origin/main?
2. **Mixed conventions for S.** `R04.3/global-deformation-type` lets S contain the infinite places (KW II's convention), while the dimension formulas use Gee's convention, in which S is finite. The corrected nodes now state which convention each count uses. A later pass could make the two conventions explicit parameters of `DeformationType`.
