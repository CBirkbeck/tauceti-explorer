# Independent review: arithmetic K-theory finite generation

Job: `REV-ArithmeticKTheory--N.3-finite-generation` (#6427). Reviewer: Codex, session `codex-CGf6Yi`, independent of the authoring session `codex-CySCoN`. Date: 2026-10-06.

**Verdict: needs_changes.** The mathematical statements and proof chains are justified after the finite-S dependency correction below. All nine baseline citations are confirmed. The remaining defect is the suggested Lean deliverable: all five proposed declarations are inside comments. PROTOCOL §13 requires the named theorems as Lean declarations proved by `sorry`. The honest missing-carrier gap explains the omission but does not satisfy that requirement. Compiling the helper examples does not check the proposed theorem signatures.

This is a completed independent review, not a checkpoint. The packet remains `complete`, its one stage remains `planned`, and no stage is claimed closed. The recorded homotopy and arithmetic-geometry supplier gaps are acceptable at target level and are not the reason for returning the packet.

## Scope and counts

| Item | Reviewed result |
| --- | --- |
| Fresh nodes | 5: one comparison and four theorems |
| Per-node mathematical verdicts | 3 verified, 2 corrected |
| Retained predecessor interfaces | 9, with their existing IDs preserved |
| New definitions / constructions | 0 / 0 |
| New definition API items / unit tests | 0 / 0; predecessor APIs and tests remain imported |
| Planets | 3, all appropriate named landmarks |
| Baseline declarations | 9 confirmed; none removed or replaced |
| Nodes added or split | 0 |
| Source records / sourceIssues | 5 checked / 0; no source error found in the cited passages |
| Supplier requests / gaps | 5 / 2, retained explicitly |
| Coverage | 1 planned stage, 0 closed stages |

The review covered the packet, suggested file, reader document, the accepted `ArithmeticKTheory--N.1` predecessor interfaces, roadmap targets, the reviewed library audit, and confirmed finding `RT-AREA-ktheory-1/1`. The nearby upstream GlobalNumberFields and AlgebraicTopology documents were read as the model for statement and interface precision. Function-field additions in the predecessor are outside this number-field continuation and were not revised.

## Sources

Each public PDF was downloaded, its SHA-256 checked against the packet, and the cited sections read. All five hashes match. Every fresh node's locator and short excerpt occurs in the recorded version; no locator or excerpt correction was needed. The packet's source URLs, versions, hashes and access dates remain unchanged.

| Public source | Passages checked and conclusion |
| --- | --- |
| [Quillen, finite generation](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf) | §1, printed pp.179–185, PDF pp.187–193, scan headers 195–201. Checked Theorem 1, Remark (2), Theorem 3, Stability, integral arithmetic-group descent, rank induction and the H-space conclusion. The relative degree is i−m; the stability bounds are n≥i for surjectivity and n≥i+1 for an isomorphism. Finite-S defects begin above degree one. |
| [Kahn, arXiv:1108.2441v3](https://arxiv.org/pdf/1108.2441v3) | §§1.1–1.3, §§2.1.4–2.4.1 and §§4.1–4.3.4. Corollary 2.3.7 gives the cellular mapping-cone comparison; §§4.3.1–4.3.4 give the rank-layer interpretation. The extra cone shift is necessary. Rank one uses augmented chains of two points; the positive-sphere argument alone does not cover it. |
| [Weibel, K-book IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | IV.6.8–6.9, PDF p.59, book p.325. The criterion requires finite Pic and integral Steinberg-coefficient homology in every degree. The finite-over-Z specialization applies first to the ring of integers; S-integers need the localization argument. |
| [Putman–Studenmund, arXiv:1909.01217v4](https://arxiv.org/pdf/1909.01217v4) | §1, pp.2–4, and §2.1, pp.8–10. Theorem C, the orientation counterexample and Proposition 2.1 confirm the twisted virtual dualizing module. Integral duality is used at torsion-free level before finite-quotient descent. This checks the imported arithmetic input and the red-team response. |
| [Serre, homology of fibre spaces](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Serre-HSEF.pdf) | III §1 Proposition 1, pp.465–466; IV §3 Proposition 3, p.479; IV §6 Proposition 9, p.483; V §§1–2, pp.489–491. Checked the cover/loop finite-type argument, the simple-space variant and singular-complex footnote. The required H-space case has homotopically trivial deck transformations, so the first covering step has trivial action on cover homology. |

The Serre argument is not a claim that BQ is simply connected. Its fundamental group is H₁ and is finitely generated abelian. Its classifying space has integral homology of finite type. For the H-space case, deck transformations act trivially on the homology of the simply connected cover. Serre III.1 Proposition 1(b) then gives finite-type cover homology, and V.2 Proposition 1 gives the higher homotopy finiteness. The n+1 shift recovers K₀ as π₁. These steps justify the requested early homotopy contract without attributing it to the present H.6 text.

## Baseline verification

Statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All names exist and their actual hypotheses supply their recorded uses. No declaration was inferred from its name alone.

| Declaration | Pinned statement and limit |
| --- | --- |
| `NumberField.RingOfIntegers` | `Mathlib/NumberTheory/NumberField/Basic.lean:104`: the integral closure of Z in the number field. It is the base ring, not the S-integer ring. |
| `NumberField.RingOfIntegers.instFintypeClassGroup` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean:58`: a Fintype class-group instance for the ring of integers. The Pic comparison is imported separately. |
| `Module.Finite.iff_addGroup_fg` | `Mathlib/RingTheory/Finiteness/Defs.lean:140`: finite generation as a Z-module is equivalent to finite generation of the additive abelian group. |
| `Module.Finite.of_exact` | `Mathlib/RingTheory/Finiteness/Finsupp.lean:157`: exactness of M→N→P and surjectivity onto P, with finite M and P, imply finite N. For the relative LES one applies this to the relevant image and kernel; Noetherian subgroups and quotients supply the finite end modules. |
| `Set.integer` | `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`: the S-integer subalgebra defined by valuation bounds outside S. |
| `IsDedekindDomain.finite_integer_classGroup` | `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean:94`: finite class group of the Dedekind base implies finite class group of its S-integers. This does not require finite S and supplies no K₀ comparison by itself. |
| `Set.unit_fg_of_units` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:207`: `[Finite S]` and `[Monoid.FG Rˣ]` give `Group.FG (S.unit K)`. This is neither a K₁ comparison nor a rank formula. |
| `Ring.HasFiniteQuotients` | `Mathlib/RingTheory/Ideal/Quotient/HasFiniteQuotients/Basic.lean:31`, with the ring-of-integers instance in `NumberField/Basic.lean:323`: every quotient by a nonzero ideal is finite. Primality gives the residue-field structure; the higher K-table comes from its owning roadmap. |
| `groupHomology` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:230`: a representation and a natural-number degree give a `ModuleCat` object. It provides neither the Steinberg representation nor negative-degree group homology. |

The degree-one bridge is accounted for: Mathlib's `Set.unitEquivUnitsInteger` in `DedekindDomain/SInteger.lean:124` identifies S-units with units of S-integers, and the retained N.1 determinant supplier uses that bridge. Dirichlet's theorem supplies `Monoid.FG` of base units. These are not replaced by an assumed K₁ finiteness instance. Their Mathlib statements were also inspected; the existing nine-entry baseline register need not duplicate the supplier's register.

## Nodes, closure and corrections

1. **Relative rank comparison — verified.** The predecessor owns Q, its filtration and comma-category identifications; Borel owns the building and Steinberg module. The reduced suspended-building homology, integral group hyperhomology and cone shift give the stated comparison, including signed negative-degree zero. Naturality, the LES comparison and transport of representatives are explicit. Rank-one trivial coefficients and rank-two coinvariants catch plausible coefficient errors.

2. **Rank homology stability — verified.** Adding rank n+1 makes the relative groups in degrees i and i+1 vanish at the asserted bounds. The LES gives the transition results. Exhaustiveness on finite chains and relations plus the requested H.1 comparison gives stabilization to BQ in each degree. No arbitrary filtered colimit of finitely generated groups is declared finitely generated, and no GL homological-stability theorem is substituted.

3. **Integral homology finite type — verified.** The LowDegrees projective-classification and Pic/class-group suppliers have the required rank-and-determinant statements. Finite Pic is used before forming the sum over each rank. All nonfree lattices are included. Rank induction uses finite direct sums, Noetherian subgroups over Z and exact extensions, followed by stabilization at n=i+1. The Borel supplier states integral Steinberg-homology finiteness for the actual projective lattice, with normal torsion-free finite-index reduction and integral descent. Rational finite dimension would not suffice.

4. **Quillen homotopy finite type — corrected.** Changed the title from “finite K-groups” to “finitely generated K-groups”; its mathematical statement was already correct. Read the GeneralAlgebraicKTheory K.1 suppliers: exact direct sum provides the H-space structure, and the K carrier uses πₙ₊₁ BQ. The connected H-space is simple, and the Serre proof above supplies the finite-type implication through an explicit requested extension. No simply connected BQ assumption is introduced.

5. **Finite-S localization — corrected.** The old direct prerequisite `N.2/localisation-sequence-for-a-dedekind-domain` supplies A→Frac(A). Its exact sequence cannot be made into the A→B sequence merely by discarding primes. Replaced that prerequisite with the existing `N.1/S-integers-localisation-of-torsion-class-group` and `N.2/finite-support`. The first gives B=A[1/s] using a product of generators of principal positive powers of the primes in S; the primes containing s are exactly S. The second explicitly supplies localization at s and dévissage to the finite sum of residue-field K-groups. For empty S, s=1. Updated the proof and suggested-file owner comments accordingly.

   For n≥2 both outer terms of this finite localization segment are finite. The finite-field even vanishing proves even-degree injectivity and odd-degree surjectivity for n≥3. Exact extensions give finite generation in higher degrees; the imported determinant/S-unit and K₀/class-group interfaces supply degrees one and zero. The infinite cokernel in K₁(Z)→K₁(Z[1/p]) and the non-finitely-generated K₁(Q) remain valid acceptance checks.

No new node is needed: the exact finite-localization supplier already exists in the accepted predecessor. Retained endpoint IDs remain intact for downstream consumers.

The H.1 request matches its realization, coefficient-homology and filtered-diagram scope. The H.2 cellular comparison and H.6 simple-space theorem are accurately described as extensions, with sources and a proposed Part II. ALS.2 and the early finite-level ALS.5 duality prefix have the right finite-CW and orientation contracts through Borel R.1; later automorphic/completed-cohomology branches are not prerequisites here. Unaccepted supplier packets are not treated as library implementations. These explicit requests and gaps justify `planned` coverage, not `closed` coverage.

## Red-team finding, API and atlas checks

`RT-AREA-ktheory-1/1` is addressed mathematically in both packet and reader. Buildings, Steinberg modules, Solomon–Tits and orientation-correct arithmetic duality stay with Borel R.1. ArithmeticKTheory owns the Q-rank assembly and finite-generation consequences. The imported dualizing module has the orientation twist given by the (n−1)st power of norm-of-determinant. Integral duality is applied on a torsion-free subgroup, with finite-index descent afterward. Nonfree projective lattices and rank one are covered. Ordinary arithmetic homology and rational duality are not substituted for the needed integral Steinberg homology.

The reviewed library audit marks the higher arithmetic K finite-generation stage unbuilt. Existing classical class-group and unit finiteness are cited rather than replanned. Borel and general homotopy constructions are requested from their owners. With no fresh definition or construction, new definition API and three-test obligations do not arise in this continuation; the retained definitions keep their existing APIs and tests. All five results have mathematical acceptance checks. The three planets are named theorem-level landmarks within the per-layer limit.

## Suggested file and required revision

The standard opening note, individual Mathlib imports and avoidance of opaque stand-ins are appropriate. The seven executable examples check the Z-module finiteness bridge, exact extension, finite class group, base-unit finiteness, finite residue quotient, actual coefficient-homology vocabulary and the signed-degree inequality. They contain no named declarations for any of:

- `TauCeti.ArithmeticKTheory.rankLayerHomologyEquiv`
- `TauCeti.ArithmeticKTheory.rankHomology_stable`
- `TauCeti.ArithmeticKTheory.rankHomology_finitelyGenerated`
- `TauCeti.ArithmeticKTheory.quillenK_finitelyGenerated`
- `TauCeti.ArithmeticKTheory.sLocalization_finiteDefect`

The file now states this protocol defect explicitly instead of saying that §13 requires the comment-only form. The missing-carrier gap also records the required revision. The names and mathematical descriptions have been preserved for the reviser.

Revision must supply actual typed theorem prototypes for these five names, using the owning interfaces and honest omission of conditions that cannot yet be stated, and explain each omission. It must not introduce opaque replacement carriers, arbitrary proposition-valued fields or dummy K definitions. The mathematical statement remains definitive in the packet. If a suitable carrier interface cannot be supplied within the revision, report that limitation explicitly for a protocol decision rather than presenting comments as elaborated signatures.

The reader is an input but not an allowed deliverable of #6427, so it was not edited. Its finite-S section must identify the corrected principal-localization and finite-support suppliers, and its suggested-signature discussion must be reconciled with the revised file. The broad exact segment displayed there is mathematically correct; the correction is to its supplier attribution. The GeneralAlgebraicKTheory comment-register precedent mentioned there does not change the binding §13 requirement.

Questions for the orchestrator: assign the cellular and Serre extensions to explicit early homotopy owner nodes without an arithmetic-K return dependency, and ensure the revision includes the reader document. No question about the verified mathematical conclusions remains.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.3-finite-generation.json`: zero errors and zero warnings after review edits.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.3-finite-generation.lean`: exit 0, no Lean diagnostics, after checking available memory. The shared build uses exactly the recorded Mathlib commit. The file imports Mathlib only; its seven helpers elaborate, while the five proposed signatures remain comments and are not checked.
- Tau Ceti citations were read at the recorded Tau Ceti commit. The shared Tau Ceti checkout is newer, so this review does not claim elaboration of Tau Ceti-dependent signatures at the Tau Ceti pin.
- JSON and whitespace checks pass. Every node retains `implementationStatus: unchecked`. No implementation, promotion, source erratum or closure is claimed.
