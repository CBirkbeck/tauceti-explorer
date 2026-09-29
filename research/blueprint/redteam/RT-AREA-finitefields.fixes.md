# RT-AREA-finitefields: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #3958, job FIX-RT-AREA-finitefields).
- Findings: `RT-AREA-finitefields.result.json`: 20 findings (2 high, 14 medium, 4 low), by Claude Code session `cc39fac3` (PR #2681).
- Verdicts: `RT-AREA-finitefields.review.json` and `research/blueprint/reviews/REV-RT-AREA-finitefields.md`, by Codex session `codex-c83e7a`:
  18 confirmed, 2 rejected (/15, /19).
- In scope for this job (confirmed, high or medium): /1–/14, /17 and /18. The rejected /15 and /19 get no change. The confirmed low findings /16 and /20 are outside the job; where an edit below touches them, the section says so.
- Everything below was checked at origin/main `701638e0`.
  - The graph checks use the atlas as `scripts/build.py` (`assemble`) builds it at that commit (2840 stages, 7792 stage edges):
    accepted restructurings, promoted blueprints and link maps, decompositions and new roadmaps included.
  - "The cycle test for A → B" asks whether that graph, with every removal and every earlier addition of this report applied, has a path B → … → A. "Acyclic" means it has none, so adding A → B closes no cycle. Every added edge was also tested against the unmodified graph.
  - "Depth" below is the length of the longest chain of stage edges ending at a stage in the assembled graph. It is not the `depth` field stored in the `data/atlas.json` snapshot (FF.2 22, FF.3 23, FF.4 24, FF.5 25, CN.1 24), which counts differently and is not recomputed by the build.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is therefore
written as an exact edit for the maintainer, or for the blueprint and review jobs that own the packets:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence is quoted and the replacement is
  given in full.
- **Stage edges**: an edit to the consumer's `**Inputs.**` or `**Dependencies:**` line, and to its `requires` list and the
  `stageEdges` record in `data/atlas.json` (or to the `links` of the accepted restructuring that carries it). Removals
  are marked as the maintainer's.
- **New substages**: a README section, as the existing substages `WeilConjectures:WC.5:power-sum-converse` and
  `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity` are written, and a stage record in `data/atlas.json`. The review of /1 and /3
  requires a refinement to be registered before the graph is regenerated.
- **Packet nodes** (`research/blueprint/packets/*.json`): node moves, new nodes and baseline citations, for the blueprint job that owns the packet.
- **Paper items and routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the item or route, the field,
  the old value and the new value.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. Each
section starts with those corrections, then says what `main` says now, then gives the fix.

**The main change since the red team.** The red team read the atlas on 24 September. On 25 September the blueprint job
BP-FiniteFieldsAndCharacterSums committed a first checkpoint, `research/blueprint/packets/FiniteFieldsAndCharacterSums.json` (#2910):
354 nodes over FF.0–FF.5, status `partial`, no review yet (REV-FiniteFieldsAndCharacterSums is pending). That packet already
carries much of what the findings ask for: Hasse–Davenport, Deligne's n-variable bound, the corrected degenerate case,
the code families, linearized polynomials, and a source route per layer. For those findings the fix below is the
residue: what the packet still lacks, and the roadmap text and stage edges, which nobody has changed. The roadmap
README is unchanged since 15 September.

**Proposals and jobs still open that these fixes touch.**
- `RS-04` (FunctionFieldArithmetic family): not accepted; REV-RS-04 is pending (claimed on #807). /12 goes through it.
- `RT-RS-03` (red team of the accepted RS-03): pending. /1 changes three RS-03 links (EllipticCurves layer 3 → FF.3, FF.3 → CN.3) and the FF.3 narrowing.
- BP-FiniteFieldsAndCharacterSums (pending, claimed #1029) and REV-FiniteFieldsAndCharacterSums (pending): every "blueprint" edit below is theirs.
- BP-DrinfeldModulesAndTModules--DM.0 (pending; first checkpoint `research/blueprint/packets/DrinfeldModulesAndTModules--DM.0.json`, 28 September, unreviewed): /13.
- BP-ComputationalNumberTheory (pending, claimed #1026) and the merged `RT-AREA-computational.fixes.md` /10, which gave the same CN.1 edit as /11 here.
- BP-FunctionFieldArithmetic, BP-ProbabilisticAndMetricNumberTheory and BP-AdditiveCombinatorics (all pending): they receive the BKK items of /18.
- DESIGN-KloostermanMomentsAndPotentialAutomorphy (pending): /3's Euler-characteristic owner is linked to it.
- The merged `RT-AREA-etale.fixes.md` /7 and /14 also edit FF.2 (Lang–Weil in families, FA.5 → FF.2, the Artin–Schreier sheaf). Nothing here conflicts with them. Both reports add inputs to FF.2's Inputs line, and the maintainer applies both.

No restructuring proposal other than RS-03 (accepted), RS-04 (pending) and RS-17 (accepted) names an FF stage. Every paper route into
FF (BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 route 3, BERGSTROM-FABER-PAYNE-24 route 4, BROWNING-SAWIN-20 route 2,
DELIGNE-74 route 4, DELIGNE-80 route 3) is from an accepted paper with an accepted route. No paper review in `revise` routes into FF.

**Review verdicts.** Some fixes add a paper route or change a route's stages. `make_queue` applies a route only when the
paper's review file carries a verdict for it. This report writes no verdicts. For each such route it names the entry
to record, and the maintainer decides whether to record `accept` on the strength of the confirmed finding.

**Disclosure.** This session did not write the red team, its verification, the roadmap, the EXT-08 packets, the FF
blueprint packet or the DM.0 packet, and has reviewed none of them. It wrote no paper extraction routed into FF.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main` (README text, stage records, restructuring links, decomposition files, queue metadata);
- **blueprint:** it goes into a packet through that packet's blueprint job (or its review);
- **verdict:** a new or changed paper route needs a review verdict first;
- **RS-04 review:** it goes into RS-04 through REV-RS-04 or its fix job.

| # | Finding | Fix | When |
|---|---|---|---|
| /1 | high, error | FF.3 becomes elementary (inputs FF.0, CA.3, CN.0). A new substage FF.3:point-counting takes point counting with FF.2, WC.5 and EllipticCurves layer 3. FF.4 takes FF.0, FF.1 and CA.2; the Terras Ramanujan node moves to FF.5, which gets direct inputs. The census block moves to FF.0. CN.1's depth drops from 31 to 6 and has no Weil ancestor. | now; blueprint |
| /2 | medium, missing | WC.5 → FF.3:point-counting, with the 2g curve bound and the Betti bound as a packet request and their exact hypotheses. Open or singular varieties use FF.2's Lang–Weil. | now; blueprint |
| /3 | high, missing | New substage EDC.2:euler-characteristic (Grothendieck–Ogg–Shafarevich, from Raynaud, Bourbaki 286, Théorème 1) with an equal-characteristic Swan request to R01.3. It supplies FF.2 and the Kloosterman-moments design. The DELIGNE-74 GOS item is re-routed. | now; blueprint; verdict |
| /4 | medium, missing | Already planned in the packet (8.4, 8.5(i), 8.5(ii), Prop. 3.8). Add 8.5(iii) and the compactification (8.6–8.9) as a node, with an unowned-resolution gap and a note for the maintainer. | blueprint |
| /5 | medium, error | README acceptance rewritten: c·g^d over F̄ with exact order d, the x² cubic control, and separate mixed-sum hypotheses. The packet is already correct. | now |
| /6 | medium, library-claim | README FF.0 names the built baseline. The packet cites all but two of the declarations; add those two and an intermediate-field ↔ divisor node. | now; blueprint |
| /7 | medium, library-claim | README FF.1 names the built identities. Add the two reciprocity declarations to the packet baseline. The EXT-08 geometric content moves to FF.2 (with /9). | now; blueprint |
| /8 | medium, missing | Already planned: FF.1/hasse-davenport-lifting (Conrad, read) in Mathlib's sign; FF.2's Frobenius node gives the cohomological reading. Correct the EXT-08 locator to Théorème 1.15, p. 177. | blueprint |
| /9 | medium, error | EXT-08 nodes re-parented to FF.2, with an id map to the blueprint packet. The Euler–Poincaré node goes to the /3 owner. The étale-algebra node is split. A duality-compatibility node is added to FF.2. | now (with /10); blueprint |
| /10 | medium, other | Correct the EXT-08 FF packet, promote it and the ES packet to `data/decompositions/`, set `integrated_partial`, regenerate DECISIONS.md with the present answers, and hand the id map to BP-FF. | now |
| /11 | medium, duplicate | The CN.1 node becomes a consumer of FF.3's certificate. Its mathematics is already in FF.3's nodes (a map is given); add one tightness acceptance. | now; blueprint |
| /12 | medium, duplicate | FA.7 imports factorization from FF.3 and counts from FF.3:point-counting. It keeps place enumeration, Riemann–Roch, ray characters, conductors and the L-polynomial assembly, with its hypotheses. | now; RS-04 review |
| /13 | medium, duplicate | FF.0 is the single owner of the Frobenius action on `SkewPolynomial`, L{τ} and the linearized-polynomial comparison. Nodes move from FF.4 and DM.0. Edge FF.0 → DM.0. | now; blueprint |
| /14 | medium, missing | Already planned: Singleton, RS, BCH, AG with the review's hypotheses. Add cyclic codes (Hall, Ch. 8, read) and the general BCH bound. README FF.4 lists the targets. | now; blueprint |
| /15 | rejected | No change. | — |
| /16 | low (not in this job) | Only the incidental facts: AC-L43–45 and ACT-L08–09 are already edges into FF.4 in the assembled graph; SF.3 is kept, as its review asks. | — |
| /17 | medium, error | README source routes for FF.3, FF.3:point-counting and FF.4 name the packet's read public sources. EXTENSION_SOURCES.md gets rows marked "read by the blueprint worker, review pending". | now |
| /18 | medium, error | BKK route 3 keeps items 73 and 130, re-staged to FF.0 (the elementary modulus-T proof). Items 13, 14, 15, 20 and 21 go to FA.2, 8 to PM.0 and 25 to AC.0. The nine FF.1d nodes leave the FF packet. | verdict; blueprint |
| /19 | rejected | No change. | — |
| /20 | low (not in this job) | The packet already requests DWP.6 (its request 4). The /10 decision record states it. | — |

## /1 (high, error): the linear chain FF.2 → FF.3 → FF.4 → FF.5 puts factorization, Hensel lifting, finite rings and codes behind Weil II

### What the verifier corrected

- Confirmed: the graph has FF.2 → FF.3 → CN.1, and FF.4 inherits the same cohomological ancestors. The factorization node uses the FF.0 census, not Weil II.
- Split the elementary factorization/Hensel export from point counting, and FF.4's elementary constructions from the applications that need a bound.
- Removing FF.2 → FF.3 and adding WC.5 → FF.3 is not enough: WC.3 → WC.5 → FF.3 → CN.1 would remain. CN.1 must import the elementary component, not the point-counting stage.
- Keep the general point-count and correlation targets with their real suppliers. Register a stage refinement before regenerating the graph.
- CN.0 already has an early FF.0 input and does not share CN.1's obstruction.
- Do not forbid an algorithmic FF.4 target from importing a particular FF.3 algorithm.

### State on main (701638e0)

**The README** (`content/campaign/FiniteFieldsAndCharacterSums/README.md`, last changed 15 September) is as the red team read it:
- FF.3: "**Inputs.** `FiniteFieldsAndCharacterSums:FF.2`";
- FF.4: "**Inputs.** `FiniteFieldsAndCharacterSums:FF.3`, `SchemeAndStackFoundations:SF.3`";
- FF.5: "**Inputs.** `FiniteFieldsAndCharacterSums:FF.4`".

**The assembled graph.**
- FF.2's inputs are FF.1, AC.0, WC.3, DWP.0, DWP.4–DWP.7, EDC.1 and EDC.2. It has 142 ancestors.
- FF.3's inputs are FF.2 and, from RS-03, EllipticCurves layer 3.
- FF.3 feeds CN.1, CN.2 (RS-03 forwarding), CN.3 (RS-03) and FF.4.
- FF.4 also receives SF.3, EllipticCurves layer 3 (RS-03 forwarding), AlgebraicCodingTheory layers 1–2 and AlgebraicCurves layers 3–5 (link maps).
- FF.5's inputs are FF.4 and CN.5.

Depths:

| Stage | Depth |
|---|---|
| FF.0 | 3 |
| FF.1 | 4 |
| FF.2 | 29 |
| FF.3 | 30 |
| FF.4 | 31 |
| FF.5 | 32 |
| CN.1 | 31 |
| CN.2 | 32 |
| CN.0 | 4 |

CN.0 depends only on CA.3 and FF.0, as the review says.

**RS-03** (`data/restructure/RS-03.result.json`, accepted):
- FF.3 keeps "certified finite-field factorization, Hensel lifting and point-counting algorithms"; its `suppliedBy` is EllipticCurves layer 3.
- It has the links EllipticCurves layer 3 → FF.3, FF.3 → CN.3 ("point-counting/factorization outputs") and FF.3 → CN.2, and the forwardings EllipticCurves layer 3 → CN.1 and → FF.4.

**The FF blueprint packet** already separates the two kinds of FF.3 content, though both are parented to FF.3.
- 28 point-counting nodes, from `FF.3/naive-point-count` to `FF.3/schoof-algorithm-cost`. Their only prerequisites outside the block are:
  - `FF.2/weil-bound-multiplicative` (for `FF.3/weil-error-bound-for-hyperelliptic-counts`);
  - `FF.3/gcd-with-frobenius-power` (for `FF.3/trace-modulo-two`);
  - FF.0's presentation, CN.0, and Tau Ceti's elliptic declarations.
- No factorization, certificate or Hensel node depends on any point-counting node or on any FF.2 node. The one exception is the trivial construction `FF.2/monic-polynomials-of-degree`, used by `FF.3/monic-irreducible-polynomials-of-degree` and `FF.3/random-irreducible-polynomial-algorithm`.
- Eleven FF.3 cost nodes and `FF.3/berlekamp-algorithm(-correct)` have `ComputationalNumberTheory:CN.0` as a prerequisite, but CN.0 is not an input of FF.3.
- No FF.4 node has an FF.3 node as a prerequisite. Two FF.4 nodes reach outside FF.4 and CA.2: `FF.4/permutation-character-criterion` (FF.1) and `FF.4/terras-graph-ramanujan` (stage FF.2, Katz's estimate).
- The FF.5 nodes use FF.1, FF.2 (the Weil, Kloosterman and multiplicative bounds), FF.4 and CN.5 directly.

### Fix

**1.1 README, FF.3, rewritten as the elementary component.** Replace the heading and the four paragraphs from "### FF.3 Factorization and point counting" to "**Acceptance.** Factor products and irreducibility witnesses are checked; a point count agrees with the trace convention and a provable error bound." with:

> ### FF.3 Factorization, irreducibility certificates and Hensel lifting
>
> **Construct and export.** Prove finite-field polynomial factorization (square-free decomposition, distinct-degree and equal-degree factorization, the Cantor–Zassenhaus and Berlekamp algorithms), irreducibility tests, Rabin certificate generation and factorization certificates, and Hensel lifting of coprime factorizations modulo I^k, over I-adically complete rings and modulo p^k, with the lifting algorithm. State correctness, termination, failure probability and cost separately, the cost in ComputationalNumberTheory CN.0's model. Correctness rests on FF.0's census X^{q^n} − X = ∏_{d|n} ∏_{deg f = d} f; no Weil or Deligne bound is an input. Certified point counting is the substage FF.3:point-counting.
>
> **Inputs.** `FiniteFieldsAndCharacterSums:FF.0`, `ClassicalArithmeticCompletion:CA.3`, `ComputationalNumberTheory:CN.0`
>
> **Acceptance.** Factor products and irreducibility witnesses are checked; each randomized algorithm has a Las Vegas correctness statement, a failure bound and an expected cost, and no worst-case bound is quoted from an expected one.

Keep FF.3's "Source route" and "Execution state" paragraphs, with the source route as in /17.

**1.2 README, new substage after FF.3.** Insert before "### FF.4 Finite rings, sequences and codes":

> ### FF.3:point-counting — Certified point counting
>
> This extracted substage owns certified point counts over finite fields. Construct naive and certified counts: enumeration, the character-sum formula #{(x, y) ∈ F_q² : y² = f(x)} = q + Σ_x χ(f(x)) for q odd and χ quadratic, point-count certificates with soundness and completeness, and Schoof's algorithm for elliptic curves with correctness and cost. Check every count against a provable error bound with its exact hypotheses:
> - for an elliptic curve, the Hasse bound imported from Tau Ceti EllipticCurves layer 3;
> - for y² = f(x) with q odd and f squarefree of degree d ≥ 1, the affine bound |#{(x, y)} − q| ≤ (d − 1)q^{1/2} from FF.2's multiplicative Weil bound;
> - for a smooth projective geometrically connected curve of genus g, |#C(F_{q^r}) − (q^r + 1)| ≤ 2g q^{r/2} for every r ≥ 1;
> - for a smooth projective geometrically connected variety of dimension d, |N_r − (1 + q^{dr})| ≤ Σ_{i=1}^{2d−1} b_i q^{ir/2};
> - for open or singular varieties, only FF.2's Lang–Weil estimates, with their stated constants.
>
> The two bounds for smooth projective varieties are imported from WeilConjectures WC.5. Export the counts over F_{q^r}, r ≤ g, of a genus-g curve that determine its zeta numerator.
>
> **Inputs.** `FiniteFieldsAndCharacterSums:FF.3`, `FiniteFieldsAndCharacterSums:FF.2`, `ComputationalNumberTheory:CN.0`, `WeilConjectures:WC.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`
>
> **Acceptance.** A certified elliptic count agrees with the trace convention frobeniusTrace = q + 1 − #E(F_q) and lies in the Hasse interval. No bound is applied outside its hypotheses: a singular or non-geometrically-connected curve gets no 2g bound.

**1.3 README, FF.4 Inputs.** Replace "**Inputs.** `FiniteFieldsAndCharacterSums:FF.3`, `SchemeAndStackFoundations:SF.3`" with:

> **Inputs.** `FiniteFieldsAndCharacterSums:FF.0`, `FiniteFieldsAndCharacterSums:FF.1`, `ClassicalArithmeticCompletion:CA.2`, `SchemeAndStackFoundations:SF.3`

SF.3 stays, as the review of /16 asks. The curve and code inputs are already edges from the promoted link maps. FF.4 no longer imports FF.3, because no FF.4 node uses it. An algorithmic FF.4 target that needs an FF.3 algorithm may add FF.3 → FF.4 back: FF.3 is now elementary, and the edge is acyclic. FF.4's text changes as in /14.

**1.4 README, FF.5.**
- Replace "**Inputs.** `FiniteFieldsAndCharacterSums:FF.4`" with:
  > **Inputs.** `FiniteFieldsAndCharacterSums:FF.1`, `FiniteFieldsAndCharacterSums:FF.2`, `FiniteFieldsAndCharacterSums:FF.3`, `FiniteFieldsAndCharacterSums:FF.3:point-counting`, `FiniteFieldsAndCharacterSums:FF.4`
- After "distinguish mathematical correctness from cryptographic hardness hypotheses." add:
  > The applications that need a Weil or Deligne bound live here, not in FF.4: the Weil bound for cross-correlations of decimated m-sequences, and the Ramanujan property of the finite upper half-plane graphs (Katz's estimate for Soto-Andrade sums).

**1.5 Stage records** (`data/atlas.json`, and RS-03's `links` where RS-03 carries the edge). Removals are the maintainer's.

| Edit | Edge | Where | Cycle test |
|---|---|---|---|
| remove | FF.2 → FF.3 | atlas | — |
| remove | FF.3 → FF.4 | atlas | — |
| move | EllipticCurves layer 3 → FF.3 becomes → FF.3:point-counting | RS-03 link | acyclic |
| add | FF.0 → FF.3 | atlas | acyclic |
| add | CA.3 → FF.3 | atlas | acyclic |
| add | CN.0 → FF.3 | atlas | acyclic |
| add | FF.3 → FF.3:point-counting | new record | acyclic |
| add | FF.2 → FF.3:point-counting | new record | acyclic |
| add | CN.0 → FF.3:point-counting | new record | acyclic |
| add | WC.5 → FF.3:point-counting | new record (/2) | acyclic |
| add | FF.3:point-counting → CN.3 (keep FF.3 → CN.3) | RS-03 link | acyclic |
| add | FF.0 → FF.4, FF.1 → FF.4, CA.2 → FF.4 | atlas | acyclic |
| add | FF.1, FF.2, FF.3, FF.3:point-counting → FF.5 | atlas | acyclic |

- **The new stage record** `FiniteFieldsAndCharacterSums:FF.3:point-counting`: owner FiniteFieldsAndCharacterSums, key `FF.3:point-counting`, title "Certified point counting", `requires` as in 1.2, `sourcePath` the README.
- **The RS-03 narrowing of FF.3.** Its "keeps" now covers two stages. Record in the RS-03 entry, or in its red team RT-RS-03, that point counting is FF.3:point-counting. RS-03's owner entry "Certified finite-field factorization, Hensel and point-counting algorithms" then names both stages.
- **Forwardings left alone.** EllipticCurves layer 3 → FF.4 and → CN.1 stay (the layer has depth 0). The first no longer carries content, and the maintainer may drop it.

**Depths in the modified graph**, before → after:

| Stage | Before | After |
|---|---|---|
| FF.3 | 30 | 5 |
| FF.3:point-counting | new | 30 |
| FF.4 | 31 | 5 |
| FF.5 | 32 | 31 |
| CN.1 | 31 | 6 |
| CN.2 | 32 | 7 |
| CN.3 | 42 | 42 |

After the edits, none of CN.1, CN.2, FF.3 and FF.4 has WC.3, DWP.7 or FF.2 among its ancestors (checked). CN.3 keeps its depth, which comes from the modular-forms layers.

**1.6 Packet** (`research/blueprint/packets/FiniteFieldsAndCharacterSums.json`, for BP-FiniteFieldsAndCharacterSums).
- **Point counting.** Re-parent the 28 point-counting nodes (`FF.3/naive-point-count` … `FF.3/schoof-algorithm-cost`) to `FiniteFieldsAndCharacterSums:FF.3:point-counting`, keeping their ids. `FF.3/trace-modulo-two` keeps its prerequisite `FF.3/gcd-with-frobenius-power`, now an input stage.
- **The census block moves to FF.0** (it is FF.0's by /6 and /18; the move is closed under prerequisites, checked). The ids become `FF.0/…`:
  - `FF.2/monic-polynomials-of-degree`;
  - the 15 census nodes `FF.3/monic-irreducible-polynomials-of-degree`, `count-of-irreducible-polynomials`, `partition-by-minimal-polynomials`, `gauss-product-formula`, `gauss-count-formula`, `moebius-formula-for-irreducible-count`, `irreducible-count-upper-bound`, `irreducible-count-lower-bound`, `prime-polynomial-theorem`, `irreducible-density-lower-bound`, `irreducible-count-with-constant-coefficient`, `norm-from-minimal-polynomial`, `constant-coefficient-norm-fibre-identity`, `constant-coefficient-count-bounds` and `irreducible-polynomials-with-prescribed-constant-coefficient`.

  Rewrite every prerequisite that names them.
- **Terras.** Move `FF.4/terras-graph-ramanujan` to FF.5 as `FF.5/terras-graph-ramanujan`, with its gap (Katz's estimate), and rewrite its prerequisite `FiniteFieldsAndCharacterSums:FF.2` as the node it will use once decomposed.
- **Coverage notes.** Change the FF.3 note's "certified point counting" clause to point to FF.3:point-counting. Add a coverage entry for the new stage.

### Not done, and why

- **The graph is not regenerated here.** This job may not edit `data/atlas.json`. The depths above are the result of the listed edits on the assembled graph.
- **The review's second alternative is not taken.** FF.3 could have kept point counting while a new early substage took factorization. That would have moved the RS-03 edges FF.3 → CN.1 and FF.3 → CN.2, which are the ones that must become early. Keeping them on FF.3 and extracting point counting changes fewer records.

## /2 (medium, missing): point counts beyond elliptic curves have no supplier for their error bound

### What the verifier corrected

- Confirmed: WC.5 states the all-extension curve bound and the Betti-number bound, and no path WC.5 → FF.3 exists. RS-03 supplies the elliptic case only.
- Import WC.5 into the point-counting component of /1, keeping smoothness, projectivity, geometric connectedness and the dimension and coefficient conventions.
- The curve statement is |#C(F_{q^r}) − (q^r + 1)| ≤ 2g q^{r/2}. Open or singular varieties need their own statement.
- The pinned elliptic identities are not inequalities.
- Do not take the scope-restriction alternative.

### State on main (701638e0)

- **WC.5** (`content/campaign/WeilConjectures/README.md`, "### WC.5 — Point-count bounds and curves") states the estimate for "a smooth projective geometrically connected d-dimensional variety", |N_r − (1 + q^{dr})| ≤ Σ_{i=1}^{2d−1} b_i q^{ir/2}, and "|N_r−(q^r+1)|≤2g q^{r/2}" in dimension one.
- Its consumers in the assembled graph do not include any FF stage.
- **The packet plans two bounds**:
  - `FF.3/hasse-error-bound-for-point-counts`, (q + 1 − #W(F))² ≤ 4q, from Tau Ceti's elliptic layer 3;
  - `FF.3/weil-error-bound-for-hyperelliptic-counts`: "For q odd and f ∈ F[X] square-free of degree d ≥ 1: |#{(x, y) ∈ F² : y² = f(x)} − q| ≤ (d − 1)√q", from `FF.2/weil-bound-multiplicative`.
- **The hyperelliptic bound is correct.** The count is q + Σ_x χ(f(x)), and f squarefree has m = d distinct roots and is not c·g², so |Σ| ≤ (d − 1)√q.
- **What is missing.** Nothing imports the 2g bound or the Betti bound, and the packet has no request to WC.5 except `WC.5:power-sum-converse`.

### Fix

**2.1 Edge.** WC.5 → FF.3:point-counting (in 1.2's Inputs line and 1.5's records). Cycle test: acyclic. WC.5 has depth 27, so FF.3:point-counting has depth 30. That is the reason /1 extracts it.

**2.2 Packet request** (blueprint). Add to `requests`:
- `supplier`: `WeilConjectures:WC.5`.
- `need`:
  > For a smooth projective geometrically connected curve C of genus g over F_q: |#C(F_{q^r}) − (q^r + 1)| ≤ 2g q^{r/2} for every r ≥ 1, with b_1 = 2g identified through the curve/Jacobian cohomology supplier. For a smooth projective geometrically connected variety X of dimension d over F_q with ℓ-adic Betti numbers b_i: |#X(F_{q^r}) − (1 + q^{dr})| ≤ Σ_{i=1}^{2d−1} b_i q^{ir/2} for every r ≥ 1. No statement is requested for open, singular or non-geometrically-connected varieties; those counts use FF.2/lang-weil-estimate and FF.2/uniform-lang-weil-estimate.
- `neededBy`: two new nodes under FF.3:point-counting.
  - `FF.3/curve-point-count-error-bound`: a certified count of a smooth projective geometrically connected curve of genus g lies in [q^r + 1 − 2g q^{r/2}, q^r + 1 + 2g q^{r/2}].
  - `FF.3/variety-point-count-error-bound`: the same for X with the Betti bound.

  Each takes its test from WC.5: for an elliptic curve (g = 1) the curve bound is the Hasse bound, agreeing with `FF.3/hasse-error-bound-for-point-counts`.
- For y² = f(x) with f squarefree of degree d, the smooth projective model has genus ⌊(d − 1)/2⌋.
  - For odd d it adds one point at infinity. The affine bound (d − 1)√q then coincides with the 2g bound, since 2g = d − 1.
  - For even d, the smooth model has 0 or 2 rational points at infinity, as the leading coefficient is a nonsquare or a square. The 2g bound then gives a count within (d − 2)√q + 1 of q.

  Record this comparison as a test of `FF.3/curve-point-count-error-bound`. It checks the conventions at infinity.

### Not done, and why

- **No counting algorithm for general curves is added.** The finding asks for the error-bound supplier. Certified counts for a general curve (enumeration of a plane model plus its places at infinity) remain FF.3:point-counting's open coverage. They are listed there for the blueprint job.

## /3 (high, missing): the Grothendieck–Ogg–Shafarevich formula and the Artin–Schreier Swan conductor have no owner

### What the verifier corrected

- Confirmed. SGA 4½ [Sommes trig.] 3.2–3.3 (printed pp. 189–191) supply the Euler-characteristic and conductor inputs, and 3.4 shows how they fix the dimension used by the bound. EDC.2/4 and R01.3 do not specify this contract.
- **The formula.** Correct it to χ_c(U, F) = rank(F)(2 − 2g − |D|) − Σ_{x∈D} Sw_x(F). Here U = C ∖ D over an algebraically closed field, C is smooth projective connected, and F is lisse ℓ-adic with ℓ different from the characteristic.
- **Owners.** Request one general owner in the étale-duality direction and an equal-characteristic local-conductor supplier. A new stage needs registration, not an invented prerequisite.
- **The Artin–Schreier conductor.** Sw_x is the reduced pole order v*, after f ↦ f + h^p − h. It equals the original pole order when that order is prime to p.
- **The polynomial alternative.** The degree-(d − 1) route does not cover the Kloosterman function x + a/x; keep its two-pole conductor calculation.

### State on main (701638e0)

- **No atlas stage states the formula.** A search of stage texts for Ogg, Euler–Poincaré and Swan finds R01.3 (local conductors of Galois representations over number fields and their completions), the Néron–Ogg–Shafarevich criterion and unrelated stages.
- **R01.3** (`content/campaign/ArithmeticGaloisRepresentations/README.md`, "## R01.3. Artin and Swan conductors") sits in a roadmap whose scope is to "work over number fields and their completions". Equal characteristic is not covered.
- **The FF packet has done its half.**
  - Nodes: `FF.2/modified-pole-order`, `FF.2/swan-conductor-of-artin-schreier-sheaf` ("At x with v*_x(f) > 0 it is wildly ramified with Swan conductor Sw_x(L(ψf)) = v*_x(f)", Sommes trig. (3.5.4)), `FF.2/h1c-conductor-bound` and `FF.2/artin-schreier-sum-on-curve-bound`, whose dimension is 2g − 2 + Σ[k(x):F](1 + v*_x(f)).
  - Request 10, to `EtaleDualityAndPerverseSheaves:EDC.2`, is the formula with the review's hypotheses.
  - Request 11, to R01.3, is "Swan conductors in equal characteristic … (e.g. F̄_q((t)))".
  - A `restructure` rescope proposes "a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2".
  - The classical one-variable bounds use the elementary L-function degree (`FF.2/additive-l-function-is-polynomial`) and do not depend on the formula.
- **Kloosterman is elementary in the packet.** `FF.2/kloosterman-l-function` proves exp(Σ K_ν T^ν/ν) = 1 + K T + q T² by the monic L-series (Sommes trig. Exemple 3.7; Kowalski Remark 2.11). So the Kloosterman bound does not wait for the formula.
- **The formula has a new routed item.** Since the red team, `PAPER-DELIGNE-74` route 4 (accepted, to FF.2) carries `PAPER-DELIGNE-74/s8-GOS-formula`, "Grothendieck–Ogg–Shafarevich (Euler–Poincaré) formula … (cited: Raynaud, Bourbaki 286)", status `missing`. It sends to FF.2 a theorem that is not finite-field mathematics.
- **Other consumers.**
  - PAPER-FRESAN-SABBAH-YU-22/60 (route 2, KloostermanMomentsAndPotentialAutomorphy) computes deg Z_k through the formula.
  - The RT-AREA-etale fixes /1 brief (Katz–Sarnak 10.1.12) also says "Request the Euler–Poincaré formula from its owner".

**Source read for this fix.** Raynaud, "Caractéristique d'Euler-Poincaré d'un faisceau et cohomologie des variétés abéliennes", Séminaire Bourbaki exp. 286 (1966), pp. 129–147. Numdam, https://www.numdam.org/item/SB_1964-1966__9__129_0/ (PDF sha256 `fd0cf10b653f40e43f2ef7211fed427b7c5c80022c42bedecbf1544b050baa40`), read 29 September 2026, pp. 129–136.
- **Setting (p. 129).** "Soit k un corps algébriquement clos de caractéristique p, et soit C une courbe algébrique irréductible, lisse et projective sur k."
- **Théorème 1 (p. 133)** is stated for "un R-faisceau constructible, de ℓ-torsion" with ℓ ≠ p, in K(R), with the Swan module at each point. The text then specialises (formula (2 ter)) to U = C − S, with S containing the points where A is ramified.
- **The proof (§4, pp. 133–136)** reduces by Lemme 1 (finite separable covers C′ → C, "la formule de Hurwitz") and Lemme 2 (Galois covers) to Artin–Brauer induction and Swan's theorem.
- **Not recoverable.** The displayed formulas are images, and their text layer is lost. The formula below is taken from the review's reading of Sommes trig. (3.2.1), which the review checked against the page image.

### Fix

**3.1 `content/campaign/EtaleDualityAndPerverseSheaves/README.md`: new substage after EDC.2.** Insert before "## EDC.3. Gysin maps and cycle classes":

> <a id="stage-EDC.2:euler-characteristic"></a>
> **EDC.2:euler-characteristic.** Prove the Grothendieck–Ogg–Shafarevich formula. Let k be algebraically closed of characteristic p, C a smooth projective connected curve of genus g over k, D ⊂ C a finite set of closed points, U = C ∖ D, ℓ ≠ p, and F a lisse sheaf on U. The coefficients are either finite free over a finite local ring of residue characteristic ℓ, or a lisse E_λ-sheaf. Then
> χ_c(U, F) = rank(F)·(2 − 2g − |D|) − Σ_{x∈D} Sw_x(F),
> where Sw_x is the Swan conductor of the restriction of F to the inertia group at x (equal characteristic, from ArithmeticGaloisRepresentations R01.3).
>
> Prove the torsion form first, as Raynaud's Théorème 1 does:
> - reduction to a finite Galois cover trivialising F;
> - the Hurwitz formula with the different for finite separable covers of curves (Tau Ceti AlgebraicCurves);
> - Artin–Brauer induction and Swan's theorem on the Swan representation.
>
> Pass to E_λ-coefficients through a lattice and reduction modulo λ. Sw_x is unchanged, because wild inertia is pro-p and ℓ ≠ p.
>
> Tests:
> - F constant of rank r gives r(2 − 2g − |D|);
> - on A¹ = P¹ ∖ {∞}, the Artin–Schreier sheaf L_ψ(x^d) with p ∤ d has Sw_∞ = d and χ_c = 1 − d (Weil I 8.11–8.12);
> - on G_m, L_ψ(x + a/x) has Sw_0 = Sw_∞ = 1 and χ_c = −2 (Kloosterman).
>
> Source: Raynaud, Séminaire Bourbaki exp. 286 (1966), Théorème 1 and (2 ter), p. 133, proof pp. 133–136 (Numdam); SGA 4½ [Sommes trig.] (3.2.1).
>
> **Dependencies:** EDC.2 (Poincaré duality and cohomology of curves), ArithmeticGaloisRepresentations R01.3 (Swan conductor, extended to equal characteristic).

- **Stage record** `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic`, `requires` [EDC.2, R01.3].
- **Edges:** EDC.2 → it, R01.3 → it and it → FF.2. All three cycle tests are acyclic. The new stage has depth 19.
- **FF.2's Inputs line** gains `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic`, alongside the FA.5 of RT-AREA-etale /7.
- **The Hurwitz input.** Link the AlgebraicCurves layer that proves Hurwitz with the different (layer 8, "constant field extensions, Galois ramification and inseparability") when the EDC blueprint names it. It is upstream, and the edge cannot close a cycle.

**3.2 R01.3 (now).** After "Define conductors using the ramification filtration," insert:
> for a complete discretely valued field with perfect residue field, in mixed or equal characteristic (in particular k((t)) with k algebraically closed of characteristic p),

This is the packet's request 11, made into the stage's scope. Without it, R01.3 → EDC.2:euler-characteristic would be the "invented prerequisite" the review forbids. The upper-numbering filtration it uses is Tau Ceti LocalFieldsRamification layer 3 (packet request 20).

**3.3 FF packet** (blueprint).
- Nodes `FF.2/h1c-conductor-bound`, `FF.2/artin-schreier-sum-on-curve-bound` and `FF.2/deligne-cohomology-of-polynomial-sheaf`: replace the stage prerequisite `EtaleDualityAndPerverseSheaves:EDC.2` (used for the formula) by `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic`, and keep EDC.2 where Poincaré duality is used.
- Request 10: change `supplier` to the new stage.
- Remove the `restructure` rescope entry that proposed it, and the gap "No atlas stage owns the Grothendieck–Ogg–Shafarevich Euler characteristic formula". Both are now answered.
- `FF.2/swan-conductor-of-artin-schreier-sheaf`, `hypotheses`: replace "Swan conductor in the sense of ArithmeticGaloisRepresentations:R01.3 for the local field at x (equal characteristic, residue field extended to F̄)." with
  > Swan conductor in the sense of ArithmeticGaloisRepresentations R01.3 in equal characteristic. v*_x(f) is the pole order at x after replacing f by f + h^p − h with h chosen to minimise it (0 if f can be made regular at x); it equals the pole order of f when that order is prime to p.
- `FF.2/artin-schreier-sum-on-curve-bound`, `tests`: add
  > Kloosterman: X₀ = P¹, f = x + a/x (a ≠ 0), simple poles at 0 and ∞, v* = 1 at both; dim H¹ = −2 + 2 + 2 = 2 and |K(1, a)| ≤ 2√q, agreeing with FF.2/kloosterman-l-function.

  This keeps the review's two-pole calculation beside the elementary route.

**3.4 Routes** (verdict).
- **`PAPER-DELIGNE-74.result.json`.** Remove `PAPER-DELIGNE-74/s8-GOS-formula` from route 4's `items`. Add a route:
  - `"route": "source"`, `"roadmap": "EtaleDualityAndPerverseSheaves"`, `"stages": ["EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic"]`, `"items": ["PAPER-DELIGNE-74/s8-GOS-formula"]`;
  - `reason`: "Weil I (8.11) uses the Euler–Poincaré formula for lisse sheaves on curves, citing Raynaud; its owner is the substage EDC.2:euler-characteristic (RT-AREA-finitefields/3)."

  Record a verdict for the new route. It becomes applicable once the substage is in the atlas.
- **`PAPER-FRESAN-SABBAH-YU-22.result.json`, route 2 `brief`.** After the Artin–Schreier import added by RT-AREA-etale /14, add: "the Grothendieck–Ogg–Shafarevich formula from EtaleDualityAndPerverseSheaves EDC.2:euler-characteristic (for deg Z_k, item 60);". The FSY red team (#4184) is open, and its fixer should keep this edit.

The link to KloostermanMomentsAndPotentialAutomorphy is through this brief. That roadmap is a pending design and is not in the assembled graph, so no cycle test is possible. Its brief imports only from EDC and FF, both upstream, so the edge cannot close a cycle among existing stages.

### Not done, and why

- **The FF packet keeps its elementary one-variable route.** This is the finding's option (3). The general bound for rational functions on a curve still needs 3.1.
- **Raynaud's displayed formulas were not transcribed.** Their text layer is lost. The corrected statement rests on the review's reading of Sommes trig. (3.2.1), and its rank term matches Raynaud's (2 ter) setting.

## /4 (medium, missing): Deligne's several-variable bound

### What the verifier corrected

- Confirmed: Weil I 8.4–8.13 (pp. 302–306) distinguishes the (d − 1)^n q^{n/2} theorem from Sommes trig. 3.8.
- State q = p^a, n ≥ 1, ψ nontrivial, d ≥ 1 prime to p, and a smooth leading-form hypersurface.
- Add 8.5(i), and also the perfect pairing and the smooth proper compactification of 8.5(ii)–(iii).
- The proof uses local models, resolution of the surface singularities, a family argument, Künneth and the one-variable conductor calculation (8.6–8.13).
- WC.3 and a dimension formula alone do not close it. Route shared geometric inputs to their owners, record requests where no node exists, and keep the weaker theorem.

### State on main (701638e0)

**The packet has the theorem, 8.5(i) and 8.5(ii).**
- `FF.2/deligne-n-variable-bound`: "|Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2}", hypotheses "p ∤ d; Q_d smooth; ψ ≠ 1", source Weil I Théorème 8.4. Its prerequisites are DWP.7 and `FF.2/affine-concentration-criterion`: Weil II weights with the forget-supports isomorphism, in place of Weil I's use of (1.7) on a compactification.
- `FF.2/deligne-cohomology-of-polynomial-sheaf` (8.5(i)).
- `FF.2/deligne-duality-for-polynomial-sheaf` (8.5(ii)).
- `FF.2/elementary-n-variable-bound`: Sommes trig. Proposition 3.8, (d − 1)q^{n−1/2}, for P not of the form Q^p − Q + c.

**8.5(iii) and 8.6–8.10 are a gap.** The packet's gap "Weil I Lemma 8.5 rests on a relative compactification by Zariski's resolution procedure and on local constancy in the family …" makes 8.4 conditional. There is no node for 8.5(iii) or 8.6–8.9.

**The accepted DELIGNE-74 route 4** carries all of 8.4–8.12 as items: s8-8.5-iii-compactification, s8-8.9-zariski-resolution, s8-8.10-relative-compactification, s8-8.10-local-constancy, s8-8.10-kunneth-separation and s8-8.11-*.

**Weil I, read** (Numdam, https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf, sha256 `8392b345…42e5`, the red team's copy, read 29 September 2026, pp. 302–306):
- Théorème (8.4): "(i) d est premier à p; (ii) l'hypersurface H₀ dans P^{n−1} définie par Q_d est lisse."
- Lemme (8.5): "(iii) X₀ est un ouvert d'une variété projective non singulière Z₀."
- (8.9): "le procédé suivant (dû à Zariski) permet de résoudre les singularités de surfaces : alternativement, on normalise et on éclate le lieu singulier (réduit)".
- (8.10): "Les propriétés de Z_S assurent que les R^i(fu)_!E_λ … sont des faisceaux localement constants sur S … il suffit de prouver (8.5) (i), (ii) pour un polynôme Q particulier. On prendra Q = Σ x_i^d".

**Checks of the packet's statements.**
- For d = 1 the bound is 0, correct for a nonzero linear form.
- For n = 1, H₀ ⊂ P⁰ is empty and hence smooth, and the bound is Weil's (d − 1)q^{1/2}.

### Fix (blueprint)

Add to FF.2:
- **`FF.2/deligne-smooth-compactification`** (lemma).
  - Statement: under 8.4's hypotheses, the Artin–Schreier cover X₀ : T^p − T = Q of A^n is an open subscheme of a smooth projective Z₀ over F_q, with Z₀ ∖ X₀ a divisor with normal crossings.
  - More generally, over the space S of polynomials of degree ≤ d with smooth leading form, X_S has a relative compactification Z_S → S, proper and smooth, with relative normal-crossings boundary.
  - Sources: Weil I (8.5)(iii), (8.6)–(8.9) and (8.10), pp. 303–305.
  - Proof steps: Lemme 8.7 (smooth away from the preimage of H₀, using (d, p) = 1), Lemme 8.8 (the local model Q = z₁^{−d}z₂), 8.9 (Zariski's procedure commutes with étale localisation and with products with a smooth space) and 8.10.
- **The local constancy step.** Make `FF.2/deligne-cohomology-of-polynomial-sheaf` depend on this node through the local-constancy step (8.10). Keep its Künneth reduction to Q = Σ x_i^d and the n = 1 computation χ_c = 1 − d, which now comes from EDC.2:euler-characteristic (/3).
- **Requests.**
  - To `SchemeAndStackFoundations:SF.2` (extending the packet's request 8): local constancy of R^i f_! for f proper smooth with a relative normal-crossings divisor and tame ramification along it. Weil I uses this in 8.10.
  - A note for the maintainer: resolution of spaces that are étale-locally smooth over a fixed normal surface, by Zariski's alternating normalisation and blow-up, has no owner in the atlas. It needs a stage in SchemeAndStackFoundations (or a Part II) before the node can close. Until then `FF.2/deligne-n-variable-bound` stays conditional. `FF.2/elementary-n-variable-bound` does not depend on it and stays unconditional, as the review requires.

### Not done, and why

- **The Weil II weight argument is kept.** The packet takes weights from DWP.7 and the affine-concentration criterion, not from Weil I's (1.7) applied to Z₀. That route is sound: H^n_c is mixed of weights ≤ n, and by 8.5(ii) it is isomorphic to H^n, which by duality has weights ≥ n. So 8.5(iii) is needed only inside the proof of 8.5(i)–(ii).

## /5 (medium, error): the degenerate multiplicative case is misstated

### What the verifier corrected

- Confirmed. Fix an exact character order d > 1, the zero-extension convention and a nonzero f.
- The exceptional case is f = c·g^d geometrically with c ≠ 0, not an arbitrary perfect power.
- Tests: over F₇ with a cubic χ, x² has sum 0; 3x³ has six equal nonzero values though it is not a cube over F₇. Distinguish base-field from geometric powers.
- The bound with m distinct geometric roots has constant m − 1.
- A mixed sum needs its own hypotheses.

### State on main (701638e0)

- **The README is unchanged.** FF.2 Acceptance still reads: "Artin-Schreier-trivial functions and multiplicative perfect powers are tested as degenerate cases rather than receiving a false square-root bound."
- **The packet is already right.**
  - `FF.2/weil-bound-multiplicative`: "χ … of order e ≥ 2 and g ∈ F[X] not of the form c·h^e with c ∈ F̄, h ∈ F̄[X]; … |Σ χ(g(x))| ≤ (m − 1)√q".
  - `FF.2/multiplicative-perfect-power-sum`: the degenerate value "χ(c)^{[L:F]}·(|L| − #{x ∈ L : h(x) = 0})" and the descent "c′·k^e with c′ ∈ F̄ … can be written c·h^e with c ∈ F^×, h ∈ F[X] monic", with the x² cubic test.
  - `FF.2/weil-bound-mixed`: ψ ≠ 1, p ∤ n = deg f ≥ 1, g nonzero with m roots, bound (m + n − 1)√q, χ possibly trivial.
- **The audit was corrected today** (FIX-RT-AUDIT-19, #4481).

**Checks.**
- Descent: if f = c′k^e over F̄, the monic e-th root k is unique and Galois-stable, so it lies in F_q[X] and c′ is f's leading coefficient.
- Degenerate value: χ(c·g(x)^d) = χ(c) wherever g(x) ≠ 0.
- Mixed bound when χ is trivial: the sum drops the ≤ m roots, and |Σψ(f)| + m ≤ (m + n − 1)√q.

### Fix (now)

**README, FF.2 Acceptance.** Replace "Artin-Schreier-trivial functions and multiplicative perfect powers are tested as degenerate cases rather than receiving a false square-root bound." with:

> Degenerate cases are tested rather than receiving a false square-root bound.
>
> **Additive.** Phases of the form h^p − h + c are Artin–Schreier trivial.
>
> **Multiplicative.** Let χ have exact order d > 1, with χ(0) = 0. The degenerate polynomials are f = c·g^d with c ∈ F̄^× and g ∈ F̄[X]; equivalently c ∈ F_q^× and g ∈ F_q[X] monic, including c not a d-th power in F_q. For these, Σ_{x∈F_q} χ(f(x)) = χ(c)(q − #{x ∈ F_q : g(x) = 0}). For every other nonzero f with m distinct roots in F̄, |Σ_x χ(f(x))| ≤ (m − 1)q^{1/2}.
>
> Control tests:
> - x² with χ cubic is a perfect power but not degenerate; its sum is 0;
> - 3x³ over F₇ with χ cubic is degenerate but not a cube over F₇.
>
> **Mixed.** Mixed sums Σ χ(g(x))ψ(f(x)) carry their own hypothesis: ψ ≠ 1, p ∤ deg f = n ≥ 1, and g ≠ 0 with m distinct roots in F̄. Their bound is (m + n − 1)q^{1/2}, with no degeneracy condition on g.

Nothing changes in the packet.

## /6 (medium, library-claim): FF.0 re-derives built finite-field structure

### What the verifier corrected

- Confirmed for the baseline parts, with a narrower repair. Cite these at the pins with their hypotheses: `FiniteField.orderOf_frobeniusAlgHom`, `Extension.exists_frob_pow_eq`, `nonempty_algHom_iff_finrank_dvd`, `algEquivOfCardEq`, `algebraMap_trace_eq_sum_pow`, `algebraMap_norm_eq_prod_pow`, `norm_surjective`, `Algebra.trace_surjective` and `IsGalois.normalBasis`, with the fixed-subfield comparisons.
- Do not replace the EXT nodes wholesale. The intermediate-field/divisor order correspondence, minimal-polynomial adapters and computable inverse-map and normal-basis certificates need their own statements.
- Keep the census and tensor-product targets. An existential library construction is not a certified algorithm.
- Shoup 19.11–19.12 (p. 514) confirms the census bounds.

### State on main (701638e0)

**Declarations read at the pins** (Mathlib 082e2d3, Tau Ceti f790474; file and line from the declaration index, statements opened):

| Declaration | Location |
|---|---|
| `FiniteField.frobeniusAlgEquivOfAlgebraic` | Mathlib/FieldTheory/Finite/Basic.lean:363 |
| `FiniteField.orderOf_frobeniusAlgHom` | Mathlib/FieldTheory/Finite/Basic.lean:376 |
| `FiniteField.Extension.exists_frob_pow_eq` | Mathlib/FieldTheory/Finite/Extension.lean:120 |
| `FiniteField.algEquivExtension` | Mathlib/FieldTheory/Finite/Extension.lean:130 |
| `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X` | Mathlib/FieldTheory/Finite/Extension.lean:181 |
| `FiniteField.algEquivOfCardEq` | Mathlib/FieldTheory/Finite/GaloisField.lean:263 |
| `FiniteField.algebraMap_norm_eq_pow` | Mathlib/FieldTheory/Finite/GaloisField.lean:224 |
| `FiniteField.unitsMap_norm_surjective` | Mathlib/FieldTheory/Finite/GaloisField.lean:236 |
| `FiniteField.norm_surjective` | Mathlib/FieldTheory/Finite/GaloisField.lean:251 |
| `FiniteField.nonempty_algHom_iff_finrank_dvd` | Mathlib/FieldTheory/Finite/GaloisField.lean:330 |
| `FiniteField.algebraMap_trace_eq_sum_pow` | Mathlib/FieldTheory/Finite/Trace.lean:49 |
| `FiniteField.algebraMap_norm_eq_prod_pow` | Mathlib/FieldTheory/Finite/Trace.lean:59 |
| `Algebra.trace_surjective` | Mathlib/RingTheory/Trace/Basic.lean:521 |
| `IsGalois.normalBasis` | Mathlib/FieldTheory/Galois/NormalBasis.lean:120 |
| `IsGalois.intermediateFieldEquivSubgroup` | Mathlib/FieldTheory/Galois/Basic.lean:350 |
| `TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap` | TauCeti/FieldTheory/Finite/FrobeniusFixed.lean:72 |
| `TauCeti.eq_frobeniusFixedSubfield_of_natCard` | TauCeti/FieldTheory/Finite/SepClosedSubfield.lean:105 |

The last Tau Ceti statement reads "A subfield with p ^ n elements of a field of characteristic p is the subfield fixed by the p ^ n-power Frobenius".

**The README is unchanged.** FF.0 still says "Build certified presentations, Frobenius, subfields, trace, norm, normal bases and tensor decompositions".

**The packet (FF.0)** already cites 14 of the 16 declarations of the finding and review in `baseline`. The missing two are `FiniteField.Extension.exists_frob_pow_eq` and `TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap`. Its FF.0 nodes are the new work:
- Rabin's criterion and certificate;
- certified presentations with explicit inverse, root-certificate embeddings and change of presentation;
- factorisation over an extension;
- the tensor product;
- the Frobenius minimal polynomial;
- the normal-element criterion and the Frobenius normal basis.

It has **no node for the intermediate-field ↔ divisor correspondence**. The census is in FF.3 (moved to FF.0 by /1).

**The EXT-08 packet** still has the three nodes the finding names, citing only Shoup (handled in /10).

### Fix

**6.1 README, FF.0 (now).** Replace "Build certified presentations, Frobenius, subfields, trace, norm, normal bases and tensor decompositions; reuse existing finite-field classification and cardinality results." with:

> Import as built (Mathlib): finite-field classification and cardinality; the Frobenius automorphism and its exact order (`FiniteField.frobeniusAlgEquivOfAlgebraic`, `FiniteField.orderOf_frobeniusAlgHom`); subfield embeddings and uniqueness (`FiniteField.nonempty_algHom_iff_finrank_dvd`, `FiniteField.algEquivOfCardEq`, `FiniteField.algEquivExtension`); the trace and norm formulas with surjectivity (`FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.algebraMap_norm_eq_prod_pow`, `FiniteField.norm_surjective`, `Algebra.trace_surjective`); and normal-basis existence (`IsGalois.normalBasis`).
>
> Build what they lack:
> - the census X^{q^n} − X = ∏_{d|n} ∏_{deg f = d, f monic irreducible} f, with the exact count of monic irreducibles and the bounds q^n/(2n) ≤ Π_q(n) ≤ q^n/n, also for a prescribed nonzero constant coefficient;
> - the intermediate-field ↔ divisor correspondence as a stated order isomorphism;
> - computable certified presentations with explicit inverse maps, root-certificate embeddings and Rabin irreducibility certificates;
> - normal-basis construction certificates;
> - the tensor decomposition F_{q^m} ⊗_{F_q} F_{q^n} ≅ F_{q^{lcm(m,n)}}^{gcd(m,n)};
> - q-linearized polynomials (/13).
>
> An existential or noncomputable library construction is not a certified algorithm.

The tensor formula was checked. Over F_{q^m}, the minimal polynomial of a generator of F_{q^n} splits into gcd(m, n) irreducible factors of degree n/gcd(m, n). The factors are therefore fields of degree m·n/gcd(m, n) = lcm(m, n) over F_q.

**6.2 Packet (blueprint).**
- **`baseline.declarations`:** add `mathlib:FiniteField.Extension.exists_frob_pow_eq` (line 120) and `tauceti:TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap` (line 72).
- **New node `FF.0/intermediate-field-divisor-correspondence`** (theorem).
  - Statement: let F ⊆ E be finite fields, q = |F| and n = [E : F]. Then K ↦ [K : F] is an order isomorphism from `IntermediateField F E` to the divisors of n ordered by divisibility. Its inverse sends d | n to {x ∈ E : x^{q^d} = x}. So K ⊆ K′ iff [K : F] | [K′ : F].
  - Proof: Galois correspondence (`IsGalois.intermediateFieldEquivSubgroup`); the Galois group is cyclic of order n, generated by Frobenius (`FiniteField.orderOf_frobeniusAlgHom`); subgroups of a cyclic group correspond to divisors; the fixed field is identified by `TauCeti.eq_frobeniusFixedSubfield_of_natCard`.
  - Source: Shoup v2, Theorem 19.14 (the packet's `SHOUP.V2`).
  - Test: E = F_{2^6}, whose intermediate fields F_2, F_4, F_8 and F_64 correspond to 1, 2, 3 and 6.
- **The census:** moved to FF.0 by /1.6.

## /7 (medium, library-claim): FF.1 re-plans built Gauss and Jacobi identities

### What the verifier corrected

- Confirmed for the elementary identities, not the whole cohomological node. Keep each hypothesis:
  - the square identity is quadratic;
  - the Jacobi quotient needs the stated nontriviality;
  - the power formula needs order ≥ 2;
  - primitivity, the coefficient-characteristic restriction and the trivial-character exceptions stay explicit.
- Reuse the reciprocity comparison. Keep the convention dictionary and the modulus adapter.
- The proposed deletion is wrong: SGA 4½ 4.2–4.4 also constructs Frobenius realisations and a duality compatibility. Keep that content under FF.2 (as in /9), and remove only the duplicate elementary proof.

### State on main (701638e0)

**Read at the pin** (Mathlib 082e2d3):

| Declaration | Location | Statement and hypotheses |
|---|---|---|
| `gaussSum` | Mathlib/NumberTheory/GaussSum.lean:72 | "∑ a, χ a * ψ a" |
| `gaussSum_mul_gaussSum_eq_card` | Mathlib/NumberTheory/GaussSum.lean:188 | (hχ : χ ≠ 1) (hψ : IsPrimitive ψ) |
| `gaussSum_sq` | Mathlib/NumberTheory/GaussSum.lean:222 | hχ₁ : χ ≠ 1, hχ₂ : IsQuadratic χ, ψ primitive, "= χ (-1) * Fintype.card R" |
| `jacobiSum_one_one` | Mathlib/NumberTheory/JacobiSum/Basic.lean:120 | "#F-2" |
| `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum` | Mathlib/NumberTheory/JacobiSum/Basic.lean:193 | (Fintype.card F : F′) ≠ 0, χ * φ ≠ 1, ψ primitive |
| `jacobiSum_mul_jacobiSum_inv` | Mathlib/NumberTheory/JacobiSum/Basic.lean:203 | ringChar F′ ≠ ringChar F, χ, φ, χφ ≠ 1 |
| `gaussSum_pow_eq_prod_jacobiSum` | Mathlib/NumberTheory/JacobiSum/Basic.lean:342 | 2 ≤ orderOf χ, ψ primitive |
| `quadraticChar_card_card` | Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:77 | |
| `Char.card_pow_card` | Mathlib/NumberTheory/GaussSum.lean:303 | |
| `legendreSym.quadratic_reciprocity` | Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107 | |
| `AddChar.sum_eq_ite` | Mathlib/Algebra/Group/AddChar.lean:329 | |
| `MulChar.sum_eq_zero_of_ne_one` | Mathlib/NumberTheory/MulChar/Basic.lean:607 | |
| Tau Ceti `CommGroup.sum_monoidHom_apply_eq_ite` | TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104 | column orthogonality |

**The packet already plans the new work.**
- It cites the built identities in `baseline`, except `quadraticChar_card_card` and `legendreSym.quadratic_reciprocity`.
- `FF.1/trivial-character-conventions` is the convention dictionary. It covers Mathlib's χ(0) = 0 with jacobiSum 1 1 = q − 2 against the classical ε(0) = 1 with J^cl(ε, ε) = q, and the Katre/Conrad sign.
- `FF.1/gauss-sum-absolute-value` gives ‖g‖ = √q for complex nontrivial χ and ψ.
- Deligne's τ(χ, ψ) = −gaussSum χ⁻¹ ψ is stated in `FF.2/gauss-sum-frobenius-eigenvalue`.
- The packet has no cohomological proof of the product identity. Its Gauss-sum Frobenius realisation is in FF.2.

**The README is unchanged.** FF.1 still says "Construct additive and multiplicative characters, orthogonality, Gauss and Jacobi sums and their norm/product identities".

### Fix

**7.1 README, FF.1 (now).** Replace "Construct additive and multiplicative characters, orthogonality, Gauss and Jacobi sums and their norm/product identities; extend zero values consistently." with:

> Import as built, with their stated hypotheses (Mathlib):
> - additive and multiplicative characters and both orthogonality relations;
> - g(χ, ψ)g(χ⁻¹, ψ⁻¹) = q for χ ≠ 1 and ψ primitive;
> - g(χ, ψ)² = χ(−1)q for χ quadratic;
> - J(χ, φ) = g(χ, ψ)g(φ, ψ)/g(χφ, ψ) for χφ ≠ 1;
> - J(χ, φ)J(χ⁻¹, φ⁻¹) = q for χ, φ, χφ nontrivial and coefficients of characteristic other than p;
> - g(χ, ψ)^{ord χ} = χ(−1)q ∏_{i=1}^{ord χ−2} J(χ, χ^i) for ord χ ≥ 2;
> - the Gauss-sum proof of quadratic reciprocity.
>
> Build:
> - the convention dictionary: Mathlib's χ(0) = 0 with J(1, 1) = q − 2 against the classical ε(0) = 1 with J(ε, ε) = q, and Deligne's τ(χ, ψ) = −g(χ⁻¹, ψ);
> - the complex modulus |g(χ, ψ)| = q^{1/2};
> - the trace character, the norm and trace lifts and the Hasse–Davenport lifting relation;
> - Stickelberger's congruence and theorem;
> - for étale F_q-algebras, the split product identity of Gauss sums.
>
> No étale cohomology enters this stage: the cohomological realisations of Gauss sums are FF.2's.

**7.2 Packet (blueprint).** Add `mathlib:quadraticChar_card_card` (line 77) and `mathlib:legendreSym.quadratic_reciprocity` (line 107) to `baseline.declarations`, as the reciprocity comparison the classical consumers (CA.1, CA.4) import.

**7.3 EXT-08 packet.** Handled with /9–/10: its geometric content goes to FF.2, and its elementary product proof is replaced by the citation.

### Not done, and why

- **RS-03's FF.1 reason** ("field-specific trace, norm and reciprocity comparisons remain genuine work") is an accepted record. It is not rewritten here. The README narrowing is enough, and RT-RS-03 (pending) may take it up.

## /8 (medium, missing): the Hasse–Davenport lifting relation

### What the verifier corrected

- Confirmed for the missing explicit theorem and locator, with credit for the partial EXT node. SGA 4½ Theorem 1.15 (p. 177) states and proves the relation; 4.5 (pp. 197–198) discusses the split étale-algebra identity.
- Complete or link the existing node rather than create a competing one.
- In Mathlib's convention, g(χ∘N, ψ∘Tr) = (−1)^{n−1}g(χ, ψ)^n for n ≥ 1 and ψ nontrivial. Deligne uses τ(χ, ψ) = −g(χ⁻¹, ψ). Trivial χ is allowed with the agreed zero extension.
- Keep a cohomological proof in FF.2. An elementary FF.1 proof needs its own source, actually read; do not certify the Ireland–Rosen locator unread.
- A product formula needs a precise statement and source.

### State on main (701638e0)

**The lifting relation is planned** (the packet postdates the red team). `FF.1/hasse-davenport-lifting` reads:
- "−gaussSum (liftNorm E χ) (liftTrace E ψ) = (−gaussSum χ ψ)^n, i.e. G(χ∘N_{E/F}, ψ∘Tr_{E/F}) = (−1)^(n−1) G(χ, ψ)^n";
- with the hypothesis "χ ≠ 1 or ψ ≠ 1";
- sourced to Conrad, "L-functions for Gauss and Jacobi sums", Theorem 3.1, p. 3, and Conrad, "Gauss and Jacobi sums", Appendix, p. 19. Both were read on 25 September (sha256 recorded in the packet).

Its elementary proof runs through `FF.1/hasse-davenport-weight`, `-degree-sums`, `polynomial-euler-product-recurrence` and `-orbit-sum`. `FF.2/gauss-sum-frobenius-eigenvalue` gives the cohomological reading: Frobenius of F_{q^ν} acts by τ(χ, ψ)^ν.

**The product relation is planned but open.** `FF.1/hasse-davenport-product-relation` states it from Conrad (A.6), and the packet's first gap records that no public proof was read.

**The EXT-08 packet's coverage** still says "Hasse-Davenport relation: the proof is in Sommes trig. 4.12 … and was not read".

**Checks.**
- The sign: from Deligne's τ(χ∘N, ψ∘Tr) = τ(χ, ψ)^n with τ = −g(χ⁻¹, ·), substituting χ⁻¹ gives the packet's form.
- The hypothesis:
  - for χ = 1 and ψ ≠ 1, both sides are 1, since g(1, ψ) = −1 in Mathlib;
  - for χ ≠ 1 and ψ = 1, both are 0, since χ∘N is nontrivial by `FiniteField.norm_surjective`;
  - for χ = ψ = 1 it fails, as the node says.
- The product relation at n = 2 is the duplication formula g(χ)g(χη) = χ(2)^{−2}g(χ²)g(η).

### Fix (blueprint)

- **EXT-08 coverage** (with /10). In `research/expansion/external/EXT-08/FiniteFieldsAndCharacterSums.json`, FF.1 coverage, replace "the proof is in Sommes trig. 4.12 (expose pp. 36-40 approx.) and was not read" with:
  > [Sommes trig.] Théorème 1.15, volume p. 177, states and proves τ(χ∘N_{F_{q^n}/F_q}, ψ∘Tr_{F_{q^n}/F_q}) = τ(χ, ψ)^n from 1.9.3 and 4.2; 4.5 (pp. 197–198) is the split étale-algebra identity and 4.12 its twisted-form reinterpretation. Planned as FF.1/hasse-davenport-lifting (elementary, Conrad) and FF.2/gauss-sum-frobenius-eigenvalue (cohomological).
- **FF packet, `FF.2/gauss-sum-frobenius-eigenvalue`, `sources`.** The node already cites "[Sommes trig.] 1.14-1.15, volume p. 177". Nothing more is needed. Its statement already uses Deligne's convention.
- **No competing node** is created. The Ireland–Rosen locator the red team suggested is not used; Conrad's texts were read.

## /9 (medium, error): the EXT-08 packet parents étale-cohomological nodes under FF.1

### What the verifier corrected

- Confirmed: the four nodes use character sheaves, compactly supported cohomology, Swan conductors or duality, beyond FF.1's inputs FF.0 and AC.0 (SGA 4½ 4.2–4.3, pp. 196–197).
- Put the finite-field geometric realisations and comparisons in FF.2, request general Lang-torsor infrastructure from its owner, and route the Euler-characteristic formula as in /3.
- Keep the elementary product/modulus comparison separate, so FF.1's reciprocity consumers do not inherit étale cohomology.
- Update ids and every link. In the étale-algebra node, the elementary product identity may stay early; its geometric reinterpretation must move.

### State on main (701638e0)

**The EXT-08 FF packet is unchanged** (13 nodes; see /10), and all four nodes are still under FF.1.

**In the FF blueprint packet the placement is already right:**
- the character sheaves, trace formula and Gauss-sum realisation are FF.2 nodes;
- FF.1 has only elementary statements;
- the étale-algebra Gauss sum of Sommes trig. §4 is unplanned (FF.2 coverage, `remaining`: "Section 4 … is FF.1's except for its cohomological realisation");
- the duality compatibility of Remarque 4.4 has no node.

### Fix

**9.1 EXT-08 packet** (`research/expansion/external/EXT-08/FiniteFieldsAndCharacterSums.json`, before promotion, /10).

| EXT-08 node | Change | Counterpart in the blueprint packet |
|---|---|---|
| `FF.1/lang-torsor-character-sheaves` | id → `FF.2/lang-torsor-character-sheaves`, parent FF.2 | `FF.2/artin-schreier-sheaf`, `FF.2/kummer-sheaf`, `FF.2/character-sheaf-trace-formula` |
| `FF.1/gauss-sum-cohomological-realization` | id → `FF.2/…`, parent FF.2 | `FF.2/gauss-sum-frobenius-eigenvalue` |
| `FF.1/gauss-sum-absolute-value-by-duality` | id → `FF.2/gauss-sum-realization-duality`, parent FF.2. The statement keeps the perfect Frobenius-equivariant pairing H¹_c(G_m, L_ψ ⊗ L_{χ⁻¹}) × H¹_c(G_m, L_{ψ⁻¹} ⊗ L_χ) → E_λ(−1) (Remarque 4.4), whose eigenvalue product τ(χ, ψ)τ(χ⁻¹, ψ⁻¹) = q is checked against `gaussSum_mul_gaussSum_eq_card` applied to χ⁻¹. The duplicate elementary proof of the product is replaced by that citation. | new node (9.2) |
| `FF.1/euler-poincare-with-swan-conductors` | removed from the packet; its content is the owner stage `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic` (/3) | request 10 |
| `FF.1/etale-algebra-gauss-sums-and-hasse-davenport-shape` | split: `FF.1/etale-algebra-gauss-sum-product` (the split-algebra product identity of 4.5.3, elementary) stays in FF.1; `FF.2/etale-algebra-gauss-sum-twisted-form` (the twisted-form reading, 4.12) goes to FF.2 | new nodes (9.2) |

**Links.**
- Rewrite every internal link to the new ids.
- The two links from `FF.1/euler-poincare-with-swan-conductors` become links from the stage `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic` into `FF.2/gauss-sum-cohomological-realization` and `FF.2/one-variable-artin-schreier-weil-bound`. `scripts/decompositions.py` holds them in `deferredLinks` until the stage exists, as the review of /10 notes.
- The link from `FF.0/norm-and-trace-surjectivity` goes to `FF.1/etale-algebra-gauss-sum-product`.

**The check that the product value is q.** Deligne's τ(χ, ψ) = −g(χ⁻¹, ψ), so τ(χ, ψ)τ(χ⁻¹, ψ⁻¹) = g(χ⁻¹, ψ)g(χ, ψ⁻¹), which is q by the Mathlib lemma applied to χ⁻¹.

**9.2 FF blueprint packet** (blueprint). Add:
- `FF.2/gauss-sum-realization-duality`, with the statement above and source [Sommes trig.] 4.2–4.4, pp. 196–197, and prerequisites `FF.2/gauss-sum-frobenius-eigenvalue` and `EtaleDualityAndPerverseSheaves:EDC.2` (Poincaré duality, already requested).
- `FF.1/etale-algebra-gauss-sum-product`:
  - for k = ∏ k_i a finite étale F_q-algebra, χ a character of k^× through the norms and ψ∘Tr_{k/F_q}, the Gauss sum of k is the product of the Gauss sums of the k_i;
  - elementary; source [Sommes trig.] (4.5.2)–(4.5.3), pp. 197–198;
  - the EXT-08 review's correction (the special case is for the split algebra) is kept.
- `FF.2/etale-algebra-gauss-sum-twisted-form`, source [Sommes trig.] 4.12, with the sign e(k).

The FF.2 coverage's "Section 4" remaining item then closes.

**The general Lang-torsor infrastructure** is already requested from SchemeAndStackFoundations SF.2 (packet request 7). No new request is needed.

## /10 (medium, other): the EXT-08 finite-fields packet was accepted but never integrated

### What the verifier corrected

- Confirmed as stale integration and review metadata, with supplier decisions left out. Both EXT-08 packets (FF and ES) have accepted reviews with full sections 7–8; their queue entries still say unreviewed, and DECISIONS.md has the partial snapshot.
- Correct placement and baseline first, then use the supported decision and promotion pipeline, keep `integrated_partial` and every genuine gap.
- Accepted review is not a complete blueprint. Feed the reviewed nodes to the blueprint worker.
- Record the open supplier questions with their present answers, including DWP.6 under /20.
- Pending cross-packet references are withheld in `deferredLinks`, not invalid.

### State on main (701638e0)

- **The queue.** `research/expansion/queue.json` has FiniteFieldsAndCharacterSums and ExponentialSumsAndCircleMethod at `"state": "draft_needs_review"`, reviewNote "not independently reviewed; not promoted". The other six EXT-08 packets are `integrated_partial`, each with a `promoted` path in `data/decompositions/`.
- **The packet.** The EXT-08 FF packet's `review` is `{"status": "accepted", "reviewer": "independent-review-REVIEW-EXT-08-EXT-16", "date": "2026-09-16"}`. `data/decompositions/` has no FiniteFieldsAndCharacterSums.json or ExponentialSumsAndCircleMethod.json.
- **DECISIONS.md** (line 401) still says "REVIEW-EXT-08-EXT-16-review.md (reviewer still running; partial) — last written 2026-09-16 10:42", with packets 1–6 only.
- **The review** (`research/expansion/reviews/REVIEW-EXT-08-EXT-16-review.md`) has "## 7. ExponentialSumsAndCircleMethod.json" and "## 8. FiniteFieldsAndCharacterSums.json". Section 8's supplier questions are:
  1. the Grothendieck–Ogg–Shafarevich owner;
  2. the weight input for Artin–Schreier sheaves;
  3. the placement of factorization.
- **The blueprint job has since produced its own packet** (354 nodes). It supersedes these 13 nodes node by node (see the map in /9 and below), and on promotion it replaces the decomposition of the layers it covers (PROTOCOL.md §8).

### Fix (now)

1. **Correct the EXT-08 FF packet** as in /6 (baseline citations on the three FF.0 nodes, keeping Shoup and the statements the review keeps), /8 (the coverage locator), /9 (ids, parents, the split, the removed Euler–Poincaré node, links) and /11 (factorization is FF.3's). Also point `FF.2/one-variable-artin-schreier-weil-bound`'s weight link at `DeligneWeightsAndPurity:DWP.6` (the /20 answer), keeping WC.3 only for the constant-coefficient comparison. Keep every gap except the Euler–Poincaré owner gap (answered by /3) and the multiplicative-degeneracy gap (answered by /5).
2. **Promote** the corrected packet and the ES packet (with its review §7 corrections, unchanged by this report) to `data/decompositions/FiniteFieldsAndCharacterSums.json` and `data/decompositions/ExponentialSumsAndCircleMethod.json`, in the same way as the other six. In `queue.json`, for both: `"state": "integrated_partial"`, `"promoted"` the new path, and a `note` in the style of the other six: "Independently reviewed (independent-review-REVIEW-EXT-08-EXT-16, 16 September 2026; accepted) and integrated with the corrections of RT-AREA-finitefields /6–/11". The promotion is superseded layer by layer when the FF blueprint packet is promoted.
3. **Regenerate DECISIONS.md** with `python3 research/expansion/collect_decisions.py`. The script extracts every "Supplier questions" section mechanically, so sections 7–8 enter without rewording. Add the present answers under the FF block:
   - Q1: owner `EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic` (RT-AREA-finitefields /3);
   - Q2: `DeligneWeightsAndPurity:DWP.6` (Weil II 3.2.3; RS-17 link DWP.6 → FF.2; FF packet request 4). A proof through im(H¹_c → H¹) would still need that comparison as a theorem, as the /20 review says;
   - Q3: FF.3, by RS-03's owner entry; the CN.1 node becomes a consumer (/11).
4. **Hand over to BP-FiniteFieldsAndCharacterSums** this map from the 13 EXT-08 nodes to its packet, so that none of the reviewed content is lost:

| EXT-08 node | Blueprint counterpart |
|---|---|
| FF.0/irreducible-polynomial-census-and-existence | FF.0/gauss-product-formula (moved from FF.3 by /1) and Mathlib `GaloisField` for existence |
| FF.0/frobenius-automorphism-and-exact-order | baseline, and FF.0/frobenius-minimal-polynomial-of-an-element |
| FF.0/subfield-lattice-and-uniqueness-up-to-F-isomorphism | baseline, and FF.0/intermediate-field-divisor-correspondence (/6) |
| FF.0/norm-and-trace-surjectivity | baseline, and FF.0/norm-from-minimal-polynomial (moved from FF.3) |
| lang-torsor-character-sheaves | FF.2/artin-schreier-sheaf, kummer-sheaf, character-sheaf-trace-formula |
| gauss-sum-cohomological-realization | FF.2/gauss-sum-frobenius-eigenvalue |
| gauss-sum-absolute-value-by-duality | FF.1/gauss-sum-absolute-value and FF.2/gauss-sum-realization-duality (/9) |
| etale-algebra-gauss-sums-and-hasse-davenport-shape | FF.1/etale-algebra-gauss-sum-product, FF.2/etale-algebra-gauss-sum-twisted-form (/9) |
| euler-poincare-with-swan-conductors | EDC.2:euler-characteristic (request 10) |
| FF.2/modified-pole-order-and-artin-schreier-normalization | FF.2/modified-pole-order, artin-schreier-reduced-form, artin-schreier-invariance |
| FF.2/one-variable-artin-schreier-weil-bound | FF.2/artin-schreier-sum-on-curve-bound |
| FF.2/kloosterman-rank-two-and-eigenvalue-pairing | FF.2/involution-eigenvalue-pairing, kloosterman-l-function, kloosterman-bound |
| FF.2/multivariable-polynomial-exponential-sum-bound | FF.2/elementary-n-variable-bound |

The EXT-08 review's corrections (the split-algebra case of 4.5.3; the printed misstatement in Exemple 3.5) are already in the blueprint packet's statements or its `sourceIssues`. The worker should check each row when it next checkpoints.

## /11 (medium, duplicate): the CN.1 decomposition still carries Shoup Chapter 20

### What the verifier corrected

- Confirmed: the integrated CN.1 node has Shoup 20.3–20.10 with operation counts, while RS-03 gives factorization to FF.3.
- Transfer the node, its sources, the corrected randomness claims and the census dependency to the early factorization component of /1, updating both the EXT-08 packet and the promoted copy.
- Leave in CN.1 the checked-output adapter, with imports rather than a second checker or proof. Keep deferred links.

### State on main (701638e0)

**The CN.1 node is unchanged.** `data/decompositions/ComputationalNumberTheory.json` (last changed 16 September) still has `ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields`, "Square-free decomposition, distinct-degree and equal-degree factorization, with operation counts". Its hypotheses include "failure probability per pair … 1/2 for p = 2 and at most 5/9 for p > 2" and the review correction that B1 "only computes a basis". It also has the link from `FiniteFieldsAndCharacterSums:FF.0/irreducible-polynomial-census-and-existence` and the gap "Finite-field polynomial factorization is FF.3's declared scope but is decomposed under CN.1".

**The merged `RT-AREA-computational.fixes.md` /10** gave the same instruction ("Move the node … to FiniteFieldsAndCharacterSums:FF.3 … Replace it in CN.1 by a consumer node"). It has not been applied.

**New since both red teams:** the FF blueprint packet has every theorem of the CN node, as FF.3 nodes, in finer form:

| CN node content | FF.3 node |
|---|---|
| Thm 20.3 | FF.3/pth-root-of-a-polynomial-with-zero-derivative |
| Thm 20.4 | FF.3/derivative-gcd-radical |
| Thm 20.5 | FF.3/square-free-decomposition-algorithm-cost |
| Thm 20.6 | FF.3/distinct-degree-factorization-algorithm-cost |
| Thms 20.7–20.8 | FF.3/equal-degree-pair-separation, -failure-bound, -expected-rounds, -cost |
| Thm 20.9 | FF.3/cantor-zassenhaus-cost |
| Thm 20.10, B1/B2 | FF.3/berlekamp-algorithm-cost, berlekamp-splitting-failure-bound |
| census link | FF.3/gcd-with-frobenius-power, gauss-product-formula |
| checked output | FF.3/factorization-certificate, -sound, -complete |

The randomness claims agree. `FF.3/equal-degree-pair-separation` gives "exactly 1/2 for q even and (1 + q^(−2k))/2 ≤ 5/9 for q odd". That is right: a pair fails to separate with probability s² + (1 − s)², where s = (1 − q^{−k})/2, and this equals (1 + q^{−2k})/2, at most 5/9 since q^k ≥ 3. The one thing missing from FF.3 is the tightness remark of Theorem 20.9, which the CN node keeps as an acceptance item.

### Fix

**11.1 `data/decompositions/ComputationalNumberTheory.json`** (now).
- **The node.** Keep the node id, so that references hold. Replace:
  - `title` with "Checked finite-field factorization (consumer of FF.3)";
  - `statement` with:
    > Given a monic f ∈ F_q[X] in CN.0's presentation and a claimed factorization f = ∏ f_i^{e_i} with a Rabin certificate for each f_i, CN.1 accepts exactly when FiniteFieldsAndCharacterSums FF.3's factorization-certificate checker accepts. Soundness and completeness are FF.3/factorization-certificate-sound and FF.3/factorization-certificate-complete. CN.1 adds the implementation contract: the refinement of the checker to CN.0's executable presentation of F_q[X] and the cost of the check in CN.0's model.
  - `hypotheses` with CN.0's presentation and cost model only;
  - `proofSteps` with "Import FF.3's soundness and completeness; prove the refinement lemma for CN.0's presentation";
  - `acceptance` with "a factorization output multiplies back to the input and every factor carries a checked certificate".
- **`sources`:** delete the Shoup Chapter 20 entries. They live in FF.3.
- **Link:** replace the one from `FF.0/irreducible-polynomial-census-and-existence` with a link from `FiniteFieldsAndCharacterSums:FF.3/factorization-certificate-sound` ("CN.1 checks FF.3's certificate"). It stays in `deferredLinks` until the FF blueprint is promoted.
- **Gap:** replace "Finite-field polynomial factorization is FF.3's declared scope but is decomposed under CN.1" with a closed note: "Resolved by RT-AREA-finitefields /11 and RT-AREA-computational /10: Shoup Chapter 20 is decomposed in FiniteFieldsAndCharacterSums FF.3; CN.1 keeps the checked-output consumer."
- **The same edit** goes to `research/expansion/external/EXT-08/ComputationalNumberTheory.json`, the authored copy, as the review asks.

**11.2 FF packet** (blueprint).
- `FF.3/cantor-zassenhaus-cost`, `acceptance`: add "The bound is tight: on an irreducible input the algorithm performs Θ(ℓ³ len(q)) operations (Shoup, Theorem 20.9 and the remark after it, p. 537)." This transfers the CN node's last item.
- FF.3 coverage: add "Shoup Chapter 20, formerly decomposed under ComputationalNumberTheory CN.1, is planned here; CN.1 keeps a consumer node."

## /12 (medium, duplicate): FunctionFieldArithmetic FA.7 also plans finite-field factorization

### What the verifier corrected

- Confirmed for the factorization conflict and the missing certificate handoff. FA.7 and the unaccepted RS-04 keep factorization without naming the RS-03 supplier.
- Import the elementary factorization component and the relevant point-count certificates.
- The proposed narrowing is wrong: FA.7 also owns place enumeration, Riemann–Roch computations, ray characters, conductors and local completions, and these stay.
- Counts through r = g determine the zeta numerator only for a smooth projective geometrically connected genus-g curve, through Newton's identities and the normalised functional equation. This does not replace Artin or ramified L-polynomials.
- Resolve RS-04 through its review or fix route.

### State on main (701638e0)

- **FA.7** (`content/campaign/FunctionFieldArithmetic/README.md`) says "Provide certified finite-field factorization, place enumeration and Riemann--Roch linear algebra; complexity claims require a stated representation and cost model." Its acceptance asks for "a machine-verifiable L-polynomial certificate".
- **RS-04** (`research/blueprint/restructure/RS-04.result.json`, `review` null; REV-RS-04 pending, claimed #807):
  - FA.7's `keeps` begins "End-to-end certified packages: place enumeration and finite-field factorization";
  - its `suppliedBy` is FA.1 and AlgebraicCurves layers 1 and 3.
- **FA.7 has depth 28** and no FF input.

**Checks.**
- The cycle tests FF.3 → FA.7 and FF.3:point-counting → FA.7 are both acyclic; FA.7's depth becomes 31.
- The mathematics: for C of genus g, Z(C, T) = L(T)/((1 − T)(1 − qT)) with L(T) = Σ_{i=0}^{2g} a_i T^i. Here a₀ = 1 and a_{2g−i} = q^{g−i}a_i. Since log Z = Σ N_r T^r/r, the coefficients a₁, …, a_g are determined by N₁, …, N_g through Newton's identities.

### Fix

**12.1 README, FA.7 (now).**
- Replace "Provide certified finite-field factorization, place enumeration and Riemann--Roch linear algebra; complexity claims require a stated representation and cost model." with:
  > Import certified finite-field factorization from FiniteFieldsAndCharacterSums FF.3, and certified point counts over F_{q^r} from FF.3:point-counting. Provide place enumeration and Riemann--Roch linear algebra; complexity claims require a stated representation and cost model.
- Append to the Acceptance:
  > For a smooth projective geometrically connected curve of genus g over F_q with exact constant field, the L-polynomial certificate assembles L(T) = Σ_{i=0}^{2g} a_i T^i from certified counts N₁, …, N_g by Newton's identities, with a₀ = 1 and a_{2g−i} = q^{g−i}a_i. Artin and ramified L-polynomials need their own local factors and are not recovered from point counts alone.
- Inputs line: add `FiniteFieldsAndCharacterSums:FF.3`, `FiniteFieldsAndCharacterSums:FF.3:point-counting`. Records FF.3 → FA.7 and FF.3:point-counting → FA.7 (both acyclic).

**12.2 RS-04** (RS-04 review). For REV-RS-04 or its fix job:
- FA.7 `keeps`: replace "place enumeration and finite-field factorization" with "place enumeration (importing finite-field factorization from FiniteFieldsAndCharacterSums FF.3)".
- Keep every other item.
- Add FF.3 and FF.3:point-counting to `suppliedBy`.
- Add the links FF.3 → FA.7 and FF.3:point-counting → FA.7.

### Not done, and why

- **No replacement of FA.7's L-polynomial work.** The review rejects FA.7 "keeping only the assembly", and nothing else is removed from FA.7.

## /13 (medium, duplicate): q-linearized polynomials are planned in FF.4 and in DM.0

### What the verifier corrected

- Confirmed for the duplicated interface. Assign the construction and the comparison once, early enough that DM.0 imports it without a coding or Weil dependency.
- Mathlib already has `SkewPolynomial`, `monomial_mul_monomial` and `X_mul_monomial`. Specialise their action to the q-power Frobenius rather than rebuild the Ore carrier.
- The missing target is the comparison with composition of q-linearized polynomials, and its API.
- Distinguish polynomial laws from functions on rational points: X^q − X is nonzero but induces the zero function on F_q.
- State the root and subspace results over the right field extension, for finite F_q-subspaces, with separability where used. DM.0 keeps the Drinfeld-module-specific structure.

### State on main (701638e0)

**Read at the pin** (Mathlib 082e2d3):
- `SkewPolynomial`: Mathlib/Algebra/SkewPolynomial/Basic.lean:94, an abbrev for `SkewMonoidAlgebra R (Multiplicative ℕ)`. The module doc says "in the context of F_q-linear polynomials, this can be the q-th Frobenius endomorphism".
- `SkewPolynomial.monomial_mul_monomial`: line 233, "monomial n r * monomial m s = monomial (n + m) (r * (φ^[n] s))".
- `SkewPolynomial.X_mul_monomial`: line 330.
- Neither library has a linearized-polynomial theory. A search of both trees finds no match.

**Two unreviewed packets now plan it twice.**
- **FF packet, FF.4.** `linearized-polynomial`, `-eval-linear`, `-comp` (L₁ ∘ L₂ = Σ_k (Σ_{i+j=k} a_i b_j^{q^i}) X^{q^k}), `roots-of-linearized-polynomial`, `linearized-polynomial-separable-iff`, `subspace-polynomial`, `subspace-polynomial-is-linearized`. Its `restructure` rescope proposes FF.4 as owner of "the polynomial-level theory" and leaves DM.0 "the Ore ring L{τ} … its identification with FF.4's composition ring".
- **DM.0 packet** (checkpoint 28 September). `DM.0/frobenius-action` (a `MulSemiringAction` of `Multiplicative ℕ` by x ↦ x^{q^n}), `twisted-polynomial-ring` (on `SkewPolynomial`), `tau-degree-mul`, `twisted-polynomial-eval` ("toPolynomial(f g) = (toPolynomial f).comp (toPolynomial g)"), `twisted-polynomial-eval-injective` and `additive-polynomial-characterisation`.

So the comparison is planned twice: in `FF.4/linearized-polynomial-comp` and in `DM.0/twisted-polynomial-eval`. FF.4's inputs make it depth 31 today; after /1 it has depth 5 but still imports coding and curve layers.

**Checks.**
- The composition law holds over any commutative F_q-algebra A: aτ^i · bτ^j = ab^{q^i}τ^{i+j} matches (aX^{q^i}) ∘ (bX^{q^j}) = ab^{q^i}X^{q^{i+j}}. Distributivity on the right uses (f + g)^{q^i} = f^{q^i} + g^{q^i} in A[X], which holds in characteristic p.
- The cycle test FF.0 → DM.0 is acyclic; DM.0 keeps depth 7.

### Fix

**13.1 Owner: FF.0.** It is the earliest FF layer (depth 3, input CA.3 only), so DM.0 imports the interface without coding or Weil ancestors, as the review requires.

**README, FF.0 (now).** Append to the text of 6.1:
> q-linearized polynomials over a commutative F_q-algebra A: the Frobenius action a ↦ a^{q} on A, the twisted polynomial ring A{τ} as Mathlib's `SkewPolynomial` for that action (τa = a^qτ), and the ring isomorphism Σ a_iτ^i ↦ Σ a_iX^{q^i} onto the q-linearized polynomials under addition and composition. Over a field, the roots of a q-linearized polynomial form an F_q-subspace, which is finite when the polynomial is nonzero. The polynomial is separable iff its X-coefficient is nonzero. For a finite F_q-subspace U of a field extension, the subspace polynomial ∏_{u∈U}(X − u) is q-linearized and separable. Polynomial laws are distinguished from functions: τ − 1 is nonzero in F_q{τ} but induces the zero map on F_q.

**README, DM.0** (`content/campaign/DrinfeldModulesAndTModules/README.md`).
- Replace "Construct the Ore ring L{tau}, with tau a=a^q tau, and identify it with F_q-linear polynomial endomorphisms of G_a." with:
  > Import from FiniteFieldsAndCharacterSums FF.0 the twisted polynomial ring L{τ} (τa = a^qτ, on Mathlib's SkewPolynomial) and its identification with the composition ring of q-linearized polynomials; deduce the identification with the F_q-linear polynomial endomorphisms of G_a over L.
- Inputs: add `FiniteFieldsAndCharacterSums:FF.0` (record FF.0 → DM.0, acyclic).

**13.2 Packets** (blueprint).
- **Move to FF.0 from the DM.0 packet** (ids `FF.0/…`, statements unchanged): `DM.0/frobenius-action`, `twisted-polynomial-ring`, `tau-degree-mul`, `twisted-polynomial-eval`, `twisted-polynomial-eval-injective` and `additive-polynomial-characterisation`.
  - `tau-degree-mul` was checked: lc(fg) = lc(f)·lc(g)^{q^{deg f}}.
  - `twisted-polynomial-eval-injective` keeps its infinite-domain hypothesis, which is the review's law/function distinction.
  - DM.0 keeps `drinfeld-module` onward, with prerequisites rewritten to the FF.0 ids.
- **Move to FF.0 from the FF packet**: `FF.4/linearized-polynomial`, `-eval-linear`, `roots-of-linearized-polynomial`, `linearized-polynomial-separable-iff`, `subspace-polynomial` and `subspace-polynomial-is-linearized`. The move is closed under prerequisites (checked).
- **Merge** `FF.4/linearized-polynomial-comp` into the moved `twisted-polynomial-eval`, keeping its explicit composition formula as a lemma. One comparison is left.
- **What stays in FF.4:** `linearized-q-associate` and the permutation criteria (`linearized-permutation-root-criterion`, `-associate-criterion`, `dickson-matrix-criterion`), with prerequisites rewritten to FF.0 ids.
- **Tests.** Add to the moved nodes:
  - "X^q − X ∈ F_q[X] is nonzero and q-linearized; its function on F_q is 0; over F_{q²} its roots are exactly F_q";
  - "over F_4 with q = 2, the subspace polynomial of F_2 ⊂ F_4 is X² + X".
- **Restructure proposal.** Remove the FF packet's FF.4/DM.0 rescope entry; this fix supersedes it.

## /14 (medium, missing): code-family targets of FF.4

### What the verifier corrected

- Confirmed. Add declaration-sized contracts for cyclic and BCH codes, Singleton, Reed–Solomon and AG codes, with public-source proof gates.
- **Reed–Solomon:** 1 ≤ k ≤ n ≤ q with distinct evaluation points for d = n − k + 1. k = 0 is the zero code, with upstream distance 0. State the nonzero-code convention in the distance bounds.
- **Cyclic codes:** the ideal correspondence needs only n > 0. Coprimality with q belongs to the BCH route.
- **AG codes:** a function field with exact constants, distinct rational places outside supp(G), dimension ℓ(G) − ℓ(G − D), and a distance statement for nonzero codewords. Layers 3–5 supply the Weil-differential route. Kähler residues would also need layer 9's comparison.

### State on main (701638e0)

**The FF packet plans all but cyclic codes, with the review's hypotheses:**
- `FF.4/singleton-bound` ("k = finrank F C ≥ 1 … some nonzero c ∈ C has hammingNorm c ≤ n − k + 1");
- `reed-solomon-code`, `reed-solomon-min-weight` and `reed-solomon-is-mds` ("α injective and 1 ≤ k ≤ n = #ι … for k = 0 the code is ⊥ and has minimum distance 0");
- `bch-code` and `bch-bound`, for the primitive narrow-sense case n = q^m − 1 as a subfield subcode of RS;
- `algebraic-geometry-evaluation-code` ("P_i distinct, of degree 1, G.coeff P_i = 0"), `ag-code-dimension` (ℓ(G) − ℓ(G − D)), `goppa-bound` ("every nonzero c ∈ C_L(D, G) has hammingNorm c ≥ n − deg G") and `residue-code-is-dual`, all on Tau Ceti's Weil differentials (`TauCeti.weilDifferentialFiltration`, `TauCeti.repartitionDualComponent`). No Kähler residues are used, so layer 9 is not needed.

**Checks.**
- Goppa: a codeword ev(f) of weight w has f ∈ L(G − Σ_{zeros} P_i), of degree deg G − (n − w), so f ≠ 0 forces w ≥ n − deg G.
- Singleton: projection to any k − 1 coordinates has a nonzero kernel element.

**There is no cyclic-code node.** The packet's BCH is only the primitive narrow-sense case.

**The README** still names these codes only as "BCH/Reed-Solomon examples". The GRS book the packet read has no chapter on cyclic codes: a search of its text finds only a bibliography entry.

**Source read for this fix.** J. I. Hall, *Notes on Coding Theory*, Chapter 8 "Cyclic codes", the author's PDF, https://users.math.msu.edu/users/halljo/classes/codenotes/Cyclic.pdf (sha256 `31516216ef8895f17f318f102cf756cdfb0de3d9c52cbb162f7c60e82eb23d06`), read 29 September 2026, printed pp. 101–112:
- Theorem 8.1.1 (p. 103): "Let C ≠ {0} be a cyclic code of length n over F. (1) Let g(x) be a monic code polynomial of minimal degree in C. Then g(x) is uniquely determined in C, and C = {q(x)g(x) | q(x) ∈ F[x]_{n−r}}, where r = deg(g(x)). In particular, C has dimension n − r. (2) The polynomial g(x) divides x^n − 1 in F[x]." No coprimality hypothesis appears.
- The check polynomial g(x)h(x) = x^n − 1, and the correspondence with the monic divisors of x^n − 1 (p. 104).
- Theorem 8.1.10: C^⊥ is cyclic with generator polynomial the normalised reciprocal of h.
- Theorem 8.3.1 (p. 112): a BCH code of length n and designed distance t + 1 is the cyclic code of c(x) with c(α^{b+1}) = … = c(α^{b+t}) = 0, where α is a primitive n-th root of unity in F ⊇ K. It has minimum distance at least t + 1 and dimension at least n − mt, with m = dim_K F. The proof goes by the alternant code K^n ∩ GRS.

### Fix

**14.1 README, FF.4 (now).** Replace "Develop Galois rings, additive polynomials, permutation polynomials and sequence correlation; connect evaluation/residue codes to existing AlgebraicCodingTheory and AlgebraicCurves." with:

> Develop Galois rings, permutation polynomials (the q-linearized polynomials themselves are FF.0's), linear recurring sequences with their exact correlations, and codes over the AlgebraicCodingTheory carrier and the AlgebraicCurves function-field layers, with these targets:
> 1. for n ≥ 1, cyclic codes of length n over F_q correspond to monic divisors g of X^n − 1, i.e. to the ideals of F_q[X]/(X^n − 1). They have generator polynomial g, check polynomial h = (X^n − 1)/g and dimension n − deg g, and the dual is generated by the normalised reciprocal of h;
> 2. the BCH bound: for gcd(n, q) = 1 and α a primitive n-th root of unity in an extension, a cyclic code whose codewords vanish at α^{b+1}, …, α^{b+δ−1} has minimum distance ≥ δ, and its dimension is ≥ n − m(δ − 1) with m = [F_q(α) : F_q];
> 3. the Singleton bound: a linear code of length n and dimension k ≥ 1 has a nonzero codeword of weight ≤ n − k + 1;
> 4. Reed–Solomon codes: for distinct evaluation points and 1 ≤ k ≤ n ≤ q, the code of polynomials of degree < k has dimension k and minimum distance n − k + 1 (k = 0 gives the zero code, distance 0 by the upstream convention);
> 5. algebraic-geometry codes: for a function field over F_q with exact constant field, distinct rational places P₁, …, P_n outside supp G and D = ΣP_i:
>    - dim C_L(D, G) = ℓ(G) − ℓ(G − D);
>    - every nonzero codeword has weight ≥ n − deg G;
>    - C_Ω(D, G), defined with Weil differentials, is C_L(D, G)^⊥.
>
> Add Terras's finite upper half-plane for q odd (E = F_q(√δ), δ a nonsquare, H_q = E ∖ F_q) with the GL₂(F_q) action, its stabilizer, pinned measures and the Gelfand-pair Hecke algebra. The Ramanujan bound for its graphs is FF.5's.

**14.2 Packet (blueprint).** Add to FF.4, sourced to Hall, Chapter 8:
- **`FF.4/cyclic-code`** (definition). A linear code C ⊆ F^n, n ≥ 1, closed under the cyclic shift, identified with an F[X]-submodule of F[X]/(X^n − 1). Source: Hall §8.1, pp. 101–102.
- **`FF.4/cyclic-code-generator-polynomial`** (theorem).
  - Statement: for n ≥ 1, C ↦ its monic generator g (with g = X^n − 1 for C = 0) is a bijection from cyclic codes to the monic divisors of X^n − 1. C = {qg : deg q < n − deg g}, dim C = n − deg g, and h := (X^n − 1)/g is the check polynomial: c ∈ C iff ch ≡ 0 mod X^n − 1.
  - Source: Hall Theorem 8.1.1 and Proposition 8.1.6, pp. 103–104. No coprimality hypothesis.
  - Test: n = 7, q = 2, g = X³ + X + 1 gives the [7, 4] Hamming code.
- **`FF.4/cyclic-code-dual`** (theorem). C^⊥ is cyclic with generator the normalised reciprocal of h. Source: Hall Theorem 8.1.10.
- **`FF.4/bch-bound-general`** (theorem).
  - Statement: for gcd(n, q) = 1, α of multiplicative order n in F_{q^m} and b ∈ ℤ, every nonzero c ∈ F_q^n with c(α^{b+1}) = … = c(α^{b+δ−1}) = 0 has weight ≥ δ, and the code has dimension ≥ n − m(δ − 1).
  - Proof: as a subfield subcode of a GRS code, as in Hall's proof and in the packet's `FF.4/bch-bound`, which becomes its case b = 0, n = q^m − 1.
  - Source: Hall Theorem 8.3.1, p. 112.
  - Test: n = 7, q = 2, δ = 3 with zeros α, α² gives the Hamming code with d = 3.

  This is the route the red team asked for "via Vandermonde determinants". Hall proves it through the alternant (GRS) code, and both rest on the same Vandermonde argument.
- **Sources:** add Hall's Chapter 8 to `sources` with the URL, hash and date above.

## /17 (medium, error): FF.3 and FF.4 cite SHOUP and DELIGNE, which do not cover them

### What the verifier corrected

- Confirmed as an inadequate route, not a claim that Shoup contributes nothing. Chapter 18 (linearly generated sequences) remains useful.
- Register target-specific public editions and exact proof passages. Keep Shoup for finite fields, factorization and the applicable sequence and RS ingredients, and Deligne for the cohomological bounds.
- The suggested books are acquisition leads until read. Do not claim the target proofs have been checked.

### State on main (701638e0)

- **The README.** Every stage still has "**Source route.** Selected sources: SHOUP, DELIGNE.".
- **`content/campaign-guide/EXTENSION_SOURCES.md`** has only the SHOUP and DELIGNE rows for this roadmap.
- **The FF packet's `sources`** record public editions with hashes and the sections read (25 September) for:
  - FF.3: Shoup v2 §§19–20 and §3.2; Milne, ANT v3.08, Theorem 7.33; Sutherland 18.783 Lectures 3, 7 and 8; Schoof, JTNB 7 (1995), §§1, 2 and 5;
  - FF.4: Goresky–Klapper, *Algebraic Shift Register Sequences* (public draft of 14 October 2009), Chapters 3–4 and more; Shallue arXiv:1211.6044; Bluher arXiv:1707.06877; Wu–Liu arXiv:1211.5475; Ben-Sasson–Etzion–Gabizon–Raviv arXiv:1404.7739; Guruswami–Rudra–Sudan, *Essential Coding Theory* (draft of 26 August 2025), §§4.3 and 5.2–5.4; Couvreur–Randriambololona arXiv:2009.01281, §§2–3; Kuang arXiv:math/9411217; Vinh–Dung arXiv:0807.2692; DeDeo–Velasquez arXiv:2001.10555.
- The packet is unreviewed. Those reads are the blueprint worker's and are not yet checked.

### Fix (now)

**17.1 README, source routes.**
- **FF.3.** Replace "Selected sources: SHOUP, DELIGNE." with:
  > Shoup v2, Chapters 19–20 and §3.2 (factorization, irreducibility tests, cost model); Milne, Algebraic Number Theory v3.08, Theorem 7.33 (Hensel lifting of factorizations).
- **FF.3:point-counting** (new):
  > Sutherland, MIT 18.783 (2023) Lectures 7–8; Schoof, Journal de Théorie des Nombres de Bordeaux 7 (1995), §§1, 2, 5; WeilConjectures WC.5 and FF.2 for the error bounds.
- **FF.4.** Replace "Selected sources: SHOUP, DELIGNE." with:
  > Goresky–Klapper, Algebraic Shift Register Sequences (Galois rings, linear recurring and m-sequences); Shoup v2 Chapter 18 (linearly generated sequences); Shallue and Bluher (permutation polynomials); Guruswami–Rudra–Sudan, Essential Coding Theory, §§4.3, 5.2–5.4, and Hall, Notes on Coding Theory, Chapter 8 (Singleton, Reed–Solomon, cyclic and BCH codes); Couvreur–Randriambololona, arXiv:2009.01281, §§2–3 (AG codes over Weil differentials); Kuang and Vinh–Dung (finite upper half-plane).
- Keep "Select the exact original statement, page and full proof before dividing this stage into proof tasks." on each stage.
- FF.0, FF.1, FF.2 and FF.5 keep SHOUP and DELIGNE, as the finding and review ask.

**17.2 `content/campaign-guide/EXTENSION_SOURCES.md`.** Add after the DELIGNE row:

| ID | Source | Evidence and remaining work |
| --- | --- | --- |
| GORESKY-KLAPPER | [Goresky–Klapper, Algebraic Shift Register Sequences, public draft 2009](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf) | Chapters 3–4 read by the FF blueprint worker (review pending); FF.4 Galois rings and sequences; the p = 2, r ≥ 2 unit-group proof is not in it |
| GRS-ECT | [Guruswami–Rudra–Sudan, Essential Coding Theory, draft 26 Aug 2025](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf) | §§4.3, 5.2–5.4 read by the FF blueprint worker (review pending); no cyclic-code chapter |
| HALL-CODING | [Hall, Notes on Coding Theory, Ch. 8 Cyclic codes](https://users.math.msu.edu/users/halljo/classes/codenotes/Cyclic.pdf) | pp. 101–112 read (FIX-RT-AREA-finitefields, 29 Sep 2026): Theorems 8.1.1, 8.1.10, 8.3.1 |
| COUVREUR-RANDRIAMBOLOLONA | [arXiv:2009.01281v1](https://arxiv.org/abs/2009.01281) | §§2–3 read by the FF blueprint worker (review pending); AG codes with Weil differentials |
| SCHOOF95 | [Schoof, JTNB 7 (1995)](http://www.numdam.org/item/JTNB_1995__7_1_219_0.pdf) | §§1, 2, 5 read by the FF blueprint worker (review pending); FF.3:point-counting |
| SUTHERLAND-18783 | [Sutherland, MIT 18.783 (2023) lecture notes](https://math.mit.edu/classes/18.783/2023/LectureNotes8.pdf) | Lectures 3, 7, 8 read by the FF blueprint worker (review pending) |
| TERRAS-PLANE | [Kuang, arXiv:math/9411217](https://arxiv.org/abs/math/9411217); [Vinh–Dung, arXiv:0807.2692](https://arxiv.org/abs/0807.2692) | read by the FF blueprint worker (review pending); Katz's Soto-Andrade estimate (J. reine angew. Math. 438) not public, an open gap |

The Lidl–Niederreiter, Stichtenoth and Terras books the red team suggested are not registered. None was read, and the review calls them acquisition leads.

## /18 (medium, error): the BKK23 items routed to FF are mostly not finite-field mathematics

### What the verifier corrected

- Confirmed as a wrong-owner bundle, with two qualifications. BKK v3 pp. 28–33 use F_p((1/T)), its polynomial quotient, residue characters, Haar measure and Farey separation.
- Route items 13, 14, 20 and 21 to FA.2. Give item 15 one explicit owner: FA.2, or the ES.1 consumer with imports.
- Item 8 goes to PM.0 and item 25 to AC.0. Item 73 is FF.0's census.
- Item 130: route Rosen's general theorem to FA.5, or isolate the modulus-T fixed-constant case in elementary FF.0, with no Weil machinery.
- Keep BKK's source and closure gates.

### State on main (701638e0)

**The route is unchanged.** `research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json`, `routes[2]` (route 3), is `"route": "source"` to FF.1, FF.3 and FF.4, with items 8, 13, 14, 15, 20, 21, 25, 73 and 130. The review accepts it, the paper is accepted, and the route is live.

**Because it is live, the FF packet planned all nine items.**
- FF.1d holds nine nodes, as the packet's own FF.1 split proposal groups them:
  - `FF.1/fourier-transform-of-integer-measure` (item 8, §2.4 p. 13);
  - `fourier-gap-from-residue-anticoncentration` (item 25, Lemma 3.6, pp. 24–25);
  - `residue-character-at-infinity`, `residue-pairing-duality`, `negative-power-torus`, `haar-measure-on-negative-power-torus`, `reduced-polynomial-fractions`, `torus-character-orthogonality` and `torus-finite-coordinate-integral` (items 13, 14, 15, 20, 21 and BKK §§4, 6).
- Only the item-8 node has no FF prerequisite. The item-25 node needs only it. The F_q((1/T)) nodes need only `FF.1/canonical-additive-character`. No other FF node uses any of the nine (checked).
- The census nodes (item 73) and `FF.3/irreducible-polynomials-with-prescribed-constant-coefficient` (item 130) are in FF.3.

**Item 130's elementary proof is correct.**
- The packet proves |n(q − 1)Π(n; b)/q^n − 1| ≤ 3q^{1−n/2} through `FF.3/constant-coefficient-norm-fibre-identity`: the constant coefficient of a minimal polynomial is ± the norm.
- Summing over d | n, the elements of F_{q^n} of a given norm number (q^n − 1)/(q − 1). The terms with d < n add at most Σ_{d≤n/2} q^d ≤ 2q^{⌊n/2⌋}.
- Hence (q^n − 1)/(q − 1) − 2q^{⌊n/2⌋} ≤ nΠ(n; b) ≤ (q^n − 1)/(q − 1), and so the error ≤ (1 + 2(q − 1)q^{n/2})/q^n ≤ 3q^{1−n/2}.
- This is exactly the modulus-T case: P(0) = b means P ≡ b mod T. It uses no L-function, and it is the review's "elementary FF.0" option.

**Neither PM.0's nor AC.0's packet plans items 8 or 25.** FunctionFieldArithmetic has no packet; BP-FunctionFieldArithmetic is pending.

### Fix

**18.1 Paper routes** (verdict), in `PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json`:

- **Route 3 (`routes[2]`).**
  - `stages`: `["FiniteFieldsAndCharacterSums:FF.1", "FiniteFieldsAndCharacterSums:FF.3", "FiniteFieldsAndCharacterSums:FF.4"]` → `["FiniteFieldsAndCharacterSums:FF.0"]`.
  - `items`: → `["PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/73", "PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/130"]`.
  - `reason`, new value:
    > FF.0 owns the census of monic irreducible polynomials over F_q and its explicit bounds (item 73, Proposition 8.1), and the elementary count with a prescribed nonzero constant coefficient (item 130), which is the modulus-T case of Rosen's Theorem 4.8. It is proved through the norm-fibre identity, without L-functions or Weil bounds. Rosen's general theorem for arbitrary moduli is FunctionFieldArithmetic FA.5's and is not needed here. BKK is a consumer and source locator, not a replacement for the census proof.
- **New route → FA.2.**
  - `"route": "source"`, `"roadmap": "FunctionFieldArithmetic"`, `"stages": ["FunctionFieldArithmetic:FA.2"]`, items 13, 14, 15, 20 and 21.
  - `reason`:
    > Harmonic analysis on the completion F_p((1/T)) of F_p(T) at infinity and on its compact quotient by F_p[T]: the residue character, the normalised Haar measure, orthogonality of the residue characters, finite-coordinate integrals, and reduced polynomial fractions with their separation (BKK v3 §§4, 6, pp. 28–33). This is FA.2's local residue character and self-dual measure at the place at infinity. FA.2 is the single owner of item 15's reduced-fraction interface; ExponentialSumsAndCircleMethod ES.1 imports it for the function-field major-arc dissection. The canonical additive character of F_p is imported from FiniteFieldsAndCharacterSums FF.1.
- **Route 7 (`routes[6]`, PM.0).** Add item 8 to `items`, and append to the `reason`: "Item 8 (the Fourier transform of a probability mass on ℤ, with its translation and reduction-mod-q compatibilities) is PM.0's characteristic-function adapter."
- **New route → AC.0.**
  - `"route": "source"`, `"roadmap": "AdditiveCombinatorics"`, `"stages": ["AdditiveCombinatorics:AC.0"]`, `"items": ["PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/25"]`.
  - `reason`: "A Fourier gap at k/P for a law on ℤ from anticoncentration in residue classes modulo the primes dividing a composite P (Lemma 3.6, pp. 24–25): finite-abelian Fourier analysis on ℤ/P, which RS-03 gives to AC.0. It imports item 8 from PM.0."
- **Items keep their `status` and `sourceGates`.** Change the `note` of items 13, 14, 15, 20 and 21 to name FA.2, item 8 to name PM.0, and item 25 to name AC.0.
- **Verdicts.** Each changed or new route needs a verdict in `PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.review.json` (the paper's overall verdict is accept):
  - route 3 (re-staged);
  - route 7 (an item added);
  - the two new routes.

**18.2 Edges** implied by the imports. All four cycle tests are acyclic:

| Edge | Reason |
|---|---|
| FF.1 → FA.2 | canonical additive character |
| FA.2 → ES.1 | item 15 |
| PM.0 → AC.0 | item 25 uses item 8 |
| FF.1 → AC.0 | **not added**: AC.0 → FF.1 exists (RS-03), and the item-25 node does not use FF.1 |

**18.3 Packets** (blueprint).
- **Leave the FF packet:** remove the nine FF.1d nodes and the FF.1d group of its FF.1 split proposal. Their text goes as starting material to:
  - BP-FunctionFieldArithmetic (the seven F_q((1/T)) nodes, under FA.2);
  - BP-ProbabilisticAndMetricNumberTheory (`fourier-transform-of-integer-measure`, under PM.0);
  - BP-AdditiveCombinatorics (`fourier-gap-from-residue-anticoncentration`, under AC.0).

  Each keeps its sources and BKK locators. A job's prompt lists accepted routes, so this reaches those jobs once 18.1 has verdicts.
- **FF.1 coverage:** drop "the harmonic analysis on F_q((1/T)) that BKK route 3 assigns here".
- **Items 73 and 130** are planned in the census block, which /1 moves to FF.0.

### Not done, and why

- **Item 130 is not sent to FA.5.** The elementary FF.0 proof covers exactly the case BKK uses, the modulus-T case. The review allows this and warns against requiring Weil machinery for it.

## /15, /16, /19, /20: not in this job

- **/15** (rejected). No change. The review keeps FF.4's acceptance sentence; the generic code API is reused as baseline.
- **/19** (rejected). No change; FF.5 stays a handoff layer.
- **/16** (low, confirmed). This is a separate low-severity finding and no fix job is queued for it. Two facts bear on it:
  - in the assembled graph, AlgebraicCurves layers 3–5 (AC-L43–45) and AlgebraicCodingTheory layers 1–2 are already inputs of FF.4;
  - 1.3 keeps SF.3, as its review asks.

  The Terras model in 14.1 states the review's odd-q, nonsquare-δ hypothesis.
- **/20** (low, confirmed). The FF packet already requests DWP.6 (its request 4: "Weil II Théorème 3.2.3 … used with β = 0 for the rank-one Artin–Schreier sheaves L(ψf)"). The /10 decision record gives it as the answer to supplier question 2.
