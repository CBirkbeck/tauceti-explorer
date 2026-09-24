# Review: RT-AUDIT-30 (red team of the library audit AUDIT-30)

Job `REV-RT-AUDIT-30` (issue #1610), by Claude Code, session `cc-39fac3`, 24 September 2026.

**Independence.** This verifier did none of AUDIT-30, REV-AUDIT-30 or RT-AUDIT-30. The red team was written by the Codex session codex-c83e7a (PR #2720), and the audit by the 17 September swarm lanes.

**Method.** Each finding was checked at its evidence:
- the audit entries in research/blueprint/audit/AUDIT-30.result.json;
- the stage texts in data/atlas.json and the roadmap documents, at the cited commit 331c5d75 and on main;
- the declarations at Mathlib 082e2d3 and Tau Ceti f790474;
- the review record of AUDIT-30, which corrects neither entry.

## Verdicts

**2 confirmed, 0 rejected.** Both are of medium severity and go to the fix job.

| Finding | Kind | Severity | Verdict |
| --- | --- | --- | --- |
| RT-AUDIT-30/1 | duplicate | medium | confirmed |
| RT-AUDIT-30/2 | error | medium | confirmed |

## RT-AUDIT-30/1: the ER.3 duplicate of Polylogarithms P.5

Confirmed. The duplicate entry rests on shared vocabulary, not a shared target. P.5's fifth target (AUDIT-30, Polylogarithms:P.5, target 4 in zero-based order) is 'The weight-three curve regulator and its Eisenstein-Kronecker expression', and the P.5 stage text (content/campaign/Polylogarithms/README.md, § P.5, identical at 331c5d75 and on main) keeps weight three apart: 'For weight three construct the corresponding curve regulator and the Eisenstein–Kronecker expression … the elliptic weight-three special-value conjecture is not included among theorems proved by Bloch's weight-two argument.' ER.3's full stage text (data/atlas.json, EllipticRegulators:ER.3) is entirely weight two: it defines the elliptic Bloch–Wigner dilogarithm by the q-orbit sum, the companion J_q and R_q = J_q + iD_q, formalises Bloch's weight-two regulator argument, and 'Establish[es] the Fourier/Kronecker–Eisenstein descriptions' of that dilogarithm. It plans no weight-three regulator and no curve regulator for general curves. So the entry's note ('overlapping P.5's Eisenstein-Kronecker regulator expression') equates two different series at two different weights. The ER.2 entry is a real overlap (ER.2 constructs η(f,g) = log|f| d arg g − log|g| d arg f, which is P.5 target 3's weight-two expression) and stays. The fix is right: remove the ER.3 entry, or at most keep it as a note that ER.3's Kronecker–Eisenstein analysis is an analytic analogue, not an owner of the weight-three target. P.5's 'absent' label on that target and its 'not built' verdict are unchanged.

## RT-AUDIT-30/2: the Selmer-group note of MotivicEtaleKTheory M.8

Confirmed. The note says Mathlib's K(S, n) is 'the subgroup of K^x/(K^x)^n on which every valuation outside S is divisible by n (that is, the unramified-outside-S local condition for mu_n)'. The parenthesis is false without a hypothesis on the residue characteristics. Mathlib 082e2d3, Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:163, defines selmerGroup by valuationOfNeZeroMod n x = 1 for every v ∉ S, with no condition relating n to the primes outside S (section variables: any Dedekind domain R with fraction field K, any S, any n : ℕ). Its module docstring identifies H¹(K, μ_n) with K^×/(K^×)^n by Kummer theory but gives the local conditions only as 'defined by v-adic valuations' and promises the comparison with the Galois-cohomological definition only 'when possible'. The counterexample holds: for R = ℤ, S = ∅, n = 2, the class of −1 lies in K(∅, 2) because every finite valuation of −1 is 0, but its Kummer class cuts out ℚ(i), which is ramified at 2 (i − 1 is a root of the Eisenstein polynomial Y² + 2Y + 2). So valuation divisibility equals the unramified condition only at primes not dividing n. For number fields the equivalence needs S to contain the primes above n. This matters for M.8 in particular. Its Selmer complexes have p-adic coefficients, so n is a power of p, and the target's local condition at p is crystalline or semistable, not the valuation condition. A builder reading the parenthesis could take K(S, p^k) with S not containing p as the unramified-away-from-p Selmer group. Tau Ceti's Kummer cocycle g ↦ gα/α (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:97–99, TauCeti.kummerCocycle) is the cohomology class meant, and it is defined without any local condition. The fix is right: describe the declaration as the valuation-defined classical Selmer group, qualify the unramified reading by 'at primes not dividing n' (for number fields, S contains the primes above n), and keep the 'partial' label, the citations and the 'not built' verdict.

## Fixes to apply

1. In AUDIT-30, `roadmaps.Polylogarithms.layers["Polylogarithms:P.5"].duplicates`:
   - remove the entry for `EllipticRegulators:ER.3`;
   - keep the `EllipticRegulators:ER.2` entry.
2. In AUDIT-30, `roadmaps.MotivicEtaleKTheory.layers["MotivicEtaleKTheory:M.8"].targets[6].note`, replace "(that is, the unramified-outside-S local condition for mu_n)" with "(which is the unramified local condition for mu_n only at primes not dividing n: for a number field it needs S to contain the primes above n, and at the primes above p the crystalline or semistable condition this target needs is different)". Keep the label 'partial', the three citations and the verdict 'not built'.
3. Regenerate data/library-coverage.json.
