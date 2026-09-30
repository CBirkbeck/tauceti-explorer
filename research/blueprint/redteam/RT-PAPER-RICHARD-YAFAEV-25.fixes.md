# FIX-RT-PAPER-RICHARD-YAFAEV-25

Codex, session `codex-J6LwjP`, 30 September 2026. Refs #5007.
Both findings in the [verified red team](RT-PAPER-RICHARD-YAFAEV-25.review.json)
are addressed, including finding 2, which the generated issue body omitted.
This report and the two assigned extraction files are the entire change.

## Finding 1: uniform arithmetic refinements belong to the quantitative Part II

Items `PAPER-RICHARD-YAFAEV-25/11` and `/12` now have one Part II route to
`FaltingsFinitenessAndIsogenyTheoremsPartII`, with precisely the id, parent,
title and area of accepted `PAPER-TSIMERMAN-18` route 10. Their statements,
identities and missing statuses are preserved. The item-11 note makes explicit
the standing endomorphism-rationality context of Theorem 4.7. The Shimura
Part II imports the uniform theorem from this quantitative owner.

The replacement brief adds the arithmetic Masser–Wüstholz Theorems 1–2 and
Corollary 1, the finite-extension degree bound, and the number-field proof of
Richard–Yafaev Theorem 4.7: fixed-prime qualitative Faltings; finiteness of
bounded-index open subgroups of the compact Lie image; centralizer reduction
outside a finite set; large-prime semisimplicity, double centralizers and
Nakayama; and the finite product of exceptional-prime bounds. Noot
specialization and Serre independence are imported through the unchanged
R01.6 source route. The proof of Proposition 4.8 must retain the product of
single-prime-supported subgroups and the intersection/index comparison in the
same centralizer.

Accepted RS-06 retains qualitative semisimplicity and the integral End/Tate
comparison in R28.4. Its contract does not provide these uniform bounds.
The repair corrects an ownership inversion; the verifier did not establish
an actual cycle in a dependency graph. Likewise, Tsimerman's geometric
isogeny-degree bound does not by itself certify the missing arithmetic
comparison. The full Masser–Wüstholz chapter and the remaining proof inputs
are explicit acquisition/decomposition obligations of the quantitative
blueprint. Their proof closure is not claimed here.

**Handoff for the maintainer and PAPER-TSIMERMAN-18 route-10/design owner:**
coalesce this extraction's items 11–12 and new route-1 brief into the existing
`DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII` input. Preserve Tsimerman's
geometric bound, dimension-only constants, height/field-degree conditions,
Masser–Wüstholz *Factorization estimates* source work and CM consumer. Add the
arithmetic-refinement branch and its export to
`HeckeOrbitsAndAndrePinkZannier`. The shared proposed file remains
`TauCeti/AlgebraicGeometry/AbelianVariety/QuantitativeIsogeny.lean`.
No packet or roadmap definition for this candidate exists in the current
`packets/` or `roadmaps/` directories; this is a design handoff, not a claim
that a blueprint node has been installed. The other extraction is outside
this fix's assigned files.

## Finding 2: construct the valuation-ring criteria with their consumer

Removed the unsupported SF.0 source route. Item `/35` occurs once in the
Hecke-orbit Part II (now route 3), taking its total to 35 missing items. The
old brief's import of completed flatness/lifting criteria is replaced by
reuse of the generic scheme/morphism foundations and an explicit construction
before p-adic Kempf–Ness. The three clauses now state their hypotheses
separately:

- 7.13: a closed affine scheme of finite presentation over ℤ̄_p, with flatness
  asserted of its reduction. Retain all four equivalent conditions.
- 7.14: reduced affine finite-presentation source and target, with a flat
  morphism. Form the fibre, use flat base change and the flat-reduction step
  of Remark 7.6.1, then apply 7.13.
- 7.15: affine source and target, with an integral morphism. No reducedness
  or finite-presentation condition is added. Use integral closedness of
  ℤ̄_p in ℚ̄_p for the image of the integral algebra.

The 7.13 brief retains footnote 19's descent from the non-Noetherian base to
the integers of a finite extension of ℚ_p, the EGA IV 14.5.6/14.5.7 input and
base-change compatibility. The eventual blueprint must acquire these proofs,
separate the three proof nodes, and supply the reduction/point-functor API
and examples named in the brief. Suggested later file:
`TauCeti/AlgebraicGeometry/Shimura/HeckeOrbits/IntegralPointLifting.lean`.
There is currently no owning candidate packet to edit.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read:

- `AlgebraicGeometry.Flat`, `Flat.SpecMap_iff` and
  `Flat.isStableUnderBaseChange` in `Morphisms/Flat.lean`: flatness is a
  property of affine-local section maps, with the affine ring-map comparison
  and base-change stability already provided.
- `AlgebraicGeometry.IsIntegralHom` and `IsIntegralHom.SpecMap_iff` in
  `Morphisms/Integral.lean`: integral affine preimages and the exact integral
  ring-map comparison are supplied.
- `AlgebraicGeometry.ValuativeCriterion.Existence` in
  `ValuativeCriterion.lean`: existence of a lift of each valuation square
  whose upper point is over the fraction field. This definition does not
  assert the special-point lifting equivalence in 7.13–7.14.

These reusable foundations agree with reviewed SF.0 coverage and accepted
RS-25. They are not credited as implementations of item 35. No new carrier
or duplicate general morphism API is requested.

## Evidence, scope and validation

Re-read the accepted RS-06/RS-25 contracts, relevant atlas layers, reviewed
library-coverage entries and accepted Tsimerman route 10. Reacquired the
[published article](https://www.numdam.org/item/10.1007/s10240-025-00154-4.pdf)
on 30 September 2026: 83 pages, SHA-256
`3f3af58def7bb398b3d365ecf828a6571a9477fd7f2b7b891706f146fec05b9e`, matching
the original full-publication reading. Read pp.260–265 and 310–311 anew,
including page images 310–311. This selective audit does not claim to
have freshly read the entire article or the full Masser–Wüstholz chapter.

All 41 item IDs and statuses, items 11–12's statements, the Serre/Noot source
route, and source issues E1–E6 are preserved. The historical independent
review and its source-issue findings remain unchanged; the reader explicitly
distinguishes its old four-route acceptance from this three-route repair.
The unassigned review file is unchanged. The independent fix review must
assess the revised routes before their current numbering is treated as
accepted. This fix adds no source error and does not repeat the historical
correction-notice search.

Validation:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-RICHARD-YAFAEV-25.result.json`.
- `python3 research/blueprint/intake.py check-files` on all three deliverables.
- Structural comparison with the branch base: 41 IDs/statuses unchanged;
  all 39 missing items routed once (2 + 2 + 35); quantitative candidate
  metadata exactly matches Tsimerman route 10; source issues and the old
  independent review text preserved; pinned declaration names checked.
- `git diff --cached --check`.

No Lean file is an assigned deliverable and none was compiled. The change
is a complete extraction-routing repair, not a completed Lean proof or a
claim of closed blueprint dependencies.
