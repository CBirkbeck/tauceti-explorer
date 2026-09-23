# Yang–Zhao: cohomological Milnor and characteristic-class comparison

Independent review: **revise**. Extraction: **partial**. All six ownership routes are accepted as corrected construction plans; their prerequisites are not declared built. Codex, session `codex-hjdg0j`, reviewed this extraction independently of its recorded authors for issue #1219.

The source is Enlin Yang and Yigeng Zhao, *Cohomological Milnor formula and Saito’s conjecture on characteristic classes*, Inventiones mathematicae 240 (2025), 123–191, [DOI](https://doi.org/10.1007/s00222-025-01319-y). All statements and findings below use the fully read [arXiv v4](https://arxiv.org/pdf/2209.11086v4), whose numbering differs from the journal. The full journal PDF remained unavailable. The author’s [alternative fibration proof](https://yelmath.github.io/PFF.pdf), all eleven scanned pages, was also read independently.

## What the paper proves

The general setup is Z→X→Y→S with S Noetherian, separated finite-type maps and torsion Noetherian coefficients invertible on S. The actual constructible finite-Tor derived categories and operations are required. The conditions remain distinct:

- C1: the relative dualizing object of Y/S is locally constant and the diagonal evaluation is invertible.
- C2: both H⁰(Z,K_Z/Y) and H¹(Z,K_Z/Y) vanish.
- C3: F is ULA over S and its restriction to X−Z is ULA over Y.

The tilded non-acyclicity class has coefficients in the diagonal-defect object K_X/Y/S under C1 and C3. Passing to the untilded class with coefficients K_X/S needs C2. The fibration formula is

`C_X/S(F) = δ! C_X/Y(F) + C^Z_X/Y/S(F)`.

Its proof must identify the particular supported class. An equality after forgetting support, or six unrelated commuting squares in a homotopy category, does not suffice. The original proof constructs the simultaneous lifts and transports a coherent cube; its final prism compares the restriction and acyclicity homotopies. The alternative proof uses a nine-diagram lemma: the two vanishings Hom(A,K00)=Hom(A,ΣK00)=0 identify the middle map with the sum of the two unique lifts. In the application A=Λ, K00=τ*K_Z/Y, and these are exactly C2. Both proofs still need the coherent exchange cube.

For a perfect field k of characteristic p>0 and a finite local coefficient ring Λ with residue characteristic ℓ≠p, Theorem6.2 proves

`C^{x}_X/Y/k(F) = −dimtot RΦ_x(F,f)`

when Y is a smooth curve, f is separated of finite type, and F is ULA away from the closed point x. X need not be smooth. Total dimension is an alternating dimension plus Swan invariant after derived residue reduction. The origin skyscraper has RΦ=Λ[1], total dimension −1, and class +1. The finite-support formula, curve/Grothendieck–Ogg–Shafarevich formula, and proper cohomological conductor formula follow. The proper formula only needs the target inverse ν; it does not add source C2.

Theorem6.13 proves `cl(cc_X(F))=C_X/k(F)` for smooth quasi-projective X in this characteristic-p setting. It does not prove the general embeddable-singular conjecture, the non-isolated supported Bloch formula, or Conjecture6.10. M19 now defines the general conjecture as a proposition with a later restricted instance from M16, not a theorem assumed by the proof.

## Inventory and ownership

The JSON contains **142 items**: 9 library, 12 planned and 121 missing, with 301 internal prerequisite edges. All missing items occur in exactly one route. Its 53 definitions/constructions have 161 API entries and 160 proposed tests in total. These are planning specifications, not executed Lean proofs.

| Route | Owner and role | Verdict |
| --- | --- | --- |
| 1 | EnhancedDerivedSheaves E0/E1/E3/E5:abstract: generic stable diagrams, coherent lifts, monoidal and coefficient interfaces | Accept |
| 2 | EtaleDualityAndPerverseSheaves EDC.0/3/4: field support, semipurity, étale cycle realization and blowup operations | Accept |
| 3 | EtaleDualityAndPerverseSheavesPartIIRelativeTraces: shared relative trace, supported defect and coherent fibration applications | Accept |
| 4 | LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier: shared general-base ULA and local Fourier input | Accept |
| 5 | EtaleDualityAndPerverseSheavesPartIIMicrolocal: positive-characteristic microlocal branch and smooth quasi-projective comparison | Accept |
| 6 | SchemeAndStackFoundations SF.5: integral Chow, localized Chern and section-intersection supplier | Accept |

The full current EDS, EDC, LPV and SF owner documents and all eight cited planned-stage descriptions were checked. Selected reviewed audits AUDIT01/18/19/22 were read in full. The same session’s full upstream GrothendieckEulerForms and CharacterTheory readings from the preceding [Abe review](https://github.com/CBirkbeck/tauceti-explorer/pull/2528) are reused explicitly.

The common RelativeTraces and GeneralBasesFourier IDs are those accepted in that Abe review. RelativeTraces also supplies the generic 2-categorical prefix to the accepted Hansen–Kaletha–Weinstein v-stack continuation; each geometric owner retains its own operations and ULA criteria. The Shende–Tsimerman microlocal route already separates the positive-characteristic branch from complex conormal/polar theory. None of these route acceptances is evidence of implementation. The Shende–Tsimerman review rejects its route14 pending original Massey/local Euler-obstruction proofs and version conventions. This review accepts only Yang–Zhao’s separately sourced characteristic-p addition to the shared owner; it does not reverse that other verdict or certify the characteristic-zero branch.

A01 now names the early geometric numerical/projective Swan and torsion scalar-extension supplier from ArithmeticGaloisRepresentationsPartIIGeometricArtin, including PAPER-ABE-25/B21/B03/B06/B07. B21’s characteristic-zero numerical statement alone does not give the finite-residue-coefficient dimension formula. That comparison, integrality, quotient independence and the strict-local reduction to algebraically closed residue field remain explicit supplier obligations. They precede Fourier; the late Artin theorem is never imported back into its proof.

The independent search covered every missing item name in both pinned trees, followed by broader mathematical-family searches and the reviewed coverage. Existing generic algebra/category hits do not provide the missing geometric result. Atlas/shared-route screening retained one home for integral Chern theory, relative traces and Fourier; complex and p-adic D-modules and imperfect-residue Kato conductors have different scope.

## Verified library baseline

Seven distinct files were fetched from the exact pins and byte-compared with the inspected sources: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- `SSet.Quasicategory` gives the inner-horn filling predicate, not stable infinity categories.
- `DerivedCategory` and `DerivedCategory.Q` give the ordinary localization of cochain complexes of an abelian category.
- `TauCeti.TriangulatedK0` and its triangle/shift relations apply to the stated essentially small pretriangulated category. They do not provide coherent cones.
- `AdjoinRoot.powerBasis'` applies to a monic polynomial. Artinian localization is surjective; finite flat modules over a local ring are free; the residue-field split-injection criterion has a finite source and finite free target. These support Q01/Q02, not geometric six operations.
- `AlgebraicGeometry.AlgebraicCycle`, `mapCoeff`, `map`, and `map_id` supply locally finite cycle data and weighted quasi-compact pushforward. They do not construct Chow groups, refined Gysin, Chern classes or composition compatibility.

All cited statements and their standing hypotheses were read. The JSON baseline records the paths, pins and hashes. No Lean file is authorized by this paper-review job, and none was compiled.

## Two proof repairs retained after independent checking

For the coefficient-character step, form R=Λ[T]/Φp and localize at a maximal ideal to obtain a finite local finite étale, faithfully free Λ-algebra B. In R,

`(ζ−1) Φp′(ζ) = p ζ^(p−1)`.

The right side is a unit; hence ζ−1 is a unit and ζ has exact order p. The residue-field split-injection criterion gives a Λ-linear retraction of Λ→B carrying 1 to 1. Finite free scalar extension commutes with the constructed derived operations through their canonical comparisons. Q04–Q07 preserve the ULA domain, coherent defect triangle and the actual supported class; Q08–Q09 preserve nearby cycles and integer total dimension. The equality over B then descends by split injectivity. No division by [B:Λ] occurs. For F2→F4 that degree is zero in F2. Replacing Λ by its residue field is also invalid for detecting an arbitrary cohomology class: Z/4→F2 kills 2.

For the finite étale geometric extension σ, the projection formula gives `σ*σ*F=F⊗σ*Λ`. The lisse rank-d factor need not be constant. Rank twisting, Saito’s finite-on-support characteristic-cycle pushforward, and refined zero-section Gysin compatibility repair the class equality. The degree of this geometric extension is invertible in Λ and is cancelled only after mapping to Λ-cohomology, never in integral Chow groups. This extension must remain separate from Q01’s coefficient extension.

## Independently confirmed source findings

All nine findings are confirmed for their specified public versions. The bounded correction search inspected the arXiv histories, publisher access/landing page, Yang’s author page and complete PFF proof, Saito’s bibliography, and title searches with correction/erratum. No matching correction was located. Neither inaccessible journal text is represented as checked. Nothing was sent to authors.

| ID | Inspected locator | Correction and impact |
| --- | --- | --- |
| E1 | YZ v4 p.8 §2.3(3) | Preserve δ!G in the left-arrow description; harmless Λ misprint. |
| E2 | p.16 §3.6 | Dualize G in both descriptions of a correspondence G→F; harmless slip. |
| E3 | p.21 after (3.14.5) | Restore the p2*G evaluation factor and S-relative dualizing target; harmless prose slip. |
| E4 | p.27 Proposition4.14 | Replace undefined Y′ by Y; make the target ν inverse explicit without source C2. |
| E5 | p.28 Proposition4.15 | The composable morphism is e0∘f′, with pullback f′*e0*. |
| E6 | p.50 Theorem6.13 proof | A finite étale pushforward need not be a constant direct sum; proof step repaired as above. |
| E7 | p.15 Lemma3.2 specialization | Require Λ_X ULA over S, or restrict to the field-base uses; affects the stated general-base specialization. |
| E8 | p.45 character choice | Enlarge coefficients before choosing ψ and descend without degree division; proof omission. |
| E9 | Saito1607.03156v1 p.3 before (8) | The base of SS(F) is the support of F, not X; harmless prose slip. |

E6 is witnessed by Spec(F4)→Spec(F2), Λ=F3: Frobenius swaps the two coordinates, with trace0 and invariant dimension1, whereas the constant rank-two sheaf has trace2 and invariant dimension2. E7 is a domain failure: the constant sheaf on the closed origin of A1 is not ULA over A1. The additional extension in Definition3.5 requires its own H⁰/H¹ support vanishings and does not justify the unrestricted sentence. E8 uses p=3, Λ=F2, whose unit group is trivial. E9 uses the zero complex on a nonempty smooth scheme. These checks do not disprove the corrected main theorems.

## Remaining proof obligations

The previous completion claim was based on numbered-statement coverage. It is replaced by partial status, with the earlier disposition retained as history. G01 remains unavailable and G02–G11 are open:

| Gap | Required next work |
| --- | --- |
| G01 | Collate the complete Inventiones version with arXiv v4; do not transfer findings to unread passages. |
| G02 | Decompose the enhanced six-operation, correspondence and higher-coherence foundations from their primary proofs. |
| G03 | Close general-base transversality, ULA duality and external-product supplier leaves. |
| G04 | Verify exact absolute-purity/semipurity and regular-class hypotheses from the primary proofs. |
| G05 | Decompose HS4.1’s approximation/semistable/valuative inputs and descend the complex together with its prescribed open identification. |
| G06 | Prove the precise nearby-cycle finiteness, goodness and strict-local base-change statements, including Zheng’s appendix. |
| G07 | Close local Fourier concentration/rank and modular-to-adic comparison, including the early geometric finite-coefficient Swan interface. |
| G08 | Decompose Beilinson/Saito existence and integrality; CC-support does not recover SS after cancellation. |
| G09 | Obtain the final UYZ good-pencil/blowup hypotheses and justify the quasi-projective application and prime-to-ℓ extension. |
| G10 | Decompose the graph construction, bivariant properties and localized Whitney/excess input; their citation is not their proof. |
| G11 | Refine bundled supplier interfaces into actual producer nodes, including M04’s embeddable-singular class construction. |

The [UYZ public v4](https://arxiv.org/pdf/1701.02841v4) Lemma4.9 assumes **projective** X. Its Proposition5.21 also needs smooth properly transversal divisor fibers. The author-linked final AMS PDF still returns403. This leaves G09 open, without asserting that the journal statement is false.

The localized-Chern correction in the prior extraction is sound: K|U has cohomology in degree zero of rank n−1, not necessarily zero cohomology. [Kato–Saito §2.3](https://www.numdam.org/item/PMIHES_2004__100__5_0.pdf), printed50–51, gives this precise threshold and the Cartier normalization. [Saito Lemma2.1.4](https://arxiv.org/pdf/1704.04832v4) proves section intersection equals the localized top Chern class by blowup, a line subbundle and excess intersection. Its underlying graph/bivariant proof remains G10. Equality of the global images cannot be substituted for equality with support.

## Reading and validation limits

Fresh independent reading: all51 pages of YZ v4 and all11 PFF image pages; HS pp.2–3 and19–21, including all of the displayed Theorem4.1 proof; UYZ pp.15–16,23,27; Saito18 pp.1–4 with complete Lemma2 proof and p.3 image; Saito21 pp.28–31 with Lemmas2.1.1–4 proofs; Kato–Saito printed50–51 and the entire one-page author correction. Exact hashes and scopes are in `sourceLedger`. Other source histories are retained with their original authors and are not counted as new full readings.

Executed checks are recorded in the review handoff: paper checker, five-file intake, exact allowed-file diff, preserved IDs, dependency DAG, route coverage, API/use/test coverage and source verdicts. Exact diagnostics check the F3 Frobenius counterexample, the character/retraction algebras over F2 and Z/4, the skyscraper sign and729 degree-two Whitney coefficient identities. These computations verify small algebraic witnesses, not geometric or Lean theorems.
