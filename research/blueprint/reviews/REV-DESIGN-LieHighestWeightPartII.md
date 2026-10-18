# Independent review: LieHighestWeightPartII

Job: REV-DESIGN-LieHighestWeightPartII · issue #3560. Reviewer: Codex, session codex-pfMxCX. Date: 2026-10-18. Input author: Codex, session codex-hbEHD0; this reviewer did not author the input.

**Verdict: accepted after corrections.** All 28 targets were checked against their statements, hypotheses, proof routes and prerequisites. All 17 baseline declarations exist at the stated pins and have sufficient hypotheses for their uses. The nine definitions/constructions have 39 API items and 32 discriminating tests. There are six ordered layers, 23 planets, 19 explicit supplier requests, no recorded mathematical gaps and no added nodes. This is acceptance of a complete target-level plan. Implementation remains unchecked throughout.

## Corrections made in this review

1. N0/nilpotent-orbit cited Sommers §§2.1–2.4, pp.11–13, which develop sl2 and state Jacobson–Morozov. Moved its source to §3.1, pp.15–16, which actually introduces adjoint orbits and the triple-orbit correspondence.
2. Removed Sommers §2.4, pp.12–13, from N0/jordan-centralizer: that passage does not prove the claimed centralizer reduction. Bălibanu §5, proof of Theorem 5.1, pp.14–15, supplies the argument and remains cited. The algebraic adaptation is explained in the target's proof steps.
3. Changed the N1/restriction sign non-example to the standard **nonzero** sl2 triple. Swapping e and f while keeping h violates the bracket relation there; the original unrestricted wording failed at the zero triple.
4. Expanded the N4 recognition citation to CH Lemma 2.4, pp.6–7: its statement begins on p.6, and its proof continues on p.7.
5. Made the LieHighestWeight Layer 7 supplier convention explicit. For root-row/coroot-column Aij=αi(hj), the Serre constructor takes Aᵀ, since its relation is [Hi,Ej]=CMij Ej. This matches the current supplier's `serre_presentation_equiv` statement. It removes an ambiguity in the contract without changing the root-profile orientation.

The reader contains every corrected statement and locator. The roadmap definition and suggested Lean file need no changes.

## Sources and version discipline

The source-specific matches were read at the packet's identified versions; their public-file SHA-256 values were independently reproduced. The cleared Jantzen second-edition copy was read and hashed in place. No book file, extracted passage or source quotation is included in this review or its deliverables.

| Source | Passages checked for these targets |
| --- | --- |
| Ciubotaru–Harris, arXiv:2311.15300v1 | Definition 2.2 and Lemma 2.4, pp.6–7; Lemma 6.30, p.24; Proposition 10.2, p.32; Lemma 10.9 and Tables 2–4, pp.35–37. The table entries are graded dimensions. |
| Bălibanu, *Part I: Geometry of semisimple Lie algebras* | §5, Theorem 5.1 and its proof, Corollary 5.2, Proposition 5.4, Remark 5.6 and Lemma 5.7, pp.13–17: existence, conjugacy and characteristics. The centralizer/Jordan reduction and the trace argument were checked separately. |
| Sommers, preliminary notes, 17 July 2009 | §§2.1–2.4, pp.11–13, for sl2 and Jacobson–Morozov; §3.1, pp.15–16, for adjoint orbits, neutral characteristics and labels 0,1,2. |
| de Graaf, arXiv:math/0702193v2 | §§1–3, pp.1–5, especially §3 Lemmas 2–3, pp.4–5: characteristic diagrams, degree-two open orbits and explicit triple tests. Its probabilistic search is not used as a theorem or oracle. |
| GAP SLA, commit 30b585c78be885925776f01522fdce036d45e661 | `SLAfcts.nilporbs`, all five exceptional branches: diagrams and coordinate conventions, including the F4 list before its GAP-numbering permutation. The data are independent numerical input only. |
| Milne, *Reductive Groups*, v2.00 (10 March 2018) | §§20.3–20.6, pp.102–103; §§20.27–20.30, pp.107–108; §§17.59–17.60, p.80. The actual character lattice and characteristic-zero restriction are retained. |
| Jantzen, *Representations of Algebraic Groups*, second edition (2003) | II.2.2, p.176, and II.2.6–II.2.7, pp.178–179: highest-weight bounds and multiplicity, dominant-character existence and the simple-module classification. Only the narrow semi-invariant construction needed for N5 is planned here. |

The later Annals article has different revision metadata; its text was not collated. All CH source-error verdicts concern only the identified v1. The [publisher metadata](https://annals.math.princeton.edu/2026/204-2/p03) and [arXiv version record](https://arxiv.org/abs/2311.15300) were checked again. The [Milne errata page](https://www.jmilne.org/math/CourseNotes/errata.html), RG subsection, lists earlier v1.00 corrections but neither of the two v2.00 errors recorded here. An absence from that page is not a new-discovery claim.

All six existing `sourceIssues` were independently confirmed and now have explicit review objects. E1 is witnessed by the principal F4 sequence 4,0,4 and by finite half-spin support; E2 by the missing relation between the Levi and complementary E8 profiles; E3 by the negative simple-root pairing at (1,1,3,3). E4 is repaired by triangularizing h and strictly triangularizing only the centralizer terms, which suffices for the trace argument. E5 has the characteristic-p SL2 Frobenius-twist counterexample; E6 conflicts with the same source's simply-connected/Picard criterion for PGL2. The N5 proof uses local Laurent-UFD charts and avoids that false global Picard assertion.

## Baseline and ownership audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations, not name matches, were read. The important hypotheses and interfaces are:

| Declaration | Confirmed interface or hypothesis |
| --- | --- |
| `mathlib:IsSl2Triple` | Contains h≠0 and the three bracket relations; the zero adapter is necessary. Source: `Mathlib/Algebra/Lie/Sl2.lean`. |
| `mathlib:LieModule.toEnd` | Native Lie-module action as an endomorphism-valued Lie homomorphism. Source: `Mathlib/Algebra/Lie/OfAssociative.lean`. |
| `mathlib:LieAlgebra.ad` | Native adjoint Lie homomorphism on the Lie algebra. Source: `Mathlib/Algebra/Lie/OfAssociative.lean`. |
| `mathlib:LieAlgebra.IsKilling` | Killing nondegeneracy expressed through its orthogonal ideal; no invented semisimple carrier. Source: `Mathlib/Algebra/Lie/Killing.lean`. |
| `mathlib:CategoryTheory.FilteredObject` | The native filtered-object structure; eigenfiltration subobjects are vector subspaces, not generally Lie submodules. Source: `Mathlib/CategoryTheory/Filtration/Basic.lean`. |
| `tauceti:TauCeti.iSup_eigenspace_toEnd_intCast_eq_top` | Integer neutral eigenspaces span finite modules over an algebraically closed characteristic-zero field. Source: `TauCeti/Algebra/Lie/Sl2/Spectrum.lean`. |
| `tauceti:TauCeti.exists_int_of_hasEigenvalue` | Actual eigenvalues are integer casts under the same finite sl2 hypotheses. Source: `TauCeti/Algebra/Lie/Sl2/Spectrum.lean`. |
| `tauceti:TauCeti.finrank_eigenspace_toEnd_neg` | Opposite-weight finranks agree in characteristic zero for finite modules; algebraic closedness is not an extra hypothesis of this declaration. Source: `TauCeti/Algebra/Lie/Sl2/WeightMultiplicity.lean`. |
| `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv` | Finite sl2 modules admit an internal decomposition into standard irreducibles. Source: `TauCeti/Algebra/Lie/Sl2/Decomposition.lean`. |
| `tauceti:TauCeti.lieHomOfSl2Basis` | The basis-to-hom constructor requires the bracket equations and permits the zero map. Source: `TauCeti/Algebra/Lie/Sl2/Basic.lean`. |
| `tauceti:TauCeti.DynkinType.cartanMatrix` | Bourbaki Cartan matrices use root rows and coroot columns; the G2 entry uses the transpose of Mathlib’s named G2 matrix. Source: `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean`. |
| `tauceti:TauCeti.oppositionPerm` | The chosen base permutation induced by −w0; supplies the opposition condition. Source: `TauCeti/LinearAlgebra/RootSystem/Opposition.lean`. |
| `mathlib:LieModule.isNilpotent_iff_forall` | Engel for a Noetherian Lie algebra acting on a module; finite-dimensionality supplies the needed finiteness. Source: `Mathlib/Algebra/Lie/Engel.lean`. |
| `mathlib:LieDerivation.IsKilling.exists_eq_ad` | Every derivation is inner for a finite-dimensional Killing Lie algebra over a field. Source: `Mathlib/Algebra/Lie/Derivation/Killing.lean`. |
| `mathlib:Module.End.exists_isNilpotent_isSemisimple` | Commuting nilpotent and semisimple parts in the generated endomorphism algebra over a perfect field. Source: `Mathlib/LinearAlgebra/JordanChevalley.lean`. |
| `mathlib:LieModule.exists_nontrivial_weightSpace_of_isSolvable` | Lie’s theorem uses solvability and IsTriangularizable; algebraic closedness supplies splitting and recursion on quotients gives a flag. Source: `Mathlib/Algebra/Lie/LieTheorem.lean`. |
| `mathlib:LieDerivation.exp` | A nilpotent derivation exponentiates to a Lie equivalence using finite sums and the rational scalar structure. Source: `Mathlib/Algebra/Lie/Derivation/Basic.lean`. |

The reviewed library audit AF.1/AF.4 contains representation and central-character infrastructure, not this orbit-recognition theorem. The current Tau Ceti tree additionally contains `Algebra/Lie/Killing/AdNilpotent.lean`, absent at the pin: its vanishing-trace, orthogonal-range and first-bracket statements are reused by N0 rather than made new targets. The current source tree and current roadmap documents were searched for the orbit, adapted-triple and recognition interfaces; no duplicate target was found.

The current LieHighestWeight and ReductiveGroups readers were read in full, and their Suggested files and the relevant RootSystems, SpinRepresentations and OrthogonalSpinGroups contracts were checked. LieHighestWeight owns ordinary sl2 decomposition, weights, Verma/PBW theory, finite-dimensional classification, complete reducibility and Serre presentation. RootSystems owns chambers, classification and finite integral root data. SpinRepresentations Layer 5 supplies its complex Lie half-spin comparison; arbitrary characteristic-zero half-spin modules come from LieHighestWeight and are not asserted to descend to SO. OrthogonalSpinGroups owns general-field group and spinor-norm infrastructure and does not already plan these nilpotent recognition results. The existing PadicHodgeTheory P7 finite filtered-space node was also read: N1 only reindexes the native eigenfiltration and does not re-plan that category.

All 19 requests are precise planned inputs, not claims that the suppliers are already implemented. They end the backward chains in the owning ordinary-theory stages. In particular, N0 proves triple integration and the fixed-neutral open-orbit application, while ReductiveGroups supplies ordinary group actions, tangent/separability infrastructure and Bruhat structure. N5 proves its own narrow algebraic highest-weight existence bridge; neither abstract Lie-module existence nor the complex spin-group construction is substituted for algebraic-group descent.

The design brief #3373 explicitly allows planning the first independent continuation and recording the others as successor proposals. The eleven CH items all have node routes. The two other directions retain their complete inventories: 39 Fu items and three BCGP items in PadicEnvelopingAlgebras, and 136 BCGP items in the completed-category-O continuation. These have different carriers and proof obligations. Their split is a proposal for the maintainer, not an assertion that this packet plans those 178 items.

## Proof closure and definition APIs

The N0 argument handles zero separately, reduces nonzero existence through proper derived centralizers, and uses Engel/Lie and a trace pairing in the remaining case. The finite exponential integration step closes the passage from Lie conjugators to connected inner group conjugators without assuming that every Lie module descends to the chosen G. Kostant conjugacy and fixed-neutral conjugacy are proved by different arguments, so the recognition chain does not assume its own conclusion.

N1 distinguishes cumulative dimensions, graded multiplicities and sl2 multiplicities. N2 derives the form-parity and determinant criteria and uses one fixed half-spin module to distinguish the very-even pair. N3 checks a finite superset of possible characteristics, so the exceptional proof needs neither a full nilpotent classification nor semantic orbit labels. N4 retains factor labels and permits Lie modules that do not descend to G. N5 uses genuine algebraic character lattices, finite patterns with q>1, and positive characters; it concludes conjugacy of positive real parts only.

Every definition/construction has uses, a native comparison, usable operations and at least three tests. The tests distinguish zero from nonzero triples, inner from outer orbits, increasing from graded dimensions, root from coroot orientation, candidates from actual orbit data, and positive parts from phase information. The restriction sign test was corrected as described above. The other numerical and degenerate tests agree with their definitions.

| Definition/construction | API items | Tests |
| --- | ---: | ---: |
| N0/zero-triple | 4 | 3 |
| N0/nilpotent-orbit | 4 | 3 |
| N1/restriction | 4 | 3 |
| N1/weight-filtration | 5 | 3 |
| N3/root-profile | 4 | 4 |
| N3/candidate-certificate | 4 | 4 |
| N3/appendix-table-interface | 4 | 4 |
| N5/weight-pattern | 6 | 4 |
| N5/positive-real-part | 4 | 4 |

## Independent exceptional arithmetic

The computation used exact integer coefficient vectors. Starting from the simple roots, close under s_j(c)=c−(Σ_i c_i Aij)e_j with the root-row matrices stated in the reader. Enumerate a∈{0,1,2}^r, impose opposition invariance (E6 exchanges indices 1↔6 and 3↔5), and form d_m=rank·[m=0]+#{c:Σ_i c_i a_i=m}. Retain d_m≥d_(m+2) for all m≥0, padding by zero to the support bound. Compare complete nonnegative profile vectors, using root symmetry for the negative degrees.

| Type | Roots | Support bound | Candidates | Distinct profiles | SLA diagrams including zero |
| --- | ---: | ---: | ---: | ---: | ---: |
| G2 | 12 | 10 | 7 | 7 | 5 |
| F4 | 48 | 22 | 28 | 28 | 16 |
| E6 | 72 | 22 | 34 | 34 | 21 |
| E7 | 126 | 34 | 274 | 274 | 45 |
| E8 | 240 | 58 | 245 | 245 | 70 |

Without opposition, E6 gives 212 candidates but only 123 profiles. This independently checks that the symmetry hypothesis does real work. Principal G2 gives (2,0,2,0,1,0,1,0,1,0,1), and principal F4 begins (4,0,4,0,3,0,3), agreeing with the reader and the filtration-header correction.

Every one of the 91 numeric profiles printed in CH Tables 2–4 was independently parsed and matched against profiles recomputed from the pinned SLA diagrams: G2 5, F4 16, E8 70. For F4 the pre-permutation list matches the packet's numbering. This comparison validates numeric profiles as a set. It does not certify semantic Bala–Carter labels, completeness of orbit lists, root-vector triples or a Lean reflection certificate. Those boundaries agree with the stated construction targets. E6/E7 are checked directly, with no invented CH table citation.

## Per-node verdicts

The full identifiers carry prefix `LieHighestWeightPartII:`. The same verdicts and reasons are recorded in the packet's `review.checked` array.

| Node | Verdict | Reason |
| --- | --- | --- |
| N0/zero-triple | verified | The three relations force h=0 iff e=f=0 in characteristic zero. The adapter preserves the native nonzero IsSl2Triple contract and admits precisely the extra zero triple. |
| N0/nilpotent-orbit | corrected | Moved the SOM locator to §3.1, pp.15–16, where adjoint orbits and the triple correspondence occur. Quotients use the connected inner action, include zero and retain the distinction between O and SO. |
| N0/jordan-centralizer | corrected | Removed SOM §2.4 as unsupported for this reduction. BAL Theorem 5.1 proof, pp.14–15, supplies the proper derived-centralizer induction; generalized eigenspace brackets and inner derivations justify the stated algebraic adaptation. |
| N0/jacobson-morozov | verified | Checked the induction, Jordan-centralizer reduction and the centralizer-nilpotent Engel/Lie alternative. The trace argument yields h in im(ad e), then the degree −2 projection supplies f. The new current-library first-bracket facts are reused, not re-planned. |
| N0/triple-integration | verified | Finite sl2 decomposition gives the algebraic SL2 action in a faithful ambient representation. The finite exponential preserves the defining ideal in characteristic zero; root generators supply membership in G. This also proves inner invariance for arbitrary Lie modules without group descent. |
| N0/kostant-conjugacy | verified | At fixed e the difference of neutral elements has positive centralizer weights. Successive finite exponentials remove them, with the degree −2 kernel condition giving uniqueness of f. Nilpotent exponentials are supplied by the integration step. |
| N0/neutral-conjugacy | verified | DG Lemmas 2–3, pp.4–5, support the degree-two open-orbit argument. Surjectivity of ad(e):L0→L2 follows from sl2 strings; characteristic-zero separability and irreducibility give a unique open orbit, followed by uniqueness of f. |
| N1/restriction | corrected | Native basis-to-hom and Lie-module restriction supply the construction and its API. Restricted the sign non-example to the standard nonzero triple, since swapping the zero triple does not fail. |
| N1/weight-filtration | verified | The increasing sum of integer eigenspaces has the stated zero jump, finite bounds and native FilteredObject comparison. The generic decreasing filtered-space owner is reused by reindexing, not duplicated. |
| N1/graded-comparison | verified | Integral diagonalization identifies gr_i with the i-eigenspace. Finite differences recover cumulative dimensions and sl2 irreducible multiplicities d_n−d_(n+2), including the zero and trivial summands. |
| N1/tensor-exactness | verified | Maps preserve neutral eigenspaces, yielding strictness and levelwise exactness. Tensor convolution and the dual index −i−1 agree with the increasing convention and the existing weight laws. |
| N2/classical-partitions | verified | The invariant-form parity on sl2 irreducibles gives the orthogonal/symplectic partition constraints. The determinant of a centralizer reflection is (−1)^block-size, so precisely the very-even orthogonal class splits under SO. |
| N2/half-spin-separation | verified | Checked ascending D_r root signs, the actual half-sign weight lattice and the even-sign Weyl action. In the very-even case the fixed half-spin maxima are A and A−a1; the example (1,1,3,3) gives 4 and 3. No descent to SO is assumed. |
| N2/classical-recognition | corrected | The standard module recovers the partition; one fixed Lie half-spin separates the SO split pair. A classical root-type identification is upgraded using the existing Lie Serre presentation rather than being treated as a Lie-algebra isomorphism by itself. Made the supplier contract explicit: the Serre constructor takes the transpose of the root-row Cartan matrix, as stated by the current upstream presentation theorem. |
| N3/dominant-characteristic | verified | Root sl2 strings give labels 0,1,2; the SL2 Weyl element conjugates h to −h, giving opposition invariance. The adjoint sl2 decomposition gives every multiplicity inequality used by the finite candidate set. |
| N3/root-profile | verified | The formula counts root coefficient pairings and adds rank at degree zero. Independently generated the finite roots using the pinned Cartan orientation; root counts are 12,48,72,126,240 and support bounds 10,22,22,34,58. |
| N3/candidate-certificate | verified | The finite checker uses a necessary-condition superset, not an asserted orbit classification. Exhaustive exact integer enumeration independently reproduces candidate counts 7,28,34,274,245, with zero and the principal label included. |
| N3/candidate-profile-injective | verified | Independent exhaustive profile comparison gives 7,28,34,274,245 distinct profiles on the respective candidate sets. Removing E6 opposition gives 212 candidates but only 123 profiles. Lean certificates and root-datum comparison remain explicit implementation targets. |
| N3/exceptional-separation | verified | Actual neutral elements lie in the checked candidate set; profile injectivity identifies their dominant characteristics, and neutral conjugacy identifies the triples. E6 and E7 are checked directly, avoiding the unsupported E8-Levi inference. |
| N3/appendix-table-interface | verified | Independently parsed and matched all 91 numeric CH profiles to profiles recomputed from the pinned SLA diagrams: 5 G2,16 F4,70 E8. The construction additionally requires root-vector witnesses; those and semantic Bala–Carter labels are not claimed verified by this arithmetic check. |
| N4/filtration-recognition | corrected | Expanded the CH Lemma 2.4 locator to pp.6–7. Factor-selective modules prevent permutation of repeated simple factors; the adjoint-group product conjugator lifts on algebraically closed points. Finite differences give the stated equivalence with restricted sl2 modules. |
| N5/root-coset-half-integrality | verified | The integer/half-integer test uses the abstract real root space and the actual root lattice, so no order on K or unrestricted algebraic-group weight lattice is introduced. Root-coset invariance gives the claimed implication. |
| N5/highest-weight-test | verified | The occurring highest weight and λ minus nonnegative root combinations give both implications, with all weights quantified. Differentiation preserves irreducibility here by torus weights and root subgroup generation in characteristic zero. |
| N5/weight-pattern | verified | The finite pattern records moduli q^(i/2) for q>1, including zero-dimensional, direct-sum, tensor and dual tests. Equal moduli deliberately forget phases; the semisimple invertibility hypothesis excludes zero eigenvalues. |
| N5/positive-real-part | verified | Absolute value of every genuine torus character is a multiplicative positive character. Weyl compatibility and maximal-torus conjugacy make its orbit intrinsic; this does not force semisimple elements with different phases to be conjugate. |
| N5/algebraic-highest-weight-existence | verified | Read Jantzen II.2.2, p.176 and II.2.6–2.7, pp.178–179, in the cleared second edition. The regular semi-invariant on U+TU−, rank-one boundary exponents and Laurent-UFD extension give the algebraic representation on the actual character lattice; local finiteness gives a finite module. Lie-module existence alone would not suffice. |
| N5/character-separation | verified | Dominance induction on leading orbit sums spans Weyl-invariant Laurent characters using allowed algebraic highest weights. Finite-orbit interpolation and averaging separate positive Weyl orbits. Milne §20.30 is used only in characteristic zero. |
| N5/real-part-recognition | verified | A geometric pattern determines each trace at the positive part by summing n_i q^(i/2). Character separation then gives Weyl conjugacy and hence conjugacy of positive real parts, with no conclusion about phases. |

## Validation and completion

- `scripts/check_blueprint.py` passes with zero errors and zero warnings: 28 nodes, 39 API items, 32 tests, 23 planets, 17 baseline declarations, 19 requests and six planned stages with empty remaining lists.
- `lean-check research/blueprint/suggested/LieHighestWeightPartII.lean` compiled successfully at the pinned build; the only diagnostics were twelve expected proof-placeholder warnings. The file is 144 lines, uses existing carriers and light real-bodied definitions, and has no placeholder data definition. It was not changed during review.
- `scripts/check_sorry_data.py` passes for the suggested file. The submission file-scope check and `git diff --check` pass. Packet/reader identifiers, APIs, tests, prerequisites, coverage and review completeness were cross-checked.

No baseline declaration was removed. No new node was required, so no `addedBy` annotation is needed. All six stages have a complete target-level planning pass; their status remains planned and their implementation status unchecked. The 19 supplier requests and the formal certificates are work for the eventual implementation, not gaps concealed by this review. Packaging and the proposed successor split remain separate jobs. This review claims and completes only issue #3560.
