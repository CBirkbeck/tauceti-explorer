# DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII

Issue #3347; worker Codex; session codex-yTJ4HK; claim confirmed by the swarm bot. This is the one job taken in this run.

The planning pass is complete. All six stages DA.0–DA.5 are **planned**, none closed. There are 31 nodes: 25 theorems, 3 constructions, 2 comparisons and 1 definition; 28 API items, 19 discriminating tests, 29 planets and 10 pinned baseline references. Every implementation status is unchecked. The deliverables are the new roadmap definition, packet, reader and 122-line suggested Lean file with the same roadmap id.

The issue permits independent continuations to split. The retained roadmap covers all 16 Calmes dyadic items (330–338 and 343–349). The packet has exact item-to-node routing. Its restructure proposal preserves all 7 Browning–Sawin items in five proposed stages for FunctionFieldLatticesAndShrinking and all 83 Khayutin items in six proposed stages for GeometryOfNumbersPartIIToralJoinings. The proposals retain hypotheses, supplier/export boundaries, strict shrinking conventions and the strict analytic range-overlap condition. Those source proofs are not claimed read or decomposed here. The maintainer applies these splits; no queue or other deliverable was edited.

## Mathematical finding needing review

The inherited annihilator-generator and inertness-proof issues were independently checked, recorded in our own words as E1 and E2, and corrected. An additional source error E3 changes the **final Eisenstein quadratic table**, not just a proof detail. Example 2.3.14 of arXiv:2009.07225v4 uses an identity on the quadratic completion Z/2 factor under Z→Z[ζ3]. Reduction identifies this with quadratic Witt base change F2→F4, which is zero: x²+xy+y² becomes isotropic at (ζ,1).

The corrected table is symmetric [Z/4,Z/2,0,0], quadratic **[0,0,Z/2,Z/4]**, by degree modulo four. The reader and packet give the full argument. In outline: Ws(R)=Z/4{u}; the new completed quadratic generator t has polar [[2,1],[1,2ζ]] and signed determinant 1−4ζ, whose norm is 21. This distinguishes t from the global order-two class 2u, whose determinant −1 has square norm. Their intersection is zero, so Wq(R)=0. The symmetric restriction cokernel is ann(c)=Z/4{2u}⊕Z/2{c}, where c=⟨1,3⟩. Transfer of t for λ(1)=0, λ(√−3)=1 has diagonalization ⟨1,−1,4,−21/4⟩ and Witt class c, giving A(R)=ann(c)/⟨c⟩=Z/4. Do not take the intermediate symmetric restriction cokernel as A.

Independent review should first verify E3, the quadratic versus symmetric residue arrows, and the transfer normalization. No independent verdict has been assigned. The arXiv and author-hosted versions retain the problematic diagram; no dedicated correction was found in the searches recorded in sourceIssues. The Annals journal PDF was not obtained or compared, so there is no claim about whether that edition corrects it. The suggested file's F2/F4 statements are actual native quadratic-form statements, not a placeholder for the missing L-groups.

## Remaining closure work and ownership

- **G1:** HermitianKTheoryOfPoincareCategories has an extraction route but no registered roadmap/stage/packet here. Register its one shared owner for Poincaré categories/flavors, periodic L, field surgery/Witt identification, coefficient/sign shifts, controlled Verdier categories, the [II] 4.5.5 criterion and derived localization/completion. GN.6 exact-category GW is not that foundation.
- **G2:** Verify the full global Witt residue kernel theorem underlying coker ∂0=Pic(R)/2. The public paper reduces to Milnor–Husemoller IV §4 and Scharlau 6.6 Theorem 6.11; their books are not cleared in the reference-library index. No other copy was used. GlobalQuadraticForms layer 8 needs a Part II extension for number fields and does not cover function fields. The characteristic-two divisor argument is explicit, but its general divisor supplier contract remains open.
- **G3:** Read Wall (1973), Corollary 1, Lemma 1 and Proposition 4 for the degree-one relation/kernel comparison in quadratic rigidity. Wall (1970) lifting alone does not prove equivalence in every degree.
- **G4:** Verify the full Popescu/Elkik approximation input used in CMM Remark 5.6, and register the general henselian contract. Do not replace it by prime-to-p K-theory rigidity.

Ten precise supplier contracts R1–R10 are in both reader and packet. R1 adds the L-localization statement to GN.6's GW node. R2/R5 import existing QFI field Witt and local classification. R3 requests number-field residue exactness as a GlobalQuadraticForms Part II extension; R4 requests quadratic-extension transfer exactness as a QFI Part II extension, beyond its existing transfer API. R6/R7 concern K0/projectives, class numbers and the general Dedekind divisor sequence in ArithmeticKTheory. R8/R9 import K-theory/spectrum prerequisites without pretending they supply Poincaré foundations. R10 consumes the already owned E8 model. No supplier file or upstream roadmap was edited.

## Audit and sources read

The reviewed GN.2 and GN.6 coverage audit and pinned statements were read. Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Current read-only roadmap commit 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were checked. Completed IntegralLattices and GlobalQuadraticForms were read in full; current IntegralLattices and relevant QFI layers were checked to avoid repeating newer work. The current library already has field Witt/local Q2 classification and integral lattice foundations. They are imports, not targets recreated here.

Primary reading: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle, arXiv:2009.07225v4, §2.2 pp. 36–41 and §2.3 pp. 41–48; Wall (1970), Lemma 1 p. 427, Theorem 2 and proof pp. 428–429; Clausen–Mathew–Morrow arXiv:1803.10897v2, Remark 5.6 p. 39. Exact public URLs, versions, read sections and PDF hashes are in the packet and reader. Everything in the repository is original prose with precise locators; no book or paper passage was copied. Scratch downloads and computation scripts are disposable; the reader's final appendix gives the arithmetic-audit method needed to reproduce the calculations.

## Validation

- Blueprint checker against the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check` on the suggested file: **exit 0**, 14 proof-placeholder warnings only; no other warnings or errors. All data definitions have real bodies. Compilation used the shared pinned build, after checking available memory; no build/update/cache or language server was started.
- `check_sorry_data.py`: passed.
- Exact finite arithmetic audit: 32 distinct Q2 Witt coordinates, generator orders, multiplication by c, annihilator and its corrected generator, Arf-one integral polar c+4u, transfer determinant 21 and Witt class c, and the F2/F4 isotropy distinction all passed. This is evidence for the calculations, not formalization.
- Intake path/JSON check: **5 files, 0 problems**. Final consistency audit passed: reader and packet statements/proofs/acceptance agree; stage ids resolve and form an acyclic graph; the 16/7/83 routing inventories are complete partitions.

After independent review accepts this plan, resolve the four gaps and exact extensions before calling any stage closed or packaging the missing spectrum-level targets. The current complete planning pass is ready for that review; it is not a checkpoint and no second job is to be claimed by this process.
