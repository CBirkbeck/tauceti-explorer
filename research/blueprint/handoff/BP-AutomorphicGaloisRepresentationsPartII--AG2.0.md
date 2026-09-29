# Handoff: BP-AutomorphicGaloisRepresentationsPartII--AG2.0 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #686.

- The packet is partial, with 15 nodes and 9 planets. The checker reports no errors and no warnings.
- RS-12 is still **needs_changes**, so the current structure is used.
- Scope: AG2.0–AG2.5. AG2.6–AG2.7 are the second part (#687).

## What this checkpoint closes: AG2.0 at declaration level

Sources read for AG2.0:
- **BLGGT**, arXiv:1010.2561v4 (SHA-256 c953df62…): §2.1 and Appendix A.2. R. Taylor's copy pa3.pdf has the same §2.1.
- **ACC+** (Annals 197): §§1, 2.2.5, 2.3 and 7.1, and Corollary 7.2.4. Printed page = PDF page + 896.
- **Patrikis**, arXiv:1306.1242v2: §2.

Every new excerpt was matched against its page.

Nodes (AG2.0):
- `dominant-weights-and-the-weight-w` (definition): (ℤⁿ)^{+}, (ℤⁿ)_w, base change, extremely regular, Ξ_a.
- `regular-algebraic-of-weight` (definition, planet): regular algebraic of weight a, using BLGGT's and ACC+'s Ξ_a^∨
  convention, with the twist rules.
- `polarized-automorphic-representation` (definition, planet): conjugate self-dual, essentially conjugate self-dual and
  polarized pairs (π, χ), and the totally odd normalisation χ_v(−1) = (−1)^{n+w}.
- `polarized-galois-representation` (definition, planet): BLGGT's (r, µ) with ε_v = −µ(c_v), totally odd, and the
  equivalence with 𝒢_n-extensions (GlobalGaloisDeformations G7).
- `galois-character-of-an-algebraic-hecke-character` (construction): r_{l,ι}(χ), HT_τ = {a_{ιτ}}, wt(χ), the value at c_v,
  and the transfer.
- `sign-of-the-polarization-multiplier` (lemma): µ(c_v) = (−1)^{n−1+w}χ_v(−1).
- `expected-hodge-tate-multiset` (definition): {a_{τ,i} + n − i}, with regularity, polarity and twists.
- `frobenius-polynomial-and-conventions` (construction, planet):
  - P_v(X) from ACC+ (2.2.6), and its Satake factorisation;
  - the geometric (BLGGT/ACC+/HLTT) versus arithmetic (IHG.3/R19) conventions, related by r ↔ r^∨;
  - the twist and contragredient rules.
  No local Langlands is used, as the stage requires.
- `galois-representation-attached-at-good-places` (definition): the interface HLTT/ACC+ Theorem 2.3.2 produce, with
  uniqueness, twist, dual (r^∨ε^{1−n}), conjugate and base-change rules.
- `field-of-rationality` (definition, planet): M_π (ACC+ §7.1), kept separate from a field of realisation. The Q₈
  non-example is included.

Carried from the decomposition, with prerequisites derived from its links:
- the normalisation-comparison node, now of kind comparison and pointing to the AG2.0 dictionary;
- the polarized-construction inputs (AG2.1a);
- HLTT (AG2.4);
- Varma and Caraiani (AG2.5).

Planets were added for these.

## Source issues (new)

- **E1** (misprint, BLGGT §2.1, p. 32): "µ_v(−1) = (−1)^n … replacing µ by µδ_{F/F⁺}" means χ.
- **E2** (error, affects a stated result):
  - BLGGT's normalisation χ_v(−1) = (−1)^n makes Theorem 2.1.1(1) false when w is odd, and so the remark "by definition
    ε^{1−n}r(χ) takes every complex conjugation to −1" also fails then.
  - The correct normalisation is χ_v(−1) = (−1)^{n+w}.
  - Counterexamples: the Hecke character of a CM elliptic curve (n = 1, w = 1), where the transfer gives µ(c) = +1; and
    the base change of an odd-weight newform.
  - Patrikis's general sign (−1)^w ω_v(−1) agrees. No published correction was found.

Both are in the packet's `sourceIssues`, and in the local PUBLISHED-ERRATA.md.

## Requests (new)

- AutomorphicFormsOnReductiveGroups AF.4: Ξ_a, Harish-Chandra parameters, the C/L-algebraic distinction, and Clozel's
  rationality theorem.
- AutomorphicFormsOnReductiveGroups AF.1: (g, K)-modules and infinitesimal characters.
- IntegralHeckeAndGaloisDeterminants IHG.3: the unitary Satake normalisation; the convention difference is recorded.
- ArithmeticGaloisRepresentations R01.1: continuous representations.
- EndoscopicTransferAndUnitaryTraceComparison ET.7: Arthur–Clozel base change, unramified identity.
- Tau Ceti ClassFieldTheory layer 11: global Artin reciprocity, geometric normalisation, and the transfer.
- Tau Ceti GlobalNumberFields layers 9–10: Hecke characters, infinity types and weights.

## Suggested Lean file

It imports Mathlib only and was compiled with `lake env lean` against Mathlib 082e2d3, with exit code 0. The only
warnings are 4 `sorry` placeholders.

Real definitions:
- `DominantWeight` and `IsInW`;
- `baseChange`;
- `IsExtremelyRegular`;
- `expectedHodgeTate`;
- `heckePolynomial`.

Proved:
- `isInW_baseChange`;
- `expectedHodgeTate_strictAnti`, `_conj` and `_twist`;
- `conjugate_eq_comp_complexConj`, which uses Mathlib's `IsCMField`.

Checked examples:
- the classical weight in (ℤ²)_{k−2};
- an unpaired weight in no (ℤ²)_w;
- a non-dominant weight;
- HT {11, 0};
- both sign parities behind E2;
- the n = 2 and n = 3 Satake factorisations;
- Δ's reciprocal polynomial;
- the n = 2 twist.

## What remains (precisely)

- **AG2.0:**
  - the unitary similitude coefficient example, which needs HLTT §§2–3 (the G_n coefficient systems);
  - Clozel's theorem, via AF.4;
  - IHG.3's Satake nodes, since that packet has none yet.
- **AG2.1a:** HLTT and Shin: the raw cohomology of the compact PEL varieties with Kuga–Sato coefficients, the projectors,
  and the fixed-point/nearby-cycle trace identities. Chenevier–Harris §§1–3.
- **AG2.1b, AG2.2, AG2.3:** no nodes yet (Shin; Chenevier–Harris §3; eigenvarieties).
- **AG2.4:** HLTT §§5–7: the overconvergent complex, the congruences and the separation argument.
- **AG2.5:** Varma §2 (Bernstein centre); Caraiani §§2–4; the partial order of [Ch] §3.1 (see gaps); Taylor–Yoshida.

The next continuation should read HLTT §§1–3 for the G_n setup and coefficient systems (which also closes the AG2.0
example), then Shin for AG2.1a/AG2.1b.
