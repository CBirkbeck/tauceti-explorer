# Independent review: Bushnell–Henniart, Higher ramification

Refs [#1154](https://github.com/CBirkbeck/tauceti-explorer/issues/1154). Codex, session `codex-7e92bd`, 23 September 2026. **Verdict: revise. Extraction status: partial.** The reviewer did not author the extraction. The claim and bot confirmation are issue comments 5802937366 and 5802939275. Prior extraction work is attributed to `codex-c83e7a`, `codex-a71f92`, and `cc-442dc5`.

All 149 input items, their statements, dependencies, proof outlines, APIs and tests were inspected against the full published article, pp. 919–955. The review produces 151 items: eight library, nine planned and 134 missing. Every missing item is routed exactly once. Three source routes are accepted; the two Part II routes and equal-characteristic comparison route need revision. All 17 existing source findings are confirmed with their scopes retained or clarified. No new finding is registered merely from the terminology concern in §8.4.

## What changes

The previous completion record changed G1–G9 to “deferred” or “recorded” while their statements still demanded unread sources and unproved interfaces. PROTOCOL §§0,3,16 do not treat that relabelling as completion. All nine are restored to open; the completion record is retained as superseded provenance. A complete extraction review can reject an incomplete extraction. This is that finished independent review, not a claim that the missing source proofs have now been supplied.

The field-unit item bundled hereditary-order units with a planned local-field import. It now contains only field units and receives nine exact pinned declarations, including both graded quotients and the chosen-uniformizer coordinate. Hereditary-order units are explicitly retained in their own construction. The redundant open field-unit request is removed. The separate finite-group character-degree theorem is also already in Tau Ceti. Its exact hypotheses and Mathlib’s p-group-cardinality/divisor-of-a-prime-power results supply the numerical p-power consequence, while the smooth finite-image and irreducibility transport remains an adapter. No generic finite-group degree theorem should be rebuilt here.

The Φ constructor formerly said “extend continuously,” but its gluing theorem depended on the already-extended Φ. A new partial affine-piece definition breaks that semantic cycle: numerical profile → partial pieces → adjacent-limit/gluing theorem → continuous Φ → shape/inverse. BH03’s transition identity remains a real G4 obligation. The zero-parameter tail is now the explicit tuple (F,1,1,0), rather than an undefined application of a nonzero-parameter volume construction.

The newly added basic slope/Swan connection is wired to the step-sum theorem; the weighted-max and pair-conductor arguments use it explicitly. Slope/jump realization now names Weil occurrence. The former dependency audit still counted only 145 items, omitting the last four additions; the review recomputes all 151. Finite separability is explicit in Weil subgroup/index assertions, whereas GL-side parameter fields still allow inseparability. The smooth Weil carrier states finite-dimensionality and records the comparison with all irreducible smooth Weil representations in G1. The SR.3 request is corrected to finite-dimensional compact-open **invariants**: a compact restriction of an infinite-dimensional cuspidal representation is not itself finite-dimensional.

## Ownership and library checks

Every original pinned declaration was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The four Clifford results genuinely allow an arbitrary ambient group with normal subgroup and finite-dimensional irreducible representation. The multiplicity theorem is a Hom-dimension statement; the ordinary multiplicity interpretation uses complex Schur theory. The length equality has values in ℕ∞, so finite-length quotients must be established before natural-number arithmetic. Relative index uses zero for infinite index; positivity and finite index are required before division.

All named planned layer descriptions were read: LocalFieldsRamification0/1/3/4, ClassFieldTheory7/9, InductionRestriction5, AL.3, ET.6 and FA.4. Relevant SR.0–3, AL.0/1, R01.1–3 and ES7:equal-characteristic contracts were read for route assessment. The reviewed coverage rows are recorded in the JSON; current SR and ET stage IDs have no matching reviewed row, which is not treated as evidence of absence. LFR3’s graded action formula supplies the finite commutator estimate: wild inertia has trivial tame character. The absolute-group consequence still needs its inverse-limit adapter.

The independent portfolio search includes current stage extracts, proposed roadmaps, decompositions, paper routes/reviews, the packet, reserved identifiers and upstream documents. The current Fintzen brief already assigns mixed-characteristic GL_m supercuspidal/type and segment theory to ET.6. The Bushnell–Henniart continuation may add endo-class metrics and a separately proved equal-characteristic extension, but must import and extend the common BK construction, not invent a second mixed-characteristic classification. The same pending SmoothRepresentationsPartII identifier is reused by Newton–Thorne, Nakamura, LLHLM and Gan–Harris–Sawin. The finite oscillator proposal is explicitly odd-characteristic and does not silently supply a dyadic wild-image theorem. The generic R01.3 conductor calculus remains shared; a complex coefficient comparison is new work, not permission to repeat every conductor proof.

## Source findings and terminology

The page images were checked for the reversed period ratio, omitted derivative rescaling, missing degree bracket, scalar-twist level, valuation subscript, inverse-chain radius, wrong internal reference, cyclic-induction conductor, final examples and bibliography DOI. Other locators were checked in the full published text. The publisher record, arXiv history and title/erratum/correction searches disclosed no later correction in this bounded search. No exhaustive author-archive search or fresh reread of the BH17 arXiv PDF is claimed.

For E5 the GL1(Q2) obstruction uses the minimal-character clause on BH96 p.145: U1/U2 has a single nontrivial character. Removing the endpoint eliminates this counterexample; the full corrected perturbation supplier remains unread. For E7 choose E=Q3(i), i²=−1, β=1/9+i/3 and c=−1/9. The actual order levels are 2 and 1 before/after translation. A character of Swan 2 with the required linearization is obtained from U2/U3 by extension through the finite abelian unit quotient, then the uniformizer factor. This validates the counterexample without asserting the unverified BK appendix identity.

For E12 the induction formula was independently checked in the epipelagic paper §1.3: for the cyclic degree-p inducing extension with break a, m=sw_K(χ)+(p−1)a. The printed sw_K(χ)=a contradicts p∤m. The remaining classification/uniqueness and break identification are explicitly conditional; the review does not certify a full replacement Mœglin theorem. E14 is the authors’ published repair of the earlier proof, freshly read in BH14. E15 certifies only the published acknowledgement of the older gap, since the full BH03 proof was not acquired.

The §8.4 “extra special of class two” concern was investigated rather than promoted into the register. BH96 §13 p.190 defines the relevant group by cyclic centre and elementary abelian central quotient, with its nondegenerate alternating commutator pairing. It does **not** impose centre of order p. Scalar enlargement therefore does not refute that convention. The extracted target now spells out the intended group structure and retains the finite-group application as an open obligation. The epipelagic paper’s Heisenberg description, §4.2, is consistent with this broader meaning. The existing odd-characteristic finite oscillator route does not automatically cover p=2.

## Validation and limits

The structural audit checks unique IDs, every cited declaration hash, every planned stage, every external request, all definition APIs/uses/three tests, the complete acyclic dependency graph and unique routing of 134 missing items. The paper checker passes. An independent exact script passes 2709 cases: conditional four/eight-dimensional profile composition, tame rescaling, F4 cube obstruction, the translated Q3(i) matrix level, signed lattice dilation, minimal-volume exponent arithmetic and an explicit inverse-chain-radius failure. These checks do not construct local representations or prove the missing source suppliers.

No Lean deliverable was authorized by this review issue and no Lean file was compiled. All implementation statuses remain unchecked. The extraction’s historical tests are retained as prior provenance, not falsely reported as rerun. The independent regression below is the test actually run for this review.

## Route decisions

| Route | Verdict | Reason |
| --- | --- | --- |
| 1 | reject | The complex profile direction is useful, but G1/G2/G8 leave finite-image, conductor and projective-lifting interfaces unclosed. Reuse R01.3 generic conductor arguments and the pinned finite-group imports; a coefficient change does not justify duplicating them. |
| 2 | reject | The endo-class metrics and interpolation extension is justified, but BK recursion, normalized corestriction, profile gluing, corrected perturbation, conductor formula and example suppliers remain G3–G6/G9. The current Fintzen brief also assigns mixed-characteristic GL_m type theory to ET.6. The corrected brief imports that owner. |
| 3 | accept | The explicit finite-quotient occurrence argument is a scoped application of SR.0 smooth carriers and SR.2 closed-subgroup induction/Frobenius reciprocity. It avoids the acknowledged compact-induction error and does not claim the arbitrary Weil finite-dimensionality adapter complete. |
| 4 | accept | AL.0 owns the compact-open local Haar lattice comparison; AL.1/AL.3 own character conductors and pair factors. The fixed-map lattice proof, common exact uniformizer refinement and signed dilation are mathematically sound and explicitly separate from the unresolved BK-normalization/gluing application. |
| 5 | accept | ET.6 explicitly owns the independent mixed-characteristic classical GL_m correspondence and local-factor normalization. This source route imports that planned contract; it neither replaces it with a semisimple parameter nor extends its field hypothesis. |
| 6 | reject | ES7:equal-characteristic is the right supplier direction, but its three-action realization still needs the exact complex coefficient dictionary and epsilon-of-pairs normalization required here. G7 remains an unresolved contract, not a consequence of semisimple FS agreement. |

## Fresh source files

The bounded supporting-source reading extents are in the result audit; only the main published article was read in full.

| Source | URL | SHA-256 |
| --- | --- | --- |
| published BH17 | https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n3-p05-p.pdf | c93282637d325e422442e8c1a5721d0d13a742d392b8e78c77e2e6ddd2dc0c31 |
| bh96 | https://www.numdam.org/item/PMIHES_1996__83__105_0.pdf | 349c45d24544a1bfc3608678713909594c6a905e2a2ea61d8c170a17dfbb1876 |
| bh14 | https://arxiv.org/pdf/1103.5316 | ca3a59ca755bd584357a67d60e7e2fad3412c8ff57d85eec0c31178bf42d0e5e |
| epipelagic | https://arxiv.org/pdf/1302.4304 | 1460af232d9a226de968e6b05a7a9bdfb48a72fc87069079de9b4ea3dea59600 |
| kedlaya | https://web.ma.utexas.edu/users/sampayne/pdf/Kedlaya-PuertoRico.pdf | 146eb308891b0a87b8218178d01447606468fb62fbb82023372370ebd2e0c56a |

## Exact pinned library references

| Declaration | Scope checked | Location |
| --- | --- | --- |
| tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype | For a field k, group G, normal subgroup N, and finite-dimensional irreducible k-representation V of G, Res_N V is semisimple. No finiteness of G and no Maschke characteristic condition is needed. | [TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean:325](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean#L325) |
| tauceti:TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep | Under the preceding hypotheses there is a minimal nonzero N-subrepresentation S, and every minimal N-subrepresentation is isomorphic to a G-conjugate of S. | [TauCeti/RepresentationTheory/Induction/Clifford/Orbit/Basic.lean:137](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Orbit/Basic.lean#L137) |
| tauceti:TauCeti.Representation.exists_forall_finrank_linearMap_eq | Under the same hypotheses there is e>0 such that dim_k Hom_N(S,Res_N V)=e for every minimal constituent S. Over C, Schur identifies this with the ordinary multiplicity. | [TauCeti/RepresentationTheory/Induction/Clifford/Multiplicity.lean:423](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Multiplicity.lean#L423) |
| tauceti:FDRep.clifford_restrict_finrank | For algebraically closed k, arbitrary G, normal N, and simple W in FDRep k G, there are a simple V in FDRep k N, finite G/inertia(V), and e≠0 with Res_N W ≅ V.cliffordSum e and dim W=e [G:inertia(V)] dim V. | [TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean:67](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean#L67) |
| mathlib:Module.length_eq_add_of_exact | Additivity of ℕ∞-valued module length for injective/surjective exact R-linear maps over an arbitrary ring. | [Mathlib/RingTheory/Length.lean:170](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean#L170) |
| mathlib:AddSubgroup.relIndex_mul_relIndex | Relative additive index multiplicativity for H≤K≤L; generated by to_additive. Infinite indices are zero, not usable as positive measure denominators. | [Mathlib/GroupTheory/Index.lean:127](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Index.lean#L127) |
| tauceti:TauCeti.unitFiltration | The subgroup on K× for every nonarchimedean local field, including depth zero. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:88](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L88) |
| tauceti:TauCeti.unitFiltration_zero | Depth zero is the valuation-subring unit group. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:129](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L129) |
| tauceti:TauCeti.unitFiltration_antitone | The field-unit filtration is decreasing. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:280](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L280) |
| tauceti:TauCeti.unitFiltrationGradedZeroEquivResidueFieldUnits | Depth-zero quotient is the multiplicative residue-field unit group. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:211](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L211) |
| tauceti:TauCeti.unitFiltrationGradedSuccEquivResidueField | The Additive positive quotient is additively equivalent to the residue field. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Graded.lean:253](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Graded.lean#L253) |
| tauceti:TauCeti.unitFiltrationGradedSuccEquivResidueFieldOfUniformizer | Chosen-uniformizer coordinate on the positive graded quotient. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Uniformizer.lean:51](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Uniformizer.lean#L51) |
| tauceti:TauCeti.isOpen_unitFiltration | Each step is open in K×. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:317](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L317) |
| tauceti:TauCeti.isCompact_unitFiltration | Each step is compact in K×. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:332](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L332) |
| tauceti:TauCeti.natCard_unitFiltrationGraded_succ | Every positive graded piece has residue cardinality. | [TauCeti/NumberTheory/LocalField/UnitFiltration/Graded.lean:287](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Graded.lean#L287) |
| tauceti:TauCeti.Representation.finrank_dvd_card | Over an algebraically closed characteristic-zero field, the dimension of a finite-dimensional irreducible representation of a finite group divides its order. | [TauCeti/RepresentationTheory/CharacterTable/Degree.lean:119](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/Degree.lean#L119) |
| mathlib:IsPGroup.iff_card | For prime p and finite G, IsPGroup p G iff the cardinal is a power of p. | [Mathlib/GroupTheory/PGroup.lean:102](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/PGroup.lean#L102) |
| mathlib:Nat.dvd_prime_pow | Every natural divisor of p^m for prime p is p^k for some k≤m. | [Mathlib/Data/Nat/Prime/Basic.lean:230](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean#L230) |

## Source-finding verdicts

| Finding | Verdict | Independent check |
| --- | --- | --- |
| E1 | confirmed | The positive finite upper groups begin with wild inertia, not the whole chosen Galois group. An unramified factor already disproves the printed equality; the separation proof only needs the wild orbit images. |
| E2 | confirmed | At a positive break a a nontrivial break character has no R_F(a)-invariants but is trivial on R_F^+(a). Thus the printed non-plus Hom criterion uses strict <, as the proposition’s endpoint assertions require. |
| E3 | confirmed | The displayed page image has e_a/e_a′. BH96 (1.4), printed p.112, scales the critical exponent by the relative period. For scalar π^−1 periods 1 and 2 give jumps 1 and 2, forcing the reciprocal correction. |
| E4 | confirmed | The page image has Φ′_Θ(x) after defining φ(x)=eΦ_Θ(x/e). The chain rule gives Φ′_Θ(x/e), equal to Φ′_{Θ_K}(x) by the preceding degree comparison. The intended scaling theorem survives. |
| E5 | confirmed | BH96 p.145 gives the minimal-character clause. For GL1(Q2), m=k=1, H1=U1 and every allowed θ is the same nontrivial character of U1/U2=C2. No second same-level character can fail to intertwine. Restricting to k<m removes this counterexample; the full corrected perturbation proof remains G5. |
| E6 | confirmed | The tame quotient over Q2 admits S3=C3⋊C2 with Frobenius acting by inversion. Its irreducible standard representation has trivial wild action of dimension two, hence one constituent class with multiplicity two. This refutes the explanatory equivalence; subsequent results retain the correct irreducibility definition. |
| E7 | confirmed | BH96 p.112 supplies order level e_a k for a scalar of valuation −k. Over Q3 with E=Q3(i), i²=−1, β=1/9+i/3 and c=−1/9, the level drops from 2 to 1, while scalar translation leaves the commutator and k0=−1 unchanged. A Swan-2 character linearized by c exists by extending the nontrivial character on U2/U3 to O×/U3, then over 3^Z. Thus both the n/e_a issue and cancellation are real. Full translated-character compatibility remains G5. |
| E8 | confirmed | The density lemma is visibly in §5.3, while §5.2 is the real-index truncation subsection. |
| E9 | confirmed | The page image reads v_F(α), although α is in E and the denominator is e(E/F)=p^s. The following sentence already uses v_E, confirming the intended normalized valuation. |
| E10 | confirmed | The inverse derivative is evaluated at Ψ(x), whereas δ1 bounds the input of Φ. Continuity at Ψ(m)=m gives a smaller valid radius, but the minimum of the two radii in different coordinates alone does not. This is a local proof repair. |
| E11 | confirmed | The immediately preceding §8.2 Lemma 1 proves the tame-self-twist kernel trivial; §8.1’s torsor lemma is a different result. BH14 pp.10–11 also gives the direct Schur argument. |
| E12 | confirmed | The source’s absolutely wild hypothesis makes a integral. The Swan induction formula (BH epipelagic §1.3, arXiv p.4) for cyclic degree p, break a, gives m=sw_K χ+(p−1)a. The printed sw_K χ=a would force p\|m, contradicting §8.4. The corrected expression is conditional on the inducing extension’s break identification; the classification and uniqueness remain G9. |
| E13 | confirmed | In the unramified quadratic extension of Q2, μ3 exists and the residue field is F4. Epipelagic §2.1 identifies a level-one degree-two parameter with a totally ramified quadratic generator, hence det α has valuation −1. All determinant ratios are units and all F4× cubes are 1; the required distinct cube classes cannot exist. No representation-existence conclusion is inferred from conditional affine computations. |
| E14 | confirmed | BH14 arXiv p.10 was read afresh: it uses compact induction from P_F to assert occurrence. BH17 published p.927 explicitly replaces the incorrect proof with closed-profinite-subgroup occurrence. Confirmed only with this published repair, not as a newly discovered defect. |
| E15 | confirmed | BH17 p.927 expressly acknowledges the older BH03 §8.2 gap and says Proposition 2 fills it. This confirms the acknowledgement and replacement input only. The full BH03 proof was not acquired, so no finer diagnosis is certified. |
| E16 | confirmed | The p.954 image prints the book DOI. Numdam’s authoritative BH96 record supplies 10.1007/BF02698646; the Princeton/De Gruyter record identifies 9781400882496 as The Admissible Dual of GL(N) via Compact Open Subgroups. |
| E17 | confirmed | The p.936 image omits the opening square bracket in the second field degree. Both sides compare [F[γ_i]:F], so this is a typographic correction only. |

## Item-by-item review

Retaining an item means its statement and proposed status survive this check, not that its open suppliers are proved. Exact-name/family queries and candidate lists are recorded in the result audit.

| Item | Locator | Status / route | Action |
| --- | --- | --- | --- |
| clifford-semisimple | BH17 §2.2, p.927; pinned Clifford/Basic.lean:325 | library | retained after source/status check |
| clifford-orbit | BH17 §2.2, p.927; pinned Clifford/Orbit/Basic.lean:137 | library | retained after source/status check |
| clifford-multiplicity | BH17 §2.2, p.927; pinned Clifford/Multiplicity.lean:424 | library | retained after source/status check |
| clifford-dimension | BH17 §§2.2,8.1; pinned Clifford/Dimension.lean:67 | library | retained after source/status check |
| local-fields | BH17 notation, p.924 | planned | retained after source/status check |
| unit-filtration | BH17 notation p.924 and §7.4; local-field supplier | library | corrected library, note, planned, prerequisites, proofSteps, statement, status |
| weil-group | BH17 notation p.924 and §2.1 | planned | corrected statement |
| upper-filtration | BH17 §1.1 pp.925–926 | planned | retained after source/status check |
| tame-filtration | BH17 §1.2 Lemma 1 p.926 | planned | retained after source/status check |
| ramification-commutators | BH17 §1.2 Lemma 2 p.926 | planned | corrected proofSteps |
| ramification-cofinal | BH17 §2.1 Proposition 1 p.926 | missing / 1 | retained after source/status check |
| smooth-weil | BH17 notation and §§2.1–3.1 | missing / 1 | corrected gaps, statement |
| profinite-occurrence | BH17 §2.1 Proposition 2 and Complement p.927 | missing / 3 | retained after source/status check |
| finite-image-twist | BH17 §2.2, §8.2; proof adapter | missing / 1 | retained after source/status check |
| ramification-orbit | BH17 §2.2 Proposition pp.927–928 and §2.5 | missing / 1 | retained after source/status check |
| slope | BH17 §2.3 p.928 | missing / 1 | retained after source/status check |
| swan | BH17 §2.4 p.928 and §3.1 | missing / 1 | retained after source/status check |
| swan-step-sum | BH17 §3.1 Lemma, independent proof interface | missing / 1 | retained after source/status check |
| delta | BH17 §2.5 (2.5.1),(2.5.3) p.929 | missing / 1 | retained after source/status check |
| delta-separation | BH17 §2.5 Proposition (1) p.929 | missing / 1 | retained after source/status check |
| delta-endpoints | BH17 §2.5 Proposition (2), corrected proof p.929 | missing / 1 | retained after source/status check |
| delta-ultrametric | BH17 §2.5 Proposition (3) p.929 | missing / 1 | retained after source/status check |
| delta-tame | BH17 §2.6 Proposition p.930 | missing / 1 | retained after source/status check |
| end-invariants | BH17 §3.1 p.930 | missing / 1 | retained after source/status check |
| normalized-hom | BH17 §3.4 proof p.932; explicit §3.1 adapter | missing / 1 | retained after source/status check |
| sigma | BH17 §3.1 (3.1.2) p.930 | missing / 1 | retained after source/status check |
| sigma-max | BH17 §3.1 (3.1.3) pp.930–931 | missing / 1 | corrected prerequisites |
| sigma-shape | BH17 §3.1 Proposition and §6.2 proof | missing / 1 | retained after source/status check |
| swan-pair | BH17 §3.1 Lemma (3.1.1), formula (3.1.4) pp.930–931 | missing / 1 | corrected prerequisites |
| pair-ultrametric | BH17 §3.1 Corollary p.931 | missing / 1 | retained after source/status check |
| sigma-wild-invariance | BH17 §3.1 concluding paragraph p.931 | missing / 1 | retained after source/status check |
| sigma-tame | BH17 §3.2 Proposition p.931 | missing / 1 | retained after source/status check |
| sigma-tail | BH17 §3.4 Proposition p.932 | missing / 1 | retained after source/status check |
| hereditary-order | BH17 notation p.924; BH96 §1 pp.111–112 | missing / 2 | corrected api, statement |
| critical-exponent | BH17 notation, §4.2; BH96 §1 (1.3)–(1.5), printed p.112, scan checked | missing / 2 | retained after source/status check |
| stratum-equivalence | BH17 §4.3 and §5.3; BH96 §1 pp.113–114 | missing / 2 | retained after source/status check |
| simple-characters | BH17 notation p.924; BH96 §7, pp.145–146 | missing / 2 | retained after source/status check |
| character-transfer | BH17 notation and §4.2; BH96 §8 (8.1)–(8.2), pp.151–152 | missing / 2 | retained after source/status check |
| endo-class | BH17 §4.2 p.933; BH96 §8 (8.6)–(8.10), pp.154–157 | missing / 2 | retained after source/status check |
| endo-invariants | BH17 §4.2 (4.2.1)–(4.2.3) p.933; BH96 (8.11) | missing / 2 | retained after source/status check |
| minimal-parameter | BH17 §4.1 p.932 | missing / 2 | retained after source/status check |
| tame-corestriction | BH17 §4.1 p.932; BK93 §1.3 cited there | missing / 2 | retained after source/status check |
| volume-exponent | BH17 §4.1 (4.1.1) p.932 | missing / 2 | retained after source/status check |
| minimal-volume | BH17 §4.1 Proposition p.933 | missing / 2 | retained after source/status check |
| rational-endo-level | BH17 §4.2 Proposition p.933 | missing / 2 | retained after source/status check |
| approximation | BH17 §4.3 p.934, citing BK93 (2.4.1) | missing / 2 | retained after source/status check |
| jumps | BH17 §4.3 (4.3.1) p.934 | missing / 2 | retained after source/status check |
| jumps-invariance | BH17 §4.3 Remark and Lemma p.934, corrected ratio | missing / 2 | retained after source/status check |
| profile-fields | BH17 §4.3 Definition (4.3.2) p.934 | missing / 2 | corrected statement |
| profile-invariance | BH17 §4.3 Proposition p.934 | missing / 2 | retained after source/status check |
| phi | BH17 §4.4 (4.4.1)–(4.4.2) p.935 | missing / 2 | corrected prerequisites, proofSteps |
| phi-continuity | BH17 §4.4 Proposition (1) p.935 | missing / 2 | corrected prerequisites, statement |
| phi-shape | BH17 §4.4 Proposition (2),(3) p.935 | missing / 2 | corrected prerequisites |
| phi-breaks | BH17 §4.4 Proposition (4) p.935 | missing / 2 | retained after source/status check |
| phi-same-stratum | BH17 §4.4 Complement (1) p.935 | missing / 2 | retained after source/status check |
| endo-dual | BH17 §4.4 Complement (2) p.935 | missing / 2 | retained after source/status check |
| phi-truncation-tail | BH17 §4.5 Proposition pp.935–936 | missing / 2 | retained after source/status check |
| tame-endo-lift | BH17 §§4.6,5.5,7.1; BH96 §9 (9.7)–(9.13) pp.160–163 | missing / 2 | retained after source/status check |
| totally-wild-endo | BH17 §4.6 p.936 and §7.1 Remark p.945 | missing / 2 | retained after source/status check |
| phi-tame | BH17 §4.6 Proposition, Lemma and (4.6.1)–(4.6.2), pp.936–937 | missing / 2 | retained after source/status check |
| endo-distance | BH17 §5.1 (5.1.1) p.937 | missing / 2 | retained after source/status check |
| endo-distance-well-defined | BH17 §5.1 Proposition p.938 | missing / 2 | retained after source/status check |
| endo-distance-basic | BH17 §5.1 Proposition p.938 | missing / 2 | retained after source/status check |
| endo-distance-metric | BH17 §5.1 Theorem p.938 | missing / 2 | retained after source/status check |
| phi-distance-tail | BH17 §5.1 Corollary p.938 | missing / 2 | retained after source/status check |
| truncation | BH17 §5.2 pp.938–939 | missing / 2 | retained after source/status check |
| truncation-balls | BH17 §5.2 Proposition p.939 | missing / 2 | retained after source/status check |
| perturbation | BH17 §5.3 helper Lemma p.939, corrected range | missing / 2 | retained after source/status check |
| endo-density | BH17 §5.3 Density Lemma p.939 | missing / 2 | retained after source/status check |
| cuspidal-endo | BH17 §5.4 p.940, citing BH13; BH14 §6.3 | missing / 2 | retained after source/status check |
| pair-epsilon | BH17 §5.4 p.940 | planned / 4 | retained after source/status check |
| pair-swan | BH17 §5.4 p.940 | missing / 4 | retained after source/status check |
| gl-conductor | BH17 §5.4 (5.4.1) p.940; BHK98 Theorem 6.5 cited | missing / 2 | retained after source/status check |
| gl-level-swan | BH17 §5.4 (5.4.2) p.940 | missing / 2 | retained after source/status check |
| phi-unique | BH17 §5.4 Proposition p.940 | missing / 2 | retained after source/status check |
| endo-pair-ultrametric | BH17 §5.4 Corollary p.941 | missing / 2 | retained after source/status check |
| endo-distance-tame | BH17 §5.5 Proposition p.941 | missing / 2 | retained after source/status check |
| llc-char0 | BH17 §6.1 (6.1.1) pp.941–942 | planned / 5 | retained after source/status check |
| llc-charp | BH17 §6.1; ES7 equal-characteristic source interface | missing / 6 | retained after source/status check |
| llc-swan | BH17 §6.1 (6.1.2) p.942 | missing / 2 | retained after source/status check |
| first-ramification | BH17 §6.1 First ramification theorem p.942; BH14 §§6.1–6.2 pp.41–42 | missing / 2 | retained after source/status check |
| profile-comparison | BH17 §6.2 (6.2.1) p.942 | missing / 2 | retained after source/status check |
| herbrand-endo | BH17 §6.2 (6.2.2) pp.942–943 | missing / 2 | retained after source/status check |
| herbrand-shape | BH17 §6.2 Proposition pp.942–943 | missing / 2 | retained after source/status check |
| rational-weil-slopes | BH17 §2.4 Proposition and Corollary, proved §6.3 p.943 | missing / 2 | retained after source/status check |
| delta-density | BH17 §3.3 Density Lemma, proved §6.3 p.943 | missing / 2 | retained after source/status check |
| sigma-unique | BH17 §3.3 Proposition p.931, completed §6.3 | missing / 2 | retained after source/status check |
| higher-strict | BH17 §6.4 Higher Ramification Theorem p.943 | missing / 2 | retained after source/status check |
| higher-weak | BH17 §6.4 Higher Ramification Theorem p.943 | missing / 2 | retained after source/status check |
| herbrand-tail | BH17 §6.5 Lemma and Remark pp.943–944 | missing / 2 | retained after source/status check |
| truncated-class-to-orbit | BH17 §6.5 Corollary (1) p.944 | missing / 2 | retained after source/status check |
| orbit-to-truncated-class | BH17 §6.5 Corollary (2) p.944 | missing / 2 | retained after source/status check |
| herbrand-tame | BH17 §7.1 Proposition pp.944–945 | missing / 2 | retained after source/status check |
| wild-lift-exists | BH17 §7.1 Remark p.945; BH14 §6.3 Tame Parameter Theorem | missing / 2 | retained after source/status check |
| totally-wild-weil | BH17 §7.2 p.945, corrected explanatory equivalence | missing / 1 | corrected prerequisites, proofSteps |
| wild-llc | BH17 §7.2 Lemma p.945; BH14 §6.3 | missing / 2 | retained after source/status check |
| character-reciprocity | BH17 §§7.3–7.5; local reciprocity input | planned | retained after source/status check |
| twist-distance | BH17 §7.3 Proposition pp.945–946 | missing / 1 | retained after source/status check |
| endo-character-action | BH17 §7.4 p.946 | missing / 2 | retained after source/status check |
| scalar-twist-level | BH17 §7.4 Lemma p.946, corrected necessary level; BH96 (1.3)–(1.4) | missing / 2 | retained after source/status check |
| twist-invariance | BH17 §7.4 Proposition p.946 | missing / 2 | retained after source/status check |
| character-depth-exists | BH17 §7.5 uniqueness proof, expanded supplier | missing / 4 | retained after source/status check |
| tame-depth-density | BH17 §7.5 uniqueness argument, expanded supplier | missing / 2 | retained after source/status check |
| interpolation | BH17 §7.5 Interpolation Theorem (3) pp.946–947 | missing / 2 | retained after source/status check |
| interpolation-unique | BH17 §7.5 uniqueness and Remark p.947 | missing / 2 | retained after source/status check |
| degree-one | BH17 §7.6 (7.6.1) p.947 | missing / 2 | retained after source/status check |
| initial-slope | BH17 §7.6 Proposition (1) p.948 | missing / 2 | retained after source/status check |
| terminal-slope | BH17 §7.6 Proposition (2) p.948 | missing / 2 | retained after source/status check |
| scalar-level-reduction | BH17 §7.6 Remark and §7.7 proof pp.948–949 | missing / 2 | retained after source/status check |
| essential-tame | BH17 §7.7 p.948 | missing / 2 | retained after source/status check |
| essential-tame-criterion | BH17 §7.7 Corollary pp.948–949 | missing / 2 | retained after source/status check |
| graded-character-torsor | BH17 §8.1 Lemma p.949 | missing / 1 | retained after source/status check |
| commutant-growth | BH17 §8.1 proof pp.949–950 | missing / 1 | retained after source/status check |
| sigma-jump-criterion | BH17 §8.1 Proposition and Remark pp.949–950 | missing / 1 | retained after source/status check |
| centric-field | BH17 §8.2 p.950 | missing / 1 | retained after source/status check |
| self-twist-groups | BH17 §8.2 Definition p.950 | missing / 1 | retained after source/status check |
| wild-self-twists | BH17 §8.2 p.950 | missing / 1 | retained after source/status check |
| imprimitivity-field | BH17 §8.2 p.950 | missing / 1 | retained after source/status check |
| tame-self-twist-trivial | BH17 §8.2 Lemma 1 p.951; BH14 §1.3 Lemma 1 p.10 | missing / 1 | retained after source/status check |
| wild-character-extension | BH17 §8.2 Lemma 2 proof p.951; BH14 §1.3 pp.10–11 | missing / 1 | retained after source/status check |
| self-twist-descent | BH17 §8.2 Lemma 2 p.951 | missing / 1 | retained after source/status check |
| imprimitivity-bound | BH17 §8.2 Proposition pp.950–951 | missing / 1 | retained after source/status check |
| absolutely-wild | BH17 §8.3 p.951 | missing / 1 | retained after source/status check |
| first-break-absolute | BH17 §8.3 Theorem pp.951–952 | missing / 1 | retained after source/status check |
| first-break-general | BH17 §8.3 Corollary p.952 | missing / 1 | retained after source/status check |
| degree-p-profile | BH17 §8.4 p.952 | missing / 2 | retained after source/status check |
| degree-p-breaks | BH17 §8.4 p.952 | missing / 1 | corrected prerequisites, proofSteps |
| degree-p-induction | BH17 §8.4 p.952, corrected conductor statement | missing / 1 | retained after source/status check |
| degree-p-single-break | BH17 §8.4 pp.952–953 | missing / 2 | corrected statement |
| extraspecial-image | BH17 §8.4 first paragraph p.953 | missing / 2 | corrected gaps, name, proofSteps, statement |
| epipelagic-input | BH17 §8.5 p.953; BH14 epipelagic §§5.1–5.2 cited there | missing / 2 | retained after source/status check |
| four-dimensional-example | BH17 §8.5 Example 1 p.953 | missing / 2 | retained after source/status check |
| eight-dimensional-example | BH17 §8.5 Example 2 p.953 | missing / 2 | retained after source/status check |
| ramification-kernel | BH17 §2.1 Proposition 2(1) and Complement p.927 | missing / 1 | retained after source/status check |
| clifford-correspondence | BH17 §§8.2–8.3 finite p-group argument; upstream InductionRestriction Layer 5 | planned | retained after source/status check |
| cyclic-restriction | BH17 §§8.2–8.3, explicit finite-quotient adapter | missing / 1 | retained after source/status check |
| relative-p-induction | BH17 §8.3 proof p.952, expanded finite-quotient adapter | missing / 1 | retained after source/status check |
| positive-jumps | BH17 §2.4 Corollary p.929, justified §6.3 | missing / 2 | retained after source/status check |
| wild-self-twists-nontrivial | BH17 §8.2 p.950 | missing / 1 | retained after source/status check |
| weil-occurrence | BH17 §2.1 Proposition 2(2) and Complement p.927 | missing / 1 | retained after source/status check |
| length-additivity | Mathlib/RingTheory/Length.lean:170 at 082e2d3; helper for BH17 §4.1 | library | retained after source/status check |
| relative-index-tower | Mathlib/GroupTheory/Index.lean:127, to_additive of Subgroup.relIndex_mul_relIndex at 082e2d3 | library | retained after source/status check |
| lattice-volume-index | BH17 §4.1 pp.932–933; independent expansion of the volume argument | missing / 4 | retained after source/status check |
| exact-lattice-comparison | BH17 §4.1 pp.932–933; independent expansion of the volume argument | missing / 4 | retained after source/status check |
| lattice-dilation | BH17 §4.1 pp.932–933; independent expansion of the volume argument | missing / 4 | retained after source/status check |
| finite-quotient-ramification | BH17 §1.1 Lemma p.925 | missing / 1 | retained after source/status check |
| slope-restriction | BH17 §2.3 Proposition p.928 | missing / 1 | retained after source/status check |
| slope-jumps | BH17 §2.3 Corollary p.928 | missing / 1 | corrected prerequisites |
| basic-connection | BH17 §2.4 Basic connection p.928, citing Henniart [18, Théorème 3.5] | missing / 1 | corrected gaps, prerequisites, proofSteps |
| phi-pieces | BH17 §4.4 (4.4.1)–(4.4.2), p.935, construction order made explicit | missing / 2 | added |
| finite-character-degree | TauCeti/RepresentationTheory/CharacterTable/Degree.lean:119 at f790474 | library | added |

## Reproducible bounded regression

```python
from fractions import Fraction as Q
from itertools import product
counts={}
def record(k):counts[k]=counts.get(k,0)+1
# Exact affine examples: these are conditional numerical consistency checks.
def phi4(x):
 return Q(5,16)+x/4 if x<=Q(1,4) else Q(1,4)+x/2 if x<=Q(1,2) else x
def psi4(x):
 return x/4 if x<=Q(1,3) else 4*x-Q(5,4) if x<=Q(3,8) else 2*x-Q(1,2) if x<=Q(1,2) else x
def sigma4(x):return Q(5,16)+x/16 if x<=Q(1,3) else x
def phi8(x):return Q(21,64)+x/8 if x<=Q(3,8) else x
def psi8(x):return x/8 if x<=Q(1,3) else 8*x-Q(21,8) if x<=Q(3,8) else x
def sigma8(x):return Q(21,64)+x/64 if x<=Q(1,3) else x
for d in range(1,41):
 for n in range(2*d+1):
  x=Q(n,d)
  assert phi4(psi4(x))==sigma4(x)
  assert phi8(psi8(x))==sigma8(x)
  record('conditional profile compositions')
for e in [1,3,5,7,11]:
 for n in range(121):
  x=Q(n,120)
  scaled=lambda y:e*psi4(y/e)
  assert scaled(e*x)==e*psi4(x)
  record('tame rescaling')
# F4 = F2[z]/(z²+z+1), all three unit cubes coincide.
def mul(a,b):
 v=0
 for i in range(2):
  if (b>>i)&1:v^=a<<i
 if v&4:v^=7
 return v
assert [mul(mul(a,a),a) for a in [1,2,3]]==[1,1,1]
record('F4 cube obstruction')
# Q3(i), i²=-1 unramified: multiplication matrices show the cancellation.
def vp(x,p):
 if x==0:return 10000
 x=Q(x);v=0
 while x.numerator%p==0:x/=p;v+=1
 while x.denominator%p==0:x*=p;v-=1
 return v
beta=[[Q(1,9),-Q(1,3)],[Q(1,3),Q(1,9)]]
translated=[[beta[i][j]-(Q(1,9) if i==j else 0) for j in range(2)] for i in range(2)]
assert -min(vp(x,3) for row in beta for x in row)==2
assert -min(vp(x,3) for row in translated for x in row)==1
record('scalar translated matrix level')
# Scalar-corestriction and minimal-parameter volume exponents, with sign.
for q,r,m in product([2,3,4,5,7],range(1,6),range(-4,5)):
 assert Q(q)**(m*r) * Q(q)**(-m*r)==1
 record('signed lattice dilation')
for e,f,m in product(range(1,8),range(1,5),range(1,8)):
 d=e*f
 assert m*f*d-m*f==m*f*(e*f-1)
 record('minimal volume exponent')
# Radius coordinates really differ in Example 1 near the identity-tail endpoint.
m=Q(1,2);delta1=Q(1,100);x=m-Q(3,400)
assert x>m-delta1 and psi4(x)<m-delta1
record('inverse-chain radius obstruction')
print(counts,'PASS',sum(counts.values()))
```
