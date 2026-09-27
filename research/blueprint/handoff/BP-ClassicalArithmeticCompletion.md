# Handoff — BP-ClassicalArithmeticCompletion

Job `BP-ClassicalArithmeticCompletion`, issue #1025.

## Continuation — 27 September 2026

Codex, session `codex-a71f92`, continued the merged 312-node checkpoint under the exact claim confirmed by the bot for comment 5851354000. Scope: the named CA.3 Perron equality-case remaining item. This is a partial checkpoint, not an independent review or a claim that the whole roadmap is complete.

### Result

- Added four CA.3 nodes: two lemmas (unit-circle exclusion and weak root location) and two theorems (the reusable single-outer-root irreducibility adapter and Perron's weak criterion).
- All inherited 312 node IDs and mathematical statements are retained. The strict Perron node's proof outline now consumes the common adapter; its statement is unchanged.
- Totals: 316 nodes (122 theorems, 110 lemmas, 45 definitions, 27 constructions, 7 applications, 5 comparisons); 501 API items; 279 definition unit tests; 42 planets; 586 baseline declarations. The four additions introduce no definitions, API items or planets. The suggested file adds twelve theorem-acceptance examples.
- All eight coverage statuses stay unchanged, including CA.3 partial. Only the completed equality-case entry is removed from CA.3's remaining list. The 8 gaps, 19 requests, 50 inherited source issues and 3 restructuring proposals are unchanged.

### Evidence and checks

- Freshly read the reviewed AUDIT-18 records for all eight stages, its review, the applicable accepted RS-03 ownership decisions, the campaign stages, the integrated reviewed decomposition and incident atlas edges, and all matching link/overlap entries in the 29 link packets. Prior source provenance and the other 309 non-Perron nodes are retained, not represented as independently re-reviewed.
- Source: Prasolov, *Многочлены*, third corrected Russian edition, MCCME, 2003, Chapter 2 §7.2, Theorem 7.2(a),(b) and complete proof, printed/PDF pp. 68–69. Read page images; title/edition pp. 1–2 and contents locator p. 3 checked. Public author-linked PDF: http://prasolov.loegria.net/poly.pdf, SHA-256 a24aa35ab4e5ad6c88274d4653f884f235ed37eda417e6cee42f429a8400d937. Author link: https://vvprasolov.livejournal.com/127528.html. The publisher HTTPS transfer timed out; no claim is made to have read a second copy.
- Freshly re-read Barbeau's strict Perron proof, printed p. 49; its hash matches the inherited source record. E410 is preserved. No new error was found in the selected Prasolov proof. This is not an errata audit of the rest of either source.
- Nine relevant library declaration statements were freshly checked at the recorded pins; seven were new baseline entries and two already present. Further existing prerequisites were checked where used. The symmetric Rouché theorem is `TauCeti.rouche_symm` at line 268 of its pinned module; there is no new analytic owner or request.
- The ordinary strict domination bound can fail at equality. At f=X²+2X−1, g=X²+2X and z=−1, |f−g|=|g|=1, whereas |f−g|<|f|+|g| is 1<3. The plan uses the pinned symmetric theorem.
- Suggested Lean file, 5,812 lines: compiled against the pinned Mathlib sources with exit 0, exactly 932 expected placeholder warnings and no other warnings. The unchanged starting file was also compiled: exit 0, 916 expected placeholder warnings. All 8,482 transitive Mathlib source files matched the pinned source tree. The suggested file retains individual Mathlib imports; the Tau Ceti theorem is a proof dependency described in the document, not redeclared in the suggested file.
- Separate scratch Lean check: the real-scalar unit-circle equality argument plus eleven concrete checks compiled with exit 0, no placeholders and no warnings. They check both coefficient signs, both excluded endpoints, a zero constant, a repeated root counted twice, the complex-coefficient counterexample, symmetric versus strict domination, and degree one. These validate the delicate subargument and examples, not a completed formal proof of the four planned declarations.
- Blueprint checker with the pinned declaration index: 0 errors and 0 warnings.

### Resume here

CA.3's remaining work is Int(𝓞_K): local characteristic-ideal formulas, the factorial-ideal/principal-ideal regular-basis criterion and the Pólya group, with a public proof source still needed. Other stages' exact remaining entries, gaps and supplier requests remain those of the inherited packet. CA.3 has 41 nodes, not 37. Do not add a seventh CA.3 planet. Prasolov's neighboring criteria and the rest of the book have not been newly decomposed.

The earlier handoff below is retained as historical provenance; its 312-node counts and Perron equality-case remaining entry describe the preceding checkpoint and are superseded by this section.

---

## Earlier checkpoint — 24 September 2026

- **This pass:** Claude Code, session `cc-2aeb03`, 24 September 2026. It continues the first pass (Claude Code, session
  `cc-7b31c4`, #2837) as the job instructs: keep what is right, extend what is missing.
- **Binding restructuring:** RS-03, accepted by REV-RS-03. It is followed as written: CA.1, CA.3, CA.5 and CA.6
  narrowed to their `keeps`, and CA.0, CA.2, CA.4 and CA.7 kept.

## Deliverables

- **Packet:** `research/blueprint/packets/ClassicalArithmeticCompletion.json`.
  - 312 nodes, up from 10: 120 theorems, 108 lemmas, 45 definitions, 27 constructions, 7 applications and
    5 comparisons.
  - 501 API items, 279 unit tests and 42 planets (six in each layer except CA.0).
  - 579 pinned baseline declarations.
  - 50 source issues, 8 gaps, 19 requests and 3 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/ClassicalArithmeticCompletion.md`, one section per layer, which
  agrees with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/ClassicalArithmeticCompletion.lean`, 5,746 lines in
  namespace `TauCeti.ClassicalArithmetic`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - The first pass's file had never been elaborated.
  - Every API item and unit test in the packet occurs in it under its packet name.
  - It imports Mathlib only. Where a node uses a Tau Ceti declaration, the file says so in a comment.

## The first pass's ten nodes

All ten are kept under their ids, and all ten are corrected:

- **CA.0, the CRT at non-coprime moduli:** the uniqueness half is already Mathlib's
  `Int.modEq_and_modEq_iff_modEq_lcm`, so the node is now the existence half only. It is stated for all integer moduli.
- **CA.1, the units modulo 2^e:** the API items Mathlib already has are dropped (`ZMod.orderOf_five`, non-cyclicity).
  The node is now the explicit isomorphism with its evaluation lemmas, and its excerpts are literal.
- **CA.1, the d-th power criterion in a cyclic group:** now rests on the pinned cyclic-group counting lemmas rather than
  on Euler's criterion, which is its case d = 2. Its source is Shoup, Theorem 6.32, which has the gcd form.
- **CA.1, the criterion in a finite field:** now holds for every finite field, not only ZMod p, and for every n. Its
  planet moves to the power residue symbol.
- **CA.2, the minimal polynomial of a sequence:** it was defined as "the monic polynomial dividing every generating
  polynomial", which 1 satisfies. It is now the monic generator of the ideal of generating polynomials.
- **CA.2, the rational-power-series and rational-iff-linearly-generated nodes:** their excerpts were paraphrases.
  They are now literal.
- **CA.3, the Smith normal form:** now a terminating algorithm that returns a certificate with explicit inverses.
- **CA.3, the invariant-factor decomposition:** widened from abelian groups to modules over a PID, which the rational
  canonical form needs.
- **CA.4, integer linear systems:** it now allows zero diagonal entries, and its excerpt is literal.

Two of the first pass's structural proposals are replaced:

- **Removing CA.5:** withdrawn, since RS-03 keeps CA.5 as a comparison layer.
- **Moving CA.7 out:** restated. Its no-source reason no longer holds; its independence reason stands.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| CA.0 | closed | 1 | nothing |
| CA.1 | partial | 34 | biquadratic reciprocity (the one public statement read is wrong: E203, E204); the two inputs of Eisenstein reciprocity besides Stickelberger's relation (which FiniteFieldsAndCharacterSums FF.1 now plans); explicit Hilbert symbols at the places above n |
| CA.2 | partial | 48 | Ward's strong divisibility of elliptic divisibility sequences (needs gcd(W₃, W₄) = 1); Cobham's theorem (decompose Krebs, arXiv:1801.06704) |
| CA.3 | partial | 37 | Int(𝓞_K) beyond the regular-basis criterion (Pólya group; no public proof); the equality case of Perron's criterion |
| CA.4 | source decomposed | 74 | nothing in the sources; Catalan–Mihăilescu is a gap (no owner) |
| CA.5 | source decomposed | 18 | nothing |
| CA.6 | partial | 45 | the analytic step of Smyth's theorem (no public source for Smyth 1971); an owner for Dimitrov's potential-theoretic inputs |
| CA.7 | partial | 55 | the proofs of Fröhlich's and Taylor's theorems; Jacobinski cancellation; Reiner's Theorem 27.4 beyond simple algebras |

**Maintainer-added sources, covered in full:**

- **Bennett–Siksek:**
  - item 72 is `CA.1/quadratic-character-of-a-squareclass`, built on a Kronecker-character node;
  - item 152 is `CA.1/two-adic-conductor-bound`;
  - item 81 is `CA.4/quartic-descent-t4-plus-v4-equals-2u2`. It reduces to x⁴ − y⁴ = z², not to Mathlib's
    x⁴ + y⁴ = z², so Fermat's right-triangle theorem is planned too.
- **Martin, items 1–13:** the Markoff surface and its positive triples, the Vieta moves with their properties, the
  descent inequality, Markoff's tree theorem, reduction mod p and the definition of strong approximation. The
  strong-approximation theorem itself belongs to the ArithmeticDynamics Part II.

**Requests from other packets, answered:**

- **DT.2's request to CA.2** (Evertse, Theorem 8.17) is `CA.2/closed-form-of-a-complex-linear-recurrence`, with the
  uniqueness requested. `CA.2/closed-forms-satisfy-a-linear-recurrence` is its converse.
- **CA.6 cites DT.0** for the Mahler measure of an algebraic number, the house and log M = deg · h, and does not
  re-plan them.

## Requests made (19)

- **CA.1:**
  - FiniteFieldsAndCharacterSums FF.1;
  - K2SymbolsBrauer T.7;
  - Tau Ceti ClassFieldTheory layers 6, 11 and 14;
  - LocalFieldsRamification layer 2;
  - QuadraticFormInvariants 6C;
  - GlobalQuadraticForms layer 4.

  The quadratic Hilbert symbol is owned upstream, and `CA.1/hilbert-symbol` states its values in Mathlib's `legendreSym`,
  `ZMod.χ₄` and `ZMod.χ₈`.
- **CA.4:** QSeriesPartitionsAndMockModularForms QM.0, for the Jacobi triple product (Jacobi's four-square count).
- **CA.5:** ComputationalNumberTheory CN.2, for certified output formats.
- **CA.6:**
  - DT.0, for Siegel's lemma in product form;
  - AnalyticNumberTheory AN.2, for Rosser–Schoenfeld prime counts;
  - ArithmeticDynamics DY.1, for canonical heights on P¹.
- **CA.7:**
  - Tau Ceti NumberFieldArithmetic layer 5;
  - LocalFieldsRamification layers 2 and 3;
  - ClassFieldTheory layer 13 (Kronecker–Weber);
  - CharacterTheory layer 7;
  - KTheoryLowDegrees Z.1 (ring K₀).

## For the orchestrator

1. **Sources this job did not list.** Source routes in paper extractions (`research/blueprint/papers/*.result.json`)
   name this roadmap's layers for items the issue did not list:
   - Barysoroker–Koukoulopoulos–Kozma items 51, 58, 69 and 70 (CA.3, CA.6);
   - Bhargava–Shankar–Wang item 74 (CA.3);
   - Calegari–Geraghty's zeros of a binary quadratic form mod p (CA.1);
   - Chen items 9, 10 and 90 (CA.4);
   - Gamburd–Magee–Ronan items 1–5 (CA.4);
   - Ghosh–Sarnak items 3–17, 24–26, 35–39, 61 and 62 (CA.1, CA.4);
   - Koymans–Milovic items 3 and 4 (CA.1);
   - Koymans–Pagano items 2–5, 9 and 12 (CA.4);
   - Lawrence–Sawin items 66 and 67 (CA.2);
   - Smith items 1–3 and 17 (CA.3, CA.6);
   - Yu items 103–105 and 179 (CA.2).

   They were not covered here, since the maintainer sources for this job are Bennett–Siksek and Martin. Some may
   already be met; for example, the Markoff nodes of CA.4 may supply the Markoff carriers of Gamburd–Magee–Ronan and
   Chen. That has not been checked item by item. The next queue for this roadmap should name these routes.
2. **Supplier list.** The job names `BP-FoundationsAndLibraryIntegration`, retired on 16 September 2026. The gap
   stays recorded.
3. **Structural proposals:**
   - Give Dimitrov's potential-theoretic inputs to DT.5, or to a small new roadmap.
   - Divide CA.7 into four sub-layers.
   - Split CA.7 into a roadmap `IntegralGaloisModuleStructure`. RS-03 keeps it here, so it is planned where it
     stands.
4. **Stage links proposed by CA.4's routing interface** (exported, nothing imported): CA.4 →
   HeightsRationalPointsAndObstructions RP.6, CA.4 → EffectiveDiophantineMethods ED.3, and CA.4 → the
   ArithmeticDynamics Part II on Markoff actions.
5. **Corrections to the audit (AUDIT-18):**
   - `IsGalois.normalBasis` is in the declaration index, contrary to the audit's CA.7 note;
   - `fermatLastTheoremThree` is in the index, as the first pass already recorded.
6. **Existing formal work.** A complete Lean formalisation of Ramanujan–Nagell exists outside Tau Ceti (Banwait,
   arXiv:2604.09808). The CA.4 section cites it for coordination.

## Sources

The pass read 76 free sources. Their URLs, the sections read and the SHA-256 of each are in the packet. Among them:

- Bennett–Siksek, the Annals PDF (arXiv:1709.01022), with the hash the paper extraction records;
- Martin (arXiv:2502.15960);
- Voight's *Quaternion Algebras*;
- Milne's CFT and ANT notes;
- Keith Conrad's expository handouts;
- Evertse's Leiden notes;
- Christol–Kamae–Mendès France–Rauzy (Numdam), Bridy, and Adamczewski–Yassawi;
- Hatcher's *Topology of Numbers*;
- Cahen–Chabert;
- Ankeny (three squares) and Hirschhorn (four squares);
- Smyth's surveys (arXiv:math/0701397, arXiv:1408.0195) and Dimitrov (arXiv:1912.12545);
- Berrevoets's thesis, for Dobrowolski;
- Johnston's *Notes on Galois Modules*, Ullom and Taylor.

**Missing sources:**

- Smyth 1971;
- a public proof of biquadratic reciprocity;
- Fröhlich's book;
- Jacobinski's cancellation theorem;
- Cahen–Chabert's book.
