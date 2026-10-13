# Handoff: BP-GeometryOfNumbersAndQuadraticArithmetic--GN.4

Job #9328, Claude (Opus 5.5), session claude-iKBZMu, 2026-10-13.

## What was done

Follow-up plan for Layer GN.4 (lattice points and homogeneous dynamics), in its own packet
`research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.4.json` (part `GN.4`, scope `GN.4`,
status `complete`, coverage `planned`), with the reader
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.4.md` (rendered from the packet, about
26,000 words) and the suggested file `research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic--GN.4.lean`
(712 lines).

The base packet's 46 GN.4 nodes and the GN.1 follow-up's four GN.4-parented Gaussian nodes
(`gaussian-directional-tail`, `gaussian-coordinate-tails`, `l1-covering-transference`, `smith-cofactor-adjustment`)
are cited by id and not re-planned. This packet adds 65 nodes (12 definitions, 4 constructions, 33 theorems,
14 lemmas, 2 applications; 119 API items, 67 unit tests, 6 planets, 70 baseline declarations), in twelve sections:

- §4.6 Davenport's principle (Barroero–Widmer Thm 1.1), coordinate projection volumes, semialgebraic complexity, the
  uniform component bound (BW Cor 3.13), the interval condition, and Davenport's estimate for triangular unipotent
  images. Together these prove the base node `davenport-semialgebraic-count`.
- §4.7 Ball counts by successive minima, derived from the base packet's Henk bound with explicit constant 2^{3R−1}.
  Also Schmidt's bounded-domain count (with the j = 0 term, BSW E14), the Eskin–Katznelson quadratic count
  (MST/75, SSTT/79), small-vector counts (BLS 3.6), the adapted basis with coordinate bounds, Widmer's Theorem 5.4,
  Barroero–Widmer for semialgebraic families, and the LWZB hyperplane–orthant count.
- §4.8 The lattice inputs of Browning–Le Boudec–Sawin: angular bands, Lemma 3.4, S_{r,n} and Lemma 3.18, Schmidt's
  extension count, the I/J band volumes and their asymptotics, weighted primitive sums, and the primitive ball count.
- §4.9 BSW §5 skew counts: symmetric row lattices, Theorem 5.3, Propositions 5.4–5.5 (with d(γΛ), E15),
  Lemma 5.6/Proposition 5.7 and Theorem 5.1. This supplies the ArithmeticStatistics ST.2 request.
- §4.10 Khayutin's class L(C, θ) and van der Corput's bound (every θ > 2/3 admissible). Huxley's 131/208 is stated
  with a gap. This supplies the SieveMethods request.
- §4.11 Ghosh–Sarnak Lemmas 7.1–7.3 (strip correction and 1/48 recomputed in the proof steps) and Blomer–Granville.
- §4.12 Transference for all i with Minkowski's constant (Evertse Thm 2.20, complete proof), sup-norm covering
  (supplies the DT.0 Kronecker request), and the minimum of a Construction A lattice.
- §4.13 The space of unimodular lattices X_n (column convention, transpose homeomorphism) and its invariant
  probability. Also Mahler with bounded bases and in the sup norm, diagonal/unipotent flows, the Mautner
  phenomenon, mixing of noncompact one-parameter flows (Morris Thm 3.2.9; statement and the opening of the proof read), and time-one mixing on X_2.
  This supplies every PM.4 request item.
- §4.14 (C, α)-good functions, Kleinbock–Margulis Theorem 5.2 and its unipotent corollary (Theorem 5.3). The
  corollary strengthens the base packet's Dani–Margulis node.
- §4.15 Borel density (Morris 4.7.1) and the three Oppenheim auxiliaries: subgroups between SO(2,1)° and SL₃(ℝ),
  closed orbits giving rational forms, and the reduction from n ≥ 4 to three variables.
- §4.16 The Siegel transform, mirabolic unfolding, invariant measures on ℝⁿ∖0, and the primitive mean value
  theorem with constant 1/ζ(n) (Miller's notes §§4, 6, 15). Together these prove the base node `siegel-mean-value`.
- §4.17 Duke-type carriers: CM point packets, oriented closed geodesics with length 2 log ε_D and orientation
  reversal (DIT §2), harmonic Weyl sums, and Weyl's criterion on S².

## Decisions a reviewer should check

- **Base-packet nodes re-pointed in `restructure` (entry 1).** The base packet cannot be edited. Entry 1 lists which
  base GN.4 gaps the new nodes close (Davenport/Rogers, Mahler bounded basis, Dani–Margulis, Oppenheim auxiliaries,
  Siegel). Ratner's theorems and Howe–Moore along arbitrary sequences keep their gaps.
- **Duke-type equidistribution on the modular surface is not planned here (restructure entry 2).** This covers
  Duke Thm 1 and DIT Theorem 2/(4.4)/(4.5)/Props 1–2, i.e. DIT items 51, 53–55, 69–71, 146, 148, 150, 153, 154.
  Their inputs are AutomorphicSpectralTheory, MetaplecticAutomorphicForms, AnalyticNumberTheory (Siegel) and
  FuchsianOrbifoldsPartII (Nielsen cores F_A), all above GN's tier 3. The proposal moves these theorems, and the base
  node `duke-spherical-equidistribution`, to the accepted Part II `GeometryOfNumbersPartIIToralJoinings`
  (PAPER-KHAYUTIN-19 route 1). GN.4 keeps only the carriers. This also removes the base packet's MP.7 tier-move gap.
- **Unipotent clause of Bhargava–Shankar Prop 2.5 (sourceIssue GN/E401, gap, new).** Davenport's argument applied
  to R′ = uR yields projection volumes of R′, not of R. The statement holds through the reorganised fibre/superlevel
  induction of `unipotent-davenport-transfer`; please check that proof outline.
- **Morris Thm 3.2.9 misprint (GN/E402, new).** The mixing limit is printed as ‖φ‖₂‖ψ‖₂; it should be ∫φ·∫ψ.
  Page 103 was rendered and checked.
- **Cylindrical algebraic decomposition is not at the pins.** CAD and Tarski–Seidenberg are on Tau Ceti main and
  TauCetiRoadmap RealAlgebraicGeometry Layer 6, but that roadmap is not an atlas stage, so no request can name it.
  The dependency is recorded as a gap and an upstreamNote.
- **Barroero–Widmer is planned for semialgebraic families only.** That is the only case BLS uses, and no library or
  roadmap plans o-minimal structures.
- **Planets.** The base packet already shows six on GN.4. This packet adds six (Widmer's lattice-point count,
  Van der Corput lattice-point bound, Space of unimodular lattices, Mixing of one-parameter flows, Quantitative
  nondivergence, Siegel transform). Restructure entry 3 proposes sub-layers GN.4a–d so that each shows at most six.

## Requests from other packets to GN.4, and how each is handled

- ArithmeticStatistics ST.2: the Davenport request is supplied by the base node plus §4.6; the BSW II §5 skew
  counts by `skew-singular-symmetric-count`.
- DiophantineApproximationAndTranscendence DT.0: Evertse 2.20/2.21 is supplied by `max-norm-covering` (constant n)
  and `transference-minkowski-constant`.
- ProbabilisticAndMetricNumberTheory PM.4 is supplied by §4.13: quotient topology, Borel structure, invariant
  probability, a_t, sup-norm Mahler, time-one mixing and the transpose convention.
- SieveMethodsAndPrimePatterns: the Khayutin L(C_l, θ_l) input is supplied by §4.10 (θ = 131/208 + ε rests on the
  Huxley gap) and the Widmer counts by `widmer-lipschitz-count`. The codimension-two geometric sieve is planned in
  ArithmeticStatistics ST.2 (`quantitative-ekedahl-geometric-sieve`).
- HeegnerPointEulerSystems HE.8 asks for S-arithmetic Ratner over F_P. That is not GN.4, whose dynamics are real;
  it goes to the toral-joinings Part II.

Every routed paper item is accounted for in `routing`. GS (1.6), the class-number average, needs GS Theorem 1.1,
which is routed to CA.4; GN.4 supplies the count.

## Red-team finding RT-AREA-algebraicnt-1/1

Roadmap-level metadata is outside this job's files. Each GN.4 supplier edge is stated in the nodes that use it,
with request entries: AA.2, AA.3, GlobalNumberFields Layer 3, and RepresentationTheory/LieGroups Layer 2.
Restructure entry 4 records the supplier-stage → GN.4 links in the form the verdict prescribes, as the GN.1 and
GN.2 follow-ups did.

## Consumers to update

- PM.4, DT.0, ST.2 and SieveMethods can cite the node ids listed above in place of the bare stage `GN.4`.
- At assembly, apply restructure entry 1 to the base packet's GN.4 nodes.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet, with the worker declaration index: 0 errors, 0 warnings.
  Every baseline declaration is in the index at Mathlib 082e2d3.
- `lean-check` of the suggested file at Tau Ceti f790474 / Mathlib 082e2d3: exit 0, 81 warnings, all
  "declaration uses `sorry`", no errors and no other warnings.
- Typing coverage: 98 of the packet's 251 API, test and theorem names are typed. The rest are listed by section in
  the file's closing comment "Statements not typed at the pins": their carriers are not at the pins, or they need
  auxiliary data the file does not build.
- The reader is rendered from the packet (every node appears once). It contains none of the words "optional",
  "deferred", "later" or "sorry".

## Sources read (all free)

- Barroero–Widmer arXiv:1210.5943, §§1–4.
- Bhargava–Shankar arXiv:1006.1002v2, physical p.14.
- Browning–Le Boudec–Sawin arXiv:2006.02356v1, §§2–4 (p.4 rendered).
- BSW arXiv:2207.05592v1, §5 (published corrections taken from the reviewed extraction).
- Evertse dio19-2, §2.4.
- Widmer arXiv:1204.0927, §5.
- Koymans–Milovic arXiv:1809.09597v1, Lemma 3.1.
- Khayutin arXiv:1710.04557v3, §§9–10.
- Ivić–Krätzel–Kühleitner–Nowak arXiv:math/0410522, §3.1.
- Ghosh–Sarnak arXiv:1706.06712v3, §7.
- LWZB arXiv:1907.05002v2, Lemma 12.8.
- Xue–Kurkoski–Viterbo arXiv:2502.10728v1, §II.
- Morris, *Ratner's theorems on unipotent flows*, arXiv:math/0310402: §1.2, §3.2 (to the opening of the proof of 3.2.9), the statements of 4.7.1 and 4.8.5 (p.103 rendered).
- Kleinbock–Margulis arXiv:math/9810036, §§3, 5.
- Miller, Rutgers lattice notes, §§4, 6, 15.
- Eskin, Luminy notes, §1.
- DIT, Annals 184 (free), §§2, 4.
- Duke 1988, author copy, §1.

SHA-256s are in the packet.

## Sources not read

These are paywalled, so their statements are taken from the citing papers (gap "Primary sources read only through
citing papers"):

- Davenport 1951 and its corrigendum.
- Schmidt 1968.
- Eskin–Katznelson 1995.
- Le Boudec 2018.
- Blomer–Granville 2006.
- Davenport 1963.
- Huxley 2003.

Borel's Bull. AMS survey was refused by the AMS site to scripts. Basu–Pollack–Roy was not reachable.

## What remains

The four gaps:

- Huxley's method.
- The primary sources above.
- CAD not being at the pins.
- General Howe–Moore and Ratner.

Plus the lemma-level splits of `quantitative-nondivergence` (KM §4) and `semialgebraic-family-lattice-count` (BW
Lemmas 2.2–2.4).
