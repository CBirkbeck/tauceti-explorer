# BP-ColemanIntegration — geometric boundary normalization

Codex — codex-hjdg0j. Refs #698. Claim 5852748641 was explicitly confirmed by bot 5852749680; the complete issue was reread after confirmation. This is a continuation of the merged packet, not an independent review.

## Result and remaining input

Eleven nodes are added: two L0 logarithm lemmas and nine L2 declarations (including promotion of the existing zero-value API). The new chain proves, at blueprint level, that the actual scalar expression R_a(1+p^(n+1),v) tends to zero for every v≠0,1 in C_p and every branch. It gives bounded-log sequential vanishing for D, scaled geometric and quotient limits, eventual admissibility, the exact five-argument rewrite, determination of an eventual constant, and a reduction from algebraic constancy to the full scalar identity. Five typed tests include p=2, an exact p=3 argument calculation, and a nonzero constant that survives the boundary test.

The proof does not assert global continuity at either puncture. It uses L(c p^m)=L(c)+m a and the native bound |m|≤1; the quotient adds the term −L(1+p^(n+1)), which tends to zero. At the ordinary point v, the existing continuity theorem supplies the limit D(v). No finite-extension restriction on v or on the branch parameter is needed for this sequence.

The remaining L2 task is precise: extend pullback to a regular-image extra source end; prove the actual five-term expression is a Coleman function on the existing four-puncture model; obtain its global Coleman constant; and compare that same constant with the actual values on the whole punctured residue discs, including the sequence approaching 1. Constancy only on the tube does not suffice. The final conditional theorem accepts constancy on all admissible algebraic first coordinates, forces its constant to zero by the boundary sequence, and uses the inherited density reduction. The independent field-general projective/Bloch comparisons remain. Zero derivative alone is not used as constancy.

All five gaps and all twenty requests remain; no layer is closed. The other gaps are the general-curve de Rham comparison, nonfree differential-module gluing, the Besser–de Jeu regulator proof and coefficient-valued Artin L-functions.

## Preservation and counts

167 unchecked nodes: 19 definitions, 11 constructions, 90 lemmas, 37 theorems and 10 comparisons. There are 257 API entries,148 packet tests (133 definition/construction tests),105 typed examples,22 planets,121 baseline references and 25 source findings.

155 of 156 inherited node objects are unchanged. Only the global five-term parent gains a prerequisite and narrows its remaining proof description; its mathematical conclusion and source records are retained. All 112 inherited baseline records,24 prior findings,20 requests,22 planets and coverage statuses are preserved. The new source finding is unreviewed. The reader keeps its inherited full content and adds all eleven declarations, with hypotheses, proofs, dependencies and tests. All new assertions have actual typed signatures; the promoted zero-value declaration uses its existing signature.

## Sources and verification

The current owner document and atlas extract, four reviewed AUDIT23 rows, all touching links/overlaps and accepted RS14 logarithm ownership were read. All 156 node statements/hypotheses were inspected, with complete detailed reads of the twelve directly relevant inherited node objects. The other retained proofs and APIs are inherited evidence, not claimed newly audited. The upstream ContourIntegration and AnalyticToricGeometry documents were read as style/model inputs. No general analytic, field or topology carrier is replanned.

Furusho, arXiv math/0304085v2, physical/printed pp.7–12, was freshly downloaded, hash-verified and read in full in batches of at most three pages. Page 11 was inspected as an image. SHA256: fd2391bd4dbf328667f0fb1b46d979c4814892c2c2cd14051de8d674d4c5b9fb. The geometric boundary proof is a worker deduction from the normalization and local analytic inputs. E25 records the preprint's misprinted limit point in Lemma 2.15: z→1 must be z→0. The direct publisher PDF request returned an HTML cookie/access page; the author list, arXiv version history and targeted correction search did not identify an erratum. The finding makes no claim about the unavailable published wording.

Nine new baseline declarations were read at the pin and their source blobs verified; two already-recorded analytic/norm declarations used by the new chain were reread. The catalogue and pinned Mathlib/Tau Ceti searches found no existing Coleman boundary adapter. The indexed blueprint checker reports zero errors and zero warnings. Source-finding schema/version checks pass. The graph has 593 internal edges and 905 total edges and is acyclic. Each new declaration matches its reader statement and suggested name.

The actual combined suggested file compiles with zero errors and 357 expected placeholder warnings only. Its actual PMIA and Dirichlet suggested imports compile with 317 and 141 placeholder warnings respectively. All 8482 reached Mathlib source modules match the pin and cache source bytes. All 20 reached Tau Ceti modules were freshly compiled from pin-verified sources. Lean version 4.34.0-rc2. Suggested SHA256: 4cf9ae1362efedb04eed31e330b4cc119559017d19366b6c35edb0a7382568c3. No auxiliary Lean proof file was created.

Exact rational arithmetic checks 7452 argument cases at p=2,3,5,7, including 7444 admissible cases,8 collision controls and 2565 special-unit cases. They verify original inverse arguments, denominator exclusions, p-adic valuations and the explicit eventual-collision threshold. They are finite tests of the decomposition, not proofs of analytic convergence or the open constancy hypothesis.

## Resume

Start with ColemanIntegration:L2/five-term-from-algebraic-constancy and discharge its explicit hypothesis by the four-puncture membership/constancy comparison. The boundary normalization is supplied by five-term-boundary-limit and five-term-boundary-constant. Preserve the distinction between the tube, end germs and actual punctured-disc values. The new limit proof does not depend on the global five-term theorem.

The preceding worker's handoff is retained below solely as historical provenance. Its scratch-proof workflow and old counts are not assertions about this continuation.

Final publication check: main `9259a46d027f801a362476a366170bdee9033db9` matches all 63 captured inputs after three supplier updates were reconciled; all four predecessor output blobs are unchanged. The Dirichlet additions concern L4 finite Eisenstein coordinates and the locally analytic additions concern L4 Hasse resolvents. The imported L0/L1 node records are unchanged. The actual current Dirichlet seed and the combined Coleman seed were recompiled successfully. The issue body and winning claim confirmation are unchanged. The exact four-file intake reports zero problems.

---

# BP-ColemanIntegration — algebraic-input density

Codex — codex-7e92bd. Refs #698. Own-job follow-up to merged PR3176 under
WORKERS. Original claim5852469617 was confirmed by bot5852470358; the winning
reply was fetched and the entire issue reread. No second claim was made.

Totals: **156 nodes** (19 definitions, 11 constructions, 81 lemmas,
35 theorems, 10 comparisons); **257 API entries**;
**143 packet tests**, including 133 definition/construction
tests; **100 typed examples**; **22 planets**;
**112 baseline references**; **5 gaps**, **20 requests**,
**24 source findings**, **0 closed stages**. Every implementation status is unchecked.

## Change and exact boundary

Seven L2 nodes promote the already present local-analytic and weight-one APIs,
prove continuity of the actual dilogarithm and scalar five-term expression,
prove openness of the special-unit admissible locus, give its algebraic density,
and reduce the full scalar identity to an explicit algebraic special-unit input.
Five new signatures and five typed tests append to the preceding seed. No new
carrier, operator, logarithm or general density theorem is constructed.

The admissible locus excludes 0, 1 and collisions. The special-unit condition
is imposed only on the second coordinate: |y|=|1−y|=1. In particular the point
(3,2) at p=3 is included although its first coordinate is not a unit. The
completion's dense algebraic-closure pairs can approximate within this open
locus, retaining all conditions. A fixed finite extension is not declared
dense in C_p. The source of the approximating field may vary.

The reduction theorem explicitly assumes the vanishing of the actual R_a on
algebraic pairs in this locus. It extends that identity by continuity, then
uses the existing signed scalar reduction to reach all admissible C_p pairs.
It does not prove the finite-extension Coleman membership, global constancy
or boundary value. Zero local derivative is not treated as global constancy.
The projective and Bloch comparisons remain separate.

148 of 149 previous node objects are unchanged, including all ten preceding
puncture-model/differential nodes. The global five-term parent alone gains
the new exact prerequisite and narrows its remaining-work statement/proof.
Its conclusion and source records are unchanged. All 105 prior baseline
records, 24 source findings, 22 planets, requests and stage statuses are
preserved. The L2 coverage and corresponding special-unit gap are narrowed;
all other gap/coverage records are unchanged.

## Sources and verification

Read the full owner document, all four reviewed AUDIT23 rows, the relevant
AlgebraicCurves and AdicSpaces links and LocalFields logarithm overlap, and
the current actual polylogarithm, dilogarithm, scalar-defect and global-parent
proof/API interfaces. Primary binding/audit/model inputs were byte-checked;
the fresh source-issue registry and errata register match the primary's read
versions. The PMIA supplier is the exact PR3172 packet/seed. The current
Dirichlet packet matches the six changed L1 records read during PR3175.
Its seven added L4 nodes are outside this task.

Public [Furusho arXiv v2](https://arxiv.org/pdf/math/0304085v2), pp.7–10,
read in full, especially Definition2.9 and Proposition2.11; accessed
27 September2026, SHA256
`fd2391bd4dbf328667f0fb1b46d979c4814892c2c2cd14051de8d674d4c5b9fb`.
The continuity and completion-density decompositions are worker deductions.
This is not a new full-source reading claim. No new source finding is asserted.

The exact baseline statements on completion, product density, nonzero-radius
spheres, open inequality loci, extension of continuous equalities and
analytic continuity were read. Seven new baseline records are added; the
unmodified pinned declaration index is used. Existing topology is cited,
not replanned. The packet inventory contains no existing Coleman density
adapter supplying this precise admissible/special-unit reduction.

The actual combined suggested file compiles with **0 errors and 342
expected placeholder warnings only**. Its actual PMIA and Dirichlet imports
compile with **255 and 107** placeholder warnings.
All **3923 Mathlib source modules** match the pin. The one reached
Tau Ceti module is freshly compiled from its pinned source with no warnings.
Seed SHA256: `54d99a0e868caafaacd534c44330f327853f8ee39e27da84ba0d3561a8217832`.

Seven complete scratch lemmas check the open-locus/density extension and the
logarithm/dilogarithm/rational-argument continuity steps, with **0 errors,
0 warnings and 0 placeholders**. The topology file reaches2354 pinned Mathlib
modules; the continuity file reaches2360. Their hypotheses retain the actual
analytic inputs, and these checks do not implement the polylogarithm.
Topology proof SHA256: `89093bb2f247ecf1aa9d8d47384caa57ad58754567f4e17b19024947f4e78d15`.
Continuity proof SHA256: `7b93725b2a5edaab7aa51ba73a6c964bb82b78271d270c0b84e16b0ce371e967`.

**9,119 exact finite assertions** check 2,989 rational perturbation pairs at
p=3,5,7 and 49 pairs in the unramified dyadic quadratic model with a root of
X²+X+1. Perturbations have norm strictly smaller than the minimum of
|x|,|1−x|,|y|,|1−y|,|x−y|; all five norms are preserved. Controls exclude the
diagonal and zero and include small first coordinates. The dyadic model uses
the integral basis 1,ζ reducing to F₄; the norm is 2 to the negative minimum
coefficient valuation. It distinguishes algebraic special units from the
empty special-residue locus in F₂. These are finite stability tests, not a
proof of density or the remaining Coleman vanishing hypothesis.

The unmodified-index blueprint validator reports zero errors and warnings;
the exact four-file intake reports zero problems. The dependency graph is
acyclic, and reader/signature/test parity passes. Fresh main `96c6e79eae6728d86946aec13032d536b15d5a08`
matches all 58 captured inputs and all four predecessor output blobs.
The issue body and own winning confirmation5852470358 are unchanged; #698 is
available and review #373 is unclaimed. No manual merge or independent review
was performed.

## Continuation

Supply the hypothesis of five-term-from-algebraic-special-units. Extend the
existing Coleman pullback comparison to an extra source end whose image is
a regular target point, prove that the actual scalar defect belongs to the
four-puncture Coleman algebra, apply Coleman uniqueness, and evaluate the
constant by the precise boundary normalization. The conditional density
adapter then discharges passage to arbitrary C_p points. Continue the
independent field-general projective and Bloch descent comparisons.

The other four gaps and all supplier requests remain as recorded in the
packet: general de Rham comparison, nonfree differential-module gluing,
the Besser–de Jeu regulator proof and coefficient-valued Artin L-functions.
The source and coefficient conditions for positive integer values remain.
The preceding handoff is retained in [PR3176](https://github.com/CBirkbeck/tauceti-explorer/pull/3176).
