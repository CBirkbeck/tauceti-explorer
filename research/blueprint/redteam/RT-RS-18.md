# RT-RS-18 — algebraic K-theory restructuring

Codex, session `codex-J6LwjP`, 30 September 2026. Refs #4408.
Inspected repository base `d4afbc9`.

**Complete; no supported findings.** The proposal preserves the member targets,
separates the overlapping constructions, and forwards the relevant prerequisites.
This conclusion concerns RS-18's restructuring. It does not certify that the
subsequent blueprints have closed their source or proof gaps.

RS-18 was written by codex-a71f92 and reviewed by cc-442dc5; I did neither job.
I previously red-teamed the GrothendieckEulerForms link map. Here I checked the
upstream contracts and pinned statements afresh rather than relying on my earlier
verdict. The accepted research result equals its promoted copy in `data/restructure`.

## Target preservation

Read all three member documents, their extracted stage descriptions and the
accepted proposal/review. All 36 original stages occur exactly once in the result:
18 narrowings, 18 keeps, no dropped or moved stages. All nine KU stages remain
readiness aggregations.

| Member targets | Check against retained scope and suppliers |
| --- | --- |
| E.1 | ModularCurves supplies the Weierstrass scheme, points and group law; AlgebraicCurves supplies the general function-field dictionary. The zero map and compatibility with the actual K-theory carriers remain. |
| E.2 | Z.5 supplies general curve rank/determinant. E.2 retains the rational-origin elliptic assembly, descent and tensor multiplication. |
| E.3 | S.3 supplies localization. Every term from K3 through K0, all residue fields, norms, ramification and the different integral/rational injectivity statements remain. |
| E.4 | Ordinary coniveau comes from S.4, higher operations from S.6, motivic layers/convergence from M.6a/b. The constant-unit splitting, curve SK1 and left K3 filtration term remain. |
| E.5 | S.2 supplies maps and S.5 projective bundles. The actual `[f_*O]` computation, Z.6 basis comparison and the full finite-curve theorem remain. |
| E.6 | Local DVR geometry comes from StableReduction; global arithmetic-base construction and gluing remain here. S.3/S.5 supply K-theory formulas, while rational integral images, vertical conditions and model independence remain. |
| E.7–E.8 | Existing torsion-divisor functions are imported. Corrections, finite certificates, vertical tests, rational lifting and transfer/descent remain, together with all three completion examples. |
| Z.1–Z.2 | Existing categorical K0 and projective exact structures are imported. Explicit idempotent/stable presentations, virtual rank, general-ring maps and disconnected/local tests remain. |
| Z.3–Z.4 | Early ring tensor/lambda/determinant and gamma normalization stay here, as do Steinitz, the zero case, ideal representatives and norm-compatible S-integer maps. |
| Z.5 | General regular-curve rank/determinant stays here, including additional dictionary/resolution work outside the narrower smooth/proper suppliers. The elliptic specialization moves to E.2. |
| Z.6 | Imports the early ring pi0 comparison, Cartan and projective-bundle results. Retains map compatibility, Euler classes and the concrete ring/ideal/elliptic/P1 tests. |
| U.1–U.4 | Stable matrices, arbitrary-ring Whitehead identities, automorphism classes, determinant/SK1 and the source-qualified arithmetic theorem remain. Finite-rank field/integer lemmas do not replace them. |
| U.5–U.6 | K.5 supplies relative homotopy fibres and S.3 the DVR boundary. Explicit relative groups, the preceding K2 term, transfers, norm/projection formulas, loop comparison and all tests remain. |
| S.1–S.2 | E1's generic enhancement and P7's complete-local input do not remove arbitrary affine/global perfection. Scheme K/G functors, Cartan and their exact hypotheses remain. |
| S.3–S.4 | Classical tame-symbol formulas are imported. Scheme support/localization, codimension-two terms, descent, ordinary coniveau and qualified Gersten targets remain. |
| S.5 | K.6 supplies the ring fundamental theorem. The geometric extension, projective-bundle/blow-up formulas, singular Nil terms and K-versus-KH distinction remain. |
| S.6–S.7 | K.7 and Z.3 supply earlier products/normalizations; SF.5 supplies geometric intersection theory within its source scope. Higher operations and the actual K/G realization, denominators and pushforward comparisons remain. |

Every acceptance test in the original documents remains within a kept or residual
contract. A supplier having a narrower hypothesis set never serves as an excuse to
delete the extra target: the proposal expressly retains those additional proofs.

## Ownership checks

The family has 26 evidence records, representing 13 unordered pairs. Each pair
occurs in an ownership group. Read all 41 groups, all 28 external stage contracts
used as suppliers/owners, and GrothendieckEulerForms Layer 3 used by a further link.

The distinctions most likely to hide a duplication or lost target check out:

- General curve rank/determinant is Z.5; the elliptic origin-dependent formula is
  E.2. Function-field divisor classes still require the scheme Picard comparison.
- S.3 constructs scheme support localization; E.3 specializes its full curve
  sequence and proves arithmetic injectivity consequences. U.5 compares explicit
  matrices with the DVR boundary.
- S.5 proves projective bundles and geometric blow-up formulas; Z.6 computes the
  two degree-zero P1 bases and E.5 uses the result. E.6 proves the arithmetic
  integral-image application.
- Ring K0 operations precede genuinely higher operations. S.4's ordinary
  codimension filtration is distinct from M.6a's moving/layer-cycle theorem;
  M.6b supplies convergence and filtered-operation compatibility.
- P7 is restricted to complete Noetherian local coefficients. S.1 retains the
  arbitrary-affine and global assertions. StableReduction's DVR contracts leave
  global arithmetic-model work in E.6.

Also read the 60 duplicate records across the 27 native reviewed-audit entries
(136 targets). Eighteen records do not literally share one of the proposal's
`formerly` groups. They do not yield an additional supported defect:

| Remaining lead | Why it is not an unresolved duplicate construction in RS-18 |
| --- | --- |
| E.1 versus the ModularCurves parent layer | The proposal uses the precise 1A/1B/1D child suppliers. |
| U.4/Z.4 versus N.1; Z.4 versus N.2 | N.1 explicitly imports the arithmetic groups; N.2 derives the same low-degree sequence as a compatibility/application of localization. |
| U.6 versus K.2:low-degree-comparisons | The explicit link makes the latter an assembly importing U.6. |
| Z.6 versus K.2:plus | The link explicitly imports the early pi0 comparison into the later naturality/tests stage. |
| Z.2/Z.3 versus K.7 | Early rank/product and degree-zero tensor constructions remain inputs to the higher comparison. |
| Z.2/U.6 versus L.1; Z.6/U.6 versus N.8 | Finite-field recovery and arithmetic worked examples compare the same lower groups; they are not replacement owners of the general construction. |
| S.3 versus K.3/K.6 | Exact-category/nonconnective localization is imported and compared with scheme supports. |
| S.4/S.6 versus M.6a/b | Ordinary versus homotopy coniveau, and operations versus filtered compatibility, have distinct retained outputs. |
| S.7 versus Jacobian B/EDC.3 | Curve coherent Riemann–Roch and geometric etale realization are not the same construction as the K/G-to-Chow comparison. |

Inspected the eight current member-touching link records. They corroborate the
same scheme/function-field, categorical-K0 and arithmetic-source interfaces;
they do not override the source-qualified scope in the proposal.

## Pinned library checks

Read these actual statements, their surrounding variables and the pertinent
proofs at the required pins, rather than relying on declaration names:

| File | Result and boundary checked |
| --- | --- |
| [Mathlib FreeLocus.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean#L181) | `Module.rankAtStalk` is natural-valued; local constancy assumes finite presentation and flatness. Virtual K0 rank is still a comparison/construction. |
| [Tau Ceti CartanMap.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/CartanMap.lean#L195) | The finite-projective exact structure and its equality with the split structure are available over a ring. |
| [DivisorClass.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/DivisorClass.lean#L79) | The point equivalence targets the kernel of the function-field divisor degree; the coordinate-ring Dedekind and decidable-equality assumptions are explicit. |
| [Splitting.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Degree/Splitting.lean#L227) | The class-group splitting assumes principal weighted degree zero and a weight-one point. |
| [TorsionDivisor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean#L42) | A nonsingular affine n-torsion point supplies a function-field unit with the required principal divisor. This is not a Bloch correction or vertical certificate. |

The rest of the reviewed audit is inherited evidence, not a claim to have freshly
re-audited both libraries. No negative search result is used to declare a new gap.

## Public mathematical source checks

Read Weibel's public author chapters on 30 September 2026:

- [Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf),
  Theorem 1.5 and proof, Variant 1.5.3, Theorem 3.7.2, Corollary 3.7.3 and proof,
  and 6.12–6.12.1. These support the separation of projective-bundle construction,
  class-valued projection, and closed-point localization/transfer. The change
  from vector bundles to perfect complexes carries hypotheses and is retained.
- [Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
  Theorem 6.1 with proof, Theorem 6.4 with proof and 6.5–6.7. The finite-curve
  calculation requires finite generation, p-divisibility and cohomological/
  Frobenius inputs. It is correctly left as substantive E.5 work.

Downloaded chapter hashes:

```text
V   52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8
VI  efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1
```

I did not newly read all of Bloch, Thomason–Trobaugh, Bass–Milnor–Serre or the
arithmetic-surface literature. Their unresolved proof/source work is already
retained by the proposal; a restructuring does not certify those proofs.

## Dependency and application reproduction

Constructed edge sets directly from `data/atlas.json` and RS-18. The atlas's
`requires` fields give the same edges, so there is no additional hidden field-level
prerequisite in this snapshot. For every newly added edge, searched the combined
graph for a path from its target back to its source: none exists. For every
narrowed stage and each original immediate consumer, checked every `suppliedBy`
endpoint has a direct existing/proposed forwarding edge, excluding self-links.

| Check | Result |
| --- | --- |
| Member stages | 36; no missing or extra entries |
| Proposal endpoint pairs | 223 distinct; all resolve |
| New endpoint pairs | 220 |
| Missing forwarding pairs | 0 |
| New-edge reverse paths | 0 |
| Original external edges | 34, to 27 stages in nine roadmaps |
| Native audit statuses | 19 not built, 7 partly built, 1 process |
| Reserved member-node IDs | 0 |

Read the 27 consumer contracts, including their KU aggregations. Arithmetic
norm/transfer, rational regulator lifts, vertical integral-image requirements,
motivic comparisons and matrix interfaces remain available. In particular:

- Z.5's `suppliedBy` entry for E.2 is explicitly a relocated late export. Its
  links go to Z.6 and KU-operations; no E.2-to-Z.5 reverse path exists.
- There is no Z.6-to-S.5 or S.6-to-Z.3 reverse path. The explicit early/late K0
  and K1 handoffs do not force early constructions to depend on their comparisons.

Ran the actual `scripts/restructure.py` application in memory with
`load_accepted(Path.cwd())`: 27 accepted proposals. RS-18 adds all 220 new links
and skips none in normal order, and again when moved to the end. No upstream
stage title, description, owner or restructuring field changes. The input
snapshot is not mutated; no live atlas file was written. Extension titles match
their upstream base titles and the corresponding base-roadmap edges are added.

The application can be reproduced without writing generated data:

```python
import json, sys
from pathlib import Path
sys.path.insert(0, 'scripts')
from restructure import load_accepted, apply_restructurings
a = json.loads(Path('data/atlas.json').read_text())
ps = load_accepted(Path.cwd())
p = next(x for x in ps if x['family'] == 'RS-18')
for order in (ps, [x for x in ps if x is not p] + [p]):
    b, _ = apply_restructurings(a, order)
    r = next(x for x in b['restructurings'] if x['proposal'] == 'RS-18')
    assert r['links'] == 220 and r['skippedLinks'] == []
```

## Later packets and validation

The proposal's historical statement about the absence of integrated decompositions
is not a promise that no later work exists. Current E and S packets are partial,
with 52 and 247 nodes. Examined their coverage and the import/comparison interfaces
relevant here; did not red-team every node. No KTheoryLowDegrees packet or member
reserved IDs exist, and no integrated member decomposition requires relocation.

`check_restructure.py` accepts the reviewed proposal. `check_redteam.py` accepts
this result; `intake.py check-files` accepts the two deliverables, and staged
`git diff --check` is clean. No Lean file was changed or compiled; no existing
build at both pins was available and none was installed. The report and result
are the only submitted files.
