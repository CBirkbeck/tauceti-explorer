# REV-RT-PAPER-BOXER-CALEGARI-GEE-25

Independent verification of the red team RT-PAPER-BOXER-CALEGARI-GEE-25 (Codex, session `codex-rtOQ9t`, PR #5395) on the
extraction PAPER-BOXER-CALEGARI-GEE-25 (Boxer–Calegari–Gee, *Cuspidal cohomology classes for GL_n(Z)*, J. Amer. Math. Soc.
38 (2025), 509–520), for issue #4257.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-d67081`, PR #1911);
- its review REV-PAPER-BOXER-CALEGARI-GEE-25 (`cc-fb70e5`, PR #2436);
- the red team.

**Disclosures.** /4 cites two items connected to my earlier work:
- RT-PAPER-ALLEN-ETAL-23/6, which is from my red team (PR #5382);
- RT-AREA-langlands-1/1, whose round-2 fixes I reviewed in REV-FIX-RT-AREA-langlands-1~2 (PR #5313).

The PolarizedAutomorphyLifting Part II is also shared with PAPER-NEWTON-THORNE-26 and PAPER-LE-LEHUNG-LEVIN-ETAL-23. I
red-teamed the first (PR #5334, whose /12 concerns that brief's import list). I marked the second complete (PR #4894).

**Result: all four findings confirmed, all high.** None of them refutes the main theorems.

## What I read

- **The paper.**
  - The published offprint (<http://www.math.uchicago.edu/~fcale/papers/WeightZero.pdf>), SHA-256 `4d27afab…0290`.
  - arXiv 2309.15944v3 (<https://arxiv.org/pdf/2309.15944v3>), SHA-256 `abfa9eac…9684`.
  - Both hashes equal the extraction's. I read published pp. 512–513 and 516–517, and v3 pp. 5 and 8–9.
- **The extraction.** The items symmetric-power-polarization, galois-representation-of-eigenform, nonordinary-local-shape,
  lubin-tate-characters, large-image-nonordinary, local-shape-theorem-3-1 and deformation-ring-nonordinary; route 2; and
  sourceIssues E1–E8, none of which records /2 or /3.
- **The atlas.** The ML.2, ML.3 and ML.5 stage texts in `data/atlas.json`, and the stage graph assembled from stage
  requires, stageEdges and the links of the accepted restructurings in `data/restructure`.

## /1 (high, error): symmetric-power polarizations in characteristic p. Confirmed.

The item gives Sym^{n−1} of any symplectic two-dimensional representation a G_n-structure, for every n and every
characteristic.

**My exact check over F_7.** I solved for SL_2(F_7)-invariant bilinear forms on Sym^d of the standard representation:
- **d = 7 (n = 8):** one form up to scalars, B(v_i, v_{7−i}) = −i, of rank 6 with radical span{x⁷, y⁷}. So no
  nondegenerate invariant form exists, even over F̄_7.
- **d = 8 (n = 9):** also degenerate (rank 5).
- **d = 4, 5, 6 (n = p − 2, p − 1, p):** nondegenerate, as for p = 11 in degrees 9 and 10.

**What the paper uses.** Only n ≤ p (pp. 513, 516). So this is the extraction's overgeneralization, and the red team's
range fix is right.

## /2 (high, error): the sign of the inertia exponents. Confirmed.

**What the paper prints.**
- **The normalization:** multiplier ε̄^{1−k} (p. 513).
- **The inertia formula:** ρ̄_f|I_p ≃ ω_2^{k−1} ⊕ ω_2^{p(k−1)} (p. 516).
- **The character:** ω_2 is the reduction of the Lubin–Tate character trivial on Art_{Q_{p²}}(p) (p. 516).

**Why the formula is wrong.** For either normalization of Art, ω_2^{p+1} = ε̄ on inertia. So the printed determinant is
ε̄^{k−1}, not ε̄^{1−k}. At p = 79 and k = 38 the two exponents are 37 and 41 mod 78.

**What survives.** The dihedral and gcd arguments are symmetric under a ↦ −a, so they are unaffected. The item copies the
printed sign, and no sourceIssue records it.

## /3 (high, error): the missing unramified twist. Confirmed.

**The induced representation.** Take φ lifting Art_{Q_p}(p). Then ε̄(φ) = 1 and ε_2(φ²) = 1, by the transfer to
Q_{p²}. The representation Ind ε_2^{−m} has φ-matrix [0,1;1,0], of determinant −1.

**The residual representation.** ρ̄_f|G_{Q_p} has determinant 1 at φ. So it is Ind ⊗ λ with λ(φ)² = −1, not with a
quadratic λ.

**Comparing traces.** On Sym^{p−1}, only the middle monomial is fixed by the swap, so the trace of φ is 1 on ρ̄_{p,1} and
(−1)^{(p−1)/2} on ρ̄|G_{Q_p}. At p = 79 these are 1 and 78 in F_79. So the isomorphism printed on p. 517 fails when
p ≡ 3 mod 4.

**Where the extraction goes wrong.** Its note is right that the twist is quadratic on the level-2 inducing character.
Its claim that Sym^{p−1} kills the twist is wrong, because on G_{Q_p} the twist has order 4.

**The fix.** The red team's fix, η^{(p−1)/2} ⊗ ρ_{p,1}, is crystalline of weight zero and keeps the multiplier. It is
trivial on G_{F_v}, since p is inert in F⁺.

## /4 (high, error): the ML.5 import closes a cycle. Confirmed.

**The cycle.** Route 2's brief says ML.2 and ML.3 consume the new Part II, and it imports cyclic base change and
automorphic induction from ML.5. In the atlas, ML.5 requires ML.3 and ML.4, and ML.3 requires ML.2. In the assembled
graph, both ML.2 and ML.3 reach ML.5, so ML.3 → ML.5 → PolarizedAutomorphyLifting → ML.3 is a cycle.

**The fix.** Take the soluble base change and automorphic induction behind [BLGGT14, Lems 2.2.1, 2.2.2, 2.2.4] from an
early, source-scoped supplier, with ML.5 as their consumer. Coordinate this with the confirmed RT-AREA-langlands-1/1.
