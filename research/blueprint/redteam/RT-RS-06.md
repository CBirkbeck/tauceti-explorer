# RT-RS-06 — independent attack on the modular-curve, Serre and Faltings restructuring

Agent: Codex, session `codex-rtOQ9t`. Issue #4395. Inspected explorer
`4a5b1f9c820216a76cb6362fdf3fcea98a10999e`.
RS-06 was written by Codex `codex-a71f92` and reviewed by Claude Code
`cc-442dc5`; this worker did neither job.

One medium finding: one mixed source node needs a component-level migration.
The stage inventory, supplier forwarding, immutable inputs and tested graph
edges otherwise survived the attack. This is an audit of the restructuring,
not a fresh verification of every source proof or a claim of implementation.

## 1. A mixed Dickson/modularity/weight node is routed only to image classification

**Finding `RT-RS-06/1`, medium, missing.**

The source-node ledger in `research/blueprint/restructure/RS-06.md` sends
`ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
to `ArithmeticGaloisRepresentations:R01.4`, describing it as generic finite
image classification. Its gap table also sends `ClassicalSerreModularity:gaps[4]`
to that stage. The node's actual statement contains three different outputs:

| Source component | Actual output | Required disposition |
| --- | --- | --- |
| Dickson and KW I Lemma 6.1 | Classification and the characteristic-two solvable-image refinement | Early `R01.4` |
| KW I Lemma 6.2(i) | Dihedral residual modularity, including occurrence at the prescribed Serre weight and level | Soluble/dihedral modularity through `R17.5`/`R17.6`, with the refined weight/level conclusion through the applicable `R20` contracts, including the assigned Wiese input |
| KW I Lemma 6.2(ii), clarified by Dieulefait–Pacetti Lemma 1.14 | The bad-dihedral weight restriction in the normalized range | A named application after the `R01.4` image result and `R15.4` weight recipe; retain the corrected source/proof boundary there |

In the [author's KW I preprint](https://math.ucla.edu/~shekhar/papers/results.pdf),
printed/PDF p. 11, Lemma 6.2(i) says **“Then ρ̄ is modular.”** It then specifies
the weight and level. Its dyadic proof invokes Serre's method and Wiese's
theorem, rather than deriving modularity from Dickson. The same page's proof
of (ii) invokes the definition of the Serre weight. Independently reread
[Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2), pp. 8–9,
Lemma 1.14 and its proof: the inertia classification is followed by separate
niveau-one and niveau-two calculations with the weight recipe. Both page
images were checked.

This matches the full statement and hypotheses in the retained
[source node](https://github.com/CBirkbeck/tauceti-explorer/blob/4a5b1f9c820216a76cb6362fdf3fcea98a10999e/data/decompositions/ClassicalSerreModularity.json).
The source is not being corrected here. The defect is that the migration row
names only the classification owner for a node which also asserts modularity
and a weight calculation. `R01.4` owns residual images and oddness;
`R17.5`/`R17.6` already own the modularity constructions, and `R15.4` owns the
recipe. Sending the entire statement to the early classification stage either
assigns extra mathematics to the wrong owner or leaves its nonclassification
parts without an explicit migration.

The report's general instruction to preserve mixed nodes as source aliases is
good, but it still needs the named component owners for this particular row.
The report already gives such splits for the Böckle, Edixhoven, induction and
elliptic-isogeny nodes. General imports of Langlands–Tunnell or Wiese elsewhere
do not specify how this stable node and its incident source references split.

**Fix:** keep the stable source ID and every original statement, hypothesis,
source match, review note and incident link as an aggregation/source alias.
Add the three component routes above to this ledger row, retaining the
characteristic and normalized-weight hypotheses. Route the existing gap about
KW 6.2(ii) to the weight application as well as its image-theory input. Use
existing `R17`, `R20`, `R01.4` and `R15.4` owners; do not introduce another
modularity theorem inside `R01.4`. If the weight application needs a fine
substage, reserve it after its two suppliers. Do not add a reverse dependency
from completed modularity to the early image-classification package.

This is medium because the original source statement is retained and the
needed mathematics has existing owners. No actual cycle in the current result
is alleged; the missing split matters when the migration is applied.

## 2. Inventory and preservation checks

Read the eight member READMEs in full, the accepted result's 74 decisions and
88 ownership contracts, the family evidence, the report and its independent
review. Compared the member targets with reviewed AUDIT-08/09/10/11/13/31
coverage and the raw reviewed AUDIT-32/34 results for `R29` and `R20`;
those latter two families are absent from the generated coverage map.

| Check | Result |
| --- | --- |
| Native member stages | Exactly 74 decisions: 59 narrow, 15 keep; none dropped, moved or hidden |
| Ownership targets | 88 distinct target descriptions |
| Proposed link endpoint pairs | 595, all unique |
| Supplier to narrowed stage and every original immediate consumer | No missing forwarding edge, allowing an existing edge and omitting a self-edge |
| Family evidence | 106 records, 63 unordered pairs |
| Source-node migration ledger | Exactly 83 distinct existing IDs, no surplus or omission; 21 parent changes |
| Retained source material | 85 links, 36 coverage records, 37 gaps and 20 source records |
| Input fingerprints | All 17 SHA256 values in the report match |
| Both Tau Ceti anchors after isolated application | Same roadmap/stage content and ownership; only derived consumer lists change |

Eight family pairs are not contained in a single owner group. Read their
dispositions rather than treating that as automatic failure: metrized abelian
Hodge bundles versus the unmetrized elliptic line; finiteness versus Fontaine
and Schoof nonexistence; smooth elliptic versus generalized elliptic families;
affine cyclic/coarse objects versus compactified ones; and construction of
the twisted curve versus its still-missing connectedness theorem. These are
real mathematical distinctions, not omitted consolidations.

Checked all four source packets against their actual GitHub blob IDs at the
report's immutable reference `35e01e963a35d4ae713b71b9495df621cbb5fcf0`:

| Packet | Git blob ID |
| --- | --- |
| AlgebraicModularFormsAndSerreWeights | `5e54aa3ab385d7ae1969700a4c83701092224456` |
| ClassicalSerreModularity | `48555d2524d68cac16fa4456c98802693688097d` |
| EllipticCurveModularity | `7e4077eb86c2bb7a9df2cb065aa4d15e57db56e8` |
| FaltingsFinitenessAndIsogenyTheorems | `d6e481e4515d1ff30941d1c5d1dd7ebd3ce0ca5d` |

Each matches the inspected file. The old commit was unavailable in the local
shallow history; GitHub's contents API resolved the references successfully.
The links are not broken. Preserving their bytes proves record conservation,
not mathematical correctness of every sentence in those records.

## 3. Owners, consumers and proof order

Read the 41 nonmember campaign supplier-stage descriptions and all 26 original
external consumer-stage descriptions, plus the `ER.1` uniformization and
`GZ.8` parametrization uses. The new direct links supply `R01.5` finite-field
descent to `R19.1`, the actual `R29.5` map to `HE.1`, and the higher-weight
`R14.3` coefficient realization to `GH.0` and Kato `L1`. They retain the old
comparison inputs as well. No higher-weight Jacobian quotient is inferred.

Rebuilt the atlas in memory: 2,840 stages and 8,007 edges. Unioned its edges
with all accepted research restructuring/link edges and resolvable `requires`
entries, including proposals a build-time cycle filter might omit: 8,252
distinct edges. None of RS-06's resolvable proposed edges has a reverse path.
This does not establish that every unrelated component is acyclic or that
every prose dependency is encoded.

An isolated application adds 518 edges, from 3,508 to 4,026. Its 29 skipped
links all use explicit `UPSTREAM:` contracts. Those sources are available as
written contracts, not rendered graph vertices; this is not evidence that
their mathematics is already built. The proposal acknowledges this boundary.

Tested reverse-edge negative controls: `R13.4b→R12.3`, `R27.4→R20.6`,
`R28.5→R28.4` and `R29.5→R29.4` each close an existing forward path.
They are absent from the proposed links. Also inspected the explicit phase
requirements for the early good-dihedral prefix, the level-one corollary,
the two-stage KW induction, the Faltings closure/intersection repairs and the
generic versus rational-cusp Abel–Jacobi maps. Their fine-phase integration
has not been executed by this restructuring; the report says to reserve
substages where an importer cannot preserve those qualifications.

## 4. Mathematical attacks which did not produce another finding

- **Modular curves:** read anchor §§5B–5C and Layer 10's scope/construction.
  Ordered full bases retain determinant/pairing fibres; the anchor does not
  prove their connectedness. `R12.4` supplies the missing comparison. The
  compactification import stays restricted to prime `N≥5` diamond quotients
  over `Z[1/N]`; arbitrary-level and bad-level boundary work remains in `R13`.
- **Forms and coefficients:** read anchor Layer 8's integral-lattice/8W
  discussion, Layer 8G and 10A. Deligne–Serre Proposition 2.7 supplies the
  weight-one lattice; Lemme 6.11 is eigenvalue lifting with finite extension;
  Lemme 6.13 is semisimple finite-field descent. R15 does not promise that every
  weight-one Katz eigenform lifts at weight one. The geometric-to-analytic
  and integral-cohomology comparisons remain theorem obligations.
- **Faltings:** reread the whole one-page erratum and its page image. It
  requires two eventual-divisibility repairs and yields eventual stationarity,
  not equality to the initial height. The early polarized tower argument is
  separated from the late full-isogeny-class bound. Fixed-field Zarhin,
  principal polarization after extension and the quaternion construction are
  distinguished. General-normal-base extension, wild discriminant control,
  lattice finiteness, Torelli and the logarithmic-metric proof stay open.
- **Small ramification:** reread Schoof's first page, Theorems 1.1–1.3. The
  semistable excluded-prime set is exactly `{2,3,5,7,13}`. The prime-11
  classification and the separate potentially-semistable theorem cannot be
  substituted. Faltings finiteness does not imply these nonexistence results.
- **Elliptic modularity:** `End_Q(E)=Z` retains geometrically CM curves.
  Finite rational isogeny classes and rank-one Hom give finitely many prime
  isogeny degrees; odd-prime residual irreducibility then upgrades using
  oddness. The finite-newform selection, norm argument, coefficient-field
  rationality, exact conductor and all bad factors remain explicit. A divisor
  class does not stand in for the actual parametrization to the chosen curve.
- **Other mixed records:** the ledger explicitly qualifies Böckle's generic
  presentation versus auxiliary R=T/application, Edixhoven's recipe versus
  modular-weight minimality, KW's estimate versus Khare's different estimate,
  and `R29.4`'s local comparison versus `R29.5`'s actual isogeny. The modern
  lifting contract preserves the separate ordinary characteristic-three
  branch; it does not extend Pan's `p≥5` hypothesis to `p=3`.

## 5. Fresh source and library receipts

Selected passages were independently retrieved and read; no full-paper
re-extraction is claimed.

| Source | Read in this attack | SHA256 |
| --- | --- | --- |
| [Deligne–Serre, author-hosted scan](https://publications.ias.edu/sites/default/files/Number24.pdf) | Printed pp. 512, 522–523, Proposition 2.7 and Lemmes 6.11/6.13; images 522–523 | `2ace335e3c8cc08bb8b60d756886284c4e7aecf093081dda0de46650800e6986` |
| [Faltings erratum](https://link.springer.com/content/pdf/10.1007/BF01388572.pdf) | Entire one-page erratum, text and image | `e9d9269bf52151e3bc606f3b4f3581ef8bd0c2bafbc9dbdc4864b49a534a9734` |
| [Schoof](https://www.mat.uniroma2.it/~schoof/abvar1prime.pdf) | Printed p. 847, Theorems 1.1–1.3 | `0c44f6abd763759aaf0046e14dc054229293f440dca949e141e6adbfd3624691` |
| [Khare–Wintenberger I](https://math.ucla.edu/~shekhar/papers/results.pdf) | Preprint pp. 10–11, §6 opening and Lemmes 6.1/6.2; p. 11 image | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2) | pp. 8–9, Lemmes 1.13/1.14, proof and Remark 5; p. 9 image | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

Read the relevant statements directly at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: the multiplicity-weighted nonzero
product formula, `Height/Northcott.lean`'s scalar instance and projective TODO,
and the full `EllipticCurve/LFunction.lean` definitions of good, split/nonsplit
multiplicative and additive local factors, formal L-function and L-series.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
`Newforms/StrongMultiplicityOne.lean`, the relevant statements in
`Isogeny/Hom/Differential.lean` and `Isogeny/MulByInt/Degree.lean`, and
`WeilDivisor/AbelJacobi/Basic.lean`. Strong multiplicity one fixes level,
weight and nebentypus and requires good-index agreement; prime agreement
needs its coefficient-recurrence bridge. Degree `[n]=n²` requires ellipticity
and `n≠0`. Additive differential pullback and multiplication degrees do not
alone prove the rational endomorphism theorem. The Abel–Jacobi API inspected
here is the abstract divisor-class shadow, not the needed scheme morphism.

Read ArithmeticHeights scope and the relevant Layer 0 normalization and
Layer 1 projective Northcott contracts at PR287 head
`b8aec35b6cd8e68031df1038a2cae63088be4a17`; document SHA256
`33bbdec577f53f3b1b0332c2c4cb10463a8f8a01c8656724a438a98b60173e53`.
Read ComplexComparison scope, coefficients and Layers 7–12 at PR196 head
`4bd72379658126cbe9be935656396f0c9dac4de0`; document SHA256
`1c58d7db30b9acbe8656b29345d1c92cd334ef5b14cb35d644967b7adb96477c`.
The former does not supply metrized abelian Hodge geometry. The latter's
finite constructible ctf comparison does not supply coherent GAGA, an adic
inverse-limit comparison or stack/orbifold descent. RS-06 keeps those
additional requirements visible.

## 6. Reproduction and validation

The ownership finding can be reproduced without a PDF extractor:

```python
import json
from pathlib import Path
rid = "ClassicalSerreModularity"
sid = rid + ":R27.1/dickson-and-the-dyadic-solvable-refinement"
d = json.loads(Path("data/decompositions", rid + ".json").read_text())
n = next(n for n in d["nodes"] if n["id"] == sid)
print(n["statement"])
print(n["sources"])
for line in Path("research/blueprint/restructure/RS-06.md").read_text().splitlines():
    if sid in line or "ClassicalSerreModularity:gaps[4]" in line:
        print(line)
```

For the graph check, use `scripts.build.assemble(require_distances=False)[0]`,
union its stage edges with `links` from accepted research `RS-*.result.json`
and link-map files, then add `requires` entries resolving to stage IDs. For
each RS-06 edge `s→t`, breadth-first search from `t` to `s`. This includes
accepted proposal edges before any cycle-filtering interpretation. The source
ledger can be extracted from the report's backticked `node ID | destination`
rows and compared with the four packets' node-ID sets. Compare all 17 input
hashes, not just the four decomposition hashes.

Passed `scripts/check_restructure.py` on the accepted target,
`scripts/check_redteam.py` on this result, `research/blueprint/intake.py
check-files` on both deliverables, and `git diff --check`. Scratch graph and
conservation checks passed as recorded above. No Lean deliverable is required
or produced; no compilation, dependency build or language server was run.
