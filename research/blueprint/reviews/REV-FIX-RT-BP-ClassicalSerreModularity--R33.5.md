# REV-FIX-RT-BP-ClassicalSerreModularity--R33.5

Independent review of FIX-RT-BP-ClassicalSerreModularity--R33.5 (Codex, session `codex-rtOQ9t`, issue #5189,
PR #5215) for issue #5190.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- the red team (Codex `codex-J6LwjP`) or its verification;
- the fix;
- the R33.5 packet (cc-39fac3) or its first review (cc-fb70e5).

**Verdict: accepted, after one correction in place.**

**What I reviewed.** The file under review is `research/blueprint/packets/ClassicalSerreModularity--R33.5.json`, and the
job may also edit `research/blueprint/suggested/ClassicalSerreModularity--R33.5.lean`. I read:
- the findings and verdicts (`RT-BP-ClassicalSerreModularity--R33.5.result.json` and `.review.json`);
- the fixer's report;
- the fix commit's diff of the packet, the reader document and the suggested file;
- the statement of every supplier node the fix now imports.

**The source.** I re-downloaded the KW I preprint `results.pdf` and reproduced its recorded SHA-256
(`3c389dc3…bad82`). The server's certificate chain is incomplete, so the download used `curl -k`, and the hash check is
what vouches for the file. I read pp. 8–9: the definitions of compatible, almost strictly compatible, irreducible and odd
systems, and Theorem 5.1. I relied on the verifier's and fixer's readings of Dieulefait–Pacetti.

**Checks.**
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R33.5.json --index
  <baseline>/declarations.tsv`: 0 errors, 0 warnings, before and after my correction.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The executable Lean examples were not compiled. No Lean project was available to me, as none was to the fixer.

## /1 (medium, error): the conditional export. Right, with one correction.

**The fix.** R33.6/elliptic-curve-export-via-either-route is now a conditional corollary:
- its hypothesis is the strong conclusion for the given ρ̄;
- R33.6/strong-form-by-the-modern-route instantiates it.

This is what the verifier authorised. Both R27.6 edges are gone, and no StrongSerre definition is added.

**Its three suppliers** exist and say what the proof uses:
- **AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p** is Serre's Proposition 4. It keeps the
  caveat that coefficients beyond F_p need Raynaud's F-vector-space schemes, which the node's hypothesis repeats.
- **R15.6/s-type-arises-from-and-modular** gives "arises from" and ε(ρ̄) through det ρ̄ = ε(ρ̄)χ̄_p^{k(ρ̄)−1}.
- **SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character** is Carayol for ℓ ≥ 5, with the ℓ = 2, 3
  counterexamples noted.

**The closure check.** The fix was based before the KW fix (#5172) added R20.3 and R15.5 inputs to
R27.4/strong-form-by-minimal-lifts, so I recomputed the node's prerequisite closure over the current packets, with each
packet overriding the integrated decompositions. It has 2,332 references and reaches no R26 or R27.2–R27.6 node other
than R27.4/strong-form-by-minimal-lifts. The node's acceptance check holds.

**Corrected in place.** The third proof step passed to "the attached normalized newform" without saying why its level
is N(ρ̄). After Carayol, the eigenform is in S₂(Γ₁(N(ρ̄))) with trivial character, so its newform's level divides N(ρ̄).
It also needs N(ρ̄) to divide that level. The step now says that the prime-to-p conductor of ρ̄ divides that of every
characteristic-zero lift, and cites PotentialModularityAndCompatibleSystems:R24.6/residual-members (iii), which is added
as a prerequisite. Its own closure (431 references) reaches no forbidden node. The suggested file's proof comment says
the same. The reviewed R27.6/finite-flat-weight-two-export has the same omission (see the maintainer notes).

## /2 (medium, missing): the KW-constructed dyadic system. Right.

R33.5/auxiliary-odd-prime-for-the-dyadic-system is restricted to the system of KW I Theorem 5.1(1) (k = 2) or (2)
(k = 4), through PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems. That node states an
"almost strictly compatible, irreducible, odd system … whose p-adic member is a lift of required type (i)". I checked the
lemma's claims on KW's p. 8:
- a system is irreducible or odd when every member is;
- for q of characteristic ℓ, "if ℓ ≠ 2 and r_q is unramified, the restriction of ρ_ι to D_q is crystalline of Hodge-Tate
  weights (a, b)", even when the residual member is reducible.

**What was removed.** The Chebotarev/Brauer–Nesbitt step and the ψ claim are gone.

**What stays.** The reducible-residual branch is kept for Theorem 1.6, and the Fontaine–Laffaille / not-bad-dihedral step
is kept for p > 3. The prerequisites are the R24.5 system node and the two R24.3 lift nodes. As the verifier said, no
rank-one companion request is added.

## /3 (medium, error): exact suppliers. Right.

**Prerequisites.** No node lists a bare R24.3, R24.6, R32.6 or R15.6 stage any more. I read each exact replacement:
- R24.3/theorem-5-1-part-1-minimal-crystalline and /theorem-5-1-part-2-weight-two;
- R24.5/kw-theorem-5-1-systems and /dieulefait-families;
- R24.6/linked-systems-modularity-transfer;
- GL2ModularityLifting:R32.6/globalisation-dependency-audit;
- R15.6/s-type-arises-from-and-modular.

Each states what its consumer uses.

**Requests and gap.**
- System existence (R24.5) and modularity transfer (R24.6) are now separate.
- The broad requests are gone.
- The gap restates the unaudited items of the R32.6 audit and cites it.
- The request to R32.6 names that audit node as its supplier, the one node-level supplier in the packets; the checker
  accepts it.
- The R17.6 and R20.6 requests and edges are unchanged, as the verifier required.

**New metadata.** The packet's new `supplierChecks` records mark these suppliers as planned in partial, unreviewed
packets. They claim nothing more.

## /4 (low, error): the two-routes wording. Right.

The comparison node's title is now "Two proofs of Serre's conjecture: what each route uses from Khare–Wintenberger", and
the summary keeps the verifier's four claims apart. The reader document now says "E3–E9" and no longer says "exactly";
it is not a deliverable of this review. No node statement or edge changed for /4.

## /5 (low, library-claim): the Lean note. Right.

The standard note now says that residual Galois representations of G_ℚ and the Serre-modularity interface are missing,
and that Mathlib's `ModularForm`/`CuspForm` and Tau Ceti's `HeckeRing.GL2.Newform` are available. The theorem
signatures stay commented, and the executable examples are unchanged.

## For the maintainer

- **R27.6/finite-flat-weight-two-export** (R27.3 packet) has the same level omission as the one corrected here. When
  R27.6's export is made an instance of this conditional corollary, as the fixer suggests, it inherits the corrected
  step.
- **`fixHistory`.** The packet's new entry still says "pending-independent-review". This review object supersedes that
  status.
