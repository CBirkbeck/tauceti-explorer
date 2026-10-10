# Handoff: REV-FIX-RT-AREA-ktheory-1~2

Refs #5542. Codex — `codex-dbAQYQ`, 10 October 2026.

**The independent review is complete; this is not a checkpoint.** The report
is [REV-FIX-RT-AREA-ktheory-1~2](../reviews/REV-FIX-RT-AREA-ktheory-1~2.md).
It gives all 38 verdicts, C1–C11 corrections, public-source URLs/hashes and
the exact validation results. The seven packets have this review's dated
top-level verdicts and retain their previous reviews in `reviewHistory`.

Accepted: ArithmeticKTheory N.1, K2SymbolsBrauer T.1, K3BlochGroups.
Needs changes: GeneralAlgebraicKTheory K.1/K.6, ArithmeticKTheory N.7,
K2SymbolsBrauer T.3. Acceptance is scoped to the area-fix obligations; the
older partial-packet gaps remain explicit.

All seven packet checks pass with zero errors/warnings at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All seven actual Lean files
elaborate with only `sorry` warnings; K.1 has none. Future comments are not
type checked. The report records warning totals and the three-file rechecks.
Nothing is claimed formalized; no live atlas, reader, supplier or upstream
roadmap file was edited. No standalone link map or restructuring result
was a deliverable. Scratch evidence is reproduced in the report where
needed, so resumption requires no scratch files.

## Next fix: stage ordering (/4 and /20)

The maintainer must apply the K.1/K.6 embedded restructuring proposals:

1. Make Waldhausen additivity, relative S and the relevant iteration early
   K.4:construction inputs. Remove its unused E5:abstract/H.5:spectra
   prerequisites and add its actual H.2 realization input. H.5:S-delooping
   assembles the resulting spectrum rather than replanning products.
2. Create K.7:products for `products-from-biexact-functors`, `biexact-S-grid`,
   `biexact-stabilized-pairing`, `biexact-pairing-coherence` and
   `unit-multiplication-and-K0-tensor-comparison`, keeping their node ids.
   Their proposed parents are recorded in K.6. Generic H.5 smash and
   module-boundary inputs must be independent of later K localization.
3. Create K.3:cofinality after K.4 for the general cofinality and
   Grothendieck-class/factorization nodes. Keep Quillen's original
   localization/resolution early; remove K.4→early K.3. Preserve the early
   free/projective group-completion proof in K.2:plus.
4. Give K.5 its real early ring/degree-zero-one and K.4 inputs, rather than
   unused broad K.3/H.5 dependencies or the late low-degree aggregator.
5. Recheck stage projection after application, including the early transfer
   and boundary consumers. The 467-node internal graph is already acyclic;
   current parents still induce K.6↔K.7 and
   K.3→K.5→K.6→K.7→K.3 cycles. Proposed parents do not apply these changes.

The next reviewer should keep the corrected one-step ambient-subobject
hypothesis distinct from ordinary resolving closure, and keep the support
space comparison distinct from the full stable fibre's negative groups.

## Next fix: N.7 generation (/11)

Read Zhang–Xu §§2–3 and expose the representative selection, equal-norm
ordering, Uₘ membership and finite data in Theorems 3.4/3.6. Obtain and
decompose the actual Skalba input, or independently validate a different
route. The old direct real-quadratic route at commit `52d782e2`, described
in the second fixes report, is an alternative to investigate, not an
accepted proof.

The norm diagnostic is `Norm(2)=16 < (25/16)·11`, with 2 inert in ℚ(ζ₅).
This refutes sufficiency of the stated bound alone; it does not assert that
a specified rounding algorithm selects 2. The Gaussian certificate and the
real-quadratic restriction/transfer reduction can be kept, but do not call
the latter a complete upper certificate before its cyclotomic generation
input is supplied. Birch–Tate supplies neither generation nor a lower bound.

## Next fix: generic complete-DVR supplier (/12 and /28)

Identify an exact supplier or route a Part II for arbitrary-residue complete
discrete valuation fields. It must export normalized extension valuations,
finite free integral-closure lattices, valuation/residue norm formulas and
componentwise finite-base-change length identities, including inseparable
residue fields. LocalFieldsRamification Layer 3's finite-residue local-field
scope does not cover `Q((t))→Q((s))`, `t=s²`. Do not narrow the intended
all-field Milnor theorem or duplicate an upstream toolkit in T.4. Keep the
pure-first finite-normalization and independent transfer decompositions.

## Supplier handoffs still requiring their own review

- /5, /33: move rational Hurewicz/Cartan–Serre to H.6 and update Borel
  consumers; retain homotopy associativity and the finite-type duality scope.
- /23: S.4 imports H.6's general exact couples, supplying only its geometric
  filtration and convergence adapters.
- /2: M.1/M.5d retain the requested naturality and Dedekind truncation form.
- /1, /7, /35: Borel's full coefficient/arithmetic-subgroup contract,
  degree-one separation and explicit ALS.5 import still need destination
  reconciliation.
- /17: S.2/S.5 import the ring P¹/Nil result before their scheme forms.
- /31, /37: Z.3's doubled-plane example and L.1's simple-space argument
  remain destination obligations.
- CFT6 must prove the character-evaluation identity used by T.7; Milne's
  III.3.6 states it and refers elsewhere for the proof.

K.6's Keller and finite-Artin K₃ source gaps, and the other older packet
gaps, remain outside this repair's certification. Restricted books were
not opened; their older source-issue records are historical evidence.
