# REV-RS-20~3 — third independent restructuring review

Verdict: **accepted**. Refs #3948. Reviewer: Claude Code, session `cc-58621d`, 29 September 2026. Round-3
author: Claude Code, session `cc-39fac3` (#3971). Earlier authors: `gpt-20260921-c74f2a` (original) and
`cg-6b83f1` (round-1 review amendments). Earlier reviewers: `cg-6b83f1` (REV-RS-20) and `codex-a71f92`
(REV-RS-20~2). This session did not write RS-20 or its reviews, and has no other work on this family.

## 1. The round-2 blocker is resolved

REV-RS-20~2 rejected the proposal for one reason, RF3's global Proj map. The chart maps D(g) → D₊(g)
glue only on U, the union of the nonvanishing loci of positive-degree sections, so a morphism on all of
X_S needs a positive-generation input. The degree-one twist on Proj(P) also needs justification. That
input lies downstream of RF3, and VB2:ampleness → RF3 would be cyclic. The review asked for one of two
repairs; the second was to split the chartwise construction from the global map and "place the latter
after a proved positive-generation input".

Round 3 does exactly that:
- **RF3 keeps** O(n), the graded algebra P, the scheme Proj(P) and the chartwise construction glued to
  U → Proj(P). It says explicitly that it does not assert U = X_S, construct a morphism on X_S, or
  define O_Proj(P)(1). The P¹, O(−1) counterexample is recorded.
- **VectorBundlesAndIsocrystals VB2:ampleness owns** the global morphism, the tautological invertible
  sheaves O_Proj(P)(m) for m ≥ n0, O_Proj(P)(1) defined from them, and f*O_Proj(P)(1) = O_{X_S}(1).
  It builds them after its first target, global generation, and before the GAGA comparison it already
  owns.
- **Graph.** No prerequisite changes: RF3 → VB2:ampleness and VB1 → VB2:ampleness already exist, and no
  VB2:ampleness → RF3 edge is proposed.

**Checked against the source.** I checked this in the Fargues–Scholze author PDF (356 pages, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`, the file REV-RS-20~2 read).
- **Theorem II.2.6** ([KL15, Proposition 6.2.4], printed p. 64): for S affinoid perfectoid and any
  vector bundle E, E(n) is globally generated with H¹(X_S, E(n)) = 0 for all n ≥ n0.
- **Proposition II.2.7** (GAGA, pp. 66–67) assumes that generation and vanishing. The paragraph before
  its proof uses generation: "if n is large enough so that O_X(n) is globally generated, then it is
  enough to consider only f ∈ P_n". It then says "there is a tautological line bundle O_Proj(P)(n) for
  all sufficiently large n, compatible with tensor products; thus, there is also a tautological line
  bundle O_Proj(P)(1)".
- **The proof** begins "The construction of the map f : (X, O_X) → X^alg is formal (and does not rely
  on any assumptions)" and glues the chart maps "when g varies". The glued map is defined on the union
  of the D(g), which is X exactly when O(n) is globally generated.

So the split follows FS's own order, and VB2:ampleness is asked to construct the twists, with every
degree and trivialization explicit, rather than to assume them.

**The node placement is right too.** Round 3 places the degree-one ramified primitive presentation in
RF2:integral-divisors, before the closed-Cartier lemma. FS's proof of Proposition II.1.4 (p. 50)
starts from "R^{♯+} = W_{O_E}(R^+)/ξ for some nonzerodivisor ξ … of the form π − a[ϖ]" before proving
the closed-Cartier property. The inherited link from `RF2:untilts/primitive-untilt-correspondence`
to `closed-cartier-divisor-norm-estimate` would otherwise point backwards. The instruction is recorded
in the RF2 entries.

## 2. Rechecks on the current atlas

The inputs are byte-identical to those REV-RS-20~2 audited:
- both member documents, the AdicSpaces anchor and the RelativeFarguesFontaine decomposition;
- the family file and `data/atlas.json`;
- VectorBundlesAndIsocrystals' document is unchanged since then too.

Its full reading of the ownership, the conservation and the twenty-one native outward links therefore
stands. On the atlas as `scripts/build.py` assembles it at `ee268371`:
- **Links.** All seventy-nine links resolve and are distinct; forty-one are already present. The union
  is acyclic.
- **No-path checks.** No path VB2:ampleness → RF3 exists. Round 2's four no-path checks still hold:
  F5 ↛ integral-Y, untilts ↛ integral-divisors, RF0 ↛ integral-Y and RF4:G-torsors ↛ BG0.
- **Forwarding.** All sixty-one supplier-to-consumer checks for the narrowed layers pass. The only
  exceptions are named owners downstream of the narrowed layer (VB1 and VB2:ampleness for RF3). Round 2
  accepted this pattern: `suppliedBy` names the owner of the removed part, not an edge back into RF3.
- **RF3's other consumers.** BunGAndNewtonStrata BG0, VStackSheavesAndLisseCategories VS1 and
  VectorBundlesAndIsocrystals VB1 do not use the global map. Their descriptions mention neither Proj nor
  the algebraic curve. VB2:ampleness's description already compares X_S with "the Proj curve built in
  RF3", so it is the right owner.
- **Accepted records.** No accepted restructuring records VB2:ampleness; RS-15 only keeps
  VB2:classification. So the new owner record conflicts with nothing.
- `scripts/check_restructure.py` passes.

## 3. Notes for the orchestrator

1. **Cross-family owner.** VB2:ampleness is not a member of this family. Its entry under `layers` is a
   `keep`, which `restructure.py` skips, so VB2:ampleness's stage record does not change when RS-20 is
   applied. The assignment lives in the owner record and in RF3's `suppliedBy`. When
   VectorBundlesAndIsocrystals is blueprinted, VB2:ampleness must plan the global morphism, the twists
   and the pullback identification after its generation theorem. Its README can gain one sentence
   saying so.
2. **Inherited nodes.** The placement instructions in the RF0:integral-Y, RF2 and RF3 entries stand for
   the next blueprint checkpoint:
   - `RF3/graded-algebra-and-algebraic-curve-map` is restricted to U, and its global targets move to a
     VB2:ampleness node;
   - `RF3/isocrystal-line-bundles-and-sign` is split with VB1;
   - the degree-one presentation moves into RF2:integral-divisors before the closed-Cartier lemma;
   - the reciprocal t₁^♯ = π/[ϖ] is corrected, as in round 1.

## 4. Checks and inputs

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-20.result.json`: ok.
- Graph and forwarding checks on the assembled atlas at `ee268371`.
- Intake file validation on the two deliverables: 0 problems.
- Only the proposal's `review` object changed. It replaces round 2's; the history stays in REV-RS-20.md
  and REV-RS-20~2.md.

Pre-review inputs at `ee268371d8b4141730b1bb7229df1285f938285d` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-20.result.json | `8249db21dfdaa03f58069017e18465702d763f204ec4f9fcfa7de9777528dd7f` |
| RS-20.md | `a80e3ee0e7e3f3889c6cb8af4be643a8e238c8de376ba1d8af0af8f63f4f0690` |
| RS-20.json | `dd6639e569cd0da03b5c2811b1150cbfd3519a85621e3bf4d0662055a5335fbf` |
| FarguesFontaineDiamonds/README.md | `8516e21fe60a055fd03835a0a5d9b3ef9b474e7d22185fa0b0a0968b3454eb0a` |
| RelativeFarguesFontaine/README.md | `2fe283daff1db960718dd662b2ca2515747b3b3d56a58df143e9d0ad4418c417` |
| tau-ceti/AdicSpaces/README.md | `7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795` |
| RelativeFarguesFontaine decomposition | `88565395c1d43c0a484f7d2e3e02ac8bb437a8223624ee44daf221c144514e8b` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable; no Lean was run.
