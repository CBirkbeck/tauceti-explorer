# Design handoff: K3 surfaces and symplectic boundedness

Issue #3461; agent Codex; session codex-x93vaL; 18 October 2026.

The target-level planning pass is complete and ready for independent review.
This is a complete design submission, not a checkpoint. Mathematical closure
has not been claimed: every stage is planned, none is closed, and every node's
implementation status is unchecked.

## Delivered scope

The roadmap, packet, reader and suggested statement file use the same twelve
layers. All 97 Charles items routed to this owner and all five SSTT items are
accounted for individually by the packet's `inputCoverage` (102 distinct
items). General results assigned to other owners remain supplier contracts.

| Stage | Targets | Status | Content |
| --- | ---: | --- | --- |
| K3.0 | 4 | planned | K3 surfaces, numerical Picard lattices, primitive cycle classes, lifting |
| K3.1 | 7 | planned | Mukai lattices/vectors, Riemann–Roch, stability, IHS and Hilbert schemes |
| K3.2 | 6 | planned | Stable moduli, BB forms, integral Mukai maps and specialization |
| K3.3 | 4 | planned | Primitive positive planes, Zarhin fourfolds and descent/Witt refinements |
| K3.4 | 4 | planned | K3 linear series, birational bounds, NS descent and finiteness |
| K3.5 | 6 | planned | IHS projectivity, deformation representatives, arithmetic periods and Torelli |
| K3.6 | 4 | planned | Global period coverage and symplectic birational boundedness |
| K3.7 | 10 | planned | Admissibility, polarized deformations and integral NS finiteness |
| K3.8 | 9 | planned | Arithmetic transcendental lattices, signed B-fields and twisted partners |
| K3.9 | 10 | planned | Simultaneous norms, partner sequences and conditional geometric Tate inputs |
| K3.10 | 5 | planned | Transcendental orthogonal datum, KS descent, integral points and specialization |
| K3.11 | 5 | planned | Picard jumps in all ranks and the rational-curve application |

There are 74 nodes: 11 definitions, 8 constructions, 52 theorems, 2 comparisons
and 1 application; 73 API items; 57 discriminating unit tests; 50 planets; and
3 baseline declaration references. Every definition/construction has its
uses, at least three API items and three tests. The reader states all targets,
their proof outlines, direct prerequisites, locators and acceptance criteria.

## Baseline and ownership

The pins are Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. The actual statements of
`TauCeti.IntegralLattice`, `TauCeti.Hodge.HodgeStructureOn` and
`LinearMap.BilinForm` were read at those pins. The first two are reused as
native lattice and Hodge carriers. Their geometry is not supplied by choosing
an abstract carrier.

The current read-only IntegralLattices and Completed/HodgeStructures roadmaps
were read, and current OrthogonalSpinGroups, Chebotarev, NumberFieldArithmetic
and library sources were inspected. The splitting-prime input uses current
Chebotarev Layer 10; local embeddings use current NumberFieldArithmetic Layer
5 completion maps. These are roadmap inputs, not baseline implementation
claims. No build was run in that read-only environment.

The reviewed library audit has no record for this new roadmap. Relevant
supplier records were read: the existing SF.5/R09 and GN.2 interfaces do not
prove the full requested geometry; GN.3 does not yet provide the needed
integral-lattice finiteness theorem. ComplexComparisonPartII:C5 is partly
built, and its exact proper de Rham–Betti, pure-Hodge, relative and Kähler
nodes are cited. No accepted audit record for the relevant CR/CP/MC leaves
was found. The packet does not turn those requests into implementation claims.

The finite-field Tate endpoints stay in MotivesAndAlgebraicCycles. K3.9
exports their geometric contradictions. Early Lefschetz (1,1), trace descent
and Tate–Brauer equivalence must be separated from that owner's late K3 Tate
register. A late K3.9→MC.7→K3.10 route is permitted for special-fiber divisor
algebraicity once its gates are proved; it cannot feed back into K3.9.

## Supplier requests and restructuring

The packet contains 24 requests, each with its mathematical contract and
consumer nodes:

- SchemeAndStackFoundations SF.2/SF.5: integral cohomology, Kummer, trace,
  intersection, surface GRR, Hodge index and linear-series inputs.
- AlgebraicModuliForArithmeticGeometry R09.4/R09.5/R09.6: representability,
  coarse moduli/gerbes, formal Picard theory, relative determinant lines,
  effectivity, projective relative partners and stable-map machinery.
- MotivesAndAlgebraicCycles MC.0/MC.2/MC.7: correspondences and realizations;
  independent early divisor interfaces; a separately ordered late Tate input.
- GeometryOfNumbersAndQuadraticArithmetic GN.2/GN.3: primitive embeddings,
  local unit norms, isotropic quotient determinants, maximal genera and
  integral-lattice finiteness.
- ComplexComparisonPartII C5: multiplicative cup/trace/Chern and family
  compatibility beyond the exact comparison nodes already cited.
- CrystallineCohomology CR.2/CR.3/CR.4, CohomologyComparisons CP.2/CP.5,
  FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3: filtration/Frobenius,
  low-degree freeness and integral specialization in their precise ranges.
- ShimuraVarieties V0/V2/V3/V6: arithmetic quotients, Baily–Borel, Borel
  algebraicity and the orthogonal KS extension described below.
- GrossZagierAndArithmeticHeights GZ.6: the required GSpin special-divisor
  infinitude theorem in signature (b,2), b≥3.
- Current Chebotarev Layer 10 and NumberFieldArithmetic Layer 5: simultaneous
  splitting primes and canonical degree-one completion embeddings.

Four embedded restructuring proposals keep these interfaces with their
owners. Three propose Part IIs: AlgebraicModuliStableTwistedSheaves under
AlgebraicModuliForArithmeticGeometry; OrthogonalIntegralModelsAndKugaSatake
under ShimuraVarieties; GSpinSpecialDivisorHeights under
GrossZagierAndArithmeticHeights. These Part IIs do not yet have stage IDs;
parent-stage requests are accompanied by explicit scope gaps. The fourth
separates early and late MC.7 interfaces. No files belonging to these owners
were edited. K3-specific moduli calculations, theta maps, divisor comparisons,
partner geometry and arithmetic applications remain here.

## Precise remaining work

The packet records 18 gaps, with consumer nodes and full details. Review and
closure should use those records and each stage's `remaining` list. The
principal work is:

1. Establish the K3 Picard/linear-series foundations and the exact
   finite-height/Picard-preserving lifting inputs.
2. Supply general relative stable/twisted-sheaf moduli, fixed-determinant
   gerbes, twisted GRR, period-index existence and numerical K₀ realization.
3. Check Mukai/Yoshioka's integral comparison and Beauville's Hilbert-scheme
   geometry, including the restricted Hilbert–Chow open stratum.
4. Check Fontaine–Messing/Elsenhans–Jahnel low-degree freeness and integral
   specialization, distinguishing unramified from ramified lifts and p=3
   endpoints.
5. Prove the primitive embedding, discriminant and integral-lattice
   finiteness contracts in the shared lattice owner.
6. Prove characteristic-two jet separation and birationality for the
   nonreduced-member branch of Charles Proposition 3.1, p.506.
7. Supply corrected IHS projectivity, arithmeticity, parallel-transport
   Torelli and global algebraic period coverage, not just local openness.
8. Supply both good-prime KS finiteness and all-prime maximal-lattice
   integral models, extension and special-endomorphism comparisons.
9. Separate early/late cycle interfaces and source their finite-field and
   characteristic-two qualifications without circularity.
10. Check Ogus deformation/ordinary-lift and Artin rank-constancy hypotheses.
    Prove a global positive power-lift of the auxiliary line bundle over the
    entire 19-variable formal base via the relative determinant correspondence.
11. Check the repaired original-field norm route or use the p≥5 LMS
    quadratic-extension route. Characteristic-two/three norm/moduli inputs
    remain separate gates for the all-characteristic geometric export.
12. Prove infinitely many constructed partners nonsuperspecial, or an
    adequate superspecial-partner finiteness theorem. A deformation of the
    starting surface does not prove this for its partners.
13. Prove relative projectivity and proportionality to a relative ample
    bundle for the growing-square partner class. Generic ampleness alone
    does not establish special-fiber ampleness.
14. Supply special-fiber divisor algebraicity with the KS realization and
    denominator control, using Q_T=−cup/2 throughout.
15. Obtain SSTT Theorem 1.8 from the GSpin height owner, including its required
    uniformity, rather than duplicating that proof here.
16. Read and verify the separate Charles 2018/Shankar–Tang 2019 inputs for
    ranks 18/19 and the rank-20 argument; the b≥3 theorem cannot prove them.
17. Match published Li–Liedtke Proposition 4.2/Theorem 4.3 to accessible v2
    Proposition 3.2/Theorem 3.3. Supply rigidifiers, proper stable maps,
    deformation dimensions and the non-unirational reduction argument.
18. Prove the passage from local potential good reduction to the simultaneous
    polarized smooth projective global model needed by the application, and
    the unirational-to-supersingular implication.

Start independent review with the ownership split and the K3.9 dependency
route. The most consequential unresolved interfaces are partner
nonsuperspecialness, relative ampleness, and all-prime K3 divisor algebraicity.
These affect endpoint proofs; they are not represented as established facts.

## Sources and correction record

The source register gives URLs, versions, access date and PDF SHA-256 hashes.
Only public primary PDFs were used. The cleared-library index was checked;
no restricted book was used and no source files or passages are submitted.
All result statements and source-issue descriptions are in our own words.

- Charles, *Birational boundedness for holomorphic symplectic varieties,
  Zarhin's trick for K3 surfaces, and the Tate conjecture*, Annals 184 (2016),
  pp.487–526: the mathematical text through p.523 was read throughout.
- Shankar–Shankar–Tang–Tayou, *Exceptional jumps of Picard ranks of reductions
  of K3 surfaces over number fields*, FMP 10 (2022), e21: introduction
  §§1.1–1.5, pp.2–5; §2 opening/§2.1, pp.7–8; §§2.4–2.5, pp.10–11;
  §9.1, pp.44–45. The full height proof was not read or replanned.
- Lieblich–Maulik–Snowden, published Annales ENS 47 (2014): Propositions
  2.1.2–2.1.3, pp.287–288; §2.3/Proposition 2.4.1 and proof, pp.291–293;
  §§3.1–3.5, pp.293–305, including Proposition 3.5.6.
- André, *On the Shafarevich and Tate conjectures for hyper-Kähler
  varieties*, Math. Ann. 305 (1996): §1, pp.205–210 and §9, pp.240–244,
  from the GDZ scan. Main Lemma 1.7.1 on p.210 was checked visually.
- Li–Liedtke, arXiv:1012.3777v2, 23 September 2011: §3, Proposition 3.2 and
  Theorem 3.3 with proofs, pp.9–11. The published Inventiones 188 (2012)
  pp.713–727 version was not obtained; its numbering and the rigidifier input
  remain explicit verification requirements.

Primary inputs not independently read include the complete Mukai/Yoshioka,
Beauville, Ogus 1979, Artin 1974, Lieblich–Maulik, Huybrechts 1999 plus 2003
correction, Sullivan/Markman/Verbitsky, Fontaine–Messing and
Elsenhans–Jahnel proofs; the integral orthogonal-model papers; the low-rank
Charles 2018/Shankar–Tang 2019 arguments; published Li–Liedtke and its stable
map/rigidifier foundations; and a global projective-model theorem. Their
needed statements are explicit targets/contracts/gaps, not claimed audited
proofs. Source acquisition should follow that list and the exact packet
locators rather than repeat a broad literature search.

The 24 accepted source findings inherited from PAPER-CHARLES-16 and its
independent review were rewritten and propagated. Rejected objections E3 and
E15 were excluded and their dispositions retained. Key conventions include
the rational discriminant multiplier v²/I²; primitive input planes; explicit
twisted integral spans; the negative gerbe for exp(+B); exact geometric
Brauer order; primitive crystalline H²(1); and the corrected partner square
and dual-correspondence degree. Only the first factor of the formal Picard
obstruction module has rank one. Its symmetric-power factor has rank
binomial(j+19,18); global power-lifting and torsion-freeness are the proof
requirements.

One additional source-interface gap, E27, records that André Main Lemma
1.7.1(ii), p.210, is not itself a special-fiber divisor theorem. The lemma
does contain an integral Z_ℓ Clifford comparison in its stated scope; it
must not be described as merely rational. The missing algebraicity and norm
comparison are separate inputs to SSTT §9.1, p.45. This is not a claim of a
counterexample or of novelty and needs independent review. The chosen
Q_T=−cup/2 convention gives cup square −2m rationally, or −2N²m after clearing
denominators, if the required isometry is proved. A nonzero rational negative
divisor already suffices for the rank-jump argument.

## Verification

The suggested file has 104 lines, two real-bodied coordinate definitions,
eight theorem signatures and seven examples. It uses existing rational
product/module/bilinear-form carriers. It does not introduce placeholder
geometric carriers or data definitions with omitted bodies. Heavy geometric
targets stay in the definitive reader.

`lean-check` completed with exit code 0 against the pinned Mathlib build;
the only diagnostics were 15 expected omitted-proof warnings. Available
memory was checked first. No Lean server or background compilation remains.
The blueprint checker reports 0 errors and 0 warnings. Submission-path/JSON,
omitted-data-body, routed-item, reader/packet and dependency consistency checks
are included in the pull request's validation record.
