# DESIGN-EllAdicHomotopyTypesAndWeights — handoff

Issue: #4582. Agent: Codex. Session: codex-7OyLSf. Date: 2026-10-18.
The claim was confirmed by the bot against claim comment 6244340075.
This is the completed target-level design pass, ready for independent review.
It is not a checkpoint and makes no implementation or proof-closure claim.

## Deliverables and coverage

The new roadmap definition, blueprint packet, full reader document and compact
suggested Lean file agree. The packet has 40 targets: 6 definitions,
12 constructions, 20 theorems and 2 comparisons. All 18 definitions and
constructions have uses, five API items and three discriminating unit tests:
90 API items and 54 tests in total. There are 38 planets, at most six in
any layer, and 11 individually checked baseline declarations. All nodes retain
`implementationStatus: unchecked`.

Every stage is **planned**, with explicit remaining work; none is **closed**.
The packet status is **complete** because the complete target pass and its
backward dependency chains have been supplied, with gaps and supplier contracts
recorded. This distinction must survive packaging and review.

| Stage | Targets | Status | Main output |
| --- | ---: | --- | --- |
| EH.0 | 4 | planned | Commutative DG refinements, polynomial homotopy and Sullivan minimal models |
| EH.1 | 4 | planned | Integral divided-power coordinates and relative simplex forms |
| EH.2 | 6 | planned | Simplicial forms, integral cohomology and rational stabilization |
| EH.3 | 5 | planned | Pro-simplicial forms, universal coefficients and bidegreewise completion |
| EH.4 | 4 | planned | Étale realization, finite-level action and complex comparison |
| EH.5 | 2 | planned | Geometric cohomology weights and Frobenius/Hodge comparison |
| EH.6 | 6 | planned | Finite-type filtrations, generalized eigenvalues and integer weights |
| EH.7 | 4 | planned | Proalgebraic descent and conjugacy of rational gradings |
| EH.8 | 5 | planned | General-base weights, formality and normal-variety unipotent presentations |

The packet's `routeCoverage` accounts for all 38 items in the originating
Weil II extraction. Thirty-six lead to targets. Two concern the source's open
questions about homotopy-automorphism continuity and stronger conjugacy of
filtrations, and are explicitly excluded from theorem targets. No source
section-by-section synopsis or verbatim source passages are included.

## Important mathematical boundaries

Three degrees remain distinct: cochain degree p, divided-power t-degree n,
and minimal-model weight w. Relative integral forms quotient by dt, not t−1.
Odd squares vanish also in characteristic 2. Coefficients are changed in the
simplex modules before taking simplicial mapping objects. The integral
cohomology comparison has its triangular p≤n support and binomial cup factors.
Rational bounded-degree forms embed into polynomial forms; stabilization gives
a quasi-isomorphism, with no false unstabilized isomorphism for infinite X.

Completion is bidegreewise; rationalization precedes t-stabilization. Its
Mittag–Leffler and universal-coefficient statements remain proof obligations.
Finite-dimensional cohomology is not treated as finite-dimensional minimal
algebra pieces. Eigenvalue decompositions use finite-type invariant blocks
and generalized eigenspaces. Frobenius is geometric Frobenius, and all complex
embeddings enter the Weil-weight convention.

The rational theorem is for complex varieties. Over an arbitrary algebraically
closed field the grading is over Q_l. Conjugacy induces identity on Gr^W H*,
without an assertion that the conjugator is homotopic to identity. Proper smooth
formality uses the diagonal quasi-isomorphism; it does not assert that a minimal
model's differential vanishes. The Lie comparison target is for connected
normal varieties and the unipotent completion, with finite-stage nilpotence
cutoffs kept separate from the three relation weights.

## Exact gaps to resolve

These are the seven recorded gaps, not generic requests to fill in proofs.
All have consuming node identifiers in the packet.

1. **G1 — integral coefficient resolution and finite width.** Verify the
   exterior-power décalage for the free rank-one diagonal quotient, the
   extension/skeletal cohomology argument, principal-quotient coefficient
   change and finite-skeleton determination of each fixed (p,n) coefficient
   module. Weil II 5.1.9(b), pp. 236–237, is an outline, not a full proof.
   Dold–Kan alone supplies no nonlinear décalage theorem. The original broad
   quotient-coefficient assertion is corrected by E10 below.
2. **G2 — universal coefficients and completed complexes.** Supply the proof
   referenced at SGA5 V 5.3.1, or an independent proof, of finite generation
   from degreewise mod-l finiteness, the degree-(i+1) Tor term, and ML
   exactness for the form modules, cycles and boundaries in the completed
   complex. A predicate named IsMittagLeffler is insufficient.
3. **G3 — analytic comparison.** Prove compatible good-cover nerves and finite
   CW type for separated finite-type complex varieties, including singular
   and noncompact cases. The current finite-cover small-chain descent
   theorem is weaker; arbitrary good covers need not be finite.
4. **G4 — geometric Hodge realization and spreads.** Supply mixed Hodge
   complexes, proper SNC hyperresolution realization, rational/complex
   filtered comparison, strict descent and common-refinement independence.
   Track the shift: W_n on a mixed Hodge complex contributes weight n+i
   on H^i. For arbitrary algebraically closed bases verify independence of
   the cohomological étale weight filtration under good spreads. The pinned
   abstract MHS carrier does not realize variety cohomology.
5. **G5 — finite blocks and common filtrations.** Prove the general connected
   finite-cohomology form of Weil II 5.3.1 and Lemma 5.3.5, p. 241. The
   latter is left unproved in the source. Taking all orbits of a finite
   generating set does not prove finite generation. Include actual finitely
   many automorphisms, not only their homotopy representatives, and the
   dense-scalar argument for two G_m actions.
6. **G6 — compatible prounipotent splitting.** Prove finite-stage triangular
   kernel unipotence, the base-field extension-by-unipotent splitting
   input, and compatible lifting of sections and conjugators through the
   algebraic image tower. Independent finite-dimensional Levi choices do
   not give a section or conjugator in the inverse limit.
7. **G7 — étale 1-minimal comparison.** Identify the finite-stage 1-minimal
   Lie tower with the pointed Q_l unipotent étale Tannakian group for general
   connected normal varieties. Check extension H¹, obstruction H², brackets,
   transitions and fiber functors at every unipotence depth. Sullivan's
   rational topological realization does not prove this étale assertion.

The reader's worked examples distinguish the integral cup coefficient 2,
weight-1 elliptic generators from weight-2 algebraic-torus generators, the
infinite 1-minimal model of a three-punctured projective line, proper-curve
formality from a zero minimal differential, the even-sphere model of P¹,
and failure of the normal H¹ bound for a nodal rational curve.

## Supplier requests and ownership

Twelve precise requests are recorded, with consuming nodes:

- DGAInfinity layer 1: existing DG carriers, maps, tensor product,
  quasi-isomorphisms and localization.
- AlgebraicTopology stage 6: ordinary simplicial cohomology, coefficients and
  cup products through the existing topological direction.
- AlgebraicTopology stage 5: its finite-cover descent input, with the stronger
  G3 nerve/CW result kept explicit.
- SchemeAndStackFoundations SF.2: finite-coefficient étale cohomology,
  étale-hypercover realization, algebraically closed extension invariance,
  analytic comparison and the ordinary Galois cohomology action.
- SchemeAndStackFoundations SF.4: characteristic-zero compactification and
  resolution with SNC hyperresolution refinements.
- DeligneWeightsAndPurity DWP.0: Weil numbers and generalized eigenspace
  tensor/dual rules without semisimplicity.
- DeligneWeightsAndPurity DWP.7: mixed cohomology bounds, proper smooth
  purity including nonprojective varieties, and good specialization inputs.
- ReductiveGroups layer 5: finite-dimensional unipotent groups, central
  series and characteristic-zero torsors.
- ReductiveGroups layer 6: rational G_m complete reducibility.
- ReductiveGroups layer 7: the precise characteristic-zero unipotent-extension
  Levi splitting and conjugacy input.
- DGAInfinity layer 8: existing formality predicates and Massey consequences.
- AnabelianGeometryAndNonabelianChabauty NC.2: the existing unipotent
  Tannakian group direction with normal general-base scope and H¹/H² API.

The exact existing `ComplexComparisonPartII:C5/log-de-rham-complex` node is
also imported, without claiming that its curve comparison constructs all
geometric mixed Hodge structures.

Five proposals locate missing general inputs: HodgeStructures, Part III
(Part II is already occupied); AlgebraicTopology, Part II;
ReductiveGroups, Part II; AnabelianGeometryAndNonabelianChabauty, Part II;
and a reusable countable inverse-limit exactness input in DGAInfinity,
Part II if it is still absent at implementation. No supplier or upstream
roadmap was edited. No existing target was moved from a higher tier.

The library audit and actual pinned declarations were read. Current upstream
ownership was checked at TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, rather than relying on the atlas
snapshot. Relevant DGAInfinity, AlgebraicTopology, ReductiveGroups,
RealAlgebraicGeometry and Completed/HodgeStructures documents were read.
Current singular cochains and cup products postdate the pin and are assigned
to the existing AlgebraicTopology direction. RealAlgebraicGeometry excludes
triangulation. SF.2 proper-hypercover descent is not substituted for an
étale-hypercover theorem. A∞ transfer is not substituted for Sullivan models.

## Sources and correction records

Seven public texts were read at the printed locators listed in the packet and
reader, with URLs, access date and SHA-256 hashes:

- Deligne, *Weil II*, §5, pp. 234–242, throughout, and its bibliography.
- Sullivan, *Infinitesimal computations in topology*, §§2–3, pp. 279–285;
  §5, pp. 287–289; §6 and Appendix, pp. 289–296; §7, pp. 296–300;
  Theorem 8.1(ii), p. 301.
- Morgan, *The algebraic topology of smooth algebraic varieties*, introduction,
  pp. 137–141; §5, pp. 163–169; the rigidity argument and Theorem 9.2,
  p. 195; Theorem 9.4 and proof, pp. 198–199.
- Morgan's published 1986 correction, p. 185, in full.
- Deligne–Griffiths–Morgan–Sullivan, *Real homotopy theory of Kähler
  manifolds*, §1, pp. 246–250; §2, pp. 254–255; §6 Main Theorem and
  first proof, pp. 270–271.
- Deligne, *Poids dans la cohomologie des variétés algébriques*, pp. 79–85,
  in full from page images; especially 8.3, p. 82, 10, p. 83, and 14,
  pp. 83–84.
- Deligne, *Hodge III*, 6.2.4–6.2.8, pp. 19–21; 6.4, pp. 22–23;
  8.1.1–8.1.14, pp. 28–31; 8.1.18–8.1.20, pp. 34–35;
  8.2.1–8.2.4, pp. 38–39; 8.2.10–8.2.11, p. 40.

Miller, *De Rham cohomology with arbitrary coefficients*, Topology 17
(1978), 193–203, and the full SGA5 V 5.3.1 proof were not located/read.
They are missing proof inputs G1/G2, not claimed source verification.
The cleared-library index was consulted; no restricted book or other book
copy was used or copied.

Ten source findings are recorded. E1–E8 restate the atlas's existing
independently confirmed Weil II E61–E68 findings, checked against the scan.
E9 records Morgan's published correction: general indecomposables are not
rigid under homotopy; the canonical filtration's associated graded is the
rigid invariant. The correction retains the presentation result 9.4.

**E10 requires independent review.** Weil II 5.1.5, p. 235, asserts
unrestricted quotient tensor base change away from p=n. For the discrete
simplicial set N and R=Q[x₁,x₂,…], the component Ω_1^0(N,R) is ∏R.
With I=(x₁,x₂,…), the sequence (x_i) is nonzero in (∏R)/I(∏R) but maps to
zero in ∏(R/I). Any finite expression in I(∏R) uses only finitely many
variables from finitely many ideal generators, so cannot equal this sequence.
This disproves the unrestricted assertion. The target is restricted to
principal quotients, which include all required l-power coefficient maps;
their coefficient-resolution proof stays in G1. No published correction was
located in the article record or targeted search. This finding is not marked
independently verified and is not presented as a known published erratum.

## Verification and next action

The suggested file has 134 lines, three light real-bodied definitions on
existing carriers, seven theorem signatures and eleven examples. It follows
the current WORKERS.md shape requirement: heavy constructions are reader
specifications. It contains no data definition with a placeholder body.

`lean-check` elaborated the final file against Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, exiting zero with only 18
permitted placeholder-proof warnings. Memory was checked before compiling;
no private build, language server or dependency update was started.

The following checks passed locally:

- `scripts/check_blueprint.py`: zero errors and zero warnings.
- `scripts/check_sorry_data.py`: no offenders.
- Source-issue shape validation and `check_errata.versions_checked` on the
  embedded findings/source-version records.
- Full packet/reader agreement for statements, hypotheses, APIs, tests and
  source locators; acyclic internal dependency graph; stage/scope agreement;
  all route targets resolve; planet limits and kinds; no excerpt keys,
  Lean blocks or placeholder proofs in the prose document.
- Intake deliverable/path/JSON checks and whitespace checks.

The next action is independent review, particularly E10 and the precise G1–G7
contracts. Follow-ups must resolve those proofs and supplier scope inputs
before any stage is marked closed. The roadmap pass is complete; no second
job is claimed by this session.
