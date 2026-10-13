# Handoff: BP-ModularCurvesPartII--R13.4a

Worker: Claude (Opus 5.5), session claude-5gXl06, 2026-10-13. Issue #9425.

## What was done

`research/blueprint/packets/ModularCurvesPartII--R13.4a.json` plans stage R13.4a (algebraic coarse
construction before analytic comparison) in 23 new nodes: 2 definitions, 7 constructions,
11 theorems, 3 comparisons, with 69 API items, 36 unit tests and 2 planets ("Deligne–Rapoport
level stack", "Cartan modular curves"). It builds on the first pass of the stage in the R13.3 packet
and cites its seven nodes by id (`integral-coarse-curves`, `coarse-normalization-comparisons`,
`legal-coarse-base-change`, `coarse-cusp-regularity`, `modular-polynomial`,
`projective-scalar-coarse-quotient`, `split-cartan-quotient`); no id of that packet is reused and it was
not edited. `scripts/check_blueprint.py` reports 0 errors, 0 warnings. Status `complete`; stage
coverage `planned`.

The plan, in order: open level subgroups in the row-vector right-action convention (with Γ₁^μ for the
μ_N-embedding convention and the Cartan levels); level-H structures away from the level; the
Deligne–Rapoport stack 𝒳_H as the normalization of X(1)=Ell₁; its geometry (finite flat of rank
[GL₂(Ẑ):H] over X(1), normal CM proper flat, smooth over ℤ[1/n] as [X(n)/H̄], schematic locus);
identification of R13.2's full, Γ₁ and refined Γ₀ stacks with these normalizations; the compactified
coarse j-line over every base; the fibrewise coarse base-change criterion (Česnavičius Lemma 3.3.1);
local structure of the coarse curves (strict henselizations and completions as stabiliser invariants,
ramification indices, line-bundle descent on the tame locus); the j-degree [GL₂(Ẑ):±H] and the cusp
divisor; cusps away from the level as double cosets ⟨±u⟩\GL₂(ℤ/n)/H̄ with widths and Galois action;
the cyclotomic structure X_H→Spec O_H (no connectedness); fixed-pairing curves X(N,ζ) over ℤ[ζ_N];
compactified twisted curves X(ρ); the recognition criterion for relative normalization; the
identification of the elliptic opens with Tau Ceti ModularCurves' Katz–Mazur level problems and coarse
schemes; agreement with ModularCurves Layer 10 for prime N≥5 diamond quotients, checked component by
component; level maps and quotients; failure of coarse base change for Γ₁(4) over 𝔽₂; Cartan curves;
the rational-point criterion (Zywina Proposition 3.3, proved algebraically); X₀⁺(N); proper rigidifying
covers with coherent finiteness.

The first pass's remaining items are discharged: coarse finite-inertia and completion input =
`coarse-local-structure`; refined-stack comparison = `standard-level-stack-identifications`;
finite-normal comparison on every component = `prime-diamond-agreement`.

## Requests to this stage from other packets, and where they are answered

- ShimuraCompactifications C6: targets 3–5, 9–12, 14–16 of the reader.
- AlgebraicModularFormsAndSerreWeights R15.1–R15.2: `proper-rigidifying-covers`, with the line-bundle
  descent clause (e) of `coarse-local-structure`.
- GrossZagierAndArithmeticHeights (both R13.4a requests): `coarse-local-structure`,
  `coarse-degree-and-cusp-divisor`, with `integral-coarse-curves` and `coarse-cusp-regularity`.
- EffectiveDiophantineMethods ED.6: items (a)–(d) and the X₀⁺(N) and S₄(13) curves are
  `split-cartan-quotient`, `cartan-level-curves`, `coarse-rational-points`,
  `atkin-lehner-quotient-curves`; item (e) (genera of X₀(4), X₀(9), X₀(25), X₀(49), fixed points of
  w₄₉) is a generic-fibre statement routed to R13.4b.
- ShimuraVarieties V8: `deligne-rapoport-level-stack`, `coarse-degree-and-cusp-divisor`,
  `coarse-level-maps`, `coarse-level-quotients` with flat base change to ℚ.
- EllipticCurveModularityWild3Adic W3.6: the compactification is `twisted-coarse-curve`; the
  rationality X_ρ(5)≅ℙ¹_ℚ (Shepherd-Barron–Taylor Lemma 1.1) needs geometric connectedness and is routed
  to R13.4b.
- EllipticCurveModularityImaginaryQuadratic IQ.4: `level-subgroups`, `cartan-level-curves`; the
  genus-zero coordinate comparisons of Caraiani–Newton 7.1.3 are routed to R13.4b.
- Paper routes planned at R13.4a (BDMTV /1, /71; Calegari–Geraghty §§3.2, 3.9; Gross–Zagier 1, 120, 123,
  124): see `paperRouting` in the packet.

## What remains

- Coverage `remaining` (refinements, not gaps): collate cusp labels and compactification statements
  against Katz–Mazur 8.6, 8.11, 10.6 and Deligne–Rapoport IV.3, IV.6, VI.1 (not available: Katz–Mazur is
  cleared only for Chapter 5, Deligne–Rapoport is not free); at lemma level split the recognition
  criterion and the fibrewise base-change dévissage.
- No gaps recorded. The 19 requests are all to stages of the Tau Ceti roadmap ModularCurves
  (9A–9E, Layer 10, 0A, 0C–0E, 2B, 2E, 2F, 3N, 3D, 5A–5C, 6, 8D), each saying what is used.
- Restructure proposals (in the packet): (1) split R13.2/fixed-pairing-integral-components into the
  connectedness-free determinant extension and the connectedness part (R12.4/R12.6); (2) the
  generic-fibre parts of the W3.6, ED.6(e) and IQ.4 requests go to R13.4b (job #9426); (3)
  `finite-normal-recognition` and `fibrewise-coarse-base-change` would move to a SchemeAndStackFoundations
  Part II if one is opened.
- No notion was moved down from a higher tier; all suppliers cited (SchemeAndStackFoundations SF.0/SF.1,
  AlgebraicModuliForArithmeticGeometry R09.5, this roadmap's R13.1–R13.3 and R14.1, Tau Ceti
  ModularCurves) are at or below tier 11. `atkin-lehner-quotient-curves` cites
  R14.1/exact-divisor-atkin-lehner, as the first pass's `split-cartan-quotient` already does; there is no
  node-level cycle.

## Source issues

- New: `ModularCurvesPartII/E401` — Gross–Zagier 1986, Chapter III §1, p.255: the strict-henselization
  statement is made for the naive Γ₀(N) stack, which is not Deligne–Mumford at cusps in characteristic p
  when p²|N; it holds for Česnavičius's refined stack (same coarse space), so Proposition (1.4) stands.
- Used: `ModularCurvesPartII/E113` (Česnavičius Proposition 4.3.6 omits N=1), recorded in the R12.1 part.

## Lean

`research/blueprint/suggested/ModularCurvesPartII--R13.4a.lean` (322 lines) elaborates with
`lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474) with `sorry` as the only warning. It types
the level subgroups with real bodies (Γ₀, Γ₁, Γ₁^μ, split and nonsplit Cartan and normalisers), the
projective index, determinant image, reduction from SL(2,ℤ) and level pullback, the cusp double cosets,
their counts for Γ₀(p), Γ₁(p) and the Cartan normalisers, the compatibility with Mathlib's
`CongruenceSubgroup.Gamma0/Gamma1/Gamma`, and the recognition criterion for Mathlib's
`Scheme.Hom.normalization`. A closing comment lists, by target, every API item, unit test and
statement whose carriers (stacks, X(1), 𝒳_H, coarse spaces, ℙ¹_j over ℤ, the ModularCurves level
problems) are absent at the pins.

## Sources read (all public; hashes in the packet)

Česnavičius, A modular description of 𝒳₀(n), arXiv:1511.07475v2 (§§1, 3.2–3.3, 4.1, 4.3–4.4, 5.13, 6);
Česnavičius, Coarse base change fails for some modular curves, arXiv:1608.01249v2 (§§1–3, 4.2, 5.2);
Conrad, Arithmetic moduli of generalized elliptic curves, author PDF (§§1, 4.1–4.3); Conrad, The
Keel–Mori theorem via stacks (§§1–4); Abramovich–Vistoli, arXiv:math/9908167v2, Lemma 2.2.3; Zywina,
arXiv:1508.07660 (§§1.2, 3.1–3.5); Gross–Zagier 1986 (I §1, III §1); BDMTV, Ann. of Math. 189 (§§1, 6);
Stacks Project tags 035I–035L, 03GP, 03GR, 03GV, 0AXP, 00R4; Tau Ceti roadmap ModularCurves at
TauCetiRoadmap 0d144d0 (Scope, Conventions, §§5A–5C, 9A–9E, Layer 10, Mazur interface, Suggested.lean).
Not available: Katz–Mazur beyond Chapter 5, Deligne–Rapoport LNM 349, Shepherd-Barron–Taylor 1997
(AMS refused the scripted download).
