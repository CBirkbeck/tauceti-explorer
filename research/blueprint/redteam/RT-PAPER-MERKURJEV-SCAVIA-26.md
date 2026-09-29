# RT-PAPER-MERKURJEV-SCAVIA-26: red team of the Merkurjev–Scavia extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026.

Target: `PAPER-MERKURJEV-SCAVIA-26`, the extraction of A. Merkurjev and F. Scavia, *Galois representations modulo p that do not lift modulo p²*, J. Amer. Math. Soc. **39** (2026) 73–94, [arXiv:2410.12560](https://arxiv.org/abs/2410.12560). The extraction was written by `codex-c83e7a`, continued by `codex-a71f92` and completed by `cc-39fac3`. `REV-PAPER-MERKURJEV-SCAVIA-26` (`cc-fb70e5`) accepted it. I did neither job, and I wrote none of the other extractions cited below.

**Result: seven findings, five medium and two low; none is high.** The mathematics of the extraction holds. The findings concern owners, library statuses and completeness. The machine-readable file is [RT-PAPER-MERKURJEV-SCAVIA-26.result.json](RT-PAPER-MERKURJEV-SCAVIA-26.result.json).

## Source

I fetched these on 29 September 2026:

- **arXiv.** The listing shows only v1. Both [v1](https://arxiv.org/pdf/2410.12560v1) and the unversioned PDF have SHA-256 `699028a3…`, which matches the record.
- **Author copy.** The [author copy](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf) (`e1049ad7…`) is the same 16 October 2024 text.
- **Version of record.** The article PDF is behind a login. The public [abstract page](https://www.ams.org/journals/jams/2026-39-01/S0894-0347-2025-01059-9/) gives the dates and the reference list (finding 7).

I read all 21 pages of v1 and checked pp. 4, 8, 13 and 17 on page images. I also re-read Gherman–Merkurjev's Proposition 2.1, Corollary 2.2 and Proposition 2.3 in the [author PDF](https://www.math.ucla.edu/~merkurev/papers/negligible3.pdf). Chu–Kang's publisher PDF returns 403. Its abstract, from the CORE record, states rationality for any linear representation of a p-group of order ≤ p⁴ and exponent p^e, provided char ≠ p and μ_{p^e} ⊂ K. That matches item /117.

## What held

- **Items.** Every numbered statement from Proposition 2.1 to the proof of Theorem 1.4 is itemized with the right hypotheses:
  - e(A)e(H) in /57 and /70;
  - [H:H′] prime to e(A) in /26;
  - the stabilizer H_a in /72;
  - no roots hypothesis in Theorem 5.1 (/111, /112);
  - only μ_p in Theorem 1.4.

  The one omission is the sharpness remark (finding 5).
- **§5, recomputed:**
  - the centralizers A^U, A^N and A^Z;
  - the T-weights of A^U ⊗ H²(U,Z) and the invariants of A^N ⊗ H²(N,Z);
  - σ23·χ13 = χ13 + χ12 and N_{U/N}(E12) = 0;
  - the p = 3 cube (I − 3E31)(I + E13)³ = I in GL₃(Z/9);
  - the p = 3 entries of Claim 5.4;
  - the weight τ31 of E6.

  I also re-checked the carry-cocycle proof of Remark 5.8(2) (/126–/133).
- **Source issues.** E1–E8 hold. E1's real counterexample holds, and the corrected /63 follows from h(f_x)/f_x ∈ μ_e ⊂ F^{×n}.
- **Library.** The fifteen declarations cited by the eleven library items exist at Tau Ceti `f790474` and Mathlib `082e2d3`, and each gives its item.
- **Planned statuses.** They match the layer texts:
  - ProfiniteCohomology Layer 5 (five-term sequence and transgression);
  - Layer 6 (transitivity, conjugation and Mackey);
  - Layer 9 (Hilbert 90 and Kummer);
  - Layer 10 (rational vanishing);
  - ArithmeticGaloisDuality R02.2.

  Layer 11 has no characteristic-p theorem, so /122 is correctly missing.
- **Routes.** Routes 2–5 hold, and routes 6–7 are the right direction. PAPER-GILLE-PARIMALA-26 also sends generic-torsor spreading to SF.1. PAPER-HARPAZ-WITTENBERG-23 also sends its transgression identities to R02.2. HW23's characteristic-p H² vanishing lands in the same folded ProfiniteCohomology Part II design as /122, so that is one design rather than two owners.
- **The review's changes.** E8, the new summary, sourceVersions, the two notes and the gap text introduced no error.

## Findings

### 1. Upstream already plans weak embedding problems and the splitting criterion (medium, error)

Tau Ceti *Profinite pro-p groups* Layer 5 plans four things:

- the continuous extension/H² dictionary;
- "An extension has a continuous group-theoretic section if and only if its class in H²(G, M) is zero";
- `FiniteEmbeddingProblem`/`IsSolution` in the weak form ("Everything below needs only the weak form");
- 5.2: with elementary abelian kernel, "vanishing of that class is exactly solvability".

The extraction never reads this roadmap. Item /3 cites only IG.4, and /8 is routed to IG.4 as if nothing existed. The accepted HW23/23 cites Layer 5 first.

**Fix.**

- /3: cite Layer 5.
- /8: name Layer 5 as the owner of the p-primary case. IG.4 then adds only the arbitrary finite abelian kernel and the non-surjective ρ.
- Routes 1 and 6: import Layer 5.

### 2. The connecting homomorphisms are built (medium, library claim)

Tau Ceti has `DiscreteShortExact` with `explicitDelta0` and `explicitDelta1` and their `_apply` lemmas (`ShortExact.lean`:181, 538, 550, 766, 782). It also has their naturality, restriction and corestriction compatibilities (`DeltaNaturality.lean`:186, 211, 278, 383). These are exactly the ∂₁, ∂₂ and ∂ of the paper, together with the NSW (1.5.2) compatibilities it cites. Item /43 is nevertheless marked missing, with an API note to build them. Also, φ_H′ (/50) is the composite `explicitCor2 ∘ explicitCup02`.

**Fix.**

- Make /43 library.
- Add notes to /50, /67 and /98.
- Tell the route 6 brief to import these declarations.

### 3. The matrix groups are built (medium, library claim)

These exist at the pins:

- B_n(R), as `TauCeti.upperTriangularGroup`, with entrywise `map`, `diag` and `ker_diag`;
- U_n(R), as `TauCeti.upperUnitriangularGroup`, which is nilpotent and has a superdiagonal filtration;
- the torus `TauCeti.diagonalTorus`;
- Mathlib's `Matrix.GeneralLinearGroup.map` and `Matrix.card_GL_field`.

Items /75, /76, /79, /86 and /100 cite none of them, and the notes and brief plan to build U₃, B and T from coordinates. HW23's accepted route 7 (items /14–/16) already plans transvections, the center and the lower central series of U_{n+1}(F_p) in the same folded design.

**Fix.**

- Cite the carriers in those items and in the route 7 brief.
- Import HW23's unitriangular API.
- Keep only the Heisenberg-specific material (N, S, subgroup facts, T-normalization) in /86–/87.

### 4. The universal coefficient theorem has two owners (medium, duplicate)

PAPER-CALEGARI-DIMITROV-TANG-25 route 7 (accepted) makes ArithmeticGaloisDuality D7 the owner of "Universal coefficients and Sylow reduction for finite groups". It calls D7 "the generic owner of coefficient comparisons for group cohomology beyond upstream ProfiniteCohomology". This extraction routes the Tor form of the same theorem (/52, /53, /123) to a new ProfiniteCohomology Part II, and its brief coordinates with ClassFieldTheory instead. (PAPER-WOOD-19/131 is a third candidate owner.)

**Fix.**

- Route /52, /53 and /123 as a source route to D7, which should hold both the Tor and the Ext forms.
- Point route 6 and the `tor-api-design` gap at D7.

### 5. The sharpness of the roots hypothesis is missing (medium, missing)

On p. 4 the paper states: "Their result implies that the assumption on roots of unity in Theorem 1.3 is sharp." No item records this. The note on /128 even says "no claim of necessity", and /70's instruction to keep e(A)e(H) has no witness.

**Verified witness.** Take H = A = Z/2 with trivial action and F = Q. Then F contains μ_2 = μ_{lcm}, but not μ_4.

- The generated subgroup contains 1 ∪ ∂χ, which is the class of Z/4. So H̄² = H² ≅ Z/2.
- Pulling this class back along the character of Q(√−1) gives (−1,−1) ≠ 0 in Br(Q). So the class is not negligible, and Theorem 1.3 fails without μ_4.

**Fix.**

- Add the sharpness item with this example as a negative acceptance test in route 6.
- Add Gherman–Merkurjev Theorems 4.1 and 5.2 to that prerequisite's scope.

### 6. Five misprints are not registered (low, missing)

Each was checked on a page image:

1. p. 4: "When A acts trivially on H" should read "H acts trivially on A".
2. p. 8: Lemma 3.2 writes ρ_f for "fL^×", where fL^{×n} is meant.
3. p. 8: "the étale F-algebra" should be the étale L-algebra; F does not occur in §3.
4. p. 13: "Div(X)" should be Div(V).
5. p. 17, Claim 5.6: "H̄²(N, A) is generated by … φ_H" should be H̄²(U, A). Item /95 corrects this only in a note.

**Fix.** Add these as E9–E13.

### 7. The version of record was revised in substance (low, other)

The AMS page gives "revised form: March 7, 2025". It lists four references that v1 (31 references) lacks:

- Karpenko (1995);
- Lur'e, *Universally solvable embedding problems* (1990);
- Serre's *Cours* no. 12;
- Serre's *Cours* no. 15.

The author copy is v1. So neither text read reflects the revision, which plausibly adds material on universal solvability (/4) and on the history of negligible classes.

**Fix.**

- Record the abstract page in sourceVersions.
- Extend the `published-version` gap to ask for collation of new content, not only of E1–E13 and the locators.
