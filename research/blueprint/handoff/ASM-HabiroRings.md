# Handoff: ASM-HabiroRings (issue #6422)

This job assembles the roadmap *Habiro rings: relative arithmetic constructions and cohomological coefficients* from its six reviewed parts:

- HR.1–HR.7, written by BP-HabiroRings and reviewed by REV-HabiroRings, then brought in line with RS-10 by FIX-RT-AREA-etale~2 and reviewed by REV-FIX-RT-AREA-etale~2;
- HR.1, HR.2, HR.3, HR.4 and HR.6, written by BP-HabiroRings--HR.1, --HR.2, --HR.3, --HR.4 and --HR.6, and reviewed by the matching REV jobs on 6 October 2026.

Worker: Claude, session claude-RjwTLb. I took no part in any of the parts or in their reviews.

## Files

- `research/blueprint/readmes/HabiroRings.md`: the full roadmap document. It replaces the first part's document, which was a field-by-field dump of the first packet.
- `research/blueprint/suggested/HabiroRings.lean`: the six parts' suggested files, joined into one. It replaces the first part's file.
- `research/blueprint/handoff/ASM-HabiroRings.md`: this note.

The part packets are not deliverables of this job, and they are unchanged. Editing them would put non-deliverable paths in the pull request, and it would change files that have already been reviewed. The fixes they need are listed below for a job that owns them. The same choice was made by ASM-HabiroCyclotomicCompletions.

## What was done

- **The roadmap document** is generated from the six packets as their reviews left them, so it agrees with them node for node.
  - All 89 nodes (50 + 17 + 5 + 7 + 7 + 3) are there: every statement, hypothesis, proof outline, API item, unit test, acceptance check, use, dependency, library record and source.
  - A scripted check finds every node id, API name, test name, prerequisite, request supplier, gap, source issue and baseline declaration in the document. All 215 source excerpts appear verbatim.
  - Each follow-up review asked that the part's reader be brought in line with the corrected packet at assembly: counts, API items, the λ³ sign, dependencies and the source findings. Generating the node text from the corrected packets does this, and no part document's node text is reused.
  - **New sections.**
    - An introduction: purpose and scope; boundaries, with suppliers, consumers and the RS-10 owners; conventions; sources with every alias, file hash and section read; the versions read; and the 109 pinned declarations.
    - A layer overview, and a written overview for each layer that says what the first packet plans, what the follow-up adds, and what is still open.
    - Closing sections that merge the parts' 17 source issues and the findings they reuse, the 18 gaps (each with its current status), the 39 requests, and the 12 structural proposals (each with its status).
    - A table of the five requests HabiroCohomologyFoundations' HQ.1 packet files with this roadmap, with the node ids that answer each.
    - The layer dependencies, and a list of what the blueprint does not claim.
  - **Assembly notes.** Thirteen nodes are followed by an **Assembly note**. Each note carries a reviewer's instruction or a cross-part fact into the node it concerns, and changes no packet:
    - the refined staticity proof for `HR.4/the-limit-of-the-finite-stages-is-static`, which REV-HabiroRings--HR.4 asked the assembly to use;
    - the corrected HQ.4 supplier for `HR.6/the-degree-zero-identification`, from REV-HabiroRings--HR.6;
    - the PR.0 routing for `HR.1/lambda-rings-with-commuting-adams-operations`, from REV-HabiroRings--HR.1;
    - the follow-up nodes that now answer gaps or proof steps of first-packet nodes.
- **HR.2:solid.** HR.2 is displayed as the two sub-layers that the first packet and the HR.2 part both propose:
  - HR.2: 9 nodes, 3 planets;
  - HR.2:solid: 5 nodes, 2 planets.
  The node ids are unchanged. Every layer has at most six planets (HR.1 and HR.4 have six each; 27 in all).
- **Notation.**
  - The document's node prose writes q-W_m for the q-Witt rings, which the parts wrote both q-W_m and qW_m.
  - It writes ℤ, ℚ and 𝔽_ℓ where Z, Q and F_ℓ denote number systems, and → for ASCII arrows.
  - A letter is converted only where its meaning is unambiguous. Z still names a closed subset in the descent principle, Q a poset or a complete object in the HR.2 and HR.3 parts, and F_p the Witt Frobenius in the HR.1 part.
  - Lean names, code spans, API and test names and literal excerpts are untouched. The Conventions section records the conventions, including the HR.2 part's use of R for S[q^{±1}].
- **Cross-part prerequisites.**
  - Every prerequisite that points into another part names an existing node id: 46 references from the follow-up packets into the first packet, and 4 from the HR.4 part into the HR.3 part. The first packet never refers to the follow-ups.
  - The node graph of all six packets is acyclic, also through every packet on main.
  - It follows the layer order except for one edge. Eleven HR.1-part nodes use `HR.4/truncated-big-witt-vectors`. That node uses only the HR.1 Λ-ring definition, so there is no cycle, but at stage level HR.1 → HR.4 runs backwards. The document records this under Dependencies. The edge disappears when RS-10 moves big Witt vectors to QWittVectors QW.0.
  - Several first-packet nodes should now cite follow-up nodes. The fixes are clear and acyclic, but they are packet edits, so they are listed below.
- **`check_blueprint.py`**, with the pinned declaration index, reports 0 errors and 0 warnings on all six part packets. `intake.py check-files` passes on the three deliverables.
- **The Lean file.**
  - It has one standard note, one import block (the union of the six, without Tau Ceti) and one namespace, `TauCeti.Habiro`. The first part's body comes first, in layer order. The follow-ups sit in sections `HR1FollowUp` (placed after HR.4's big Witt vectors, which it uses), `HR2FollowUp`, `HR3FollowUp`, `HR4FollowUp` and `HR6FollowUp`.
  - The HR.1 part's adapters are replaced by the first part's objects, as its file asked:
    - `BigWitt A` is `BigWittVector TruncationSet.univ A`, with `ℕ+`-indexed `coeff`, `ofCoeff`, `ghost`, `map` and `teichmuller` wrappers;
    - `Adams A` is `LambdaRing A`, with `Adams.Hom := LambdaRing.Hom` and `Adams.integer := LambdaRing.trivialInt`;
    - `Adams.toWitt` is `LambdaRing.toBigWitt`;
    - the part's private `Via` is dropped in favour of the prelude's.
  - The HR.2 part's local `factorialPolynomial n` is the prelude's `factorialPoly ℤ n`, and the HR.3 part's `CyclotomicIndex.primeChain` is defined as the first part's `divisorChain`.
  - Namespaces: the HR.1 part's `HabiroHR1` and the HR.6 part's `TauCeti.HabiroCoefficients` become `TauCeti.Habiro`; every relative name is unchanged.
  - **Tau Ceti.** The first part imported `TauCeti.RingTheory.Cyclotomic.Lift` for two clauses of `phi_five_over_f_eleven`. The shared build at the pins in which `lean-check` runs has no oleans for that module, and workers may not build Tau Ceti. The two clauses are therefore restated over Mathlib, through a new real definition `phiFiveResidues : ℤ[X] →+* (Fin 4 → ZMod 11)`, evaluation at 3, 4, 5 and 9. The clauses say it is surjective with kernel `(11, Φ_5)`. The docstring and the module note name the pinned Tau Ceti map `TauCeti.Cyclotomic.conjugateResiduesRingHom` and its surjectivity theorem, which an implementation should use.
  - Every node id, API name and unit-test name of the six packets appears in the file. 81 API names are not declarations: they are the derived, spectral and solid items the parts record as omitted signatures in comments, with exact statements and suppliers, and each appears verbatim there. A `#check` of every other API name succeeds.
  - `lean-check` at the pinned Mathlib 082e2d3 exits 0. Its only warnings are 454 `declaration uses 'sorry'`. The six part files give 302 (the first, without the Tau Ceti import), 88, 10, 12, 32 and 15, a total of 459; five `sorry`s of the HR.1 part's adapters are replaced by the first part's real definitions.

## Fixes the part packets need (not deliverables here)

No reviewed mathematics changed in this job. These are the edits a job that owns the packets should make; none changes a statement.

1. **First packet: gaps answered by the HR.1 part.** REV-HabiroRings--HR.1 asks to replace exactly these two gap records and keep the rest:
   - 'Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors' is supplied by `HR.1/wilkerson-comparison` and the HR.1 Witt nodes, with `HR.4/truncated-big-witt-vectors`.
   - 'Free Λ-rings: construction and perfect covering' is supplied by `HR.1/free-lambda-ring` … `HR.1/free-lambda-perfect-cover`.

   With them go the "(gap)" remarks in the statements and API of `HR.1/lambda-rings-with-commuting-adams-operations` (`LambdaRing.toBigWitt`) and `HR.1/perfectly-covered`, and the HR.1 coverage record's remaining items.
2. **`HR.1/lambda-rings-with-commuting-adams-operations`.** Replace the stage prerequisite `PrismaticCohomology:PR.0` by the node `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`, as REV-HabiroRings--HR.1 asks. `HR.1/the-etale-frobenius-lift` cites the stage too.
3. **`HR.4/the-etale-lift`.** Add `HR.4/complete-principal-deformation-universality` and `HR.4/cyclotomic-ghost-lift-coherence` to its prerequisites, and replace "(gap on completed deformations)" in step 1 by them. Both depend only on HR.1, HR.3 and HR.4-part nodes, so there is no cycle. Then the first packet's gap 'Unique completed deformations of étale algebras' becomes the HR.4 part's conditional plan; its remaining supplier refinements are the HR.4 part's first gap.
4. **`HR.4/the-limit-of-the-finite-stages-is-static`.** REV-HabiroRings--HR.4 asks to replace step 2 by the HR.4 part's argument:
   - the reduction modulo Φ_d(q) of underlying modules is a finite cofibre, so it commutes with limits;
   - it is constant, (R ⊗_{A,ψ^d} A)[q]/Φ_d(q), on the cofinal tail with d | m;
   - HR.2's detection result then shows the limit is static.

   The document prints this argument as the node's Assembly note.
5. **`HR.6/the-degree-zero-identification`.** REV-HabiroRings--HR.6 asks for two changes:
   - replace `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard` by `HabiroCohomologyFoundations:HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras` (Corollary 3.31);
   - add `HR.4/complete-principal-deformation-universality` for the uniqueness of étale deformations.
6. **`HR.6/the-regulator-dies-after-q-minus-one-completion`.** Add `HR.6/followup-completed-regulator-triviality`; it does not depend on this node. The first packet's last gap then reads as refined: conditional on HB.7 descent, with G-nonzero-regulator separate.
7. **`HR.3/the-morphism-level-statement`.** Add `HR.3/coherent-completion-diagram` and `HR.3/finite-localisation-contract`, which verify the descent hypotheses its proof applies; neither depends on it. The first packet's gap 'Higher-categorical inputs of the general descent principle' should point to the HR.3 part's five requests.
8. **`HR.4/the-lambda-ring-comparison-maps`.** Step (i) uses "the section s of HR.4/truncated-big-witt-vectors". Add `HR.1/adams-to-witt-section`, its construction.
   - `LambdaRing.toBigWitt` (first packet, HR.1), `Adams.toWitt` (HR.1 part) and `BigWittVector.lambdaSection` (HR.4) are three API names for one map. A later job should keep one name and make the others aliases. The Lean file already defines them in terms of one another.
9. **Stale prose in the first packet.**
   - The HR.1, HR.2, HR.3, HR.4 and HR.6 coverage records still read `partial`, with remaining items that the follow-ups now answer or refine.
   - The HR.5 and HR.7 coverage notes refer to a gap 'The companion q-Witt paper is obtained but HR.1 and HR.4 do not yet decompose it', which is no longer among the packet's gaps. Lemma 2.46 is in `HR.4/relative-q-witt-rings`, and Corollary 2.52 is `HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift`.
   - The HR.7 coverage note says the suggested Lean file "must be regenerated" because of placeholder theorems; the current file has none.
10. **Namespaces.** The HR.1 part's nodes record `library.namespace` `HabiroHR1`, a working namespace its own file asks the assembly to replace. The HR.6 part records `TauCeti.HabiroCoefficients` and declaration names under it. The joined Lean file uses `TauCeti.Habiro` for both; the packet fields should follow.
11. **HR.2 part, `HR.2/solid-habiro-unit-idempotence`.** It cites the stage `HabiroCyclotomicCompletions:HC.1` beside the node `HC.1/the-factorial-polynomials`. Its HC.1 request (quotient rank, monic normalisation, integral quotient bases) is answered by HC.1/HC.2/HC.4 nodes. ASM-HabiroCyclotomicCompletions lists them: `HC.1/the-factorial-polynomials`, `HC.2/factorial-expansions`, `HC.4/finite-precision-bases`. The stage citation can become those ids.

## Structural proposals and ownership

All twelve proposals are given in full in the document's "Structural proposals" section, each with its status.

| Proposal | Part | Status |
|---|---|---|
| HR.2 carries a general theory and a specific one | first | superseded by the next |
| Move Wagner B.6–B.8 off the HR.2 critical path (sub-layer HR.2:solid) | first | awaiting the maintainer; the document already displays it |
| Big Witt vectors with truncation sets are planned in HR.4 | first | interim; permanent owner QWittVectors QW.0 under RS-10 |
| Historical restriction-obstruction concern | first | resolved |
| HR.4's citation of the obstruction (stage text should cite q-Witt 2.14) | first | open stage-text edit |
| HQ.1 packet makes HQ.3 and HQ.5 depend on HR.6 | first | resolved (the HR.6 part rechecked the HQ packets) |
| Remark 2.14 is also HB.6's comparison | first | settled by RS-10 |
| RS-10 promotion boundary | first | current, governs all parts |
| Retain HR.2:solid off the algebraic critical path | HR.2 | awaiting the maintainer; same sub-layer |
| New roadmap "Artin v-stacks …, Part II: light solid spectra" | HR.2 | not recommended: RS-10 already names SolidAnalyticRings SA.1, whose draft SA.1 cites Wagner B.6–B.8. Give the G-solid contract to SA.1 |
| E0/E3/E5 ownership refinements for finite descent | HR.3 | awaiting the maintainer; requests filed |
| DD.1/E1/E5 refinements; HR.4 owns marked deformations | HR.4 | awaiting the maintainer; requests filed |

**For the maintainer.**

- **The early Taylor ring.** RS-10's HR.1 entry adds the early Taylor-glued ring H^Tay_{R/A} for polynomial or toric Λ-bases and étale R, with its ring, functor and H_ℤ-algebra API (PLAN-HABIRO §6.2). No packet plans it. The HR.1 part records it as a separate obligation, and the atlas stage text of HR.1 does not contain it yet. It needs a follow-up job once RS-10 is installed. HR.5 already plans the Taylor presentation as a theorem about H_{R/A}.
- **Light solid spectra.** Gaps G-solid (HR.2 part) and 'Solid light condensed spectra have no supplier' (first packet) have no owner. The recommendation is SolidAnalyticRings SA.1, as RS-10 says, rather than the new Part II the HR.2 part proposes.
- **Stage texts.** HR.1 (the early Taylor ring), HR.2 (the solid sub-layer) and HR.4 (cite q-Witt 2.14 beside 1.3) lag the accepted proposals.
- **RS-10 installation.** On installation of QWittVectors, move these nodes, their consumers and the Lean declarations to QW.0–QW.4 in one step:
  - `HR.4/truncated-big-witt-vectors`, the HR.1 part's Witt and coalgebra nodes, and the Λ-ring nodes of HR.1 (QW.0, QW.1);
  - the degree-zero q-Witt nodes of HR.4 (QW.2–QW.4).

  The HR.1 → HR.4 stage edge then disappears.

## Requests of the parts

The parts file 39 requests, tabulated in the document's Requests section:

| Supplier | Requests | From |
|---|---|---|
| DerivedDeRhamCohomology DD.1 | 5 | first, HR.1, HR.2, HR.3, HR.4 |
| EnhancedDerivedSheaves E0, E1, E3, E5:abstract, E5:presentability, E5:spectra-comparison | 14 | first (5), HR.2 (3), HR.3 (4), HR.4 (2) |
| StableHomotopyKTheory H.5:spectra, H.5:S-delooping, H.6 | 4 | first, HR.2 |
| PrismaticCohomology PR.0 | 1 | first |
| HabiroCyclotomicCompletions HC.1, HC.3, HC.4, HC.5 | 5 | first, HR.2 |
| VStackSheavesAndLisseCategories VS2 | 2 | first, HR.2 |
| QSeriesPartitionsAndMockModularForms QM.0 | 1 | HR.2 |
| HabiroCohomologyFoundations HQ.3, HQ.4, HQ.5 | 3 | first |
| HabiroNumberFields HB.6, HB.7 | 3 | first, HR.6 |
| QWittVectors QW.0 | 1 | HR.4 |

Other roadmaps' requests to this one come only from HabiroCohomologyFoundations' HQ.1 packet, five by stage. The document's table answers each with node ids. Proposition 2.15, Corollary 2.22, the localisation formula and the p-local decomposition that its HR.4 request also asks for are not planned here; under RS-10 they belong to QWittVectors QW.2–QW.4.

## For the reviewer

- **The superseded part documents.** `readmes/HabiroRings--HR.1.md`, `--HR.2.md`, `--HR.3.md`, `--HR.4.md` and `--HR.6.md` are superseded by this document. They are not this job's files and were not edited. Their reviews list the points where they lag the corrected packets.
- **The display split of HR.2.** The packets carry 5 planets on HR.2 in all, within the limit, so the split is not needed for the planet count. It follows the two parts' proposal, and the maintainer decides it.
- **The generator.** The document's node sections, library list, sources, source issues, gaps, requests and proposals are generated from the packets by a script kept in scratch space. The hand-written parts are the introduction, the conventions, the layer overviews, the assembly notes and the status notes.
