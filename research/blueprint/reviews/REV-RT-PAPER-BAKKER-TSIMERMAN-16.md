# REV-RT-PAPER-BAKKER-TSIMERMAN-16

**Complete: all four findings confirmed**, with the scope qualifications below. Refs #1736. Reviewer: Codex / `codex-7e92bd`, 24 September 2026. The extraction (`codex-a71f92`), its review (`cc-fb70e5`) and red team (`codex-hjdg0j`) were done by other sessions.

The first two findings require correcting a map and a hypothesis. The third requires making the cusp estimates' positive parameter range explicit in their standalone statements. The fourth requires an acyclic construction order before implementation. No existing erratum is replaced and no source-proof gap is claimed closed.

## Evidence and scope

Input snapshot: `e056b0d0a8966511f4da3b48457296585777758a`. I read the four findings, their report, the named extraction items and surrounding conventions/routes, original review corrections, relevant existing errata, and the SF.4/SF.5 owner/edge records including accepted RS-25.

Public sources fetched on 24 September 2026:

- [Published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), 36 pages, SHA-256 `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.
- [Author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), five pages, SHA-256 `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.

Both hashes match the extraction. Targeted reading covered published pp.716–718, the height definition on p.721, Lemmas 10–11 and adjoining conventions on pp.722–723, the normalizer argument on p.726, and erratum §§1–2. I inspected rendered images of pp.717, 718, 722 and 726. This is verification of the supplied findings, not another complete proof audit of the paper or its prerequisite literature. None of these findings rests on a pinned Lean declaration; no library-status claim or Lean compilation is made here.

## /1 — confirmed: two maps with different kernels

Item /29 already has the correct first map. Item /118 contradicts it by using the second map's domain and codomain with the first map's kernel. The corrected diagram is

```text
PSL₂(Z) ──gamma_p──▶ Gamma(2,3,p) ──q_p──▶ PSL₂(F_p)
   │                   │
 kernel K_p         kernel Xi(p)
```

Reduction modulo p is the composite. In particular,

- K_p is the normal closure of T^p in PSL₂(Z), contained in the projective principal congruence subgroup Gamma(p).
- Xi(p)=gamma_p(Gamma(p)) is the kernel of q_p.
- An integral determinant-one matrix enters gamma_p via its projective class.

The presentation of the middle group already makes T^p the identity. Its normal closure there is therefore trivial, so it cannot be Xi(p), the nontrivial surface group for p>5. This independent group-theoretic check also detects the ambient-group mismatch without trusting the extraction's notation.

Correct /118 and its map references in /38–40; keep /29's convention. The source's separate short-geodesic issues, already recorded as E12/E13, remain unresolved by this type correction.

## /2 — confirmed: a common j-value is insufficient

Item /113 needs a condition on the pair, namely `(x,y) ∈ CM`, or an explicit common nonidentity stabilizer. Its present same-base-point condition is weaker. The counterexample can be checked using only matrix algebra and the deck action.

Take an order-two elliptic point x, its projective stabilizer generator

```text
s = [[0, 1], [-1, 0]],    g = [[1, 1], [0, 1]],    y = g⁻¹x.
```

Then x=gy and the two points have the same j-value. However,

```text
g s g⁻¹ = [[-1, 2], [-1, 1]].
```

Every scalar multiple of s has zero diagonal, whereas this conjugate has nonzero diagonal modulo every p>3. Since a nonidentity element of a group of order two generates it, the conjugate is outside the stabilizer and g cannot normalize it. A scratch check of every possible nonzero scalar at p=7,11,13,17,19,23,101 agrees; the displayed diagonal argument proves the assertion for all the stated primes.

With the CM pair condition, the two order-two or order-three stabilizers share a nonidentity element and hence coincide. The desired normalizer inference then follows from transport of stabilizers. The subsequent index-two criterion must still distinguish commuting with a chosen GL₂ lift from the projective normalizer. The authors' erratum specifically rules out an arbitrary integral lift in the nontrivial coset; fixing /113 must not reintroduce that assertion.

## /3 — confirmed for /39 and /40, with qualification

The accepted extraction contains two pieces that must be reconciled: item /13 describes choosing positive small parameters, but /39 and /40 and their review notes explicitly present only the upper bound delta<1/2. The original review says those lemmas assume only that bound. A future standalone theorem cannot safely reproduce that unrestricted range.

Fix delta=-1/4. In /39 choose the distinguished cusp and its distinguished lift; in /40 take the identity group element. The displacement is zero, and the stated distance bound is three quarters of the positive compact injectivity radius. Thus the antecedents hold for arbitrarily large primes p>5. On the other hand, every integral determinant-one matrix satisfies h(M)>=1. The requested asymptotic bound would give

```text
1 <= h(M) <= C(delta) / p
```

for all sufficiently large primes. This is impossible because the ratio h(M)/(1/p) is at least p. The contradiction uses an unbounded family, not a single small-prime failure or floating-point estimate.

Write `0<delta<1/2` in the two cusp interfaces and specify the dependence of constants/thresholds consistently with /13. The existing positive convention shows the intended application is sound with respect to this particular objection; it does not make the explicit local quantifiers and their contrary review notes suitable as they stand.

This counterexample does **not** refute /38 for negative delta: its strict displacement inequality has no solutions there. Giving /38 the same positive range is a consistency improvement. Nor does this verification prove all height estimates after the range repair or settle the other recorded geometric proof gaps.

## /4 — confirmed: route instructions would reverse a dependency

The current records independently agree:

- SF.5's README and stage description list SF.4 as an input.
- The stage-edge file contains `SF.4 -> SF.5`.
- Accepted RS-25 retains the relevant birational programme at SF.4 and general intersections at SF.5.
- Route 4 assigns /101 and /108 to SF.4 while asking for an import from SF.5.

Implementing that last instruction literally adds `SF.5 -> SF.4`, closing a two-stage cycle. This is a conflict in the proposed construction order. No such reverse edge has been inserted, so it is not a claim that the existing graph already contains this cycle.

The proposed fix is appropriate provided it preserves the existing owners. Place the surface refinements that require SF.5 after SF.5 in a Part II, importing existing SF.4 birational constructions and SF.5 intersections. Alternatively, an accepted explicit decomposition can expose precisely the needed intersection prerequisites earlier. In either case /101 and /108 must remain routed exactly once and GeometricFreyMazur's imports must follow the new order. Deleting the current forward edge or silently treating all SF.5 output as available before SF.4 does not establish an acyclic proof plan.

## Validation

**PASS:** red-team checker; exact coverage of all four supplied finding IDs with no extras; two-file intake with zero problems. All 16 captured input blobs and both output guards matched fresh main `faa489c8d8d99d7e0b01b9670d60cd2f4685bb93`. The bot-confirmed claim and issue instructions were unchanged before publication. Exact matrix/scalar checks and the extracted stage-edge check passed. No Lean compilation was required or performed.
