# RT-AREA-langlands-2: fixes

Fixer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #3968, job FIX-RT-AREA-langlands-2).
- **Findings:** `RT-AREA-langlands-2.result.json`, 40 findings (3 high, 32 medium, 5 low), by `cc-39fac3`.
- **Verdicts:** `RT-AREA-langlands-2.review.json` and `research/blueprint/reviews/REV-RT-AREA-langlands-2.md`, by `cc-7b31c4`. All 40 are confirmed.
- **Scope:** the 35 confirmed findings of high or medium severity, /1–/35. The five low findings (/36–/40) are outside a fix job (PROTOCOL.md section 17); they are listed at the end.
- **Baseline:** everything below was checked at origin/main `ba5cc428`.
  - The graph checks use the atlas as `scripts/build.py` assembles it at that commit: accepted restructurings, links, promoted blueprints, decompositions and new roadmaps included.
  - "The cycle test for A → B" asks whether that graph has a path B → … → A; "acyclic" means it has none.
  - For a new stage with prerequisites P and consumers C, the test asks whether any consumer reaches any prerequisite.
  - All the edges this report proposes were also tested together, with its four new stages added: 53 additions, including the optional PadicHodgeTheory:P7 → R06.4:crystalline-to-ordinary of /17 and the conditional GL2ModularityLifting:R22.5 → AutomorphicCongruences:L5w of /35, and the six removals of /1 and /12. They form no cycle. The new stages are ClassicalSerreModularity:R27.1:good-dihedral (/1), PotentialModularityAndCompatibleSystems:R23.1:soluble-extensions (/26), PadicHodgeTheory:R06.4:crystalline-to-ordinary (/17) and OrdinaryAutomorphicFormsAndModularityLifting:R21.7 (/34).
  - The test was repeated with the 104 edges and 15 new stages of `RT-AREA-langlands-1.fixes.md` added as well: 157 edges in all, and still no cycle.
  - Everything was rechecked at `29319b79`, the `main` this branch starts from; RS-11, RS-21 and RS-23 were accepted in between. Every quoted text is unchanged, the six edges that /1 and /12 remove are still present, and the joint tests still find no cycle. RS-21's link R17.5 → ML.1 now supplies one of /8's edges. /8, /18, /19, /23, /24 and /35 note the other changes.

## How to read this report

This report is the job's only deliverable; the intake accepts no other file for it. Every fix is therefore written as an exact edit, for the maintainer or for the blueprint and design jobs of these roadmaps:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence is quoted and the replacement given in full.
- **Stage records and edges** in `data/atlas.json`: the new stage (key, title, requirements, consumers, description) and the `stageEdges` to add. Removals are marked as the maintainer's.
- **Paper routes, restructuring records and decompositions:** the file, the field, the old value and the new value.
- **New sub-stages** take a key with a colon under the parent and set `parentStageId`. The atlas has two patterns: a component that its parent requires (as `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`), and a successor that requires its parent (as `CrystallineCohomology:CR.3:duality`). A new sibling stage takes a letter suffix.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. So each section starts with those corrections, then says what `main` says now, and then gives the fix.

**Route verdicts.** `make_queue` applies a paper route only when the paper's review carries a verdict for it.
- Where a fix edits a route but keeps its kind and roadmap, the existing verdict still describes it.
- Where a fix moves items or changes a route's kind, the report names the verdict entry to record.
- The maintainer decides whether to record it on the strength of the confirmed finding, or to wait for the paper's next review.

**Relation to part 1.** This session also wrote `RT-AREA-langlands-1.fixes.md` (merged, not yet applied at `ba5cc428`). Several of its fixes touch the same stages:
- R17.4 and the new base-change stage ET.4b (/1 there);
- L5w (/8 there);
- R24.5:operations → AG2.6 (/20 there);
- G7 → PA.4 and the PA.3 imports, with the export sentences of L7 and L8 (/21 and /22 there);
- R19.6 with IHG.1 and IHG.4 (/25 there).

The fixes below are consistent with it and say so where they overlap. Finding /22 here is already fixed by /22 there.

**Disclosure.** This session wrote neither the red team (`cc-39fac3`) nor its verification (`cc-7b31c4`), and none of the roadmaps these fixes touch. It extracted none of the papers whose routes are edited here. Its only related work is the part-1 fixes report above.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main`;
- **blueprint:** it goes into a packet through the roadmap's blueprint job;
- **verdict:** a new or re-kinded paper route needs a review verdict first;
- **review:** it is for the pending review of a paper extraction;
- **revision:** it is for the next revision of a paper whose overall review is `revise`;
- **maintainer:** a choice the report leaves to the maintainer.

| # | Finding | Verdict | Fix | When |
|---|---|---|---|---|
| /1 | high, error | confirmed | A new component sub-stage R27.1:good-dihedral holds KW I Definition 2.1, Lemma 6.3 and Lemma 8.2 on generic inputs only, R27.1 drops R26.6, and RS-06's links to R33.2, R33.3 and R33.6 start from the sub-stage, so no R26 stage is an ancestor of R33.1–R33.5. | now; blueprint (ClassicalSerreModularity R26.1 part) |
| /2 | high, missing | confirmed | R19.2 plans Taylor's construction for even degree without a discrete-series place (nodes in R19.2 and R19.4), names R22.1 and R24.5 as its consumers, records Breuil and Kisin, and leaves Taylor II and Brylinski–Labesse as named gaps. | now (prose, references); blueprint (sources, nodes, gaps) |
| /3 | high, error | confirmed | R23.3 imports the inputs of KW II Theorem 6.1 (R19.2, R20.3, R21.6, R22.6 and PadicFamilies L5); KW II Theorem 8.2 is planned in GL2ModularityLifting R22.1 with Theorem 8.4 (/13); the roadmap summary and R23.6 say where lifting theorems enter. | now; blueprint |
| /4 | medium, error | confirmed | Add R17.4 → R19.2 and R17.5 → R19.2, and have those stages plan the non-normal cubic lifting and Tunnell's globalisation that the AGR packet already requests. | now |
| /5 | medium, error | confirmed | The AGR packet already corrects the fibre and records E1; its next checkpoint fixes the surviving acceptance item and gap wording by Deligne's (4.7). | blueprint; maintainer (decomposition) |
| /6 | medium, error | confirmed | IHG.1 exports Chenevier's Theorem 2.22(i) with the finite-field splitness lemma, and the AGR packet drops the residue-field descent from its nodes, request and gaps. | now (IHG.1 prose); blueprint (packets); maintainer (decomposition) |
| /7 | medium, missing | confirmed | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 plans Savitt's reductions of tame-type potentially Barsotti–Tate representations (§§6.1–6.3) and Khare's Lemma 5.3, and R24.6 turns them into the Serre weight of ρ̄_q with R15.4's recipe, through an explicit edge R07.5 → R24.6. | now (prose, edge); blueprint (FiniteFlatGroups, PotentialModularity R24.3 and ClassicalSerreModularity R26.1 parts) |
| /8 | medium, duplicate | confirmed | ML.1 imports weight-one modularity over Q from R19.1, R17.5 and R27.6 (three edges; RS-21, accepted after the baseline, has since supplied R17.5 → ML.1), and R27.6 exports KW I Corollary 10.2(ii). | now; blueprint (CSM packet) |
| /9 | medium, duplicate | confirmed | Add R14.6 → R19.1; R19.1 deduces the good-prime polynomial from R14.6 and keeps only Deligne's Sym^{k−2} congruence. | now; blueprint (request) |
| /10 | medium, duplicate | confirmed | Add R24.5:operations → R19.3, R19.1 → R34.6 and R34.6 → R19.3, and point the AGR packet's R19.3 at R24.5:operations instead of R24.5, which would close a cycle. | now; blueprint (packet) |
| /11 | medium, duplicate | confirmed | R26.3 owns one consecutive-prime lemma (Khare §4, with P the least non-Fermat prime above p) and a separate node for the explicit Chebyshev bound and the finite checks, and R27.2 imports the lemma through a new edge R26.3 → R27.2. | now (prose, RS-06 record, edge); blueprint (ClassicalSerreModularity R26.1 part) |
| /12 | medium, error | confirmed | R24.4 assembles KW I Theorem 4.1 directly after GL2ModularityLifting R22.6 (new edge R22.6 → R24.4, edge R24.3 → R24.4 removed, R24.3 → R24.5 added), and R22.5 loses its sentence about a circular appeal to potential modularity. | now |
| /13 | medium, missing | confirmed | R22.1 plans KW II §8 (Lemma 8.1, Theorem 8.2 in cases (a)–(c), Lemma 8.3 and Theorem 8.4, with the p = 2 forms) under hypotheses (α) and (β), choosing its fields with R23.1:soluble-extensions (/26); the GL2ModularityLifting packet withdraws its request for Theorem 8.4 from SerreWeightAndLevelOptimisation R20.6. | now (prose); blueprint (GL2ModularityLifting R22.1 part) |
| /14 | medium, missing | confirmed | Add R08.3 → R19.5, and give the AGR packet a node for Kisin's Theorem (4.3) with its §4 proof. | now (edge, prose); blueprint (nodes) |
| /15 | medium, error | confirmed | R01.4 → R04.5 is already on main through the promoted GlobalGaloisDeformations blueprint. R01.4 now states Dickson's classification, KW II Lemma 4.3(2) and (5) and the odd-p consequences as named lemmas, which answers that blueprint's open request. | now; blueprint (nodes) |
| /16 | medium, error | confirmed | A new link CFT-L104, ClassFieldTheory Layer 5 → R08.1, supplies local Tate duality and the local Euler characteristic to R08.1 and to every later LocalGaloisDeformationRings stage. R08.1 names the import, and the packet's Layer 5 request covers the dimension and smoothness nodes. | now; blueprint (request) |
| /17 | medium, error | confirmed | A successor sub-stage R06.4:crystalline-to-ordinary owns KW II Lemma 3.5 with the Berger–Li–Zhu calculation and feeds R08.5 and R21.5. R21.5 keeps the Skinner–Wiles p = 3 branch, and the RS-06 and RS-08 owner records follow. | now; maintainer (RS records); blueprint (nodes) |
| /18 | medium, duplicate | confirmed | R08.3 owns Kisin's potentially semistable rings of fixed type in every rank over every finite K/Q_p. L7 imports them and keeps its lattice moduli, Fontaine–Laffaille and ordinary-flag conditions, and RS-08 records the owner. | now; maintainer (RS-08 record) |
| /19 | medium, duplicate | confirmed | R18.3 owns the Galois-free results of KW II §7 (isotropy, Lemmas 7.1, 7.3 and 7.4, the freeness in Corollary 7.5, Proposition 7.6) for any finite Q with N(v) ≡ 1 mod p^n, and R22.2 applies them at the R04.5 primes and keeps the control statement, which needs local–global compatibility. | now (prose, RS-08 owners); blueprint (HilbertModularVarietiesAndShimuraCurves) |
| /20 | medium, duplicate | confirmed | R22.6 is the one owner of Hypothesis (H), including the Breuil–Kisin step, and R27.5, its RS-06 keeps and its integrated node import (H) and keep Theorem 9.1's weight-four and even-conductor reduction. | now |
| /21 | medium, duplicate | confirmed | R32.6 owns the modern-route transfer for reducible reduction at a ramified coefficient prime and R24.6 drops its "modern route" sentence; the alternative edge R32.6 → R24.6 is rejected because it would put R32 upstream of R26 and R27. | now (prose); blueprint (PotentialModularity R24.3 part) |
| /22 | medium, error | confirmed | Already fixed by `RT-AREA-langlands-1.fixes.md` /22, which is not yet applied: L7 exports to PA.3, not P9, and L7, L8 and G8 → PA.3 are among its five edges. Nothing is added here. | now (as part 1, /22) |
| /23 | medium, duplicate | confirmed | R23.2 only chooses the auxiliary data and the Ω_v and applies R23.1 to H6's scheme; "R10's actual moduli scheme" becomes H6, and the local-point proofs move to H6. | now; blueprint |
| /24 | medium, duplicate | confirmed | R23.5 controls the field only and imports base change and descent from R17.4 through the new edge R17.6 → R23.5. | now; blueprint |
| /25 | medium, error | confirmed | R23.1 is restated as Harris–Shepherd-Barron–Taylor Proposition 2.1 for any smooth geometrically connected variety, with split, unramified and Galois-invariant local conditions, and the R24.5:operations preamble follows it. | now; blueprint; maintainer |
| /26 | medium, missing | confirmed | A new component R23.1:soluble-extensions proves Clozel–Harris–Taylor Lemmas 4.1.1–4.1.2 from Tau Ceti ClassFieldTheory Layers 8, 11 and 12 and Chebotarev Layer 10, and feeds R23.1, R23.5 and GL2ModularityLifting R22.1. | now; blueprint |
| /27 | medium, error | confirmed | Chebotarev Layer 10 → R23.1, with a node deriving from it the Frobenius-generation argument that forces linear disjointness. | now; blueprint |
| /28 | medium, missing | confirmed | R23.3 is stated over a totally real base (Snowden, Theorem 5.1.1 with Proposition 8.2.1) with a relative form through Res_{F₁/F}; H6 works over a totally real base, and the new edge A6 → R23.2 supplies the Weil restriction. | now; blueprint |
| /29 | medium, missing | confirmed | Option (a): R24.1 also plans the two-dimensional totally real form of Thorne's ordinary finiteness theorem (Theorem 10.2), with the explicit edge R21.4 → R24.1; the Calegari–Geraghty route and its verdict stay. | now; blueprint |
| /30 | medium, error | confirmed | R24.5 proves strict compatibility through a new R19.5 node for Skinner's Theorem 1 (with Saito and Blasius–Rogawski); KW's almost-strict statement stays as a variant, and R24.6 keeps its hypothesis list only for systems known to be almost strict. | now; blueprint |
| /31 | medium, error | confirmed | PG.6 → R06.4:crystalline-to-ordinary, the layer that keeps the Berger–Li–Zhu calculation after /17. | now |
| /32 | medium, missing | confirmed | IntegralIwasawaTheory L4 adds Washington's 1978 theorem on the non-p-part of class numbers, and L4 → R21.5 supplies it to Skinner–Wiles Theorem A. | now; blueprint (request) |
| /33 | medium, error | confirmed | R17.4 → R21.4, the stage of the Skinner–Wiles Main Theorem, whose last step descends by solvable base change. R21.5 and R21.6 reach R17.4 through it. | now |
| /34 | medium, missing | confirmed | A new terminal stage R21.7 states and proves Barnet-Lamb–Gee–Geraghty's Theorem A in the form BCGP use, after R21.6 and R24.3. BCGP route 30 points to it. | now; verdict (Newton–Thorne split) |
| /35 | medium, duplicate | confirmed | R21.4 → L5w and R04.6 → L5w. L5w imports ordinary R = T and the patching data and keeps only the BCS and Wan instances, consistently with part 1's /8 edit of the same stage. | now |

## /1 (high, error): a component sub-stage R27.1:good-dihedral carries the early good-dihedral package, and R27.1 no longer requires R26.6

### What the verifier corrected
- **Confirmed as stated.** With the accepted restructurings applied, the ClassicalSerreModularity ancestors of R33.2 are {R26.1–R26.6, R27.1, R33.1}, through R26.6 → R27.1 → R33.2; without them they are {R33.1}. R26.1–R26.6 are likewise ancestors of R33.3–R33.5.
- **Why the prefix wording fails.** `scripts/restructure.py` only appends links and never touches a stage's `requires`. So RS-06's "early prefix" of R27.1 is not representable while R27.1 keeps R26.6.
- **Acceptance test.** Deleting the single edge R26.6 → R27.1 leaves no R26 stage among the ancestors of R33.1–R33.5. R33.6 keeps them through R27.4 and R27.6, as the finding allows. RS-06 already carries R26.6 → R27.3 for the W₁ initial case.

### What main says now
- **R27.1** (`content/campaign/ClassicalSerreModularity/README.md`, line 114): "Define the good-dihedral prime exactly as KW I Definition 2.1, including the inertia character of odd prime-power order, its size bound, the q≡1 mod 8 condition and congruences at smaller primes. Prove the residual-image consequences over the range of characteristics used in the induction. Prove the existence and preservation results from the stated Chebotarev and lifting inputs; the prime's purpose is to control image after changing characteristic."
  - Its dependencies line (line 116) ends "; [ClassicalSerreModularity R26.6](README.md#r26-6)."
  - `data/atlas.json` lists R26.6 in R27.1's `requires` and has the stage edge R26.6 → R27.1.
- **RS-06 (accepted)**, `data/restructure/RS-06.result.json`:
  - R27.1 keeps: "Expose an early definition/image prefix depending only on generic Galois/finite-group arithmetic, and a later prime-insertion application using the prescribed-lift supplier. Neither prefix uses the final Serre theorem; R26.6 is needed later at R27.3's W1 initial case, not to define a good-dihedral prime."
  - R33.2 keeps: "Import R27.1's early local definition/image package and the generic lift/prime-change suppliers, not its later classical existence theorem or R26.6." Its `suppliedBy` is R27.1, R01.4 and R24.3.
  - Links R27.1 → R33.2, R27.1 → R33.3 and R27.1 → R33.6. The first gives the reason "The supplier link is explicitly prefix-scoped to prevent the modern route from inheriting the full classical induction."
  - Owners: "KW good-dihedral local definition and image-protection prefix, independently of the final KW theorem" → R27.1, formerly R33.2.
  - The report `data/restructure/RS-06.md` (line 116) already asks: "Remove inherited R26.6 completion prerequisite from this prefix; keep it only for the later W1 application." No record does it.
- **Link CH-L08** (`data/links/tauceti_TauCetiRoadmap_Chebotarev.json`, accepted) sends Chebotarev layer 10 to R27.1 for the Lemma 8.2 step: "Supply prime existence outside a finite set after R27.1 exhibits a nonempty compatible Frobenius class in the finite compositum encoding its congruences and representation data."
- **Nodes under R27.1.**
  - The decomposition `data/decompositions/ClassicalSerreModularity.json` has `R27.1/good-dihedral-prime-definition`, `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` and `R27.1/dickson-and-the-dyadic-solvable-refinement`. RS-06's node table (RS-06.md, line 347) sends the Dickson node to ArithmeticGaloisRepresentations R01.4.
  - The promoted blueprint `data/blueprints/ClassicalSerreModularity--R27.3.json` adds `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`, whose prerequisites are the Dickson node, R01.4 and R15.6, and `R27.1/good-dihedral-prime-insertion`, which uses Theorem 5.1(4) from R24.3 and R24.6.
  - In the same blueprint, `R33.2/lemma-2-1-large-image` requires the definition, Lemma 6.3 and Lemma 8.2 nodes, and `R33.2/dp-lift-existence-and-good-dihedral-insertion` requires the Lemma 8.2 node.
  - The pending packet `research/blueprint/packets/ClassicalSerreModularity--R26.1.json` (scope R26.1–R27.2) also carries the definition, Lemma 6.3 and Dickson nodes.
- **The README rule** (line 266): "Preserve the independent proof modules: R26 cannot import R27/R33; the classical R27 module cannot import the modern p-adic local Langlands or R32 module. R33 uses the named R27.4 dyadic strong-refinement input and therefore is not claimed independent for that stronger conclusion."
- **Sources read** (29 September 2026): KW I, the preprint https://www.math.ucla.edu/~shekhar/papers/results.pdf (SHA-256 3c389dc3…), §1 (p. 2), Definition 2.1 (pp. 4–5), §5 (pp. 7–8), Lemma 6.3 (pp. 11–12) and Lemma 8.2 (pp. 17–18). Printed page = PDF page.

### Fix
The finding names two pieces, R27.1a and R27.1b. Renaming R27.1 would break its stable ID and every record, link and node that cites it. So the early piece becomes a component sub-stage that R27.1 requires, as ES7:GLn-comparison is for ES7, and R27.1 keeps its key for the rest.

**1. New component sub-stage `ClassicalSerreModularity:R27.1:good-dihedral`.** The key is not in use or reserved in `research/blueprint/reserved-ids.json`.
- Atlas record:
  - key `R27.1:good-dihedral`; title "Good-dihedral primes: definition, image protection and the Chebotarev choice"; `parentStageId` `ClassicalSerreModularity:R27.1`;
  - `requires`: `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.5`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, `LocalGaloisDeformationRings:R08.2`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`;
  - `consumers`: `ClassicalSerreModularity:R27.1`, `ClassicalSerreModularity:R33.2`, `ClassicalSerreModularity:R33.3`, `ClassicalSerreModularity:R33.6`.
- Why each input:
  - R01.3 defines N(ρ̄) as the prime-to-p conductor, and it reaches the inertia groups through R01.2.
  - R01.4 owns Dickson's classification and the absolute irreducibility of odd irreducible ρ̄ (RS-06 owners record).
  - R01.5 supplies the residual representation that arises from a compatible system: reduction and semisimplification (R01.1, upstream of R01.5) and recognition by characteristic polynomials.
  - R24.5:operations defines compatible systems with their weak, almost strict and strict predicates. It does not use R24.5's existence theorem. The part-1 fixes report also uses this sub-stage, for AG2.6.
  - R08.2 constructs the minimally ramified conditions. KW I §5 (p. 8) defines "minimal lift at q" by the condition of Section 3 of Diamond's "An extension of Wiles' results", and Lemma 6.3(ii) assumes it.
  - Chebotarev layer 10 gives Lemma 8.2's positive density.
- **What is left out.** The finding also lists AlgebraicModularFormsAndSerreWeights R15.4. None of the three results uses a Serre weight, so it is not an input. KW I's "S-type" means continuous, absolutely irreducible, two-dimensional and odd (p. 2), which R01.4 covers.
- README section, inserted after the R27.1 section and before `<a id="r27-2"></a>`:

  > <a id="stage-R27.1:good-dihedral"></a>
  > ### R27.1:good-dihedral — Good-dihedral primes: definition, image protection and the Chebotarev choice
  >
  > **Setting.** ρ̄ : G_ℚ → GL₂(𝔽̄_p) is continuous. It is of S-type when it is also absolutely irreducible and odd (KW I, p. 2). N(ρ̄) is its prime-to-p Artin conductor (ArithmeticGaloisRepresentations R01.3). Put Q(1) = 1, and for n ≥ 2 let Q(n) be the largest prime dividing n.
  >
  > **Obligations.**
  > - **Definition 2.1** (KW I, pp. 4–5). A prime q ≠ p is a good dihedral prime for ρ̄ if:
  >   (i) ρ̄|I_q ≅ ψ ⊕ ψ^q, where ψ is a non-trivial character of I_q of order a power of an odd prime t, with t | q + 1 and t > max(Q(N(ρ̄)/q²), 5, p);
  >   (ii) q ≡ 1 mod 8, and q ≡ 1 mod r for every prime r ≤ max(Q(N(ρ̄)/q²), p).
  >   If such a q exists, ρ̄ is locally good-dihedral for q, or q-dihedral.
  > - **Lemma 6.3** (KW I, p. 11; proof pp. 11–12). Let ρ̄ be q-dihedral.
  >   (i) The image of ρ̄ is not solvable, and its projective image is not isomorphic to A₅.
  >   (ii) Let (ρ_ι) be a compatible system lifting ρ̄ whose ramified primes divide N(ρ̄)p, with ρ_p|D_q a minimal lift of ρ̄|D_q (LocalGaloisDeformationRings R08.2). Then for every prime r ≤ max(Q(N(ρ̄)/q²), p), every mod r representation arising from (ρ_ι) is q-dihedral. Hence its image is not solvable, and its projective image is not A₅.
  >   The proof uses Dickson's theorem (R01.4) and t > 5. Condition (ii) forces q to split or ramify in any quadratic field unramified outside the ramification of ρ̄. For r ≠ t, reduction is bijective on a dihedral subgroup of order 2t^a of PGL₂.
  > - **Lemma 8.2** (KW I, p. 17; proof pp. 17–18). Let p ≡ 1 mod 4, and let ρ̄ : G_ℚ → GL₂(𝔽_p) be of S-type, with values in the prime field and with non-solvable image. Then there is a set of primes q of positive density, unramified in ρ̄, such that:
  >   (i) ρ̄_proj(Frob_q) and ρ̄_proj(c) define the same conjugacy class in ρ̄_proj(G_ℚ), for c a complex conjugation;
  >   (ii) q ≡ 1 mod every prime ≤ p − 1, and q ≡ 1 mod 8;
  >   (iii) q ≡ −1 mod p.
  >   Keep 𝔽_p, not 𝔽̄_p: the Remark after the lemma records that Dieulefait and Wiese pointed out that a rationality hypothesis may be necessary. The proof is Dickson's theorem and the Chebotarev density theorem (Tau Ceti Chebotarev, layer 10).
  >
  > **Scope.** This stage uses no modularity, no Serre weight and no lifting theorem. It uses nothing from R26, R27.2–R27.6 or R33. R27.1 uses it to insert good-dihedral primes; R33.2, R33.3 and R33.6 import it for the modern route.

**2. R27.1 prose and record.**
- Line 114. Old: the paragraph quoted above.
- New: "Import the good-dihedral definition, its image consequences (KW I Lemma 6.3) and the Chebotarev choice of auxiliary primes (Lemma 8.2) from the component [R27.1:good-dihedral](#stage-R27.1:good-dihedral). Prove the insertion step of KW I §8.4: for a prime q given by Lemma 8.2 for ρ̄_{p′}, Theorem 5.1(4) (PotentialModularityAndCompatibleSystems R24.3, R24.6) gives a compatible system whose residual representations in characteristics s < p′, s ≠ q, are q-dihedral. The prime's purpose is to control image after changing characteristic. The level-one theorem is not used here; it enters the classical route at R27.3's initial case W₁."
- Line 116: delete "; [ClassicalSerreModularity R26.6](README.md#r26-6)" and add "; [R27.1:good-dihedral](#stage-R27.1:good-dihedral) (component)".
- `data/atlas.json`, the maintainer's removal: take `ClassicalSerreModularity:R26.6` out of R27.1's `requires`, take R27.1 out of R26.6's `consumers`, and delete the stage edge R26.6 → R27.1. Add the sub-stage to R27.1's `requires`.

**3. RS-06** (`data/restructure/RS-06.result.json`; the copy in `research/blueprint/restructure/` is identical and takes the same edits). The build re-adds every accepted link, so the links must change in this record, not only in the atlas.
- `links`: in the entries R27.1 → R33.2, R27.1 → R33.3 and R27.1 → R33.6, change `source` to `ClassicalSerreModularity:R27.1:good-dihedral`. The reasons stay.
- `layers["ClassicalSerreModularity:R27.1"].keeps`: replace "Expose an early definition/image prefix depending only on generic Galois/finite-group arithmetic, and a later prime-insertion application using the prescribed-lift supplier." by "The early definition/image prefix is the component R27.1:good-dihedral, on generic Galois/finite-group arithmetic only; R27.1 keeps the later prime-insertion application using the prescribed-lift supplier."
- `layers["ClassicalSerreModularity:R33.2"].suppliedBy`: replace `ClassicalSerreModularity:R27.1` by `ClassicalSerreModularity:R27.1:good-dihedral`.
- `owners`: in the entry "KW good-dihedral local definition and image-protection prefix, independently of the final KW theorem", set `owner` to `ClassicalSerreModularity:R27.1:good-dihedral`.

**4. Link CH-L08.** Set its `target` to `ClassicalSerreModularity:R27.1:good-dihedral`. Its second evidence entry takes that `stageId` and the quote "The proof is Dickson's theorem and the Chebotarev density theorem (Tau Ceti Chebotarev, layer 10)." R27.1 still reaches layer 10 through its component.

**5. Nodes.** The stable IDs stay; only the parents move.
- Set `parentStageId` to `ClassicalSerreModularity:R27.1:good-dihedral` for:
  - `R27.1/good-dihedral-prime-definition` and `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`, in the decomposition and in the R26.1 packet;
  - `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`, in the promoted R27.3 blueprint, together with its `realises`.
- `R27.1/good-dihedral-prime-insertion` stays under R27.1.
- The Lemma 8.2 and Lemma 6.3 nodes take Dickson's theorem from R01.4, not from `R27.1/dickson-and-the-dyadic-solvable-refinement`, as RS-06's node table already decides.
- In the R26.1 part, the Lemma 6.3 node also drops its prerequisites `PotentialModularityAndCompatibleSystems:R24.3/required-lift-types` and `R24.6/residual-members`. It takes "minimal lift at q" from R08.2, and states the two facts about reduction that it uses: reduction does not increase the conductor at a prime other than the residual characteristic (R01.3), and reduction is injective on the finite image of I_q, whose order is prime to r. Kept, those prerequisites would put R24.3 and R24.6, and through them GL2ModularityLifting R22.1–R22.6, above a component meant to use generic inputs only. The Lemma 8.2 node drops R15.6, because S-type and N(ρ̄) come from R01.4 and R01.3. The blueprint's request to R15.6 removes that node from its `neededBy`.

**Cycle test and acceptance.**
- With these edits and every other edge of this report, the graph is acyclic. The sub-stage's consumers (R27.1, R33.2, R33.3, R33.6) reach none of its six inputs.
- No R26 stage is an ancestor of R33.1–R33.5. R33.6 keeps R26.1–R26.6 through R27.4 and R27.6.
- The README rule holds: no R27 or R33 stage is an ancestor of an R26 stage, and no R26 or R27 stage has an ancestor in R32 or in PadicLocalLanglandsForGL2Qp.

**When:** now (README, stage record and edges, RS-06 and CH-L08 records, node parents in the decomposition and the promoted blueprint); blueprint (the same parents and prerequisites in the pending ClassicalSerreModularity R26.1 part).

## /2 (high, missing): R19.2 plans Taylor's construction for even degree without a discrete-series place, and names its consumers

### What the verifier corrected
- **Confirmed.** The three node quotations are verbatim: Carayol's standing hypothesis (0.3), Ribet's unpublished irreducibility remark, and R19.5's discrete-series assumption.
  - The decomposition's sources contain no Taylor and no Blasius–Rogawski.
  - KW II defines modularity over a totally real F through Taylor's construction, with no parity or discrete-series restriction (p. 4).
  - No atlas stage mentions Taylor 1989, Blasius or the case without a discrete-series place. AUDIT-31's R19.2 note is verbatim.
- **Reference keys.** The verifier's text layer dropped the bracketed numbers, so the keys came from the red team. This job's extraction of the same file (SHA-256 53f45f8b…) keeps them:
  - p. 4: "Recall that in [61], 2-dimensional p-adic representations ρπ of GF are associated to cuspidal automorphic representations π of GL2(AF) that are discrete series at infinity of weight (k, · · · , k), k ≥ 2."
  - p. 80: "the compatibility of the local-global Langlands correspondence proved in [10] and [61] away from p".
  - p. 93: "The cuspidal automorphic representation π gives rise to a compatible system, see [61] and [6], such that each member is irreducible, see [62]", and "it follows from Carayol and Taylor ([10] and [61]) that, if q ≠ ℓ, r_{q,ι} and r_q coincide."
  - Bibliography, pp. 95–97: [6] Breuil, Bull. SMF 127 (1999); [10] Carayol; [39] Kisin, JAMS 21 (2008); [61] Taylor, Invent. Math. 98 (1989); [62] Taylor, part II.

### What main says now
- **R19.2** (`content/campaign/AutomorphicGaloisRepresentations/README.md`, line 38) ends: "Handle the parity and auxiliary-place cases explicitly, including descent from auxiliary totally real fields where the source uses it. Prove uniqueness, continuity, determinants, oddness and the required irreducibility, rather than putting them into a bundled automorphic datum."
- **References** (line 90): "DELIGNE69, DELIGNE_SERRE74, CARAYOL86, T_SAITO, KW2."
- **The AGR blueprint packet.** `research/blueprint/packets/AutomorphicGaloisRepresentations.json` (checkpoint 6, status partial) was merged on 29 September, after the red team. It is not promoted, so the atlas still shows the integrated decomposition.
  - Its node R19.2/hilbert-modular-compatible-system-carayol-theorem-A keeps hypothesis (0.3) and Ribet's remark.
  - Its sources are Deligne–Serre, Deligne's Bourbaki 355, Carayol, Saito, Chenevier, Dieulefait–Pacetti, Diamond–Flach–Guo, Darmon–Diamond–Taylor, KW II and Skinner–Wiles. There is no Taylor, Breuil or Kisin.
  - It already needs the missing case. R19.6/hecke-algebra-representation-quaternionic works in KW II §9.1 (F of even degree, a definite quaternion algebra; its acceptance test takes Σ = ∅). It takes ρ_f from "Carayol, Taylor: AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A", a node that assumes (0.3).
- **Consumers.** R22.1 requires R19.6, and R19.6 reaches R24.5 in the assembled graph. R31.3 also requires R19.6, but its roadmap is "Completed cohomology and p-adic local–global compatibility over Q".
- **Library.** AUDIT-31 on R19.2: "there are no Hilbert modular forms, Shimura curves or Jacquet-Langlands". This does not change.

### Fix
1. **R19.2 prose** (line 38). Replace the last sentence.
   - Old: "Prove uniqueness, continuity, determinants, oddness and the required irreducibility, rather than putting them into a bundled automorphic datum."
   - New: "When [F:Q] is even and π is essentially square-integrable at no finite place, the case that Carayol's standing hypothesis (0.3) excludes, construct ρ_π by Taylor's congruences (Invent. Math. 98 (1989), Theorem 2). The construction uses congruences with forms new at an auxiliary prime λ through a totally definite quaternion algebra, Wiles's pseudo-representations, and the Brylinski–Labesse representation to choose λ. GL2ModularityLifting R22.1 (KW II §§7–9, over fields of even degree) and PotentialModularityAndCompatibleSystems R24.5 (systems over totally real fields of any degree) need this case; CompletedCohomologyAndLocalGlobalCompatibility R31.3, over Q, does not. Prove uniqueness, continuity, determinants and oddness, and irreducibility for every such π (Taylor's part II, which KW II cites for it), rather than putting them into a bundled automorphic datum."
2. **References** (line 90).
   - Old: "DELIGNE69, DELIGNE_SERRE74, CARAYOL86, T_SAITO, KW2."
   - New: "DELIGNE69, DELIGNE_SERRE74, CARAYOL86, TAYLOR89, TAYLOR95, BREUIL99, T_SAITO, KISIN08, KW2."
   - `data/bibliography.json` already has KISIN08 and CARAYOL86. Entries for TAYLOR89, TAYLOR95 and BREUIL99 are the maintainer's choice; the roadmap's other keys have none.
3. **AGR packet, next checkpoint: sources.** Add `taylor-hilbert-89`, `breuil-hilbert-99` and `kisin-pst-08` (for /14), each with its `sourceVersions` entry from the Sources below.
4. **AGR packet: node R19.2/taylor-representations-without-a-discrete-series-place.**
   - Statement (Taylor, Theorem 2, p. 266, restated on p. 279). Let [F:Q] be even, n an ideal of F, f a Hilbert eigenform of level n and weight k with every k_τ ≥ 2 and all k_τ of the same parity, and ℘ a prime of O_f above p. There is a continuous ρ: Gal(F^ac/F) → GL_2(O_{f,℘}), unramified outside np, with tr ρ(Frob q) = θ(T_q) and det ρ(Frob q) = θ(S_q)Nq for q ∤ np. If q | n, q ∤ p and θ(T_q) ≠ 0, then for σ ∈ D_q above Frob_q, tr ρ(σ) = θ(T_q) + χ(σ)(Nq)θ(T_q)^{−1} and det ρ(σ) = χ(σ)Nq.
   - Proof steps:
     - Theorem 1 (p. 269) gives, for every prime λ ∤ n, congruences modulo an ideal I_λ between f and forms of level nλ new at λ. For every prime ℘ ∤ Nλ, v_℘(I_λ) ≥ v_℘(θ_f(T_λ² − S_λ(Nλ + 1)²)) − v_℘(E_f(Nλ + 1)). They are made on the totally definite quaternion algebra ramified exactly at the infinite places (§1, pp. 267–277), through Jacquet–Langlands and Ribet's method.
     - A form new at λ is special at λ, so Carayol's Theorem (A) gives its representation (R19.2/hilbert-modular-compatible-system-carayol-theorem-A).
     - §2 (pp. 277–280): for each m, Wiles's pseudo-representations give r_m valued in O_f/℘^m. Chebotarev applied to the 2^d-dimensional representation of Brylinski–Labesse gives infinitely many λ with Nλ ≡ α_λ/β_λ ≡ 1 mod ℘^{t(m)} (p. 280). The r_m glue to ρ.
   - Hypotheses. The formula at q | n needs θ(T_q) ≠ 0. When π_q is supercuspidal or special, Carayol describes ρ|D_q. When π_q is a principal series from two ramified characters, a twist reduces to the treated case (p. 266).
   - Prerequisites: the Carayol node; HilbertModularVarietiesAndShimuraCurves R18.4 (definite realisations and Jacquet–Langlands); GL2AutomorphicRepresentationsAndTransfer R17.3; IntegralHeckeAndGaloisDeterminants IHG.1 for the passage from a two-dimensional determinant to a representation (Taylor uses Wiles's pseudo-representations). All three stages are already ancestors of R19.2.
5. **AGR packet: node R19.4/taylor-representations-away-from-p.**
   - Statement. For Taylor's ρ_π and q ∤ p, WD(ρ_π|D_q)^{F-ss} corresponds to π_q in the normalisation of R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility. KW II uses this on pp. 80 and 93.
   - Proof. If π_q is special or supercuspidal, π has a discrete-series finite place: Carayol's Theorem (A) applies, and Chebotarev identifies ρ_π with Carayol's σ_λ. Otherwise π_q is an irreducible principal series. After a twist one character is unramified and θ(T_q) ≠ 0, and Taylor's Theorem 2 describes ρ_π|D_q (p. 266). Then N = 0: a nonzero N would make the two characters agree on inertia and differ by |·|^{±1} at Frobenius, which an irreducible principal series excludes. This step is supplied here; no source states it.
   - Acceptance: check the monodromy step against a Steinberg π_q, where that ratio does occur.
6. **AGR packet: node R19.5/breuil-crystalline-at-p-for-taylor-representations** (Breuil, Théorème 1, p. 460).
   - Statement. Let f be a Hilbert eigenform of level 𝔑 with weights all ≥ 2 of the same parity, w the largest weight, ρ_f Taylor's representation and q | p. (1) If p > 2 and q ∤ 𝔑, each ρ_f|G_q mod p^n is a subquotient of a crystalline representation with Hodge–Tate weights in [0, w − 1]. (2) If p > w and q is unramified in F and prime to 𝔑, ρ_f|G_q is crystalline with Hodge–Tate weights in [0, w − 1].
   - There is no residual hypothesis. KW II uses it with [61] for the compatible system of p. 93.
   - The proof (§§2–3: Taylor's pseudo-representations on Hecke algebras and two propositions on crystalline and semistable representations) was not read in this job; the node records that.
   - Kisin's theorem at the coefficient prime is the node of /14.
7. **AGR packet: two gaps.**
   - "Taylor's part II is not read." KW II (p. 93) cites it for the irreducibility of every member. Kisin (p. 514) and Breuil (p. 460) cite it for crystallinity at p ≫ 0 in parallel weight 2. It is in J. Coates and S.-T. Yau (eds.), *Elliptic curves, modular forms & Fermat's last theorem* (Hong Kong, 1993), International Press, 1995, pp. 185–191 (Kisin's [Ta 2], p. 546). KW II's entry [62] gives another series name and pp. 333–340. No open copy was found. Next action: read it, then plan the irreducibility node.
   - "The Brylinski–Labesse representation is not planned." Taylor chooses λ (p. 280) with the 2^d-dimensional representation of Brylinski–Labesse (Ann. Sci. ÉNS 17 (1984)). No stage plans it; HilbertModularVarietiesAndShimuraCurves R18.4 is the natural owner. Next action: read it, or replace the choice of λ by another argument.
8. **AGR packet: two small edits.**
   - R19.6/hecke-algebra-representation-quaternionic, first proof step: cite the Taylor node beside the Carayol node, for forms that are discrete series at no finite place.
   - The Taylor node's `uses`: GL2ModularityLifting:R22.1 and PotentialModularityAndCompatibleSystems:R24.5.

**Cycle test.** No stage edge is added. R18.4, R17.3 and IHG.1 already reach R19.2 (IHG.1 through R01.5 → R19.1).

**When:** now (edits 1–2); blueprint (edits 3–8).

**Sources.**
- R. Taylor, *On Galois representations associated to Hilbert modular forms*, Invent. Math. 98 (1989), 265–280, GDZ scan https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0098/LOG_0019.pdf. It has no text layer; pp. 265–269, 276–277 and 279–280 were read on page images. Read 29 September 2026; SHA-256 499da39a….
- C. Breuil, *Une remarque sur les représentations locales p-adiques et les congruences entre formes modulaires de Hilbert*, Bull. Soc. Math. France 127 (1999), 459–472, Numdam http://www.numdam.org/item/10.24033/bsmf.2357.pdf, pp. 459–461. Read 29 September 2026; SHA-256 ccc0c9fd….
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, authors' final version https://www.math.ucla.edu/~shekhar/papers/proofs.pdf, pp. 4, 80, 93 and 95–97. Read 29 September 2026; SHA-256 53f45f8b….
- M. Kisin, J. Amer. Math. Soc. 21 (2008): see /14.

## /3 (high, error): R23.3 imports the inputs of KW II Theorem 6.1

### What the verifier corrected
- **No correction to the claim.** The verifier reproduced the graph. R23.3 requires only GL2AutomorphicRepresentationsAndTransfer:R17.5 and R23.2. Its ancestor closure, with every accepted restructuring and link map, has no GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLifting, PadicFamilies or SerreWeightAndLevelOptimisation stage and no R19 stage. Of the Galois-representation stages it reaches only AutomorphicGaloisRepresentationsPartII AG2.0/AG2.1a, a different roadmap.
- **The source.** In the KW II preprint the proof of Theorem 6.1 runs from p. 53 to p. 57. It uses Theorem 8.2 (p. 54), a modularity-lifting theorem (p. 55) and Hida theory (p. 57). AUDIT-34 records R23.3 "not built".
- **The edges.** Each proposed edge R19.2, R22.6, R21.6, L5, R20.3 → R23.3 is acyclic.
- **A text-layer caveat.** The verifier's extraction drops the sentence that names Gross and Coleman–Voloch. This report's extraction of the same file (SHA-256 prefix 53f45f8be3b3c7de) keeps it (p. 54): "Using Theorem 13.10 of [27] and [12] (see also [23]) and Propositions 8.13 and 8.18 of [27] it furthermore follows that ρ̄ arises from Sk(Γ1(N)) for k = k(ρ̄) and some integer N prime to p, and also from S2(Γ1(Np))". The bibliography gives [27] Gross (Duke Math. J. 61, 1990), [12] Coleman–Voloch (Invent. Math. 110, 1992) and [23] Edixhoven (Invent. Math. 109, 1992).

### What main says now
- **R23.3** (`content/campaign/PotentialModularityAndCompatibleSystems/README.md`, line 48): "Prove the residual theorem in KW II Theorem 6.1's strength by finding the auxiliary abelian variety over a suitable totally real field and transferring known modularity from the auxiliary residual representation. Verify all solvable-image, ordinary/finite-flat and lifting hypotheses. This theorem must not use a global characteristic-zero lift of the original representation obtained from R24."
  - It requires R17.5 and R23.2. Its only consumer is R23.4.
  - R22.6 and R21.6 enter the roadmap at R23.4, which comes after R23.3.
- **The roadmap summary** (line 11): "The proof is staged: first potential residual modularity, then potential modularity of characteristic-zero lifts after applying an already established lifting theorem."
- **R23.6** (line 78): "Provide the application table showing that R24 global finiteness uses the residual theorem and a modular deformation problem over the extension, while the later compatible-system construction uses the theorem for a supplied lift. Validate this separation against KW II §§6 and 10 and Taylor's proof."
- **The ownership paragraph** (line 15): "R10/R18 provide the twisted Hilbert–Blumenthal moduli and their geometric/local properties; R17 the solvable Artin and base-change inputs; R22 a modularity-lifting theorem with supplied residual modularity. Use Chebotarev and class field theory from their existing owners."
- **The node plan already imports most inputs.** The partial packet `research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json` (checkpoint 3) plans Theorem 6.1 as `R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`.
  - That node's prerequisites include OrdinaryAutomorphicFormsAndModularityLifting:R21.6.
  - The packet's open requests include R21.5 (Skinner–Wiles), R21.6, R19.2 (Taylor 1989; Wiles 1988), R17.3–R17.5 and H6.
  - Its gap "KW II Theorem 8.2 and the Gross/Coleman-Voloch weight results are imported into Theorem 6.1" says: "Next action: assign Theorem 8.2 to GL2ModularityLifting (R22.1/R22.4 describe level change and Hecke modules) or SerreWeightAndLevelOptimisation, and add the supplier edge once the owner's text is checked".
  - So the stage edges, the prose and an owner for Theorem 8.2 are what is missing.
- **KW II Theorem 8.2** (read, pp. 70–73).
  - Under hypothesis (α) or (β) of §8.2 (p. 70), it gives an allowable base change F″/F (Definition 7.9, p. 68) and a cuspidal π″ lifting ρ̄|G_{F″}. π″ is unramified outside Σ ∪ {p} and Steinberg above Σ, with the weight, level at p and central character of the theorem's cases (p. 71).
  - Its proof (pp. 72–73) uses "Lemma 2.2 of [60]" (Taylor, icosahedral II) to choose the allowable base change. It also uses the Jacquet–Langlands correspondence, Lemmas 7.3, 7.4, 7.7 and 7.10, and Lemma 8.3.
  - It uses no modularity-lifting theorem and no potential modularity.
- **Where Theorem 8.2 is already expected.** The partial packet `research/blueprint/packets/GL2ModularityLifting--R22.1.json` has an open request to SerreWeightAndLevelOptimisation R20.6: "Existence, after an allowable base change, of a cuspidal π fitting the prescribed lifting data (KW II Theorem 8.4, using Theorem 8.2 for minimal lifts)". The nodes R22.1/minimal-level-data, R22.5/kw-odd-prime-lifting and R22.6/kw-dyadic-lifting need it.
  - R20.6 reads: "Supply the optimisation inputs used inside KW and the modern qualitative proof without importing their final Serre theorem." RS-06 (accepted) keeps for it "each conditional case needed inside R22, R26, R27 and R33".
  - R20.6 → GL2ModularityLifting:R22.1 is a stage edge, and R22.1 → R22.2 → R22.3 → R22.4 is a path.
  - R22.1's ancestors include R17.3, R17.4, R18.3, R18.6, R19.2, R19.5, R19.6, R20.3 and R20.6. These cover every input of Theorem 8.2's proof except the choice of the allowable base changes, which /26 supplies.
  - The partial SerreWeightAndLevelOptimisation packet has no KW II node.

### Fix
1. **Roadmap summary** (line 11). Replace "The proof is staged: first potential residual modularity, then potential modularity of characteristic-zero lifts after applying an already established lifting theorem." with:
   > The proof is staged: first potential residual modularity, then potential modularity of characteristic-zero lifts. Both stages apply already established modularity-lifting theorems. The residual stage applies them only to the Tate module of an auxiliary abelian variety at an auxiliary prime, never to a characteristic-zero lift of the original representation. The second stage applies them to the supplied lift.
2. **Ownership paragraph** (line 15). Replace its first two sentences, from "R10/R18 provide" to "from their existing owners.", with the text below. It also carries /23's removal of R10 and the suppliers of /26–/28. The last sentence, "Moret–Bailly's approximation/existence theorem is proved here unless a current supplier already states it.", stays.
   > HilbertModularVarietiesAndShimuraCurves H6 provides the twisted Hilbert–Blumenthal moduli and their geometric and local properties, and AbelianSchemesAndArithmeticModuli A6 their Weil restriction. GL2AutomorphicRepresentationsAndTransfer R17 provides the solvable Artin and base-change inputs, AutomorphicGaloisRepresentations R19 the Galois representations of Hilbert modular forms, and SerreWeightAndLevelOptimisation R20.3 the weight part of Serre's conjecture. OrdinaryAutomorphicFormsAndModularityLifting R21, GL2ModularityLifting R22 and PadicFamilies L5 provide the modularity-lifting theorems, KW II Theorem 8.2 (GL2ModularityLifting R22.1) and Hida theory; the residual theorem applies them to the auxiliary abelian variety and over the extension. Chebotarev comes from Tau Ceti's Chebotarev Layer 10 and class field theory from Tau Ceti's ClassFieldTheory Layers 8, 11 and 12. That roadmap excludes the construction of soluble extensions with prescribed completions; R23.1:soluble-extensions proves it here.
3. **R23.3** (line 48). Replace the whole paragraph with the following. It also carries /28's fix.
   > Prove potential residual modularity over a totally real base field. Let F be totally real, p odd, ρ̄ : G_F → GL₂(F̄_p) odd, ψ a finite-order character with det ρ̄ = ψ̄χ̄_p, M/F a finite extension, t a definite type function on the places above p, and S a finite set of places of F such that t(v) is compatible with ρ̄|G_{F_v} at every v ∈ S above p. Prove that there are a finite Galois extension M′/F containing M and a finite totally real Galois extension F′/F, linearly disjoint from M′ and split at every place of S, such that for every finite totally real F″/F′ linearly disjoint from M′ there is a cuspidal Hilbert eigenform f of parallel weight two over F″ with ρ̄_f ≅ ρ̄|G_{F″}, det ρ_f = ψχ_p|G_{F″} and type t (Snowden, arXiv:0905.4266v1, Theorem 5.1.1 with Proposition 8.2.1; Boxer–Calegari–Gee–Pilloni cite the latter as "Thm. 8.2.1"). Include the relative form: for a finite extension F₁/F of totally real fields and ρ̄ over F₁, the extension F′/F is Galois over F and modularity holds over F₁F′ (Boxer–Calegari–Gee–Pilloni, Proposition 9.1.11), by applying R23.1 to the Weil restriction of R23.2. Derive KW II Theorem 6.1 over F = Q, including p = 2, with its forms (i) and (ii), through KW II's additions to Taylor's proof (pp. 54–57): the real points and toric reduction for p = 2, the ordinary local points, the weight-k(ρ̄) form by Hida theory, and the solvable-image branch by Langlands–Tunnell, the weight part of Serre's conjecture and KW II Theorem 8.2. Its control of the field, Theorem 6.1(iii), is R23.5. Modularity-lifting theorems are applied only to the Tate module of the auxiliary abelian variety at the auxiliary prime; Hida theory and Theorem 8.2 are applied only to forms over the extension. This theorem must not use a global characteristic-zero lift of the original representation obtained from R24.
4. **R23.3's dependency line** (line 50). Replace it with:
   > **Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R17.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-5); [AutomorphicGaloisRepresentations R19.2](../AutomorphicGaloisRepresentations/README.md#r19-2); [SerreWeightAndLevelOptimisation R20.3](../SerreWeightAndLevelOptimisation/README.md#r20-3); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6); [PadicFamilies L5](../PadicFamilies/README.md#l5-ordinary-theory-over-totally-real-fields); [PotentialModularityAndCompatibleSystems R23.2](README.md#r23-2).
5. **R23.6** (line 78). Replace "Provide the application table showing that R24 global finiteness uses the residual theorem and a modular deformation problem over the extension, while the later compatible-system construction uses the theorem for a supplied lift. Validate this separation against KW II §§6 and 10 and Taylor's proof." with:
   > The residual statement is over a totally real base field. Provide the application table. The residual theorem applies modularity-lifting theorems (GL2ModularityLifting R22.6; OrdinaryAutomorphicFormsAndModularityLifting R21.6) only to the auxiliary abelian variety. It applies Hida theory (PadicFamilies L5) and KW II Theorem 8.2 (GL2ModularityLifting R22.1) only to forms over the extension. R24 global finiteness uses the residual theorem and a modular deformation problem over the extension, while the later compatible-system construction uses the theorem for a supplied lift. Validate this separation against KW II §§6 and 10, Taylor's proof and Snowden §5.
6. **Stage edges.** Add each to R23.3's `requires`, to the source's `consumers`, and to `stageEdges`.
   - The cycle test for AutomorphicGaloisRepresentations:R19.2 → R23.3 finds no path R23.3 → … → R19.2: acyclic.
   - The cycle test for SerreWeightAndLevelOptimisation:R20.3 → R23.3 finds no path back: acyclic.
   - The cycle test for OrdinaryAutomorphicFormsAndModularityLifting:R21.6 → R23.3 finds no path back: acyclic.
   - The cycle test for GL2ModularityLifting:R22.6 → R23.3 finds no path back: acyclic.
   - The cycle test for PadicFamilies:L5 → R23.3 finds no path back: acyclic.
   - All five are acyclic together with every other edge of this report and those of `RT-AREA-langlands-1.fixes.md`.
   - No edge R22.1 → R23.3 is added for Theorem 8.2: R22.1 reaches R23.3 through R22.6.
7. **Theorem 8.2's owner is GL2ModularityLifting R22.1, with Theorem 8.4 (/13).** The finding names R22.4 as the nearest stage, but that placement makes a cycle. R22.1/minimal-level-data imports Theorem 8.4, which is proved from Theorem 8.2, and R22.1 precedes R22.4: the cycle test for GL2ModularityLifting:R22.4 → GL2ModularityLifting:R22.1 finds the path R22.1 → R22.2 → R22.3 → R22.4. Finding /13, also confirmed, plans Lemma 8.1, Theorem 8.2, Lemma 8.3 and Theorem 8.4 as nodes of R22.1, and its fix states the Theorem 8.2 node. SerreWeightAndLevelOptimisation R20.6 is not the owner either. /13's confirmed claim is that the R20 layers are GL₂/Q statements, "not the totally-real, quaternionic, base-change argument of Theorem 8.2", and /13 withdraws the GL2ModularityLifting packet's request to R20.6.
   - **What this finding adds to /13's node.**
     - **Hypotheses.** The consumer verifies (α) and (β): by the weight part of Serre's conjecture (R20.3) when ρ̄ is modular, and by KW II Theorem 6.1 (R23.3) when it is not (p. 70). The theorem itself uses neither.
     - **Proof steps.** A first allowable base change, split at Σ, makes π Steinberg of conductor v at its other ramified places S away from p. A second one, of even degree and split at Σ ∪ {v | p} ∪ {w}, makes the p-part of #k_{v′}^× divisible by that of 2p(4N_w) at the places v′ above S ("Lemma 2.2 of [60]", p. 72). Transfer π to the definite quaternion algebra ramified exactly at Σ and the infinite places. Lemma 7.3 gives a character χ of ∏_{v∈S} k_v^× of p-power order, and Lemma 7.4 identifies the reductions of the spaces with and without χ. A further allowable base change with Lemma 7.7 gives π″. Lemma 8.3 treats weight p + 1, and Lemma 7.10 fixes the central character (p. 73).
     - **The allowable base changes** are soluble totally real extensions with prescribed behaviour at finitely many places. Lemma 4.1.2 of R23.1:soluble-extensions constructs them, so /26 adds the edge R23.1:soluble-extensions → GL2ModularityLifting:R22.1.
     - **Sources.** KW II, author preprint https://www.math.ucla.edu/~shekhar/papers/proofs.pdf, read 29 September 2026, SHA-256 prefix 53f45f8be3b3c7de: Definition 7.9 (p. 68), §8.1–8.2 (p. 70), Theorem 8.2 (p. 71), proof (pp. 72–73).
     - **Gap.** Lemma 2.2 of [60] and Lemma 8.3's source, Proposition 1 of §4 of [24] (Edixhoven–Khare), are cited by KW II and unread here.
8. **R23.1 packet, next checkpoint.** In `R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`, add the prerequisites R19.2, R20.3, the Theorem 8.2 node of R22.1 (/13), R22.6 and PadicFamilies L5 (Hida [30] §8, cited on p. 57). Turn the Theorem 8.2 gap into a request to that node. The R21.5 request (Skinner–Wiles) stays.

**When:** now (edits 1–6); blueprint (edits 7–8).

## /4 (medium, error): R17.4 and R17.5 feed R19.2, and R17.4 plans the non-normal cubic lifting

### What the verifier corrected
- **Confirmed.** The GL2AutomorphicRepresentationsAndTransfer ancestors of R19.2, R19.4, R19.5 and R19.6 are R16.1–R16.6 and R17.1–R17.3.
  - No stage text mentions cubic base change, "non-Galois cubic", Piatetski or JPSS.
  - The node's proof step and R19.5's quadratic-base-change sentence are verbatim, and R17.4 → R19.2 is acyclic.
- **The mathematics.** Extraordinary supercuspidals of GL₂ over a 2-adic field have projective image A₄ or S₄. So Carayol §12 needs the non-Galois cubic lifting of Jacquet–Piatetski-Shapiro–Shalika.
- **Limit.** The verifier read Carayol's Numdam scan only as page images. This job's extractor gives its text layer (the same file, SHA-256 d4a5fb6b…). The quotations of 0.9 (p. 411) and 12.2.1–12.2.2 (p. 457) are exact.

### What main says now
- **R17.4** (`content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md`, line 142): "Prove cyclic base change and descent for GL₂, local compatibility and the exact failure-of-cuspidality criterion. Iterate to solvable extensions …" Dependencies (line 144): "R17.3 (preceding layer)."
  - The merged `RT-AREA-langlands-1.fixes.md` (/1) rewrites the first sentence to specialize ET.4b's cyclic base change, and adds ET.4b to the dependencies. Nothing plans a non-normal cubic lift.
- **R17.5** (line 152): "Construct monomial automorphic representations and the solvable two-dimensional Artin modularity theorem with its weight-one interpretation over Q. …"
- **R19.2 dependencies** (`content/campaign/AutomorphicGaloisRepresentations/README.md`, line 40): R19.1, R17.3 and R18.4.
- **The AGR packet has done the node work** (checkpoint 5, #3886):
  - R19.2/carayol-cubic-base-change-of-extraordinary states Carayol's 12.2.2 Proposition with the proof of 12.2.3. Its prerequisites are R17.4, R17.5 and R16.3.
  - The Theorem (A) node carries 12.3's proof, including the quadratic base change of 12.3.2, and requires R17.4.
  - Its request to R17.4 asks for "Local and global base change for GL₂ along extensions of degree at most 3: Langlands for cyclic extensions and Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic ones, with the compatibility 'the lift corresponds to restriction of the Weil–Deligne representation' for principal series, special and ordinary cuspidal π".
  - Its request to R17.5 asks for "Tunnell's globalisation of primitive local representations ([Tu. 1], Theorem 1.3); and the Artin conjecture for tetrahedral (Langlands) and octahedral (Tunnell) representations, with Jacquet–Langlands chapter 12", and for automorphic induction with prescribed local components (Carayol 11.2).
  - So only the stage edges and the suppliers' prose are missing.
- **Why R17.5 as well.** 12.2.3 (p. 458) proves the Proposition by globalising σ with Tunnell ([Tu.1], th. 1.3) to a tetrahedral or octahedral representation over a number field. It then applies the Artin conjecture ([L.2], [Tu.2]) and Jacquet–Langlands chapter 12. R17.5 requires R17.4, so the red team's option of putting the Proposition in R17.4 would make R17.4 depend on its own successor. The Proposition stays in R19.2.

### Fix
1. **Stage edges** (`data/atlas.json`). Add R17.4 → R19.2 and R17.5 → R19.2: R19.2's `requires`, the suppliers' `consumers`, and `stageEdges`.
   - R19.4 and R19.5 inherit both through R19.3.
   - Kisin's base change to a totally real F′/F (/14) is inherited the same way.
2. **R19.2 dependencies** (line 40). Append: "; [GL2AutomorphicRepresentationsAndTransfer R17.4](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-4) and [R17.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-5) for the base change of Carayol §12."
3. **R19.2 prose** (line 38, after the sentence added by /2). Append: "Carayol deduces Theorem (A) from Theorem (B) by base change of degree at most 3 (§12). Import the lifts and their compatibility with restriction from R17.4, and Tunnell's globalisation and the tetrahedral and octahedral Artin conjecture from R17.5."
4. **R17.4 prose** (line 142, after langlands-1 /1's new first sentence). Add:
   > Construct the non-normal cubic lifting of Jacquet, Piatetski-Shapiro and Shalika (C. R. Acad. Sci. Paris 292 (1981), 567), local and global; ET.4b's cyclic theory does not give it. For lifts of degree at most 3, prove that the lift of a principal series, special or ordinary cuspidal representation corresponds to the restriction of its Weil–Deligne representation; Carayol (12.2.2) asserts this without a reference. The extraordinary cuspidal case is proved in AutomorphicGaloisRepresentations R19.2 from R17.5.
5. **R17.5 prose** (line 152). After "including the octahedral case via Tunnell's argument." add:
   > State the tetrahedral and octahedral Artin conjecture over an arbitrary number field, with Jacquet–Langlands chapter 12, and Tunnell's globalisation of a primitive representation of a local Weil group (Invent. Math. 46 (1978), Theorem 1.3). Carayol 12.2.3 applies them over a number field other than Q. Include the automorphic induction with prescribed local and archimedean components that Carayol 11.2 uses.
6. **Not needed.** The red team's alternative, a named gap in R19.4, is unnecessary now that the packet plans the Proposition.

**Cycle test.** The cycle test for R17.4 → R19.2 finds no path R19.2 → … → R17.4: acyclic. The same holds for R17.5 → R19.2, since R17.5's only prerequisite is R17.4. Jointly with langlands-1's ET.4b → R17.4 and every other edge of these sections: acyclic.

**When:** now.

**Sources.**
- H. Carayol, *Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert*, Ann. Sci. ÉNS 19 (1986), 409–468, Numdam https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf. Read on its text layer: 0.9 (p. 411), 12.1.3–12.3.2 (pp. 456–459), and the entries [J.P.S.S.], [Tu.1] and [Tu.2] (p. 468). Read 29 September 2026; SHA-256 d4a5fb6b….

## /5 (medium, error): the Eichler node's acceptance test and gap follow Deligne's two-component decomposition

### What the verifier corrected
- **Confirmed.** The node statement is verbatim and false. Over an ordinary point of characteristic p the fibre of q₁ has two subgroups of order p: ker F and an étale one.
  - The verifier recomputed y² = x³ + 3x + 2 over F₅: the discriminant is nonzero and #E(F₅) = 5, so a₅ = 1.
  - E is ordinary, and E(F₅) ≅ Z/5 is an étale subgroup distinct from ker F.
- **The fix is right:** supersingular versus ordinary, and Deligne's two-component decomposition giving T_p = F + I_p^*V.
- **Limit.** The verifier could not read p. 157 or (4.7). This job read both on page images of the Numdam scan (SHA-256 19509c19…).
  - P. 157: "Si s est un point géométrique de M_n, q₁⁻¹(s) est l'ensemble des sous-groupes d'ordre p de E_s, et a p + 1 éléments si car(k(s)) ≠ p, un seul (le noyau de Frobenius) si car(k(s)) = p."
  - (4.7), p. 165: "Le lemme (4.6), appliqué au diagramme commutatif" M_n⊗F_p ⊔ M_n⊗F_p → M′_{n,p}⊗F_p "fournit alors une décomposition de T_p/F_p en la somme des endomorphismes définis par les deux correspondances suivantes": (a), the geometric Frobenius, and (b), through V.
  - So the slip is Deligne's.

### What main says now
- **The source issue is recorded.** `data/source-issues.json` has AutomorphicGaloisRepresentations/E1: kind error, affects nothing, status awaiting review.
  - Its correction: "In characteristic p the fibre has one point (the kernel of Frobenius) if E_s is supersingular and two points (the kernel of Frobenius and the étale subgroup of order p) if E_s is ordinary."
  - Its `known` field cites the RS-12 report. REV-RS-12~2 §3, item 2, rechecked pp. 156–157 and the curve over F₅.
- **The AGR packet has corrected most of the node** (R19.1/geometric-construction-and-the-eichler-congruence-relation, checkpoint 6):
  - the statement: "when car(k(s)) = p it has ONE element (the kernel of Frobenius) if E_s is supersingular and TWO (the kernel of Frobenius, infinitesimal, and the etale subgroup of order p) if E_s is ordinary. [Deligne prints "un seul (le noyau de Frobenius)" in both cases; corrected here, sourceIssue AutomorphicGaloisRepresentations/E1.]";
  - the second hypothesis: "over an ordinary point the two subgroups give the two components (F and V) of the special fibre, over a supersingular point they collide";
  - the tests fibre_q1_supersingular and fibre_q1_ordinary, and acceptance items for y² + xy = x³ + 1 and y² + y = x³ over F̄₂.
- **Still wrong in the packet:**
  - acceptance item 2: "Check that at residue characteristic p the fibre of q_1 really degenerates to the single Frobenius kernel, since that degeneration is the whole source of the congruence relation";
  - the gap "The geometric construction is now partly read, but Theorem 5.1 of the 1969 source is conditional on the Weil conjectures": "Verified: Proposition 3.15 (representability of the Hecke correspondence and the degeneration of its fibre at p)";
  - the proof step for Proposition 4.8 does not name (4.7), where the two components enter.
- **The integrated decomposition** (`data/decompositions/AutomorphicGaloisRepresentations.json`) still has the uncorrected statement, hypothesis and acceptance item. The packet replaces it when promoted.

### Fix
1. **AGR packet, next checkpoint: acceptance item 2.** New: "Check that in characteristic p the fibre of q₁ is the single subgroup ker F over a supersingular E_s, and the two subgroups ker F ≅ μ_p and the étale subgroup over an ordinary E_s. Check that the congruence relation comes from the two components of the special fibre in (4.7), the correspondences F and V, not from a one-point fibre."
2. **Proof step for Proposition 4.8.** Prefix: "(4.7), p. 165: Lemma (4.6), applied to M_n⊗F_p ⊔ M_n⊗F_p → M′_{n,p}⊗F_p, splits T_p/F_p into the correspondence (a), the geometric Frobenius, and the correspondence (b) through V: (E^{(p)}, pα^{(p)}) → (E, α), whose map x is I_p⁻¹ ∘ F."
3. **Gap wording.** Replace "(representability of the Hecke correspondence and the degeneration of its fibre at p)" with "(representability of the Hecke correspondence, and its fibre at p as corrected in E1)".
4. **Source record.** In the node's first source (Proposition 3.15, pp. 156–157), set `match` to: "The fibre of the Hecke correspondence; the 'un seul' clause is false over ordinary points (sourceIssue E1)."
5. **No new source issue.** E1 is the record the red team asked for, with kind error. Its `searched` list may add "Numdam item page of exposé 355: no erratum listed (checked 29 September 2026)".
6. **Optional, maintainer.** Until the packet is promoted, the atlas shows the decomposition's false sentence. The maintainer may copy the packet's corrected statement and hypothesis into the decomposition now.
7. **With /9.** The node keeps Deligne's Sym^k relation (Proposition 4.8, Theorem 4.9) as its own content; the weight-two relation comes from R14.6.

**Cycle test.** No edge is added.

**When:** blueprint (edits 1–5); maintainer (edit 6).

**Sources.**
- P. Deligne, *Formes modulaires et représentations ℓ-adiques*, Séminaire Bourbaki 1968/69, exposé 355, Numdam https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf. Pages 157 and 165 read on page images. Read 29 September 2026; SHA-256 19509c19….

## /6 (medium, error): IHG.1 exports Chenevier's Theorem 2.22(i) with the finite-field splitness lemma, and the AGR packet drops the residue-field descent

### What the verifier corrected
- **Confirmed** in Chenevier's LaTeX source. Theorem B carries "Let A be a henselian local ring with algebraically closed residue field k", and the node's hypothesis and the open gap are verbatim.
- **Theorem 2.22** assumes only "D is Cayley-Hamilton and A is henselian". Part (i) needs D̄ split and absolutely irreducible. Definition 2.19 defines split.
- **The added lemma is correct.** If D̄ is absolutely irreducible, R̄/ker D̄ is central simple of degree d. Over a finite field Wedderburn's theorem makes the Brauer group trivial, so it is M_d(k) and D̄ is split.
- **No descent.** A complete local noetherian Hecke algebra is henselian, so 2.22(i) applies directly and the planned descent step is unnecessary.

### What main says now
- **IHG.1** (`content/campaign/IntegralHeckeAndGaloisDeterminants/README.md`, line 17): "Prove reconstruction over algebraically closed fields up to semisimplification and over complete local rings when residual absolute irreducibility supplies an actual representation." It names neither Theorem 2.22 nor splitness.
- **The IHG packet** (`research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json`, partial) plans six IHG.1 nodes on Cayley–Hamilton algebras and no representability node. It has Lemma 2.33 as IHG.0/continuous-iff-open-kernel.
- **The AGR packet keeps the descent** (checkpoint 6):
  - R19.6/determinants-and-representability-over-a-hecke-algebra keeps the hypothesis "Theorem B requires A henselian local with ALGEBRAICALLY CLOSED residue field; … That descent is not supplied by this source".
  - Its proof steps say "those proofs were not read in this pass" and propose Deligne–Serre Lemme 6.13 as the descent. Its first acceptance item is "Check the passage from a localized Hecke algebra with finite residue field to the hypothesis of Theorem B".
  - The gap "Chenevier's Theorem B has an algebraically-closed-residue-field hypothesis that a Hecke algebra does not satisfy" is open.
  - The request to IHG.1 asks for reconstruction "with the descent from an algebraically closed residue field to the residue field of a localised Hecke algebra".
  - R19.6/hecke-algebra-representation-quaternionic cites "Chenevier's Theorem B with residue-field descent". The gap "Carayol 1994 and Kisin 2008 quoted, not read" says "the descent to the residue field of T_m is requested from IntegralHeckeAndGaloisDeterminants IHG.1".
  - The integrated decomposition has the same node and gap, and its summary says "Chenevier's representability theorem has an algebraically-closed-residue-field hypothesis that a localized Hecke algebra does not satisfy".
- **Ownership is settled.** The merged langlands-1 report (/25) has R19.6 apply IHG.1's representability under Theorem 2.22(i), and import the finite-field "bridge from IHG.1 rather than re-prove it". It left the export itself to its low findings /33 and /35.
- **Library** (pinned baseline: Tau Ceti f790474, Mathlib 082e2d3):
  - `TauCeti.IsSimpleRing.exists_algEquiv_matrix_of_finite` (TauCeti/Algebra/CentralSimple/Wedderburn.lean, line 175): a finite-dimensional central simple algebra over a finite field is a full matrix algebra over it.
  - `TauCeti.subsingleton_brauerGroup_of_finite` (TauCeti/Algebra/BrauerGroup/Trivial.lean, line 247): the Brauer group of a finite field is trivial.
  - Mathlib's `IsAdicComplete.henselianRing` (Mathlib/RingTheory/Henselian.lean, line 170): a ring complete for an ideal I is henselian for I.

### Fix
1. **IHG.1 prose** (line 17). Replace the second sentence.
   - Old: "Prove reconstruction over algebraically closed fields up to semisimplification and over complete local rings when residual absolute irreducibility supplies an actual representation."
   - New: "Prove reconstruction over algebraically closed fields up to semisimplification. Over a henselian local ring A, prove Chenevier's Theorem 2.22(i) (arXiv:0809.0415v2, p. 34) with its exact hypotheses: a Cayley–Hamilton determinant D: R → A whose residual determinant is split and absolutely irreducible gives an A-algebra isomorphism R ≅ M_d(A) with D = det. Export with it the lemma that an absolutely irreducible determinant over a finite field is split. Its proof: R/ker D̄ is central simple of rank d² (Definition–Proposition 2.18(iii), p. 32), so it is a matrix algebra over the finite field (Tau Ceti's exists_algEquiv_matrix_of_finite), which is Definition 2.19's splitness (p. 33). A complete local noetherian ring is henselian, so no descent from an algebraically closed residue field is needed. For a continuous D over a complete local noetherian A with finite residue field, the representation is continuous: apply Lemma 2.33 (p. 38) on each A/m_A^n."
   - Langlands-1's /17 and /27 additions follow the paragraph's last sentence, so the edits compose.
2. **IHG packet, next checkpoint.** Three nodes:
   - IHG.1/representability-over-a-henselian-local-ring: Theorem 2.22(i), p. 34. The proof lifts matrix units as in [BC, Lemma 1.4.3], using Lemma 2.10 for the radical.
   - IHG.1/absolutely-irreducible-over-a-finite-field-is-split, with baseline declaration `TauCeti.IsSimpleRing.exists_algEquiv_matrix_of_finite`.
   - IHG.1/continuity-of-the-reconstruction, from IHG.0/continuous-iff-open-kernel on each A/m_A^n.
3. **AGR packet, next checkpoint: R19.6/determinants-and-representability-over-a-hecke-algebra.**
   - Hypothesis 1. New: "Theorem B assumes an algebraically closed residue field. It is the special case of Theorem 2.22(i) (p. 34), which needs only A henselian, D Cayley–Hamilton, and D̄ split and absolutely irreducible. A complete local noetherian Hecke algebra is henselian, and over its finite residue field an absolutely irreducible D̄ is split (IntegralHeckeAndGaloisDeterminants IHG.1). No descent step is needed."
   - Proof steps. New: "Theorem 2.22 (p. 34) is proved by lifting matrix units, as in [BC, Lemma 1.4.3]. Corollary 2.23 applies it to A[G]/CH(D). Here D̄ is split by IHG.1's finite-field lemma, and the representation is continuous by Lemma 2.33 on each A/m_A^n."
   - Acceptance item 1. New: "Check on a localised Hecke algebra with residue field F_q that R̄/ker D̄ ≅ M_2(F_q), so that D̄ is split, and that no statement over an algebraically closed residue field is used."
   - Sources: add Theorem 2.22 (p. 34), Definition–Proposition 2.18 (p. 32) and Definition 2.19 (p. 33).
4. **AGR packet: the rest of the descent.**
   - Close the gap "Chenevier's Theorem B has an algebraically-closed-residue-field hypothesis that a Hecke algebra does not satisfy". Continuity was the only point left, and Lemma 2.33 settles it.
   - In the IHG.1 request, replace "with the descent from an algebraically closed residue field to the residue field of a localised Hecke algebra" with "under Chenevier's Theorem 2.22(i), with the lemma that an absolutely irreducible determinant over a finite field is split".
   - In R19.6/hecke-algebra-representation-quaternionic (hypothesis 1 and proof step 3), replace "Chenevier's Theorem B with residue-field descent" and "the residue-field descent requested from IntegralHeckeAndGaloisDeterminants IHG.1" with "Chenevier's Theorem 2.22(i) with IHG.1's finite-field splitness lemma". Carayol's Théorème 2 (Contemp. Math. 165) is then not needed for the model over T_m.
   - In the gap "Carayol 1994 and Kisin 2008 quoted, not read", drop the sentence on the descent. With /14 it can close.
   - The handoff's "What remains" loses "Carayol's descent …, matched with Chenevier's Theorem B plus the IHG.1 residue-field descent".
5. **Integrated decomposition.** Its node, gap and summary sentence are replaced when the packet is promoted. The maintainer may apply edit 3 to it now.
6. **Langlands-1.** Its /25 text for R19.6 already cites Theorem 2.22(i) and imports the bridge from IHG.1; edit 1 supplies the export. It is also what that report's low findings /33 and /35 ask of IHG.1. Their node edit at R01.5 stays outside this job.

**Cycle test.** No edge is added. IHG.1 already reaches R19.6 through R01.5 → R19.1 → … → R19.6, and langlands-1 /25 proposes the optional IHG.1 → R19.6.

**When:** now (edit 1); blueprint (edits 2–4); maintainer (edit 5).

**Sources.**
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, arXiv:0809.0415v2: Theorem B (p. 4), Definition–Proposition 2.18 (p. 32), Definition 2.19 (p. 33), Theorem 2.22 (p. 34), Lemma 2.33 (p. 38), Example 3.4 (p. 42). Read 29 September 2026; SHA-256 f3c0e0d8….

## /7 (medium, missing): FiniteFlatGroups R07.5 plans Savitt's reductions of tame-type potentially Barsotti–Tate representations

### What the verifier corrected
- **Confirmed at the sources.**
  - KW I p. 9 states Theorem 5.1(3). The Remarks on p. 10 read "The computation of the weights of the residual representations in Theorem 5.1 (3) and (4) is done by Savitt in Corollary 6.15 (1) and (2) and remark 6.17".
  - KW I p. 15 uses Theorem 5.1(3) to get k(ρ̄′_P) ≤ p + 1. KW II p. 94 uses Savitt for the "computation of k(ρ̄_q)".
  - Khare's Lemma 5.3 is "due to Breuil and Mézard, [BM], Proposition 6.1.1, and Savitt, [Savitt1], Theorem 6.11", and [Savitt1] is the Duke paper on the Conrad–Diamond–Taylor conjecture.
- **No owner.** No stage text names Savitt, Conrad–Diamond–Taylor, Breuil modules or strongly divisible modules. Breuil–Mézard occurs only in PadicLocalLanglandsForGL2Qp R30.5. The pinned declaration index has no Breuil or Kisin module.
- **Graph.** R07.5 is already an ancestor of R24.3, R26.1 and R27.2, so the classical route needs no new edge.

### What main says now
- **R07.5** (`content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, line 72): "Derive the inertia characters of good ordinary and supersingular elliptic-curve torsion and the extension-sensitive finite-flat criteria. Supply the finite-flat generic-fibre calculations from which R15 later proves the p=2 Serre-weight dichotomy and the weight-two criterion for p≥5. Prove the extension-class distinctions used in the peu/très ramifiée cases. These computations feed the explicit recipe in R15, not an axiom defining the weight by desired modularity."
- **R07.4** (line 62) asks for "the appropriate classification of finite-flat groups and p-divisible groups, including descent data and generic-fibre comparison, for the base fields used in KW and Kisin."
- **R24.6** (`content/campaign/PotentialModularityAndCompatibleSystems/README.md`, line 164) begins: "Prove the reduction and specialisation lemmas used to change prime, including determinant, conductor, inertial type, irreducibility and oddness."
- **Pending packets.** These checkpoints came after the red team.
  - `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json` plans Savitt §§2–5 in R07.4, in nine nodes from `R07.4/filtered-modules-with-descent-data` to `R07.4/strongly-divisible-modules-for-characters`. Its source is arXiv:math/0404327v3 (SHA-256 e161ac64…). Its R07.4 coverage note says "Savitt §6 (the explicit families and deformation rings) belongs to LocalGaloisDeformationRings R08.4."
  - `research/blueprint/packets/LocalGaloisDeformationRings.json` plans `R08.4/savitt-weight-two-rings`, Savitt's Theorems 6.22–6.24.
  - The PotentialModularity R24.3 part states the weights in `R24.5/kw-theorem-5-1-systems`. Its gap "Savitt's residual weight computations are requested, not planned" sends the request to AlgebraicModularFormsAndSerreWeights R15.4.
  - The ClassicalSerreModularity R26.1 part plans Khare's Lemma 5.3 as `R26.4/local-reducibility-ordinary`, with prerequisites `R08.4/savitt-weight-two-rings` and `R08.4/ordinary-type-of-components`. Its gap on Savitt's weights stays open.
- **The missing piece.** Nothing plans Savitt §6.3, where the reductions are computed: Theorems 6.11–6.12, Corollary 6.15 and Remarks 6.16–6.17.
- **Order.** R07.5 → R15.4 is an edge, so R07.5 cannot use Serre's recipe. It can state inertial shapes, not Serre weights. KW II p. 94 computes k(ρ̄_q) from three inputs: "the almost strict compatibility", Savitt's Corollary 6.15, and "Serre's definition of weights".
- **Sources read** (29 September 2026):
  - Savitt, arXiv:math/0404327v3, https://arxiv.org/pdf/math/0404327v3 (SHA-256 e161ac64…, the file the FiniteFlatGroups packet records). Read: §2 (Proposition 2.17, pp. 8–9) and §6 (§6.1 p. 27, Lemma 6.8 and Proposition 6.9 p. 30, Theorem 6.11 p. 34, Theorem 6.12 p. 35, Corollary 6.15 pp. 38–39, Remark 6.17 p. 39). Printed page = PDF page.
  - Khare, arXiv:math/0504080v1, https://arxiv.org/pdf/math/0504080v1 (SHA-256 3012a517…), pp. 3, 6 and 21.
  - KW I (as in /1), pp. 9–10 and 15. KW II, https://www.math.ucla.edu/~shekhar/papers/proofs.pdf (SHA-256 53f45f8b…), p. 94.
  - Not read: Breuil–Mézard 2002, Proposition 6.1.1.

### Fix
The fix splits Savitt §6 by content:
- the reductions (§§6.1–6.3) go to R07.5, as the finding says;
- the deformation rings (§§6.5–6.6) stay with R08.4, as the pending packets plan;
- Serre weights are read off in the consumer, R24.6, with R15.4's recipe.

**1. R07.5 prose** (line 72). Append:
> "Compute the reductions of potentially Barsotti–Tate representations of G_{ℚ_p} with Hodge–Tate weights {0, 1} and tame non-scalar type, from R07.4's strongly divisible modules with tame descent data (Savitt 2005, §§6.1–6.3): the explicit modules of Propositions 6.9–6.10, their reductions in Theorems 6.11 and 6.12, the inertial shapes of Corollary 6.15(1),(2), and Remark 6.17 for the semisimplification in every indecomposable case. Deduce Khare's Lemma 5.3 for these types: such a representation of type ω̃^i ⊕ ω̃^j, i ≢ j, whose reduction is reducible is itself reducible, and ordinary after a twist by a power of ω̃. The Serre weights of these reductions are read off where they are used, with R15.4's recipe. The deformation rings of Savitt §6.6 are LocalGaloisDeformationRings R08.4's."

**2. Nodes for R07.5** (FiniteFlatGroups blueprint). Each imports R07.4's Savitt nodes, above all `R07.4/tame-type-weight-two-filtered-modules` (Propositions 2.17–2.21) and `R07.4/strongly-divisible-modules-for-characters`.
- **Explicit strongly divisible modules** (§§6.1–6.2, pp. 27–33): Lemmas 6.1–6.8 and Propositions 6.9–6.10.
- **Reductions** (§6.3, pp. 34–37): Theorem 6.11 for the modules M_{x₁,x₂}, in its three cases val_p(x₁) = 0, val_p(x₂) = 0 and 0 < val_p(x₁), val_p(x₂) < 1; and Theorem 6.12 for M_{m,[1:b]}.
- **Corollary 6.15** (pp. 38–39). Let ρ be potentially crystalline with Hodge–Tate weights {0, 1}, and T a lattice whose reduction has trivial endomorphisms.
  - (1) If τ(ρ) = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1, then (T/𝔪_E)|I_p has one of three listed forms.
  - (2) If τ(ρ) = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m, it has one of four listed forms.
  - Include Remark 6.17 for lattices whose reduction has non-trivial endomorphisms.
- **Khare's Lemma 5.3** (Khare, p. 21). "If a representation ρ : G_{ℚ_p} → GL₂(𝒪) becomes Barsotti-Tate over ℚ_p(µ_p), then if residually the representation is reducible, then ρ itself is reducible. More precisely, a twist of ρ by some power of ω_p … is ordinary."
  - Khare derives it from Breuil–Mézard Proposition 6.1.1 and Savitt Theorem 6.11.
  - For non-scalar type, Savitt alone suffices. By Proposition 2.17 an indecomposable such ρ comes from some D_{x₁,x₂}. If the reduction is reducible, case (3) of Theorem 6.11 is excluded, and the proof of Corollary 6.15 (p. 38) reads "If val_p(x₁) = 0 or val_p(x₂) = 0, then ρ is actually reducible".
  - Acceptance: check the scalar-type case, where a twist of ρ is Barsotti–Tate, against Breuil–Mézard's case list, which this report did not read.

**3. R24.6 prose** (line 164). Old: "Prove the reduction and specialisation lemmas used to change prime, including determinant, conductor, inertial type, irreducibility and oddness." New: "Prove the reduction and specialisation lemmas used to change prime, including determinant, conductor, inertial type, irreducibility, oddness and the Serre weight of ρ̄_q at a prime q where the system has the local types of KW I Theorem 5.1(3),(4). That weight comes from almost strict compatibility at q, Savitt's reductions (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5) and Serre's recipe (AlgebraicModularFormsAndSerreWeights R15.4), as in KW II §10.3.2."
- Add the stage edge R07.5 → R24.6, which the finding's PotentialModularity part asks for. It is already implied (R07.5 → R15.4 → … → R24.6) and acyclic.

**4. Requests to the pending packets** (blueprint).
- **PotentialModularity R24.3 part.**
  - Close the gap "Savitt's residual weight computations are requested, not planned", and send the request to R07.5, not R15.4.
  - Add an item (vi) to `R24.6/residual-members`: the Serre weights of Theorem 5.1(3),(4) when ρ̄_q is irreducible (and q is odd, in (4)), up to twist by a power of χ_q: "i + 2 or q + 1 − i" in (3); "q + 1 − (i − j) or i − j when i > j + 1, and q when i = j + 1" in (4). Its prerequisites are the R07.5 nodes, R15.4 and `R24.5/almost-strict-compatibility`.
  - Move the weight sentences of `R24.3/theorem-5-1-part-3-level-one-type-at-q` and `R24.5/kw-theorem-5-1-systems` into item (vi). R24.3 and R24.5 precede R24.6, so those nodes state only the lifts and the systems.
- **ClassicalSerreModularity R26.1 part.**
  - `R26.4/local-reducibility-ordinary` takes Khare's Lemma 5.3 from its R07.5 node, instead of `R08.4/savitt-weight-two-rings`. That node plans Savitt's deformation rings (Theorems 6.22–6.24), not the reductions.
  - The R26.3 node that controls the weight of the new residual representation (Khare, p. 6: "This control of the weight … is due to a result of Breuil and Mézard in [7], and Savitt [43]") cites the R07.5 reductions and R15.4.
  - `R27.2/theorem-3-2-weight-reduction` cites R24.6's item (vi) for "Theorem 5.1(3)".
  - The Savitt gap closes. The decomposition's copy of the gap closes when the part is promoted.

**When:** now (R07.5 and R24.6 prose, the edge); blueprint (FiniteFlatGroupsAndIntegralPadicHodgeTheory, PotentialModularityAndCompatibleSystems R24.3 part and ClassicalSerreModularity R26.1 part).

## /8 (medium, duplicate): ML.1 imports weight-one modularity over Q from R19.1, R17.5 and R27.6

### What the verifier corrected
- **Confirmed.** ML.1's text and its single input ML.0 are verbatim. Its ancestor closure, with all accepted restructurings and link maps, is exactly {LI.0–LI.4, ML.0}: no AutomorphicGaloisRepresentations and no ClassicalSerreModularity stage.
- R19.1's weight-one Artin clause and R17.5's solvable Artin clause are verbatim. AUDIT-31 records the R19.1/ML.1 overlap in the words quoted.
- KW I (preprint p. 21) gives Corollary 10.2(ii) verbatim.
- RS-21, which links R17.5 → ML.1, is not in `data/restructure` and has no review. No accepted proposal touches ML.1. All three proposed edges are acyclic.

### What main says now
- **ML.1** (`content/campaign/ModularityAndLanglandsExtensions/README.md`):
  - line 29: "**Construct and export.** Organize Deligne-Serre Artin representations, weight-one modularity in proved cases, and modularity over totally real/CM fields with source-scoped restrictions. Separate these from the existing weight-at-least-two cohomological and GL2/Q endpoints."
  - line 31: "**Inputs.** `ModularityAndLanglandsExtensions:ML.0`".
  - The ModularityAndLanglandsExtensions packet (partial) has no ML.1 node yet.
- **R19.1** (line 28 of the AGR README) ends: "Construct the weight-one Artin representation in the Deligne–Serre setting needed for auxiliary arguments." The AGR packet plans Deligne–Serre's Théorème 4.1 with its proof (checkpoint 6).
- **R17.5** (line 152 of the GL2 transfer README): "the solvable two-dimensional Artin modularity theorem with its weight-one interpretation over Q".
- **R27.6** (`content/campaign/ClassicalSerreModularity/README.md`, line 166) exports only "the finite-flat weight-two bounded-level consequence used by R29".
  - The CSM packet part `ClassicalSerreModularity--R27.3.json` (partial) has the node R27.6/scope-of-the-final-statement-and-the-compatible-system-export. It states Theorem 10.1 and says that "Corollary 10.2 (… Artin's conjecture for odd two-dimensional ρ) follows", with no API item for it.
- **KW I**, p. 21: "Corollary 10.2. … (ii) A continuous, odd, irreducible representation ρ : GQ → GL2(C) arises from a newform of weight one." The same page says that the new cases are those with projective image A₅.
- **AUDIT-31** lists ML.1 among R19.1's duplicates: "Organizes the Deligne-Serre weight-one Artin representations also constructed here."

### Fix
1. **Stage edges** (`data/atlas.json`). Add R19.1 → ML.1, R17.5 → ML.1 and R27.6 → ML.1.
2. **ML.1 prose** (line 29).
   - Old: "**Construct and export.** Organize Deligne-Serre Artin representations, weight-one modularity in proved cases, and modularity over totally real/CM fields with source-scoped restrictions. Separate these from the existing weight-at-least-two cohomological and GL2/Q endpoints."
   - New: "**Construct and export.** Over Q, register the proved weight-one results and do not reconstruct them. The Deligne–Serre representation of a weight-one eigenform comes from AutomorphicGaloisRepresentations R19.1. Weight-one modularity of odd two-dimensional Artin representations comes from GL2AutomorphicRepresentationsAndTransfer R17.5 (Langlands–Tunnell) for soluble projective image and from ClassicalSerreModularity R27.6 (KW I Corollary 10.2(ii)) in general. Construct only modularity over totally real and CM fields beyond these owners, with source-scoped restrictions. Separate these from the existing weight-at-least-two cohomological and GL2/Q endpoints."
3. **ML.1 inputs** (line 31).
   - Old: "**Inputs.** `ModularityAndLanglandsExtensions:ML.0`"
   - New: "**Inputs.** `ModularityAndLanglandsExtensions:ML.0`, `AutomorphicGaloisRepresentations:R19.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `ClassicalSerreModularity:R27.6`"
4. **R27.6 prose** (line 166). After "Export the finite-flat weight-two bounded-level consequence used by R29." add: "Export KW I Corollary 10.2(ii): a continuous, odd, irreducible ρ: G_Q → GL₂(C) arises from a newform of weight one (preprint p. 21). ModularityAndLanglandsExtensions ML.1 registers it."
5. **CSM packet (R27.3 part), next checkpoint.** Give R27.6/scope-of-the-final-statement-and-the-compatible-system-export an API item for Corollary 10.2(ii), or a separate node, for ML.1 to cite.
6. **RS-21.** Its link R17.5 → ML.1 is one of these edges, so the two agree. RS-21 was accepted after the baseline (REV-RS-21, #4657), so on the current `main` that edge already exists and only R19.1 → ML.1 and R27.6 → ML.1 remain to add.
7. **Library.** AUDIT-31's duplicate note on R19.1 becomes an import. The maintainer may update it at the next audit.

**Cycle test.** The cycle test for R19.1 → ML.1, R17.5 → ML.1 and R27.6 → ML.1 finds no path from ML.1 back to R19.1, R17.5 or R27.6: acyclic. ML.1's only consumer is ML.2. Jointly with langlands-1's PA.6 → ML.2 and every other edge of these sections: acyclic.

**When:** now (edits 1–4); blueprint (edit 5).

**Sources.**
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, authors' preprint https://www.math.ucla.edu/~shekhar/papers/results.pdf, §10, p. 21. Read 29 September 2026; SHA-256 3c389dc3….

## /9 (medium, duplicate): R14.6 feeds R19.1, which deduces the good-prime polynomial from R14.6's relation

### What the verifier corrected
- **Confirmed.** Both stage texts are verbatim.
- RS-06 narrows R14.6 with the keeps quoted, including the special-fibre Eichler–Shimura relation. Its only link out of R14.6 for that relation goes to HeegnerPointEulerSystems HE.2.
- The ModularCurvesPartII ancestors of R19.1 are R12.1–R12.6, R13.1–R13.5 and R14.1–R14.3, so R14.6 is not among them. The library audit records the duplicate.
- R14.6 → R19.1 is acyclic. The alternative (moving the relation into R14.2 or R14.3, already ancestors of R19.1) is also available.

### What main says now
- **R19.1** (line 28 of the AGR README): "Prove the unramified characteristic polynomial by the geometric Eichler–Shimura relation." Its dependencies (line 30) name R15.5, R01.1, R16.6, R14.3 and R34.5.
- **R14.6** (`content/campaign/ModularCurvesPartII/README.md`, line 264): "Supply the special-fibre Eichler–Shimura relation and the finite-level freeness statements needed for Taylor–Wiles modules."
- **The R14.6 node exists.** The ModularCurvesPartII packet part `ModularCurvesPartII--R14.3.json` (partial) has R14.6/special-fibre-eichler-shimura: "For p ∤ N, in End_{F_p}(J_p) with J_p = Pic⁰_{X₁(N)/F_p} and F the absolute Frobenius: (T_p)_* = F + ⟨p⟩_* F^∨". Its source is Conrad's appendix to the Ribet–Stein lectures, p. 74.
- **The AGR packet already imports it at node level.** The Eichler node lists ModularCurvesPartII:R14.6/special-fibre-eichler-shimura among its prerequisites. Its test eichlerShimura_level_one reads the level-one relation as "the Eichler–Shimura relation of ModularCurvesPartII R14.6 for k = 0". The packet has no `requests` entry to R14.6.
- **So only the stage edge, the README and the request are missing.**
- **Library.** AUDIT-31 lists R14.6 among R19.1's duplicates: "Supplies the special-fibre Eichler-Shimura relation that this layer proves for the unramified characteristic polynomial."

### Fix
1. **Stage edge** (`data/atlas.json`). Add R14.6 → R19.1. This is chosen over moving the relation into R14.2 or R14.3, because RS-06 and the ModularCurvesPartII packet already put it in R14.6.
2. **R19.1 prose** (line 28).
   - Old: "Prove the unramified characteristic polynomial by the geometric Eichler–Shimura relation."
   - New: "Deduce the unramified characteristic polynomial in weight two from the special-fibre Eichler–Shimura relation of ModularCurvesPartII R14.6. Prove here only its extension to Sym^{k−2} coefficients (Deligne, Bourbaki exposé 355, Proposition 4.8 and Theorem 4.9)."
3. **R19.1 dependencies** (line 30). After the R14.3 link, add "[ModularCurvesPartII R14.6](../ModularCurvesPartII/README.md#r14-6)".
4. **AGR packet, next checkpoint.** Add the request `{"supplier": "ModularCurvesPartII:R14.6", "need": "The special-fibre Eichler–Shimura relation (T_p)_* = F + ⟨p⟩_*F^∨ on Pic⁰ of X₁(N) over F_p (R14.6/special-fibre-eichler-shimura), used in weight two.", "neededBy": ["AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation"]}`. The Eichler node keeps Deligne's relation T_p = F + I_p^*V on nW_l = H̃¹(M_n, Sym^k R¹f_*Q_l) as its own content.
5. **Library.** The AUDIT-31 note becomes an import; the maintainer may update it at the next audit.

**Cycle test.** The cycle test for R14.6 → R19.1 finds no path R19.1 → … → R14.6: acyclic, alone and jointly with every other edge of these sections.

**When:** now (edits 1–3); blueprint (edit 4).

**Sources.**
- P. Deligne, Bourbaki exposé 355, as in /5: (4.7), p. 165, read on the page image.

## /10 (medium, duplicate): R19.3 imports the carrier from R24.5:operations and purity from R34.6

### What the verifier corrected
- **Confirmed.** All three stage texts are verbatim.
- R24.5:operations has the single consumer PotentialAutomorphyInfrastructure:PA.5 and is not an ancestor of R19.3.
- The only WeightsInEtaleCohomology ancestor of R19.3 is R34.5, and R34.6 has no descendants. RS-17 narrows R34.6 as quoted.
- The library audit records both duplicates. REV-RS-12~2's verdict is needs_changes, and RS-12 is not in `data/restructure`.
- All three proposed edges are acyclic.

### What main says now
- **R19.3** (line 48 of the AGR README): "Use the weight theorem R34 to prove purity and the coefficient-independent Frobenius polynomials. Construct the compatible family for a fixed eigenform with the precise local statements at all primes where the source proves them. A weak compatible system, an almost strictly compatible system and a strictly compatible system have different definitions; this distinction must survive into R24." Dependencies (line 50): "R19.2 (preceding layer)."
- **R24.5:operations** (`content/campaign/PotentialModularityAndCompatibleSystems/README.md`, line 184): "Build compatible systems as actual representations at coefficient places with common Frobenius polynomials, not only a table of traces; support weak, almost strict and strict local predicates separately." Its only consumer is PA.5; the merged langlands-1 report (/20) proposes AG2.6 as a second.
- **R34.6** (`content/campaign/WeightsInEtaleCohomology/README.md`, lines 115–120): "Use DWP.10's export contracts in the existing eigenform/Kuga–Sato geometric realizations to deduce the actual eigenspace purity and coefficient-independent bounds used by compatible systems and Faltings' finiteness argument." Dependencies (line 122): "R34.5 and DWP.10, plus each actual automorphic realization."
- **The AGR packet names the wrong layer.** Its node R19.3/strict-compatibility-and-the-monodromy-weight-purity lists the prerequisites PotentialModularityAndCompatibleSystems:R24.5 and WeightsInEtaleCohomology:R34.6, and its requests name the same suppliers.
  - R24.5 is the late existence theorem. R19.3 already reaches it (R19.3 → R19.4 → R19.5 → R19.6 → … → R24.5), so a prerequisite on R24.5 closes a cycle.
  - The carrier is R24.5:operations. The PotentialModularityAndCompatibleSystems packet part `--R24.3.json` (partial) plans its nodes under that parent, among them R24.5/compatible-system ("Compatible systems: strict, almost strict, and plain"), R24.5/weakly-compatible-system-rank-n and R24.5/compatible-system-predicates.
- **RS-12** (not accepted) proposes the same narrowing and the same two links. REV-RS-12~2's supplier table agrees; its needs_changes verdict concerns the AG2 extension frontier.

### Fix
1. **Stage edges** (`data/atlas.json`). Add R24.5:operations → R19.3, R19.1 → R34.6 and R34.6 → R19.3.
2. **R19.3 prose** (line 48).
   - Old: the paragraph quoted above.
   - New: "Construct the compatible family of a fixed classical or Hilbert eigenform as an instance of the carrier of PotentialModularityAndCompatibleSystems R24.5:operations; do not import R24.5's later existence theorem. Import eigenspace purity and the coefficient-independent Frobenius polynomials of the classical realisations from WeightsInEtaleCohomology R34.6. Prove the precise local statements at all primes where the source proves them, and state which of the weak, almost strict and strict predicates the family satisfies. The three predicates stay distinct into R24."
3. **R19.3 dependencies** (line 50).
   - Old: "**Dependencies:** R19.2 (preceding layer)."
   - New: "**Dependencies:** R19.2 (preceding layer); [PotentialModularityAndCompatibleSystems R24.5:operations](../PotentialModularityAndCompatibleSystems/README.md#stage-R24.5:operations); [WeightsInEtaleCohomology R34.6](../WeightsInEtaleCohomology/README.md#r34-6)."
4. **R34.6 dependencies** (line 122).
   - Old: "**Dependencies:** R34.5 and DWP.10, plus each actual automorphic realization."
   - New: "**Dependencies:** R34.5 and DWP.10, plus each actual automorphic realization: the eigenform and Kuga–Sato realisations of AutomorphicGaloisRepresentations R19.1."
5. **AGR packet, next checkpoint.**
   - In R19.3/strict-compatibility-and-the-monodromy-weight-purity, replace the prerequisite PotentialModularityAndCompatibleSystems:R24.5 with PotentialModularityAndCompatibleSystems:R24.5/compatible-system and R24.5/compatible-system-predicates.
   - In its fifth hypothesis, "PotentialModularityAndCompatibleSystems R24.5 (request)" becomes "PotentialModularityAndCompatibleSystems R24.5:operations (request)".
   - In the request, the supplier PotentialModularityAndCompatibleSystems:R24.5 becomes PotentialModularityAndCompatibleSystems:R24.5:operations. The R34.6 request stays.
6. **Scope of the purity import.** R34.6 → R19.3 supplies purity for the classical Kuga–Sato realisations. For Hilbert forms the node keeps Saito's Theorem 2, under Carayol's hypothesis.
7. **Langlands-1.** This matches its /20 (R24.5:operations → AG2.6): R19.3 and AG2.6 instantiate the same carrier.

**Cycle test.** The cycle test for R24.5:operations → R19.3, R19.1 → R34.6 and R34.6 → R19.3 finds no path back from R19.3 or R34.6: acyclic, jointly and with langlands-1's R24.5:operations → AG2.6.

**When:** now (edits 1–4); blueprint (edit 5).

## /11 (medium, duplicate): one consecutive-prime lemma, owned by R26.3, feeds R27.2

### What the verifier corrected
- **One lemma.** KW I §7 (p. 12) and Khare §4 state the same inequality with the same threshold 31 and the same constant 3/2 − 1/30. KW I checks it "as in [24]", which is Khare's paper.
- **Two owners.** RS-06 gives R26.3 ("Khare's distinct prime estimates") and R27.2 ("its own prime estimate") separate ownership.
- **Library.** The pinned Mathlib has only ratio-2 bounds. R26.3 → R27.2 is acyclic.

### What main says now
- **R26.3** (`content/campaign/ClassicalSerreModularity/README.md`, line 50): "Prove the analytic/elementary prime estimates and the finite exceptional checks needed for those inequalities."
- **R27.2** (line 124): "Prove Theorem 3.2, W_r⇒L_r, following §8.2, with every prime estimate, residual-image check and application of Theorems 4.1/5.1 explicit." Its dependencies line (line 126) is "R27.1 (preceding layer)".
- **RS-06 (accepted)**, `data/restructure/RS-06.result.json`:
  - R26.3 keeps: "The reviewed node sourced only from KW I's Bertrand-type consecutive-prime estimate is owned at R27.2 as that proof's lemma, not evidence that Khare's distinct prime estimates have been read or proved."
  - R27.2 (keep), reason: "Keep the exact L_r/W_r definitions and W_r→L_r weight recursion of KW Theorem 3.2, including its own prime estimate and finite checks. Receive the stable-ID KW prime-estimate node misfiled under R26.3; do not import Khare's entire level-one recursion."
  - Owners: "KW I consecutive-prime estimate used in its W_r→L_r induction" → R27.2, formerly R26.3.
- **Nodes.**
  - The decomposition still parents `R26.3/prime-gap-estimates-driving-the-weight-recursion` (KW I §7) under R26.3. Its link to `R27.2/theorem-3-2-weight-reduction` notes that "the implied stage edge R26.3 -> R27.2 is new but acyclic".
  - The pending R26.1 packet splits the lemma. `R26.3/chebyshev-next-prime` holds Khare §4; its acceptance reads "These are Khare's own estimates; KW I's §7 estimates (a different inequality set) are R27.2's lemma." `R27.2/prime-gap-estimates-driving-the-weight-recursion` holds KW I §7, under a new ID.
- **The sources.**
  - KW I §7 (p. 12): "for each prime p ≥ 5, there is a prime P > p (for instance the next prime after p)" with (i) an odd prime power ℓ^r ∥ P − 1, ℓ^r = 2m + 1, such that (1) P/p ≤ (2m+1)/(m+1) − (m/(m+1))(1/p); or (ii) 2^r ∥ P − 1 with r ≥ 4 and inequality (2). "We check this by hand for p ≤ 31. From [35] one deduces (see [24]) that for p > 31, P/p ≤ 3/2 − (1/30) = 1.46." The closing Remark: "It is proven in [24] that in fact one can always find P such that (i) holds (for example P the smallest non Fermat prime > p)."
  - Khare §4 (pp. 19–20): "if x > 30, A(x/log(x)) ≤ π(x) ≤ B(x/log(x)) where A = 0.921... and B/A is 6/5 = 1.2 (see [13] and [14], and also page 21 of [26])". Hence p_{n+1} ≤ a·p_n for a > 1.2 and p_n > max(30, a^{6/(5a−6)}).
  - Khare takes P_{n+1} to be p_{n+1}, or p_{n+2} when p_{n+1} is a Fermat prime. He needs the same inequality (1), and considers p_n ≥ 31.
  - Khare's range checks: a = 44/30 = 3/2 − 1/30 up to p_n = 1000, with P_{n+1} = 263 after 251 because 257 is Fermat; a = 44/30 again for 1000 < p_n ≤ 21591; a = √1.499 from 21591 on. "Thus we conclude that we always have a P_{n+1} as desired once p_n ≥ 31."
- **Library.**
  - Mathlib 082e2d3 has Bertrand's postulate `Nat.exists_prime_lt_and_le_two_mul` (Mathlib/NumberTheory/Bertrand.lean:222).
  - It has Chebyshev bounds of ratio log 4 / log 2 = 2: `Chebyshev.theta_le_log4_mul_x` (Mathlib/NumberTheory/Chebyshev.lean:194), and the lower bounds `Chebyshev.psi_ge'` (line 486) and `Chebyshev.theta_ge'` (line 503).
  - Nothing gives consecutive primes within a ratio below 3/2. Tau Ceti f790474 has no prime-counting bounds.
- **Sources read** (29 September 2026): KW I (as in /1), p. 12 and pp. 13–15; Khare (as in /7), pp. 19–20.

### Fix
The finding makes the single lemma Khare's §4 statement: P is the least non-Fermat prime above p. KW I §7 allows any prime P > p, and with this P case (ii) is never needed. The lemma keeps the stable ID that the decomposition already parents under R26.3.

**1. R26.3 prose** (line 50). Old: "Prove the analytic/elementary prime estimates and the finite exceptional checks needed for those inequalities." New: "Prove the consecutive-prime lemma once, for both inductions: for every prime p ≥ 5, the least non-Fermat prime P > p has an odd prime power ℓ^r = 2m + 1 exactly dividing P − 1 with P/p ≤ (2m+1)/(m+1) − (m/(m+1))(1/p) (Khare §4; KW I §7, case (i)). Prove it from Chebyshev's explicit bounds and Khare's range checks for p ≥ 31, and by a finite check for 5 ≤ p < 31. ClassicalSerreModularity R27.2 imports it."

**2. R27.2 prose** (line 124). Old: the sentence quoted above. New: "Prove Theorem 3.2, W_r⇒L_r, following §8.2, with every residual-image check and application of Theorems 4.1/5.1 explicit. Take P to be the least non-Fermat prime above p, and import the consecutive-prime lemma (1) from R26.3; KW I §7 allows any prime P > p with (1) or (2), and with this P case (2) is not needed. Keep here the rearrangement (3) of (1) and the choice of the twisting exponent i."
- Dependencies line (line 126): "R27.1 (preceding layer)." becomes "R27.1 (preceding layer); [ClassicalSerreModularity R26.3](README.md#r26-3) (the consecutive-prime lemma)."
- Add the stage edge R26.3 → R27.2, and R26.3 to R27.2's `requires`. R26 still imports nothing from R27 or R33.

**3. RS-06** (`data/restructure/RS-06.result.json`, and its identical copy in `research/blueprint/restructure/`).
- `layers["ClassicalSerreModularity:R26.3"].keeps`: replace "The reviewed node sourced only from KW I's Bertrand-type consecutive-prime estimate is owned at R27.2 as that proof's lemma, not evidence that Khare's distinct prime estimates have been read or proved." by "Own the single consecutive-prime lemma used by both inductions (Khare §4; KW I §7, case (i)), with its explicit Chebyshev bound and finite checks; R27.2 imports it."
- `layers["ClassicalSerreModularity:R27.2"].reason`: replace "including its own prime estimate and finite checks. Receive the stable-ID KW prime-estimate node misfiled under R26.3; do not import Khare's entire level-one recursion." by "importing the consecutive-prime lemma from R26.3 and keeping inequality (3) and the choice of the exponent i; do not import Khare's level-one recursion."
- `owners`: the entry "KW I consecutive-prime estimate used in its W_r→L_r induction" becomes:
  ```json
  {"target": "Consecutive-prime lemma for the weight recursions of Khare and KW I: the least non-Fermat prime P > p with inequality (1), its explicit Chebyshev bound and its finite checks", "owner": "ClassicalSerreModularity:R26.3", "formerly": ["ClassicalSerreModularity:R27.2"]}
  ```

**4. Nodes** (ClassicalSerreModularity R26.1 part).
- **`R26.3/prime-gap-estimates-driving-the-weight-recursion`** keeps its stable ID and becomes the lemma.
  - Statement: the lemma above, for every prime p ≥ 5.
  - Sources: Khare §4, pp. 19–20; KW I §7 and its Remark, p. 12.
  - Proof: `R26.3/chebyshev-next-prime` for p ≥ 31; the finite check for 5 ≤ p < 31.
- **`R26.3/chebyshev-next-prime`** becomes the separate node.
  - Chebyshev's bounds for x > 30 with B/A = 6/5, and their consequence p_{n+1} ≤ a·p_n.
  - Khare's range checks and the Fermat exception at 251.
  - The finite check for 5 ≤ p < 31.
  - Acceptance: prove the explicit bounds for x > 30 (Khare cites Chebyshev and Ellison–Ellison, p. 21, neither read here), or replace them by explicit bounds of ratio below 3/2. KW I cites Rosser–Schoenfeld; the pinned Mathlib has only ratio 2.
  - A direct computation for this report confirms (1), with P the least non-Fermat prime and ℓ^r the largest odd prime power exactly dividing P − 1, for every prime 5 ≤ p ≤ 2·10⁶. Equality holds at p = 5 (P = 7) and p = 7 (P = 11).
- **Withdraw `R27.2/prime-gap-estimates-driving-the-weight-recursion`.**
  - Its rearrangement (3) and the interval for i move into `R27.2/theorem-3-2-weight-reduction`.
  - That node then cites the R26.3 lemma, and "let P be the next prime after p" becomes "let P be the least non-Fermat prime above p". The case ℓ = 2 and its parity condition drop.
- `R26.3/weight-interval-containment` keeps citing the lemma.

**Cycle test.** R27.2 does not reach R26.3, so R26.3 → R27.2 is acyclic, also jointly with the edges of /1. R33.1–R33.5 still have no R26 ancestor, because R27.2 reaches only R33.6.

**When:** now (README, RS-06 record, edge); blueprint (ClassicalSerreModularity R26.1 part).

## /12 (medium, error): R24.4 assembles KW I Theorem 4.1 directly after R22.6, not after R24.3

### What the verifier corrected
- **The sequencing claim is right.** KW II §10.2 (p. 92): "Thus we need only prove 4.1(1) and 4.1 (2)(i), and the latter only when k = p. … We are assuming that ρ̄ is modular, and thus the assumptions (α) and (β) are fulfilled … by the weight part of Serre's conjecture … At this point we are done by invoking Theorem 9.7."
- **No finiteness, no potential modularity.** Theorem 9.7 (p. 89) ends on p. 90 with "Propositions 9.2 and 9.3, and solvable base change results of Langlands", without Theorem 6.1 or Theorem 10.1. Theorem 10.1 (p. 90) serves Theorem 5.1 in §10.3.1.
- **Hypothesis.** KW I p. 7: Theorem 4.1 assumes "ρ̄ is modular".
- **Graph.** R20.3 and R20.6 are already ancestors of R22.1.

### What main says now
- **R22.5** (`content/campaign/GL2ModularityLifting/README.md`, line 68) ends: "Record exactly which formulations are available without the later global-finiteness argument. The KW I Theorem 4.1 formulation is assembled in R24 after its full KW II §10 inputs, avoiding a circular appeal to potential modularity."
- **RS-08 (accepted)** keeps for R22.5: "… record exactly which formulations are available without the later global-finiteness argument (the KW I Theorem 4.1 formulation is assembled in R24)."
- **R24.4** (`content/campaign/PotentialModularityAndCompatibleSystems/README.md`, line 144): "Complete the derivation of KW I Theorem 4.1 from the results of KW II §10 and the earlier patching theorem." Its dependencies line (line 146) is "R24.3 (preceding layer)".
  - In `data/atlas.json`, R24.4 requires only R24.3, and R24.5 requires only R24.4 (its README dependencies line, line 156, says the same).
  - R24.4's consumers are R27.3, R27.4, R27.5, R27.6 and R24.5. It reaches R23 and R24.1–R24.3 only through R24.3 → R24.4.
- **The node plan already follows §10.2.**
  - The pending GL2ModularityLifting R22.1 part plans Theorem 9.7 as `R22.5/kw-odd-prime-lifting` and `R22.6/kw-dyadic-lifting`. The first says "This formulation uses no finiteness of deformation rings from KW II §10 and no potential modularity."
  - Its R22.5 coverage note ends "KW I Theorem 4.1 is assembled in PotentialModularityAndCompatibleSystems R24.4."
  - The pending PotentialModularity R24.3 part plans `R24.4/alpha-beta-from-residual-modularity` and `R24.4/kw-theorem-4-1`. Their prerequisites are R22.5 and R22.6 nodes, R17.4, R20.6 and R15.4, and nothing in R23 or R24.1–R24.3.
  - The promoted ClassicalSerreModularity R27.3 blueprint requests Theorem 4.1 from R24.4.
  - So only the stage order and R22.5's sentence are wrong.
- **Sources read** (29 September 2026): KW I (as in /1), p. 7; KW II (as in /7), pp. 89–90 and 92.

### Fix
The finding offers two placements. Either Theorem 4.1 becomes an output of R22.5 and R22.6, or R24.4 depends on R22.6 (and R20.3) rather than on R24.3. The second fixes the order with no node moving between packets, and it keeps every consumer's record. So this fix takes it.

**1. R22.5 prose** (line 68). Old: "The KW I Theorem 4.1 formulation is assembled in R24 after its full KW II §10 inputs, avoiding a circular appeal to potential modularity." New: "KW I Theorem 4.1 over ℚ is assembled in PotentialModularityAndCompatibleSystems R24.4 directly from this stage and R22.6, as in KW II §10.2; it uses neither the finiteness theorem of KW II §10.1 nor potential modularity."

**2. RS-08** (`data/restructure/RS-08.result.json`, and its identical copy in `research/blueprint/restructure/`). In `layers["GL2ModularityLifting:R22.5"].keeps`, replace "(the KW I Theorem 4.1 formulation is assembled in R24)" by "(KW I Theorem 4.1 is assembled in R24.4 directly from this layer and R22.6, by KW II §10.2)".

**3. R24.4 prose** (line 144). Old: "Complete the derivation of KW I Theorem 4.1 from the results of KW II §10 and the earlier patching theorem." New: "Derive KW I Theorem 4.1 as KW II §10.2 does. Residual modularity gives (α) and (β) after an allowable base change, by the weight part of Serre's conjecture (SerreWeightAndLevelOptimisation R20.3, R20.6). Theorem 9.7 (GL2ModularityLifting R22.5 for odd p, R22.6 for p = 2) and the cases KW II cites then give modularity, and solvable descent returns to ℚ. The cited cases are Diamond–Flach–Guo for k ≤ p − 1; Kisin's 'Modularity of some geometric Galois representations', with Berger–Li–Zhu, for non-ordinary k = p + 1; Diamond's 'On deformation rings and Hecke rings' for ordinary k = p + 1; Kisin's potentially Barsotti–Tate theorem (R22.5); and Wiles, Taylor–Wiles and Diamond for semistable weight two. This uses neither the finiteness theorem nor potential modularity, so it does not follow R24.1–R24.3." The rest of the paragraph stays.
- Dependencies line (line 146): "R24.3 (preceding layer)." becomes "[GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6)."

**4. R24.5 dependencies** (line 156): "R24.4 (preceding layer)." becomes "R24.4 (preceding layer); R24.3 (prescribed local lifts)."

**5. Atlas edges.**
- The maintainer's removal: R24.3 → R24.4, and R24.3 from R24.4's `requires`.
- Add R22.6 → R24.4 and R24.3 → R24.5.
- No edge R20.3 → R24.4 is needed: R20.3 reaches R22.1, and so R22.6 → R24.4.

**6. Packets.** No node moves. The GL2ModularityLifting R22.1 part's coverage note stays true.

**Cycle test.**
- R24.4's consumers (R27.3–R27.6, R24.5) do not reach R22.6, and R24.5 does not reach R24.3. Both edges are acyclic, also jointly with this report's other edges.
- Afterwards no potential-modularity stage is an ancestor of R24.4. Its only ancestor in R23 or R24.1–R24.3 is the class-field-theory component R23.1:soluble-extensions of /26, which reaches it through R22.1. R24.3 still reaches R27.3–R27.6 (through R27.2) and R24.6 (through R24.5).

**When:** now.

## /13 (medium, missing): R22.1 plans KW II §8, the modular lifts with prescribed local properties

### What the verifier corrected
- **Confirmed at the source.** KW II §8 opens on p. 69: "Theorem 8.4 produces modular lifts, up to allowable base change, with some prescribed local conditions … A crucial input for this is Theorem 8.2 which produces minimal lifts (after allowable base change)". The proof of Theorem 9.7 (p. 90) continues "after another allowable base change as in Theorem 8.4".
- **No stage plans §8.** The four stages that mention a "Theorem 8.2" or "8.4" cite other results: AutomorphicCongruences L2/L2s (Fouquet–Wan), DirichletPadicLFunctions L4 and FiniteFlatGroups R07.3. AUDIT-32 records R22.1 "not built".
- **Graph.** Every import (R17.3, R17.4, R18.3, R19.5, R20.3, R20.6) is already an ancestor of R22.1.

### What main says now
- **R22.1** (`content/campaign/GL2ModularityLifting/README.md`, line 28): "Choose the modular residual representation and construct the localised finite-level Hecke module and algebra with the required local type and determinant. Use the universal property to construct the deformation-to-Hecke map and prove surjectivity from generation by Frobenius/Hecke data. Identify the precise local deformation problem represented at each place. Do not assume a datum whose fields already assert the wanted R=T isomorphism."
- **The roadmap's plan** (line 15): "The source organisation is KW II §§7–9 with the Kisin finite-flat and dyadic component arguments explicitly included."
- **The pending GL2ModularityLifting R22.1 part** (checkpoints of 28–29 September, after the red team) sends §8 to another roadmap.
  - `R22.1/minimal-level-data` says: "The existence of π fitting the lifting data, after allowable base change, is KW II Theorem 8.4, requested from SerreWeightAndLevelOptimisation R20.6."
  - Its request to R20.6 reads: "Existence, after an allowable base change, of a cuspidal π fitting the prescribed lifting data (KW II Theorem 8.4, using Theorem 8.2 for minimal lifts)."
  - `R22.5/kw-residual-modularity` defines (α) and (β) (§8.2, p. 70).
- **R20 does not plan it.** The six R20 stage texts plan the classical level and weight results: level-changing algebra, Mazur's principle and Ribet/Diamond, the Edixhoven/Serre weight theorem, the coefficient-prime level, Buzzard's dyadic branch, and exports for Serre and elliptic curves. None states a result over a totally real field or after an allowable base change; R18's quaternionic geometry enters R20 only as an input. So the request lands where the result is not planned.
- **Also sent to R20.6.** The same packet sends Kisin's quaternionic type and level changes (2-adic Lemmas (3.3.1)–(3.3.4), Annals (3.1.6), (3.5.2), (3.5.3)) to R20.6. That is outside this finding.
- **Sources read** (29 September 2026): KW II (as in /7), pp. 69–76 and 89–90.

### Fix
**1. R22.1 prose** (line 28). After the first sentence insert: "Plan KW II §8. After the solvable totally real base change of Lemma 8.1, with its determinant character ψ, prove Theorem 8.2 (minimal-at-p modular lifts and level-lowering, in cases (a)–(c) and in its p = 2 form), Lemma 8.3 (from weight 2 to weight p + 1 at level prime to p) and Theorem 8.4 (a modular lift that fits the lifting data after an allowable base change). They assume (α) and (β) of §8.2; their consumers verify these, from residual modularity (R24.4) or from potential modularity (R24.1)."

**2. Nodes for the GL2ModularityLifting R22.1 part** (blueprint).
- **Lemma 8.1** (pp. 69–70). There is a totally real F with:
  - F/ℚ solvable, [F : ℚ] even, F unramified at p, and split at p if ρ̄|D_p is irreducible or k(ρ̄) = p + 1;
  - ρ̄_F of non-solvable image if p = 2, and ρ̄|G_{F(µ_p)} irreducible if p > 2;
  - ρ̄_F unramified away from p, and trivial at every place above p if ρ̄|D_p is unramified.
  - It comes with ψ unramified outside p, with χ_pρ_ψ lifting det ρ̄, and with ψ|𝒪*_{F_p} of kind (i) N(u)^{2−k(ρ̄)}, (ii) ω_p^{k(ρ̄)−2}, or (iii) N(u)^{1−p} when k(ρ̄) = 2. For p = 2 only (ii) is used.
  - KW omit the proof ("is easy and is omitted"), so the node must supply it. F is a soluble totally real extension with prescribed completions at p and at the places where ρ̄ ramifies, linearly disjoint from the field cut out by ρ̄ and µ_p. Lemma 4.1.2 of PotentialModularityAndCompatibleSystems R23.1:soluble-extensions (/26) constructs it.
- **Theorem 8.2** (statement p. 71, proof pp. 72–73). The hypotheses are (α) and (β) for p > 2; for p = 2, (α) if k(ρ̄) = 2, and (β). π is as in (α) or (β) according to the case. Σ is a set of finite places where π is an unramified twist of Steinberg; when π is as in (β) and k(ρ̄) = 2, Σ contains the places above p where π is Steinberg. After an allowable base change F″/F, split at p if p > 2, there is a cuspidal π″ lifting ρ̄_{F″}, unramified outside Σ ∪ {p} and Steinberg above Σ, with:
  - (p > 2) (a) parallel weight k(ρ̄), unramified at the places above p outside Σ, for ψ of kind (i); (b) U₁(v)-fixed vectors at v | p and parallel weight 2, for ψ of kind (ii) and k(ρ̄) < p + 1; (c) U₀(v)-fixed vectors at v | p and parallel weight 2, for ψ of kind (ii) and k(ρ̄) = p + 1;
  - (p = 2) parallel weight 2, unramified at the places above 2 outside Σ if k(ρ̄) = 2, Steinberg above 2 with the prescribed U_{v′}-eigenvalue if k(ρ̄) = 4;
  - central character ψ_{F″} in every case.
  - The proof chooses its allowable base changes "using Lemma 2.2 of [60]" (Taylor; p. 72). They are soluble totally real extensions with prescribed behaviour at finitely many places, which Lemma 4.1.2 of R23.1:soluble-extensions constructs. The proof also uses base change (R17.4), Jacquet–Langlands (R17.3), Lemma 7.3 and the argument of Lemma 7.4 (R18.3; see /19), Lemma 7.7 (R19.5), and the twisting Lemma 7.10. For p = 2, Lemma 7.10's character of 2-power order comes from Lemma 4.1.1 of the same component, in place of KW's appeal to Grunwald–Wang (/26).
  - /3 adds this node's hypotheses and proof steps, read at pp. 70–73.
- **Lemma 8.3** (p. 73). D_{F″} is definite and unramified at the finite places outside Σ, with Σ disjoint from the places above p, and U_v = GL₂(𝒪_{F_v}) above p. If ρ̄_{F″} arises from a maximal ideal of the Hecke algebra on S_{2,ψ}(U, 𝔽), it arises from one on S_{p+1,ψ}(U, 𝔽).
  - The proof is the group-cohomological argument of Edixhoven–Khare, "Hasse invariant and group cohomology", §4, Proposition 1, iterated over the places above p (pp. 73–74). Each step's injectivity is Lemma 7.1 (R18.3).
  - The Remark on p. 71 says case (a) with k(ρ̄) = 2 and weight p + 1 is not used in KW II; mark it so.
- **Theorem 8.4** (statement pp. 75–76, proof pp. 76–78). The hypotheses are those of Theorem 8.2. There is a cuspidal π′ over an allowable base change F′ lifting ρ̄_{F′} with the lifting data of §8.3:
  - type (A), (B) or (C) above p;
  - unramified where the data are unramified;
  - of the form (γ_vχ_p ∗; 0 γ_v) at the ramified places away from p;
  - det ρ_{π′} = ψ_{F′}χ_p.
  - The proof raises the level one place at a time, by Ribet's method through Ihara's lemma (Kisin, "Moduli of finite flat group schemes, and modularity", Corollary 3.1.11 and Lemma 3.5.3). It uses KW II Lemma 7.1 (R18.3), Jacquet–Langlands (R17.3), local–global compatibility (Carayol and Taylor; AutomorphicGaloisRepresentations R19.4), Theorem 8.2 and Lemma 7.7 (R19.5).
- **Packet edits.** Withdraw the request to R20.6 for Theorem 8.4. Point `R22.1/minimal-level-data` at the new Theorem 8.4 node.

**3. Graph.** R17.3, R17.4, R18.3, R19.4 and R19.5 are ancestors of R22.1, and so are R20.3 and R20.6, which verify (α) and (β) downstream. The field choices of Lemma 8.1 and Theorem 8.2 add one edge, PotentialModularityAndCompatibleSystems:R23.1:soluble-extensions → R22.1, listed with /26. R17.4 specializes EndoscopicTransferAndUnitaryTraceComparison ET.4b under the part-1 fixes report (/1 there); nothing here conflicts with it.

**When:** now (R22.1 prose); blueprint (GL2ModularityLifting R22.1 part).

## /14 (medium, missing): R19.5 gets Kisin's Theorem (4.3) with its proof, and R08.3 feeds R19.5

### What the verifier corrected
- **KW II.** Lemma 7.7 (p. 67, §7.6.1) is verbatim: F totally real and unramified at p, π cuspidal and discrete series of parallel weight k ≥ 2 at the infinite places, residually absolutely irreducible. There is no discrete-series hypothesis at a finite place.
- **Kisin.** The Corollary of the introduction (p. 514) is stated for every Hilbert eigenform of weight k with all k_i ≥ 2 of the same parity and ρ̄_π absolutely irreducible. The next paragraph derives the case without a discrete-series place from Taylor's interpolation and "Theorem (2.7.6) below", which is on p. 534.
  - The verifier's text layer dropped the bracketed fragments. This job's extraction of the same PDF keeps them: "the corollary follows from work of Carayol [Ca, Thm. A] … together with a result of Saito [Sa 2]. When [F : Q] is even, Taylor [Ta 1] constructed ρπ by interpolating representations ρπ′ where π′ is special at some w′ ∤ p".
- **The atlas.** The integrated R19.5 node assumes Carayol's parity hypothesis. R19.5 requires only R19.4, R18.5 and R06.5, the packet's sources have no Kisin, and R08.3 → R19.5 is acyclic.

### What main says now
- **R19.5** (line 68 of the AGR README) begins: "Use R06 and the geometry to prove the de Rham/crystalline/potentially semistable statements, Hodge weights and inertial-type comparisons available for these representations." Its dependencies (line 70) are R19.4, R18.5 and R06.5.
- **The AGR packet** (checkpoint 6) adds R19.5/hilbert-local-behaviour-at-p: KW II Lemma 7.7 and Corollary 7.8, with no finite discrete-series hypothesis. But:
  - its hypothesis says "Kisin's paper is not read here";
  - its first proof step is "Kisin's corollary, and Saito's theorem under Carayol's hypothesis";
  - its prerequisites are PadicHodgeTheory R06.3, R06.5 and R06.6 nodes, the R19.5 Saito node and the Carayol node;
  - the gap "Carayol 1994 and Kisin 2008 quoted, not read" and the handoff's "What remains" ("Kisin's corollary (JAMS 2008), which is quoted through KW II") record the same.
- **The LocalGaloisDeformationRings packet** (partial) already states Kisin's Theorem (2.5.5) for any complete local noetherian A° (R08.3/semistable-height-quotient). It states Theorem (2.7.6) with Corollary (2.7.7) for the framed ring R^□_{V_F} (R08.3/pst-deformation-ring).
- **R08.3** (`content/campaign/LocalGaloisDeformationRings/README.md`, line 48): "Use the period-functor and formal-geometry theory to construct Kisin's potentially semistable deformation rings with fixed Hodge and inertial type."
- **What Kisin's proof needs** (Theorem (4.3), p. 543, with its proof on pp. 543–544):
  - If π is discrete series at a finite place, Saito [Sa 2] with Carayol. Otherwise π_v is not special for v | p, and one must prove potential crystallinity and tr(w | σ^{ss}(V)) = tr(w | σ_v) (4.3.1).
  - By [Sa 1, Lem. 1] it suffices to take ν(w) > 0. After a base change to a finite totally real F′/F, σ_v is unramified and w maps to a generator.
  - A Hecke algebra T, finite flat over O, with ρ_T: G_{F,S} → GL_2(T_m) and T_m[1/p] étale; this needs ρ̄ absolutely irreducible.
  - R, the quotient of R_{V_F} for crystalline representations of p-adic Hodge type k "given by Theorem (2.7.6)", and the bundle D_R with Frobenius from Theorem (2.5.5); T_φ is the trace of φ^{ν(w)}.
  - Taylor's Hecke algebra T^µ_m with an auxiliary prime µ ∤ p: for each s > 0, µ can be chosen so that θ_π mod p^s factors through the µ-new quotient, whose points are special at µ, so Carayol and Saito apply.

### Fix
1. **Stage edge** (`data/atlas.json`). Add R08.3 → R19.5.
2. **R19.5 prose** (line 68). After the first sentence add: "Include Kisin's theorem (J. Amer. Math. Soc. 21 (2008), Theorem (4.3), the corollary of its introduction): for a Hilbert eigenform with all weights k_i ≥ 2 of the same parity and ρ̄_π absolutely irreducible, ρ_π is potentially semistable at every v | p with the Hodge type of k and compatible with local Langlands, without Carayol's discrete-series hypothesis. Its proof uses Theorems (2.5.5) and (2.7.6) from LocalGaloisDeformationRings R08.3 and Taylor's congruences from R19.2."
3. **R19.5 dependencies** (line 70). Append: "; [LocalGaloisDeformationRings R08.3](../LocalGaloisDeformationRings/README.md#r08-3) for Kisin's Theorems (2.5.5) and (2.7.6)."
4. **R08.3 prose** (line 48). After the first sentence add: "Export Kisin's Theorem (2.5.5), with the module D over the semistable quotient carrying φ and N, and Theorem (2.7.6) with Corollary (2.7.7) (J. Amer. Math. Soc. 21 (2008), pp. 530–534). AutomorphicGaloisRepresentations R19.5 applies them to the framed deformation ring of ρ̄|G_{F_v} (Kisin §4)."
   - The red team also asked for (2.7.6) over an arbitrary A°. §4 applies it only to R_{V_F} ("the quotient of R_{V_F} (cf. Subsection (3.3.3))", p. 543), which the packet's node covers. (2.5.5) is already stated for an arbitrary A°. This consumer needs no more generality.
5. **AGR packet, next checkpoint: node R19.5/kisin-hilbert-compatibility-at-p.**
   - Statement: Theorem (4.3) (p. 543), with the p-adic Hodge type of the introduction (p. 514).
   - Proof steps: those listed above, from pp. 543–544.
   - Prerequisites:
     - LocalGaloisDeformationRings:R08.3/pst-deformation-ring and R08.3/semistable-height-quotient;
     - R19.2/taylor-representations-without-a-discrete-series-place (/2), for Taylor's T^µ_m;
     - R19.2/hilbert-modular-compatible-system-carayol-theorem-A and PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p, for forms special at µ;
     - PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p, whose proof uses Saito's Lemma 1;
     - IntegralHeckeAndGaloisDeterminants:IHG.1 for ρ_T, through Theorem 2.22(i) and the lemma of /6. Not R19.6/hecke-algebra-representation-quaternionic, which is downstream of R19.5;
     - GL2AutomorphicRepresentationsAndTransfer:R17.4 for the base change to F′ (/4).
   - Hypotheses: ρ̄_π absolutely irreducible. KW II records (p. 93) that without it only almost strict compatibility follows.
   - Acceptance: check that F′/F can be taken solvable, since R17.4 gives base change only along solvable extensions; Kisin does not say which F′.
6. **AGR packet: related edits.**
   - R19.5/hilbert-local-behaviour-at-p: cite the new node in its first proof step, and delete "Kisin's paper is not read here".
   - Close the gap "Carayol 1994 and Kisin 2008 quoted, not read" (with /6).
   - Add a request to LocalGaloisDeformationRings:R08.3 for R08.3/pst-deformation-ring and R08.3/semistable-height-quotient, needed by the new node.
   - Add `kisin-pst-08` to the sources with its `sourceVersions` entry.

**Cycle test.** The cycle test for R08.3 → R19.5 finds no path R19.5 → … → R08.3: acyclic, alone and jointly with every other edge of these sections.

**When:** now (edits 1–4); blueprint (edits 5–6).

**Sources.**
- M. Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21 (2008), 513–546, published PDF https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf: the Introduction (pp. 513–515), Theorem (2.5.5) (p. 530), (2.7.5)–(2.7.7) (p. 534), (3.3.3) (p. 540), §4 (pp. 542–544) and the references [Ta 1] and [Ta 2] (p. 546). Read 29 September 2026; SHA-256 3e70d1f7….
- Khare–Wintenberger, *Serre's modularity conjecture (II)*, as in /2: pp. 67, 70, 72 and 93.

## /15 (medium, error): R01.4 states the residual-image lemmas that R04.5 already imports

### What the verifier corrected
- **No correction.** The verifier confirmed each fact at its pin:
  - R04.5's text and its requires [R04.4, R02.6] are as quoted.
  - R01.4 reaches G7, R26.4, R26.5, R27.1, R27.2, R33.2, R33.3, R29.1, R29.2, R25.2 and R25.3, but not R04.5. R04.5's only ArithmeticGaloisRepresentations ancestors were R01.1 and R01.2.
  - KW II p. 40 states Lemma 4.3(5), and p. 51 uses it: "We know from Lemma 4.3 (5) that the only non-zero, irreducible G-submodule V of Ad is Z".
  - Neither library has the classification: every "dickson" match is Polynomial.dickson. AUDIT-32 records that R04.5's residual-image and dual-Selmer inputs "do not exist at all".
- R01.4 → R04.5 is acyclic.

### What main says now
- **The edge exists.** Since the red team, the promoted GlobalGaloisDeformations blueprint (commit `642bb491`, 28 September 2026; status partial, within RS-08) puts R01.4 → R04.5 in the assembled atlas, with kind `blueprint`. Its nodes R04.5/image-hypotheses and R04.5/dyadic-linear-disjointness list ArithmeticGaloisRepresentations:R01.4 as a prerequisite.
- **Its request is open.** The blueprint's request to R01.4 needs "Dickson's classification for the residual images used here: images containing SL_2(𝔽_p) have adjoint image PSL_2 or PGL_2(𝔽_{p^s}) with abelianisation of order ≤ 2; non-solvable 2-dimensional mod-2 images have projective image SL_2(𝔽_{2^r}), r > 1; and H¹(SL_2(𝔽_{2^r}), M_2(𝔽)) = 0 with the submodule list 0, Z, Ad⁰, Ad (KW II Lemma 4.3(5))." It is needed by R04.5/image-hypotheses, R04.5/dyadic-linear-disjointness and R04.5/dyadic-taylor-wiles-primes.
- **R01.4 does not state them.** R01.4 (`content/campaign/ArithmeticGaloisRepresentations/README.md`) says: "Prove the finite-subgroup facts of GL₂/PGL₂ used in the source arguments, including dihedral and exceptional images, normal subgroups, and behaviour under restriction to cyclotomic fields. Consume the general finite-group classification results where present; construct each application with the coefficient field visible." No ArithmeticGaloisRepresentations packet exists.
- **The other odd-p input is not R01.4's.** H¹(Gal(KF_m/F), Ad⁰(ρ̄)*(1)) = 0 (KW II Lemma 5.2(1)) belongs to ArithmeticGaloisDuality R02.6 by RS-08, and the blueprint imports it from there.
- **R04.5's first sentence is quoted by a link.** Link CH-L12 of the Chebotarev link map quotes "Combine Chebotarev, residual-image lemmas and dual Selmer calculations to choose primes with prescribed Frobenius eigenvalues and q≡1 mod p^n."
- **Source:** Khare–Wintenberger, *Serre's modularity conjecture (II)*, post-refereeing preprint, https://www.math.ucla.edu/~shekhar/papers/proofs.pdf, read 29 September 2026, SHA-256 prefix 53f45f8be3b3c7de. Printed page = PDF page.
  - Lemma 4.3, pp. 40–41. (2)(i): "For p > 2 we have that H⁰(G_F, Ad⁰) = H⁰(G_F, (Ad⁰)*(1)) = 0", proved "as ρ̄|F(µp) is absolutely irreducible ... (see proof of Corollary 2.43 of [14])", [14] being Darmon–Diamond–Taylor.
  - (2)(ii): for p = 2 "the projective image of ρ̄ ... is G := SL2(F_{2^r}) for r > 1", with H⁰(G, Ad) = H⁰(G, Ad⁰) = Z and H⁰(G, Ad/Z) = H⁰(G, (Ad⁰)*) = 0; the proof uses "Dickson's theorem".
  - (5)(i): "We have that H¹(G, Ad) = 0", which "is Lemma 42 of [21]" (Dickinson, Duke Math. J. 109 (2001)). (5)(ii): "The only G-submodules of Ad are 0, Z, Ad0, Ad."
  - §5.3, p. 47, statement of Lemma 5.2: "(Hence ρ̄|G_{F(ζ_{p^m})} is irreducible for all non-negative integers m.)"

### Fix
**1. `content/campaign/ArithmeticGaloisRepresentations/README.md`, R01.4.** After "Define bad-dihedral representations in the precise source sense.", insert:

> State and prove, as named lemmas for GlobalGaloisDeformations R04.5 (Khare–Wintenberger II §§4–5; Gee, Proposition 5.10), with the coefficient field visible:
> - **Dickson's classification** of the finite subgroups of PGL₂(F̄_p), in the two forms R04.5 uses. For p ≥ 5, a finite subgroup of GL₂(F̄_p) containing SL₂(F_p) has projective image PSL₂(F_{p^s}) or PGL₂(F_{p^s}), whose abelianization has order at most 2. An absolutely irreducible ρ̄ : G_F → GL₂(F̄₂) with non-solvable image has projective image PGL₂(F₀) ≅ SL₂(F₀) for a subfield F₀ with |F₀| = 2^r, r > 1 (KW II Lemma 4.3(2)(ii)). Neither Mathlib nor Tau Ceti has the classification at the pins (the only "dickson" matches are Polynomial.dickson), so it is proved here.
> - **Invariants for p = 2.** For such ρ̄, H⁰(G_F, Ad) = H⁰(G_F, Ad⁰) = Z, the scalars, and H⁰(G_F, Ad/Z) = H⁰(G_F, (Ad⁰)*) = 0 (Lemma 4.3(2)(ii)).
> - **Cohomology and submodules for p = 2.** For G = SL₂(F₀) ⊂ GL₂(F) with |F₀| = 2^r, r > 1: H¹(G, M₂(F)) = 0 (Lemma 4.3(5)(i), after Dickinson, Duke Math. J. 109 (2001), Lemma 42), and the only G-submodules of Ad are 0, Z, Ad⁰ and Ad (Lemma 4.3(5)(ii)).
> - **Odd p.** If p > 2 and ρ̄|G_{F(ζ_p)} is absolutely irreducible, then H⁰(G_F, Ad⁰) = H⁰(G_F, (Ad⁰)*(1)) = 0 (Lemma 4.3(2)(i), after Darmon–Diamond–Taylor's proof of Corollary 2.43), and ρ̄|G_{F(ζ_{p^m})} is irreducible for every m ≥ 0 (KW II, statement of Lemma 5.2).
>
> These answer the request of the promoted GlobalGaloisDeformations blueprint to this stage. The vanishing H¹(Gal(KF_m/F), Ad⁰(ρ̄)*(1)) = 0 of KW II Lemma 5.2(1) belongs to ArithmeticGaloisDuality R02.6, not to this stage.

**2. `content/campaign/GlobalGaloisDeformations/README.md`, R04.5.** After its first sentence, insert: "The residual-image lemmas are ArithmeticGaloisRepresentations R01.4's." The first sentence stays verbatim, so the quote of link CH-L12 still matches.

**3. No new edge.** R01.4 → R04.5 is in the assembled atlas through the promoted blueprint.
- The cycle test for R01.4 → R04.5: R04.5 has no path to R01.4.
- The test also holds jointly with the other edges of this report and with those of `RT-AREA-langlands-1.fixes.md`.

**4. Blueprint.** The ArithmeticGaloisRepresentations blueprint plans the four lemmas as nodes of R01.4, which closes the request. Until then the request stays open.

**When:** now for the prose; blueprint for the nodes.

## /16 (medium, error): R08.1 imports local Tate duality and the Euler characteristic from ClassFieldTheory Layer 5

### What the verifier corrected
- **The substance holds.** The texts of R08.1, R08.2, D7 ("Local Tate duality for finite modules remains upstream ClassFieldTheory") and Layer 5 item 8 are verbatim, and so is KW II p. 26's "It follows using Euler characteristic and duality". At the pins, tateDualityPairing_perfect_mixed, finite_H and eulerCharacteristic_finrank_fp are Tau Ceti targets, not declarations, and Mathlib has no local Tate duality.
- **One correction.** "No LocalGaloisDeformationRings stage has the owner ... as an ancestor" is exact for the raw atlas and for the atlas with the accepted restructurings.
  - With the accepted link map `data/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json` also applied, R08.3–R08.6, L7 and L8 do reach Layer 5, by Layer 5 → VectorBundlesAndIsocrystals VB0 → FiniteFlatGroups R07.4 → R08.3.
  - That route is an isocrystal route, not a supply of duality, and it does not pass through D7.
- **Where the defect sits.** R08.1 and R08.2, which hold the tangent, dimension and smoothness counts, have no Layer 5 ancestor in any of the three graphs.
- Layer 5 → R08.1 is acyclic.

### What main says now
- **R08.1** (`content/campaign/LocalGaloisDeformationRings/README.md`): "Prove framed local representability and the tangent/obstruction description." Its assembled prerequisites are R01.1, R03.1, R03.2 (with a node of it), R04.1 and Tau Ceti ModularCurves 7d and 7f. No ClassFieldTheory layer is among its ancestors.
- **The owner.** Layer 5 says: "Prove finiteness of `H⁰`, `H¹`, `H²` (`finite_H`), the cardinality Euler characteristic, and the frozen `𝔽_p` finrank formula `eulerCharacteristic_finrank_fp`." Among its links are CFT-L57 to D7, CFT-L58 to R02.4 and CFT-L101 to VB0; none goes to a LocalGaloisDeformationRings stage.
- **The packet already asks for it.** The LocalGaloisDeformationRings packet (checkpoints 1–8, 28–29 September 2026, not yet reviewed) proves the dimension bound in R08.1/local-tangent-obstruction: "(3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p". Its request to Layer 5 is open. It names only R08.1/local-tangent-obstruction and R08.1/local-fixed-determinant.
- **Other nodes use the same two theorems** without going through local-tangent-obstruction:
  - R08.6/export-ordinary, the analogue of KW II Lemma 3.7: "the finite cocycles Z¹_f(B(Ξ)) ... form a free B-module of rank 1 + [F_v : ℚ_p]";
  - R08.6/export-endpoint-weight, whose obstruction lies in H²(𝔽(χ_p)) and is detected by a cup product;
  - L7/ordinary-fixed-inertial-characters-smoothness and L7/discrete-series-smoothness, which use local duality and the local Euler characteristic.
- **R04.5 expects this route.** The node GlobalGaloisDeformations:R04.5/taylor-wiles-local-cohomology says: "Local Tate duality and the local Euler characteristic formula are requested from ArithmeticGaloisDuality R02.4 (and Tau Ceti ClassFieldTheory Layer 5 via LocalGaloisDeformationRings)."
- **Source:** KW II preprint (as in /15), Lemma 3.7, pp. 25–26: "It follows using Euler characteristic and duality that (∗) |Z¹(D_v, M)| = |M|^{1+[F:Q_p]} |H⁰(D_v, M*)|."

### Fix
**1. New link CFT-L104** (maintainer's edit; the link map is accepted). Add it to `links` in `data/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json` and in its identical copy `research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json`:

```json
{
  "id": "CFT-L104",
  "source": "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality",
  "target": "LocalGaloisDeformationRings:R08.1",
  "reason": "CFT Layer 5 proves local Tate duality for finite modules and the local Euler characteristic formula (tateDualityPairing_perfect_mixed, finite_H, eulerCharacteristic_finrank_fp). R08.1's tangent and obstruction description turns h¹ and h² into dimensions with exactly these theorems: h² is h⁰ of the Tate dual, and h⁰ − h¹ + h² is −n²[K:Q_p] for ℓ = p and 0 for ℓ ≠ p. The later layers of the roadmap reach Layer 5 through R08.1; the route through VectorBundlesAndIsocrystals VB0 supplies the Brauer invariant, not duality. Scope: the mixed-characteristic theorems, for finite K/Q_ℓ and finite modules of p-power order, ℓ = p included. RT-AREA-langlands-2/16.",
  "confidence": "inferred",
  "evidence": [
    {"stageId": "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality", "quote": "Construct local Tate duality from the evaluation pairing `Hom(A,μ_n) × A → μ_n`."},
    {"stageId": "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality", "quote": "Prove finiteness of `H⁰`, `H¹`, `H²` (`finite_H`), the cardinality Euler characteristic, and the frozen `𝔽_p` finrank formula `eulerCharacteristic_finrank_fp`."},
    {"stageId": "LocalGaloisDeformationRings:R08.1", "quote": "Prove framed local representability and the tangent/obstruction description."}
  ],
  "addedBy": "FIX-RT-AREA-langlands-2"
}
```

The three quotes match their stage texts after whitespace normalization, as `scripts/check_links.py` compares them. The link gives the stage edge Layer 5 → R08.1 in the assembled atlas.

**2. `content/campaign/LocalGaloisDeformationRings/README.md`, R08.1.**
- After "Prove framed local representability and the tangent/obstruction description.", insert:
  > Turn the tangent and obstruction groups into dimensions with local Tate duality and the local Euler characteristic formula, imported from Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, finite_H, eulerCharacteristic_finrank_fp); they are not proved here. R08.2–R08.6, L7 and L8 use them through this stage.
- In its "**Dependencies:**" line, add "Tau Ceti ClassFieldTheory Layer 5 (local duality and the local Euler characteristic)".

**3. Blueprint** (the LocalGaloisDeformationRings packet, at its next checkpoint). In the request to Layer 5, name the three declarations. Add to its `neededBy` R08.6/export-ordinary (the KW II Lemma 3.7 analogue), R08.6/export-endpoint-weight, L7/ordinary-fixed-inertial-characters-smoothness and L7/discrete-series-smoothness.

**4. Cycle test.** No Tau Ceti stage depends on the campaign, so R08.1 has no path to Layer 5. The edge is acyclic alone, and jointly with the other edges of this report and those of `RT-AREA-langlands-1.fixes.md`.

**When:** now for the link and the prose; blueprint for the request.

## /17 (medium, error): a successor R06.4:crystalline-to-ordinary owns KW II Lemma 3.5 and the Berger–Li–Zhu calculation, before R08.5 and R21.5

### What the verifier corrected
- **No correction.** The verifier confirmed:
  - KW II p. 22 states Lemma 3.5 with the crystalline-weight cases and "The second part is a result of [3]", [3] being Berger–Li–Zhu. P. 31, §3.2.7, treats the weight-(p + 1) crystalline case, with a formally smooth ring "of relative dimension 3 + [F_v : Q_p]".
  - The three stage texts and the two owner records are verbatim.
  - The cycle is real. With the accepted links there is a path R08.5 → R08.6 → R02.5 → R02.6 → R04.5 → R21.5, whose edges R08.6 → R02.5, R02.6 → R04.5 and R04.5 → R21.5 come from RS-08. So R21.5 cannot supply R08.5.
  - R06.4 is not an ancestor of R08.5, is already an ancestor of R21.5, and R06.4 → R08.5 is acyclic: "the proposed single owner works".
- **Fixed with /31.** This finding moves the owner; /31 supplies PhiGamma to the layer that keeps the calculation.

### What main says now
- **R21.5** (`content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md`): "Supply the crystalline-to-ordinary criterion used in the source, including the Berger–Li–Zhu calculation rather than assuming low weight forces ordinarity."
- **R08.5** (`content/campaign/LocalGaloisDeformationRings/README.md`): "Supply the crystalline endpoint-weight calculations used in KW I Theorem 4.1, including the cases not covered by the elementary Fontaine–Laffaille interval." It requires R08.4 and L7.
- **R06.4** (`content/campaign/PadicHodgeTheory/README.md`): "State separately p=2 and modular weights p and p+1, which need the appropriate Breuil–Kisin/local theorem. Include the ordinary and crystalline criteria actually invoked in those branches." It requires R07.3, R07.4 and R06.2; its only consumer is R06.5.
- **The owner records.**
  - RS-06 `owners[47]`: target "The ordinary crystalline-to-ordinary/BLZ criterion and its Skinner–Wiles p=3 branch", owner R21.5, formerly R25.5, R26.5 and R33.4.
  - RS-08 `owners[39]`: target "Small-prime Skinner–Wiles/BLZ ordinary lifting input", owner R21.5, formerly R32.4 and R32.5.
  - RS-06's `layers` entry for R25.5 keeps "the source-specific checks applying R21.5's crystalline-to-ordinary/BLZ criterion at the terminal weights".
- **The blueprints split the criterion today.** None is reviewed.
  - The OrdinaryAutomorphicFormsAndModularityLifting packet (checkpoint 6) plans it in R21.5, in four nodes: R21.5/crystalline-family-v-k-ap, R21.5/blz-reduction-theorem, R21.5/reduction-of-v-k-zero and R21.5/crystalline-reducible-reduction-is-ordinary. The second requires PadicHodgeTheory P7/wach-dcris-comparison and PhiGamma PG.1, PG.6 and PG.7.
  - The PadicHodgeTheory--P7 packet plans R06.4's side: R06.4/two-dimensional-ordinarity-criterion, the unit-root criterion, and R06.4/weight-p-plus-one-branch, which says the endpoint calculations "are made in LocalGaloisDeformationRings:R08.5 using this interface".
  - The LocalGaloisDeformationRings packet's R08.6/export-endpoint-weight assumes "Crystalline lifts of weight p + 1 are ordinary (Berger–Li–Zhu, KW II Lemma 3.5(i) for F_v = ℚ_p)" with no supplier. Its R08.6/export-ordinary cites Lemma 3.5(iii) as "Breuil–Diamond–Taylor Lemma 2.1.2"; KW II's reference [13] is Conrad–Diamond–Taylor, J. Amer. Math. Soc. 12 (1999).
- **Sources** (read 29 September 2026):
  - KW II preprint (as in /15), p. 22, Lemma 3.5: "(i) if V is crystalline of weight k such that 2 ≤ k ≤ p, V is ordinary if residually it is ordinary. The same is true for 2 ≤ k ≤ p + 1 if F = Qp. (ii) if V is semistable non crystalline of weight 2, then V is ordinary. (iii) if V is of weight 2 and crystalline over Q_p^nr(µp), then V is ordinary, if residually it is ordinary." The first part of (i) is proved there from Fontaine–Laffaille; "The second part is a result of [3]", Berger–Li–Zhu; (iii) "is proved in [13] (Lemma 2.1.2.)". P. 31: "By [3], we know that such lifts are ordinary (Lemma 3.5, recall that we are supposing Fv = Qp)."
  - Berger–Li–Zhu, *Construction of some families of 2-dimensional crystalline representations*, Math. Ann. 329 (2004) 365–377; arXiv:math/0310275v1, https://arxiv.org/pdf/math/0310275v1, SHA-256 prefix e291beb15400c5a7.
    - P. 10, Theorem 4.1: "Given α ∈ m_E, the two k_E-representations k_E ⊗_{O_E} T_{k,a_p} and k_E ⊗_{O_E} T_{k,0} are isomorphic." Remark 4.2(1): "if k = p + 1, then one may take m = 0".
    - P. 11, Corollary 4.3(1): "If k ⩽ p + 1, then V̄_{k,a_p} ≃ V̄_{k,0} if v_p(a_p) > 0". Proposition 4.4: V̄_{k,0} = ind(ω₂^{k−1}) when (p + 1) ∤ (k − 1).
    - The proof of Theorem 4.1 compares the (φ, Γ)-modules at each α and applies Fontaine's functor. Dee's theorem on families appears only in Remarks 3.8 and 4.2(3).

### Fix
**1. New sub-stage `PadicHodgeTheory:R06.4:crystalline-to-ordinary`,** a successor of R06.4 (it requires its parent). In `content/campaign/PadicHodgeTheory/README.md`, insert after the R06.4 section, before `<a id="r06-5"></a>`:

> <a id="stage-R06.4:crystalline-to-ordinary"></a>
> ### R06.4:crystalline-to-ordinary — The crystalline-to-ordinary criterion and the Berger–Li–Zhu calculation
>
> **Construct and export.** Khare–Wintenberger II, Lemma 3.5, stated once. Let F/Q_p be unramified and V a two-dimensional representation of G_F over a finite E/Q_p, lifting ρ̄.
> - (i) If V is crystalline of weight 2 ≤ k ≤ p and ρ̄ is ordinary, V is ordinary (Fontaine–Laffaille; the proof of KW II p. 22, from R06.4's Fontaine–Laffaille interface). For F = Q_p the same holds for k = p + 1.
> - (ii) If V is semistable and not crystalline of weight 2, V is ordinary (R06.4's two-dimensional ordinarity criterion).
> - (iii) If V has weight 2, is crystalline over Q_p^nr(μ_p) and ρ̄ is ordinary, V is ordinary (Conrad–Diamond–Taylor, J. Amer. Math. Soc. 12 (1999), Lemma 2.1.2, as KW II cite it).
>
> The weight-(p + 1) case of (i) is the Berger–Li–Zhu calculation (Math. Ann. 329 (2004)):
> - the crystalline representations V_{k,a_p}, and the Wach modules N_{k,α} over O_E[[π]] with N_{k,α}/π ≅ D_{k,a_p} (Proposition 3.7);
> - Theorem 4.1: the reductions of T_{k,a_p} and T_{k,0} agree; Remark 4.2(1) allows m = 0 at k = p + 1;
> - Corollary 4.3(1): V̄_{k,a_p} ≅ V̄_{k,0} for k ≤ p + 1 and v_p(a_p) > 0; Proposition 4.4: V̄_{k,0} = ind(ω₂^{k−1}), irreducible for 2 ≤ k ≤ p + 1.
>
> With R06.4's unit-root criterion this gives: a crystalline V of weight 2 ≤ k ≤ p + 1 over Q_p with reducible reduction is ordinary. Low weight alone does not force ordinarity.
>
> **Inputs.** R06.4 (the Fontaine–Laffaille interface, ordinary representations, the two-dimensional ordinarity criteria); PhiGammaModulesAndIwasawaCohomology PG.6 (Wach modules and their D_cris comparison, with Fontaine's étale equivalence PG.1 before it). Theorem 4.1 is proved one α at a time with Fontaine's functor, so the relative families of PG.7 are not an input. Sources to add: Berger–Li–Zhu; Conrad–Diamond–Taylor, Lemma 2.1.2.
>
> **Consumers.** LocalGaloisDeformationRings R08.5, for the weight-(p + 1) crystalline rings of KW II §3.2.7, and through R08.6 the ordinary rings of KW II Proposition 3.6 and Lemma 3.7. OrdinaryAutomorphicFormsAndModularityLifting R21.5, and through it SmallRamificationAndAbelianVarietyBaseCases R25.5, ClassicalSerreModularity R26.5 and R33.4, and GL2ModularityLifting R32.5.

- **Stage record:** key `R06.4:crystalline-to-ordinary`, `parentStageId` `PadicHodgeTheory:R06.4`, title "The crystalline-to-ordinary criterion and the Berger–Li–Zhu calculation". The key is not in use or reserved in `research/blueprint/reserved-ids.json`.
- **Why a successor and not R06.4 itself.** PG.6 → R06.4 would add PG.6 and 57 more stages to R06.4's ancestors. They would then also sit above 69 of R06.4's descendants that do not use the criterion and were not already below PG.6.
  - The added stages include ArithmeticGaloisDuality R02.1–R02.4 and D7, SelmerIwasawaCohomology L0–L3, PadicMeasuresIwasawaAlgebras L0–L5 and PG.0–PG.5.
  - The affected descendants include R06.5's geometric comparison theorems and, through them, HodgeTateAndCanonicalSubgroups T1–T6, PerfectoidShimuraVarieties S1–S6 and TorsionCohomologyInfrastructure TC.1–TC.4.
  - The successor keeps the single owner inside R06.4 without that.

**2. README text of the parent and the consumers.**
- **R06.4.** After "Include the ordinary and crystalline criteria actually invoked in those branches.", add: "Khare–Wintenberger II Lemma 3.5, with the Berger–Li–Zhu calculation at weight p + 1, is stated once, in the successor [R06.4:crystalline-to-ordinary](#stage-R06.4:crystalline-to-ordinary)."
- **R21.5.** Replace "Supply the crystalline-to-ordinary criterion used in the source, including the Berger–Li–Zhu calculation rather than assuming low weight forces ordinarity." with:
  > Import the crystalline-to-ordinary criterion that the sources use (Khare–Wintenberger II Lemma 3.5, with the Berger–Li–Zhu calculation at weight p + 1) from PadicHodgeTheory R06.4:crystalline-to-ordinary; low weight alone does not force ordinarity. This stage keeps the Skinner–Wiles theorems and the p = 3 branch.
- **R08.5.** After "Supply the crystalline endpoint-weight calculations used in KW I Theorem 4.1, including the cases not covered by the elementary Fontaine–Laffaille interval.", insert:
  > That crystalline lifts of weight p + 1 over Q_p are ordinary (KW II Lemma 3.5(i), Berger–Li–Zhu) is imported from PadicHodgeTheory R06.4:crystalline-to-ordinary. OrdinaryAutomorphicFormsAndModularityLifting R21.5 comes after this stage and cannot supply it.

  In R08.5's "**Dependencies:**" line, add "[PadicHodgeTheory R06.4:crystalline-to-ordinary](../PadicHodgeTheory/README.md#stage-R06.4:crystalline-to-ordinary)".

**3. Stage edges.** R06.4 → R06.4:crystalline-to-ordinary, PG.6 → R06.4:crystalline-to-ordinary (finding /31), R06.4:crystalline-to-ordinary → R08.5 and R06.4:crystalline-to-ordinary → R21.5.
- If the blueprint keeps the P7/wach-dcris-comparison prerequisite of the Berger–Li–Zhu node, also add PadicHodgeTheory:P7 → R06.4:crystalline-to-ordinary. P7 has no consumers, so this edge is acyclic too.
- R06.4 → R08.5 is not added: it is transitive through the successor.
- **Cycle test.** Neither consumer, R08.5 or R21.5, reaches R06.4, PG.6 or P7. The four edges, with the optional fifth, are acyclic alone and jointly with the other edges of this report and those of `RT-AREA-langlands-1.fixes.md`.
- Through RS-08's coarse link R08.6 → R02.5, PG.6 also becomes an ancestor of ArithmeticGaloisDuality R02.5 and R02.6 and GlobalGaloisDeformations R04.5. That link is outside this finding.

**4. Owner records** (maintainer's edits to accepted records, in both `data/restructure/` and `research/blueprint/restructure/`).
- RS-06 `owners[47]`: replace it by two entries.
  ```json
  {"target": "The crystalline-to-ordinary criterion (Khare–Wintenberger II Lemma 3.5, with the Berger–Li–Zhu calculation at weight p + 1)", "owner": "PadicHodgeTheory:R06.4:crystalline-to-ordinary", "formerly": ["SmallRamificationAndAbelianVarietyBaseCases:R25.5", "ClassicalSerreModularity:R26.5", "ClassicalSerreModularity:R33.4", "OrdinaryAutomorphicFormsAndModularityLifting:R21.5"]}
  {"target": "The Skinner–Wiles p=3 branch", "owner": "OrdinaryAutomorphicFormsAndModularityLifting:R21.5", "formerly": ["SmallRamificationAndAbelianVarietyBaseCases:R25.5", "ClassicalSerreModularity:R26.5", "ClassicalSerreModularity:R33.4"]}
  ```
- RS-08 `owners[39]`: change the target to "Small-prime Skinner–Wiles ordinary lifting input (the Berger–Li–Zhu criterion it applies is PadicHodgeTheory:R06.4:crystalline-to-ordinary's)".
- RS-06 `layers["SmallRamificationAndAbelianVarietyBaseCases:R25.5"].keeps`: replace "R21.5's crystalline-to-ordinary/BLZ criterion" by "the crystalline-to-ordinary/BLZ criterion of PadicHodgeTheory R06.4:crystalline-to-ordinary, reached through R21.5".
- **Links that stay.** RS-06's links R21.5 → R26.5, R33.4, R25.5 and R25.6, and RS-08's link R21.5 → R32.5, stay. Those consumers also apply Skinner–Wiles, and they reach the new owner through R21.5.

**5. Blueprint.**
- Move the four Berger–Li–Zhu nodes of the OrdinaryAutomorphicFormsAndModularityLifting packet (R21.5/crystalline-family-v-k-ap, blz-reduction-theorem, reduction-of-v-k-zero and crystalline-reducible-reduction-is-ordinary) under R06.4:crystalline-to-ordinary in the PadicHodgeTheory blueprint, whose P7 packet already plans R06.4's nodes. Drop PG.7 from blz-reduction-theorem's prerequisites.
- In the LocalGaloisDeformationRings packet, R08.6/export-ordinary and R08.6/export-endpoint-weight cite R06.4:crystalline-to-ordinary for ordinarity. In export-ordinary, "Breuil–Diamond–Taylor Lemma 2.1.2" becomes "Conrad–Diamond–Taylor, J. Amer. Math. Soc. 12 (1999), Lemma 2.1.2".

**When:** now for the sub-stage, the edges and the prose; maintainer for the RS-06 and RS-08 records; blueprint for moving the nodes.

## /18 (medium, duplicate): R08.3 owns Kisin's potentially semistable rings in every rank, and L7 imports them

### What the verifier corrected
- **No correction.** Both stage texts are verbatim, and the atlas edge R08.3 → L7 exists.
- **The question is open.** REV-RS-08's first question for the orchestrator states the overlap and records "This correction was not made", leaving options X and Y. RS-23, accepted after the baseline (REV-RS-23, #4650), has no record for either stage. AUDIT-33 flags the same pair.
- **Kisin is rank-general.** In J. Amer. Math. Soc. 21 (2008), Theorem (2.7.6) on p. 534 quantifies over a finite E-algebra B with no rank restriction. Theorems (3.3.4) and (3.3.8) on pp. 540–541 give dimensions in terms of d².
- **The division of labour** is the one that REV-RS-08's option X already leans to.

### What main says now
- **R08.3** (`content/campaign/LocalGaloisDeformationRings/README.md`): "Use the period-functor and formal-geometry theory to construct Kisin's potentially semistable deformation rings with fixed Hodge and inertial type."
- **L7**, second paragraph: "For every finite rank n and finite extension K/Q_p construct fixed labeled Hodge-type and inertial-type potentially semistable deformation rings, retaining the coefficient field, framing and determinant/multiplier constraints. Prove the characteristic-zero point criterion, allowed reduced/flat quotient properties and the Kisin dimension formula in its hypotheses. A nonempty type is never assumed for arbitrary data."
- **RS-08 settles neighbouring questions, not this one.**
  - `owners[32]` makes L7 the owner of "Rank-general height-lattice moduli and proper-image construction".
  - `owners[34]` makes R08.2 the owner of "Away-p local deformation types retaining the monodromy operator", and link R08.2 → L7 says L7's rank-n away-p conditions "build on R08.2's conditions ... L7 cites them and proves compatibility rather than constructing them again".
  - No owner record covers the potentially semistable rings.
- **REV-RS-08**, "Questions for the orchestrator", 1: "Option X (recommended by one reader): R08.2/R08.3 own them in every rank and L7 is narrowed to import them." It ends: "Decide before the LocalGaloisDeformationRings blueprint."
- **The blueprint has taken option X for these rings.** The LocalGaloisDeformationRings packet (checkpoint 3, not yet reviewed) plans R08.3/pst-deformation-ring ("Let V_𝔽 be a d-dimensional 𝔽-representation of G_K"), R08.3/pst-generic-fibre and R08.3/pcris-generic-smooth in every dimension d. It gives L7 only the lattice moduli (L7/finite-height-lattices, L7/height-lattice-moduli) and, in later checkpoints, the Fontaine–Laffaille, ordinary-flag and CHT conditions. The README texts still say the opposite.
- **Source.** Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21 (2008) 513–546.
  - The AMS PDF (https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) returned a Cloudflare challenge on 29 September 2026. The published pages above are those that the verifier and the packet record (AMS PDF, SHA-256 prefix 3e70d1f7, read 28 September 2026).
  - The statements were checked in the author's preprint with the same numbering (https://people.math.harvard.edu/~kisin/dvifiles/def.dvi, read 29 September 2026 through a text extraction of the DVI, SHA-256 prefix ca85f74a47caf411). The Introduction begins "Let K/Q_p be a finite extension" and takes "V_F a finite dimensional F-vector space equipped with a continuous action of G_K". Theorem (2.5.5) takes "V_{A°} a finite free A°-module of rank r". Theorem (2.7.6) quantifies over any finite E-algebra B. Theorems (3.3.4) and (3.3.8) give the dimension d² + dim_E ad D_{E,K}/Fil⁰ ad D_{E,K}.

### Fix
**1. `content/campaign/LocalGaloisDeformationRings/README.md`, R08.3.** Replace "Use the period-functor and formal-geometry theory to construct Kisin's potentially semistable deformation rings with fixed Hodge and inertial type." with:

> Use the period-functor and formal-geometry theory to construct Kisin's potentially semistable deformation rings with fixed p-adic Hodge type and Galois type, for a residual representation of any finite dimension d of G_K and any finite extension K/Q_p, as Kisin states them (J. Amer. Math. Soc. 21 (2008): Theorem (2.5.5), Corollary (2.6.2), Theorem (2.7.6) with Corollary (2.7.7), and Theorems (3.3.4) and (3.3.8)), with the fixed-determinant variants. This is the only construction of these rings: L7 and the rank-two layers R08.4–R08.6 use it.

**2. The same README, L7.** Replace "For every finite rank n and finite extension K/Q_p construct fixed labeled Hodge-type and inertial-type potentially semistable deformation rings, retaining the coefficient field, framing and determinant/multiplier constraints. Prove the characteristic-zero point criterion, allowed reduced/flat quotient properties and the Kisin dimension formula in its hypotheses." with:

> Import from R08.3 the fixed labeled Hodge-type and inertial-type potentially semistable deformation rings in every rank n over every finite K/Q_p, with their characteristic-zero point criterion, reduced and flat quotients and Kisin's dimension formula; do not construct them again. Record, for each consumer, the coefficient field, framing and determinant or multiplier constraints it uses.

- The next sentence, "A nonempty type is never assumed for arbitrary data.", and the rest of L7 stay.
- L7 keeps the bounded-height lattice moduli (its first paragraph), the Fontaine–Laffaille conditions, the ordinary flag functors, and the away-p analogues that RS-08's link R08.2 → L7 already builds on R08.2.
- L7's export sentence in its last paragraph is edited by `RT-AREA-langlands-1.fixes.md` /22; see /22 below.

**3. Owner record** (maintainer's edit to the accepted RS-08, in both `data/restructure/RS-08.result.json` and `research/blueprint/restructure/RS-08.result.json`). Add to `owners`:

```json
{"target": "Kisin's potentially semistable deformation rings of fixed p-adic Hodge type and Galois type, in every rank over every finite K/Q_p (J. Amer. Math. Soc. 21 (2008), (2.7.6), (3.3.4), (3.3.8))", "owner": "LocalGaloisDeformationRings:R08.3", "formerly": ["LocalGaloisDeformationRings:L7"]}
```

This answers REV-RS-08's first question for these rings with option X. The away-p conditions stay as RS-08's owner record and its link R08.2 → L7 have them.

**4. Edges.** None: R08.3 → L7 exists.

**When:** now for the prose; maintainer for the RS-08 record.

## /19 (medium, duplicate): R18.3 owns the Galois-free freeness results of KW II §7; R22.2 applies them

### What the verifier corrected
- **Confirmed.** KW II §7.4 (pp. 63–66) proves Lemma 7.4 and Corollary 7.5 for the definite quaternionic modules over 𝒪[Δ_Q]. §7.5 (p. 66) adds the p = 2 twists of Proposition 7.6.
- **The records.** The R18.3 and R22.2 texts and the RS-08 report's keep for R22.2 are verbatim. AUDIT-32 lists R18.3 among R22.2's duplicates. No accepted proposal touches either layer. RS-23 keeps R18.3's freeness, but it is not accepted.
- **Graph.** R18.3 is already an ancestor of R22.2 through R18.6 → R22.1.

### What main says now
- **R18.3** (`content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md`, line 152): "Compute stabilisers and prove freeness over Taylor–Wiles group rings under the actual hypotheses, including KW II's dyadic twisting construction. A finite set of cosets does not by itself make the module free over the required group algebra."
- **R22.2** (`content/campaign/GL2ModularityLifting/README.md`, line 38): "Add the Taylor–Wiles primes chosen by R04, construct the auxiliary Hecke modules and the finite group actions, and prove the required freeness/control statement. Verify stabilisers, integral torsion, character choices and specialisation back to the original level. Treat the p=2 twisting and real-place modifications from KW II separately."
- **RS-08 (accepted).**
  - Its report `data/restructure/RS-08.md` (line 252) keeps R22.2 as "Actual auxiliary automorphic levels, finite-level modules and freeness, using R04.5 primes; the congruence condition alone does not prove freeness." `RS-08.result.json` has no layer record for R22.2.
  - Its owners give "Actual Taylor–Wiles auxiliary-prime selection with prescribed congruences and eigenlines" to R04.5, formerly G7, R22.2 and R21.4.
- **AUDIT-32** (`research/blueprint/audit/AUDIT-32.result.json`, pending review) lists R18.3 among R22.2's duplicates: "Owns definite quaternionic forms and their Taylor-Wiles level structures, the Hecke modules R22.2 uses."
- **RS-23** (not accepted at the baseline) keeps R18.3: "… and the source-specific integral freeness and dyadic tests." It has since been accepted (REV-RS-23, #4650) with that keep unchanged.
- **The pending GL2ModularityLifting R22.1 part already splits the work.**
  - `R22.2/delta-freeness-at-taylor-wiles-level`: "Freeness of the full space S_{k,ψ}(U_Q, 𝒪) over 𝒪[Δ_Q] (KW II Lemma 7.4; Gee Proposition 5.4(2)) and the Ihara-type lemma (KW II Lemma 7.1) are HilbertModularVarietiesAndShimuraCurves R18.3, requested through R18.6." The node adds the localization and the control statement, citing AutomorphicGaloisRepresentations R19.6 for local–global compatibility.
  - `R22.2/dyadic-twists-of-forms`: "The twist f ↦ f_χ and Proposition 7.6 on quaternionic forms are R18.3's …".
  - Its request to R18.6 lists the §7.2 isotropy groups, Lemma 7.4, Lemma 7.1 and Proposition 7.6.
- **What KW II proves, and with what.**
  - §7.4 (p. 63) works with any finite set Q of places outside S with N(v) ≡ 1 mod p^n. Δ_v is the p-part of k_v^× modulo its N-torsion, where N bounds the Sylow p-subgroups of the isotropy groups (§7.2).
  - Lemma 7.4 (p. 64): S_{k,ψ}(U_Q, 𝒪) is free over 𝒪[Δ_Q].
  - Corollary 7.5 (p. 65) assumes a non-Eisenstein 𝔪 at which ρ̄_𝔪(Frob_v) has distinct eigenvalues for v ∈ Q. Its freeness comes from Lemma 7.4, since the localization is a direct factor (p. 66).
  - Its rank and Δ_Q-coinvariants need more: "there is no automorphic representation π … which is (a twist of) Steinberg at any place in Q which can give rise to ρ̄_𝔪. This in turn follows from the compatibility of the local-global Langlands correspondence proved in [10] and [61]", together with Lemma 7.1.
  - Proposition 7.6 (pp. 66–67) twists by characters χ of order 2 of Gal(F_{Q_n}^S/F), for Q_n "as in Lemma 5.10", viewed as idele class characters.
  - Lemma 7.2 (§7.1, p. 60) describes ρ_f|D_v at v ∈ Σ, and is used in §9.1.
- **Why the split matters.** R18.3 reaches AutomorphicGaloisRepresentations R19.2–R19.6, because the Hilbert Galois representations are built from R18's geometry. So R18.3 cannot import local–global compatibility without a cycle.
- **Sources read** (29 September 2026): KW II (as in /7), pp. 60–67.

### Fix
R18.3 takes what needs no Galois representation. R22.2 keeps what does, and the choice of Q.

**1. R18.3 prose** (line 152). Replace "Compute stabilisers and prove freeness over Taylor–Wiles group rings under the actual hypotheses, including KW II's dyadic twisting construction." by: "Own the Galois-free results of KW II §7, for any finite set Q of places outside S with N(v) ≡ 1 mod p^n: the isotropy groups and the exponent N of their Sylow p-subgroups (§7.2); Lemma 7.3 on their behaviour under base change; the Ihara-type Lemma 7.1; Lemma 7.4, freeness of S_{k,ψ}(U_Q, 𝒪) over 𝒪[Δ_Q]; the freeness in Corollary 7.5 of the localization at a maximal ideal 𝔪 at which X² − T_vX + N(v)ψ(π_v) has distinct roots modulo 𝔪 for v ∈ Q; and the twists f ↦ f_χ of Proposition 7.6, for an idele class character χ of order 2, trivial at the infinite places and unramified outside Q. The choice of Q (GlobalGaloisDeformations R04.5) and every statement that needs Galois representations belong to GL2ModularityLifting R22.2."
- Lemma 7.2 is not part of this ownership. It needs the Galois representations of R19 and serves §9.1, so it stays with GL2ModularityLifting.

**2. R22.2 prose** (line 38). New text: "Add the Taylor–Wiles primes chosen by R04.5, construct the auxiliary levels, Hecke modules and finite group actions, and apply R18.3's freeness results to them. Prove the control statement of KW II Corollary 7.5, its rank and its Δ_Q-coinvariants, from local–global compatibility at the places of Q (AutomorphicGaloisRepresentations R19.4, reached through R19.6) and R18.3's Ihara-type lemma. Check the character choices and specialisation back to the original level. For p = 2, identify the twists of Proposition 7.6 with the characters of Gal(F_{Q_n}^S/F) by class field theory, match them with the deformation side (R04), and keep KW II's real-place modifications here."

**3. RS-08** (`data/restructure/RS-08.result.json`, and its identical copy in `research/blueprint/restructure/`). Append to `owners`:
```json
{"target": "Galois-free freeness of definite quaternionic forms at Taylor–Wiles level (KW II §7.2 isotropy, Lemmas 7.1, 7.3 and 7.4, the freeness in Corollary 7.5 and the twists of Proposition 7.6), for any finite Q with N(v) ≡ 1 mod p^n", "owner": "HilbertModularVarietiesAndShimuraCurves:R18.3", "formerly": ["GL2ModularityLifting:R22.2"]}
```
- The report row for R22.2 (RS-08.md, line 252, and its copy) becomes: "Actual auxiliary automorphic levels and finite-level modules at the R04.5 primes, with the control statement; the freeness over 𝒪[Δ_Q] is R18.3's, for any Q with N(v) ≡ 1 mod p^n."

**4. Blueprint.** HilbertModularVarietiesAndShimuraCurves has no packet yet. Its first packet plans these statements in R18.3 and exports them through R18.6, answering the GL2ModularityLifting packet's open request. RS-23's keep for R18.3, accepted after the baseline, agrees with this owner.

**Graph.** No new edge. R18.3, R19.4 and R04.5 are all ancestors of R22.2. R18.3 reaches R19.4, which is why the control statement cannot move up.

**When:** now (R18.3 and R22.2 prose, RS-08 owners and report row); blueprint (HilbertModularVarietiesAndShimuraCurves).

## /20 (medium, duplicate): R22.6 is the one owner of Hypothesis (H)

### What the verifier corrected
- **Confirmed.** KW I p. 18 states Hypothesis (H) as quoted. The Remark after it lets one replace the condition at p by "potentially Barsotti–Tate", by Breuil and Kisin.
- **Two owners.** The R22.6 and R27.5 texts, RS-08's keeps for R22.6 and RS-06's keeps for R27.5 (suppliedBy R22.6 and R24.4) are verbatim. The integrated node `R27.5/hypothesis-H-and-theorem-9-1` exists. So two accepted proposals assign the same derivation to two layers.
- **What stays at R27.5.** The fix leaves R27.5 Theorem 9.1's weight-four and even-conductor reduction, which is what KW I §9 adds.

### What main says now
- **R22.6** (`content/campaign/GL2ModularityLifting/README.md`, line 78): "Prove the 2-adic lifting results needed by KW I and the stronger Barsotti–Tate statement supplying its Hypothesis H. … State the source theorem with its complete hypotheses, then derive precisely the hypothesis used in KW I §9."
- **RS-08** keeps for R22.6: "Keep the 2-adic lifting theorems needed by KW I and Kisin's stronger Barsotti–Tate theorem supplying its Hypothesis H, stated with complete hypotheses … and derive precisely the hypothesis used in KW I §9."
- **R27.5** (`content/campaign/ClassicalSerreModularity/README.md`, line 156): "Apply Kisin's precise 2-adic Barsotti–Tate theorem to prove Hypothesis H of KW I §9. Follow Theorem 9.1 to obtain the residual p=2, weight-four case and then odd characteristic with arbitrary even conductor. …"
- **RS-06** keeps for R27.5: "Own the proof-specific application of Kisin's exact 2-adic Barsotti–Tate result to KW Hypothesis H, followed by Theorem 9.1's weight-four and arbitrary-even-conductor reduction. Keep local types, coefficient-prime changes and soluble/nonsolvable split; import the dyadic lifting theorem itself."
- **The integrated node.** The promoted blueprint `data/blueprints/ClassicalSerreModularity--R27.3.json` supersedes the decomposition for R27.5.
  - Its node `R27.5/hypothesis-H-and-theorem-9-1` states (H) and adds: "By Breuil (p ≠ 2) and Kisin, "weight 2 and potentially crystalline" may be read as potentially Barsotti–Tate. KW I invoke (H) only at p = 2, where it is Kisin's theorem (GL2ModularityLifting R22.6/hypothesis-h), so Theorem 9.1 is unconditional."
  - Its hypotheses include "the weight-2 and potentially crystalline conditions at p are both needed; the Breuil–Kisin remark only reformulates them". Its prerequisites include `GL2ModularityLifting:R22.6/hypothesis-h`.
- **The pending GL2ModularityLifting R22.1 part** already derives (H) at p = 2 as `R22.6/hypothesis-h`, from Kisin's Theorem (0.1). Its hypothesis takes the Breuil–Kisin step from FiniteFlatGroups R07.4, which plans `R07.4/crystalline-01-is-bt`.
- **Library coverage** (`data/library-coverage.json`) lists R22.6 as R27.5's duplicate: "Proves Kisin's 2-adic Barsotti-Tate lifting theorem and derives precisely Hypothesis H of KW I section 9."
- **Source read** (29 September 2026): KW I (as in /1), pp. 18–19.

### Fix
**1. R27.5 prose** (line 156). Old: "Apply Kisin's precise 2-adic Barsotti–Tate theorem to prove Hypothesis H of KW I §9." New: "Import Hypothesis (H) of KW I §9 at p = 2 from GL2ModularityLifting R22.6, which derives it from Kisin's 2-adic Barsotti–Tate theorem, including the step from potentially crystalline of weight 2 to potentially Barsotti–Tate." The rest of the paragraph stays.

**2. R22.6 prose** (line 78). After "then derive precisely the hypothesis used in KW I §9" add ", including the step from potentially crystalline of Hodge–Tate weights {0, 1} to potentially Barsotti–Tate (Breuil for p > 2, Kisin in general; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4)". R07.4 is already an ancestor of R22.6.

**3. RS-06** (`data/restructure/RS-06.result.json`, and its identical copy).
- `layers["ClassicalSerreModularity:R27.5"].keeps` becomes: "Own Theorem 9.1's weight-four and arbitrary-even-conductor reduction, with its local types, coefficient-prime changes and soluble/nonsolvable split. Import Hypothesis (H), and Kisin's dyadic theorem behind it, from GL2ModularityLifting R22.6." `suppliedBy` stays R22.6 and R24.4.
- Append to `owners`:
  ```json
  {"target": "KW I Hypothesis (H) at p = 2 from Kisin's 2-adic Barsotti–Tate theorem, including the Breuil–Kisin step from potentially crystalline of Hodge–Tate weights {0, 1} to potentially Barsotti–Tate", "owner": "GL2ModularityLifting:R22.6", "formerly": ["ClassicalSerreModularity:R27.5"]}
  ```

**4. The integrated node** (`data/blueprints/ClassicalSerreModularity--R27.3.json` and its `.md` rendering).
- In the statement of `R27.5/hypothesis-H-and-theorem-9-1`, delete "By Breuil (p ≠ 2) and Kisin, "weight 2 and potentially crystalline" may be read as potentially Barsotti–Tate."
- Replace "where it is Kisin's theorem (GL2ModularityLifting R22.6/hypothesis-h)" by "where it is imported from GL2ModularityLifting R22.6/hypothesis-h".
- Delete the hypothesis "the weight-2 and potentially crystalline conditions at p are both needed; the Breuil–Kisin remark only reformulates them"; `R22.6/hypothesis-h` states it.
- The node keeps Theorem 9.1 and its cases (D₀), (D₁) and (D_r) for r ≥ 2. The dyadic weight claim stays in `R27.5/dyadic-weight-two-claim`.

**Graph.** No new edge. R22.6 → R27.5 is an RS-06 link.

**When:** now.

## /21 (medium, duplicate): R32.6 owns the modern-route transfer at a ramified coefficient prime; R24.6 drops its sentence

### What the verifier corrected
- **Confirmed.** Both stage texts are verbatim, and both stages feed ClassicalSerreModularity R33.1. AUDIT-32 records R24.6 among R32.6's duplicates: "Owns 'changing residual characteristic' — the same coefficient-prime transfer in the compatible-systems roadmap".
- **No supplier.** With all accepted restructurings and links, R24.6's ancestors reach GL2ModularityLifting R22.1–R22.6 but no R32 stage. So R24.6 has no de Rham lifting supplier.
- **The alternative.** R32.6 → R24.6 is acyclic.

### What main says now
- **R24.6** (`content/campaign/PotentialModularityAndCompatibleSystems/README.md`, line 164): "Prove the reduction and specialisation lemmas used to change prime, including determinant, conductor, inertial type, irreducibility and oddness. Enumerate the hypotheses that make local compatibility valid when the new coefficient prime was already ramified. In the modern route, preserve the almost-strict limitation in the residually reducible case and use a de Rham lifting theorem rather than silently restoring the missing Weil–Deligne assertion."
- **R32.6** (`content/campaign/GL2ModularityLifting/README.md`, line 162): "Deduce exact modularity-transfer lemmas for the changes of coefficient prime in R33, with a separate entry for reducible reduction at a ramified coefficient prime. Explain why de Rham lifting suffices when an almost strictly compatible system does not supply the full local Weil–Deligne comparison there. …"
- **R24.6's consumers** are R26.1–R26.3, R27.1–R27.6, R33.1–R33.5, R25.5 and R25.6.
- **The README rule** of ClassicalSerreModularity (line 266): "the classical R27 module cannot import the modern p-adic local Langlands or R32 module".
- **Pending packets.**
  - The GL2ModularityLifting R32.3 part plans `R32.6/transfer-residually-reducible` (Dieulefait–Pacetti Theorem 1.6, from Pan and Skinner–Wiles) and `R32.6/de-rham-lifting-and-almost-strict-systems`.
  - The PotentialModularity R24.3 part's `R24.6/local-compatibility-at-the-coefficient-prime` ends: "In case (c) no Weil–Deligne comparison may be assumed; a residually reducible modularity lifting theorem needing only the de Rham property (Pan) is what the modern route uses there (Dieulefait–Pacetti Paso 5)."
  - Its `R24.6/linked-systems-modularity-transfer` (ii) names "the modern theorems of GL2ModularityLifting R32.6".

### Fix
**1. R24.6 prose** (line 164). Delete "In the modern route, preserve the almost-strict limitation in the residually reducible case and use a de Rham lifting theorem rather than silently restoring the missing Weil–Deligne assertion." Add in its place: "(The modern route's transfer for a residually reducible member at a ramified coefficient prime is GL2ModularityLifting R32.6's; it is not imported here.)" The reduction, specialisation and local-compatibility lemmas stay.

**2. Packet** (PotentialModularity R24.3 part, blueprint).
- In `R24.6/local-compatibility-at-the-coefficient-prime`, end the statement at "In case (c) no Weil–Deligne comparison may be assumed."
- In `R24.6/linked-systems-modularity-transfer` (ii), delete "; or the modern theorems of GL2ModularityLifting R32.6". The R33 nodes cite R32.6 directly.

**3. The alternative edge R32.6 → R24.6 is rejected.** It is acyclic, but with it R32.6 would reach every consumer of R24.6, including R26.1–R26.3 and R27.1–R27.6. The classical route would then import the R32 module, against the README rule quoted above.

**Overlap with /7 and /30.** /7 rewrites R24.6's first sentence and /30 its second; this fix edits only its last. The three edits apply independently.

**Graph.** No new edge. R33.1 already consumes R24.6 and R32.6.

**When:** now (R24.6 prose); blueprint (PotentialModularityAndCompatibleSystems R24.3 part).

## /22 (medium, error): already fixed by part 1's /22

### What the verifier corrected
- **No correction.** No stage edge L7 → P9 exists in any graph.
  - In the raw atlas L7's consumers are G7 and L8, L8's is G8, and G7 and G8 have none.
  - With the accepted restructurings L7 also reaches R08.4 and R08.5, L8 reaches R21.3 and R21.4, and G8 reaches G7.
  - Neither graph has a PotentialAutomorphyInfrastructure consumer.
- The L7, P9 and PA.3 texts are verbatim. PA.3's requires are exactly P9 and PA.0, and its only descendant is PA.4. The README carries the quoted source-to-owner row, and `data/atlas.json` declares both roadmap edges with stageCount 0.
- The three proposed edges are acyclic.

### What main says now
- **The defect is still on main.** L7 still says: "Export the precise local comparisons and component support input used in ACC+ §6.2 to GlobalGaloisDeformations G7 and DeformationAndDerivedPatchingAlgebra P9." PA.3 still requires only P9, P9/support-transport-avoiding-ihara and PA.0.
- **Part 1 fixes it.** The merged `RT-AREA-langlands-1.fixes.md`, /22, fixes the same defect, from a finding about PA.3's side. It:
  - replaces L7's sentence with one that exports to G7 and to PA.3, and says that P9 "takes local component data as hypotheses and does not import this layer";
  - inserts into L8: "Export Proposition 6.2.12 and the determinant-ordinary ring to GlobalGaloisDeformations G8 and PotentialAutomorphyInfrastructure PA.3.";
  - adds L7 → PA.3, L8 → PA.3, R08.2 → PA.3, G7 → PA.3 and G8 → PA.3, and no L7 → P9.
- Its edits have not yet been applied at `ba5cc428`.

### Fix
- **Apply part 1's /22 as written.** It contains this finding's fix: the L7 sentence, and the three edges L7 → PA.3, L8 → PA.3 and G8 → PA.3 among its five. P9 keeps its abstract hypotheses.
- **Nothing more.** This report proposes no further edit, so that the same sentences are not edited twice.
- **Effect.** Once part 1's /22 is applied, the declared roadmap edges LocalGaloisDeformationRings → PotentialAutomorphyInfrastructure and GlobalGaloisDeformations → PotentialAutomorphyInfrastructure have stage edges.
- **Cycle test.** Part 1's five edges were retested at `ba5cc428`, jointly with this report's edges: acyclic.

**When:** now, as part 1's /22.

## /23 (medium, duplicate): R23.2 applies R23.1 to H6's moduli instead of rebuilding them

### What the verifier corrected
- **No correction.** The verifier found R23.2's and H6's texts verbatim, including H6's last sentence, "This owns source R10.4 and the corresponding moduli portion of R23.2".
- R23.2 still says "using R10's actual moduli scheme", and no stage id in `data/atlas.json` contains R10.
- No accepted proposal touches R23.2 or H6. RS-23, the only proposal that keeps H6, is not in `data/restructure` and has no review.

### What main says now
- **R23.2** (line 38): "Construct the simultaneous torsion/polarisation problem using R10's actual moduli scheme. Prove its geometric irreducibility, suitable real points and every prescribed finite local point, with pairing and determinant compatibilities. If a moduli twist has several components, identify the one to which the theorem applies. Nonemptiness of the untwisted moduli space is not enough."
  - It requires H6 and R23.1. Its only consumer is R23.3.
- **H6** (`content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md`, line 202) constructs the twist, requires "the determinant/Weil-pairing compatibility and the real signature", proves geometric irreducibility of the selected component, and proves "nonempty real and finite local open loci by explicit abelian varieties and deformation calculations". It exports "the smooth quasi-projective scheme, universal family, field of definition, dimension and prescribed local opens" to R23.1–R23.2. Its only consumer is R23.2.
- **The ownership paragraph** (line 15) still names "R10/R18".
- **The node plan duplicates H6 too.** The R23.1 packet plans six R23.2 nodes. Parts of four of them prove local points or build the twist:
  - `R23.2/taylor-lemma-1-2-local-hbav-at-places-above-l` (a local M-HBAV above ℓ realising ρ̄|G_v);
  - `R23.2/taylor-lemmas-1-3-1-4-local-points-at-p-and-at-infinity` (local points above p and at the infinite places);
  - the first sentence of `R23.2/local-points-at-l-p-infinity-and-the-point-over-E` ("X(F_x) is nonempty for every place x of F above l, above p, or at infinity");
  - in `R23.2/taylor-2006-lemmas-4-4-4-5-descent-and-the-cm-point`, the twists X_{R,ψ} and the CM point of X_Dih.
  - The packet requests the moduli spaces from H6 with the words "RS-23 leaves R23.2 only the verification for Taylor's data". RS-23 was not accepted at the baseline.
- **Since the baseline.** RS-23 has been accepted (REV-RS-23, #4650). Its keep for H6, "Keep the simultaneous torsion-level twist, pairing and real-sign constraints, chosen-component descent/irreducibility and explicit local points", is the division of labour this fix writes into R23.2.

### Fix
1. **R23.2** (line 38). Replace the whole paragraph with the following. The Weil restriction is /28's fix.
   > Apply R23.1 to the simultaneous torsion/polarisation problem that HilbertModularVarietiesAndShimuraCurves H6 constructs. Choose the auxiliary primes, the prescribed residual modules and, at every requested place including the infinite places, a local open set Ω_v inside H6's nonempty local loci. State which places lie in S₁, S₂ and S₃ of R23.1. Over a totally real base F, apply R23.1 either to H6's scheme X or, for a finite extension F₁/F of totally real fields, to the Weil restriction Res_{F₁/F} X_{F₁} of AbelianSchemesAndArithmeticModuli A6. Prove that this restriction is smooth and geometrically connected with (Res_{F₁/F} X_{F₁})(F_v) = ∏_{w | v} X(F_{1,w}), and build its local open sets from those of X at the places above v (Snowden, arXiv:0905.4266v1, proof of Proposition 8.2.2, p. 26). Geometric irreducibility, the choice of component, the pairing and determinant compatibilities and the nonemptiness of real and local points are H6's; do not re-prove them here. Nonemptiness of the untwisted moduli space is not enough.
2. **R23.2's dependency line** (line 40). Append "; [AbelianSchemesAndArithmeticModuli A6](../AbelianSchemesAndArithmeticModuli/README.md#a6)". The edge is in /28.
3. **Ownership paragraph.** Edit 2 of /3 replaces "R10/R18" by H6.
4. **R23.1 packet, next checkpoint.** Re-parent to H6, as requests from R23.2, the node content that proves local points or builds the twist: Taylor 2002 Lemmas 1.2–1.4, the nonemptiness sentence of the node over E, and the twists and the CM point of Taylor 2006 Lemma 4.5. R23.2 keeps the choice of Taylor's data (`R23.2/taylor-auxiliary-data-p-L-psi-N-M` and Lemma 1.1), the choice of the Ω_v, the application of R23.1 and the descent of Taylor 2006 Lemma 4.4. H6 has no packet yet; until it does, keep these statements as H6 requests with the verified excerpts attached.

**When:** now (edits 1–3); blueprint (edit 4).

## /24 (medium, duplicate): R23.5 controls the field and imports base change from R17.4/R17.6

### What the verifier corrected
- **No correction.** The R23.5, R17.4 and R17.6 texts are verbatim. R17.4 and R17.6 own cyclic and solvable base change and descent, with the consequences that potential modularity uses, and R23.5 re-plans them.
- RS-21, which records R17.4 as the owner of "GL2 cyclic and solvable automorphic base change/descent", was not accepted at the baseline. It has since been accepted (REV-RS-21, #4657), with that owner record. It narrows R17.6 but keeps its "exact base-change/descent exports for the compatible-system construction and potential modularity, including the conditions preserving residual irreducibility", so the import below still goes through R17.6.
- R17.4, R17.5 and R17.6 are already ancestors of R23.5, so the explicit edge R17.6 → R23.5 creates no cycle.

### What main says now
- **R23.5** (line 68): "Strengthen the construction to the precise local splitting and disjointness conditions used in compatible systems and finite deformation rings. Prove compatibility with solvable intermediate fields and the automorphic base-change/descent statements actually invoked later. Record determinant and weight throughout. A modularity statement over a large field is not by itself a compatible system over Q."
  - It requires only R23.4.
- **R17.4:** "Prove cyclic base change and descent for GL₂ … Iterate to solvable extensions … Prove the local prescribed splitting/base-change consequences used by potential modularity and component arguments."
- **R17.6:** "Export exact base-change/descent statements for the compatible-system construction and potential modularity, including the conditions preserving residual irreducibility."
- **Graph.** R17.6 already reaches R23.5, for example through R20.1 → … → R22.6 → R23.4 → R23.5.
- **The node plan.** In the R23.1 packet, `R23.5/control-of-the-extension` states Theorem 6.1(iii)(a)–(d) and ends: "The solvable intermediate fields of F/ℚ inherit modularity by Langlands' base change and descent (GL2AutomorphicRepresentationsAndTransfer R17.4), which is what R24.5's Brauer argument uses." Its prerequisites include R17.4 and GL2ModularityLifting:R22.5/solvable-base-change-reduction.

### Fix
1. **R23.5** (line 68). Replace the whole paragraph with:
   > Strengthen the construction to the precise local splitting and disjointness conditions used in compatible systems and finite deformation rings, including the prescribed local extensions of KW II Theorem 6.1(iii). This layer controls the field only. Take prescribed completions and unramified enlargements at finitely many places from R23.1:soluble-extensions (Theorem 6.1(iii)(a)–(b)), the splitting at p for k(ρ̄) = p + 1 from the twist of KW II p. 57 ((iii)(c)), and linear disjointness from R23.1 ((iii)(d)). Prove that the solvable intermediate fields of the extension keep total reality, the splitting data and the residual image. Import cyclic and solvable automorphic base change and descent, with their local consequences, from GL2AutomorphicRepresentationsAndTransfer R17.4 as exported by R17.6; do not re-prove them here. Record determinant and weight throughout. A modularity statement over a large field is not by itself a compatible system over Q.
2. **R23.5's dependency line** (line 70). Replace it with "**Dependencies:** R23.4 (preceding layer); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [R23.1:soluble-extensions](#stage-R23.1:soluble-extensions)."
3. **Stage edge** GL2AutomorphicRepresentationsAndTransfer:R17.6 → R23.5 (R23.5's `requires`, R17.6's `consumers`, `stageEdges`).
   - The cycle test for GL2AutomorphicRepresentationsAndTransfer:R17.6 → R23.5 finds no path R23.5 → … → R17.6: acyclic, alone and jointly with the other edges of /3 and /23–/30.
   - The edge R23.1:soluble-extensions → R23.5 is in /26.
4. **R23.1 packet, next checkpoint.** In `R23.5/control-of-the-extension`, replace the last statement sentence with "The solvable intermediate fields of F/ℚ inherit modularity by the base-change and descent statements that GL2AutomorphicRepresentationsAndTransfer R17.6 exports from R17.4; R24.5's Brauer argument imports them from there." Replace the prerequisite R17.4 by a request to R17.6. Replace the prerequisite R22.5/solvable-base-change-reduction by the Lemma 4.1.2 node of /26 for (a)–(b).

**When:** now (edits 1–3); blueprint (edit 4).

## /25 (medium, error): R23.1 states Moret-Bailly in the Harris–Shepherd-Barron–Taylor form

### What the verifier corrected
- **No correction.** R23.1's two quoted sentences are verbatim.
- Qian's Proposition 4.2, read in the arXiv source, takes S = S₁ + S₂ + S₃ with the three kinds of open sets, and concludes that every place of S₂ is unramified in F′.
- The three routed items exist as described. PAPER-QIAN-23/079 and PAPER-KISIN-17/moret-bailly-global-points-unramified-at-p are planned at R23.1. PAPER-CALEGARI-GERAGHTY-18/moret-bailly-blght-prop-6-2 is planned at R23.1, with a review note asking for the S₂ clause.
- KW II Theorem 6.1 asks only that F be unramified at p, "and even split above p if ρ̄|D_p is irreducible".
- The proposed restatement is the Harris–Shepherd-Barron–Taylor form that the routed papers use.

### What main says now
- **R23.1** (line 28): "Prove the rational-point existence theorem for the smooth geometrically irreducible varieties used here, with prescribed nonempty local open sets and a finite extension satisfying the required disjointness and real-place conditions. Include the geometric and approximation prerequisites of the theorem rather than citing it as an axiom. State exactly which places split and how linear disjointness is forced."
  - It requires AlgebraicModuliForArithmeticGeometry:R09.3. Its only consumer is R23.2.
- **The R24.5:operations preamble** (line 180). The atlas description of R24.5:operations includes this paragraph: "R23.1 is the general Moret–Bailly/Skolem theorem with specified local open conditions, prescribed splitting and linear disjointness. Construct the field-extension selection, smooth local points, approximation and geometric connectedness arguments for an arbitrary smooth geometrically irreducible variety over a number field; Hilbert torsion moduli is one application, supplied by H6. Prove total reality only when the real local conditions ensure it."
- **The routed uses.**
  - PAPER-QIAN-23/079 is the three-kind theorem (Qian, Proposition 4.2).
  - PAPER-KISIN-17/moret-bailly-global-points-unramified-at-p needs a point over a finite Galois F/Q "in which p is unramified": an S₂ condition.
  - PAPER-CALEGARI-GERAGHTY-18/moret-bailly-blght-prop-6-2 is planned at R23.1 and at R24.5:operations. Its review note says "R23.1 should add the S₂ (unramified) clause".
- **The node plan.** The R23.1 packet states Moret-Bailly II's Théorème 1.3 for Skolem data with finite Galois L_v and Galois-stable Ω_v, Taylor's Theorem G, and disjointness by extra split places. Its disjointness node records: "KW Annals attribute the disjointness refinement to [23] = Harris-Shepherd-Barron-Taylor, Prop. 2.1 (not in the library)."
- **The source, read for this report.** Harris, Shepherd-Barron and Taylor, "A family of Calabi–Yau varieties and potential automorphy", Ann. of Math. 171 (2010) 779–813, Proposition 2.1 (p. 794), in the Annals copy https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf (read 29 September 2026, SHA-256 prefix 5e3fc57991196107).
  - The statement has all three kinds already: S₁ with Ω_v ⊂ T(F_v); S₂ (no infinite place) with Gal(F_v^nr/F_v)-invariant Ω_v ⊂ T(F_v^nr); S₃ with Gal(F̄_v/F_v)-invariant Ω_v ⊂ T(F̄_v); and a finite extension L/F to avoid.
  - The proof (pp. 794–795) has three steps. It adds, for each Galois subextension of L with simple group, one large prime that does not split in it, using "Hensel's lemma with the Weil bounds" for local points. It then replaces F by a finite Galois extension in which S₁ splits, S₂ is unramified with large inertial degree and S₃ has large completions, so that S₂ ∪ S₃ = ∅. Finally it applies "Theorem 1.3 of [MB89]" and takes the normal closure.
  - Qian, arXiv:2104.09761v1, Proposition 4.2 (p. 23; SHA-256 prefix 4110023d4691d628), restates it "from [HSBT10]" with H/F finite Galois.

### Fix
1. **R23.1** (line 28). Replace the whole paragraph with:
   > Prove the rational-point existence theorem for an arbitrary smooth geometrically connected variety T over a number field K, with prescribed nonempty local open sets and a finite extension satisfying the required disjointness and real-place conditions. State it as Harris–Shepherd-Barron–Taylor, Proposition 2.1 (BLGHT II, Proposition 6.2; Qian, Proposition 4.2). Let S = S₁ ⊔ S₂ ⊔ S₃ be a finite set of places of K with no infinite place in S₂, and let H/K be a finite extension. Give nonempty open sets Ω_v ⊂ T(K_v) for v ∈ S₁, Gal(K_v^nr/K_v)-invariant Ω_v ⊂ T(K_v^nr) for v ∈ S₂, and Gal(K̄_v/K_v)-invariant Ω_v ⊂ T(K̄_v) for v ∈ S₃. Then there are a finite Galois extension K′/K, linearly disjoint from H, and P ∈ T(K′) such that every place of S₁ splits completely in K′, every place of S₂ is unramified in K′, and P lies in Ω_v at every place of K′ above every v ∈ S. If K is totally real and every infinite place lies in S₁, then K′ is totally real. Derive the theorem from Moret-Bailly's Théorème 1.3 (Moret-Bailly, part II), reducing S₂ and S₃ to split places with R23.1:soluble-extensions. Include the geometric and approximation prerequisites of the theorem rather than citing it as an axiom. State exactly which places split and how linear disjointness is forced.
2. **The R24.5:operations preamble** (line 180). Replace its first two sentences, from "R23.1 is the general" to "supplied by H6.", with the text below. The last sentence and the whole R24.5:operations paragraph after the anchor, including part 1's R24.5:operations → AG2.6 edit, are unchanged.
   > R23.1, with its component R23.1:soluble-extensions, is the general Moret–Bailly/Skolem theorem in the Harris–Shepherd-Barron–Taylor form, with split, unramified and Galois-invariant local open conditions and linear disjointness. R23.1 constructs the field-extension selection, smooth local points, approximation and geometric connectedness arguments for an arbitrary smooth geometrically irreducible variety over a number field; they are not obligations of R24.5:operations. Hilbert torsion moduli is one application, supplied by H6.
3. **R23.1 packet, next checkpoint.** Add the node `R23.1/moret-bailly-hsbt-form`, titled "Moret-Bailly in the Harris–Shepherd-Barron–Taylor form".
   - **Statement:** Proposition 2.1 as in edit 1.
   - **Proof steps**, following the Annals proof:
     - reduce to H Galois;
     - add to S₁, for each Galois subextension of H with simple group, a place with T(K_v) ≠ ∅ that does not split completely in it, using the /27 node;
     - pass to a finite Galois K₁/K from R23.1:soluble-extensions in which S₁ splits completely, S₂ is unramified with large inertial degree and S₃ has large completions, so that S₂ ∪ S₃ = ∅;
     - apply `R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`;
     - replace K′ by its normal closure over K.
   - **Sources:** the Annals copy above (Proposition 2.1, pp. 794–795) and Qian's Proposition 4.2.
   - **Gap:** local points at almost all places ("Hensel's lemma with the Weil bounds").
   - The existing disjointness node then cites this node instead of calling HSBT "not in the library".
4. **Paper records** (all three reviews are `accept`). The Calegari–Geraghty item's review note is met. Its planned list may drop R24.5:operations, because edit 2 assigns the construction to R23.1. The Qian and Kisin items stay planned at R23.1. No route changes kind or roadmap, so the existing verdicts still describe them.

**When:** now (edits 1–2); blueprint (edit 3); maintainer (edit 4).

## /26 (medium, missing): a component R23.1:soluble-extensions proves Clozel–Harris–Taylor Lemmas 4.1.1–4.1.2

### What the verifier corrected
- **No correction.** KW II p. 57 reads "one can impose that closures of F contain locally given extensions F_{ℓ_i}, ℓ_i ≠ 2, p, by successive applications of Grunwald-Wang theorem". p. 91, in the proof of Theorem 10.1, chooses F "as in part (c) of Theorem 6.1, such that a completion of F at ℓ_i contains F_{ℓ_i}".
- Qian applies Lemma 4.1.2 of [CHT] twice: to F_0/Q with prescribed E_q/Q_q and R/R at ∞, and to F_0F_2(μ_{2^r})/Q.
- `content/tau-ceti/ClassFieldTheory/README.md` lists as outside that roadmap "the Grunwald–Wang theorem and the realization of prescribed local abelian extensions by global ones" (lines 217–219).
- The items PAPER-QIAN-23/116 and PAPER-BOXER-CALEGARI-GEE-PILLONI-21/188 are both "missing".
- Only one atlas stage mentions Grunwald–Wang: the ClassFieldTheory Layer 12 exclusion. The pinned index and both source trees have no "grunwald" match.
- The prerequisite ClassFieldTheory Layer 12 → R23.1 is acyclic.

### What main says now
- **No stage states the lemma.** The R24.5:operations preamble gives R23.1 "the field-extension selection". R17.4's "local prescribed splitting/base-change consequences" are consequences of base change, not the choice of the field; the BCGP item /188 notes this.
- **Where the lemma is used**, all read for this report:
  - KW II Theorem 6.1(iii)(a)–(b) (p. 57) and, through it, Theorem 10.1 (p. 91);
  - KW II Lemma 7.10 for p = 2 (p. 69): a character of 2-power order with prescribed local restrictions, by "the Grunwald-Wang theorem, see Theorem 5 of Chapter 10 of [1]" (Artin–Tate);
  - KW II Theorem 8.2's proof (p. 72): "Using Lemma 2.2 of [60], there is an allowable base change F′/F of even degree, that is split at Σ ∪ {v|p} ∪ {w}";
  - Harris–Shepherd-Barron–Taylor's own proof of Proposition 2.1 (p. 795), which reduces S₂ ∪ S₃ to the empty set this way;
  - Qian's proof of Lemma 2.1 (arXiv:2104.09761v1, pp. 6 and 8);
  - BCGP Theorems 8.4.1 and 8.5.2 and Lemma 9.2.7 (item /188).
- **Open requests.** The GL2ModularityLifting packet requests "Taylor's local-prescription lemma (Gee Fact 4.27)" from R17.4 for `R22.5/solvable-base-change-reduction` (open).
- **The lemmas, read for this report.** Clozel, Harris and Taylor, "Automorphy for some l-adic lifts of automorphic mod l Galois representations", Publ. Math. IHÉS 108 (2008) 1–181. Lemma 4.1.1 and the statement of Lemma 4.1.2 are on p. 116; the proof of Lemma 4.1.2 is on p. 117. The copy read is the Numdam copy https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf (read 29 September 2026, SHA-256 prefix 9d3b7079440d8cd3).
- **Graph.** R23.1 has no ClassFieldTheory ancestor. Layers 8 and 12 are ancestors of no R23 or R24 stage. Layer 11 reaches R23.2 and its successors only through the moduli chain (Layer 11 → ShimuraVarieties:V4 → … → H4 → H6 → R23.2).

### Fix
1. **New sub-stage** `PotentialModularityAndCompatibleSystems:R23.1:soluble-extensions`. It is a component that its parent requires, as `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison` is.
   - **Atlas record:**
     - key `R23.1:soluble-extensions`; title "Soluble extensions with prescribed completions"; `parentStageId` `PotentialModularityAndCompatibleSystems:R23.1`;
     - `requires`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence` and `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`;
     - `consumers`: `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R23.5` and `GL2ModularityLifting:R22.1`.
   - **README text.** Insert after R23.1's dependency line (line 30), before `<a id="r23-2"></a>`:

   > <a id="stage-R23.1:soluble-extensions"></a>
   >
   > ### R23.1:soluble-extensions. Soluble extensions with prescribed completions — component of R23.1
   >
   > Prove Clozel–Harris–Taylor, Lemmas 4.1.1 and 4.1.2. Lemma 4.1.1: for a number field F, a finite set S of places and a continuous character χ_S of ∏_{v∈S} F_v^× of finite order, there is a continuous character χ : F^×\A_F^× → Q̄^× with χ|∏_{v∈S} F_v^× = χ_S; the proof builds χ on a finite quotient, so χ has finite order. Lemma 4.1.2: for a number field F, a finite Galois extension D/F, a finite set S of places, infinite places allowed, and finite Galois extensions E_v/F_v for v ∈ S, there is a finite soluble Galois extension E/F, linearly disjoint from D, such that E_w/F_v ≅ E_v/F_v for every v ∈ S and every place w of E above v. In particular, if F is totally real and S contains every infinite place with E_v = R there, then E is totally real.
   >
   > Follow the source's proofs. For Lemma 4.1.1, choose an open subgroup U of the S-idèles such that χ_S is trivial on U ∩ F^×. This uses the fact, which the source cites without proof, that every subgroup of finite index of O_F^× is a congruence subgroup (Chevalley's theorem); no atlas stage names it, so prove it here unless the class-field-theory owner states it. For Lemma 4.1.2, reduce by induction on the local degrees to cyclic E_v/F_v. Realise these by a character χ_S through local class field theory (Tau Ceti ClassFieldTheory Layer 8), extend it by Lemma 4.1.1, and take the class field of its kernel; the completions are right because the global Artin map is compatible with the local ones (Layers 11 and 12). Force disjointness by adding, for each Galois subextension of D/F with simple group, a place outside S that does not split completely in it, with trivial prescribed extension (Tau Ceti Chebotarev Layer 10).
   >
   > KW II's two appeals to "the Grunwald–Wang theorem" need only these lemmas. The prescribed local extensions F_{ℓ_i} of Theorem 6.1(iii)(b) (p. 57) are Lemma 4.1.2. The character of 2-power order in Lemma 7.10 (p. 69) is Lemma 4.1.1 followed by passage to the 2-primary component, which keeps local restrictions of 2-power order. Do not claim the Grunwald–Wang theorem itself.
   >
   > Source: Clozel, Harris and Taylor, Publ. Math. IHÉS 108 (2008) 1–181, Lemmas 4.1.1–4.1.2, pp. 116–117, read on 29 September 2026 in the Numdam copy https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf (SHA-256 prefix 9d3b7079440d8cd3).
   >
   > **Dependencies:** Tau Ceti ClassFieldTheory Layers 8, 11 and 12; Tau Ceti Chebotarev Layer 10.

2. **R23.1's dependency line** (line 30). Replace it with "**Dependencies:** [AlgebraicModuliForArithmeticGeometry R09.3](../AlgebraicModuliForArithmeticGeometry/README.md#r09-3); [R23.1:soluble-extensions](#stage-R23.1:soluble-extensions); Tau Ceti Chebotarev Layer 10 (`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`)." The Chebotarev part is /27's edge.
3. **Stage edges.** Add the sub-stage's `requires` and `consumers` above, R23.1's new `requires` entry, and these `stageEdges`:
   - The cycle test for ClassFieldTheory Layer 8 → R23.1:soluble-extensions finds no path back: acyclic.
   - The cycle test for ClassFieldTheory Layer 11 → R23.1:soluble-extensions finds no path back: acyclic.
   - The cycle test for ClassFieldTheory Layer 12 → R23.1:soluble-extensions finds no path back: acyclic.
   - The cycle test for Chebotarev Layer 10 → R23.1:soluble-extensions finds no path back: acyclic.
   - The cycle test for R23.1:soluble-extensions → R23.1 finds no path back: acyclic.
   - The cycle test for R23.1:soluble-extensions → R23.5 finds no path back: acyclic.
   - The cycle test for R23.1:soluble-extensions → GL2ModularityLifting:R22.1 finds no path back: acyclic. R22.1's Lemma 8.1 and Theorem 8.2 nodes (/13 and /3) choose their fields with Lemma 4.1.2.
   - New-stage test: none of the consumers R23.1, R23.5 and R22.1 reaches any of the four prerequisites. All seven edges are acyclic jointly with the other edges of this report and those of `RT-AREA-langlands-1.fixes.md`.
   - The finding's edge "Layer 12 → R23.1" is realised through the component, which R23.1 requires.
   - Layers 8 and 11 are this report's additions. The proof uses local class field theory and the local–global compatibility of the Artin map, and the atlas graph has no edge between ClassFieldTheory layers.
   - If the maintainer prefers link-map records for Tau Ceti suppliers, as for CH-L07–CH-L15, these edges can be entered in `data/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json` and `data/links/tauceti_TauCetiRoadmap_Chebotarev.json` instead.
4. **Handoff** (line 189). Replace "**Stages:** R23.1, R23.2," with "**Stages:** R23.1, R23.1:soluble-extensions, R23.2,".
5. **Blueprint, next checkpoints.**
   - R23.1 packet: add the nodes `R23.1:soluble-extensions/cht-lemma-4-1-1-extending-local-characters` and `R23.1:soluble-extensions/cht-lemma-4-1-2-soluble-extensions-with-prescribed-completions`, with the statements and locators above. `R23.5/control-of-the-extension` cites the second for (iii)(a)–(b), as /24 says.
   - GL2ModularityLifting packet: its request to R17.4 for Taylor's local-prescription lemma can point to the Lemma 4.1.2 node, and so can /13's Lemma 8.1 and Theorem 8.2 nodes. Lemma 7.10's character of 2-power order cites Lemma 4.1.1. The sub-stage reaches R22.5 through R22.1, so no further edge is needed.
6. **Paper records** (both reviews are `accept`). In `research/blueprint/papers/PAPER-QIAN-23.result.json`, item PAPER-QIAN-23/116, and in `PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`, item /188: set `status` from "missing" to "planned" and add `planned` ["PotentialModularityAndCompatibleSystems:R23.1:soluble-extensions"]. Add the sub-stage to the `stages` of Qian route 7 and BCGP route 15. Kind and roadmap are unchanged, so both accepted verdicts still describe the routes.

**When:** now (edits 1–4 and 6); blueprint (edit 5).

## /27 (medium, error): R23.1 requires Chebotarev Layer 10 for linear disjointness

### What the verifier corrected
- **The scope of the claim.** The finding says that R23.1, R23.5, R24.1 and R24.5 have no Chebotarev ancestor. That holds only without the accepted link map CH-L12 (Chebotarev Layer 10 → GlobalGaloisDeformations:R04.5).
- With CH-L12, R23.5, R24.1 and R24.5 reach Layer 10 through R04.5 → R04.6 → R24.1 and R04.5 → R21.4 → R22.6 → R23.4 → R23.5.
- R23.1, the layer that applies Moret-Bailly, has no Chebotarev ancestor in any graph. So the fix, Chebotarev Layer 10 → R23.1, is exactly the missing edge, and it is acyclic.
- Confirmed as stated: R23.1's sentence is verbatim, and KW II p. 57 reads "When we apply Moret-Bailly theorem, we furthermore impose that F is split at a chosen finite set of primes that are unramified in L, and whose Frobenii generate the Galois group of the Galois closure of L/Q".
- Tau Ceti f790474 has `NumberField.Chebotarev.frobeniusPrimeSet` (TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93) and no density theorem in the pinned index.

### What main says now
- **R23.1** ends: "State exactly which places split and how linear disjointness is forced."
- **Graph at this commit.** Layer 10 is an ancestor of R23.3 (through ET.3 → R17.2 → … → R17.5), R23.5, R24.1, R24.5 and R24.5:operations. It is not an ancestor of R23.1 or R23.2.
- **The node plan.** The R23.1 packet's `R23.1/forcing-linear-disjointness-by-extra-split-places` has the hypothesis "Chebotarev supplies such primes; not stated in the source" and no Chebotarev prerequisite. Its first proof step notes that local points at the added primes "must be checked".
- **The same mechanism in other sources.** Snowden's proof of Proposition 5.2.2 (arXiv:0905.4266v1, p. 16) chooses places Σ′ with X(F_v) ≠ ∅ whose Frobenius elements generate Gal(M′/F), M′ the Galois closure of M. Harris–Shepherd-Barron–Taylor instead add primes that do not split in the simple Galois subextensions (p. 795).
- **Library.** The pinned index has `frobeniusPrimeSet` and `mem_frobeniusPrimeSet_iff` (FrobeniusPrimeSet.lean:93, :100). Mathlib has `NumberField.Set.HasDirichletDensity` (Mathlib/NumberTheory/NumberField/DirichletDensity.lean:82). Neither library has a Chebotarev density theorem.

### Fix
1. **Stage edge** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` → R23.1. Add it to R23.1's `requires` (the dependency line is edit 2 of /26) and to `stageEdges`.
   - The cycle test for Chebotarev Layer 10 → R23.1 finds no path R23.1 → … → Layer 10: acyclic, alone and jointly with the other edges of /3 and /23–/30.
   - The Layer 10 edges into campaign stages are link records today (CH-L07–CH-L15). The maintainer may enter this one as CH-L16 in `data/links/tauceti_TauCetiRoadmap_Chebotarev.json`, with the Layer 10 quote "infinitude of every Frobenius class" and the R23.1 quote "State exactly which places split and how linear disjointness is forced.". Edit 1 of /25 keeps that R23.1 sentence verbatim.
2. **R23.1 packet, next checkpoint.** Add the node `R23.1/frobenius-classes-generate-and-force-disjointness`.
   - **Statement.** Let K be a number field, H/K a finite extension with Galois closure H̃, and T a finite set of places. (a) There is a finite set Q of primes of K, disjoint from T and unramified in H̃, whose Frobenius classes meet every conjugacy class of Gal(H̃/K), so they generate it. (b) If a finite extension K′/K splits completely at every q ∈ Q, then K′ ∩ H̃ = K, so K′ and H are linearly disjoint over K.
   - **Proof.** (a) comes from the infinitude of every Frobenius class (Layer 10). For (b), let M be the Galois closure of K′ ∩ H̃ over K. M lies in H̃ and splits completely at each q, so every Frobenius element at q lies in the normal subgroup Gal(H̃/M). These elements generate Gal(H̃/K), so M = K. Linear disjointness from the Galois extension H̃ follows from K′ ∩ H̃ = K.
   - **Sources.** KW II p. 57 (the mechanism); Snowden, proof of Proposition 5.2.2, p. 16.
   - **Hypothesis carried forward.** T(K_q) ≠ ∅ at the added primes: all but finitely many primes qualify, by "Hensel's lemma with the Weil bounds" (Harris–Shepherd-Barron–Taylor, p. 795) or, in Snowden's words, "the Weil conjectures give mod v points and then smoothness gives F_v points" (p. 16).
   - Make this node a prerequisite of the existing disjointness node, and delete that node's parenthetical "(Chebotarev supplies such primes; not stated in the source)".

**When:** now (edit 1); blueprint (edit 2).

## /28 (medium, missing): R23.3 over a totally real base, with Weil restriction

### What the verifier corrected
- **No correction.** BCGP Proposition 9.1.11 is verbatim in the arXiv v3 source, including the hypotheses that p, q > 2 split completely in F_1 and that det r̄ = ε̄^{−1}.
- Its proof reads "In the case F_1 = F, this is a straightforward consequence of [Sno09, Thm. 8.2.1]. ... To prove the general case, one simply replaces the scheme X to which Snowden applies the theorem of Moret-Bailly with the restriction of scalars Res_{F_1/F} X_{F_1}."
- The item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/123 is "missing", and BCGP's route to this roadmap names R23.1, R23.2, R23.3 and R23.5.
- KW II Theorem 6.1 begins "Let ρ̄ a G_Q representation of S-type", so R23.3's base field is Q.

### What main says now
- **R23.3** plans only KW II Theorem 6.1 over Q (quoted in /3).
- **Snowden, read for this report** (arXiv:0905.4266v1, the only arXiv version, https://arxiv.org/pdf/0905.4266v1, read 29 September 2026, SHA-256 prefix b0c0008a55489b00; "The letter p always denotes an odd prime", p. 3):
  - Theorem 5.1.1 (p. 15) is the residual theorem over a totally real F, quoted in edit 3 of /3.
  - Proposition 8.2.1 (p. 26) adds that F′/F "splits at all places in S", given compatible types at the places of S above p. BCGP cite it as "Thm. 8.2.1".
  - Proposition 8.2.2 (p. 26) is Moret-Bailly with the Weil restriction. "Let X′ be the restriction of scalars from F1 to F of XF1. This is smooth and geometrically connected since its base change to F̄ is isomorphic to a product of copies of XF̄. We have X′(Fv) = ∏_{w|v} X(F1,w) for any place v of F."
  - Proposition 5.3.1 (p. 16) builds the twisted moduli scheme X over a totally real F and sketches that it is smooth and geometrically connected.
- **H6** (line 202 of its README) names no base field for its twist.
- **A6** plans the field-level Weil restriction: "The finite-separable field construction and jet-space distinction are in [Poonen, §4.6, pp. 110–112]". A6 is an ancestor of neither R23.2 nor H6.
- **This roadmap's handoff** (line 191) already says: "Any restriction of scalars used to construct an abelian variety is along a finite separable field extension via A6".
- **Route.** BCGP route 15 (accepted) sends /123, /174 and /188 to R23.1, R23.2, R23.3, R23.5 and R24.5:operations.

### Fix
1. **R23.3.** Edit 3 of /3 states the theorem over a totally real base, with the relative form over F₁/F.
2. **R23.2.** Edit 1 of /23 applies R23.1 to X or to Res_{F₁/F} X_{F₁}.
3. **H6** (`content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md`, line 202). Replace "For two distinct auxiliary residue characteristics and prescribed Galois modules, construct the simultaneous torsion-level twist of H1 by the actual Isom torsor." with:
   > Over an arbitrary totally real base field F, not only over Q, and for two distinct auxiliary residue characteristics and prescribed Galois modules of G_F, construct the simultaneous torsion-level twist of H1 by the actual Isom torsor (Snowden, arXiv:0905.4266v1, proof of Proposition 5.3.1, builds this scheme over a totally real F).
   The rest of the paragraph is unchanged.
4. **Stage edge** AbelianSchemesAndArithmeticModuli:A6 → R23.2 (R23.2's `requires`, A6's `consumers`, `stageEdges`).
   - The cycle test for AbelianSchemesAndArithmeticModuli:A6 → R23.2 finds no path R23.2 → … → A6: acyclic, alone and jointly with the other edges of /3 and /23–/30.
5. **R23.1 packet, next checkpoint.**
   - Add `R23.3/snowden-potential-modularity-over-totally-real-F`, with the statement of edit 3 of /3 and the sources above. The KW II Theorem 6.1 node becomes its case F = Q, completed by KW's additions for p = 2 and for weight k(ρ̄).
   - Add `R23.2/weil-restriction-of-the-moduli-scheme`, with Snowden's Proposition 8.2.2 argument quoted above, requesting A6's field-level Weil restriction.
6. **BCGP's paper record** (review `accept`). Item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/123: set `status` from "missing" to "planned" and add `planned` ["PotentialModularityAndCompatibleSystems:R23.2", "PotentialModularityAndCompatibleSystems:R23.3"]. Route 15 keeps its kind and roadmap, so its verdict still describes it.

**When:** now (edits 1–4 and 6); blueprint (edit 5).

## /29 (medium, missing): R24.1 plans the ordinary finiteness theorem that Calegari–Geraghty cite

### What the verifier corrected
- **No correction.** R24.1's text is verbatim. KW II §10.1 (p. 90) restricts the local rings: "For each v ∈ S we consider deformation rings R̄_{v,ψ} and assume them to be of one of the types considered in Theorem 3.1."
- The route in `research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-18.result.json` sends Thorne's Theorem 10.2 to R24.1, "which R24.1 plans". Its item R-finite-over-O is "missing".
- The verifier says "either repair closes the gap".
- This report takes option (a). The paper's review already gives route 23 the verdict "accept" with the reason "R24.1 owns Thorne's finiteness theorem", so (a) makes the roadmap match an accepted verdict without re-routing.

### What main says now
- **R24.1** (line 112): "Prove the global deformation-ring finiteness statement of KW II Theorem 10.1 by restriction to a suitable totally real extension and comparison with the modular deformation problem. Verify the residual potential-modularity input and the finiteness of the restriction map. Apply it to the unframed/global ring with the stated fixed determinant and local conditions; a framed power-series enlargement is not finite over O."
- **The item.** PAPER-CALEGARI-GERAGHTY-18/R-finite-over-O (§4.1, proof of Theorem 4.8, p. 364) needs R_φ finite over O. Its note: "KW II 10.1 allows only the local rings of KW II Theorem 3.1 … It covers neither the unrestricted R_{v,φ} nor the ordinary R†".
- **Thorne, read for this report** ("On the automorphy of l-adic Galois representations with small residual image", arXiv:1107.5989v1, https://arxiv.org/pdf/1107.5989v1, read 29 September 2026, SHA-256 prefix 537af0053745f420; published J. Inst. Math. Jussieu 11 (2012)):
  - **Setting.** Theorem 10.2 (p. 56) works over an imaginary CM field with l odd. (π, χ) is ι-ordinary and unramified outside S, ρ is a lattice in r_{l,ι}(π), and ρ̄ is absolutely irreducible. The deformation problem takes the unrestricted lifting rings at the places of S not above l and R^{λ,ss-ord} above l.
  - **Conclusion.** If ρ̄(G_{F(ζ_l)}) is adequate and ζ_l ∉ F, then R_S^univ is a finite O-module.
  - **Proof** (pp. 56–58):
    - pass to a soluble CM extension over which r̄ is trivial at the places above S;
    - pass to a further extension M over which every lift is unipotent on inertia away from l;
    - the restriction map is finite by "the argument of Lemma 3.2.5 of [GG]";
    - "Corollary 8.7 shows that R^univ_{S^M} is a finite Λ-module".
  - Lemma 2.4(ii) and the appendix: absolutely irreducible subgroups of GL_n(k) are adequate when l ≥ 2(n + 1).
- **Snowden's Theorem 6.1.1** (p. 19) is the totally real GL₂ finiteness theorem for local rings of one definite type each, so it does not cover the ordinary ring that mixes crystalline and semistable points.
- **The node plan.** The R23.1 packet plans only KW II Theorem 10.1 for R24.1.
- **Graph.** OrdinaryAutomorphicFormsAndModularityLifting:R21.4 is already an ancestor of R24.1 (R21.4 → R22.6 → R24.1).

### Fix
1. **R24.1** (line 112). After "a framed power-series enlargement is not finite over O.", add:
   > Also prove the ordinary finiteness theorem that Calegari–Geraghty use for R_φ, their reference [53]: Thorne, J. Inst. Math. Jussieu 11 (2012), Theorem 10.2, stated there for GL_n over CM fields. Prove its two-dimensional form over a totally real field. Let F be totally real, p odd and ρ̄ : G_F → GL₂(k) absolutely irreducible and arising from an ordinary cuspidal Hilbert eigenform. Then the fixed-determinant universal ring with the unrestricted lifting rings at the places of S not above p, and the ordinary lifting ring at the places above p, which contains both crystalline and semistable points, is finite over O. Follow Thorne's proof. Restrict to a soluble totally real extension, chosen with R23.5, over which ρ̄ is trivial at the places above S and every lift is unipotently ramified away from p. The restriction map is finite. Over the extension the ordinary ring is finite over the Hida weight algebra by the ordinary R = T of OrdinaryAutomorphicFormsAndModularityLifting R21.4. Record each residual hypothesis that R21.4 needs; Thorne assumes ρ̄(G_{F(ζ_p)}) adequate, which absolute irreducibility gives for p ≥ 7. KW II Theorem 10.1 admits only the local rings of its Theorem 3.1 and does not give this statement.
2. **R24.1's dependency line** (line 114). Append "; [OrdinaryAutomorphicFormsAndModularityLifting R21.4](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-4)".
3. **Stage edge** OrdinaryAutomorphicFormsAndModularityLifting:R21.4 → R24.1. It is explicit because the new statement imports R21.4 directly, as /24's R17.6 → R23.5 is.
   - The cycle test for OrdinaryAutomorphicFormsAndModularityLifting:R21.4 → R24.1 finds no path R24.1 → … → R21.4: acyclic, alone and jointly with the other edges of /3 and /23–/30.
4. **R23.1 packet, next checkpoint** (its scope includes R24.1). Add the node `R24.1/ordinary-finiteness-in-dimension-two`, with the statement of edit 1. Its sources are Thorne's Theorem 10.2 and its proof (pp. 56–58), with the numbering of arXiv v1 matching Calegari–Geraghty's citation. Its requests are R21.4 (ordinary R = T over the extension, finite over the weight algebra), R23.5 (the soluble extension) and DeformationAndDerivedPatchingAlgebra R03.4 (the finiteness criteria).
5. **Calegari–Geraghty's paper record** (review `accept`). Item PAPER-CALEGARI-GERAGHTY-18/R-finite-over-O: set `status` from "missing" to "planned" and add `planned` ["PotentialModularityAndCompatibleSystems:R24.1"]. Route 23 keeps its kind and roadmap, and its verdict already names R24.1.

**When:** now (edits 1–3 and 5); blueprint (edit 4).

## /30 (medium, error): R24.5 proves strict compatibility, using Skinner 2009 at the coefficient prime

### What the verifier corrected
- **No correction.** KW II p. 93 says that the system would be strictly compatible once the residual-irreducibility hypothesis is removed.
- The verifier read Skinner's paper itself (Doc. Math. 14 (2009) 241–258). Theorem 1 covers π cuspidal over a totally real F with discrete-series infinity type (k, w), k_i ≥ 2 and k_i ≡ w mod 2. It proves that ρ_π|D_v is potentially semistable of Hodge–Tate type (k, w) with WD(ρ_π|D_v) = ιRec_v(π_v|·|^{−1/2}) at every v | p, with no residual hypothesis.
- Skinner's introduction says that Kisin's route needs ρ_π residually irreducible and that the paper proves Theorem 1 by a different argument.
- The R24.5 and R24.6 texts and the parity assumption of the R19.5 node are verbatim, and no atlas stage names Skinner 2009 or Blasius–Rogawski.
- R19.5 is already an ancestor of R24.5, so the fix needs no new edge.

### What main says now
- **R24.5** (line 154) ends: "Prove the common coefficient field, Frobenius polynomials, purity, Hodge weights and exactly the local compatibility available in the source."
- **R24.6** (line 164): "Enumerate the hypotheses that make local compatibility valid when the new coefficient prime was already ramified. In the modern route, preserve the almost-strict limitation in the residually reducible case and use a de Rham lifting theorem rather than silently restoring the missing Weil–Deligne assertion." The second sentence is /21's; that fix moves it to GL2ModularityLifting R32.6.
- **KW II §10.3.2** (pp. 93–94) proves almost strict compatibility case by case:
  - q ≠ ℓ, by Carayol and Taylor;
  - q = ℓ ≠ 2 with r_q unramified, by Breuil and Berger;
  - q = ℓ with ρ̄_ι irreducible, by Kisin after choosing F′ linearly disjoint from the kernel of ρ̄_ι;
  - q = ℓ with ρ̄_ι reducible, and r_q ramified or ℓ = 2, is left open.
- **R19.5 today.**
  - The integrated node `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime` (Saito) assumes "if g = [F:Q] is even there is a finite place v with pi_{f,v} in the discrete series".
  - The partial packet `research/blueprint/packets/AutomorphicGaloisRepresentations.json` adds `R19.5/hilbert-local-behaviour-at-p` (KW II Lemma 7.7, Kisin's corollary), which assumes the residual representation absolutely irreducible.
  - Graph path: R19.5 → R19.6 → R24.1 → … → R24.5.
- **The node plan for R24.5 and R24.6** (partial packet `research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json`):
  - `R24.5/almost-strict-compatibility` has the hypothesis "(c) needs ρ̄_ι irreducible, because Kisin's theorem does; this is the whole difference between almost strict and strict".
  - `R24.6/local-compatibility-at-the-coefficient-prime` says that in case (c) "no Weil–Deligne comparison may be assumed".
- **Skinner, read for this report** (https://ems.press/journals/dm/articles/8965206, full text https://ems.press/content/serial-article-files/26055, read 29 September 2026, SHA-256 prefix 4a2a489aa1401431):
  - **Theorem 1** (p. 242), with the hypotheses on p. 241.
  - **Earlier cases** (p. 243):
    - Saito proved the theorem when d is odd or some finite π_w is square-integrable;
    - Blasius–Rogawski proved potential semistability under the same hypotheses or when d is even and some k_i > 2, and "essentially" the full theorem when π_p is unramified;
    - the CM case follows from Serre.
  - **The remaining case** (all k_i = 2, every π_v principal series, π not CM) is proved from:
    - a base change;
    - the automorphy of Sym² π with the Picard modular surface results [Mo];
    - Wintenberger's lifting results [Win1, Win2];
    - a p-adic family through ρ_π [Bu1];
    - Blasius–Rogawski for the family's regular weights;
    - a result of Kisin [Ki2].
- **The KW system satisfies Skinner's hypotheses at q = ℓ.** There ρ_ι|G_{F(q)} is attached to the form over the decomposition field F(q) attached to ρ|G_{F(q)} (KW II p. 93). That form is cuspidal of parallel weight k ≥ 2, hence of motivic weight in Skinner's sense. The place of F(q) below Q has degree one over q.

### Fix
1. **R24.5** (line 154). Replace "Prove the common coefficient field, Frobenius polynomials, purity, Hodge weights and exactly the local compatibility available in the source." with:
   > Prove the common coefficient field, Frobenius polynomials, purity and Hodge weights. Prove strict compatibility at every prime q, including q = ℓ with ρ̄_ι reducible. At q = ℓ, apply Skinner's theorem (AutomorphicGaloisRepresentations R19.5) to the form over the decomposition field F(q) attached to ρ|G_{F(q)}, in place of KW II's appeal to Kisin, which needs ρ̄_ι irreducible (KW II §10.3.2, pp. 93–94). Keep KW II's almost strictly compatible statement as a separately stated, source-faithful variant, and do not merge the two predicates.
   The first two sentences of R24.5, which a partial link packet quotes, are unchanged.
2. **R24.6** (line 164). Replace "Enumerate the hypotheses that make local compatibility valid when the new coefficient prime was already ramified." with:
   > When the new coefficient prime was already ramified, local compatibility there follows from R24.5's strict compatibility for the systems R24.5 constructs. For a system known only to be almost strictly compatible, enumerate the hypotheses that make it valid: ρ̄_ι irreducible, or ℓ ≠ 2 with r_ℓ unramified.
   Leave the "modern route" sentence to /21. Leave to /21 also the handoff sentence (line 193) on "the separately permitted lifting branch".
3. **AutomorphicGaloisRepresentations packet, next checkpoint.** Add the node `AutomorphicGaloisRepresentations:R19.5/skinner-compatibility-at-p-for-motivic-weight`, titled "Skinner's Theorem 1: potential semistability and local–global compatibility at p for every Hilbert eigenform of motivic weight".
   - **Statement.** Let F be totally real of degree d, ι : C ≅ Q̄_p, and π a cuspidal automorphic representation of GL₂(A_F). Let each π_i (i ∈ I) be discrete series of Blattner parameter k_i ≥ 2, with central character x ↦ sgn(x)^{k_i}|x|^{−w} for an integer w independent of i and k_i ≡ w (mod 2). Then for every v | p, ρ_π|D_v is potentially semistable of Hodge–Tate type (k, w), and WD(ρ_π|D_v)^{Fr-ss} ≅ ιRec_v(π_v ⊗ |·|_v^{−1/2}).
   - **Hypotheses.** There is no residual hypothesis and no condition at the finite places. The node is separate from Kisin's corollary (KW II Lemma 7.7), which /14 plans with residual irreducibility.
   - **Proof steps.** The cases of Saito, Blasius–Rogawski and Serre, and the argument for the remaining case, as listed above (p. 243).
   - **Sources.** Skinner, Theorem 1 (pp. 241–242) and the introduction (p. 243), as above.
   - **Prerequisites.**
     - AutomorphicGaloisRepresentations:R19.2, for ρ_π in every case, including Taylor's 1989 construction that /2 adds;
     - the Saito node of R19.5;
     - GL2AutomorphicRepresentationsAndTransfer:R17.4 for the base change, which reaches R19.5 once /4's edge R17.4 → R19.2 exists.
   - **Named gaps**, each with no atlas owner:
     - Blasius–Rogawski, Invent. Math. 114 (1993);
     - Gelbart–Jacquet with the Picard modular surface volume [Mo];
     - Wintenberger [Win1, Win2];
     - Buzzard's eigenvariety [Bu1] in the case needed;
     - Kisin, Invent. Math. 153 (2003).
4. **R24.3 packet, next checkpoint.**
   - Add `R24.5/strict-compatibility`: "The system (ρ_ι) of R24.5/brauer-induction-system is strictly compatible: for every prime q and every ι above ℓ, including q = ℓ with ρ̄_ι reducible, the Frobenius-semisimple Weil–Deligne parameter of ρ_ι|D_q is r_q." Its prerequisites are `R24.5/almost-strict-compatibility` for q ≠ ℓ, `R24.5/brauer-induction-system` and the Skinner node.
   - In `R24.5/almost-strict-compatibility`, append to the sentence "KW II correct an earlier claim of strictness on this point" the words "; R24.5/strict-compatibility proves strictness with Skinner's theorem instead".
   - In `R24.6/local-compatibility-at-the-coefficient-prime`, state that in case (c) the parameter is r_ℓ for the systems of R24.5, by `R24.5/strict-compatibility`. Keep the de Rham-only caveat for systems known only to be almost strict. Add that node as a prerequisite. The clause on the modern route's lifting theorem is /21's.
5. **No new edge.** R19.5 → R24.5 already holds through R19.6 → R24.1.

**When:** now (edits 1–2); blueprint (edits 3–4).

## /31 (medium, error): PG.6 feeds the layer that keeps the Berger–Li–Zhu calculation

### What the verifier corrected
- **No correction.** R21.5's text, P7's "The sole owner of étale (φ,Γ)-modules and their Galois equivalence is PhiGammaModulesAndIwasawaCohomology PG.0–PG.3 ... PG.6 constructs Wach modules" and PG.6's text are verbatim. The Berger–Li–Zhu abstract reads: "We construct explicitly some analytic families of etale (phi,Gamma)-modules, which give rise to analytic families of 2-dimensional crystalline representations."
- R21.5's closure, with all accepted restructurings and link maps, has no PhiGamma stage. PG.6 → R21.5 is acyclic.
- **Scope:** "Fix it together with finding 17 as the red team says: 17 moves the criterion's ownership to R06.4, and this one supplies whichever layer keeps the BLZ calculation."

### What main says now
- **PG.6** requires R06.2, PG.5 and Tau Ceti LocalFieldsRamification Layer 2. Its consumers are PadicHodgeRegulators L2 and L4, P7 and PG.7. No path runs from a PhiGamma stage to R21.5, R08.5 or R06.4.
- **The blueprint names it, the atlas does not.** The Ordinary packet's R21.5/blz-reduction-theorem lists PG.1, PG.6, PG.7 and P7/wach-dcris-comparison as prerequisites. The packet is not promoted, so no stage edge exists.
- **Source:** Berger–Li–Zhu, arXiv:math/0310275 (abstract page https://arxiv.org/abs/math/0310275 and PDF v1, read 29 September 2026, SHA-256 prefix e291beb15400c5a7), §1.2, p. 3: "What we will actually construct are explicit families of étale (ϕ, Γ)-modules", and "The answer to those questions is given by the theory of Wach modules".

### Fix
- **The edge.** Under /17's fix, PadicHodgeTheory R06.4:crystalline-to-ordinary keeps the Berger–Li–Zhu calculation. The edge is therefore PG.6 → R06.4:crystalline-to-ordinary, listed with /17's edges. Fontaine's equivalence (PG.0–PG.3) comes with it, and R21.5 and R08.5 reach PG.6 through the successor.
- **No direct PG.6 → R21.5.** It would be transitive.
- **No PG.7.** Theorem 4.1 of Berger–Li–Zhu is proved one α at a time with Fontaine's functor (p. 10). Dee's theorem on families appears only in Remarks 3.8 and 4.2(3).
- **Cycle test.** PG.6's ancestors contain PadicHodgeTheory R06.1, R06.2 and P7:annulus-foundations, and no LocalGaloisDeformationRings or OrdinaryAutomorphicFormsAndModularityLifting stage. The edge is acyclic, alone and jointly (see /17).

**When:** now, with /17.

## /32 (medium, missing): Washington's 1978 theorem joins IntegralIwasawaTheory L4, which feeds R21.5

### What the verifier corrected
- **The atlas facts hold.** Only three stages mention Washington: IntegralIwasawaTheory L4 ("Prove the Ferrero–Washington theorem for cyclotomic Z_p-extensions of abelian number fields"), EulerSystemsCyclotomicMainConjecture L4 (the same input) and IntegralIwasawaTheory L2 (Washington's book appendix). None is the 1978 non-p-part theorem, and the pinned declaration index has no "washington" entry.
- **The citation is right.** Washington, *The non-p-part of the class number in a cyclotomic Z_p-extension*, Invent. Math. 49 (1978), bounds the p-part of the class number along the cyclotomic Z_ℓ-extension of an abelian field for ℓ ≠ p, which a residually reducible R = T argument needs.
- L4 → R21.5 is acyclic.
- **The limit the verifier stated.** The Numdam copy of Skinner–Wiles was page images without a text layer for the verifier, so the pp. 75–76 quotations were the red team's. This report read them (below).

### What main says now
- **R21.5:** "Prove the residually reducible ordinary results invoked in Khare's level-one argument and in the modern p=3 branch." It requires R21.4, R03.5, R03.6 and R04.5. No IntegralIwasawaTheory stage reaches it.
- **IntegralIwasawaTheory L4:** "Prove the Ferrero–Washington theorem for cyclotomic Z_p-extensions of abelian number fields, including p=2, following the primary proof or Washington §7.5 with its full auxiliary equidistribution/linear-independence argument." It requires L0, L2 and PadicMeasuresIwasawaAlgebras L4 and L5. Its consumers are EulerSystemsCyclotomicMainConjecture L2 and L4 and Polylogarithms P.6.
- **The blueprint records the gap.** The Ordinary packet (checkpoint 4, not yet reviewed) lists as a gap of R21.5/theorem-a: "Washington's theorem on the non-p-part of class numbers in cyclotomic ℤ_ℓ-extensions ... IntegralIwasawaTheory L2/L4 plan class-number growth and Ferrero–Washington (ℓ = p), not this theorem; no stage plans it."
- **Sources** (read 29 September 2026):
  - Skinner–Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999) 5–126. Numdam PDF http://www.numdam.org/item/10.1007/BF02698855.pdf, SHA-256 prefix ec0697b3e9c9fa68; the current file has a text layer; printed page = PDF page + 3.
    - P. 75: "A critical ingredient in the proof of Theorem A is a result of Washington on the boundedness of the p-part of the class group of a cyclotomic Z_ℓ-extension of an abelian number field (cf. [Wa])." Checked on the page image.
    - P. 76: "Similarly, it follows from [Wa] that there exist r and c such that (4.13) c_n = c and r_n = r for n ≫ 0."
    - P. 126: "[Wa] L. Washington, The non-p-part of the class number in a cyclotomic Z_p-extension, Invent. Math. 49 (1978), no. 1, 87-97."
  - Washington, Invent. Math. 49 (1978) 87–97. GDZ PDF https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0007.pdf, SHA-256 prefix b0954600a0ad5fd1. P. 87: "Theorem. Let k be an abelian number field and K/k the cyclotomic Z_p-extension of k. Let l ≠ p be a prime and let l^{e_n} be the exact power of l dividing h_n. Then e_n is bounded independent of n (in fact e_n is constant for large n)." The paper proves it "by extending the techniques of [1]", the Ferrero–Washington proof that μ = 0.

### Fix
**1. `content/campaign/IntegralIwasawaTheory/README.md`, L4.** After the paragraph that ends "The source-independent arithmetic theorem is available by the primary Ferrero–Washington argument.", insert:

> Prove Washington's theorem on the non-p-part of the class number (Invent. Math. 49 (1978), Theorem, p. 87): for an abelian number field k, the cyclotomic Z_p-extension K/k with layers k_n, and a prime l ≠ p, the exponent of l in the class number of k_n is constant for large n. The proof extends the Ferrero–Washington argument above; Washington names the one essential difference on p. 87: the relevant group ring is Z_l[[Z_p]], not Iwasawa's Z_p[[X]] ≅ Z_p[[Z_p]]. Export it also with the primes exchanged, in the form Skinner–Wiles use for Theorem A (Publ. Math. IHÉS 89, pp. 75–76, (4.13)): for E abelian over Q, E_n the n-th layer of its cyclotomic Z_ℓ-extension, p ≠ ℓ, and χ a finite-order character whose splitting field is abelian over Q, the order of the p-part of the class group of E_n and the p-rank of the χ^{−1}-isotypic piece of the p-part of the class group of E_n(χ) are constant for large n. OrdinaryAutomorphicFormsAndModularityLifting R21.5 consumes it.

In L4's "**Acceptance:**" line, add "Washington's 1978 theorem, in both notations".

**2. Stage edge IntegralIwasawaTheory:L4 → OrdinaryAutomorphicFormsAndModularityLifting:R21.5.** Add it to R21.5's `requires` and to `stageEdges`. In R21.5's "**Dependencies:**" line, add "[IntegralIwasawaTheory L4](../IntegralIwasawaTheory/README.md) (Washington's theorem)".
- **Cycle test.** L4's ancestors contain no OrdinaryAutomorphicFormsAndModularityLifting stage, and R21.5 has no path to L4. Acyclic, alone and jointly.

**3. Blueprint.** The Ordinary packet's gap for Washington's theorem becomes a request to IntegralIwasawaTheory L4, needed by R21.5/theorem-a.

**When:** now for the prose and the edge; blueprint for the request.

## /33 (medium, error): R17.4 → R21.4, the stage of the Skinner–Wiles Main Theorem

### What the verifier corrected
- **No correction.** The closures of R21.4, R21.5 and R21.6, with all accepted restructurings and link maps, contain GL2AutomorphicRepresentationsAndTransfer R16.1–R16.6 and R17.1–R17.3 but not R17.4. R17.4's text does own cyclic base change and descent and their iteration to solvable extensions.
- R17.4 → R21.5 is acyclic.
- **The limit the verifier stated.** The Skinner–Wiles page was a scan for the verifier. This report read p. 74 (below).

### What main says now
- **R17.4** (`content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md`): "Prove cyclic base change and descent for GL₂, local compatibility and the exact failure-of-cuspidality criterion. Iterate to solvable extensions with a proof that the chosen tower and descent character ambiguities are controlled." It requires R17.3, and its only consumer is R17.5.
- **Part 1 edits R17.4.** `RT-AREA-langlands-1.fixes.md` /1 rewrites R17.4's first sentence to specialize ET.4b's base change and adds ET.4b → R17.4. It is not yet applied, and it keeps the iteration to solvable extensions in R17.4.
- **The step sits in R21.4.** RS-08 gives "Ordinary arithmetic R=T and modularity lifting on its exact overlap" to R21.4. The Ordinary packet (checkpoint 4, not yet reviewed) puts the Main Theorem in R21.4/main-theorem. Its last proof step is "Solvable base change for Hilbert modular forms ([GL]) descends f_1 to f over F", and it lists GL2AutomorphicRepresentationsAndTransfer:R17.4 as a prerequisite. R21.5/theorem-b and R21.5/nearly-ordinary-irreducible-lifting list R17.4 too. The packet is not promoted, so no stage edge exists.
- **Source:** Skinner–Wiles (Numdam PDF as in /32), p. 74, proof of the Main Theorem, checked on the page image: "Now, as the Galois closure of L/F is solvable, it follows from the known cases of base change for (holomorphic) Hilbert modular forms (cf. [GL]) that there is a newform f over F such that ρ_f|Gal(L̄/L) ≃ ρ_{f_1}". P. 125: "[GL] P. Gérardin, J.-P. Labesse, The solution of a base change problem for GL(2) (following Langlands, Saito, Shintani)", Proc. Symp. Pure Math. XXXIII, part 2, 115–133.

### Fix
**1. Stage edge GL2AutomorphicRepresentationsAndTransfer:R17.4 → OrdinaryAutomorphicFormsAndModularityLifting:R21.4.** Add it to R21.4's `requires` and to `stageEdges`.
- R21.5 and R21.6 reach R17.4 through R21.4, so the finding's R17.4 → R21.5 becomes transitive and is not added. When the Ordinary packet is promoted, its node prerequisites give the same edges again.
- **Cycle test.** R21.4 has no path to R17.4. The edge is acyclic alone, jointly with ET.4b → R17.4 and the other edges of part 1's /1, and jointly with this report's edges.

**2. `content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md`, R21.4.** After "Record determinant, ramification, local distinguishedness, character and residual modularity assumptions individually.", add:

> The Skinner–Wiles Main Theorem ends by descending modularity along a totally real L/F with solvable Galois closure, by base change for Hilbert modular forms (Skinner–Wiles 1999, p. 74, citing Gérardin–Labesse). Import it from GL2AutomorphicRepresentationsAndTransfer R17.4.

In R21.4's "**Dependencies:**" line, add "[GL2AutomorphicRepresentationsAndTransfer R17.4](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-4)".

**When:** now.

## /34 (medium, missing): a terminal stage R21.7 for Barnet-Lamb–Gee–Geraghty's ordinary lifts

### What the verifier corrected
- **No correction.** The proof of BCGP's Proposition 10.1.3 reads as quoted, and the bibliography gives [BLGG13] as Barnet-Lamb, Gee and Geraghty, *Congruences between Hilbert modular forms: constructing ordinary lifts, II*, Math. Res. Lett. 20 (2013), no. 1, 67–72.
- Item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/198 has status "missing", and its route names R21.2.
- R21.2's and R21.4's texts are verbatim. No atlas stage mentions Barnet-Lamb or the construction of ordinary lifts.

### What main says now
- **Two accepted routes point at R21.2.**
  - PAPER-BOXER-CALEGARI-GEE-PILLONI-21, route 30 (source, verdict accept) sends item /198 to R21.2 with BCGP's hypotheses: "E totally real, p ∈ {3, 5} unramified in E, and ϱ̄: G_E → GL_2(F̄_p) modular with determinant ε^{−1}, with ϱ̄|G_{E(ζ_p)} absolutely irreducible and ϱ̄ restricted to inertia at each w | p an extension of ε^{−1} by 1". Its consumer, AbelianSurfacesPotentialModularity, is a roadmap still to be designed (DESIGN-BCGP18) and is not in the atlas.
  - PAPER-NEWTON-THORNE-26, route 12 (source, accept) sends hida-hilbert and blgg-ordinary-lifts (Barnet-Lamb–Gee–Geraghty 2012, Theorem 6.1.9, with a Steinberg place) to R21.2.
- **R21.2 plans control, not lifts.** "Import ordinary families, the ordinary Hecke algebra and Hida control from PadicFamilies. Prove the additional nearly ordinary totally real and Eisenstein/residually reducible control statements needed by Skinner–Wiles". R24.3's "any prescribed-type strengthening from Gee/Snowden used only by the modern route" is limited to the modern Serre route over Q.
- **The theorem cannot sit in R21.2 or R21.6.** Its proof uses the Khare–Wintenberger lifting method (finiteness of the deformation ring, characteristic-zero points, prescribed local types), which is PotentialModularityAndCompatibleSystems R24.1–R24.3. The atlas has R21.6 → R23.4 → … → R24.3, so a node of R21.2 or R21.6 with that input closes a cycle.
- **Sources** (read 29 September 2026):
  - BCGP, arXiv:1812.09269v3, https://arxiv.org/pdf/1812.09269v3, SHA-256 prefix 7c8d74b0628d8b9c, p. 266, proof of Proposition 10.1.3: "If p = 5, the condition on the determinant and the fact that E is unramified at p additionally ensures that the projective image of ϱ̄ is not A5. ... Suppose that ϱ̄ is modular. It follows from [BLGG13, Thm. A] that ϱ̄ does indeed arise from a Hilbert modular form of this kind".
  - Barnet-Lamb–Gee–Geraghty, MRL 20 (2013), arXiv:1205.4491v1, https://arxiv.org/pdf/1205.4491v1, SHA-256 prefix cce437b227af8513, pp. 1–4. Theorem A: "Suppose that l > 2 is prime, that F is a totally real field, and that ρ̄ : G_F → GL₂(F̄_l) is irreducible and modular. Assume that ρ̄|G_{F_v} is reducible at all places v|l of F, and that ρ̄|G_{F(ζ_l)} is irreducible. If l = 5, assume further that the projective image of ρ̄ is not isomorphic to either PGL₂(F₅) or PSL₂(F₅). Then ρ̄ has a modular lift ρ : G_F → GL₂(Q̄_l) which is ordinary at all places v|l."
    - It is proved as Theorem 3.1.2, from Theorem 2.1.2 and Theorem 3.1.1.
    - Theorem 2.1.2 treats ρ̄(G_{F(ζ_l)}) adequate. Its proof uses [BLGG12] §6, [GK12] Lemma 4.4.1, [Gee11] §3 and the appendix to [BLGG11], "which improves on a lifting result of [BLGGT10], and classifies the subgroups of GL2(F̄l) which are adequate" (Theorem A.4.1 and Proposition A.2.1).
    - Theorem 3.1.1 treats l = 3 when the projective image of ρ̄(G_{F(ζ_3)}) is PSL₂(F₃). Its proof uses Langlands–Tunnell, Hida theory and [Gee11] §3.
  - Barnet-Lamb–Gee–Geraghty, *Congruences between Hilbert modular forms: constructing ordinary lifts*, Duke Math. J. 161 (2012), arXiv:1006.0466v1, https://arxiv.org/pdf/1006.0466v1, SHA-256 prefix ca3a688bd717306f, §6, pp. 33–46. Lemma 6.1.1, Proposition 6.1.3 and Theorems 6.1.5 and 6.1.7 use definite quaternion algebras, Kisin's types, Geraghty's ordinary automorphy lifting for unitary groups and Clozel–Harris–Taylor.

### Fix
**1. New stage `OrdinaryAutomorphicFormsAndModularityLifting:R21.7`.** In `content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md`, insert after the R21.6 section, before "## Required examples and checks":

> <a id="r21-7"></a>
>
> ## R21.7. Ordinary lifts of modular residual representations
>
> **Milestone:** `R21.7`
>
> State and prove Barnet-Lamb–Gee–Geraghty's Theorem A (Math. Res. Lett. 20 (2013), Theorem 3.1.2). Let l > 2, F be totally real and ρ̄ : G_F → GL₂(F̄_l) be irreducible and modular, with ρ̄|G_{F_v} reducible at every v | l and ρ̄|G_{F(ζ_l)} irreducible, and, for l = 5, with projective image neither PGL₂(F₅) nor PSL₂(F₅). Then ρ̄ has a modular lift that is ordinary at every v | l. Follow the source's two cases:
> - Theorem 2.1.2, when ρ̄(G_{F(ζ_l)}) is adequate: from [BLGG12] §6, with the automorphy lifting and adequacy results of [BLGG11] Appendix A and potential diagonalisability from [GK12] Lemma 4.4.1;
> - Theorem 3.1.1, when l = 3 and the projective image of ρ̄(G_{F(ζ_3)}) is PSL₂(F₃): Langlands–Tunnell and Hida theory.
>
> Both cases obtain the weight-0 lift, of parallel weight two, by Gee's prescribed-type lifts ([Gee11] §3). R24.3 plans Gee's strengthening only for the route over Q, so the totally real form used here is proved in this stage from R24.1–R24.2.
>
> Export the theorem in the form Boxer–Calegari–Gee–Pilloni use (Proposition 10.1.3, Theorems 10.1.4 and 10.2.6). Let E be totally real, p ∈ {3, 5} unramified in E, and ϱ̄ modular with determinant ε^{−1}, with ϱ̄|G_{E(ζ_p)} absolutely irreducible and ϱ̄|I_w an extension of ε^{−1} by 1 at each w | p. Then ϱ̄ arises from an ordinary Hilbert modular form of parallel weight two and trivial nebentypus. Verify each hypothesis of Theorem A for this instance, including both exclusions at p = 5: BCGP p. 266 addresses only A₅ ≅ PSL₂(F₅).
>
> **Inputs.** R21.6 (Hida families and ordinary lifting over totally real fields); PotentialModularityAndCompatibleSystems R24.3 (the Khare–Wintenberger lifting method: finiteness, characteristic-zero points, prescribed local lifts), and through it GL2AutomorphicRepresentationsAndTransfer R17.4 and R17.5 (solvable base change; Langlands–Tunnell) and HilbertModularVarietiesAndShimuraCurves R18.3 (definite quaternionic forms).
>
> **Gaps.** No stage of the atlas owns: automorphy lifting for potentially diagonalisable polarized representations over CM fields ([BLGG11] Theorem A.4.1, after Barnet-Lamb–Gee–Geraghty–Taylor); Geraghty's ordinary automorphy lifting for unitary groups; potential diagonalisability of potentially Barsotti–Tate representations ([GK12] Lemma 4.4.1); and the classification of adequate subgroups of GL₂(F̄_l) ([BLGG11] Proposition A.2.1). The Newton–Thorne extractions record the same Barnet-Lamb–Gee–Geraghty–Taylor inputs as missing.
>
> **Consumers.** Boxer–Calegari–Gee–Pilloni's roadmap AbelianSurfacesPotentialModularity, once it exists. This stage feeds nothing that reaches R24.3, and in particular not PotentialModularityAndCompatibleSystems R23.4.
>
> **Dependencies:** R21.6; [PotentialModularityAndCompatibleSystems R24.3](../PotentialModularityAndCompatibleSystems/README.md#r24-3).

- **Stage record:** key `R21.7`, title "Ordinary lifts of modular residual representations", requires R21.6 and PotentialModularityAndCompatibleSystems:R24.3, no consumers. Add R21.7 to the roadmap's stage list and to the "**Stages:**" line of "Implementation handoff". The key is not in use or reserved in `research/blueprint/reserved-ids.json`.
- **Edges:** R21.6 → R21.7 and PotentialModularityAndCompatibleSystems:R24.3 → R21.7. R17.4, R17.5, R18.3 and PadicFamilies L5 are already ancestors of R24.3.
- **Cycle test.** R21.7 has no consumer, so it closes no cycle. It is also jointly acyclic with this report's other edges.

**2. Route records.**
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-21, route 30** (`research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`): set `stages` from ["OrdinaryAutomorphicFormsAndModularityLifting:R21.2"] to ["OrdinaryAutomorphicFormsAndModularityLifting:R21.7"]. In its reason, replace the first sentence, "R21.2 imports Hida control and must 'Prove the additional nearly ordinary totally real ... control statements', 'specifying p-distinguishedness, tame characters'; the Newton–Thorne (2026) extraction routes Barnet-Lamb–Gee–Geraghty's ordinary lifts of Hilbert modular forms (in a form with a Steinberg place) here, with Hida families for Hilbert modular forms.", with "R21.7 states and proves Barnet-Lamb–Gee–Geraghty's Theorem A; R21.2 plans Hida control, not the construction of lifts." The route keeps its number, kind and roadmap, so `make_queue` still applies it under its accepted verdict. That verdict's reason names R21.2; the maintainer decides whether to record a new one.
- **PAPER-NEWTON-THORNE-26, route 12.** Its item blgg-ordinary-lifts (BLGG12 Theorem 6.1.9, with a Steinberg place) belongs in R21.7 for the same reason, while hida-hilbert stays in R21.2. Splitting the route needs a verdict for the new route; the maintainer decides.

**When:** now for the stage, the edges and BCGP route 30; verdict for the Newton–Thorne split.

## /35 (medium, duplicate): L5w imports ordinary R = T from R21.4 and patching data from R04.6

### What the verifier corrected
- **No correction.** L5w's text is verbatim, including "Generic deformation/patching is imported from its canonical owners" and the Fujiwara sentence.
- Its closure, over the atlas with all accepted restructurings and link maps, contains no GlobalGaloisDeformations, LocalGaloisDeformationRings, GL2ModularityLifting or OrdinaryAutomorphicFormsAndModularityLifting stage. Its only deformation-theoretic ancestors are DeformationAndDerivedPatchingAlgebra P7 and R03.1–R03.3, the abstract layers.
- RS-08's owner record gives "Ordinary arithmetic R=T and modularity lifting on its exact overlap" to R21.4, and RS-11, which keeps L5w, was not accepted at the baseline. It has since been accepted (REV-RS-11, #4651). Its keep for L5w ends "Generic Hilbert Hida and deformation machinery remain imports", which is this fix.
- Both proposed edges are acyclic.

### What main says now
- **L5w** (`content/campaign/AutomorphicCongruences/README.md`): "Construct the Hilbert Hida family, minimal deformation/Hecke comparison, Gorenstein duality and integral specialization maps. Generic deformation/patching is imported from its canonical owners; the minimal local type and freeness proof for this source is owned here."
- Its second paragraph pins BCS Hypothesis 3.1.1 (H1)–(H3) and says: "Prove the minimal local-type/freeness and auxiliary-hypothesis instances used by Wan 2015 Theorem 8 and BCS §3; do not cite the bare title R=T to erase these conditions." The README's table row already reads: "Prove the auxiliary Hilbert/quartic-CM field satisfies Fujiwara H1–H3 and the required minimal-lift/freeness hypotheses before importing the BCS two-variable comparison."
- **Its edges.** L5w requires AutomorphicBundles B5, L0, AutomorphicPadicLFunctions L3, DirichletPadicLFunctions L1, L2 and L4, IgusaVarietiesAndTorsionConcentration IG.1, PadicFamilies L5 and ShimuraVarieties V5. Its consumer is L5a.
- **Part 1 edits L5w too.** `RT-AREA-langlands-1.fixes.md` /8 (merged, not yet applied) inserts after the first quoted sentence: "The Hilbert ordinary Igusa tower comes from HodgeTateAndCanonicalSubgroups T5 through PadicFamilies L5. IgusaVarietiesAndTorsionConcentration IG.1 enters only for the GU(2,2) datum, and the comparison between its central-leaf torsor and the GU(2,2) Hida tower is proved here." It keeps IG.1 → L5w and adds T5 → L5w.
- **The suppliers.** R04.6 (GlobalGaloisDeformations): "Package the global-to-local presentation with its explicit numerical terms, maps and universal representations." R22.5 (GL2ModularityLifting) deduces "the ordinary, finite-flat/potentially Barsotti–Tate and required crystalline-range lifting results"; it requires R21.4.

### Fix
**1. `content/campaign/AutomorphicCongruences/README.md`, L5w.**
- In "Construct the Hilbert Hida family, minimal deformation/Hecke comparison, Gorenstein duality and integral specialization maps.", replace "minimal deformation/Hecke comparison" by "the source's instance of the minimal deformation/Hecke comparison". Part 1's /8 inserts its two sentences after this sentence; they follow the edited sentence unchanged.
- Replace "Generic deformation/patching is imported from its canonical owners; the minimal local type and freeness proof for this source is owned here." with:
  > The deformation/Hecke comparison is not proved here. It is ordinary R = T over a totally real field, which RS-08 gives to OrdinaryAutomorphicFormsAndModularityLifting R21.4, with the Taylor–Wiles data and patching numerology of GlobalGaloisDeformations R04.6. This layer verifies BCS Hypothesis 3.1.1 and the minimal local-type and freeness instances of Wan 2015 Theorem 8 against R21.4's theorem. If an instance needs Fujiwara's non-ordinary minimal cases, it imports them from GL2ModularityLifting R22.5.
- The second paragraph stays. Its "Prove the minimal local-type/freeness and auxiliary-hypothesis instances ..." is the verification that this layer keeps.

**2. Stage edges.** OrdinaryAutomorphicFormsAndModularityLifting:R21.4 → L5w and GlobalGaloisDeformations:R04.6 → L5w.
- **Cycle test.** L5w's descendants are AutomorphicCongruences L5, L5a and L5b, HeegnerPointEulerSystems HE.8b and HE.8c, ModularIwasawaMainConjectures L3, L5 and L6, PeriodsAndSpecialValues PS.6 and PS.7, and RankZeroOneBSD BSD.6, BSD.8 and BSD.9. None reaches R21.4 or R04.6.
- The two edges are acyclic jointly with each other, with part 1's T5 → L5w and with this report's other edges.
- An edge R22.5 → L5w is added only if an instance needs Fujiwara's non-ordinary cases. It was tested and is acyclic too.

**When:** now.

## Findings not applied

The five low findings are confirmed but outside a fix job (PROTOCOL.md section 17). They are recorded here only so that a later job can pick them up:
- /36, the Khare citation in R26.1 and R24.3: section 6.2 (Theorem 6.2), with the level-one base cases assigned to R26.5.
- /37, R04.3's KW II citations: Lemmas 4.4 and 4.6 and Proposition 4.5; Corollary 4.7 moves to R24.2.
- /38, R21.6's duplicate clause against PadicFamilies L0/L1.
- /39, node R33.2/dp-lift-existence-and-good-dihedral-insertion, which should require R24.3.
- /40, the route of PAPER-LE-LEHUNG-LEVIN-ETAL-20/cited-base-change. It should now point to EndoscopicTransferAndUnitaryTraceComparison:ET.4b, the base-change stage proposed in `RT-AREA-langlands-1.fixes.md` (/1 there), rather than ET.7a.
