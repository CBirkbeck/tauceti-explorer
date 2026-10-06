# BP-FarguesFontaineDiamonds — handoff

Issue #730; Codex session codex-pBCdzm; source-reading date 2026-10-06.
The claim was confirmed by the swarm bot before work began. This is the complete
target-level planning pass for F0–F5, ready for independent review, with every
implementation status unchecked. It is not an implementation submission.

## Delivered and checked

The packet, reader and suggested Lean file cover all six stages. There are 37
nodes: 27 theorems and 10 constructions, with 31 API items, 30 named unit tests,
16 planets and 7 pinned baseline declarations. Each construction has its uses,
API and three sharp tests. All six coverage records are **planned**; none is
**closed**. The three recorded gaps and five supplier requests are intentional
endpoints of prerequisite chains, not silently assumed results.

Validation performed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FarguesFontaineDiamonds.json`
  with the real pinned declaration index: zero errors and zero warnings.
- Cross-file checks: all 37 declarations, 31 API names and 30 test names agree;
  all named tests occur as Lean examples, with one additional theorem acceptance
  example. Own-node prerequisites are acyclic and no prerequisite points back
  into RelativeFarguesFontaine.
- Every short source excerpt matches its recorded source text; all four PDF
  hashes match the packet. No private paths, forbidden planning prose or proof
  placeholders occur in the packet or reader.
- `lean-check research/blueprint/suggested/FarguesFontaineDiamonds.lean` returned
  exit status zero, with only proof-placeholder warnings. Available memory was
  checked before compilation. No language server or library build was started.

Compilation has a precise limitation: the shared build has the pinned Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, but its Tau Ceti checkout is
cf386627e9176a3827c1a5fe804989fd94a4d216 rather than the recorded pin
f790474821cf4256814db967cb154e7af3d0c369. The directly imported Spa.Basic source
is unchanged at the pin. Spa.Analytic exists in pinned source but its object
file is unavailable; the F0 prototype therefore uses the actual valuation
spectrum for the product-open condition and cites the pinned analytic-point
theorem separately. This elaboration checks available signature shapes, not a
fully rebuilt pinned Tau Ceti environment or the missing geometric suppliers.
Actual perfectoid/adic/diamond/site/Cartier/enhanced coefficient conditions are
omitted explicitly where their supplier types cannot yet be stated; there are
no replacement Prop fields or a second geometric carrier.

## Binding structure and ownership

Accepted RS-20, in `research/blueprint/restructure/RS-20.result.json`, sets the
title and base: **Foundations of adic spaces, Part II: the Fargues–Fontaine curve
as a diamond**, extending `tauceti:TauCetiRoadmap/AdicSpaces`. Its review is
`independent-review-REV-FIX-RT-RS-20~3`, accepted 2026-10-01. No stage is dropped.

F0 imports the anchor's actual Witt pairs, annuli, windows, radius, Frobenius and
adic quotient. F1 supplies only the fixed-field product seed. F2 supplies the
chosen-generator comparison and categorical graph/effective diamond quotient,
without rebuilding the anchor quotient. F3 specializes D6's general site
comparison. F4 owns the analytic norm/closed-divisor argument, while P1 owns
marked untilts and primitive theta kernels. F5 alone depends on enhanced and
adic coefficient theory. No relative curve or ramified coefficient theory is
replanned here.

**RT-AREA-padic-1/8 is handled:** F4 explicitly imports
`PerfectoidSpaces:P1/marked-untilt`,
`PerfectoidSpaces:P1/primitive-degree-one-ideals`,
`PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals` and
`PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`. It adds the analytic
Cartier interpretation and fixed-Q_p descent, not another correspondence.
The relative roadmap is a downstream consumer. This job does not edit RF2.

All actual link/overlap entries mentioning this roadmap were read, together with
its atlas extract, campaign reader, accepted restructuring, relevant supplier
statements and maintainer-added Berkeley extraction items 34, 76, 77 and 92.
Their routing is recorded in `sourceRouting`. The complete AdicSpaces and
AnalyticToricGeometry upstream documents supplied the specification style.

## Remaining work, by stage

- **F0 planned:** obtain the actual anchor outputs and instantiate the analytic
  category/structural-map interfaces. The initial open is the intersection
  D(p) intersect D([varpi]), not their union or an initially p-inverted ring.
- **F1 planned:** instantiate P1's bounded, continuous plus-ring theta and
  marked-untilt slice interfaces. The compiled theta calculation is algebraic;
  it does not establish the topological bijection.
- **F2 planned:** instantiate A1 fibre products and D0/D3 effective quotient
  contracts. Check the positive generator, locally constant integer labels and
  finite-overlap compactness argument, without assuming quotient preservation
  for arbitrary colimits or a quasicompact quotient cover.
- **F3 planned:** reconcile D6 with the ECD v4/KL15 site definitions, then
  instantiate the genuine sites and descent categories. Finite covers use
  v-local finite étaleness after sheaf descent, rather than only the restricted
  separated-pro-étale perfectoid-base result.
- **F4 planned:** fill the classical one-variable boundary theorem and verify
  geometric-fiber/finite-root spectral-norm passage for
  `FarguesFontaineDiamonds:F4/boundary_supremum`. Obtain the Q0 integral
  recognition bridge and R0 all-rational-affinoids Cartier criterion. Only then
  close the multiplication lower bound, strict quotient and divisor chain.
  Retain the root relations, ordinary split completed tensor topology and the
  compatible renormalization of tilt and untilt norms. On X glue local Cartier
  ideals; do not form an infinite product of translated primitive equations.
- **F5 planned:** obtain C2/L0 enhanced left-completed and derived-complete
  contracts, coherent reductions/tensors and actual global-sections comparison
  maps. The ordinary topos-derived equivalence, bounded-below agreement with
  diamond D_et and unbounded left-completed comparison are distinct statements.

Review should check the two Frobenius computations separately: F2 conjugates
positive phi_Y to phi_S on the product's first factor; F4 resets a translated
graph's first coordinate using phi_S inverse. Div^1 is the untilt-moduli quotient,
not the fixed curve diamond. No structural X^diamond-to-S map is asserted.

## Requests and gaps

The five packet requests are mathematical contracts, not newly opened tickets:

1. AdicSpaces Layer 6: all actual period-domain/quotient/chart outputs.
2. PerfectoidQuotients Q0: the early pseudouniformizer-complete integral chart
   recognition bridge; the existing p-complete predicate alone is insufficient.
3. AdicSpacesPartII R0: uniform-analytic Cartier vocabulary, closed image on
   every rational affinoid, quotient plus rings and gluing.
4. DiamondEtaleCohomology C2: enhanced left completion, bounded-below agreement,
   truncation/pullback/tensor/sections coherence and finite prime-to-p coefficient
   devissage needed by L0.
5. AdicCoefficientsAndComparisons L0: derived I-complete systems on both sites,
   finite-level enhanced limits, reductions, completed tensor and sections.

The three gaps are the boundary/norm proof input, missing reviewed F0–F5 library
audit and supplier-review limitations, and unavailable geometric/enhanced Lean
types. `data/library-coverage.json` contains no reviewed entries for these six
stages; declarations and full pinned source statements were checked directly
instead. Draft supplier IDs are contracts, not proof or implementation claims.

The boundary issue is also `FarguesFontaineDiamonds/E1`, an **unverified**
source-proof-detail finding. FS and Berkeley call the relevant maximum principle
well-known. No theorem is alleged false, no novelty is claimed, and a reviewer
may reject it as a source defect upon locating an adequate standard reference.
The planning gap still needs an explicit input and its approximation argument.

## Sources read and missing

The packet records public URLs, editions, SHA-256 hashes and access date for:

- Fargues–Scholze, author PDF: II.1.1–4 and II.1.15–18 with proof interiors;
  II.1.19 introductory definition only.
- Scholze–Weinstein, Berkeley author draft March 27, 2020: Lecture 5 section
  5.3 definitions and Cartier criterion with proof; Lecture 11 propositions
  11.2.1/11.3.1 and proofs; Lecture 13 section 13.1 with proof and definition
  13.5.1 with the adjacent quotient/vector-bundle discussion.
- Scholze, Étale cohomology of diamonds, arXiv v4 April 2026: 14.13–16,
  15.5–6, 26.1–2 with the stated proof interiors; 11.1/11.3, 10.11(iii) and
  its proof; 9.7 through its first general-case reduction, not its whole proof.
- Kedlaya–Liu, Foundations, arXiv v5 May 2015: 8.2.16–19, including the
  proof of 8.2.17 and remark 8.2.18, for the public site convention.

The missing source input is the exact classical boundary theorem plus the
perfected-disc approximation/norm argument. BMS1 Lemma 3.10(ii) is a reference
inside the Q0 supplier request, not a separately claimed source reading.
The handoff contains all durable notes; no source PDFs or scratch logs are
needed by the next worker. Independent review is the next action, followed by
the named stage refinements; no second job is taken by this session.
