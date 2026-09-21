# PAPER-HARPAZ-WITTENBERG-23 handoff

Codex continuation session codex-a71f92, following codex-c83e7a's checkpoint; issue #1310. Status: complete paper extraction, ready for independent review. This continuation is not an independent review.

156 items: 10 library, 15 planned, 131 missing. Ten routes cover every missing item exactly once, plus seven planned items. Full final-author paper reread; publisher layout not independently collated. Preserve the report's distinction between inherited checks, fresh checks and prerequisite excerpts.

## What changed

- Former gap46 is completed explicitly: B=F_2^5, Q=C2×C4×C2, β=(χ_x+χ_y)b*, γ(s)=a,γ(t)=b+c, f=γ cup χ_z, E=B×_f Q of order512, and V=(SL_513×Spec L)/E over C((x))((y))((z)). Every conjugacy test passes, but δβ is the nonzero image of (x)cup(y)cup(z). Items144–152 and the report give the complete calculation.
- Former gap139 is retained as a counterexample to the unrestricted discrete-Hom statement. Items140–143 replace it with Hom_pt(C,A), its continuous splitting torsor and the direct formula ∂c=γ cup c. Finite generation of C recovers discrete Hom; all paper applications already use finite C. The generic correction routes to ArithmeticGaloisDuality R02.1, not a new coefficient theory.
- Corrected an additional literal-definition issue: under Definition3.2 the outer exponent of C2 is1. Lemma4.7 yields factorization through (Z/p)×, so the least divisor is1 at p=2 and p at odd primes. All downstream uses need only that factorization.
- Separated existing Tau Ceti transvections as library item156; item14 retains only the UT membership/factorization interface. Made item131's invariant equations explicit and split Remark3.1's sufficient conditions into items41,153–155.

## Reviewer focus

1. Check the natural group/étale Hochschild–Serre comparison, Pál–Schlank §9 pp.28–31. The explicit mixed cochain c((v,q),(w,q′))=β(q)(q w) has differential infl(β cup f); the comparison identifies this with the geometric edge obstruction.
2. Check both nonvanishing steps: iterated finite-coefficient residues and the injectivity H³(μ_2)→H³(G_m) coming from 2-divisibility of Br(k). The latter follows from Gille–Szamuely Witt decomposition; finite-coefficient nonzero alone would be insufficient.
3. Check the source-topology distinction: TauCeti.InternalHom is always discrete; use a separate induced-topology wrapper, retaining its algebraic homAction and existing topological H¹. Do not claim an Ext computation in the discrete-module category for arbitrary Hom_pt.
4. Keep the existing stage order finite algebra → geometric/Brauer constructions → final arithmetic conclusions. R02.1 supplies the general topology repair; R02.2 the group transgression and generic Laurent residues; SF.2 the étale comparison. C((x))((y))((z)) is not an HL.0 n-local field with finite last residue field.

## Preserve previous repairs

The explicit length-six fixed-conjugacy and arithmetic Brauer examples (items76–77) are complete, not gaps. Also preserve: fixed adjacent representatives in Proposition7.3; γ-first cup with flipped (−1)^m sign; real-place lifting; e_03^(a_2) in Lemma4.13; five-by-five §6 subgroup; twisted eigenspace index i+m+1; internal sum with one corner; geometric bar in Proposition4.1; B_ω inside Br_1/Br_0, defined by local Brauer classes.

Fresh finite checks: 256 cocycle/cup pairs, 4096 factor-set/symbol triples, 224 fixed-vector tests, 24576 mixed-cochain checks, non-coboundary verification, cyclic outer exponents1–64. Prior matrix checks remain attributed to the original checkpoint. Source URLs, hashes, read ranges, library pins and refreshed owner/audit evidence are in the report.

Paper checker and scope/route/API checks passed before submission. No Lean file was compiled or claimed formalized. Remaining work is independent review and the already-routed blueprint/prerequisite-paper proof decomposition, not an unresolved extraction item.
