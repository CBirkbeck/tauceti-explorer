# BP-RankZeroOneBSD--BSD.8

Completed target-level planning pass by **Codex — codex-2kqOKc**, for issue
#10920. The bot confirmed the claim made in comment 6268097048. The branch
is `codex-2kqOKc-bsd8`.

## Scope and result

The live issue header and queue give **BSD.8 only**. The embedded older
prompt also lists BSD.9, which has its own job, #10921. This pass follows
the live scope and changes only the three named deliverables and this note.
RS-30's accepted ownership and title are retained. No roadmap, layer or
notion moves between owners in this pass.

The packet is `complete`, and `RankZeroOneBSD:BSD.8` has coverage `planned`.
This means every target is specified with dependencies and explicit
arithmetic obligations; it does not mean the mathematics is formalised or
the stage is closed. All node implementation statuses remain `unchecked`.

There are **14 new nodes**: 3 definitions, 6 theorems, 4 comparisons and
1 construction; **30 API items**, **18 definition/construction tests**,
**13 baseline references**, **2 recorded gaps** and **3 supplier requests**.
The one new planet, Certified primary descent, combines with the
predecessor's five BSD.8 planets to give six.

The accepted `RankZeroOneBSD--BSD.7.json` already provides the rational
prime-support/certificate core and full elliptic endpoints. Its 23 BSD.8
node IDs are listed in this packet's `inherited` field. They are imported,
not repeated. The new nodes refine their arithmetic producers:

- An actual finite Selmer equivalence, exact torsion model and independently
  proved primary exponent give the whole primary Sha order by an exact
  Kummer quotient. Natural division is proved exact.
- A zero first Sha layer kills the whole primary subgroup without requiring
  a separate exponent; a nonzero layer alone does not determine its order.
- A verified whole-Sha annihilator selects the exact finite descent levels;
  the primary product uses the pinned existing Tau Ceti decomposition.
- A complete bounded rank-one search proves primitivity and the actual
  regulator. Free and full Mordell–Weil indices remain distinct.
- Correct Tate traces cover every discriminant divisor, including the
  residue-characteristic-specific branches. Exact period, height and
  point-index changes precede comparison with the actual BSD.5 defect.
- The identified rational ledger supplies exceptional valuations and a
  finite support cover. Existing reconstruction proves the full formula
  only after all required prime proofs have been supplied.

## What remains

1. **Evaluated nontrivial-primary input.** To instantiate a certificate at
   a chosen prime with nonzero first Sha layer, obtain an evaluated
   exponent/annihilator over ℚ or an equally strong proved exact order
   bound. The HE.7 exceptional-primary bound has its own quadratic-field,
   quotient, CM-point and integral error-constant hypotheses. Evaluate
   them and prove the field comparison, retaining the dyadic kernel.
   Finiteness or an unspecified constant is insufficient. The zero-layer
   shortcut avoids this obligation at a prime where it applies.
2. **Inherited dyadic quadratic comparison.** The BSD.0 packet leaves the
   explicit dyadic period exponent and ramified/dyadic Tamagawa comparison
   in BSD.1 and BSD.5 open. When using that route to obtain the exact
   normalized leading quotient, supply its minimal-differential lattice
   index, real-component factor and all local corrections. The new
   transport theorem consumes those values; it does not establish them.
   A direct exact quotient over ℚ avoids that route.
3. **Concrete instances belong to BSD.9.** Supply the actual finite Selmer
   equivalences, whole-Sha proofs, exact torsion, local traces, finite
   saturation searches and exact normalized leading quotients for that
   job's fixtures. The scalar examples here do not certify a curve. No
   predicted analytic-Sha database entry is an input.

The three requests import EllipticCurves Layers **4**, **6**, **7**:
local trace correctness; actual Mordell–Weil/torsion/rank interfaces; and
actual Selmer/Sha, finite Selmer and Kummer exactness for m≥2. General
isogeny/Cassels theory remains there and in BSD.5. ArithmeticGaloisDuality's
role is inherited through the accepted Selmer-cardinality adapter; no
additional duality theorem is replanned.

## Source and baseline receipts

Read Cremona, *Algorithms for Modular Elliptic Curves*, corrected online
second edition, Chapter III: §3.2 pp.64–68; §3.3 p.69; §3.5 pp.75–78,
including Proposition 3.5.1 and footnote 3; §3.6 pp.90–91. The public source
URL, access date and SHA-256 are in the packet and reader. It was used for
local traces, finite point search and the exact first 2-Selmer quotient,
not for a universal evaluated whole-Sha bound. All repository statements
are in our own words. No source file or extracted passage is included.

Read the accepted predecessor and its independent review; the BSD.5 actual
defect/rationality/index/isogeny nodes; the GZ.0 height dictionary; and the
HE.7 supplier statements. The routed sources for other BSD layers are
retained with their owners, not claimed newly read or newly proved here.
No restricted book was needed. No source error is newly asserted.

Pinned statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The additive primary-component
names are generated by the indexed multiplicative declarations; both
additive signatures were independently confirmed by pinned elaboration.
The packet cites the indexed source declarations so the checker resolves
them without an index modification.

Inspected current read-only TauCetiRoadmap (checkout
`0d144d044dacebca17b654695b6f1ad58f159b27`) and current Tau Ceti
(`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`). Read the relevant
EllipticCurves/ModularForms documents and searched the nine post-snapshot
roadmaps' suggested files, including the primitive-embedding material in
IntegralLattices. No existing generic theory is added here. In particular,
the finite primary decomposition already exists at the pins and is a
baseline import. No build was run in either read-only checkout.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.8.json`:
  **0 errors, 0 warnings**, using the existing pinned declaration index.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/RankZeroOneBSD--BSD.8.lean`:
  passed; the only new definition has its actual arithmetic body.
- Intake file/path checks and JSON validation: passed for all four files.
- Packet/reader inventory, light API agreement and cumulative planet count:
  checked. Traversing concrete prerequisite IDs through the existing
  packets reached 6,527 nodes and found no dependency cycle.
- `lean-check research/blueprint/suggested/RankZeroOneBSD--BSD.8.lean`:
  **elaborated successfully at both pins**, with only the expected
  proof-placeholder warnings. Memory was checked before compilation.
  The file has 186 lines and no constructed arithmetic theory or
  unfinished data definition. No Lean process remains running.

The fixed WORKERS shape keeps heavy carriers as definitive README targets.
The suggested file explicitly names the omitted actual arithmetic targets
and contains only light rational arithmetic, genuine additive-group end
statements, real-scalar transport and examples. Elaboration does not
validate a Selmer computation or prove a curve's BSD formula.

The next action is independent review of this completed pass, with attention
to primary exponent evidence, exact dyadic inputs and the ownership of
concrete fixture work. This worker takes no second job.
