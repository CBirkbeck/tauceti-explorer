# Harpaz–Wittenberg (2020): extraction and routing checkpoint

Codex — `codex-c83e7a`; issue #1426; 21 September 2026.

The entire 31-page paper has been read. This checkpoint extracts **144 items: 7 library, 12 planned, 125 missing**. Fourteen routes assign 123 missing items and 10 planned source items exactly once. Two proof-interface items remain unrouted: `PAPER-HARPAZ-WITTENBERG-20/75` and `PAPER-HARPAZ-WITTENBERG-20/115`. The status is **partial**. Neither gap is a counterexample to a main theorem; neither is hidden as an axiom.

The paper proves unconditional exactness of the zero-cycle complex for compactifications of homogeneous spaces of linear algebraic groups over number fields. Its rational-point result is unconditional for finite stabilizers with an **outer-Galois-invariant normal flag having cyclic factors**. General finite solvable stabilizers instead use HW16 Conjecture 9.1. Finite abelian stabilizers admit the stronger conclusion using only the algebraic Brauer obstruction. These are separate extracted statements.

## Source and acquisition

The [author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf) was retrieved at 2026-09-21T19:42:25Z, SHA-256 `2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9`. It is dated 26 February 2018, revised 23 September 2019. Read: introduction and conventions pp.1–7, §2 pp.7–11, §3 pp.12–15, §4 pp.15–18, §5 pp.18–21, §6 pp.21–24, §7 pp.24–28 and all references pp.28–31. Locators refer to these pages.

[arXiv:1802.09605v2](https://arxiv.org/abs/1802.09605v2), SHA-256 `54cd8757102b7e67437486c35e26a48597a6686c117031ff57c09c433f19f1de`, has the same mathematical text. Normalized page comparison found only its first-page arXiv header and the final Email/E-mail spelling. The author's publication list and Crossref identify JAMS **33 (2020), 775–805**, [DOI 10.1090/jams/943](https://doi.org/10.1090/jams/943). The publisher PDF returned HTTP 403; no claim is made to have read that PDF.

Prerequisite reads were targeted, not represented as full-paper reads: HW16 printed pp.259–260,266–268,284; DLA19 Definition 5.1 and Theorem 5.2 in both public versions; Har08 definitions pp.595–596 and Theorem 2 p.604; Dem10 author pp.10–12; LA19 §6 pp.14–17; DLAN17 Proposition 2.4, printed p.1018; Wit18 Remark 3.9 and its surrounding hypotheses. The JSON prerequisite list distinguishes these from originals still requiring acquisition and decomposition.

## Mathematical coverage and boundaries

Section 2 descends adelic points through **torus** torsors while controlling the full unramified Brauer group. Theorem 2.1 assumes smooth geometric integrality, not rational connectedness. Corollary 2.2 adds proper rational connectedness for descent through a torsor on a dense open. The relative Brauer group, units exact sequence, edge map, twist independence, evaluation translation, residual Sha functional, Poitou–Tate shift and its removal are individual items.

Harari's adelic theorem is used with its topology intact. His restricted product has Tate-modified infinite factors; the ordinary torus adeles map onto those factors, and the pairing factors through that map. H² of the character lattice is discrete. In the torus specialization the abelian-variety part is zero, so his finiteness assumption on its Tate–Shafarevich group is automatic. The twist convention is `[Y^σ]=[Y]+σ`; Proposition 2.6 then has its stated minus sign.

Section 3 starts with constant geometric units and the Picard boundary sequence. The pullback character module is not declared torsion-free until proved so. Proposition 3.1's three conclusions are separate. Proposition 3.3 distinguishes an actual geometric section for torsion-free characters from a rational section for cyclic torsion with a rationally connected compactification. Finite multiplicative-type torsors require the torsion character API, not just torus lattices.

Section 4 keeps distinct: split codimension-one fibres over the entire affine space; split fibres over the torus plus geometric splitting of the affine boundary; and the conditional nonsplit rational-point theorem. The norm pullback family contains all twists because the larger torus is quasitrivial. The zero-cycle fibration theorem is unconditional and tests **closed points** of a Hilbert subset. HW16's generic H¹ and A₀ hypotheses are extracted with their rational-connectedness inputs. Its Conjecture 9.1 retains the local norm and degree-one-place conditions, without adding integrality of the approximating element.

Section 5 includes the finite étale cover action, injective torsor types, stabilizer exact sequence and outer-action compatibility separately. A universal torsor replaces the finite stabilizer by its derived subgroup. Profinite Sylow existence is built, but the arbitrary surjective-image theorem remains planned in the reviewed audit. The cosets in Lemma 5.6 are **sets**, since the Sylow subgroup need not be normal. The fixed field of the pro-p Sylow image can be infinite; the finite cover and its action must be descended to a finite intermediate extension.

The Grunwald corollary needs more than Theorem B. LA19 proves constancy of unramified evaluation at real places and at finite places prime to the stabilizer order where it is unramified. DLAN17 converts quotient approximation into surjectivity on local H¹. Auxiliary unramified cyclic conditions, one for each conjugacy class, then force the global character to have full image: a proper subgroup misses a conjugacy class. This preserves the distinction between a weak cohomological solution and a proper realization. Quaternion quotients use both algebraic and geometric Brauer vanishing. The standard generalized-quaternion range is m≥3; the source's m≥1 notation is recorded rather than silently used as a definition.

Section 7 defines the modified local Chow product, its completion, E, E⁺ and the middle defect group. Complex factors vanish; real factors are norm quotients. The universal quantifier over **all finite extensions** in E⁺ is retained. No finiteness of the defect group is assumed: prime-to-p degree annihilators for every p generate the unit ideal. An ℓ-variety viewed over k through its structure morphism is not Weil restriction and may cease to be geometrically irreducible; its grouped local cycle-complex dictionary is an explicit proof obligation. The final Galois consequence has degrees with collective gcd 1, not pairwise coprimality, and does not prove inverse Galois over the original field.

## Library and atlas evidence

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements were opened and read before classifying a library item:

| Item | Pinned declaration evidence |
| --- | --- |
| `PAPER-HARPAZ-WITTENBERG-20/1` | `TauCeti.torusCommHopfAlgProperty`, `splitTorusCommHopfAlgProperty`, Torus/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/2` | `TauCeti.multiplicativeTypeCommHopfAlgProperty` and its diagonalizable-coordinate-ring equivalence, MultiplicativeType/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/3` | `TauCeti.CommHopfAlgCat.geometricCharacterGroup_fg_of_multiplicativeType`, CharacterLattice.lean |
| `PAPER-HARPAZ-WITTENBERG-20/22` | `AlgebraicGeometry.AlgebraicCycle`, AlgebraicGeometry/AlgebraicCycle/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/47` | `AddCommGrpCat.injective_of_divisible`, Algebra/Category/Grp/Injective.lean |
| `PAPER-HARPAZ-WITTENBERG-20/87` | `TauCeti.IsProPSylow`, Profinite/Sylow/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/88` | `TauCeti.exists_isProPSylow`, Profinite/Sylow/Existence.lean |

The ambient cycle carrier does not supply CH₀. `AlgebraicCycle.map` has residue-degree weights and `map_id`; it does not prove Chow descent or composition. Likewise, character modules and Galois descent files do not justify claiming the entire multiplicative-type antiequivalence and exactness comparison as built. Exact upstream planned owners are used for those broader statements.

Atlas inputs were read at `d76643df4405140aed1dfade7a21b9159db80017`. Reviewed coverage for RP.2/RP.3, SF.5, AA.1/AA.4 and profinite Sylow theory was checked. Relevant full roadmap descriptions, upstream Layers 3–7 of ReductiveGroups, the six new roadmap files, the existing packet and reserved identifiers were examined. All **211 atlas roadmap extracts** were searched for homogeneous spaces, universal torsors, rational connectedness, zero-cycles and supersolvability. No current layer supplies E⁺ or the homogeneous fibration induction. No reviewed audit entry was present for either reductive-groups roadmap; that absence was not treated as evidence that its library was empty.

## Routes and shared ownership

The twelve source routes use existing owners: RG2.0a for Weil restriction; SF.2 for étale cohomology/purity; SF.3 for Picard localization; SF.4 for characteristic-zero compactification; SF.5 for Chow operations; RP.2 for Brauer evaluation and its cycle extension; RP.3 for torus descent; R02.4 for torus/lattice arithmetic duality; IG.0–IG.1 for finite étale fundamental groups; IG.2 for Hilbert subsets; IG.4 for the new proved realization prescriptions; AA.4 for simply connected weak approximation and the required torsor interfaces. These are not duplicate upstream plans.

`HeightsRationalPointsPartIIHomogeneousMassey` is deliberately the **same pending candidate** proposed by PAPER-HARPAZ-WITTENBERG-23, with the same title. Its earlier brief already requested HW20 Theorem B and finite-stabilizer Picard/Brauer inputs. The present 49-item route supplies that general foundation and its proof. It does not claim the partial earlier proposal is an accepted roadmap or mark its items planned. Design intake must retain one copy of the shared theorem and preserve the Massey-specific continuation.

`HeightsRationalPointsPartIIZeroCycles` receives 42 items: reusable RC geometry followed by the completed cycle complex, E/E⁺, fibration/descent reductions and Theorem A. It imports the Chow and Brauer machinery, and the homogeneous-stabilizer fibration layer. Order the stages as **RC geometry → homogeneous/torsor geometry → E⁺ arithmetic induction**. This resolves the apparent reciprocal roadmap dependency without making a stage cycle.

## Remaining gaps

**G1 — `PAPER-HARPAZ-WITTENBERG-20/75`, Remark 4.5.** Its stated hypotheses do not include rational connectedness, while the cited Theorem 4.2(i) inherits that condition from §4. Wit18 Remark 3.9 repeats the broader assertion. Acquire Sko90's more general fibration theorem and supply the hypothesis bridge, or give an independent proof. The remark is not used in the RC main-theorem induction. This is a scope check, not a demonstrated false statement.

**G2 — `PAPER-HARPAZ-WITTENBERG-20/115`, DLA reduction.** The paper's Definition 7.1 uses semisimple simply connected ambient groups for the fibration ascent axiom. DLA19 Definition 5.1 explicitly allows `G=G^ssu` with simply connected semisimple quotient. Both the arXiv and author versions agree. Write the unipotent quotient/affine-fibration reduction and its (⋆), RC and E⁺ compatibility, or verify the broader ascent directly. Keep this visible before claiming the reduction's proof is closed.

Source extraction is substantially complete for §§1–7, but full prerequisite proof decompositions remain for the designs and the final closure audit. Do not promote this checkpoint to complete merely by assigning routes to the two unresolved interfaces.

## Validation

Every definition and construction has an API and three discriminating tests in its note. Scratch computations checked the three order-two lines in C₂² under an order-three outer action (none invariant), all five proper S₃ subgroups (each misses a conjugacy class), a nonnormal Sylow coset example of prime-to-p size, and the collective-degree identity 6+10−15=1. These are mathematical boundary checks, not proofs of the arithmetic theorems.

`check_paper.py`, intake file validation, and a custom audit check schema, all item/route identifiers, current stage owners, unique missing-item assignment except the two declared gaps, definition APIs/tests, and the exact three allowed files. No Lean file is a deliverable for this paper job; Lean was not compiled and no formalization is claimed.
