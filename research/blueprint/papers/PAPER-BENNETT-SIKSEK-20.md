# Bennett–Siksek: source-led checkpoint

**Job:** PAPER-BENNETT-SIKSEK-20; issue #1119.  
**Worker:** ChatGPT, session `chatgpt-0921-b74e`.  
**Status:** partial, not ready to generate design jobs.  
**Read date:** 2026-09-21.

## Source and limits of this submission

Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics **191** (2020), 355–392, DOI [10.4007/annals.2020.191.2.2](https://doi.org/10.4007/annals.2020.191.2.2). The source used is the [published 38-page PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), including the Section 12 addendum credited to Andrew Granville. The earlier arXiv:1709.01022 version is not an interchangeable source for that addendum. Printed page 355 is PDF page 1.

The JSON records 49 items. Sections 1–12 and the bibliography were viewed, with rendered-page checks for sensitive displays. This is **not** a complete extraction: several imported results, the final assembly, and most of the addendum still need individual entries and input verification. Reading an input as quoted in this paper is not verification of its original hypotheses.

Only item 03 is marked as a verified library item. Every other `missing` status means **unresolved lookup in this partial checkpoint**, not established absence from either library or the atlas. Each such item carries an explicit warning. The schema has no `unchecked` status. The empty `routes` and `prerequisites` arrays mean unfinished audits, not that no routes or prerequisites are needed. Do not accept those provisional classifications or generate a roadmap from this checkpoint.

The container could not resolve external hosts, so neither a clone nor raw PDF bytes were obtained. The PDF SHA-256 is deliberately null, rather than a hash of rendered text or a guessed fingerprint. The reviewed aggregate `data/library-coverage.json` did not return usable content through the attempted readers; its blob read timed out. No claim is made to have read that audit.

## What the proof actually needs

For a primitive progression solution, write its small-prime factors as `n+i*d=A_i*y_i^ell`, with all prime powers below `k` retained in the positive integer `A_i`. In the main proof `ell` is odd and very large, so the sign lies in `y_i`. The target in Theorem 2 is the bound `ell <= exp(10^k)` for prime exponents and sufficiently large `k`, allowing the degenerate alternatives `y=0` or `d=0`. It is not `exp(10*k)`. The finiteness application fixes `k`; it is neither the full Erdős nonexistence conjecture nor an algorithm for listing all integral points. See pp. 356–358 and Section 11.

The extraction follows the mathematical dependency order, not just the section titles:

| Items | Interface established or recorded from the source |
|---|---|
| 04–10 | Residual representations, reduced conductor, weight-two realization, trace congruences, exponent bounds, and Kraus's replacement by an actual elliptic curve with full rational 2-torsion. |
| 11–23 | Gcd/valuation splitting and **both** Frey families. The quadruple family is needed as well as the three-term-progression family. |
| 24–27 | Every prime in `(k/2,k]` divides `d`; reduced-level curves have the same integer traces, and those at primes `3 mod 4` vanish. |
| 28–39 | Legendre parameters, the two squareclass cases, finite-field 2-descent, and a simultaneous choice of primitive quadratic characters with large von Mangoldt sums and controlled, nontrivial odd conductors. |
| 40–48 | Exceptional conductors, the harmonic-family contradiction, smooth-character cancellation, the inner-product sieve, Roth, and the simultaneous conductor-selection statement. |
| 49 | The bounded-height exceptional-modulus definition at the start of the addendum; not an extraction of all its propositions. |

A residual trace congruence is not an actual curve. Kraus's theorem is the bridge needed before using Legendre coordinates. Equality of integer traces needs the Hasse inequalities and `4*sqrt(k)<ell`. The exceptional second squareclass case in Section 6 cannot be discarded: it is where the descent and the applicable rational-isogeny case of Serre uniformity enter. Conversely, general Serre uniformity must not be assumed.

For continuation, the main proof closes as follows (Sections 9–10, pp. 381–385). Proposition 9.1 chooses **one** progression satisfying all four avoidance, smoothness and size conditions. Take a maximal family of such progressions with distinct largest conductor primes. More than `17*log(k)` members invokes Proposition 8.1. Otherwise maximality forces reciprocal mass at least `0.17`. The portion above `10^4*log(k)` is at most `0.0017`; the remaining small-prime portion therefore exceeds the `0.166` required by Proposition 7.2. These are proof dependencies still to be split into final-assembly entries, not work already marked complete.

Section 12 is a separate zero-density/exceptional-modulus route from Proposition 6.1. It replaces the short-character-sum and Roth part of the proof. A complete extraction must include **both** routes rather than silently replacing the original proof with the addendum.

## Pinned library evidence and routing boundaries

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

I read the actual Mathlib source [Weierstrass.lean at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean), including the coefficient structure and invariant definitions. The file blob is `5ef9316e466dfc60347c91f8110fe2a8eef28e5b`. Item 03 cites `WeierstrassCurve`, `b₂`, `b₄`, `b₆`, `b₈`, and `Δ`. This proves the availability of that infrastructure only, not the Frey lemmas, conductors, modularity, or 2-descent.

The pinned Tau Ceti root file was also read. It is intentionally empty and expressly says modules are built through the lakefile globs. **Its emptiness gives no evidence of mathematical absence.** A module-level Tau Ceti search remains necessary.

The EllipticCurves and ModularForms upstream roadmaps were consulted for their mathematical interfaces and style. Current roadmap prose is not a substitute for pinned declaration verification. The following are routing leads, not accepted routes:

* `SerreWeightAndLevelOptimisation:R20.2`, whose full extracted description was read, already plans Mazur/Ribet/Diamond level lowering with exact Artin-conductor and exceptional-case controls. Import the applicable result; do not create another general level-lowering roadmap. The modularity supplier and exact matching hypotheses still need verification.
* The effective-Diophantine roadmap's layers concern certified algorithms, logarithmic bounds, descent, Chabauty and the Mordell–Weil sieve. An effective exponent bound followed by an ineffective finiteness theorem is not, by itself, its certified-point-enumeration interface. Do not force this application into `ED.6` merely because both concern Diophantine equations.
* The general elliptic, modular, additive-combinatorial and analytic inputs need their existing owners checked against the reviewed audit, packet IDs, proposed roadmaps and links. Only the remaining application-specific glue can justify a new route. No new roadmap ID is reserved here.

## Source diagnostics and proposed repairs

These diagnostics are not a claim to have disproved the main theorem. They distinguish literal formulas from corrected identities, and local repairs from an audit of the full proof.

### D1. First Frey discriminant: a factor of four

On p. 361, Lemma 3.2 displays `64*(a*b*c)^2` for the model `Y^2=X*(X-a)*(X+c)`, with `a+b+c=0`. In the pinned Mathlib convention the coefficients are `a2=c-a`, `a4=-a*c`, and `a1=a3=a6=0`. Direct substitution gives

```
Delta = 16*a^2*c^2*(a+c)^2 = 16*(a*b*c)^2.
```

Consequently the progression-coordinate coefficient is `2^6/g^6`, not `2^8/g^6`. Item 16 records this **corrected** identity explicitly. The paper's later expression for `j` is consistent with the corrected invariant. Odd-prime valuations do not change; this observation does not discharge the separate 2-adic minimal-model/conductor bounds. The second Frey discriminant `-64*kappa^3*A^2*B` does agree with the same invariant convention.

### D2. The all-integer divisor bound is false as printed

On p. 378 the displayed inequality `tau(q) <= q^(1/log(log(3*q)))` is asserted for all positive `q`. At `q=120`, the left side is 16 and the right side is approximately 14.8922198924. This refutes the literal universal claim. **120 is not squarefree**, so it is not a counterexample to a separately restricted squarefree statement or to Proposition 8.2.

The proof only needs an eventual subpower divisor estimate with constants controlled after `c2` is fixed. Replace the universal statement by a verified eventual estimate and absorb its threshold into `k3(c2)`, or prove the exact restricted bound needed for the chosen factor. The external divisor-estimate input is still to be audited.

### D3. Product-character conductor is not the lcm modulus

On p. 377 the proof sets `M=lcm(N1,N2)` and calls it the conductor of the product, then factors it into coprime primitive and principal parts. For the primitive characters of discriminants 8 and -8, both conductors are 8, but their product is the character of discriminant -4, of conductor 4. Thus the asserted conductor identity is false, even for distinct primitive quadratic characters.

A usable replacement separates the ambient modulus `M` from the primitive conductor `M1`. Let `eta` be the inducing primitive character and let `M2` be the product of primes dividing `M` but not `M1`. Then

```
chi1(n)*chi2(n) = eta(n) * 1_{gcd(n,M2)=1},
gcd(M1,M2)=1,       M1*M2 divides M.
```

The principal factor has **modulus** `M2`, not primitive conductor `M2`. Equality with the old ambient modulus is unnecessary. Recheck the block decomposition, the length bounds, and both cases of Proposition 8.2 with this corrected convention before accepting the route.

### D4. Sign restriction in the small-prime factorization

Equation (6), p. 360, uses positive `A_i`. For negative progression terms that is incompatible with an even exponent. Item 13 explicitly assumes odd `ell`, which the main proof supplies. A general even-exponent API would need a different sign convention or positivity hypothesis.

### D5. Retain the boundary term in the addendum's divisor count

On pp. 387–388 the count of indices in a length-`k` progression divisible by `r` is reduced from `k/r+O(1)` to `O(k/r)`. Uniformly in unbounded `r`, that reduction is not justified. Under coprimality, the count is at most `k/r+1` (or zero when the congruence has no solution). For `r|q` and `r >= q^(1/3)/2`, a valid sum is

```
sum_{q in Q(k)} tau(q) * (2*k/q^(1/3) + 1).
```

Here is a local repair, conditional on the stated estimates of Proposition 12.1 and a verified divisor bound. Use `tau(q) << q^(1/12)` and `q<=k^4`. The main term is bounded by `C*k*sum q^(-1/4)`. The omitted boundary contribution is at most `C*k^(1/3)*(log(k))^61`, using `#Q(k) << (log(k))^61`. The minimum-modulus and all-but-one lower bounds of Proposition 12.1 give the desired `O(k/(log(k))^(1/4))` overall. This repairs that counting step without pretending the other addendum inputs have been checked.

### D6. Divisibility suffices in the final addendum argument

On p. 388 the odd conductor is identified with the largest odd squarefree divisor of `A_i*A_j*A_h`. Proposition 6.1 and the level bound establish divisibility, not that equality. The needed conclusion is nevertheless obtained from the weaker statement. Since the odd part is squarefree, divides the product, and a primitive quadratic conductor has 2-part at most 8,

```
gcd(N,A_i)*gcd(N,A_j)*gcd(N,A_h) >= N^odd >= N/8.
```

At least one gcd is therefore at least `N^(1/3)/2`. Do not strengthen the earlier interface to an unsupported equality. The simultaneous avoidance and `N<=k^4` selection earlier in the same paragraph still needs a quantitative proof.

### An explicit factorial-deletion proof for item 48

For each supported prime `p<k`, choose a maximal-valuation index `i_p` in `J`. Such a prime cannot divide `d`, since it divides one term and `gcd(n,d)=1`. For every other `i` in `J`, maximality and subtraction imply

```
v_p(A_i) = v_p(n+i*d) <= v_p(i-i_p).
```

After deleting every chosen index, sum over the remaining indices and enlarge to all `i != i_p` in `[0,k-1]`. This gives

```
v_p(product A_i) <= v_p(i_p! * (k-1-i_p)!) <= v_p((k-1)!).
```

Primes not supported by the `A_i` contribute zero. Hence the product divides `(k-1)!`. The number of deletions is at most the number of primes below `k`. Valuations of signed terms are taken on absolute values; no positivity of `n` was used.

## Prerequisite-source leads, not an absence audit

The following identifications were checked against this paper's bibliography. Their original statements and their atlas coverage are **not yet verified**, so these are a continuation list, not accepted missing-paper requests.

| Source in the paper | Needed interface |
|---|---|
| Kraus [23], *Majorations effectives pour l'équation de Fermat généralisée*, DOI `10.4153/CJM-1997-056-2` | Exact full-two-torsion replacement theorem and threshold. |
| Bennett–Skinner [4], DOI `10.4153/CJM-2004-002-2` | Second Frey family's reduction and conductor estimates. |
| Lemos [25], DOI `10.1090/tran/7198` | The rational cyclic-isogeny case actually used in Section 6, with CM exceptions. |
| Martin [28], DOI `10.1016/j.jnt.2004.10.009` | The newform-dimension bound used in Lemma 2.2. |
| Graham–Ringrose [15], DOI `10.1007/978-1-4612-3464-7_18`; Bombieri [6], DOI `10.4064/aa-18-1-401-404` | Exact short-sum and inner-product-sieve inputs, including conductor and length hypotheses. |
| Iwaniec–Kowalski [19], DOI `10.1090/coll/053` | Zero-free regions, exceptional-zero repulsion, explicit formula and divisor bounds with their ranges. |
| Rahman [31]; Laishram–Shorey [24] | The explicit Roth threshold and the cited progression-factor combinatorics. |
| Bennett–Martin–O'Bryant–Rechnitzer [2], DOI `10.1215/ijm/1552442669`; Platt [30], DOI `10.1090/mcom/3077` | Addendum zero-free/numerical inputs and exact certified ranges. |
| Darmon–Granville [9], DOI `10.1112/blms/27.6.513` | The fixed-exponent finiteness interface; distinguish it from an effective enumeration claim. |

## Validation performed

The exact repository `scripts/check_paper.py` was reconstructed locally and its Git blob hash verified as `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`. Calling its unmodified `check(data, paper, {}, {})` returned no errors. Empty catalogues are sufficient for this **structural** check because the checkpoint has no planned-stage references or routes. This was not a run of the full CLI against a cloned atlas, and it does not establish mathematical completeness or library coverage.

JSON parsing and uniqueness of all 49 IDs were checked. Symbolic substitution in the pinned discriminant formulas verified D1 and the second-family identity. Direct arithmetic checked D2, and the discriminant-8/-8 product identity was checked over a finite range as a regression test for D3. These computations are not Lean proofs. No Lean file was submitted or compiled.

The accompanying handoff gives the exact remaining work and acceptance conditions.
