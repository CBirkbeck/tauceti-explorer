# Handoff: compatible systems, revision round 2

Job `BP-PotentialModularityAndCompatibleSystems--R24.3~2`, issue #7000.
Codex session `codex-rUUBpt`, 8 October 2026.

This is a completed revision pass. The packet is `complete`; R24.3, R24.4,
R24.5, R24.5:operations and R24.6 are all `planned`, with none `closed`.
Implementation remains `unchecked`. The historical `review` object and all
43 accepted node identifiers are unchanged. The next independent reviewer
replaces that review object.

## What this round changed

The previous review corrected the packet and suggested file but could not edit
the reader. This round brings every reader declaration into agreement with the
corrected packet: statements, hypotheses, proof steps, direct inputs, API,
tests, uses, source locators and acceptance checks. The reader now names the
85 API items and 61 tests explicitly, preserves all anchors and 12 planets,
and includes every supplier contract, coverage obligation and proof gap.

The required mathematical synchronizations are:

- KW almost strictness retains plain compatibility, including large-prime
  crystallinity. DP Definition 1.10 retains all-member de Rham and Hodge
  conditions even when a coefficient-prime WD comparison is excepted. The
  comparison table separates these from BLGGT weak and strict contracts.
- Strict purity includes Hodge-conjugation symmetry; constituent self-duality
  assumes imaginary CM base, actual polarization, purity and extreme
  regularity. Rank-two reducibility concerns characteristic-zero members.
- The algebraic operations consume R06.2; rank-one purity consumes upstream
  ClassFieldTheory Layer 11. The weakened-carrier uses and Larsen G7 input
  and system-dependent theta-bound test now appear in the reader.
- Böckle's finite-over-the-DVR hypothesis remains essential, and the Annals
  minimal-lift theorem excludes weight p. Type (4) splits on inertia. The
  application table includes KW §8.2's concluding cases and its DP mapping.
- Brauer genuineness uses the norm-one pairing and its overlap/descent input,
  not degree alone. Its source is Khare's arXiv §3, Proposition 3.1,
  pp. 16–17. Almost strictness imports R23.5 disjointness and the full R19.5
  request. Strictness and the coefficient-prime lemma use the all-weight
  R06.3 WD/crystalline criterion. Savitt's unprovided dyadic calculation is
  at the new residual prime q=2.
- The DP family node is restricted to R23.4's KW types (A), (B), (C). The
  larger de Rham/potentially Barsotti–Tate scope remains a named gap, with
  source finding E5. KW's rank-two cofinite residual conclusions and BLGGT's
  general density-one theorem remain distinct.

Rechecking the sources also prompted small refinements, without new nodes:

- Snowden's prescribed local quotients may be zero (Propositions 7.3.1 and
  7.4.1, arXiv v1, pp. 21–22). The R08.6 request now specifies their dimensions
  and the actual determinant/type/weight-two local solution needed for a
  prescribed type. Proposition 7.7.1 supplies some definite type away from p,
  rather than every requested inertial type. The application of Theorem 7.2.1
  to DP 1.9(4), its acceptance check and suggested omission statement are
  explicitly conditional on establishing that local solution.
- BLGGT v4 Lemma 5.4.5 and its proof are on p. 76; the locator is corrected.
  A stale proof pointer in the density theorem now points to the common
  component-field node, rather than the rank-two reducibility node.
- Swinnerton-Dyer's published 1973 table now supports the existing Δ test:
  §2, Corollary 1, p. 15, and §4, corollary to Theorem 4, pp. 31–33.
  The reducible primes are 2, 3, 5, 7, 691; 23 is the irreducible dihedral
  boundary case, splitting over ℚ(√−23).
- Source assertions in the reader are paraphrases, with mathematical formulas
  and exact locators. E1–E4's confirmations and E5's confirmation remain
  recorded. E5 now includes DP's residual hypotheses and distinguishes
  weight-two lift existence from the broader family-existence obligation.
- The weak-carrier statement is rewritten in our own words, preserving its
  mathematics and separating Taylor's exceptional-prime Hodge–Tate contract
  from BLGGT's de Rham contract.

The proposed-roadmap notes about R24.4 ordering and full R19.5/Skinner scope
now sit in `restructure`. The true upstream note uses the Protocol §10
`roadmaps`/`note` schema. The existing ClassFieldTheory Part II proposal is
retained. No campaign graph, supplier packet or upstream document was edited.

## Red-team findings retained

- **RT-AREA-langlands-2/10:** the early R24.5:operations carrier has no
  eigenform or potential-automorphy prerequisite. R19.3 supplies instances,
  G7 supplies representation-level operations, and R34.6 supplies eigenform
  purity. The packet imports each owner rather than duplicating it.
- **/12:** R24.4 imports the full KW lifting interface from R22.5/R22.6 and
  R20 weight inputs. KW II §10.2 uses neither the later finiteness theorem
  nor potential modularity. The campaign-edge proposal removes the
  chronological R24.3 dependency and gives R24.5 its direct lift input.
- **/21:** modern ramified, residually reducible de Rham transfer remains
  with GL2ModularityLifting R32.6; R24.6 supplies reduction and local-hypothesis
  checks and consumes that transfer.
- **/30:** the strict Brauer family consumes Skinner's full Theorem 1,
  including reducible residual members, ℓ=2 and Hilbert forms outside the
  Saito/Carayol parity restriction. The historical KW almost-strict theorem
  remains a separate source-faithful variant. The current narrow R19.5 node
  is insufficient, so its exact extension request remains open.

## Validation and library checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json`:
  zero errors and zero warnings, using the available pinned declaration index.
- `check_errata.check` on the packet's `errata-v1` projection, with roadmap ID
  `PotentialModularityAndCompatibleSystems`: zero errors. The standalone
  errata command expects a dedicated errata result, rather than a blueprint
  packet filename.
- An independent consistency check covered all 43 reader anchors and their
  statements, hypotheses, proof outlines, API, tests, uses, acceptance and
  source locators; all planned suggested names; coverage, requests, seven
  gaps and five source findings. It confirmed unchanged node IDs and review
  decisions, no source excerpts and no private paths.
- Numerical boundary examples were recomputed: Δ's Q₂, C₂ virtual-character
  pairing norms and genuineness failure, the dyadic level-two character
  condition, polarization signs and the extremely weak Hodge counterexample.
- `git diff --check`: clean.
- `lean-check research/blueprint/suggested/PotentialModularityAndCompatibleSystems--R24.3.lean`:
  exit 0, zero errors, 79 warnings, all `declaration uses sorry`. Available
  memory exceeded the required 20 GB. The shared build's Mathlib commit was
  exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports only
  Mathlib, so no unpinned Tau Ceti module participates in this compile.

All 21 cited Mathlib statements were re-read at that exact commit. The reviewed
G7 and R19.3/R19.5 audit entries were re-read; the audit has no dedicated entry
for this roadmap. The earlier pinned Tau Ceti search is retained, and this
revision adds no Tau Ceti declaration citation. Existing algebraic induction,
representations, completions, Gamma factors and commutative-algebra primitives
remain baseline imports.

## Sources checked and reading limitations

The packet records the URLs, hashes, exact versions and new reading lines.
Checks covered KW I §§4–5, §6 Lemma 6.2(ii), §8.2, §8.4, §9.1 and §10.1;
KW II §§8.1–8.2, §§9.2–10 and bibliography; KW Annals pp. 231, 239–242;
Böckle Lemma 2 and the subsequent argument on p. 5; DP §§1.3–1.4 and the
cited §2 steps; Snowden §§1.4, 3.1 and 7.1–7.7; Taylor §6 pp. 773–774;
BLGGT v1 §§5.1 and Corollary 5.3.2, and v4 §2.1, §§5.1–5.3, Lemma 5.4.5,
§5.5, Lemma A.1.5 and Appendix A.2; Skinner Theorem 1 pp. 241–243;
Khare arXiv Proposition 3.1 pp. 16–17; Dieulefait Theorem 1.1 pp. 1–2;
ACC's published §7.1 pp. 1084–1086, 1092–1093; and Swinnerton-Dyer's
classification/table passages identified above. This is scoped verification,
not a claim to have independently verified every cited paper in full.

The inaccessible DP RACSAM and Dieulefait Crelle versions, and uncollated
Inventiones/Annals versions, retain their earlier access limitations. The
older author-copy reading records remain dated as before. No restricted book
or uncleared copy was needed. Savitt, Gee 2011, Larsen/Larsen–Pink, Sen,
Bogomolov, Serre's monodromy inputs, Conrad–Chai–Oort and Bruhat–Tits remain
unread proof leaves as specified in the packet.

## Remaining work and where to resume

Counts: 7 definitions, 8 constructions, 19 theorems, 4 comparisons,
4 lemmas and 1 application; 85 API items, 61 unit tests, 12 planets,
21 baseline declarations, 26 supplier contracts and 7 gaps. The suggested
coverage distinguishes 49 signature fragments from 64 omitted declarations;
elaboration does not establish the omitted arithmetic mathematics.

The seven boundaries are Savitt's residual weights; Gee/general Dieulefait
scope; common-component/Sen monodromy proofs; Larsen's maximality inputs;
missing arithmetic supplier types for full Lean signatures; Brauer overlap
pairing descent; and potential modularity beyond R23.4's lift types.

The 26 contracts remain in the packet, including two provided upstream Hecke
interfaces. Resume through `coverage.remaining`, `gaps.neededBy` and
`requests.neededBy`: R24.3 needs its exact local-nonemptiness and algebra/R=T
exports; R24.4 needs the full R22/R20 interfaces; R24.5 needs general Hilbert,
overlap, Skinner, purity and broader potential-modularity inputs; operations
needs its arithmetic/character/monodromy/density suppliers; R24.6 needs its
reduction, conductor, weight and transfer interfaces. ClassicalSerreModularity
R33 must check that every lift fed to the family node lies in the planned
scope or obtain the missing potential-modularity input. The next step for
this revision is independent review, followed by those owner-specific
refinements; there is no unfinished reader synchronization to resume.
