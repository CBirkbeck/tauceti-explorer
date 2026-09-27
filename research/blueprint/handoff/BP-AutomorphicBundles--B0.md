# Handoff: BP-AutomorphicBundles--B0

ChatGPT Pro — `gpt-20260927-c8f42a`, 27 September 2026. Refs #680. Claim comment 5857172459; winning bot reply 5857173608. The issue was reread after confirmation. **Partial prototype-and-document checkpoint; no geometric stage is closed.**

## Deliverables and counts

Added the suggested Lean file and a matching mathematical document for the B4 left/right convention slice, together with this handoff. The prototype constructs a value of Mathlib's existing `SlashAction` from a normalized linear-automorphism cocycle; its actual map is explicit. It does not introduce a second slash-action carrier or a postulated geometric bundle.

There are **five declaration-sized proposals: one construction and four lemma leaves**, plus three further API lemmas. The construction's **five API entries** include two of those four promoted leaves, so they must not be double-counted as new nodes. There are **eight typed acceptance examples**. Five private helper definitions supply concrete coefficients and counterexamples, not new roadmap objects. Ten explicit baseline checks name declarations whose statements were read at the pin.

**No JSON packet was written.** Registered packet nodes, API records, definition-test records, planets and supplier requests are therefore all zero in this checkpoint. The accepted integrated decomposition is unchanged: its three aggregate nodes are not replaced by these five proposals. The part remains incomplete, and the deliverable must not be marked ready for independent blueprint review.

Scope remains exactly `AutomorphicBundles:B0`, `B1`, `B1.general`, `B2`, `B2.general`, `B3`, `B3.general`, and `B4`. No B5 file was changed.

## Mathematical content

The proposed adapter takes J(k,g,x) in the existing linear-automorphism group, with J(k,1,x)=1 and J(k,gh,x)=J(k,g,hx) J(k,h,x), and sets T(k,g)f(x)=J(k,g,x) inverse applied to f(gx). Inverting the cocycle gives the correct right slash law T(k,gh)=T(k,h) composed with T(k,g). The prototype fixes Mathlib's reverse `LinearEquiv.trans` argument convention explicitly.

The four leaves expose evaluation, invariance versus the original transformation law, the coefficient law for the distinct right base action x·g=g⁻¹x, and scalar cancellation when deriving a cocycle from a nonzero section value. The latter prevents the claim that the zero section forces a cocycle.

The tests cover trivial and point-dependent coefficients, the zero function, two noncommuting rational shears, the inverse factor, the actual SL₂(ℤ) Mathlib slash comparison, a normalized nonzero C₂ factor which transforms zero but is not a cocycle, and the semilinear boundary for full GL₂(ℝ). The final comparison is deliberately not asserted to come from the ℂ-linear adapter when determinants are negative.

This is functional algebra. It does not prove descent of a bundle, construction of the canonical torsor, local freeness on a coarse quotient, holomorphy, growth at cusps, or any geometric comparison. Generic associated bundles remain the designated supplier's responsibility.

## Checks actually executed

**Lean compilation: not run.** All new theorem/test proof placeholders remain unproved, including the proof fields needed by the explicit adapter. The signatures have been checked against the cited source declarations by reading, but this is not an elaboration result. No implementation claim is made.

**Blueprint validator: not run locally.** There is no new JSON packet to validate. No fresh declaration-index or global dependency-graph validation is claimed. The Swarm intake check is not a Lean compiler; passing intake for these three files must not be reported as verification of a packet or of the example proofs.

**Finite sanity checks: passed.** For G=GL₂(𝔽₃), X=𝔽₃², the two families tested were J(g,x)=g and J(g,x)=u(gx)u(x)⁻¹, with u(a,b)=[[1,a],[0,1]] [[1,0],[b,1]]. All 48 group elements, 9 base points, every ordered pair g,h, and every one of the 9 possible function values at ghx were enumerated. Counts across the two families:

- 41,472 left cocycle checks;
- 41,472 inverse-base/right-cocycle checks;
- 373,248 pointwise slash-composition checks;
- 14,904 detected failures of the unshifted cocycle variant;
- 222,912 detected failures of the wrong inverse-factor order;
- 222,912 detected failures of the operator variant omitting inverses.

The three displayed rational shear values and the normalized C₂ counterexample were checked separately with exact arithmetic. These are sanity checks for selected concrete families, not a proof for all cocycles or an execution of the Lean examples. The GL₂(𝔽₃) checks are reproduced by the following standalone Python code; no third-party package is needed.

```python
from itertools import product

p = 3
one = (1, 0, 0, 1)

def mul(a, b):
    return ((a[0]*b[0]+a[1]*b[2])%p, (a[0]*b[1]+a[1]*b[3])%p,
            (a[2]*b[0]+a[3]*b[2])%p, (a[2]*b[1]+a[3]*b[3])%p)

def inv(a):
    d = pow((a[0]*a[3]-a[1]*a[2])%p, -1, p)
    return tuple(d*z%p for z in (a[3], -a[1], -a[2], a[0]))

def act(a, x):
    return ((a[0]*x[0]+a[1]*x[1])%p, (a[2]*x[0]+a[3]*x[1])%p)

G = [a for a in product(range(p), repeat=4) if (a[0]*a[3]-a[1]*a[2])%p]
X = list(product(range(p), repeat=2))

def u(x):
    return mul((1,x[0],0,1), (1,0,x[1],1))

def frame(g, x):
    return mul(u(act(g,x)), inv(u(x)))

def representation(g, x):
    return g

counts = [0] * 6
for J in (frame, representation):
    assert all(J(one,x) == one for x in X)
    for g,h,x in product(G,G,X):
        gh = mul(g,h)
        assert J(gh,x) == mul(J(g,act(h,x)), J(h,x))
        counts[0] += 1
        assert J(inv(gh),x) == mul(J(inv(h),act(inv(g),x)), J(inv(g),x))
        counts[1] += 1
        counts[3] += J(gh,x) != mul(J(g,x), J(h,x))
        for v in X:
            left = act(inv(J(gh,x)),v)
            assert left == act(inv(J(h,x)), act(inv(J(g,act(h,x))),v))
            counts[2] += 1
            counts[4] += left != act(inv(J(g,act(h,x))), act(inv(J(h,x)),v))
            counts[5] += act(J(gh,x),v) != act(J(h,x),act(J(g,act(h,x)),v))
assert len(G) == 48 and len(X) == 9
assert counts == [41472, 41472, 373248, 14904, 222912, 222912]
print(counts)
```

## Evidence and source status

The campaign document was read in full. Its blob was `88a62acba868ce0fe7c09ccd2bd6dd9fe7983176`. The accepted integrated decomposition at blob `701f577f1d4f99bd425b8d2493ce6c6ffb716990` was read for its three targets, coverage and review; some of the long aggregate-node text was truncated by the reader. It remains an input requiring complete rereading when the packet is assembled.

The relevant AUDIT-13 entries were read from `research/blueprint/audit/AUDIT-13.result.json`, blob `3d64f2dd7d5dcdb228f3db06088b7f79f1b3163e`. The accepted review in `research/blueprint/reviews/REV-AUDIT-13.md` was also read, including its corrections of the slash-action and private-declaration citations. The whole large `data/library-coverage.json` was not downloaded or searched locally. No complete sweep of every atlas link or reserved identifier is claimed; those checks remain required before packet integration and ownership requests.

At the pinned Mathlib commit, actual definitions and proofs were read in:

- `Mathlib/NumberTheory/ModularForms/SlashActions.lean`, lines 1–210, blob `3c085f78c1b970786e5f3f922ec4673bcf35a026`;
- `Mathlib/Algebra/Module/Equiv/Defs.lean`, lines 270–575, blob `14a412f258926e23c5df61bea11e0afc254aaa83`;
- `Mathlib/Algebra/Module/Equiv/Basic.lean`, lines 1–130, blob `9c54387d3cbce50725b34efe18e010eee528c846`.

The ten named baseline checks are `SlashAction`, `SlashAction.slash_mul`, `ModularForm.SL_slash_apply`, `ModularForm.slash_action_eq'_iff`, `ModularForm.smul_slash`, `LinearEquiv.trans`, `LinearEquiv.trans_symm`, `LinearEquiv.symm_apply_eq`, `LinearEquiv.automorphismGroup`, and `LinearEquiv.applyDistribMulAction`. No new Tau Ceti baseline declaration is claimed; Tau Ceti's pin is retained as the programme baseline.

Lan's *An Example-Based Introduction to Shimura Varieties*, §4.2.7, printed pp. 49–50, was read from https://www.kwlan.org/articles/intro-sh-ex.pdf on 27 September 2026, including successful visual inspection of both page images. The omitted shifted argument in the printed cocycle is the existing reviewed finding, not a newly discovered error. The general vector-valued adapter and the section-cancellation guard are explicit deductions from the convention and existing algebraic operations.

No fresh SHA-256 of the downloaded source was computed. The legacy digest in the integrated decomposition is historical evidence, not a fresh verification by this worker. Milne 1990, Harris's extension constructions, Deligne's connection theorem and the HLTT source were not freshly read in this checkpoint. Thus the roadmap's full source coverage is not achieved. Introductory, convention and interface sections of the upstream ModularForms and ModularCurves roadmaps were read for carrier and dependency discipline, not their entire mathematical developments.

## Exact continuation

1. Compile the suggested file at the pins, without replacing actual coefficient maps by opaque assumptions. Repair any elaboration errors. The three individual modules cited above are the source receipts; current documentation is not a substitute for the pin.
2. Read the remaining complete integrated nodes and prepare the JSON packet with the exact eight-stage scope and part B0. Preserve and refine the legacy IDs `AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, and `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`. Do not discard their growth, geometric weight or extension content because the new prototype treats only action algebra.
3. Register the five declaration-sized proposals with the exact hypotheses, API, tests and proof outlines in the document. Check the reserved IDs, all relevant atlas links and neighboring packets before assigning final new suffixes or recording suppliers. The existing scalar cocycle, scalar slash law and analytic form carriers stay baseline citations, never new nodes.
4. Obtain and decompose the geometric source constructions for B0–B3 and the three general-data interfaces. Use the associated-bundle supplier rather than rebuilding it. Make the coefficient field, ineffective central subgroup, Hodge versus opposite-Hodge–Tate parabolic, and locally-free versus coherent distinctions explicit. No geometric stage may be called closed by reference to C1–L4.
5. Finish B4's actual geometric/analytic form comparisons, including holomorphy, growth, cusp conditions and the GL₂, Hilbert, Siegel and unitary tests. Retain the linear-versus-semilinear boundary of the current prototype.
6. Synchronize packet, document and prototype; run the complete packet validator, declaration checks and dependency checks. Register appropriate named planets only with the actual packet. No gap or request has been silently discharged here.

This checkpoint changes only the two issue deliverables and this handoff. It leaves the packet, integrated decomposition, B5 work, queue and ownership data untouched.
