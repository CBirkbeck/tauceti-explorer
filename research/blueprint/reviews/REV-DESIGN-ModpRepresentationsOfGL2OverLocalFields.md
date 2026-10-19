# Independent review: mod-p representations of GL₂ over local fields

Job: `REV-DESIGN-ModpRepresentationsOfGL2OverLocalFields`; issue #3571. Reviewer:
Codex, session `codex-j9J9Et`, 19 October 2026. The design author was a different session.

## Verdict and extent

**Accepted.** This is a complete pass at target level, with ten planned layers and
zero closed layers. Acceptance confirms the mathematical plan, including its explicit
dependencies; it does not assert formalisation or discharge its recorded proof obligation.
The open p=2,3 Ext input is described below and does not affect the tame unramified
GK bound or integral truncation results.

The reviewed packet now has **59 nodes**: 9 definitions, 14 constructions, 34 theorems,
1 lemma and 1 application. Its 23 definitions/constructions have 71 API items and
77 discriminating tests, at least three for each. There are 39 planets, eight pinned
baseline declarations, 15 sources, ten supplier contracts, one gap and five source findings.
The per-node ledger at the end records every verification and correction. All original
58 targets were checked; one missing key input was added with `addedBy` naming this review.

The roadmap and reader retain every target. The reader's statement, hypotheses,
acceptance checks, proof work, dependencies and API/tests were reconciled with the packet.
The roadmap's stage descriptions and direct stage dependencies were reconciled too.
No source passages or source-by-source summaries are reproduced here.

## Corrections made

1. Corrected the baseline declaration kinds for `Representation`, `MvPolynomial`,
   `Ideal.span` and `IsFiniteLength`. The last is an inductive finite-extension
   predicate; its noetherian/artinian description is an equivalence, not its definition.
   The polynomial input works over a commutative semiring, as the actual abbreviation does.
   No baseline citation was removed.
2. Corrected the length of the Shotton author copy to 12 pages. Added direct
   `SHOTTON20` citations to the four MP.0 targets that had mixed Shotton's locators
   into the CDN citation. The amalgam contract now names Proposition 4.3 and
   Corollary 4.4, p. 11; Theorem 4.5 is the abelian-category consequence. Corrected
   the bibliography's BP12 item to Proposition 14.7, p. 83, and Theorem 14.8, p. 84.
3. Replaced generic auxiliary matches by the actual input from DEG Lemma 4.2.1,
   Hauseux Corollary 4.2.4 and BP12 Corollaries 5.6, 3.12 and Proposition 13.1/
   Corollary 13.2. A source match no longer implies that these auxiliary passages
   prove the whole target or omit their prime restrictions.
4. Made the central-character argument in MP.1 explicit: a central pro-p group
   acts trivially on an irreducible smooth mod-p representation; the remaining
   F_p-units action splits over k. This establishes the asserted k-valued character.
5. Repaired the ordinary-parts proof and supplier request. Hauseux proves vanishing
   for cohomological H¹Ord. Emerton II Remark 3.7.3, p. 23, supplies the canonical
   injection R¹Ord→H¹Ord, enough for the derived vanishing. His Theorem 4.2.12,
   p. 30, concerns Q_p and is now explicitly only a boundary check. The proof work
   explains the Steinberg function model and character contraction. Added direct
   SR.2 edges for that injection and for continuous induction in the Banach target.
6. Repaired MP.4's annihilator propagation. The h_i are central and first kill the
   whole graded module; only in their commutative quotient does vanishing of e_if_i
   on degree-zero generators imply vanishing everywhere. The previous proof skipped
   this necessary centrality step.
7. Added Hu10's induced-extension input to the box proof: arXiv v3 Lemma 2.13(i),
   pp. 14–15, is the result BHHMS cites with journal number 2.12(i). Its containment
   condition supplies each covering edge, with predecessor index j−1. The f=1
   Frobenius/cosocle argument is separate.
8. Added `MP.5/projective-adjoint`, the missing key finite-group input. It states
   the algebraic 2-deep adjoint decomposition, the 3-deep projective decomposition
   and endpoint maps, the Cartan multiplicities, and the multiplicity-free rational
   projective lift with 2^f factors. Sources are corrected LMS22 Proposition 3.3,
   pp. 7–8; BP12 Lemmas 3.4–3.5, pp. 20–21, and 3.8, pp. 22–23; and BHHMS
   Lemma 4.1.2's last paragraph, p. 27, Lemma 6.3.7, p. 63, equation (56), p. 81,
   Lemma 7.3.2, p. 82, and Proposition 7.4.1, pp. 84–85. Generic integral lifting
   remains with the QuiverRepresentations Part II contract. Added direct uses by
   MP.6's adjoint tensor, MP.8's adjoint map and lattices, and MP.9's endomorphism ring.
9. Removed the 3-deep Diamond-tensor dependency from the 2-deep adjoint-map target:
   the new algebraic clause supplies exactly what it needs. Made the rational
   splitting coefficient extension and faithful descent explicit in MP.9 and added
   its direct MP.0 Hom-base-change input. The stage graph reflects these changes.
10. Confirmed E1–E4, corrected E2's count to three labels across two expressions,
    and added the known LMS22 correction E5. Added version/hash records for the
    auxiliary Hu10, LMS22 and author corrigé sources. Updated all affected reader
    blocks, contracts, bibliography, source findings and completed-review wording.

## Baseline, read at the required pins

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Source module and check |
| --- | --- |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean`, line 45: abbreviation for a monoid homomorphism into linear endomorphisms, with semiring and additive-module hypotheses. |
| `Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean`, line 117: class expressing finite generation of the top submodule. |
| `IsFiniteLength` | `Mathlib/RingTheory/FiniteLength.lean`, line 26: inductive finite extension of simple factors; lines 73–80 give the noetherian/artinian equivalence. |
| `MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean`, line 82: commutative-semiring polynomial algebra abbreviation. |
| `Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean`, line 46: ideal span over a semiring. |
| `Ideal.Quotient.mk` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`, line 83: the canonical quotient ring homomorphism for a commutative ring. |
| `ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean`, line 29: dimension in `WithBot ℕ∞`; line 41 gives the zero-ring bottom convention. |
| `TauCeti.exists_isProjectiveCover_of_finiteDimensional` | `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean`, lines 194–199: every module over a finite-dimensional field algebra has a projective cover. It supplies neither integral DVR lifting nor pseudocompact covers. |

All eight names exist and provide the roles claimed. The field-valued cover theorem
is retained for finite Gamma covers, while the missing integral and compact inputs
are explicitly requested. No current-only declaration was substituted for a pinned one.

## Ownership, graph, API and scope

The reviewed library audit has no entry for this new roadmap. The nearby reviewed
ProfiniteProPGroups and PadicMeasures/Iwasawa coverage was read, alongside current
Tau Ceti and current TauCetiRoadmap main. The nine later roadmaps listed in WORKERS.md
and the Completed roadmaps were screened for overlap. In particular, IntegralLattices
concerns quadratic integral lattices, not these representation lattices. No new target
duplicates those roadmaps. Current Tau Ceti's completed group algebra and compact-module
action are recorded as upstream progress, while the pinned input remains the existing
ProfiniteProPGroups roadmap.

Read supplier statements, rather than relying on layer titles: SmoothRepresentations
SR.0/SR.2 and the current smooth-category/compact/parabolic induction declarations;
QuiverRepresentations layer 3's finite algebra covers and decomposition input;
ProfiniteProPGroups layer 9's completed algebra input; LocalFieldsRamification layer 4's
tame Frobenius convention; ClassFieldTheory layer 7's geometric Artin inverse; CC.3's
qualified compact duality; NE.0's uniform graded algebra and canonical grade; R07.5's
Serre-weight induction; R30.2/R30.5/R30.6's classification and block boundaries; and
R03.3's regular-sequence/complete-intersection/CM dimension input.

The ten requests retain those owners and spell out any strengthening. In particular,
NE.0's uniform algebra does not furnish the nonuniform saturated Iwahori comparison;
Quiver's field covers do not furnish DVR projective lifts; SR.2's induction does not
by itself furnish derived ordinary parts; and the R07.5 Hecke freeness input does not
prove the Barthel–Livné finite-codimension theorem. These are explicit Part II contracts,
not silent assertions that the suppliers already contain the stronger results.
No ownership move to a higher-tier roadmap is proposed.

Every local edge is acyclic and each stage target is realised. The source hypotheses
preserve general F versus Q_p, tame unramified versus arbitrary local fields, and all
prime/depth bounds. The GK endpoint is an upper bound ≤f. No mod-p correspondence
over general F is claimed. The API/test review covered the finite-length and finite-type
distinction, the obstruction functor's failure of right exactness, negative parity and
cyclic predecessor/successor conventions, repeated endpoint characters, nonuniform
Heisenberg brackets, coinvariants versus invariants, and right precomposition actions.

## Source findings and remaining obligations

Each E1–E5 entry has this job's `confirmed` review, a reason, version-scoped locator,
and correction-search record. Findings are stated in our own words.

- **E1:** BHHMS v7 equation (44), p. 55, and Lemma 6.1.1(i), p. 56; the author copy
  has the same claim on p. 59. At p=5,f=1, independent PBW monomials e² and f² have
  the same nontrivial torus character. Only that auxiliary multiplicity clause is
  restricted to p>5; the root Ext and embedding statements remain at p>3. This is
  scoped to the read v7 and author copy, not an unread publisher text.
- **E2:** BHHMS v7 proof of Corollary 7.3.4, p. 84: three compact-cover labels across
  two expressions must use K/Z_1. The quotient's dimension argument confirms this.
- **E3:** CDN published Theorem 1.24/Lemma 1.25, pp. 18–19, cite the DEG finite Ext
  input, but the read DEG text assumes p≥5. Footnote 19 adjusts central characters;
  it does not settle p=2,3. This is a proof-reference scope gap, not a counterexample.
- **E4:** Hu12 arXiv v3, proof of Proposition 4.4, p. 36: the first obstruction
  intersection repeats the positive cell; the following inclusion and Lemma 4.5
  require the positive/negative intersection. The page image was checked.
- **E5:** LMS22 author-copy Proposition 3.3(2), pp. 7–8, has a known correction in
  [the authors' corrigé](https://www.math.univ-paris13.fr/~morra/corrige.pdf), item
  (2), p. 1. Translated summands are R-modules; they are identified with the corresponding
  projective cover only for a noncharacter shifted weight. The new 3-deep target
  satisfies that condition. The removed extra starting-weight hypothesis is recorded too.

The single mathematical gap remains the p=2,3 Ext¹-finiteness input for
`MP.1/smooth-dual-length`, requested precisely from R30.6. The reader retains the
source-backed full theorem as a target without claiming a closed proof in those primes.
All ten layers stay planned, not closed. General supplier extensions must be discharged
before implementation closure. No question or further correction blocks acceptance
of this target-level pass; the orchestrator can use the corrected packet for packaging,
preserving the gap and supplier qualifications.

## Validation

`check_blueprint.py` reports 0 errors and 0 warnings. The independent reconciliation
checks every node's reader block, every API/test, stage realisation and local graph.
`check_sorry_data.py` and intake `check-files` pass; source issue/version validation passes.
`git diff --check` passes.

The suggested file is unchanged after mathematical inspection: 176 lines, real light
definitions only, and no invented carriers for smooth categories or projective lattices.
`lean-check` against the pinned shared build succeeded with exactly 20 warnings, all
declarations using `sorry`, and no errors or other warnings. It was run with more than
20 GiB available memory and no parallel Lean process from this worker.

## Per-target ledger

The same ledger is in the packet's review object. A corrected verdict includes source,
proof or direct-edge corrections; verified targets were checked without needing changes.

| Target | Verdict | Check |
| --- | --- | --- |
| `MP.0/torsion-admissibility` | verified | CDN §§1.1.1–1.1.2: bounded-torsion invariants, cyclic local admissibility and all three distinguishing tests agree; Module.Finite and IsFiniteLength are the existing predicates. |
| `MP.0/augmented-iwasawa-algebra` | corrected | Added the direct Shotton Proposition 3.2/Lemma 3.5 citations with pages. The noncompact crossed multiplication, change-of-open cocycle and compact/discrete tests agree with the construction. |
| `MP.0/finite-presentation` | corrected | Separated CDN and Shotton locators, with exact pages. The compact-induction presentation and augmented-algebra equivalence use the stated noetherian compact ring input; all three tests distinguish it from abstract group-ring presentation. |
| `MP.0/finiteness-calculus` | corrected | Added direct Shotton Lemmas 2.6–2.8. Checked each exact-sequence direction and both finite-index implications; no unsupported submodule-finiteness claim is made. |
| `MP.0/amalgam-coherence` | corrected | Added the direct Shotton coherence and application locators; corrected its owner contract to Proposition 4.3/Corollary 4.4. The determinant-unit subgroup embeds with index two in the central quotient. |
| `MP.0/scalar-extension` | verified | CDN Lemmas 1.6–1.7: finite generation suffices for Hom base change, and admissibility makes the endomorphism division ring finite. Splitting is through its finite residue-field centre. |
| `MP.0/five-term-presentation` | verified | CDN Lemma 2.9: the two outer kernels/cokernels lie in the abelian finitely presented category, and the middle term is their extension. Equation (2.10) is not a lemma citation. |
| `MP.0/obstruction-space` | verified | Hu12 §§3.1.1, 3.3, 4.1.2: the two cell images, their intersection and normaliser action are correct. The augmentation test proves the specified functor is not right exact. |
| `MP.1/proper-quotient` | verified | CDN Proposition 1.17/Remark 1.18: the Q_p and central-character restrictions are retained. The exact Barthel–Livné finite-codimension input is requested from R07.5, beyond its Hecke freeness input. |
| `MP.1/serre-filtration` | verified | CDN Proposition 1.19: the compact-induction filtration is finite for finite type, and its proper-quotient factors use the preceding target, with the central quotient convention retained. |
| `MP.1/finite-type-presentation` | verified | CDN Proposition 1.20: the filtration, compact/finite-index presentations and exact-sequence calculus supply the claimed Q_p result; it is not extended to general F. |
| `MP.1/central-ext` | corrected | Replaced the unstated scalar-centre step by central pro-p invariants followed by the split F_p-units action. CDN Lemmas 1.22–1.23 then give the asserted finite Ext support. |
| `MP.1/cosocle-length` | verified | CDN Theorem 1.21: checked the finite-type hypothesis and the finite-length cosocle criterion; the filtration and finite Ext support supply its proof chain. |
| `MP.1/smooth-dual-length` | corrected | Replaced the generic DEG source match by its exact p≥5 finite-Ext role. CDN Theorem 1.24/Lemma 1.25 and Kohlhaase Proposition 3.9/Remark 3.10 support the target; the p=2,3 proof input remains an explicit gap. |
| `MP.2/ordinary-parts` | verified | Emerton I Definitions 3.1.3, 3.1.7–3.1.9 and Theorem 4.4.6: checked the positive monoid, finite-slope construction, right adjunction and three tests. This functor is not the ordinary Jacquet module. |
| `MP.2/ordinary-values` | corrected | Distinguished Hauseux cohomological H^1Ord from derived R^1Ord and added Emerton II Remark 3.7.3 plus the SR.2 injection contract. Theorem 4.2.12 is only the Q_p boundary test; the Steinberg and character arguments use N_0-cohomology and contraction. |
| `MP.2/obstruction-finiteness` | verified | Hu12 Theorem 4.3, Proposition 4.4, Lemma 4.5 and Corollary 3.31: checked the finite obstruction and the dimension-decreasing length argument, including the corrected positive/negative intersection in E4. |
| `MP.2/category-c` | verified | CDN Theorem 1.26/Lemma 1.29 with Vignéras Propositions 5.5, 5.6, 5.8: finite presentation, admissibility, ordinary constituents and the abelian-category conclusion keep their distinct hypotheses. |
| `MP.2/ordinary-counit` | verified | CDN Lemmas 1.31–1.32/Proposition 1.33: ordinary parts are exact on the indicated category, and the adjunction counit has the stated finite error; the F≠Q_p restriction is retained. |
| `MP.2/ordinary-banach` | corrected | Added the direct SR.2 dependency for continuous induction and inverse-limit compatibility. CDN Corollary 1.34 uses the lattice reductions and finite-error counit with their existing admissibility hypotheses. |
| `MP.3/weight-coordinates` | verified | BHHMS §2: strict alcove inequalities equal N≤r_i≤p−N−2. The central quotient, determinant twists, embedding order and three tests are coherent with the real Lean predicate. |
| `MP.3/translation-map` | verified | BHHMS equation (14), Lemma 2.4.6/Remark 2.4.7: successor parity and Euclidean division, including negative coordinates, agree. All four tests and the Lean representative formula were checked. |
| `MP.3/change-origin-ext` | corrected | Replaced the generic BP12 match by Corollary 5.6’s one-coordinate regular-weight criterion. The origin change, root shift and adjacency statements keep their regularity and distinctness restrictions. |
| `MP.3/tame-weight-set` | verified | BHHMS Definition 2.3.1/Proposition 2.4.2: the tame parameter and weight formula agree. Read the actual tame Frobenius and geometric local Artin supplier conventions; neither is redefined here. |
| `MP.3/diamond-socle` | corrected | Replaced the generic BP12 match with Proposition 13.1/Corollary 13.2’s maximal multiplicity-one submodule and socle summands. The finite Diamond module and obstruction intersection remain distinct. |
| `MP.4/gk-dimension` | verified | BHHMS §5.1 equation (36): dimension is computed from a uniform compact dual and canonical grade, with the stated zero convention and independence comparisons; the general filtered algebra belongs to NE.0. |
| `MP.4/dimension-comparisons` | verified | BHHMS Lemmas 5.1.2–5.1.3: quotient and central-regular-sequence grade comparisons preserve their annihilator and regularity hypotheses. The stronger filtered comparison is an explicit NE.0 contract. |
| `MP.4/iwahori-valuation` | verified | BHHMS Lemma 5.3.1: checked the saturated nonuniform p-valuation and the SL_2-derived Lie coordinates. The plan does not infer uniformity of I_1/Z_1 from a uniform-open theorem. |
| `MP.4/graded-iwahori` | verified | BHHMS Lemma 5.3.2, Proposition 5.3.3 and Theorem 5.3.4(i): PBW generators and Heisenberg brackets agree, including central degree-two h_i and the torus character action. |
| `MP.4/crossing-algebra` | verified | BHHMS Theorem 5.3.4(ii): quotienting the h_i and e_if_i gives the disjoint-variable crossing algebra. The regular-sequence owner contract supplies Cohen–Macaulay dimension; all four tests and the real Lean ideal were checked. |
| `MP.4/iwahori-truncations` | verified | BHHMS equation (45): checked the dual convention, Loewy length and multiplicities of W_{chi,n}; the tests distinguish radical quotients from invariant subspaces. |
| `MP.4/iwahori-gk-bound` | corrected | Repaired propagation of annihilation from degree-zero generators: first kill central h_i, then e_if_i are central in the commutative quotient. The grade comparison and crossing dimension then give Corollary 5.3.5. |
| `MP.5/iwahori-extensions` | verified | BHHMS Lemmas 6.1.1–6.1.2: the p>3 Ext and truncation embeddings hold; only the nontrivial-character multiplicity clause needs p>5 because of E1’s p=5,f=1 collision. |
| `MP.5/borel-injectives` | verified | BHHMS Lemma 6.1.3/Corollary 6.1.4: checked the repeated endpoint character, base-p digit order and w-conjugated signs. The API and tests preserve the nonsplit injective structure. |
| `MP.5/finite-weight-hulls` | corrected | Replaced the generic BP12 match with the exact Corollary 3.12 interval property. The principal-series and finite-hull digit bounds, simple endpoints and interval length agree with BHHMS Lemma 6.2.1. |
| `MP.5/projective-adjoint` | added | Added the missing finite Gamma projective tensor/endpoint, Cartan and rational-lift input. Checked the 2-deep algebraic clause and 3-deep projective clauses against corrected LMS22 Proposition 3.3, BP12 digit sequences and BHHMS pp. 27, 63, 81–85. General DVR lifting stays with QuiverRepresentations. |
| `MP.5/first-order-weight-hulls` | verified | HW22 Lemma 2.10, Theorem 2.23, Corollaries 2.25–2.26, Theorem 2.30 and Corollary 2.31: checked multiplicity-free hull/quotient statements and the separate f=1 self-Ext endpoint condition. |
| `MP.6/box-module` | corrected | Added and read Hu10 v3 Lemma 2.13(i), pp. 14–15, for the previously hidden induced-extension covering edges. The f=1 Frobenius argument is separate; the rectangular order uses the predecessor index. |
| `MP.6/box-torsion` | verified | BHHMS Lemma 6.2.3/Proposition 6.2.4: digit-box invariance and the torsion filtration use the central quotient and the stated box-depth bounds; the filtration is not replaced by a semisimple sum. |
| `MP.6/induced-extension-control` | verified | BHHMS Lemmas 6.3.1 and 6.3.3–6.3.5: checked the cosocle and extension directions after induction, with finite-index reciprocity and the specified nonsplit Iwahori extension. |
| `MP.6/diamond-box` | verified | BHHMS equation (48)/Remark 6.3.6: the sign and predecessor-parity constraints give the stated Diamond interval, with all three API tests distinguishing it from an unrestricted box. |
| `MP.6/adjoint-tensor` | corrected | Added the direct finite adjoint/projective input. BHHMS Lemmas 6.3.7–6.3.9 and Proposition 6.3.10 justify the filtration and its factors under the 3-deep restriction. |
| `MP.6/maximal-enlargement` | verified | BHHMS Theorem 6.3.11: checked maximality inside the specified first-order hull and the unchanged-socle multiplicities. It relies on the box and extension-control targets, not an arbitrary injective envelope assertion. |
| `MP.6/socle-enlargement` | verified | BHHMS Corollaries 6.3.13/6.3.15: the tame socle enlargement follows from the Diamond summands and the finite-label separation, with all stronger digit bounds retained. |
| `MP.7/connected-characters` | verified | BHHMS Definition 6.4.2/Lemma 6.4.3: connectedness is the stated semisimple Iwahori-character relation, not graph connectedness of all regular weights. The three tests enforce that scope. |
| `MP.7/induced-socle-vanishing` | verified | BHHMS Proposition 6.4.1: the map vanishes on the indicated induced Loewy-three socle under the precise character exclusions; the induction/cosocle prerequisites match the proof. |
| `MP.7/diamond-connected` | verified | BHHMS Lemma 6.4.3: the proof is restricted to the tame Diamond invariant set used here, and uses its earlier weight labels and character adjacency; no general nontame connectedness is claimed. |
| `MP.7/hom-second-layer` | verified | BHHMS conditions (a)–(b), Lemma 6.4.4/Corollary 6.4.5: checked the second-radical-layer vanishing and the multiplicity comparison, with the hypotheses preserved individually. |
| `MP.7/hom-third-layer` | verified | BHHMS Proposition 6.4.6: the no-new-map result passes to the third Iwahori layer using the maximal enlargement and connected character constraints; Hom dimensions are not replaced by semisimplicity. |
| `MP.7/local-gk-bound` | verified | BHHMS Theorem 6.4.7 and introductory Theorem 1.4: the conclusion is the upper bound dim_G pi≤f, with its full multiplicity hypotheses. It does not assert equality or a general local Langlands correspondence. |
| `MP.8/bockstein` | verified | BHHMS Lemma 7.1.1: the exponential lift and p-division define the infinitesimal action independently of lifts; its four-term sequence uses K_1 coinvariants. The unramified O and mod-p-trivial K_1 hypotheses are essential. |
| `MP.8/sublattice-bockstein` | verified | BHHMS Lemma 7.1.4: checked the preimage-lattice quotient p²V° rather than p²V_1°, the exact sequence and its comparison maps. The tests detect these denominator and coinvariant choices. |
| `MP.8/adjoint-psi` | corrected | Removed the overly strong 3-deep Diamond-tensor prerequisite and imported the new 2-deep algebraic clause. BHHMS Lemma 7.2.1/Proposition 7.2.2 give eigenvalues −2r,4,2(r+2), all nonzero in the specified range. |
| `MP.8/projective-lattice` | corrected | Added the direct finite projective decomposition and middle-summand input. Equations (56)–(57) give the fibre product; general integral lifting is separately requested and never inferred from the field-only baseline. |
| `MP.8/lattice-coinvariants` | corrected | Added the finite tensor endpoint input. BHHMS Proposition 7.3.1, Lemma 7.3.2 and Theorem 7.3.3 give the short exact sequence and K_1-coinvariant identifications, distinct from invariants. |
| `MP.8/projective-truncation` | verified | BHHMS Corollary 7.3.4: corrected K/Z_1 covers are used in all quotient expressions. Uniformity of K_1/Z_1 gives tangent dimension 3f and hence (3f+1)dim P_sigma, verifying the surjection is an isomorphism. |
| `MP.9/endomorphism-ring` | corrected | Added direct finite projective and scalar-extension dependencies. The multiplicity-free rational lift and exact Cartan multiplicities give dimension 2^f(f+1); faithful finite coefficient descent makes the commutativity proof valid over the original k. |
| `MP.9/cyclic-hom` | verified | BHHMS Lemma 7.4.2 with HW22 Theorem 2.30: the unique multiplicity-one quotient supplies a generator. The End action is on the right by precomposition, with the stronger 6-deep bounds retained. |
| `MP.9/relative-projectivity` | verified | BHHMS Proposition 7.4.3/Remark 7.4.4: checked the Hom isomorphism for every subquotient, the simple-cosocle surjection and the exact subquotient-generated abelian category; no ambient projectivity is asserted. |
