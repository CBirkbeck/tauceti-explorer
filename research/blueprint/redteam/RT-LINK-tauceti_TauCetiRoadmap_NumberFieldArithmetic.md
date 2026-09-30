# Red team: Number Field Arithmetic link map

Codex — `codex-J6LwjP`, 2026-09-30. Complete. Two medium-severity missing-route findings; no additional defect established in the 61 recorded links or ten overlap decisions.

Target: `LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`, at explorer revision `1e05797cdde7eddde576b7cf74a8d705644a978f`. I neither wrote nor reviewed the target. The packet credits the original ChatGPT checkpoint and Claude completion; its independent reviewer is `codex-a71f92`. I read the packet, original handoff, entire independent-review report, entire 2,557-line NumberFieldArithmetic README, all eight coverage entries, all 54 distinct external endpoint descriptions, and the document passages used as evidence. “NFA n” below means NumberFieldArithmetic Layer n.

This is an audit of routing and interface scope. It is not a fresh proof audit of Neukirch, Serre, the downstream analytic arguments, or every library declaration mentioned in those roadmaps. Existing source caveats and unresolved assembly obligations remain unresolved.

## Findings

**1 — medium, missing: NFA 1 → ArithmeticGaloisDuality R02.3.**

The packet's `examined` entry dismisses this owner because its unramified local subgroups are local-Galois objects and no stage names an NFA output. That misses the finite global arithmetic needed to construct the restricted-ramification extension itself. The same packet correctly records this distinction for IntegralIwasawaTheory L1, where finite compositum closure is supplied without claiming to supply the inverse limit.

Evidence on both sides:

- [NFA §1.5](../../../content/tau-ceti/NumberFieldArithmetic/README.md): “`p` unramified in `L₁` and in `L₂` implies `p` unramified in `L₁L₂`.”
- [ArithmeticGaloisDuality R02.3](../../../content/campaign/ArithmeticGaloisDuality/README.md#r02-3), line 48: “Define G_{F,S}, including the archimedean and p-adic places demanded by the theorem.” Its object is the maximal extension unramified away from S, not just an unramified local cohomology subgroup.
- The construction takes finite extensions unramified at every finite place outside S. Their compositum must remain in that family. Conjugation invariance plus the finite-compositum law also lets the construction use normal finite subextensions. These are the finite arithmetic inputs; Krull topology, the quotient of the absolute Galois group and continuous cohomology are separate work.

The partial, unreviewed `ArithmeticGaloisDuality.json` request for NFA 1 and node `R02.3/restricted-ramification-group` corroborate this reading, but are not treated as accepted mathematics or as the sole evidence. The authoritative stage already requires the object. Neither a direct edge nor an indirect path from NFA 1 to R02.3 exists in the assembled atlas; the reverse path is also absent.

Fix: add an **inferred** link from `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary` to `ArithmeticGaloisDuality:R02.3`, quoting the two passages above, and correct its `examined` entry. Limit the reason to finite unramified-compositum closure. Retain all infinite-extension, topology and cohomology constructions with the consumer. This does not move G_{F,S} into NFA.

**2 — medium, missing: route NFA 4 and 6 into the accepted Faltings Hermite–Minkowski import.**

The `examined` entry says R28.1 does not state an NFA use, and discounts the Lawrence–Venkatesh attribution of restricted-ramification Hermite–Minkowski to it. There is stronger evidence than that attribution: the independently accepted, integrated decomposition already identifies the import, its downstream use and its missing discriminant bound.

Evidence:

- [The accepted Faltings decomposition](../../../data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json), node `R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S` (line 308), explicitly permits wild ramification in S. Its proof route says: “bound the discriminant d_{K'/Q} in terms of [K' : Q] and S using the different and the ramification filtration, then apply the Hermite-Minkowski finiteness theorem for number fields of bounded discriminant.” The packet's gap at line 1744 explicitly asks for the missing different bound. The decomposition is partial overall, but its review is accepted and this node is individually verified; this is not an unreviewed research-packet inference.
- The same decomposition links this node into the descent step of `R28.1/finiteness-of-principally-polarized-semiabelian-models-of-bounded-height`. The [authoritative R28.1 stage](../../../content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md#r28-1), line 28, says: “Prove the descent and level-structure arguments needed to convert moduli points into isomorphism classes.”
- NFA §4.2 supplies the relative discriminant tower equation; §5.10 supplies residue-degree-weighted assembly of local different multiplicities; §6.4 supplies the global wild bound `e ≤ v_P(𝔡) ≤ e − 1 + v_P(e)` with the separate completion/multiplicity bridge. These are precisely the arithmetic inputs to the declared route, not the completed finiteness theorem.
- At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, [NumberField.finite_of_discr_bdd](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L496) takes `|discr K| ≤ N` for intermediate number fields of a fixed characteristic-zero field. Reading the statement confirms the required bound is an input. It is not itself a theorem with hypotheses “fixed degree and unramified outside S.”

Neither NFA 4 nor NFA 6 has a path to R28.1 or to this integrated child node. No other link packet supplies these routes. The issue is the omitted route to existing arithmetic outputs, not the already-recorded fact that the full imported theorem still needs work.

Fix: add **inferred** NFA 4 → `FaltingsFinitenessAndIsogenyTheorems:R28.1` and NFA 6 → that stage, and update `examined`. Quote the tower equation / wild-bound statement at the supplier and the descent clause at the parent consumer; identify the accepted child node and its gap in the reasons. Scope the first edge to relative/absolute discriminant assembly, reusing the landed tower theorem, and the second to the global different bound, including wild primes. Keep the degree-and-S bound, application of bounded-discriminant finiteness, and counting inside a fixed algebraic closure as explicit consumer/import obligations. If the completed restricted-ramification theorem is later assigned a general owner, factor this route through that owner. Do not claim NFA already proves it, replace the bound by the tame equality, or close the existing decomposition gap merely by adding edges.

## Checks of the existing map

All 156 quotations match literally in the current physical README sources, or, for the five Lawrence–Venkatesh citations, in its research roadmap stage descriptions. All 61 source/target pairs are distinct. There are 18 explicit and 43 inferred links. The endpoint descriptions were read in full, including the long local-field and quadratic-form stages.

| Links, in current packet order | Interface attacked and result |
| --- | --- |
| 1–2 | EffectiveBounds supplies a basis inequality and class-number bound. Link 1 explicitly imports the already-landed exact primitive-element index formula; link 2 makes no class-number computation claim. |
| 3–7 | LFR 0/2/3 supply intrinsic local extensions, natural-cast valuation, unramified Frobenius, integral monogenicity and the local filtration/different theorems. Canonical completion structures and global transport remain NFA's. Hilbert's sum needs Galois; the wild upper bound needs a nonzero ramification-index cast. |
| 8–9 | Artin factors use inertia invariants at ramification; residual recognition uses finite quotients. Neither link invents a canonical absolute-Galois Frobenius. |
| 10–16 | CA.5, CM.3 and CN.2 import correctly scoped factorization, discriminant, Frobenius and certificate interfaces. Rank-one unit certification is not an arbitrary-rank algorithm; the polynomial certificate additionally needs prime field degree. CM reciprocity remains a separate input. |
| 17–18 | HE.0 uses place-dependent conjugation, not a generally inapplicable CM involution of a ring class field. Iwasawa L1 uses finite unramified composita, not a supplied infinite pro-p extension. |
| 19–20, 57–59 | LV.1's Hodge average is not deduced from the unweighted degree sum. LV.6 uses its cyclic Kummer/inert-place hypotheses. LV.7's Frobenius orbit/degree comparison is unramified. LV.11 distinguishes arithmetic cyclotomic Frobenius from the inverse in the Weil pairing. |
| 21–22 | V5 retains the CM theorem and passage to reciprocity. R25.1 receives localization and the residue-degree weights, not sharp finite-flat-group discriminant bounds. |
| 23–36 | Chebotarev receives splitting, Artin classes, powers, and finite exceptional sets. Normal top-field restriction is unpowered; raising the base uses the prime-relative residue-degree power. Fixed points in cycle types, ramified exclusions, and the distinction between prime sums and prime-power sums are retained. |
| 37–43 | CFT receives the ideal Artin map, relative discriminant and completion dictionary. Ideals-away do not depend on reciprocity. The local norm predicate uses all factors of the local étale algebra. The global invariant, restricted-product assembly, conductor and norm-index theorems remain CFT's. |
| 44, 60–61 | Elliptic Selmer, K-theory and Selmer–Iwasawa receive finite completion/decomposition data. Separable closures, transfer naturality, cohomological restriction, semilocal sums and local conditions are not supplied for free. |
| 45–50 | GNF receives ideals-away carriers, arithmetic cyclotomic normalization and finite completion/norm inputs. Its topological adelic equivalence is stronger than NFA's algebraic semilocal equivalence and stays with GNF. |
| 51–55 | GQF correctly distinguishes a single-field completion instance from the extension map used for tower base change. Dyadic square openness remains the local quadratic supplier's theorem. |
| 56 | Polynomial Galois groups consume the monic, polynomial-discriminant, arbitrary-reducible-polynomial theorem with fixed points restored. The edge does not introduce a reverse dependency on group recognition. |

All ten overlaps were checked separately:

| Overlap | Disposition |
| --- | --- |
| 1: NFA 4 / Chebotarev 2 | Correct reuse of landed `ramifiedSupport`, with a carrier comparison and separate Artin-fibre complement theorem. |
| 2: NFA 7 / PolynomialGaloisGroups 0 | Keep field/normal-closure and polynomial/root-action interfaces separate; generic support belongs below both. |
| 3: NFA 3 / GNF 11 | Primitive power orders are not arbitrary nonmaximal orders. The exact index equation is landed; Picard carriers remain GNF's. |
| 4: NFA 2 / Chebotarev 4 | Reuse the landed general-base root action; retain character weights and conductor assembly. |
| 5: NFA 3 / AlgebraicCurves 6 | Generic Kummer–Dedekind has an integral-generator and conductor-avoidance boundary. The unconditional lower bound on residue degrees is not the factorization equivalence. |
| 6: NFA 1 / AlgebraicCurves 8 | Generic decomposition/inertia bookkeeping must retain inseparable residue degrees. Constant-field conclusions and Abhyankar's lemma are not NFA exports. |
| 7: NFA 4 / AlgebraicCurves 7 | The pinned localization declarations are reusable. Localization alone does not establish completion compatibility. |
| 8: NFA 1/4 / FA.3 | Generic Dedekind discriminant/splitting applies; the number-field-typed `ramifiedSupport` does not. |
| 9: NFA 2 / Multiquadratic 1 | Reuse square-root Frobenius. A full `(F₂)^n` Galois identification requires independent square classes. |
| 10: NFA 4 / LFR 3 | Generic `relDiscr` lives below both. Do not introduce a reverse dependency cycle. The local discriminant exponent is `f*d`, not `d`. |

The earlier source notes are already explicit in `provenance.sourceIssuesNoted`: NFA 5.6's unqualified local-Frobenius sentence needs unramifiedness, and deleting finitely many Euler factors changes a zeta residue although the logarithmic-derivative pole coefficient stays one. The accepted link reasons preserve the relevant restrictions. They are not reported again as new findings in this map.

## Pinned statement reads

Fresh reads used Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and the Mathlib pin above. The reviewed eight-layer audit was a guide, not a substitute for reading the following declarations and their surrounding hypotheses. No whole-library absence conclusion is made.

| Pinned source | Statements and boundary checked |
| --- | --- |
| [EffectiveBounds/Discriminant/Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean#L61) | Integral-basis discriminant inequality. |
| [NumberField/Index/Discriminant](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Index/Discriminant.lean#L56) | Exact index-squared equation on `IntegralPrimitiveElement`. |
| [NumberField/ArtinSymbol](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/ArtinSymbol.lean#L57) | Class at a maximal base ideal, unramified above it; normal-tower restriction at line 113. |
| [NumberField/Ideal/ArtinMap](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean#L175) | `artinHomAway`, prime value, excluded-set inclusion and normal restriction; commutativity and unramified-away hypotheses are explicit. |
| [NumberField/Cyclotomic/Frobenius](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean#L96) | Root action and `autToPow_eq_absNorm`; base-prime absolute norm and avoidance of the root order. |
| [DedekindDomain/Discriminant/Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean#L35) | Generic definition with Dedekind, finite-module and torsion-free hypotheses. |
| [DedekindDomain/Discriminant/Separable](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/Discriminant/Separable.lean#L40) | Nonvanishing and tower formula; fraction-field separability of the top extension. |
| [NumberField/Discriminant/RamifiedSupport](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Discriminant/RamifiedSupport.lean#L54) | Number-field-typed support and both membership characterizations. |
| [DedekindDomain/KummerDedekind](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/KummerDedekind.lean#L87) | Prime/factor equivalence, span, residue degree and multiplicity; nonzero maximal prime and conductor-avoidance hypotheses. |
| [DedekindDomain/Different/Localization](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/Different/Localization.lean#L110) | Trace-dual span, extended dual and mapped different at lines 110, 176, 247, including localization, fraction-field and integral-closure assumptions. |
| [DedekindDomain/AdicValuation/ValuativeRel](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean#L95) | Residue equivalence, cardinality and canonical completion local-field instance; the last requires finite residue field. |
| [Frobenius/DecompositionGroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Frobenius/DecompositionGroup.lean#L157) | Residue Frobenius equality; order and cyclic stabilizer require unramifiedness. |
| [Frobenius/Restriction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Frobenius/Restriction.lean#L47) | Unpowered restriction to a normal intermediate extension. |
| [RamificationInertia/DoubleCoset/Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/RamificationInertia/DoubleCoset/Basic.lean#L135) | Number-field prime/double-coset equivalence and value formula. This declaration is not a generic function-field adapter. |

## Omission search and graph verification

The current catalogue has 221 roadmap records and 2,028 base/research stages. Eight additions lie outside the original `examined` list: AnalyticHabiroStack, AnalyticStacks, QWittVectors, RiemannianGeometry, RingStacksAndTransmutation, SeveralComplexVariablesKahlerGeometry, SolidAnalyticRings and SymplecticContactGeometry. Their summaries and stage titles were screened alongside keyword searches of all stage descriptions and owner documents.

Reproducible search families, case-insensitive, included:

- splitting: `Number.?Field.?Arithmetic`, `double.?coset`, `splits? completely`, unramified/compositum/closure and prime-in-subfield;
- Frobenius: `artinSymbol`, `artinHomAway`, `idealsAway`, `integralIdealsAway`, `complexConjugationAt`, cyclotomic/Frobenius, inertia and residue-degree combinations;
- index: Dedekind–Kummer in either order, Dedekind's criterion/theorem, common index, `IntegralPrimitiveElement`, power-basis index and the full-cycle/factorization theorem names;
- discriminant: `relDiscr`, `ramifiedSupport`, relative discriminant, different/localization, tower and index;
- completions: `completionAlgHom`, `semilocalEquiv`, `decompositionHom`, `integralSemilocalEquiv`, canonical/number-field completion, weighted local degrees and global-local norm/trace;
- ramification: global ramification/different, different exponents, `ramificationGroup Q`, the natural-cast bridge and permutation-action discriminants;
- units: `unitCandidates`, `UnitCandidateEliminationCertificate`, `NormalClosureData`, `IsMonogenic`, monogenicity, rank-one units and fundamental-unit certificates;
- labels: `LMFDB`, intrinsic label, canonical defining polynomial, arithmetic equivalence and Gassmann.

This yielded 86 stage hits in 46 owners and 52 owner-document hits, with overlaps between searches. I read 21 additional plausible stages in full and checked exact-carrier mentions in research packets and promoted decompositions. Generic double cosets, matrix Frobenius norms, cyclotomic spectra, differential lattices and derived completion are false positives.

Other dispositions:

- The ClassFieldTheory packet already supplies **active** NFA 1 → CFT 13, NFA 2 → CFT 12 and NFA 6 → CFT 13. GQF's repeated links are the same graph edges, with additional evidence. These are not omissions.
- AN.4's newer partial packet and KTheoryFiniteLocalFields L.7's semilocal transfer request agree with existing links 8 and 60. CA.7's partial integral-Galois-module request has an existing upstream route through CA.5; no independent omission is established there.
- The partial ArithmeticStatistics, ArithmeticDynamics and ArithmeticGaloisDuality packets contain further requests for discriminant and ramification inputs. These are recorded leads, not accepted evidence for all their proposed theorem scopes. Findings 1–2 use authoritative stage obligations or accepted decomposition content instead.
- QW.1/QW.4 use étale-ring Frobenius lifts and a specific cubic obstruction. A completed-ring lift need not be a global automorphism. Their current text does not force an additional NFA Artin-class dependency; the cubic acceptance calculation can be elementary. HB.6/HB.7 likewise retain the full completed coefficient algebra, not an arbitrarily selected number-field factor.
- R01.2 and ES.1/ES.7 need local/profinite representations and cohomology beyond NFA's finite-level objects. IHG.3/AG2.0 concern Satake/Tate normalization. U.4 requires S-units and the Bass–Milnor–Serre argument, not the rank-one unit certificate. Elliptic K-theory transfers are not field-level trace formulas. ST.0/ST.3 and CN.5 do not turn a database label or bare normal-closure action into certified enumeration. R35.2 concerns invariant differentials, not the different ideal.

Validation:

- `check_links` on the accepted target: **61 links, ten overlaps, 212 examined entries; zero errors or warnings**.
- Read-only `build.assemble(require_distances=False)`: **2,840 stages, 8,007 edges**. **56** target links are active; the **five** LV links occur in `deferredLinks`, each awaiting its unpromoted LV endpoint. They have not been silently discarded.
- Union with declared `requires` and all **36** research link packets: **8,168 distinct edges**, no reverse path for any existing target link. Research-stage declarations are included in this conservative union, without treating their review status as accepted.
- A scratch copy adding the three proposed links has **64 links**, zero errors/warnings, and no reverse paths. Merging it into the actual assembled atlas gives **8,010 edges**, remains acyclic and still has 8,010 after a second merge. No production packet, roadmap, review or promoted data was edited.
- `check_redteam`, swarm `intake.py check-files` and `git diff --check` pass for the two deliverables. No Lean file changed or compiled; no library build was set up.
