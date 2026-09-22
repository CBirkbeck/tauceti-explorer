# PAPER-HACON-WITASZEK-23 handoff

Third checkpoint · issue #1369 · Codex codex-c83e7a · 2026-09-22.
Prior merged checkpoints: #1682 codex-a71f92, #1838 cc-fb70e5.

## Saved work

163 items: 10 library, 5 planned, 148 missing. Nine unchanged routes cover all
missing items once. All 46 definitions/constructions have APIs, uses and three
planning tests. Eleven source findings await independent review. Status partial;
no Lean deliverable or compilation.

All 35 published pages have been read again, with every proof/reference and
images pp.13,17,20,29,30,33 checked. Exact public PDF hash is preserved. dFH11 v3
pp.4–7 and the full Stacks 0D3A proof were read. Do not restart as an unread paper.

## New proof results to preserve

E6: the unrestricted global Lemma 6.6 and Corollary 6.7(1) Q-factorial implication
fail. Remove only the special vertex from Spec Z_p[x,y,z,w]/(xy−zw). The
special fibre is smooth; the remaining generic vertex is closed and disjoint
from it. D=V(x,z) is Cartier off that vertex but not Q-Cartier there. The report
gives the small-resolution charts; its strict-transform line bundle has degree−1
on the exceptional P¹, so no positive Cartier multiple can exist.

The projective application has a proved repair: a nonempty closed subset of a
proper scheme over a local base meets the closed fibre. Union the Q-Cartier
neighborhoods and apply this fact; quasi-compactness then gives a common
multiple. `qcartier-global` now states this conditional theorem and has no
remaining gap. Consumers separately depend on `qcartier-local`, which is still
open. Check finite generation/vanishing before applying Nakayama to dFH's
local-cohomology module; do not assert characteristic transfer by inspection.

E7: N¹ surjectivity does not give prescribed Cartier restrictions. The new
special-ampleness, special-nef/big and primitive-section adapters construct
an effective numerical perturbation without completeness or H²=0. A primitive
section of the finite torsion-free DVR module H⁰(T,L) has nonzero special
restriction. The resulting boundary has the needed degree on the flopping ray.
This does NOT yet prove the boundary-pair lifted-step identification or
numerical descent/persistence; `gap-picard` remains open with that narrower
frontier. Positivity and coherent finiteness/base-change imports need exact
supplying nodes too.

E8–E11 record the second c_2 sign slip, codimension-one smallness, the resolution
Y in the trace formula and exclusion of H⁰ from the slope≥1 assertion. E1–E5
and the corrected fixed-coefficient surface argument are retained. These are
worker findings, not review verdicts; no authors were contacted.

## Resume

Follow WORKERS, claim afresh, reread latest files and refresh input hashes.
Continue one coherent path among:

- Local mixed-characteristic Q-Cartier deformation, with valid local-cohomology
  finiteness; the global properness argument is already finished.
- The perturbed lifted-step proof and numerical descent after a flop; the
  effective-boundary construction is already explicit.
- General log-index surface classification or AHK difficulty characteristic
  transfer; do not reopen the fixed-coefficient Lemma 2.16 issue.
- Exact lower-threefold MMP suppliers, stable-section/Bhatt/Popescu/duality
  leaves, §5 dlt perturbation and N¹-generation, or singular Witt suppliers.

Preserve SchemeAndStackFoundationsMixedCharacteristicPositivity and
NumericalPicardAndContractionDescent as shared pending proposals. Preserve the
birational and singular-Witt Part II boundaries; do not duplicate generic
properness, divisors, Picard, local cohomology or Witt carriers.

## Checks

Paper/intake checks and custom ID/dependency/DAG/route/API/use/test/gap checks
passed. Exact 2061-case algebraic diagnostics passed. All 138 planning tests
remain unexecuted in Lean. Submit only the result, report and this handoff;
never merge/close/relabel manually or unclaim submitted work.
