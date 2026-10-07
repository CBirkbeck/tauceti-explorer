# Independent review of generalized Heegner cycles, GH.0–GH.7

Job `REV-GeneralizedHeegnerCycles--GH.0`, [issue #416](https://github.com/CBirkbeck/tauceti-explorer/issues/416). Reviewer: Codex, session `codex-xUXWeo`, 7 October 2026. This session did not write the planning pass. This is a completed review, not a checkpoint.

**Verdict: needs_changes.** The source mathematics and supplier boundaries are substantially careful, and the clear errors identified below have been corrected. Five object/test contracts remain unverifiable. The reader document also retains mathematical errors corrected here; it is outside this review’s permitted deliverables. Acceptance needs the specified revision, followed by independent review. Missing implementations, unread supplier proofs explicitly recorded as gaps, and omitted owner conditions permitted by protocol §13 are not themselves reasons to reject this plan.

The packet stays `complete`, and all eight stages stay `planned`: each target is represented, with precise remaining work. No stage is `closed`; every `implementationStatus` stays `unchecked`.

## Counts and scope

| Item | Input | Reviewed packet |
| --- | ---: | ---: |
| Nodes | 66 | 66; none added or removed |
| Definitions / constructions / theorems / comparisons / lemmas / applications | 3 / 15 / 29 / 15 / 3 / 1 | unchanged |
| API items | 61 | 63 |
| Unit tests | 54 on all 18 definitions/constructions | 54; one strengthened, three clarified |
| Source citations | 86 | 86; all excerpt texts checked, erroneous locators corrected |
| Baseline declarations | 9 | all 9 independently confirmed; none removed |
| Requests / gaps | 17 / 16 | 18 / 18 |
| Source issues | 6 | 7, all independently confirmed |
| Planets | 36 | 36; key objects, constructions and named theorems |
| Stages in scope / planned / closed | 8 / 8 / 0 | unchanged; GH.8 is outside this part |
| Suggested Lean elaboration | attempted | stopped at unavailable imported object file, before body |

Per-node verdicts: 37 verified, 24 corrected, 5 unverifiable, zero added. Twenty-seven packet nodes have edited content, including the conditional factor-order API mirrored in the suggested file.

## Evidence and method

Read both binding protocols, WORKERS, the upstream guide and browser baseline instructions; the input packet, all 66 proof outlines/prerequisite lists/acceptance clauses, the complete suggested file, the reader, the current roadmap stage descriptions, its reviewed decomposition, the reviewed GH library audit and the source passages underlying each node. The review is at **target level**: it does not split every nontrivial source proof into new lemma nodes. Missing exports are requests/gaps, rather than privately rebuilding another owner’s subject.

Downloaded the six public versions in the input packet and independently reproduced their SHA-256 receipts. Whitespace-normalized comparison found every quoted node excerpt in the relevant PDF text; page locations were checked separately, because literal matching alone cannot validate a locator. In particular, the OCR renders the ideal-level symbol like an ordinary N; the published page 1054 was inspected visually to resolve it. Read the source proof routes, not just the quotations. BDP2017 Proposition 4.1.2, Hsieh’s underlying nonvanishing theorem, Nekovář’s parity comparison and unfinished local regulator/lattice exports remain explicitly identified source or supplier obligations, not reviewed proofs.

| Public source | Edition used | Scope of receipt |
| --- | --- | --- |
| [BDP](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Duke 162 (2013), 116 pages | Cited geometry, §3 comparisons/Coleman arguments, §5.3 formula and appendix model scope |
| [Castella–Hsieh](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | author copy dated 2 July 2022, 40 pages | All cited CH statements/proofs and their running hypotheses |
| [CH erratum](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf) | one page | Entire correction notice |
| [Longo–Vigni](https://arxiv.org/pdf/1605.03168) | arXiv v1, 20 pages | Cited hypotheses/control/universal-norm/Kolyvagin arguments; **not** a collation of Kyoto 2019 |
| [Castella variation](https://web.math.ucsb.edu/~castella/Heegner.pdf) | author copy, 31 pages | Family and local checkpoints through §6.2 |
| [Kobayashi–Ota](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf) | author-hosted proceedings copy, 58 pages | Lemmas 4.7/4.10 and the complete lifting/orthogonality proof; its Condition 2.3 remains an application input |
| [CH publisher-formatted print](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf) | Math. Ann. 370 (2018), 567–628 | **Only §4.4 p.593** collated for E7; other CH locators remain tied to 2022 |

The added print-copy receipt is SHA-256 `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade`. The six unchanged hashes and all seven URLs/edition limits are in `sources` and `sourceVersions`. The publisher LV access block is not evidence that the preprint slips survive in the version of record.

## Corrections made

1. **CM monomial independence.** A noninteger CM endomorphism need not give distinct eigenvalues on every symmetric monomial. For α=i, r=2 the extreme values both equal −1. The proof now uses the normalized monomial basis/joint algebraic characters, with the direct CM-basis prerequisite.
2. **Marked level and ideal action.** BDP uses `ker φ∩A[𝔑]=0`, not the full `A[N]`. Corrected the cyclic ideal subgroup, notation and semigroup of invertible integral ideals prime to `𝔑∩O_c`; the original prime-to-cN restriction was not that semigroup’s definition. General CM descent beyond the HE unit-field restriction is explicitly requested for the field-of-definition node.
3. **Denominators and indices.** The product correspondence has clearing denominator `N^m2^{2m}(m!)²`. The proposed scalar `(2N·m!)²` is insufficient in general (already the N-primary exponent fails at N=5,m=3). Corrected the cycle’s dimensions and m/r slips in homological triviality and AJ proof steps. The R14.3 request now includes fine-level descent when the source level is N≤4, since CH (H) does not impose N>4.
4. **Actual comparison inputs.** Added rational Gysin/derived-limit/cycle-class and Chow-support compatibilities to EDC.6/SF.5, de Rham cycle-class compatibility to DD.2, and the continuous-representation Ext¹/H¹ request to R02.1. Removed compact-five-term as the purported Ext theorem. Made the negative-weight implication `D_cris^{φ=1}=0`, hence `H¹_e=H¹_f`, explicit before applying L1’s logarithm. Corrected the proof’s nonexistent requested R06.6 reference to R06.5 and its filtration input to the separate filtration theorem. The request explicitly distinguishes ramified conductor support fields and their D_cris/D_dR scalars from the selected unramified BDP presentation. Betti realization compatibility remains honestly open.
5. **Character coefficient and level/global classes.** χ_t is finite order with the same conductor as χ; only its ambiguity is a Hilbert class character. Definition (4.6) produces the class over K_c, while (4.7) is the separately weighted global corestriction. The literal full symmetric power is retained, and the false printed Sym/Ind identification is not used to supply its projector/inclusion. The integral CM adapter remains requested. Trivial-character identity tests are explicitly restricted to the already selected component.
6. **Descent ownership and noncircular control.** Removed ES.8’s bound from the prerequisites of its own control input. The control proof uses compact inflation–restriction and source local hypotheses instead. Removed clean Howard hypotheses from the KO local adapter and CH rank-one/rank-zero nodes; the latter already have a precise request for CH bounded-error descent. CH’s weaker (H) is not silently strengthened to LV’s big image.
7. **APIs and tests.** Added two naturality API items, CM eigenvector transport and equivariant signed averaging. The normalized η API now states uniqueness in its line. The eigenprojection API has the actual character-action law, rather than idempotence alone. The critical-twist API and Lean signature use the determinant relation, rather than only squaring arbitrary inverse characters. Added the explicit commutation input to the linear product-projector prototype. Strengthened the gHC test by the identity-projector fixture to exclude the identically zero construction. Clarified that the LV displayed exponent gives p² divisibility, not a universal failure of p⁴ divisibility; limited the class-number API to the bottom Hilbert class quotient. Defined ψ in the family Euler factors.
8. **Locators.** Replaced the irrelevant self-duality citation to Proposition 2.7 by BDP p.1070’s exact-annihilator pairing; corrected the model page 1067, reciprocal differential scaling to (1.4.2)/(1.4.6), KO through p.45, LV Corollary 4.3 to pp.12–13, LV Claim 2 to §4.4 p.18, Castella Theorem 4.3 to p.19 and the tower through p.21. Castella 4.4 and 5.4 are Propositions, not Definitions/Theorems respectively.

These corrections are mirrored in the suggested file’s mathematical statements/API/test descriptions where applicable. The reader is deliberately left untouched because it is not an authorized deliverable. Its opening marked-level convention, denominator paragraph, CM proof, character-twist construction, proof references and source-issue register need synchronization.

## Independently checked baseline

All declarations were opened at the full commits, not inferred from a name search. Each citing use has the same or weaker hypotheses. None is removed or substituted. The confirmation receipt is appended to each baseline entry.

| Pinned declaration | Source inspected | What it supplies, and its limit |
| --- | --- | --- |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | [Basic, line 94](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L94) | Proper geometrically integral group object over a field, dimension and smoothness; no CM classification |
| `AbelianVariety.End` | [End/Basic, line 83](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean#L83) | Additive endomorphism ring, composition convention and toHom |
| `AbelianVariety.mulBy` | [End/Basic, line 243](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean#L243) | Integer in End followed by toHom; not an independently constructed CM action |
| `LinearMap` | [LinearMap/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) | Bundled semilinear map; ordinary linear specialization gives the parameterized realizations |
| `LinearMap.range` | [Submodule/Range, line 57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Range.lean#L57) | Image submodule and existential membership, with scalar-surjectivity satisfied for ordinary linear maps |
| `Submodule.span` | [Span/Defs, line 46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean#L46) | Infimum of submodules containing a set, for eigenlines and generation |
| `AlgebraicGeometry.Smooth` | [Morphisms/Smooth, line 62](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean#L62) | Smooth morphism, composition and pullback instances; product stability is already present |
| `AlgebraicGeometry.IsProper` | [Morphisms/Proper, line 42](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean#L42) | Separated, universally closed, locally finite type; composition and base change |
| `AbelianVariety.IsIsogeny` | [Isogeny, line 61](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean#L61) | Finite and surjective underlying morphism, identity/composition/base change; no arbitrary numerical degree functions |

## Supplier closure, coverage and red-team obligations

Read all 36 original distinct foreign prerequisites, their exact node statements where referenced and stage contracts where stage-only, plus the newly requested R02.1 contract and its existing continuous-cochain/section/splitting statements (37 distinct foreign references after correction). No advertised stage is treated as an already proved theorem.

| Supplier family | Contract and review result |
| --- | --- |
| R14.3 / R19.1 / R19.6 / Hida L0 | Higher Scholl/projector/lattice and ordinary family tower extensions are requests; finite-level H¹/control alone is insufficient. Original low levels need fine-level descent. |
| HE.0–2 / CM.1 | Existing point reciprocity/neighbors/Frobenius are imported; graph/NS calculations belong to GH. Exceptional units, general descent, CM coefficients and p-level point towers have precise requests. |
| SF.2 / SF.5 / EDC.2–3 / EDC.6 / DD.2 | Product stability is baseline; ordinary Chow and rational/filtered realizations are requested. Finite-coefficient Gysin is separated from rational Gysin and continuous Ext. |
| R02.1–2 / R06.2 / R06.5 / L1 / RD.3–4 | Cochain descent, filtered Frobenius, good-model comparison, logarithm domain and analytic residues are distinct. Existing F-isocrystals and compact-five-term do not supply the missing comparison theorems. |
| PHR D.2 / PHR L3 | Higher-dimensional syntomic and relative/unramified×cyclotomic regulator extensions are requested from their owners. Accepted cyclotomic L3 is kept within its scope. |
| ES.3 / ES.5 / ES.8 / Selmer L2–4 | Generic KS carrier, Howard hypotheses and Λ patching are imported. LV local/twist/control checks and CH bounded-error descent remain distinct. The parity theorem is a source-qualified Part II request. |
| Automorphic L3h | One GL₂ square-root measure owner supplies fixed/family interpolation and Hsieh nonvanishing. GH proves cycle evaluation; it does not re-plan measures. |

The reviewed library audit lists GH.0–GH.8 as unbuilt. None of the new planned objects duplicates an audited built declaration: abelian varieties, morphism properties and linear-map infrastructure are baseline imports. No claim is made about upstream Tau Ceti roadmaps or their links.

| Covered stage | Target nodes / imported construction scope |
| --- | --- |
| GH.0 | CM/Hodge lines, signed symmetric factor, X/projector, concentration, filtration, duality, newform/lattice and good model |
| GH.1 | Marked isogeny, graph cycle, descent/triviality, étale/integral/p-adic AJ, character projection, residues/Coleman, syntomic and classical comparisons |
| GH.2 | Tame/p-power trace, conjugation, Frobenius, finite local condition and corrected ramified p-condition |
| GH.3 | Stabilization, bottom adapter, Iwasawa class, LV trace polynomials/intersection and actual universal norms |
| GH.4 | BDP squared value, scaling, CH ramified formula, regulator adapter, linear reciprocity and dual exponential |
| GH.5 | LV admissibility, Howard/local verification, bounded control, corrected derivative class and conditional Λ bound |
| GH.6 | Analytic/class nonvanishing, CH ranks/dimension/parity, LV universal-norm generation and conditional structure consequence |
| GH.7 | Critical twist, Howard class tower, family representation/measure, three local checkpoints, localization, reciprocity and initial/system specialization |

All targets have nodes at the chosen target level; gaps are listed in coverage.remaining. There is no need to downgrade these stages to partial simply because suppliers are unfinished. Five nodes’ suggested contracts still need repair, and are not accepted through the target-coverage count.

| Assigned confirmed finding | Packet and reader result |
| --- | --- |
| RT-AREA-iwasawa-1/10 | Generic Howard/Λ descent belongs to ES.5/8, not a second GH or HE.6 construction. Corrected the circular control dependency and overly strong clean-Howard prerequisites on CH consequences. Reader needs corresponding synchronization. |
| RT-AREA-iwasawa-1/11 | L3h owns the GL₂ BDP distribution; GH.4 owns BDP 5.13’s generalized-cycle value identity, and GZ.9 consumes m=0. Both packet and reader keep these roles. |
| RT-AREA-iwasawa-1/27 | PHR L3 Part II is the requested generic local owner; AC L2 keeps bounded fixed-weight applications. Yager’s infinite unramified tower and J are explicit in both packet and reader. |
| RT-AREA-iwasawa-3/1 | Both packet and reader separate the global W model from the local product with independently good A, and keep finite unramified F and canonical conductor/discriminant restrictions. The old integrated decomposition’s stronger global X claim is not used as proof and is outside this review’s edits. |

## Source issues

Every entry now has a reviewer verdict and reason. E1–E3 agree with the published author erratum. E4–E6 are version-qualified, with searches recorded; no inaccessible version is claimed collated.

| Issue | Independent verdict / effect |
| --- | --- |
| E1 | Confirmed: dimension slope is (1−ε)/2; corrected stated result. |
| E2 | Confirmed: Fontaine–Laffaille requires absolute unramifiedness; ramified use needs the KO integral lifting argument and its application hypotheses. |
| E3 | Confirmed: the p-ramified extension in Lemma 7.10 is abelian. |
| E4 | Confirmed against the 2022 copy: both ±1 are odd; the final proof-line parity residue must be (1−ε)/2. Statement unchanged; not a general collation of 2018. |
| E5 | Confirmed against LV v1: “(5) of Assumption 2.3” must refer to Definition 2.1(4), ordinarity. Correcting the reference does not solve the Tate-twist local gap. |
| E6 | Confirmed against LV v1 §4.4 Claim 2 p.18: eventual equality of generated augmentation ideals does not imply equality of their generators. The proof uses ideal equality. Locator corrected. |
| E7 | Added and confirmed against both acquired CH versions: Sym does not commute with induction. This affects the displayed coefficient identification. |

For E7 let h=[H_K:K] and m=2r−2. The displayed modules have rational dimensions `binomial(2h+m−1,m)` and `h(m+1)`. At h=2,m=2 these are **10 and 6**; at m=0 they are **1 and h**. Tate twists and scalar extension preserve rank. The coefficient module literally defined as the full symmetric power is retained; one must check its CM character projector and the original A-class inclusion separately. An induced symmetric-power module would need its own definition/adapter and cannot be silently substituted. The review does not claim that the downstream reciprocity theorem is disproved by this display; it removes an invalid justification and records the exact missing adapter. No correction to this display was located in the two author correction notices or the primary-source search.

## Object APIs and unit-test contracts

All 18 definitions/constructions have three named tests and corresponding examples. Presence and names do not establish that tests catch a plausible wrong definition. The following distinguishes valid linear/scalar prototypes from the unresolved tests; §13 explicitly permits omission of conditions whose owner types cannot yet be stated, and that permission is respected.

| Object | Result |
| --- | --- |
| CMCurve | **Unverifiable tests.** Opposite CM action normalization passes the detached i arithmetic; the normalization example does not invoke etaOfOmega. Test the actual CM action and normalized eigenvector, including the conjugate non-example. Naturality/uniqueness APIs added. |
| ε_A | **Unverifiable sign fixture.** Cardinality 8 and scalar −(−x)=x do not involve the signed projector on a nontrivial permutation. At m=3 the symmetric image has dimension 4, whereas unsigned geometric averaging gives the zero exterior cube; that is a discriminating fixture to implement. |
| X/ε_X | Valid composite-operator identity, weight-zero and dimension fixtures for this permitted factor-realization prototype; commuting idempotents are explicit inputs. Geometric W/X models remain supplier data. |
| newform/CM projector | Valid commuting composition and rational half-entry lattice counterexample. Trivial component identity now qualified; integral preservation is explicitly conditional. |
| IsogPair | **Unverifiable conductor/degree tests.** Identity example only checks its morphism; target conductor 1 is absent. Three arbitrary degree functions do not express the owner’s degree. Test actual marked target order, chosen cyclic level and the imported multiplicative degree API. |
| gHC | Projection/idempotence and base-change APIs are usable on supplied Chow data. The repaired identity-projector fixture detects gHC≡0, while projection fixes only the correct image. Geometric graph/codimension remains the specified source construction. |
| AJ_et | Linear Gysin-map adapter, cocycle sign/lift-change and Jacobian comparison are stated. Actual Ext/support/Kummer exports are requested, not certified by the linear prototype. |
| AJ_p | Quotient sign, split class and Fil⁰ independence fixtures fix the linear normalization. Negative-weight H¹_f=H¹_e application input is now explicit. |
| character class | Genuine action/eigen API repaired; orthogonal and identity-component fixtures catch wrong linear projection. Weighting/corestriction and the literal full coefficient module remain distinct contracts. |
| Coleman primitive | **Unverifiable tests.** F(ω)=0 passes the three native examples: zero input, arbitrary horizontal translation and an assumed zero pairing. Add a nonzero differential with a computed normalized primitive in the supplied analytic carrier and check its connection/Frobenius condition. |
| stabilized class | The r=1 subtraction and nonzero predecessor fixture fix the scalar. Bottom Euler operator/unit normalization is its separate source API/adapter, not inferred from the upper definition. |
| Iwasawa class | Bottom, unit-one and α=2 inverse-power fixtures discriminate the normalization; compatibility is explicitly conditional on the raw trace relation. Iwasawa carrier is imported. |
| trace polynomials | Initial/second recurrence and zero-sequence fixtures are valid; displayed remainder exponent test clarified. Actual group-ring δ/Φ estimates remain the source theorem’s contract. |
| universal norm class | **Unverifiable carrier.** Constructor must depend on the actual norm tower and geometric input/Φ constraint. The current function of z alone cannot satisfy the advertised formulas for unrelated cor maps. Test a nonzero compatible tower, bottom Φ and simultaneous tame maps; zero input alone is insufficient. |
| LV admissible triple | Arithmetic exclusion/class-number/unit examples are valid tests of the available part of the predicate. Full coefficient unramifiedness, split p and determinant image use absent owner types; this omission is allowed and expressly not treated as proof. |
| corrected Kolyvagin class | Empty/minus/nonunit fixtures discriminate the inverse-unit scalar adapter, and the generator API tracks reciprocal factors. Actual derivative descent and finite–singular coefficient tensor are imported source-specific contracts. |
| critical twist | The monoid-hom inverse character is a genuine available character prototype. Inverse/trivial/order tests are valid; determinant API now uses the actual determinant relation. |
| Howard tower | t=1, t=2 and U_p=1 fix the U_p^{1−t} normalization. Actual point/Kummer/ordinary tower is a precise requested supplier; strict Greenberg membership retains its source hypotheses. |

The unresolved five tests/interfaces require owner-compatible carriers and fixtures, not Prop-valued fields containing an unproved “condition”. Do not repair them by assuming the desired conclusion or renaming a generic arithmetic identity as a geometric test. Planet names were checked against the central objects/results; none advertises a derivative Gross–Zagier identity in place of BDP’s special value or a conjectural main-conjecture equality.

## Per-node record

The same records are stored in review.checked in the packet. “Verified” means a faithful target-level specification with identified supplier/gap obligations; it does not mean the theorem has been implemented or that an unread requested proof was checked.

| Node (within GeneralizedHeegnerCycles) | Verdict | Check and action |
| --- | --- | --- |
| `GH.0/cm-elliptic-curve-and-its-hodge-splitting` | unverifiable | BDP §1.4 gives the normalized CM action and both Hodge lines. Added eigenvector naturality and scalar-normalization uniqueness. The i-action example contains no curve or CM action, and the normalization example does not use etaOfOmega; opposite CM normalization cannot be detected. Revise the geometric tests. |
| `GH.0/cm-projector-and-symmetric-power` | unverifiable | BDP (1.4.4) and Lemma 1.8 require the signed permutation projector. Added equivariant-map naturality. The unsigned permutation average passes the displayed cardinality, unique-group and scalar double-minus examples; a genuine tensor/permutation fixture is still required. |
| `GH.0/cm-character-decomposition` | corrected | Corrected the proof: distinct joint algebraic characters do not mean distinct values at every noninteger α. At K=Q(i), α=i and r=2, the extreme eigenvalues coincide. Added the normalized CM eigenbasis prerequisite; the symmetric-power monomial basis proves independence. |
| `GH.0/generalized-kuga-sato-variety-and-its-projector` | corrected | BDP §2.1–2.2 and the R14.3 request supply the two factor correspondences, with clearing denominator N^m2^{2m}(m!)². The commutation prototype now explicitly assumes commutation of its linear inputs; the geometric fact remains a factor-action theorem. No global model of X is claimed. |
| `GH.0/cohomology-of-the-generalized-kuga-sato-variety` | verified | BDP Proposition 2.4 and Lemma 1.8 give concentration in degree 2m+1 and the parabolic tensor factor. Rational étale and filtered de Rham Künneth are precise EDC.6/DD.2 requests; the modular higher-fiber-power export remains a gap. |
| `GH.0/projected-hodge-filtration` | verified | BDP Proposition 2.5 gives the full CM symmetric factor in Fil^{m+1}, rather than only its holomorphic line. The separate filtration theorem is the correct input to the AJ quotient. |
| `GH.0/self-duality-of-the-projected-cohomology` | corrected | Replaced the irrelevant Proposition 2.7 citation by BDP §3.4 projected Poincaré duality and exact annihilators. Added the self-transpose projector prerequisite. EDC.2 rational duality matches the Tate target Q_p(1) after twisting. |
| `GH.0/newform-cm-projector` | corrected | Clarified that identity for the trivial CM character is on its selected component. Higher-weight modular/lattice data are requested from R14.3. Added auxiliary fine-level descent for source levels N≤4; N>4 is a model condition, not CH (H). |
| `GH.0/cm-product-good-model` | corrected | Corrected the local source page to 1067. Separate good models of W and A, finite unramified F and p∤cNd_K in the canonical application are retained. The native scheme-property baseline is used, rather than re-planned. |
| `GH.1/isogenies-of-conductor-c-prime-to-n` | unverifiable | Corrected ker φ∩A[𝔑]=0, the marked ideal notation and the invertible-ideal semigroup prime to 𝔑∩O_c. The native identity test checks a morphism, not conductor 1; the degree test takes three unrelated degree functions. Neither verifies the promised conductor/degree contract. |
| `GH.1/generalized-heegner-cycle` | corrected | Corrected the clearing denominator to N^m2^{2m}(m!)², the dimension indices and SF.5 ownership. Strengthened the projected test with gHC(id,g)=g, which detects the identically zero construction as well as an unprojected graph. The geometric graph and Chow carrier remain supplied. |
| `GH.1/field-of-definition-of-generalized-heegner-cycles` | corrected | BDP Remark 2.6 gives H̃·H_c. Added the general CM.1 descent request beyond HE.1’s restricted unit fields, and corrected the marked-ideal notation. No descent from invariance alone is used. |
| `GH.1/homological-triviality-of-generalized-heegner-cycles` | corrected | Corrected m/r indices and added rational étale/de Rham cycle-class compatibility prerequisites. The zero projected cohomology proves triviality; the Betti realization compatibility is explicitly a gap rather than a consequence of torsion purity. |
| `GH.1/etale-abel-jacobi-map` | corrected | EDC.3 only supplies finite Gysin, and R02.2 compact five-term is not continuous Ext¹=H¹. Added the EDC.6 rational/support adapter and precise R02.1 request, retaining Chow rational-equivalence and the m=0 Jacobian comparison. These are honest open exports. |
| `GH.1/extensions-of-filtered-frobenius-modules` | verified | BDP Proposition 3.5 uses the F-linear iterate of crystalline Frobenius, negative weight and holomorphic-minus-Frobenius lift. The R06.2 request is the required filtered-extension theorem; the quotient prototype only models lift independence. |
| `GH.1/p-adic-abel-jacobi-map` | corrected | Corrected the R06.6 proof reference to the actual R06.5 request and consistent m indices. Made D_cris^{φ=1}=0 and H¹_f=H¹_e explicit for the imported L1 logarithm; the quotient uses the separate projected filtration theorem. |
| `GH.1/integral-abel-jacobi-comparison` | verified | CH (4.2) uses an integral f lattice and the full symmetric-power Tate twist. The existing denominator and coefficient-invariant gaps are real: R02.2 supplies a descent sequence, not automatic descent. The rationalization prototype does not prove this missing geometry. |
| `GH.1/character-projected-heegner-class` | corrected | Corrected χ_t to finite order of the same conductor, unique only up to a Hilbert class character, and separated finite-level (4.6) from global (4.7). Kept literal full Sym(T_p(Res A)); recorded false printed Sym/Ind identity as E7. Strengthened the eigen API to the character-action law. Integral inclusion/projector remains a precise CM.1 gap. |
| `GH.1/parabolic-residue-pairing` | verified | BDP Propositions 3.9–3.10 use vanishing annular/cusp residues and the Cech cup-product formula. RD.4 is a precise wide-open comparison request; RD.3’s F-isocrystal alone is not asserted to prove residues. |
| `GH.1/coleman-primitive` | unverifiable | The source specifies an admissible Frobenius-normalized Coleman primitive (weight zero modulo constants). The native zero construction passes all three named examples: only the zero example references colemanPrimitive. A nonzero differential/primitive fixture and actual admissibility data are missing. |
| `GH.1/coleman-abel-jacobi-formula` | verified | BDP Propositions 3.18, 3.21 and Lemma 3.22 supply graph-cycle evaluation and the degree^j factor. The ordinary marked-isogeny and normalized differential assumptions are preserved; the residue/Coleman inputs are explicit preceding targets. |
| `GH.1/coleman-depletion-calculation` | verified | BDP Proposition 3.24 gives j!θ^{−1−j}f♭ via the component recurrence. Depletion and negative θ powers are supplied by the modular/measure owner request, not a private GH measure. |
| `GH.1/syntomic-abel-jacobi-comparison` | verified | The packet accurately records the higher-dimensional syntomic comparison as a D.2 request/gap. The existing Spec O_F Tate and K₂ curve statements are insufficient; no proof is claimed from them. |
| `GH.1/classical-generalized-cycle-comparison` | verified | Castella’s use of BDP2017 Proposition 4.1.2 and its half-unit normalization is read. The primary BDP2017 comparison is explicitly unread and recorded as a gap; the 2013 paper is not substituted for it. |
| `GH.2/cycle-norm-relations` | verified | CH Proposition 4.4 has n>1 for split p and the inert-prime recurrence. The first step and unit indices are separately assigned to the adapter, and the cycle proof needs graph/NS compatibility beyond the imported CM point trace. |
| `GH.2/cycle-conjugation` | verified | CH Lemma 4.6 changes χ to χ^{-1}, with w_f and the Artin class. The canonical CM real descent is a CM.1 input; there is no unjustified same-character conjugation identity. |
| `GH.2/cycle-frobenius-congruence` | verified | CH Lemma 4.7 is an equality after local restriction, not a global congruence modulo ℓ. The graph reduction and character triviality at the inert place are matched to HE.2 and the comparison request. |
| `GH.2/finite-local-abel-jacobi-class` | verified | CH Lemma 7.5/Proposition 7.6 are checked with the erratum: absolute unramifiedness over Q_p is required for Fontaine–Laffaille. Ramified conductor derivatives are handled in the next node, not by extending that lemma. |
| `GH.2/local-condition-at-p-and-the-castella-hsieh-corrections` | corrected | Corrected KO locator through p.45 and removed the unrelated clean Howard prerequisite. The integral Ω lifting/orthogonality route uses KO Condition 2.3 and the PHR L3 request; matching its regulator-image lattice to CH remains explicitly open. |
| `GH.3/ordinary-stabilized-class` | verified | CH Definition 5.2 fixes the upper subtraction and the separate bottom Euler operators, with r≥1 and ordinary unit root. The scalar tests detect the weight-two normalization; the first conductor trace remains a named adapter rather than a hidden assumption. |
| `GH.3/stabilized-first-step-adapter` | verified | CH Lemma 5.3’s first-step obligation is not supplied by the revised Proposition 4.4 n>1 proof. The gap names the missing neighbor/unit calculation and full-unit versus half-unit scaling. |
| `GH.3/iwasawa-heegner-class` | verified | CH (5.8) and the imported Iwasawa carrier give α^{-n} normalization after the first-step adapter. The α=2 test distinguishes inverse powers from positive powers. Finite Δ, Γ and Shapiro conventions remain separate. |
| `GH.3/longo-vigni-trace-polynomials` | corrected | LV Lemmas 4.1–4.2 specify the actual initial terms and δ. Corrected the error-power test: the displayed exponent 2 does not forbid additional p⁴ divisibility in a particular remainder. The recursive prototype tests the recurrence, not the geometric δ. |
| `GH.3/trace-polynomial-intersection` | corrected | LV Corollary 4.3 is equality of images/submodules. Corrected the locator to pp.12–13. Augmented ideals, not literally stabilized scalars, are used downstream (E6). |
| `GH.3/universal-norm-heegner-class` | unverifiable | LV Proposition 4.5 concerns a specified tower H_m[n], Φz_n and simultaneous tame compatibility. universalNormClass(z) has no norm tower input, while its APIs quantify over unrelated cor maps. A coherent nonzero-bottom construction cannot satisfy those APIs for both identity and zero cor maps. Revise the carrier and tests. |
| `GH.4/bdp-special-value-formula` | verified | BDP Assumption 5.12/Theorem 5.13 give a squared special value with the factorial, Euler factors and differential normalization. The GL₂ square-root distribution is imported from L3h; GH owns this geometric value identity. |
| `GH.4/cm-differential-scaling` | corrected | Corrected scaling locator to (1.4.2) and (1.4.6), not (1.4.3). Reciprocal normalization gives signed exponent 2j−m and its doubled square exponent, consistent with the period factor. |
| `GH.4/ramified-character-abel-jacobi-formula` | verified | CH Theorem 4.9 is in the critical interval with ramified conductor n≥1. The packet explicitly retains the n=1 versus n>1 cancellation gap and does not replace the unramified BDP Euler formula. |
| `GH.4/fixed-weight-regulator-adapter` | verified | The source’s relative Lubin–Tate regulator and ordinary coefficient functional are matched through a named PHR Part II request. The accepted cyclotomic L3 theorem is not treated as this relative map. |
| `GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` | verified | CH Theorem 5.7 is linear with −c₀^{r−1}, σ_{−1,p} and its specified t power. Interpolation uses the exact source character range and measure normalization; it is not inferred from a squared identity alone. |
| `GH.4/dual-exponential-special-value` | verified | CH Corollary 5.8 is the dual-exponential range, with its factorial/Euler factors and ordinary hypothesis. It is linked to the regulator request and is not the critical-interval logarithm formula. |
| `GH.5/longo-vigni-admissible-triple` | corrected | LV Definition 2.1 includes the exceptional set, determinant-restricted big image, p∤h_K, unramified coefficient field, split p and unit a_p. Corrected the API to the bottom Hilbert class quotient, not every auxiliary ring class quotient. Missing owner field types in the prototype are permitted by §13. |
| `GH.5/higher-weight-howard-hypotheses` | verified | The exact ES.5 H0–H5 statement is read, together with LV §5.1, Lemma 2.4 and Proposition 3.3. Pairing, local Cartesian propagation and solvable-tower invariants are verification obligations, not consequences of irreducibility alone. |
| `GH.5/longo-vigni-local-assumptions` | verified | LV Assumption 3.2 includes trivial inertia on F⁻T and both local H⁰ finiteness clauses. The packet retains the self-dual Tate-twist conflict as a gap; an untwisted unramified quotient is not used to discharge it. |
| `GH.5/specialization-control` | corrected | Removed ES.8’s final Λ bound from the prerequisites of the control input used to prove that bound. Added compact inflation–restriction instead. LV Proposition 3.4 retains the finite exceptional set and bounded finite kernel/cokernel. |
| `GH.5/higher-weight-kolyvagin-class` | verified | LV §4.3 derivative descent, coefficient ideals and units are supplied to the imported ES.3 Kolyvagin-system carrier. The inverse-unit scalar adapter and generator-change tests are valid; local membership and residual descent remain explicit source-specific obligations. |
| `GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound` | verified | LV Theorem 3.5 is a conditional application of ES.5/ES.8 after all patching hypotheses. The paired torsion pseudo-isomorphism and ideal containment direction are correct; no main-conjecture equality is asserted. |
| `GH.6/anticyclotomic-nonvanishing` | verified | CH Theorem 3.9 uses the extra coprimality and auxiliary residual nonvanishing input. The unread Hsieh theorem is requested from L3h and is an explicit gap; nonzero cycles are not inferred merely from complex analytic rank one. |
| `GH.6/selmer-rank-one` | corrected | Removed the stronger clean Howard-hypotheses prerequisite and directed the proof to the distinct requested CH bounded-error descent. Theorem 6.1(1) is the nonordinary nonzero-class implication under CH (H), with local conditions checked via 7.7. |
| `GH.6/selmer-rank-zero` | corrected | Removed the stronger clean Howard-hypotheses prerequisite and specified CH bounded-error descent. The ordinary outside-critical-range Theorem 6.2 uses dual exponential and the repaired Proposition 7.8 local input. |
| `GH.6/selmer-consequences-with-the-corrected-dimension-formula` | verified | CH corrected Theorem 6.3 and erratum give slope (1−ε)/2 and a constant e. Both signs and finite-character decomposition are consistent; E1 is independently confirmed. |
| `GH.6/selmer-parity` | verified | CH Theorem 6.4 requires the separately requested corrected Nekovář parity theorem. The final proof-line residue is (1−ε)/2 (E4), not ±1 modulo 2. The unread parity supplier is honestly a gap. |
| `GH.6/universal-norm-module-rank-one` | verified | LV Theorem 4.12 uses universal norms, the Φ intersection, nonvanishing and Nakayama to identify the full module, not just a nonzero class. The existing universal-norm identification gap is essential; E6 is confirmed at its corrected location. |
| `GH.6/lambda-structure-consequence` | verified | LV Theorem 1.1 is a conditional consumer of the generic Λ bound and H∞=Λκ̃₁. Local/control and normalization gaps remain visible; the characteristic-ideal equality is identified as a conjecture. |
| `GH.7/critical-character-twist` | corrected | The critical Θ and CM ξ twists follow Castella §2.6/§4.1. Corrected the self-dual API and Lean signature to use δ=Θ²ε_cyc and compute the twisted determinant ε_cycξ^{-2}; squaring arbitrary inverses was insufficient. |
| `GH.7/howard-family-tower` | corrected | Corrected the locator: Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8 through p.21. HE.1 supplies the requested point tower, R19.6 its representation and GH the U_p^{1−t} class adapter; the three scalar tests fix that normalization. |
| `GH.7/family-representation-specialization` | corrected | Corrected Theorem 4.3 page to 19. Rank-two freeness, geometric Frobenius inverse and the ordinary quotient are requested from the family representation owner, not proved by weight-two H¹ reconstruction alone. |
| `GH.7/family-measure-specialization` | corrected | Defined ψ=ξνφ in the displayed Euler factors. Castella Theorem 2.11 and Remark 2.12 distinguish square-root measure, squared interpolation and the central-value norm shift; this is a consumer checkpoint for L3h. |
| `GH.7/ochiai-exponential-checkpoint` | verified | Castella Theorem 3.4 has the ideal J source and pseudo-null cokernel. The requested PHR extension retains this integral domain and both exponential conductor ranges. |
| `GH.7/yager-unramified-checkpoint` | verified | Castella Proposition 3.5/Corollary 3.6 provide the infinite unramified Yager trace module and y^u=[u]y covariance. A finite unramified scalar extension of the cyclotomic map is explicitly ruled out as a substitute. |
| `GH.7/two-variable-regulator-checkpoint` | verified | Castella Theorem 3.7/Corollary 3.9 require λ_reg^{-1}J, nonexceptional arithmetic interpolation and the two local ranges. These are exact PHR owner requests, not an unrestricted coefficient-ring map. |
| `GH.7/family-regulator-localization` | verified | Castella Lemma 5.1/Proposition 5.2 pair with the canonical family differential. Injectivity after anticyclotomic descent uses the H²/H⁰ correction, not just tensoring an injective map. |
| `GH.7/two-variable-explicit-reciprocity` | corrected | Corrected Theorem 5.4 to Proposition 5.4. Castella Theorem 5.3 has σ_{−1,p} and no CH −c₀^{r−1} prefactor; density, source-qualified plus restriction and normalization are separate inputs. |
| `GH.7/ordinary-localization-injective` | verified | Castella Lemma 6.4 is the additional global-to-local injectivity input, using infinitely many nonzero specializations and torsion freeness. Matching local regulator values alone would not give the global conclusion. |
| `GH.7/initial-family-specialization` | verified | Castella Theorem 6.5 keeps weight >2, congruence and residual/bad-prime hypotheses, the squared initial Euler factor and half-unit normalization. The BDP2017 adapter is still a source gap; exceptional p-new weight two is excluded. |
| `GH.7/higher-weight-family-specialization` | verified | Castella (6.7)/Theorem 6.5 compares the actual global systems with c₀^{r−1}, character twists, conductor moments and localization injectivity. It does not identify unnormalized CH/Castella towers or include exceptional regulator primes. |

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`: **0 errors, 0 warnings** after all edits.
- All 66 proposed declaration names, 63 API names and 54 test names align with the suggested file, which has all 54 corresponding `example`s. The 66 review records cover exactly the 66 unique node IDs. The direct own-node prerequisite graph has no cycle.
- `git diff --check` passes. Only the three issue deliverables and this job’s handoff are changed; no private paths or Lean code outside the authorized suggested file are submitted.
- `lean-check research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean` was attempted before and after the changes with more than 100 GB available. Both attempts stopped at the imported module `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`: its object file is absent from the shared pinned-Mathlib build. The body was **not checked**. No build/update/cache/project/server was started, and no process remains running. Available alternate object files use different Mathlib pins and were not used.

The next revision should repair the five named interface/test contracts, synchronize the separately authorized reader with all corrected mathematics/requests/source issues, and check the full suggested body when the pinned shared import is available. Existing precise proof-closure requests/gaps may remain; a blueprint review must not require completed formal implementations. The E7 correction needs a literal full-Sym character adapter, or an explicitly defined alternative coefficient carrier with a proved comparison, never the false rank identity.

Questions for the orchestrator: ensure the revision includes the reader deliverable, and arrange the missing shared pinned import before requesting an elaboration receipt. The complete review and its remaining work are also recorded in the [handoff](../handoff/REV-GeneralizedHeegnerCycles--GH.0.md). Nothing is promoted or merged by this worker.
