# Handoff: BP-RelativeFarguesFontaine--RF0

Agent: Codex. Session: `codex-XY6fVj`. Issue: #985.
Branch: `codex-XY6fVj-rf0`. Planning pass completed 7 October 2026.

## Result and scope

This is a complete target-level planning pass, ready for independent review,
with all eight scoped stages **planned** and none closed. It extends the
20-node checkpoint from PR #2858, preserving every existing node ID. The
accepted RS-20 result and review `independent-review-REV-FIX-RT-RS-20~3` govern
ownership. The roadmap extends upstream AdicSpaces as **Foundations of adic
spaces, Part II: relative Fargues–Fontaine curves and period geometry**.
Upstream roadmaps and other owners are imported rather than replanned.

The four deliverables are:

- `research/blueprint/packets/RelativeFarguesFontaine--RF0.json`: **73 nodes**
  (3 definitions, 28 constructions, 37 theorems, 5 comparisons), **129 API
  items**, **97 unit tests**, **26 planets**, **25 checked baseline declarations**,
  **9 gaps**, **18 requests**, 17 source entries and 69 routed source items.
- `research/blueprint/readmes/RelativeFarguesFontaine--RF0.md`: the definitive
  mathematical reader, approximately **26,100 words**, with conventions,
  declaration statements, hypotheses, proof plans, APIs, tests, source-copy
  references, ownership interfaces and the source-item matrix.
- `research/blueprint/suggested/RelativeFarguesFontaine--RF0.lean`: suggested
  signatures for every node and API, and 97 named examples. It **elaborated** at
  the pins, exit status zero, with 318 `sorry` warnings and no other warnings.
- This handoff.

| Stage | Coverage | Required refinement or interface |
|---|---|---|
| RF0 | planned | Lubin–Tate formal-group, logarithm and tower input |
| RF0:integral-Y | planned | Integral coefficient completed tensor; perfectoid chart criterion |
| RF0:annuli | planned | All-E norm extension and exact imported analytic interfaces |
| RF1 | planned | Lubin–Tate tower; outward global Proj and degree-one moduli properties |
| RF2 | planned | Aggregate of the integral-divisor and untilt targets |
| RF2:integral-divisors | planned | Early all-E degree criterion; ordinary descent for finite thickenings |
| RF2:untilts | planned | Strict quotient/base-change comparison, geometric completion identifications and outward moduli properties |
| RF3 | planned | Lubin–Tate input; section charts with global comparison supplied by VB2 |

Every node remains `implementationStatus: unchecked`. No formalisation or
proof is claimed. Stop refining this packet at target-level coverage under
PROTOCOL section 0; independent review determines acceptance and creates
follow-up jobs for the open stages.

## Checks and evidence

Checks performed on the final deliverables:

- `scripts/check_blueprint.py` against the pinned declaration index: **0 errors,
  0 warnings**, eight planned stages, zero closed stages.
- `research/blueprint/intake.py check-files`: **four files, zero problems**.
- Suggested file checked with `lean-check` in the existing shared pinned build:
  **exit 0, only `sorry` warnings**. Memory availability was checked before each
  invocation; one compilation ran at a time. No build, update, cache download or
  language server was started.
- Name/coverage audit: all 73 primary names and 129 API names are actual
  declarations; all 97 test names label actual examples; every node, API and
  test also appears in the reader; all 20 original IDs are retained; the
  69 source-item keys are unique.
- Transitive dependency audit: **297 reachable declaration nodes, 224 external,
  no cycles**, using integrated decompositions before the current own packet.
  A second audit letting current owner packets override decompositions reached
  **576 nodes, also with no cycles**. Stage terminals remain named supplier
  interfaces, rather than assertions of implementation closure.
- Source-issue/version schema checks: **zero errors**. Every node's excerpt
  matches its downloaded source after whitespace, ligature and accent
  normalization and is at most 300 characters. PDF source hashes were computed
  on the copies actually read.
- Reader terminology and whitespace checks: no optional/deferred targets or
  review-round history in the reader; `git diff --check` clean.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The library statements and their
surrounding hypotheses were read directly. In particular, the existing
Fontaine theta and BDeRhamPlus objects use PreTilt and their specified
completeness/nonunit hypotheses; they do not supply an automatic all-E
geometric identification. Tau Ceti already has Huber pairs and the set-level
adic spectrum carrier. Missing geometric conditions in the suggested file
are expressly omitted as PROTOCOL section 13 requires. The file comments
identify algebraic/topological fragments and the intended geometric inputs;
they do not replace missing properties by arbitrary proposition fields.

## Mathematical reconciliation

The coefficient foundation now includes universal ramified ghost polynomials,
the torsion-free Dwork criterion, arbitrary-algebra Witt operations,
uniformizer transport, Frobenius/Verschiebung, strict perfect lifts,
coefficient-extension formulas, the Witt diagonal/unramified scalar action,
and Q-twisted and Lubin–Tate sections. The strict-lift stable node belongs to
the integral coefficient prefix; it realises RF0 without an aggregate
back-edge. The finite perfect coefficient tensor is over the maximal
unramified subextension. The corrected Verschiebung formula places the
Frobenius iterate **inside** the coefficient map.

Integral charts retain the characteristic-p end. Their root extension roots
the **whole** ratio pi/[varpi], distinct from the Lubin–Tate tower. The whole
analytic A_inf locus includes both ends, whereas the generic domain inverts
both pi and [varpi]. Classical disc points, Gauss fibres, their base changes
and the inertia-surjectivity point have separate targets. The relative
analytic curve is the actual Frobenius quotient, with a continuous projection
and diamond formula; an adic structural map to the characteristic-p base is
not inferred.

The all-E primitive Cartier equation and closed-image estimate precede products
of legs and include pi=0. Symmetric quotients are v-sheaves with collisions and
degree zero, not action stacks. Descent concerns the ordinary invertible ideal
and its inclusion. Completion is of the **ambient ideal**, with generator
change, multiplicities, disjoint-support CRT, filtration and base change.
The p-typical affinoid comparison first identifies the tilt, theta and ideals;
finite coefficient extension selects the given untilt action before taking the
de Rham completion. The geometric DVR statement is degree one only.

Rank-one twists use multiplier pi^(-n), hence sections with phi(f)=pi^n f.
Existing Proj and homogeneous localizations are imported. The map constructed
here is on the section-covered open U; global coverage, degree-one
invertibility and global twist comparison have the VB2 owner.

Relative Robba rings preserve the twelve variants, exactly nine acyclic
variants and the separate Kiehl statements. Fixed-radius finite-etale descent
uses phi^(-1)-equivariance. The Berkovich retraction is distinct from an adic
product claim. Invariants retain disconnected constants. Local generation
is a rational-neighborhood conclusion. The crystalline boundary in the Cech
section input is [varpi]=0, pi nonzero, and its left ring has the pi-adic Tate
topology. General vector-bundle classification/cohomology stays with RF4/VB.

## Sources and correction findings

The source records identify exact accessible editions, URLs, read sections,
SHA-256 fingerprints and access dates. The reader carries the same locators.
This includes Fargues–Scholze Chapter II, Fargues–Fontaine coefficient and
period chapters/preface, Kedlaya–Liu relative foundations, Appendix A of their
second paper, Scholze–Weinstein, BMS, Hansen–Kedlaya, Kedlaya's A_inf and Witt
papers, Fargues' divisor paper, Guo–Reinecke, Zhu, Bhatt–Scholze and the relevant
Stacks passages. Reading claims are scoped: for example Fargues' Proposition
2.18 proof was read, whereas only the statement of Proposition 2.19 was read.

Ten source findings are recorded, pending independent verification:

- **E1/E2:** coordinate reciprocal in the 2024 MPIM copy and coefficient
  Verschiebung iterate in the 2017 FF copy, corrected in the comparison author
  copies. These are version findings, not newly discovered published errors.
- **E3:** the open-disc radius-one endpoint is excluded by the printed
  membership hypothesis already; an endpoint clarification affecting nothing.
- **E4:** KL Conjecture 8.8.20(b)'s unrestricted uniform/perfectoid thickening
  claim fails for the square of a simple divisor section: the resulting
  nonzero nilpotent contradicts uniformity. The plan does not invoke the
  conjecture as a theorem or delete collided divisors.
- **E5:** two decomposition signs, without a change to the norm bounds.
- **E6–E10:** known corrections from KLII Appendix A: iteration index,
  primitive constant coefficient being a unit, final coefficient/norm symbols,
  factorization-map targets and the incomplete primitive quotient proof.
  The corrected KLII Theorem 3.3.13 input is requested from P3; reading Appendix
  A is not represented as reading or proving that full theorem.

Nine version records distinguish author copies, arXiv versions, publisher
samples and unavailable published text. The FF and FS publisher samples do not
supply the affected passages. The KL publisher/Numdam attempts supplied no
full text, so E4–E10 are explicitly scoped to arXiv v5. Seven findings have a
known correction/version comparison; E3/E4/E5 are new findings scoped to the
copies checked, without a claim about unseen published editions.

## Required follow-up

The **nine gaps** are exact proof/interface needs, not unclaimed targets:

1. Extend R0 to integral completed coefficient tensors for the non-adic
   coefficient map into the weak Witt topology.
2. Supply P1's BMS-style integral perfectoid chart criterion and verify the
   quotient/root computation with its hypotheses.
3. Prove the all-E extension of the relative period norm estimates.
4. Prove an early all-E integral degree criterion without a VB/Picard circle.
5. Supply ordinary bundle descent on all finite Cartier thickenings, including
   the matrix-correction passage from almost estimates.
6. Supply LocalFields Part II's LT formal group, logarithm and torsion tower.
7. Supply strict quotient completion/base-change comparisons.
8. Supply the geometric de Rham/PreTilt and chosen coefficient-factor interfaces.
9. Obtain global Proj and degree-one moduli properties from their outward owners.

The **18 precise requests** comprise ten incoming interfaces (R0, P1, P2, P3,
D6, D3, R3, upstream inertia, analytic quotient and absolute interval comparison)
and eight outward interfaces. Outward requests go to VB1's isocrystal/global
module generation and flat quasicoherent cohomology; VB2's global Proj/twist/
complement comparison and valued-field classification; VB3's degree-one
properness/spatiality/smoothness; RF4's phi-bundle product descent; upstream
LocalFields Part II's Cohen lift; and DD0's full cotangent obstructions.
The packet gives each requested statement and all dependent node IDs.

The next worker should follow the independent review of this complete pass,
then the generated open-stage jobs. The scratch source texts and scripts are
transient and are removed after submission; everything required to reproduce
the plan is in the packet, reader, suggested file and this note. RF4 is outside
this job. No second issue was claimed.
