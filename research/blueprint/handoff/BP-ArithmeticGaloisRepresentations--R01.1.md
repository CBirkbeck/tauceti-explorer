# Handoff: BP-ArithmeticGaloisRepresentations--R01.1

Issue #7955; agent Codex; session `codex-iF4SzK`. This run claims and submits only this job. The bot confirmed the claim in [issue comment 6088950328](https://github.com/CBirkbeck/tauceti-explorer/issues/7955#issuecomment-6088950328).

## Result and deliverables

This is a complete **target-level planning pass**, following the current WORKERS.md and detail.json rather than the issue's older instruction to make every API lemma a separate node. Coverage of `ArithmeticGaloisRepresentations:R01.1` is **planned**, not closed. Two precise source/export gaps remain for the general reductive targets. Nothing is claimed formalized; every node's implementation status is unchecked.

- [Packet](../packets/ArithmeticGaloisRepresentations--R01.1.json): 31 fresh refinement nodes — 1 definition, 23 constructions, 3 comparisons and 4 theorems; 116 API items; 72 new unit tests; 5 new planet flags; 36 directly cited pinned baseline declarations; 6 supplier contracts; 2 gaps.
- [Reader](../readmes/ArithmeticGaloisRepresentations--R01.1.md): the mathematical route, exact new interfaces, retained principal-carrier API/tests and retained theorem contracts. The reader states conventions and supplier ownership, including the broader parent Ribet statement.
- [Suggested file](../suggested/ArithmeticGaloisRepresentations--R01.1.lean): R01.1 principal carriers and arithmetic wrappers, all 116 new API names and the 72 new test examples, plus retained APIs/tests. It uses existing Tau Ceti algebraic scalar change, density/Burnside, continuous Hom, composition multiplicity and Teichmüller interfaces.

The reviewed parent packet, integrated decomposition, atlas, links, application and other jobs' files are untouched. Fresh IDs start `ArithmeticGaloisRepresentations:R01.1/refined-`; `refines` and the assembly object specify how to attach them without renaming principal carriers. The packet records 41 retained non-constructor parent contracts in `importedNodes`; its principal-carrier list separately preserves the 6 original carriers. Imported contracts are not new target counts.

The linear-representation chain is specified through the reviewed parent, pinned declarations and exact lower-tier suppliers. This does not assert that the whole stage has no remaining supplier obligations. The general reductive integral and residual targets stay planned with their two explicit boundaries.

## Confirmed finding and mathematical checks

`RT-AREA-langlands-1/17` is handled by the new perfect-field Brauer–Nesbitt and lattice-independence nodes. Their prerequisite graph explicitly includes IHG.0 Amitsur, IHG.0 matrix determinants and IHG.1 algebraically closed reconstruction. The proof extends semisimple representations over a perfect residue field to its algebraic closure, recovers the full determinant polynomial law from all characteristic polynomials, invokes reconstruction uniqueness, and descends through Noether–Deuring on the finite-dimensional simultaneous image algebra. It imposes no dimension factorial restriction. Trace-only results retain their separate hypotheses. The parent general-field Brauer–Nesbitt and trace theorem contracts remain imported rather than being weakened to the new arithmetic perfect-field specialization.

Other conventions and pitfalls addressed:

- Joint continuity includes the group variable; Mathlib ContRepresentation alone does not. The comparison uses finite generators and module topology.
- Finite projective determinants use a free complement, with determinant one in rank zero. IHG.0 already owns the constant-rank polynomial law, and AlgebraicVectorBundles L0C owns exterior powers. The new target adds the continuous character. The retained parent complement determinant supplies varying-rank generality.
- Six module operations are separate constructions. Duals and internal Hom use the inverse action; integral conjugacy is over the coefficient ring itself.
- Composition factors and absolute irreducibility are algebraic for arbitrary monoids and fields, without a topology on an algebraic closure. Invariants and Hom base change do not inherit the pinned Tau Ceti theorem's finite-monoid restriction.
- Semisimplification includes every factor with multiplicity. Base change over an arbitrary field extension includes a second semisimplification; removing it uses perfectness.
- Local-ring reduction, chosen-lattice reduction and the residual isomorphism class are separate. Raw unipotent reductions distinguish two lattices; only their semisimplifications agree.
- The residual representative records a fixed residue-field identification. Its independence is an isomorphism assertion, not equality of chosen carriers.
- Coefficient Frobenius is entrywise p-th power, rather than conjugation in the source group. The Galois coefficient comparison uses an actual commuting residue square; arithmetic Frobenius is x ↦ x^ℓ.
- The Tate root comparison now has a homeomorphism signature, a multiplication-to-addition equation and Galois equivariance. The saturation tests check both intersection and quotient lattices, including zero and full subspace cases.
- Irreducibility of the residual representation over the finite residue field suffices for the parent homothety and pairing results. The source's stronger-looking parent title does not add absolute irreducibility to these hypotheses.

## Existing owners and six supplier contracts

The roadmap tier order places IHG in tier 3, ReductiveGroupsPartII below it, and ArithmeticGaloisRepresentations in tier 7. The imports do not move a higher-tier prerequisite into this stage. Downstream consumers mentioned in `uses` are applications, not prerequisites.

1. **IHG.1 Classical Ribet lattice.** Current `TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants.Theorems.ribet_lattice` assumes distinct residual characters. Ribet Proposition 2.1, pp.154–155, does not: the convergent successive-conjugation proof also handles coincident characters. Import the existing export for distinct characters and request the repeated-character specialization at the same owner. The packet does not create another Ribet node. This is an export-scope obligation, distinct from the two general reductive source gaps.
2. **RepresentationTheory/InductionRestriction Layer 0.** Import existing induction-in-stages and projection-formula maps, along with the existing algebraic Mackey contract. This request records the exact contract behind the coarse upstream layer reference; no additional algebraic induction target is needed. This part supplies continuity in finite transversal coordinates.
3. **LocalFieldsRamification Layer 2.** Supply the actual coefficient-field residue action and arithmetic Frobenius x ↦ x^ℓ in the coefficient absolute Galois group.
4. **LocalFieldsRamification Layer 4.** Supply its inertia kernel and lift independence. The two contracts are needed for the coefficient-Galois specialization, not for base-field decomposition-group restriction.
5. **ReductiveGroupsPartII RG2.3.** Import current `compact-elements-in-hyperspecial-subgroups` (2), already owned there. Resolve its recorded compact-subgroup reference gap and identify the totally ramified specialization for an already split group used by BHKT Theorem 4.8(ii). The assembly supplier override replaces the parent's coarse RG2.2 consumer edge with this exact RG2.3 contract. A new building or a duplicate compact-subgroup theorem is not planned here.
6. **IHG.1/reductive-reconstruction.** The atlas contract covers general split connected reductive groups and full invariant-tuple pseudocharacters, but current upstream §1.7 and `ReductivePseudocharacter.gl_reconstruction` export GL reconstruction. Extend the existing owner to export the BHKT Theorem 4.5 general contract with complete reducibility and scalar change. The determinant in one faithful representation does not replace it.

AlgebraicVectorBundles L0C is an already present current upstream supplier, recorded separately because it is absent from the atlas snapshot's stage registry. Its exterior-power objects are imported and are not a new request to invent them. Current IHG.0 finite-projective determinant and IHG.1 algebraically closed determinant reconstruction are exact node imports.

The LocalFieldsRamification link-map note currently says R01.1 uses no local-field object directly. Its coefficient-Galois reduction comparison does use the Layer 2/4 residue contracts. The packet records this for assembly; this job makes no link-map edit.

## Two gaps and where to resume

**Compact-subgroup hyperspecial passage.** BHKT Theorem 4.8(ii), p.17, invokes Larsen (1995), Lemma 2.4, DOI `10.1215/S0012-7094-95-08021-1`. Its proof was not obtainable from an authorized primary source. Current RG2.3 already states the relevant compact-subgroup target and explicitly records a rational-fixed-point/ramification-rescaling reference gap. A reviewer or owner should resolve that source boundary and check the totally ramified scope for split groups. The single-element Kisin–Zhou lemma does not prove the compact-subgroup clause. Ordinary GL_n stable lattices do not require this input.

**General reductive reconstruction export.** Align the atlas IHG.1 general reconstruction contract with a current upstream export of BHKT Theorem 4.5. Use §3.1 complete reducibility and tuple-invariant evaluations. Once this and the RG2.3 boundary are resolved, assemble the retained general Ĝ integral/residual statements. The GL_n residual independence proof already has its exact determinant reconstruction input.

The next action for this submission is an independent review, not another claim by this worker. Review should validate the exact source scopes, packet-to-prototype signatures, 72 new tests and retained interfaces. Assembly must then discharge the supplier contracts or carry their precise boundaries forward. No second job was claimed and no independent review of this worker's own work was performed.

## Sources and library checks

Public primary sources read on 9 October 2026:

- Darmon–Diamond–Taylor, *Fermat's Last Theorem*, the public 2007 McGill version, §2.1, pp.50–54, including Proposition 2.6 and its proof.
- Chenevier, arXiv:0809.0415v2, §1.10, Lemma 1.12(ii) and Corollary 1.14, pp.12–14; Theorem 2.12 and Corollary 2.13, pp.28–30; Example 2.34, p.39. The Amitsur locator is pp.12–14, correcting the inherited lead's earlier pagination.
- BHKT, arXiv:1609.03491v2, §3.1, Definitions 3.3 and 3.5 and Proposition 3.6, pp.8–9; Definition 4.1, Lemma 4.4, Theorems 4.5 and 4.8 and Definition 4.9, pp.13–17. Lemma 4.4(i) is coefficient change, and (ii) is group change.
- Benson–Reichstein, public author manuscript of 24 February 2017, §2, Theorem 2.2 and Lemma 2.3, p.4.
- Ribet (1976), public GDZ scan, §2 and Proposition 2.1 with proof, printed pp.153–155, read on the page images.
- Deligne–Serre (1974), public Numdam copy, §§6.12–6.13, p.523, checked for the boundary between finite-field descent and minimal-field realisability; no minimal-field target is added to R01.1.

The reader and packet cite only their needed results in original wording, with locators. No source passage, PDF or extracted paper text is committed. Larsen's proof remains missing. Inherited source references in the retained parent contracts remain parent citations; this pass does not claim that every parent book was read. No uncleared copy of a book was used.

Pinned statements were read for the 36 baseline declarations. Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`. The six imported Tau Ceti module source files in the shared build were byte-compared with those files at the pin and all matched. The reviewed R01.1 library audit AUDIT-31 was read before planning.

The current library was also inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the scope of GaloisLattice.Basic and scalar-extension, continuous-Hom, multiplicity and local-field interfaces. Current TauCetiRoadmap was read during this run through main `fc9c8f315efb7281a62cebac53947452b43c9eee`; its checkout advanced during the pass. The changed IHG and RG2.3 contracts were re-read, and the resulting exact supplier boundaries are recorded above. Relevant current AlgebraicVectorBundles, InductionRestriction, ModularInduction, LocalGaloisGroups and ProfiniteArithmetic interfaces were checked; no library build ran in either read-only environment.

## Validation and prototype limits

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.1.json` reports **0 errors and 0 warnings**. The suggested file was elaborated with `lean-check` at the pinned build, serially with sufficient available memory. A scratch verification copy appended checks of all **157 distinct fully qualified API names** from the new packet and the six retained principal carriers; it elaborated, and all warnings were declaration-placeholder warnings. The original document's test names remain attached to their examples, with the integral conjugacy example also carrying its new refinement test name.

The general reductive group-scheme/building and complete-reducibility signatures are omitted from the prototype, with the retained mathematical statements and their gaps explicit in the reader. The file gives the GL_n integral-conjugacy specialization. The Galois coefficient theorem is typed with compatible integral and residue automorphisms; identification with the absolute coefficient Galois carrier is a LocalFieldsRamification contract. Conditions that cannot yet be expressed against the pinned APIs are not replaced by unconstrained proposition fields. These omissions are prototype limits, not claims that the corresponding mathematical target is already implemented.

Assembly's six planets are the retained **Continuous representation**, then **Determinant character**, **Tate twist**, **Semisimplification**, **Brauer–Nesbitt theorem** and **Residual semisimplification**. Use the packet's `assembly.planetSelection`, suppressing other inherited R01.1 planet flags. No layer restructure is proposed.

The run leaves no Lean process running. Scratch sources and compilation logs are disposable; everything needed by review or continuation is in these four deliverables.
