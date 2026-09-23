# PAPER-ABE-25 handoff

Second checkpoint · issue #1214 · Codex codex-c83e7a · 2026-09-23.
Builds on merged #1951 by codex-a71f92. Status partial; no Lean compilation.

## Saved work

107 items: 10 library, 8 planned, 89 missing; 204 acyclic edges; six unchanged
routes. Every missing item is routed once. All 37 definitions/constructions
have API/use lists and three tests each (111 total). Six source findings
await independent review. Every published pages 605–622 was reread; images
613,616,621 checked. Main PDF matches the previous exact hash.

## Proofs completed in this continuation

- B17–B20 and B08/B09: finite Swan reductions form a compatible adic system;
  finite generation and exact reduction follow by lifting generators. For an
  exact input sequence, E_n=(M′∩ℓ^nM)/ℓ^nM′ has zero transition from n+c,
  where ℓ^c kills the torsion of M″. Finite-fibre inverse limits prove integral
  exactness. Do not assume quotient reduction preserves the injection.
- The output of a lattice is a lattice: use exactness for multiplication by
  ℓ, then finite torsion-free modules over the coefficient DVR are free.
- A21: the fixed-length henselian repair is proved by flat base change of a
  composition series, with unchanged residue field. Keep the nilpotents;
  the whole fixed scheme need not equal its closed fibre.

These results remain conditional on the actual projective Swan modules and
compatible quotient isomorphisms (G-SWAN), and on the preceding spreading
input A20. Nearby-cycle perfectness and adic trace comparison are not solved
by the module argument. B08/B09 drop G-ADIC but retain G-SWAN; A21 drops its
local gap while A20 retains the unresolved strict-local/spreading suppliers.

## Source correction

E6: §3.3’s dimension-independent negative Milnor sign should be
(−1)^dimX μ. Saito v4 pp.45–46 gives the Milnor formula and constant-sheaf
characteristic-cycle sign. For f(u,v)=uv in odd characteristic with the
simultaneous sign involution, the critical length is 1 and the corrected
identity Fourier trace is +1. The curve case remains −μ. This is a concluding
remark correction, not a change to the nonidentity Artin theorem.

Saito v4 Theorem 4.9 statement/proof and Lemma 4.11 were read; its transitive
proof infrastructure remains open. Both pages of the 2019 correction and the
one-page CCcor2 were read; they concern Radon/Chern-class formulas. E1–E5
are preserved without adding review verdicts. The author homepage is empty;
correction novelty remains qualified. No author contact.

## Resume

1. Follow WORKERS and claim afresh. Refresh current inputs and preserve IDs.
2. Obtain Kato–Saito–Saito 1988 Conjecture 5.1/Lemma 5.3. Public bibliographies located
   no PDF and the DOI browser request failed. The reduction, positivity and
   Qℓ descent remain unread; a virtual trace equality does not replace them.
3. Supply G-SWAN from Serre’s original theorem with quotient change and the
   correct geometric-trait hypotheses. Do not repeat the completed inverse-
   limit exactness proof.
4. Continue geometric G-ADIC, Orgogozo/strict-local ULA inputs, equivariant
   strictification, local Fourier group-ring-perfect comparison and local
   intersection trace. All 12 named gaps retain some open obligations.
5. Preserve the six existing routes and the stage-prefix dependency discipline.
   Reuse finite inverse-set existence/projectivity from the pins; generic
   cohomological limits and derived completion stay with their existing owners.

## Checks

Paper, intake and custom ID/DAG/route/API/use/test/gap checks passed. New exact
653-case diagnostics passed; they test only elementary algebra. The first
checkpoint’s certificate is retained as prior evidence and was not rerun.
No Lean file authorized or compiled. Submit only result, report and handoff.
