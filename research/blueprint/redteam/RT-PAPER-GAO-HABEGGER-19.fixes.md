# FIX-RT-PAPER-GAO-HABEGGER-19

Codex `codex-J6LwjP`, 30 September 2026. Refs #4983. Bot comment 5917092503 confirmed claim 5917089705; the full issue was reread after confirmation. Base `b2770d4`. The issue excerpts three findings; the verifier has nine, eight confirmed and /5 rejected. This applies all eight confirmed findings.

## Result and scope

The extraction now contains 91 items (1 library, 10 planned, 80 missing), 11 routes, 23 prerequisites and E1–E30. Original item ids 1–76 remain stable. Original E1–E27, including their independent verdict objects, remain unchanged. The path statement in item 30, attacked by rejected /5, is unchanged. Every missing item is routed exactly once.

Only the four assigned files are changed: extraction, reader, paper review JSON and this report. No packet, generated queue, `make_queue.py`, upstream roadmap or other paper is edited. The Néron blueprint does not yet exist; IG and C0 are partial. Exact continuation requests are in `blueprintRequests`. This completes the extraction fix, not the blueprints' recursive proof closure.

The fixer previously performed the independent red-team verification #4092; this is permitted implementation work, not a new independent review. The eventual REV-FIX must be performed by another worker. The earlier paper review was by Claude Code `cc-442dc5`. Its full JSON is preserved as `historicalReview`; current fix annotations and route explanations are explicitly attributed to Codex. No independent verdict for new routes or E28–E30 is fabricated.

## Findings

1. **/1 — canonical routes and protected supplier.** Routes 6 and 7 now use `AbelianSchemesAndArithmeticModuliPartII` and `HodgeStructuresPartII`, with canonical `DESIGN-…` jobs. Brief import/export references, route 9 and the reader agree. Historical aliases remain explicit metadata. The joint Betti tranche from GH19 route 6, DGH21 route 5 and GGK26 route 5 is a required supplier, protected at the start of the brief so excerpting retains it. It cannot be deferred while the height consumer promises Theorem 1.4. Theorem 5.1 → Lemma 6.2 was freshly checked in v3 p.31 and Annals p.563. `designDependencies` records Hodge → Betti → heights. The queue still has `after: []` for the height design; the maintainer action below is coordinated with BENOIST-19/1 rather than a competing mechanism fix.

2. **/2 — split good reduction from exactness.** Item 15 now states only the Néron mapping property, including its smooth test-scheme hypothesis. New item 80 is the characteristic-independent good reduction of subvarieties and quotients, without identifying a model with its closure. New item 81 puts characteristic-zero residue fields on the entire exact-sequence/closed-immersion assertion. This follows the verifier's correction: BLR §7.5 Proposition 3(a) has a local prime-to-complementary-degree condition, and Proposition 2 requires residue characteristic zero for the immersion. The fresh page-image reading of pp.186–187 confirms both. The actual GH use is a smooth complex curve, Annals p.561. Both missing items route to **derived R11.5 nodes**, after the good-reduction criterion and importing R11.1 forwards. This avoids the forbidden R11.5→R11.1 cycle. Item 28 and route briefs import the derived theorem. Xie–Yuan shares item 80; its characteristic-p model repair cannot inherit item 81's stronger assertion.

3. **/3 — geometric coverings downstream.** Route 5 moves item 22 from IG.0 to IG.3, retaining finite étale coverings up to isomorphism. New item 77 states the smooth quasi-projective complex comparison; it is **missing**, not falsely planned from a curve contract. New 78 is topological finite generation, and 79 is algebraically closed base-extension invariance in characteristic zero with geometric basepoints. All route once to IG.3. Curve/Belyi Riemann existence is reused for the curve application in Lemma 5.8, Annals p.558; the arbitrary-dimensional Lemma B.2 needs the broader source request, p.596. The IG.0→IG.1→IG.3 direction is preserved. Generic profinite counting can stay upstream. The assigned historical review's obsolete IG.0 reason receives a fix-worker annotation, with its original preserved.

4. **/4 — three omitted printed slips.** E28 changes endomorphism to automorphism in Remark 4.2; the zero torus endomorphism contradicts the required fibrewise isomorphism. E29 supplies π₁-equivariance in the Hom formula, confirmed against Annals p.556's image and Deligne (4.1.3.2), p.43. Its counterexample uses a constant elliptic factor alongside a varying elliptic family; the cross-fibre map cannot extend, while the fixed-part inclusion actually used is equivariant. The published Grothendieck bibliography number is [23], versus v3 [24]. E30 repairs the Ax reference to [3], the algebraic-group theorem already used by the introduction. Each issue has both version locators and fresh bounded correction searches. Items 25/31/40 point to them. New issues have no copied review verdict.

5. **/5 — rejected, unchanged.** The verifier rejected the claim that the path statement is unsupported. Item 30 does not demand the problematic combined analytic strengthening. The special GH relation also permits replacing γ(s) by a counted constant γ′ and setting a(s)=γ′x−y(s), preserving the required starting value. No E31 is introduced and item 30 is preserved verbatim. The current fix relies on the verified rejection; it does not claim a new full Habegger–Pila reading.

6. **/6 — general inputs, with the corrected owner.** Added invariance of domain (82), finite-dimensional real constant rank (83), integer-character classification of closed torus subgroups (84), and Riemann-surface good-cover refinements (90) to the Betti tranche as shared auxiliaries. No exact atlas stage was found for these forms; resolving a general owner remains an explicit design task. The analytic-space input is split into regular-locus density (85), connected smooth locus and paths (86), identity principle (87), local dimension/isolated points (88) and isolated curve singularities (89). Reducedness, irreducibility and dimension conditions are explicit. These five route to **ComplexComparisonPartII:C0 and its tracked extension**, which draft CV.1 already imports. No temporary Betti copy of analytic-space machinery is created. Item 91 imports Mathlib's Baire theorem with nonempty Baire space, countable index, closed sets and cover hypotheses. The actual application uses relative interiors/closed sets in V.

7. **/7 — partial library reuse.** Item 54 cites `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd` as the strict-volume two-point baseline. It now states the needed bounded measurable-set multiplicity theorem, with no convexity/symmetry assumption, and specifies the averaging over a unit fundamental domain required from GN.1. Item 47 cites `IsDedekindDomain.flat_iff_torsion_eq_bot` only for the affine core; the integral dominant scheme statement and pure fibre dimension remain missing at SF.0. Item 9 cites `NumberField.absLogHeight₁` for algebraic-element height/affine [1:x] comparison, alongside relative `Projectivization.logHeight`; the full normalized projective API remains planned at RP.0. None of these partial declarations is promoted to full library coverage.

8. **/8 — prerequisite metadata.** Added linked Ax 1972, Grothendieck 1966 and Koizumi 1976 records with the exact item/use. Ax and Grothendieck bibliographies were read in Annals pp.600–601; Koizumi's metadata was checked through its DOI/JSTOR entry and a primary mathematical paper's bibliography. This is not a claim to have read those three complete original proofs. Five additional entries identify BLR, Grauert–Remmert, Weil, Whitney and SGA/Cadoret behind the newly extracted inputs. Source-read scope and future blueprint proof work are distinguished.

9. **/9 — structured provenance.** The source paragraph now distinguishes the original 22 September preprint reading, the independent 23 September published collation and the current 30 September focused reading/hash verification. Explicit `sourceVersions` records both versions and historical attributions. Fresh scope is exact; no fresh full reading is claimed. The old “not collated” sentence is preserved as a historical access failure rather than left as the current state. A passing heuristic is not presented as mathematical collation evidence.

## Source and library record

Fresh downloads/hash verification: 30 September 2026. Main-paper history: full v3 read by cc-fb70e5 on 22 September; full v3 and published collation by cc-442dc5 on 23 September, as documented in the original review.

| Source | Fresh reading for this fix | SHA-256 |
| --- | --- | --- |
| [GH arXiv v3](https://arxiv.org/pdf/1801.05762v3) | pp.15,19,21,25,29,31,58 | `ffe408dc6ba034b2a635488600decace1e89d61ad04860c391bef9409f2fd34e` |
| [GH Annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n2-p03-s.pdf) | pp.532,537–538,544,548,550–552,554,556,558,560–563,575,596,600–601,603–604; image p.556 | `09304f589d44e7c44b050448bcc3317680e4954a47cad126762350e6e9a13bfd` |
| [BLR scan](https://math.arizona.edu/~cais/scans/BLR-Neron_Models/neron4.pdf) | page images pp.184–189, especially §7.5 Props.2–3 and proof pp.186–187 | `88610c3ffba4eeaec738bb635a54a12c7fd6f4c69597045914feb6f33da284aa` |
| [Deligne Hodge II](https://www.numdam.org/article/PMIHES_1971__40__5_0.pdf) | pp.43,50; image p.43 | `748edefb44fded8af67869abfed87062d66977d25b5d12f7d014f1810a063c3f` |

Fresh searches checked the [Annals page](https://annals.math.princeton.edu/2019/189-2/p03), [arXiv history](https://arxiv.org/abs/1801.05762), [Habegger's research entry](https://numbertheory.dmi.unibas.ch/habegger/pages/research.html) and bounded title/author/erratum queries. They found no explicit notice correcting E28–E30. This is not exhaustive novelty, and the earlier verifier's Crossref search is not claimed as rerun here.

Pinned Mathlib statements were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`: GeometryOfNumbers.lean:52, RingTheory/Flat/TorsionFree.lean:138, NumberTheory/Height/NumberField.lean:137–146, Topology/Baire/Lemmas.lean:257 and its section hypotheses. Targeted source/declaration searches in both pinned trees found no exact named invariance-of-domain, real constant-rank, torus-annihilator classification or topological good-cover theorem; unrelated algebraic tori and Besicovitch hits were not treated as suppliers. Such searches are evidence, not a proof of universal absence. The reviewed R11.1/R11.5, IG.3, C0, GN.1 and RP.0 audits, current packets, CV.1 contract, canonical queue records and `paper_designs`/`accepted_routes` code were read. No library clone/build/cache was created.

## Concrete continuation outside the assigned files

1. **Queue mechanism and dependency:** apply the existing BENOIST-19/1 repair to `make_queue.py`: preserve required supplier portions when merging parent groups, normalize aliases, and materialize dependencies. Add `DESIGN-AbelianSchemesAndArithmeticModuliPartII` to `DESIGN-HeightsRationalPointsAndObstructionsPartII.after`. Preserve the joint GH19/DGH21/GGK26 Betti portion even though Kings–Sprang is first. Existing independent source directions may be split only with the required supplier retained and connected. Do not create another mechanism issue for this instance.
2. **Néron owner:** create derived R11.5 nodes for GH/80–81 using the exact statements, source locators and forward R11.1 prerequisites. The packet is absent. Coalesce Xie–Yuan's good-reduction item with GH/80; retain its separate characteristic-p repair and do not use GH/81 there.
3. **IG owner:** add GH/22,77–79 to IG.3, which is currently not_read. Reuse curve comparison; add the smooth quasi-projective comparison and field-extension hypotheses before the geometric bounded-cover theorem. No reverse edge to IG.0.
4. **C0 owner:** continue the partial packet's analytic-space extension with GH/85–89. Reuse the same carrier for CV.1 and Betti; no invented accepted extension-stage id or smooth/nonreduced conflation.
5. **GN.1 owner:** add GH/54's bounded measurable multiplicity adapter to the actual two-point baseline. The current packet's mention of Blichfeldt is not the needed node. An average-count proof over the lattice fundamental domain has no convexity assumption.
6. **Independent route acceptance:** new routes 10–11 have no historical verdict. `accepted_routes` currently excludes them. The REV-FIX/maintainer must record independent acceptance and then refresh source jobs. The fixer leaves the historical acceptances for 1–9 intact with scoped annotations, and does not self-approve the new routes.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAO-HABEGGER-19.result.json`: pass.
- Applicable §18 issue/version checks: pass. Standalone `check_errata.py` expects an errata-v1 ledger; the extraction uses its issue/version functions.
- Intake `check-files` on the four assigned files: pass.
- Original 76 ids and all 27 old source issues/verdicts preserved; rejected item 30 unchanged; complete original review preserved; 80 missing items routed exactly once; selected dependency graph acyclic; no R11.5→R11.1 or IG.3→IG.0 back edge; whitespace and file scope: pass.
- Exact finite checks: 100 shift cells give the nonconvex set's average lattice count 12/5 and maximum 6; four torsion orders witness the zero-map obstruction and unimodular automorphism; two monodromy generators distinguish equivariance from arbitrary integer linearity.
- No Lean file is assigned or compiled. No pinned build was available or created. No language server or background process remains after submission.

## Reproduce the finite checks

Python 3 standard library. These illustrate the corrected interfaces; they do not prove the general scheme, analytic or asymptotic theorems. Source PDFs and scratch are removed after submission; this code and the hashes retain the evidence.

```python
from fractions import Fraction as F
from itertools import product
# A nonconvex, disconnected and nonsymmetric bounded measurable set.
# U=([0,2/5) union [2,12/5) union [4,22/5)) x [0,2).
# Its lattice count is constant on the 10x10 half-open shift cells.
intervals=[(F(a),F(a)+F(2,5)) for a in [0,2,4]]
counts=[]
for a,b in product(range(10),repeat=2):
 x,y=F(2*a+1,20),F(2*b+1,20)
 count=sum(any(l<=i+x<r for l,r in intervals) and 0<=j+y<2
           for i,j in product(range(-1,7),range(-1,4)))
 counts.append(count)
volume=F(3)*F(2,5)*2
assert F(sum(counts),100)==volume==F(12,5)
assert set(counts)=={0,6} and max(counts)>=volume
print('Blichfeldt: 100 shift cells, average 12/5 = volume, maximum 6')
# Finite torsion witnesses: the zero endomorphism cannot preserve a torus
# isomorphism; a unimodular shear is bijective on every tested q-torsion set.
for q in [2,3,5,7]:
 points=list(product(range(q),repeat=2))
 assert len({(0,0) for p in points})==1<q*q
 assert len({((a+b)%q,b) for a,b in points})==q*q
print('Remark 4.2: zero-map obstruction and automorphism check at 4 torsion orders')
# Linear-algebra witness for the omitted equivariance condition.
def mul(A,B):return [[sum(a*b for a,b in zip(row,col)) for col in zip(*B)] for row in A]
T=[[1,0],[0,1]]
fixed=[[1,0],[0,1],[0,0],[0,0]]
cross=[[0,0],[0,0],[1,0],[0,1]]
for U in [[[1,2],[0,1]],[[1,0],[2,1]]]:
 M=[[1,0,0,0],[0,1,0,0],[0,0,*U[0]],[0,0,*U[1]]]
 assert mul(M,fixed)==mul(fixed,T)
 assert mul(M,cross)!=mul(cross,T)
print('Lemma 5.6: fixed inclusion equivariant; cross-fibre map fails at 2 generators')

```
